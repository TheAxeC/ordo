# Literature Search Report, Theme B: Optimal transport for unaligned sets

Phase 1 (lit-review mode), theme-scoped run B of the four-theme split recorded as decision D1 in `config.md`. Scope: entropic optimal transport (Sinkhorn, scaling, differentiability, unbalanced transport), Gromov-Wasserstein (GW) and fused Gromov-Wasserstein (FGW), transport barycenters and dictionaries with learnable templates, transport-based set embeddings and supervised prediction via transport, and registration-free transport-based alignment or fusion in medical imaging and neuroimaging. The merge run deduplicates this file against Themes A, C and D.

## Search Strategy

### Domain evidence profile

The PCR row `Domain Evidence Profile` reads `cs_ml`, a ship-ready enum value with no `(requested: ...)` suffix, so `cs_ml` applies. PCR `Discipline` is machine learning with medical image analysis as the application setting, which falls inside the `cs_ml` implied discipline set (CS / Engineering / Technology). No advisory tag is emitted: the row is present (no `[NO-PROFILE-NEUTRAL]`), it is not the reserved-fallback form (no `[PROFILE-RESERVED-FALLBACK]`), it is resolvable (no `[PROFILE-UNRESOLVED]`), and there is no discipline mismatch (no `[PROFILE-DISCIPLINE-MISMATCH]`). Effect on screening: archival preprints and peer-reviewed conference proceedings are admissible at the peer-review and publication-type nodes; the relevance, methodology and predatory checks are applied unchanged.

### Key concepts

- Primary concepts: optimal transport (Wasserstein, Kantorovich); Gromov-Wasserstein and fused Gromov-Wasserstein; transport barycenter, template, dictionary, reference measure; supervised prediction from sets, point clouds or graphs.
- Secondary concepts: entropic regularization, Sinkhorn, Sinkhorn divergence, unbalanced or partial transport; linear (linearized) optimal transport embedding, transport-based morphometry; graph dictionary learning, template-based graph neural network; inter-subject alignment, registration-free fusion, lesion matching.
- Application terms: brain, neuroimaging, fMRI, cortical surface, MRI, CT, lesion, tumour, hematoma, tractography, lung vessels.

### Databases

Queried: arXiv API (export.arxiv.org), PubMed E-utilities (esearch, esummary, efetch), Crossref REST API (bibliographic search, reference lists, record lookup), Semantic Scholar Graph API (keyword search, citations, paper batch, recommendations), OpenAlex (filtered title-and-abstract search), WebSearch (natural-language queries), WebFetch (PubMed Central full text).

Could not be accessed: IEEE Xplore, ACM Digital Library and Scopus (the agent file's CS/Engineering databases) require institutional subscription or an API key that this run does not have; Google Scholar has no public API. Substitutes: arXiv and Semantic Scholar for CS and ML coverage, Crossref and OpenAlex as general indexes, PubMed for the medical-imaging part. OpenAlex returned HTTP 429 (shared daily budget for the network exhausted) for the first part of the session and HTTP 503 for two later calls, so only two OpenAlex queries returned results. Semantic Scholar keyword search returned HTTP 429 repeatedly; two of its queries failed after ten retries and are recorded as failed. Crossref reference lists were empty for the three NeurIPS DOIs queried (the publisher deposited no references), so backward chaining used the five core papers whose reference lists are deposited.

### Inclusion and exclusion criteria

| Criterion | Include | Exclude |
|-----------|---------|---------|
| Publication type | Peer-reviewed journal articles, peer-reviewed conference proceedings, books; arXiv preprints (admitted under `cs_ml`, flagged as preprints) | Blog posts, news, peer-review reports and decision letters, abstracts without a paper |
| Date range | Systematic search 2013 to 2026; foundational works at any year | Pre-2013 works that are not foundational |
| Language | English | Other languages |
| Relevance | Centrally about transport and addresses at least one of the five sub-themes in a way that bears on the RQ (how the missing correspondence is handled, or where the method removes or builds on registration, radiomics or lesion segmentation) | Transport used only for domain adaptation, generative modelling, image enhancement or segmentation regularization with no bearing on unaligned sets; transport-free set methods (Theme C) |
| Retrievability | DOI resolved via Crossref, or arXiv record fetched | No DOI and no arXiv record |

Filters: arXiv queries restricted by field (`abs:`, `ti:`) and Boolean operators, no date filter (arXiv starts in 1991 and the hits were screened by year); PubMed `2013:2026[dp]`; Crossref `from-pub-date:2013-01-01`; Semantic Scholar `year=2013-2026`; OpenAlex `from_publication_date:2013-01-01`.

### Query log

Dates are UTC. The session spanned midnight UTC; queries marked 2026-11-14/15 ran within a few minutes of the boundary. "total" is the count field the API returned (arXiv `opensearch:totalResults`, PubMed `count`, Crossref `total-results`, Semantic Scholar `total`, OpenAlex `meta.count`); "retrieved" is the number of records actually downloaded and screened by title.

Layer 1, Boolean search:

| # | Tool | Date | Query string | Total | Retrieved |
|---|------|------|--------------|-------|-----------|
| L1-1 | arXiv API | 2026-11-14 | `abs:"optimal transport" AND abs:(entropic OR Sinkhorn) AND abs:(regularization OR regularized)` | 416 | 40 |
| L1-2 | arXiv API | 2026-11-14 | `abs:"Gromov-Wasserstein" AND abs:(fused OR graph OR structured)` | 198 | 40 |
| L1-3 | arXiv API | 2026-11-14 | `abs:(Wasserstein OR "Gromov-Wasserstein") AND abs:barycenter AND abs:(dictionary OR template OR atoms)` | 26 | 26 |
| L1-4 | arXiv API | 2026-11-14 | `abs:"optimal transport" AND abs:(embedding OR kernel) AND abs:(sets OR "point clouds" OR "set of features") AND abs:(fixed-size OR "linear optimal transport" OR "reference measure" OR template)` | 13 | 13 |
| L1-5 | arXiv API | 2026-11-14 | `abs:("optimal transport" OR "Gromov-Wasserstein" OR Wasserstein) AND abs:(fMRI OR neuroimaging OR "brain imaging" OR tractography OR cortical) AND abs:(alignment OR registration OR template OR "inter-subject")` | 16 | 16 |
| L1-6 | arXiv API | 2026-11-14 | `abs:"transport-based morphometry" OR abs:"linear optimal transport"` | 37 | 37 |
| L1-7 | arXiv API | 2026-11-14 | `abs:("optimal transport" OR Wasserstein OR "Gromov-Wasserstein") AND abs:("point cloud" OR "point clouds" OR "set classification" OR "multiple instance") AND abs:(classification OR regression) AND abs:(template OR prototype OR reference OR embedding)` | 9 | 9 |
| L1-8 | arXiv API | 2026-11-14 | `abs:"unbalanced optimal transport" AND abs:(Sinkhorn OR entropic) AND abs:(scaling OR divergence)` | 11 | 11 |
| L1-9 | PubMed E-utilities | 2026-11-14 | `("optimal transport"[tiab] OR "Wasserstein"[tiab] OR "Gromov-Wasserstein"[tiab]) AND (brain[tiab] OR neuroimaging[tiab] OR MRI[tiab] OR cortical[tiab]) AND (alignment[tiab] OR registration[tiab] OR "inter-subject"[tiab] OR "across subjects"[tiab]) AND 2013:2026[dp]` | 44 | 44 |
| L1-10 | PubMed E-utilities | 2026-11-14 | `("optimal transport"[tiab] OR "Wasserstein distance"[tiab]) AND (lesion*[tiab] OR "white matter hyperintensit*"[tiab] OR tumor[tiab] OR tumour[tiab]) AND (prediction[tiab] OR classification[tiab] OR outcome[tiab]) AND 2013:2026[dp]` | 10 | 10 |
| L1-11 | PubMed E-utilities | 2026-11-14 | `"transport-based morphometry"[tiab] OR ("linear optimal transport"[tiab] AND (image*[tiab] OR MRI[tiab]))` | 15 | 15 |
| L1-12 | PubMed E-utilities | 2026-11-14 | `("optimal transport"[tiab] OR "Gromov-Wasserstein"[tiab]) AND (point cloud*[tiab] OR "point set*"[tiab] OR "lung"[tiab] OR "vessel*"[tiab] OR "tractogra*"[tiab] OR "surface*"[tiab]) AND (registration[tiab] OR alignment[tiab] OR matching[tiab]) AND 2013:2026[dp]` | 15 | 15 |
| L1-13 | Crossref (query.bibliographic) | 2026-11-14 | `optimal transport graph neural network template Gromov-Wasserstein classification` | 2529132 | 30 |
| L1-14 | Crossref (query.bibliographic) | 2026-11-14 | `optimal transport registration-free alignment brain neuroimaging` | 1801785 | 30 |
| L1-15 | Semantic Scholar search | 2026-11-14 | `Sinkhorn distances entropic regularization optimal transport` | 1402 | 40 |
| L1-16 | Semantic Scholar search | 2026-11-14 | `Gromov-Wasserstein averaging of kernel and distance matrices` | 1 | 1 |
| L1-17 | Semantic Scholar search | 2026-11-14 | `Gromov-Wasserstein dictionary learning graphs` | 90 | 40 |
| L1-18 | Semantic Scholar search | 2026-11-14 | `learnable templates optimal transport graph classification` | 759 | 40 |
| L1-19 | Semantic Scholar search | 2026-11-14 | `Wasserstein barycenter computation fast` | failed (HTTP 429 after 8 retries) | 0 |
| L1-20 | Semantic Scholar search | 2026-11-14/15 | `Wasserstein barycenter` (rerun of L1-19 with a shorter string) | 17711 | 40 |
| L1-21 | Semantic Scholar search | 2026-11-14 | `optimal transport embedding of sets for supervised classification point clouds` | 0 | 0 |
| L1-22 | Semantic Scholar search | 2026-11-14 | `optimal transport brain alignment across subjects functional MRI` | failed (HTTP 429 after 8 retries) | 0 |
| L1-23 | Semantic Scholar search | 2026-11-15 | `optimal transport functional alignment fMRI` (rerun of L1-22) | failed (HTTP 429 after 8 retries) | 0 |
| L1-24 | OpenAlex (filter) | 2026-11-15 | `title_and_abstract.search:"optimal transport" AND (lesion OR lesions OR "white matter hyperintensities")`, from 2013-01-01 | 45 | 45 |
| L1-25 | OpenAlex (filter) | 2026-11-15 | `title_and_abstract.search:("Gromov-Wasserstein" AND (template OR templates OR dictionary OR barycenter) AND (classification OR prediction))`, from 2013-01-01 | 18 | 18 |

Crossref totals in L1-13 and L1-14 count every record matching any term under relevance ranking; only the top 30 by relevance were screened. One further OpenAlex query (`optimal transport template registration-free subject-level prediction`, 2026-11-15) returned results whose count line was not captured and whose rerun returned HTTP 503; it is not counted in any total below.

Layer 2, backward citation chaining (Crossref deposited reference lists, 2026-11-14):

| Core paper | Reference records deposited |
|------------|-----------------------------|
| Thual2022Aligning (10.52202/068431-1584) | 0 |
| VincentCuaz2022Template (10.52202/068431-0857) | 0 |
| Krzakala 2024 Any2Graph (10.52202/079017-3221) | 0 |
| Kundu2018Discovery (10.1016/j.neuroimage.2017.11.006) | 46 |
| Beier 2023 linear GW (10.1109/TIP.2022.3221286) | 42 |
| Nguyen 2023 linear FGW (10.1016/j.patcog.2023.109351) | 35 |
| Moosmuller2023Linear (10.1093/imaiai/iaac023) | 35 |
| Feydy 2019 brain tractograms (10.1007/978-3-030-32248-9_71) | 18 |

The 176 reference records were aggregated by DOI or title; 8 works were cited by two or more of the five lists and were screened: Wang 2013 LOT framework (4 lists; included as Wang2013Linear), Kolouri 2016 Radon cumulative distribution transform (3), Basu 2014 transport-based morphometry of cells (2), Kolouri 2016 continuous LOT (2), Wang 2011 transport for nuclear structure pathology (2), Vayer 2019 FGW (2; included), Memoli 2011 GW (2; included), Park 2018 cumulative distribution transform (2). The Semantic Scholar search in L1-16 also confirmed Peyre, Cuturi and Solomon 2016 "Gromov-Wasserstein averaging of kernel and distance matrices" (ICML), but its Semantic Scholar record carries no DOI and no arXiv ID and the OpenAlex record (L1-25) carries no DOI, so it cannot be included under the retrievability criterion.

Layer 3, forward tracking (Semantic Scholar citations endpoint, 2026-11-15; citing records from 2023 onward screened by title, per the agent file's last-three-years priority):

| Seed | Citing records retrieved | Of which 2023 or later (screened) |
|------|--------------------------|-----------------------------------|
| Thual2022Aligning (arXiv:2206.09398) | 63 | 58 |
| VincentCuaz2022Template (arXiv:2205.15733) | 39 | 39 |
| Kundu2018Discovery | 29 | 7 |
| Moosmuller2023Linear (arXiv:2008.09165) | 59 | 49 |
| Mialon2021Trainable (arXiv:2006.12065) | 0 (Semantic Scholar returned no citing records for this ID) | 0 |

Layer 4, semantic search:

| # | Tool | Date | Query | Retrieved |
|---|------|------|-------|-----------|
| L4-1 | WebSearch | 2026-11-14 | `optimal transport subject-level prediction from sets of lesions without registration` | 10 links |
| L4-2 | WebSearch | 2026-11-14 | `Gromov-Wasserstein brain connectome classification across subjects without common atlas` | 10 links |
| L4-3 | WebSearch | 2026-11-14 | `differentiable optimal transport layer learnable reference point cloud classification 2024 2025` | 10 links |
| L4-4 | Semantic Scholar recommendations | 2026-11-14/15 | papers similar to arXiv:2205.15733 | 40 |
| L4-5 | Semantic Scholar recommendations | 2026-11-14/15 | papers similar to arXiv:2206.09398 | 40 |

Record resolution (not counted as search hits): Crossref title lookups and DOI record fetches, arXiv `id_list` fetches, Semantic Scholar batch lookups, and WebSearch checks of PMLR and NeurIPS proceedings pages were used to confirm the venue, year, volume and pages of every included source.

### Coverage Distribution Advisory

DISTRIBUTIONAL_SKEW_ADVISORY:
- Dimension: methodological distribution
- Concentration: computational method or theory papers = 26/30 (87%); clinical cohort studies (Kundu2024Discovering, Ironside2025Predictive, Gong2026Robust, Qahqaie2026Unbalanced) = 4/30
- Advisory: This is a coverage-distribution signal, not a defect. Consider whether the paper's RQ warrants broader periods, sites, methods, or venue families.
- Search response: clinical transport studies were searched in PubMed (L1-9 to L1-12) and OpenAlex (L1-24); the four clinical studies included are the transport-centred clinical prediction studies those searches returned; Theme D covers clinical lesion pipelines without transport.

Time distribution: 2010s = 11/30, 2020s = 19/30 (63%); below threshold. Venue tier: NeurIPS, ICML, ICLR and AISTATS together = 14/30 (47%); arXiv-only preprints = 2/30; below threshold. Geographic distribution is not assessed because the records do not carry study-site metadata for most sources.

## Screening Results

- Initial hits: 1036 records retrieved across the four layers (Layer 1: 560, of which arXiv 192, PubMed 84, Crossref 60, Semantic Scholar 161, OpenAlex 63; Layer 2: 176 reference records; Layer 3: 190 citing records; Layer 4: 110). These counts are not deduplicated across layers.
- Screened by title: 831 records (all 560 Layer 1 records, the 8 Layer 2 works cited by two or more core papers, the 153 Layer 3 citing records from 2023 onward, all 110 Layer 4 records).
- After title screening, retained for abstract and record assessment: 54 unique records (43 arXiv records fetched by ID, 8 PubMed abstracts, 1 Crossref abstract, 1 Semantic Scholar abstract, 1 journal PDF).
- After abstract and full-record assessment: 30.
- Final included sources: 30 (28 peer-reviewed journal or proceedings papers, 2 arXiv preprints).

Per sub-theme (main or secondary assignment in the matrix below): entropic OT 10, GW and FGW 9, barycenters and template dictionaries 14, transport set embeddings and supervised transport prediction 15, registration-free transport in medical imaging 10. Every sub-theme has at least 3 included sources.

Quality gates at theme level: annotation completeness 30/30; peer-reviewed (or `cs_ml` peer-reviewed-equivalent) 30/30, of which 28/30 peer-reviewed in the neutral sense; currency, publication year 2022 to 2026: 14/30 (47%), below the 50% gate by one source. The shortfall comes from the brief's requirement to include foundational works for five sub-themes (16 of the 30 sources are 2011 to 2021 foundations); the currency gate applies to the merged corpus, which the merge run evaluates.

Saturation (agent file stopping rules; at least 3 must hold):
- Condition 1, source count meets target: met (30, within the 18 to 30 theme target).
- Condition 2, latest round added less than 10%: met. The last round (OpenAlex L1-24 and L1-25, Semantic Scholar L1-20, and the Layer 4 recommendations L4-4 and L4-5) added 0 new included sources; Qahqaie2026Unbalanced, returned by L1-24, had already been found by L4-1.
- Condition 3, theme saturation (every sub-theme at least 3 sources): met.
- Condition 4, citation loop closure: not met. All works cited by two or more of the five available reference lists were screened, but the reference lists of the NeurIPS and ICML core papers were not retrievable through Crossref.
- Condition 5, temporal span (foundational works plus 2023 to 2026): met (Memoli2011GromovWasserstein, Wang2013Linear, Cuturi2013Sinkhorn; 11 sources dated 2023 to 2026).

## Annotated Bibliography

Stance is relative to the RQ's claim that the missing correspondence must be handled explicitly. Quick-assessment items are venue, methodological rigor, relevance to RQ, citation count, data or evidence quality (1 to 3 each). Citation counts quoted are the Semantic Scholar `citationCount` returned by the batch lookup on 2026-11-14/15 or the citing-record count from Layer 3.

### Sub-theme 1: Entropic optimal transport

#### Cuturi (2013). Sinkhorn Distances: Lightspeed Computation of Optimal Transport Distances.
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

#### Chizat, Peyre, Schmitzer and Vialard (2018). Scaling algorithms for unbalanced optimal transport problems.
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

#### Feydy, Sejourne, Vialard, Amari, Trouve and Peyre (2019). Interpolating between Optimal Transport and MMD using Sinkhorn Divergences.
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

#### Wang and Goldfeld (2026). Neural Entropic Optimal Transport and Gromov-Wasserstein Alignment.
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

### Sub-theme 2: Gromov-Wasserstein and fused Gromov-Wasserstein

#### Memoli (2011). Gromov-Wasserstein Distances and the Metric Approach to Object Matching.
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

#### Vayer, Chapel, Flamary, Tavenard and Courty (2019). Optimal Transport for structured data with application on graphs.
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

#### Sejourne, Vialard and Peyre (2021). The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation.
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

#### Thual, Tran, Zemskova, Courty, Flamary, Dehaene and Thirion (2022). Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein.
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

### Sub-theme 3: Barycenters and dictionaries with learnable templates

#### Cuturi and Doucet (2014). Fast Computation of Wasserstein Barycenters.
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

#### Schmitz, Heitz, Bonneel, Ngole, Coeurjolly, Cuturi, Peyre and Starck (2018). Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning.
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

#### Vincent-Cuaz, Vayer, Flamary, Corneli and Courty (2021). Online Graph Dictionary Learning.
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

#### Vincent-Cuaz, Flamary, Corneli, Vayer and Courty (2022). Template Based Graph Neural Network with Optimal Transport Distances.
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

#### Brogat-Motte, Flamary, Brouard, Rousu and d'Alche-Buc (2022). Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters.
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

#### Mallery, Murphy and Aeron (2025). Synthesis and Analysis of Data as Probability Measures with Entropy-Regularized Optimal Transport.
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

#### Mazelet, Flamary and Thirion (2026). Learning fMRI activations dictionaries across individual geometries via optimal transport.
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

### Sub-theme 4: Transport-based set embeddings and supervised transport prediction

#### Wang, Slepcev, Basu, Ozolek and Rohde (2013). A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images.
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

#### Mialon, Chen, d'Aspremont and Mairal (2021). A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention.
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

#### Kolouri, Naderializadeh, Rohde and Hoffmann (2021). Wasserstein Embedding for Graph Learning.
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

#### Moosmuller and Cloninger (2023). Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations.
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

#### Bai, Medri, Diaz Martin, Khan and Kolouri (2023). Linear Optimal Partial Transport Embedding.
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

#### Shifat-E-Rabbi, Pathan, Li, Zhuang, Rubaiyat and Rohde (2025). Linear Optimal Transport Subspaces for Point Set Classification.
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

#### Wang, Ke, Bhaskar, Krishnaswamy and Cloninger (2025). Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data.
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

### Sub-theme 5: Registration-free transport in medical imaging and neuroimaging

#### Gramfort, Peyre and Cuturi (2015). Fast Optimal Transport Averaging of Neuroimaging Data.
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

#### Kundu, Kolouri, Erickson, Kramer, McAuley and Rohde (2018). Discovery and visualization of structural biomarkers from MRI using transport-based morphometry.
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

#### Gerber, Niethammer, Styner and Aylward (2018). Exploratory Population Analysis with Unbalanced Optimal Transport.
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

#### Shen, Feydy, Liu, Curiale, San Jose Estepar, San Jose Estepar and Niethammer (2021). Accurate Point Cloud Registration with Robust Optimal Transport.
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

#### Kundu, Sair, Sherr, Mukherjee and Rohde (2024). Discovering the gene-brain-behavior link in autism via generative machine learning.
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

#### Ironside, El Naamani, Rizvi, El-Rabbi, Kundu, Becceril-Gaitan, Pas, Snyder, Chen, Langefeld, Woo, Mayer, Connolly and Rohde (2025). Predictive modeling of hematoma expansion from non-contrast computed tomography in spontaneous intracerebral hemorrhage patients.
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

#### Gong, Luo, Mao, Gong, Lu, Ding and Zhu (2026). Robust prostate cancer risk stratification from unregistered mpMRI via learned cross-modal correspondence.
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

#### Qahqaie, Neumann, Heimann, Maier and Zimmer (2026). Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors.
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

## Literature Matrix

Columns: S1 entropic OT; S2 GW and FGW; S3 barycenters and template dictionaries; S4 transport set embeddings and supervised transport prediction; S5 registration-free transport in medical imaging. "main" marks the sub-theme a source is filed under; "x" marks a secondary contribution stated in its abstract or full text read.

| Source | S1 | S2 | S3 | S4 | S5 | Method | Quality |
|--------|----|----|----|----|----|--------|---------|
| Cuturi2013Sinkhorn | main | | | | | Algorithm | High |
| Chizat2018Scaling | main | | x | | | Algorithm | High |
| Feydy2019Interpolating | main | | | | | Theory and algorithm | High |
| Wang2026NeuralEntropic | main | x | | | | Theory and algorithm | Medium |
| Memoli2011GromovWasserstein | | main | | | | Theory | High |
| Vayer2019Structured | | main | x | x | | Method and benchmark | High |
| Sejourne2021Unbalanced | x | main | | | | Theory and algorithm | Medium |
| Thual2022Aligning | | main | | | x | Method and neuroimaging evaluation | High |
| CuturiDoucet2014Fast | x | | main | | | Algorithm | High |
| Schmitz2018Wasserstein | x | | main | | | Method | High |
| VincentCuaz2021Online | | x | main | | | Method | High |
| VincentCuaz2022Template | | x | main | x | | Method and benchmark | High |
| BrogatMotte2022Learning | | x | main | x | | Method and theory | Medium |
| Mallery2025Synthesis | x | | main | x | | Theory and experiments | Medium |
| Mazelet2026Learning | | x | main | | x | Method and neuroimaging evaluation (preprint) | Medium |
| Wang2013Linear | | | x | main | | Method | High |
| Mialon2021Trainable | | | x | main | | Method and benchmark | High |
| Kolouri2021Wasserstein | | | x | main | | Method and benchmark | High |
| Moosmuller2023Linear | | | | main | | Theory and experiments | High |
| Bai2023Linear | | | | main | | Method | Medium |
| ShifatERabbi2025Linear | | | | main | | Method and benchmark | Medium |
| Wang2025Linearized | | | x | main | | Method and application (preprint) | Medium |
| Gramfort2015Fast | x | | x | | main | Algorithm and neuroimaging evaluation | High |
| Kundu2018Discovery | | | | x | main | Method and cohort validation | High |
| Gerber2018Exploratory | | | | x | main | Method and cohort evaluation | Medium |
| Shen2021Accurate | | | | | main | Method and benchmark | High |
| Kundu2024Discovering | | | | x | main | Cohort study | High |
| Ironside2025Predictive | | | | x | main | Cohort study with external test | High |
| Gong2026Robust | x | | | | main | Cohort study, single centre | Medium |
| Qahqaie2026Unbalanced | | | | | main | Method and clinical evaluation | Medium |

## Identified Gaps

1. No included source predicts a subject-level outcome from a set of segmented lesions through a transport coupling between lesion sets. Qahqaie2026Unbalanced couples lesion sets of unequal mass but for within-patient longitudinal matching, not outcome prediction; Ironside2025Predictive predicts from a single hematoma image; Gerber2018Exploratory works on tissue maps. The OpenAlex lesion query (L1-24, 45 records) and the PubMed lesion query (L1-10, 10 records) returned no such study.
2. Learned templates and medical transport prediction have not been joined. Templates are learned end to end in VincentCuaz2022Template, Mialon2021Trainable and BrogatMotte2022Learning on graph or sequence benchmarks, while the clinical transport predictors Kundu2018Discovery, Kundu2024Discovering and Ironside2025Predictive transport each subject to a fixed reference and fit classifiers in that space. Mazelet2026Learning learns FGW atoms on fMRI but, per its abstract, for representation rather than a supervised outcome.
3. Unequal mass is handled by the transport tools (Chizat2018Scaling, Sejourne2021Unbalanced, Bai2023Linear, Thual2022Aligning) but not by the supervised template layers: the abstracts of VincentCuaz2022Template, Mialon2021Trainable and Kolouri2021Wasserstein do not describe any handling of unequal total mass, which is the situation of lesion sets of different count and volume.
4. Clinical evidence is thin and mostly single-site. Gong2026Robust reports a single-centre cohort with a 50-patient test set and calls its findings exploratory; Kundu2018Discovery validates on healthy older adults; Ironside2025Predictive is the only included clinical study with a test cohort from a different study (ERICH, 170 patients).
5. Registration-free transport fusion across imaging modalities or sequences in a clinical prediction task is represented by one source (Gong2026Robust); the other registration-free sources align brains for group analysis (Thual2022Aligning, Gramfort2015Fast) or register point sets (Shen2021Accurate).

## Excluded at Full-Record Assessment

These 24 records passed title screening and were excluded after reading their abstract and record.

| Record | Identifier | Reason |
|--------|-----------|--------|
| Vayer et al. 2020, FGW distance for structured objects (Algorithms) | DOI 10.3390/a13090212; arXiv:1811.02834 | Theory companion of Vayer2019Structured with the same definition; the included proceedings paper adds the graph classification evidence. |
| Xu, Luo, Zha, Carin 2019, Gromov-Wasserstein learning for graph matching and node embedding | arXiv:1901.06003 | Graph matching and node embedding with no subject-level prediction or template; GW definition already covered by Memoli2011GromovWasserstein and Vayer2019Structured. |
| Feydy, Roussillon, Trouve, Gori 2019, Fast and scalable OT for brain tractograms | DOI 10.1007/978-3-030-32248-9_71; arXiv:2107.02010 | Eligible (atlas label transfer and tractogram barycenters by transport); not included because the 30-source cap was filled by sources closer to subject-level prediction (Kundu2024Discovering took its place). Recorded for the merge run. |
| Krzakala et al. 2024, Any2Graph | DOI 10.52202/079017-3221; arXiv:2402.12269 | Transport is used on the output side (graph-valued targets); the RQ concerns unaligned inputs. |
| Mahan, Moosmuller, Cloninger 2024, Deep set linearized OT | arXiv:2401.01460 | Preprint with a fixed reference; the same LOT classification approach is covered by peer-reviewed Moosmuller2023Linear and ShifatERabbi2025Linear. |
| Beier, Beinert, Steidl 2023, On a linear Gromov-Wasserstein distance | DOI 10.1109/TIP.2022.3221286; arXiv:2112.11964 | Eligible (linear GW embedding, shape classification); not included under the 30-source cap because LOT embedding is covered by Wang2013Linear and Moosmuller2023Linear. Recorded for the merge run. |
| Vincent-Cuaz et al. 2022, Semi-relaxed Gromov-Wasserstein divergence | arXiv:2110.02753 | Partitioning, clustering and completion only; GW dictionaries covered by VincentCuaz2021Online. |
| Luise, Rudi, Pontil, Ciliberto 2018, Differential properties of Sinkhorn approximation | arXiv:1805.11897 | Eligible (gradient of the Sinkhorn distance); not included under the 30-source cap because differentiation through Sinkhorn is covered by Feydy2019Interpolating and Schmitz2018Wasserstein. Recorded for the merge run. |
| Kan et al. 2026, 3D transport-based morphometry tool | arXiv:2602.07260 | Software tool description without new evaluation; the TBM method is covered by Kundu2018Discovery and Kundu2024Discovering. |
| Ironside et al. 2026, Regional prediction of hematoma expansion | arXiv:2610.34645 | Preprint extension by the same group of the included peer-reviewed study Ironside2025Predictive. |
| Cheng, Xu 2022, Revisiting global pooling through the lens of OT | arXiv:2201.09191 | No venue on its Semantic Scholar record; the transport pooling with a trainable reference is covered by Mialon2021Trainable. |
| Werenski et al. 2024, Linearized Wasserstein barycenters | arXiv:2410.23602 | Covariance estimation and imputation; no prediction from sets. |
| Shifat-E-Rabbi et al. 2023, TBM of nuclear structures | arXiv:2302.01449 | Cell-level analysis, not subject-level; same method family as included TBM sources. |
| Nguyen, Tsuda 2023, Linear fused Gromov-Wasserstein distance | DOI 10.1016/j.patcog.2023.109351; arXiv:2203.04711 | Graph kernel embedding covered by VincentCuaz2022Template and Kolouri2021Wasserstein. |
| Ma et al. 2023, Fused Gromov-Wasserstein graph mixup | arXiv:2306.15963 | Transport used for data augmentation, not for handling correspondence in prediction. |
| Wang, Fan 2024, Graph classification via reference distribution learning | DOI 10.52202/079017-4374; arXiv:2408.11370 | Learned reference distributions are compared by maximum mean discrepancy, not by transport; outside Theme B (relevant to Theme C). |
| Barbarant, Meyniel, Thirion 2026, SpectralOT functional alignment | DOI 10.32470/gn6tuko; arXiv:2607.10931 | The abstract does not describe the transport formulation or report decoding results; the transport alignment line is represented by Thual2022Aligning. |
| Mazelet, Flamary, Thirion 2025, ULOT | arXiv:2506.12025 | Transport plan prediction between graphs; the same amortized plan prediction is used inside the included Mazelet2026Learning. |
| Gachon et al. 2024, OT representation of multi-patient flow cytometry | arXiv:2407.17329 | Representation and clustering without a supervised predictor; subject-level LOT on point clouds covered by Wang2025Linearized. |
| Kundu et al. 2020, Early osteoarthritis detection via transport-based learning (PNAS) | DOI 10.1073/pnas.1917405117 | Eligible (subject-level prediction from cartilage maps via transport); not included under the 30-source cap because the TBM method is represented by Kundu2018Discovery, Kundu2024Discovering and Ironside2025Predictive. Recorded for the merge run. |
| Takeda, Sasaki, Abe, Oizumi 2025, GW toolbox for unsupervised alignment in neuroscience | DOI 10.1016/j.jneumeth.2025.110443 | Representational alignment of stimuli across brains and models; no subject-level prediction and no spatial correspondence. |
| Chen, Das, Chung 2026, Sulcal pattern matching with the Wasserstein distance | arXiv:2307.00385 (PubMed 42078498) | Preprint; transport used to estimate a deformation field for registration, with no prediction results in the abstract; transport-driven registration represented by Shen2021Accurate. |
| Ma, Bian, Xue 2024, Point clouds matching based on discrete OT | DOI 10.1109/TIP.2024.3459594 | Generic point cloud registration with no medical or prediction setting. |
| Peyre, Cuturi 2019, Computational optimal transport | DOI 10.1561/2200000073; arXiv:1803.00567 | Eligible survey; not included under the 30-source cap because it carries no primary evidence and the entropic sub-theme is covered by primary sources. Recorded for the merge run as a candidate background reference. |

Excluded at title screening and noted because they came from Layer 2: Kolouri 2016 Radon cumulative distribution transform, Basu 2014 transport-based morphometry of cells, Kolouri 2016 continuous LOT, Wang 2011 transport for nuclear structure pathology, Park 2018 cumulative distribution transform (image-level or cell-level transforms, superseded within the same line by Wang2013Linear and Kundu2018Discovery); and Peyre, Cuturi, Solomon 2016, Gromov-Wasserstein averaging of kernel and distance matrices, which is foundational for entropic GW and GW barycenters but has no DOI or arXiv record in Semantic Scholar or OpenAlex and therefore fails the retrievability criterion.

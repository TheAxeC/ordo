# Strand group B: entropic and unbalanced transport, Gromov-Wasserstein, fused GW, barycenters, linearized and sliced embeddings, learned transport templates

This file is the search agent's output for strand group B. The bibliography is `strand-B.bib` in the same folder, with 73 entries. Each entry below names its key in that file.

For every method the review records four properties:

- Correspondence: whether the coupling serves as the correspondence between the elements of two sets.
- Template: whether the template, reference or barycenter is fixed or learned, and if learned, whether it is learned jointly with a supervised loss.
- Output: whether the method gives a predictor, a kernel, an embedding or only a distance.
- Cost: the cost in the size of each set, as the paper states it.

The direction tag of each entry (support, oppose, neutral) is read against this question: does a transport coupling to a learned template, trained jointly with a supervised loss, give a usable subject-level predictor on sets of unequal size? An entry is tagged support when it shows such a model working, or shows a component it needs; oppose when it reports that the transport route is too costly, unnecessary or beaten by an alternative; neutral when it supplies theory or tools with no bearing on that question.

Each annotation ends with what was read of the source:

- Full text: the whole paper was retrieved and read.
- Method section: the full text was retrieved, and the abstract, the method section and the complexity and experiment passages were read.
- Abstract only: no full text could be retrieved by any route in Section 3.3, and the abstract was read.

## 1. Search Strategy

### 1.1 Databases and date range

- OpenAlex works API, field `title_and_abstract.search`, filter `publication_year:2013-2026`, sorted by citation count, every page retrieved.
- arXiv API, `abs:` field queries, filter `submittedDate:[201301010000 TO 202612312359]`, every page retrieved.
- Semantic Scholar was tried for Layer 4 and returned HTTP 429 on every request, so Layer 4 ran on OpenAlex relevance search instead. It answered single lookups later in the run, which were used for abstracts and venue checks.
- DBLP returned an anti-bot page to every request, so venue pages were found through the PMLR volume indexes and the NeurIPS proceedings listings.
- Open-access routes for full texts: Unpaywall, the OpenAlex and Semantic Scholar open-access locations, Europe PMC and NCBI PMC, the HAL API, author pages, publisher abstract pages and arXiv title search.
- Inclusion window: 2013 to 2026, with foundational works from any year.
- Search run on 2026-11-20.

### 1.2 Layer 1: Boolean queries and hit counts

The arXiv strings are the OpenAlex strings with an `abs:` prefix on each term, for example `abs:"Gromov-Wasserstein"`.

| Query | String | OpenAlex hits | arXiv hits |
|---|---|---|---|
| B1 | `"Sinkhorn" AND "optimal transport" AND (classification OR embedding OR kernel OR learning)` | 345 | 196 |
| B2 | `"unbalanced optimal transport" OR "semi-relaxed optimal transport" OR "semi-relaxed Gromov-Wasserstein"` | 365 | 175 |
| B3 | `("linear optimal transport" OR "sliced Wasserstein") AND (embedding OR kernel OR classification)` | 163 | 76 |
| B4 | `"Gromov-Wasserstein"` | 540 | 307 |
| B5 | `"fused Gromov-Wasserstein"` | 121 | 58 |
| B6 | `"Wasserstein barycenter" OR "Wasserstein barycenters" OR "Gromov-Wasserstein barycenter"` | 530 | 315 |
| B7 | `("Gromov-Wasserstein" OR "optimal transport") AND (dictionary OR template OR templates) AND (graph OR graphs OR "point cloud")` | 35 | 14 |
| Total | | 2099 | 1141 |

All 3240 records were retrieved. Deduplication by normalized title left 1899 unique titles, and every one was screened on its title.

### 1.3 Layer 2: citation chaining

`the lookup script refs` was run on four seed papers: TFGW, arXiv 2205.15733 (47 references); OGDL, arXiv 2102.06555 (74); FGW, arXiv 1805.09114 (56); and Sinkhorn distances, arXiv 1306.0895 (24).

- Three of the seeds cite Memoli 2011 and Peyre et al. 2016, plus graph kernel papers outside this strand.
- Two of the seeds cite Peyre and Cuturi 2019, Villani 2009, Chowdhury and Memoli 2019, Xu et al. 2019 (GW learning for graph matching), GOT (Petric Maretic et al. 2019) and Xu 2020 (GWF).
- Reading the reference lists of the full texts also surfaced WEGL, Wang et al. 2012 (LOT) and Cuturi 2013. The OpenAlex record of Cuturi 2013 carries no abstract, which is why the Layer 1 abstract search did not return it.
- Chowdhury and Memoli 2019, Xu et al. 2019 and GOT were in the Layer 1 title set and had been excluded at title screening. The citation-loop check read all three at full text and included them (Section 3.4).

### 1.4 Layer 3: forward tracking

`the lookup script cited-by --since 2023` returned 10 citing works for TFGW, 20 for OGDL and 134 for FGW. The first pass took five candidates: reference distribution learning (Wang and Fan 2024), regularized OT pooling layers (Xu and Cheng 2023), an OT pyramid graph kernel for autism, OT graph kernels for drug properties, and a sulcal prototype paper. A second pass over the same 164 citing works, listed by year with a filter on the terms template, dictionary, classification, kernel, embedding, barycenter, brain, pooling, prototype, subject and patient, took five more candidates: an unbalanced OT dictionary learning paper, a Wasserstein graph distance on probabilistic node embeddings, OT kernels for cell complexes, FGW graph mixup, and a concept-focused EMD graph classifier.

### 1.5 Layer 4: relevance search

OpenAlex relevance search, top 50 results of each query screened.

| Query | String | Index count |
|---|---|---|
| S1 | optimal transport learned templates graph classification | 5973 |
| S2 | Wasserstein embedding reference measure fixed-length representation sets classification | 3735 |
| S3 | Gromov-Wasserstein alignment across subjects brain cortical | 84 |
| S4 | optimal transport kernel embedding feature aggregation sets of features | 9610 |
| S5 | fused Gromov-Wasserstein barycenter graph dictionary supervised | 36 |

Layer 4 added OTKE, OT-GNN and WWL as includes, and found the MCI paper that was later excluded. Every other relevant hit had already been found by Layers 1 to 3.

### 1.6 Currency supplement

The first included set fell short of the gate that half the sources date from the last five years, so two rounds targeted 2022 to 2026 work on the same queries and on the forward-tracking lists. Round 1 screened 15 candidates and included 12. Round 2 screened 5 and included 5. The second forward-tracking pass of Section 1.4 is the third round: it screened 5 candidates and included 5.

### 1.7 Searches made while re-screening the exclusions under (g)

Web searches by title for the seven sources excluded under (g) found two new candidates. The search for the flow cytometry poster returned Gachon et al., a linearized OT representation of multi-patient flow cytometry (arXiv 2407.17329, published in Cytometry Part A). The search for the autism pyramid kernel returned the authors' earlier preprint, Transport Based Graph Kernels (arXiv 2011.00745). Both were read at full text and included.

## 2. Coverage Distribution Advisory

Counts are taken from `strand-B.bib` (`grep -o '^@[a-z]*' strand-B.bib | sort | uniq -c` and the year field).

- Source type: 27 conference papers, 23 journal articles, 1 book, 5 book-series chapters (IPMI, MICCAI and PAKDD proceedings), 17 preprint records. No single type reaches 70%, so no skew advisory is emitted on source type.
- Publication year: 38 of 73 sources (52.1%) date from 2022 to 2026, and 35 from 2009 to 2021. No skew.
- Peer review: 56 of 73 entries (76.7%) carry a venue record. Of the 17 preprint records, five have a venue confirmed through Semantic Scholar in this run (OTKE, WEGL and FSW at ICLR, LPGW at ICLR, Werenski et al. at AISTATS), which brings the count to 61 of 73 (83.6%). The domain profile `cs_ml` treats arXiv preprints as peer-reviewed-equivalent, so the 70% gate is met on either count.
- Application domain: the benchmarks are molecules, social graphs, point clouds and images in most of the methods papers. Neuroimaging and clinical applications account for 13 sources (Gramfort et al. 2015, Gerber et al. 2018 and 2023, Feydy et al. 2019 tractograms, Thual et al. 2022, Ma et al. 2023 MICCAI, Mazelet et al. 2025 and 2026, Barbarant et al. 2026, Wang et al. 2025, Pathan et al. 2026, Gachon et al. 2025, Aburidi and Marcia 2025), which is 17.8%. No value reaches 70%, so no skew advisory is emitted, but the medical share is low and is taken up in Section 6.
- Research group: entries with Flamary, Courty or Vayer among the authors number 10, entries with Rohde or Kolouri among the authors number 9, and entries with Hongteng Xu among the authors number 5. None reaches 70%.

## 3. Screening Results

### 3.1 Counts

| Stage | Count |
|---|---|
| Records retrieved in Layer 1 (OpenAlex 2099, arXiv 1141) | 3240 |
| Unique titles after deduplication | 1899 |
| Titles screened | 1899 |
| Candidates passed to full screening (Phase A) | 81 |
| Excluded at full screening (Phase B) | 8 |
| Included | 73 |

The 81 Phase A candidates came from these sources:

- 41 from title screening of the Layer 1 set together with the Layer 2 chaining results.
- Memoli 2014.
- 7 from Layer 3 and Layer 4.
- 2 found while reading full texts: the MIL flow cytometry poster and a task-adaptive barycentric fusion paper.
- 15 from currency round 1 and 5 from currency round 2.
- 3 readmitted from the Layer 1 title set by the citation-loop check (Section 1.3).
- 5 from the second forward-tracking pass (Section 1.4).
- 2 from the searches of Section 1.7.

### 3.2 Exclusions at Phase B

Excluded under (g), no readable text, abstract or method description. The routes tried for each are in Section 3.3.

1. Optimal transport based pyramid graph kernel for autism spectrum disorder diagnosis, Ma, Huang, Wan and Zhang, Pattern Recognition 143 (2023), DOI 10.1016/j.patcog.2023.109716.
2. Sliced Wasserstein graph kernel for measuring global topological similarity of brain functional networks, Ma, Zhu, Wen, Yang and Zhang, Pattern Recognition 171 (2026), DOI 10.1016/j.patcog.2025.112208.
3. Multiple Instance Learning and data augmentation via Wasserstein barycenters: Application to flow cytometry data, Mikem, Durand, Keribin and Massart, poster at ML at Aussois 2025, HAL hal-05499580.

Excluded at the relevance gate:

4. Sulcal prototype inverse projection, DOI 10.1016/j.media.2025.103538: the abstract describes no transport.
5. Optimal transport and kernel based early detection of MCI, DOI 10.1186/s13195-021-00915-3: transport serves domain transfer between cohorts, with no correspondence within a subject's set.
6. Task-Adaptive Wasserstein Barycentric Fusion: modality fusion, which belongs to strand group C.
7. Any2Graph: the method predicts graphs as outputs, with no subject-level predictor from sets.
8. Supervised Gromov-Wasserstein optimal transport, arXiv 2401.06266: an alignment method that gives no predictor.

### 3.3 Re-screening of the sources excluded under (g)

Seven sources had been excluded under (g). Each was screened again through the open routes; four now pass and three stay excluded.

| Source | Routes tried and result | Outcome |
|---|---|---|
| Villani, Optimal Transport: Old and New, DOI 10.1007/978-3-540-71050-9 | Unpaywall: not open access. OpenAlex: closed, no abstract. `the lookup script index-abstract` (OpenAlex, Semantic Scholar, Crossref, Europe PMC, PubMed): no abstract. Springer book page: JavaScript challenge page, no content. cedricvillani.org preprint URL: no connection. Web search for an author copy: the CEREMADE (Paris-Dauphine) copy of the author's lecture-notes version dated 2006-09-27 downloaded as a PDF and was read (chapters 1, 4 and 6: couplings, existence of an optimal coupling, Wasserstein distances). | Included, read at the method section of the author's preliminary version |
| Memoli 2011, DOI 10.1007/s10208-011-9093-5 | Unpaywall: not open access. OpenAlex: closed; repository record hdl 2440/75765 has no file. `index-abstract`: no abstract. Springer article page: JavaScript challenge page. CORE download 79113246: HTTP 403. Web search: a copy of the published article on a UC Davis course page downloaded as a PDF with the journal header and was read. | Included, read at the method section |
| Ma et al., Positive Definite Wasserstein Graph Kernel for Brain Disease Diagnosis, MICCAI 2023, DOI 10.1007/978-3-031-43904-9_17 | Unpaywall and OpenAlex: closed, no abstract. `index-abstract`: no abstract. arXiv title search: no record. AMiner page: no abstract in the served text. Springer chapter page, reached by following its cookie redirect: abstract read. | Included, abstract only |
| Qian et al., Reimagining Graph Classification from a Prototype View with Optimal Transport, KDD 2024, DOI 10.1145/3637528.3671696 | Unpaywall and OpenAlex: bronze open access at the ACM PDF, which returned HTTP 403 to curl and to WebFetch. ACM abstract page: HTTP 403. arXiv title search: no record. Bohrium page: HTTP 404. ChatPaper page: opening of the abstract only. The authors' GitHub repository ChnQ/PGOT exists and is empty. Semantic Scholar API: full abstract read. | Included, abstract only |
| Ma et al. 2023, pyramid graph kernel for autism, DOI 10.1016/j.patcog.2023.109716 | Unpaywall and OpenAlex: closed, no abstract. `index-abstract`: no abstract. Semantic Scholar: abstract null. Elsevier article API: metadata only, no abstract. ScienceDirect page: HTTP 403 to curl and to WebFetch. OUCI page: HTTP 403. arXiv title search: no record. Web search: no abstract or author copy. The authors' 2020 preprint on transport based graph kernels was found and included as a separate source. | Excluded under (g) |
| Ma et al. 2026, sliced Wasserstein graph kernel for brain functional networks, DOI 10.1016/j.patcog.2025.112208 | Unpaywall and OpenAlex: closed, no abstract. `index-abstract`: no abstract. Semantic Scholar: abstract null. Elsevier article API: rate-limited, then no abstract. arXiv title and abstract search: no record. Web search: no abstract; the results point to the MICCAI 2023 paper by the same group, which is included. | Excluded under (g) |
| Mikem et al. 2025, MIL and Wasserstein barycenters for flow cytometry, HAL hal-05499580 | OpenAlex: green open access at HAL, no abstract. HAL API: record found, document type poster, no abstract field, one file. The file URL and the document URL on inria.hal.science and hal.science: Anubis bot-protection page, by curl and by WebFetch. Wayback Machine copy: HTTP 404. arXiv: no record by title or by first author. HAL API for the first author's other records: a 2025 conference abstract and a 2026 thesis abstract, both read; neither describes the barycenter method, and the thesis PDF is behind the same bot protection. | Excluded under (g) |

### 3.4 Read counts

Counted from the "Read:" line of each annotation in Section 4 (`grep -c 'Read: full text\.'` and the same for the other two levels).

| What was read | Sources |
|---|---|
| Full text | 43 |
| Method section | 23 |
| Abstract only | 7 |
| Total | 73 |

The seven sources read at the abstract only, with the routes that failed to give a full text:

- xu2023representing: OpenAlex and Semantic Scholar list no open-access copy; arXiv title search finds no record; web search finds only repository records. The conference version (xu2020gromovwasserstein) is read at full text.
- zhang2024wasserstein: OpenAlex and Semantic Scholar list no open-access copy; arXiv title search finds no record; web search finds only repository records.
- rahman2026geometric: the SSRN DOI returns HTTP 403; OpenAlex lists no other copy.
- ma2023positive, qian2024reimagining: routes in Section 3.3.
- wang2025an: OpenAlex and Semantic Scholar list no open-access copy.
- bui2024toward: Unpaywall, OpenAlex, Semantic Scholar and Crossref give no copy and no abstract; arXiv title search finds no record; the abstract was read on the Springer chapter page.

## 4. Annotated Bibliography

Entries are grouped by theme. The theme codes T1 to T7 are defined in Section 5.

### 4.1 Optimal transport foundations, entropic OT and Sinkhorn (T1)

**villani2009optimal.** Villani defines a coupling of two probability measures as a measure on the product space with those marginals, a deterministic coupling as one carried by a map, proves the existence of an optimal coupling for lower semicontinuous costs, and defines the Wasserstein distance of order p as the infimum over couplings of the integrated distance to the power p. Output: theory. The text read is the author's lecture-notes version of 2006, which became the 2009 book. Read: method section. Tag: neutral.

**cuturi2013sinkhorn.** Cuturi adds an entropic penalty to the transport problem and solves it by Sinkhorn-Knopp matrix scaling, which runs on a GPU and vectorizes over a batch of histograms at cost O(d^2 N). The coupling is a soft correspondence. Output: a distance. Read: full text. Tag: support, because the entropic coupling is the differentiable building block a jointly trained template needs.

**peyre2019computational.** Peyre and Cuturi's monograph covers Sinkhorn, its complexity, barycenters, unbalanced transport and Gromov-Wasserstein. Output: survey. Read: method section. Tag: neutral.

**benamou2015iterative.** Benamou et al. recast entropic transport, barycenters and partial transport as iterative Bregman projections onto affine constraints. The barycenter is computed, not learned. Read: full text. Tag: neutral.

**chizat2018scaling.** Chizat et al. extend entropic regularization to unbalanced transport, where the marginal constraints are replaced by divergence penalties such as KL, and solve it by a scaling algorithm that is a special case of Dykstra's iterations. The same scheme computes unbalanced barycenters and gradient flows. Read: method section. Tag: support, because unbalanced marginals let a template ignore elements that have no match.

**feydy2019interpolating.** Feydy et al. define the Sinkhorn divergence, which is positive definite and metrizes convergence in law, and interpolates between transport and MMD as the regularization grows. Output: a loss. Read: full text. Tag: support, because it removes the entropic bias from a loss trained through a coupling.

**luise2018differential.** Luise et al. prove that the sharp Sinkhorn distance is smooth and give its gradient in closed form, which makes it usable as a learning loss. Read: full text. Tag: support.

### 4.2 Gromov-Wasserstein and its variants (T2)

**memoli2011gromovwasserstein.** Memoli treats objects as metric measure spaces, relaxes the correspondences of the Gromov-Hausdorff distance to measure couplings, and defines the GW distance D_p. Theorem 5.1 shows that D_p is a metric on isomorphism classes of metric measure spaces. Remark 5.13 shows that the support of an optimal coupling is a correspondence, which induces maps in both directions between the two objects. Lower bounds on D_p are computable in polynomial time. Section 7 writes the discrete problem as a quadratic program with n_X + n_Y linear constraints that need not be convex, and solves it by successive linear programs initialized from a lower bound. Read: method section. Tag: support, because the coupling is established here as the correspondence between unaligned objects.

**memoli2014the.** Memoli's overview defines the GW distance between metric measure spaces through couplings, and shows that it vanishes exactly on isomorphic spaces. Output: a distance. Read: full text. Tag: neutral.

**chowdhury2019the.** Chowdhury and Memoli define a GW distance on weighted directed networks, which need not satisfy the triangle inequality, and supply network invariants based on optimal transport that give a hierarchy of lower bounds on it. Output: a distance. Read: method section. Tag: neutral.

**peyre2016gromovwasserstein.** Peyre, Cuturi and Solomon compute entropic GW couplings between similarity matrices that live in different spaces, and average them into a GW barycenter. Cost O(N1^2 N2 + N2^2 N1) per iteration. The barycenter is computed for given weights. They use it to predict energy levels in quantum chemistry. Read: full text. Tag: support.

**solomon2016entropic.** Solomon et al. compute probabilistic correspondences between geometric domains by an entropy-regularized GW objective, solved by a compact iterative algorithm that provably reaches a local minimum from any initial guess. The fuzzy correspondence matrix is the output, with its sharpness set by the entropic weight. They extend it to partial distance matrices, user guidance and shape collections. Read: method section. Tag: support.

**xu2019gromovwasserstein.** Xu et al. learn node embeddings of two graphs jointly with the GW coupling between them, solved by a proximal point method with a KL proximal term. The coupling gives the graph matching, and the embeddings are learned under its guidance. Cost O(M(V^2 D + N V^3)) for V nodes, D embedding dimensions, M outer and N inner iterations, run on GPUs. Output: alignment and embeddings. Read: method section. Tag: support.

**vayer2019sliced.** Vayer et al. project to one dimension and solve GW in closed form on the projections, at cost O(n log n). The full coupling is not returned. Output: a distance. Read: full text. Tag: neutral.

**sejourne2021the.** Sejourne et al. define unbalanced GW and its conic relaxation, solved by unbalanced Sinkhorn at O(n^3) time and O(n^2) memory with the squared loss. The coupling is a partial correspondence. Read: full text. Tag: support.

**vincentcuaz2021semirelaxed.** Vincent-Cuaz et al. relax the target marginal of GW, so a graph can be matched to a template whose node weights are free. This gives dictionary embeddings for clustering, with gradient cost O(n^2 m + m^2 n). Template learned without supervision. Read: full text. Tag: support.

**scetbon2022lineartime.** Scetbon et al. impose low-rank costs and couplings, which brings GW to time linear in the number of points. The coupling is factored. Read: full text. Tag: neutral.

**beier2022on.** Beier et al. linearize GW against a reference metric measure space, so N spaces need N couplings instead of N^2, and use the embedding for shape classification. Reference fixed. Output: embedding. Read: full text. Tag: support.

**zhang2024gromovwasserstein.** Zhang et al. derive a dual form of entropic GW whose dual variable can be restricted to a hypercube set by the second moments, and use it with empirical process theory to give the first empirical convergence rates for GW. Theory only. Read: method section. Tag: neutral.

**rioux2023entropic.** Rioux et al. derive smoothness and convexity properties of the variational form of entropic GW, solve it by an accelerated gradient method with Sinkhorn iterations at O(N^2) each, and show that its stationary points converge to stationary points of unregularized GW as the regularization vanishes. Read: method section. Tag: neutral.

**bai2024linear.** Bai et al. linearize partial GW against a reference space, needing N plans instead of N^2, and classify the embeddings with logistic regression. Reference fixed. Read: full text. Tag: support.

### 4.3 Fused GW for structured objects (T3)

**vayer2019optimal.** Vayer et al. introduce FGW, which matches the nodes of two graphs by trading a feature Wasserstein cost against a structure GW cost. It is a metric for q = 1 and handles graphs of different sizes. Output: a distance, used in kernels. Read: full text. Tag: support.

**vayer2020fused.** The journal version of FGW, with the metric properties and the barycenter. Read: full text. Tag: support.

**nguyen2023on.** Nguyen and Tsuda linearize FGW against a reference that is itself an FGW barycenter, which gives a Euclidean embedding of dimension K + K^2 and a valid kernel. Reference computed, not trained against labels. Read: full text. Tag: support.

**bai2025fused.** Bai et al. define fused partial GW and give barycenter solvers for it. Read: full text. Tag: support.

**piening2026a.** Piening and Beinert slice FGW, at cost O(Ln(r + d) + (Ln + n^2) log n), and classify with k nearest neighbours. Output: a distance. Read: full text. Tag: neutral.

**aburidi2025optimal.** Aburidi and Marcia build three OT graph kernels for ADMET drug-property prediction, from Wasserstein, GW and FGW distances between molecular graphs. The indefinite Laplacian kernel matrix feeds a support vector machine or a kernel multilayer perceptron. On 19 ADMET datasets the kernels outperform the graph deep learning baselines on 9, and the FGW kernel is more accurate than the Wasserstein kernel. Output: a kernel. Read: method section. Tag: support.

**ma2023fused.** Ma et al. augment graph classification data by FGWMixup, which takes the FGW barycenter of two source graphs as the mixed sample, and relax the coupling polytope into separate simplex constraints, which raises the solver's convergence rate from O(1/t) to O(1/t^2). Template computed per pair. Output: augmented training data for a GNN. Read: method section. Tag: neutral.

**qian2024reimagining.** Qian et al. classify graphs by FGW distance to class prototypes, assigning the label of the closest prototype. An NN-based approximator of the FGW distance allows full GPU training, and the authors derive an O(1/N) generalization bound. The abstract does not say how the prototypes are trained. Output: predictor. Read: abstract only. Tag: support.

### 4.4 Barycenters (T4)

**cuturi2014fast.** Cuturi and Doucet compute Wasserstein barycenters through the smoothed dual, and the free-support version generalizes k-means. Read: full text. Tag: neutral.

**gramfort2015fast.** Gramfort et al. average unnormalized neuroimaging maps by a Kantorovich barycenter with a geodesic metric on the cortex, computed on a GPU in minutes. Template computed, not learned against a label. Read: full text. Tag: support.

**xu2021learning.** Xu et al. learn graphons from unaligned graphs of different sizes as structured GW barycenters, with a mixture of GW barycenters for graphs with unknown clusters. One step of their algorithm costs O(EK + NK^2) for E edges, N nodes and K partitions. Read: method section. Tag: neutral.

**werenski2024linearized.** Werenski et al. propose the linear barycentric coding model, which represents a measure by barycentric coefficients over a given set of reference measures in the linearized OT metric, and give rates of statistical estimation from samples. They show that the natural two-dimensional construction fails. Reference fixed. Read: method section. Tag: neutral.

**brogatmotte2022learning.** Brogat-Motte et al. predict a graph as an FGW barycenter of templates with input-dependent weights, and learn the templates jointly with a neural network under a supervised FGW loss. Output: structured prediction of graphs. Read: full text. Tag: support, because templates are trained jointly with a supervised loss through FGW couplings.

### 4.5 Learned dictionaries, templates and references (T5)

**vincentcuaz2022template.** TFGW computes FGW distances from a graph to K templates and feeds the vector to an MLP. The templates (structure, features and node weights) and the trade-off alpha are learned end-to-end with cross-entropy, with gradients through the envelope theorem. The coupling is the node-to-template correspondence. The conditional gradient solver costs O(n^2 nbar + nbar^2 n) per iteration and runs on CPU through POT. The embedding is invariant to strong isomorphism. Output: predictor. Read: full text. Tag: support.

**vincentcuaz2021online.** OGDL approximates each graph by a linear combination of GW or FGW atoms, and the vector of atom weights from GW unmixing is the embedding. Atoms learned without supervision. Read: full text. Tag: support.

**xu2020gromovwasserstein.** Xu factorizes graphs as GW barycenters of learned atoms, and the atom weights form a permutation-invariant embedding for clustering. Read: full text. Tag: support.

**xu2023representing.** The journal version of GW factorization. Graph factors and per-graph weights are learned jointly by minimizing reconstruction error, with gradients through the envelope theorem, and the weights give a permutation-invariant representation. The extensions combine GWF with a GNN auto-encoder, add node attributes, and use GWF as a regularizer for semi-supervised graph classification. Read: abstract only. Tag: support.

**schmitz2018wasserstein.** Schmitz et al. learn Wasserstein dictionary atoms so that each datum is a barycenter of the atoms. Unsupervised. Read: full text. Tag: neutral.

**wang2025an.** Wang et al. replace the Wasserstein fit of dictionary learning by unbalanced OT, which makes the learned atoms robust to outliers, and solve it by a hybrid block coordinate descent with a convergence proof that needs no Lipschitz smoothness. Atoms learned without supervision; experiments on MNIST, Olivetti faces and hyperspectral images. Read: abstract only. Tag: neutral.

**chen2020optimal.** OT-GNN computes Wasserstein distances between the GNN node-embedding set of a graph and learned prototype point clouds, and feeds them to a supervised predictor. A noise-contrastive regularizer keeps the prototypes from collapsing. Output: predictor. Read: full text. Tag: support.

**mialon2020a.** OTKE pools kernel features with weights from the entropic transport plan to a trainable reference, which gives a fixed-size embedding; the reference is learned without supervision or with it. Read: full text. Tag: support.

**wang2024graph.** Wang and Fan learn reference distributions end-to-end for graph classification, and compare node-embedding sets to them by MMD. They judge Wasserstein too costly, report that MMD performed better in their tests, and run faster than OT-GNN and TFGW. Read: full text. Tag: oppose.

**zhang2024wasserstein.** WDDL builds a dictionary of graph keys, projects each graph into the dictionary space through a joint Wasserstein and Kron-Gromov-Wasserstein embedding, and optimizes the keys under a Wasserstein discriminant loss that makes keys of one class compact and keys of different classes dispersed. Evaluated on graph classification and cross-modal retrieval. Read: abstract only. Tag: support.

**liu2024structuresensitive.** SS-GDE adapts a base graph dictionary to each input graph by Bernoulli sampling of substructures of the keys, embeds the graph by multi-sensitivity Wasserstein encoding against the adapted dictionary, and trains the whole model for graph classification under a mutual-information objective by variational inference. Read: method section. Tag: support.

**xu2023regularized.** Xu and Cheng unify global pooling operations as regularized OT problems and make the regularization parameters learnable, which gives ROTP layers. They test them on multi-instance learning, graph classification, graph set representation and image classification. The similarity matrices cost O(N^2 D + D^2 N) for N samples of dimension D, and an unrolled layer costs O(KND) for K iterations. Read: method section. Tag: support.

### 4.6 Linearized and sliced embeddings, graph distances and kernels (T6)

**wang2012a.** Wang et al. introduce linear optimal transport for image sets: a template image is computed from the data, each image is approximated by particles, its OT plan to the template gives an isometric linear embedding, and statistics and classification run in that linear space. Applications include nuclear chromatin patterns in cancer cells. Template computed. Read: method section. Tag: neutral.

**kolouri2016sliced.** Kolouri et al. build a positive definite kernel from the sliced Wasserstein distance through a template measure. Output: a kernel. Read: full text. Tag: neutral.

**moosmuller2022linear.** Moosmuller and Cloninger show that the LOT embedding to a fixed reference is exact for shifts and scalings, which gives linear separability of classes generated by those transformations. Read: full text. Tag: support.

**kolouri2020wasserstein.** WEGL embeds node-embedding sets by linear Wasserstein embedding to a fixed reference found by k-means, which needs M transport problems instead of M(M-1)/2. Read: full text. Tag: support.

**naderializadeh2021pooling.** PSWE gives an exact Euclidean embedding of the generalized sliced Wasserstein distance, with trainable slicers and a trainable reference set. Read: full text. Tag: support.

**togninalli2019wasserstein.** WWL computes the Wasserstein distance between Weisfeiler-Lehman node embeddings and uses a Laplacian kernel, positive definite for categorical labels, at cost O(n^3 log n). Read: full text. Tag: neutral.

**petricmaretic2019got.** GOT compares two graphs through the Wasserstein distance between the smooth graph-signal distributions they define, and finds the permutation that minimizes it by a stochastic Bayesian exploration algorithm. It assumes graphs with the same number of vertices, and the naive implementation costs O(N^3) per iteration for the matrix square root. Output: distance, alignment and transport of graph signals. Read: method section. Tag: neutral.

**ma2020transport.** Ma et al. propose pyramid and subgraph graph kernels that apply the L1 Wasserstein distance between eigen-decomposition node embeddings at each level of a multi-resolution pyramid, and a regularized variant whose kernel matrix is positive semidefinite. Their benchmarks include KKI, a brain-network dataset for ADHD classification. Output: a kernel. Read: method section. Tag: support.

**ma2023positive.** Ma et al. define a graph sliced Wasserstein distance between brain functional networks and build on it a sliced Wasserstein graph kernel, which they report as positive definite and faster than graph kernels and graph neural networks, with higher accuracy in classifying brain diseases from fMRI. Output: a kernel. Read: abstract only. Tag: support.

**scholkemper2024a.** Scholkemper et al. embed each node as a probability distribution, model each graph as a Gaussian mixture of its node embeddings, and compare graphs by the Wasserstein distance between the mixtures, with two non-Gaussian node embeddings and faster variants under assumptions on component shape. Unsupervised; classification by k nearest neighbours. Output: a distance. Read: method section. Tag: neutral.

**khorana2025families.** Khorana defines kernels between probability measures on CW complexes from the dual formulation of regularized optimal transport, and uses them to define Gaussian processes over cell complexes. Output: a kernel. Read: method section. Tag: neutral.

**bui2024toward.** Bui and Li classify graphs by case-based reasoning: references are selected by Euclidean distance and refined by an Earth Mover's Distance with concept-centric node weights, and the prediction comes from the most similar reference graphs with explanations. Output: predictor. Read: abstract only. Tag: neutral.

**shifaterabbi2025linear.** Shifat-E-Rabbi et al. classify point sets by nearest LOT subspace with a fixed reference. Read: full text. Tag: neutral.

**rahman2026geometric.** Rahman et al. benchmark LOT nearest-subspace classification under deformation, with 4 to 16 training samples per class. Preprint on SSRN. Read: abstract only. Tag: neutral.

**mahan2024point.** Mahan et al. map point clouds to a reference with input convex neural networks and classify with a DeepSets-style head. Read: full text. Tag: support.

**amir2024fourier.** Amir and Dym give a bi-Lipschitz multiset embedding through Fourier sliced Wasserstein, at cost O(mNd + mN log N). Read: full text. Tag: neutral.

**naderializadeh2025constrained.** CSWE learns slicing directions constrained so that their plans approximate the full transport plan. Read: full text. Tag: support.

### 4.7 Neuroimaging and subject-level applications (T7)

**thual2022aligning.** FUGW aligns the cortical meshes of individual subjects with fused unbalanced GW on geodesic distance matrices, in place of anatomical co-registration. The coupling is the inter-subject correspondence. The FUGW barycenter forms a group template, but its geometry is fixed to fsaverage5 and only the functional part is estimated. Output: alignment. Read: full text. Tag: support.

**feydy2019fast.** Feydy et al. transfer labels from an atlas to a subject's tractogram by multiscale unbalanced transport, with no clustering step. Read: full text. Tag: support.

**gerber2018exploratory.** Gerber et al. compute unbalanced OT from each subject's white and gray matter segmentation to a template, which separates changes in mass from changes in the location of mass, and correlate the resulting mass-allocation and transport-cost images voxel-wise with clinical variables on OASIS. Template fixed. Read: method section. Tag: neutral.

**gerber2023optimal.** Gerber et al. take unbalanced transport features to a template after spatial normalization and correlate them voxel-wise with clinical variables. Template fixed. Read: full text. Tag: neutral.

**mazelet2025unsupervised.** ULOT trains a network to predict FUGW plans between unbalanced graphs, which amortizes the solver, and applies it to fMRI. Read: full text. Tag: support.

**mazelet2026learning.** Mazelet et al. learn an FGW dictionary of fMRI activations across individual cortical geometries with amortized transport plans, so no registration to a template is needed. Dictionary learned without a supervised subject-level loss. Preprint. Read: full text. Tag: support.

**barbarant2026fast.** Barbarant et al. introduce SpectralOT, which embeds each cortical mesh by Laplace-Beltrami eigenmodes aligned in sign across subjects, concatenates them with functional data, and passes the cost to a log-Sinkhorn solver to obtain a vertex coupling between source and target meshes. The coupling transfers signal across subjects before a population decoder is trained, and converges orders of magnitude faster than FUGW. Read: method section. Tag: support.

**wang2025linearized.** Wang et al. treat each patient as a single-cell point cloud and classify patient state from the LOT embedding to a fixed reference. Read: full text. Tag: support.

**pathan2026flowlot.** FlowLOT classifies AML patients from flow cytometry (BLAST-110 and FlowCAP-II) by LOT to a fixed reference plus subspace classification. Preprint. Read: full text. Tag: support.

**gachon2025low.** Gachon et al. quantize multi-patient flow cytometry measurements by a Wasserstein barycenter with shared support, which they show is k-means on the mean measure, then embed each measurement by linearized OT with that barycenter as the reference. A three-component PCA of the embedding feeds a logistic regression that separates positive from negative follow-ups for measurable residual disease in AML. Reference computed. Read: method section. Tag: support.

## 5. Literature Matrix

Themes: T1 optimal transport foundations, entropic OT and Sinkhorn; T2 GW and variants; T3 FGW for structured objects; T4 barycenters; T5 learned dictionaries, templates and references; T6 linearized and sliced embeddings, graph distances and kernels; T7 neuroimaging and subject-level applications.

Column meanings. Coupling: yes when the method keeps a coupling that serves as the correspondence between elements; partial when the coupling is factored, sliced or partial; no when no coupling is kept. Template: none, fixed, computed (a barycenter or template computed from data), learned-unsup (learned with no label), learned-joint (learned jointly with a supervised loss), or not stated. Output: predictor, kernel, embedding, distance, alignment, or theory. Read: full, method or abstract, as in Section 3.4. Quality: High for a full-text or method-section read at a peer-reviewed venue with the method and the cost stated; Medium for an abstract-only read or a preprint record; Low is not used, since sources that would have earned it were excluded under (g).

| Key | Themes | Coupling | Template | Output | Cost stated | Read | Quality | Tag |
|---|---|---|---|---|---|---|---|---|
| villani2009optimal | T1 | yes | none | theory | not stated | method | High | neutral |
| cuturi2013sinkhorn | T1 | yes | none | distance | O(d^2 N) batched | full | High | support |
| peyre2019computational | T1, T2, T4 | yes | none | theory | Sinkhorn complexity | method | High | neutral |
| benamou2015iterative | T1, T4 | yes | computed | distance | per Bregman iteration | full | High | neutral |
| chizat2018scaling | T1 | yes | none | distance | scaling iterations | method | High | support |
| feydy2019interpolating | T1 | yes | none | distance | Sinkhorn | full | High | support |
| luise2018differential | T1 | yes | none | distance | Sinkhorn plus gradient | full | High | support |
| memoli2011gromovwasserstein | T2 | yes | none | distance | nonconvex QP, n_X + n_Y constraints | method | High | support |
| memoli2014the | T2 | yes | none | theory | not stated | full | High | neutral |
| chowdhury2019the | T2 | yes | none | distance | lower bounds | method | High | neutral |
| peyre2016gromovwasserstein | T2, T4 | yes | computed | predictor | O(N1^2 N2 + N2^2 N1) | full | High | support |
| solomon2016entropic | T2 | yes | none | alignment | not stated | method | High | support |
| xu2019gromovwasserstein | T2 | yes | none | alignment | O(M(V^2 D + N V^3)) | method | High | support |
| vayer2019sliced | T2, T6 | partial | none | distance | O(n log n) | full | High | neutral |
| sejourne2021the | T2 | yes | none | distance | O(n^3) time, O(n^2) memory | full | High | support |
| vincentcuaz2021semirelaxed | T2, T5 | yes | learned-unsup | embedding | O(n^2 m + m^2 n) | full | Medium | support |
| scetbon2022lineartime | T2 | partial | none | distance | linear in n | full | High | neutral |
| beier2022on | T2, T6 | yes | fixed | embedding | N plans instead of N^2 | full | High | support |
| zhang2024gromovwasserstein | T2 | yes | none | theory | sample complexity | method | High | neutral |
| rioux2023entropic | T2 | yes | none | theory | O(N^2) per Sinkhorn call | method | Medium | neutral |
| bai2024linear | T2, T6 | partial | fixed | embedding | N plans instead of N^2 | full | Medium | support |
| vayer2019optimal | T3 | yes | none | distance | conditional gradient | full | High | support |
| vayer2020fused | T3, T4 | yes | computed | distance | conditional gradient | full | High | support |
| nguyen2023on | T3, T6 | yes | computed | kernel | embedding dim K + K^2 | full | High | support |
| bai2025fused | T3, T4 | partial | computed | distance | not stated | full | Medium | support |
| piening2026a | T3, T6 | partial | none | distance | O(Ln(r+d) + (Ln + n^2) log n) | full | High | neutral |
| aburidi2025optimal | T3, T7 | yes | none | kernel | not stated | method | High | support |
| ma2023fused | T3, T4 | yes | computed | embedding | rate O(1/t^2) | method | High | neutral |
| qian2024reimagining | T3, T5 | yes | not stated | predictor | NN approximator on GPU | abstract | Medium | support |
| cuturi2014fast | T4 | yes | computed | embedding | per dual iteration | full | High | neutral |
| gramfort2015fast | T4, T7 | yes | computed | embedding | minutes on GPU | full | High | support |
| xu2021learning | T4, T5 | yes | learned-unsup | embedding | O(EK + NK^2) per step | method | High | neutral |
| werenski2024linearized | T4, T6 | no | fixed | embedding | not stated | method | Medium | neutral |
| brogatmotte2022learning | T3, T4, T5 | yes | learned-joint | predictor | FGW barycenter per input | full | High | support |
| vincentcuaz2022template | T3, T5 | yes | learned-joint | predictor | O(n^2 nbar + nbar^2 n) per iteration | full | High | support |
| vincentcuaz2021online | T2, T3, T5 | yes | learned-unsup | embedding | GW unmixing per graph | full | High | support |
| xu2020gromovwasserstein | T2, T4, T5 | yes | learned-unsup | embedding | GW barycenter per graph | full | High | support |
| xu2023representing | T2, T5 | yes | learned-unsup | embedding | not stated | abstract | Medium | support |
| schmitz2018wasserstein | T4, T5 | yes | learned-unsup | embedding | Sinkhorn barycenters | full | High | neutral |
| wang2025an | T1, T5 | yes | learned-unsup | embedding | not stated | abstract | Medium | neutral |
| chen2020optimal | T5 | yes | learned-joint | predictor | Wasserstein per prototype | full | Medium | support |
| mialon2020a | T1, T5 | yes | learned-joint | embedding | one Sinkhorn plan per set | full | Medium | support |
| wang2024graph | T5 | no | learned-joint | predictor | MMD, faster than OT-GNN | full | High | oppose |
| zhang2024wasserstein | T5 | yes | learned-joint | predictor | not stated | abstract | Medium | support |
| liu2024structuresensitive | T5 | yes | learned-joint | predictor | analysed in Sec. IV-E | method | High | support |
| xu2023regularized | T1, T5 | yes | learned-joint | embedding | O(N^2 D + D^2 N), O(KND) | method | High | support |
| wang2012a | T6 | yes | computed | embedding | N plans to the template | method | High | neutral |
| kolouri2016sliced | T6 | no | fixed | kernel | sliced | full | High | neutral |
| moosmuller2022linear | T6 | yes | fixed | embedding | N maps | full | High | support |
| kolouri2020wasserstein | T6 | yes | fixed | embedding | M plans instead of M(M-1)/2 | full | Medium | support |
| naderializadeh2021pooling | T5, T6 | partial | learned-joint | embedding | sorting per slice | full | High | support |
| togninalli2019wasserstein | T6 | yes | none | kernel | O(n^3 log n) | full | High | neutral |
| petricmaretic2019got | T6 | yes | none | distance | O(N^3) per iteration | method | High | neutral |
| ma2020transport | T6 | yes | none | kernel | not stated | method | Medium | support |
| ma2023positive | T6, T7 | partial | none | kernel | reported faster than GNNs | abstract | Medium | support |
| scholkemper2024a | T6 | yes | none | distance | not stated | method | High | neutral |
| khorana2025families | T6 | yes | none | kernel | not stated | method | Medium | neutral |
| bui2024toward | T6 | yes | fixed | predictor | two-phase reference search | abstract | Medium | neutral |
| shifaterabbi2025linear | T6 | yes | fixed | predictor | N maps | full | High | neutral |
| rahman2026geometric | T6 | yes | fixed | predictor | not stated | abstract | Medium | neutral |
| mahan2024point | T5, T6 | yes | fixed | predictor | one ICNN map per set | full | Medium | support |
| amir2024fourier | T6 | no | none | embedding | O(mNd + mN log N) | full | Medium | neutral |
| naderializadeh2025constrained | T5, T6 | partial | learned-joint | embedding | sorting per slice | full | Medium | support |
| thual2022aligning | T2, T3, T7 | yes | computed | alignment | unbalanced Sinkhorn on meshes | full | High | support |
| feydy2019fast | T1, T7 | yes | fixed | alignment | multiscale, GPU | full | High | support |
| gerber2018exploratory | T4, T7 | yes | fixed | embedding | not stated | method | High | neutral |
| gerber2023optimal | T7 | yes | fixed | embedding | unbalanced transport per subject | full | High | neutral |
| mazelet2025unsupervised | T2, T7 | yes | none | alignment | amortized plan prediction | full | High | support |
| mazelet2026learning | T3, T5, T7 | yes | learned-unsup | embedding | amortized plans | full | Medium | support |
| barbarant2026fast | T1, T7 | yes | none | alignment | faster than FUGW | method | High | support |
| wang2025linearized | T6, T7 | yes | fixed | predictor | N maps | full | Medium | support |
| pathan2026flowlot | T6, T7 | yes | fixed | predictor | N maps | full | Medium | support |
| gachon2025low | T4, T6, T7 | yes | computed | predictor | K-means quantization, N maps | method | High | support |

Theme counts, from the Themes column: T1 12, T2 20, T3 13, T4 15, T5 20, T6 26, T7 13. Every theme holds at least 3 sources.

## 6. Identified Gaps

Each gap states what the documented search (queries B1 to B7, S1 to S5, the chaining and forward tracking of Sections 1.3 and 1.4, and the searches of Section 1.7) found.

1. Transport templates learned jointly with a supervised loss are benchmarked on molecules, social graphs and point clouds. Among the 73 included sources, the methods with a learned-joint template (TFGW, Brogat-Motte et al., OT-GNN, OTKE, PSWE, CSWE, WDDL, SS-GDE, ROTP) report no medical subject-level benchmark in the text read; ROTP lists medical image analysis among its multi-instance learning tasks. The medical transport classifiers the searches found (Ma et al. 2020 and 2023 on brain networks, Aburidi and Marcia on drug properties, Gachon et al., FlowLOT and Wang et al. 2025 on patient point clouds) use kernels or a fixed or computed reference. The searches found no study that trains a transport template end-to-end against a clinical label on sets of unequal size.
2. The neuroimaging transport work (FUGW, Gramfort et al., ULOT, the fMRI dictionary of Mazelet et al. 2026, SpectralOT of Barbarant et al.) aligns, averages or decodes across subjects, and none of it trains a subject-level predictor through the coupling. SpectralOT trains its population decoder after alignment. The FUGW group template keeps its geometry fixed to fsaverage5.
3. The clinical set-classification work that the searches found (Wang et al. 2025 single-cell, FlowLOT, Gachon et al. flow cytometry, Gerber et al. 2023) embeds each subject against a fixed reference or a barycenter computed without labels. Among the embedding methods, only PSWE, OTKE and CSWE train the reference.
4. Exact GW and FGW solvers cost cubically in the set size per iteration (TFGW O(n^2 nbar + nbar^2 n), UGW O(n^3), GWL O(NV^3) per outer step). The scalable variants (sliced GW, low-rank GW, linear GW, sliced FGW) give up the full coupling, so the correspondence is partial or lost.
5. Amortized or approximated transport (ULOT, Mazelet et al. 2026, the NN-based FGW approximator of Qian et al.) is the route the searches found to large sets with a full or approximated coupling, and all three date from 2024 to 2026.
6. One included study (Wang and Fan 2024) reports that MMD to learned reference distributions beat Wasserstein-based learned references on graph classification and ran faster. The searches found no study that tests this comparison with unbalanced or entropic couplings on medical sets.

## 7. Recommended Sources by Paper Section

- Introduction, transport as a correspondence between sets: villani2009optimal, peyre2019computational, cuturi2013sinkhorn, memoli2011gromovwasserstein, vayer2019optimal, thual2022aligning.
- Background, entropic and unbalanced transport: villani2009optimal, cuturi2013sinkhorn, benamou2015iterative, chizat2018scaling, feydy2019interpolating, luise2018differential, sejourne2021the.
- Background, GW and FGW: memoli2011gromovwasserstein, memoli2014the, chowdhury2019the, peyre2016gromovwasserstein, solomon2016entropic, xu2019gromovwasserstein, vayer2019optimal, vayer2020fused, vincentcuaz2021semirelaxed, zhang2024gromovwasserstein, rioux2023entropic.
- Templates, barycenters and dictionaries: cuturi2014fast, peyre2016gromovwasserstein, schmitz2018wasserstein, xu2020gromovwasserstein, xu2023representing, vincentcuaz2021online, xu2021learning, werenski2024linearized, wang2025an, ma2023fused.
- Supervised learning through transport to learned templates: vincentcuaz2022template, brogatmotte2022learning, chen2020optimal, mialon2020a, qian2024reimagining, zhang2024wasserstein, liu2024structuresensitive, xu2023regularized, naderializadeh2021pooling, naderializadeh2025constrained, wang2024graph.
- Fixed-length embeddings, kernels and graph distances: wang2012a, moosmuller2022linear, kolouri2020wasserstein, beier2022on, nguyen2023on, bai2024linear, kolouri2016sliced, togninalli2019wasserstein, petricmaretic2019got, ma2020transport, scholkemper2024a, khorana2025families, bui2024toward, amir2024fourier, shifaterabbi2025linear, mahan2024point, rahman2026geometric.
- Scalability: vayer2019sliced, scetbon2022lineartime, piening2026a, bai2025fused, mazelet2025unsupervised, qian2024reimagining.
- Neuroimaging and clinical applications: gramfort2015fast, feydy2019fast, gerber2018exploratory, gerber2023optimal, thual2022aligning, ma2023positive, ma2020transport, mazelet2026learning, barbarant2026fast, wang2025linearized, pathan2026flowlot, gachon2025low, aburidi2025optimal.

## 8. Search Stopping Rules

Saturation needs at least 3 of the 5 conditions. All five are met:

1. Source count: 73 included, against the page minimum of 30 for a literature review and the brief's target of 20. Met.
2. Diminishing returns: the last round (the second forward-tracking pass) added 5 sources to 68, which is 7.4%. Met.
3. Theme saturation: every theme in Section 5 holds at least 3 sources (smallest: T1 with 12). Met.
4. Citation loop closure: every work cited by at least two of the four seeds is included. Memoli 2011 and Peyre et al. 2016 (three seeds each) and Villani 2009, Peyre and Cuturi 2019, Chowdhury and Memoli 2019, Xu et al. 2019, GOT and Xu 2020 (two seeds each) are all in the bibliography. Met.
5. Temporal span: foundational works (Villani 2009, Memoli 2011, Wang et al. 2012, Cuturi 2013) through 2026. Met.

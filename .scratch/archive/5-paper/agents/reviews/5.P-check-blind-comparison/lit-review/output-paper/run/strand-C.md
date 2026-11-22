## Literature Search Report: Strand Group C

Strand group C covers permutation-invariant set and point-cloud encoders used for prediction, and registration-free transport-based fusion in medical imaging. For each method the report records how it handles the missing correspondence between subjects (permutation invariance, a learned set of reference points or a template, or a transport coupling) and what it loses. For each medical imaging study it records the data type, the outcome predicted, and which pipeline step (registration, radiomics feature extraction, lesion segmentation) it removes or still relies on.

### Search Strategy

**Profile and record.** The `Domain evidence profile` row of `settings.md` is `cs_ml`, a member of the profile enum with no `(requested: ...)` suffix, so it resolves to `cs_ml` with no advisory. The profile implies CS / Engineering / Technology; the `Discipline` row is machine learning with medical image analysis as the application setting, which falls inside that set, so no discipline-mismatch advisory is emitted. Under `cs_ml`, archival preprints and conference proceedings are admitted as peer-reviewed-equivalent at the publication-type node; every preprint below is flagged. Materials in hand are none, so Step 0 of the corpus flow sends the search to the 4-layer progressive strategy, and no PRE-SCREENED block is emitted.

**Key concepts.**

- C1, the set or point representation: "permutation invariant", "deep sets", "set transformer", PointNet, "point cloud", "point set", "Janossy pooling", "multiple instance learning", "attention-based pooling", "set embedding", "sliced Wasserstein embedding", "optimal transport kernel embedding".
- C2, transport: "optimal transport", Wasserstein, "earth mover", "Gromov-Wasserstein".
- C3, the medical imaging setting: MRI, "magnetic resonance", cortical, "cortical surface", tractography, "white matter", lesion, nodule, metastases, aneurysm, vessel, neuroanatomy, fMRI.
- C4, the absent correspondence: "registration-free", "without registration", "correspondence-free", "native space", alignment, atlas, "inter-subject".
- C5, the prediction task: prediction, classification, regression, survival, outcome, fusion.

**Databases.** Four indexes answered queries in this run, each through its public API: arXiv (export API), PubMed (NCBI E-utilities esearch), OpenAlex (works endpoint, filter `title_and_abstract.search`), and Semantic Scholar (graph API bulk search). Citation chaining used OpenAlex reference and citing-work lists. Scopus, Web of Science, IEEE Xplore and the ACM Digital Library, named in the `Sources` row, need a subscription or an API key that this run does not hold, so no query was run against them; MICCAI, IPMI, ISBI, IEEE TMI and Medical Image Analysis records were reached through PubMed, OpenAlex and Semantic Scholar, which index them (included items from MICCAI 2018, 2021, 2022, 2023, IPMI 2015 and 2019, ISBI 2020 and Medical Image Analysis 2023 and 2024 came through these indexes). DBLP answered every API request of this run with a bot-check page, so no DBLP count exists.

**Date range and filters.** Inclusion window 2013 to 2026, applied as `2013:2026[dp]` in PubMed, `from_publication_date:2013-01-01` in OpenAlex and `year=2013-2026` in Semantic Scholar. The arXiv API has no date filter, so the arXiv counts below cover all years and the window was applied at screening. Foundational works older than 2013 were admitted through citation chaining (criterion (b)). Language English. No peer-review filter, under the `cs_ml` profile.

**Layer 1, Boolean search.** Each count is the total the index returned for the query string as written. Counts are totals before deduplication.

| Tag | Index | Query string | Hits |
|---|---|---|---|
| A1 | arXiv | `abs:"permutation invariant" AND (abs:"set" OR abs:"point cloud") AND (abs:pooling OR abs:"set function" OR abs:encoder)` | 124 |
| A2 | arXiv | `(abs:"sliced Wasserstein embedding" OR abs:"optimal transport kernel embedding" OR abs:"Janossy pooling" OR abs:"induced point" OR abs:"set transformer")` | 337 |
| A3 | arXiv | `(abs:"optimal transport" OR abs:"Wasserstein") AND (abs:"set embedding" OR abs:"pooling" OR abs:"set representation" OR abs:"permutation invariant") AND (cat:cs.LG OR cat:stat.ML)` | 60 |
| A4 | arXiv | `(abs:"multiple instance learning") AND (abs:attention OR abs:pooling) AND (abs:permutation OR abs:"set") AND (cat:cs.LG OR cat:stat.ML OR cat:cs.CV)` | 78 |
| A5 | arXiv | `(abs:"optimal transport" OR abs:"Wasserstein" OR abs:"point cloud" OR abs:"permutation invariant" OR abs:"set transformer") AND (abs:"registration-free" OR abs:"without registration" OR abs:"registration free" OR abs:"no registration" OR abs:"correspondence-free")` | 974 |
| A6 | arXiv | `(abs:"set transformer" OR abs:"deep sets" OR abs:"permutation invariant" OR abs:"multiple instance") AND (abs:lesions OR abs:"lesion") AND (cat:eess.IV OR cat:cs.CV OR cat:cs.LG)` | 29 |
| P1 | PubMed | `("point cloud"[tiab] OR "point set"[tiab] OR PointNet[tiab] OR "permutation invariant"[tiab] OR "deep sets"[tiab] OR "set transformer"[tiab]) AND (MRI[tiab] OR "magnetic resonance"[tiab] OR cortical[tiab] OR tractography[tiab] OR "white matter"[tiab] OR lesion*[tiab] OR brain[tiab]) AND (classification[tiab] OR prediction[tiab] OR predict*[tiab] OR regression[tiab])` | 48 |
| P2 | PubMed | `("optimal transport"[tiab] OR Wasserstein[tiab] OR "earth mover*"[tiab]) AND (MRI[tiab] OR "magnetic resonance"[tiab] OR cortical[tiab] OR tractography[tiab] OR "white matter"[tiab] OR lesion*[tiab] OR brain[tiab] OR shape[tiab] OR surface[tiab]) AND (classification[tiab] OR prediction[tiab] OR predict*[tiab] OR regression[tiab] OR fusion[tiab])` | 150 |
| P3 | PubMed | `("optimal transport"[tiab] OR Wasserstein[tiab] OR "Gromov"[tiab]) AND (cortical[tiab] OR cortex[tiab] OR tract*[tiab] OR "white matter"[tiab] OR vessel*[tiab] OR "shape analysis"[tiab] OR connectom*[tiab] OR fMRI[tiab]) AND (registration-free[tiab] OR "without registration"[tiab] OR alignment[tiab] OR correspondence[tiab] OR atlas[tiab] OR subjects[tiab]) NOT (GAN[tiab] OR "generative adversarial"[tiab] OR EEG[tiab])` | 27 |
| P4 | PubMed | `("multiple instance learning"[tiab] OR "attention-based pooling"[tiab] OR "set-based"[tiab] OR "bag of lesions"[tiab]) AND (MRI[tiab] OR CT[tiab] OR "computed tomography"[tiab]) AND (lesion*[tiab] OR nodule*[tiab] OR region*[tiab]) AND (prediction[tiab] OR classification[tiab] OR survival[tiab] OR outcome[tiab])` | 39 |
| P5 | PubMed | `("registration-free"[tiab] OR "without registration"[tiab] OR "registration free"[tiab] OR "correspondence-free"[tiab] OR "native space"[tiab]) AND ("point cloud"[tiab] OR "geometric deep learning"[tiab] OR "optimal transport"[tiab] OR "graph neural network"[tiab] OR "cortical surface"[tiab] OR tractography[tiab]) AND (prediction[tiab] OR classification[tiab] OR parcellation[tiab] OR phenotype*[tiab])` | 10 |
| O1 | OpenAlex | `("point cloud" OR PointNet OR "permutation invariant") AND (brain OR cortical OR tractography OR "white matter" OR neuroanatomy OR aneurysm OR vessel) AND (prediction OR classification OR diagnosis)` | 213 |
| O2 | OpenAlex | `("optimal transport" OR Wasserstein OR "Gromov-Wasserstein") AND (MRI OR "cortical surface" OR tractography OR fMRI OR neuroimaging) AND (alignment OR fusion OR correspondence OR "across subjects" OR "inter-subject")` | 63 |
| O3 | OpenAlex | `("set transformer" OR "deep sets" OR "multiple instance" OR "permutation invariant" OR "attention pooling") AND (multifocal OR "multiple lesions" OR metastases OR "multiple nodules" OR "lesion-level") AND (outcome OR survival OR prediction OR prognosis)` | 33 |
| O4 | OpenAlex | `"optimal transport" AND ("whole slide" OR histopathology OR pathology) AND (genomic OR multimodal) AND survival` | 16 |
| S1 | Semantic Scholar | `("permutation invariant" \| "deep sets" \| "set transformer" \| "Janossy pooling" \| "sliced Wasserstein embedding" \| "optimal transport embedding") + (set \| "point cloud") + (pooling \| encoder \| aggregation)` | 296 |
| S2 | Semantic Scholar | `("point cloud" \| PointNet \| "permutation invariant" \| "set transformer" \| "optimal transport" \| Wasserstein) + (tractography \| "cortical surface" \| "white matter" \| aneurysm \| lesions \| neuroanatomy) + (prediction \| classification)` | 100 |

Hits per index: arXiv 1,602; PubMed 274; OpenAlex 325; Semantic Scholar 396; total 2,597. A5 returned 974 records, above the page's tightening threshold of 500, and its top 40 records by relevance were almost all point-cloud registration methods; the medical registration-free question was therefore taken up by the narrower PubMed query P5 (10 hits) and OpenAlex query O2 (63 hits). A2 returned sparse Gaussian process papers through the phrase "induced point"; those records were excluded at title screening.

**Records screened per query.** Each index returns records ranked by relevance (Semantic Scholar bulk search ranked by citation count). The titles screened per query were the top 30 (A1, A2, A4, A6), top 40 (A3, A5, P1, P3, P4, O1, O2, O3, S1, S2), top 60 (P2), top 20 (O4) and all 10 (P5): 610 records from Layer 1. Records ranked below these cut-offs were not screened. The saturation evidence below (Layers 2 to 4 adding no record that Layer 1 had not reached, apart from the foundational 1997 paper) is the basis for treating the cut-offs as sufficient; the counts of the unscreened tail are the difference between the hit counts and the 610.

**Layer 2, citation chaining (backward).** Reference lists, from OpenAlex, of five core papers: Lee et al. 2018 (Set Transformer, 39 references), Mialon et al. 2020 (OTKE, 28), Chen et al. 2022 (tract point clouds, 32), Chen et al. 2021 (AMINN, 24) and Gutierrez-Becker and Wachinger 2018 (17): 140 references. Counting titles that appear in two or more of the five lists gave four works, each in two lists: PointNet (Gutierrez-Becker 2018 and Set Transformer; Chen 2022 cites PointNet++), Ilse et al. 2018 (Set Transformer and AMINN), Maron and Lozano-Perez 1997 (Set Transformer and AMINN) and FreeSurfer (Gutierrez-Becker 2018 and Chen 2022). No work reached the page's "must include" threshold of three. PointNet and Ilse et al. were already candidates; Maron and Lozano-Perez 1997 predates the window and was added as a foundational work; FreeSurfer is a processing pipeline in the scope of strand group D and is not included here.

**Layer 3, forward tracking.** Citing works from 2023 on, from OpenAlex, of Gutierrez-Becker 2018 (7 citing works), Chen 2022 (19) and Mialon 2020 (41): 67 records. This layer added TractCloud, PANTHER and the pooling comparison of Kothapalli et al. as candidates, and the tract-shape follow-ups listed under exclusions. No foundational paper in the set is without citing work since 2023 among those tracked.

**Layer 4, semantic search.** Semantic Scholar recommendations for Chen 2022 (30 records) and Mialon 2020 (30 records): 60 records. None passed title screening as a new candidate: the 30 records for Chen 2022 were tractography and white matter studies without a set or transport encoder, and the 30 for Mialon 2020 were 2026 preprints on attention, retrieval and in-context learning. Overlap of Layer 4 candidates with Layers 1 to 3 is total in the sense that Layer 4 produced no candidate outside them, which meets the page's saturation signal.

### Coverage Distribution Advisory

Dimensions with known values for all 40 included sources were assessed.

- Time distribution, by the year of the cited record: 1997 (1), 2013 to 2016 (2), 2017 to 2019 (10), 2020 to 2022 (16), 2023 to 2026 (11). No bucket reaches 70%. Sources from 2021 to 2026: 22 of 40 (55%).
- Methodological distribution: computational method papers 37 of 40, benchmark or comparison studies 3 of 40 (Kothapalli et al. 2023, Bazeille et al. 2021, Fawaz et al. 2021).

DISTRIBUTIONAL_SKEW_ADVISORY:
- Dimension: methodological distribution
- Concentration: computational method paper = 37/40 (93%)
- Advisory: This is a coverage-distribution signal, not a defect. Consider whether the paper's RQ warrants broader periods, sites, methods, or venue families.
- Search response: no expansion; the strand asks which methods predict from non-aligned data, so method papers are the expected unit, and the three benchmark studies are kept for the comparisons they report.

- Venue tier distribution: 16 of 40 entries are cited by an arXiv identifier. For 10 of them Semantic Scholar or OpenAlex named a conference (NeurIPS 2, ICML 3, ICLR 5); Semantic Scholar named the GRaM workshop for Kothapalli et al. 2023; no index queried named a venue for Ilse et al. 2018; Cheng and Xu 2022, Chen and Martel 2022, Mahan et al. 2024 and Mazelet et al. 2026 are preprints, as is Fawaz et al. 2021 (bioRxiv). By venue family: NeurIPS 6, ICLR 5, MICCAI and its workshops 5, IPMI 3, ICML 3, CVPR and ICCV 3, Medical Image Analysis 2, ISBI 1, other journals 5 (ACM Transactions on Graphics, NeuroImage, Journal of NeuroInterventional Surgery, European Radiology, Journal of Mathematical Imaging and Vision), preprints and workshop 6, venue not named 1. No family reaches 70%.
- Geographic distribution: study sites are not stated for most method papers, so this dimension is omitted.

### Screening Results

- Initial hits (Layer 1 totals before deduplication): 2,597 (arXiv 1,602; PubMed 274; OpenAlex 325; Semantic Scholar 396).
- Records screened by title, and by abstract where the title left relevance open: 877 (610 from Layer 1, 140 from Layer 2, 67 from Layer 3, 60 from Layer 4), with duplicates across queries and layers counted once per appearance.
- After title/abstract screening (Phase A, Include or Maybe): 49 candidates.
- After full-text assessment (Phase B): 40.
- Final included sources: 40.

Phase B reading depth: for 36 of the 40 the method sections were read in a full text fetched in this run (arXiv HTML or PDF, a NeurIPS proceedings PDF, a bioRxiv PDF, or a Europe PMC full text); for Su et al. 2015 and Dadashkarimi et al. 2023 the method sections were read in the PubMed Central author manuscript; for Luo et al. 2022 and Zhang et al. 2020 (glioblastoma subregions) only the structured abstract could be read, since no open full text was found in arXiv, OpenAlex, Semantic Scholar or Europe PMC. These two are marked in their entries and carry Medium or Low quality.

Excluded at Phase B (9), with the criterion:

- Zhang, Wan and Zhang 2020, "Transport-Based Joint Distribution Alignment for Multi-site Autism Spectrum Disorder Diagnosis Using Resting-State fMRI" (doi 10.1007/978-3-030-59713-9_43): (g), no full text and no abstract in any index queried (OpenAlex, Semantic Scholar, Crossref, Europe PMC, PubMed).
- Naderializadeh et al., "Set Representation Learning with Generalized Sliced-Wasserstein Embeddings" (arXiv 2103.03892): an earlier arXiv version by the same author group of the included NeurIPS paper "Pooling by Sliced-Wasserstein Embedding" (a judgment from the matching author list and method); the proceedings version is the one included.
- "Improved Brain Age Estimation With Slice-Based Set Networks" (arXiv 2102.04438): the set is the ordered slices of one volume, so the method does not address missing correspondence between subjects.
- "The Shape of the Brain's Connections Is Predictive of Cognitive Performance" (doi 10.1002/hbm.70166), "Fiber Tract Shape Measures Inform Prediction of Non-Imaging Phenotypes" (arXiv 2303.09124) and TractoSCR (doi 10.3389/fnins.2024.1411797): each abstract states an atlas-based fiber cluster parcellation that gives every subject the same clusters, with no set or transport encoder; these are registration-based predictors in the scope of strand group D.
- DeepMultiConnectome (doi 10.1016/j.neuroimage.2026.121765): its abstract describes streamline classification into connected regions to build a connectome, with no statement about registration or subject-level outcome beyond test-retest and "predictive performance"; the registration-free point-cloud tractography line is represented by TractCloud.
- TractShapeNet (doi 10.1109/isbi60581.2025.10981095): it computes shape measures, with no outcome prediction (criterion (e)).
- Siamese-Transport Domain Adaptation (doi 10.1109/JBHI.2023.3332419): the transport acts on feature distributions across scanner domains of whole 3D volumes; the spatial mode is the same image grid for every subject, so it does not bear on missing spatial correspondence.

Excluded at Phase A, by kind (the remaining 828 screened records): off-topic titles (generative adversarial networks with a Wasserstein loss, EEG transfer learning, quantum codes, text and recommendation set models), point-cloud registration and segmentation methods (criterion (f)), intracranial aneurysm segmentation papers without outcome prediction, histopathology MIL papers whose bag is patches of one slide with no transport or reference-set mechanism beyond those already included, and records outside 2013 to 2026 without a foundational role.

### Annotated Bibliography

Stance tags: "supports" means the source supports the strand's claim that subject-level prediction is possible without registering subjects to a common space; "opposes" means the source shows a cost of doing so or relies on registration in a way that limits that claim; "neutral" means the source supplies a definition or mechanism without taking that position.

#### A. Permutation-invariant pooling

### Maron and Lozano-Perez (1997). A Framework for Multiple-Instance Learning.
- **Type**: Conference paper (NIPS 10).
- **Method**: Defines learning from labeled bags of instances, where a bag is positive if one of its instances falls within the concept, and proposes Diverse Density.
- **Key Findings**: Applies the framework to person description from image bags, stock selection and drug activity prediction.
- **Relevance**: Source of the bag-label formulation that the medical lesion-set studies (AMINN, injective MIL pooling, glioblastoma subregions) inherit; correspondence between instances is not needed because the label is a function of the bag.
- **Correspondence**: permutation invariance. **Loses**: any relation among instances; the positive-if-any assumption is one fixed aggregation.
- **Quality**: Medium; foundational, cited by two of the five core papers in Layer 2, with small datasets by current standards.
- **Potential Use**: Background on multiple-instance learning.
- **Stance**: neutral.

### Zaheer et al. (2017). Deep Sets.
- **Type**: Conference paper (NeurIPS 2017), cited by its arXiv identifier.
- **Method**: Theorem 2 states that a function on sets from a countable universe is permutation invariant if and only if it can be written as rho(sum over x of phi(x)); for uncountable universes the authors prove it only for sets of fixed size. The DeepSets model replaces phi and rho by neural networks, and Lemma 3 gives the permutation-equivariant layer.
- **Key Findings**: The sum-decomposition architecture is applied to set-level regression, anomaly detection and point-cloud classification.
- **Relevance**: The template for every pooled set encoder in this strand.
- **Correspondence**: permutation invariance by sum pooling. **Loses**: relations between elements are not modelled before pooling.
- **Quality**: High.
- **Potential Use**: Definitions; the baseline that later sections compare against.
- **Stance**: supports.

### Qi et al. (2017a). PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation.
- **Type**: Conference paper (CVPR 2017).
- **Method**: Each point is transformed by a shared network and the features are aggregated by max pooling, "a single symmetric function"; two joint alignment networks predict a spatial and a feature transform to map inputs to a canonical pose. A theorem shows approximation of continuous set functions with respect to the Hausdorff distance.
- **Key Findings**: Classification and segmentation of point clouds without voxelization or ordering.
- **Relevance**: The encoder used, directly or in its hierarchical form, by the included point-cloud medical studies whose method sections were read (Gutierrez-Becker 2018, Chen 2022, Chen 2024, TractCloud, Vosylius 2020, Fawaz 2021).
- **Correspondence**: permutation invariance plus a learned rigid canonicalization. **Loses**: the paper itself names "interaction among points" and local structure as needed, and PointNet++ states that "by design PointNet does not capture local structure induced by the metric".
- **Quality**: High; cited by two of the five chained cores.
- **Potential Use**: Methods background; medical point-cloud section.
- **Stance**: supports.

### Wagstaff et al. (2019). On the Limitations of Representing Functions on Sets.
- **Type**: Conference paper (ICML 2019), cited by its arXiv identifier.
- **Method**: Analyses sum-decomposition and shows that the earlier universality argument needs highly discontinuous mappings; with continuous mappings, a latent dimension at least as large as the maximum number of input elements is necessary and sufficient for universal representation.
- **Key Findings**: Fixed-width sum pooling cannot represent all continuous set functions once set size exceeds the latent width; the same concern applies in part to max pooling.
- **Relevance**: Quantifies what pure pooling loses, which matters for sets of thousands of points (tracts, surfaces) pooled into a fixed vector.
- **Correspondence**: analysis of permutation invariance. **Loses**: the paper's subject.
- **Quality**: High.
- **Potential Use**: Discussion of limits.
- **Stance**: opposes (limits of pooled encoders).

### Murphy et al. (2018). Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs.
- **Type**: Conference paper (ICLR 2019), cited by its arXiv identifier.
- **Method**: Expresses a permutation-invariant function "as the average of a permutation-sensitive function applied to all reorderings of the input sequence", made tractable by canonical orderings, k-ary dependencies and permutation sampling (pi-SGD).
- **Key Findings**: k-ary Janossy pooling recovers Deep Sets at k = 1 and models higher-order interactions as k grows, at a cost that grows with |h|!/(|h|-k)!.
- **Relevance**: A principled route between sum pooling and full interaction modelling.
- **Correspondence**: permutation invariance by symmetrization. **Loses**: exact symmetrization is intractable; the approximations trade invariance or interaction order for cost.
- **Quality**: High.
- **Potential Use**: Methods background.
- **Stance**: neutral.

### Ilse, Tomczak and Welling (2018). Attention-based Deep Multiple Instance Learning.
- **Type**: Conference paper, cited by its arXiv identifier.
- **Method**: Casts MIL as learning a Bernoulli bag label, applies the fundamental theorem of symmetric functions to obtain a three-step model (instance embedding, permutation-invariant MIL pooling, bag classifier) and proposes attention-based pooling, a learned weighted average whose weights indicate key instances.
- **Key Findings**: Evaluated on MNIST-bags and two histopathology datasets; the attention weights localize instances that drive the bag label.
- **Relevance**: The pooling used in the attention variant of AMINN and in most later medical MIL work.
- **Correspondence**: permutation invariance. **Loses**: instances are assumed to have "neither ordering nor dependency", so spatial relations among instances are dropped.
- **Quality**: High.
- **Potential Use**: Methods background; lesion-set section.
- **Stance**: supports.

### Amir and Dym (2024). Fourier Sliced-Wasserstein Embedding for Multisets and Measures.
- **Type**: Conference paper (ICLR, per OpenAlex and Semantic Scholar), cited by its arXiv identifier.
- **Method**: Embeds multisets and measures on R^d into Euclidean space so that the sliced Wasserstein distance is approximately preserved; the embedding is injective on measures and bi-Lipschitz on multisets at output dimension roughly 2Nd, N being the maximal multiset size.
- **Key Findings**: The paper states that sum- and max-pooling are provably not bi-Lipschitz and in many cases not injective, that an architecture that cannot separate two distinct multisets cannot approximate a function that distinguishes them, and that no bi-Lipschitz Euclidean embedding of distributions exists.
- **Relevance**: A transport-based pooling with stated metric guarantees that pure pooling lacks.
- **Correspondence**: permutation invariance through a transport-distance-preserving embedding. **Loses**: output dimension must scale with N for the guarantees.
- **Quality**: High.
- **Potential Use**: Discussion of injective set embeddings.
- **Stance**: supports.

### Kothapalli et al. (2023). Equivariant vs. Invariant Layers: A Comparison of Backbone and Pooling for Point Cloud Classification.
- **Type**: Preprint (arXiv 2306.05553).
- **Method**: Benchmark of permutation-equivariant backbones crossed with permutation-invariant global poolings on three point-cloud classification datasets.
- **Key Findings**: Transport-based or attention-based poolings "can significantly boost the performance of simple backbones, but the benefits diminish for more complex backbones"; pooling choice can matter more than backbone width and depth; pairs of poolings help a fixed backbone.
- **Relevance**: Evidence on where the pooling layer matters, relevant to small medical cohorts.
- **Correspondence**: compares pooling mechanisms. **Loses**: not applicable.
- **Quality**: Medium (preprint benchmark on non-medical data).
- **Potential Use**: Discussion of design choices.
- **Stance**: neutral.

#### B. Encoders that model relations between elements

### Qi et al. (2017b). PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space.
- **Type**: Conference paper (NeurIPS 2017), cited by its arXiv identifier.
- **Method**: Set abstraction levels of sampling, grouping by neighborhood balls and a mini-PointNet per local region, stacked into a hierarchy, with multi-scale grouping for non-uniform sampling density.
- **Key Findings**: Captures local structure that PointNet misses and generalizes better to complex scenes.
- **Relevance**: The best-performing architecture in two neonatal cortical surface studies included here.
- **Correspondence**: permutation invariance within and across local regions, with no cross-subject correspondence. **Loses**: neighbourhoods depend on coordinates, so a global pose difference between subjects changes the input; no explicit rotation invariance.
- **Quality**: High.
- **Potential Use**: Methods background; cortical surface section.
- **Stance**: supports.

### Wang et al. (2019). Dynamic Graph CNN for Learning on Point Clouds.
- **Type**: Journal article (ACM Transactions on Graphics).
- **Method**: EdgeConv builds a k-nearest-neighbour graph, recomputed in feature space at each layer, and learns edge features between a point and its neighbours, keeping invariance to neighbour order.
- **Key Findings**: The authors argue that treating points independently at local scale "neglects the geometric relationships among points"; EdgeConv improves classification and segmentation on ModelNet40, ShapeNetPart and S3DIS.
- **Relevance**: The relational alternative to pooled encoders; used as a backbone in tractography point-cloud work.
- **Correspondence**: permutation invariance. **Loses**: quadratic neighbour search cost; no cross-subject template.
- **Quality**: High.
- **Potential Use**: Methods background.
- **Stance**: supports.

### Lee et al. (2018). Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks.
- **Type**: Conference paper (ICML 2019), cited by its arXiv identifier.
- **Method**: Self-attention blocks (SAB) model pairwise and higher-order interactions; induced set attention blocks (ISAB) route attention through m trainable inducing points, reducing cost from quadratic to linear in set size; pooling by multihead attention (PMA) attends from k learnable seed vectors.
- **Key Findings**: The authors state that in a set pooling operation that processes every element independently "some information regarding interactions between elements has to be necessarily discarded", and the attention blocks recover it.
- **Relevance**: Its inducing points and seed vectors are a learned set of reference points; used for multiple pulmonary nodules (Yang et al. 2020).
- **Correspondence**: permutation invariance with learned reference points (inducing points, seeds). **Loses**: geometry enters only through the element features; no positional structure unless coordinates are features.
- **Quality**: High.
- **Potential Use**: Methods background; reference-set section.
- **Stance**: supports.

### Baek, Kang and Hwang (2021). Accurate Learning of Graph Representations with Graph Multiset Pooling.
- **Type**: Conference paper (ICLR 2021), cited by its arXiv identifier.
- **Method**: Treats graph readout as multiset encoding; Graph Multiset Pooling attends from k seed vectors to node features with keys computed by a graph network, and the pooling is shown to be as powerful as the Weisfeiler-Lehman test under injectivity conditions.
- **Key Findings**: Sum or average readouts treat all nodes equally "without consideration of their task relevance, and any structural dependencies among them"; node-drop pooling loses nodes and node-clustering pooling is dense and costly.
- **Relevance**: The graph-level readout for a graph whose nodes are regions.
- **Correspondence**: permutation invariance with learned seeds. **Loses**: node identity across subjects is not used, which is a loss when regions do correspond.
- **Quality**: High.
- **Potential Use**: Graph-readout section.
- **Stance**: supports.

#### C. Learned reference sets, templates and prototypes

### Mialon et al. (2020). A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention.
- **Type**: Conference paper (ICLR 2021), cited by its arXiv identifier.
- **Method**: Embeds each element in a reproducing kernel Hilbert space and pools with weights given by the entropic transport plan, computed by Sinkhorn's algorithm, between the input set and a trainable reference; the reference is learned without labels (K-means style) or with supervision; multiple references act like attention heads; positional information is added by position smoothing.
- **Key Findings**: A fixed-size embedding for sets of varying size, with state-of-the-art results on protein fold recognition and chromatin profile detection.
- **Relevance**: The prototype for transport-based pooling against a learned reference, which PANTHER and MMP cite as the basis of their prototypes.
- **Correspondence**: transport coupling to a learned reference set. **Loses**: element positions are lost unless encoded; the reference size bounds the resolution of the summary.
- **Quality**: High.
- **Potential Use**: Reference-set section.
- **Stance**: supports.

### Naderializadeh et al. (2021). Pooling by Sliced-Wasserstein Embedding.
- **Type**: Conference paper (NeurIPS 2021), cited by its proceedings URL.
- **Method**: Treats set elements as samples of a distribution and builds an end-to-end trainable Euclidean embedding of the (generalized) sliced-Wasserstein distance from Monge maps between slices of the input and of trainable reference sets, with trainable slicers.
- **Key Findings**: Outperforms other set-representation methods on point-cloud, graph and image classification, per the paper's abstract.
- **Relevance**: A transport pooling that reduces the transport problem to one-dimensional sorting, linear in set size per slice.
- **Correspondence**: transport coupling (per slice) to learned reference sets. **Loses**: slicing discards joint structure that the slices do not capture; positions only as features.
- **Quality**: High.
- **Potential Use**: Reference-set section.
- **Stance**: supports.

### Kolouri et al. (2020). Wasserstein Embedding for Graph Learning.
- **Type**: Conference paper (ICLR 2021), cited by its arXiv identifier.
- **Method**: Computes node embeddings, then Monge maps from a reference distribution to each graph's node embedding distribution, giving a fixed-size linear Wasserstein embedding; the reference is the K-means centroids of all node embeddings.
- **Key Findings**: Graph-level prediction with cost linear in the number of graphs; in the appendix, a K-means reference and a normal reference gave no statistically significant difference on ogbg-molhiv.
- **Relevance**: The linear optimal transport route to a template-based readout.
- **Correspondence**: transport coupling to a fixed reference. **Loses**: graph structure enters only through the node embeddings.
- **Quality**: High.
- **Potential Use**: Graph-readout section.
- **Stance**: supports.

### Vincent-Cuaz et al. (2022). Template Based Graph Neural Network with Optimal Transport Distances.
- **Type**: Conference paper (NeurIPS 2022).
- **Method**: Represents a graph by its vector of fused Gromov-Wasserstein distances to a set of learnable template graphs, an embedding layer that "encodes simultaneously feature and structure dissimilarities by solving a soft graph-matching problem".
- **Key Findings**: The distance-to-templates layer has strong discriminative power when fed to a classifier.
- **Relevance**: Learned templates with a transport coupling that uses structure, the closest graph-level analogue of a learned atlas.
- **Correspondence**: transport coupling (fused Gromov-Wasserstein) to learned templates. **Loses**: cost of one FGW problem per template per graph.
- **Quality**: High.
- **Potential Use**: Graph-readout and template section.
- **Stance**: supports.

### Mahan, Moosmuller and Cloninger (2024). Point Cloud Classification via Deep Set Linearized Optimal Transport.
- **Type**: Preprint (arXiv 2401.01460).
- **Method**: Learns transport maps from a shared fixed reference distribution to each point cloud with input convex neural networks, so that L2 distances between maps approximate Wasserstein-2 distances, and trains a discriminator that weights the samples to give a permutation-invariant classifier.
- **Key Findings**: Reports advantages over the standard deep set approach on a flow cytometry dataset with few labelled point clouds.
- **Relevance**: Linear optimal transport embedding of whole point clouds.
- **Correspondence**: transport coupling to a fixed reference. **Loses**: approximation holds "under certain assumptions" stated in the paper.
- **Quality**: Medium.
- **Potential Use**: Reference-set section.
- **Stance**: supports.

### Shifat-E-Rabbi et al. (2025). Linear Optimal Transport Subspaces for Point Set Classification.
- **Type**: Journal article (Journal of Mathematical Imaging and Vision).
- **Method**: Linear optimal transport transform of point sets, giving a convex data space for sets under affine deformations, classified by a nearest-subspace rule.
- **Key Findings**: Label efficiency, non-iterative training and no hyper-parameter tuning, with accuracy competitive with state-of-the-art point-set classifiers, per the abstract and introduction read in the arXiv version.
- **Relevance**: Handles a deformation class explicitly in the transport embedding, which relates to residual misalignment between subjects.
- **Correspondence**: transport coupling to a reference. **Loses**: designed for affine deformations, not general non-rigid variation.
- **Quality**: Medium.
- **Potential Use**: Reference-set section.
- **Stance**: supports.

### Cheng and Xu (2022). Revisiting Global Pooling through the Lens of Optimal Transport.
- **Type**: Preprint (arXiv 2201.09191).
- **Method**: Shows that most global pooling methods, mean and max pooling and learnable ones such as DeepSet, attention pooling and Set Transformer pooling among the cases discussed, are special cases of an unbalanced optimal transport problem; makes its parameters learnable (UOT-Pooling) and implements the layer with Sinkhorn scaling or Bregman ADMM.
- **Key Findings**: UOT-Pooling imitates conventional poolings or improves on them in multi-instance learning, graph classification and image classification.
- **Relevance**: A unifying account of pooling as transport, linking sections A and C.
- **Correspondence**: transport coupling inside the pooling. **Loses**: no cross-subject reference.
- **Quality**: Medium.
- **Potential Use**: Methods background.
- **Stance**: neutral.

### Song et al. (2024a). Morphological Prototyping for Unsupervised Slide Representation Learning in Computational Pathology (PANTHER).
- **Type**: Conference paper (CVPR 2024).
- **Method**: Models the patch embeddings of a whole-slide image as a Gaussian mixture whose components are morphological prototypes; the estimated mixture weights, means and covariances form the slide representation; section 3.1.1 shows that transport aggregation to prototypes is a special case with uniform prototype weights, whereas PANTHER estimates the weights.
- **Key Findings**: On 13 datasets of subtyping and survival, PANTHER "outperforms or is on par with supervised MIL baselines".
- **Relevance**: Subject-level prediction from a set of patches with no correspondence across slides; the prototypes are a learned reference set.
- **Correspondence**: learned reference set (prototypes) with soft assignment. **Loses**: patch positions do not enter the slide representation; the paper itself names spatial heterogeneity and context as features of "panoramic" tasks.
- **Quality**: High.
- **Potential Use**: Reference-set section; pathology application.
- **Stance**: supports.

### Song et al. (2024b). Multimodal Prototyping for cancer survival prediction (MMP).
- **Type**: Conference paper (ICML 2024), cited by its arXiv identifier.
- **Method**: Summarizes each slide by 16 to 32 morphological prototypes from a Gaussian mixture and the transcriptome by 50 pathway prototypes, then fuses the two token sets with a Transformer; the paper establishes a connection between transport cross-alignment and Transformer cross-attention.
- **Key Findings**: Evaluated on six cancer cohorts for survival.
- **Relevance**: Multimodal fusion of sets of different sizes per subject.
- **Correspondence**: learned reference sets per modality. **Loses**: spatial layout of patches.
- **Quality**: High.
- **Potential Use**: Multimodal fusion section.
- **Stance**: supports.

#### D. Transport couplings between subjects or modalities

### Xu and Chen (2023). Multimodal Optimal Transport-based Co-Attention Transformer with Global Structure Consistency for Survival Prediction (MOTCat).
- **Type**: Conference paper (ICCV 2023).
- **Method**: Replaces dense co-attention between histology patch instances and genomic instances by a transport plan whose marginal constraints enforce a trade-off of instances within each modality; solved over micro-batches for the size of whole-slide images.
- **Key Findings**: Higher concordance index than prior multimodal methods over five TCGA cohorts (BLCA, BRCA, UCEC, GBMLGG, LUAD per the paper).
- **Relevance**: A transport coupling between two sets of different sizes per subject, used directly for an outcome.
- **Correspondence**: transport coupling between modalities within a subject. **Loses**: patch positions enter only through the patch features.
- **Quality**: High.
- **Potential Use**: Multimodal fusion section.
- **Stance**: supports.

### Gramfort, Peyre and Cuturi (2015). Fast Optimal Transport Averaging of Neuroimaging Data.
- **Type**: Conference paper (IPMI 2015).
- **Method**: Kantorovich means of non-normalized measures, linked to entropic Wasserstein barycenters, for averaging activation maps defined on a voxel grid or triangulated cortical surface with a known metric between locations.
- **Key Findings**: On fMRI data from 20 subjects and MEG data from 16 subjects, the transport average keeps focal activations that Euclidean averaging blurs.
- **Relevance**: The transport barycenter as a group template for spatially variable maps.
- **Correspondence**: transport coupling between subjects on a common domain. **Relies on**: registration to a common grid or surface; the transport handles residual displacement within it.
- **Quality**: High.
- **Potential Use**: Transport fusion section.
- **Stance**: neutral.

### Janati et al. (2019). Group Level MEG/EEG Source Imaging via Optimal Transport: Minimum Wasserstein Estimates.
- **Type**: Conference paper (IPMI 2019).
- **Method**: Multi-task regression across subjects with an unbalanced transport penalty that promotes support proximity of source estimates, with subject-specific noise levels.
- **Key Findings**: Joint estimation improves group-level source localization over independent estimation.
- **Relevance**: Transport between subjects' spatial supports inside a predictive model.
- **Correspondence**: transport coupling between subjects. **Relies on**: each subject's source space "is mapped to a high resolution average brain using morphing", so registration is kept.
- **Quality**: High.
- **Potential Use**: Transport fusion section.
- **Stance**: opposes (registration kept).

### Thual et al. (2022). Aligning Individual Brains with Fused Unbalanced Gromov-Wasserstein (FUGW).
- **Type**: Conference paper (NeurIPS 2022).
- **Method**: Aligns cortical surfaces by matching functional signatures across stimulation settings while a Gromov-Wasserstein term on geodesic distance matrices penalizes large deformations; the unbalanced term allows functional areas to differ in size.
- **Key Findings**: FUGW increases between-subject correlation of independent functional data; experiment 1 aligns subjects on the fsaverage5 mesh and experiment 2 aligns pairs of subjects on their individual anatomical meshes.
- **Relevance**: Registration-free alignment across individual meshes by transport, the clearest case in this strand.
- **Correspondence**: transport coupling between subjects, with geometry entering through intra-subject distances. **Removes**: anatomical template registration in experiment 2. **Outcome**: alignment quality, not a clinical outcome.
- **Quality**: High.
- **Potential Use**: Transport fusion section.
- **Stance**: supports.

### Bazeille et al. (2021). An empirical evaluation of functional alignment using inter-subject decoding.
- **Type**: Journal article (NeuroImage).
- **Method**: Benchmarks piecewise Procrustes, searchlight Procrustes, piecewise optimal transport (entropic, all voxels matched with equal weight), piecewise shared response modelling and intra-subject alignment on four fMRI datasets, scored by decoding accuracy on left-out subjects.
- **Key Findings**: Functional alignment generally improves inter-subject decoding over anatomical alignment; SRM and optimal transport perform well at region-of-interest and whole-brain scale.
- **Relevance**: The predictive test of transport alignment between subjects.
- **Correspondence**: transport coupling between subjects within parcels. **Relies on**: anatomical alignment as the baseline and starting point.
- **Quality**: High.
- **Potential Use**: Transport fusion section.
- **Stance**: supports (functional transport improves prediction) with the registration reliance stated.

### Dadashkarimi et al. (2023). Cross Atlas Remapping via Optimal Transport (CAROT).
- **Type**: Journal article (Medical Image Analysis).
- **Method**: Maps fMRI time series from a source atlas to an unavailable target atlas through a transport plan whose cost is a "functional distance" between time series, used instead of the Euclidean distance between nodes.
- **Key Findings**: Reconstructed connectomes predict fluid intelligence in HCP (n = 515) and sex in REST-meta-MDD (1,005 controls), per the PMC manuscript read.
- **Relevance**: Transport between two region sets that do not correspond.
- **Correspondence**: transport coupling between parcellations. **Relies on**: preprocessing registers each dataset to MNI space. **Removes**: re-parcellation of raw data.
- **Quality**: High.
- **Potential Use**: Region-set section.
- **Stance**: supports.

### Su et al. (2015). Shape Classification Using Wasserstein Distance for Brain Morphometry Analysis.
- **Type**: Conference paper (IPMI 2015).
- **Method**: Each FreeSurfer cortical surface is conformally mapped to the unit sphere; the area-distortion factor gives a probability measure; Wasserstein distances between subjects' measures are computed by optimal mass transport on the sphere with a geodesic power Voronoi diagram; classification by k-nearest neighbours on the distance matrix.
- **Key Findings**: On 100 subjects, three IQ classes were classified with 78.57% accuracy, against 53.57% to 67.85% for SVMs on area and curvature features, per the manuscript read.
- **Relevance**: Subject-level prediction from cortical shape with no vertex correspondence.
- **Correspondence**: transport between subjects' measures on a canonical domain. **Removes**: surface registration to a template. **Relies on**: FreeSurfer surface reconstruction.
- **Quality**: Medium (small sample, coarse outcome).
- **Potential Use**: Cortical surface section.
- **Stance**: supports.

### Mazelet, Flamary and Thirion (2026). Learning fMRI activations dictionaries across individual geometries via optimal transport.
- **Type**: Preprint (arXiv 2605.20883).
- **Method**: Dictionary learning on fMRI data represented as graphs of each individual's geometry, compared by fused Gromov-Wasserstein distances, with a neural network trained by amortized optimization to predict approximate transport plans.
- **Key Findings**: The paper states that projecting each individual brain geometry onto a common template "removes subject-specific information" and that its method accounts for the variability instead; the dictionaries are aimed at downstream tasks such as brain state classification.
- **Relevance**: Registration-free transport dictionaries for downstream brain state classification.
- **Correspondence**: transport coupling to learned dictionary atoms. **Removes**: template projection.
- **Quality**: Low (recent preprint, not peer reviewed).
- **Potential Use**: Transport fusion section.
- **Stance**: supports.

#### E. Medical imaging studies with set or point-cloud encoders

### Gutierrez-Becker and Wachinger (2018). Deep Multi-structural Shape Analysis: Application to Neuroanatomy.
- **Type**: Conference paper (MICCAI 2018).
- **Method**: T1-weighted MRI is processed with FreeSurfer; point clouds are sampled on the boundary of each segmented structure; a multi-branch PointNet (MSPNet) with spatial transformers predicts from several structures at once; occlusion maps localize relevant anatomy.
- **Key Findings**: Classification of healthy controls, MCI and Alzheimer's disease in ADNI from hippocampus and lateral ventricle point clouds (512 points each), and brain age regression.
- **Relevance**: Subject-level outcome from point clouds without point correspondence.
- **Data**: structural MRI. **Outcome**: diagnosis, age. **Removes**: point correspondence and mesh processing ("without the need for mesh processing or the identification of point correspondences"). **Relies on**: FreeSurfer segmentation.
- **Correspondence**: permutation invariance plus a learned canonical pose. **Loses**: relations between points beyond the max pool.
- **Quality**: High.
- **Potential Use**: Medical point-cloud section.
- **Stance**: supports.

### Chen et al. (2022). White Matter Tracts are Point Clouds: Neuropsychological Score Prediction and Critical Region Localization via Geometric Deep Learning.
- **Type**: Conference paper (MICCAI 2022).
- **Method**: The left arcuate fasciculus of each subject is a point cloud with five channels per point (coordinates, FA and number of streamlines), randomly subsampled; a point-based network with a paired-Siamese loss regresses the score.
- **Key Findings**: Predicts NIH Toolbox Picture Vocabulary Test scores in 806 HCP subjects (644 train, 162 test).
- **Relevance**: Subject-level regression from a tract point cloud.
- **Data**: diffusion MRI tractography. **Outcome**: language score. **Removes**: along-tract profile resampling and point correspondence. **Relies on**: tract identification, which the passages read do not describe; the reference list cites the anatomically curated fiber clustering atlas.
- **Correspondence**: permutation invariance; coordinates as features. **Loses**: streamline order.
- **Quality**: High.
- **Potential Use**: Medical point-cloud section.
- **Stance**: supports.

### Chen et al. (2024). TractGeoNet: A geometric deep learning framework for pointwise analysis of tract microstructure to predict language assessment performance.
- **Type**: Journal article (Medical Image Analysis).
- **Method**: Extends the 2022 method to 20 association tracts and two language scores, with a paired-Siamese regression loss and critical-region heatmaps.
- **Key Findings**: The left arcuate fasciculus is the most predictive of the 20 tracts.
- **Relevance**: Shows where the point-cloud pipeline still depends on registration.
- **Data**: diffusion MRI tractography. **Outcome**: TPVT and TORRT scores. **Relies on**: tracts identified with the WMA fiber clustering pipeline and the ORG atlas, and points represented in the ORG atlas coordinate system, so atlas registration is kept.
- **Correspondence**: permutation invariance on atlas-space coordinates. **Loses**: the registration-free property.
- **Quality**: High.
- **Potential Use**: Medical point-cloud section.
- **Stance**: opposes (registration kept).

### Xue et al. (2023). TractCloud: Registration-Free Tractography Parcellation with a Novel Local-Global Streamline Point Cloud Representation.
- **Type**: Conference paper (MICCAI 2023).
- **Method**: Each streamline is classified from a point-cloud representation that adds neighbouring streamlines (local anatomy) and whole-brain streamlines (global pose), trained with synthetic transformations of labelled data.
- **Key Findings**: Parcellation in subject space without registration.
- **Relevance**: A pipeline step (registration before parcellation) removed by a set encoder.
- **Data**: diffusion MRI tractography. **Outcome**: streamline labels, not a subject-level outcome. **Removes**: affine or nonrigid registration.
- **Correspondence**: permutation invariance with learned context. **Loses**: nothing stated in the passages read beyond reliance on augmentation.
- **Quality**: High.
- **Potential Use**: Pipeline section.
- **Stance**: supports.

### Vosylius et al. (2020). Geometric Deep Learning for Post-Menstrual Age Prediction Based on the Neonatal White Matter Cortical Surface.
- **Type**: Workshop paper (MICCAI GRAIL/UNSURE 2020).
- **Method**: Compares PointNet++, MeshCNN and a graph CNN on dHCP white matter surfaces decimated to 10,000 vertices, against a 3D CNN.
- **Key Findings**: PointNet++ with cortical thickness, curvature and sulcal depth reached test MAE 0.62 weeks against 0.82 for the 3D CNN.
- **Relevance**: Point-cloud prediction from cortical surfaces.
- **Data**: neonatal structural MRI surfaces. **Outcome**: post-menstrual age. **Relies on**: surface extraction; registration not stated in the passages read.
- **Correspondence**: permutation invariance. **Loses**: mesh connectivity, which the authors expected to carry more information.
- **Quality**: Medium.
- **Potential Use**: Cortical surface section.
- **Stance**: supports.

### Fawaz et al. (2021). Benchmarking Geometric Deep Learning for Cortical Segmentation and Neurodevelopmental Phenotype Prediction.
- **Type**: Preprint (bioRxiv), not peer reviewed.
- **Method**: Benchmarks spherical surface networks on template-space (MSM-registered) and native-space data, with and without rotations, and compares them with PointNet++ and a spectral-embedding GCN on native meshes.
- **Key Findings**: Non-rotationally-equivariant spherical models dropped from errors within a week to over a month on rotated unregistered data; PointNet++ on the native mesh gave MAE 0.512 weeks for post-menstrual age and 1.15 weeks for gestational age at birth, better than the best spherical model (0.57 for age at scan).
- **Relevance**: Direct evidence on the cost of removing registration, by architecture.
- **Data**: dHCP cortical surfaces. **Outcome**: post-menstrual age, gestational age. **Removes**: MSM registration for the native-space models. **Relies on**: surface reconstruction.
- **Correspondence**: compares registration, rotation equivariance and permutation invariance. **Loses**: not applicable.
- **Quality**: Medium (preprint).
- **Potential Use**: Cortical surface section; pipeline section.
- **Stance**: supports (point clouds without registration perform well) and opposes (spherical models degrade without registration).

### Chen et al. (2021). AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases.
- **Type**: Conference paper (MICCAI 2021).
- **Method**: Each tumor is an instance described by pyradiomics features from contrast-enhanced MRI; an autoencoder branch and a MIL branch with max, average, log-sum-exp or attention pooling predict 3-year overall survival.
- **Key Findings**: AMINN with average pooling had the best AUC and accuracy, 11.4% higher AUC than LASSO logistic regression on the largest tumor.
- **Relevance**: Subject-level outcome from a lesion set of varying size, without choosing one lesion.
- **Data**: MRI of colorectal liver metastases. **Outcome**: 3-year survival. **Relies on**: manual slice-by-slice tumor delineation by a radiologist (the authors report that nnU-Net tumor segmentation was unsatisfactory) and radiomics feature extraction.
- **Correspondence**: permutation invariance. **Loses**: lesion location and relations between lesions.
- **Quality**: High.
- **Potential Use**: Lesion-set section.
- **Stance**: supports.

### Chen and Martel (2022). Metastatic Cancer Outcome Prediction with Injective Multiple Instance Pooling.
- **Type**: Preprint (arXiv 2203.04964).
- **Method**: Builds a benchmark of 341 patients with multiple tumors from the TCIA datasets HN1 and Lung1; radiomic features are extracted from the segmentations of each tumor; a multiple instance network with two proposed injective pooling functions predicts binary survival, modelling patient risk as the cumulative risk of individual tumors.
- **Key Findings**: Injective pooling reaches state-of-the-art performance on the lung cancer CT and head and neck cohorts; the authors identify a lack of expressiveness in common MIL classification networks.
- **Relevance**: Ties the expressiveness argument of section A to lesion sets.
- **Data**: CT. **Outcome**: binary survival. **Relies on**: the tumor segmentations distributed with the datasets and radiomics feature extraction.
- **Correspondence**: permutation invariance with injective pooling. **Loses**: lesion location.
- **Quality**: Medium.
- **Potential Use**: Lesion-set section.
- **Stance**: supports.

### Yang et al. (2020). Relational Learning Between Multiple Pulmonary Nodules via Deep Set Attention Transformers.
- **Type**: Conference paper (ISBI 2020).
- **Method**: A shared 3D DenseNet encodes each nodule crop; a set attention transformer refines each nodule representation using the other nodules of the same patient (NoduleSAT).
- **Key Findings**: Learning relations between nodules improves false positive reduction and multiple-nodule malignancy classification over solitary-nodule approaches.
- **Relevance**: A set encoder over lesions that keeps relations.
- **Data**: chest CT. **Outcome**: nodule malignancy within a patient set. **Relies on**: nodule detection and cropping.
- **Correspondence**: permutation invariance with self-attention. **Loses**: spatial position unless encoded.
- **Quality**: Medium (four-page paper).
- **Potential Use**: Lesion-set section.
- **Stance**: supports.

### Zhang et al. (2020). Survival-relevant high-risk subregion identification for glioblastoma patients: the MRI-based multiple instance learning approach.
- **Type**: Journal article (European Radiology).
- **Method**: Gross tumor regions delineated on normalized MRI of 104 patients; voxel intensities pooled and clustered by K-means into three global clusters; 294 subregions; radiomics features per subregion; a subregion-level MIL model predicts short-term survival.
- **Key Findings**: Survival stratification accuracy 87.88% on 33 test patients.
- **Relevance**: Subject-level outcome from a set of regions with no correspondence between patients.
- **Data**: MRI. **Outcome**: overall survival class. **Relies on**: tumor delineation, intensity normalization and radiomics.
- **Correspondence**: permutation invariance (MIL), with a global clustering as a shared reference. **Loses**: spatial relations between subregions.
- **Quality**: Low (small test set; abstract-level reading).
- **Potential Use**: Region-set section.
- **Stance**: supports.

### Luo et al. (2022). Prediction of cerebral aneurysm rupture using a point cloud neural network.
- **Type**: Journal article (Journal of NeuroInterventional Surgery).
- **Method**: A point-cloud network on aneurysm models, with or without the parent artery, from CTA (n = 180) or MRA (n = 238), compared with ridge regression, SVM and neural network models on radiomics features.
- **Key Findings**: Internal test AUC 0.913 with parent artery against 0.803 for ridge regression on radiomics; external prospective AUC 0.835 against 0.681 to 0.701 for radiomics models.
- **Relevance**: A point-cloud encoder replacing radiomics feature extraction for a vessel shape.
- **Data**: CTA and MRA vessel geometry. **Outcome**: rupture status. **Removes**: radiomics feature extraction. **Relies on**: aneurysm and vessel segmentation to build the point cloud (the model input), whose method is not in the abstract.
- **Correspondence**: permutation invariance. **Loses**: not stated in the abstract.
- **Quality**: Medium (abstract only; multicentre external test).
- **Potential Use**: Vessel and shape section.
- **Stance**: supports.

### Literature Matrix

Themes: T1 pooled permutation-invariant encoders; T2 encoders that model relations between elements; T3 learned reference sets, templates or prototypes; T4 transport coupling between subjects, modalities or parcellations; T5 medical imaging study with a recorded pipeline step. "main" marks the theme a source is mainly about; "x" marks a secondary theme.

| Source | T1 | T2 | T3 | T4 | T5 | Correspondence handled by | Method | Quality |
|---|---|---|---|---|---|---|---|---|
| Maron 1997 | main | | | | | permutation invariance | Algorithm | Medium |
| Zaheer 2017 | main | | | | | permutation invariance | Theory + model | High |
| Qi 2017a (PointNet) | main | | | | x | permutation invariance + learned pose | Model | High |
| Wagstaff 2019 | main | | | | | analysis | Theory | High |
| Murphy 2018 (Janossy) | main | x | | | | symmetrization | Theory + model | High |
| Ilse 2018 | main | | | | x | permutation invariance | Model | High |
| Amir 2024 (FSW) | main | | | x | | transport-preserving embedding | Theory + model | High |
| Kothapalli 2023 | main | | x | x | | comparison | Benchmark | Medium |
| Qi 2017b (PointNet++) | x | main | | | x | permutation invariance, local | Model | High |
| Wang 2019 (DGCNN) | x | main | | | | permutation invariance, local graph | Model | High |
| Lee 2018 (Set Transformer) | x | main | x | | | learned inducing points and seeds | Model | High |
| Baek 2021 (GMT) | x | main | x | | | learned seeds | Model | High |
| Mialon 2020 (OTKE) | | | main | x | | transport to learned reference | Model | High |
| Naderializadeh 2021 (PSWE) | | | main | x | | sliced transport to learned references | Model | High |
| Kolouri 2020 (WEGL) | | | main | x | | transport to fixed reference | Model | High |
| Vincent-Cuaz 2022 (TFGW) | | x | main | x | | FGW to learned templates | Model | High |
| Mahan 2024 (DSLOT) | | | main | x | | transport to fixed reference | Model | Medium |
| Shifat-E-Rabbi 2025 (LOT subspaces) | | | main | x | | transport to reference | Model | Medium |
| Cheng 2022 (UOT-Pooling) | x | | | main | | transport inside pooling | Model | Medium |
| Song 2024a (PANTHER) | | | main | x | x | learned prototypes | Model | High |
| Song 2024b (MMP) | | | main | x | x | learned prototypes per modality | Model | High |
| Xu 2023 (MOTCat) | | x | | main | x | transport between modalities | Model | High |
| Gramfort 2015 | | | x | main | x | transport barycenter, common space | Algorithm | High |
| Janati 2019 | | | | main | x | transport between subjects, morphed | Model | High |
| Thual 2022 (FUGW) | | | | main | x | fused unbalanced GW between subjects | Algorithm | High |
| Bazeille 2021 | | | | main | x | piecewise transport after anatomy | Benchmark | High |
| Dadashkarimi 2023 (CAROT) | | | | main | x | transport between atlases | Algorithm | High |
| Su 2015 | | | | main | x | transport on canonical sphere | Algorithm | Medium |
| Mazelet 2026 (FGW dictionaries) | | | x | main | x | FGW to dictionary atoms | Model | Low |
| Gutierrez-Becker 2018 | x | | | | main | permutation invariance | Application method | High |
| Chen 2022 (tracts) | x | | | | main | permutation invariance | Application method | High |
| Chen 2024 (TractGeoNet) | x | | | | main | permutation invariance, atlas space | Application method | High |
| Xue 2023 (TractCloud) | | x | | | main | permutation invariance with context | Application method | High |
| Vosylius 2020 | | x | | | main | permutation invariance | Comparison | Medium |
| Fawaz 2021 | | x | | | main | comparison of registration regimes | Benchmark | Medium |
| Chen 2021 (AMINN) | x | | | | main | permutation invariance | Application method | High |
| Chen and Martel 2022 (injective MIL) | x | | | | main | injective pooling | Application method | Medium |
| Yang 2020 (NoduleSAT) | | x | | | main | self-attention over lesions | Application method | Medium |
| Zhang 2020 (GBM subregions) | x | | x | | main | MIL with global clusters | Application method | Low |
| Luo 2022 | x | | | | main | permutation invariance | Application method | Medium |

Theme counts (main or x): T1 20, T2 11, T3 14, T4 19, T5 24. Every theme has at least 3 sources. Quality: High 27, Medium 11, Low 2.

### Identified Gaps

1. **Registration-free point-cloud predictors still rely on segmentation or atlas-based identification.** Every included medical point-cloud study builds its input from a segmentation (FreeSurfer structures in Gutierrez-Becker 2018 and Su 2015, delineated tumors in AMINN, segmented vessels in Luo 2022) or from atlas-based tract identification (TractGeoNet, which keeps the ORG atlas coordinate system). The documented search (queries A5, P5, O1, O2, S2) found no included study that predicts a subject-level outcome from raw image-derived point sets without one of these steps; TractCloud removes registration but its outcome is streamline parcellation.
2. **Learned reference sets have not been reported for medical spatial data in this group's included set.** OTKE, PSWE, WEGL, TFGW, DSLOT and the LOT subspace method learn or fix a reference against which each set is transported, and PANTHER and MMP use learned prototypes for pathology patch features; among the medical imaging studies with spatial point sets (sections E and D), none used a learned transport reference set over spatial coordinates in the passages read. This is what the documented search found, with the queries listed, and is not a claim that no such work exists outside it.
3. **Pooling discards spatial relations that clinical outcomes may depend on.** Deep Sets, PointNet, attention MIL and the lesion-set studies treat instances as independent before pooling; Wagstaff 2019 shows a latent width tied to set size is needed for universal representation, and the FSW abstract states that sum and max pooling are not bi-Lipschitz. The lesion-set studies (AMINN, injective MIL, glioblastoma subregions) do not encode lesion location, and only NoduleSAT models relations between lesions.
4. **Transport alignment between subjects is evaluated mainly by alignment or decoding quality.** FUGW reports between-subject correlation, Gramfort 2015 and Janati 2019 report group averages or source localization, and Bazeille 2021 reports cognitive-state decoding; Su 2015 (IQ class, n = 100) and CAROT (IQ, sex) are the included cases that predict a subject-level trait, and none of the included transport studies predicts a clinical outcome.
5. **Evidence on the cost of removing registration is thin and comes from neonatal cortical surfaces.** Fawaz 2021 (a preprint) is the only included study that trains the same models on registered and unregistered data; its results favour PointNet++ on native meshes and show large degradation of non-equivariant spherical models.

### Recommended Sources by Paper Section

| Section | Key Sources |
|---|---|
| Introduction | zaheer2017deep, qi2017pointnet, mialon2020trainable, thual2022aligning, gutierrezbecker2018deep, fawaz2021benchmarking |
| Literature Review: pooled set encoders | maron1997framework, zaheer2017deep, qi2017pointnet, ilse2018attention, murphy2018janossy, wagstaff2019on, amir2024fourier, kothapalli2023equivariant |
| Literature Review: relational encoders and graph readouts | qi2017pointnetpp, wang2019dynamic, lee2018set, baek2021accurate |
| Literature Review: learned references and templates | mialon2020trainable, naderializadeh2021pooling, kolouri2020wasserstein, vincentcuaz2022template, mahan2024point, shifaterabbi2025linear, cheng2022revisiting, song2024morphological, song2024multimodal |
| Literature Review: transport between subjects and modalities | gramfort2015fast, janati2019group, thual2022aligning, bazeille2021empirical, dadashkarimi2023cross, su2015shape, mazelet2026learning, xu2023multimodal |
| Literature Review: medical imaging pipelines | gutierrezbecker2018deep, chen2022white, chen2024tractgeonet, xue2023tractcloud, vosylius2020geometric, fawaz2021benchmarking, chen2021aminn, chen2022metastatic, yang2020relational, zhang2020survival, luo2022prediction |
| Methodology (related design choices) | lee2018set, mialon2020trainable, naderializadeh2021pooling, vincentcuaz2022template, thual2022aligning |
| Discussion | wagstaff2019on, amir2024fourier, kothapalli2023equivariant, chen2024tractgeonet, fawaz2021benchmarking, janati2019group |

### Search Stopping Rules

- Condition 1, source count meets target: met; 40 included against the Literature Review minimum of 30.
- Condition 2, no new additions from the latest search: met; Layer 4 added 0 included sources.
- Condition 3, theme saturation: met; every theme of the matrix has at least 3 sources.
- Condition 4, citation loop closure: met for the five chained cores in this group's scope; of the four works cited by two cores, three are included and the fourth (FreeSurfer) is left to strand group D.

Conditions met: 5 of 5, above the page's threshold of 3.
- Condition 5, temporal span: met; foundational works (1997, 2015, 2017) and 12 sources from 2023 to 2026.

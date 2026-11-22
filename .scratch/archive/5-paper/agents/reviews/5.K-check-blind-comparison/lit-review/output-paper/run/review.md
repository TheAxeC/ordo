## Literature Search Report

Merge of the four theme runs of the literature review run `literature review-2026-11-19`, written on 2026-11-19. Research question (`settings.md`, word for word): "Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines?"

Paper type: Literature Review. Domain evidence profile: `cs_ml`. DOI checking: strict. Materials in hand: none, so the flow of "Reading a given source list" did not run and no PRE-SCREENED block applies.

### Search Strategy

**Profile.** The row "Domain evidence profile" of `settings.md` reads `cs_ml`, with no suffix. Admission in every theme run and in the merge run used the neutral criteria joined by union with the `cs_ml` admit path: an archival preprint or a proceedings paper passes the peer-review node and then goes through the relevance and methodology nodes unchanged.

[PROFILE-DISCIPLINE-MISMATCH] The Discipline row reads "Machine learning, with medical image analysis as the application setting; methods admitted from any application domain." The implied disciplines of `cs_ml` are CS, Engineering and Technology, and the page compares names without inference; the row names none of the three, so the warning applies to the merged review. Theme runs 2 and 4 wrote this warning, and theme runs 1 and 3 judged that machine learning lies inside CS; the merge run follows the name comparison the page prescribes. This is a warning only: admission used `cs_ml`, and the Discipline row chose the databases. Nothing is blocked.

**Themes.** `settings.md` divides the search into four themes, one per method literature: (1) tensor and multilinear regression with an unaligned mode; (2) optimal transport for unaligned data; (3) permutation-invariant set and point-cloud encoders; (4) medical-imaging pipelines and registration-free prediction. Each theme run searched its own scope and flagged a source central to it from a neighbouring theme as an overlap.

**Databases and tools.** The Discipline row points to IEEE Xplore, ACM DL and Scopus, and theme 4 to PubMed for the application setting. No theme run had access to IEEE Xplore, ACM DL or Scopus, and theme run 4's two PubMed connector queries were denied permission. The searches ran on:

- the WebSearch tool (a general web index that returns about 10 links per query and no total hit count), in every run;
- the Semantic Scholar Graph API for backward chaining, forward tracking and citation counts (themes 1, 2 and 4; theme run 3 received HTTP 429 and ran its semantic layer on OpenAlex works search);
- the arXiv export API, the Crossref REST API and https://doi.org resolution, for record lookup and identifier confirmation;
- OpenAlex and PubMed E-utilities for abstracts not deposited at Crossref;
- the official proceedings pages (PMLR, NeurIPS proceedings, iclr.cc, CVF) and the OpenReview API for venue confirmation.

**Search strings.** Each theme run built a Boolean string from its key concepts and, because the web search tool takes no Boolean operators, ran it as one natural-language query per conjunct. The strings, as the theme files record them:

- Theme 1: ("tensor regression" OR "multilinear regression" OR "N-PLS" OR "higher order partial least squares" OR "PARAFAC2" OR "irregular tensor" OR "coupled matrix and tensor factorization" OR "shift-invariant") AND ("prediction" OR "classification" OR "supervised" OR "neuroimaging" OR "electronic health records" OR "point cloud"). Queries W1 to W19, Crossref queries C1 to C10, forward tracking S1 and S2.
- Theme 2: ("optimal transport" OR "Wasserstein" OR "Gromov-Wasserstein" OR "Sinkhorn") AND ("barycenter" OR "template" OR "dictionary" OR "reference" OR "embedding") AND ("classification" OR "regression" OR "prediction" OR "pooling" OR "point cloud" OR "graph" OR "set"). 35 layer 1 queries, backward chaining, forward tracking and a semantic layer.
- Theme 3: ("permutation invariant" OR "set function" OR "Deep Sets" OR "Set Transformer" OR "PointNet" OR "multiple instance learning" OR "distribution regression" OR "kernel mean embedding") AND ("prediction" OR "classification" OR "regression") AND ("set" OR "point cloud" OR "bag"). Queries 1 to 28, chaining over four reference lists and three OpenAlex semantic queries.
- Theme 4: ("registration" OR "atlas" OR "template") AND ("deformable" OR "diffeomorphic" OR "learning"); ("radiomics") AND ("reproducibility" OR "standardisation" OR "deep learning"); ("multiple lesions" OR "multifocal" OR "metastases") AND ("aggregation" OR "multiple instance" OR "graph") AND ("outcome" OR "survival"); ("optimal transport" OR "Wasserstein" OR "Gromov-Wasserstein") AND ("brain" OR "MRI" OR "point cloud" OR "shape") AND ("registration-free" OR "template" OR "barycenter" OR "morphometry"). Layer 1 web and Crossref queries, backward chaining on one reference list, forward tracking and a layer 4 semantic search.

**Date range and filters.** Theme runs 1, 3 and 4 used the last 10 years by default and theme run 2 the years 2015 to 2026, each admitting older works at the "seminal work" node. Language: English. Publication type: peer-reviewed journals and proceedings, and archival preprints under `cs_ml`.

**Merge-run search.** The merged set failed the currency gate (see the gate table below), so the merge run applied the page's failure handling for insufficient currency: a specialized search for the last 3 years, with preprints admitted only when tagged as preprints. It ran these WebSearch queries, which returned 170 links:

1. "Pooling by Sliced-Wasserstein Embedding" arXiv 2103.03892 (venue confirmation of a theme 2 source)
2. PARAFAC2 supervised prediction irregular tensor 2024 2025 arXiv
3. tensor regression misaligned images or point clouds subject-level prediction 2023 2024 2025
4. optimal transport patient-level prediction single-cell distributions Wasserstein PILOT 2024
5. Fourier sliced-Wasserstein embedding multisets measures injective ICLR 2025
6. Khurana Kannan Cloninger Moosmuller "Supervised learning of sheared distributions using linearized optimal transport"
7. "Reimagining Graph Classification from a Prototype View with Optimal Transport" KDD 2024 doi
8. Kwon 2025 Medical Image Analysis prototype inverse-projection sulcal pattern graph congenital heart disease
9. ReSeT set transformer skin lesion comparison within patient ugly duckling
10. multiple lesions patient-level survival prediction PET/CT attention multiple instance learning 2024 lymphoma metastases
11. optimal transport prototypes multiple instance learning whole slide image 2024 2025 survival
12. PARAFAC2 time-evolving patterns tPARAFAC2 2024 Acar Roald neuroimaging classification subjects
13. Gromov-Wasserstein brain network classification subject-level 2023 2024 optimal transport connectome classification
14. QOT quantized optimal transport sample-level distance single-cell omics arXiv
15. "Exponential Separations in Symmetric Neural Networks" Zweig Bruna NeurIPS 2022 proceedings
16. "Graph Classification via Reference Distribution Learning: Theory and Practice" NeurIPS 2024 proceedings
17. tensor regression or PARAFAC2 classification of subjects with varying number of regions or irregular spatial mode neuroimaging 2023 2024 journal

It also screened again the Phase B exclusions of the theme runs that were published in 2022 or later, and ran known-item lookups for the recent work of each sub-area that the theme runs named or that the queries above pointed to: Crossref `query.bibliographic` title searches, one batch arXiv API lookup by identifier (33 identifiers, all with the expected titles), one Crossref filter lookup by DOI (22 DOIs, all with the expected titles), PubMed E-utilities and OpenAlex for abstracts. Every source added by the merge run was confirmed by one of these lookups, and its annotation names the lookup in its "URL confirmed" line.

**Duplicates folded.** The theme bibliographies were compared by DOI, by arXiv ID and by normalized title, then by fuzzy title match, which found no further pair. One key is kept per work, its annotation is merged with every theme tag, and the folded key is listed:

| Kept key | Folded key or entry | Themes | Basis |
|---|---|---|---|
| `gramfort2015fast` | `gramfort2015fast` of theme 4 (same key) | 2, 4 | Same DOI 10.1007/978-3-319-19992-4_20 |
| `thual2022aligning` | `thual2022fugw` (theme 4) | 2, 4 | Same arXiv ID 2206.09398 |
| `gutierrezbecker2018deep` | `gutierrezbecker2018mspnet` (theme 4) | 3, 4 | Same DOI 10.1007/978-3-030-00931-1_60 |
| `naderializadeh2021set` | the NeurIPS 2021 paper "Pooling by Sliced-Wasserstein Embedding", which theme run 2 excluded for lacking an identifier | 2 | The same five authors and the same exact Euclidean embedding of the (generalized) sliced-Wasserstein distance, read in the NeurIPS PDF; arXiv holds one record (2103.03892) and no separate record of the NeurIPS version |
| `geady2024multimetastatic` | the BMC Cancer 2025 study that theme run 4 listed under "Unconfirmed, excluded" | 4 | Crossref record of 10.1186/s12885-025-13850-5: same title, same five authors, same design (16,894 lesions, 3,930 patients) as the medRxiv preprint |

For `naderializadeh2021set` the entry now carries the NeurIPS title and venue (volume 34, pages 3389-3400), its arXiv ID and the url of the NeurIPS page. For `geady2024multimetastatic` the entry now carries the version of record, BMC Cancer 25(1):538 (2025), and its DOI 10.1186/s12885-025-13850-5 in place of the medRxiv DOI 10.1101/2024.07.04.24309964; the key is kept as it is.

**Title decisions.** `checks.md` holds 26 index lines over 15 keys whose index title differs from the bib title or has a ratio below 1.00. Each is decided for the version-of-record title and venue:

| Key | What the indexes show | Decision |
|---|---|---|
| `Kiers1999PARAFAC2` | Crossref prints "PARAFAC2" and "Part I" joined by an em dash; OpenAlex gives the hyphen form at ratio 0.99 | The Crossref title of the Journal of Chemometrics, written in the bib as `{PARAFAC2}---Part {I}. A direct fitting algorithm for the {PARAFAC2} model` |
| `Perros2017SPARTan` | OpenAlex and Semantic Scholar lines at low ratios; Crossref stores title and subtitle in two fields | The full ACM KDD title is kept |
| `Afshar2018COPA` | As for SPARTan | The full ACM CIKM title is kept |
| `Afshar2020TASTE` | As for SPARTan | The full ACM KDD title is kept |
| `Ren2023MULTIPAR` | The indexes show the arXiv title | The PMLR volume 225 title, which ends "for Computational Phenotyping", is kept |
| `cuturi2013sinkhorn` | arXiv and OpenAlex end "Optimal Transportation Distances" | The NeurIPS proceedings title "Sinkhorn Distances: Lightspeed Computation of Optimal Transport" is kept |
| `peyre2019computational` | Semantic Scholar shows "Computational Optimal Transport" (DOI_MISMATCH, 0.64), the arXiv record | The Crossref title of Foundations and Trends in Machine Learning, which matches the bib, is kept |
| `bonneel2016wasserstein` | Crossref stores "Wasserstein barycentric coordinates" and the subtitle "histogram regression using optimal transport" apart | The full ACM Transactions on Graphics title is kept |
| `vincentcuaz2022semirelaxed` | The indexes show "with applications on graphs", the arXiv title | The ICLR 2022 title "...divergence and applications on graphs" is kept |
| `mialon2021trainable` | Semantic Scholar shows "An Optimal Transport Kernel...", the arXiv version 1 title | The ICLR 2021 title is kept |
| `thual2022aligning` | Index titles hyphenate "Gromov-Wasserstein" | The NeurIPS proceedings title "Aligning individual brains with fused unbalanced Gromov Wasserstein" is kept; the DOI 10.52202/068431-1584 shown on the NeurIPS page was added (it resolves with HTTP 302, and its Crossref record gives NeurIPS 35, pages 21792-21804) |
| `lee2019set` | Semantic Scholar shows the short title "Set Transformer" | The full PMLR volume 97 title is kept |
| `bloemreddy2020probabilistic` | Semantic Scholar shows "symmetry" in the singular | The JMLR title "Probabilistic Symmetries and Invariant Neural Networks" is kept |
| `shao2021transmil` | Semantic Scholar shows the typo "Classication" | The NeurIPS proceedings title is kept |
| `gramfort2015fast` | The two theme entries differ in the booktitle only | The theme 2 booktitle (IPMI 2015, LNCS) is kept |

**Proceedings-only sources.** `settings.md` admits to the merge run a source with neither a DOI nor an arXiv ID only when it is confirmed on its official proceedings page and carries a `url`.

- Peyre, Cuturi and Solomon (2016), PMLR 48: included as `peyre2016gromov` with `url` https://proceedings.mlr.press/v48/peyre16.html. The page, read in the merge run, gives the title, the three authors, volume 48, pages 2664-2672, and no DOI or arXiv ID.
- Naderializadeh et al. (2021), NeurIPS 34: the same work as the arXiv preprint 2103.03892, folded into `naderializadeh2021set` (see the duplicates table), which carries both the arXiv ID and the url of the NeurIPS page.

**Theme exclusions screened again.** The theme runs worked under theme targets of 15 to 30 sources and excluded some relevant sources as covered by another source. The merge run screened again those published in 2022 or later against the research question and included ten: Whybra et al. (2024) and Thiery et al. (2023) from theme 4; Kimura et al. (2024), Bachoc et al. (2025) and Harvey et al. (2026) from theme 3; Wang and Fan (2024), Kwon et al. (2025), Liu et al. (2023) and Khurana et al. (2023) from theme 2, and Peyre et al. (2016) from theme 2 under the proceedings rule above.

### Coverage Distribution Advisory

No distributional skew advisory triggered. The computed concentrations, each over the 159 included sources:

- Time distribution: the largest decade is the 2020s, with 102/159 (64.2%); 2010s 49, 2000s 5, 1990s 3.
- Methodological distribution: the largest category is "Method", with 91/159 (57.2%); Theory 21, Clinical application 17, Review 12, Benchmark 12, Dataset or tool 4, Guideline 2.
- Venue tier distribution: the largest venue family is the NeurIPS proceedings, with 14/159 (8.8%); the top 3 families (NeurIPS 14, preprints 13, and ICML and the Nature journals tied at 10) hold 37/159 (23.3%).
- Geographic distribution: left out, because the annotations state a study site or population region for too few sources to assess.

### Screening Results

| Run | Initial hits | After title/abstract screening | After full-text assessment |
|---|---|---|---|
| Theme 1 | 258 records (190 WebSearch links, 18 Crossref records, 50 forward-tracking titles) | 49 | 23 |
| Theme 2 | 587 records (360 layer 1 links, 218 layer 2 and 3 records, 9 layer 4 links); 83 distinct works | 46 | 30 |
| Theme 3 | 109 records (64 distinct works from search and chaining, 45 OpenAlex titles) | 35 | 25 |
| Theme 4 | 504 records; 55 distinct works | 47 | 30 |
| Merge run | 170 WebSearch links, plus the theme Phase B exclusions from 2022 or later and the known-item lookups | 59 candidate works assessed in full | 54 |

- Initial hits: 1,628 records across the five searches (258 + 587 + 109 + 504 + 170), counted with duplicates and mirrors as each run reported them.
- After title/abstract screening: 177 works in the theme runs (49 + 46 + 35 + 47) and 59 candidate works in the merge run, of which 10 had reached Phase B in a theme run.
- After full-text assessment: 108 theme entries and 54 merge-run additions.
- Final included sources: 159. The 108 theme entries hold 105 works after the three duplicate pairs are folded, and the merge run adds 54 (53 by the currency search and Peyre et al. 2016 under the proceedings rule).

Merge-run exclusions at full-text assessment (5):

- Point Transformer V3 (arXiv 2312.10035): scene-level segmentation and classification by scale; no subject-level outcome, and the point-cloud encoder question is covered by PointNeXt and PointMLP.
- Evolvable Graph Diffusion Optimal Transport with Pattern-Specific Alignment (EDT-PA, arXiv 2509.16238): aligns structural and functional connectivity within a subject on a shared atlas, the reason theme run 2 also excluded it.
- ReSeT, a Set Transformer comparing skin lesions within a patient: its outputs are lesion-level, with no subject-level outcome.
- "Reimagining Graph Classification from a Prototype View with Optimal Transport" (KDD 2024): no DOI or arXiv ID was confirmed by the lookups of this run.
- The MICCAI 2023 version of the Songdechakraiwut et al. topological classifier: its identifier was not confirmed in this run, so the arXiv preprint 2202.01275 of the same method is included in its place.

### Quality gates

Each number below was computed from `refs.bib` and the matrix data of this report.

| Check | Pass criterion | Computed | Result |
|---|---|---|---|
| Search strategy documented | Databases, strings and screening criteria recorded | The section above records the databases, the strings of the four themes, the 17 merge-run queries, the lookups and the screening criteria | Pass |
| Source count | At least 30 for a Literature Review | 159 | Pass |
| Annotated bibliography complete | Every included source annotated | 159 annotations for 159 sources, each with Type, Method, Key Findings, Relevance, Quality and Potential Use | Pass |
| Literature matrix coverage | Every theme has at least 3 sources | Theme 1: 24 (24 main, 0 overlap); theme 2: 52 (44 main, 8 overlap); theme 3: 64 (43 main, 21 overlap); theme 4: 72 (51 main, 21 overlap) | Pass |
| Research gaps | At least 2 specific, actionable gaps | 5 | Pass |
| Peer-reviewed share | At least 70% | Neutral criteria: 146/159 (91.8%) in a journal, a book series or proceedings; the 13 preprints count under `cs_ml`, giving 159/159 (100%) | Pass |
| Currency | At least 50% in the last 5 years | 80/159 (50.3%) published in 2022 or later | Pass, after the failure handling |

Currency, counted conservatively: a source counts as published in the last 5 years (since 2021-11-19) when the year of its entry is 2022 or later. Sources of 2021 published after 19 November 2021, such as the NeurIPS 2021 papers, are not counted, so 80/159 is a lower bound. `cs_ml` does not loosen this gate. The 105 works of the theme runs and Peyre et al. (2016) held 27/106 (25.5%) from 2022 or later, below the threshold. The failure handling of the page ran: the specialized search above for the last 3 years added 53 sources, all 53 from 2022 or later and 44 of them from 2023 or later, and every preprint among the additions is typed as a preprint in its annotation and as `@misc` in `refs.bib`. After it, the gate passes at 80/159.

### Annotated Bibliography

One annotation per included source, grouped by the main theme of the source. The Key line gives the `refs.bib` key and the Themes line the matrix tags. Annotations of the theme runs are carried as the theme runs wrote them; their Quality lines use the scale of each theme run (theme run 3 adds an OpenAlex citation count and a quick-assessment score out of 15). Annotations of the five merged works and of the 54 sources added by the merge run were written in the merge run from the records it read.

#### Theme 1: tensor and multilinear regression with an unaligned mode

##### Bro (1996). Multiway calibration. Multilinear PLS.
- **Key**: `Bro1996NPLS`
- **Themes**: main 1
- **Type**: Journal article (Journal of Chemometrics 10(1), 47-61)
- **Identifier**: DOI 10.1002/(SICI)1099-128X(199601)10:1<47::AID-CEM400>3.0.CO;2-C
- **URL confirmed**: https://doi.org/10.1002/(SICI)1099-128X(199601)10:1<47::AID-CEM400>3.0.CO;2-C (resolves to the Wiley landing page)
- **Method**: N-way partial least squares, which fits one weight vector per mode of the predictor array and regresses the response on the resulting scores; shown for three-way data (tri-PLS) with the extension to higher orders.
- **Key Findings**: On fluorescence excitation-emission matrices of sugar samples, tri-PLS predicts ash content as well as unfold-PLS and gives more interpretable loadings. On a simulated noisy example, unfold-PLS predictions were almost twice as poor as tri-PLS predictions.
- **Relevance**: The origin of multilinear PLS. Every mode, including the one indexed by sample, must share its index set across samples, so N-PLS assumes the correspondence that the research question asks about.
- **Quality**: High; 699 citations. Chemometric application with one real data set.
- **Stance**: Neutral.
- **Potential Use**: Background on multilinear prediction models.

##### Zhao et al. (2013). Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method.
- **Key**: `Zhao2013HOPLS`
- **Themes**: main 1
- **Type**: Journal article (IEEE Transactions on Pattern Analysis and Machine Intelligence 35(7), 1660-1673)
- **Identifier**: DOI 10.1109/TPAMI.2012.254 (arXiv 1207.1230)
- **URL confirmed**: https://doi.org/10.1109/TPAMI.2012.254
- **Method**: Projects a predictor tensor and a response tensor onto a shared latent space through a sum of orthogonal Tucker blocks. The loadings come from a higher-order SVD of a generalized cross-covariance tensor, with deflation between blocks.
- **Key Findings**: On synthetic data and on decoding 3D movement trajectories from electrocorticogram signals, HOPLS predicted better than the compared methods, held up at small sample sizes and was less sensitive to noise. N-PLS is a special case.
- **Relevance**: The main Tucker-based PLS. Like N-PLS, it needs every mode of every sample to be on a common index.
- **Quality**: High; 146 citations. Evaluation on one real decoding data set.
- **Stance**: Neutral.
- **Potential Use**: Multilinear PLS methods.

##### Zhang and Li (2017). Tensor Envelope Partial Least-Squares Regression.
- **Key**: `Zhang2017TensorEnvelopePLS`
- **Themes**: main 1
- **Type**: Journal article (Technometrics 59(4), 426-436)
- **Identifier**: DOI 10.1080/00401706.2016.1272495
- **URL confirmed**: https://doi.org/10.1080/00401706.2016.1272495
- **Method**: A tensor PLS algorithm with a population model, through the envelope framework of sufficient dimension reduction.
- **Key Findings**: The population interpretation explains how tensor PLS reduces dimension and gives asymptotic consistency of the estimator. The method is illustrated on simulations and two neuroimaging analyses.
- **Relevance**: Gives tensor PLS a statistical model for subject-level neuroimaging prediction. Its images are registered to a common grid before analysis.
- **Quality**: High; 66 citations; peer-reviewed statistics journal.
- **Stance**: Neutral.
- **Potential Use**: Multilinear PLS methods; statistical properties.

##### Zhou, Li and Zhu (2013). Tensor Regression with Applications in Neuroimaging Data Analysis.
- **Key**: `Zhou2013TensorRegression`
- **Themes**: main 1
- **Type**: Journal article (Journal of the American Statistical Association 108(502), 540-552)
- **Identifier**: DOI 10.1080/01621459.2013.776499 (arXiv 1203.3209)
- **URL confirmed**: https://doi.org/10.1080/01621459.2013.776499
- **Method**: Generalized linear models with a tensor covariate whose coefficient array has low CP rank, fitted by a scalable maximum-likelihood algorithm, with asymptotic properties.
- **Key Findings**: The low-rank coefficient reduces ultrahigh dimensionality to a manageable number of parameters. The method is shown on synthetic data and real MRI data.
- **Relevance**: The reference model for predicting a subject-level outcome from an image tensor. It takes the voxel grid as shared across subjects, so registration to a common space is a precondition.
- **Quality**: High; 650 citations; must include by backward chaining.
- **Stance**: Neutral.
- **Potential Use**: Tensor regression methods; the registration assumption.

##### Li, Xu, Zhou and Li (2018). Tucker Tensor Regression and Neuroimaging Analysis.
- **Key**: `Li2018TuckerRegression`
- **Themes**: main 1
- **Type**: Journal article (Statistics in Biosciences 10(3), 520-545)
- **Identifier**: DOI 10.1007/s12561-018-9215-6 (arXiv 1304.5637)
- **URL confirmed**: https://doi.org/10.1007/s12561-018-9215-6
- **Method**: Generalized linear tensor regression with a Tucker-decomposed coefficient array, which allows a different number of factors per mode.
- **Key Findings**: The model recovers high-rank signals in simulation and consistently estimates the best Tucker approximation in Kullback-Leibler distance. It is compared with the CP model on simulated and MRI data.
- **Relevance**: The Tucker counterpart of CP regression for subject-level neuroimaging outcomes, on registered images.
- **Quality**: High; 190 citations.
- **Stance**: Neutral.
- **Potential Use**: Tensor regression methods.

##### Guhaniyogi, Qamar and Dunson (2017). Bayesian Tensor Regression.
- **Key**: `Guhaniyogi2017BayesianTensorRegression`
- **Themes**: main 1
- **Type**: Journal article (Journal of Machine Learning Research 18(79), 1-31)
- **Identifier**: arXiv 1509.06490 (JMLR has no DOI)
- **URL confirmed**: https://jmlr.org/papers/v18/16-362.html (citation metadata read) and https://arxiv.org/abs/1509.06490
- **Method**: Scalar-on-tensor regression with multiway shrinkage priors on a PARAFAC-structured coefficient, with posterior consistency results and an MCMC sampler.
- **Key Findings**: In simulation the approach improves estimation and inference over vectorizing the tensor and over existing tensor regression methods. It is illustrated on a neuroimaging application.
- **Relevance**: The Bayesian form of subject-level tensor regression, again on a common voxel grid.
- **Quality**: High; 155 citations.
- **Stance**: Neutral.
- **Potential Use**: Tensor regression methods; uncertainty quantification.

##### Lock (2018). Tensor-on-Tensor Regression.
- **Key**: `Lock2018TensorOnTensor`
- **Themes**: main 1
- **Type**: Journal article (Journal of Computational and Graphical Statistics 27(3), 638-647)
- **Identifier**: DOI 10.1080/10618600.2017.1401544 (arXiv 1701.01037)
- **URL confirmed**: https://doi.org/10.1080/10618600.2017.1401544
- **Method**: Linear prediction of a tensor from a tensor by the contracted tensor product, with a reduced CP-rank coefficient, ridge penalty and a Gibbs sampler.
- **Key Findings**: The framework contains scalar-on-tensor, matrix-on-matrix and tensor-on-scalar regression as special cases. It is illustrated on facial image data.
- **Relevance**: The general linear form into which the regressions above fit. All modes are indexed in common across samples.
- **Quality**: High; 138 citations.
- **Stance**: Neutral.
- **Potential Use**: Tensor regression methods.

##### Liu, Zhu, Long and Liu (2021). Tensor Regression.
- **Key**: `Liu2021TensorRegressionMonograph`
- **Themes**: main 1
- **Type**: Monograph (Foundations and Trends in Machine Learning 14(4), 379-565)
- **Identifier**: DOI 10.1561/2200000087 (arXiv 2308.11419)
- **URL confirmed**: https://doi.org/10.1561/2200000087
- **Method**: Survey of tensor-based regression models by regression family, low-rank representation and optimization framework, with data sets and software.
- **Key Findings**: Groups the existing tensor regression methods and their theory, and covers neuroimaging uses such as disease diagnosis and connectivity analysis.
- **Relevance**: A current map of the tensor regression literature in which a method for an unaligned mode can be placed.
- **Quality**: Medium as evidence (a survey); 30 citations for the arXiv version record.
- **Stance**: Neutral.
- **Potential Use**: Introduction and background on tensor regression.

##### Kolda and Bader (2009). Tensor Decompositions and Applications.
- **Key**: `Kolda2009TensorDecompositions`
- **Themes**: main 1
- **Type**: Journal article, survey (SIAM Review 51(3), 455-500)
- **Identifier**: DOI 10.1137/07070111X
- **URL confirmed**: https://doi.org/10.1137/07070111X
- **Method**: Survey of higher-order tensor decompositions and software.
- **Key Findings**: Presents CP and Tucker as higher-order extensions of the SVD, and lists further decompositions including PARAFAC2, INDSCAL and PARATUCK2.
- **Relevance**: The standard reference for the CP, Tucker and PARAFAC2 models on which the regressions and decompositions of this theme rest.
- **Quality**: High; 11082 citations.
- **Stance**: Neutral.
- **Potential Use**: Background and notation.

##### Kiers, ten Berge and Bro (1999). PARAFAC2, Part I. A direct fitting algorithm for the PARAFAC2 model.
- **Key**: `Kiers1999PARAFAC2`
- **Themes**: main 1
- **Type**: Journal article (Journal of Chemometrics 13(3-4), 275-294)
- **Identifier**: DOI 10.1002/(SICI)1099-128X(199905/08)13:3/4<275::AID-CEM543>3.0.CO;2-B
- **URL confirmed**: https://doi.org/10.1002/(SICI)1099-128X(199905/08)13:3/4<275::AID-CEM543>3.0.CO;2-B
- **Method**: PARAFAC2 for a set of matrices that share their column units and differ in their row units or number of rows, fitted directly to the data matrices by alternating least squares.
- **Key Findings**: The direct fit is more efficient than the earlier indirect fit to cross-product matrices. It admits constraints and missing data, extends to higher-way data, and returns factor scores for the row units.
- **Relevance**: The model that removes the need for a shared index on one mode. Each subject keeps its own row set, and only the cross-product of the evolving factor is held constant. This is the tensor answer to the missing correspondence.
- **Quality**: High; 448 citations; must include by backward chaining.
- **Stance**: Supports the view that one mode can stay unaligned within a multilinear model.
- **Potential Use**: Core methods section on unaligned modes.

##### Perros et al. (2017). SPARTan: Scalable PARAFAC2 for Large & Sparse Data.
- **Key**: `Perros2017SPARTan`
- **Themes**: main 1
- **Type**: Conference paper (KDD 2017, 375-384)
- **Identifier**: DOI 10.1145/3097983.3098014 (arXiv 1703.04219)
- **URL confirmed**: https://doi.org/10.1145/3097983.3098014
- **Method**: An algorithmic reformulation of PARAFAC2 fitting that exploits its structure for large sparse data.
- **Key Findings**: The method was up to 22 times faster than the best earlier implementation and handled problem sizes where the baseline failed. It was applied to temporally evolving phenotypes in electronic health records.
- **Relevance**: States the problem of subjects "whose observations do not align naturally", with patients whose number and timing of visits differ, and makes PARAFAC2 usable at clinical scale.
- **Quality**: High; 85 citations; peer-reviewed proceedings.
- **Stance**: Supports.
- **Potential Use**: Unaligned-mode decompositions; clinical data.

##### Afshar et al. (2018). COPA: Constrained PARAFAC2 for Sparse & Large Datasets.
- **Key**: `Afshar2018COPA`
- **Themes**: main 1
- **Type**: Conference paper (CIKM 2018, 793-802)
- **Identifier**: DOI 10.1145/3269206.3271775 (arXiv 1803.04572)
- **URL confirmed**: https://doi.org/10.1145/3269206.3271775
- **Method**: PARAFAC2 with temporal smoothness, sparsity and non-negativity constraints, fitted by alternating optimization with ADMM.
- **Key Findings**: On electronic health record data with hundreds of thousands of patients, COPA was up to 36 times faster than earlier PARAFAC2 approaches that support only some of these constraints.
- **Relevance**: Makes the evolving factors of an unaligned mode interpretable, which is a precondition for using them as subject-level features.
- **Quality**: High; 48 citations.
- **Stance**: Supports.
- **Potential Use**: Unaligned-mode decompositions.

##### Afshar et al. (2020). TASTE: Temporal and Static Tensor Factorization for Phenotyping Electronic Health Records.
- **Key**: `Afshar2020TASTE`
- **Themes**: main 1
- **Type**: Conference paper (ACM CHIL 2020, 193-203)
- **Identifier**: DOI 10.1145/3368555.3384464 (arXiv 1911.05843)
- **URL confirmed**: https://doi.org/10.1145/3368555.3384464
- **Method**: Couples a non-negative PARAFAC2 model of the irregular temporal data with a non-negative matrix factorization of static patient data.
- **Key Findings**: On a heart failure study, TASTE was up to 14 times faster than several baselines and its phenotypes were judged clinically meaningful. Logistic regression on the TASTE phenotypes reached predictive accuracy comparable to recurrent neural networks.
- **Relevance**: Shows the two-stage route from an unaligned mode to a subject-level outcome: an irregular decomposition, then a classifier on the subject factors.
- **Quality**: High; 40 citations.
- **Stance**: Supports.
- **Potential Use**: Prediction from unaligned modes.

##### Yin et al. (2020). LogPar: Logistic PARAFAC2 Factorization for Temporal Binary Data with Missing Values.
- **Key**: `Yin2020LogPar`
- **Themes**: main 1
- **Type**: Conference paper (KDD 2020, 1625-1635)
- **Identifier**: DOI 10.1145/3394486.3403213
- **URL confirmed**: https://doi.org/10.1145/3394486.3403213
- **Method**: PARAFAC2 for binary irregular tensors with a Bernoulli likelihood and a positive-unlabeled loss for one-class missing values, with uniqueness and smoothness regularization.
- **Key Findings**: LogPar improved irregular tensor completion by up to 26 percent over the best baseline, and downstream heart failure and mortality prediction by 13.2 and 14 percent on average over earlier PARAFAC2 models.
- **Relevance**: Extends the unaligned-mode decomposition to binary data and reports its effect on subject-level prediction.
- **Quality**: High; 32 citations.
- **Stance**: Supports.
- **Potential Use**: Prediction from unaligned modes.

##### Ren et al. (2023). MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning for Computational Phenotyping.
- **Key**: `Ren2023MULTIPAR`
- **Themes**: main 1
- **Type**: Conference paper (Machine Learning for Health, PMLR 225, 498-511)
- **Identifier**: arXiv 2208.00993 (PMLR has no DOI)
- **URL confirmed**: https://proceedings.mlr.press/v225/ren23a.html (citation metadata read) and https://arxiv.org/abs/2208.00993
- **Method**: PARAFAC2 fitted jointly with static and dynamic prediction tasks, so that the supervision shapes the factors.
- **Key Findings**: On two temporal electronic health record data sets, the supervised factorization gave better tensor fit, more meaningful subgroups and better predictive performance than the compared methods.
- **Relevance**: The supervised form of PARAFAC2: a subject-level outcome is predicted inside the model that handles the unaligned mode, in place of the two-stage route of TASTE.
- **Quality**: Medium to high; 4 citations; peer-reviewed proceedings.
- **Stance**: Supports.
- **Potential Use**: Core methods section; supervised unaligned-mode models.

##### Roald et al. (2022). An AO-ADMM Approach to Constraining PARAFAC2 on All Modes.
- **Key**: `Roald2022AOADMMPARAFAC2`
- **Themes**: main 1
- **Type**: Journal article (SIAM Journal on Mathematics of Data Science 4(3), 1191-1222)
- **Identifier**: DOI 10.1137/21M1450033 (arXiv 2110.01278)
- **URL confirmed**: https://doi.org/10.1137/21M1450033
- **Method**: Fits PARAFAC2 by alternating optimization with ADMM, estimating the evolving factor matrices explicitly so that general penalties and hard constraints apply to them.
- **Key Findings**: On simulated data the approach allows flexible constraints, recovers the underlying patterns and is computationally efficient. It is applied to fMRI data of controls and patients with schizophrenia.
- **Relevance**: Lets the unaligned mode carry smoothness or other structure, which the implicit estimation of the classic algorithm prevents.
- **Quality**: High; 38 citations.
- **Stance**: Supports.
- **Potential Use**: Unaligned-mode decompositions.

##### Schenker, Wang and Acar (2023). PARAFAC2-Based Coupled Matrix and Tensor Factorizations.
- **Key**: `Schenker2023PARAFAC2CMTF`
- **Themes**: main 1
- **Type**: Conference paper (ICASSP 2023, 1-5)
- **Identifier**: DOI 10.1109/ICASSP49357.2023.10094562 (arXiv 2210.13054)
- **URL confirmed**: https://doi.org/10.1109/ICASSP49357.2023.10094562
- **Method**: Coupled matrix and tensor factorization in which the tensor part is PARAFAC2, fitted by AO-ADMM with constraints on all modes and linear couplings.
- **Key Findings**: In numerical experiments the framework recovers the underlying patterns under various constraints and couplings.
- **Relevance**: Joins an irregular tensor with aligned side data of the same subjects, which is the setting of an unaligned imaging mode with tabular covariates.
- **Quality**: Medium; 8 citations; simulation evidence only.
- **Stance**: Supports.
- **Potential Use**: Coupled and irregular factorization.

##### Hu, Lee and Wang (2021). Generalized Tensor Decomposition With Features on Multiple Modes.
- **Key**: `Hu2021GeneralizedTensorDecompositionFeatures`
- **Themes**: main 1
- **Type**: Journal article (Journal of Computational and Graphical Statistics 31(1), 204-218; issued online 2021)
- **Identifier**: DOI 10.1080/10618600.2021.1978471 (arXiv 1910.09499, titled "Supervised tensor decomposition with features on multiple modes")
- **URL confirmed**: https://doi.org/10.1080/10618600.2021.1978471
- **Method**: A supervised tensor decomposition that takes feature matrices on several modes as side information, for continuous, count and binary data, with an alternating algorithm and spectral initialization.
- **Key Findings**: On diffusion tensor imaging data from the Human Connectome Project, the method identifies a global connectivity pattern and the local regions associated with the subject features.
- **Relevance**: Links subject-level variables to a tensor in the reverse direction of scalar-on-tensor regression. The regions are a shared parcellation, so correspondence is fixed by the atlas.
- **Quality**: High; 13 citations.
- **Stance**: Neutral.
- **Potential Use**: Supervised decompositions.

##### Madsen, Churchill and M<latin small letter o with stroke>rup (2017). Quantifying functional connectivity in multi-subject fMRI data using component models.
- **Key**: `Madsen2017ComponentModelsFC`
- **Themes**: main 1
- **Type**: Journal article (Human Brain Mapping 38(2), 882-899)
- **Identifier**: DOI 10.1002/hbm.23425
- **URL confirmed**: https://doi.org/10.1002/hbm.23425 and PubMed record 27739635
- **Method**: A cross-validation framework that scores component models of multi-subject fMRI by how well they predict voxel-wise covariance in new data.
- **Key Findings**: Fully subject-specific subspaces and fully averaged models both generalize poorly. The best models hold a common spatial subspace with subject variability. PARAFAC2 gave the most stable functional connectivity relationships, and spatial ICA on concatenated data the most interpretable maps.
- **Relevance**: Evidence on how much subject-specific freedom an unaligned mode should get. Here the time courses, not the voxels, are the mode that differs across subjects.
- **Quality**: High; 36 citations.
- **Stance**: Supports PARAFAC2 for subject variability, with a trade-off in interpretability.
- **Potential Use**: Unaligned modes in neuroimaging.

##### Acar et al. (2022). Tracing Evolving Networks Using Tensor Factorizations vs. ICA-Based Approaches.
- **Key**: `Acar2022TracingEvolvingNetworks`
- **Themes**: main 1
- **Type**: Journal article (Frontiers in Neuroscience 16)
- **Identifier**: DOI 10.3389/fnins.2022.861402
- **URL confirmed**: https://doi.org/10.3389/fnins.2022.861402
- **Method**: PARAFAC2 on a subjects by voxels by time-windows tensor of fALFF summaries of task fMRI, compared with joint ICA and related methods.
- **Key Findings**: PARAFAC2 lets the spatial networks evolve across time windows and gives subject-mode patterns, spatial patterns and temporal patterns jointly. The subject-mode factor separates patients with schizophrenia from healthy controls.
- **Relevance**: Uses PARAFAC2 so that the spatial mode may change across slices, and reads a subject-level group difference from the subject factor.
- **Quality**: Medium to high; 15 citations; one data set.
- **Stance**: Supports.
- **Potential Use**: Unaligned modes in neuroimaging.

##### M<latin small letter o with stroke>rup et al. (2008). Shift-invariant multilinear decomposition of neuroimaging data.
- **Key**: `Morup2008ShiftCP`
- **Themes**: main 1
- **Type**: Journal article (NeuroImage 42(4), 1439-1450)
- **Identifier**: DOI 10.1016/j.neuroimage.2008.05.062
- **URL confirmed**: https://doi.org/10.1016/j.neuroimage.2008.05.062
- **Method**: ShiftCP, a CP model with an explicit per-slice shift along one mode, for data arranged as space by time by trial.
- **Key Findings**: The shift-invariant model copes with variable latencies, which cause degenerate solutions in instantaneous CP models. It is demonstrated on simulated, EEG and fMRI data.
- **Relevance**: Handles a misaligned mode by estimating a shift inside the decomposition, which is a parametric registration step built into the tensor model.
- **Quality**: High; 105 citations.
- **Stance**: Supports.
- **Potential Use**: Unaligned-mode decompositions; registration inside the model.

##### Yan, Paynabar and Pacella (2019). Structured Point Cloud Data Analysis Via Regularized Tensor Regression for Process Modeling and Optimization.
- **Key**: `Yan2019StructuredPointCloudTensorRegression`
- **Themes**: main 1; overlap 4
- **Type**: Journal article (Technometrics 61(3), 385-395)
- **Identifier**: DOI 10.1080/00401706.2018.1529628 (arXiv 1807.10278)
- **URL confirmed**: https://doi.org/10.1080/00401706.2018.1529628
- **Method**: Regularized tensor regression that represents a structured point cloud on its measurement grid as a tensor and links its variation to process variables.
- **Key Findings**: The approaches are evaluated in simulation and in a case study of turning process optimization.
- **Relevance**: A tensor model for point clouds. It needs the points to lie on a common grid, so the correspondence is supplied by the measurement design, and the point cloud is the response rather than the predictor. Flagged as an overlap with theme 4.
- **Quality**: Medium to high; 49 citations; industrial setting.
- **Stance**: Neutral.
- **Potential Use**: Point clouds in tensor models.

##### Huang, Chen and Zhang (2025). Cyclic-Shift Sparse Kronecker Tensor Classifier for Signal-Region Detection in Neuroimaging.
- **Key**: `Huang2025CyclicShiftSKPD`
- **Themes**: main 1
- **Type**: Preprint (arXiv, stat.ME), admitted under `cs_ml`
- **Identifier**: arXiv 2505.12113
- **URL confirmed**: https://arxiv.org/abs/2505.12113
- **Method**: Logistic sparse Kronecker product decomposition with a second, spatially shifted view of each image tensor, with consistency guarantees under a restricted isometry condition.
- **Key Findings**: In simulation the model recovers spatial signals under noise and misalignment. On OASIS-1 and ADNI-1 it classified Alzheimer's disease and placed its coefficients in regions such as the hippocampus.
- **Relevance**: A subject-level tensor classifier that adds robustness to residual misregistration across subjects, in place of assuming exact registration.
- **Quality**: Medium; 1 citation; not peer-reviewed.
- **Stance**: Supports.
- **Potential Use**: Tensor regression under misalignment.

##### Chatzis, Pfeffer, Lind and Acar (2023). A Time-Aware Tensor Decomposition for Tracking Evolving Patterns.
- **Key**: `chatzis2023timeaware`
- **Themes**: main 1
- **Type**: Conference paper (IEEE 33rd International Workshop on Machine Learning for Signal Processing, MLSP 2023, pp. 1-6).
- **Identifier**: DOI 10.1109/MLSP55844.2023.10285943 (arXiv 2308.07126)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record of 2308.07126, read in this merge run.
- **Method**: Temporal PARAFAC2 (tPARAFAC2) adds temporal smoothness regularization on the evolving factor matrices of PARAFAC2, fitted by alternating optimization with ADMM.
- **Key Findings**: On synthetic data tPARAFAC2 recovers gradually evolving patterns more accurately than PARAFAC2 and than coupled matrix factorization with temporal smoothness.
- **Relevance**: Extends the decompositions in which one mode may change across slices (here time, with spatial patterns allowed to evolve) by a structural prior on how the unaligned mode varies.
- **Quality**: Medium. Peer-reviewed workshop; synthetic evidence only.
- **Stance**: Supports.
- **Potential Use**: Unaligned-mode decompositions; recent PARAFAC2 work.

#### Theme 2: optimal transport for unaligned data

##### Cuturi (2013). Sinkhorn Distances: Lightspeed Computation of Optimal Transport.
- **Key**: `cuturi2013sinkhorn`
- **Themes**: main 2
- **Type**: Conference paper (NeurIPS 26); seminal work.
- **Identifier**: arXiv 1306.0895
- **URL confirmed**: https://papers.nips.cc/paper/2013/hash/af21d0c97db2e27e13572cbf59eb343d-Abstract.html and https://arxiv.org/abs/1306.0895
- **Method**: Adds an entropic term to the transport linear program and solves it by Sinkhorn-Knopp matrix scaling.
- **Key Findings**: The regularized optimum is still a distance and is computed several orders of magnitude faster than with transport solvers. On MNIST it outperforms the exact transport distance as a classification metric.
- **Relevance**: The entropic coupling is the soft correspondence that nearly every later source in this theme computes between two unaligned sets.
- **Quality**: High. Defines the solver the field uses; the evaluation is a single benchmark.
- **Stance**: Supports.
- **Potential Use**: Background on transport couplings; methods.

##### Peyr<latin small letter e with acute> and Cuturi (2019). Computational Optimal Transport with Applications to Data Sciences.
- **Key**: `peyre2019computational`
- **Themes**: main 2
- **Type**: Journal monograph (Foundations and Trends in Machine Learning 11(5-6)).
- **Identifier**: DOI 10.1561/2200000073 (arXiv 1803.00567)
- **URL confirmed**: https://doi.org/10.1561/2200000073 and https://arxiv.org/abs/1803.00567
- **Method**: Review of numerical transport: entropic regularization, semidiscrete and W1 transport, divergences, barycenters and GW.
- **Key Findings**: Sets out the algorithms and their costs for each transport problem in one notation. The barycenter and GW chapters give the computations that the template methods below differentiate through.
- **Relevance**: Reference text for every transport construction in this theme.
- **Quality**: High. Standard reference; a review, with no new empirical result.
- **Stance**: Neutral.
- **Potential Use**: Background; methods.

##### Benamou, Carlier, Cuturi, Nenna and Peyr<latin small letter e with acute> (2015). Iterative Bregman Projections for Regularized Transportation Problems.
- **Key**: `benamou2015iterative`
- **Themes**: main 2
- **Type**: Journal article (SIAM Journal on Scientific Computing 37(2)).
- **Identifier**: DOI 10.1137/141000439 (arXiv 1412.5154)
- **URL confirmed**: https://doi.org/10.1137/141000439 and https://arxiv.org/abs/1412.5154
- **Method**: Writes entropic transport problems as Kullback-Leibler projections onto intersections of simple constraint sets, solved by iterative Bregman projections or Bregman-Dykstra iterations.
- **Key Findings**: Barycenters, multi-marginal transport, partial and unbalanced transport and capacity constraints all reduce to closed-form projections. This gives the standard entropic barycenter algorithm.
- **Relevance**: The barycenter solver behind template estimation and Wasserstein dictionaries.
- **Quality**: High. Mathematical and numerical; applications are illustrative.
- **Stance**: Neutral.
- **Potential Use**: Methods.

##### Feydy, S<latin small letter e with acute>journ<latin small letter e with acute>, Vialard, Amari, Trouv<latin small letter e with acute> and Peyr<latin small letter e with acute> (2019). Interpolating between Optimal Transport and MMD using Sinkhorn Divergences.
- **Key**: `feydy2019interpolating`
- **Themes**: main 2; overlap 3
- **Type**: Conference paper (AISTATS 2019, PMLR 89).
- **Identifier**: arXiv 1810.08278
- **URL confirmed**: https://proceedings.mlr.press/v89/feydy19a.html and https://arxiv.org/abs/1810.08278
- **Method**: Studies the debiased Sinkhorn divergence, which interpolates between transport and maximum mean discrepancy (MMD) with the entropic parameter.
- **Key Findings**: Proves positivity, convexity and metrization of convergence in law. A GPU scheme computes Sinkhorn loss gradients for batches of a million samples.
- **Relevance**: Gives a loss between unaligned point clouds with guarantees, and links transport to the kernel mean embeddings of theme 3.
- **Quality**: High. Theory and a scalable implementation.
- **Stance**: Supports.
- **Potential Use**: Methods; link to theme 3.

##### M<latin small letter e with acute>moli (2011). Gromov-Wasserstein Distances and the Metric Approach to Object Matching.
- **Key**: `memoli2011gromov`
- **Themes**: main 2
- **Type**: Journal article (Foundations of Computational Mathematics 11(4)); seminal work.
- **Identifier**: DOI 10.1007/s10208-011-9093-5
- **URL confirmed**: https://doi.org/10.1007/s10208-011-9093-5
- **Method**: Treats shapes as metric measure spaces and defines a transport distance that compares their internal distances.
- **Key Findings**: Defines the GW distance and its properties, with lower bounds that can be computed. Two objects are compared without any map between their ambient coordinates.
- **Relevance**: GW is the distance that compares two subjects whose coordinates share no common space, which is the case of unregistered scans.
- **Quality**: High. Foundational theory.
- **Stance**: Supports.
- **Potential Use**: Background; methods.

##### Vayer, Chapel, Flamary, Tavenard and Courty (2019). Optimal Transport for structured data with application on graphs.
- **Key**: `vayer2019optimal`
- **Themes**: main 2
- **Type**: Conference paper (ICML 2019, PMLR 97).
- **Identifier**: arXiv 1805.09114
- **URL confirmed**: https://proceedings.mlr.press/v97/titouan19a.html and https://arxiv.org/abs/1805.09114
- **Method**: Defines the fused GW distance, a weighted sum of a feature transport term and a structure GW term over one coupling.
- **Key Findings**: FGW outperforms graph kernels and graph convolutional networks on graph classification. Its metric properties give FGW barycenters, used for graph clustering.
- **Relevance**: FGW is the distance for objects that carry both features (such as lesion radiomic vectors) and internal structure (such as distances between lesions).
- **Quality**: High. Widely used; benchmark graph datasets.
- **Stance**: Supports.
- **Potential Use**: Methods; core of the transport section.

##### Vayer, Chapel, Flamary, Tavenard and Courty (2020). Fused Gromov-Wasserstein Distance for Structured Objects.
- **Key**: `vayer2020fused`
- **Themes**: main 2
- **Type**: Journal article (Algorithms 13(9)).
- **Identifier**: DOI 10.3390/a13090212 (arXiv 1811.02834)
- **URL confirmed**: https://doi.org/10.3390/a13090212 and https://arxiv.org/abs/1811.02834
- **Method**: Mathematical treatment of FGW.
- **Key Findings**: Proves the metric and interpolation properties of FGW and gives a concentration result for finite samples.
- **Relevance**: The theory that justifies using FGW distances and barycenters between subjects with sets of different size.
- **Quality**: Medium. Sound theory; the journal is of lower standing than the venues of the other core papers.
- **Stance**: Neutral.
- **Potential Use**: Methods.

##### Vincent-Cuaz, Flamary, Corneli, Vayer and Courty (2022). Semi-relaxed Gromov-Wasserstein divergence and applications on graphs.
- **Key**: `vincentcuaz2022semirelaxed`
- **Themes**: main 2
- **Type**: Conference paper (ICLR 2022).
- **Identifier**: arXiv 2110.02753
- **URL confirmed**: https://iclr.cc/virtual/2022/poster/6131 and https://arxiv.org/abs/2110.02753
- **Method**: Relaxes one marginal constraint of GW, so the target graph's node weights are optimized in the coupling.
- **Key Findings**: The semi-relaxed divergence is cheaper to compute and gives an efficient graph dictionary learning algorithm. It performs well on graph partitioning, clustering and completion.
- **Relevance**: Lets one subject map onto part of a template, which fits subjects whose number of lesions or regions differs from the template's.
- **Quality**: High. Main venue; experiments are unsupervised.
- **Stance**: Supports.
- **Potential Use**: Methods.

##### Agueh and Carlier (2011). Barycenters in the Wasserstein Space.
- **Key**: `agueh2011barycenters`
- **Themes**: main 2
- **Type**: Journal article (SIAM Journal on Mathematical Analysis 43(2)); seminal work.
- **Identifier**: DOI 10.1137/100805741
- **URL confirmed**: https://doi.org/10.1137/100805741
- **Method**: Defines the Wasserstein barycenter as the minimizer of a weighted sum of squared Wasserstein distances.
- **Key Findings**: Proves existence, uniqueness and regularity, links barycenters to multi-marginal transport, and solves the Gaussian case.
- **Relevance**: The barycenter is the formal definition of a population template in transport space.
- **Quality**: High. Foundational theory.
- **Stance**: Neutral.
- **Potential Use**: Background; methods.

##### Cuturi and Doucet (2014). Fast Computation of Wasserstein Barycenters.
- **Key**: `cuturi2014fast`
- **Themes**: main 2
- **Type**: Conference paper (ICML 2014, PMLR 32); seminal work.
- **Identifier**: arXiv 1310.4375
- **URL confirmed**: https://proceedings.mlr.press/v32/cuturi14.html and https://arxiv.org/abs/1310.4375
- **Method**: Smooths the barycenter objective with an entropic term and solves it by subgradient methods with matrix scaling.
- **Key Findings**: Gives two algorithms for barycenters of empirical measures, one a generalization of Lloyd's algorithm. They are applied to image averaging and constrained clustering.
- **Relevance**: The first scalable computation of a template from a set of unaligned samples.
- **Quality**: High. Main venue; illustrative experiments.
- **Stance**: Supports.
- **Potential Use**: Methods.

##### Bonneel, Peyr<latin small letter e with acute> and Cuturi (2016). Wasserstein Barycentric Coordinates: Histogram Regression Using Optimal Transport.
- **Key**: `bonneel2016wasserstein`
- **Themes**: main 2
- **Type**: Journal article (ACM Transactions on Graphics 35(4), SIGGRAPH 2016).
- **Identifier**: DOI 10.1145/2897824.2925918
- **URL confirmed**: https://doi.org/10.1145/2897824.2925918
- **Method**: Solves the inverse barycenter problem, finding the weights under which a set of reference histograms best reconstructs a given histogram, by gradient descent through Sinkhorn iterations.
- **Key Findings**: Barycentric coordinates give a low-dimensional code of a histogram relative to fixed references. It is applied to shape approximation, BRDF acquisition and color editing.
- **Relevance**: The coordinates of a subject relative to a set of templates are a fixed-size feature vector that a predictor can take.
- **Quality**: High. Top graphics venue; applications are outside medicine.
- **Stance**: Supports.
- **Potential Use**: Methods; template-coordinate features.

##### Schmitz, Heitz, Bonneel, Ngol<latin small letter e with grave>, Coeurjolly, Cuturi, Peyr<latin small letter e with acute> and Starck (2018). Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning.
- **Key**: `schmitz2018wasserstein`
- **Themes**: main 2
- **Type**: Journal article (SIAM Journal on Imaging Sciences 11(1)).
- **Identifier**: DOI 10.1137/17M1140431 (arXiv 1708.01955)
- **URL confirmed**: https://doi.org/10.1137/17M1140431 and https://arxiv.org/abs/1708.01955
- **Method**: Learns dictionary atoms and per-sample weights so that each sample is reconstructed as an entropic Wasserstein barycenter of the atoms, by automatic differentiation of the Sinkhorn iterations.
- **Key Findings**: The barycentric reconstruction is nonlinear in the atoms and is tractable through entropic smoothing. It is shown on several image processing tasks.
- **Relevance**: The first learned set of transport templates; the weights act as a subject code.
- **Quality**: High. Peer-reviewed journal; unsupervised.
- **Stance**: Supports.
- **Potential Use**: Methods; dictionary and template section.

##### Xu (2020). Gromov-Wasserstein Factorization Models for Graph Clustering.
- **Key**: `xu2020gromov`
- **Themes**: main 2
- **Type**: Conference paper (AAAI 2020).
- **Identifier**: DOI 10.1609/aaai.v34i04.6120 (arXiv 1911.08530)
- **URL confirmed**: https://doi.org/10.1609/aaai.v34i04.6120 and https://arxiv.org/abs/1911.08530
- **Method**: Models each graph as a GW barycenter of learned atoms and learns atoms and weights by unrolled proximal or Bregman ADMM iterations.
- **Key Findings**: Observed graphs and atoms may be unaligned and of different sizes. The weights give an embedding that clusters graphs well.
- **Relevance**: GW dictionaries extend the template idea to structured subjects with no node correspondence.
- **Quality**: Medium. Main venue; clustering experiments only.
- **Stance**: Supports.
- **Potential Use**: Methods.

##### Vincent-Cuaz, Vayer, Flamary, Corneli and Courty (2021). Online Graph Dictionary Learning.
- **Key**: `vincentcuaz2021online`
- **Themes**: main 2
- **Type**: Conference paper (ICML 2021, PMLR 139).
- **Identifier**: arXiv 2102.06555
- **URL confirmed**: https://proceedings.mlr.press/v139/vincent-cuaz21a.html and https://arxiv.org/abs/2102.06555
- **Method**: Models graphs as linear combinations of graph atoms under a GW data-fitting term, learned by an online stochastic algorithm.
- **Key Findings**: The method runs on datasets of unregistered graphs with different node counts. An upper bound gives a fast approximation of GW in the embedding space.
- **Relevance**: Template learning stated directly for unregistered inputs, which is the setting of the research question.
- **Quality**: High. Main venue; unsupervised embedding and tracking experiments.
- **Stance**: Supports.
- **Potential Use**: Methods.

##### Vincent-Cuaz, Flamary, Corneli, Vayer and Courty (2022). Template based Graph Neural Network with Optimal Transport Distances.
- **Key**: `vincentcuaz2022template`
- **Themes**: main 2
- **Type**: Conference paper (NeurIPS 35).
- **Identifier**: arXiv 2205.15733
- **URL confirmed**: https://proceedings.neurips.cc/paper_files/paper/2022/hash/4d3525bc60ba1adc72336c0392d3d902-Abstract-Conference.html and https://arxiv.org/abs/2205.15733
- **Method**: Represents a graph by its vector of FGW distances to a set of template graphs, feeds it to a classifier, and learns the templates end to end by differentiating through FGW.
- **Key Findings**: The template-distance layer is competitive with or better than graph kernels and GNNs on synthetic and real graph classification datasets. An ablation and a sensitivity study accompany the results.
- **Relevance**: The closest construction in this theme to supervised prediction through learned templates: each subject is placed by its transport distances to learned prototypes, with no registration.
- **Quality**: High. Main venue; graph benchmarks, no medical data.
- **Stance**: Supports.
- **Potential Use**: Core of the transport section; methods.

##### Brogat-Motte, Flamary, Brouard, Rousu and d'Alch<latin small letter e with acute>-Buc (2022). Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters.
- **Key**: `brogatmotte2022learning`
- **Themes**: main 2
- **Type**: Conference paper (ICML 2022, PMLR 162).
- **Identifier**: arXiv 2202.03813
- **URL confirmed**: https://proceedings.mlr.press/v162/brogat-motte22a.html and https://arxiv.org/abs/2202.03813
- **Method**: Treats graph prediction as regression under an FGW loss, with the prediction an FGW barycenter whose weights depend on the input, either by kernel ridge regression or by a neural network with learned template graphs.
- **Key Findings**: The kernel estimator is consistent and has an excess-risk bound. The parametric model performs well on metabolite identification with little feature engineering.
- **Relevance**: Supervised learning through barycenters and learned templates, here with the unaligned object as output; the input side is the subject of Vincent-Cuaz et al. (2022).
- **Quality**: High. Main venue; theory and one real application.
- **Stance**: Supports.
- **Potential Use**: Methods; supervised barycenter models.

##### Wang, Slep<latin small letter c with caron>ev, Basu, Ozolek and Rohde (2013). A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images.
- **Key**: `wang2013linear`
- **Themes**: main 2
- **Type**: Journal article (International Journal of Computer Vision 101(2)); seminal work.
- **Identifier**: DOI 10.1007/s11263-012-0566-z
- **URL confirmed**: https://doi.org/10.1007/s11263-012-0566-z
- **Method**: Linear optimal transport (LOT): each image is represented by its transport map from one reference, so distances become Euclidean in the tangent space.
- **Key Findings**: LOT gives fast pairwise distances and an isometric linear embedding to which PCA and LDA apply. It is shown on nuclear chromatin in cancer cells, faces, galaxies and subcellular protein patterns.
- **Relevance**: The reference distribution plays the role of a common space reached by transport maps in place of registration; later learned-reference methods build on it.
- **Quality**: High. Main journal; includes biomedical image sets.
- **Stance**: Supports.
- **Potential Use**: Background; methods.

##### Moosm<latin small letter u with diaeresis>ller and Cloninger (2023). Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations.
- **Key**: `moosmuller2023linear`
- **Themes**: main 2
- **Type**: Journal article (Information and Inference: A Journal of the IMA 12(1)).
- **Identifier**: DOI 10.1093/imaiai/iaac023 (arXiv 2008.09165)
- **URL confirmed**: https://doi.org/10.1093/imaiai/iaac023 and https://arxiv.org/abs/2008.09165
- **Method**: Analyzes LOT and characterizes when it embeds families of distributions in a linearly separable way.
- **Key Findings**: Families generated by shifts and scalings of a distribution become linearly separable in any dimension. The LOT distance is nearly isometric to Wasserstein-2 under stated conditions, so N transport maps give all N squared pairwise distances.
- **Relevance**: A guarantee that a transport embedding to one reference absorbs rigid misalignment, which is the residual misalignment registration would otherwise remove.
- **Quality**: High. Theory journal, with distribution classification experiments.
- **Stance**: Supports.
- **Potential Use**: Methods; theoretical justification.

##### Kolouri, Naderializadeh, Rohde and Hoffmann (2021). Wasserstein Embedding for Graph Learning.
- **Key**: `kolouri2021wasserstein`
- **Themes**: main 2
- **Type**: Conference paper (ICLR 2021).
- **Identifier**: arXiv 2006.09430
- **URL confirmed**: https://iclr.cc/virtual/2021/poster/3182 and https://arxiv.org/abs/2006.09430
- **Method**: Embeds node features of each graph, then computes Monge maps from a reference distribution to obtain a fixed-size vector (WEGL).
- **Key Findings**: The number of transport computations grows linearly in the number of graphs, against quadratically for pairwise distances. WEGL reaches strong graph-property prediction accuracy at lower cost.
- **Relevance**: A fixed reference turns a variable-size unordered set into a vector for any downstream predictor.
- **Quality**: High. Main venue; graph benchmarks.
- **Stance**: Supports.
- **Potential Use**: Methods.

##### Nguyen and Tsuda (2023). On a linear fused Gromov-Wasserstein distance for graph structured data.
- **Key**: `nguyen2023linear`
- **Themes**: main 2
- **Type**: Journal article (Pattern Recognition 138).
- **Identifier**: DOI 10.1016/j.patcog.2023.109351 (arXiv 2203.04711)
- **URL confirmed**: https://doi.org/10.1016/j.patcog.2023.109351 and https://arxiv.org/abs/2203.04711
- **Method**: Embeds graphs into a vector space by FGW transport to a reference and defines linearFGW as the Euclidean distance between embeddings.
- **Key Findings**: linearFGW keeps node features and topology and computes kernel matrices much faster than pairwise FGW. It is evaluated on graph classification and clustering.
- **Relevance**: Carries the LOT reference idea to fused structure and features.
- **Quality**: Medium. Peer-reviewed journal; benchmark graphs only.
- **Stance**: Supports.
- **Potential Use**: Methods.

##### Bai, Kothapalli, Du, Diaz Martin and Kolouri (2025). Linear Partial Gromov-Wasserstein Embedding.
- **Key**: `bai2025linear`
- **Themes**: main 2
- **Type**: Conference paper (ICLR 2025, poster).
- **Identifier**: arXiv 2410.16669
- **URL confirmed**: https://arxiv.org/abs/2410.16669 (comment: "Published at ICLR 2025"); OpenReview API record BA1eG7vCNb, venue "ICLR 2025 Poster"
- **Method**: Linearizes the partial GW problem around a reference, so K metric measure spaces need O(K) partial GW solves.
- **Key Findings**: LPGW defines a valid metric for metric measure spaces. It keeps the partial-matching behaviour of partial GW in shape retrieval and in learning with transport embeddings, at lower cost.
- **Relevance**: Handles subjects whose total mass differs, such as different lesion burden, within a reference embedding.
- **Quality**: Medium. Main venue; experiments are shape retrieval and small learning tasks.
- **Stance**: Supports.
- **Potential Use**: Methods; unbalanced templates.

##### Mahan, Moosm<latin small letter u with diaeresis>ller and Cloninger (2024). Point Cloud Classification via Deep Set Linearized Optimal Transport.
- **Key**: `mahan2024point`
- **Themes**: main 2; overlap 3
- **Type**: Preprint (arXiv), admitted under `cs_ml`.
- **Identifier**: arXiv 2401.01460
- **URL confirmed**: https://arxiv.org/abs/2401.01460
- **Method**: Learns transport maps from a shared reference to each point cloud with input convex neural networks, then weights the samples with a discriminator to form a permutation-invariant classifier.
- **Key Findings**: L2 distances between the learned maps approximate Wasserstein-2 distances under stated conditions. The model outperforms Deep Sets on a flow cytometry dataset with few labeled point clouds.
- **Relevance**: Subject-level classification from biomedical point clouds through a transport reference, compared directly with a permutation-invariant set encoder.
- **Quality**: Medium. Preprint; one dataset.
- **Stance**: Supports.
- **Potential Use**: Methods; comparison of transport and set encoders.

##### Togninalli, Ghisu, Llinares-L<latin small letter o with acute>pez, Rieck and Borgwardt (2019). Wasserstein Weisfeiler-Lehman Graph Kernels.
- **Key**: `togninalli2019wasserstein`
- **Themes**: main 2
- **Type**: Conference paper (NeurIPS 32).
- **Identifier**: arXiv 1906.01277
- **URL confirmed**: https://papers.nips.cc/paper/8872-wasserstein-weisfeiler-lehman-graph-kernels and https://arxiv.org/abs/1906.01277
- **Method**: Compares graphs by the Wasserstein distance between their distributions of Weisfeiler-Lehman node features, for continuous attributes and weighted edges, inside a kernel.
- **Key Findings**: The distribution view keeps information that sum or mean aggregation discards. The kernel improves graph classification accuracy on several benchmarks.
- **Relevance**: Prediction from a set of node descriptors by a pairwise transport kernel, with no template.
- **Quality**: High. Main venue, public code.
- **Stance**: Supports.
- **Potential Use**: Methods; pairwise transport kernels.

##### Mialon, Chen, d'Aspremont and Mairal (2021). A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention.
- **Key**: `mialon2021trainable`
- **Themes**: main 2; overlap 3
- **Type**: Conference paper (ICLR 2021).
- **Identifier**: arXiv 2006.12065
- **URL confirmed**: https://iclr.cc/virtual/2021/poster/2853 and https://arxiv.org/abs/2006.12065
- **Method**: Embeds set elements and pools them by the transport plan between the set and a trainable reference (OTKE).
- **Key Findings**: The reference trains end to end and scales to large datasets. The method reaches state-of-the-art protein fold recognition and chromatin profile detection, and can be read as attention or as a surrogate of a transport kernel.
- **Relevance**: A learned reference that turns an unordered set into a fixed-size vector, and a formal link between transport pooling and the attention pooling of theme 3.
- **Quality**: High. Main venue; biological sequence benchmarks.
- **Stance**: Supports.
- **Potential Use**: Methods; link to theme 3.

##### Meunier, Pontil and Ciliberto (2022). Distribution Regression with Sliced Wasserstein Kernels.
- **Key**: `meunier2022distribution`
- **Themes**: main 2; overlap 3
- **Type**: Conference paper (ICML 2022, PMLR 162).
- **Identifier**: arXiv 2202.03926
- **URL confirmed**: https://proceedings.mlr.press/v162/meunier22b.html and https://arxiv.org/abs/2202.03926
- **Method**: Kernel ridge regression on a sliced Wasserstein representation of each input distribution.
- **Key Findings**: The estimator is universally consistent with excess-risk bounds. It compares well with MMD-based estimators in experiments.
- **Relevance**: Regression of a scalar outcome from an unordered sample per subject, with statistical guarantees, set against the kernel mean embeddings of theme 3.
- **Quality**: High. Main venue; experiments are preliminary by the authors' description.
- **Stance**: Supports.
- **Potential Use**: Methods; theory of subject-level regression from sets.

##### Xu and Cheng (2023). Regularized Optimal Transport Layers for Generalized Global Pooling Operations.
- **Key**: `xu2023regularized`
- **Themes**: main 2; overlap 3
- **Type**: Journal article (IEEE Transactions on Pattern Analysis and Machine Intelligence 45(12)).
- **Identifier**: DOI 10.1109/TPAMI.2023.3314661 (arXiv 2212.06339)
- **URL confirmed**: https://doi.org/10.1109/tpami.2023.3314661 and https://arxiv.org/abs/2212.06339
- **Method**: Shows that common global pooling operators solve regularized transport problems and makes their parameters learnable as implicit layers (ROTP).
- **Key Findings**: ROTP layers recover existing pooling methods or learn new ones. They are tested on multiple-instance learning, graph classification, graph set representation and image classification.
- **Relevance**: Places permutation-invariant pooling inside a transport formulation, which covers multiple-instance learning over sets of instances.
- **Quality**: High. Top journal; several task families.
- **Stance**: Supports.
- **Potential Use**: Methods; link to theme 3.

##### Ren, Wang, Fang, Ling and You (2025). OTSurv: A Novel Multiple Instance Learning Framework for Survival Prediction with Heterogeneity-aware Optimal Transport.
- **Key**: `ren2025otsurv`
- **Themes**: main 2; overlap 4
- **Type**: Preprint (arXiv); its arXiv comment says accepted by MICCAI 2025. Admitted under `cs_ml`.
- **Identifier**: arXiv 2506.20741
- **URL confirmed**: https://arxiv.org/abs/2506.20741
- **Method**: Formulates survival prediction from a whole-slide image as an unbalanced transport problem over its patches, with a long-tail constraint on the morphological distribution and an uncertainty constraint on transported mass, solved by matrix scaling.
- **Key Findings**: Reports state-of-the-art results on six survival benchmarks, an absolute 3.6 percent gain in average C-index, and significant log-rank tests.
- **Relevance**: Subject-level outcome prediction from an unaligned set of image regions through a transport coupling, in a medical pipeline that uses no region correspondence across patients.
- **Quality**: Medium. Recent; the MICCAI acceptance is stated by the authors and was not checked on a proceedings page in this run.
- **Stance**: Supports.
- **Potential Use**: Medical application of transport-based set prediction; bridge to theme 4.

##### Gramfort, Peyre and Cuturi (2015). Fast Optimal Transport Averaging of Neuroimaging Data.
- **Key**: `gramfort2015fast`
- **Themes**: main 2, 4
- **Type**: Conference paper (Information Processing in Medical Imaging, IPMI 2015, LNCS, pp. 261-272).
- **Identifier**: DOI 10.1007/978-3-319-19992-4_20 (arXiv 1503.08596)
- **URL confirmed**: https://doi.org/10.1007/978-3-319-19992-4_20 and https://arxiv.org/abs/1503.08596 (both theme runs 2 and 4)
- **Method**: Averages non-normalized brain maps by entropy-smoothed Kantorovich means, linked to entropic Wasserstein barycenters, with a constraint on total mass; the maps lie on voxel grids or cortical triangulations. Evaluated on fMRI (20 subjects) and MEG source estimates (16 subjects).
- **Key Findings**: A smooth convex problem with convergence guarantees gives group averages that keep spatially non-overlapping effects, where linear averaging after smoothing blurs them.
- **Relevance**: An early medical-imaging use of a transport barycenter as the group template in place of smoothing after registration. The data are still in a template space or on a cortical mesh, so transport handles residual misalignment and does not replace the registration step.
- **Quality**: Medium. Theme run 2 rated it Medium for its small samples and its data in a template space; theme run 4 rated it High as the foundational transport work in neuroimaging. The merged rating keeps the lower of the two because the evidence is two small cohorts.
- **Stance**: Supports.
- **Potential Use**: Transport barycenters as templates; bridge from transport methods to medical-imaging pipelines.

##### Thual, Tran, Zemskova, Courty, Flamary, Dehaene and Thirion (2022). Aligning individual brains with fused unbalanced Gromov Wasserstein.
- **Key**: `thual2022aligning`
- **Themes**: main 2, 4
- **Type**: Conference paper (Advances in Neural Information Processing Systems 35, pp. 21792-21804).
- **Identifier**: DOI 10.52202/068431-1584 (arXiv 2206.09398)
- **URL confirmed**: https://proceedings.neurips.cc/paper_files/paper/2022/hash/8906cac4ca58dcaf17e97a0486ad57ca-Abstract-Conference.html (its `citation_doi` meta field gives 10.52202/068431-1584, pages 21792-21804); https://doi.org/10.52202/068431-1584 returned HTTP 302, and its Crossref record gives the same title, the seven authors and pages 21792-21804; https://arxiv.org/abs/2206.09398.
- **Method**: Fused unbalanced Gromov-Wasserstein (FUGW) couples two cortical surfaces by the similarity of their functional signatures while penalizing distortion of each subject's geometry. The unbalanced marginals let functional areas differ in size between subjects.
- **Key Findings**: FUGW gives whole-brain alignment without landmarks. It raises between-subject correlation of activity on held-out fMRI tasks and gives sharper group-level maps than anatomical co-registration.
- **Relevance**: A transport coupling across subjects whose spatial modes differ, with the geometry of each subject kept. It replaces part of the inter-subject registration step and is the alignment that subject-level fusion can build on.
- **Quality**: High. Main venue, public fMRI data and code (both theme runs).
- **Stance**: Supports.
- **Potential Use**: Transport couplings across subjects; discussion of where transport replaces registration.

##### Naderializadeh, Comer, Andrews, Hoffmann and Kolouri (2021). Pooling by Sliced-Wasserstein Embedding.
- **Key**: `naderializadeh2021set`
- **Themes**: main 2; overlap 3
- **Type**: Conference paper (Advances in Neural Information Processing Systems 34, pp. 3389-3400).
- **Identifier**: arXiv 2103.03892 (the preprint of the same work, posted under the title "Set Representation Learning with Generalized Sliced-Wasserstein Embeddings"); the NeurIPS page shows no DOI.
- **URL confirmed**: https://proceedings.neurips.cc/paper/2021/hash/1bc2029a8851ad344a8d503930dfd7f7-Abstract.html (title, five authors and venue read in this merge run); https://arxiv.org/abs/2103.03892 (title, authors, single version of 5 March 2021); pages 3389-3400 read from the Scholars@Duke record https://scholars.duke.edu/publication/1596737.
- **Method**: Treats the elements of a set as samples of a probability measure and gives an exact, end-to-end trainable Euclidean embedding of the (generalized) sliced-Wasserstein distance to a reference set, used as a pooling layer.
- **Key Findings**: The embedding is a permutation-invariant pooling whose Euclidean distances equal the sliced-Wasserstein distances between the sets. It is reported to outperform set representation baselines on point-cloud, graph and image classification.
- **Relevance**: Sliced transport pooling to a reference sits between the pairwise transport kernels of theme 2 and the set encoders of theme 3.
- **Quality**: High. Main venue; the experiments are benchmark classification tasks.
- **Stance**: Supports.
- **Potential Use**: Methods; link between transport embeddings and set pooling.

##### Peyre, Cuturi and Solomon (2016). Gromov-Wasserstein Averaging of Kernel and Distance Matrices.
- **Key**: `peyre2016gromov`
- **Themes**: main 2
- **Type**: Conference paper (Proceedings of the 33rd International Conference on Machine Learning, PMLR 48:2664-2672); seminal work.
- **Identifier**: none. The PMLR page shows no DOI and no arXiv ID; theme run 2 found none in Crossref or arXiv title search. Included under the decision of `settings.md` on proceedings-only sources.
- **URL confirmed**: https://proceedings.mlr.press/v48/peyre16.html (title, authors, proceedings, volume 48, pages 2664-2672 and the abstract read in this merge run).
- **Method**: Computes the barycenter of a set of distance or kernel matrices under the Gromov-Wasserstein discrepancy with entropic regularization, solved by an alternating scheme of Sinkhorn projections and closed-form updates.
- **Key Findings**: The matrices to be averaged need not have the same size or be in row-by-row correspondence, so a barycenter of unregistered structures can be computed.
- **Relevance**: The origin of the Gromov-Wasserstein barycenter that the research question names as a learned template. The later GW dictionaries and template-based networks build on it.
- **Quality**: High. Main venue; defines the construction.
- **Stance**: Supports.
- **Potential Use**: Background on GW templates; methods.

##### Montesuma, Mboula and Souloumiac (2025). Recent Advances in Optimal Transport for Machine Learning.
- **Key**: `montesuma2025recent`
- **Themes**: main 2
- **Type**: Journal article, survey (IEEE Transactions on Pattern Analysis and Machine Intelligence 47(2):1161-1180).
- **Identifier**: DOI 10.1109/TPAMI.2024.3489030 (arXiv 2306.16156)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record, read in this merge run.
- **Method**: Survey of optimal transport in supervised, unsupervised, transfer and reinforcement learning from 2012 to 2023, with computational advances such as partial, unbalanced, Gromov and neural transport.
- **Key Findings**: Organizes transport-based learning by task family and covers the unbalanced and Gromov variants that the template methods of this review use.
- **Relevance**: A current map of transport methods for supervised prediction, against which the subject-level transport predictors can be placed.
- **Quality**: High. Top journal; a survey, with no new empirical result.
- **Stance**: Neutral.
- **Potential Use**: Introduction; background on transport in machine learning.

##### Khamis, Tsuchida, Tarek, Rolland and Petersson (2024). Scalable Optimal Transport Methods in Machine Learning: A Contemporary Survey.
- **Key**: `khamis2024scalable`
- **Themes**: main 2
- **Type**: Journal article, survey (IEEE Transactions on Pattern Analysis and Machine Intelligence, pp. 1-20).
- **Identifier**: DOI 10.1109/TPAMI.2024.3379571 (arXiv 2305.05080)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record (journal reference "IEEE Transactions on Pattern Analysis and Machine Intelligence 2024"), read in this merge run.
- **Method**: Survey of transport formulations, properties and applications in machine learning, with a taxonomy of the methods that scale transport to large and high-dimensional data.
- **Key Findings**: Groups scaling methods (entropic, sliced, low-rank, minibatch and others) in one taxonomy and lists open challenges.
- **Relevance**: The cost of transport between many subjects with many points is the practical limit of pairwise transport kernels; this survey gives the scaling options.
- **Quality**: High. Top journal; a survey.
- **Stance**: Neutral.
- **Potential Use**: Methods background; computational cost of transport.

##### Sejourne, Peyre and Vialard (2023). Unbalanced Optimal Transport, from theory to numerics.
- **Key**: `sejourne2023unbalanced`
- **Themes**: main 2
- **Type**: Book chapter (Handbook of Numerical Analysis, Elsevier, pp. 407-471).
- **Identifier**: DOI 10.1016/bs.hna.2022.11.003 (arXiv 2211.08775)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record, read in this merge run.
- **Method**: Review of unbalanced transport between arbitrary positive measures, entropic regularization and the Gromov-Wasserstein distance, and how they combine into geometric loss functions.
- **Key Findings**: Unbalanced transport is robust to outliers and missing data because total mass may vary; entropic regularization gives scalable algorithms; GW compares distributions in different metric spaces.
- **Relevance**: The theory behind the unbalanced and fused variants (FUGW, robust transport for point clouds, OTSurv) that let subjects differ in lesion count or total burden.
- **Quality**: High. Authoritative review by the authors of the methods.
- **Stance**: Neutral.
- **Potential Use**: Methods; unbalanced transport for subjects of different size.

##### Amir and Dym (2025). Fourier Sliced-Wasserstein Embedding for Multisets and Measures.
- **Key**: `amir2025fourier`
- **Themes**: main 2; overlap 3
- **Type**: Conference paper (ICLR 2025; arXiv comment "ICLR 2025 camera-ready").
- **Identifier**: arXiv 2405.16519
- **URL confirmed**: arXiv API record of 2405.16519 and the ICLR 2025 poster page https://iclr.cc/virtual/2025/poster/30562 returned by the search, read in this merge run.
- **Method**: The Fourier sliced-Wasserstein (FSW) embedding maps multisets and measures over R^d into Euclidean space so that the sliced-Wasserstein distance is approximately preserved.
- **Key Findings**: The embedding is injective on measures and bi-Lipschitz on multisets with output dimension about 2Nd, which sum- and max-pooling are not; no bi-Lipschitz Euclidean embedding of distributions exists. Replacing max-pooling in PointNet with FSW keeps performance after a 40-fold parameter reduction.
- **Relevance**: A pooling with metric guarantees for sets of points or lesions, joining the transport embeddings of theme 2 with the set encoders of theme 3.
- **Quality**: High. Main venue; theory with experiments.
- **Stance**: Supports.
- **Potential Use**: Set pooling with guarantees; link between themes 2 and 3.

##### Carpintero Perez, da Veiga, Garnier and Staber (2024). Gaussian process regression with Sliced Wasserstein Weisfeiler-Lehman graph kernels.
- **Key**: `carpinteroperez2024gaussian`
- **Themes**: main 2
- **Type**: Conference paper (AISTATS 2024, as theme run 2 recorded it).
- **Identifier**: arXiv 2402.03838
- **URL confirmed**: arXiv API record and abstract, read in this merge run.
- **Method**: A sliced-Wasserstein Weisfeiler-Lehman (SWWL) graph kernel for Gaussian process regression on large meshes with continuous node attributes.
- **Key Findings**: The kernel is positive definite and much cheaper than earlier graph kernels, so it handles graphs of tens of thousands of nodes in fluid and solid mechanics regression.
- **Relevance**: Regression of a scalar output from an unaligned mesh through a transport kernel, the regression counterpart of the Wasserstein Weisfeiler-Lehman classifier.
- **Quality**: Medium. Peer-reviewed proceedings; applications are physical simulations.
- **Stance**: Supports.
- **Potential Use**: Pairwise transport kernels for regression.

##### Khurana, Kannan, Cloninger and Moosmuller (2023). Supervised learning of sheared distributions using linearized optimal transport.
- **Key**: `khurana2023supervised`
- **Themes**: main 2
- **Type**: Journal article (Sampling Theory, Signal Processing, and Data Analysis 21(1); published online 19 October 2022).
- **Identifier**: DOI 10.1007/s43670-022-00038-2 (arXiv 2201.10590)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record, read in this merge run.
- **Method**: Embeds probability measures into L2 by linearized optimal transport and studies when classes generated by shearings of a fixed measure become linearly separable, with multiple references for larger families.
- **Key Findings**: Gives conditions and bounds for linear separability of sheared families, and shows that several reference embeddings extend the families that can be separated. Demonstrated on image classification.
- **Relevance**: Extends the guarantee that a transport embedding to a reference absorbs misalignment from shifts and scalings to shearings, a further class of residual misregistration.
- **Quality**: Medium. Peer-reviewed theory journal; small experiments.
- **Stance**: Supports.
- **Potential Use**: Theory of reference embeddings.

##### Liu, Zhang, Wang, Zhao, Zhou and Cui (2023). Structure-Sensitive Graph Dictionary Embedding for Graph Classification.
- **Key**: `liu2023structure`
- **Themes**: main 2
- **Type**: Preprint (arXiv, cs.LG), admitted under `cs_ml`.
- **Identifier**: arXiv 2306.10505
- **URL confirmed**: arXiv API record and abstract, read in this merge run.
- **Method**: Embeds each graph against a dictionary of graph keys adapted per input by variational Bernoulli sampling, with a multi-sensitivity Wasserstein encoding built from multi-scale attention on optimal transport.
- **Key Findings**: Reported to outperform the compared graph classification methods on several datasets.
- **Relevance**: A learned dictionary of templates, adapted per subject, compared to the input through transport for classification.
- **Quality**: Low. Preprint; the abstract gives no numbers and the venue is not confirmed.
- **Stance**: Supports.
- **Potential Use**: Methods; learnable templates.

##### Joodaki et al. (2024). Detection of PatIent-Level distances from single cell genomics and pathomics data with Optimal Transport (PILOT).
- **Key**: `joodaki2024pilot`
- **Themes**: main 2; overlap 4
- **Type**: Journal article (Molecular Systems Biology 20(2); published online 19 December 2023).
- **Identifier**: DOI 10.1038/s44320-023-00003-8
- **URL confirmed**: Crossref record and PubMed record 38177382 (abstract read), in this merge run.
- **Method**: Represents each patient as a distribution of cells or tissue structures over clusters and computes the Wasserstein distance between patients, followed by sample-level trajectory and cluster analysis and an interpretation module.
- **Key Findings**: Evaluated on single-cell and pathomics studies with up to 600 patients; detects disease-associated samples and the cell populations, genes and tissue structures that change along the trajectories.
- **Relevance**: A patient-level analysis of unaligned sets of cells through a transport coupling between patients, outside imaging; it shows the pairwise transport route at clinical cohort scale.
- **Quality**: High. Peer-reviewed journal; several cohorts. The analysis is unsupervised at the sample level.
- **Stance**: Supports.
- **Potential Use**: Transport between patient-level sets; discussion of transport outside imaging.

##### Joodaki, Shaigan, Samiei, Nagai, Maie, Kuppe and Costa (2025). PILOT-GM-VAE: patient-level analysis of single-cell disease atlas with optimal transport of Gaussian mixture variational autoencoders.
- **Key**: `joodaki2025pilotgmvae`
- **Themes**: main 2; overlap 4
- **Type**: Journal article (Briefings in Bioinformatics 26(5):bbaf547). Its bioRxiv preprint (DOI 10.1101/2025.04.10.648188) is recorded by Crossref as the preprint of this article.
- **Identifier**: DOI 10.1093/bib/bbaf547
- **URL confirmed**: Crossref records of the article and of its preprint (abstract read), and https://doi.org/10.1093/bib/bbaf547 returned HTTP 302, in this merge run.
- **Method**: Fits a Gaussian-mixture variational autoencoder to the cell distributions of a disease atlas and computes transport distances between patients' Gaussian mixtures in closed form.
- **Key Findings**: On several single-cell disease atlases the method performs sample-level clustering, trajectory inference and batch correction, and in a breast cancer atlas it highlights cellular changes along disease progression.
- **Relevance**: Replaces the cluster histogram of PILOT with a learned mixture model per patient, a learned template family on which patient transport distances are computed.
- **Quality**: Medium. Peer-reviewed journal; benchmarks are sample-level analyses, not outcome prediction.
- **Stance**: Supports.
- **Potential Use**: Transport between patient-level sets.

##### Wang, Zhan, Yang, Mu, Chen, Garai, Orzechowski, Wagenaar and Shen (2024). QOT: Quantized Optimal Transport for sample-level distance matrix in single-cell omics.
- **Key**: `wang2024qot`
- **Themes**: main 2; overlap 4
- **Type**: Journal article (Briefings in Bioinformatics 26(1):bbae713, published 22 November 2024). PubMed lists its bioRxiv preprint (DOI 10.1101/2024.02.06.578032) with "Update in" this article.
- **Identifier**: DOI 10.1093/bib/bbae713
- **URL confirmed**: Crossref record of the article and PubMed record 38370767 of the preprint (abstract read), in this merge run.
- **Method**: Quantizes each sample's cells by clustering (HDBSCAN when no cell-type labels exist) and a Gaussian mixture, then computes Wasserstein distances between samples.
- **Key Findings**: The authors report better accuracy and robustness than other transport-based algorithms for sample-level distance matrices, used for downstream analysis such as disease-progression trajectories.
- **Relevance**: A cheaper pairwise transport between patients' unaligned sets, addressing the cost that limits pairwise transport kernels.
- **Quality**: Medium. Peer-reviewed journal; the abstract states its gains without numbers.
- **Stance**: Supports.
- **Potential Use**: Computational cost of patient-level transport.

##### Song, Chen, Jaume, Vaidya, Baras and Mahmood (2024). Multimodal Prototyping for cancer survival prediction.
- **Key**: `song2024multimodal`
- **Themes**: main 2; overlap 3, 4
- **Type**: Conference paper (ICML 2024, per the arXiv comment).
- **Identifier**: arXiv 2407.00224
- **URL confirmed**: arXiv API record and abstract, read in this merge run.
- **Method**: Summarizes the patch set of a whole-slide image by a small set of morphological prototypes and the transcriptome by pathway prototypes, both unsupervised, and fuses the tokens with a Transformer or with optimal transport cross-alignment for survival prediction.
- **Key Findings**: On six cancer types the framework outperforms the compared multimodal survival methods with much less computation, compressing the slide tokens more than 300-fold.
- **Relevance**: Replaces a variable-size unordered patch set with a fixed set of prototypes, a learned template, before subject-level prediction, and uses transport between the token sets.
- **Quality**: High. Main venue; six cohorts.
- **Stance**: Supports.
- **Potential Use**: Learned templates for subject-level prediction from region sets.

##### Liu, Ren, Zhang, Lin and You (2025). Together, Then Apart: Balancing Alignment and Distinctiveness for Multimodal Survival Analysis.
- **Key**: `liu2025together`
- **Themes**: main 2; overlap 4
- **Type**: Preprint (arXiv, cs.CV), admitted under `cs_ml`.
- **Identifier**: arXiv 2511.18089
- **URL confirmed**: arXiv API record and abstract, read in this merge run.
- **Method**: Prototype-based alignment of histopathology and genomic representations, an anchor-guided contrastive objective for modality-specific signals, and unbalanced optimal transport for cross-modal interactions under imbalance and noisy correspondence.
- **Key Findings**: Reported to improve survival prediction over recent multimodal models on several TCGA cohorts, with interpretable prototype structures.
- **Relevance**: Unbalanced transport between a patient's unaligned token sets of two modalities, feeding a subject-level survival model.
- **Quality**: Low. Recent preprint; the abstract gives no numbers.
- **Stance**: Supports.
- **Potential Use**: Recent transport-based subject-level prediction in pathology.

##### Songdechakraiwut, Krause, Banks, Nourski and Van Veen (2022). Topological Classification in a Wasserstein Distance Based Vector Space.
- **Key**: `songdechakraiwut2022topological`
- **Themes**: main 2; overlap 4
- **Type**: Preprint (arXiv, cs.LG), admitted under `cs_ml`.
- **Identifier**: arXiv 2202.01275
- **URL confirmed**: arXiv API record and abstract, read in this merge run.
- **Method**: Represents each network by persistence barcodes of its 1-skeleton and builds a vector space based on the Wasserstein distance between barcodes, then classifies with support vector machines.
- **Key Findings**: The barcodes and distances are computed efficiently, and the vector space classifies simulated networks and measured functional brain networks.
- **Relevance**: A subject-level brain network classifier on a transport distance between topological summaries, which need no node correspondence between subjects.
- **Quality**: Medium. Preprint; one measured brain-network application.
- **Stance**: Supports.
- **Potential Use**: Transport-based subject-level prediction from brain networks.

#### Theme 3: permutation-invariant set and point-cloud encoders

##### Dietterich, Lathrop and Lozano-Perez (1997). Solving the multiple instance problem with axis-parallel rectangles.
- **Key**: `dietterich1997multiple`
- **Themes**: main 3
- **Identifier**: DOI 10.1016/S0004-3702(96)00034-3
- **URL confirmed**: https://doi.org/10.1016/S0004-3702(96)00034-3 (resolves to the Elsevier record; Crossref record read: Artificial Intelligence 89(1-2):31-71)
- **Type**: Journal article
- **Method**: Defines the multiple-instance problem, in which a label belongs to a bag of feature vectors and only some members account for it, and compares three algorithms that learn axis-parallel rectangles on drug-activity data.
- **Key Findings**: Algorithms that ignore the bag structure perform poorly on the musk task, and the algorithm that models the bag directly performs best among those compared.
- **Relevance**: The origin of bag-level prediction from an unordered set of instances with no instance labels, which is the setting of a subject with an unknown number of lesions or regions.
- **Quality**: Seminal; 3306 citations in OpenAlex. Quick assessment 13/15.
- **Stance**: supports.
- **Potential Use**: Background on multiple-instance learning in the methods review.

##### Muandet, Fukumizu, Dinuzzo and Scholkopf (2012). Learning from Distributions via Support Measure Machines.
- **Key**: `muandet2012smm`
- **Themes**: main 3
- **Identifier**: arXiv 1202.6504
- **URL confirmed**: https://arxiv.org/abs/1202.6504 and https://proceedings.neurips.cc/paper/2012/hash/9bf31c7ff062936a96d3c8bd1f8f2ff3-Abstract.html (Advances in Neural Information Processing Systems 25)
- **Type**: Conference paper
- **Method**: Represents each training example as a probability distribution, embeds it as a mean embedding in a reproducing kernel Hilbert space, and trains a support vector machine generalized to measures (the support measure machine).
- **Key Findings**: Standard kernel methods apply to distributions through their mean embeddings, and the paper relates the support measure machine to the SVM and proposes a Flex-SVM with a kernel per example.
- **Relevance**: A kernel route to prediction from an unordered set: the set is treated as a sample from a distribution, which removes the need for correspondence between subjects.
- **Quality**: Peer-reviewed NeurIPS paper; 167 citations (arXiv record). Quick assessment 12/15.
- **Stance**: supports.
- **Potential Use**: Kernel mean embedding approaches in the methods review.

##### Poczos, Rinaldo, Singh and Wasserman (2013). Distribution-Free Distribution Regression.
- **Key**: `poczos2013distribution`
- **Themes**: main 3
- **Identifier**: arXiv 1302.0082
- **URL confirmed**: https://arxiv.org/abs/1302.0082 and https://proceedings.mlr.press/v31/poczos13a.html (AISTATS, PMLR 31:507-515)
- **Type**: Conference paper
- **Method**: Regression of a response on a probability distribution observed only through a sample, with a kernel-kernel estimator that compares distributions through density estimates, and risk analysis without distributional assumptions on the error.
- **Key Findings**: When the effective dimension, measured by the doubling dimension, is small enough, the excess prediction risk converges to zero at a polynomial rate.
- **Relevance**: States the subject-level prediction problem for set inputs as regression on distributions and gives its first distribution-free guarantee.
- **Quality**: Peer-reviewed; 83 citations (arXiv record). Quick assessment 11/15.
- **Stance**: supports.
- **Potential Use**: Problem formulation for distribution regression.

##### Szabo, Sriperumbudur, Poczos and Gretton (2016). Learning Theory for Distribution Regression.
- **Key**: `szabo2016learning`
- **Themes**: main 3
- **Identifier**: arXiv 1411.2066
- **URL confirmed**: https://arxiv.org/abs/1411.2066 and https://www.jmlr.org/papers/v17/14-510.html (Journal of Machine Learning Research 17(152):1-40)
- **Type**: Journal article
- **Method**: Kernel ridge regression from mean embeddings of sampled distributions to outputs, analysed in the two-stage sampled setting where only sets of points from each distribution are seen.
- **Key Findings**: The estimator is consistent in the two-stage sampled setting under mild conditions, which establishes consistency of the classical set kernel without an intermediate density estimate.
- **Relevance**: The theoretical basis for predicting a subject-level outcome from a set of points of varying size per subject.
- **Quality**: JMLR; 120 citations (arXiv record). Quick assessment 13/15.
- **Stance**: supports.
- **Potential Use**: Theory of distribution regression in the methods review.

##### Muandet, Fukumizu, Sriperumbudur and Scholkopf (2017). Kernel Mean Embedding of Distributions: A Review and Beyond.
- **Key**: `muandet2017kernel`
- **Themes**: main 3
- **Identifier**: DOI 10.1561/2200000060; arXiv 1605.09522
- **URL confirmed**: https://doi.org/10.1561/2200000060 (resolves to the publisher record) and https://arxiv.org/abs/1605.09522 (journal reference: Foundations and Trends in Machine Learning 10(1-2):1-141)
- **Type**: Journal article (monograph-length review)
- **Method**: Review of the embedding of marginal and conditional distributions in a reproducing kernel Hilbert space, its theory and its applications.
- **Key Findings**: The mean embedding extends kernel methods to probability measures and underlies two-sample testing, independence testing and learning on distributional data, including distribution regression.
- **Relevance**: The reference text for the kernel view of a set as an empirical distribution.
- **Quality**: 1094 citations in OpenAlex. Quick assessment 13/15.
- **Stance**: neutral.
- **Potential Use**: Background and definitions for kernel set representations.

##### Zaheer, Kottur, Ravanbakhsh, Poczos, Salakhutdinov and Smola (2017). Deep Sets.
- **Key**: `zaheer2017deep`
- **Themes**: main 3
- **Identifier**: arXiv 1703.06114
- **URL confirmed**: https://arxiv.org/abs/1703.06114 and https://papers.nips.cc/paper_files/paper/2017/hash/f22e4747da1aa27e363d86d40ff442fe-Abstract.html (Advances in Neural Information Processing Systems 30)
- **Type**: Conference paper
- **Method**: A theorem characterizing permutation-invariant functions as a sum of per-element encodings followed by a decoder, and the matching deep architecture; also the conditions for permutation equivariance.
- **Key Findings**: The sum-decomposition architecture applies to population statistic estimation, point-cloud classification, set expansion and outlier detection, in supervised and unsupervised settings.
- **Relevance**: Defines the permutation-invariance answer to missing correspondence: each element is encoded alone and the encodings are pooled, so no alignment across subjects is needed.
- **Quality**: NeurIPS; marked "must include" by chaining (cited in all three machine-learning core papers); 481 citations (arXiv record, a lower bound). Quick assessment 14/15.
- **Stance**: supports.
- **Potential Use**: Core of the set-encoder section.

##### Qi, Su, Mo and Guibas (2017). PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation.
- **Key**: `qi2017pointnet`
- **Themes**: main 3
- **Identifier**: arXiv 1612.00593
- **URL confirmed**: https://arxiv.org/abs/1612.00593 and https://openaccess.thecvf.com/content_cvpr_2017/html/Qi_PointNet_Deep_Learning_CVPR_2017_paper.html (CVPR 2017, pp. 652-660)
- **Type**: Conference paper
- **Method**: A network that consumes raw point coordinates through a shared per-point network and a max-pooling symmetric function, with a learned input transform.
- **Key Findings**: The network handles classification, part segmentation and scene parsing on point clouds, and the analysis explains its robustness to perturbation and to inserted or deleted points.
- **Relevance**: The point-cloud encoder that later medical shape models build on; it avoids voxelization and point correspondence.
- **Quality**: CVPR; marked "must include" by chaining (cited in all four core papers); 5525 citations (arXiv record). Quick assessment 14/15.
- **Stance**: supports.
- **Potential Use**: Core of the point-cloud section.

##### Qi, Yi, Su and Guibas (2017). PointNet++: Deep Hierarchical Feature Learning on Point Sets in a Metric Space.
- **Key**: `qi2017pointnetpp`
- **Themes**: main 3
- **Identifier**: arXiv 1706.02413
- **URL confirmed**: https://arxiv.org/abs/1706.02413 and https://papers.nips.cc/paper/7095-pointnet-deep-hierarchical-feature-learning (Advances in Neural Information Processing Systems 30)
- **Type**: Conference paper
- **Method**: Applies PointNet recursively on a nested partition of the point set built from metric distances, with layers that combine features across scales under varying sampling density.
- **Key Findings**: Local features at increasing scales improve recognition of fine-grained patterns over PointNet on 3D point-cloud benchmarks.
- **Relevance**: Adds local geometric structure to a permutation-invariant encoder while still requiring no correspondence across subjects.
- **Quality**: NeurIPS; 16645 citations (arXiv record). Quick assessment 14/15.
- **Stance**: supports.
- **Potential Use**: Point-cloud section, hierarchical encoders.

##### Ilse, Tomczak and Welling (2018). Attention-based Deep Multiple Instance Learning.
- **Key**: `ilse2018attention`
- **Themes**: main 3
- **Identifier**: arXiv 1802.04712
- **URL confirmed**: https://arxiv.org/abs/1802.04712 and https://proceedings.mlr.press/v80/ilse18a.html (ICML, PMLR 80:2127-2136)
- **Type**: Conference paper
- **Method**: Models the bag label as a Bernoulli variable parameterized by neural networks and pools instance embeddings with a learned attention operator that is permutation invariant.
- **Key Findings**: Performance comparable to the best MIL methods on benchmark MIL datasets, better results on an MNIST-based MIL dataset and two histopathology datasets, and attention weights that show each instance's contribution to the bag label.
- **Relevance**: The attention pooling that most later subject-level MIL models in medical imaging use; its weights indicate which instances (patches, lesions) drive the prediction.
- **Quality**: ICML; 2006 citations (arXiv record). Quick assessment 14/15.
- **Stance**: supports.
- **Potential Use**: Core of the MIL section.

##### Lee, Lee, Kim, Kosiorek, Choi and Teh (2019). Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks.
- **Key**: `lee2019set`
- **Themes**: main 3
- **Identifier**: arXiv 1810.00825
- **URL confirmed**: https://arxiv.org/abs/1810.00825 and https://proceedings.mlr.press/v97/lee19d.html (ICML, PMLR 97:3744-3753)
- **Type**: Conference paper
- **Method**: An encoder of self-attention blocks over set elements, an induced attention scheme that makes self-attention linear in set size, and a decoder that pools by multihead attention with learned seed vectors.
- **Key Findings**: Modelling interactions among elements before pooling gives state-of-the-art results on set-structured tasks in the paper's comparisons, and the model is shown to be theoretically attractive as a set-function approximator.
- **Relevance**: Extends permutation-invariant encoders to interactions among lesions or regions of one subject, which sum or attention pooling of independent elements cannot model.
- **Quality**: ICML; 836 citations (arXiv record). Quick assessment 14/15.
- **Stance**: supports.
- **Potential Use**: Core of the attention-pooling section.

##### Murphy, Srinivasan, Rao and Ribeiro (2019). Janossy Pooling: Learning Deep Permutation-Invariant Functions for Variable-Size Inputs.
- **Key**: `murphy2019janossy`
- **Themes**: main 3
- **Identifier**: arXiv 1811.01900
- **URL confirmed**: https://arxiv.org/abs/1811.01900 (journal reference: ICLR 2019)
- **Type**: Conference paper
- **Method**: Expresses a permutation-invariant function as the average of a permutation-sensitive function over all orderings, made tractable by canonical orderings, k-order interactions or random permutations at training.
- **Key Findings**: The framework unifies existing set models, and the experiments show improvements over the compared methods.
- **Relevance**: Gives a family that contains Deep Sets and lets the user choose how many element interactions the pooling sees, a design choice for sets of lesions.
- **Quality**: ICLR; 195 citations (arXiv record). Quick assessment 12/15.
- **Stance**: supports.
- **Potential Use**: Set-function theory in the methods review.

##### Wagstaff, Fuchs, Engelcke, Posner and Osborne (2019). On the Limitations of Representing Functions on Sets.
- **Key**: `wagstaff2019limitations`
- **Themes**: main 3
- **Identifier**: arXiv 1901.09006
- **URL confirmed**: https://arxiv.org/abs/1901.09006 and https://proceedings.mlr.press/v97/wagstaff19a.html (ICML, PMLR 97:6487-6494)
- **Type**: Conference paper
- **Method**: Analysis of sum-decomposition models implemented with continuous maps.
- **Key Findings**: Practical universal representation of set functions with continuous encoders and decoders needs a latent dimension at least as large as the maximum set size.
- **Relevance**: Sets the capacity condition a sum-pooled encoder must meet when a subject has many lesions or points.
- **Quality**: ICML; 209 citations (arXiv record). Quick assessment 12/15.
- **Stance**: neutral (it qualifies when sum decomposition is sufficient).
- **Potential Use**: Set-function theory and design constraints.

##### Wang, Sun, Liu, Sarma, Bronstein and Solomon (2019). Dynamic Graph CNN for Learning on Point Clouds.
- **Key**: `wang2019dynamic`
- **Themes**: main 3
- **Identifier**: DOI 10.1145/3326362; arXiv 1801.07829
- **URL confirmed**: https://doi.org/10.1145/3326362 (resolves to the ACM record; ACM Transactions on Graphics 38(5):1-12) and https://arxiv.org/abs/1801.07829
- **Type**: Journal article
- **Method**: EdgeConv, a convolution on edges of a k-nearest-neighbour graph recomputed in feature space at each layer, plugged into a point-cloud network.
- **Key Findings**: Local neighbourhood information and dynamically computed graphs improve classification and segmentation over encoders that treat points independently.
- **Relevance**: A point-cloud encoder that adds local geometry without point correspondence; a common backbone for anatomical point clouds.
- **Quality**: ACM TOG; 9025 citations in OpenAlex. Quick assessment 14/15.
- **Stance**: supports.
- **Potential Use**: Point-cloud section.

##### Campanella, Hanna, Geneslaw, Miraflor, Werneck Krauss Silva, Busam, Brogi, Reuter, Klimstra and Fuchs (2019). Clinical-grade computational pathology using weakly supervised deep learning on whole slide images.
- **Key**: `campanella2019clinical`
- **Themes**: main 3; overlap 4
- **Identifier**: DOI 10.1038/s41591-019-0508-1
- **URL confirmed**: https://doi.org/10.1038/s41591-019-0508-1 (resolves to https://www.nature.com/articles/s41591-019-0508-1; Nature Medicine 25(8):1301-1309)
- **Type**: Journal article
- **Method**: A multiple-instance learning system trained on reported diagnoses as slide labels, with no pixel-wise annotation, on 44,732 whole-slide images from 15,187 patients without data curation.
- **Key Findings**: Areas under the curve above 0.98 for prostate cancer, basal cell carcinoma and breast cancer metastases to axillary lymph nodes, and an estimated 65 to 75 percent of slides that pathologists could exclude while keeping 100 percent sensitivity.
- **Relevance**: Evidence at clinical scale that bag-level prediction from an unordered set of patches removes the need for region annotation, the pathology counterpart of lesion segmentation.
- **Quality**: Nature Medicine; 3431 citations in OpenAlex. Quick assessment 15/15.
- **Stance**: supports.
- **Potential Use**: Medical evidence for MIL in the discussion of annotation-free pipelines.

##### Polsterl, Sarasua, Gutierrez-Becker and Wachinger (2020). A Wide and Deep Neural Network for Survival Analysis from Anatomical Shape and Tabular Clinical Data.
- **Key**: `polsterl2020wide`
- **Themes**: main 3; overlap 4
- **Identifier**: DOI 10.1007/978-3-030-43823-4_37; arXiv 1909.03890
- **URL confirmed**: https://doi.org/10.1007/978-3-030-43823-4_37 (resolves to Springer; Machine Learning and Knowledge Discovery in Databases, CCIS, pp. 453-464) and https://arxiv.org/abs/1909.03890
- **Type**: Conference paper (ECML-PKDD 2019 workshop)
- **Method**: A PointNet branch on the hippocampus point cloud fused with a wide branch on demographics and biomarkers, trained end to end with a survival loss for right-censored time to conversion.
- **Key Findings**: On ADNI data the model learns a shape descriptor that adds to clinical biomarkers and outperforms a deep network on shape alone and a linear model on common clinical biomarkers.
- **Relevance**: A subject-level time-to-event outcome predicted from an unaligned point cloud with no point correspondence, built on a segmentation of the hippocampus.
- **Overlap**: theme 4, included as central to the point-cloud encoder scope.
- **Quality**: Workshop proceedings; 40 citations in OpenAlex. Quick assessment 10/15.
- **Stance**: supports.
- **Potential Use**: Medical applications of point-cloud encoders, survival outcomes.

##### Bloem-Reddy and Teh (2020). Probabilistic Symmetries and Invariant Neural Networks.
- **Key**: `bloemreddy2020probabilistic`
- **Themes**: main 3
- **Identifier**: arXiv 1901.06082
- **URL confirmed**: https://arxiv.org/abs/1901.06082 and https://jmlr.org/papers/v21/19-322.html (Journal of Machine Learning Research 21(90):1-61)
- **Type**: Journal article
- **Method**: Treats network inputs and outputs as random variables and derives functional representations of distributions invariant or equivariant under a compact group, worked out for exchangeable sequences and arrays.
- **Key Findings**: The representations characterize the networks that can model such distributions and give a general program for building invariant stochastic or deterministic networks, with recent set architectures as special cases.
- **Relevance**: The probabilistic justification for permutation-invariant prediction from exchangeable sets of elements.
- **Quality**: JMLR; OpenAlex citation lookup timed out in this run, so no count is given. Quick assessment 12/15 (citation item scored without a count).
- **Stance**: neutral.
- **Potential Use**: Theory of invariance.

##### Skianis, Nikolentzos, Limnios and Vazirgiannis (2020). Rep the Set: Neural Networks for Learning Set Representations.
- **Key**: `skianis2020rep`
- **Themes**: main 3; overlap 2
- **Identifier**: arXiv 1904.01962
- **URL confirmed**: https://arxiv.org/abs/1904.01962 and https://proceedings.mlr.press/v108/skianis20a.html (AISTATS, PMLR 108:1410-1420)
- **Type**: Conference paper
- **Method**: Compares an input set with learned hidden sets by solving network-flow (bipartite matching) problems and feeds the matching values to a standard network, trained end to end.
- **Key Findings**: Performance better than or comparable to the compared methods on text categorization and graph classification.
- **Relevance**: A learned-template answer to missing correspondence inside a set encoder: each subject's set is matched to learned reference sets, which sits between permutation invariance and template matching.
- **Overlap**: theme 2 (transport and learnable templates), included because the method is a set encoder for outcome prediction.
- **Quality**: AISTATS; 54 citations in OpenAlex. Quick assessment 11/15.
- **Stance**: supports.
- **Potential Use**: Bridge between set encoders and template-based methods.

##### Yang, Deng, Huang, Ni and Xu (2020). Relational Learning Between Multiple Pulmonary Nodules via Deep Set Attention Transformers.
- **Key**: `yang2020relational`
- **Themes**: main 3; overlap 4
- **Identifier**: DOI 10.1109/ISBI45749.2020.9098722; arXiv 2004.05640
- **URL confirmed**: https://doi.org/10.1109/ISBI45749.2020.9098722 (resolves to IEEE Xplore; ISBI 2020, pp. 1875-1878) and https://arxiv.org/abs/2004.05640
- **Type**: Conference paper
- **Method**: Treats the nodules of one patient as a set, encodes each with a shared 3D CNN and replaces pooling-based MIL aggregation with a set attention transformer (NoduleSAT).
- **Key Findings**: Learning relations between nodules is evaluated on false-positive reduction on LUNA16 and malignancy classification on LIDC-IDRI, and the abstract reports that the experiments validate the method.
- **Relevance**: A set of lesions per subject handled by a Set Transformer, built on a nodule detection step.
- **Overlap**: theme 4, included as central to the attention-pooling scope.
- **Quality**: ISBI; 35 citations in OpenAlex. Quick assessment 10/15.
- **Stance**: supports.
- **Potential Use**: Medical applications of set attention.

##### Lu, Williamson, Chen, Chen, Barbieri and Mahmood (2021). Data-efficient and weakly supervised computational pathology on whole-slide images.
- **Key**: `lu2021data`
- **Themes**: main 3; overlap 4
- **Identifier**: DOI 10.1038/s41551-020-00682-w
- **URL confirmed**: https://doi.org/10.1038/s41551-020-00682-w (resolves to https://www.nature.com/articles/s41551-020-00682-w; Nature Biomedical Engineering 5(6):555-570)
- **Type**: Journal article
- **Method**: Clustering-constrained attention MIL (CLAM): attention pooling over patch features with slide-level labels only, plus instance-level clustering over the attended regions.
- **Key Findings**: On renal cell carcinoma and non-small-cell lung cancer subtyping and lymph node metastasis detection, the method localizes known morphology without spatial labels, outperforms standard weakly supervised classifiers and adapts to independent cohorts, smartphone microscopy and varying tissue content.
- **Relevance**: Attention-based bag prediction that replaces region annotation, with attention maps standing in for a segmentation output.
- **Quality**: Nature Biomedical Engineering; 3026 citations in OpenAlex. Quick assessment 15/15.
- **Stance**: supports.
- **Potential Use**: Medical MIL section.

##### Shao, Bian, Chen, Wang, Zhang, Ji and Zhang (2021). TransMIL: Transformer based Correlated Multiple Instance Learning for Whole Slide Image Classification.
- **Key**: `shao2021transmil`
- **Themes**: main 3
- **Identifier**: arXiv 2106.00908
- **URL confirmed**: https://arxiv.org/abs/2106.00908 and https://proceedings.nips.cc/paper/2021/hash/10c272d06794d3e5785d5e7c5356e9ff-Abstract.html (Advances in Neural Information Processing Systems 34, pp. 2136-2147)
- **Type**: Conference paper
- **Method**: A correlated MIL framework with a convergence proof, implemented as a Transformer over patch instances that uses morphological and spatial information.
- **Key Findings**: Test AUC up to 93.09 percent on CAMELYON16 tumour classification, and up to 96.03 percent on TCGA-NSCLC and 98.82 percent on TCGA-RCC subtype classification, with faster convergence than the compared methods.
- **Relevance**: Drops the independence assumption of attention MIL, the bag-level analogue of modelling interactions among lesions of one subject.
- **Quality**: NeurIPS; 1529 citations (arXiv record). Quick assessment 14/15.
- **Stance**: supports.
- **Potential Use**: Medical MIL section, correlated instances.

##### Chen, Zeng, Zhang, Shi, Dekker, Wee and Bermejo (2022). Lung cancer diagnosis using deep attention-based multiple instance learning and radiomics.
- **Key**: `chen2022lung`
- **Themes**: main 3; overlap 4
- **Identifier**: DOI 10.1002/mp.15539; arXiv 2104.14655
- **URL confirmed**: https://doi.org/10.1002/mp.15539 (resolves to Wiley; Medical Physics 49(5):3134-3143) and https://arxiv.org/abs/2104.14655
- **Type**: Journal article
- **Method**: Treats a patient's nodules as a bag, uses radiomic features of each nodule as instances and classifies with attention-based deep MIL, with a bag simulation method for a small imbalanced dataset.
- **Key Findings**: Mean accuracy 0.807 (SEM 0.069) and AUC 0.842 (SEM 0.074), outperforming the other MIL methods compared, with attention weights indicating each nodule's importance for the diagnosis.
- **Relevance**: The clearest case in this theme of a set encoder that builds on the radiomics step rather than removing it: radiomic features of segmented lesions are pooled by attention into a patient-level prediction.
- **Overlap**: theme 4, included as central to the attention-MIL scope.
- **Quality**: Medical Physics; 53 citations in OpenAlex; small dataset. Quick assessment 11/15.
- **Stance**: supports.
- **Potential Use**: Where set encoders build on radiomics pipelines.

##### Wagstaff, Fuchs, Engelcke, Osborne and Posner (2022). Universal Approximation of Functions on Sets.
- **Key**: `wagstaff2022universal`
- **Themes**: main 3
- **Identifier**: arXiv 2107.01959
- **URL confirmed**: https://arxiv.org/abs/2107.01959 and https://jmlr.org/papers/v23/21-0730.html (Journal of Machine Learning Research 23, pp. 1-56)
- **Type**: Journal article
- **Method**: Theoretical analysis of Deep Sets and of the Janossy pooling family.
- **Key Findings**: Universal approximation by Deep Sets holds only with a sufficiently high-dimensional latent space; one dimension lower, some piecewise-affine functions are approximated no better than a constant baseline in worst-case error. Most popular set-learning methods fall under Janossy pooling.
- **Relevance**: Sharpens the capacity condition for sum-pooled encoders on large sets of points or lesions.
- **Quality**: JMLR; 89 citations (arXiv record). Quick assessment 12/15.
- **Stance**: neutral.
- **Potential Use**: Set-function theory.

##### Tabaghi and Wang (2024). Universal Representation of Permutation-Invariant Functions on Vectors and Tensors.
- **Key**: `tabaghi2024universal`
- **Themes**: main 3
- **Identifier**: arXiv 2310.13829
- **URL confirmed**: https://arxiv.org/abs/2310.13829 and https://proceedings.mlr.press/v237/tabaghi24a.html (ALT, PMLR 237:1134-1187)
- **Type**: Conference paper
- **Method**: Analysis of sum-decomposable models for multisets of D-dimensional vectors through identifiable multisets.
- **Key Findings**: A sum-decomposable model for general continuous multiset functions needs only a latent dimension of 2DN, with continuous encoder and decoder, where N bounds the multiset size; this improves on the earlier O(N^D) bound.
- **Relevance**: The latent-dimension condition for vector-valued elements, such as points with coordinates and features or lesions with feature vectors.
- **Quality**: ALT; 4 citations in OpenAlex (recent). Quick assessment 11/15.
- **Stance**: supports.
- **Potential Use**: Set-function theory, current bounds.

##### Nikolentzos and Skianis (2025). On the Lipschitz Continuity of Set Aggregation Functions and Neural Networks for Sets.
- **Key**: `nikolentzos2025lipschitz`
- **Themes**: main 3
- **Identifier**: arXiv 2505.24403
- **URL confirmed**: https://arxiv.org/abs/2505.24403 (arXiv comment: "Accepted at ICLR 2026"; the proceedings page was not confirmed in this run)
- **Type**: Preprint (admitted under `cs_ml`)
- **Method**: Computes the Lipschitz constants of sum, mean, max and attention-based aggregation with respect to three distances between multisets and bounds the Lipschitz constant of set networks.
- **Key Findings**: In the general case each of sum, mean and max is Lipschitz continuous with respect to only one of the three distances, and the attention-based aggregation with respect to none; the bounds are used to study stability to perturbations and generalization under distribution shift.
- **Relevance**: Ties the choice of pooling to stability when a subject's set changes by small perturbations, such as a lesion more or less in a segmentation.
- **Quality**: Preprint; 1 citation in OpenAlex (recent). Quick assessment 9/15.
- **Stance**: neutral.
- **Potential Use**: Choice of aggregation function and its stability.

##### Gutierrez-Becker and Wachinger (2018). Deep Multi-structural Shape Analysis: Application to Neuroanatomy.
- **Key**: `gutierrezbecker2018deep`
- **Themes**: main 3, 4
- **Type**: Conference paper (MICCAI 2018, LNCS, pp. 523-531).
- **Identifier**: DOI 10.1007/978-3-030-00931-1_60 (arXiv 1806.01069)
- **URL confirmed**: https://doi.org/10.1007/978-3-030-00931-1_60 and https://arxiv.org/abs/1806.01069 (both theme runs 3 and 4)
- **Method**: Multi-Structure PointNet (MSPNet): one PointNet branch per segmented brain structure on raw point clouds, with spatial transformer networks that map each input to a canonical pose, fused before the classifier. Tasks are Alzheimer's disease and mild cognitive impairment classification and brain-age regression; an occlusion method adapted to point clouds shows the anatomy that drives each prediction.
- **Key Findings**: No mesh processing and no point correspondence are needed, and the networks outperform BrainPrint spectral shape descriptors on AD and MCI classification.
- **Relevance**: A direct instance of subject-level prediction from unaligned point clouds through permutation invariance. The point clouds are sampled from segmented structures, so the model builds on a segmentation step and replaces registration and handcrafted shape features.
- **Quality**: Medium. Theme run 3 scored it 11/15 (MICCAI, 27 citations in OpenAlex); theme run 4 rated it High for its comparison with a published shape-descriptor baseline. The merged rating keeps the lower score.
- **Stance**: Supports.
- **Potential Use**: Medical applications of point-cloud encoders; point-cloud subject-level prediction.

##### Amir, Gortler, Avni, Ravina and Dym (2023). Neural Injective Functions for Multisets, Measures and Graphs via a Finite Witness Theorem.
- **Key**: `amir2023neural`
- **Themes**: main 3
- **Type**: Conference paper (NeurIPS 2023, per the arXiv comment "NeurIPS 2023 camera-ready").
- **Identifier**: arXiv 2306.06529
- **URL confirmed**: arXiv API record and abstract, read in this merge run.
- **Method**: Proves a finite witness theorem and uses it to show when moments of neural networks define injective multiset functions.
- **Key Findings**: Moments of networks with analytic non-polynomial activations are injective multiset functions with a near-optimal number of moments; moments of piecewise-linear networks cannot be injective, and moment-based multiset functions are never bi-Lipschitz.
- **Relevance**: The injectivity condition behind sum-pooled set encoders, the same property that Chen and Martel ask of a lesion-set pooling.
- **Quality**: High. Main venue; theory.
- **Stance**: Neutral (it qualifies when sum pooling is injective).
- **Potential Use**: Set-function theory; choice of activation and pooling.

##### Wang, Yang, Li, Wang and Li (2024). Polynomial Width is Sufficient for Set Representation with High-dimensional Features.
- **Key**: `wang2024polynomial`
- **Themes**: main 3
- **Type**: Conference paper (ICLR 2024, per the arXiv comment).
- **Identifier**: arXiv 2307.04001
- **URL confirmed**: arXiv API record and abstract, read in this merge run.
- **Method**: Analyzes the latent dimension L of DeepSets with two element embeddings, linear plus power activation and linear plus exponential activation.
- **Key Findings**: L polynomial in the set size N and the feature dimension D suffices for set representation, with a lower bound for the power embedding; the result extends to permutation-equivariant functions.
- **Relevance**: The capacity condition for sum-pooled encoders on sets of lesions or points with high-dimensional features, improving on bounds exponential in N and D.
- **Quality**: High. Main venue; theory.
- **Stance**: Supports.
- **Potential Use**: Set-function theory; encoder width for lesion sets.

##### Zweig and Bruna (2022). Exponential Separations in Symmetric Neural Networks.
- **Key**: `zweig2022exponential`
- **Themes**: main 3
- **Type**: Conference paper (Advances in Neural Information Processing Systems 35).
- **Identifier**: arXiv 2206.01266
- **URL confirmed**: arXiv API record and abstract, and the NeurIPS 2022 proceedings page returned by the search, in this merge run.
- **Method**: Compares DeepSets with the Relational Network architecture, which pools functions of element pairs, under analytic activations.
- **Key Findings**: A symmetric function on sets of size N with elements in dimension D is efficiently approximated by the Relational Network and needs width exponential in N and D for DeepSets.
- **Relevance**: Shows when pooling element interactions, as in the Set Transformer or lesion graphs, is needed and pooling single elements is not enough.
- **Quality**: High. Main venue; theory.
- **Stance**: Neutral.
- **Potential Use**: Set-function theory; interactions among lesions.

##### Dym and Gortler (2024). Low-Dimensional Invariant Embeddings for Universal Geometric Learning.
- **Key**: `dym2024low`
- **Themes**: main 3
- **Type**: Journal article (Foundations of Computational Mathematics 25(2):375-415).
- **Identifier**: DOI 10.1007/s10208-024-09641-2 (arXiv 2205.02956)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record, read in this merge run.
- **Method**: Studies separating invariants for group actions on D-dimensional domains, including permutations, rotations and other linear groups acting on point clouds.
- **Key Findings**: Randomly selecting 2D+1 invariants from a continuous semi-algebraic family separates orbits, and D+1 suffice for generic separation.
- **Relevance**: Gives the embedding size an invariant model of a point cloud needs to tell subjects apart, under permutation and rigid motion together.
- **Quality**: High. Top mathematics journal; theory.
- **Stance**: Supports.
- **Potential Use**: Theory of invariance for point clouds.

##### Kimura, Shimizu, Hirakawa, Goto and Saito (2024). On permutation-invariant neural networks.
- **Key**: `kimura2024permutation`
- **Themes**: main 3
- **Type**: Preprint, survey (arXiv, cs.LG), admitted under `cs_ml`.
- **Identifier**: arXiv 2403.17410
- **URL confirmed**: arXiv API record and abstract, read in this merge run.
- **Method**: Survey of neural networks that approximate set functions, from Deep Sets to Transformers.
- **Key Findings**: Deep Sets variants differ mainly in the aggregation function, their behaviour is sensitive to that choice, and Deep Sets can be generalized through quasi-arithmetic means.
- **Relevance**: A current overview of the permutation-invariance answer to missing correspondence.
- **Quality**: Low. Preprint survey; theme run 3 excluded it as covered by the primary papers, and it is kept here for the currency of the merged set.
- **Stance**: Neutral.
- **Potential Use**: Background on set encoders.

##### Balan, Haghani and Singh (2025). Permutation-invariant representations with applications to graph deep learning.
- **Key**: `balan2025permutation`
- **Themes**: main 3
- **Type**: Journal article (Applied and Computational Harmonic Analysis 79:101798).
- **Identifier**: DOI 10.1016/j.acha.2025.101798 (arXiv 2203.07546)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record, read in this merge run.
- **Method**: Two Euclidean embeddings of matrices modulo row permutations, one based on sorting and one on polynomial algebras.
- **Key Findings**: The sorting embedding is globally bi-Lipschitz with a low-dimensional target, and an almost-everywhere injective scheme has low cost; experiments on QM9 and PROTEINS.
- **Relevance**: A bi-Lipschitz permutation-invariant representation of a set of feature vectors, such as one row per lesion.
- **Quality**: High. Peer-reviewed applied mathematics journal.
- **Stance**: Supports.
- **Potential Use**: Theory of set representations.

##### Bachoc, Bethune, Gonzalez-Sanz and Loubes (2025). Improved learning theory for kernel distribution regression with two-stage sampling.
- **Key**: `bachoc2025improved`
- **Themes**: main 3; overlap 2
- **Type**: Journal article (The Annals of Statistics 53(4):1753-1782).
- **Identifier**: DOI 10.1214/25-AOS2537 (arXiv 2308.14335)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record (journal reference "Annals of Statistics 2025, Vol. 53, No. 4, 1753-1782"), read in this merge run.
- **Method**: Analyzes kernel distribution regression with Hilbertian embeddings in the two-stage sampled setting through a near-unbiased condition.
- **Key Findings**: The condition holds for kernels based on optimal transport and on mean embeddings, and the convergence rates for these kernels strictly improve.
- **Relevance**: Current guarantees for regressing a subject-level outcome on a set of points observed per subject, covering both transport kernels and mean embeddings.
- **Quality**: High. Top statistics journal.
- **Stance**: Supports.
- **Potential Use**: Theory of subject-level regression from sets; link between themes 2 and 3.

##### Wang and Fan (2024). Graph Classification via Reference Distribution Learning: Theory and Practice.
- **Key**: `wang2024graph`
- **Themes**: main 3; overlap 2
- **Type**: Conference paper (NeurIPS 2024 poster, per the conference page returned by the search).
- **Identifier**: arXiv 2408.11370
- **URL confirmed**: arXiv API record and abstract, and https://neurips.cc/virtual/2024/poster/96839 returned by the search, in this merge run.
- **Method**: Treats the node embeddings of a graph as a discrete distribution and classifies it by maximum mean discrepancy to learned reference distributions, with generalization bounds.
- **Key Findings**: Generalizes better than GNNs with global pooling in theory and experiments, and is at least 10 times faster than leading competitors.
- **Relevance**: Learned references compared by a kernel mean embedding distance, the kernel counterpart of the learned transport templates of theme 2.
- **Quality**: High. Main venue; theory and benchmarks.
- **Stance**: Supports.
- **Potential Use**: Learned references for set and graph classification.

##### Ma, Qin, You, Ran and Fu (2022). Rethinking Network Design and Local Geometry in Point Cloud: A Simple Residual MLP Framework.
- **Key**: `ma2022rethinking`
- **Themes**: main 3
- **Type**: Conference paper (ICLR 2022, per the arXiv comment).
- **Identifier**: arXiv 2202.07123
- **URL confirmed**: arXiv API record and abstract, read in this merge run.
- **Method**: PointMLP, a pure residual MLP point-cloud network with a lightweight geometric affine module and no sophisticated local geometric extractor.
- **Key Findings**: State-of-the-art accuracy on several datasets, surpassing the prior best on ScanObjectNN by 3.3 percent, with faster training and inference.
- **Relevance**: Questions how much local geometric machinery a permutation-invariant point-cloud classifier needs.
- **Quality**: High. Main venue; standard benchmarks, no medical data.
- **Stance**: Supports.
- **Potential Use**: Point-cloud encoders.

##### Qian, Li, Peng, Mai, Hammoud, Elhoseiny and Ghanem (2022). PointNeXt: Revisiting PointNet++ with Improved Training and Scaling Strategies.
- **Key**: `qian2022pointnext`
- **Themes**: main 3
- **Type**: Conference paper (NeurIPS 2022, per the arXiv comment).
- **Identifier**: arXiv 2206.04670
- **URL confirmed**: arXiv API record and abstract, read in this merge run.
- **Method**: Improved training strategies for PointNet++ and a scaled architecture with inverted residual bottlenecks and separable MLPs.
- **Key Findings**: Training changes alone raise PointNet++ on ScanObjectNN from 77.9 to 86.1 percent overall accuracy; PointNeXt reaches 87.7 percent and outperforms recent networks on classification and segmentation.
- **Relevance**: Much of the reported gain of newer point-cloud encoders comes from training and scale, which bears on comparisons of set encoders for subject-level prediction.
- **Quality**: High. Main venue; standard benchmarks.
- **Stance**: Neutral.
- **Potential Use**: Point-cloud encoders; evaluation practice.

##### Zhang, Meng, Zhao, Qiao, Yang, Coupland and Zheng (2022). DTFD-MIL: Double-Tier Feature Distillation Multiple Instance Learning for Histopathology Whole Slide Image Classification.
- **Key**: `zhang2022dtfd`
- **Themes**: main 3; overlap 4
- **Type**: Conference paper (CVPR 2022, pp. 18780-18790).
- **Identifier**: DOI 10.1109/CVPR52688.2022.01824 (arXiv 2203.12081)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record, read in this merge run.
- **Method**: Splits each slide's patch set into pseudo-bags and builds a double-tier attention MIL framework on them, with a derivation of instance probabilities under attention MIL.
- **Key Findings**: Outperforms the compared methods on CAMELYON-16 by large margins and on TCGA lung cancer.
- **Relevance**: Addresses the small number of subjects (bags) relative to instances, the usual regime of lesion-set studies.
- **Quality**: High. Main venue; public benchmarks.
- **Stance**: Supports.
- **Potential Use**: Medical MIL; small-cohort set prediction.

##### Chen, Chen, Li, Chen, Trister, Krishnan and Mahmood (2022). Scaling Vision Transformers to Gigapixel Images via Hierarchical Self-Supervised Learning.
- **Key**: `chen2022scaling`
- **Themes**: main 3; overlap 4
- **Type**: Conference paper (CVPR 2022, pp. 16123-16134).
- **Identifier**: DOI 10.1109/CVPR52688.2022.01567 (arXiv 2206.02647)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record, read in this merge run.
- **Method**: Hierarchical Image Pyramid Transformer (HIPT), two levels of self-supervised ViTs over the nested structure of whole-slide images, pretrained on 10,678 slides of 33 cancer types.
- **Key Findings**: On 9 slide-level tasks, hierarchical pretraining outperforms the compared methods for cancer subtyping and survival prediction.
- **Relevance**: Learns the instance features of a slide-level set predictor from the image, in place of handcrafted region features.
- **Quality**: High. Main venue; large pretraining corpus.
- **Stance**: Supports.
- **Potential Use**: Medical MIL; learned instance features.

##### Song, Chen, Ding, Williamson, Jaume and Mahmood (2024). Morphological Prototyping for Unsupervised Slide Representation Learning in Computational Pathology.
- **Key**: `song2024morphological`
- **Themes**: main 3; overlap 2, 4
- **Type**: Conference paper (CVPR 2024, pp. 11566-11578).
- **Identifier**: DOI 10.1109/CVPR52733.2024.01099 (arXiv 2405.11643)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record, read in this merge run.
- **Method**: PANTHER summarizes a slide's patch set by a Gaussian mixture whose components are morphological prototypes, and uses the mixture parameters as a fixed-size, task-agnostic slide representation.
- **Key Findings**: On subtyping and survival tasks over 13 datasets, PANTHER outperforms or matches supervised MIL baselines, and the prototypes support interpretation.
- **Relevance**: A learned template (the prototype set) turns an unordered instance set into a fixed vector without labels, the unsupervised counterpart of learned transport templates.
- **Quality**: High. Main venue; 13 datasets.
- **Stance**: Supports.
- **Potential Use**: Learned templates for region sets; medical MIL.

##### Gadermayr and Tschuchnig (2024). Multiple instance learning for digital pathology: A review of the state-of-the-art, limitations & future potential.
- **Key**: `gadermayr2024multiple`
- **Themes**: main 3; overlap 4
- **Type**: Journal article, review (Computerized Medical Imaging and Graphics 112:102337).
- **Identifier**: DOI 10.1016/j.compmedimag.2024.102337 (arXiv 2206.04425)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record, read in this merge run.
- **Method**: Review of deep multiple-instance learning concepts in digital pathology.
- **Key Findings**: MIL fits pathology because slide labels are routine and patch, region or pixel labels are not; the review discusses recent advances and remaining challenges.
- **Relevance**: The state of bag-level prediction without region annotation, the pathology counterpart of a pipeline without lesion segmentation.
- **Quality**: Medium. Peer-reviewed review; no new evidence.
- **Stance**: Neutral.
- **Potential Use**: Background on medical MIL.

##### Chen et al. (2024). Towards a general-purpose foundation model for computational pathology.
- **Key**: `chen2024uni`
- **Themes**: main 3; overlap 4
- **Type**: Journal article (Nature Medicine 30(3):850-862).
- **Identifier**: DOI 10.1038/s41591-024-02857-3
- **URL confirmed**: Crossref record and PubMed record 38504018 (abstract read), in this merge run.
- **Method**: UNI, a self-supervised encoder pretrained on more than 100 million images from over 100,000 H&E whole-slide images across 20 tissue types.
- **Key Findings**: Outperforms previous models on 34 pathology tasks and enables slide classification with few-shot class prototypes and subtyping of up to 108 cancer types.
- **Relevance**: Pretrained instance encoders now supply the element features of slide-level set predictors, which moves the learning burden away from the pooling step.
- **Quality**: High. Top journal; broad evaluation.
- **Stance**: Supports.
- **Potential Use**: Instance encoders for set prediction.

##### Xu et al. (2024). A whole-slide foundation model for digital pathology from real-world data.
- **Key**: `xu2024gigapath`
- **Themes**: main 3; overlap 4
- **Type**: Journal article (Nature 630(8015):181-188).
- **Identifier**: DOI 10.1038/s41586-024-07441-w
- **URL confirmed**: Crossref record and PubMed record 38778098 (abstract read), in this merge run.
- **Method**: Prov-GigaPath, pretrained on 1.3 billion tiles from 171,189 slides, with a LongNet-based vision transformer that models all tiles of a slide for slide-level learning.
- **Key Findings**: State-of-the-art performance on 25 of 26 subtyping and pathomics tasks, significantly better than the second-best method on 18.
- **Relevance**: Models the whole unordered tile set of a subject with long-context attention, the slide-scale form of a set encoder with interactions.
- **Quality**: High. Top journal; large real-world corpus.
- **Stance**: Supports.
- **Potential Use**: Set encoders with interactions at scale.

##### Wang et al. (2024). A pathology foundation model for cancer diagnosis and prognosis prediction.
- **Key**: `wang2024chief`
- **Themes**: main 3; overlap 4
- **Type**: Journal article (Nature 634(8035):970-978).
- **Identifier**: DOI 10.1038/s41586-024-07894-z
- **URL confirmed**: Crossref record and the PubMed abstract (found through E-utilities by DOI), in this merge run.
- **Method**: CHIEF combines unsupervised tile-level pretraining with weakly supervised whole-slide pretraining on 60,530 slides from 19 anatomical sites.
- **Key Findings**: Validated on 19,491 slides from 32 independent sets in 24 hospitals and cohorts, for cancer detection, origin identification, molecular profiling and prognosis, outperforming the compared methods.
- **Relevance**: Weakly supervised slide-level aggregation of an unordered tile set to patient-level outcomes at multi-centre scale.
- **Quality**: High. Top journal; external validation.
- **Stance**: Supports.
- **Potential Use**: Subject-level prediction from region sets at scale.

##### Harvey, Loevlie, Satani, Chen, Kent and Hughes (2026). A Multi-Dataset Benchmark of Multiple Instance Learning for 3D Neuroimage Classification.
- **Key**: `harvey2026benchmark`
- **Themes**: main 3; overlap 4
- **Type**: Preprint (arXiv, cs.LG), admitted under `cs_ml`.
- **Identifier**: arXiv 2604.26807
- **URL confirmed**: arXiv API record and abstract, read in this merge run.
- **Method**: Compares simple MIL, attention MIL, 3D CNNs and 3D ViTs on three CT and four MRI datasets, two with at least 10,000 scans, treating a scan as a set of 2D slices embedded by a frozen encoder.
- **Key Findings**: Mean pooling MIL without learned attention matches or outperforms the alternatives on 4 of 6 moderate-sized tasks and stays competitive on the large datasets while training 25 times faster.
- **Relevance**: Evidence that set pooling over slices can replace a 3D volumetric model for subject-level neuroimage classification, and a baseline that learned pooling must beat.
- **Quality**: Medium. Preprint; seven datasets.
- **Stance**: Supports.
- **Potential Use**: Set pooling baselines in neuroimaging.

#### Theme 4: medical-imaging pipelines and registration-free prediction

##### Avants, Epstein, Grossman and Gee (2008). Symmetric diffeomorphic image registration with cross-correlation: Evaluating automated labeling of elderly and neurodegenerative brain.
- **Key**: `avants2008syn`
- **Themes**: main 4
- **Type**: Journal article (Medical Image Analysis 12(1):26-41).
- **Identifier**: DOI 10.1016/j.media.2007.06.004
- **URL confirmed**: https://doi.org/10.1016/j.media.2007.06.004 (resolves to the Elsevier record; Crossref title and authors match).
- **Method**: Symmetric normalisation (SyN): maximises cross-correlation within the space of diffeomorphic maps, with the Euler-Lagrange equations of that optimisation; evaluated against an elastic method and ITK Demons on manual cortical labels.
- **Key Findings**: SyN compares favourably with both baselines, most when the template and target brains are far apart. It became the deformable model of ANTs.
- **Relevance**: The classical form of "registration to a common space" that the research question names first; every voxel-wise or atlas-based subject-level pipeline in the theme builds on a map of this kind.
- **Quality**: High; seminal work (date outside the 10-year window), widely used reference method.
- **Stance**: Supports (defines the registration step).
- **Potential Use**: Background on registration-based pipelines.

##### Avants, Tustison, Song, Cook, Klein and Gee (2011). A reproducible evaluation of ANTs similarity metric performance in brain image registration.
- **Key**: `avants2011ants`
- **Themes**: main 4
- **Type**: Journal article (NeuroImage 54(3):2033-2044).
- **Identifier**: DOI 10.1016/j.neuroimage.2010.09.025
- **URL confirmed**: https://doi.org/10.1016/j.neuroimage.2010.09.025
- **Method**: Compares squared intensity difference, cross-correlation and mutual information in ANTs, affine and deformable stages, by twofold cross-validation on the 40-subject LPBA40 labelled MRI set; code, data and scripts released.
- **Key Findings**: Mutual-information affine mapping followed by cross-correlation diffeomorphic mapping gave the best cortical labelling (Jaccard 0.669, as reported in the abstract). The evaluation is fully scripted for reproduction.
- **Relevance**: Documents ANTs, the tool the theme's scope names, and the configuration choices a registration-based pipeline carries.
- **Quality**: High; seminal work, open data and code.
- **Stance**: Supports.
- **Potential Use**: Registration background; the cost and configuration of the registration step.

##### Klein et al. (2009). Evaluation of 14 nonlinear deformation algorithms applied to human brain MRI registration.
- **Key**: `klein2009evaluation`
- **Themes**: main 4
- **Type**: Journal article (NeuroImage 46(3):786-802).
- **Identifier**: DOI 10.1016/j.neuroimage.2008.12.037
- **URL confirmed**: https://doi.org/10.1016/j.neuroimage.2008.12.037
- **Method**: Benchmark of 14 nonlinear registration algorithms on 80 manually labelled brain MRIs with 8 error measures and more than 45,000 registrations, each preceded by FLIRT linear registration.
- **Key Findings**: ART, SyN, IRTK and SPM DARTEL gave the best overlap and distance scores; ART and SyN were the most consistent across subjects and label sets. Relative rankings changed little with population, labelling protocol or overlap measure.
- **Relevance**: The reference comparison of how well classical registration recovers anatomical correspondence across subjects, which bounds what a registration-based predictor can rely on.
- **Quality**: High; seminal, large-scale benchmark.
- **Stance**: Supports (quantifies the registration step).
- **Potential Use**: Registration background; the accuracy of correspondence obtained by registration.

##### Balakrishnan, Zhao, Sabuncu, Guttag and Dalca (2019). VoxelMorph: A Learning Framework for Deformable Medical Image Registration.
- **Key**: `balakrishnan2019voxelmorph`
- **Themes**: main 4
- **Type**: Journal article (IEEE Transactions on Medical Imaging 38(8):1788-1800); arXiv 1809.05231.
- **Identifier**: DOI 10.1109/TMI.2019.2897538
- **URL confirmed**: https://doi.org/10.1109/TMI.2019.2897538 (resolves to IEEE Xplore document 8633930); https://arxiv.org/abs/1809.05231
- **Method**: A convolutional network maps an image pair to a deformation field; its parameters are learned once over a collection with an unsupervised image-similarity loss, optionally with segmentations available at training time.
- **Key Findings**: Accuracy comparable to classical methods with registration in under a second on a GPU and under a minute on a CPU, against tens of minutes or more for the baselines. Auxiliary segmentations at training time improve test accuracy.
- **Relevance**: The learned registration the scope names; it keeps the common-space design and removes the per-pair optimisation cost.
- **Quality**: High; Q1 journal, widely used open code.
- **Stance**: Supports.
- **Potential Use**: Learned registration; the cost argument for and against registration.

##### Chen, Frey, He, Segars, Li and Du (2022). TransMorph: Transformer for unsupervised medical image registration.
- **Key**: `chen2022transmorph`
- **Themes**: main 4
- **Type**: Journal article (Medical Image Analysis 82:102615); arXiv 2111.10480.
- **Identifier**: DOI 10.1016/j.media.2022.102615
- **URL confirmed**: https://doi.org/10.1016/j.media.2022.102615; https://arxiv.org/abs/2111.10480
- **Method**: A hybrid Transformer and ConvNet registration network, with two diffeomorphic variants and a Bayesian variant for registration uncertainty; evaluated on inter-patient and atlas-to-patient brain MRI and phantom-to-CT registration.
- **Key Findings**: The authors report gains over classical and learned registration baselines on these tasks. The Bayesian variant gives an uncertainty estimate for the deformation.
- **Relevance**: The current form of learned registration to a common space; an uncertainty on the map is what a downstream predictor would need to weigh registration error.
- **Quality**: High; Q1 journal, open code.
- **Stance**: Supports.
- **Potential Use**: Learned registration; recent state of the registration step.

##### Joshi, Davis, Jomier and Gerig (2004). Unbiased diffeomorphic atlas construction for computational anatomy.
- **Key**: `joshi2004unbiased`
- **Themes**: main 4
- **Type**: Journal article (NeuroImage 23 Suppl. 1:S151-S160).
- **Identifier**: DOI 10.1016/j.neuroimage.2004.07.068
- **URL confirmed**: https://doi.org/10.1016/j.neuroimage.2004.07.068
- **Method**: Builds a population atlas as the image minimising the summed diffeomorphic distance to all subjects in the large-deformation framework, so that no single subject is the template; validated by deforming the probabilistic atlas onto new subjects against manual segmentations.
- **Key Findings**: Choosing one subject as template biases the analysis, and the estimated atlas removes that bias.
- **Relevance**: The registration-side precedent of a learned template or barycenter: a common space estimated from the population, which transport barycenters (Gramfort 2015) and learned templates (Dalca 2019) later generalise.
- **Quality**: High; seminal work.
- **Stance**: Supports.
- **Potential Use**: Templates and barycenters; bridge from registration to transport barycenters.

##### Dalca, Rakic, Guttag and Sabuncu (2019). Learning Conditional Deformable Templates with Convolutional Networks.
- **Key**: `dalca2019conditional`
- **Themes**: main 4
- **Type**: Conference paper (NeurIPS 2019; arXiv journal reference "NeurIPS: Thirty-third Conference on Neural Information Processing Systems, 2019").
- **Identifier**: arXiv 1908.02738
- **URL confirmed**: https://arxiv.org/abs/1908.02738
- **Method**: A probabilistic model learns a universal template or templates conditioned on subject attributes, jointly with a network that aligns each image to its template.
- **Key Findings**: Template estimation and alignment, an iterative and expensive process in classical atlas building, become one learned model, so conditional templates per attribute become affordable.
- **Relevance**: A learned template as the answer to the missing correspondence, inside the registration paradigm; the conditional form ties the template to subject-level covariates.
- **Quality**: High; top ML venue, open code in the VoxelMorph library.
- **Stance**: Supports.
- **Potential Use**: Learned templates; comparison with transport dictionaries and barycenters.

##### Gillies, Kinahan and Hricak (2016). Radiomics: Images Are More than Pictures, They Are Data.
- **Key**: `gillies2016radiomics`
- **Themes**: main 4
- **Type**: Journal article, special report (Radiology 278(2):563-577).
- **Identifier**: DOI 10.1148/radiol.2015151169
- **URL confirmed**: https://doi.org/10.1148/radiol.2015151169 (resolves to pubs.rsna.org)
- **Method**: Review that defines radiomics as the high-throughput extraction of quantitative features from images, combined with other patient data and mined to build diagnostic, prognostic and predictive models.
- **Key Findings**: Sets out the radiomics workflow (acquisition, segmentation, feature extraction, modelling) and its open problems.
- **Relevance**: Defines the radiomics pipeline the research question asks each method to remove or build on.
- **Quality**: High; Radiology, foundational review.
- **Stance**: Neutral (defines the pipeline).
- **Potential Use**: Introduction; definition of the radiomics pipeline.

##### Aerts et al. (2014). Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach.
- **Key**: `aerts2014decoding`
- **Themes**: main 4
- **Type**: Journal article (Nature Communications 5:4006).
- **Identifier**: DOI 10.1038/ncomms5006
- **URL confirmed**: https://doi.org/10.1038/ncomms5006
- **Method**: 440 intensity, shape, texture and wavelet features from pretreatment CT of 1,019 lung and head-and-neck cancer patients, with a prognostic signature validated on independent cohorts.
- **Key Findings**: Many features carry prognostic information in independent datasets, and a signature that reflects intra-tumour heterogeneity is associated with gene-expression patterns.
- **Relevance**: The canonical subject-level prediction from a segmented lesion through handcrafted features: the pipeline that lesion-set and registration-free methods build on.
- **Quality**: High; seminal work (2014, outside the 10-year window), multi-cohort validation.
- **Stance**: Supports.
- **Potential Use**: Radiomics background; the baseline pipeline.

##### van Griethuysen et al. (2017). Computational Radiomics System to Decode the Radiographic Phenotype.
- **Key**: `vangriethuysen2017pyradiomics`
- **Themes**: main 4
- **Type**: Journal article (Cancer Research 77(21):e104-e107).
- **Identifier**: DOI 10.1158/0008-5472.CAN-17-0339
- **URL confirmed**: https://doi.org/10.1158/0008-5472.CAN-17-0339 (resolves to aacrjournals.org)
- **Method**: Describes PyRadiomics, an open-source Python platform for extracting engineered features from images and masks, standalone or in 3D Slicer.
- **Key Findings**: Argues that missing standard algorithm definitions hamper reproducibility, and releases a reference implementation shown on lung lesions.
- **Relevance**: The extractor most lesion-set studies use for per-lesion features (the input to MIL and aggregation methods in section D).
- **Quality**: High; widely used tool paper.
- **Stance**: Supports.
- **Potential Use**: Radiomics pipeline; the feature-extraction step.

##### Zwanenburg et al. (2020). The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping.
- **Key**: `zwanenburg2020ibsi`
- **Themes**: main 4
- **Type**: Journal article (Radiology 295(2):328-338).
- **Identifier**: DOI 10.1148/radiol.2020191145
- **URL confirmed**: https://doi.org/10.1148/radiol.2020191145
- **Method**: Multi-phase, multi-team study standardising 174 radiomic features with reference values on a digital phantom and patient images; validation on CT, PET and MRI of 51 soft-tissue sarcoma patients.
- **Key Findings**: 169 of 174 features were standardised, and most reproduced well across teams in validation, which allows radiomics software to be verified and calibrated.
- **Relevance**: The reproducibility standard of the radiomics step; it fixes software agreement and leaves dependence on acquisition and segmentation.
- **Quality**: High; Radiology, consortium study.
- **Stance**: Supports.
- **Potential Use**: Radiomics reproducibility.

##### Traverso, Wee, Dekker and Gillies (2018). Repeatability and Reproducibility of Radiomic Features: A Systematic Review.
- **Key**: `traverso2018repeatability`
- **Themes**: main 4
- **Type**: Journal article, systematic review (International Journal of Radiation Oncology, Biology, Physics 102(4):1143-1158).
- **Identifier**: DOI 10.1016/j.ijrobp.2018.05.053
- **URL confirmed**: https://doi.org/10.1016/j.ijrobp.2018.05.053
- **Method**: Systematic review of 41 studies of test-retest and cross-setting stability of radiomic features.
- **Key Findings**: Feature stability depends on acquisition, reconstruction, preprocessing and extraction software; first-order features are more reproducible than shape and texture features; only 7 studies reported every methodological step.
- **Relevance**: Evidence that the radiomics step, and the segmentation it depends on, add variance to a subject-level predictor; it motivates methods that learn features from the image or lesion set.
- **Quality**: High; systematic review.
- **Stance**: Opposes (evidence against relying on handcrafted features without standardisation).
- **Potential Use**: Radiomics reproducibility; motivation for learned or registration-free features.

##### Hosny et al. (2018). Deep learning for lung cancer prognostication: A retrospective multi-cohort radiomics study.
- **Key**: `hosny2018deep`
- **Themes**: main 4
- **Type**: Journal article (PLOS Medicine 15(11):e1002711).
- **Identifier**: DOI 10.1371/journal.pmed.1002711
- **URL confirmed**: https://doi.org/10.1371/journal.pmed.1002711
- **Method**: 3D convolutional network on pretreatment CT, trained and evaluated on 7 cohorts from 5 institutions (1,194 NSCLC patients), compared with clinical and engineered-feature models.
- **Key Findings**: Predictions associated with 2-year overall survival (AUC 0.70 for radiotherapy, 0.71 for surgery cohorts, as reported in the abstract), with test-retest ICC 0.91 and inter-reader Spearman 0.88.
- **Relevance**: Removes the handcrafted feature step while keeping the tumour localisation step; a single-lesion counterpart to the lesion-set methods.
- **Quality**: High; multi-cohort external validation.
- **Stance**: Supports (learned features in place of the radiomics step).
- **Potential Use**: Where learned models remove the radiomics step.

##### Ronneberger, Fischer and Brox (2015). U-Net: Convolutional Networks for Biomedical Image Segmentation.
- **Key**: `ronneberger2015unet`
- **Themes**: main 4
- **Type**: Conference paper (MICCAI 2015, LNCS, pp. 234-241); arXiv 1505.04597.
- **Identifier**: DOI 10.1007/978-3-319-24574-4_28
- **URL confirmed**: https://doi.org/10.1007/978-3-319-24574-4_28 (resolves to link.springer.com); https://arxiv.org/abs/1505.04597
- **Method**: Encoder-decoder convolutional network with skip connections trained end to end for dense segmentation from few annotated images.
- **Key Findings**: The architecture became the basis of most medical segmentation networks, nnU-Net included.
- **Relevance**: The segmentation model behind the lesion and organ masks that radiomics and lesion-set predictors take as input.
- **Quality**: High; seminal work.
- **Stance**: Supports.
- **Potential Use**: Segmentation background.

##### Isensee, Jaeger, Kohl, Petersen and Maier-Hein (2021). nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation.
- **Key**: `isensee2021nnunet`
- **Themes**: main 4
- **Type**: Journal article (Nature Methods 18(2):203-211).
- **Identifier**: DOI 10.1038/s41592-020-01008-z
- **URL confirmed**: https://doi.org/10.1038/s41592-020-01008-z
- **Method**: Configures preprocessing, U-Net variant, training and post-processing for a new dataset from fixed parameters, interdependent rules and empirical decisions, without manual tuning.
- **Key Findings**: Surpasses most existing approaches, including specialised ones, on 23 public datasets from segmentation competitions.
- **Relevance**: The segmentation step the scope names; lesion-set predictors such as Zhang 2025 compare their lesion segmentation against it.
- **Quality**: High; Nature Methods, broad benchmark.
- **Stance**: Supports.
- **Potential Use**: Segmentation step of the pipeline.

##### Isensee, Wald, Ulrich, Baumgartner, Roy, Maier-Hein and Jaeger (2024). nnU-Net Revisited: A Call for Rigorous Validation in 3D Medical Image Segmentation.
- **Key**: `isensee2024revisited`
- **Themes**: main 4
- **Type**: Conference paper (MICCAI 2024, LNCS, pp. 488-498); arXiv 2404.09556.
- **Identifier**: DOI 10.1007/978-3-031-72114-4_47
- **URL confirmed**: https://doi.org/10.1007/978-3-031-72114-4_47; https://arxiv.org/abs/2404.09556
- **Method**: Large benchmark of CNN, Transformer and Mamba segmentation methods under controlled baselines, datasets and compute.
- **Key Findings**: Many claims of gains over U-Net do not hold under rigorous validation; CNN U-Nets within nnU-Net, scaled to the hardware, give state-of-the-art results. The median number of datasets in recent claims was three.
- **Relevance**: Sets the current segmentation baseline and the validation standard a pipeline built on segmentation should meet.
- **Quality**: High; MICCAI, controlled benchmark.
- **Stance**: Supports.
- **Potential Use**: Segmentation step; validation standard.

##### Chang, Joel, Chang, Du, Khanna, Omuro, Chiang and Aneja (2021). Comparison of radiomic feature aggregation methods for patients with multiple tumors.
- **Key**: `chang2021aggregation`
- **Themes**: main 4
- **Type**: Journal article (Scientific Reports 11:9758).
- **Identifier**: DOI 10.1038/s41598-021-89114-6
- **URL confirmed**: https://doi.org/10.1038/s41598-021-89114-6
- **Method**: Six fixed rules for combining per-lesion radiomic features into one patient vector, compared under Cox, LASSO-Cox and random survival forest models on 831 patients with 3,596 brain metastases.
- **Key Findings**: A volume-weighted average of the three largest metastases modelled survival best overall; the best rule changed with lesion count.
- **Relevance**: Fixed permutation-invariant aggregation over a lesion set, built on segmentation and radiomics; the baseline that learned set pooling is measured against.
- **Quality**: High; large cohort, multiple survival models.
- **Stance**: Supports.
- **Potential Use**: Lesion-set prediction; fixed aggregation baselines.

##### Chen, Cheung, Milot and Martel (2021). AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases.
- **Key**: `chen2021aminn`
- **Themes**: main 4; overlap 3
- **Type**: Conference paper (MICCAI 2021, LNCS, pp. 752-761); arXiv 2012.06875.
- **Identifier**: DOI 10.1007/978-3-030-87240-3_72
- **URL confirmed**: https://doi.org/10.1007/978-3-030-87240-3_72; https://arxiv.org/abs/2012.06875
- **Method**: Per-lesion radiomic features from contrast-enhanced MRI enter a network trained jointly to reconstruct the features (autoencoder branch) and to predict outcome by multiple-instance pooling over all of a patient's lesions.
- **Key Findings**: The revised abstract reports an AUC 11.4 percent higher than the best baseline, and a risk score that was the only marker significant in univariate and multivariate Cox models among those compared.
- **Relevance**: Learned permutation-invariant pooling over a lesion set, built on segmentation and radiomics. Overlap with theme 3 (multiple-instance learning).
- **Quality**: Medium; MICCAI, single-centre cohort.
- **Stance**: Supports.
- **Potential Use**: Lesion-set prediction; learned pooling.

##### Chen and Martel (2022). Metastatic Cancer Outcome Prediction with Injective Multiple Instance Pooling.
- **Key**: `chen2022injective`
- **Themes**: main 4; overlap 3
- **Type**: Preprint (arXiv, eess.IV).
- **Identifier**: arXiv 2203.04964
- **URL confirmed**: https://arxiv.org/abs/2203.04964
- **Method**: Benchmark cohorts built from TCIA (HN1-MF, 83 patients and 245 tumours; Lung1-MF, 258 patients and 1,039 tumours) from manual gross tumour volumes split into connected lesions; 103 IBSI-compliant radiomic features per lesion; two injective pooling functions (sum and unnormalised sigmoid attention) in place of mean, max and softmax attention.
- **Key Findings**: Mean, max and softmax attention pooling are not injective, so distinct lesion sets can map to the same patient vector. Injective pooling gave AUC 0.773 (HN1-MF, 1-year survival) and 0.596 (Lung1-MF, 5-year survival) over 10 repetitions of 10-fold cross-validation.
- **Relevance**: States the expressiveness condition a permutation-invariant lesion-set predictor must meet, and supplies public multi-lesion benchmarks. Overlap with theme 3.
- **Quality**: Medium; preprint (admitted under `cs_ml`), public data, repeated cross-validation.
- **Stance**: Supports.
- **Potential Use**: Lesion-set prediction; set pooling; benchmarks.

##### Prabhakar et al. (2023). Self-pruning Graph Neural Network for Predicting Inflammatory Disease Activity in Multiple Sclerosis from Brain MR Images.
- **Key**: `prabhakar2023selfpruning`
- **Themes**: main 4; overlap 3
- **Type**: Conference paper (MICCAI 2023, LNCS, pp. 226-236); arXiv 2308.16863.
- **Identifier**: DOI 10.1007/978-3-031-43993-3_22
- **URL confirmed**: https://doi.org/10.1007/978-3-031-43993-3_22; https://arxiv.org/abs/2308.16863
- **Method**: Lesions found by a 3D segmentation network become nodes of a patient graph with edges by spatial proximity; a self-pruning step keeps the lesions most important for graph classification of future inflammatory activity.
- **Key Findings**: AUC 0.67 against 0.61 for the baseline at one year, as reported in the abstract, with a per-lesion importance score.
- **Relevance**: A lesion set with relational structure: the graph keeps spatial relations among lesions without registering patients to a common space; it builds on a segmentation step.
- **Quality**: Medium; MICCAI, open code.
- **Stance**: Supports.
- **Potential Use**: Lesion-set prediction; graph-structured sets.

##### Zhang et al. (2025). Lymphoma Prognosis with Lesion-Anatomy Context Fusion and Attention-Based Multi-lesion Aggregation.
- **Key**: `zhang2025lamp`
- **Themes**: main 4; overlap 3
- **Type**: Conference paper (MICCAI 2025, LNCS, pp. 322-332; published online 21 September 2025).
- **Identifier**: DOI 10.1007/978-3-032-04927-8_31
- **URL confirmed**: https://doi.org/10.1007/978-3-032-04927-8_31; https://papers.miccai.org/miccai-2025/0514-Paper1634.html
- **Method**: Lesion features from PET/CT are fused with anatomical context from organ masks of a pretrained TotalSegmentator network by cross-attention, then aggregated over lesions by attention into a patient-level risk; 229 lymphoma patients, 5-fold cross-validation.
- **Key Findings**: C-index 0.791 for progression-free and 0.828 for overall survival; attention weights indicate each lesion's contribution. The reviews on the MICCAI page note that no significance tests were run across methods.
- **Relevance**: Uses organ segmentation in place of registration: anatomical position enters as a per-lesion feature from organ masks, and the lesion set is pooled by attention. Overlap with theme 3.
- **Quality**: Medium; MICCAI, single cohort, no significance testing.
- **Stance**: Supports.
- **Potential Use**: Lesion-set prediction; segmentation as a substitute for registration.

##### Feydy, Charlier, Vialard and Peyre (2017). Optimal Transport for Diffeomorphic Registration.
- **Key**: `feydy2017optimal`
- **Themes**: main 4; overlap 2
- **Type**: Conference paper (MICCAI 2017, LNCS, pp. 291-299); arXiv 1706.05218.
- **Identifier**: DOI 10.1007/978-3-319-66182-7_34
- **URL confirmed**: https://doi.org/10.1007/978-3-319-66182-7_34; https://arxiv.org/abs/1706.05218
- **Method**: Unbalanced entropic optimal transport, computed by a generalised Sinkhorn algorithm, as the data term of diffeomorphic matching of surfaces or volumes.
- **Key Findings**: A global transport fidelity term avoids the poor local minima of local similarity measures.
- **Relevance**: Transport inside the registration step: the coupling supplies correspondence to a deformation model, which keeps the common-space design. Overlap with theme 2.
- **Quality**: High; MICCAI.
- **Stance**: Supports.
- **Potential Use**: Transport-based registration.

##### Kundu, Kolouri, Erickson, Kramer, McAuley and Rohde (2018). Discovery and visualization of structural biomarkers from MRI using transport-based morphometry.
- **Key**: `kundu2018transport`
- **Themes**: main 4; overlap 2
- **Type**: Journal article (NeuroImage 167:256-275); arXiv 1705.04919.
- **Identifier**: DOI 10.1016/j.neuroimage.2017.11.006
- **URL confirmed**: https://doi.org/10.1016/j.neuroimage.2017.11.006; https://arxiv.org/abs/1705.04919
- **Method**: T1 MRIs are skull-stripped, intensity-normalised and affinely registered to MNI with SPM12, with no deformable registration; transport maps from a Euclidean-mean reference to each subject (curl-regularised, multiscale) are embedded linearly, and regression, penalised LDA and PCA run on the maps; 135 adults aged 58 to 81.
- **Key Findings**: A transport direction correlated with age (r = 0.46) and penalised LDA separated high-fit from low-fit groups in training; the inverse map turns each direction into visible tissue changes.
- **Relevance**: Subject-level prediction where the transport map to a template replaces deformable registration and handcrafted morphometric features; an affine step remains. Overlap with theme 2.
- **Quality**: High; Q1 journal, generative and interpretable, single healthy-ageing cohort.
- **Stance**: Supports.
- **Potential Use**: Transport-based subject-level prediction.

##### Shen, Feydy, Liu, Curiale, San Jose Estepar, San Jose Estepar and Niethammer (2021). Accurate Point Cloud Registration with Robust Optimal Transport.
- **Key**: `shen2021robot`
- **Themes**: main 4; overlap 2
- **Type**: Conference paper (NeurIPS 2021, per the NeurIPS poster page returned by query 6); arXiv 2111.00648.
- **Identifier**: arXiv 2111.00648
- **URL confirmed**: https://arxiv.org/abs/2111.00648
- **Method**: Robust (unbalanced) optimal transport for shape matching, used for pre-alignment and fine-tuning of optimisation-based and learned point-cloud registration; tasks include nonparametric registration of lung vascular trees.
- **Key Findings**: State-of-the-art accuracy and scalability on Kitti scene flow and on lung vessel registration; release of PVT1010, 1,010 pairs of lung vascular trees as point clouds.
- **Relevance**: Transport coupling between medical point clouds that differ in sampling and size; it supplies correspondence for point-cloud data without a voxel grid. Overlap with theme 2.
- **Quality**: High; NeurIPS, public dataset and code.
- **Stance**: Supports.
- **Potential Use**: Transport for medical point clouds.

##### Mazelet, Flamary and Thirion (2026). Learning fMRI activations dictionaries across individual geometries via optimal transport.
- **Key**: `mazelet2026fmri`
- **Themes**: main 4; overlap 2
- **Type**: Preprint (arXiv, cs.LG, posted 20 May 2026).
- **Identifier**: arXiv 2605.20883
- **URL confirmed**: https://arxiv.org/abs/2605.20883
- **Method**: Dictionary learning on fMRI graphs of each subject's own geometry with the fused Gromov-Wasserstein distance; an amortised network predicts approximate transport plans to make many large FGW computations affordable, and atoms depend on the FGW trade-off parameter.
- **Key Findings**: On HCP data the dictionaries capture several levels of geometric variability and keep the information that projection onto a common template removes.
- **Relevance**: A learned transport dictionary in place of a common template for brain data; the representation that a subject-level predictor could take as input. Overlap with theme 2.
- **Quality**: Medium; recent preprint (admitted under `cs_ml`), not yet peer-reviewed.
- **Stance**: Supports.
- **Potential Use**: Learned transport templates and dictionaries in imaging; recent work.

##### Gutierrez-Becker, Sarasua and Wachinger (2021). Discriminative and generative models for anatomical shape analysis on point clouds with deep neural networks.
- **Key**: `gutierrezbecker2021discriminative`
- **Themes**: main 4; overlap 3
- **Type**: Journal article (Medical Image Analysis 67:101852); arXiv 2010.00820.
- **Identifier**: DOI 10.1016/j.media.2020.101852
- **URL confirmed**: https://doi.org/10.1016/j.media.2020.101852; https://arxiv.org/abs/2010.00820
- **Method**: Discriminative and conditional generative networks on unordered point clouds of anatomical structures, invariant to similarity transforms, with diagnosis as the condition of the generative model.
- **Key Findings**: High classification and regression accuracy against other shape descriptors; multi-structure analysis is more accurate and efficient than single-structure analysis; the generative model shows diagnosis-specific shape variation.
- **Relevance**: Extends the point-cloud approach to a journal-scale evaluation with a generative model that makes the predictor interpretable. Overlap with theme 3.
- **Quality**: High; Q1 journal.
- **Stance**: Supports.
- **Potential Use**: Point-cloud subject-level prediction.

##### Geady, Patel, Peoples, Simpson and Haibe-Kains (2025). Radiomic-based approaches in the multi-metastatic setting: a quantitative review.
- **Key**: `geady2024multimetastatic`
- **Themes**: main 4
- **Type**: Journal article (BMC Cancer 25(1):538). Theme run 4 included its medRxiv preprint (DOI 10.1101/2024.07.04.24309964, posted 5 July 2024); this merge run found the published version.
- **Identifier**: DOI 10.1186/s12885-025-13850-5
- **URL confirmed**: Crossref record of 10.1186/s12885-025-13850-5 (title and the same five authors, published 25 March 2025) and PubMed record 40133834 (abstract read), both read in this merge run.
- **Method**: Methods for combining lesion-level radiomic features found in the literature were replicated and ten of them compared on three datasets (16,894 lesions, 3,930 patients) with Cox models, against univariable total tumour volume.
- **Key Findings**: Results varied by dataset and lesion burden, and no single combination method consistently outperformed the others.
- **Relevance**: The widest comparison of fixed aggregation rules over lesion sets. It shows that no fixed rule transfers across settings, which is the case for aggregation learned from the data.
- **Quality**: High. Peer-reviewed journal, large multi-dataset design.
- **Stance**: Supports.
- **Potential Use**: Lesion-set prediction; fixed aggregation baselines.

##### Adams and Elhabian (2024). Point2SSM: Learning Morphological Variations of Anatomies from Point Cloud.
- **Key**: `adams2024point2ssm`
- **Themes**: main 4; overlap 3
- **Type**: Conference paper (ICLR 2024 spotlight, per the arXiv comment).
- **Identifier**: arXiv 2305.14486
- **URL confirmed**: arXiv API record and abstract, read in this merge run.
- **Method**: Unsupervised learning of correspondence-based statistical shape models directly from raw anatomical point clouds, with an attention module that maps learned point features to correspondence points.
- **Key Findings**: A benchmark shows that standard point-cloud networks are not robust to noisy, sparse or incomplete clinical input; Point2SSM gives more accurate surface sampling and correspondence than the compared networks.
- **Relevance**: Recovers point correspondence across subjects from unaligned point clouds by learning, the learned counterpart of registration, so that population statistics can follow.
- **Quality**: High. Main venue; several anatomies.
- **Stance**: Supports.
- **Potential Use**: Learned correspondence for anatomical point clouds.

##### Adams, Karanam and Elhabian (2026). Point2SSM++: Self-supervised learning of anatomical shape models from point clouds.
- **Key**: `adams2026point2ssmpp`
- **Themes**: main 4; overlap 3
- **Type**: Journal article (Medical Image Analysis 111:104073).
- **Identifier**: DOI 10.1016/j.media.2026.104073 (arXiv 2405.09707)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record of 2405.09707 (abstract read), in this merge run.
- **Method**: Self-supervised learning of correspondence points from anatomical point clouds, robust to misaligned and inconsistent input, with extensions to spatiotemporal and multi-anatomy shape models.
- **Key Findings**: Across anatomies, metrics and clinically relevant downstream tasks, the method outperforms the compared deep and traditional shape-modelling approaches.
- **Relevance**: Learned correspondence that tolerates misaligned input, a step between registration and correspondence-free set encoders.
- **Quality**: High. Q1 journal; broad validation.
- **Stance**: Supports.
- **Potential Use**: Learned correspondence; recent shape-model work.

##### Iyer and Elhabian (2023). Mesh2SSM: From Surface Meshes to Statistical Shape Models of Anatomy.
- **Key**: `iyer2023mesh2ssm`
- **Themes**: main 4; overlap 3
- **Type**: Conference paper (MICCAI 2023, LNCS, pp. 615-625).
- **Identifier**: DOI 10.1007/978-3-031-43907-0_59 (arXiv 2305.07805)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record, read in this merge run.
- **Method**: Permutation-invariant representation learning that deforms a template point cloud to each subject's mesh, and can learn a population-specific template.
- **Key Findings**: Forms a correspondence-based shape model directly from meshes and reduces the bias of template selection, at low computational cost.
- **Relevance**: A learned template reached by deformation, built on a permutation-invariant encoder, joining the template answer and the permutation-invariance answer.
- **Quality**: Medium. MICCAI; the abstract gives no numbers.
- **Stance**: Supports.
- **Potential Use**: Learned templates for anatomical shapes.

##### Li et al. (2025). MedShapeNet: a large-scale dataset of 3D medical shapes for computer vision.
- **Key**: `li2025medshapenet`
- **Themes**: main 4; overlap 3
- **Type**: Journal article, dataset (Biomedical Engineering / Biomedizinische Technik 70(1):71-90).
- **Identifier**: DOI 10.1515/bmt-2024-0396 (arXiv 2308.16139)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record (which gives the same DOI), read in this merge run.
- **Method**: A collection of more than 100,000 anatomical shapes from 23 datasets, mostly modelled on real patients' images, with a web interface and an API.
- **Key Findings**: Supports discriminative, reconstructive and variational benchmarks; use cases include brain tumour classification from shapes.
- **Relevance**: Public shape and point-cloud data on which correspondence-free and template-based subject-level predictors can be compared.
- **Quality**: Medium. Peer-reviewed dataset paper; no method evidence.
- **Stance**: Neutral.
- **Potential Use**: Data for evaluation.

##### Sarasua, Polsterl and Wachinger (2022). Hippocampal representations for deep learning on Alzheimer's disease.
- **Key**: `sarasua2022hippocampal`
- **Themes**: main 4; overlap 3
- **Type**: Journal article (Scientific Reports 12(1):8619).
- **Identifier**: DOI 10.1038/s41598-022-12533-6
- **URL confirmed**: Crossref record and PubMed record 35597814 (abstract read), in this merge run.
- **Method**: Compares five hippocampal representations, from raw images to meshes and point clouds, each with a tailored network, for AD diagnosis and time-to-dementia prediction on an independent test set.
- **Key Findings**: The choice of representation of the hippocampus affects both performance and ease of interpretation.
- **Relevance**: A direct comparison, on one subject-level outcome, of image, mesh and point-cloud inputs, the comparison that the theme runs found missing between correspondence-free and grid-based inputs.
- **Quality**: High. Peer-reviewed journal; independent test set.
- **Stance**: Neutral.
- **Potential Use**: Comparison of input representations for subject-level prediction.

##### Hering et al. (2023). Learn2Reg: Comprehensive Multi-Task Medical Image Registration Challenge, Dataset and Evaluation in the Era of Deep Learning.
- **Key**: `hering2023learn2reg`
- **Themes**: main 4
- **Type**: Journal article (IEEE Transactions on Medical Imaging 42(3):697-712).
- **Identifier**: DOI 10.1109/TMI.2022.3213983
- **URL confirmed**: Crossref record and PubMed record 36264729 (abstract read), in this merge run.
- **Method**: A multi-task registration challenge over brain, abdomen and thorax, ultrasound, CT and MR, intra- and inter-patient, scored on robustness, accuracy, plausibility and runtime.
- **Key Findings**: Compiles more than 65 method submissions from more than 20 teams and characterizes the state of deformable registration across tasks.
- **Relevance**: The current benchmark of the registration step that registration-based subject-level pipelines build on.
- **Quality**: High. Q1 journal; large challenge.
- **Stance**: Supports (quantifies the registration step).
- **Potential Use**: Registration background; accuracy of correspondence by registration.

##### Hoffmann, Billot, Greve, Iglesias, Fischl and Dalca (2022). SynthMorph: Learning Contrast-Invariant Registration Without Acquired Images.
- **Key**: `hoffmann2022synthmorph`
- **Themes**: main 4
- **Type**: Journal article (IEEE Transactions on Medical Imaging 41(3):543-558).
- **Identifier**: DOI 10.1109/TMI.2021.3116879
- **URL confirmed**: Crossref record and PubMed record 34587005 (abstract read), in this merge run.
- **Method**: Trains registration networks on synthetic label maps and images generated with wide variability, so that they learn contrast-invariant features without acquired data.
- **Key Findings**: Registers arbitrary MRI contrasts accurately with one model, beyond the state of the art within and across contrasts, including contrasts unseen in training.
- **Relevance**: Lowers the cost and fragility of the registration step that a common-space pipeline needs.
- **Quality**: High. Q1 journal; broad neuroimaging evaluation.
- **Stance**: Supports.
- **Potential Use**: Learned registration.

##### Tian, Greer, Kwitt, Vialard, San Jose Estepar, Bouix, Rushmore and Niethammer (2024). uniGradICON: A Foundation Model for Medical Image Registration.
- **Key**: `tian2024unigradicon`
- **Themes**: main 4
- **Type**: Conference paper (MICCAI 2024, LNCS, pp. 749-760).
- **Identifier**: DOI 10.1007/978-3-031-72069-7_70 (arXiv 2403.05780)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record, read in this merge run.
- **Method**: One learned registration model trained and evaluated on twelve public datasets, with zero-shot use on new tasks and fine-tuning for out-of-distribution ones.
- **Key Findings**: Combines the speed and accuracy of learned registration with the generic use of classical methods across datasets.
- **Relevance**: The current form of registration to a common space as a reusable component.
- **Quality**: High. MICCAI; twelve datasets.
- **Stance**: Supports.
- **Potential Use**: Learned registration; recent state of the registration step.

##### Chen, Liu, Wei, Bian, Subramanian, Carass, Prince and Du (2025). A survey on deep learning in medical image registration: New technologies, uncertainty, evaluation metrics, and beyond.
- **Key**: `chen2025survey`
- **Themes**: main 4
- **Type**: Journal article, survey (Medical Image Analysis 100:103385).
- **Identifier**: DOI 10.1016/j.media.2024.103385 (arXiv 2307.15615)
- **URL confirmed**: Crossref record of the DOI and the arXiv API record, read in this merge run.
- **Method**: Survey of deep registration: architectures, similarity measures, regularizers, uncertainty estimation, evaluation metrics and applications such as atlas construction.
- **Key Findings**: Sets out how registration uncertainty is estimated and how registration is evaluated, and lists open-source code.
- **Relevance**: Background on the registration step and its uncertainty, which a predictor built on registration inherits.
- **Quality**: High. Q1 journal; a survey.
- **Stance**: Neutral.
- **Potential Use**: Registration background.

##### Wasserthal et al. (2023). TotalSegmentator: Robust Segmentation of 104 Anatomic Structures in CT Images.
- **Key**: `wasserthal2023totalsegmentator`
- **Themes**: main 4
- **Type**: Journal article (Radiology: Artificial Intelligence 5(5):e230024).
- **Identifier**: DOI 10.1148/ryai.230024
- **URL confirmed**: Crossref record and PubMed record 37795137 (abstract read), in this merge run.
- **Method**: An nnU-Net model trained on 1,204 routine CT examinations to segment 104 structures, applied to 4,004 whole-body CT examinations for an ageing study.
- **Key Findings**: Dice 0.943 on a test set with major abnormalities, and 0.932 against 0.871 for another public model on a separate dataset.
- **Relevance**: The organ segmentation tool that Zhang et al. (2025) use to give each lesion its anatomical context in place of registration.
- **Quality**: High. Peer-reviewed journal; large real-world data.
- **Stance**: Supports.
- **Potential Use**: Segmentation step; anatomical context without registration.

##### Ma, He, Li, Han, You and Wang (2024). Segment anything in medical images.
- **Key**: `ma2024medsam`
- **Themes**: main 4
- **Type**: Journal article (Nature Communications 15(1):654).
- **Identifier**: DOI 10.1038/s41467-024-44824-z
- **URL confirmed**: Crossref record and PubMed record 38253604 (abstract read), in this merge run.
- **Method**: MedSAM, a segmentation foundation model trained on 1,570,263 image-mask pairs over 10 modalities and more than 30 cancer types.
- **Key Findings**: Better accuracy and robustness than modality-wise specialist models on 86 internal and 60 external validation tasks.
- **Relevance**: Lowers the cost of the lesion segmentation step that every lesion-set predictor in this review keeps.
- **Quality**: High. Top journal; broad validation.
- **Stance**: Supports.
- **Potential Use**: Segmentation step.

##### Billot, Greve, Puonti, Thielscher, Van Leemput, Fischl, Dalca and Iglesias (2023). SynthSeg: Segmentation of brain MRI scans of any contrast and resolution without retraining.
- **Key**: `billot2023synthseg`
- **Themes**: main 4
- **Type**: Journal article (Medical Image Analysis 86:102789).
- **Identifier**: DOI 10.1016/j.media.2023.102789
- **URL confirmed**: Crossref record and PubMed record 36857946 (abstract read), in this merge run.
- **Method**: A segmentation CNN trained on synthetic images sampled from a generative model conditioned on segmentations, with fully randomized contrast and resolution.
- **Key Findings**: Segments 5,000 scans of six modalities and ten resolutions without retraining, generalizing better than supervised CNNs, domain adaptation and Bayesian segmentation.
- **Relevance**: Makes the structure segmentation that point-cloud and region-set models start from available on heterogeneous clinical scans.
- **Quality**: High. Q1 journal; large heterogeneous evaluation.
- **Stance**: Supports.
- **Potential Use**: Segmentation step.

##### Kocak et al. (2023). CheckList for EvaluAtion of Radiomics research (CLEAR): a step-by-step reporting guideline for authors and reviewers endorsed by ESR and EuSoMII.
- **Key**: `kocak2023clear`
- **Themes**: main 4
- **Type**: Journal article, reporting guideline (Insights into Imaging 14(1):75).
- **Identifier**: DOI 10.1186/s13244-023-01415-8
- **URL confirmed**: Crossref record and PubMed record 37142815 (abstract read), in this merge run.
- **Method**: A 58-item reporting checklist for radiomics studies.
- **Key Findings**: States that the complexity of the radiomics workflow leads to inadequate reporting and poor reproducibility, and gives a minimum reporting standard.
- **Relevance**: The reporting standard of the radiomics step that lesion-set predictors build on.
- **Quality**: High. Society-endorsed guideline.
- **Stance**: Neutral.
- **Potential Use**: Radiomics reproducibility.

##### Kocak et al. (2024). METhodological RadiomICs Score (METRICS): a quality scoring tool for radiomics research endorsed by EuSoMII.
- **Key**: `kocak2024metrics`
- **Themes**: main 4
- **Type**: Journal article, quality tool (Insights into Imaging 15(1):8).
- **Identifier**: DOI 10.1186/s13244-023-01572-w
- **URL confirmed**: Crossref record and PubMed record 38228979 (abstract read), in this merge run.
- **Method**: A modified Delphi study with 59 panelists from 19 countries, producing a weighted 30-item, 9-category quality score.
- **Key Findings**: Study design, imaging data and image processing and feature extraction carry the highest weights; segmentation is one weighted category.
- **Relevance**: Defines what a methodologically sound radiomics pipeline must report, including its segmentation step.
- **Quality**: High. Society-endorsed consensus.
- **Stance**: Neutral.
- **Potential Use**: Radiomics quality.

##### Whybra et al. (2024). The Image Biomarker Standardization Initiative: Standardized Convolutional Filters for Reproducible Radiomics and Enhanced Clinical Insights.
- **Key**: `whybra2024ibsi`
- **Themes**: main 4
- **Type**: Journal article, special report (Radiology 310(2):e231319).
- **Identifier**: DOI 10.1148/radiol.231319
- **URL confirmed**: Crossref record and PubMed record 38319168 (abstract read), in this merge run.
- **Method**: A three-phase multi-team study establishing reference filtered images and feature values for common convolutional filters, validated on CT, PET and MRI of 51 sarcoma patients.
- **Key Findings**: Reference values were established for 323 of 396 filtered features; Riesz transformations were not standardized.
- **Relevance**: Extends the IBSI standard from feature definitions to filtered features, narrowing a source of variance of the radiomics step.
- **Quality**: High. Radiology; consortium study.
- **Stance**: Supports.
- **Potential Use**: Radiomics reproducibility.

##### Gatidis et al. (2022). A whole-body FDG-PET/CT Dataset with manually annotated Tumor Lesions.
- **Key**: `gatidis2022whole`
- **Themes**: main 4
- **Type**: Journal article, dataset (Scientific Data 9(1):601).
- **Identifier**: DOI 10.1038/s41597-022-01718-3
- **URL confirmed**: Crossref record and PubMed record 36195599 (abstract read), in this merge run.
- **Method**: 1,014 whole-body FDG-PET/CT studies (501 with lymphoma, melanoma or NSCLC, 513 negative controls) with every FDG-avid malignant lesion segmented manually in 3D.
- **Key Findings**: Provides images, lesion masks, diagnosis, age and sex, and a trained baseline model.
- **Relevance**: A public source of per-patient lesion sets on which lesion-set and transport-based predictors can be built and compared.
- **Quality**: High. Peer-reviewed dataset paper.
- **Stance**: Neutral.
- **Potential Use**: Data for lesion-set prediction.

##### Gatidis et al. (2024). Results from the autoPET challenge on fully automated lesion segmentation in oncologic PET/CT imaging.
- **Key**: `gatidis2024autopet`
- **Themes**: main 4
- **Type**: Journal article (Nature Machine Intelligence 6(11):1396-1405).
- **Identifier**: DOI 10.1038/s42256-024-00912-9
- **URL confirmed**: Crossref record and the OpenAlex record (abstract read), in this merge run.
- **Method**: Results of a challenge on automated segmentation of metabolically active lesions in whole-body FDG-PET/CT, with more than 350 registered teams.
- **Key Findings**: Automated lesion segmentation in PET/CT is feasible with high accuracy, and performance depends mainly on the quality and quantity of input data and less on the network architecture.
- **Relevance**: The current evidence on the automated lesion segmentation step that whole-body lesion-set predictors depend on.
- **Quality**: High. Top journal; large challenge.
- **Stance**: Supports.
- **Potential Use**: Segmentation step for lesion sets.

##### Pai et al. (2024). Foundation model for cancer imaging biomarkers.
- **Key**: `pai2024foundation`
- **Themes**: main 4
- **Type**: Journal article (Nature Machine Intelligence 6(3):354-367).
- **Identifier**: DOI 10.1038/s42256-024-00807-9
- **URL confirmed**: Crossref record and PubMed record 38523679 (abstract read), in this merge run.
- **Method**: A convolutional encoder pretrained by self-supervised learning on 11,467 radiographic lesions and used for downstream imaging-biomarker tasks.
- **Key Findings**: Task-specific models built on it significantly outperform conventional supervised and other pretrained models, most when training sets are small, and are more stable to input variations.
- **Relevance**: Learned per-lesion features in place of handcrafted radiomics, the element features a lesion-set predictor can pool.
- **Quality**: High. Top journal; several downstream tasks.
- **Stance**: Supports.
- **Potential Use**: Where learned features remove the radiomics step.

##### Thiery et al. (2023). Graph-based multimodal multi-lesion DLBCL treatment response prediction from PET images.
- **Key**: `thiery2023graph`
- **Themes**: main 4; overlap 3
- **Type**: Preprint (arXiv, eess.IV; AI4Treat workshop, October 2023), admitted under `cs_ml`.
- **Identifier**: arXiv 2310.16863
- **URL confirmed**: arXiv API record and abstract, read in this merge run.
- **Method**: A graph neural network over each patient's lesions combined with clinical data by cross-attention, trained on a private prospective multicentre cohort of 583 patients.
- **Key Findings**: Outperforms classical supervised methods on clinical, imaging or combined data for 2-year progression-free survival classification.
- **Relevance**: A lesion set with relational structure for a subject-level outcome, built on lesion segmentation, without registration across patients.
- **Quality**: Medium. Workshop preprint; private cohort. Theme run 4 excluded it as covered by Zhang et al. (2025), and it is kept here for the currency of the merged set.
- **Stance**: Supports.
- **Potential Use**: Lesion-set prediction; graph-structured sets.

##### Xu, Feng, Yue, Cheng, He, Qi and Zhang (2024). A hybrid few-shot multiple-instance learning model predicting the aggressiveness of lymphoma in PET/CT images.
- **Key**: `xu2024hybrid`
- **Themes**: main 4; overlap 3
- **Type**: Journal article (Computer Methods and Programs in Biomedicine 243:107872).
- **Identifier**: DOI 10.1016/j.cmpb.2023.107872
- **URL confirmed**: Crossref record and PubMed record 37922655 (abstract read), in this merge run.
- **Method**: Each lymphoma lesion is an instance described by self-supervised deep CT features combined with PET and CT radiomics; instance features are pooled to a patient-level bag representation and classified by a few-shot distance-based classifier.
- **Key Findings**: Bag-level AUC 0.795 (plus or minus 0.009) for DLBCL against FL, above radiomics with random forest selection and SVMs; max pooling gave the best model.
- **Relevance**: A lesion-set predictor that keeps segmentation and radiomics and learns the patient-level pooling, with a comparison of pooling choices.
- **Quality**: Medium. Peer-reviewed journal; single-centre setting.
- **Stance**: Supports.
- **Potential Use**: Lesion-set prediction; pooling choices.

##### Kwon et al. (2025). Graph-based prototype inverse-projection for identifying cortical sulcal pattern abnormalities in congenital heart disease.
- **Key**: `kwon2025graph`
- **Themes**: main 4; overlap 3
- **Type**: Journal article (Medical Image Analysis 102:103538).
- **Identifier**: DOI 10.1016/j.media.2025.103538
- **URL confirmed**: Crossref record and PubMed record 40121807 (abstract read), in this merge run.
- **Method**: A prototype-based graph neural network on sulcal-pit graphs, replacing spectral graph matching against a normative reference set, with an inverse projection of prototypes onto node representations.
- **Key Findings**: Better classification of patients with congenital heart disease (n = 345) against controls (n = 174) from four cohorts and a public dataset than the compared models.
- **Relevance**: Learned prototypes replace graph matching to a reference, so subjects with different numbers of sulcal pits are compared without node correspondence.
- **Quality**: Medium. Q1 journal; the abstract gives no effect sizes.
- **Stance**: Supports.
- **Potential Use**: Learned templates for region graphs.

### Literature Matrix

main: the theme run or merge-run theme that holds the source; x: an overlap flagged with a neighbouring theme.

| Source | Key | Theme 1 | Theme 2 | Theme 3 | Theme 4 | Method | Quality |
|--------|-----|---------|---------|---------|---------|--------|---------|
| Bro (1996) | `Bro1996NPLS` | main |  |  |  | Method | High |
| Zhao et al. (2013) | `Zhao2013HOPLS` | main |  |  |  | Method | High |
| Zhang and Li (2017) | `Zhang2017TensorEnvelopePLS` | main |  |  |  | Method | High |
| Zhou, Li and Zhu (2013) | `Zhou2013TensorRegression` | main |  |  |  | Method | High |
| Li, Xu, Zhou and Li (2018) | `Li2018TuckerRegression` | main |  |  |  | Method | High |
| Guhaniyogi, Qamar and Dunson (2017) | `Guhaniyogi2017BayesianTensorRegression` | main |  |  |  | Method | High |
| Lock (2018) | `Lock2018TensorOnTensor` | main |  |  |  | Method | High |
| Liu, Zhu, Long and Liu (2021) | `Liu2021TensorRegressionMonograph` | main |  |  |  | Review | Medium |
| Kolda and Bader (2009) | `Kolda2009TensorDecompositions` | main |  |  |  | Review | High |
| Kiers, ten Berge and Bro (1999) | `Kiers1999PARAFAC2` | main |  |  |  | Method | High |
| Perros et al. (2017) | `Perros2017SPARTan` | main |  |  |  | Method | High |
| Afshar et al. (2018) | `Afshar2018COPA` | main |  |  |  | Method | High |
| Afshar et al. (2020) | `Afshar2020TASTE` | main |  |  |  | Method | High |
| Yin et al. (2020) | `Yin2020LogPar` | main |  |  |  | Method | High |
| Ren et al. (2023) | `Ren2023MULTIPAR` | main |  |  |  | Method | Medium |
| Roald et al. (2022) | `Roald2022AOADMMPARAFAC2` | main |  |  |  | Method | High |
| Schenker, Wang and Acar (2023) | `Schenker2023PARAFAC2CMTF` | main |  |  |  | Method | Medium |
| Hu, Lee and Wang (2021) | `Hu2021GeneralizedTensorDecompositionFeatures` | main |  |  |  | Method | High |
| Madsen, Churchill and M<latin small letter o with stroke>rup (2017) | `Madsen2017ComponentModelsFC` | main |  |  |  | Benchmark | High |
| Acar et al. (2022) | `Acar2022TracingEvolvingNetworks` | main |  |  |  | Clinical application | Medium |
| M<latin small letter o with stroke>rup et al. (2008) | `Morup2008ShiftCP` | main |  |  |  | Method | High |
| Yan, Paynabar and Pacella (2019) | `Yan2019StructuredPointCloudTensorRegression` | main |  |  | x | Method | Medium |
| Huang, Chen and Zhang (2025) | `Huang2025CyclicShiftSKPD` | main |  |  |  | Method | Medium |
| Chatzis, Pfeffer, Lind and Acar (2023) | `chatzis2023timeaware` | main |  |  |  | Method | Medium |
| Cuturi (2013) | `cuturi2013sinkhorn` |  | main |  |  | Method | High |
| Peyr<latin small letter e with acute> and Cuturi (2019) | `peyre2019computational` |  | main |  |  | Review | High |
| Benamou, Carlier, Cuturi, Nenna and Peyr<latin small letter e with acute> (2015) | `benamou2015iterative` |  | main |  |  | Method | High |
| Feydy, S<latin small letter e with acute>journ<latin small letter e with acute>, Vialard, Amari, Trouv<latin small letter e with acute> and Peyr<latin small letter e with acute> (2019) | `feydy2019interpolating` |  | main | x |  | Theory | High |
| M<latin small letter e with acute>moli (2011) | `memoli2011gromov` |  | main |  |  | Theory | High |
| Vayer, Chapel, Flamary, Tavenard and Courty (2019) | `vayer2019optimal` |  | main |  |  | Method | High |
| Vayer, Chapel, Flamary, Tavenard and Courty (2020) | `vayer2020fused` |  | main |  |  | Theory | Medium |
| Vincent-Cuaz, Flamary, Corneli, Vayer and Courty (2022) | `vincentcuaz2022semirelaxed` |  | main |  |  | Method | High |
| Agueh and Carlier (2011) | `agueh2011barycenters` |  | main |  |  | Theory | High |
| Cuturi and Doucet (2014) | `cuturi2014fast` |  | main |  |  | Method | High |
| Bonneel, Peyr<latin small letter e with acute> and Cuturi (2016) | `bonneel2016wasserstein` |  | main |  |  | Method | High |
| Schmitz, Heitz, Bonneel, Ngol<latin small letter e with grave>, Coeurjolly, Cuturi, Peyr<latin small letter e with acute> and Starck (2018) | `schmitz2018wasserstein` |  | main |  |  | Method | High |
| Xu (2020) | `xu2020gromov` |  | main |  |  | Method | Medium |
| Vincent-Cuaz, Vayer, Flamary, Corneli and Courty (2021) | `vincentcuaz2021online` |  | main |  |  | Method | High |
| Vincent-Cuaz, Flamary, Corneli, Vayer and Courty (2022) | `vincentcuaz2022template` |  | main |  |  | Method | High |
| Brogat-Motte, Flamary, Brouard, Rousu and d'Alch<latin small letter e with acute>-Buc (2022) | `brogatmotte2022learning` |  | main |  |  | Method | High |
| Wang, Slep<latin small letter c with caron>ev, Basu, Ozolek and Rohde (2013) | `wang2013linear` |  | main |  |  | Method | High |
| Moosm<latin small letter u with diaeresis>ller and Cloninger (2023) | `moosmuller2023linear` |  | main |  |  | Theory | High |
| Kolouri, Naderializadeh, Rohde and Hoffmann (2021) | `kolouri2021wasserstein` |  | main |  |  | Method | High |
| Nguyen and Tsuda (2023) | `nguyen2023linear` |  | main |  |  | Method | Medium |
| Bai, Kothapalli, Du, Diaz Martin and Kolouri (2025) | `bai2025linear` |  | main |  |  | Method | Medium |
| Mahan, Moosm<latin small letter u with diaeresis>ller and Cloninger (2024) | `mahan2024point` |  | main | x |  | Method | Medium |
| Togninalli, Ghisu, Llinares-L<latin small letter o with acute>pez, Rieck and Borgwardt (2019) | `togninalli2019wasserstein` |  | main |  |  | Method | High |
| Mialon, Chen, d'Aspremont and Mairal (2021) | `mialon2021trainable` |  | main | x |  | Method | High |
| Meunier, Pontil and Ciliberto (2022) | `meunier2022distribution` |  | main | x |  | Theory | High |
| Xu and Cheng (2023) | `xu2023regularized` |  | main | x |  | Method | High |
| Ren, Wang, Fang, Ling and You (2025) | `ren2025otsurv` |  | main |  | x | Clinical application | Medium |
| Gramfort, Peyre and Cuturi (2015) | `gramfort2015fast` |  | main |  | main | Method | Medium |
| Thual, Tran, Zemskova, Courty, Flamary, Dehaene and Thirion (2022) | `thual2022aligning` |  | main |  | main | Method | High |
| Naderializadeh, Comer, Andrews, Hoffmann and Kolouri (2021) | `naderializadeh2021set` |  | main | x |  | Method | High |
| Peyre, Cuturi and Solomon (2016) | `peyre2016gromov` |  | main |  |  | Method | High |
| Montesuma, Mboula and Souloumiac (2025) | `montesuma2025recent` |  | main |  |  | Review | High |
| Khamis, Tsuchida, Tarek, Rolland and Petersson (2024) | `khamis2024scalable` |  | main |  |  | Review | High |
| Sejourne, Peyre and Vialard (2023) | `sejourne2023unbalanced` |  | main |  |  | Review | High |
| Amir and Dym (2025) | `amir2025fourier` |  | main | x |  | Theory | High |
| Carpintero Perez, da Veiga, Garnier and Staber (2024) | `carpinteroperez2024gaussian` |  | main |  |  | Method | Medium |
| Khurana, Kannan, Cloninger and Moosmuller (2023) | `khurana2023supervised` |  | main |  |  | Theory | Medium |
| Liu, Zhang, Wang, Zhao, Zhou and Cui (2023) | `liu2023structure` |  | main |  |  | Method | Low |
| Joodaki et al. (2024) | `joodaki2024pilot` |  | main |  | x | Method | High |
| Joodaki, Shaigan, Samiei, Nagai, Maie, Kuppe and Costa (2025) | `joodaki2025pilotgmvae` |  | main |  | x | Method | Medium |
| Wang, Zhan, Yang, Mu, Chen, Garai, Orzechowski, Wagenaar and Shen (2024) | `wang2024qot` |  | main |  | x | Method | Medium |
| Song, Chen, Jaume, Vaidya, Baras and Mahmood (2024) | `song2024multimodal` |  | main | x | x | Method | High |
| Liu, Ren, Zhang, Lin and You (2025) | `liu2025together` |  | main |  | x | Method | Low |
| Songdechakraiwut, Krause, Banks, Nourski and Van Veen (2022) | `songdechakraiwut2022topological` |  | main |  | x | Method | Medium |
| Dietterich, Lathrop and Lozano-Perez (1997) | `dietterich1997multiple` |  |  | main |  | Method | High |
| Muandet, Fukumizu, Dinuzzo and Scholkopf (2012) | `muandet2012smm` |  |  | main |  | Method | High |
| Poczos, Rinaldo, Singh and Wasserman (2013) | `poczos2013distribution` |  |  | main |  | Theory | Medium |
| Szabo, Sriperumbudur, Poczos and Gretton (2016) | `szabo2016learning` |  |  | main |  | Theory | High |
| Muandet, Fukumizu, Sriperumbudur and Scholkopf (2017) | `muandet2017kernel` |  |  | main |  | Review | High |
| Zaheer, Kottur, Ravanbakhsh, Poczos, Salakhutdinov and Smola (2017) | `zaheer2017deep` |  |  | main |  | Method | High |
| Qi, Su, Mo and Guibas (2017) | `qi2017pointnet` |  |  | main |  | Method | High |
| Qi, Yi, Su and Guibas (2017) | `qi2017pointnetpp` |  |  | main |  | Method | High |
| Ilse, Tomczak and Welling (2018) | `ilse2018attention` |  |  | main |  | Method | High |
| Lee, Lee, Kim, Kosiorek, Choi and Teh (2019) | `lee2019set` |  |  | main |  | Method | High |
| Murphy, Srinivasan, Rao and Ribeiro (2019) | `murphy2019janossy` |  |  | main |  | Method | High |
| Wagstaff, Fuchs, Engelcke, Posner and Osborne (2019) | `wagstaff2019limitations` |  |  | main |  | Theory | High |
| Wang, Sun, Liu, Sarma, Bronstein and Solomon (2019) | `wang2019dynamic` |  |  | main |  | Method | High |
| Campanella, Hanna, Geneslaw, Miraflor, Werneck Krauss Silva, Busam, Brogi, Reuter, Klimstra and Fuchs (2019) | `campanella2019clinical` |  |  | main | x | Clinical application | High |
| Polsterl, Sarasua, Gutierrez-Becker and Wachinger (2020) | `polsterl2020wide` |  |  | main | x | Clinical application | Medium |
| Bloem-Reddy and Teh (2020) | `bloemreddy2020probabilistic` |  |  | main |  | Theory | High |
| Skianis, Nikolentzos, Limnios and Vazirgiannis (2020) | `skianis2020rep` |  | x | main |  | Method | Medium |
| Yang, Deng, Huang, Ni and Xu (2020) | `yang2020relational` |  |  | main | x | Clinical application | Medium |
| Lu, Williamson, Chen, Chen, Barbieri and Mahmood (2021) | `lu2021data` |  |  | main | x | Clinical application | High |
| Shao, Bian, Chen, Wang, Zhang, Ji and Zhang (2021) | `shao2021transmil` |  |  | main |  | Method | High |
| Chen, Zeng, Zhang, Shi, Dekker, Wee and Bermejo (2022) | `chen2022lung` |  |  | main | x | Clinical application | Medium |
| Wagstaff, Fuchs, Engelcke, Osborne and Posner (2022) | `wagstaff2022universal` |  |  | main |  | Theory | High |
| Tabaghi and Wang (2024) | `tabaghi2024universal` |  |  | main |  | Theory | Medium |
| Nikolentzos and Skianis (2025) | `nikolentzos2025lipschitz` |  |  | main |  | Theory | Medium |
| Gutierrez-Becker and Wachinger (2018) | `gutierrezbecker2018deep` |  |  | main | main | Clinical application | Medium |
| Amir, Gortler, Avni, Ravina and Dym (2023) | `amir2023neural` |  |  | main |  | Theory | High |
| Wang, Yang, Li, Wang and Li (2024) | `wang2024polynomial` |  |  | main |  | Theory | High |
| Zweig and Bruna (2022) | `zweig2022exponential` |  |  | main |  | Theory | High |
| Dym and Gortler (2024) | `dym2024low` |  |  | main |  | Theory | High |
| Kimura, Shimizu, Hirakawa, Goto and Saito (2024) | `kimura2024permutation` |  |  | main |  | Review | Low |
| Balan, Haghani and Singh (2025) | `balan2025permutation` |  |  | main |  | Theory | High |
| Bachoc, Bethune, Gonzalez-Sanz and Loubes (2025) | `bachoc2025improved` |  | x | main |  | Theory | High |
| Wang and Fan (2024) | `wang2024graph` |  | x | main |  | Method | High |
| Ma, Qin, You, Ran and Fu (2022) | `ma2022rethinking` |  |  | main |  | Method | High |
| Qian, Li, Peng, Mai, Hammoud, Elhoseiny and Ghanem (2022) | `qian2022pointnext` |  |  | main |  | Method | High |
| Zhang, Meng, Zhao, Qiao, Yang, Coupland and Zheng (2022) | `zhang2022dtfd` |  |  | main | x | Method | High |
| Chen, Chen, Li, Chen, Trister, Krishnan and Mahmood (2022) | `chen2022scaling` |  |  | main | x | Method | High |
| Song, Chen, Ding, Williamson, Jaume and Mahmood (2024) | `song2024morphological` |  | x | main | x | Method | High |
| Gadermayr and Tschuchnig (2024) | `gadermayr2024multiple` |  |  | main | x | Review | Medium |
| Chen et al. (2024) | `chen2024uni` |  |  | main | x | Method | High |
| Xu et al. (2024) | `xu2024gigapath` |  |  | main | x | Method | High |
| Wang et al. (2024) | `wang2024chief` |  |  | main | x | Method | High |
| Harvey, Loevlie, Satani, Chen, Kent and Hughes (2026) | `harvey2026benchmark` |  |  | main | x | Benchmark | Medium |
| Avants, Epstein, Grossman and Gee (2008) | `avants2008syn` |  |  |  | main | Method | High |
| Avants, Tustison, Song, Cook, Klein and Gee (2011) | `avants2011ants` |  |  |  | main | Benchmark | High |
| Klein et al. (2009) | `klein2009evaluation` |  |  |  | main | Benchmark | High |
| Balakrishnan, Zhao, Sabuncu, Guttag and Dalca (2019) | `balakrishnan2019voxelmorph` |  |  |  | main | Method | High |
| Chen, Frey, He, Segars, Li and Du (2022) | `chen2022transmorph` |  |  |  | main | Method | High |
| Joshi, Davis, Jomier and Gerig (2004) | `joshi2004unbiased` |  |  |  | main | Method | High |
| Dalca, Rakic, Guttag and Sabuncu (2019) | `dalca2019conditional` |  |  |  | main | Method | High |
| Gillies, Kinahan and Hricak (2016) | `gillies2016radiomics` |  |  |  | main | Review | High |
| Aerts et al. (2014) | `aerts2014decoding` |  |  |  | main | Clinical application | High |
| van Griethuysen et al. (2017) | `vangriethuysen2017pyradiomics` |  |  |  | main | Dataset or tool | High |
| Zwanenburg et al. (2020) | `zwanenburg2020ibsi` |  |  |  | main | Benchmark | High |
| Traverso, Wee, Dekker and Gillies (2018) | `traverso2018repeatability` |  |  |  | main | Review | High |
| Hosny et al. (2018) | `hosny2018deep` |  |  |  | main | Clinical application | High |
| Ronneberger, Fischer and Brox (2015) | `ronneberger2015unet` |  |  |  | main | Method | High |
| Isensee, Jaeger, Kohl, Petersen and Maier-Hein (2021) | `isensee2021nnunet` |  |  |  | main | Method | High |
| Isensee, Wald, Ulrich, Baumgartner, Roy, Maier-Hein and Jaeger (2024) | `isensee2024revisited` |  |  |  | main | Benchmark | High |
| Chang, Joel, Chang, Du, Khanna, Omuro, Chiang and Aneja (2021) | `chang2021aggregation` |  |  |  | main | Benchmark | High |
| Chen, Cheung, Milot and Martel (2021) | `chen2021aminn` |  |  | x | main | Clinical application | Medium |
| Chen and Martel (2022) | `chen2022injective` |  |  | x | main | Method | Medium |
| Prabhakar et al. (2023) | `prabhakar2023selfpruning` |  |  | x | main | Clinical application | Medium |
| Zhang et al. (2025) | `zhang2025lamp` |  |  | x | main | Clinical application | Medium |
| Feydy, Charlier, Vialard and Peyre (2017) | `feydy2017optimal` |  | x |  | main | Method | High |
| Kundu, Kolouri, Erickson, Kramer, McAuley and Rohde (2018) | `kundu2018transport` |  | x |  | main | Clinical application | High |
| Shen, Feydy, Liu, Curiale, San Jose Estepar, San Jose Estepar and Niethammer (2021) | `shen2021robot` |  | x |  | main | Method | High |
| Mazelet, Flamary and Thirion (2026) | `mazelet2026fmri` |  | x |  | main | Method | Medium |
| Gutierrez-Becker, Sarasua and Wachinger (2021) | `gutierrezbecker2021discriminative` |  |  | x | main | Method | High |
| Geady, Patel, Peoples, Simpson and Haibe-Kains (2025) | `geady2024multimetastatic` |  |  |  | main | Benchmark | High |
| Adams and Elhabian (2024) | `adams2024point2ssm` |  |  | x | main | Method | High |
| Adams, Karanam and Elhabian (2026) | `adams2026point2ssmpp` |  |  | x | main | Method | High |
| Iyer and Elhabian (2023) | `iyer2023mesh2ssm` |  |  | x | main | Method | Medium |
| Li et al. (2025) | `li2025medshapenet` |  |  | x | main | Dataset or tool | Medium |
| Sarasua, Polsterl and Wachinger (2022) | `sarasua2022hippocampal` |  |  | x | main | Benchmark | High |
| Hering et al. (2023) | `hering2023learn2reg` |  |  |  | main | Benchmark | High |
| Hoffmann, Billot, Greve, Iglesias, Fischl and Dalca (2022) | `hoffmann2022synthmorph` |  |  |  | main | Method | High |
| Tian, Greer, Kwitt, Vialard, San Jose Estepar, Bouix, Rushmore and Niethammer (2024) | `tian2024unigradicon` |  |  |  | main | Method | High |
| Chen, Liu, Wei, Bian, Subramanian, Carass, Prince and Du (2025) | `chen2025survey` |  |  |  | main | Review | High |
| Wasserthal et al. (2023) | `wasserthal2023totalsegmentator` |  |  |  | main | Dataset or tool | High |
| Ma, He, Li, Han, You and Wang (2024) | `ma2024medsam` |  |  |  | main | Method | High |
| Billot, Greve, Puonti, Thielscher, Van Leemput, Fischl, Dalca and Iglesias (2023) | `billot2023synthseg` |  |  |  | main | Method | High |
| Kocak et al. (2023) | `kocak2023clear` |  |  |  | main | Guideline | High |
| Kocak et al. (2024) | `kocak2024metrics` |  |  |  | main | Guideline | High |
| Whybra et al. (2024) | `whybra2024ibsi` |  |  |  | main | Benchmark | High |
| Gatidis et al. (2022) | `gatidis2022whole` |  |  |  | main | Dataset or tool | High |
| Gatidis et al. (2024) | `gatidis2024autopet` |  |  |  | main | Benchmark | High |
| Pai et al. (2024) | `pai2024foundation` |  |  |  | main | Method | High |
| Thiery et al. (2023) | `thiery2023graph` |  |  | x | main | Clinical application | Medium |
| Xu, Feng, Yue, Cheng, He, Qi and Zhang (2024) | `xu2024hybrid` |  |  | x | main | Clinical application | Medium |
| Kwon et al. (2025) | `kwon2025graph` |  |  | x | main | Clinical application | Medium |

### Identified Gaps

1. **Transport couplings and templates over lesion sets for a clinical outcome (under-researched area).** Pairwise transport and learned transport templates predict outcomes from graphs, point clouds and patient-level cell sets [togninalli2019wasserstein; vincentcuaz2022template; mialon2021trainable; joodaki2024pilot; wang2024qot], and lesion-set predictors pool per-lesion feature vectors with fixed rules, injective or attention pooling, or graphs [chang2021aggregation; geady2024multimetastatic; chen2022injective; prabhakar2023selfpruning; zhang2025lamp; xu2024hybrid]. Neither theme run 2 nor theme run 4 nor the merge run found a method that compares the lesion sets of two patients through a fused Gromov-Wasserstein coupling (radiomic features as the feature term, inter-lesion distances as the structure term) or predicts from distances to learned lesion-set templates. Unbalanced transport [sejourne2023unbalanced] fits the varying lesion count and burden of such data. The contribution open here is a learned-template FGW predictor on per-patient lesion sets, evaluated on a public lesion cohort such as autoPET [gatidis2022whole].
2. **A comparison of the four correspondence routes on one cohort and outcome (methodological gap).** Each route is evaluated against baselines of its own family: registration on Learn2Reg tasks [hering2023learn2reg], set pooling against other pooling [harvey2026benchmark; chen2022injective], transport templates against graph kernels and GNNs [vincentcuaz2022template]. The closest designs compare input representations of one structure for one outcome [sarasua2022hippocampal] or slice-set pooling against 3D networks [harvey2026benchmark]. No source compares registration followed by voxel-wise or radiomic prediction, a learned template or barycenter, a transport coupling and a permutation-invariant encoder on the same subjects and the same outcome, so the size of the effect of the route chosen is not known.
3. **Tensor models whose unaligned mode is spatial (under-researched area).** In the PARAFAC2 literature the mode allowed to vary across subjects is time or visits [Afshar2020TASTE; Ren2023MULTIPAR; Acar2022TracingEvolvingNetworks; chatzis2023timeaware], and the spatial mode is shared through a voxel grid, an atlas or a code set. The forms that tolerate spatial misalignment estimate a shift or add shifted views [Morup2008ShiftCP; Huang2025CyclicShiftSKPD], or regress on a structured point cloud with a fixed grid [Yan2019StructuredPointCloudTensorRegression]. No supervised multilinear model was found in which each subject contributes its own number of spatial elements (lesions, regions or points) to a subject-level prediction.
4. **Lesion-set prediction without an upstream lesion segmentation (under-researched area).** Every lesion-set predictor found takes segmented or detected lesions as its elements [chen2021aminn; chen2022injective; prabhakar2023selfpruning; zhang2025lamp; thiery2023graph; xu2024hybrid]. Pathology MIL removes region annotation because each slide has a fixed patch grid [campanella2019clinical; lu2021data], and pretrained encoders supply element features at scale [chen2024uni; xu2024gigapath; pai2024foundation]. A predictor that forms its lesion or region set from the image through a learned detector trained with the subject-level outcome, and so removes the separate segmentation step, was not found.
5. **Learning guarantees for template-based transport predictors and attention pooling in small cohorts (methodological gap).** Kernel distribution regression has consistency results and improved rates in the two-stage sampled setting, for mean-embedding and transport kernels [szabo2016learning; meunier2022distribution; bachoc2025improved], and reference-distribution classifiers have generalization bounds [wang2024graph]. The neural set theory concerns capacity, injectivity and stability [wagstaff2022universal; amir2023neural; wang2024polynomial; amir2025fourier; nikolentzos2025lipschitz]. No generalization result was found for predictors on distances to learned FGW templates or for attention-pooled MIL at the cohort sizes of lesion-set studies, which range from 83 to 831 patients in the sources found [chen2022injective; chang2021aggregation].

### Synthesis Analysis

**Registration to a common space.** The tensor regression and multilinear PLS methods predict a subject-level outcome from an array whose every mode is indexed in common across subjects [Bro1996NPLS; Zhao2013HOPLS; Zhou2013TensorRegression; Li2018TuckerRegression; Guhaniyogi2017BayesianTensorRegression; Lock2018TensorOnTensor], so for images they build on registration to a common space, whose classical and learned forms and their accuracy are benchmarked [avants2008syn; klein2009evaluation; avants2011ants; balakrishnan2019voxelmorph; chen2022transmorph; hering2023learn2reg]. Unbiased and learned conditional templates reduce the bias of choosing one subject as the template [joshi2004unbiased; dalca2019conditional], and contrast-invariant and multi-dataset registration networks lower the cost of the step [hoffmann2022synthmorph; tian2024unigradicon]. Within tensor models the residual misalignment after registration is handled by an estimated shift or by shifted views of each image [Morup2008ShiftCP; Huang2025CyclicShiftSKPD]. PARAFAC2 drops the common index on one mode by constraining only the cross-product of the evolving factor [Kiers1999PARAFAC2; Roald2022AOADMMPARAFAC2], and the subject-level outcome is predicted from the subject factor in two stages or jointly [Afshar2020TASTE; Yin2020LogPar; Ren2023MULTIPAR; Acar2022TracingEvolvingNetworks]; in the sources found the unaligned mode is time and the spatial mode stays registered [Madsen2017ComponentModelsFC; Acar2022TracingEvolvingNetworks]. These methods build on the registration step and keep it.

**A learned template or barycenter.** Transport barycenters average measures with no pointwise correspondence [agueh2011barycenters; cuturi2014fast; benamou2015iterative], and the Gromov-Wasserstein barycenter extends this to structures of different sizes compared only through their internal distances [memoli2011gromov; peyre2016gromov]. Dictionaries of such barycenters or of graph atoms describe each subject by weights relative to templates learned without labels [schmitz2018wasserstein; bonneel2016wasserstein; xu2020gromov; vincentcuaz2021online; vincentcuaz2022semirelaxed], and the template-based FGW network learns the templates against the label, with the vector of FGW distances to the templates as the input of the classifier [vincentcuaz2022template; brogatmotte2022learning]. Linear embeddings to one reference reduce the number of transport problems from quadratic to linear in the number of subjects [wang2013linear; kolouri2021wasserstein; nguyen2023linear; bai2025linear], with guarantees of linear separability for shifted, scaled and sheared families [moosmuller2023linear; khurana2023supervised] and a learned version for point clouds [mahan2024point]. Set encoders use the same idea with learned reference sets or prototypes [skianis2020rep; wang2024graph; liu2023structure], and in pathology a slide's patch set is summarized by learned morphological prototypes before prediction [song2024morphological; song2024multimodal]. In medical imaging the template is used in place of the group template of registration-based analysis [gramfort2015fast; mazelet2026fmri], and in shape modelling a template point cloud deformed to each subject gives correspondence learned from the data [iyer2023mesh2ssm; adams2024point2ssm; adams2026point2ssmpp]. On brain sulcal graphs, learned prototypes replace spectral graph matching to a normative reference set [kwon2025graph]. The template methods in imaging act on data already on a cortical mesh, in a template space or segmented into structures, so they replace the group template and part of the registration step and build on the segmentation step.

**A transport coupling.** Entropic transport gives a differentiable soft correspondence between two unaligned sets [cuturi2013sinkhorn; peyre2019computational; feydy2019interpolating], and its Gromov-Wasserstein and fused forms couple sets whose points live in different spaces while keeping each set's geometry and features [memoli2011gromov; vayer2019optimal; vayer2020fused]. Pairwise couplings between all subjects define kernels and distances for prediction on graphs, meshes, cell populations and brain networks [togninalli2019wasserstein; carpinteroperez2024gaussian; joodaki2024pilot; joodaki2025pilotgmvae; wang2024qot; songdechakraiwut2022topological], at a cost in transport problems that is quadratic in the number of subjects and that scaling methods address [khamis2024scalable; montesuma2025recent]. Unbalanced transport lets the total mass differ between subjects [sejourne2023unbalanced] and is used to align individual cortical surfaces without landmarks [thual2022aligning], to register point clouds of lung vessel trees [shen2021robot] and to predict survival from a whole-slide patch set [ren2025otsurv; liu2025together]. In registration, transport is the data term of diffeomorphic matching [feydy2017optimal], and transport-based morphometry trains a subject-level predictor on transport maps to a reference after an affine registration [kundu2018transport]. A coupling thus replaces deformable registration where it aligns subjects, and builds on an affine registration or a segmentation where the sources apply it.

**Permutation invariance.** Sum-decomposable set functions, PointNet and attention-based MIL encode each element and pool by a sum, a maximum or a learned weight, so no element of one subject is matched to an element of another [zaheer2017deep; qi2017pointnet; ilse2018attention; dietterich1997multiple]. Interaction between elements before pooling enters through attention, local neighbourhoods or the Janossy family [lee2019set; qi2017pointnetpp; wang2019dynamic; murphy2019janossy; bloemreddy2020probabilistic], and simple MLP or training-centred designs reach the accuracy of more complex point-cloud networks [ma2022rethinking; qian2022pointnext]. The theory gives the latent dimension a sum-pooled encoder needs [wagstaff2019limitations; wagstaff2022universal; tabaghi2024universal; wang2024polynomial], when moments and sorting give injective or bi-Lipschitz embeddings [amir2023neural; balan2025permutation; dym2024low; amir2025fourier], when pooling element pairs is needed [zweig2022exponential], and the stability of each pooling function [nikolentzos2025lipschitz]. Transport and set pooling meet: transport pooling to a learned reference reads as attention, global pooling operators solve regularized transport problems, and sliced-Wasserstein embeddings give a pooling with a transport geometry [mialon2021trainable; xu2023regularized; naderializadeh2021set; amir2025fourier]. The kernel route treats each subject's set as a sample of a distribution and compares subjects through mean embeddings or transport kernels, with consistency in the two-stage sampled setting [muandet2012smm; poczos2013distribution; szabo2016learning; muandet2017kernel; meunier2022distribution; bachoc2025improved].

**Where the routes remove or build on the pipeline steps.** Registration is removed by permutation-invariant encoders on point clouds of segmented brain structures, which predict diagnosis, brain age and conversion time without mesh processing or point correspondence [gutierrezbecker2018deep; gutierrezbecker2021discriminative; polsterl2020wide], and by learned correspondence from raw anatomical point clouds [adams2024point2ssm; adams2026point2ssmpp]; the choice among image, mesh and point-cloud inputs changes performance for the same outcome [sarasua2022hippocampal]. Treating a scan as a set of slices with mean pooling matches or outperforms 3D networks on most neuroimaging tasks benchmarked [harvey2026benchmark]. Radiomics is kept by the lesion-set predictors that pool handcrafted per-lesion features [chen2021aminn; chen2022injective; xu2024hybrid], after fixed aggregation rules were shown to depend on the clinical setting [chang2021aggregation; geady2024multimetastatic]; it is replaced by learned per-lesion or per-patch features [hosny2018deep; pai2024foundation; chen2022scaling; chen2024uni; xu2024gigapath; wang2024chief]. The radiomics step carries the reproducibility limits and reporting standards that its reviews and guidelines set out [gillies2016radiomics; aerts2014decoding; traverso2018repeatability; zwanenburg2020ibsi; whybra2024ibsi; kocak2023clear; kocak2024metrics; vangriethuysen2017pyradiomics]. Lesion segmentation is kept by every lesion-set predictor found, with graphs over lesions and attention with anatomical context added [yang2020relational; chen2022lung; prabhakar2023selfpruning; thiery2023graph; zhang2025lamp; kwon2025graph]; anatomical context comes from organ segmentation in place of registration [zhang2025lamp; wasserthal2023totalsegmentator]. The segmentation step itself is served by self-configuring and foundation segmentation models whose accuracy depends more on data than on architecture [ronneberger2015unet; isensee2021nnunet; isensee2024revisited; ma2024medsam; billot2023synthseg; gatidis2024autopet]. Pathology MIL removes region annotation and keeps a fixed patch grid within each slide [campanella2019clinical; lu2021data; shao2021transmil; zhang2022dtfd; gadermayr2024multiple]. Public whole-body lesion and shape collections support evaluation of these predictors [gatidis2022whole; li2025medshapenet], and the registration survey sets out the uncertainty that a registration-based predictor inherits [chen2025survey].

**Across themes.** The four routes differ in what a subject is compared with: a common space (registration and tensor regression), a learned template (barycenters, dictionaries, reference embeddings and prototypes), another subject (pairwise couplings and kernels), or nothing outside the subject (permutation-invariant pooling). In the matrix, 28 sources join theme 3 and theme 4, most of them set encoders applied to lesions, structures or slides; 14 join theme 2 and theme 4, the transport methods applied to brains, point clouds, slides or cell populations; 12 join theme 2 and theme 3, where transport embeddings act as set pooling [feydy2019interpolating; mahan2024point; mialon2021trainable; naderializadeh2021set; meunier2022distribution; xu2023regularized; amir2025fourier; song2024multimodal; skianis2020rep; bachoc2025improved; wang2024graph; song2024morphological]. Theme 1 joins another theme through one source, a tensor regression on structured point clouds [Yan2019StructuredPointCloudTensorRegression]. The tensor literature is the most separate of the four: its supervised forms work on registered images or on health-record tensors [Hu2021GeneralizedTensorDecompositionFeatures; Liu2021TensorRegressionMonograph; Zhang2017TensorEnvelopePLS], and its scalable and coupled PARAFAC2 algorithms [Perros2017SPARTan; Afshar2018COPA; Schenker2023PARAFAC2CMTF] have not been joined with transport or set encoders in the sources found. In medical imaging, the routes that remove registration build on the segmentation of a structure or a lesion, and the routes that keep radiomics keep segmentation with it.

### Recommended Sources by Paper Section

| Section | Key Sources |
|---------|------------|
| Introduction | [montesuma2025recent; peyre2019computational; zaheer2017deep; Kolda2009TensorDecompositions; gillies2016radiomics; hering2023learn2reg; gadermayr2024multiple; kimura2024permutation] |
| Literature Review: registration and tensor models | [avants2008syn; balakrishnan2019voxelmorph; joshi2004unbiased; dalca2019conditional; tian2024unigradicon; chen2025survey; Zhou2013TensorRegression; Lock2018TensorOnTensor; Kiers1999PARAFAC2; Ren2023MULTIPAR; Huang2025CyclicShiftSKPD; chatzis2023timeaware] |
| Literature Review: templates, barycenters and couplings | [peyre2016gromov; vayer2020fused; vincentcuaz2022template; brogatmotte2022learning; kolouri2021wasserstein; moosmuller2023linear; thual2022aligning; mazelet2026fmri; joodaki2024pilot; ren2025otsurv; sejourne2023unbalanced; khamis2024scalable] |
| Literature Review: set encoders and lesion sets | [qi2017pointnet; lee2019set; ilse2018attention; gutierrezbecker2018deep; chen2022injective; zhang2025lamp; geady2024multimetastatic; song2024morphological; adams2024point2ssm; harvey2026benchmark] |
| Methodology | [cuturi2013sinkhorn; vayer2019optimal; vincentcuaz2022template; mialon2021trainable; amir2025fourier; szabo2016learning; bachoc2025improved; wang2024graph; gatidis2022whole; li2025medshapenet; isensee2021nnunet; wasserthal2023totalsegmentator] |
| Discussion | [sarasua2022hippocampal; chang2021aggregation; traverso2018repeatability; zwanenburg2020ibsi; whybra2024ibsi; kocak2024metrics; pai2024foundation; gatidis2024autopet; nikolentzos2025lipschitz; zweig2022exponential; kundu2018transport] |

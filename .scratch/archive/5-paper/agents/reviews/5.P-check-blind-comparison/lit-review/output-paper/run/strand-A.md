# Strand A: tensor PLS, tensor regression and unaligned-mode decompositions

Research question: which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects.

Strand A covers three groups of methods. The first is multilinear and tensor partial least squares (N-PLS, HOPLS and later variants). The second is tensor regression (CP and Tucker regression, GLM tensor regression, tensor-on-tensor and tensor-response regression, sparse and Bayesian variants). The third is decompositions in which one mode is not aligned across samples (PARAFAC2 and its constrained and coupled variants, ragged and irregular tensors, unaligned observations of a continuous mode, shift-invariant and warping models, and coupled matrix and tensor factorization where it carries an unaligned mode).

For each method this strand records three things about the spatial or feature mode. The first is whether the method takes that mode as aligned across subjects, so that registration comes first. The second is whether it allows a mode that varies or is unaligned across subjects, and which mode that is. The third is whether it gives a supervised predictor of an outcome or only a decomposition.

## Search Strategy

### Databases and dates

Five databases were searched through their public APIs on 2026-11-20.

- OpenAlex, field `title_and_abstract.search`, with a publication date filter.
- Semantic Scholar, bulk search endpoint with a `year` filter, query terms joined with `|` and `+`.
- arXiv, `abs:` field search with a `submittedDate` filter.
- PubMed, `[tiab]` field tag with `mindate`, `maxdate` and `datetype=pdat`.
- Europe PMC, `ABSTRACT:` field search with `PUB_YEAR`, in the currency round only.

The main search (Layers 1 to 4) covers 2013 to 2026. The currency round covers 2023 to 2026.

DBLP was tried and returned a bot check page to every request, so it gave no counts. Scopus, Web of Science, IEEE Xplore and the ACM Digital Library have no API access from this run. IEEE and ACM venue papers were reached through OpenAlex and Semantic Scholar, which index both publishers.

Foundational works from before 2013 were admitted from any year when citation chaining found them. These are the chemometrics origins of N-PLS and PARAFAC2 and the CP model.

### Query strings, main search (2013 to 2026)

- Q1, tensor PLS: `"multilinear partial least squares" OR "N-PLS" OR "N-way partial least squares" OR "higher-order partial least squares" OR "tensor partial least squares" OR "multiway partial least squares"`.
- Q2, tensor regression: `"tensor regression" OR "Tucker regression" OR "CP regression" OR "tensor-on-tensor regression" OR "tensor response regression" OR "generalized linear tensor regression"`. The arXiv and PubMed forms omit the last term.
- Q3, unaligned-mode decompositions: `"PARAFAC2" OR "irregular tensor" OR "shift-invariant CP" OR "shifted CP" OR "warped CP" OR "coupled matrix and tensor factorization" OR "coupled matrix tensor factorization"`. The term "warped CP" is in the OpenAlex and Semantic Scholar forms only.
- Q4, imaging use of Q1 and Q2: the Q1 and Q2 terms AND (`neuroimaging OR MRI OR fMRI OR EEG OR "brain imaging" OR "medical imaging"`).
- Q5, supervised use of Q3: the PARAFAC2, irregular tensor, shift-invariant CP, shifted CP and CMTF terms AND (`supervised OR classification OR prediction OR regression OR outcome`).

### Hit counts per database, main search

| Query | OpenAlex | Semantic Scholar | arXiv | PubMed | Total |
|---|---|---|---|---|---|
| Q1 | 340 | 234 | 11 | 85 | 670 |
| Q2 | 370 | 318 | 101 | 55 | 844 |
| Q3 | 334 | 308 | 59 | 90 | 791 |
| Q4 | 78 | 64 | 23 | 21 | 186 |
| Q5 | 69 | 64 | 5 | 16 | 154 |
| Total | 1191 | 988 | 199 | 267 | 2645 |

### Layer 2: backward citation chaining

The reference lists of six core papers were collected: Roald 2022 (AO-ADMM PARAFAC2), MULTIPAR, Lock 2018, CS-SKPD (Huang 2026), SPARTan and Kuang 2015. Items cited by three or more of the six were marked must include. They are Kolda and Bader 2009 (5 lists), Harshman 1970 (4), PARAFAC2 Part I and Part II (3 each), Bro 1997 (3) and Carroll and Chang 1970 (3).

Chaining also added Bro 1996 (N-PLS), Morup 2008 (shift-invariant CP) and HOPLS. OpenAlex dates HOPLS to 2012 online, which placed it outside Q1, and the journal issue is 2013. Harshman 1972 (PARAFAC2 notes) was added from the reference list of Kolda and Bader 2009 (reference 92). In all, Layer 2 added 10 records to the candidate pool.

### Layer 3: forward tracking

Works citing five anchors from 2022 on were collected from OpenAlex. The anchors and counts are Morup 2008 (22), Zhou 2013 (355), HOPLS (59), PARAFAC2 Part II (70) and SPARTan (37), 543 records in total. The titles were screened against the inclusion criteria. One new candidate was found, Kuang 2024 (shift-invariant block term decomposition for multi-subject fMRI). The other relevant records were already in the Layer 1 set.

### Layer 4: semantic search

Five natural-language queries were run through the Semantic Scholar relevance search, with 25 results each.

- tensor regression robust to spatial misalignment across subjects neuroimaging
- supervised PARAFAC2 prediction of subject outcome irregular tensor
- tensor decomposition with varying number of rows per subject regression
- registration-free tensor regression medical images
- partial least squares with shifts or misaligned mode

The 125 results added no included source. Every relevant result was already in the pool from Layers 1 to 3.

### Layer 5: currency round (2023 to 2026)

The main search left the strand below the currency gate. A specialized search for 2023 to 2026 was run over the strand's three groups, following the page's Failure Handling for insufficient currency.

- Q6, tensor PLS and tensor regression in imaging: (`"tensor regression" OR "Tucker regression" OR "tensor-on-tensor" OR "tensor response regression" OR "tensor partial least squares" OR "higher-order partial least squares" OR "multilinear partial least squares"`) AND (`neuroimaging OR MRI OR fMRI OR EEG OR "medical imaging" OR brain`). The arXiv form omits the last PLS term. The PubMed form is the tensor terms alone.
- Q7, PARAFAC2 and unaligned-mode decompositions: `"PARAFAC2" OR "irregular tensor" OR "ragged tensor" OR "shift-invariant CP" OR "shifted CP" OR "shift-invariant tensor" OR "misaligned tensor"`. The PubMed form is `PARAFAC2 OR "irregular tensor" OR "ragged tensor" OR ("shift-invariant" AND tensor)`.
- Q8, tensor methods on irregular or point-cloud data: (`"tensor regression" OR "tensor decomposition" OR "tensor factorization" OR "tensor classification"`) AND (`"point cloud" OR "unstructured mesh" OR "irregular grid" OR misalignment OR misregistration OR "registration-free"`).

| Query | OpenAlex | Semantic Scholar | arXiv | PubMed | Europe PMC | Total |
|---|---|---|---|---|---|---|
| Q6 | 42 | 39 | 20 | 29 | 21 | 151 |
| Q7 | 113 | 74 | 24 | 15 | 26 | 252 |
| Q8 | 29 | 16 | 8 | 1 | 2 | 56 |
| Total | 184 | 129 | 52 | 45 | 49 | 459 |

The 459 records merge to 221 unique titles. Of these, 180 were already in the Layer 1 set and 41 were new to it.

The currency round also re-screened the records from 2022 to 2026 that the first abstract screening had removed, against the same criteria as the currency records.

### Check round after Layer 5

To test whether the larger set had saturated, one more round was run. Four semantic queries went through the lookup search of Crossref, OpenAlex, Semantic Scholar, arXiv and PubMed, giving 142 result lines.

- PARAFAC2 spatial transcriptomics slices with different numbers of spots
- supervised tensor regression for misaligned images without registration
- irregular tensor factorization predicting patient outcome
- tensor decomposition with continuous modes for misaligned samples

Forward tracking from 2023 on was run for four of the new sources: Larsen 2024 (16 citing works), RISE (5), SCREAM (2) and STORM (1).

The check round added 3 sources (Tang 2026, Rivet 2016 and Mishra 2023) to the 88 of Layers 1 to 5. That is 3.4 percent of the set.

## Coverage Distribution Advisory

DISTRIBUTIONAL_SKEW_ADVISORY: methodology. Of the 91 included sources, 88 propose a method. Madsen 2016 compares existing component models. Kolda and Bader 2009 and Liu 2021 are reviews. This is above the 70 percent threshold on one dimension. The scope of the strand is methods, so this skew follows from the research question. Application papers with no method content on the alignment are excluded under criterion (e).

Data domain: 39 of 91 sources (43 percent) use neuroimaging or medical imaging data (theme T6 in the matrix). The rest use electronic health records, chemometrics, single-cell and spatial omics, manufacturing and other data. No single domain reaches 70 percent.

Currency: 52 of 91 sources (57 percent) are from 2022 to 2026. One more, Li 2027, is an accepted article that Crossref dates 2027. The 50 percent gate for the last 5 years is met. Eight sources date from before 2013 and are foundational.

Peer review: 80 of 91 sources have a peer-reviewed version found in this run (88 percent). The 11 without one are Kossaifi 2017, PAR2COX, SCMTF, Larsen 2024, Brust 2026, STORM, Wang 2025, Liu 2026, Reinhardt 2026, FRCOMA (Haijie 2024) and Naji 2026. Each preprint entry other than Kossaifi 2017 carries the note "Preprint, not peer reviewed" in the `.bib`. Under the `cs_ml` evidence profile preprints count as peer-reviewed equivalent. The 70 percent gate is met either way.

## Screening Results

| Stage | Records |
|---|---|
| Records identified in Layer 1 | 2645 |
| Unique after merging by normalized title | 1115 |
| Kept after title screening | 150 |
| Added from Layer 2 (backward chaining) | 10 |
| Added from Layer 3 (forward tracking) | 1 |
| Added from Layer 4 (semantic search) | 0 |
| Candidate pool, Layers 1 to 4 | 161 |
| Kept after abstract screening (Phase A) | 63 |
| Included after full-text or abstract assessment (Phase B) | 56 |
| Layer 5 records identified | 459 |
| Layer 5 unique titles | 221 |
| Layer 5 records kept after title screening, new to the pool | 32 |
| Pool records from 2022 to 2026 re-screened in Layer 5 | 17 |
| Included from Layer 5 | 32 |
| Included from the check round | 3 |
| Total included | 91 |

Title screening in Layer 1 removed 965 records. Most were applications of PLS or CP to food, spectroscopy, traffic or recommender data, with no method content for this question.

Abstract screening in Phase A removed 98 records. The main reason was a method that duplicates an included one with no new handling of the subject or spatial mode. Other reasons were an application with no method content and a decomposition of single-subject data.

Phase B excluded 7 records.

- Bro 1997, PARAFAC tutorial (doi 10.1016/s0169-7439(97)00032-4). Must include by chaining, but no abstract or full text could be read. Excluded under (g). The routes tried are listed under Reading Record.
- Sun and Li, STORE (sparse tensor response regression). Its handling of the voxel grid duplicates Li and Zhang 2017, and its full text could not be fetched.
- Spyrou 2018, complex PARAFAC2 for EEG connectivity. Within-subject analysis with no outcome.
- fHOPLS 2018 and Bayesian N-PLS 2016. No content on the subject or spatial mode beyond HOPLS and N-PLS.
- Hoff 2015, multilinear tensor regression for relational data. No spatial mode.
- sNPLS 2019. Variable selection added to N-PLS, with no content on alignment.

Layer 5 title screening of the 221 unique titles kept 32 records new to the pool. Of these, 21 were included and 11 excluded.

- Excluded for an aligned grid with no imaging use and no content on correspondence beyond the included tensor regression methods: FedMTOT (federated multiple tensor-on-tensor regression), graph-regularized tensor regression, federated block-term tensor regression, tensor-input trees, Poisson-response tensor-on-tensor regression, Bayesian regression of skewed tensor responses.
- Excluded as a duplicate of an included source with no new handling of the electrode mode: graph-optimized block-term tensor regression (duplicates Faes 2024).
- Excluded as outside the strand: image response regression via deep neural networks (no tensor model), multiview CCA with PARAFAC2 (unlabelled views with no subject mode content), Granger connectivity block-term tensor regression (connectivity estimation with no outcome model), low-rank tensor encoding models of MEG (stimulus encoding with no subject-level outcome).

Layer 5 re-screened 17 pool records from 2022 to 2026 that Phase A had removed. Of these, 11 were included and 6 excluded.

- Included: FRCOMA (Haijie 2024), Spencer 2024, Naji 2026, Chen 2023, FedPAR (Zhao 2024), Liu 2021, Magbonde 2023, Kundu 2023, Liu 2023, Llosa-Vite 2023, REPAR (Ren 2025).
- Excluded under (e): the tensor regression study of alcohol effects on the brain (10.1007/s40065-025-00505-3), which compares existing decompositions on one data set.
- Excluded under (g): slice-wise irregular tensor decomposition (10.1007/s10915-025-02968-0) and integrative tensor regression for stratified data (10.1007/s00362-025-01740-8). No index returned an abstract and no full text was open.
- Excluded for an aligned grid with no content on correspondence beyond the included methods: tensor decision trees for imaging data, variational Bayesian logistic tensor regression, Bayesian tensor-on-tensor regression with efficient computation.

## Reading Record

Full text, at least the method and data sections, was read for 71 of the 91 included sources. For the other 20 only the abstract could be read. The correspondence handling for those 20 rests on the abstract.

Every source with a DOI was first checked in Unpaywall for an open copy. The lookup fetch then tried the open-access URLs of OpenAlex and Semantic Scholar, and arXiv was searched by title for a preprint. CORE answered HTTP 429 to its API and HTTP 403 to its search page, so CORE gave no copy for any source.

Sources read in full text in this round that had rested on an abstract:

- kolda2009tensor: full text from a course reading copy at cs.columbia.edu, sections on CP and PARAFAC2 read.
- madsen2016quantifying: full text from PubMed Central (PMC6866892), model table and preprocessing read.
- li2016sparse: full text from PubMed Central (PMC5154176), data and method sections read.
- yin2020logpar: full text from PubMed Central (PMC8186437), model and prediction set-up read.
- harshman1970foundations and harshman1972parafac2: full texts from the author's reproductions on the University of Western Ontario pages.

Sources that rest on an abstract, with the routes tried for each:

| Key | Abstract source | Routes tried for full text |
|---|---|---|
| bro1996multiway | OpenAlex | Unpaywall (no open copy), lookup fetch (none), arXiv title search (none) |
| kiers1999parafac2 | OpenAlex | Unpaywall (no open copy), lookup fetch (none), arXiv title search (none) |
| bro1999parafac2 | OpenAlex | Unpaywall (no open copy), lookup fetch (none), arXiv title search (none) |
| carroll1970analysis | OpenAlex | Unpaywall (no open copy), lookup fetch (none), arXiv title search (none) |
| kuang2015multisubject | OpenAlex | Unpaywall author manuscript on ScienceDirect (HTTP 403 by curl and by lookup fetch), arXiv title search (none) |
| zhang2017tensor | OpenAlex | Unpaywall figshare copy (HTTP 202 with an empty body), arXiv title search (none) |
| guhaniyogi2021bayesian | OpenAlex | Unpaywall Project Euclid PDF (bot check page by curl, empty page by WebFetch), arXiv title search (none) |
| konyar2025semisupervised | OpenAlex | Unpaywall (no open copy), lookup fetch (none), arXiv title search (none) |
| hu2026separable | OpenAlex | Unpaywall (no open copy), lookup fetch (none), arXiv title search (none) |
| ren2020robust | OpenAlex | Unpaywall (no open copy), lookup fetch (none), arXiv title search (none) |
| schneide2023shiftinvariant | OpenAlex | Wiley PDF (HTTP 403), Copenhagen repository PDF (HTTP 403), arXiv title search (none) |
| schneide2024shift | OpenAlex | DOI landing page (not a PDF), Copenhagen repository PDF (HTTP 403 by curl and by WebFetch), arXiv title search (none) |
| kim2024fast | OpenAlex | ACM PDF (HTTP 403), arXiv title search (none) |
| marini2013scream | Authors' department page at food.ku.dk, which reproduces the abstract | Unpaywall (no open copy), lookup fetch and index-abstract (no abstract in OpenAlex, Semantic Scholar, Crossref, Europe PMC or PubMed), ScienceDirect (HTTP 403), ResearchGate (HTTP 403), Rome chemometrics page (connection refused), AMiner (page rendered by script with no text) |
| kuang2024shiftinvariant | Library record at vufind.katalog.k.utb.cz, which holds the abstract | Unpaywall (no open copy), lookup fetch and index-abstract (no abstract in any index), ouci.dntb.gov.ua (HTTP 403), AMiner (page rendered by script with no text) |
| jang2024fast | OpenAlex | ACM PDF (HTTP 403), arXiv title search (none) |
| kwon2024compact | OpenAlex | Unpaywall (no open copy), lookup fetch (none), arXiv title search (none) |
| he2026an | OpenAlex | Unpaywall (no open copy), lookup fetch (none), arXiv title search (none) |
| zhao2024fedpar | OpenAlex | Unpaywall (no open copy), lookup fetch (none), arXiv title search (none) |
| rivet2016modeling | OpenAlex | Unpaywall HAL copy (bot check page), lookup fetch (none) |

Bro 1997, PARAFAC tutorial and applications (doi 10.1016/s0169-7439(97)00032-4), stays excluded under (g). No text of it could be read by any of these routes.

- Unpaywall: no open copy.
- lookup index-abstract: no abstract in OpenAlex, Semantic Scholar or Crossref, not found in Europe PMC or PubMed.
- lookup fetch: no full text.
- ScienceDirect abstract page: HTTP 403.
- ResearchGate PDF: HTTP 403.
- ScienceOpen record: HTTP 403.
- Semantic Scholar paper page: HTTP 403.
- scholarhub.vn: a listing page without the article.
- Wikidata item Q56765068: bibliographic record only, no copy or archive link.
- CORE: HTTP 429 from the API and HTTP 403 from the search page.
- arXiv title search: no record.

For six published sources the full text read was an open version of the same work: Spencer 2024 (arXiv 2203.04733), Kundu 2023 (arXiv 2309.10065), Li 2027 (arXiv 2506.09358), Wang 2026 MCU (arXiv 2303.17852), Llosa-Vite 2023 (arXiv 2012.10249) and Schneide 2024 SIML (arXiv 2412.12114).

## Annotated Bibliography

Tag meanings. The strand claim is that supervised tensor methods for a subject-level outcome take the spatial mode as aligned across subjects. A source tagged supports assumes an aligned spatial or feature mode in a supervised model. A source tagged opposes predicts an outcome while leaving a mode unaligned, irregular or misaligned across subjects. A source tagged neutral gives a decomposition with no outcome, a review or a foundation.

Each entry names what was read: full text or abstract.

### T1. Multilinear PLS and supervised factor models

[bro1996multiway] Bro, R. (1996). Multiway calibration. Multilinear PLS. Journal of Chemometrics, 10(1), 47-61. Tag: supports. Read: abstract.
- Type: method, foundational.
- Method: N-PLS. Each mode of the predictor array gets a weight vector, giving a trilinear score model fitted with the response.
- Key Findings: the multilinear model has fewer parameters than PLS on the unfolded array, and is more stable on chemical calibration data.
- Correspondence: every mode of the predictor array is shared across samples, so variables must be aligned first. Supervised predictor.
- Relevance: origin of N-PLS, the baseline supervised multiway method.
- Quality: High.
- Potential Use: baseline and background for the PLS strand.

[zhao2013higher] Zhao, Q. et al. (2013). Higher Order Partial Least Squares (HOPLS). IEEE TPAMI, 35(7), 1660-1673. Tag: supports. Read: full text.
- Type: method.
- Method: X and Y share the first (sample) mode. Each other mode has loadings `P_r^(n)` common to all samples, found by a block Tucker decomposition of the cross-covariance.
- Key Findings: HOPLS predicts better than N-PLS and unfolded PLS on ECoG decoding, with a smaller model.
- Correspondence: all non-sample modes are aligned across samples by construction. Supervised predictor. N-PLS is the CP form of the same idea.
- Relevance: the reference tensor-to-tensor PLS method.
- Quality: High.
- Potential Use: baseline, and the form a supervised extension would generalise.

[eliseyev2013recursive] Eliseyev, A. and Aksenova, T. (2013). Recursive N-way PLS for brain-computer interface. PLoS ONE, 8(7), e69962. Tag: supports. Read: full text.
- Type: method with application.
- Method: N-PLS updated recursively on streaming ECoG blocks, with time, frequency and electrode modes.
- Key Findings: recursive updating handles data too large for batch N-PLS, with similar decoding accuracy.
- Correspondence: the electrode mode is fixed by the implanted array, so it is aligned by acquisition. Supervised predictor.
- Relevance: imaging-adjacent N-PLS use with a fixed spatial layout.
- Quality: Medium.
- Potential Use: related work on N-PLS in neural data.

[zhang2017tensor] Zhang, X. and Li, L. (2017). Tensor envelope partial least-squares regression. Technometrics, 59(4), 426-436. Tag: supports. Read: abstract.
- Type: method, statistical theory.
- Method: tensor PLS with a population model through envelope subspaces, with consistency results.
- Key Findings: the estimator is consistent, and it is applied to two neuroimaging data sets.
- Correspondence: the image tensor is a fixed voxel grid shared across subjects. Supervised predictor.
- Relevance: links tensor PLS to sufficient dimension reduction.
- Quality: High.
- Potential Use: related work, statistical grounding of tensor PLS.

[mishra2023iterative] Mishra, P. and Liland, K. H. (2023). Iterative re-weighted multilinear partial least squares modelling for robust predictive modelling. Journal of Chemometrics, 38(1), e3527. Tag: supports. Read: full text (Wageningen repository copy).
- Type: method.
- Method: N-PLS with iterative down-weighting of outlying observations in predictor and response space.
- Key Findings: lower prediction error than N-PLS on three real multilinear data sets, with one extra tuning parameter.
- Correspondence: all non-sample modes aligned, as in N-PLS. Supervised predictor.
- Relevance: recent N-PLS variant.
- Quality: Medium.
- Potential Use: related work, currency of the PLS strand.

[sun2024partial] Sun, D., Peng, L., Qiu, Z., Guo, Y. and Manatunga, A. (2024). Partial quantile tensor regression. JASA, 120(551), 1724-1735. Tag: supports. Read: full text (PubMed Central).
- Type: method.
- Method: the partial least squares principle applied to quantile regression with a tensor covariate, with an envelope model for its population form.
- Key Findings: root-n consistency and better finite-sample performance than benchmarks. Applied to PTSD symptom severity.
- Correspondence: the covariate is a functional connectivity matrix over 279 nodes of the Seitzman atlas. Correspondence comes from the atlas. Supervised.
- Relevance: recent PLS-type tensor regression with an imaging outcome.
- Quality: High.
- Potential Use: related work, currency.

[vanderploeg2026acmtfr] van der Ploeg, G. R. et al. (2026). ACMTF-R: supervised multi-omics data integration. PLOS One, 21(1), e0339650. Tag: supports. Read: full text.
- Type: method.
- Method: advanced coupled matrix and tensor factorization with a regression step on the shared subject factor, weighted by a tuning parameter pi.
- Key Findings: the outcome term pulls outcome-related variation into shared and distinct components.
- Correspondence: subject mode shared, feature modes aligned across subjects. Supervised.
- Relevance: the closest supervised coupled factorization with an aligned feature mode.
- Quality: Medium.
- Potential Use: related work and design of a joint loss.

[marini2013scream] Marini, F. and Bro, R. (2013). SCREAM: a novel method for multi-way regression problems with shifts and shape changes in one mode. Chemometrics and Intelligent Laboratory Systems, 129, 64-75. Tag: opposes. Read: abstract.
- Type: method.
- Method: PARAFAC2 decomposition of the predictor array combined with a principal covariates regression step for the coefficients.
- Key Findings: as good as or better than other multi-way regression methods on real and simulated data. N-PLS loses accuracy when one mode has shifts or peak shape changes.
- Correspondence: one mode (elution time in hyphenated chromatography) shifts and changes shape across samples. The other modes are aligned. Supervised predictor.
- Relevance: the earliest supervised method found that leaves one mode unaligned. It joins PARAFAC2 and regression in one model.
- Quality: Medium (abstract only).
- Potential Use: closest prior work on the regression side, and a baseline design.

### T2. Tensor regression on an aligned grid

[zhou2013tensor] Zhou, H., Li, L. and Zhu, H. (2013). Tensor regression with applications in neuroimaging data analysis. JASA, 108(502), 540-552. Tag: supports. Read: full text.
- Type: method.
- Method: GLM with a CP-structured coefficient tensor, fitted by block relaxation.
- Key Findings: the CP structure cuts parameters from the product of the dimensions to their sum times the rank. ADHD classification from MRI.
- Correspondence: the MRI is preprocessed by segmentation and registration, with RAVENS normalization to a template. Aligned voxels are required. Supervised.
- Relevance: the reference tensor regression for imaging outcomes.
- Quality: High.
- Potential Use: baseline and the main example of registration first.

[li2018tucker] Li, X., Xu, D., Zhou, H. and Li, L. (2018). Tucker tensor regression and neuroimaging analysis. Statistics in Biosciences, 10(3), 520-545. Tag: supports. Read: full text.
- Type: method.
- Method: GLM with a Tucker-structured coefficient tensor, and downsizing of the image by a wavelet basis.
- Key Findings: Tucker allows a different rank per mode and fits better than CP at the same parameter count. ADHD-200 data.
- Correspondence: the ADHD-200 images are preprocessed by standard steps onto a common grid. Aligned. Supervised.
- Relevance: Tucker form of tensor regression.
- Quality: High.
- Potential Use: baseline.

[guhaniyogi2015bayesian] Guhaniyogi, R., Qamar, S. and Dunson, D. B. (2015). Bayesian tensor regression. arXiv 1509.06490, published in JMLR 18 (2017). Tag: supports. Read: full text.
- Type: method.
- Method: scalar-on-tensor regression with a multiway Dirichlet generalized double Pareto prior on CP margins.
- Key Findings: posterior consistency, and better recovery of sparse coefficient images than penalised CP.
- Correspondence: coefficient tensor indexed by a common voxel grid. Aligned. Supervised.
- Relevance: Bayesian line of tensor regression.
- Quality: High.
- Potential Use: related work.

[lock2018tensorontensor] Lock, E. F. (2018). Tensor-on-tensor regression. JCGS, 27(3), 638-647. Tag: supports. Read: full text.
- Type: method.
- Method: contracted tensor product of a predictor tensor with a low-rank CP coefficient tensor, giving a tensor response.
- Key Findings: a single framework for tensor predictors and tensor responses with ridge and rank penalties.
- Correspondence: the contraction sums over the P predictor modes, which must be indexed alike across samples. Aligned. Supervised.
- Relevance: general form of multilinear regression.
- Quality: High.
- Potential Use: related work and notation.

[li2017parsimonious] Li, L. and Zhang, X. (2017). Parsimonious tensor response regression. JASA, 112(519), 1131-1146. Tag: supports. Read: full text.
- Type: method.
- Method: tensor response on scalar predictors with an envelope model per mode.
- Key Findings: large efficiency gains over voxel-wise regression in EEG and MRI studies.
- Correspondence: the response image is on a common grid. Aligned. Association with covariates.
- Relevance: tensor response form, the reverse direction of prediction.
- Quality: High.
- Potential Use: related work.

[guhaniyogi2021bayesian] Guhaniyogi, R. and Spencer, D. (2021). Bayesian tensor response regression with an application to brain activation studies. Bayesian Analysis, 16(4), 1221-1249. Tag: supports. Read: abstract.
- Type: method.
- Method: tensor response on scalar predictors with a multiway stick-breaking shrinkage prior.
- Key Findings: posterior contraction when voxels grow faster than the sample size. Brain activation data.
- Correspondence: voxels indexed alike across scans. Aligned. Association.
- Relevance: Bayesian tensor response.
- Quality: High.
- Potential Use: related work.

[li2016sparse] Li, Z., Suk, H.-I., Shen, D. and Li, L. (2016). Sparse multi-response tensor regression for Alzheimer's disease. IEEE TMI, 35(8), 1927-1936. Tag: supports. Read: full text (PubMed Central).
- Type: method with application.
- Method: sparse tensor regression with several clinical scores as joint outcomes.
- Key Findings: better prediction of clinical scores on ADNI than competing methods.
- Correspondence: tissues were spatially normalized with HAMMER onto an atlas in MNI space, RAVENS maps were formed, and grey matter maps were downsized to 32 x 32 x 32 voxels. Aligned. Supervised.
- Relevance: medical imaging tensor regression with multiple outcomes and an explicit registration pipeline.
- Quality: High.
- Potential Use: related work, imaging application.

[papadogeorgou2019soft] Papadogeorgou, G., Zhang, Z. and Dunson, D. B. (2019). Soft tensor regression. arXiv 1910.09699, published in JMLR. Tag: supports. Read: full text.
- Type: method.
- Method: CP margins allowed to vary softly across components, which relaxes the strict low-rank form.
- Key Findings: better fit than hard CP regression. Brain connectome outcomes from HCP.
- Correspondence: the predictor is an ROI-by-ROI connectome from an atlas. Correspondence comes from the parcellation. Supervised.
- Relevance: shows atlas parcellation as the alternative route to correspondence.
- Quality: High.
- Potential Use: related work.

[kossaifi2017tensor] Kossaifi, J. et al. (2017). Tensor regression networks. arXiv 1707.08308. Tag: supports. Read: full text.
- Type: method.
- Method: a tensor regression layer with a low-rank coefficient tensor replaces flattening and fully connected layers in a CNN.
- Key Findings: large parameter savings with equal accuracy. Applied to UK Biobank MRI.
- Correspondence: CNN activations on a fixed grid from preprocessed images. Aligned input. Supervised.
- Relevance: tensor regression in deep networks.
- Quality: Medium.
- Potential Use: related work, deep learning baseline family.

[yan2019structured] Yan, H., Paynabar, K. and Pacella, M. (2019). Structured point cloud data analysis via regularized tensor regression. Technometrics, 61(3), 385-395. Tag: supports. Read: full text.
- Type: method.
- Method: point-cloud response on scalar process variables, with a Tucker coefficient and basis expansion.
- Key Findings: accurate modelling of surface shape in manufacturing.
- Correspondence: the structured point cloud is measured on a pre-specified grid. The authors name a model for unstructured point clouds as future work. Supervised (tensor response).
- Relevance: states the unstructured case as open in a nearby field.
- Quality: Medium.
- Potential Use: introduction and gap statement.

[gahrooei2020multiple] Gahrooei, M. R., Yan, H., Paynabar, K. and Shi, J. (2020). Multiple tensor-on-tensor regression. Technometrics, 63(2), 147-159. Tag: supports. Read: full text.
- Type: method.
- Method: several tensor predictors of different orders mapped to one tensor response with Tucker coefficients.
- Key Findings: handles heterogeneous inputs (images, profiles, scalars) in one model.
- Correspondence: images and structured point clouds on aligned grids. Supervised.
- Relevance: multi-source tensor regression.
- Quality: Medium.
- Potential Use: related work.

[wang2026maximum] Wang, Q. and Paynabar, K. (2026). Maximum covariance unfolding: a novel covariate-based manifold learning approach for point cloud regression. INFORMS Journal on Data Science, 5(1), 24-42. Tag: supports. Read: full text (arXiv 2303.17852).
- Type: method.
- Method: nonlinear dimension reduction that learns a low-dimensional manifold of point clouds with the highest correlation to process covariates, followed by regression.
- Key Findings: better modelling of complex-shaped point clouds than Euclidean regression. Steel bracket case study.
- Correspondence: each point cloud has the same n points in the same order and is flattened to one vector. Point correspondence is assumed. Supervised (point cloud response).
- Relevance: point-cloud regression that still needs point correspondence.
- Quality: Medium.
- Potential Use: related work on point-cloud outcomes.

[wang2025tensorontensor] Wang, Q., Bisheh, M. N. and Paynabar, K. (2025). Tensor-on-tensor regression neural networks for process modeling with high-dimensional data. arXiv 2510.05329, preprint. Tag: supports. Read: full text.
- Type: method.
- Method: a neural network whose layers keep tensor structure, linking tensor regression to nonlinear models. Section 3.4 relates it to PLS.
- Key Findings: better prediction than linear tensor regression on point-cloud simulations and two case studies.
- Correspondence: point clouds are generated on a grid of parameter values, so points correspond across samples. Supervised.
- Relevance: nonlinear tensor regression for point clouds.
- Quality: Low (preprint, not peer reviewed).
- Potential Use: related work.

[huang2026shiftaware] Huang, H.-H., Chen, Y.-H. and Zhang, T. (2026). Shift-aware sparse Kronecker tensor classification. Statistics and Computing, 36(3). Tag: opposes. Read: full text.
- Type: method.
- Method: sparse Kronecker product decomposition for logistic classification, with a second view of each scan shifted by a fixed cyclic offset.
- Key Findings: robustness to minor mis-registration while keeping sparse, interpretable coefficients.
- Correspondence: the cyclic shift realigns each scan by small circular shifts on the same grid. Prior registration is still needed. Supervised.
- Relevance: the only tensor regression found that models spatial misalignment of images.
- Quality: Medium.
- Potential Use: closest baseline, and the contrast for a method that frees the spatial mode.

[wang2026a] Wang, S.-H. and Huang, H.-H. (2026). A Bayesian sparse Kronecker product decomposition framework for tensor predictors with mixed-type responses. Statistical Analysis and Data Mining, 19(4). Tag: supports. Read: full text.
- Type: method.
- Method: Bayesian sparse Kronecker product decomposition for continuous, binary and count responses.
- Key Findings: mixed-type outcomes in one model. Applied to OASIS MRI.
- Correspondence: OASIS volumes are atlas-registered. Aligned. Supervised.
- Relevance: recent imaging tensor regression.
- Quality: Medium.
- Potential Use: related work, currency.

[lyu2024bayesian] Lyu, R., Vannucci, M., Kundu, S. and ADNI (2024). Bayesian tensor modeling for image-based classification of Alzheimer's disease. Neuroinformatics, 22(4), 437-455. Tag: supports. Read: full text.
- Type: method with application.
- Method: Bayesian tensor model of the image fed to a classifier (SVM or logistic regression).
- Key Findings: good classification of Alzheimer's disease from MRI with interpretable regions.
- Correspondence: all images were registered to a template with ANTs. Aligned. Supervised.
- Relevance: recent medical imaging use with explicit registration.
- Quality: Medium.
- Potential Use: related work, example of registration first.

[guhaniyogi2024a] Guha Niyogi, P., Lindquist, M. A. and Maiti, T. (2024). A tensor based varying-coefficient model for multi-modal neuroimaging. IEEE TSP, 72, 1607-1619. Tag: supports. Read: full text.
- Type: method.
- Method: tensor coefficients that vary with a covariate, for multi-modal imaging.
- Key Findings: captures modality interactions with few parameters.
- Correspondence: multi-modal images on a common voxel grid. Aligned. Supervised.
- Relevance: recent tensor regression for imaging.
- Quality: High.
- Potential Use: related work, currency.

[li2022coupled] Li, P., Sofuoglu, S. E., Aviyente, S. and Maiti, T. (2022). Coupled support tensor machine classification for multimodal neuroimaging. Statistical Analysis and Data Mining, 15(6), 797-818. Tag: supports. Read: full text.
- Type: method.
- Method: coupled CP decomposition of EEG and fMRI tensors feeding a support tensor machine.
- Key Findings: better classification than single-modality tensor classifiers.
- Correspondence: SPM12 preprocessing with co-registration. Aligned. Supervised.
- Relevance: supervised coupled tensor model in imaging.
- Quality: Medium.
- Potential Use: related work.

[zhou2021partially] Zhou, J., Sun, W. W., Zhang, J. and Li, L. (2021). Partially observed dynamic tensor response regression. JASA, 118(541), 424-439. Tag: supports. Read: full text (PubMed Central).
- Type: method.
- Method: a dynamic tensor response on covariates with low-rank, sparse and fused coefficients, and a loss projected onto the observed entries.
- Key Findings: finite-sample error bounds at each step of the algorithm. Applied to a dementia MRI study.
- Correspondence: each MRI is preprocessed to a 32 x 32 x 32 grid and visits are stacked as a fourth mode. Voxels are aligned. Missing visits are handled by the projected loss. Association with covariates.
- Relevance: handles missing entries of a time mode on an aligned grid.
- Quality: High.
- Potential Use: related work.

[xu2024tensor] Xu, T., Chen, K. and Li, G. (2024). Tensor regression for incomplete observations with application to longitudinal studies. Annals of Applied Statistics, 18(2), 1195-1212. Tag: opposes. Read: full text (PubMed Central).
- Type: method.
- Method: scalar-on-tensor regression on a sample by feature by time tensor, estimated from covariances so that all observed entries are used without imputation.
- Key Findings: variable selection and smooth time-varying effects. Links preterm gut microbiome dynamics to neurodevelopment.
- Correspondence: samples are measured at different subsets of time points (blockwise missing), so the time mode is incomplete and differs across subjects. The feature mode is aligned. Supervised.
- Relevance: a supervised tensor model with a subject-specific set of observed time points.
- Quality: High.
- Potential Use: related work, design of estimation without a complete grid.

[faes2024single] Faes, A., Camarrone, F. and Van Hulle, M. M. (2024). Single finger trajectory prediction from intracranial brain activity using block-term tensor regression with fast and automatic component extraction. IEEE TNNLS, 35(7), 8897-8908. Tag: supports. Read: full text (KU Leuven repository).
- Type: method.
- Method: block-term tensor regression (BTTR) with two new tensor factorizations and a marginalization step.
- Key Findings: better finger trajectory prediction than vector and matrix methods on ECoG.
- Correspondence: ECoG electrodes lie on grids or strips fixed within each patient, so the electrode mode is aligned by acquisition. Supervised.
- Relevance: recent supervised multiway regression on neural recordings.
- Quality: High.
- Potential Use: related work.

[li2027functional] Li, T., Yao, F. and Zhang, A. R. (2027). Functional tensor regression. Statistica Sinica, accepted. Tag: supports. Read: full text (arXiv 2506.09358).
- Type: method.
- Method: tensor covariate with a functional mode, a low Tucker rank coefficient with smoothness on that mode, and a functional Riemannian Gauss-Newton algorithm.
- Key Findings: quadratic convergence and error bounds. Better than tabular tensor regression on ADHD-200 data.
- Correspondence: the ADHD-200 images follow the same preprocessing as Zhou 2013 and Li 2018. Aligned voxels. The functional mode is time. Supervised.
- Relevance: a continuous mode inside tensor regression.
- Quality: Medium (accepted article, year from Crossref).
- Potential Use: related work.

[he2026an] He, J. and Li, J. (2026). An ensemble approach to tensor learning. Statistical Methods in Medical Research, 35(4), 847-866. Tag: supports. Read: abstract.
- Type: method.
- Method: tensor ensemble learning over partitions of the tensor into blocks and over CP ranks.
- Key Findings: better prediction than single tensor regression models. Glaucoma from fundus images and cognition in Alzheimer's disease.
- Correspondence: the tensor is split into fixed spatial blocks, which assumes the same block layout across subjects. Supervised.
- Relevance: recent medical imaging tensor regression.
- Quality: Medium (abstract only).
- Potential Use: related work, currency.

[kundu2023bayesian] Kundu, S. et al. (2023). Bayesian longitudinal tensor response regression for modeling neuroplasticity. Human Brain Mapping, 44(18), 6326-6348. Tag: supports. Read: full text (arXiv 2309.10065).
- Type: method.
- Method: Bayesian tensor response regression over visits with time-varying and subject-specific effects.
- Key Findings: better feature selection than voxel-wise and cross-sectional tensor methods. Personalised neuroplasticity trajectories in post-stroke aphasia.
- Correspondence: a T1-weighted image was acquired for registration to MNI template space. Aligned. Association with covariates.
- Relevance: recent imaging tensor response model with explicit registration.
- Quality: High.
- Potential Use: related work, currency.

[pietrosanu2026regularized] Pietrosanu, M. et al. (2026). Regularized tensor quantile regression with applications to neuroimaging data analysis. Statistics in Medicine, 45(10-12). Tag: supports. Read: full text (PubMed Central).
- Type: method.
- Method: linear quantile regression with a tensor covariate, regularized through the tensor estimate.
- Key Findings: better than tensor frameworks when standard regression assumptions fail. Interpretable neuroimaging result.
- Correspondence: tensor covariates on a common grid. Aligned. Supervised.
- Relevance: recent imaging tensor regression.
- Quality: Medium.
- Potential Use: related work, currency.

[haijie2024a] Haijie, X. and Chen, Z. (2024). A scalable operator-valued kernel learning framework for continuous multi-way regression (FRCOMA). arXiv 2406.19021, preprint. Tag: opposes. Read: full text.
- Type: method.
- Method: nonlinear regression with separable operator-valued kernels for covariates and responses indexed over continuous domains.
- Key Findings: scalable Kronecker-structured solver. Case studies on movie trailer engagement curves and a second real data set.
- Correspondence: observations live on continuous domains, so samples need no fixed grid and irregular sampling needs no interpolation. The domain itself is shared across samples. Supervised.
- Relevance: supervised regression without a fixed grid.
- Quality: Low (preprint, not peer reviewed).
- Potential Use: related work, a route to grid-free supervised models.

[spencer2024bayesian] Spencer, D. A. et al. (2024). Bayesian scalar-on-tensor regression using the Tucker decomposition for sparse spatial modeling. Biostatistics, 26(1). Tag: supports. Read: full text (arXiv 2203.04733).
- Type: method.
- Method: Bayesian scalar-on-tensor regression with a Tucker coefficient and shrinkage priors.
- Key Findings: better inference than other tensor regression methods on ADNI data.
- Correspondence: ADNI images on a common voxel grid. Aligned. Supervised.
- Relevance: recent Bayesian Tucker regression in imaging.
- Quality: High.
- Potential Use: related work, currency.

[naji2026bayesian] Naji, Z., Fuentes, M., Ma, L. and Moradi Rekabdarkolaee, H. (2026). Bayesian tensor regression for neuroimaging data. arXiv 2609.27880, preprint. Tag: supports. Read: full text.
- Type: method.
- Method: Bayesian envelope model for a brain image response on vector covariates, leading to a Tucker decomposition.
- Key Findings: posterior consistency and better estimation and uncertainty quantification in simulation.
- Correspondence: uses the preprocessed ADHD-200 repository and fMRI data on a common grid. Aligned. Association.
- Relevance: recent Bayesian tensor response model.
- Quality: Low (preprint, not peer reviewed).
- Potential Use: related work, currency.

[liu2026bayesian] Liu, Y., Luo, H. and Kundu, S. (2026). Bayesian tensor-on-tensor varying coefficient model for forecasting Alzheimer's disease progression. arXiv 2604.07764, preprint. Tag: supports. Read: full text.
- Type: method.
- Method: tensor-on-tensor regression with Gaussian process priors and patch-to-voxel mappings, so each output voxel depends on its neighbourhood.
- Key Findings: accurate forecasts of future cortical thickness maps on ADNI, which also predict brain age.
- Correspondence: the ANTs longitudinal pipeline normalised each scan to a population template by diffeomorphic registration. Aligned. Supervised (image response).
- Relevance: recent imaging tensor regression with explicit registration.
- Quality: Low (preprint, not peer reviewed).
- Potential Use: related work, example of registration first.

[reinhardt2026spatiallyinformed] Reinhardt, A., Liu, Y. and Kundu, S. (2026). Spatially-informed image harmonization results in improved scanner effect removal and prediction (Tensor-ComBat). arXiv 2604.01546, preprint. Tag: supports. Read: full text.
- Type: method.
- Method: Bayesian tensor response regression with a low-rank PARAFAC coefficient estimates scanner effects, which a ComBat step then removes.
- Key Findings: better scanner effect removal and downstream prediction on ADNI than classical ComBat.
- Correspondence: each scan was registered with ANTs to a population template built from all subjects. Aligned. Harmonization model with downstream prediction.
- Relevance: a tensor model that works after registration on multi-site images.
- Quality: Low (preprint, not peer reviewed).
- Potential Use: related work, preprocessing context.

[liu2023integrative] Liu, Y. et al. (2023). Integrative Bayesian tensor regression for imaging genetics applications. Frontiers in Neuroscience, 17. Tag: supports. Read: full text.
- Type: method.
- Method: Bayesian scalar-on-image regression that joins voxel-level images and genetic data to predict cognitive outcomes.
- Key Findings: better prediction than models using region summaries. ADNI data.
- Correspondence: all images were registered with ANTs to a population template so that brain locations match across participants. Aligned. Supervised.
- Relevance: recent imaging tensor regression that states the registration step.
- Quality: Medium.
- Potential Use: related work, example of registration first.

[llosavite2023reducedrank] Llosa-Vite, C. and Maitra, R. (2023). Reduced-rank tensor-on-tensor regression and tensor-variate analysis of variance. IEEE TPAMI, 45(2), 2282-2296. Tag: supports. Read: full text (arXiv 2012.10249).
- Type: method.
- Method: tensor-on-tensor regression with four low-rank formats and tensor-variate normal errors, giving a tensor ANOVA.
- Key Findings: identifies cerebral regions linked to suicide attempt status in an fMRI study.
- Correspondence: voxel-level fMRI statistics on a common grid. Aligned. Association.
- Relevance: recent tensor-on-tensor regression in imaging.
- Quality: High.
- Potential Use: related work.

[liu2021tensor] Liu, J., Zhu, C., Long, Z. and Liu, Y. (2021). Tensor regression. Foundations and Trends in Machine Learning, 14(4), 379-565. Tag: neutral. Read: full text (arXiv 2308.11419).
- Type: review.
- Method: survey of linear, nonlinear and Bayesian tensor regression with their applications.
- Key Findings: organises tensor regression by low-rank format, regularisation and model class.
- Correspondence: the surveyed methods take tensors on fixed index sets. Covers supervised models.
- Relevance: up-to-date review of the tensor regression strand.
- Quality: High.
- Potential Use: background and related work.

### T3. Decompositions with an unaligned, ragged or shifted mode

[harshman1972parafac2] Harshman, R. A. (1972). PARAFAC2: mathematical and technical notes. UCLA Working Papers in Phonetics, 22, 30-47. Tag: neutral. Read: full text (author's reproduction).
- Type: method, foundational.
- Method: a three-mode model for sets of cross-product matrices that keeps the uniqueness of PARAFAC1 and allows oblique factors.
- Key Findings: PARAFAC1 on cross-product matrices can describe only orthogonal factors. PARAFAC2 removes that limit.
- Correspondence: the model works on cross-products, so the slices need not share the row units. Decomposition only.
- Relevance: the origin of PARAFAC2.
- Quality: High.
- Potential Use: methods section, model origin.

[kiers1999parafac2] Kiers, H. A. L., ten Berge, J. M. F. and Bro, R. (1999). PARAFAC2 Part I. A direct fitting algorithm. Journal of Chemometrics, 13(3-4), 275-294. Tag: neutral. Read: abstract.
- Type: method, foundational.
- Method: PARAFAC2 fitted directly by alternating least squares. Each slice is `X_k ~ U_k S_k V^T` with `U_k = Q_k H` and orthonormal `Q_k`, which keeps `U_k^T U_k` constant.
- Key Findings: a direct algorithm for slices with the same column units but different numbers of row units.
- Correspondence: one mode may vary in size and order per slice. The other mode must be aligned. Decomposition only.
- Relevance: the base model for a varying mode.
- Quality: High.
- Potential Use: methods section, model definition.

[bro1999parafac2] Bro, R., Andersson, C. A. and Kiers, H. A. L. (1999). PARAFAC2 Part II. Modeling chromatographic data with retention time shifts. Journal of Chemometrics, 13(3-4), 295-309. Tag: neutral. Read: abstract.
- Type: method with application.
- Method: PARAFAC2 applied to chromatography, where elution profiles shift between samples.
- Key Findings: PARAFAC2 handles retention shifts because each sample's profiles keep the same inner-product structure.
- Correspondence: the elution-time mode is unaligned across samples. The spectral mode is aligned. Decomposition only.
- Relevance: first use of PARAFAC2 for a misaligned mode.
- Quality: High.
- Potential Use: introduction and methods.

[morup2008shiftinvariant] Morup, M. et al. (2008). Shift-invariant multilinear decomposition of neuroimaging data. NeuroImage, 42(4), 1439-1450. Tag: neutral. Read: full text.
- Type: method.
- Method: shift-invariant CP, `X_ijk = sum_d A_id B_(j - tau_kd),d C_kd`, with shifts along one mode estimated in the frequency domain.
- Key Findings: recovers EEG and fMRI components with trial or subject delays that plain CP splits.
- Correspondence: one mode (time) may shift per slice and component. The spatial mode stays aligned. Decomposition only.
- Relevance: the shift model as an alternative to PARAFAC2.
- Quality: High.
- Potential Use: related work, contrast of shift and PARAFAC2 models.

[kuang2015multisubject] Kuang, L.-D. et al. (2015). Multi-subject fMRI analysis via combined ICA and shift-invariant CP. Journal of Neuroscience Methods, 256, 127-140. Tag: neutral. Read: abstract.
- Type: method.
- Method: ICA initialisation followed by shift-invariant CP across subjects.
- Key Findings: better shared spatial maps and time courses than tensor PICA when delays are large.
- Correspondence: subject-dependent time-course delays with shared spatial maps, so the spatial mode is aligned. Decomposition only.
- Relevance: multi-subject imaging with a shifted mode.
- Quality: Medium.
- Potential Use: related work.

[kuang2024shiftinvariant] Kuang, L.-D. et al. (2024). Shift-invariant rank-(L, L, 1, 1) BTD with 3D spatial pooling and orthonormalization: application to multi-subject fMRI data. Biomedical Signal Processing and Control, 92, 106058. Tag: neutral. Read: abstract.
- Type: method.
- Method: 3D weighted spatial pooling of the fMRI data, then a rank-(L, L, 1, 1) block term decomposition with temporal shift-invariance and spatial orthonormality.
- Key Findings: better separation and noise robustness than the same BTD without shifts and than ICA with shift-invariant CP.
- Correspondence: shared spatial maps across subjects with subject-specific time delays and intensities. The spatial mode is aligned. Decomposition only.
- Relevance: recent shift model for multi-subject imaging.
- Quality: Medium (abstract only).
- Potential Use: related work, currency.

[rivet2016modeling] Rivet, B. and Cohen, J. E. (2016). Modeling time warping in tensor decomposition. IEEE SAM Workshop 2016, 1-5. Tag: neutral. Read: abstract.
- Type: method.
- Method: CP-type decomposition in which shared sources reach each EEG recording through a time warping, modelled by diffeomorphisms.
- Key Findings: proof of concept on simulated ocular artifact removal that subject variability can enter a tensor model as warping.
- Correspondence: the time mode is warped per subject or recording. The electrode mode is aligned. Decomposition only.
- Relevance: the warping-invariant decomposition named in the strand scope.
- Quality: Medium (abstract only).
- Potential Use: related work, a model of nonrigid misalignment along one mode.

[madsen2016quantifying] Madsen, K. H., Churchill, N. W. and Morup, M. (2016). Quantifying functional connectivity in multi-subject fMRI using component models. Human Brain Mapping, 38(2), 882-899. Tag: neutral. Read: full text (PubMed Central).
- Type: comparison study.
- Method: cross-validated comparison of component models by prediction of voxel-wise covariance. The PARAFAC2 model is `X_s ~ U Sigma_s R^T Q_s^T`.
- Key Findings: the best models allow subject variability within a common spatial subspace. PARAFAC2 gives stable connectivity between components.
- Correspondence: the spatial maps `U` are shared and the time mode `Q_s` varies per subject. The data were normalized to an EPI template in SPM8. Decomposition only.
- Relevance: evidence that PARAFAC2 suits multi-subject imaging, with the time mode as the varying mode.
- Quality: High.
- Potential Use: introduction and motivation.

[roald2020tracing] Roald, M. et al. (2020). Tracing network evolution using the PARAFAC2 model. ICASSP 2020, 1100-1104. Tag: neutral. Read: full text.
- Type: method with application.
- Method: PARAFAC2 on task fMRI with the voxel mode allowed to evolve.
- Key Findings: recovers spatial networks that change gradually across slices.
- Correspondence: the evolving mode is the spatial mode, but subjects are indexed in an aligned mode on registered data. Decomposition only.
- Relevance: PARAFAC2 with a varying spatial mode.
- Quality: Medium.
- Potential Use: related work, closest unsupervised use in imaging.

[roald2022an] Roald, M. et al. (2022). An AO-ADMM approach to constraining PARAFAC2 on all modes. SIAM Journal on Mathematics of Data Science, 4(3), 1191-1222. Tag: neutral. Read: full text.
- Type: method.
- Method: AO-ADMM fitting of PARAFAC2 with constraints and penalties on every mode, including the varying mode.
- Key Findings: constraints such as smoothness and non-negativity on the evolving mode improve recovery. Ragged tensors with varying `J_k` are handled.
- Correspondence: in multi-task fMRI (subjects by voxels by tasks) the voxel mode evolves per task. The evolving patterns can rotate and mirror per slice. Decomposition only.
- Relevance: the fitting framework most supervised PARAFAC2 methods build on.
- Quality: High.
- Potential Use: methods section, optimisation.

[cottrell2026subspace] Cottrell, S., Wei, G.-W. and Huang, L. (2026). Subspace tensor orthogonal rotation model (STORM) for spatial transcriptomic data. arXiv 2603.22477, preprint. Tag: neutral. Read: full text.
- Type: method.
- Method: each tissue slice `X_k` (spots by genes) gets an orthonormal spatial subspace `Q_k`, and the projected slices are fitted by PARAFAC2 with graph-regularized reconstruction.
- Key Findings: state-of-the-art batch integration, cell-type deconvolution and gene imputation.
- Correspondence: the spot mode varies in number and geometry across slices (`n_sk` spots per slice). The gene mode is aligned. Decomposition used for downstream analysis, with no outcome model.
- Relevance: PARAFAC2 applied with the spatial mode as the varying mode across samples.
- Quality: Low (preprint, not peer reviewed).
- Potential Use: closest prior work on the decomposition side.

[ramirez2025integrative] Ramirez, A. et al. (2025). Integrative, high-resolution analysis of single-cell gene expression across experimental conditions with PARAFAC2-RISE. Cell Systems, 16(6), 101294. Tag: opposes. Read: full text (PubMed Central).
- Type: method with application.
- Method: PARAFAC2 on cells by genes matrices, one per condition or patient, giving condition factors, gene factors and cell projections.
- Key Findings: separates condition-to-condition from cell-to-cell variation without cell-type labels. Patient factors are passed to logistic regression to predict lupus status across processing batches.
- Correspondence: the cell mode varies in number and identity across patients. The gene mode is aligned. Two-stage: decomposition, then supervised prediction.
- Relevance: subject-level prediction from sets of observations with no correspondence across subjects.
- Quality: High.
- Potential Use: related work, two-stage baseline.

[cui2024gstrpca] Cui, L. et al. (2024). GSTRPCA: irregular tensor singular value decomposition for single-cell multi-omics data clustering. Briefings in Bioinformatics, 26(1). Tag: neutral. Read: full text (PubMed Central).
- Type: method.
- Method: irregular tensor robust PCA with low-rank and sparse terms and a weighted threshold model.
- Key Findings: global convergence and better clustering of single-cell multi-omics data.
- Correspondence: the omics layers have different feature dimensions. Decomposition only.
- Relevance: an irregular tensor model outside the PARAFAC2 family.
- Quality: Medium.
- Potential Use: related work.

[larsen2024tensor] Larsen, B. W., Kolda, T. G., Zhang, A. R. and Williams, A. H. (2024). Tensor decomposition meets RKHS: efficient algorithms for smooth and misaligned data. arXiv 2408.05677, preprint. Tag: neutral. Read: full text.
- Type: method.
- Method: CP-HiFi, a CP decomposition in which some factors are functions in a reproducing kernel Hilbert space.
- Key Findings: smoothness on the continuous modes, and a solver for incomplete or misaligned data (Section 4.2).
- Correspondence: observations need not lie on a regular grid, so each slice can be sampled at its own points of the continuous mode. Decomposition only.
- Relevance: a decomposition for misaligned samples of a continuous mode.
- Quality: Low (preprint, not peer reviewed).
- Potential Use: related work, model of off-grid samples.

[brust2026fast] Brust, J. J. and Kolda, T. G. (2026). Fast and accurate CP-HIFI tensor decompositions: exploiting Kronecker structure. arXiv 2603.25691, preprint. Tag: neutral. Read: full text.
- Type: method.
- Method: fast solvers for the infinite-dimensional subproblems of CP-HIFI, for aligned and unaligned tensors.
- Key Findings: the same accuracy as direct solves with large speed-ups.
- Correspondence: in the unaligned case each tensor has only a scattered subset of observations (Section 5.2). Decomposition only.
- Relevance: makes the unaligned CP-HIFI case computable at scale.
- Quality: Low (preprint, not peer reviewed).
- Potential Use: related work, methods.

[tang2026tensor] Tang, R., Kolda, T. G. and Zhang, A. R. (2026). Tensor decomposition with unaligned observations. SIAM Journal on Matrix Analysis and Applications, 47(1), 107-131. Tag: neutral. Read: full text (arXiv 2410.14046).
- Type: method.
- Method: a functional tensor decomposition in which subject `i` is observed at its own set of time points `T_i`, fitted with RKHS factors.
- Key Findings: efficient algorithms and an application to an early childhood microbiome study.
- Correspondence: the time mode is unaligned across subjects (different measurement times). Features are aligned. Decomposition only.
- Relevance: the formal model of unaligned observations of one mode.
- Quality: High.
- Potential Use: related work, methods.

[cohen2018nonnegative] Cohen, J. E. and Bro, R. (2018). Nonnegative PARAFAC2: a flexible coupling approach. LVA/ICA 2018, 89-98. Tag: neutral. Read: full text.
- Type: method.
- Method: replaces the hard PARAFAC2 constraint by a penalty, `B_k = P_k B* + Gamma_k`.
- Key Findings: allows non-negativity on the varying mode. Notes that PARAFAC2 transforms all columns of `B_k` alike, unlike shift-PARAFAC.
- Correspondence: varying mode coupled softly to a common factor. Decomposition only.
- Relevance: flexible coupling as a softer form of correspondence.
- Quality: High.
- Potential Use: methods section.

[perros2017spartan] Perros, I. et al. (2017). SPARTan: scalable PARAFAC2 for large and sparse data. KDD 2017, 375-384. Tag: neutral. Read: full text.
- Type: method.
- Method: scalable PARAFAC2 for sparse EHR tensors.
- Key Findings: orders of magnitude faster on large EHR data.
- Correspondence: the J columns of each slice have to be aligned across all K subjects. The visit (time) mode varies. Decomposition only.
- Relevance: states the aligned-feature requirement explicitly.
- Quality: High.
- Potential Use: related work.

[afshar2018copa] Afshar, A. et al. (2018). COPA: constrained PARAFAC2 for sparse and large datasets. CIKM 2018, 793-802. Tag: neutral. Read: full text.
- Type: method.
- Method: PARAFAC2 with smoothness and sparsity constraints by AO-ADMM.
- Key Findings: interpretable temporal phenotypes from EHR at scale.
- Correspondence: irregular time mode, aligned feature mode. Decomposition only.
- Relevance: constrained PARAFAC2 on irregular EHR.
- Quality: Medium.
- Potential Use: related work.

[ren2020robust] Ren, Y. et al. (2020). Robust irregular tensor factorization and completion (REPAIR). CIKM 2020, 1295-1304. Tag: neutral. Read: abstract.
- Type: method.
- Method: PARAFAC2 with a low-rank regulariser for missing and erroneous entries.
- Key Findings: robust phenotypes from corrupted EHR.
- Correspondence: records unaligned along the time dimension, aligned features. Decomposition only.
- Relevance: robustness of PARAFAC2.
- Quality: Medium.
- Potential Use: related work.

[ren2025unraveling] Ren, Y. et al. (2025). Unraveling complex temporal patterns in EHRs via robust irregular tensor factorization (REPAR). AMIA Joint Summits on Translational Science Proceedings 2025. Tag: neutral. Read: full text (PubMed Central page).
- Type: method.
- Method: PARAFAC2 with recurrent neural network temporal regularization and a low-rank constraint for robustness.
- Key Findings: better reconstruction and robustness to missing data on three EHR data sets.
- Correspondence: varying visit counts per patient, aligned features. Decomposition used for subgroup identification.
- Relevance: recent PARAFAC2 for irregular EHR.
- Quality: Medium.
- Potential Use: related work, currency.

[jorgensen2024probabilistic] Jorgensen, P. J. H. et al. (2024). Probabilistic PARAFAC2. Entropy, 26(8), 697. Tag: neutral. Read: full text.
- Type: method.
- Method: a probabilistic PARAFAC2 with variational inference.
- Key Findings: uncertainty estimates and automatic rank selection for PARAFAC2.
- Correspondence: varying mode as in PARAFAC2. Decomposition only.
- Relevance: Bayesian form of PARAFAC2, a route to joint models.
- Quality: Medium.
- Potential Use: related work, methods.

[chen2023enhanced] Chen, Z., Cheng, L. and Wu, Y.-C. (2023). Enhanced tensor rank learning in Bayesian PARAFAC2 for noisy irregular tensor data. EUSIPCO 2023, 645-649. Tag: neutral. Read: full text (EURASIP proceedings).
- Type: method.
- Method: Bayesian PARAFAC2 with a generalized hyperbolic sparsity prior on all factor matrices for automatic rank learning.
- Key Findings: better rank recovery than a Gaussian-gamma prior in high-rank and low signal-to-noise settings.
- Correspondence: irregular data with unaligned dimensions, as in PARAFAC2. Decomposition only.
- Relevance: Bayesian PARAFAC2 rank selection.
- Quality: Medium.
- Potential Use: related work, methods.

[chatzis2025tparafac2] Chatzis, C., Schenker, C., Pfeffer, M. and Acar, E. (2025). tPARAFAC2: tracking evolving patterns in temporal data. Data Mining and Knowledge Discovery, 39(6). Tag: neutral. Read: full text.
- Type: method.
- Method: PARAFAC2 with temporal smoothness on the evolving factors and handling of missing entries.
- Key Findings: better tracking of gradual change than plain PARAFAC2.
- Correspondence: evolving mode regularised across slices. Decomposition only.
- Relevance: recent PARAFAC2 variant.
- Quality: High.
- Potential Use: related work, currency.

[chatzis2025dcmf] Chatzis, C., Schenker, C., Cohen, J. E. and Acar, E. (2025). dCMF: learning interpretable evolving patterns from temporal multiway data. EUSIPCO 2025, 2122-2126. Tag: neutral. Read: full text.
- Type: method.
- Method: coupled matrix factorization with a linear dynamical system constraint in place of the PARAFAC2 constraint.
- Key Findings: similar to PARAFAC2 when patterns follow the PARAFAC2 structure, and better when they do not.
- Correspondence: evolving factors across time slices. Decomposition only.
- Relevance: an alternative to the PARAFAC2 constraint for evolving modes.
- Quality: Medium.
- Potential Use: related work.

[hu2026separable] Hu, Y., Jiang, T.-X., Ng, M. K. and Zhao, X.-L. (2026). Separable decomposition for ragged tensors. IEEE TPAMI, 48(8), 9624-9641. Tag: neutral. Read: abstract.
- Type: method.
- Method: CP-based decomposition of tensors with irregular index patterns, using a binary weighting tensor.
- Key Findings: efficient solver with convergence guarantee on hyperspectral and spatial transcriptomics data.
- Correspondence: irregular in several modes, with the valid domain marked by weights. Decomposition only.
- Relevance: ragged tensors as a second route to unaligned data.
- Quality: High.
- Potential Use: related work.

[kim2024fast] Kim, J., Park, K. H., Jang, J.-G. and Kang, U (2024). Fast and accurate domain adaptation for irregular tensor decomposition. KDD 2024, 1383-1394. Tag: neutral. Read: abstract.
- Type: method.
- Method: PARAFAC2 for a new target tensor, using factors learned from source irregular tensors.
- Key Findings: fast and accurate patterns for a new domain with little data.
- Correspondence: irregular mode as in PARAFAC2. Decomposition used for missing value prediction and anomaly detection.
- Relevance: transfer across PARAFAC2 models.
- Quality: Medium.
- Potential Use: related work.

[jang2023fast] Jang, J.-G., Lee, J., Park, Y.-C. and Kang, U (2023). Fast and accurate dual-way streaming PARAFAC2 for irregular tensors. KDD 2023, 879-890. Tag: neutral. Read: full text (arXiv 2305.18376).
- Type: method.
- Method: streaming PARAFAC2 for new rows of existing slices and new slices arriving over time.
- Key Findings: faster and more accurate than static and earlier streaming PARAFAC2.
- Correspondence: slices share the column mode and differ in row length. Decomposition only.
- Relevance: PARAFAC2 at scale.
- Quality: Medium.
- Potential Use: related work.

[jang2024fast] Jang, J.-G., Park, Y.-C. and Kang, U (2024). Fast and accurate PARAFAC2 decomposition for time range queries on irregular tensors. CIKM 2024, 962-972. Tag: neutral. Read: abstract.
- Type: method.
- Method: PARAFAC2 for sub-tensors of chosen time ranges without decomposing from scratch.
- Key Findings: efficient analysis of time ranges of an irregular tensor.
- Correspondence: slices with different row sizes. Decomposition only.
- Relevance: PARAFAC2 tooling.
- Quality: Medium (abstract only).
- Potential Use: related work.

[kwon2024compact] Kwon, T. et al. (2024). Compact decomposition of irregular tensors for data compression. KDD 2024, 1451-1462. Tag: neutral. Read: abstract.
- Type: method.
- Method: a decomposition of irregular tensors aimed at compression, beyond PARAFAC2.
- Key Findings: PARAFAC2 compresses poorly because of its many first-mode factor matrices.
- Correspondence: matrices with different numbers of rows. Decomposition only.
- Relevance: irregular tensor models outside PARAFAC2.
- Quality: Medium (abstract only).
- Potential Use: related work.

[zhao2024fedpar] Zhao, M. and Reisi Gahrooei, M. (2024). FedPAR: federated PARAFAC2 tensor factorization for computational phenotyping. IISE Transactions on Healthcare Systems Engineering, 14(3), 264-275. Tag: neutral. Read: abstract.
- Type: method.
- Method: federated PARAFAC2 for EHR held by several entities.
- Key Findings: phenotypes without pooling data or fitting in silos.
- Correspondence: temporally irregular EHR, aligned features. Decomposition only.
- Relevance: PARAFAC2 under data-sharing limits.
- Quality: Medium (abstract only).
- Potential Use: related work.

[magbonde2023constrained] Magbonde, A., Quaine, F. and Rivet, B. (2023). Constrained non-negative PARAFAC2 for electromyogram separation. ICASSP 2023, 1-5. Tag: neutral. Read: full text (HAL).
- Type: method.
- Method: non-negative PARAFAC2 with physiological constraints and handling of dysfunctional sensors, by AO-ADMM.
- Key Findings: similar performance to non-negative PARAFAC2 with one component per muscle.
- Correspondence: high-density surface EMG on a fixed electrode matrix. Decomposition only.
- Relevance: PARAFAC2 on biomedical sensor arrays.
- Quality: Medium.
- Potential Use: related work.

[schneide2023shiftinvariant] Schneide, P.-A., Bro, R. and Gallagher, N. B. (2023). Shift-invariant tri-linearity. Journal of Chemometrics, 37(8). Tag: neutral. Read: abstract.
- Type: method.
- Method: shift-invariant trilinear model for GC-MS.
- Key Findings: 20 to 60 times faster than PARAFAC2 ALS, with constraints on all modes.
- Correspondence: elution mode shifted across samples, mass mode aligned. Decomposition only.
- Relevance: shift model as a fast alternative to PARAFAC2.
- Quality: Medium.
- Potential Use: related work.

[schneide2024shift] Schneide, P.-A., Gallagher, N. B. and Bro, R. (2024). Shift invariant soft trilinearity. Chemometrics and Intelligent Laboratory Systems, 251, 105155. Tag: neutral. Read: abstract.
- Type: method.
- Method: extends shift-invariant tri-linearity to allow peak shape changes.
- Key Findings: better factor resolution than SIT when data depart from trilinearity, with less rotational ambiguity than MCR-ALS.
- Correspondence: shifted and reshaped elution mode, aligned mass mode. Decomposition only.
- Relevance: model of shift plus shape change.
- Quality: Medium.
- Potential Use: related work.

[schneide2024unlocking] Schneide, P.-A., Sorochan Armstrong, M., Gallagher, N. and Bro, R. (2024). Unlocking new capabilities in the analysis of GCxGC-TOFMS data with shift-invariant multi-linearity. Journal of Chemometrics, 39(1). Tag: neutral. Read: full text (arXiv 2412.12114).
- Type: method.
- Method: shift-invariant multi-linearity (SIML), with wavelet smoothing and Fourier shift correction inside MCR-ALS.
- Key Findings: unique solutions and better robustness at low signal-to-noise than MCR-ALS and PARAFAC2xN.
- Correspondence: retention time shifts in two chromatographic modes, aligned mass mode. Decomposition only.
- Relevance: recent shift model in several modes.
- Quality: Medium.
- Potential Use: related work, currency.

[sorochanarmstrong2023parafac2n] Sorochan Armstrong, M. D. et al. (2023). PARAFAC2xN: coupled decomposition of multi-modal data with drift in N modes. Analytica Chimica Acta, 1249, 340909. Tag: neutral. Read: full text.
- Type: method.
- Method: PARAFAC2 extended to drift along more than one mode for GC x GC-TOFMS.
- Key Findings: models drift in two chromatographic dimensions at once.
- Correspondence: two modes unaligned across samples, the mass mode aligned. Decomposition only.
- Relevance: frees more than one mode.
- Quality: Medium.
- Potential Use: related work, extension to 3-D spatial drift.

### T4. Supervised models with an unaligned or misaligned mode

[afshar2020taste] Afshar, A. et al. (2020). TASTE: temporal and static tensor factorization for phenotyping EHR. ACM CHIL 2020, 193-203. Tag: opposes. Read: full text.
- Type: method.
- Method: PARAFAC2 on temporal EHR coupled with a static patient matrix. Phenotypes are then passed to logistic regression.
- Key Findings: phenotypes predict heart failure as well as raw features with better interpretability.
- Correspondence: irregular visit mode, aligned feature mode. Two-stage: decomposition, then supervised prediction.
- Relevance: early outcome use of PARAFAC2 factors.
- Quality: Medium.
- Potential Use: related work, two-stage baseline.

[yin2020logpar] Yin, K. et al. (2020). LogPar: logistic PARAFAC2 factorization for temporal binary data with missing values. KDD 2020, 1625-1635. Tag: opposes. Read: full text (PubMed Central).
- Type: method.
- Method: Bernoulli PARAFAC2 with a positive-unlabeled loss.
- Key Findings: 13.2 percent relative gain for heart failure prediction and 14 percent for mortality prediction over PARAFAC2 models.
- Correspondence: irregular time mode, aligned feature mode. The diagonal of `S_k` is each patient's representation, passed to logistic regression. Two-stage.
- Relevance: non-Gaussian PARAFAC2 used for prediction.
- Quality: Medium.
- Potential Use: related work.

[ren2022multipar] Ren, Y. et al. (2022). MULTIPAR: supervised irregular tensor factorization with multi-task learning. arXiv 2208.00993, with a 2023 PubMed Central record. Tag: opposes. Read: full text.
- Type: method.
- Method: joint loss of PARAFAC2 reconstruction plus static and dynamic outcome losses on `S_k` and `U_k`.
- Key Findings: joint training gives better mortality and other predictions than two-stage PARAFAC2.
- Correspondence: irregular time mode, aligned feature mode. Supervised predictor fitted jointly.
- Relevance: the closest joint supervised PARAFAC2, with time as the varying mode.
- Quality: Medium.
- Potential Use: closest prior work and baseline design.

[konyar2025semisupervised] Konyar, E. and Gahrooei, M. R. (2025). Semi-supervised PARAFAC2 decomposition for computational phenotyping. IEEE JBHI, 29(6), 4415-4425. Tag: opposes. Read: abstract.
- Type: method.
- Method: PARAFAC2 with label information for a subset of patients.
- Key Findings: better phenotypes than unsupervised PARAFAC2 on MIMIC-IV.
- Correspondence: irregular hospital-visit mode, aligned feature mode. Semi-supervised, binary outcome.
- Relevance: label information in PARAFAC2.
- Quality: Medium.
- Potential Use: related work.

[patalano2026par2cox] Patalano, M., Konyar, E. and Paynabar, K. (2026). PAR2COX: survival-informed tensor decomposition. arXiv 2609.23705, preprint. Tag: opposes. Read: full text.
- Type: method.
- Method: PARAFAC2 plus a Cox partial likelihood on `w_k = diag(S_k)`, solved by AO-ADMM.
- Key Findings: phenotypes that predict survival risk from irregular longitudinal data.
- Correspondence: irregular time mode, aligned feature mode. Supervised (survival).
- Relevance: the most recent joint supervised PARAFAC2.
- Quality: Low (preprint, not peer reviewed).
- Potential Use: related work, design of a joint objective.

[minoccheri2025supervised] Minoccheri, C., Tesic, S., Najarian, K. and Stidham, R. (2025). Supervised coupled matrix-tensor factorization (SCMTF). arXiv 2506.20065, preprint. Tag: opposes. Read: full text.
- Type: method with application.
- Method: coupled matrix and tensor factorization with a supervised term predicting medication persistence.
- Key Findings: interpretable phenotypes of patient-reported outcomes that predict persistence in ulcerative colitis.
- Correspondence: irregular time mode, aligned feature mode. Supervised.
- Relevance: supervised CMTF with an irregular mode.
- Quality: Low (preprint, not peer reviewed).
- Potential Use: related work.

The T4 entries [marini2013scream], [huang2026shiftaware], [xu2024tensor], [haijie2024a] and [ramirez2025integrative] are listed under other themes.

### T5. Coupled matrix and tensor factorization

[acar2014structurerevealing] Acar, E. et al. (2014). Structure-revealing data fusion. BMC Bioinformatics, 15. Tag: neutral. Read: full text.
- Type: method.
- Method: advanced CMTF with sparsity on component weights, giving shared and unshared components.
- Key Findings: correct shared and distinct structure in metabolomics data fusion.
- Correspondence: coupled along the subject mode. Other modes aligned. Decomposition only.
- Relevance: base of ACMTF and ACMTF-R.
- Quality: High.
- Potential Use: related work.

[acar2019unraveling] Acar, E. et al. (2019). Unraveling diagnostic biomarkers of schizophrenia through structure-revealing fusion of multi-modal neuroimaging. Frontiers in Neuroscience, 13. Tag: supports. Read: full text.
- Type: method with application.
- Method: ACMTF on fMRI, sMRI and EEG features coupled in the subject mode. Subject factors are then tested for group differences.
- Key Findings: subject factors separate patients from controls.
- Correspondence: features from images in a common space. Aligned. Decomposition with outcome analysis afterwards.
- Relevance: imaging biomarkers from coupled factorization.
- Quality: Medium.
- Potential Use: related work.

[schenker2025parafac2based] Schenker, C. et al. (2025). PARAFAC2-based coupled matrix and tensor factorizations with constraints. IEEE JSTSP, 19(7), 1461-1476. Tag: neutral. Read: full text.
- Type: method.
- Method: CMTF in which one tensor follows PARAFAC2, fitted by AO-ADMM with constraints.
- Key Findings: joint analysis of an irregular tensor with matrices on shared modes.
- Correspondence: one coupled tensor carries a varying mode. Decomposition only.
- Relevance: CMTF with an unaligned mode, the in-scope part of CMTF.
- Quality: High.
- Potential Use: related work, methods.

[chatzichristos2021early] Chatzichristos, C. et al. (2021). Early soft and flexible fusion of EEG and fMRI via double coupled matrix tensor factorization. Human Brain Mapping, 43(4), 1231-1255. Tag: neutral. Read: full text.
- Type: method with application.
- Method: double coupled factorization of EEG and fMRI with soft and flexible coupling.
- Key Findings: flexible coupling absorbs variability in the haemodynamic response across subjects.
- Correspondence: fMRI registered to MNI with FLIRT, so space is aligned. Flexibility is in the HRF. Decomposition only.
- Relevance: flexible coupling in imaging.
- Quality: High.
- Potential Use: related work.

[borsoi2023coupled] Borsoi, R. A. et al. (2023). Coupled CP tensor decomposition with shared and distinct components for multi-task fMRI fusion. ICASSP 2023, 1-5. Tag: neutral. Read: full text.
- Type: method.
- Method: coupled CP across task tensors with shared and distinct components.
- Key Findings: recovers task-shared and task-specific patterns.
- Correspondence: per-subject SPM regression coefficient maps in a common space. Aligned. Decomposition only.
- Relevance: multi-task imaging fusion.
- Quality: Medium.
- Potential Use: related work.

The T5 entries [vanderploeg2026acmtfr], [li2022coupled], [minoccheri2025supervised] and [chatzis2025dcmf] are listed under other themes.

### T7. Foundations of CP and PARAFAC2

[harshman1970foundations] Harshman, R. A. (1970). Foundations of the PARAFAC procedure: models and conditions for an "explanatory" multimodal factor analysis. UCLA Working Papers in Phonetics, 16, 1-84. Tag: neutral. Read: full text (author's reproduction).
- Type: method, foundational.
- Method: PARAFAC, from Cattell's principle of rotation to proportional profiles for three-way and higher-order data.
- Key Findings: proportional profiles give explanatory factors in system-variation data, with a uniqueness proof credited to Jennrich.
- Correspondence: every mode aligned across slices. Decomposition only.
- Relevance: origin of PARAFAC, cited by 4 of the 6 chained core papers.
- Quality: High.
- Potential Use: background.

[carroll1970analysis] Carroll, J. D. and Chang, J.-J. (1970). Analysis of individual differences in multidimensional scaling via an N-way generalization of Eckart-Young decomposition. Psychometrika, 35(3), 283-319. Tag: neutral. Read: abstract.
- Type: method, foundational.
- Method: CANDECOMP, the CP model.
- Key Findings: an N-way generalisation of the Eckart-Young decomposition for individual differences.
- Correspondence: every mode aligned across slices. Decomposition only.
- Relevance: the CP model behind most tensor regression.
- Quality: High.
- Potential Use: background.

[kolda2009tensor] Kolda, T. G. and Bader, B. W. (2009). Tensor decompositions and applications. SIAM Review, 51(3), 455-500. Tag: neutral. Read: full text.
- Type: review.
- Method: survey of CP, Tucker, PARAFAC2 and related models with notation.
- Key Findings: Section 5.2 presents PARAFAC2 as a variant of CP for matrices `X_k` of size `I_k x J`, with `I_k` free to vary.
- Correspondence: PARAFAC2 applies the same factor along one mode and lets the other vary. Decomposition only.
- Relevance: cited by 5 of the 6 chained core papers.
- Quality: High.
- Potential Use: notation and background.

[kiers1999parafac2], [bro1999parafac2] and [harshman1972parafac2] under T3 also belong to T7.

## Literature Matrix

Themes: T1 multilinear PLS and supervised factor models. T2 tensor regression on an aligned grid. T3 decompositions with an unaligned, ragged or shifted mode. T4 supervised models with an unaligned or misaligned mode. T5 coupled matrix and tensor factorization. T6 neuroimaging or medical imaging use. T7 foundations of CP and PARAFAC2.

Mode handling: A means the spatial or feature mode is aligned and registration comes first. V means a mode varies or is unaligned (the varying mode is named). S means a misalignment model on a registered grid. C means observations on a shared continuous domain at sample-specific points. Output: Sup is a supervised predictor, Two is decomposition followed by a separate prediction, Dec is decomposition only. Read: F is full text, Ab is abstract.

| Key | Year | Themes | Mode handling | Output | Tag | Quality | Read |
|---|---|---|---|---|---|---|---|
| bro1996multiway | 1996 | T1 | A | Sup | supports | High | Ab |
| zhao2013higher | 2013 | T1 T6 | A | Sup | supports | High | F |
| eliseyev2013recursive | 2013 | T1 T6 | A | Sup | supports | Medium | F |
| zhang2017tensor | 2017 | T1 T6 | A | Sup | supports | High | Ab |
| mishra2023iterative | 2023 | T1 | A | Sup | supports | Medium | F |
| sun2024partial | 2024 | T1 T6 | A (atlas) | Sup | supports | High | F |
| vanderploeg2026acmtfr | 2026 | T1 T5 | A | Sup | supports | Medium | F |
| marini2013scream | 2013 | T1 T3 T4 | V (elution time) | Sup | opposes | Medium | Ab |
| zhou2013tensor | 2013 | T2 T6 | A | Sup | supports | High | F |
| li2018tucker | 2018 | T2 T6 | A | Sup | supports | High | F |
| guhaniyogi2015bayesian | 2015 | T2 T6 | A | Sup | supports | High | F |
| lock2018tensorontensor | 2018 | T2 | A | Sup | supports | High | F |
| li2017parsimonious | 2017 | T2 T6 | A | Sup | supports | High | F |
| guhaniyogi2021bayesian | 2021 | T2 T6 | A | Sup | supports | High | Ab |
| li2016sparse | 2016 | T2 T6 | A | Sup | supports | High | F |
| papadogeorgou2019soft | 2019 | T2 T6 | A (atlas) | Sup | supports | High | F |
| kossaifi2017tensor | 2017 | T2 T6 | A | Sup | supports | Medium | F |
| yan2019structured | 2019 | T2 | A | Sup | supports | Medium | F |
| gahrooei2020multiple | 2020 | T2 | A | Sup | supports | Medium | F |
| wang2026maximum | 2026 | T2 | A (point order) | Sup | supports | Medium | F |
| wang2025tensorontensor | 2025 | T2 | A | Sup | supports | Low | F |
| huang2026shiftaware | 2026 | T2 T4 T6 | S (cyclic shift) | Sup | opposes | Medium | F |
| wang2026a | 2026 | T2 T6 | A | Sup | supports | Medium | F |
| lyu2024bayesian | 2024 | T2 T6 | A | Sup | supports | Medium | F |
| guhaniyogi2024a | 2024 | T2 T6 | A | Sup | supports | High | F |
| li2022coupled | 2022 | T2 T5 T6 | A | Sup | supports | Medium | F |
| zhou2021partially | 2021 | T2 T6 | A | Sup | supports | High | F |
| xu2024tensor | 2024 | T2 T4 | V (time points) | Sup | opposes | High | F |
| faes2024single | 2024 | T2 T6 | A | Sup | supports | High | F |
| li2027functional | 2027 | T2 T6 | A | Sup | supports | Medium | F |
| he2026an | 2026 | T2 T6 | A | Sup | supports | Medium | Ab |
| kundu2023bayesian | 2023 | T2 T6 | A | Sup | supports | High | F |
| pietrosanu2026regularized | 2026 | T2 T6 | A | Sup | supports | Medium | F |
| haijie2024a | 2024 | T2 T4 | C | Sup | opposes | Low | F |
| spencer2024bayesian | 2024 | T2 T6 | A | Sup | supports | High | F |
| naji2026bayesian | 2026 | T2 T6 | A | Sup | supports | Low | F |
| liu2026bayesian | 2026 | T2 T6 | A | Sup | supports | Low | F |
| reinhardt2026spatiallyinformed | 2026 | T2 T6 | A | Two | supports | Low | F |
| liu2023integrative | 2023 | T2 T6 | A | Sup | supports | Medium | F |
| llosavite2023reducedrank | 2023 | T2 T6 | A | Sup | supports | High | F |
| liu2021tensor | 2021 | T2 | A | Sup | neutral | High | F |
| harshman1972parafac2 | 1972 | T3 T7 | V (rows) | Dec | neutral | High | F |
| kiers1999parafac2 | 1999 | T3 T7 | V (rows) | Dec | neutral | High | Ab |
| bro1999parafac2 | 1999 | T3 T7 | V (elution time) | Dec | neutral | High | Ab |
| morup2008shiftinvariant | 2008 | T3 T6 | V (time shift) | Dec | neutral | High | F |
| kuang2015multisubject | 2015 | T3 T6 | V (time delay) | Dec | neutral | Medium | Ab |
| kuang2024shiftinvariant | 2024 | T3 T6 | V (time delay) | Dec | neutral | Medium | Ab |
| rivet2016modeling | 2016 | T3 T6 | V (time warp) | Dec | neutral | Medium | Ab |
| madsen2016quantifying | 2016 | T3 T6 | V (time) | Dec | neutral | High | F |
| roald2020tracing | 2020 | T3 T6 | V (voxels) | Dec | neutral | Medium | F |
| roald2022an | 2022 | T3 T6 | V (voxels per task) | Dec | neutral | High | F |
| cottrell2026subspace | 2026 | T3 | V (spots) | Dec | neutral | Low | F |
| ramirez2025integrative | 2025 | T3 T4 | V (cells) | Two | opposes | High | F |
| cui2024gstrpca | 2024 | T3 | V (features) | Dec | neutral | Medium | F |
| larsen2024tensor | 2024 | T3 | C | Dec | neutral | Low | F |
| brust2026fast | 2026 | T3 | C | Dec | neutral | Low | F |
| tang2026tensor | 2026 | T3 | C (time points) | Dec | neutral | High | F |
| cohen2018nonnegative | 2018 | T3 | V (soft coupling) | Dec | neutral | High | F |
| perros2017spartan | 2017 | T3 | V (visits) | Dec | neutral | High | F |
| afshar2018copa | 2018 | T3 | V (visits) | Dec | neutral | Medium | F |
| ren2020robust | 2020 | T3 | V (visits) | Dec | neutral | Medium | Ab |
| ren2025unraveling | 2025 | T3 | V (visits) | Dec | neutral | Medium | F |
| jorgensen2024probabilistic | 2024 | T3 | V (rows) | Dec | neutral | Medium | F |
| chen2023enhanced | 2023 | T3 | V (rows) | Dec | neutral | Medium | F |
| chatzis2025tparafac2 | 2025 | T3 | V (time) | Dec | neutral | High | F |
| chatzis2025dcmf | 2025 | T3 T5 | V (time) | Dec | neutral | Medium | F |
| hu2026separable | 2026 | T3 | V (several modes) | Dec | neutral | High | Ab |
| kim2024fast | 2024 | T3 | V (rows) | Dec | neutral | Medium | Ab |
| jang2023fast | 2023 | T3 | V (rows) | Dec | neutral | Medium | F |
| jang2024fast | 2024 | T3 | V (rows) | Dec | neutral | Medium | Ab |
| kwon2024compact | 2024 | T3 | V (rows) | Dec | neutral | Medium | Ab |
| zhao2024fedpar | 2024 | T3 | V (visits) | Dec | neutral | Medium | Ab |
| magbonde2023constrained | 2023 | T3 | V (rows) | Dec | neutral | Medium | F |
| schneide2023shiftinvariant | 2023 | T3 | V (elution shift) | Dec | neutral | Medium | Ab |
| schneide2024shift | 2024 | T3 | V (elution shift) | Dec | neutral | Medium | Ab |
| schneide2024unlocking | 2024 | T3 | V (two shifted modes) | Dec | neutral | Medium | F |
| sorochanarmstrong2023parafac2n | 2023 | T3 | V (two modes) | Dec | neutral | Medium | F |
| afshar2020taste | 2020 | T3 T4 | V (visits) | Two | opposes | Medium | F |
| yin2020logpar | 2020 | T3 T4 | V (time) | Two | opposes | Medium | F |
| ren2022multipar | 2022 | T3 T4 | V (time) | Sup | opposes | Medium | F |
| konyar2025semisupervised | 2025 | T3 T4 | V (visits) | Sup | opposes | Medium | Ab |
| patalano2026par2cox | 2026 | T3 T4 | V (time) | Sup | opposes | Low | F |
| minoccheri2025supervised | 2025 | T4 T5 | V (time) | Sup | opposes | Low | F |
| acar2014structurerevealing | 2014 | T5 | A | Dec | neutral | High | F |
| acar2019unraveling | 2019 | T5 T6 | A | Two | supports | Medium | F |
| schenker2025parafac2based | 2025 | T3 T5 | V (one tensor) | Dec | neutral | High | F |
| chatzichristos2021early | 2021 | T5 T6 | A (MNI) | Dec | neutral | High | F |
| borsoi2023coupled | 2023 | T5 T6 | A | Dec | neutral | Medium | F |
| harshman1970foundations | 1970 | T7 | A | Dec | neutral | High | F |
| carroll1970analysis | 1970 | T7 | A | Dec | neutral | High | Ab |
| kolda2009tensor | 2009 | T7 | A | Dec | neutral | High | F |

## Identified Gaps

These gaps are what the documented search found: Q1 to Q8, backward chaining, forward tracking, the five semantic queries of Layer 4 and the check round. They are not a claim about all published work.

1. No included source fits a model with the spatial mode varying or unaligned across subjects together with a subject-level outcome. The supervised methods found that leave a mode unaligned use other modes. SCREAM frees the elution time mode in chromatography. TASTE, LogPar, MULTIPAR, Konyar 2025, PAR2COX and SCMTF free the visit or time mode of EHR data. RISE frees the cell mode of single-cell data, in two stages. Xu 2024 allows subject-specific observed time points.
2. Every supervised tensor regression and tensor PLS method found with imaging data takes the spatial mode as aligned. The imaging applications register to a template (Zhou 2013, Li 2016, Lyu 2024, Wang 2026, Li 2022, Kundu 2023, Liu 2023, Liu 2026, Reinhardt 2026) or use an atlas parcellation (Papadogeorgou 2019, Sun 2024).
3. The one supervised tensor method found that models spatial misalignment of images is CS-SKPD (Huang 2026). It handles small cyclic shifts on a grid that is already registered. FRCOMA (Haijie 2024) regresses on continuous domains without a fixed grid, and its applications in the paper are not images.
4. Decompositions that let the spatial mode vary exist. Roald 2020 and Roald 2022 let the voxel mode evolve across tasks in fMRI. STORM (Cottrell 2026) lets the spot mode differ in number and geometry across tissue slices. None of them has an outcome term.
5. Models of unaligned observations on a continuous mode (Larsen 2024, Brust 2026, Tang 2026) handle subject-specific sampling points of a time or continuous mode. They are decompositions only.
6. Point-cloud regression found still assumes point correspondence. Yan 2019 and Wang 2025 use structured point clouds on a grid, and Wang 2026 (MCU) flattens ordered points. Yan 2019 names unstructured point clouds as future work.
7. Shift and warping models (Morup 2008, Kuang 2015, Kuang 2024, Rivet 2016, Schneide 2023, Schneide 2024, SIML) move a time or elution mode. None found shifts or warps a spatial mode. SCREAM is the only supervised one.
8. PARAFAC2xN and SIML free two modes at once in chromatography. No source found frees a 3-D spatial mode.

## Recommended Sources by Paper Section

Introduction:
- Registration-first supervised imaging models: zhou2013tensor, li2016sparse, lyu2024bayesian, liu2023integrative, liu2026bayesian.
- PARAFAC2 as a model for a varying mode: harshman1972parafac2, kiers1999parafac2, bro1999parafac2, madsen2016quantifying.
- Open statements of the unaligned case: yan2019structured, huang2026shiftaware, tang2026tensor.

Related work, tensor PLS:
- bro1996multiway, zhao2013higher, eliseyev2013recursive, zhang2017tensor, mishra2023iterative, sun2024partial, vanderploeg2026acmtfr, marini2013scream.

Related work, tensor regression:
- zhou2013tensor, li2018tucker, guhaniyogi2015bayesian, lock2018tensorontensor, li2017parsimonious, guhaniyogi2021bayesian, li2016sparse, papadogeorgou2019soft, kossaifi2017tensor, gahrooei2020multiple, guhaniyogi2024a, li2022coupled.
- Recent imaging tensor regression: spencer2024bayesian, kundu2023bayesian, pietrosanu2026regularized, naji2026bayesian, he2026an, li2027functional, llosavite2023reducedrank, faes2024single, zhou2021partially.
- Review: liu2021tensor.

Related work, unaligned-mode decompositions:
- PARAFAC2 and fitting: roald2022an, cohen2018nonnegative, jorgensen2024probabilistic, chen2023enhanced, chatzis2025tparafac2, chatzis2025dcmf, perros2017spartan, afshar2018copa, ren2020robust, ren2025unraveling, kim2024fast, jang2023fast, jang2024fast, zhao2024fedpar, magbonde2023constrained.
- Varying spatial mode: roald2020tracing, roald2022an, cottrell2026subspace.
- Unaligned observations of a continuous mode: larsen2024tensor, brust2026fast, tang2026tensor.
- Shift and warping models: morup2008shiftinvariant, kuang2015multisubject, kuang2024shiftinvariant, rivet2016modeling, schneide2023shiftinvariant, schneide2024shift, schneide2024unlocking, sorochanarmstrong2023parafac2n.
- Ragged and irregular tensors beyond PARAFAC2: hu2026separable, kwon2024compact, cui2024gstrpca.
- CMTF with an unaligned mode: schenker2025parafac2based.

Related work, supervised use of an unaligned mode:
- marini2013scream, ren2022multipar, patalano2026par2cox, konyar2025semisupervised, afshar2020taste, yin2020logpar, minoccheri2025supervised, ramirez2025integrative, xu2024tensor, haijie2024a, huang2026shiftaware.

Methods:
- PARAFAC2 model and constraint: harshman1972parafac2, kiers1999parafac2, kolda2009tensor.
- AO-ADMM fitting with constraints on all modes: roald2022an, schenker2025parafac2based.
- Joint loss of reconstruction and outcome: marini2013scream, ren2022multipar, patalano2026par2cox, vanderploeg2026acmtfr.
- Continuous modes and off-grid samples: larsen2024tensor, tang2026tensor, haijie2024a.

Experiments, baselines:
- Aligned-grid supervised baselines: zhou2013tensor, li2018tucker, zhao2013higher, bro1996multiway.
- Misalignment-aware baseline: huang2026shiftaware.
- Two-stage PARAFAC2 baselines: afshar2020taste, ramirez2025integrative.
- Joint PARAFAC2 regression baseline: marini2013scream.

Discussion:
- Atlas parcellation as the alternative route to correspondence: papadogeorgou2019soft, sun2024partial.
- Flexible coupling of a spatial mode: chatzichristos2021early, cohen2018nonnegative.
- Several unaligned modes: sorochanarmstrong2023parafac2n, schneide2024unlocking, hu2026separable.
- Point clouds without correspondence: yan2019structured, wang2026maximum, wang2025tensorontensor.
- Harmonization after registration: reinhardt2026spatiallyinformed.
- Background: harshman1970foundations, carroll1970analysis, kolda2009tensor, acar2014structurerevealing, acar2019unraveling, borsoi2023coupled.

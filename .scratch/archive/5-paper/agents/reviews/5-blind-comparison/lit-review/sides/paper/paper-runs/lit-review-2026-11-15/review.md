# Literature review: supervised prediction from data whose spatial mode is not aligned across subjects

## 1. Search strategy

No .bib and no reference list were given (Materials in hand: none), so there is no screened .bib block and the search started from the research question. The research question is: which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects, how each handles the missing correspondence, and where each removes or builds on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines.

- Primary concepts: supervised prediction from tensors or sets; the treatment of correspondence (registration, template or barycenter, transport coupling, permutation invariance); the medical-imaging pipeline (registration, radiomics, lesion segmentation).
- Profile: cs_ml. It fits the Discipline row (machine learning, with medical image analysis as the application setting), so no profile warning applies. Archival preprints, conference proceedings and technical reports are admitted and tagged by evidence type, and preprints count toward the peer-reviewed share.
- Criteria: peer-reviewed journals, books and conference proceedings, plus preprints under cs_ml. English. The last 10 years (2016 to 2026), with seminal works admitted when the cited-by listing shows more than 100 citing works. Relevance means the abstract addresses at least one aspect of the research question, and work that is only tangential was excluded.
- Indexes: every search queried the four indexes that the lookup tool asks (Crossref, OpenAlex, Semantic Scholar, arXiv). The indexes left out of a call, with the reason printed, are listed after the search table.
- All searches were run on 2026-11-15 with a limit of 100 records per index. The lookup tool has no filter options, so year, type and language were applied at screening.

| Pass and layer | Search string or lookup | Records |
|---|---|---|
| 1, layer 1 | ("tensor regression" OR "multilinear partial least squares" OR "higher-order partial least squares" OR "N-way partial least squares") AND ("prediction" OR "neuroimaging") | 234 |
| 1, layer 1 | ("PARAFAC2" OR "irregular tensor" OR "unaligned mode" OR "varying mode") AND ("tensor decomposition" OR "tensor factorization") | 204 |
| 1, layer 1 | ("optimal transport" OR "Wasserstein distance") AND ("entropic regularization" OR "Sinkhorn") | 261 |
| 1, layer 1 | ("Gromov-Wasserstein" OR "fused Gromov-Wasserstein") AND ("graph" OR "structured data" OR "point cloud") | 238 |
| 1, layer 1 | ("Wasserstein barycenter" OR "Gromov-Wasserstein dictionary" OR "optimal transport dictionary learning" OR "Wasserstein dictionary learning") AND ("template" OR "atoms" OR "barycentric coordinates") | 194 |
| 1, layer 1 | ("optimal transport" OR "Wasserstein") AND ("medical imaging" OR "MRI" OR "lesion" OR "neuroimaging") AND ("registration-free" OR "without registration" OR "correspondence-free" OR "fusion") | 201 |
| 1, layer 1 | ("permutation invariant" OR "set encoder" OR "Deep Sets" OR "Set Transformer" OR "PointNet") AND ("point cloud" OR "sets" OR "multiple instance learning") | 279 |
| 1, layer 1 | ("image registration" OR "radiomics" OR "lesion segmentation") AND ("deep learning" OR "prediction" OR "outcome") | 298 |
| 1, layer 1 | ("optimal transport" OR "Wasserstein") AND ("point cloud" OR "set" OR "distribution regression") AND ("embedding" OR "kernel" OR "supervised learning") | 281 |
| 1, layer 2 | refs of 10 core papers: Zhou et al. 2013 (76), FGW 2018 (72), template FGW 2022 (79), FUGW 2022 (58), Gramfort et al. 2015 (30), Deep Sets (54), OT embedding 2020 (50), unaligned tensor decomposition 2026 (0), graph dictionary learning 2021 (80), Wasserstein barycentric coordinates 2016 (0) | 499 |
| 1, layer 3 | cited-by of 8 foundational works: Memoli 2011 (100), FGW 2018 (100), Sinkhorn distances 2013 (100), linear optimal transportation 2012 (100), Deep Sets (100), Zhou et al. 2013 (100), template FGW 2022 (38), Gramfort et al. 2015 (98) | 736 |
| 1, layer 4 | the research question as a sentence; 'predicting patient outcome from sets of lesions or point clouds without image registration using optimal transport or permutation invariant networks'; 'learned template or barycenter for supervised learning on unaligned medical images with optimal transport' | 300 |
| 2, layer 1 | ("multiple instance learning" OR "set-based" OR "permutation invariant") AND ("lesions" OR "metastases" OR "nodules") AND ("survival" OR "outcome prediction" OR "treatment response") | 100 |
| 2, layer 1 | ("unsupervised deformable registration" OR "VoxelMorph" OR "learning-based registration") AND ("medical image" OR "MRI") | 197 |
| 2, layer 1 | ("radiomics") AND ("quantitative imaging features" OR "images are more than pictures" OR "radiomics quality score") | 106 |
| 2, layer 1 | ("nnU-Net" OR "U-Net" OR "self-configuring") AND ("biomedical image segmentation") | 138 |
| 2, layer 2 | refs of AMINN 2021 (22), VoxelMorph (80), Gillies et al. 2016 (81) | 183 |
| 3, layer 1 | ("multiple instance learning" OR "set transformer" OR "deep sets" OR "permutation invariant") AND ("lesions" OR "metastases" OR "lymph nodes") AND ("PET" OR "MRI" OR "CT") AND ("patient-level") | 197 |
| 3, layer 1 | ("Gromov-Wasserstein" OR "optimal transport") AND ("inter-subject" OR "across subjects" OR "individual brains") AND ("fMRI" OR "cortical surface" OR "decoding") | 199 |
| 3, layer 3 | cited-by of 26 included works of passes 1 and 2 (the transport, tensor, template and set methods), screened for work of 2024 to 2026 | 1927 |

Indexes left out, with the reason the tool printed:

- Semantic Scholar: "not found" for the Boolean strings of the first and third searches, and "HTTP 429 after 3 retries" for the other layer 1 searches of all three passes. For the layer 4 sentences it printed "HTTP 429 after 3 retries" twice and "not found" once.
- OpenAlex: "HTTP 429 after 3 retries" for the three layer 4 sentences, the four layer 1 searches of pass 2, most refs listings and all eight cited-by listings of pass 1. It answered again from the cited-by listings of pass 3 on.
- arXiv: "not found" for the three layer 4 sentences and the first search of pass 2, and "HTTP 429 after 3 retries" for both layer 1 searches of pass 3.
- Crossref returned 100 records for every layer 1 search, since it does not read the Boolean operators. Its records were screened by title like the others. The strings already combine two or three concept groups, and the full 100 records were taken as Crossref's share.
- The refs listings for the unaligned tensor decomposition (10.1137/24m1692836) and for Wasserstein barycentric coordinates (10.1145/2897824.2925918) returned no records: OpenAlex was left out (HTTP 429) and Semantic Scholar printed "not found".

Search passes and end conditions:

- Pass 1 ran the four layers. Works cited by 3 or more core papers were marked "must include": Memoli 2011, Peyre, Cuturi and Solomon 2016, Computational Optimal Transport, Wasserstein Weisfeiler-Lehman kernels, Sinkhorn distances, fast Wasserstein barycenters, the FGW theory paper and Ktena et al. 2017. A group of graph-kernel benchmark works also reached 3 and was excluded at title screening as tangential, since those works have no spatial mode.
- No foundational work of layer 3 was "possibly outdated": each had citing works from 2024 to 2026.
- Layer 4 overlapped layers 1 to 3 by well under 80 percent, so the search was not saturated after pass 1.
- Pass 2 added the pipeline literature (lesion-set learning, learning-based registration, radiomics, segmentation).
- Pass 3 answered the currency gate, which failed after pass 2 (19 of 59 included sources were from 2022 or later). It searched the last 3 years and checked preprints, tagged as preprints.
- After pass 3, three of the five end conditions hold: the source count (84, minimum 30), saturation of every theme (each theme has 11 or more sources) and the temporal span (foundational works from 2009 to 2015 and 36 sources from 2024 to 2026). Two do not hold: the latest pass added 25 sources to 59, far above 10 percent, and the citation loop did not close, since cited-by listings kept returning new works. The search ended after three passes with three conditions holding.

## 2. Distribution advisory

Distribution advisory:
- Dimension: method
- Concentration: computational (a method with experiments on data) = 60/84 (71.4 percent)
- Advisory: a signal about coverage and not a defect; consider whether the research question warrants broader periods, sites, methods or venue families.
- Search response: ("optimal transport" OR "permutation invariant" OR "multiple instance learning") AND ("external validation" OR "multicenter" OR "prospective") AND ("lesion" OR "point cloud" OR "radiomics"), to add clinical evaluation studies of the methods.

The other method values are 8 quantitative clinical studies, 7 theoretical works, 6 reviews and 3 tool papers. Time does not reach the threshold: 53 of 84 sources are from 2020 to 2026 (63.1 percent) and 30 from 2010 to 2019. No venue family reaches it: 16 of 84 sources are preprints only (19.0 percent), and no single journal or conference holds more than 6 sources. Geography was left out, since a study site or population region is stated for too few sources, most of which are methods papers.

## 3. Screening results

- Initial records: 6772 records from all searches, refs listings and cited-by listings that were screened (4449 in passes 1 and 2, 2323 in pass 3). After duplicates were removed by DOI, arXiv ID or normalized title, 5657 unique records remained.
- After title and abstract screening: 96 candidates (65 in passes 1 and 2, 31 in pass 3). The page's 30 to 50 range is read as scaled to the Literature Review target of 40 to 80 sources.
- After full-text assessment: 84 sources. Twelve candidates were excluded at this stage.
  - No full text and no abstract could be retrieved, so the source could not be assessed: Memoli (2011), Gromov-Wasserstein Distances and the Metric Approach to Object Matching (10.1007/s10208-011-9093-5). Bazeille et al. (2019), Local Optimal Transport for Functional Brain Template Estimation (10.1007/978-3-030-20351-1_18). Zhao et al. (2026), Prediction of postoperative outcomes in spinal cord surgery via fusion of point-cloud geometric features and radiomics (10.1016/j.inffus.2026.104509). Avants et al. (2008), Symmetric diffeomorphic image registration with cross-correlation (10.1016/j.media.2007.06.004). Ma et al. (2025), Sliced Wasserstein graph kernel for measuring global topological similarity of brain functional networks (10.1016/j.patcog.2025.112208). Ceyssens and Faes (2026), Behavior-Supervised Alignment for Cross-Subject Neural Decoding Across Non-Corresponding Electrode Grids (10.2139/ssrn.7083858). Guo et al. (2025), Integrative tensor regression for stratified data with application to neuroimaging analysis (10.1007/s00362-025-01740-8).
  - No text, no abstract and no DOI or arXiv ID: Peyre, Cuturi and Solomon (2016), Gromov-Wasserstein Averaging of Kernel and Distance Matrices. It is listed under "No entry written".
  - Low quality with alternatives in the set: Li, Green and Zhang (2025), Quantile Function-Based Models for Neuroimaging Classification Using Wasserstein Regression (arXiv 2508.21523), scored 7 (one proprietary data set, accuracy up to 98 percent). It was replaced by the distribution-regression and transport-embedding sources of theme 4.
  - Off the research question, since the brain image is the response and no subject-level outcome is predicted from it: Giefer, Ma and Rekabdarkolaee (2025), Employing tensor regression for analyzing the effect of alcohol on the brain. Naji et al. (2026), Bayesian Tensor Regression for Neuroimaging Data (arXiv 2609.27880). Miranda (2024), A canonical polyadic tensor basis for fast Bayesian estimation of multi-subject brain activation patterns.
- Final included sources: 84, with 84 entries in refs.bib. By quality, 65 are High, 19 Medium and none Low.

## 4. Annotated bibliography

Each annotation was written from the abstract or the full text read in this run. The quality line gives the score on the five items of the page (venue, rigor, relevance, citation count, evidence), each from 1 to 3. The citation item is scored from the cited-by listings of this run. A work from 2021 or earlier scores 3 when an index printed "first 100, more exist", 2 for 30 to 99 citing records and 1 below 30. A work from 2022 to 2024 scores 3 for 30 or more, 2 for 10 to 29 and 1 below 10. A work from 2025 or 2026 scores 3 for 5 or more, 2 for 1 to 4 and 1 for none. A preprint whose peer-reviewed venue the index records did not confirm scores 1 on the venue item. The venue item uses a judgment of the journal's standing in its field, since no quartile list was looked up. Under the cs_ml profile an archival preprint is admitted and tagged as such.

### Theme 1. Tensor regression, tensor partial least squares and decompositions with an unaligned mode

### Zhou, Li and Zhu (2013). Tensor Regression with Applications in Neuroimaging Data Analysis.
- **Type**: Journal article (Journal of the American Statistical Association). Evidence type: peer-reviewed statistical methods paper.
- **Method**: Generalized linear model whose coefficient array is constrained to a low-rank CANDECOMP/PARAFAC (CP) form, fitted by block relaxation, with asymptotic theory and regularized estimation. Simulations on 2D shapes and an attention deficit hyperactivity disorder (ADHD) MRI study.
- **Key results**: The CP constraint reduces an ultrahigh-dimensional image covariate to a manageable number of parameters and gives efficient estimation and prediction. The MRI images were preprocessed with standard steps that include segmentation and registration to a template (RAVENS spatial normalization), so the model assumes voxel correspondence across subjects.
- **Relevance**: The reference point for supervised prediction from an image tensor whose spatial mode is aligned by registration. It is the registration route of the research question.
- **Quality**: High (15: venue 3, rigor 3, relevance 3, citations 3, evidence 3). The theory is strong, and the method depends on a common voxel grid.
- **Stance**: Neutral. It supplies the aligned-mode baseline that registration-free methods depart from.
- **Potential use**: Introduction, Literature Review.

### Zhao et al. (2013). Higher Order Partial Least Squares (HOPLS): A Generalized Multilinear Regression Method.
- **Type**: Journal article (IEEE Transactions on Pattern Analysis and Machine Intelligence). Evidence type: peer-reviewed methods paper.
- **Method**: Predicts a tensor from a tensor by projecting both onto a latent space built from a sum of orthogonal Tucker blocks, with loadings found by a higher-order singular value decomposition of a generalized cross-covariance tensor and deflation. Synthetic data and decoding of 3D movement from electrocorticogram (ECoG) signals.
- **Key results**: HOPLS predicted better than the compared methods, handled small sample sizes and was robust to noise. The number of orthogonal loadings acts as the parameter that controls model complexity.
- **Relevance**: The multilinear partial least squares model the research question names. Every mode, the electrode mode included, is fixed and aligned across samples.
- **Quality**: High (14: venue 3, rigor 3, relevance 2, citations 3, evidence 3). Real ECoG data, with aligned channels.
- **Stance**: Neutral.
- **Potential use**: Literature Review, Methodology.

### Kolda and Bader (2009). Tensor Decompositions and Applications.
- **Type**: Journal article (SIAM Review). Evidence type: survey. Admitted as a seminal work (more than 100 citing works in the cited-by listing).
- **Method**: Survey of higher-order tensor decompositions, their applications and software.
- **Key results**: CP and Tucker are presented as the higher-order extensions of the matrix singular value decomposition, and the survey also covers PARAFAC2, INDSCAL, CANDELINC, DEDICOM, PARATUCK2 and nonnegative variants. It lists the N-way Toolbox, the Tensor Toolbox and the Multilinear Engine.
- **Relevance**: Background for the tensor models of theme 1, including PARAFAC2, the decomposition that allows one mode to vary across slices.
- **Quality**: High (12: venue 3, rigor 3, relevance 1, citations 3, evidence 2). A reference survey, with no new data.
- **Stance**: Neutral.
- **Potential use**: Literature Review.

### Li, Xu, Zhou and Li (2018). Tucker Tensor Regression and Neuroimaging Analysis.
- **Type**: Journal article (Statistics in Biosciences). Evidence type: peer-reviewed statistical methods paper.
- **Method**: Generalized linear tensor regression with a Tucker decomposition of the coefficient array, with identifiability and asymptotic theory, regularized estimation, simulations and an ADHD neuroimaging analysis.
- **Key results**: The Tucker model recovered even high-rank signals and is consistent for the best Tucker approximation of the full array model in the Kullback-Leibler sense. It was compared with the CP tensor regression model.
- **Relevance**: A second form of aligned-mode tensor regression on brain images, with the same reliance on a common voxel grid as the CP model.
- **Quality**: High (13: venue 2, rigor 3, relevance 2, citations 3, evidence 3).
- **Stance**: Neutral.
- **Potential use**: Literature Review.

### Zhang and Li (2017). Tensor Envelope Partial Least-Squares Regression.
- **Type**: Journal article (Technometrics). Evidence type: peer-reviewed statistical methods paper.
- **Method**: A tensor partial least squares algorithm with a population model based on envelopes, analytical and numerical comparison with alternatives, simulations and two neuroimaging analyses.
- **Key results**: The population interpretation explains how partial least squares achieves dimension reduction, links it with sufficient dimension reduction and gives asymptotic consistency of the estimator. The method was illustrated on two neuroimaging data sets.
- **Relevance**: The statistical foundation of tensor partial least squares, one of the method families of the research question.
- **Quality**: High (13: venue 3, rigor 3, relevance 2, citations 2, evidence 3).
- **Stance**: Neutral.
- **Potential use**: Literature Review, Methodology.

### Yan, Paynabar and Pacella (2019). Structured Point Cloud Data Analysis Via Regularized Tensor Regression for Process Modeling and Optimization.
- **Type**: Journal article (Technometrics). Evidence type: peer-reviewed methods paper.
- **Method**: Regularized tensor regression and decomposition that link point clouds to process variables, evaluated by simulation and a turning-process case study.
- **Key results**: The tensor regression models captured the variational patterns of point clouds and linked them to controllable process variables. The point clouds are structured: the measurements are taken on a pre-specified grid and the samples were aligned by rotation.
- **Relevance**: Shows that tensor regression on point clouds requires the points to be put on a shared grid first, which is the correspondence the research question asks about.
- **Quality**: High (13: venue 3, rigor 3, relevance 2, citations 2, evidence 3). The application is manufacturing, not medicine.
- **Stance**: Neutral.
- **Potential use**: Literature Review, Discussion.

### Tang, Kolda and Zhang (2026). Tensor Decomposition with Unaligned Observations.
- **Type**: Journal article (SIAM Journal on Matrix Analysis and Applications). Evidence type: peer-reviewed methods paper.
- **Method**: CP decomposition in which the mode with unaligned observations is represented by functions in a reproducing kernel Hilbert space, with a loss for binary, integer and positive data, an optimization algorithm, a stochastic gradient method and a sketching algorithm.
- **Key results**: The decomposition handles subjects observed at different time points, which a tabular tensor cannot represent. It was illustrated on synthetic data and an early-childhood microbiome data set.
- **Relevance**: The direct treatment of an unaligned mode inside a tensor decomposition. The unaligned mode is time, the method is unsupervised, and a spatial version is not given.
- **Quality**: High (14: venue 3, rigor 3, relevance 2, citations 3, evidence 3).
- **Stance**: Supports the position that a mode without correspondence can be modelled directly instead of resampled.
- **Potential use**: Literature Review, Methodology.

### Perros et al. (2017). SPARTan: Scalable PARAFAC2 for Large and Sparse Data.
- **Type**: Conference paper (ACM SIGKDD 2017). Evidence type: peer-reviewed conference paper.
- **Method**: A scalable algorithm for the PARAFAC2 decomposition of large sparse irregular tensors, evaluated on synthetic data and the electronic health records of pediatric patients.
- **Key results**: SPARTan was 22 times faster than the best previous implementation and handled problem sizes for which the baseline failed. Clinical experts endorsed the temporally evolving phenotypes it found.
- **Relevance**: PARAFAC2 is the standard tensor model for subjects whose observations do not align. Here the unaligned mode is time and the use is exploratory.
- **Quality**: High (12: venue 2, rigor 3, relevance 2, citations 2, evidence 3).
- **Stance**: Neutral.
- **Potential use**: Literature Review.

### Ren et al. (2022). MULTIPAR: Supervised Irregular Tensor Factorization with Multi-task Learning.
- **Type**: Archival preprint (arXiv). Evidence type: preprint, admitted under cs_ml.
- **Method**: PARAFAC2 factorization supervised by static and dynamic prediction tasks in a multi-task framework, solved with smooth and proximal updates, evaluated on two temporal electronic health record data sets.
- **Key results**: Supervision by downstream tasks gave better tensor fit, more meaningful subgroups and stronger predictive performance than the compared methods. Static tasks such as in-hospital mortality and dynamic tasks such as the need for ventilation were handled together.
- **Relevance**: A supervised decomposition of a tensor with an unaligned mode, the closest tensor analogue to subject-level prediction without correspondence.
- **Quality**: Medium (10: venue 1, rigor 2, relevance 3, citations 1, evidence 3).
- **Stance**: Supports joint fitting of the decomposition and the predictor.
- **Potential use**: Literature Review, Methodology.

### Patalano, Konyar and Paynabar (2026). PAR2COX: Survival-Informed Tensor Decomposition for Phenotyping and Risk Prediction from Irregular Longitudinal Data.
- **Type**: Archival preprint (arXiv). Evidence type: preprint, admitted under cs_ml.
- **Method**: Joint estimation of a PARAFAC2 decomposition and a Cox proportional hazards model, with patient-specific latent factors as covariates, by alternating optimization. Simulations and a MIMIC-IV case study.
- **Key results**: The joint model gave better risk stratification than the compared approaches. It handles historical patients with observed outcomes and current patients whose outcomes are unknown.
- **Relevance**: A survival outcome predicted from a tensor with an unaligned mode. The unaligned mode is time, not space.
- **Quality**: Medium (10: venue 1, rigor 2, relevance 3, citations 1, evidence 3).
- **Stance**: Supports joint supervised decomposition.
- **Potential use**: Literature Review, Discussion.

### Wang and Huang (2026). A Bayesian Sparse Kronecker Product Decomposition Framework for Tensor Predictors With Mixed-Type Responses: Applications to Neuroimaging Data Mining.
- **Type**: Journal article (Statistical Analysis and Data Mining).
- **Method**: Each coefficient tensor is a low-rank Kronecker product with element-wise shrinkage priors, and Gaussian, Poisson and Bernoulli outcomes share an exponential-family form fitted by Gibbs sampling with Polya-Gamma augmentation. Simulations and ADNI and OASIS MRI.
- **Key results**: The model delivered sharper signal recovery and lower predictive error than low-rank or sparsity-only competitors. Posterior consistency and identifiability are proved when each mode dimension grows subexponentially with the sample size.
- **Relevance**: Current tensor-on-image prediction with voxel-level sparsity. The voxel grid is assumed common to all subjects.
- **Quality**: Medium (11: venue 2, rigor 3, relevance 2, citations 1, evidence 3).
- **Stance**: Neutral.
- **Potential use**: Literature Review.

### He and Li (2026). An ensemble approach to tensor learning.
- **Type**: Journal article (Statistical Methods in Medical Research).
- **Method**: Tensor ensemble learning that partitions the tensor covariate into disjoint blocks, fits CP regression models of different block structures and ranks, and weights them under the predictability, computability and stability framework. Simulations, fundus images for glaucoma and neuroimaging for cognitive ability in Alzheimer's disease.
- **Key results**: The ensemble outperformed existing tensor methods. It accounts for uncertainty in both the CP rank and the block structure, since structural complexity varies across spatial regions.
- **Relevance**: Addresses rank choice in tensor regression on medical images with an aligned spatial mode.
- **Quality**: Medium (11: venue 3, rigor 2, relevance 2, citations 1, evidence 3).
- **Stance**: Neutral.
- **Potential use**: Literature Review.

### Pietrosanu et al. (2026). Regularized Tensor Quantile Regression With Applications to Neuroimaging Data Analysis.
- **Type**: Journal article (Statistics in Medicine).
- **Method**: Linear quantile regression with a scalar response and tensor covariates, regularized through the tensor estimate of a low-dimensional decomposition, with computational and statistical properties. Simulations and a neuroimaging analysis.
- **Key results**: The model was better than existing tensor frameworks when the usual regression assumptions are violated. The real analysis showed interpretability benefits.
- **Relevance**: Extends tensor regression on images to quantile outcomes. The spatial mode is aligned.
- **Quality**: Medium (11: venue 3, rigor 3, relevance 2, citations 1, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Literature Review.

### Konyar and Gahrooei (2025). Semi-Supervised PARAFAC2 Decomposition for Computational Phenotyping Using Electronic Health Records.
- **Type**: Journal article (IEEE Journal of Biomedical and Health Informatics).
- **Method**: A PARAFAC2 decomposition of irregular electronic health record tensors that uses label information available for a subset of patients. Synthetic data and a MIMIC-IV case study.
- **Key results**: The model was better than the benchmarks on both data sets. It adds label information to an irregular-tensor decomposition, which earlier methods used without supervision.
- **Relevance**: Partial supervision of a decomposition with an unaligned mode.
- **Quality**: High (12: venue 3, rigor 2, relevance 2, citations 2, evidence 3).
- **Stance**: Supports supervised decomposition of irregular tensors.
- **Potential use**: Literature Review.

### Huang, Chen and Zhang (2025). Cyclic-Shift Sparse Kronecker Tensor Classifier for Signal-Region Detection in Neuroimaging.
- **Type**: Archival preprint (arXiv). Evidence type: preprint, admitted under cs_ml.
- **Method**: A logistic sparse Kronecker product decomposition with a second, spatially shifted view of the data, with consistency under a restricted isometry condition. Simulations and OASIS-1 and ADNI-1 MRI.
- **Key results**: The cyclic shift improves robustness to misalignment across subjects. The classifier reached strong accuracy and placed its coefficients in regions such as the hippocampus.
- **Relevance**: One of the few tensor classifiers that treats residual misalignment after registration as part of the model.
- **Quality**: High (12: venue 1, rigor 3, relevance 3, citations 2, evidence 3).
- **Stance**: Supports building misalignment tolerance into the tensor model.
- **Potential use**: Literature Review, Methodology.

### Minoccheri, Tesic, Najarian and Stidham (2025). Supervised Coupled Matrix-Tensor Factorization (SCMTF) for Computational Phenotyping of Patient Reported Outcomes in Ulcerative Colitis.
- **Type**: Archival preprint (arXiv). Evidence type: preprint, admitted under cs_ml.
- **Method**: A supervised coupled matrix-tensor factorization that joins temporal patient-reported outcomes and laboratory values with static features to predict medication persistence, trained in a deep learning framework.
- **Key results**: The model handled the large amount of missing patient-reported data. It predicted changes in medication 8 and 20 months ahead with test AUCs of 0.853 and 0.803.
- **Relevance**: Supervised tensor factorization for a patient-level outcome with irregular temporal data.
- **Quality**: Medium (9: venue 1, rigor 2, relevance 2, citations 1, evidence 3).
- **Stance**: Supports supervised factorization.
- **Potential use**: Discussion.

### Theme 2. Entropic optimal transport, Gromov-Wasserstein and fused Gromov-Wasserstein distances

### Cuturi (2013). Sinkhorn Distances: Lightspeed Computation of Optimal Transportation Distances.
- **Type**: Conference paper (Neural Information Processing Systems 2013, per the index record. The entry is the arXiv version). Admitted as a seminal work (more than 100 citing works).
- **Method**: Optimal transport smoothed by an entropic regularization term, computed by Sinkhorn-Knopp matrix scaling. MNIST experiments.
- **Key results**: The regularized optimum is also a distance and is computed several orders of magnitude faster than with transportation solvers. It performed better than classical optimal transport distances on the MNIST benchmark.
- **Relevance**: The computational basis of every transport coupling in the later themes.
- **Quality**: High (12: venue 2, rigor 3, relevance 2, citations 3, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Literature Review, Methodology.

### Peyre and Cuturi (2019). Computational Optimal Transport with Applications to Data Sciences.
- **Type**: Journal article (Foundations and Trends in Machine Learning), monograph length. Evidence type: survey.
- **Method**: Monograph on the theory and algorithms of optimal transport, with chapters on entropic regularization and the Sinkhorn algorithm, Wasserstein barycenters, clustering and dictionary learning, and Gromov-Wasserstein distances with their entropic regularization.
- **Key results**: The Gromov-Wasserstein problem can be approached with entropic regularization, solved by iterated Sinkhorn steps on successive linearizations of the objective. The same entropic machinery gives approximations of barycenters.
- **Relevance**: Reference text for themes 2 and 3.
- **Quality**: High (13: venue 3, rigor 3, relevance 2, citations 3, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Literature Review, Methodology.

### Benamou et al. (2015). Iterative Bregman Projections for Regularized Transportation Problems.
- **Type**: Journal article (SIAM Journal on Scientific Computing). Admitted as a seminal work (more than 100 citing works).
- **Method**: Entropic regularization of transport linear programs written as Kullback-Leibler Bregman projections onto simple constraint sets, solved by iterative Bregman projections or Bregman-Dykstra iterations.
- **Key results**: Barycenters, tomographic reconstruction, multi-marginal transport, partial and unbalanced transport and capacity-constrained transport all reduce to closed-form projections. This gives one algorithm family for barycenters and related problems.
- **Relevance**: The algorithm behind the fixed-support barycenters used as templates in theme 3.
- **Quality**: High (13: venue 3, rigor 3, relevance 2, citations 3, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Feydy et al. (2018). Interpolating between Optimal Transport and MMD using Sinkhorn Divergences.
- **Type**: Conference paper (International Conference on Artificial Intelligence and Statistics, per the index record. The entry is the arXiv version).
- **Method**: Theory of Sinkhorn divergences, which interpolate between maximum mean discrepancy and optimal transport, and a GPU numerical scheme.
- **Key results**: Sinkhorn divergences are positive, convex and metrize the convergence in law. Gradients of the Sinkhorn loss can be computed on the GPU for batches of a million samples.
- **Relevance**: The debiased entropic loss suited to comparing point clouds as measures in a learning objective.
- **Quality**: High (12: venue 2, rigor 3, relevance 2, citations 3, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Montesuma, Mboula and Souloumiac (2025). Recent Advances in Optimal Transport for Machine Learning.
- **Type**: Journal article (IEEE Transactions on Pattern Analysis and Machine Intelligence). Evidence type: survey.
- **Method**: Survey of optimal transport in supervised, unsupervised, transfer and reinforcement learning from 2012 to 2023, and of computational extensions (partial, unbalanced, Gromov and neural transport).
- **Key results**: Optimal transport is used in machine learning both as a loss and as a way to manipulate distributions. The survey covers dictionary learning, domain adaptation and the Gromov extensions.
- **Relevance**: A current map of the transport methods that themes 2 to 4 draw on.
- **Quality**: High (12: venue 3, rigor 2, relevance 2, citations 3, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Introduction, Literature Review.

### Vayer et al. (2018). Optimal Transport for structured data with application on graphs.
- **Type**: Conference paper (International Conference on Machine Learning 2019, per the index record. The entry is the arXiv version).
- **Method**: The fused Gromov-Wasserstein (FGW) distance, which couples a feature cost and a structure cost in one transport problem, with its properties, computation and graph classification and clustering experiments.
- **Key results**: FGW outperformed graph kernels and deep graph convolutional networks on graph classification. Its metric properties allow Frechet means, that is barycenters, of graphs.
- **Relevance**: The distance that compares two subjects whose elements (nodes, regions, lesions) carry both features and positions without a known correspondence.
- **Quality**: High (14: venue 2, rigor 3, relevance 3, citations 3, evidence 3).
- **Stance**: Supports transport couplings in place of a fixed correspondence.
- **Potential use**: Literature Review, Methodology.

### Vayer et al. (2020). Fused Gromov-Wasserstein Distance for Structured Objects.
- **Type**: Journal article (Algorithms). Evidence type: peer-reviewed theory paper.
- **Method**: Mathematical framework of FGW: metric and interpolation properties, geodesics, a concentration result for finite samples, and illustrations including structured barycenters.
- **Key results**: FGW is a metric that interpolates between the Wasserstein and the Gromov-Wasserstein distances. A concentration result is given for the convergence of finite samples.
- **Relevance**: Theory under the FGW-based methods of themes 3 and 5.
- **Quality**: High (12: venue 2, rigor 3, relevance 2, citations 3, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Sejourne, Vialard and Peyre (2020). The Unbalanced Gromov Wasserstein Distance: Conic Formulation and Relaxation.
- **Type**: Conference paper (Neural Information Processing Systems, per the index record. The entry is the arXiv version).
- **Method**: Two unbalanced Gromov-Wasserstein formulations, a divergence solved with entropic regularization by a GPU-friendly scheme and a conic distance, with synthetic and positive-unlabeled domain adaptation experiments.
- **Key results**: The formulations compare metric spaces with arbitrary positive measures up to isometry. The divergence is positive and definite and is solved by a parallel iterative scheme.
- **Relevance**: Unbalanced transport is needed when subjects have different total mass or numbers of elements, as with lesions that appear or disappear.
- **Quality**: High (12: venue 2, rigor 3, relevance 2, citations 3, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Zhang, Goldfeld, Mroueh and Sriperumbudur (2024). Gromov-Wasserstein distances: Entropic regularization, duality and sample complexity.
- **Type**: Journal article (The Annals of Statistics). Evidence type: peer-reviewed theory paper.
- **Method**: Duality theory for the quadratic Gromov-Wasserstein distance between Euclidean spaces of different dimension, standard and entropic, with empirical convergence rates and lower bounds.
- **Key results**: The entropic Gromov-Wasserstein distance converges at the parametric rate n^(-1/2), while the standard distance converges at a dimension-dependent rate with matching lower bounds. Stability in the regularization parameter is proved for costs and couplings.
- **Relevance**: Statistical support for using entropic Gromov-Wasserstein couplings estimated from finite point clouds.
- **Quality**: High (12: venue 3, rigor 3, relevance 1, citations 3, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Togninalli et al. (2019). Wasserstein Weisfeiler-Lehman Graph Kernels.
- **Type**: Conference paper (Neural Information Processing Systems, per the index record. The entry is the arXiv version).
- **Method**: A graph kernel based on the Wasserstein distance between the distributions of Weisfeiler-Lehman node embeddings, for graphs with continuous attributes and weighted edges.
- **Key results**: Treating a graph as the distribution of its node embeddings, instead of their sum or mean, improved prediction on several graph classification tasks. The kernel needs no node correspondence between graphs.
- **Relevance**: A supervised predictor on sets of elements without correspondence, built from a transport distance.
- **Quality**: High (14: venue 2, rigor 3, relevance 3, citations 3, evidence 3). The benchmarks are not medical.
- **Stance**: Supports transport distances over sum or mean pooling.
- **Potential use**: Literature Review.

### Cang, Wu and Zhao (2025). Supervised Gromov-Wasserstein Optimal Transport with Metric-Preserving Constraints.
- **Type**: Journal article (SIAM Journal on Mathematics of Data Science).
- **Method**: Supervised Gromov-Wasserstein (sGW), which admits infinite entries in the cost tensor to enforce pairwise-distance preservation, solved by a minimal vertex cover transfer of constraints and mirror-C descent. Synthetic data and single-cell RNA sequencing alignment.
- **Key results**: sGW controls how far pairwise distances are preserved. This gave automatic estimation of the overlapping parts of data sets and better stability than other Gromov-Wasserstein variants.
- **Relevance**: Constraints on a Gromov-Wasserstein coupling, the kind of prior knowledge a spatial correspondence between subjects can carry.
- **Quality**: High (13: venue 3, rigor 3, relevance 2, citations 3, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Seyedi and Archetti (2026). Conditional Gromov-Wasserstein matching across contexts: theory, regularization, and applications to brain connectivity.
- **Type**: Journal article (Brain Informatics).
- **Method**: Conditional Gromov-Wasserstein in expected, conditional and regularized forms for metric measure spaces whose geometry depends on a context variable, with existence and stability results and a Schrodinger-bridge reading under entropic regularization. Synthetic connectivity-style graphs.
- **Key results**: The formulations recovered a constructed pattern of stable structure with localized rewiring, and the conditional and regularized forms gave smoother alignments than the classical one. No real brain data were used.
- **Relevance**: Gromov-Wasserstein matching when the structure of a subject changes with condition.
- **Quality**: Medium (8: venue 2, rigor 2, relevance 2, citations 1, evidence 1). Synthetic data only.
- **Stance**: Neutral.
- **Potential use**: Discussion.

### Wang and Goldfeld (2026). Neural Entropic Optimal Transport and Gromov-Wasserstein Alignment.
- **Type**: Journal article (IEEE Transactions on Information Theory).
- **Method**: The Sinkhorn step of entropic transport and entropic Gromov-Wasserstein is replaced by a neural network trained on mini-batches, with non-asymptotic error bounds.
- **Key results**: The estimates of cost and plan reach minimax-optimal parametric rates for compactly supported distributions. Experiments confirmed accuracy in high-dimensional, large-sample regimes where Sinkhorn is infeasible.
- **Relevance**: Scaling of entropic couplings to large point clouds such as dense surfaces or many lesions.
- **Quality**: High (12: venue 3, rigor 3, relevance 1, citations 3, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Takeda, Sasaki, Abe and Oizumi (2025). Unsupervised alignment in neuroscience: Introducing a toolbox for Gromov-Wasserstein optimal transport.
- **Type**: Journal article (Journal of Neuroscience Methods). Evidence type: methods and tool paper.
- **Method**: Unsupervised alignment of representations across brains, species and artificial networks by Gromov-Wasserstein optimal transport, with a methodological guide and the GWTune toolbox.
- **Key results**: Gromov-Wasserstein alignment found one-to-one, group-to-group and shifted correspondences without labels. It revealed structural distinctions that supervised alignment methods such as representational similarity analysis overlook.
- **Relevance**: Shows correspondence recovered from internal relations alone, the premise of Gromov-Wasserstein methods for unaligned subjects.
- **Quality**: High (13: venue 3, rigor 2, relevance 2, citations 3, evidence 3).
- **Stance**: Supports transport correspondence in place of an assumed one.
- **Potential use**: Literature Review.

### Theme 3. Barycenters, dictionaries and learnable templates

### Agueh and Carlier (2011). Barycenters in the Wasserstein Space.
- **Type**: Journal article (SIAM Journal on Mathematical Analysis). Admitted as a seminal work (more than 100 citing works).
- **Method**: Mathematical analysis of the Wasserstein barycenter of several measures.
- **Key results**: The paper gives existence, uniqueness, characterizations and regularity of the barycenter and relates it to multimarginal transport. The Gaussian case is solved.
- **Relevance**: The definition of the transport barycenter used as a template in the later work.
- **Quality**: High (12: venue 3, rigor 3, relevance 1, citations 3, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Literature Review.

### Cuturi and Doucet (2013). Fast Computation of Wasserstein Barycenters.
- **Type**: Conference paper (International Conference on Machine Learning, per the index record. The entry is the arXiv version). Admitted as a seminal work (more than 100 citing works).
- **Method**: Two subgradient algorithms for the barycenter of empirical measures, made tractable by entropic smoothing and matrix scaling.
- **Key results**: Smoothing gives a strictly convex objective whose gradients are cheap to compute. The algorithms were used to visualize image families and for constrained clustering.
- **Relevance**: The computation of a mean measure that can serve as a common reference for unaligned subjects.
- **Quality**: High (12: venue 2, rigor 3, relevance 2, citations 3, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Bonneel, Peyre and Cuturi (2016). Wasserstein barycentric coordinates: histogram regression using optimal transport.
- **Type**: Journal article (ACM Transactions on Graphics).
- **Method**: Barycentric coordinates of a histogram with respect to a set of reference histograms, found by backward differentiation through the Sinkhorn barycenter algorithm.
- **Key results**: A histogram is expressed as a Wasserstein barycenter of references, and the weights are recovered at a cost close to that of computing the barycenter. Applications were shape approximation, BRDF acquisition and color editing.
- **Relevance**: The weights of a barycenter of fixed templates form a low-dimensional representation of a subject that a predictor can use.
- **Quality**: High (13: venue 3, rigor 3, relevance 2, citations 3, evidence 2). Graphics applications only.
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Schmitz et al. (2018). Wasserstein Dictionary Learning: Optimal Transport-Based Unsupervised Nonlinear Dictionary Learning.
- **Type**: Journal article (SIAM Journal on Imaging Sciences).
- **Method**: Dictionary learning in which each histogram is reconstructed as an entropic Wasserstein barycenter of learned atoms, with atoms and weights learned by automatic differentiation of the Sinkhorn iterations.
- **Key results**: The atoms and the weights of each data point are estimated together, and the reconstruction is nonlinear in the atoms. The method was illustrated in several image-processing settings.
- **Relevance**: The first learnable transport templates, learned without supervision.
- **Quality**: High (13: venue 3, rigor 3, relevance 2, citations 3, evidence 2).
- **Stance**: Supports learned templates over a fixed reference.
- **Potential use**: Literature Review, Methodology.

### Vincent-Cuaz et al. (2021). Online Graph Dictionary Learning.
- **Type**: Conference paper (International Conference on Machine Learning, per the index record. The entry is the arXiv version).
- **Method**: Graphs modelled as convex combinations of graph atoms under a Gromov-Wasserstein data-fitting term, with atoms learned by an online stochastic algorithm, an extension to labeled graphs and an upper bound for fast approximation.
- **Key results**: The algorithm works on a data set of unregistered graphs with different numbers of nodes. It was shown on unsupervised embedding of graph data sets and online subspace tracking.
- **Relevance**: A dictionary of templates for objects with no node correspondence. The representation is unsupervised.
- **Quality**: High (12: venue 2, rigor 3, relevance 2, citations 2, evidence 3).
- **Stance**: Supports templates learned across unregistered objects.
- **Potential use**: Literature Review.

### Vincent-Cuaz et al. (2022). Template based Graph Neural Network with Optimal Transport Distances.
- **Type**: Conference paper (Neural Information Processing Systems, per the index record. The entry is the arXiv version).
- **Method**: A layer that represents a graph by its vector of FGW distances to a set of template graphs, with the templates learned end to end by differentiating through the layer. Synthetic and real graph classification, ablation and sensitivity study.
- **Key results**: The method was competitive with or better than kernel and graph neural network methods. The templates are learned with the classifier.
- **Relevance**: The supervised learnable-template route of the research question: correspondence is replaced by distances to learned references.
- **Quality**: High (14: venue 2, rigor 3, relevance 3, citations 3, evidence 3).
- **Stance**: Supports learned templates in a supervised model.
- **Potential use**: Literature Review, Methodology.

### Brogat-Motte et al. (2022). Learning to Predict Graphs with Fused Gromov-Wasserstein Barycenters.
- **Type**: Archival preprint (arXiv). The text carries International Conference on Machine Learning keywords, and acceptance was not verified.
- **Method**: Regression with an FGW loss whose prediction is an FGW barycenter with input-dependent weights: a kernel ridge estimator with consistency and excess-risk results, and a parametric model with a neural network for the weights and learned template graphs.
- **Key results**: The method interpolated in the space of labeled graphs on simulated data. It performed very well on a metabolic identification problem with little engineering.
- **Relevance**: Learned barycenter templates used for supervised prediction, here with a structured output.
- **Quality**: High (12: venue 1, rigor 3, relevance 2, citations 3, evidence 3).
- **Stance**: Supports learned barycenter templates.
- **Potential use**: Methodology.

### Zhang et al. (2024). Wasserstein Discriminant Dictionary Learning for Graph Representation.
- **Type**: Journal article (IEEE Transactions on Pattern Analysis and Machine Intelligence).
- **Method**: A graph dictionary of optimizable keys, a Wasserstein graph representation that projects input graphs onto the dictionary, and a Wasserstein discriminant loss that makes keys of one class compact and keys of different classes dispersed.
- **Key results**: The discriminant loss on the dictionary avoids computing global Wasserstein centers of the classes. A joint embedding models node and edge relationships.
- **Relevance**: Templates learned with a class-discriminant objective, the supervised counterpart of transport dictionary learning.
- **Quality**: High (13: venue 3, rigor 3, relevance 3, citations 1, evidence 3).
- **Stance**: Supports discriminant learned templates.
- **Potential use**: Methodology.

### Mialon et al. (2020). A Trainable Optimal Transport Embedding for Feature Aggregation and its Relationship to Attention.
- **Type**: Conference paper (International Conference on Learning Representations, per the index record. The entry is the arXiv version).
- **Method**: A fixed-size embedding of a set that aggregates its elements according to the optimal transport plan to a trainable reference, trainable end to end or without supervision.
- **Key results**: The method reached state-of-the-art results for protein fold recognition and chromatin profile detection. The aggregation can be read as an attention layer or as a surrogate of a transport kernel.
- **Relevance**: A learned reference that handles the missing correspondence inside a set encoder.
- **Quality**: High (13: venue 2, rigor 3, relevance 3, citations 2, evidence 3).
- **Stance**: Supports a learned transport reference.
- **Potential use**: Literature Review, Methodology.

### Chen et al. (2020). Optimal Transport Graph Neural Networks.
- **Type**: Archival preprint (arXiv). Evidence type: preprint, admitted under cs_ml.
- **Method**: Graph embeddings given by Wasserstein distances between the set of node embeddings and learned prototype point clouds, with a universal approximation result and a noise-contrastive regularizer against collapse.
- **Key results**: The model outperformed common methods on several molecular property prediction tasks. Unlike sum aggregation, the prototype-distance function class satisfies a universal approximation theorem.
- **Relevance**: Learned prototype point clouds as templates for supervised prediction from sets.
- **Quality**: High (12: venue 1, rigor 3, relevance 3, citations 2, evidence 3).
- **Stance**: Supports learned prototypes over sum pooling.
- **Potential use**: Methodology.

### Beier and Beinert (2025). Tangential Fixpoint Iterations for Gromov-Wasserstein Barycenters.
- **Type**: Journal article (SIAM Journal on Imaging Sciences).
- **Method**: A characterization of Gromov-Wasserstein barycenters in the tangent space and a relaxed fixpoint iteration with multi-marginal plans.
- **Key results**: The relaxed iteration decreases the barycenter loss monotonically. In some cases it gives barycentric embeddings, and it produced shape interpolations.
- **Relevance**: An algorithm for a Gromov-Wasserstein template of objects with no common embedding.
- **Quality**: High (13: venue 3, rigor 3, relevance 2, citations 3, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Theme 4. Permutation-invariant set encoders and transport embeddings

### Zaheer et al. (2017). Deep Sets.
- **Type**: Conference paper (Neural Information Processing Systems, per the index records. The entry is the arXiv version).
- **Method**: A characterization of permutation-invariant functions on sets and a network architecture built from it, with conditions for permutation equivariance. Experiments on population statistics, point cloud classification, set expansion and outlier detection.
- **Key results**: Every permutation-invariant function belongs to a family with a special sum-decomposition structure. The architecture applies to supervised and unsupervised tasks on sets.
- **Relevance**: The permutation-invariance route of the research question.
- **Quality**: High (14: venue 2, rigor 3, relevance 3, citations 3, evidence 3).
- **Stance**: Supports permutation invariance as the treatment of the missing order.
- **Potential use**: Introduction, Literature Review.

### Qi, Su, Mo and Guibas (2017). PointNet: Deep Learning on Point Sets for 3D Classification and Segmentation.
- **Type**: Conference paper (IEEE Conference on Computer Vision and Pattern Recognition 2017).
- **Method**: A network that consumes point clouds directly and respects the permutation invariance of the points, for classification, part segmentation and scene parsing, with analysis of robustness.
- **Key results**: PointNet performed on par with or better than the state of the art. It avoids converting point clouds to voxel grids or image collections.
- **Relevance**: The standard encoder for point clouds without correspondence.
- **Quality**: High (14: venue 2, rigor 3, relevance 3, citations 3, evidence 3).
- **Stance**: Supports direct permutation-invariant encoding.
- **Potential use**: Literature Review.

### Lee et al. (2018). Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks.
- **Type**: Archival preprint (arXiv). The text uses the International Conference on Machine Learning template, and acceptance was not verified.
- **Method**: An attention-based encoder and decoder for sets, with an inducing-point attention that reduces self-attention cost from quadratic to linear in the set size.
- **Key results**: The model performed better than recent methods on several set-structured tasks. Attention models interactions among the elements of the set.
- **Relevance**: A set encoder that models interactions between elements, used for lesion sets in theme 5.
- **Quality**: High (12: venue 1, rigor 3, relevance 3, citations 3, evidence 2).
- **Stance**: Supports permutation invariance with element interactions.
- **Potential use**: Literature Review.

### Ilse, Tomczak and Welling (2018). Attention-based Deep Multiple Instance Learning.
- **Type**: Archival preprint (arXiv. Also held in an institutional repository). Evidence type: preprint, admitted under cs_ml.
- **Method**: Multiple instance learning with the bag label probability parameterized by neural networks and an attention-based permutation-invariant aggregation.
- **Key results**: The method matched the best multiple instance learning methods on benchmark data and outperformed them on an MNIST-based data set and two histopathology data sets. The attention weights show each instance's contribution to the bag label.
- **Relevance**: The bag-level supervised learner that the lesion-set studies of theme 5 adopt.
- **Quality**: High (13: venue 1, rigor 3, relevance 3, citations 3, evidence 3).
- **Stance**: Supports permutation-invariant aggregation with interpretable weights.
- **Potential use**: Literature Review, Methodology.

### Naderializadeh et al. (2021). Set Representation Learning with Generalized Sliced-Wasserstein Embeddings.
- **Type**: Archival preprint (arXiv). Evidence type: preprint, admitted under cs_ml.
- **Method**: Elements of a set are treated as samples from a measure, and an exact Euclidean embedding of generalized sliced-Wasserstein distances is used as the pooling.
- **Key results**: The framework performed better than the compared set representation methods on supervised and unsupervised set learning tasks. It is geometrically interpretable.
- **Relevance**: Joins the transport route and the permutation-invariance route in one pooling operator.
- **Quality**: Medium (10: venue 1, rigor 2, relevance 3, citations 1, evidence 3).
- **Stance**: Supports transport-based pooling.
- **Potential use**: Methodology.

### Moosmuller and Cloninger (2022). Linear optimal transport embedding: provable Wasserstein classification for certain rigid transformations and perturbations.
- **Type**: Journal article (Information and Inference: A Journal of the IMA). Evidence type: peer-reviewed theory paper.
- **Method**: Analysis of the linear optimal transport (LOT) embedding, which maps each distribution to its transport map from a fixed reference.
- **Key results**: LOT makes families of distributions generated by shifts, scalings and perturbations linearly separable in any dimension. Its L2 distance is nearly isometric to the Wasserstein-2 distance under stated conditions, so N transport maps give the N^2 pairwise distances.
- **Relevance**: Theory for a fixed-reference embedding that turns unaligned point clouds into vectors for a standard classifier.
- **Quality**: High (14: venue 3, rigor 3, relevance 3, citations 3, evidence 2).
- **Stance**: Supports the reference-embedding route.
- **Potential use**: Methodology.

### Wang et al. (2012). A Linear Optimal Transportation Framework for Quantifying and Visualizing Variations in Sets of Images.
- **Type**: Journal article (International Journal of Computer Vision). Admitted as a seminal work (more than 100 citing works).
- **Method**: The linear optimal transportation (LOT) distance, a linearized Kantorovich-Wasserstein metric computed on pixel intensities, with an isometric linear embedding.
- **Key results**: LOT computes all pairwise distances in a large image database efficiently and gives a linear embedding for visualizing class differences. It was applied to nuclear chromatin patterns in cancer cells, facial expressions, galaxy morphologies and subcellular protein distributions.
- **Relevance**: The origin of transport embeddings for supervised analysis of images without registration.
- **Quality**: High (15: venue 3, rigor 3, relevance 3, citations 3, evidence 3).
- **Stance**: Supports transport embedding.
- **Potential use**: Literature Review.

### Mahan, Moosmuller and Cloninger (2024). Point Cloud Classification via Deep Set Linearized Optimal Transport.
- **Type**: Archival preprint (arXiv). Evidence type: preprint, admitted under cs_ml.
- **Method**: Input convex neural networks approximate transport maps from a fixed reference, and a weighting network makes a permutation-invariant classifier of point clouds.
- **Key results**: Euclidean distances between samples from the networks approximate Wasserstein-2 distances under stated conditions. The method was better than a standard deep set on a flow cytometry data set with few labeled point clouds.
- **Relevance**: A patient-level classifier on point clouds that combines the transport embedding and the set encoder.
- **Quality**: Medium (9: venue 1, rigor 2, relevance 3, citations 1, evidence 2). One data set.
- **Stance**: Supports transport embeddings for small labeled samples.
- **Potential use**: Methodology.

### Meunier, Pontil and Ciliberto (2022). Distribution Regression with Sliced Wasserstein Kernels.
- **Type**: Conference paper (International Conference on Machine Learning 2022, per the index record. The entry is the arXiv version).
- **Method**: Kernel ridge regression on a sliced-Wasserstein representation of input distributions, with universal consistency and excess-risk bounds.
- **Key results**: The estimator is universally consistent with excess-risk bounds. Preliminary experiments compared it with estimators based on maximum mean discrepancy.
- **Relevance**: The statistical framing of subject-level prediction from a sample of points as distribution regression.
- **Quality**: High (12: venue 2, rigor 3, relevance 3, citations 2, evidence 2). The experiments are preliminary.
- **Stance**: Supports transport over kernel mean embeddings.
- **Potential use**: Methodology, Discussion.

### Shifat-E-Rabbi et al. (2025). Linear Optimal Transport Subspaces for Point Set Classification.
- **Type**: Journal article (Journal of Mathematical Imaging and Vision).
- **Method**: The LOT transform embeds point sets linearly, and a nearest-subspace classifier in LOT space handles affine and related deformations.
- **Key results**: The LOT transform makes the data space convex for these deformations and simplifies point set classification. The method is label efficient, non-iterative, needs no hyper-parameter tuning and reached accuracy comparable with state-of-the-art methods when the data follow its generative model.
- **Relevance**: A transport embedding for unordered point sets that builds invariance to spatial deformation into the representation.
- **Quality**: High (12: venue 3, rigor 3, relevance 3, citations 1, evidence 2).
- **Stance**: Supports reference embeddings over learned set encoders for small samples.
- **Potential use**: Methodology.

### Beckmann, Beinert and Bresch (2026). Normalized Radon Cumulative Distribution Transforms for Invariance and Robustness in Optimal Transport Based Image Classification.
- **Type**: Journal article (SIAM Journal on Imaging Sciences).
- **Method**: Sensitivity analysis of the max-normalized Radon cumulative distribution transform and a mean-normalized version, related to sliced Wasserstein distances.
- **Key results**: Linear separability is stable when the Wasserstein-infinity distance between samples is controlled. The mean-normalized version relates robustness to the Wasserstein-2 distance and covers deformations such as impulsive noise.
- **Relevance**: Conditions under which transport features keep classes separable under deformations, which a registration step would otherwise remove.
- **Quality**: High (13: venue 3, rigor 3, relevance 2, citations 3, evidence 2).
- **Stance**: Supports transport features under deformation.
- **Potential use**: Methodology.

### Wang et al. (2025). Linearized Optimal Transport for Analysis of High-Dimensional Point-Cloud and Single-Cell Data.
- **Type**: Archival preprint (arXiv). Evidence type: preprint, admitted under cs_ml.
- **Method**: The LOT framework embeds each patient's irregular point cloud of cells into a fixed-dimensional Euclidean space, used for classification and for synthetic data generation.
- **Key results**: LOT gave accurate and interpretable classification of COVID-19 patient states, with classifier weights that map back to markers and regions. The embedding also forms a registration between any two patients, and LOT barycenters gave averaged cellular profiles.
- **Relevance**: Patient-level prediction from point clouds through a reference embedding, with an explicit statement that the embedding acts as a registration.
- **Quality**: Medium (11: venue 1, rigor 2, relevance 3, citations 2, evidence 3).
- **Stance**: Supports the reference-embedding route.
- **Potential use**: Literature Review, Methodology.

### Pathan et al. (2026). FlowLOT: Linearized Optimal Transport for Flow Cytometry Analysis.
- **Type**: Archival preprint (arXiv). Evidence type: preprint, admitted under cs_ml.
- **Method**: Each patient's flow cytometry sample is an empirical distribution of cells mapped by LOT to a fixed-length vector for classification, visualization and quantitative inference.
- **Key results**: With 16 patients per class on FlowCAP-II and 8 per class on BLAST110, it reached balanced accuracies of 94.3 and 98.0 percent for healthy against acute myeloid leukemia. Residual disease estimation correlated at 0.82 on held-out samples and 0.79 under cross-data-set transfer.
- **Relevance**: A few-shot patient-level predictor on unordered point clouds.
- **Quality**: Medium (10: venue 1, rigor 2, relevance 3, citations 1, evidence 3).
- **Stance**: Supports transport embeddings for small cohorts.
- **Potential use**: Discussion.

### Theme 5. Medical-imaging pipelines and transport-based alternatives to registration

### Gramfort, Peyre and Cuturi (2015). Fast Optimal Transport Averaging of Neuroimaging Data.
- **Type**: Conference paper (Information Processing in Medical Imaging 2015). Admitted as a seminal work (more than 100 citing works).
- **Method**: Kantorovich means of non-normalized data on voxel grids or cortical triangulations, linked to entropic Wasserstein barycenters. Simulations, fMRI data from 20 subjects and MEG data from 16 subjects.
- **Key results**: The algorithm averages data whose effects of interest do not overlap across subjects, without the spatial smoothing used before linear group averaging. It is a smooth convex problem with convergence guarantees. The data are on a common cortical surface (FreeSurfer fsaverage 5).
- **Relevance**: The first transport barycenter of neuroimaging data used as a group template.
- **Quality**: High (13: venue 2, rigor 3, relevance 2, citations 3, evidence 3).
- **Stance**: Supports transport averaging over smoothing and linear averaging.
- **Potential use**: Literature Review.

### Gerber, Niethammer, Styner and Aylward (2018). Exploratory Population Analysis with Unbalanced Optimal Transport.
- **Type**: Conference paper (MICCAI 2018).
- **Method**: Unbalanced optimal transport morphometry that produces per-subject images of mass allocation and transport cost from white and gray matter segmentations, followed by voxelwise correlation with clinical variables. OASIS brain MRI.
- **Key results**: The method separated changes in mass from changes in the location of mass, and it found dementia-related changes that voxel-based morphometry did not find. It increased the explanatory power of regression on clinical variables compared with voxel-based morphometry.
- **Relevance**: Transport features that reduce the sensitivity of a subject-level analysis to misalignment, built on a segmentation step.
- **Quality**: High (12: venue 2, rigor 3, relevance 3, citations 1, evidence 3).
- **Stance**: Supports transport features over voxelwise comparison.
- **Potential use**: Literature Review, Discussion.

### Gerber et al. (2023). Optimal transport features for morphometric population analysis.
- **Type**: Journal article (Medical Image Analysis).
- **Method**: An unbalanced optimal transport feature-extraction step added to volumetric morphometric analysis. OASIS-1 study of Alzheimer's disease.
- **Key results**: The transport features increased statistical power for spatially dispersed tissue loss and reduced sensitivity to shifts from spatial misalignment or differences in brain topology. They identified tissue changes not otherwise measurable.
- **Relevance**: Direct evidence that a transport step reduces dependence on exact registration in a medical population analysis.
- **Quality**: High (13: venue 3, rigor 3, relevance 3, citations 1, evidence 3).
- **Stance**: Supports transport features as a complement to registration.
- **Potential use**: Literature Review, Discussion.

### Thual et al. (2022). Aligning Individual Brains with Fused Unbalanced Gromov Wasserstein.
- **Type**: Conference paper (Advances in Neural Information Processing Systems 35).
- **Method**: Fused unbalanced Gromov-Wasserstein (FUGW) alignment of cortical surfaces on functional signatures, with a penalty on large deformations of topography and unbalanced mass for areas of different size.
- **Key results**: FUGW performed whole-brain landmark-free alignment and increased between-subject correlation of activity on independent functional data. It led to more precise mapping at the group level.
- **Relevance**: A transport coupling that replaces anatomical registration between subjects.
- **Quality**: High (14: venue 2, rigor 3, relevance 3, citations 3, evidence 3).
- **Stance**: Supports transport alignment over template registration.
- **Potential use**: Literature Review, Methodology.

### Mazelet et al. (2026). Learning fMRI activations dictionaries across individual geometries via optimal transport.
- **Type**: Archival preprint (arXiv). Evidence type: preprint, admitted under cs_ml.
- **Method**: Dictionary learning on fMRI graphs with the FGW distance, amortized by a neural network that predicts approximate transport plans, and atoms that depend on the FGW trade-off parameter. Human Connectome Project data.
- **Key results**: The approach captured different levels of geometric variability and kept the information needed for downstream tasks. Amortization reduced the cost of computing many FGW distances on large graphs.
- **Relevance**: Learned transport templates on individual brain geometries, without projection to a common template.
- **Quality**: Medium (10: venue 1, rigor 2, relevance 3, citations 1, evidence 3).
- **Stance**: Supports learned templates over projection to a common template.
- **Potential use**: Literature Review, Methodology.

### Qahqaie et al. (2026). Unbalanced Optimal Transport for Robust Longitudinal Lesion Evolution with Registration-Aware and Appearance-Guided Priors.
- **Type**: Conference paper (IEEE International Symposium on Biomedical Imaging 2026).
- **Method**: Lesion correspondence across longitudinal CT cast as unbalanced optimal transport over lesion instances, with a cost from size-normalized geometry, registration trust from the deformation Jacobian and patch appearance, and relative pruning of the plan.
- **Key results**: The matcher gave higher edge-detection precision and recall, better lesion-state recall and better lesion-graph component F1 than distance-only baselines. It handles new, disappearing, merging and splitting lesions without retraining.
- **Relevance**: A transport coupling between sets of lesions that builds on a registration step instead of trusting it fully.
- **Quality**: High (12: venue 2, rigor 2, relevance 3, citations 2, evidence 3).
- **Stance**: Supports transport couplings for lesion sets.
- **Potential use**: Literature Review, Methodology.

### Kan et al. (2026). 3D Transport-based Morphometry (3D-TBM) for medical image analysis.
- **Type**: Archival preprint (arXiv). Evidence type: tool paper, admitted under cs_ml.
- **Method**: A tool for transport-based morphometry of 3D medical images: preprocessing, computation of transport embeddings, visualization of main transport directions and discriminant directions.
- **Key results**: The invertible transport embedding allows classification and regression in the transport domain and the projection of results back to image space. The source code is public in PyTransKit.
- **Relevance**: Tooling for the transport-embedding route in clinical imaging.
- **Quality**: Medium (9: venue 1, rigor 2, relevance 3, citations 2, evidence 1). No new empirical results are reported in the abstract.
- **Stance**: Supports transport-based morphometry.
- **Potential use**: Methodology.

### Xu and Chen (2023). Multimodal Optimal Transport-based Co-Attention Transformer with Global Structure Consistency for Survival Prediction.
- **Type**: Conference paper (IEEE/CVF International Conference on Computer Vision 2023).
- **Method**: Optimal transport matches whole-slide-image patches and gene embeddings to select informative patches and to act as co-attention, approximated by unbalanced mini-batch transport.
- **Key results**: The method was better than the compared methods on five benchmark data sets. The transport co-attention captures global structure consistency between histology and genomics.
- **Relevance**: Survival prediction from an unordered set of image patches through a transport coupling.
- **Quality**: High (14: venue 2, rigor 3, relevance 3, citations 3, evidence 3).
- **Stance**: Supports transport co-attention over dense local co-attention.
- **Potential use**: Literature Review.

### Balakrishnan et al. (2019). VoxelMorph: A Learning Framework for Deformable Medical Image Registration.
- **Type**: Journal article (IEEE Transactions on Medical Imaging).
- **Method**: A convolutional network that maps an image pair to a deformation field, trained unsupervised on intensity matching or with auxiliary segmentations.
- **Key results**: The unsupervised model was as accurate as state-of-the-art methods and orders of magnitude faster. Training with auxiliary segmentations improved accuracy at test time.
- **Relevance**: The learning-based registration step that registration-free methods remove or build on.
- **Quality**: High (14: venue 3, rigor 3, relevance 2, citations 3, evidence 3).
- **Stance**: Opposes in part: it makes registration fast enough to keep it in the pipeline.
- **Potential use**: Introduction, Literature Review.

### Sotiras, Davatzikos and Paragios (2013). Deformable Medical Image Registration: A Survey.
- **Type**: Journal article (IEEE Transactions on Medical Imaging). Evidence type: survey. Admitted as a seminal work (more than 100 citing works).
- **Method**: Systematic survey of deformable registration methods by component.
- **Key results**: Deformable registration serves multi-modality fusion, longitudinal studies and population modeling with statistical atlases. The survey studies the components of registration methods one by one.
- **Relevance**: Background on the registration step and its uses in population analysis.
- **Quality**: High (12: venue 3, rigor 2, relevance 2, citations 3, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Introduction.

### Hu et al. (2019). Conditional Segmentation in Lieu of Image Registration.
- **Type**: Conference paper (MICCAI 2019).
- **Method**: The location of image-specific regions of interest defined in one image is learned in another image by a conditional segmentation network. MRI to ultrasound registration of the prostate.
- **Key results**: The median target registration error was 2.1 mm. Errors were more than 34 percent lower than with a network that predicts the spatial transformation, trained on the same data.
- **Relevance**: Shows that when only regions matter, dense registration can be replaced by a region-level correspondence.
- **Quality**: High (13: venue 2, rigor 3, relevance 3, citations 2, evidence 3).
- **Stance**: Supports removing dense registration when only regions are needed.
- **Potential use**: Literature Review, Discussion.

### Gillies, Kinahan and Hricak (2016). Radiomics: Images Are More than Pictures, They Are Data.
- **Type**: Journal article (Radiology). Evidence type: narrative report.
- **Method**: Report on the process of radiomics, its challenges and its potential.
- **Key results**: The report describes radiomics as a route to better clinical decisions, in particular in cancer care. Only the one-sentence abstract was available.
- **Relevance**: The definition of the radiomics step that set-based methods build on.
- **Quality**: High (12: venue 3, rigor 2, relevance 2, citations 3, evidence 2). Only the abstract was read.
- **Stance**: Neutral.
- **Potential use**: Introduction.

### van Griethuysen et al. (2017). Computational Radiomics System to Decode the Radiographic Phenotype.
- **Type**: Journal article (Cancer Research). Evidence type: tool paper.
- **Method**: PyRadiomics, an open-source platform for extracting engineered features from medical images, demonstrated on lung lesions.
- **Key results**: The lack of standard algorithm definitions and image processing hampers the reproducibility of radiomics. PyRadiomics is offered as a reference standard for radiomic analyses.
- **Relevance**: The standard per-lesion feature extractor used by the lesion-set studies.
- **Quality**: High (14: venue 3, rigor 3, relevance 2, citations 3, evidence 3).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Isensee et al. (2020). nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation.
- **Type**: Journal article (Nature Methods).
- **Method**: A segmentation framework that configures preprocessing, architecture, training and postprocessing automatically from data set properties.
- **Key results**: Without manual tuning, nnU-Net surpassed most specialised pipelines in 19 public competitions and set a new state of the art in most of 49 tasks. It is available as an open-source tool.
- **Relevance**: The lesion-segmentation step that produces the sets of lesions the other methods consume.
- **Quality**: High (14: venue 3, rigor 3, relevance 2, citations 3, evidence 3).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Quellec et al. (2017). Multiple-Instance Learning for Medical Image and Video Analysis.
- **Type**: Journal article (IEEE Reviews in Biomedical Engineering). Evidence type: review with meta-analysis.
- **Method**: Review of how medical image and video tasks are modelled as multiple instance learning problems, with compiled experiments.
- **Key results**: Multiple instance learning learns from global labels without manual segmentations. In the compiled experiments it was more accurate than single-instance learning in many cases.
- **Relevance**: Evidence for the set-level supervised route in medical imaging.
- **Quality**: High (14: venue 3, rigor 3, relevance 3, citations 3, evidence 2).
- **Stance**: Supports set-level learning.
- **Potential use**: Literature Review.

### Chen, Cheung, Milot and Martel (2021). AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases.
- **Type**: Conference paper (MICCAI 2021).
- **Method**: An autoencoder jointly trained with a multiple instance network that aggregates radiomic features of all liver metastases of a patient, with two-step normalization of skewed features. Contrast-enhanced MRI.
- **Key results**: AMINN reached an area under the ROC curve of 0.70, 11.4 percent higher than the best baseline. Ablations showed the value of using all lesions and the normalization.
- **Relevance**: Subject-level outcome prediction from a set of lesions without inter-patient correspondence.
- **Quality**: Medium (11: venue 2, rigor 2, relevance 3, citations 1, evidence 3). One cohort.
- **Stance**: Supports using all lesions as a set.
- **Potential use**: Literature Review, Discussion.

### Karimzadeh et al. (2026). Revisiting multi-nodal radiomics with advanced feature learning for lymphoma classification: a multi-center study.
- **Type**: Journal article (Physics in Medicine and Biology).
- **Method**: Each patient is an unordered set of lesion-level PET radiomic vectors (107 PyRadiomics features), optionally with demographics and node centers after rigid registration to a common space. Pooled tabular baselines compared with Transformer, Deep Sets, multiple instance learning, Set Transformer and a graph model. 151 patients in center 1 and 80 in an external center, with test-time adaptation.
- **Key results**: Adding demographic and spatial features improved discrimination, with ROC-AUC up to 0.91 on center 1. External evaluation showed a domain shift, and test-time adaptation (TENT) raised the Transformer from ROC-AUC 0.81 to 0.87.
- **Relevance**: A direct comparison of set encoders on lesion sets, with registration kept only for node coordinates.
- **Quality**: High (13: venue 3, rigor 3, relevance 3, citations 1, evidence 3).
- **Stance**: Supports set encoders. It shows the cross-center shift they face.
- **Potential use**: Literature Review, Discussion.

### Jajroudi et al. (2026). A deep learning framework for lesion-level treatment response prediction in hodgkin lymphoma using PET/CT tensor radiomics.
- **Type**: Journal article (EJNMMI Physics).
- **Method**: Tensor radiomics features computed over several bin widths for PET and CT, 13,790 features per lesion, 420 lesions from 70 patients, analysed with random forest, XGBoost, support vector machine and the TR-NET network, with SHAP explanations.
- **Key results**: TR-NET reached an AUC of 0.847 with sensitivity 82.2 percent and specificity 78.2 percent. The classical models had high sensitivity and lower specificity.
- **Relevance**: The radiomics step at lesion level. Prediction is per lesion, with no patient-level set model.
- **Quality**: Medium (10: venue 2, rigor 2, relevance 2, citations 1, evidence 3). 70 patients, and no external cohort is named in the abstract.
- **Stance**: Neutral. It refines the per-lesion feature step.
- **Potential use**: Methodology.

### Chang and Jung (2020). Automatic cardiac MRI segmentation and permutation-invariant pathology classification using deep neural networks and point clouds.
- **Type**: Journal article (Neurocomputing).
- **Method**: A YOLO detector and a fully convolutional network segment the left and right ventricles and the myocardium. 3D surfaces are reconstructed and sampled as point clouds, which a permutation-invariant diagnosis network classifies.
- **Key results**: The segmentation was comparable with existing methods. The point-cloud classifier reached 92 percent accuracy on the test set.
- **Relevance**: A pipeline in which segmentation feeds a point cloud to a permutation-invariant classifier, so that no registration between subjects is needed.
- **Quality**: High (13: venue 3, rigor 2, relevance 3, citations 2, evidence 3).
- **Stance**: Supports segmentation followed by set-based classification.
- **Potential use**: Literature Review, Methodology.

### Ktena et al. (2017). Distance Metric Learning Using Graph Convolutional Networks: Application to Functional Brain Networks.
- **Type**: Conference paper (MICCAI 2017).
- **Method**: A siamese spectral graph convolutional network that learns a similarity metric between functional brain graphs. ABIDE data, with mean time series extracted from the 110 regions of the Harvard-Oxford atlas.
- **Key results**: The learned metric improved a k-nearest-neighbour classifier by 11.9 percent over a traditional distance. The graphs share their node set because every subject is parcellated with the same atlas.
- **Relevance**: The atlas-registration route: correspondence of regions is imposed before learning on graphs.
- **Quality**: High (13: venue 2, rigor 3, relevance 2, citations 3, evidence 3).
- **Stance**: Neutral. It shows the aligned-node setting that transport methods relax.
- **Potential use**: Literature Review.

### Xiao et al. (2025). Optimal Transport for Brain-Image Alignment: Unveiling Redundancy and Synergy in Neural Information Processing.
- **Type**: Conference paper (IEEE/CVF International Conference on Computer Vision 2025).
- **Method**: A transport plan between brain voxel embeddings and image embeddings replaces mean squared error alignment, with control of the transported mass, and the aligned brain signals are fed to a large language model for brain captioning.
- **Key results**: The approach reached the best results on ten metrics, 6.11 percent above the previous best method on average in single-subject training and 3.81 percent in cross-subject training. Region masking showed redundancy and synergy in brain information.
- **Relevance**: A transport coupling used for cross-subject decoding, where voxel-wise matching is too local.
- **Quality**: High (13: venue 2, rigor 3, relevance 2, citations 3, evidence 3).
- **Stance**: Supports transport alignment over point-wise losses.
- **Potential use**: Discussion.

### Shifat-E-Rabbi et al. (2025). Quantifying Nuclear Structures of Digital Pathology Images Across Cancers Using Transport-Based Morphometry.
- **Type**: Journal article (Cytometry Part A).
- **Method**: Transport-based morphometry represents the chromatin structure of each nucleus relative to a template nucleus. Data from TCGA and the Human Protein Atlas across liver, thyroid, mesothelium and skin tumors.
- **Key results**: The model was robust to different staining patterns and imaging protocols. It found morphological differences that distinguish benign from malignant nuclei across cancer types.
- **Relevance**: A template-relative transport representation in a clinical imaging setting, with the template fixed instead of learned.
- **Quality**: High (13: venue 3, rigor 2, relevance 2, citations 3, evidence 3).
- **Stance**: Supports transport morphometry.
- **Potential use**: Literature Review.

### Lopes et al. (2024). Cell Classification Based on Superpixel Segmentation and Transport-Based Morphometry.
- **Type**: Conference paper (SIBGRAPI 2024).
- **Method**: Superpixel generation, color filtering and cell segmentation of immunohistochemistry images, followed by transport-based classification.
- **Key results**: The method outperformed the compared cell classification methods. It needed only 10 positive and 10 negative cell samples for training.
- **Relevance**: A segmentation step followed by a transport classifier, at cell level.
- **Quality**: Medium (8: venue 1, rigor 2, relevance 2, citations 1, evidence 2). A small training sample.
- **Stance**: Supports transport classification after segmentation.
- **Potential use**: Discussion.

### Barbarant, Meyniel and Thirion (2026). Functional Templates in fMRI: Building Accurate and Interpretable Group-Level Decoders.
- **Type**: Preprint (bioRxiv). Evidence type: preprint, admitted under cs_ml.
- **Method**: Comparison of functional alignment methods (optimal transport, Procrustes, ridge regression, shared response model) and template strategies (in-sample, out-of-sample, pairwise) for cross-subject task decoding over several tasks and data sets.
- **Key results**: Population templates built with optimal transport gave the highest decoding accuracy. They were not significantly biased by individual subjects and preserved cortical signal topography.
- **Relevance**: The most direct comparison found of a learned transport template against other alignment routes for supervised decoding across subjects.
- **Quality**: Medium (11: venue 1, rigor 3, relevance 3, citations 1, evidence 3).
- **Stance**: Supports transport templates over anatomical registration alone.
- **Potential use**: Literature Review, Discussion.

### Koch et al. (2026). Probabilistic mouse-human brain correspondence by multimodal optimal transport.
- **Type**: Preprint (bioRxiv). Evidence type: preprint, admitted under cs_ml.
- **Method**: OTTER learns a parcel-resolution probabilistic coupling between mouse and human brains by multimodal fused Gromov-Wasserstein transport that combines functional and structural connectivity, spatial position and curated homologies.
- **Key results**: The coupling recovered established homologues on a transcriptomic benchmark and preserved the cortical areal hierarchy. Mouse-based reconstruction of human connectivity declined across expanded association cortex.
- **Relevance**: FGW correspondence where no shared space exists, the extreme case of an unaligned spatial mode.
- **Quality**: Medium (9: venue 1, rigor 2, relevance 2, citations 1, evidence 3).
- **Stance**: Supports probabilistic transport correspondence.
- **Potential use**: Discussion.

### Diao and Jiang (2024). A multi-instance tumor subtype classification method for small PET datasets using RA-DL attention module guided deep feature extraction with radiomics features.
- **Type**: Journal article (Computers in Biology and Medicine).
- **Method**: Radiomics features of tumor regions compressed by an autoencoder and combined with attention-guided deep features, classified by a support vector machine. Liver cancer, lung cancer and lymphoma PET data sets.
- **Key results**: AUCs were 0.82 to 0.84 for three-class lung cancer, 0.95 and 0.75 for binary lymphoma tasks and 0.84 and 0.86 for liver tumors. The combination of radiomics and deep features improved subtype classification on small data sets.
- **Relevance**: The radiomics pipeline with a multi-instance formulation on small PET cohorts.
- **Quality**: High (12: venue 3, rigor 2, relevance 2, citations 2, evidence 3).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Winzell et al. (2025). Longitudinal outcome prediction of prostate cancer patients on active surveillance using multiple instance learning.
- **Type**: Journal article (Journal of Medical Imaging).
- **Method**: Attention-based multiple instance learning on whole-slide images with patient-level labels and UNI-2 foundation-model features, without Gleason grades, followed by Cox models and an external test set.
- **Key results**: The average area under the ROC curve was 0.958, and a Cox model on the predicted probabilities gave a C-index of 0.824 and a hazard ratio of 2.32. All models lost much of their performance on the external data set.
- **Relevance**: Patient-level outcome prediction from an unordered set of image parts, with an external test that exposes the domain shift.
- **Quality**: High (13: venue 2, rigor 3, relevance 3, citations 2, evidence 3).
- **Stance**: Supports set-level learning. It shows weak external generalization.
- **Potential use**: Discussion.

### Xia et al. (2024). Multicenter Evaluation of a Weakly Supervised Deep Learning Model for Lymph Node Diagnosis in Rectal Cancer at MRI.
- **Type**: Journal article (Radiology: Artificial Intelligence).
- **Method**: The WISDOM model learns lymph node diagnosis from preoperative T2-weighted and diffusion-weighted MRI with patient-level pathology (counts of metastatic and resected nodes). 1014 patients, with an internal test cohort and two external cohorts.
- **Key results**: The model reached an overall AUC of 0.81 and C-index of 0.765, better than junior radiologists and comparable with senior radiologists. It improved the performance of junior radiologists.
- **Relevance**: Patient-level supervision over a variable set of nodes, without node-to-node correspondence to pathology, in a multicenter cohort.
- **Quality**: High (14: venue 3, rigor 3, relevance 3, citations 2, evidence 3).
- **Stance**: Supports weak patient-level supervision over lesion sets.
- **Potential use**: Literature Review, Discussion.

### Gacheva et al. (2026). Multiple instance learning for differentiating neoplastic and non-neoplastic brain lesions using MR spectroscopy.
- **Type**: Journal article (NeuroImage: Reports).
- **Method**: Classification of brain lesions from 7442 MR spectra of 422 patients as a multiple instance problem with variable bag sizes, with min-max-mean pooling and attention pooling, benchmarked against neuroradiologists.
- **Key results**: The best configuration reached an AUC of 0.82, sensitivity 0.76 and specificity 0.80 on the hold-out set. Neuroradiologists reading MRS alone had sensitivity 0.54 and specificity 0.88.
- **Relevance**: Permutation-invariant aggregation of a variable number of measurements per patient.
- **Quality**: High (12: venue 2, rigor 3, relevance 3, citations 1, evidence 3).
- **Stance**: Supports set-level learning.
- **Potential use**: Discussion.

### Li et al. (2026). Revisiting Dual-Encoder Fusion and Optimal Transport Regularization in PET-CT Tumor Segmentation: A Matched-Control Study under Extended Training.
- **Type**: Journal article (AI Medicine).
- **Method**: Matched-capacity comparison of dual-encoder fusion and optimal transport regularization in PET-CT segmentation with a 200-epoch protocol and five-fold cross-validation on 75 AutoPET-derived cases.
- **Key results**: Optimal transport regularization gave no significant late-training Dice improvement for either encoder, and a 20-epoch pilot advantage did not persist. Conclusions about multimodal segmentation depended on control design, training duration and metric.
- **Relevance**: A controlled test of transport-based fusion inside the segmentation step.
- **Quality**: Medium (9: venue 1, rigor 3, relevance 2, citations 1, evidence 2).
- **Stance**: Opposes the claim that transport regularization improves segmentation under matched training.
- **Potential use**: Discussion.

## 5. Literature matrix

Themes: T1 tensor regression, tensor partial least squares and decompositions with an unaligned mode. T2 entropic optimal transport, Gromov-Wasserstein and fused Gromov-Wasserstein distances. T3 barycenters, dictionaries and learnable templates. T4 permutation-invariant set encoders and transport embeddings. T5 medical-imaging pipelines and transport-based alternatives to registration. Method values: Computational (a method with experiments on data), Theoretical, Review, Tool, Quantitative (a clinical cohort study).

| Source | T1 | T2 | T3 | T4 | T5 | Method | Quality |
|---|---|---|---|---|---|---|---|
| Zhou, Li and Zhu (2013) | main | | | | x | Computational | High |
| Zhao et al. (2013) | main | | | | | Computational | High |
| Kolda and Bader (2009) | main | | | | | Review | High |
| Li, Xu, Zhou and Li (2018) | main | | | | x | Computational | High |
| Zhang and Li (2017) | main | | | | x | Computational | High |
| Yan, Paynabar and Pacella (2019) | main | | | x | | Computational | High |
| Tang, Kolda and Zhang (2026) | main | | | | | Computational | High |
| Perros et al. (2017) | main | | | | | Computational | High |
| Ren et al. (2022) | main | | | | | Computational | Medium |
| Patalano, Konyar and Paynabar (2026) | main | | | | | Computational | Medium |
| Wang and Huang (2026) | main | | | | x | Computational | Medium |
| He and Li (2026) | main | | | | x | Computational | Medium |
| Pietrosanu et al. (2026) | main | | | | x | Computational | Medium |
| Konyar and Gahrooei (2025) | main | | | | | Computational | High |
| Huang, Chen and Zhang (2025) | main | | | | x | Computational | High |
| Minoccheri et al. (2025) | main | | | | | Computational | Medium |
| Cuturi (2013) | | main | x | | | Computational | High |
| Peyre and Cuturi (2019) | | main | x | | | Review | High |
| Benamou et al. (2015) | | main | x | | | Computational | High |
| Feydy et al. (2018) | | main | | x | | Computational | High |
| Montesuma, Mboula and Souloumiac (2025) | | main | x | | | Review | High |
| Vayer et al. (2018) | | main | x | | | Computational | High |
| Vayer et al. (2020) | | main | x | | | Theoretical | High |
| Sejourne, Vialard and Peyre (2020) | | main | | | | Computational | High |
| Zhang et al. (2024) | | main | | | | Theoretical | High |
| Togninalli et al. (2019) | | main | | x | | Computational | High |
| Cang, Wu and Zhao (2025) | | main | | | | Computational | High |
| Seyedi and Archetti (2026) | | main | | | x | Theoretical | Medium |
| Wang and Goldfeld (2026) | | main | | | | Theoretical | High |
| Takeda et al. (2025) | | main | | | x | Tool | High |
| Agueh and Carlier (2011) | | | main | | | Theoretical | High |
| Cuturi and Doucet (2013) | | x | main | | | Computational | High |
| Bonneel, Peyre and Cuturi (2016) | | x | main | | | Computational | High |
| Schmitz et al. (2018) | | x | main | | | Computational | High |
| Vincent-Cuaz et al. (2021) | | x | main | | | Computational | High |
| Vincent-Cuaz et al. (2022) | | x | main | x | | Computational | High |
| Brogat-Motte et al. (2022) | | x | main | | | Computational | High |
| Zhang et al. (2024a) | | x | main | | | Computational | High |
| Mialon et al. (2020) | | | main | x | | Computational | High |
| Chen et al. (2020) | | | main | x | | Computational | High |
| Beier and Beinert (2025) | | x | main | | | Computational | High |
| Zaheer et al. (2017) | | | | main | | Computational | High |
| Qi, Su, Mo and Guibas (2017) | | | | main | | Computational | High |
| Lee et al. (2018) | | | | main | | Computational | High |
| Ilse, Tomczak and Welling (2018) | | | | main | x | Computational | High |
| Naderializadeh et al. (2021) | | x | | main | | Computational | Medium |
| Moosmuller and Cloninger (2022) | | x | | main | | Theoretical | High |
| Wang et al. (2012) | | x | | main | x | Computational | High |
| Mahan, Moosmuller and Cloninger (2024) | | x | | main | | Computational | Medium |
| Meunier, Pontil and Ciliberto (2022) | | x | | main | | Computational | High |
| Shifat-E-Rabbi et al. (2025), LOT subspaces | | x | | main | | Computational | High |
| Beckmann, Beinert and Bresch (2026) | | x | | main | | Theoretical | High |
| Wang et al. (2025) | | x | x | main | | Computational | Medium |
| Pathan et al. (2026) | | x | | main | | Computational | Medium |
| Gramfort, Peyre and Cuturi (2015) | | | x | | main | Computational | High |
| Gerber et al. (2018) | | x | | | main | Computational | High |
| Gerber et al. (2023) | | x | | | main | Computational | High |
| Thual et al. (2022) | | x | | | main | Computational | High |
| Mazelet, Flamary and Thirion (2026) | | | x | | main | Computational | Medium |
| Qahqaie et al. (2026) | | x | | | main | Computational | High |
| Kan et al. (2026) | | | | x | main | Tool | Medium |
| Xu and Chen (2023) | | | | x | main | Computational | High |
| Balakrishnan et al. (2019) | | | | | main | Computational | High |
| Sotiras, Davatzikos and Paragios (2013) | | | | | main | Review | High |
| Hu et al. (2019) | | | | | main | Computational | High |
| Gillies, Kinahan and Hricak (2016) | | | | | main | Review | High |
| van Griethuysen et al. (2017) | | | | | main | Tool | High |
| Isensee et al. (2020) | | | | | main | Computational | High |
| Quellec et al. (2017) | | | | x | main | Review | High |
| Chen, Cheung, Milot and Martel (2021) | | | | x | main | Quantitative | Medium |
| Karimzadeh et al. (2026) | | | | x | main | Quantitative | High |
| Jajroudi et al. (2026) | x | | | | main | Quantitative | Medium |
| Chang and Jung (2020) | | | | x | main | Computational | High |
| Ktena et al. (2017) | | | | | main | Computational | High |
| Xiao et al. (2025) | | x | | | main | Computational | High |
| Shifat-E-Rabbi et al. (2025a), nuclear morphometry | | x | | | main | Computational | High |
| Lopes et al. (2024) | | x | | | main | Computational | Medium |
| Barbarant, Meyniel and Thirion (2026) | | | x | | main | Computational | Medium |
| Koch et al. (2026) | | x | | | main | Computational | Medium |
| Diao and Jiang (2024) | | | | x | main | Quantitative | High |
| Winzell et al. (2025) | | | | x | main | Quantitative | High |
| Xia et al. (2024) | | | | x | main | Quantitative | High |
| Gacheva et al. (2026) | | | | x | main | Quantitative | High |
| Li et al. (2026) | | x | | | main | Quantitative | Medium |

## 6. Identified gaps

1. Under-researched area: transport templates and couplings have not been tested on lesion sets with a clinical outcome. The learnable-template and FGW methods are evaluated on graph benchmarks, molecules or brain alignment, while the included lesion-set studies use Deep Sets, multiple instance learning, Set Transformers or a Transformer. No included study predicts a patient outcome from a set of lesions through a learned barycenter or an FGW distance to learned templates.
2. Methodological gap: no included study compares the four treatments of the missing correspondence on one cohort. These are registration to a common space, a learned template or barycenter, a transport coupling, and permutation invariance. The closest are a comparison of set encoders on lymphoma PET and a comparison of functional alignment methods for fMRI decoding, each inside one family.
3. Methodological gap: tensor models with an unaligned spatial mode are missing. Every included decomposition with an unaligned mode treats time (clinical visits, microbiome sampling), and the tensor regression and partial least squares models on images assume a voxel grid shared after registration. The one tensor classifier that addresses spatial misalignment does so with a cyclic shift of the registered image.
4. Population gap, surfaced as critical under cs_ml: external validation is rare and, where present, shows a drop. The set-encoder lymphoma study measured a domain shift between centers, and the prostate multiple instance model lost much of its performance on an external data set. The transport methods in neuroimaging are evaluated on a few public cohorts (OASIS, HCP). A controlled re-test of transport regularization in PET-CT segmentation did not reproduce an earlier short-training advantage. This is the non-reproducible-result risk that the cs_ml profile names.
5. Coverage limit of this review: seven assessable candidates could not be read because no full text or abstract was available. They include the foundational Gromov-Wasserstein paper (Memoli 2011), the SyN registration paper (Avants et al. 2008), and two directly relevant recent works. These are a fusion of point-cloud geometric features and radiomics for spinal surgery outcomes (Zhao et al. 2026) and an alignment of non-corresponding electrode grids for cross-subject decoding (Ceyssens and Faes 2026). The must-include Gromov-Wasserstein averaging paper (Peyre, Cuturi and Solomon 2016) has no DOI or arXiv ID. The synthesis does not rest on these works.

## 7. Synthesis

### 7.1 Topic, rationale and scope

Many prediction problems in medical imaging start from data whose spatial elements do not correspond across subjects. A patient has a variable number of lesions, lymph nodes or cells, a cortical surface of individual shape, or a point cloud sampled from an organ. A subject-level model needs a fixed representation of such data, and four answers exist in the literature. The first registers every subject to a common space and fits a model to the aligned array. Tensor regression on normalized brain images is the standard example [@Zhou_2013]. The second learns a template or barycenter and represents each subject relative to it [@arxiv_2205_15733]. The third computes a transport coupling between subjects or between a subject and a reference [@arxiv_1805_09114]. The fourth uses an encoder that is invariant to the order of the elements [@arxiv_1703_06114]. This review maps these answers and the pipeline steps they remove or build on: registration, radiomic feature extraction and lesion segmentation.

The scope is supervised prediction of a subject-level outcome, with the methods that support it. Included are tensor regression and tensor partial least squares, and decompositions with an unaligned mode. Also included are entropic and Gromov-Wasserstein transport, barycenters and dictionaries, and set encoders and transport embeddings. The registration, radiomics and segmentation methods of imaging pipelines complete the scope. Methods from any application domain were admitted when they bear on the missing correspondence. The period is 2016 to 2026, with seminal works from 2009 to 2015. No geographic restriction was applied, and the sources are in English. Excluded were works in which the image is the response of the model, graph-kernel benchmarks with no spatial mode, and work only tangential to the question. The review rests on 84 sources found in three search passes over four indexes, screened by title and abstract and then by full text. The five themes below follow the matrix: tensor models, transport distances, templates, set encoders and the medical pipeline.

### 7.2 Theme 1: tensor models and the aligned or unaligned mode

Tensor regression on images. Tensor regression replaces a vectorized image covariate with a low-rank coefficient array. The CP form makes ultrahigh-dimensional MRI covariates tractable and gives asymptotic theory [@Zhou_2013]. The Tucker form recovers higher-rank signals and estimates the best Tucker approximation consistently [@Li_2018]. Recent work adds Bayesian sparsity for mixed outcomes [@Wang_2026], ensembles over block structures and ranks [@He_2026] and quantile losses [@Pietrosanu_2026]. Higher-order partial least squares builds a joint latent space from orthogonal Tucker blocks [@Qibin_Zhao_2013]. The envelope view gives tensor partial least squares a population model and consistency [@Zhang_2017]. All of these models assume one voxel or channel grid for every subject. In the neuroimaging applications that grid comes from preprocessing that includes registration to a template [@Zhou_2013]. Tensor regression on point clouds also needs the points measured on a pre-specified grid and aligned by rotation [@Yan_2019]. Only one included classifier models residual misalignment, by adding a spatially shifted view of the registered image [@arxiv_2505_12113].

Decompositions with an unaligned mode. PARAFAC2 is the standard tensor model for subjects whose observations do not align [@Kolda_2009; @Perros_2017]. A CP decomposition with an unaligned mode represented in a reproducing kernel Hilbert space now handles subjects observed at different times [@Tang_2026]. Supervision enters these models through multi-task prediction [@arxiv_2208_00993], a joint Cox model [@arxiv_2609_23705], partial labels [@Konyar_2025] or coupled matrix-tensor factorization [@arxiv_2506_20065]. The first three report better prediction or risk stratification than the compared methods on clinical records. In every case the unaligned mode is time.

Summary of theme 1. The tensor literature offers strong theory for prediction from aligned images. It also offers a growing set of supervised models for an unaligned temporal mode. On the research question, it handles the missing correspondence in two ways. In imaging it relies on registration to a template before the model sees the data [@Zhou_2013; @Li_2018]. In clinical records it lets one mode vary in length across subjects through PARAFAC2 or a functional representation [@Perros_2017; @Tang_2026]. No included model treats an unaligned spatial mode in the second way, with one partial exception that adds a shifted view of the registered image [@arxiv_2505_12113]. Tensor methods therefore build on the registration step and do not remove it. The supervised decompositions show that the predictor and the decomposition can be fitted jointly, with better prediction than the compared methods [@arxiv_2208_00993; @arxiv_2609_23705; @Konyar_2025]. That joint fitting is the part of this theme that would carry over to a spatial setting.

### 7.3 Theme 2: entropic and Gromov-Wasserstein transport

Entropic regularization. Entropic smoothing turns optimal transport into a matrix-scaling problem that is orders of magnitude faster than linear programming [@arxiv_1306_0895]. Iterative Bregman projections extend the same scheme to barycenters, partial transport and multi-marginal problems [@Benamou_2015]. Sinkhorn divergences are positive and convex, metrize convergence in law and scale to a million samples on the GPU [@arxiv_1810_08278]. Neural estimators now replace the Sinkhorn step for very large samples with parametric error rates [@Wang_2026a]. The monograph and the recent survey describe these tools and their use in supervised learning [@Peyr__2019; @Montesuma_2025].

Gromov-Wasserstein and fused variants. Gromov-Wasserstein compares objects through their internal distances, so no common embedding is needed. Its entropic form converges at the parametric rate from finite samples [@Zhang_2024]. The fused distance couples features and structure in one problem and outperformed graph kernels and graph networks on classification [@arxiv_1805_09114]. Its metric, interpolation and concentration properties are established [@Vayer_2020]. Unbalanced formulations allow different total masses [@arxiv_2009_04266], and supervised constraints control how far pairwise distances are preserved [@Cang_2025]. A conditional form lets the geometry depend on context, so far only on synthetic graphs [@Seyedi_2026]. In neuroscience, unsupervised Gromov-Wasserstein alignment recovered correspondences that supervised alignment methods overlook [@Takeda_2025]. A Wasserstein graph kernel showed that a distribution of node embeddings predicts better than its mean, with no node correspondence [@arxiv_1906_01277].

Summary of theme 2. The transport literature supplies a coupling between subjects, with known statistical rates and scalable solvers [@Zhang_2024; @Wang_2026a]. On the research question, the coupling is the third treatment of the missing correspondence. It computes a soft matching for each pair of subjects, or for a subject and a reference, instead of fixing one in advance. The sources agree that the fused form suits objects that carry both features and structure [@arxiv_1805_09114]. They also agree that the unbalanced form suits objects of different mass [@arxiv_2009_04266]. Both conditions hold for sets of lesions or regions, which carry image features and positions and differ in number across patients. The supervised uses in this theme are graph benchmarks, with no clinical outcome [@arxiv_1805_09114; @arxiv_1906_01277]. The theme says nothing yet about the pipeline steps, which it takes as given.

### 7.4 Theme 3: barycenters, dictionaries and learnable templates

Barycenters as fixed references. The Wasserstein barycenter is the mean of several measures under the transport metric. Its existence, uniqueness and regularity are given in its founding analysis, which also relates it to multimarginal transport [@Agueh_2011]. Entropic smoothing gives a strictly convex objective with cheap gradients [@arxiv_1310_4375]. Bregman projections compute the same smoothed barycenter in closed-form steps [@Benamou_2015]. Gromov-Wasserstein barycenters, for objects without a common embedding, now have a fixpoint algorithm that decreases the loss monotonically [@Beier_2025]. Barycentric coordinates express a histogram as a barycenter of fixed references. The weights then give a low-dimensional code of the histogram [@Bonneel_2016]. In each of these works the reference is computed from the data or chosen in advance, and no outcome guides it.

Learned templates. Wasserstein dictionary learning learns the atoms and the weights together without supervision [@Schmitz_2018]. Graph dictionary learning does the same for unregistered graphs of different sizes [@arxiv_2102_06555]. Supervision changes what the templates capture. A layer of FGW distances to learned template graphs was competitive with or better than kernel and graph network methods [@arxiv_2205_15733]. A discriminant loss on learnable graph keys makes same-class keys compact [@Zhang_2024a]. A trainable transport reference aggregates a set into a fixed-size embedding and reached state-of-the-art protein fold recognition [@arxiv_2006_12065]. Prototype point clouds learned with a graph network gave a universal approximation result and beat common methods on molecular properties [@arxiv_2006_04804]. Barycenters with input-dependent weights and learned templates also serve as structured outputs [@arxiv_2202_03813].

Summary of theme 3. On the research question, this theme is the second treatment of the missing correspondence: each subject is represented relative to a template. The sources agree that a learned template can replace a fixed reference. The supervised template models report predictors competitive with or better than the compared methods [@arxiv_2205_15733; @arxiv_2006_12065; @arxiv_2006_04804]. The template turns a variable-size object into a fixed-length vector of distances, weights or transported features, which a standard classifier can use. The evidence comes from graphs, molecules and protein sequences. In imaging, learned transport templates appear in brain dictionary learning and in cross-subject decoding, covered in theme 5 [@arxiv_2605_20883; @Barbarant_2026]. No included source learns a template for a set of lesions with an outcome as supervision.

### 7.5 Theme 4: permutation-invariant set encoders and transport embeddings

Set encoders. Every permutation-invariant function on sets has a sum-decomposition form, which gives the Deep Sets architecture [@arxiv_1703_06114]. The same work gives conditions for permutation equivariance and applies the architecture to point cloud classification and population statistics. PointNet consumes raw point clouds without converting them to voxel grids or image collections. It performed on par with or better than the state of the art [@Charles_2017]. The Set Transformer adds attention among the elements of a set. Its inducing-point attention reduces the cost from quadratic to linear in the set size [@arxiv_1810_00825]. Attention-based multiple instance learning models the bag label with a permutation-invariant attention operator. Its instance weights show which elements drive the prediction, and it outperformed other methods on two histopathology data sets [@arxiv_1802_04712]. In all four, the order of the elements is irrelevant by construction, so no correspondence is computed.

Transport embeddings. Linear optimal transport embeds each image or distribution through its transport map from a fixed reference [@Wang_2012]. The embedding makes families generated by shifts and scalings linearly separable, and its distances approximate Wasserstein distances [@Moosm_ller_2022]. Subspace classifiers in this space handle affine deformations of point sets [@Shifat_E_Rabbi_2025], and normalized Radon transforms keep classes separable under small deformations [@Beckmann_2026]. Sliced-Wasserstein embeddings act as a pooling layer [@arxiv_2103_03892] and as a kernel for distribution regression with consistency guarantees [@arxiv_2202_03926]. Neural transport maps combined with a set classifier beat Deep Sets on flow cytometry with few labels [@arxiv_2401_01460]. On single-cell point clouds, the embedding gave interpretable patient classification and acts as a registration between patients [@arxiv_2510_22033; @arxiv_2609_17906].

Summary of theme 4. On the research question, this theme holds the fourth treatment of the missing correspondence and a variant of the second. Learned encoders are invariant by design and never compute a correspondence [@arxiv_1703_06114; @Charles_2017]. Transport embeddings fix a reference and represent each subject by its transport map to it, which acts as an implicit registration [@Wang_2012; @arxiv_2510_22033]. The embeddings come with provable separability under shifts, scalings and affine deformations [@Moosm_ller_2022; @Shifat_E_Rabbi_2025]. They report label efficiency on small patient cohorts in cytometry [@arxiv_2401_01460; @arxiv_2609_17906]. The learned encoders carry most of the benchmark evidence. Both routes remove the registration step between subjects. Both still need the elements of the set to be extracted first, by segmentation or by measurement.

### 7.6 Theme 5: the medical-imaging pipeline and transport-based alternatives

The pipeline steps. Deformable registration underlies fusion, longitudinal studies and statistical atlases [@Sotiras_2013]. Learning-based registration made it fast, with accuracy comparable to classical methods [@Balakrishnan_2019]. Radiomics turns images into quantitative features [@Gillies_2016], and a standard extractor was built to make those features reproducible [@van_Griethuysen_2017]. Self-configuring segmentation set the state of the art on most of 49 tasks [@Isensee_2020]. These three steps produce the aligned images or the lesion sets that the methods of themes 1 to 4 take as input. Region-level correspondence can replace dense registration when only regions matter [@Hu_2019]. Segmentation followed by a point-cloud classifier also avoids registration between subjects [@Chang_2020]. Atlas parcellation imposes the node correspondence of connectome graphs before learning [@Ktena_2017].

Transport in place of registration. Transport barycenters averaged neuroimaging data whose effects do not overlap across subjects [@Gramfort_2015]. Fused unbalanced Gromov-Wasserstein aligned individual cortices on function without landmarks and gave more precise mapping at the group level [@Thual_2022]. Population templates built by transport gave the highest cross-subject decoding accuracy among four alignment methods [@Barbarant_2026]. FGW dictionaries are learned across individual brain geometries without projection onto a common template [@arxiv_2605_20883], and an FGW coupling maps mouse to human cortex [@Koch_2026]. Unbalanced transport features increased the power of morphometry and reduced its sensitivity to misalignment [@Gerber_2018; @Gerber_2023]. Template-relative transport morphometry is also used for nuclei and cells [@Shifat_E_Rabbi_2025a; @Lopes_2024], with a public tool for 3D images [@arxiv_2602_07260]. Transport also enters prediction directly, matching patches and genes for survival [@Xu_2023] and brain and image embeddings for decoding [@Xiao_2025].

Lesion sets and weak supervision. Multiple instance learning learns from global labels without manual segmentation and was often more accurate than single-instance learning [@Quellec_2017]. Using all liver metastases as a set improved survival prediction over baselines [@Chen_2021]. A comparison of set encoders on lymphoma PET reached an ROC-AUC of 0.91 within one center but showed a domain shift between centers [@Karimzadeh_2026]. Patient-level labels trained a multicenter lymph node model comparable with senior radiologists [@Xia_2024]. Similar set-level models handle spectra, slides and PET tumors [@Gacheva_2026; @Winzell_2025; @Diao_2024]. Per-lesion tensor radiomics predicted response better than classical models but stops at the lesion level [@Jajroudi_2026]. Unbalanced transport now matches lesions across time, with the registration weighted by a local trust term [@Qahqaie_2026]. Under a controlled protocol, transport regularization gave no significant gain in PET-CT segmentation [@Li_2026].

Summary of theme 5. On the research question, the pipeline shows where each treatment of correspondence enters. Registration remains the default and has become fast [@Balakrishnan_2019]. Transport is established as an alternative to registration for alignment, averaging and morphometry in neuroimaging [@Thual_2022; @Gramfort_2015; @Gerber_2023]. Set encoders and multiple instance models are established for patient-level prediction from lesions, nodes, spectra and slides [@Chen_2021; @Xia_2024; @Gacheva_2026]. These set models remove registration between patients and build on segmentation and radiomics, which supply the elements and their features [@Isensee_2020; @van_Griethuysen_2017]. In the included sources the transport line and the set line meet in two places. One is lesion matching across time [@Qahqaie_2026], and the other is survival prediction from slide patches [@Xu_2023]. The external evaluations in this theme show a loss across centers [@Karimzadeh_2026; @Winzell_2025].

### 7.7 Cross-cutting synthesis

Convergent findings. The sources agree that treating a subject as a distribution, set or structure keeps information that sums, means or voxelwise comparison lose [@arxiv_1906_01277; @arxiv_2006_04804; @Gerber_2023]. The sources that learn a reference from the data report results competitive with or better than the compared methods [@arxiv_2205_15733; @arxiv_2006_12065; @Barbarant_2026]. Unbalanced formulations recur wherever element counts or masses differ, as with lesions that appear or vanish [@arxiv_2009_04266; @Thual_2022; @Qahqaie_2026].

Divergent findings and debates. Registration is treated in two ways. One line makes it faster and keeps it [@Balakrishnan_2019], while the other replaces it with a coupling or a region-level correspondence [@Thual_2022; @Hu_2019]. The lesion-set studies sit between the two, registering node coordinates rigidly while pooling lesions without correspondence [@Karimzadeh_2026]. A second debate concerns fixed against learned representations. Fixed-reference transport embeddings report label efficiency and provable separability [@Moosm_ller_2022; @Shifat_E_Rabbi_2025], while learned encoders carry most of the benchmark evidence [@Charles_2017; @arxiv_1810_00825]. Evidence on transport inside segmentation is mixed, with a controlled study finding no gain [@Li_2026].

Methods that dominate and methods that are underused. Computational method papers with experiments on data make up 60 of the 84 sources. The rest are 8 clinical cohort studies, 7 theoretical works, 6 reviews and 3 tool papers. Seven of the eight clinical cohort studies use set-level or radiomic models, and the eighth tests transport regularization in segmentation [@Li_2026]. Only some of them report external cohorts [@Xia_2024; @Winzell_2025; @Karimzadeh_2026]. The transport methods in neuroimaging rest on a few public cohorts such as OASIS and the Human Connectome Project [@Gerber_2023; @arxiv_2605_20883]. Theory is strong for transport distances and embeddings [@Zhang_2024; @Moosm_ller_2022] and for tensor regression on aligned images [@Zhou_2013]. No included source gives theory for supervised learning from tensors with an unaligned spatial mode. Head-to-head comparisons across the four treatments of correspondence are missing, while comparisons within one family exist [@Karimzadeh_2026; @Barbarant_2026].

### 7.8 Gaps, research agenda, takeaways and implications

Gaps. Section 6 lists the gaps in full, with their types. The transport templates of themes 2 and 3 have not been tested on lesion sets with a clinical outcome, which is an under-researched area. No cohort compares the four treatments of correspondence, which is a methodological gap. Tensor models with an unaligned spatial mode are missing, a second methodological gap. External validation is rare, and where it is reported it shows a loss across centers. This population gap is the non-reproducible-result risk that the cs_ml profile names as critical. As a coverage limit, several relevant works could not be read in this review. Among them are the founding Gromov-Wasserstein paper and a study that fuses point-cloud geometry with radiomics for surgical outcome.

Research agenda. A first study would predict a patient outcome from lesion sets with FGW distances to learned templates [@arxiv_2205_15733]. It would compare this model with Deep Sets and attention pooling on the same cohort [@Karimzadeh_2026]. A second would extend supervised decompositions with an unaligned mode [@Tang_2026; @arxiv_2208_00993] from time to space, with the transport coupling as the alignment. Both studies should report an external cohort, since the sources show a drop across centers [@Winzell_2025]. They should also report which pipeline steps each model removes and which it keeps, registration in particular [@Balakrishnan_2019]. A third study would test transport embeddings with a fixed reference against learned templates on the same small cohort. The cytometry results suggest the fixed reference may suffice when labels are few [@arxiv_2609_17906; @arxiv_2401_01460].

Key takeaways. Correspondence across subjects can be imposed by registration or learned as a template. It can also be computed as a transport coupling, or made irrelevant by permutation invariance. Registration-based tensor models have the strongest theory but depend on a common grid [@Zhou_2013]. Transport methods supply the coupling and the template with known statistical behaviour [@Zhang_2024; @Moosm_ller_2022]. Set encoders and multiple instance models supply the clinical evidence on sets of lesions and nodes [@Chen_2021; @Xia_2024]. No included study combines a transport template or coupling with a set of lesions to predict a clinical outcome. The registration-free set models of the clinical studies still build on lesion segmentation and radiomic features [@Karimzadeh_2026; @Chen_2021].

Implications for practice. A group with lesion-level segmentations can predict at patient level without inter-patient registration [@Chen_2021]. Such a group should still expect a loss across centers and plan external validation [@Karimzadeh_2026]. Radiomic features for such models should come from a standard extractor, since non-standard definitions hamper reproducibility [@van_Griethuysen_2017]. Where alignment of brains is needed, transport alignment and transport templates are available alternatives to anatomical registration. Public tools exist for Gromov-Wasserstein alignment and for transport-based morphometry [@Takeda_2025; @arxiv_2602_07260]. For segmentation, a self-configuring method gives a strong default without manual tuning [@Isensee_2020].

## 8. Recommended sources by paper section

| Section | Key sources |
|---|---|
| Introduction | Zhou_2013, arxiv_1703_06114, Montesuma_2025, Sotiras_2013, Gillies_2016, Balakrishnan_2019, Thual_2022 |
| Literature Review | Qibin_Zhao_2013, Tang_2026, Perros_2017, arxiv_2208_00993, arxiv_1805_09114, arxiv_1906_01277, Takeda_2025, Schmitz_2018, arxiv_2102_06555, arxiv_2205_15733, arxiv_2006_12065, Wang_2012, Charles_2017, arxiv_1802_04712, Gramfort_2015, Gerber_2023, Barbarant_2026, Quellec_2017, Chen_2021, Karimzadeh_2026, Xia_2024 |
| Methodology | arxiv_1306_0895, Peyr__2019, Benamou_2015, arxiv_1810_08278, Zhang_2024, Vayer_2020, arxiv_2009_04266, Beier_2025, Zhang_2024a, Moosm_ller_2022, Shifat_E_Rabbi_2025, arxiv_2202_03926, arxiv_2505_12113, van_Griethuysen_2017, Isensee_2020, Qahqaie_2026 |
| Discussion | Hu_2019, Chang_2020, Gerber_2018, Winzell_2025, Li_2026, Koch_2026, arxiv_2609_17906, arxiv_2510_22033, Seyedi_2026, Jajroudi_2026 |

## 9. No entry written

- Peyre, G., Cuturi, M. and Solomon, J. (2016). Gromov-Wasserstein Averaging of Kernel and Distance Matrices. Record: HAL hal-01322992, OpenAlex W2417433140, Semantic Scholar 4658ae98be04425f7967307401cbcb74c354ab65, venue International Conference on Machine Learning per the Semantic Scholar record. It has neither a DOI nor an arXiv ID, so the lookup tool could neither fetch it nor print a BibTeX entry. It was marked "must include" in pass 1 (cited by 4 core papers). It was not assessed at full text, is not annotated and is not cited in the synthesis.

## 10. Search limitations and gate failures

Gates:

- Search documented: met (section 1).
- Source count: met, 84 against a minimum of 30.
- Annotations: met, 84 annotations for 84 included sources.
- Matrix coverage: met, each theme has at least 11 sources as main theme (T1 16, T2 14, T3 11, T4 13, T5 30).
- Research gaps: met, 5 gaps in section 6.
- Peer-reviewed share: met. Of the 84 sources, 68 are peer-reviewed by their entry or by the venue in their index record (81.0 percent). Under cs_ml the 16 preprints also count, which gives 84 of 84.
- Currency: met after pass 3, with 44 of 84 sources from 2022 to 2026 (52.4 percent). After pass 2 it failed with 19 of 59, and the gate's action (a search of the last 3 years with preprints tagged) was run as pass 3.

Search limitations:

- Semantic Scholar and OpenAlex rate limits (HTTP 429 after 3 retries) removed those indexes from many calls, as section 1 lists. Semantic Scholar also printed "not found" for some Boolean strings. The search therefore leans on Crossref, which ignores Boolean operators, and on arXiv. Some relevant records in Semantic Scholar may have been missed.
- The citation loop did not close: the cited-by listings of the included works kept returning new works after pass 3.
- Seven candidates, five of them from 2019 or later, could not be assessed because neither a full text nor an abstract was retrievable (section 3). The must-include Gromov-Wasserstein averaging paper has no identifier (section 9).
- Peer-reviewed venues of some preprint-form sources could not be confirmed, because Semantic Scholar was rate-limited during the venue lookups. These are Set Transformer, attention-based multiple instance learning, OT-GNN, generalized sliced-Wasserstein embeddings and FGW barycenter graph prediction. Each is tagged as a preprint and scored 1 on venue.
- The venue item uses a judgment of journal standing, since no quartile list was looked up.
- Gillies et al. (2016) was annotated from a one-sentence abstract.

## 11. AI disclosure

AI disclosure: This review was produced with AI-assisted research tools (/paper lit-review, literature strategist on claude-opus-5-5, with other tools and versions not known). The AI took part in research assistance. A person oversaw the process, and the authors take responsibility for the content.

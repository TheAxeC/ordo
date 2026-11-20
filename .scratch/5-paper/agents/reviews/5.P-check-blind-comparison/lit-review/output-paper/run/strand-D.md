## Literature Search Report: strand group D

Strand group D covers the medical-imaging pipeline steps that methods for non-aligned spatial data avoid or build on (image registration, radiomics, lesion segmentation) and the subject-level prediction studies that rest on them. The report serves the research question of `settings.md`. For this group it records, per source, which step the source concerns, what that step assumes about correspondence across subjects, the error or variability the step introduces into downstream prediction where the source measures it, and how per-lesion or per-region outputs become one subject-level input.

### Search Strategy

**Evidence profile.** The `Domain evidence profile` row of `settings.md` reads `cs_ml`. Its implied discipline (CS / Engineering / Technology) matches the `Discipline` row (machine learning, with medical image analysis as the application setting), so no profile advisory is raised. Under `cs_ml`, archival preprints and proceedings are admissible at the peer-review node. The relevance, methodology and predatory gates were applied to every source unchanged.

**Criteria applied.** Inclusion (a) to (d) and exclusion (e) to (i) of the `Review design` row, with the restriction of (d) and (f) that the direction for this group states. For registration, admitted sources are review articles, benchmarks and challenges, and the registration tools and template construction methods that prediction studies use as their alignment step. For radiomics, admitted sources are the standardization and reproducibility literature, reviews of radiomics-based outcome prediction, and studies that aggregate per-lesion or per-region features into a subject-level prediction. For lesion segmentation, admitted sources are reviews, benchmarks and challenges, and studies that use segmented lesions as the input set of a subject-level predictor. Primary registration and segmentation method papers outside that remit were excluded by (f).

**Date range and filters.** Search period 2013 to 2026, run on 2026-11-20, with foundational works admitted whatever their year. Language English. Every PubMed query below was sent with the suffix `AND 2013:2026[dp] AND english[la]`, and every arXiv query with `AND submittedDate:[201301010000 TO 202611202359]`. OpenAlex queries used the filter `publication_year:2013-2026,language:en`.

**Databases queried.** PubMed (NCBI E-utilities `esearch`, relevance sort), arXiv (export API, relevance sort), OpenAlex (works search, relevance sort), DBLP and Semantic Scholar through `the lookup script`, and OpenAlex reference and citing-work lists for citation chaining. Scopus, Web of Science, IEEE Xplore and the ACM Digital Library, named in the `Sources` row, were not queried by this start, which used the open indexes its tools reach. IEEE TMI, Medical Image Analysis, NeuroImage, MICCAI and CVPR items reached the screen through PubMed, OpenAlex and DBLP.

**Hit counts.** Each count is the total the index returned for the query as sent. Titles were screened for the records retrieved by relevance (the "retrieved" column).

| ID | Database | Query string (date and language suffix as stated above) | Hits | Retrieved and screened |
|---|---|---|---|---|
| PM1 | PubMed | `(("image registration"[tiab] OR "deformable registration"[tiab] OR "nonrigid registration"[tiab]) AND (review[pt] OR survey[ti] OR review[ti] OR benchmark*[ti] OR challenge[ti] OR evaluation[ti]))` | 620 | 40 |
| PM2 | PubMed | `(("deep learning"[tiab] OR "learning-based"[tiab] OR unsupervised[tiab]) AND registration[ti] AND (challenge[ti] OR benchmark*[ti] OR review[pt] OR survey[ti]))` | 32 | 30 |
| PM3 | PubMed | `((template[ti] OR atlas[ti] OR atlases[ti]) AND (unbiased[tiab] OR groupwise[tiab] OR "group-wise"[tiab] OR learned[tiab] OR conditional[tiab] OR "population-specific"[tiab]) AND (construction[tiab] OR building[tiab] OR registration[tiab]))` | 130 | 40 |
| PM4 | PubMed | `((registration[ti] OR normalization[ti] OR template[ti]) AND (classification[tiab] OR prediction[tiab] OR "machine learning"[tiab]) AND (impact[ti] OR effect[ti] OR influence[ti] OR choice[ti] OR comparison[ti] OR variability[ti] OR reproducibility[ti]) AND (MRI[tiab] OR "magnetic resonance"[tiab]))` | 10 | 10 |
| PM5 | PubMed | `(("image biomarker standardisation initiative"[tiab] OR "image biomarker standardization initiative"[tiab] OR IBSI[ti]))` | 104 | 30 |
| PM6 | PubMed | `(radiomic*[ti] AND (reproducibility[ti] OR repeatability[ti] OR robustness[ti] OR stability[ti] OR variability[ti]) AND (review[pt] OR systematic[sb]))` | 21 | 21 |
| PM7 | PubMed | `(radiomic*[ti] AND (prognos*[tiab] OR outcome*[tiab] OR survival[tiab] OR prediction[tiab]) AND ("radiomics quality score"[tiab] OR "systematic review"[ti] OR "meta-analysis"[ti]) AND (review[pt] OR systematic[sb]))` | 352 | 40 |
| PM8 | PubMed | `(radiomic*[tiab] AND ("multiple lesions"[tiab] OR multilesion[tiab] OR "multi-lesion"[tiab] OR "lesion-level"[tiab] OR "patient-level"[tiab] OR "multiple metastases"[tiab] OR "all lesions"[tiab]) AND (aggregat*[tiab] OR "largest lesion"[tiab] OR pool*[tiab] OR "intertumor heterogeneity"[tiab] OR "inter-lesion"[tiab] OR "intra-patient"[tiab]))` | 47 | 47 |
| PM9 | PubMed | `(radiomic*[tiab] AND (segmentation[ti] OR delineation[ti] OR contour*[ti]) AND (variability[tiab] OR reproducibility[tiab] OR robustness[tiab] OR stability[tiab]))` | 164 | 40 |
| PM10 | PubMed | `("multiple sclerosis"[tiab] AND lesion*[tiab] AND segmentation[ti] AND (challenge[ti] OR benchmark*[ti] OR review[pt] OR evaluation[ti] OR comparison[ti]))` | 20 | 20 |
| PM11 | PubMed | `(("brain metastases"[tiab] OR "brain metastasis"[tiab]) AND (segmentation[ti] OR detection[ti]) AND (challenge[tiab] OR benchmark*[tiab] OR review[pt] OR "systematic review"[ti] OR meta-analysis[ti]))` | 36 | 36 |
| PM12 | PubMed | `(("brain tumor segmentation"[ti] OR "brain tumour segmentation"[ti] OR BraTS[ti] OR "lesion segmentation"[ti]) AND (challenge[ti] OR benchmark[ti]))` | 22 | 22 |
| PM13 | PubMed | `(("multiple instance learning"[tiab]) AND (lesion*[tiab] OR metastas*[tiab] OR nodule*[tiab] OR tumor*[tiab] OR tumour*[tiab]) AND (CT[tiab] OR MRI[tiab] OR PET[tiab] OR "magnetic resonance"[tiab] OR "computed tomography"[tiab]))` | 46 | 46 |
| PM14 | PubMed | `(("lesion load"[tiab] OR "lesion volume"[tiab] OR "lesion count"[tiab]) AND "multiple sclerosis"[tiab] AND (predict*[ti] OR prognos*[ti]) AND ("machine learning"[tiab] OR "deep learning"[tiab] OR automated[tiab] OR automatic[tiab]))` | 13 | 13 |
| PM15 | PubMed | `(("multiple metastases"[tiab] OR "multiple lesions"[tiab] OR "metastatic lesions"[tiab] OR "lesion-wise"[tiab] OR "lesion-level"[tiab]) AND ("deep learning"[tiab] OR "graph neural network"[tiab] OR attention[tiab] OR "deep sets"[tiab] OR "set"[ti]) AND ("patient-level"[tiab] OR "subject-level"[tiab] OR survival[tiab] OR "overall survival"[tiab]))` | 107 | 50 |
| PM16 | PubMed | `(("lesion-symptom mapping"[tiab] OR "lesion symptom mapping"[tiab] OR "lesion-deficit"[tiab]) AND (predict*[ti] OR multivariate[ti] OR "machine learning"[tiab] OR normalization[tiab] OR registration[tiab]))` | 115 | 40 |
| PM17 | PubMed | `(("spatial normalization"[ti] OR "spatial normalisation"[ti] OR registration[ti]) AND (lesion*[ti] OR stroke[ti] OR tumor*[ti] OR tumour*[ti] OR pathology[ti]) AND (template[tiab] OR atlas[tiab] OR MNI[tiab]))` | 9 | 9 |
| PM18 | PubMed | `((preprocessing[ti] OR registration[ti] OR "spatial normalization"[ti] OR "skull stripping"[ti]) AND ("deep learning"[tiab] OR "convolutional neural network"[tiab]) AND ("brain age"[tiab] OR "Alzheimer"[tiab] OR classification[tiab] OR prediction[tiab]) AND (impact[ti] OR effect[ti] OR influence[ti] OR necessary[ti] OR matter*[ti] OR role[ti]))` | 10 | 10 |
| PM19 | PubMed | `(("multiple sclerosis"[tiab]) AND ("deep learning"[tiab] OR "convolutional"[tiab]) AND (disability[tiab] OR EDSS[tiab] OR progression[tiab] OR conversion[tiab]) AND (predict*[ti] OR stratification[ti] OR classification[ti]) AND (lesion*[tiab]))` | 13 | 13 |
| PM20 | PubMed | `(("brain metastases"[tiab]) AND (radiomic*[tiab] OR "deep learning"[tiab]) AND ("overall survival"[tiab] OR "patient-level"[tiab] OR "intracranial progression"[tiab]) AND (multiple[tiab]))` | 8 | 8 |
| AX1 | arXiv | `abs:registration AND (abs:template OR abs:atlas) AND (abs:groupwise OR abs:conditional OR abs:unbiased OR abs:learned)` | 180 | 30 |
| AX2 | arXiv | `abs:"multiple instance" AND (abs:lesion OR abs:lesions OR abs:metastases) AND (abs:MRI OR abs:CT OR abs:PET)` | 7 | 7 |
| AX3 | arXiv | `(abs:lesions OR abs:metastases OR abs:tumors) AND (abs:"patient-level" OR abs:"subject-level") AND (abs:aggregation OR abs:"set" OR abs:graph OR abs:attention) AND (abs:prediction OR abs:survival OR abs:prognosis)` | 31 | 30 |
| AX4 | arXiv | `abs:registration AND (abs:prediction OR abs:classification) AND (abs:"registration-free" OR abs:"without registration" OR abs:"registration error" OR abs:"registration errors")` | 48 | 30 |
| AX5 | arXiv | `abs:radiomics AND (abs:reproducibility OR abs:standardization OR abs:standardisation OR abs:harmonization)` | 134 | 30 |
| AX6 | arXiv | `(ti:challenge OR ti:benchmark) AND (abs:"lesion segmentation" OR abs:"tumor segmentation" OR abs:"metastases segmentation" OR abs:"multiple sclerosis")` | 87 | 30 |
| OA1 | OpenAlex | `deformable medical image registration survey` | 12,210 | 20 |
| OA2 | OpenAlex | `learning conditional deformable templates atlas construction` | 598 | 15 |
| OA3 | OpenAlex | `radiomic feature aggregation multiple lesions patient-level outcome` | 2,341 | 20 |
| OA4 | OpenAlex | `multiple instance learning multiple sclerosis lesions disability prediction MRI` | 2,268 | 15 |
| OA5 | OpenAlex | `brain metastases radiomics multiple lesions patient-level survival aggregation` | 493 | 15 |
| OA6 | OpenAlex | `effect of image registration on classification accuracy neuroimaging spatial normalization machine learning` | 6,480 | 20 |

OpenAlex counts are the number of works matching any search term after relevance scoring, so they measure index breadth and were screened by relevance rank only.

**Layer 2, citation chaining (backward).** The reference lists of four core papers were read through OpenAlex: Geady et al. 2025 (22 references), Wilk et al. 2025 (48), Chang et al. 2021 (28) and Jühling et al. 2024 (55), 153 references in total. Two works appear in the reference lists of three of the core aggregation papers (Geady 2025, Wilk 2025, Chang 2021) and were marked "must include": Aerts et al. 2014 and van Griethuysen et al. 2017. The Jühling list added the lesioned-brain normalization works of Brett et al. 2001, Crinion et al. 2007, Nachev et al. 2008, Andersen et al. 2010 and Ripollés et al. 2012, the ANTs evaluation of Avants et al. 2011 and the stroke outcome studies of Forkert et al. 2015 and Salvalaggio et al. 2020. Jühling 2024 cites Crinion 2007 and Andersen 2010 as cost function masking studies and Nachev 2008 as the enantiomorphic method, the two alignment options it evaluates, and Salvalaggio 2020 uses the enantiomorphic method as its alignment step. The three were screened against (d) as alignment-step tools and benchmarks used ahead of lesion-based predictors and against (f) as inside that remit; all three passed and are included. Vargas et al. 2017 came from the Geady list.

**Citation loop screen of the four reference lists.** Every one of the 153 references was screened against the criteria, by title and, where the title left the decision open, by its abstract (25 PubMed abstracts and 2 OpenAlex records read, saved with the run's working files). Works already in the set count as collected. Decisions per list:

- Geady 2025 (22): 10 included (Aerts 2014, Vargas 2017, van Griethuysen 2017, Chang 2021, Henry 2022, Sun 2022, Cavinato 2023 already collected; Traverso 2020, van Timmeren 2020 and Simpson 2024 added in this loop). Excluded: 5 statistics or research-practice works outside this group (concordance index, terminology of reproducibility, grid search, transparency in AI, the Cox model); 2 clinical works (a clinical recurrence score, a phase 3 trial); 3 by (e), single-tumour radiomics or deep learning applications (Ji 2019, Tomaszewski 2022, Kazmierski 2023); 1 by (f), a commentary on segmentation foundation models (Ma and Wang 2023); 1 reference with no record in the OpenAlex reply, which could not be screened.
- Wilk 2025 (48): 10 included (Aerts 2014 and van Griethuysen 2017 already collected; Gillies 2016, Liu 2019, Lu 2021, Zhao 2022, Xu 2022, Peng 2024, Captier 2024 and Armato 2011 added). Excluded at Phase B: Han 2020, by (e) on its full text (the unit of analysis is the lesion, tumour-zone and tumour-liver-interface signatures are modelled separately, and only the interface signature enters the final model, so no per-region features are combined into a subject-level prediction). Excluded on the abstract by (e): Chen 2018 (multiparametric rectal radiomics; the comparison is across modalities, with no aggregation across regions tested), Shan 2019 (tumoural and peritumoural models built and compared separately) and Feng 2022 (six dose-defined regions pooled into one feature set without a comparison of the combination). Excluded on the title: Optimizing the Size of Peritumoral Region (2023, a conference chapter on the width of one peritumoural region, with no abstract in OpenAlex and no open copy); 8 statistics works and software packages (random survival forests, mboost twice, survival SVM twice, glmnet twice, the multivariable prognostic modelling tutorial); 2 records of whole proceedings volumes with no article; 1 single-tumour radiomics feature method (sparse representation radiomics, 2017); 3 reviews outside the remit (a breast radiomics overview, a PET radiomics review, a review of deep learning in medical image analysis); 1 mass spectrometry imaging study outside radiological imaging; 18 single-tumour radiomics or deep learning applications, by (e).
- Chang 2021 (28): 4 included (Aerts 2014, Lambin 2017 and van Griethuysen 2017 already collected; Kumar 2012 added). Excluded: 6 clinical oncology works on brain metastases, oligometastatic disease and multiple primary tumours; 8 statistics works and software (Cox model twice, random survival forests, mRMR twice, scikit-learn, scikit-survival, the LASSO for Cox); 1 by (f), N4ITK bias field correction; 9 single-tumour radiomics applications, by (e).
- Jühling 2024 (55): 13 included (Brett 2001, Crinion 2007, Nachev 2008, Andersen 2010, Avants 2011, Ripollés 2012, Forkert 2015 and Salvalaggio 2020 already collected; Yourganov 2016, Pustina 2017, Rajashekar 2020, Moore 2023 and the ANTs report of Avants 2009 added). Excluded on the abstract: Cheng 2014, Wu 2015 and Ernst 2018, by (e) (voxel-based lesion-symptom mapping of functional outcome, no predictor and no variation of the alignment step); Mah 2014, Pustina 2018 (SCCAN) and Ivanova 2021, as lesion-symptom mapping inference methods or comparisons that neither vary the registration, segmentation or radiomics step nor build a subject-level predictor. Excluded on the title: 16 lesion-symptom mapping applications, reviews of lesion findings and replies, by (e); 4 lesion-symptom mapping methods (Bates 2003, Bayesian VLSM 2009, LESYMAP 2018, SCCAN on atrophy 2013), on the same ground as Mah 2014; 5 white matter or cortical atlases used for region labels after alignment, outside the alignment-step remit and, for the automated cortical labeling system, by (f); 2 by (f), the B-spline diffeomorphic registration method and brain extraction (BET); 9 works outside this group's imaging steps (neuroanatomy volumetry in psychiatric cohorts, tractography reproducibility, MEG, CT reading agreement in traumatic brain injury, psilocybin and autism network studies).

Beyond the three normalization papers, this screen added 18 candidates to Phase A, of which 17 were included after Phase B. The reference lists of the 20 included works that the citation loop added were not chained.

**Layer 3, forward tracking.** The works citing Chang et al. 2021 from 2022 on were listed through OpenAlex: 52 citing works. They include Sun et al. 2022, Geady et al. 2024, Liao et al. 2023, Gharibi et al. 2026 and Geady et al. 2025, and works from 2026, so the foundational aggregation comparison is not marked "possibly outdated".

**Layer 4, semantic layer.** Run as the six OpenAlex relevance-ranked natural-language queries OA1 to OA6. Semantic Scholar was reached through `the lookup script resolve` and `index-abstract`. One Semantic Scholar call returned HTTP 429 after three retries and was not repeated, so no Semantic Scholar or Connected Papers recommendation list was used.

**Full-text retrieval.** For every candidate without a full text from the first screening pass, and for every candidate of the citation loop, these open routes were tried in order, and the result of each was logged: the NCBI ID converter for a PMCID; the Europe PMC full-text XML and, when it failed or had no body, the PMC XML through NCBI efetch; the Unpaywall record of the DOI and each of its open-access locations; an arXiv title search; the publisher page through doi.org. For the sources still without a text after these, three further routes were tried: a Europe PMC preprint search by title (which covers medRxiv, bioRxiv and Research Square), the OpenAlex list of locations for the DOI, and a direct fetch of the PMC article page where a PMCID existed. Pages behind a bot check or an HTTP 403 were recorded as such and not worked around. Each annotation's **Read** line names the copy read and the part read. For reviews and surveys, which have no methods and results sections, "methods and results" means the sections named in that line.

### Coverage Distribution Advisory

No distributional skew advisory triggered. The counts over the 77 included sources:

- Time: 2020 to 2026, 49/77 (64%); 2010 to 2019, 24/77 (31%); before 2010, 4/77 (5%). The 2020s share is below the 70% threshold. 40/77 (52%) were published from 2021 on.
- Method: empirical comparison or predictive study, 31/77 (40%); review, systematic review or quantitative review, 20/77 (26%); challenge, benchmark, dataset or standardization study, 13/77 (17%); tool, template, method or method-evaluation paper, 13/77 (17%).
- Venue: the most frequent venue is NeuroImage, 9/77 (12%). No preprint-only source is included.
- Geography: not assessed; the study site is not stated in the abstracts of most included sources.

### Screening Results

- Initial hits: PubMed 1,879 over 20 queries (the sum of per-query counts, which overlap); arXiv 487 over 6 queries; OpenAlex 24,390 over 6 relevance-ranked queries; citation chaining 153 references and 52 citing works.
- Records whose titles were screened: PubMed 565 retrieved records (548 unique PMIDs); arXiv 157; OpenAlex 105; chaining 205. 1,015 title records in total, not deduplicated across sources.
- After title/abstract screening (Phase A): 81 candidates, after removing two preprint duplicates of included journal articles (the medRxiv versions of Chang et al. 2021 and Geady et al. 2025). The 81 include 21 candidates collected in the citation loop: the three lesioned-brain normalization papers from the Jühling 2024 reference list (Crinion 2007, Nachev 2008, Andersen 2010) and the 18 candidates of the reference-list screen in the Layer 2 paragraph.
- After full-text assessment (Phase B): 77. The abstract of each of the 81 candidates was read in full, and the full-text routes above were tried for every candidate. Of the 77 included sources, 61 were assessed on a full text: 1 read whole (van Griethuysen 2017) and 60 on their methods and results, 11 of them from the first screening pass (Chang 2021, Henry 2022, Jühling 2024, AMINN as the arXiv version of Chen 2021, Dalca 2019, Poirot 2022, Sabouri 2025, Eertink 2022, Shamonin 2013, Commowick 2018, Moawad 2025), 37 in the full-text pass over the first 60, and 12 among the works added by the citation loop (Avants 2009, Kumar 2012, Gillies 2016, Liu 2019, van Timmeren 2020, Peng 2024, Captier 2024, Moore 2023, Simpson 2024, Armato 2011, Pustina 2017, Yourganov 2016). The other 16 were assessed on the abstract alone because no route gave a text: Hess 2018, Brett 2001, Ripollés 2012, Lambin 2017, Gharibi 2026, Liao 2023, Hu 2024, Commowick 2021, Wang 2024, Karnath 2019, Roca 2020, Traverso 2020, Zhao 2022, Lu 2021, Xu 2022 and Rajashekar 2020; each annotation lists the routes and their results. Full texts were also obtained for the four excluded candidates. Four candidates were excluded at Phase B:
  - Balakrishnan et al. 2019 (VoxelMorph), by (f): a primary learning-based registration method paper (full text, arXiv 1809.05231); no prediction study screened in this run names it as its alignment step.
  - Kim et al. 2022 (MGMT methylation prediction and the BraTS 2021 radiogenomic challenge), by (e): the full text states skull stripping and rigid co-registration of each patient's four sequences, with 8 patients excluded for poor co-registration, before CNN classification of the whole images. The study does not vary or measure that step and uses no alignment across subjects, radiomics aggregation or lesion set, so it reports an outcome with no methodological content on alignment.
  - arXiv 2503.23042 (MIL versus aggregation for whole-slide images), by the relevance gate for this group: the full text confirms that its instances are histopathology slides of renal cell carcinoma, not radiological lesions or regions.
  - Han et al. 2020 (growth patterns of colorectal liver metastases from multi-habitat MRI radiomics), by (e): the full text (Europe PMC XML) shows that each lesion is a sample, that the tumour-zone and tumour-liver-interface signatures are modelled separately, and that only the interface signature enters the final model, so no per-lesion or per-region features are combined into a subject-level prediction.
- Final included sources: 77 (peer-reviewed 76/77, counting NeurIPS and MICCAI proceedings and the Machine Learning for Biomedical Imaging journal; the ANTs report of Avants 2009 is a technical report in the Insight Journal, whose review process was not checked in this run, and is counted apart).
- Changes made at Phase B from the full texts read in the full-text pass over the first 60. Inclusion: no included source was excluded and no excluded candidate was included; the reason for excluding Kim 2022 was restated from its full text. Quality: Thakran 2022, Wilk 2025, Coll 2023 and Cavinato 2023 have revised quality notes (the score stays Medium, Medium, Medium and Low; the notes that rested on "abstract only" now rest on the cohort and the reported variability); Hu 2024 stays Low on its abstract. Stance: Cavinato 2023 changed from "supports" to "neutral" (the full text shows no comparison with a fixed rule or a single-lesion model), and Carass 2017 changed from "neutral" to "supports" (its inter-rater comparison measures the variability of the lesion set itself). Annotation content: the fields of the other sources read in this pass were extended with figures and preprocessing steps from the full text; the correspondence fields of Bowren 2022, Coll 2023, Forkert 2015, Salvalaggio 2020 and Menze 2015 now state the registration each used.

### Annotated Bibliography

Stance tags refer to one proposition: "the step, as used ahead of a subject-level predictor, introduces error, variability or information loss that changes the prediction". A source tagged "supports" measures or reports such an effect. A source tagged "opposes" finds that the choice made at the step leaves the prediction unchanged. A source tagged "neutral" describes or standardizes the step without that test.

#### Registration, templates and spatial normalization

### Sotiras, Davatzikos and Paragios (2013). Deformable Medical Image Registration: A Survey.
- **Type**: Journal article (survey), IEEE TMI.
- **Method**: Narrative survey that decomposes deformable registration into its components and reviews each.
- **Key Findings**: Names population modeling and statistical atlases as one of the main uses of deformable registration, next to multi-modality fusion and longitudinal studies, and organizes the methods by deformation model, matching criterion and optimization. Registration of a normal atlas to a brain with a tumour is treated as a topological mismatch that needs a tumour growth or expansion model. The discussion states that registration is hard to validate because the true correspondences between images are unknown, and that the notion of correspondence should depend on the application.
- **Step**: registration. **Correspondence assumed**: a dense, smooth spatial map between each image and a reference or template; for pathological brains, a map that must first model the tissue with no counterpart in the atlas. **Error measured**: none downstream; the survey names the missing ground truth as the obstacle to measuring registration error. **Aggregation**: not applicable.
- **Relevance**: the reference account of the step that methods for non-aligned data remove, including its own statement that correspondence has no ground truth.
- **Quality**: High; widely cited survey in a Q1 journal; predates learning-based registration.
- **Stance**: neutral.
- **Potential Use**: Introduction; Related work on registration.
- **Found by**: OA1.
- **Read**: methods and results, from the full text (PMC copy, XML); read the sections on statistical deformation models, pathological brain registration and the discussion.

### Haskins, Kruger and Yan (2020). Deep learning in medical image registration: a survey.
- **Type**: Journal article (survey), Machine Vision and Applications.
- **Method**: Narrative survey of deep learning registration.
- **Key Findings**: States that image correspondence through registration is needed for image fusion, organ atlas creation and tumour growth monitoring, and traces the move from learned similarity metrics to direct transformation prediction. The conclusion names the shared open problems: no robust multimodal similarity metric, few large datasets, the difficulty of obtaining segmentations and ground-truth registrations, and the quantification of a model's uncertainty.
- **Step**: registration (learning-based). **Correspondence assumed**: a dense voxel map to a fixed or moving image. **Error measured**: none downstream. **Aggregation**: not applicable.
- **Relevance**: background for learning-based alignment used before prediction.
- **Quality**: Medium; survey without quantitative comparison.
- **Stance**: neutral.
- **Potential Use**: Related work on registration.
- **Found by**: OA1.
- **Read**: methods and results, from the full text (arXiv version 1903.02026v2, reached through Unpaywall); read the introduction, the atlas-construction passages and the conclusion.

### Fu, Lei, Wang, Curran, Liu and Yang (2020). Deep learning in medical image registration: a review.
- **Type**: Journal article (review), Physics in Medicine and Biology.
- **Method**: Review in seven method categories with a comparison of reported results on lung and brain benchmark datasets.
- **Key Findings**: Classifies over 150 deep learning registration papers into seven non-exclusive categories. On the DIRLAB lung landmarks, the listed deep learning methods had not yet reached the target registration error of the best traditional methods. Brain registration papers used no common database or metric, so the review lists their datasets and metrics instead of ranking them; Dice over several regions was the most common metric.
- **Step**: registration. **Correspondence assumed**: dense voxel correspondence. **Error measured**: registration accuracy on benchmarks only, not downstream prediction. **Aggregation**: not applicable.
- **Relevance**: background; gives the benchmark datasets on which registration error is measured and shows that brain registration accuracy is reported on inconsistent terms.
- **Quality**: Medium.
- **Stance**: neutral.
- **Potential Use**: Related work on registration.
- **Found by**: PM2.
- **Read**: methods and results, from the full text (PMC copy through NCBI efetch, after the Europe PMC full text returned HTTP 500); read the benchmark, statistics and discussion sections.

### Chen, Liu, Wei, Bian, Subramanian, Carass, Prince and Du (2025). A survey on deep learning in medical image registration: New technologies, uncertainty, evaluation metrics, and beyond.
- **Type**: Journal article (survey), Medical Image Analysis.
- **Method**: Narrative survey covering architectures, losses, registration uncertainty and evaluation metrics.
- **Key Findings**: Covers registration uncertainty estimation and evaluation metrics, and lists atlas construction and multi-atlas segmentation among the applications of learning-based registration. Traditional atlases built by iterative averaging blur regions of high-frequency deformation, and atlases learned during training cannot be rebuilt at test time, which group-wise registration addresses. Registering an atlas to an image with a tumour violates the one-to-one assumption of diffeomorphic registration, which metamorphic models address. Registration uncertainty has no ground truth against which it can be validated, and its use as a weight in atlas-based segmentation is named as unexplored.
- **Step**: registration and atlas construction. **Correspondence assumed**: dense diffeomorphic correspondence to a template, which the survey states fails where pathology has no counterpart in the atlas. **Error measured**: reviews uncertainty estimation, not its downstream effect on prediction; cites one longitudinal Alzheimer's study in which smoothing weighted by registration uncertainty improved classification. **Aggregation**: not applicable.
- **Relevance**: the most recent survey; its uncertainty section is the nearest the registration literature in this set comes to a per-subject error estimate, and its metamorphic-registration section states the correspondence failure for lesioned images.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Related work on registration; Discussion of registration uncertainty.
- **Found by**: PM2, AX1.
- **Read**: methods and results, from the full text (PMC copy, XML); read the sections on atlas construction, multi-atlas segmentation, uncertainty, metamorphic registration and spatial normalization.

### Hering, Hansen, Mok et al. (2023). Learn2Reg: Comprehensive Multi-Task Medical Image Registration Challenge, Dataset and Evaluation in the Era of Deep Learning.
- **Type**: Journal article (challenge), IEEE TMI.
- **Method**: Multi-task registration challenge across brain, abdomen and thorax, CT, MR and ultrasound, with intra- and inter-patient tasks; over 65 submissions from more than 20 teams.
- **Key Findings**: No single approach was best across all tasks. Conventional registration methods were not found to be necessarily slower than deep learning methods. Metrics covered robustness, accuracy, plausibility and runtime. In the OASIS inter-subject brain task (416 scans, 35 FreeSurfer labels), most methods reached Dice of 80 to 90% on the easier cases and differed mainly on the hardest 30%. In the label-bias analysis, inter-patient tasks lost accuracy on structures left out of training labels, while the intra-patient task showed almost no such loss.
- **Step**: registration (inter-patient tasks included). **Correspondence assumed**: anatomical correspondence measured by label overlap and landmarks. **Error measured**: registration accuracy; the label-bias experiment shows that inter-subject correspondence is weaker for structures the method was not supervised on; no downstream prediction. **Aggregation**: not applicable.
- **Relevance**: the benchmark for how well subjects can be brought into correspondence before a group analysis, and evidence that the quality of that correspondence depends on which structures were labelled during training.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Related work on registration; Methods, if a registration baseline is needed.
- **Found by**: PM2.
- **Read**: methods and results, from the full text (arXiv version 2112.04489v3, reached through Unpaywall after the IEEE page returned HTTP 502); read the task descriptions, the OASIS and hippocampus results and the label-bias analysis.

### Avants, Tustison, Song, Cook, Klein and Gee (2011). A reproducible evaluation of ANTs similarity metric performance in brain image registration.
- **Type**: Journal article (tool evaluation), NeuroImage. Foundational, outside the search period.
- **Method**: Two-fold cross-validation on 40 labeled T1-weighted brains (LPBA40) comparing three similarity metrics within the ANTs template-based normalization.
- **Key Findings**: Mutual information for the affine step combined with cross-correlation for the diffeomorphic step gave the best cortical labeling (Jaccard 0.669, abstract). In each fold a template was built from one group of 20 brains and the left-out brains were mapped to the other group's template. Brain extraction was very sensitive to the quality of the affine initialization and less sensitive to the deformable metric. Templates built from different subgroups and metrics agreed with each other beyond the repeatability of human raters after deformable registration.
- **Step**: registration tool and template building. **Correspondence assumed**: one diffeomorphic map per subject to a population template. **Error measured**: labeling overlap and template similarity across subgroups, not prediction. **Aggregation**: not applicable.
- **Relevance**: ANTs is the registration used by Jühling 2024 and Thakran 2022, and Salvalaggio 2020 cites this paper for the diffeomorphic registration of its BCBtoolkit pipeline.
- **Quality**: High; 5,298 citations in OpenAlex.
- **Stance**: neutral.
- **Potential Use**: Methods (registration baseline); Related work.
- **Found by**: Layer 2, references of Jühling 2024.
- **Read**: methods and results, from the full text (PMC copy, XML); read the methods (LPBA40 data, cross-validation design) and the results and discussion on metrics and template stability.

### Avants, Tustison and Song (2009). Advanced Normalization Tools: V1.0.
- **Type**: Technical report (software), The Insight Journal. Foundational, outside the search period.
- **Method**: Documentation of the ANTs toolkit: transformation models (affine, elastic, diffeomorphic SyN and variants), similarity metrics and their combination in one objective (deformation cost plus data terms), optimal template construction (buildtemplate scripts), template-based segmentation, and application recipes.
- **Key Findings**: The report states that the optimal template stabilizes at about ten images for most populations and is defined, for SyN, as the image of minimum shape and appearance distance to the group. For brains with stroke or traumatic lesions, which "violate the basic assumption of a one-to-one mapping from a template image to a target image", ANTs offers constrained cost function masking: the mapping inside the masked lesion is determined by the solution outside it, and the lesion is then carried to template space by the inverse transform. The report cites an independent evaluation that ranked ANTs among the top of 14 normalization methods on control data.
- **Step**: registration tool and template construction. **Correspondence assumed**: one diffeomorphic map per subject to a template; outside a masked lesion only, for lesioned brains. **Error measured**: none in the report. **Aggregation**: not applicable.
- **Relevance**: the tool and lesion-masking procedure that Pustina 2017 names as its alignment step (antsRegistrationSyN with cost function masking), and the registration used by Jühling 2024 and Thakran 2022.
- **Quality**: Medium; a technical report, 1,310 citations in OpenAlex.
- **Stance**: neutral.
- **Potential Use**: Methods (registration baseline).
- **Found by**: Layer 2, references of Jühling 2024 (citation loop).
- **Read**: methods and results, from the full text (the Insight Journal PDF, linked from the article page that Unpaywall lists; no PMCID); read the introduction, the sections on transformation models, similarity terms and optimal template construction, and the section on brain mapping in the presence of lesions.

### Shamonin, Bron, Lelieveldt, Smits, Klein and Staring (2013). Fast parallel image registration on CPU and GPU for diagnostic classification of Alzheimer's disease.
- **Type**: Journal article (tool paper with a classification study), Frontiers in Neuroinformatics.
- **Method**: Acceleration of elastix, then SVM classification of Alzheimer's disease versus controls in 299 ADNI participants using voxel-wise and region-wise grey matter features.
- **Key Findings**: Voxel-wise features were extracted in a common template space and region-wise features from 72 regions labeled by multi-atlas segmentation with 30 atlases (full text). AUC was 88% (voxel-wise) and 90% (region-wise), the same for standard and accelerated registration.
- **Step**: registration to a template and multi-atlas region labeling. **Correspondence assumed**: voxel correspondence to a common template, or matched regions across subjects. **Error measured**: none for registration error itself; the speed-up left AUC unchanged. **Aggregation**: per-region grey matter volumes form a fixed-length subject vector.
- **Relevance**: a direct example of the voxel-wise and region-wise designs that rest on registration before subject-level classification.
- **Quality**: Medium.
- **Stance**: neutral.
- **Potential Use**: Introduction (the standard pipeline); Methods (region-wise baseline).
- **Found by**: OA6.
- **Read**: methods and results, from the full text fetched in the first screening pass.

### Thakran, Cohen, Jahani et al. (2022). Impact of deformable registration methods for prediction of recurrence free survival response to neoadjuvant chemotherapy in breast cancer.
- **Type**: Journal article, Translational Oncology.
- **Method**: Six deformable registration methods (ANTs, DRAMMS, ART, NiftyReg, SSD-FFD, NMI-FFD) aligned two DCE-MRI visits of 130 women; radiomic features of parametric response maps entered Cox models for recurrence-free survival.
- **Key Findings**: The baseline model with clinical covariates and functional tumour volume (F2) had a full-model C-statistic of 0.63 (cross-validated 0.53). Adding radiomic features computed from kinetic maps differenced without registration (F3) gave 0.66 (cross-validated 0.55). With registration, ANTs gave 0.72 (cross-validated 0.63, SD 0.07) and was the only method with a significant improvement (p = 0.01); DRAMMS gave 0.70 (p = 0.05), NiftyReg 0.68, NMI-FFD and SSD-FFD 0.67, and ART 0.66 (cross-validated 0.54). Mean landmark error was 3.12 mm between experts, 5.40 mm for ANTs and 10.33 mm for ART, and the C-statistic followed the landmark error ranking. Twelve scans were excluded because registration failed.
- **Step**: registration (intra-subject, longitudinal) feeding radiomics. **Correspondence assumed**: voxel correspondence between visits of the same subject. **Error measured**: yes; the registration method and its landmark error change the survival C-statistic, and a registration-free variant of the same features is reported. **Aggregation**: four principal components of the radiomic features of the parametric response maps of one tumour per subject.
- **Relevance**: one of the included studies that measure how the choice of registration propagates into a subject-level prediction, and the only one in this set that reports a registration-free variant of the same features.
- **Quality**: Medium; single trial cohort (130 women, 38 events), three-fold cross-validated C-statistics with wide spread, and one of six methods significant.
- **Stance**: supports.
- **Potential Use**: Introduction; Discussion of registration error.
- **Found by**: PM4.
- **Read**: methods and results, from the full text (Europe PMC XML); read the methods (cohort, registration methods, feature construction, models F1 to F9) and the results (landmark errors, C-statistics).

### Jühling, Rajashekar, Cheng, Hilgetag, Forkert and Werner (2024). Spatial normalization for voxel-based lesion symptom mapping: impact of registration approaches.
- **Type**: Journal article, Frontiers in Neuroscience.
- **Method**: Lesion segmentations of 122 acute stroke patients normalized to an atlas with affine, nonlinear, nonlinear with cost function masking and enantiomorphic registration (ANTs), then uni- and multivariate lesion-symptom mapping against 30-day mRS.
- **Key Findings**: The brain areas found important for mRS were largely consistent across registration approaches. The nonlinear variants distorted the patient images, and the lateral ventricles and adjacent areas stayed misaligned with the atlas even after nonlinear registration. The authors question the benefit of nonlinear registration for this design.
- **Step**: registration of lesioned brains to an atlas. **Correspondence assumed**: voxel correspondence between lesioned brains and a healthy template. **Error measured**: yes; distortion, ventricle misalignment and lesion volume change after registration (full text, sections 2.4.1 and 2.4.2). **Aggregation**: voxel-wise lesion maps in atlas space.
- **Relevance**: the direct measurement of what registration does to lesion maps before outcome modeling.
- **Quality**: Medium.
- **Stance**: supports (for distortion); the outcome maps themselves were stable.
- **Potential Use**: Introduction; Discussion of registration error.
- **Found by**: PM16, PM17.
- **Read**: methods and results, from the full text fetched in the first screening pass; its introduction was reread in this pass for the context in which it cites Crinion 2007, Nachev 2008 and Andersen 2010.

### Arthofer, Smith, Douaud et al. (2024). Internally consistent and fully unbiased multimodal MRI brain template construction from UK Biobank: Oxford-MM.
- **Type**: Journal article (template construction), Imaging Neuroscience.
- **Method**: Iterative multiresolution construction of an unbiased T1, T2-FLAIR and DTI template from 240 individuals, and age-dependent templates from 37,330 individuals with a Gaussian process.
- **Key Findings**: In 128 held-out UK Biobank subjects, mean pairwise Dice of FreeSurfer regions warped to template space was 13.17% higher (cortical) and 4.74% higher (subcortical) with registration to OMM-1 than to MNI 152, and registration through an age-matched template added a further 0.5% and 0.28%. The gains were significant in most regions (for OMM-1 over MNI 152, 51 of 63 cortical and 23 of 32 subcortical regions). In 100 HCP subjects, the 45-year template added 0.66% and 0.35% over OMM-1, and multimodal registration to OMM-1 outperformed T1 registration to MNI 152 by 3.31% and 1.77%. The authors note that overlap of automatic segmentations mixes segmentation and registration error.
- **Step**: unbiased group-wise template construction. **Correspondence assumed**: a common reference space representing the average shape of the population. **Error measured**: registration accuracy depends on the template chosen, measured as region overlap across subjects. **Aggregation**: not applicable.
- **Relevance**: shows that the template itself is a source of alignment error, which learned templates and barycenters address.
- **Quality**: High.
- **Stance**: supports.
- **Potential Use**: Related work on templates.
- **Found by**: PM3.
- **Read**: methods and results, from the full text (Europe PMC XML); read the methods (construction, validation design) and the results and discussion on spatial normalization.

### Dalca, Rakic, Guttag and Sabuncu (2019). Learning Conditional Deformable Templates with Convolutional Networks.
- **Type**: Conference paper, NeurIPS 2019.
- **Method**: Probabilistic diffeomorphic model with a network that learns a universal or attribute-conditional template jointly with the registration network.
- **Key Findings**: Learns templates on demand conditioned on attributes such as age and sex. The authors note that a template chosen from one image can bias analyses, and that conditional templates help with confounders (full text, introduction).
- **Step**: learned group-wise template. **Correspondence assumed**: every image is a smooth deformation of a (conditional) template. **Error measured**: none downstream. **Aggregation**: not applicable.
- **Relevance**: the learned-template answer to missing correspondence on the registration side.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Related work on learned templates; Discussion.
- **Found by**: OA2.
- **Read**: methods and results, from the full text fetched in the first screening pass.

### Dey, Ren, Dalca and Gerig (2021). Generative Adversarial Registration for Improved Conditional Deformable Templates.
- **Type**: Conference paper, ICCV 2021.
- **Method**: Adversarial training of conditional template estimation and registration.
- **Key Findings**: Templates from regularized registration objectives alone are often blurry or anatomically implausible, which confounds downstream interpretation. On neonatal (dHCP, 558 T2-weighted images), Huntington's disease (Predict-HD) and face data, the adversarial templates were sharper, more central and more specific to age and disease attributes, at Dice and Jacobian values comparable to the other deep network methods.
- **Step**: learned conditional template. **Correspondence assumed**: deformation of a covariate-conditioned template. **Error measured**: template quality (sharpness, centrality, Dice to test data), not prediction. **Aggregation**: not applicable.
- **Relevance**: learned templates as the reference space for standardized downstream analyses, including a premature-birth cohort with hemorrhages and lesions.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Related work on learned templates.
- **Found by**: OA2, AX1.
- **Read**: methods and results, from the full text (arXiv version 2105.04349v2, reached through Unpaywall); read the introduction, the dataset descriptions and the quantitative evaluation.

### Abulnaga, Hoopes, Dey, Hoffmann, Fischl, Guttag and Dalca (2025). MultiMorph: On-Demand Atlas Construction.
- **Type**: Conference paper, CVPR 2025.
- **Method**: Feedforward network with a linear group-interaction layer that builds a population-specific atlas in one forward pass.
- **Key Findings**: Reports that the cost of building a new atlas leads most studies to use existing atlases that may not suit their population or modality, which harms their analyses. Takes a group of any size and predicts diffeomorphic maps to a space central to that group in one forward pass. On held-out IXI data it built atlases over 100 times faster than ANTs and AtlasMorph with the highest Dice. In the ablation, the centrality layer reduced the centrality measure 1000-fold at a cost of 1 Dice point, the group layer added 1.4 Dice points, and mean, variance and max as the group statistic performed alike.
- **Step**: learned group-wise template. **Correspondence assumed**: group-wise deformable correspondence to a space whose mean deformation is zero. **Error measured**: atlas quality, not prediction. **Aggregation**: the GroupBlock layer computes a summary statistic (the mean) of the feature maps across the group and concatenates it back to each image's features at every layer.
- **Relevance**: a recent learned template whose group layer is a mean over a variable-size set of subjects, the same permutation-invariant operation that set encoders use.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Related work on learned templates.
- **Found by**: PM3, OA2.
- **Read**: methods and results, from the full text (PMC copy PMC13089913, XML); read the method (group registration, GroupBlock, centrality layer) and the experiments and ablation.

### Hess, Hinz, Keliris and Boehm-Sturm (2018). On the Usage of Brain Atlases in Neuroimaging Research.
- **Type**: Journal article (review), Molecular Imaging and Biology.
- **Method**: Narrative review of human and animal atlas databases and registration-based workflows.
- **Key Findings**: Describes common atlas-based workflows built on registration.
- **Step**: atlases and registration. **Correspondence assumed**: atlas labels transferred by registration. **Error measured**: none. **Aggregation**: atlas regions.
- **Relevance**: background only.
- **Quality**: Low; short review, background relevance.
- **Stance**: neutral.
- **Potential Use**: Introduction.
- **Found by**: PM1.
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (not open access, no location); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (closed, publisher and PubMed only); publisher page (Springer, HTTP 200 without the article body).

### Nenoff, Amstutz, Murr et al. (2023). Review and recommendations on deformable image registration uncertainties for radiotherapy applications.
- **Type**: Journal article (review with recommendations), Physics in Medicine and Biology.
- **Method**: Literature review of the sources of deformable registration uncertainty and their impact in radiotherapy.
- **Key Findings**: Geometric uncertainty of deformable registration can be large and hard to quantify, and reporting of uncertainty quantification in clinically implemented registration is not standardized. The authors judge the geometric metrics and thresholds of AAPM TG-132 insufficient for dose mapping and accumulation. In voxel-based outcome modelling, each patient's dose is mapped by inter-patient deformable registration to an arbitrarily chosen reference CT; registration uncertainty is usually handled by blurring the mapped doses, which lowers the significance of small radiosensitive regions and changes their shape.
- **Step**: registration, including inter-patient registration ahead of voxel-based outcome models. **Correspondence assumed**: voxel correspondence between each patient and one reference anatomy. **Error measured**: reviewed, in radiotherapy dose applications; the outcome-modelling section states the effect of registration uncertainty on the regions a dose-outcome model finds. **Aggregation**: voxel-wise dose maps in the reference anatomy; the dose to an identified region enters a multivariable model.
- **Relevance**: the review of registration error that this set holds; its outcome-modelling section describes a subject-level predictor built on inter-patient registration and the loss that registration uncertainty causes.
- **Quality**: Medium.
- **Stance**: supports.
- **Potential Use**: Discussion of registration error.
- **Found by**: PM1.
- **Read**: methods and results, from the full text (Europe PMC XML); read the sections on sources and quantification of uncertainty, outcome modelling based on voxel-based analyses, tolerances and recommendations.

### Coll, Pareto, Carbonell-Mirabent et al. (2023). Global and Regional Deep Learning Models for Multiple Sclerosis Stratification From MRI.
- **Type**: Journal article, Journal of Magnetic Resonance Imaging.
- **Method**: 3D CNN classifying EDSS >= 3 versus < 3 from whole-brain input or from one of five tissue regions, in 319 patients with external validation on 440.
- **Key Findings**: In-house, the grey matter model reached 81% accuracy and the global model 79%. Externally, the white matter model reached 72% and the global model 71%; the authors judge the global model the best trade-off.
- **Step**: registration to MNI152, lesion segmentation and tissue parcellation as the input of a subject-level predictor. **Correspondence assumed**: voxel correspondence in MNI152 space after linear and nonlinear registration; region masks taken from the population average of the study; grey matter input modulated by the Jacobian determinant of the nonlinear registration to keep native-space volume. Automatic lesion segmentation was used only to fill lesions in the T1-weighted scans before parcellation. **Error measured**: the effect of input region on accuracy; a post-hoc analysis found an association between white matter lesion load and model output. **Aggregation**: none; the CNN takes one region or the whole brain as an image.
- **Relevance**: subject-level prediction in MS where the input rests on template registration and the lesions are filled in, not used as a set.
- **Quality**: Medium; one in-house cohort with external validation without retraining.
- **Stance**: supports.
- **Potential Use**: Related work on subject-level prediction in MS.
- **Found by**: OA4.
- **Read**: methods and results, from the full text (PDF on the UAB repository ddd.uab.cat, reached through Unpaywall after Wiley returned HTTP 403); read the methods (preprocessing, input strategies, cross-validation) and the results and discussion.

### Brett, Leff, Rorden and Ashburner (2001). Spatial Normalization of Brain Images with Focal Lesions Using Cost Function Masking.
- **Type**: Journal article, NeuroImage. Foundational, outside the search period.
- **Method**: Cost function masking evaluated on brains with focal lesions and on normal brains with simulated lesions.
- **Key Findings**: Automated normalization reduces mismatch at the lesion site and can distort the image, especially with nonlinear transforms. Masking the lesion from the cost function outperformed affine-only normalization.
- **Step**: registration of lesioned brains. **Correspondence assumed**: correspondence outside the lesion; none inside it. **Error measured**: normalization distortion. **Aggregation**: not applicable.
- **Relevance**: the alignment step that lesion-symptom mapping studies use; it shows that a lesion breaks the correspondence assumption of template registration.
- **Quality**: High; 1,012 citations in OpenAlex.
- **Stance**: supports.
- **Potential Use**: Introduction; Related work on registration of pathological brains.
- **Found by**: Layer 2, references of Jühling 2024.
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (not open access, no location); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (closed; the submitted version listed on UCL Discovery returned HTTP 403); publisher page (Elsevier link resolver, 2.7 kB without the article body). The study design is also described in the Methods of Crinion 2007, which reused its simulated-lesion images.

### Ripollés, Marco-Pallarés, de Diego-Balaguer et al. (2012). Analysis of automated methods for spatial normalization of lesioned brains.
- **Type**: Journal article (benchmark), NeuroImage. Foundational, outside the search period.
- **Method**: 500 artificial lesions built from resection, stroke and healthy brains; comparison of cost function masking, automatic lesion identification, DARTEL and SyN with constrained masking.
- **Key Findings**: DARTEL with an extra prior gave the most accurate normalization in both patient groups but shrank lesion volume relative to unified segmentation with cost function masking.
- **Step**: registration of lesioned brains. **Correspondence assumed**: voxel correspondence to a healthy template. **Error measured**: normalization accuracy and lesion volume change. **Aggregation**: not applicable.
- **Relevance**: shows that the registration step changes lesion volume, an input of lesion-load predictors.
- **Quality**: Medium; 163 citations in OpenAlex.
- **Stance**: supports.
- **Potential Use**: Discussion of registration error.
- **Found by**: Layer 2, references of Jühling 2024.
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (not open access, no location); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (closed, publisher and PubMed only); publisher page (Elsevier link resolver, 2.7 kB without the article body).

### Crinion, Ashburner, Leff, Brett, Price and Friston (2007). Spatial normalization of lesioned brains: Performance evaluation and impact on fMRI analyses.
- **Type**: Journal article (evaluation), NeuroImage. Foundational, outside the search period.
- **Method**: The simulated-lesion images of Brett et al. 2001 (ten normal brains, each with ten lesions taken from real patients) and 24 anatomical landmarks were used to compare affine, standard nonlinear and unified segmentation normalization, each with and without cost function masking, at three regularization levels. The effect on fMRI was tested in 18 stroke patients.
- **Key Findings**: Unified segmentation gave smaller landmark dispersion in normal brains (RMS 4.55 mm versus 5.82 mm for standard normalization). In lesioned brains, its deformations were closer to the deformations of the same brain without the lesion (RMSD 1.64 mm without masking versus 5.29 mm for standard normalization). The choice of normalization changed the group fMRI activations of the stroke patients, and unified segmentation co-localized the bilateral superior temporal activations best. The authors state that the normalization error of a lesioned brain is maximal inside the lesion and also affects peri-lesional tissue.
- **Step**: registration of lesioned brains to a template. **Correspondence assumed**: voxel correspondence to a healthy template, with the lesion modelled as an intensity variation by the unified model or excluded by a mask. **Error measured**: yes; normalization error relative to the unlesioned brain, and the change in a group analysis across patients. **Aggregation**: voxel-wise activation maps in template space.
- **Relevance**: shows that the alignment step changes a group result in lesioned brains, and gives the size of normalization error caused by a lesion.
- **Quality**: High; 340 citations in OpenAlex; ten brains for the anatomical evaluation.
- **Stance**: supports.
- **Potential Use**: Related work on registration of pathological brains; Discussion of registration error.
- **Found by**: Layer 2, references of Jühling 2024 (citation loop).
- **Read**: methods and results, from the full text (Europe PMC XML); read the methods (data, normalization procedures, three experiments) and the results and discussion.

### Nachev, Coulthard, Jäger, Kennard and Husain (2008). Enantiomorphic normalization of focally lesioned brains.
- **Type**: Journal article (registration tool with evaluation), NeuroImage. Foundational, outside the search period.
- **Method**: The lesioned region is replaced by the mirrored signal of the homologous region of the other hemisphere before nonlinear normalization. Evaluated against cost function masking and unmasked normalization with 305 real lesion shapes inserted into the scans of 50 clinical T2-weighted brains without stroke and 42 high-resolution T1-weighted brains.
- **Key Findings**: Measured as the RMS displacement between the deformation of the lesioned and the unlesioned version of the same brain, the enantiomorphic method was better than cost function masking for every subject and every one of the 305 lesions, on average by more than a factor of four in the T2 data. Error rose with lesion size for all methods. The voxel-wise contrast favoured the enantiomorphic method in every brain voxel, most strongly near the edges of the brain.
- **Step**: registration of lesioned brains (the enantiomorphic option evaluated by Jühling 2024 and used by Salvalaggio 2020). **Correspondence assumed**: that the hemispheres mirror each other and that a focal lesion does not cross the midline, so the healthy contralateral tissue supplies the missing correspondence. **Error measured**: normalization error caused by the lesion, by method and by lesion size. **Aggregation**: not applicable.
- **Relevance**: an alignment tool used ahead of lesion-based predictors, whose assumption (hemispheric symmetry) replaces the missing correspondence inside the lesion.
- **Quality**: High; 305 citations in OpenAlex; lesions simulated in normal brains.
- **Stance**: supports.
- **Potential Use**: Related work on registration of pathological brains; Methods (registration baseline for lesion maps).
- **Found by**: Layer 2, references of Jühling 2024 (citation loop).
- **Read**: methods and results, from the full text (Europe PMC XML); read the algorithm, evaluation, data and results sections.

### Andersen, Rapcsak and Beeson (2010). Cost function masking during normalization of brains with focal lesions: Still a necessity?
- **Type**: Journal article (evaluation), NeuroImage. Foundational, outside the search period.
- **Method**: High-resolution structural MRI of 49 consecutive patients with focal vascular lesions and language impairment, normalized by unified segmentation without a mask and with precise or rough, smoothed or unsmoothed lesion masks, plus simulated lesions in normal brains; deformation fields and normalized lesion volumes compared.
- **Key Findings**: In the 49 patients, the deformation without a mask differed from the precisely masked reference by 1.07 mm RMS, against 0.35 to 0.40 mm for the other masked conditions. In the simulated lesions, masking brought the deformation closer to that of the unlesioned brain (0.626 mm versus 1.047 mm), driven by the ten large lesions (1.07 mm versus 1.90 mm); small lesions showed no difference. Unmasked normalization gave significantly smaller normalized lesion volumes than every masked condition. Rough masks gave results equivalent to precise masks.
- **Step**: registration of lesioned brains. **Correspondence assumed**: correspondence outside the lesion only. **Error measured**: yes; normalization error and lesion volume change, both larger for large lesions. **Aggregation**: not applicable.
- **Relevance**: shows that the registration step changes lesion volume, a common input of lesion-load predictors, and that the error grows with lesion size.
- **Quality**: High; 237 citations in OpenAlex; a single stroke cohort.
- **Stance**: supports.
- **Potential Use**: Discussion of registration error.
- **Found by**: Layer 2, references of Jühling 2024 (citation loop).
- **Read**: methods and results, from the full text (PMC copy through NCBI efetch, after the Europe PMC full text returned HTTP 500); read the methods and results.

#### Radiomics standardization, reproducibility and outcome prediction

### Zwanenburg, Vallières, Abdalah, Aerts et al. (2020). The Image Biomarker Standardization Initiative: Standardized Quantitative Radiomics for High-Throughput Image-based Phenotyping.
- **Type**: Journal article (standardization study), Radiology.
- **Method**: Three-phase consensus of 25 teams on a digital phantom, a lung CT and a 51-patient sarcoma cohort.
- **Key Findings**: 169 of 174 radiomic features were standardized. Strong or better consensus was reached for 463 of 487 features (95.1%) in phase I and 1220 of 1347 (90.6%) in phase II, and most standardized features reproduced well on CT, PET and MRI. The gross tumour volume segmentation supplied with each image was used as the region of interest by every team. The authors state that acquisition, reconstruction and segmentation remain sources of variability that the study did not address, so features reproducible from the same image may still not be reproducible across centres or scanners.
- **Step**: radiomic feature computation. **Correspondence assumed**: none across subjects; features are computed inside each segmented region. **Error measured**: inter-software variability of feature values, with segmentation held fixed. **Aggregation**: not applicable.
- **Relevance**: the reference for what a "radiomic feature" of one lesion is before any aggregation, and its own statement that segmentation variability lies outside the standard.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Related work on radiomics; Methods (feature definitions).
- **Found by**: PM5.
- **Read**: methods and results, from the full text (the PMC article page, HTML, listed by Unpaywall; the Europe PMC full text returned HTTP 500 and NCBI efetch returned no body); read the methods, results and discussion. The arXiv record 1612.07003 that Unpaywall also listed is the IBSI reference manual, which was fetched and not used for this annotation.

### Whybra, Zwanenburg, Andrearczyk et al. (2024). The Image Biomarker Standardization Initiative: Standardized Convolutional Filters for Reproducible Radiomics and Enhanced Clinical Insights.
- **Type**: Journal article (standardization study), Radiology.
- **Method**: Three-phase study standardizing mean, Laplacian of Gaussian, Laws, Gabor, wavelet and Riesz filters across teams.
- **Key Findings**: Eight filter types were standardized; Riesz transformations were not. 458 of 486 filtered features were reproducible across nine teams (lower 95% CI of the ICC above 0.75). Features were computed from the gross tumour volume segmentation of each image, and the authors list acquisition, reconstruction, segmentation and data analysis as steps the study did not address.
- **Step**: radiomic feature computation (filtered features). **Correspondence assumed**: none across subjects. **Error measured**: inter-software reproducibility, with segmentation held fixed. **Aggregation**: not applicable.
- **Relevance**: completes the standardization of the per-lesion feature step.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Related work on radiomics.
- **Found by**: PM5.
- **Read**: methods and results, from the full text (the PMC article page, HTML, fetched directly after the Europe PMC full text returned HTTP 500, NCBI efetch returned no body, and the HAL and Cardiff repository copies listed by Unpaywall returned a bot-check page or HTTP 403); read the methods, results and limitations.

### Traverso, Wee, Dekker and Gillies (2018). Repeatability and Reproducibility of Radiomic Features: A Systematic Review.
- **Type**: Journal article (PRISMA systematic review), Int J Radiat Oncol Biol Phys.
- **Method**: 624 records, 41 full texts reviewed.
- **Key Findings**: Feature repeatability and reproducibility depend on acquisition, reconstruction, preprocessing and software. First-order features were more reproducible than shape and texture features. Only 7 of the 35 human studies reported every methodological aspect, and six gave too little detail on the segmentation that defined the region of interest. Three PET studies of multiple manual delineations found that inter-observer differences affected feature reproducibility, and semiautomated segmentation improved it; in the one multicentre CT study, shape and texture features varied most with segmentation and size measures least.
- **Step**: radiomics, including the segmentation that defines each region. **Correspondence assumed**: none. **Error measured**: reviewed feature variability, including variability due to delineation. **Aggregation**: not applicable.
- **Relevance**: evidence that per-lesion features carry pipeline and delineation variability into any subject-level aggregate.
- **Quality**: High.
- **Stance**: supports.
- **Potential Use**: Related work on radiomics; Discussion.
- **Found by**: PM6.
- **Read**: methods and results, from the full text (Europe PMC XML); read the methods and results, including the sections on segmentation.

### Pfaehler, Zhovannik, Wei et al. (2021). A systematic review and quality of reporting checklist for repeatability and reproducibility of radiomic features.
- **Type**: Journal article (systematic review), Physics and Imaging in Radiation Oncology.
- **Method**: 451 abstracts from 2017 to 2020, 42 full texts, with a proposed reporting checklist.
- **Key Findings**: All radiomic features were sensitive to acquisition, reconstruction, tumour segmentation and interpolation, to a degree that depends on the feature; texture features were less robust than statistical features. Of the 42 studies, 29 were clinical. In one lung PET study the shape feature sphericity changed its prognostic value with the delineation, and in CT studies contours by different clinicians changed the prognostic value of features; semiautomated and automated segmentation gave more stable results. All but two studies did not report how the binary mask was created from the segmentation.
- **Step**: radiomics (including the segmentation input). **Correspondence assumed**: none. **Error measured**: reviewed sensitivity to segmentation, including reported changes in prognostic value. **Aggregation**: not applicable.
- **Relevance**: names segmentation as a source of feature variability that reaches prognostic models.
- **Quality**: Medium.
- **Stance**: supports.
- **Potential Use**: Related work on radiomics.
- **Found by**: PM6.
- **Read**: methods and results, from the full text (Europe PMC XML); read the methods, results and discussion.

### Zhao (2021). Understanding Sources of Variation to Improve the Reproducibility of Radiomics.
- **Type**: Journal article (review), Frontiers in Oncology.
- **Method**: Review of sources of variation in CT acquisition, tumour segmentation and feature extraction in lung cancer.
- **Key Findings**: Sources of variation exist at each step of the radiomics workflow, some controllable and some unknown, and reporting gaps hinder translation. The segmentation section treats multiple disease sites: lesions in different organs differ in contrast to their surroundings, so segmentation difficulty and its effect on texture and boundary features vary by site. A cited pilot study in 46 NSCLC patients segmented by three radiologists found EGFR prediction AUCs of 0.79, 0.85 and 0.91, with a different top feature for each radiologist's segmentation.
- **Step**: radiomics and segmentation. **Correspondence assumed**: none. **Error measured**: reviewed; reports the change in a prediction model's AUC with the reader who segmented. **Aggregation**: not applicable.
- **Relevance**: background on step-wise variability, with a reported case of inter-reader segmentation changing a patient-level prediction.
- **Quality**: Medium; narrative review with no search method section.
- **Stance**: supports.
- **Potential Use**: Discussion.
- **Found by**: PM6.
- **Read**: methods and results, from the full text (Europe PMC XML); read the sections on lesion segmentation (methods and variability, multiple disease sites, inter-reader effect on a prediction model) and on harmonization and prediction models.

### Lambin, Leijenaar, Deist et al. (2017). Radiomics: the bridge between medical imaging and personalized medicine.
- **Type**: Journal article (review), Nature Reviews Clinical Oncology.
- **Method**: Narrative review with guidance on evaluation and reporting (the radiomics quality score).
- **Key Findings**: Describes the radiomics process and its pitfalls, and states that the field lacks standardized evaluation of scientific integrity and clinical relevance.
- **Step**: radiomics workflow. **Correspondence assumed**: none across subjects. **Error measured**: none. **Aggregation**: not addressed.
- **Relevance**: the source of the radiomics quality score that outcome-prediction reviews apply.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Introduction; Related work on radiomics.
- **Found by**: Layer 2, references of Chang 2021.
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (open access, three locations: the Maastricht repository record, whose PDF link returned HTTP 403, and a Zenodo record that returned HTTP 410); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (the same repository records and an RWTH Aachen record that returned a 248-byte page); publisher page (Nature, HTTP 200 without the article body).

### Spadarella, Stanzione, Akinci D'Antonoli et al. (2022). Systematic review of the radiomics quality score applications.
- **Type**: Journal article (systematic review of reviews), European Radiology.
- **Method**: 44 systematic reviews that reported the radiomics quality score.
- **Key Findings**: From 345 records (135 after duplicates), 44 systematic reviews were included; 40 of 44 concerned oncological radiomics and 10 neuroradiology. The median RQS was 21.00% (IQR 11.50), with no significant difference between subgroups of application domain. The first RQS domain covers protocol quality and the reproducibility of imaging and segmentation; the authors did not aggregate item-level scores, and note that the RQS fits deep learning studies poorly.
- **Step**: radiomics-based outcome prediction. **Correspondence assumed**: none. **Error measured**: methodological quality, not pipeline error. **Aggregation**: not addressed.
- **Relevance**: the state of radiomics-based outcome prediction as reviews assess it.
- **Quality**: Medium.
- **Stance**: neutral.
- **Potential Use**: Introduction; Discussion.
- **Found by**: PM7.
- **Read**: methods and results, from the full text (Europe PMC XML); read the methods, results and limitations.

### Aerts, Velazquez, Leijenaar et al. (2014). Decoding tumour phenotype by noninvasive imaging using a quantitative radiomics approach.
- **Type**: Journal article, Nature Communications.
- **Method**: 440 CT features from 1,019 lung and head-and-neck cancer patients, validated in independent sets.
- **Key Findings**: Many radiomic features had prognostic power in independent datasets (for example, 238 of 440 features separated survival in the Lung2 validation set), and a prognostic signature capturing intratumour heterogeneity was associated with gene-expression patterns. Feature stability was measured on test-retest scans and on a multiple-delineation set in which five oncologists contoured the tumours of 21 patients; features stable under both had higher prognostic performance, and the signature was built from the 100 most stable features.
- **Step**: radiomics of one tumour per patient, contoured by experienced physicians. **Correspondence assumed**: none; one segmented primary tumour per patient. **Error measured**: delineation variability, used as a feature selection criterion. **Aggregation**: none (single lesion).
- **Relevance**: the foundational single-lesion design that multi-lesion work generalizes, and an early use of delineation stability to filter features. Cited by three of the four chained core papers.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Introduction.
- **Found by**: Layer 2 (cited by Geady 2025, Wilk 2025 and Chang 2021).
- **Read**: methods and results, from the full text (Europe PMC XML); read the results and methods.

### van Griethuysen, Fedorov, Parmar et al. (2017). Computational Radiomics System to Decode the Radiographic Phenotype.
- **Type**: Journal article (software), Cancer Research.
- **Method**: Description of the open-source PyRadiomics platform.
- **Key Findings**: PyRadiomics extracts a large panel of engineered features to address the lack of standardized algorithm definitions. In the LIDC-IDRI case study (429 nodules from 302 patients, each with four radiologist segmentations), feature stability across the four segmentations was high for LoG, first-order and texture features (median ICC 0.88 to 0.91) and moderate for shape (0.60) and wavelet (0.63) features. A random forest on 25 stable features reached AUC 0.79 for malignancy on the validation half.
- **Step**: radiomic feature extraction tool. **Correspondence assumed**: none. **Error measured**: stability of features across four manual segmentations of each lesion. **Aggregation**: not applicable; each nodule is a sample.
- **Relevance**: the extraction tool used by included aggregation studies (Sabouri 2025 and Gharibi 2026 name it), with its own measurement of sensitivity to delineation.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Methods.
- **Found by**: Layer 2 (cited by Geady 2025, Wilk 2025 and Chang 2021).
- **Read**: full text (PMC copy through NCBI efetch, after the Europe PMC full text returned HTTP 500); read the whole short article (platform description and case study).

### Kumar, Gu, Basu et al. (2012). Radiomics: the process and the challenges.
- **Type**: Journal article (review), Magnetic Resonance Imaging. Foundational, outside the search period.
- **Method**: Review that divides radiomics into image acquisition and reconstruction, segmentation, feature extraction and qualification, databases and data sharing, and statistical analysis, with the authors' own lung CT practice as the running example.
- **Key Findings**: Manual tumour boundaries "suffer from significant inter-reader bias and the reproducibility is low", and partly solid nodules, ground glass opacities and nodules attached to vessels or pleura remain hard to segment reproducibly. The review proposes qualifying features before modelling in three serial filters: test-retest reproducibility (concordance correlation coefficient of at least 0.85 on a test-retest lung CT set), dynamic range, and redundancy (correlation above 0.95 merged into one descriptor).
- **Step**: the radiomics pipeline from acquisition to model. **Correspondence assumed**: none; one tumour per sample. **Error measured**: none new; the review reports segmentation and test-retest variability from earlier work. **Aggregation**: not applicable.
- **Relevance**: an early statement that segmentation variability and feature reproducibility limit radiomic predictors, with the feature qualification rule later studies adopt.
- **Quality**: Medium; narrative review centred on the authors' lung CT work.
- **Stance**: neutral.
- **Potential Use**: Introduction; Related work on radiomics.
- **Found by**: Layer 2, references of Chang 2021 (citation loop).
- **Read**: methods and results, from the full text (PMC copy through NCBI efetch, after the Europe PMC full text returned HTTP 500); read the sections on segmentation challenges, segmentation performance metrics and feature qualification.

### Gillies, Kinahan and Hricak (2016). Radiomics: Images Are More than Pictures, They Are Data.
- **Type**: Journal article (review), Radiology.
- **Method**: Review of the radiomics process (acquisition, volume of interest identification, segmentation, feature extraction and qualification, databases, modelling), of results in diagnosis, prognosis and treatment selection, and of the challenges of reproducibility, data sharing and standards.
- **Key Findings**: The review calls segmentation "the most critical, challenging, and contentious component of radiomics", states that inter-operator variability of manual tumour contours is high, and reports a consensus toward computer-aided edge detection followed by manual curation. It notes that "most patients with cancer metastasis have multiple lesions", all of which must be identified as volumes of interest, and describes habitats, sub-volumes within a tumour defined by combining sequences. It requires validation on an independent data set and names test-retest studies with small samples as a gap.
- **Step**: the radiomics pipeline. **Correspondence assumed**: none stated. **Error measured**: none new. **Aggregation**: the review names multiple lesions per patient and habitats within a tumour without a rule for combining them.
- **Relevance**: a review that states the multi-lesion setting and the segmentation problem without an aggregation method.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Introduction.
- **Found by**: Layer 2, references of Wilk 2025 (citation loop).
- **Read**: methods and results, from the full text (Europe PMC XML); read the sections on volume of interest identification, segmentation, feature extraction and qualification, and reproducibility.

### Liu, Wang, Dong et al. (2019). The Applications of Radiomics in Precision Diagnosis and Treatment of Oncology: Opportunities and Challenges.
- **Type**: Journal article (review), Theranostics.
- **Method**: Review of radiomics methodology (acquisition and preprocessing, tumour segmentation, engineered and deep features, feature selection, modelling, validation) and of applications in brain, head and neck, breast, lung, colorectal, prostate, liver and gastric cancer, with a section on challenges.
- **Key Findings**: The review states that "it is the entire primary tumor that is usually analyzed", that there is no gold standard for tumour segmentation, and that intra-class correlation coefficients are usually used to keep only features stable across readers. Its challenges section places reproducibility and quality control across the whole pipeline and points to IBSI.
- **Step**: the radiomics pipeline. **Correspondence assumed**: none; one primary tumour per patient. **Error measured**: none new. **Aggregation**: not applicable; the single primary tumour is the stated default.
- **Relevance**: documents the single-tumour default of radiomic outcome prediction across cancer types.
- **Quality**: Medium; narrative review without a search method.
- **Stance**: neutral.
- **Potential Use**: Introduction; Related work on radiomics.
- **Found by**: Layer 2, references of Wilk 2025 (citation loop).
- **Read**: methods and results, from the full text (Europe PMC XML); read the methodology sections (segmentation, features, selection, validation) and the challenges section.

### van Timmeren, Cester, Tanadini-Lang, Alkadhi and Baessler (2020). Radiomics in medical imaging: "how-to" guide and critical reflection.
- **Type**: Journal article (review), Insights into Imaging.
- **Method**: Step-by-step guide to a radiomics analysis (segmentation, image processing, feature extraction, feature selection) and a review of the factors that change feature values in CT, PET and MRI, tabulated by study, with quality-control recommendations.
- **Key Findings**: Manual and semi-automatic segmentation introduce observer bias, many features are not robust to intra- and inter-observer delineation, and studies using them should test feature reproducibility and exclude unstable features. The review identifies 16 CT test-retest studies and notes that the common response to sensitivity to acquisition, reconstruction, delineation and preprocessing is to eliminate features, which can remove informative ones; it describes correction and harmonization as alternatives and points to IBSI, the radiomics quality score and TRIPOD.
- **Step**: the radiomics pipeline. **Correspondence assumed**: none. **Error measured**: none new; the review tabulates published robustness studies by factor. **Aggregation**: not applicable.
- **Relevance**: a review of how pipeline factors, delineation included, change radiomic inputs, with the trade-off of feature elimination stated.
- **Quality**: Medium; narrative review with tabulated studies and no search method section.
- **Stance**: supports.
- **Potential Use**: Related work on radiomics; Discussion.
- **Found by**: Layer 2, references of Geady 2025 (citation loop).
- **Read**: methods and results, from the full text (Europe PMC XML); read the four workflow steps, the sections on current limitations by modality, and the quality-control section.

### Traverso, Kazmierski, Zhovannik et al. (2020). Machine learning helps identifying volume-confounding effects in radiomics.
- **Type**: Journal article, Physica Medica.
- **Method**: 841 features extracted with open-source software from two public retrospective cohorts (lung and head and neck cancer); hierarchical clustering and principal component analysis related features to overall survival; bootstrapped logistic regression tested prognostic power and robustness.
- **Key Findings**: Over 80% of features had large pairwise correlations and nearly 30% correlated strongly with tumour volume. Clustering and principal component analysis on volume-independent features did not stratify patients by risk, and clinical predictors outperformed radiomic features.
- **Step**: radiomic feature selection. **Correspondence assumed**: none; one tumour per patient. **Error measured**: volume confounding of features. **Aggregation**: not applicable.
- **Relevance**: measures the volume confounding that Geady 2024 removes with a filter; an aggregate over a lesion set can carry the same confounding through total volume.
- **Quality**: Medium; assessed on the abstract.
- **Stance**: supports.
- **Potential Use**: Discussion.
- **Found by**: Layer 2, references of Geady 2025 (citation loop).
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (open access, four locations: the Physica Medica PDF, HTTP 403; the Elsevier link resolver, without the article body; the Maastricht University repository record, a record page without a file link; the Radboud repository PDF of the submitted version, HTTP 403); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (the same four locations and PubMed); publisher page (Elsevier link resolver, 2.6 kB without the article body).

### Poirot, Caan, Ruhe et al. (2022). Robustness of radiomics to variations in segmentation methods in multimodal brain MRI.
- **Type**: Journal article, Scientific Reports.
- **Method**: Scan-rescan T1 and DTI data of 46 subjects segmented by four automatic methods; Dice, ICC and sleep-deprivation classification compared.
- **Key Findings**: Segmentation agreement was high (Dice IQR 0.77 to 0.90) and feature robustness to segmentation (ICC > 0.7) exceeded scan-rescan reproducibility (ICC 0.3 to 0.8). Classification accuracy still differed significantly between segmentation methods, from 77% to 84%.
- **Step**: anatomical segmentation feeding radiomics. **Correspondence assumed**: matched anatomical regions across subjects. **Error measured**: yes; segmentation method changes subject-level accuracy by up to 7 points. **Aggregation**: per-region features concatenated into a subject vector.
- **Relevance**: a measured propagation of segmentation choice into a subject-level classifier in the brain.
- **Quality**: Medium; small cohort.
- **Stance**: supports.
- **Potential Use**: Discussion of segmentation error.
- **Found by**: PM9.
- **Read**: methods and results, from the full text fetched in the first screening pass.

### Chang, Joel, Chang et al. (2021). Comparison of radiomic feature aggregation methods for patients with multiple tumors.
- **Type**: Journal article, Scientific Reports.
- **Method**: Six aggregation methods over 3,596 brain metastases in 831 patients, evaluated with Cox, Cox-LASSO and random survival forest models.
- **Key Findings**: The volume-weighted average of the largest three metastases gave the highest C-index in all three models (0.627, 0.628 and 0.652). In the sub-analysis by number of metastases with the standard Cox model, the unweighted average was best for 5 to 10 metastases (0.697), and the largest metastasis plus the number of metastases for 11 or more (0.909) (full text, Table 3).
- **Step**: radiomics on manually segmented lesions, then aggregation. **Correspondence assumed**: none between lesions; a variable number of lesions per patient. **Error measured**: the aggregation choice changes the C-index by about 0.03. **Aggregation**: unweighted average, volume-weighted average, weighted average of the largest three, largest plus number, largest, smallest.
- **Relevance**: the reference comparison of fixed pooling rules for multi-lesion subject-level prediction.
- **Quality**: High.
- **Stance**: supports.
- **Potential Use**: Related work on aggregation; Methods (baselines).
- **Found by**: PM8, PM20.
- **Read**: methods and results, from the full text fetched in the first screening pass.

### Henry, Sun, Lerousseau et al. (2022). Investigation of radiomics based intra-patient inter-tumor heterogeneity and the impact of tumor subsampling strategies.
- **Type**: Journal article, Scientific Reports.
- **Method**: All visible tumours delineated in 43 metastatic lung cancer patients (602 lesions) and a melanoma cohort; per-patient coefficient of variation and six subsampling strategies compared with exhaustive sampling.
- **Key Findings**: Robust radiomic indexes varied by at least 20% across a patient's lesions. No subsampling strategy recovered the heterogeneity of exhaustive sampling; three random lesions recovered 67% of the average heterogeneity and three lesions per site 22% (full text, Table 2).
- **Step**: lesion selection after segmentation. **Correspondence assumed**: none between lesions. **Error measured**: information loss of lesion subsampling. **Aggregation**: pairwise lesion dissimilarity summarized by two heterogeneity indexes.
- **Relevance**: evidence that keeping one or a few lesions, the usual way to obtain a fixed-size input, loses subject-level information.
- **Quality**: Medium.
- **Stance**: supports.
- **Potential Use**: Introduction; Related work on aggregation.
- **Found by**: PM8.
- **Read**: methods and results, from the full text fetched in the first screening pass.

### Geady, Patel, Peoples, Simpson and Haibe-Kains (2025). Radiomic-based approaches in the multi-metastatic setting: a quantitative review.
- **Type**: Journal article (quantitative review with replication), BMC Cancer.
- **Method**: Ten published aggregation methods replicated on three datasets (16,894 lesions, 3,930 patients) and evaluated with Cox models against total tumour volume.
- **Key Findings**: No single method consistently outperformed the others, and none consistently outperformed total tumour volume across all patients. In colorectal liver metastases many methods surpassed total tumour volume and performance rose with the number of lesions; the volume-weighted average reached the highest median C-index for three or more lesions (0.842). In soft tissue sarcoma, concatenation was best for three or more lesions (0.673). In head and neck cancer, total tumour volume stayed the strongest predictor. The spread of bootstrapped performance widened as subgroup sizes fell, which the authors read as possible overfitting.
- **Step**: aggregation of per-lesion radiomics. **Correspondence assumed**: none between lesions; concatenation and the N-largest rules impose an order by size. **Error measured**: dataset-dependent performance of aggregation rules. **Aggregation**: ten published rules, in three groups: lesion selection by label or volume (for example the primary tumour, the largest or the smallest lesion), information from N selected lesions (volume-weighted average of the N largest, concatenation of the N largest, cosine similarity between N random lesions, with N set to the smallest lesion count of any patient in the group) and information from all lesions (unweighted and volume-weighted averages, with shape features summed).
- **Relevance**: the widest comparison of fixed aggregation rules; it shows that no rule is best across settings.
- **Quality**: High.
- **Stance**: supports.
- **Potential Use**: Related work on aggregation; Methods (baselines); Discussion.
- **Found by**: PM8, OA3.
- **Read**: methods and results, from the full text (Europe PMC XML); read the methods (selection criteria, datasets, implementation of each rule, analysis) and the results and discussion.

### Wilk, Swierniak, d'Amico et al. (2025). Towards the use of multiple ROIs for radiomics-based survival modelling: Finding a strategy of aggregating lesions.
- **Type**: Journal article, Computer Methods and Programs in Biomedicine.
- **Method**: Feature-level and prediction-level aggregation of PET radiomics from all lesions in 115 NSCLC patients (60% with regionally advanced disease) for distant-metastasis risk, across several survival models, with 1000 Monte Carlo cross-validation iterations that kept all lesions of a patient on one side of the split.
- **Key Findings**: The journal abstract reports that using all lesions instead of the primary tumour raised the best c-index from 0.611 to 0.632 (PET) and from 0.614 to 0.634 (PET at CT resolution). In the arXiv full text, the best median c-indices were 0.632 (meta-histogram with a random forest, PET) and 0.634 (maximum risk with a random forest, PET at CT resolution), against 0.554 and 0.540 for the reference scheme, the largest lesion with a stepwise Cox model. Among feature-level rules, the arithmetic mean of lesions gave the highest median c-indices (0.629 and 0.630 for two models), and the volume-weighted mean beat the largest lesion for every model; among prediction-level rules, the maximum risk over lesions beat the largest lesion for every model. Test c-indices across iterations ranged from 0.09 to 0.94, which the authors attribute to overfitting. Diversity indices between a patient's lesions were related to early metastasis.
- **Step**: aggregation of per-lesion radiomics. **Correspondence assumed**: none between lesions. **Error measured**: information loss from primary-only analysis, and the spread of performance across rules and splits. **Aggregation**: a representative feature vector (largest, random, arithmetic or volume-weighted mean, a "meta-histogram" of all lesion voxels, diversity indices appended to the largest lesion), or a consolidated risk score (mean, weighted mean, maximum or minimum of per-lesion risks).
- **Relevance**: separates aggregation of features from aggregation of predictions, and shows the instability of fixed rules in a small cohort.
- **Quality**: Medium; single cohort of 115 patients with wide variation across splits.
- **Stance**: supports.
- **Potential Use**: Related work on aggregation.
- **Found by**: PM8, OA5.
- **Read**: methods and results, from the full text (arXiv version 2405.17668v2, reached through Unpaywall; the Elsevier location Unpaywall listed returned the link-resolver page only, and the journal abstract was read for the figures quoted from it); read the methods (aggregation schemes, validation design) and the results.

### Sabouri, Hajianfar, Gharibi et al. (2025). Enhancing PRRT Outcome Prediction in Neuroendocrine Tumors: Aggregated Multi-Lesion PET Radiomics Incorporating Inter-Tumor Heterogeneity.
- **Type**: Journal article, Cancers.
- **Method**: 81 patients; lesions ranked by SUV or volume, top one, three or five selected; stacked (concatenated) versus statistical (minimum, maximum, mean and further statistics) aggregation; nested cross-validation.
- **Key Findings**: Ranking by descending SUVmin gave the best progression classification. All-lesion aggregation and the top five by SUVmean gave the best time-to-progression prediction (C-index 0.68).
- **Step**: lesion ranking and aggregation of PyRadiomics features. **Correspondence assumed**: a fixed number of ranked lesions, which imposes an order. **Error measured**: the selection and aggregation choice changes performance. **Aggregation**: concatenation of top-k lesions, or summary statistics (full text, lines on stacking).
- **Relevance**: an example of forcing a set into a fixed-length vector by ranking.
- **Quality**: Medium.
- **Stance**: supports.
- **Potential Use**: Related work on aggregation.
- **Found by**: PM8, OA3.
- **Read**: methods and results, from the full text fetched in the first screening pass.

### Cavinato, Sollini, Ragni et al. (2023). Radiomics-Based Inter-Lesion Relation Network to Describe [18F]FMCH PET/CT Imaging Phenotypes in Prostate Cancer.
- **Type**: Journal article, Cancers.
- **Method**: 55 men with biochemical recurrence of prostate cancer and at least two [18F]FMCH-avid lesions; the article states 333 lesions in total (and lists 149 nodal and 221 bone lesions), a median of 5 per patient, segmented semi-automatically in LIFEx. Lesion radiomic profiles were clustered across the cohort into phenotypes, and each patient was represented by a dendrogram from hierarchical clustering of the pairwise Euclidean distances between their lesions' profiles; tree descriptors entered Cox models for disease-free survival.
- **Key Findings**: Patients carried lesions of different radiomic phenotypes, and the number of phenotypes was associated with PSA, lesion count, total tumour volume, Gleason category and oligometastatic status. In univariate Cox models, dispersion, lesion count, the sum of branch lengths and two of the three phenotype counts were not significant; the Davies-Bouldin phenotype count was (p = 0.041). The best multivariate model reached a concordance of 0.86 with a log-rank p of 0.09, without external validation.
- **Step**: per-lesion radiomics, with lesions clustered into phenotypes shared across patients. **Correspondence assumed**: none between lesions within a patient; the phenotype clusters give a shared vocabulary across patients. **Error measured**: none. **Aggregation**: a per-patient dendrogram of pairwise lesion distances, summarized by tree descriptors (dispersion, branch lengths, phenotype count).
- **Relevance**: a relational, permutation-invariant representation of a lesion set, outside learned set encoders.
- **Quality**: Low; 55 patients, mostly non-significant univariate results, multivariate model not significant and not validated.
- **Stance**: neutral; the study does not compare its representation with a fixed aggregation rule or a single-lesion model, so it does not test the proposition.
- **Potential Use**: Related work on aggregation.
- **Found by**: PM8, OA3.
- **Read**: methods and results, from the full text (Europe PMC XML); read the methods (cohort, image analysis, lesion profiles, tree representation, modelling) and the results.

### Eertink, Zwezerijnen, Cysouw et al. (2022). Comparing lesion and feature selections to predict progression in newly diagnosed DLBCL patients with FDG PET/CT radiomics features.
- **Type**: Journal article, European Journal of Nuclear Medicine and Molecular Imaging.
- **Method**: 296 patients; 485 features per lesion and at patient level (all lesions as one VOI) plus 18 dissemination features; largest, hottest, patient level, maximum and median of lesions compared.
- **Key Findings**: Conventional PET and dissemination features gave the highest CV-AUC (0.72 to 0.75). No lesion selection approach was significantly better than the earlier model.
- **Step**: lesion selection and aggregation. **Correspondence assumed**: none between lesions; dissemination features measure the spatial spread of lesions. **Error measured**: selection choice did not change predictive value significantly. **Aggregation**: one merged VOI, largest, hottest, maximum, median, plus dissemination statistics.
- **Relevance**: the counter-example in which the aggregation choice does not matter and spread features carry the signal.
- **Quality**: High; trial cohort.
- **Stance**: opposes.
- **Potential Use**: Related work on aggregation; Discussion.
- **Found by**: PM8.
- **Read**: methods and results, from the full text fetched in the first screening pass.

### Gharibi, Sabouri, Hajianfar et al. (2026). Radiomic Phenotype-Informed Patient-Level Aggregation of Multiple Lesions: Application to PET Prognostic Modeling in NET and DLBCL.
- **Type**: Journal article, Chemical and Biomedical Imaging.
- **Method**: 81 NET and 76 DLBCL patients; PyRadiomics features harmonized with ComBat; consensus clustering into lesion phenotypes; aggregation at body, phenotype-body, organ and phenotype-organ levels.
- **Key Findings**: Hierarchical aggregation gave numerically favorable results over single-lesion approaches. Clinical plus aggregated models reached C-indices of 0.72 versus 0.65 for NET overall survival and 0.66 versus 0.62 for DLBCL overall survival compared with clinical-only models.
- **Step**: aggregation of per-lesion radiomics. **Correspondence assumed**: lesions matched to shared phenotype clusters and organs across patients. **Error measured**: comparison with single-lesion representations. **Aggregation**: phenotype- and organ-level pooling.
- **Relevance**: builds correspondence across patients by clustering lesions into shared phenotypes, a discrete analogue of a template.
- **Quality**: Medium; small cohorts, "numerically favorable" without a stated test.
- **Stance**: supports.
- **Potential Use**: Related work on aggregation; Discussion.
- **Found by**: OA3; Layer 3 (cites Chang 2021).
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (open access, one location: the ACS article PDF, HTTP 403); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (the same ACS PDF only); publisher page (ACS, HTTP 403).

### Vargas, Veeraraghavan, Micco et al. (2017). A novel representation of inter-site tumour heterogeneity from pre-treatment computed tomography textures classifies ovarian cancers by clinical outcome.
- **Type**: Journal article, European Radiology.
- **Method**: 38 HGSOC patients; every site of disease identified on CT, coded by a predefined template of 13 anatomical locations (for example omentum as site 2) and segmented manually; textures clustered by a Gaussian mixture; pairwise inter-site similarity matrix; 12 heterogeneity metrics; supervised clustering of patients with leave-one-out cross-validation.
- **Key Findings**: Three of the 12 metrics of texture dissimilarity across sites (inter-site similarity entropy, cluster shade and cluster prominence) were associated with shorter overall survival (p = 0.02, 0.017, 0.028); the other nine were not. Three heterogeneity measures (cluster variance, shade and prominence) were significantly lower after complete than after incomplete resection. Number of sites and total tumour volume were not associated with survival. Clustering on the inter-site metrics separated risk groups with 71% accuracy, better than the other texture measures.
- **Step**: per-site radiomics. **Correspondence assumed**: sites are labelled by an anatomical template, but the metrics are computed from pairwise similarities and do not depend on which site is which. **Error measured**: none. **Aggregation**: statistics of the inter-site similarity matrix.
- **Relevance**: an early set-level summary built from pairwise lesion similarities.
- **Quality**: Low; 38 patients, 3 of 12 metrics significant for survival, and the read sections state no correction for multiple testing.
- **Stance**: supports.
- **Potential Use**: Related work on aggregation.
- **Found by**: Layer 2, references of Geady 2025.
- **Read**: methods and results, from the full text (PMC copy through NCBI efetch, after the Europe PMC full text returned HTTP 500); read the methods and results.

### Sun, Lerousseau, Briend-Diop et al. (2022). Radiomics to evaluate interlesion heterogeneity and to predict lesion response and patient outcomes using a validated signature of CD8 cells in advanced melanoma patients treated with anti-PD1 immunotherapy.
- **Type**: Journal article, Journal for ImmunoTherapy of Cancer.
- **Method**: 136 patients, 1,120 baseline lesions delineated by experienced physicians (a core volume and a 2 mm peripheral ring per lesion); lesions that could not be separated from surrounding tissue or from adjacent lesions were not delineated. A CD8 radiomic score per lesion; dispersion metrics and extreme-lesion scores for patient outcome.
- **Key Findings**: A low score predicted lesion progression weakly (AUC 0.55); performance depended on lesion size and site (AUC 0.59 for lesions over 1 mL, 0.75 for subcutaneous lesions over 1 mL, no association for lung lesions). The minimum score over a patient's lesions, the least infiltrated lesion, was associated with overall survival in the training (HR 0.31) and test (HR 0.28) sets. The number of delineated lesions entered the multivariate progression-free survival model.
- **Step**: per-lesion radiomics. **Correspondence assumed**: none between lesions. **Error measured**: none for segmentation; performance by lesion size and site. **Aggregation**: minimum over lesions and dispersion statistics.
- **Relevance**: an extreme-value (minimum) pooling rule with outcome evidence, in a design whose lesion set excludes lesions that could not be delineated.
- **Quality**: Medium.
- **Stance**: supports.
- **Potential Use**: Related work on aggregation.
- **Found by**: OA3, OA5; Layer 3 (cites Chang 2021).
- **Read**: methods and results, from the full text (Europe PMC XML); read the methods and results.

### Liao, Lee, Yang et al. (2023). Predicting survival after radiosurgery in patients with lung cancer brain metastases using deep learning of radiomics and EGFR status.
- **Type**: Journal article, Physical and Engineering Sciences in Medicine.
- **Method**: DeepSurv on 1,793 radiomic features with clinical and EGFR data in 237 patients, with four radiomics aggregation methods.
- **Key Findings**: The model with radiomics from the largest metastasis performed best (C-index 0.75).
- **Step**: aggregation of per-lesion radiomics in a deep survival model. **Correspondence assumed**: none between lesions. **Error measured**: comparison of four aggregation methods. **Aggregation**: largest lesion best among four rules.
- **Relevance**: a deep survival model that still uses a fixed aggregation rule.
- **Quality**: Medium.
- **Stance**: supports.
- **Potential Use**: Related work on aggregation.
- **Found by**: PM20; Layer 3 (cites Chang 2021).
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (not open access, no location); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (closed, publisher and PubMed only); publisher page (Springer, HTTP 200 without the article body).

### Hu, Zhong, Liu et al. (2024). Lung CT-based multi-lesion radiomic model to differentiate between nontuberculous mycobacteria and Mycobacterium tuberculosis.
- **Type**: Journal article, Medical Physics.
- **Method**: 240 patients; a radiomic signature per lesion type (tree-in-bud, consolidation, nodules, lymph node enlargement) combined into a multi-lesion vector for a random forest.
- **Key Findings**: The multi-lesion model reached AUC 90.2%, 1 to 13 points above single-lesion-type models.
- **Step**: per-lesion-type radiomics. **Correspondence assumed**: lesions matched across patients by lesion type. **Error measured**: none. **Aggregation**: one score per lesion type, concatenated.
- **Relevance**: correspondence across patients through lesion categories, with missing categories per patient.
- **Quality**: Low; single centre; assessed on the abstract.
- **Stance**: supports.
- **Potential Use**: Related work on aggregation.
- **Found by**: PM8.
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (open access, one location: the Wiley PDF, HTTP 403); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (the same Wiley PDF and PubMed); publisher page (Wiley, HTTP 403).

### Chen, Cheung, Milot and Martel (2021). AMINN: Autoencoder-Based Multiple Instance Neural Network Improves Outcome Prediction in Multifocal Liver Metastases.
- **Type**: Conference paper, MICCAI 2021.
- **Method**: Autoencoder plus multiple instance network over the radiomic features of all lesions of a patient, with max, average, log-sum-exp and attention pooling.
- **Key Findings**: AUC 0.70, 11.4% above the best baseline (LASSO logistic regression on the largest tumour). Average pooling was best, and attention pooling did not outperform it, which the authors attribute to sample size (full text, results). Lesions were segmented manually because automatic liver tumour segmentation was unsatisfactory (full text, discussion).
- **Step**: manual lesion segmentation, radiomics, then a learned permutation-invariant pooling. **Correspondence assumed**: none between lesions; a bag of a variable number of lesions. **Error measured**: none for segmentation. **Aggregation**: MIL pooling over lesion embeddings.
- **Relevance**: the included source closest to a set encoder over radiomic lesion features.
- **Quality**: Medium; small cohort as the authors state.
- **Stance**: supports.
- **Potential Use**: Related work on aggregation; Methods (baseline).
- **Found by**: AX2.
- **Read**: methods and results, from the arXiv version (2012.06875) fetched in the first screening pass.

### Geady, Abbas-Aghababazadeh, Kohan et al. (2024). Radiomic-based prediction of lesion-specific systemic treatment response in metastatic disease.
- **Type**: Journal article, Computerized Medical Imaging and Graphics.
- **Method**: 202 lung metastases in 80 leiomyosarcoma patients (1 to 11 contoured lesions per patient, 67.5% with two or more); per-lesion progression predicted from 1,648 CT features per sub-volume (whole lesion, core, interior and exterior rims); features unstable under 1 mm erosion and dilation of the contour (concordance below 0.8) removed, then volume-correlated features removed.
- **Key Findings**: The segmentation robustness filter removed 1,452 of 6,592 features, and the volume filter left 32. Lesion-specific models reached an area under the precision-recall curve of 0.70 for doxorubicin monotherapy, a 4.5-fold gain over a no-skill classifier (5.6-fold for the combination arm), with precision varying by drug and lesion volume.
- **Step**: per-lesion radiomics. **Correspondence assumed**: none. **Error measured**: sensitivity of features to the contour (by erosion and dilation) and volume confounding, both used as filters. **Aggregation**: none; the prediction stays at lesion level, with lesions of one patient treated as separate samples.
- **Relevance**: the lesion-level alternative to subject-level aggregation.
- **Quality**: Medium.
- **Stance**: neutral.
- **Potential Use**: Discussion.
- **Found by**: OA3, OA5; Layer 3 (cites Chang 2021).
- **Read**: methods and results, from the full text (PMC copy through NCBI efetch, after the Europe PMC full text returned HTTP 500); read the methods (segmentation, feature robustness and selection) and the results.

### Zhao, Kluge, Papp et al. (2022). Multi-lesion radiomics of PET/CT for non-invasive survival stratification and histologic tumor risk profiling in patients with lung adenocarcinoma.
- **Type**: Journal article, European Radiology.
- **Method**: 421 treatment-naive lung adenocarcinoma patients with FDG PET/CT; all FDG-avid lesions delineated; 2,082 radiomic features combined with clinical parameters; machine learning models for 4-year and 3-year overall survival, tumour grade and growth pattern risk, evaluated by 100-fold Monte Carlo cross-validation (80:20).
- **Key Findings**: AUC 0.88 for 4-year survival, 0.84 for 3-year survival, and 0.76 for tumour grade and for growth pattern risk; the survival predictions were independently associated with overall survival.
- **Step**: multi-lesion PET/CT radiomics. **Correspondence assumed**: not stated in the abstract. **Error measured**: none. **Aggregation**: not stated in the abstract; the abstract reports features from all FDG-avid lesions and one prediction per patient.
- **Relevance**: a large multi-lesion cohort with patient-level endpoints.
- **Quality**: Low; assessed on the abstract, which does not state the aggregation rule and reports cross-validation only.
- **Stance**: neutral.
- **Potential Use**: Related work on aggregation.
- **Found by**: Layer 2, references of Wilk 2025 (citation loop).
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (not open access, no location); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (closed, publisher and PubMed only); publisher page (Springer, HTTP 200 with the abstract, references and purchase options, without the body sections).

### Lu, Zhang, Dong et al. (2021). Dual-region radiomics signature: Integrating primary tumor and lymph node computed tomography features improves survival prediction in esophageal squamous cell cancer.
- **Type**: Journal article, Computer Methods and Programs in Biomedicine.
- **Method**: Preoperative contrast CT; three LASSO Cox signatures (primary tumour, regional lymph nodes, both regions) built on 200 training patients and tested on 107 validation patients; clinical and radiomics-clinical nomograms.
- **Key Findings**: The dual-region signature was independently associated with overall survival (HR 1.869) and reached C-index 0.611 against 0.594 to 0.604 for the single-region signatures; the radiomics-clinical nomogram reached 0.700 (NRI 26.9%, IDI 6.8% over the clinical nomogram).
- **Step**: radiomics of two anatomical regions. **Correspondence assumed**: regions matched across patients by type (primary tumour, regional nodes). **Error measured**: comparison of single-region and dual-region signatures. **Aggregation**: features of the two regions combined in one signature; the abstract does not state how several nodes of one patient are combined.
- **Relevance**: a fixed two-region combination compared with each region alone, with a small gain in C-index.
- **Quality**: Low; assessed on the abstract; single centre.
- **Stance**: supports.
- **Potential Use**: Related work on aggregation.
- **Found by**: Layer 2, references of Wilk 2025 (citation loop).
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (not open access, no location); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (closed, publisher and PubMed only); publisher page (Elsevier link resolver, 2.8 kB without the article body).

### Xu, Wang, Chen and Zhang (2022). Multi-region radiomics for artificially intelligent diagnosis of breast cancer using multimodal ultrasound.
- **Type**: Journal article, Computers in Biology and Medicine.
- **Method**: Five regions of interest on B-mode and contrast-enhanced ultrasound (whole tumour, strongest perfusion region, marginal region, surrounding region); features learned and selected by a point-wise gated and a restricted Boltzmann machine; one SVM per region; the five single-region models fused into one classifier; 187 patients, five-fold cross-validation.
- **Key Findings**: The fused model reached accuracy 87.1% and AUC 0.849 and was significantly better than single-region single-modality models in AUC and accuracy (p < 0.05).
- **Step**: multi-region radiomics within one tumour. **Correspondence assumed**: regions matched across patients by definition. **Error measured**: comparison with single-region models. **Aggregation**: decision-level fusion of five region-specific classifiers.
- **Relevance**: late fusion of per-region models, a second fixed rule besides feature concatenation.
- **Quality**: Low; assessed on the abstract; single cohort with cross-validation only.
- **Stance**: supports.
- **Potential Use**: Related work on aggregation.
- **Found by**: Layer 2, references of Wilk 2025 (citation loop).
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (not open access, no location); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (closed, publisher and PubMed only); publisher page (Elsevier link resolver, 2.7 kB without the article body).

### Peng, Zou, Zhang, Ma, Han and Yao (2024). A novel sub-regional radiomics model to predict immunotherapy response in non-small cell lung carcinoma.
- **Type**: Journal article, Journal of Translational Medicine.
- **Method**: 264 NSCLC patients treated with immune checkpoint inhibitors from two public cohorts (159 training, 105 validation); each tumour split into three intratumoral sub-regions by clustering; 1,896 PyRadiomics features per sub-region concatenated into 5,688 features per patient; LASSO selection and an SVM; comparison with whole-tumour radiomics, PD-L1 expression and tumour mutational burden.
- **Key Findings**: Eleven sub-regional features formed the model, with AUC 0.90 (training) and 0.86 (validation) against 0.79 for whole-tumour radiomics in validation; the DeLong test between the two was not significant (p = 0.377). The model was associated with progression-free survival (validation HR 0.42).
- **Step**: intratumoral sub-region (habitat) radiomics. **Correspondence assumed**: sub-regions matched across patients by cluster index; the methods name K-means with K = 3 in one place and a Gaussian mixture model with K = 3 chosen by the Bayesian information criterion in another, and do not state how cluster labels are ordered across patients. **Error measured**: comparison with the whole-tumour model. **Aggregation**: concatenation of the three sub-regions' features.
- **Relevance**: shows that sub-region concatenation needs a cross-patient matching of clusters that the methods leave unstated.
- **Quality**: Low; the clustering method is described inconsistently and the gain over whole-tumour radiomics is not significant.
- **Stance**: neutral.
- **Potential Use**: Related work on aggregation.
- **Found by**: Layer 2, references of Wilk 2025 (citation loop).
- **Read**: methods and results, from the full text (Europe PMC XML); read the study design, sub-region feature extraction, feature selection and the results.

### Captier, Orlhac, Hovhannisyan-Baghdasarian, Luporsi, Girard and Buvat (2024). RadShap: An Explanation Tool for Highlighting the Contributions of Multiple Regions of Interest to the Prediction of Radiomic Models.
- **Type**: Journal article (method), Journal of Nuclear Medicine.
- **Method**: Shapley values computed over the regions of interest that an aggregation function combines, so that each lesion receives a contribution to a patient's prediction; validated on 1,000 synthetic tasks in 130 advanced NSCLC patients (all FDG-avid tumour foci delineated, 10 IBSI-compliant features per lesion, min and max over lesions for a ridge logistic regression) and applied to progression-free survival (primary tumour versus total metabolic tumour volume and standardized Dmax) and to histologic subtype (biopsied lesion versus min, max, mean and SD over all lesions).
- **Key Findings**: In half of the synthetic tasks the tool ranked a high-signature lesion as most influential for more than 94% of true positives. The aggregative survival model outperformed the primary-tumour model (mean tAUC 0.66 against 0.55), significantly in 60 of 100 cross-validation repetitions; for subtype, the maximum over lesions performed best, with a gain in AUC over the biopsy model that was not significant.
- **Step**: aggregation of per-lesion PET radiomics and its explanation. **Correspondence assumed**: none between lesions; regions are treated as optional, so any subset gives a valid input. **Error measured**: comparison of single-lesion and aggregative models. **Aggregation**: fixed functions (min, max, mean, SD, total volume, maximum inter-lesion distance), explained per lesion.
- **Relevance**: per-lesion attribution for permutation-invariant aggregates, applicable to any set encoder whose input can be a subset of lesions.
- **Quality**: Medium; one cohort with cross-validation; the authors state that the performance figures were not the focus.
- **Stance**: supports.
- **Potential Use**: Related work on aggregation; Discussion (interpretability).
- **Found by**: Layer 2, references of Wilk 2025 (citation loop).
- **Read**: methods and results, from the full text (Europe PMC XML); read the methods (dataset, Shapley computation, synthetic tasks, case studies, statistics) and the results.

#### Lesion segmentation benchmarks and lesion-based subject-level prediction

### Menze, Jakab, Bauer et al. (2015). The Multimodal Brain Tumor Image Segmentation Benchmark (BRATS).
- **Type**: Journal article (benchmark), IEEE TMI.
- **Method**: Twenty algorithms on 65 multi-contrast glioma scans annotated by up to four raters, and 65 simulated scans.
- **Key Findings**: Human raters disagreed considerably (Dice 74% to 85% across sub-regions). Some algorithms reached the inter-rater range on real data. No single algorithm ranked first for all sub-regions, and a hierarchical majority vote of several algorithms ranked above each one.
- **Step**: lesion segmentation. **Correspondence assumed**: none across subjects; each subject's sequences were rigidly co-registered to its own T1c scan, and the organizers state that no attempt was made to place patients in a common reference space. **Error measured**: inter-rater and algorithm segmentation error. **Aggregation**: not applicable.
- **Relevance**: sets the inter-rater floor on segmentation error that propagates into lesion-based features; its data are aligned within subjects only.
- **Quality**: High.
- **Stance**: supports.
- **Potential Use**: Related work on segmentation.
- **Found by**: PM12.
- **Read**: methods and results, from the full text (PMC copy through NCBI efetch, after the Europe PMC full text returned HTTP 500); read the data and annotation sections, the label fusion method and the results.

### Commowick, Istace, Kain et al. (2018). Objective Evaluation of Multiple Sclerosis Lesion Segmentation using a Data Management and Processing Infrastructure.
- **Type**: Journal article (challenge), Scientific Reports.
- **Method**: MICCAI 2016 challenge; 13 methods on 53 cases from four centres, each annotated by seven experts; segmentation and detection scores.
- **Key Findings**: Automatic methods trailed human experts on both detection and delineation. A consensus of algorithms came closer to experts on segmentation but still trailed on detection.
- **Step**: lesion segmentation. **Correspondence assumed**: none across subjects. **Error measured**: lesion detection and delineation error. **Aggregation**: not applicable.
- **Relevance**: detection error changes the number of lesions in each subject's set, which fixed-count aggregation rules assume known.
- **Quality**: High.
- **Stance**: supports.
- **Potential Use**: Related work on segmentation.
- **Found by**: PM10.
- **Read**: methods and results, from the full text fetched in the first screening pass.

### Commowick, Kain, Casey et al. (2021). Multiple sclerosis lesions segmentation from multiple experts: The MICCAI 2016 challenge dataset.
- **Type**: Journal article (dataset), NeuroImage.
- **Method**: 53 patients on four scanners with harmonized protocol; seven expert delineations and a consensus.
- **Key Findings**: Provides raw and preprocessed data and a test split with an unseen scanner.
- **Step**: lesion segmentation. **Correspondence assumed**: none. **Error measured**: inter-expert variability available in the data. **Aggregation**: not applicable.
- **Relevance**: a resource for measuring how segmentation variability reaches lesion-set predictors.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Methods (data).
- **Found by**: PM10.
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (open access, three locations: the ScienceDirect PDF, HTTP 403; the Elsevier link resolver, no article body; the HAL submitted version, which returned a bot-check page); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (the same three and a DOAJ record, HTTP 403); publisher page (Elsevier link resolver, 2.7 kB without the article body).

### Carass, Roy, Jog et al. (2017). Longitudinal multiple sclerosis lesion segmentation: Resource and challenge.
- **Type**: Journal article (challenge), NeuroImage.
- **Method**: ISBI 2015 challenge; 82 longitudinal datasets delineated by two raters; eleven teams and three further algorithms.
- **Key Findings**: Reports rater consistency, algorithm performance, a consensus delineation and a review of the evaluation metrics. The inter-rater Dice over all 82 images was 0.634, with large differences in lesion volume between the two raters, which the authors attribute to differing interpretations of the protocol.
- **Step**: lesion segmentation. **Correspondence assumed**: within-subject over time; the baseline MPRAGE of each subject was rigidly registered to a 1 mm MNI template and every other scan of that subject rigidly to it, with inverse-consistent registration, and lesions were delineated in that space. **Error measured**: rater and algorithm error. **Aggregation**: not applicable.
- **Relevance**: benchmark for MS lesion sets; its inter-rater Dice of 0.634 bounds the agreement on which lesions a subject has.
- **Quality**: High.
- **Stance**: supports; the rater comparison measures the variability of the segmented lesion set itself.
- **Potential Use**: Related work on segmentation.
- **Found by**: PM10, PM12.
- **Read**: methods and results, from the full text (PMC copy through NCBI efetch, after the Europe PMC full text returned HTTP 500); read the data, preprocessing and inter-rater sections and the results.

### Moawad, Janas, Baid et al. (2025). The Brain Tumor Segmentation (BraTS-METS) Challenge 2023: Brain Metastasis Segmentation on Pre-treatment MRI.
- **Type**: Journal article (challenge), Machine Learning for Biomedical Imaging.
- **Method**: 1,303 annotated studies from eight datasets; ranking by lesion-wise Dice and HD95 with fixed penalties for false positives and negatives.
- **Key Findings**: The winning team's Dice was 0.65 +/- 0.25. Common errors were false negatives for small lesions and misregistration of masks; Dice and detection fell with tumour size, especially below 100 mm3. The lesion-wise Dice sums per-lesion Dice and divides by TP + FN + FP (full text, Equation 1).
- **Step**: lesion segmentation. **Correspondence assumed**: lesion-to-lesion matching between prediction and ground truth within a subject. **Error measured**: missed small lesions and misregistered masks. **Aggregation**: the lesion-wise metric is itself a per-subject aggregate over a variable lesion set.
- **Relevance**: missed lesions change the set a subject-level predictor receives; registration of masks is named as an error source.
- **Quality**: High.
- **Stance**: supports.
- **Potential Use**: Related work on segmentation; Discussion.
- **Found by**: PM11, PM12.
- **Read**: methods and results, from the full text fetched in the first screening pass.

### Wang, Hsu, Lee et al. (2024). Brain metastasis tumor segmentation and detection using deep learning algorithms: A systematic review and meta-analysis.
- **Type**: Journal article (PROSPERO-registered systematic review and meta-analysis), Radiotherapy and Oncology.
- **Method**: 42 studies; QUADAS-2 and CLAIM; random-effects pooling and meta-regression.
- **Key Findings**: Pooled lesion-wise Dice 79%, patient-wise sensitivity 86% and lesion-wise sensitivity 87%. Slice thickness influenced lesion-wise detection sensitivity.
- **Step**: lesion segmentation and detection. **Correspondence assumed**: none. **Error measured**: pooled detection error. **Aggregation**: reports patient-wise and lesion-wise sensitivity separately.
- **Relevance**: gives the size of lesion-detection error that enters multi-metastasis predictors.
- **Quality**: Medium.
- **Stance**: supports.
- **Potential Use**: Discussion.
- **Found by**: PM11.
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (not open access, no location); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (closed, publisher and PubMed only); publisher page (Elsevier link resolver, 2.7 kB without the article body).

### Zeng, Gu, Liu and Zhao (2020). Review of Deep Learning Approaches for the Segmentation of Multiple Sclerosis Lesions on Brain MRI.
- **Type**: Journal article (review), Frontiers in Neuroinformatics.
- **Method**: Review of CNN-based MS lesion segmentation in two categories with a DSC and PPV comparison.
- **Key Findings**: Classifies deep learning MS segmentation as patch-wise or semantic-wise CNNs and compares reported DSC and PPV; on ISBI 2015 the listed DSC values range from 0.524 to 0.698. Names dataset size, class imbalance and domain shift as the open problems, and the segmentation of new and enlarging lesions as a future direction.
- **Step**: lesion segmentation. **Correspondence assumed**: none. **Error measured**: reported accuracy. **Aggregation**: not applicable.
- **Relevance**: background.
- **Quality**: Low; descriptive comparison of reported figures.
- **Stance**: neutral.
- **Potential Use**: Related work on segmentation.
- **Found by**: PM10.
- **Read**: methods and results, from the full text (Europe PMC XML); read the comparison table and the future-directions section.

### Spagnolo, Depeursinge, Schädelin et al. (2023). How far MS lesion detection and segmentation are integrated into the clinical workflow? A systematic review.
- **Type**: Journal article (systematic review), NeuroImage: Clinical.
- **Method**: 156 studies rated against the six steps of the Quantitative Neuroradiology Initiative.
- **Key Findings**: Of 156 studies, 146 (94%) and 155 (99%) fulfilled the first two steps (technical assessment), and 8 (5%), 3 (2%), 5 (3%) and one study the later clinical validation and integration steps.
- **Step**: lesion segmentation. **Correspondence assumed**: none. **Error measured**: not downstream. **Aggregation**: not applicable.
- **Relevance**: shows that MS segmentation tools are rarely validated against clinical outcomes, the subject-level use this review concerns.
- **Quality**: Medium.
- **Stance**: neutral.
- **Potential Use**: Introduction; Discussion.
- **Found by**: PM10.
- **Read**: methods and results, from the full text (Europe PMC XML); read the methods (search, QNI steps) and the results.

### Maier, Menze, von der Gablentz et al. (2017). ISLES 2015: A public evaluation benchmark for ischemic stroke lesion segmentation from multispectral MRI.
- **Type**: Journal article (challenge), Medical Image Analysis.
- **Method**: Two sub-challenges (sub-acute lesion segmentation and perfusion estimation), 16 groups.
- **Key Findings**: Acute perfusion lesion segmentation was feasible; sub-acute lesion segmentation still lacked accuracy, and no algorithmic characteristic was superior. In the sub-acute task the two expert segmentations agreed with a mean Dice of 0.70 +/- 0.20; no participating method segmented all 36 test cases (Dice above 0 for each), and the best scores stayed well below the inter-rater level. Fusing the submissions by majority vote or STAPLE was worse than the two top algorithms because their failures were correlated.
- **Step**: lesion segmentation. **Correspondence assumed**: none across subjects; sequences rigidly co-registered within each subject. **Error measured**: segmentation error, including complete misses. **Aggregation**: not applicable.
- **Relevance**: the stroke segmentation benchmark behind lesion-based outcome prediction; complete failures on some cases mean a lesion-based predictor can receive an empty lesion map.
- **Quality**: High.
- **Stance**: supports.
- **Potential Use**: Related work on segmentation.
- **Found by**: PM12.
- **Read**: methods and results, from the full text (PMC copy through NCBI efetch, after the Europe PMC full text returned HTTP 500); read the data, preprocessing and ground-truth sections, the results and the discussion.

### Mehta, Filos, Baid et al. (2022). QU-BraTS: MICCAI BraTS 2020 Challenge on Quantifying Uncertainty in Brain Tumor Segmentation.
- **Type**: Journal article (challenge), Machine Learning for Biomedical Imaging.
- **Method**: A score that rewards confident correct and unconfident incorrect assertions, applied to 14 teams of QU-BraTS 2020.
- **Key Findings**: Uncertainty estimates add complementary value to segmentation output: teams that performed well on segmentation did not necessarily produce good uncertainties, and the reverse. The score is built so that a system is confident when correct and uncertain when wrong, with uncertain voxels flagged for expert review.
- **Step**: lesion segmentation with uncertainty. **Correspondence assumed**: none. **Error measured**: voxel-wise uncertainty. **Aggregation**: not applicable.
- **Relevance**: a per-subject uncertainty that could be carried into a lesion-set predictor; no included study does so.
- **Quality**: Medium.
- **Stance**: neutral.
- **Potential Use**: Discussion.
- **Found by**: PM12.
- **Read**: methods and results, from the full text (journal PDF on melba-journal.org, reached through Unpaywall; the article has no PMCID); read the introduction, the score definition and the results summary.

### Moore, Jenkinson, Griffanti, Huygelier, Gillebert and Demeyere (2023). A comparison of lesion mapping analyses based on CT versus MR imaging in stroke.
- **Type**: Journal article (benchmark), Neuropsychologia.
- **Method**: 85 acute stroke patients with routine CT and MR scans; one manually delineated lesion mask per modality (MRIcron, blind to the other modality); each mask warped to 1 mm stereotaxic space with SPM12 and the Clinical Toolbox, which use separate age-specific CT and MR templates; simulated behaviour from 96 Harvard-Oxford cortical regions and from single voxels; voxel-wise lesion-symptom mapping run on CT and MR data separately and compared.
- **Key Findings**: CT and MR lesion volumes did not differ significantly (paired Wilcoxon p = 0.258), but paired masks overlapped poorly (mean Dice 0.42), and both modalities produced false negative delineations, including a patient whose two lesions were each found on only one modality. Both modalities gave very low Dice against the target regions (below 0.03). In single-voxel simulations, MR peaks lay on average 1.39 cm from the target voxel and CT peaks 0.44 cm, and paired CT and MR z-maps agreed with mean Dice 0.335 across thresholds.
- **Step**: lesion segmentation source (CT or MR) and spatial normalization ahead of lesion mapping. **Correspondence assumed**: voxel correspondence in template space, through modality-specific templates. **Error measured**: yes; mask agreement between modalities, missed lesions, and displacement and overlap of the resulting maps. **Aggregation**: per-region lesion overlap (percentage of a region hit) defines the simulated scores.
- **Relevance**: measures how the segmentation input of a lesion-based analysis, including missed lesions in a multi-lesion patient, changes the downstream map.
- **Quality**: Medium; simulated behaviour, and CT and MR acquired at different times, which the authors name as a source of disagreement.
- **Stance**: supports.
- **Potential Use**: Discussion of segmentation error.
- **Found by**: Layer 2, references of Jühling 2024 (citation loop).
- **Read**: methods and results, from the full text (Europe PMC XML); read the methods (neuroimaging data, simulations, statistics), the results and the discussion of mask agreement.

### Simpson, Peoples, Creasy et al. (2024). Preoperative CT and survival data for patients undergoing resection of colorectal liver metastases.
- **Type**: Journal article (data descriptor), Scientific Data.
- **Method**: Public TCIA collection of 197 patients from 384 consecutive hepatic resections for colorectal liver metastases at one institution: portal venous CT within 6 weeks of surgery, semi-automatic segmentations of liver, each tumour, vessels and future liver remnant by an expert radiologist or fellow, and clinical, pathology, recurrence and survival variables.
- **Key Findings**: 114 of 197 patients (58%) had multiple metastases. Segmentations are released as DICOM segmentation objects; no radiomic features are released, so that users choose their own extraction.
- **Step**: lesion segmentation (dataset). **Correspondence assumed**: none. **Error measured**: none; no inter-rater segmentation is released. **Aggregation**: not applicable; each patient has a variable number of segmented tumours and patient-level outcomes.
- **Relevance**: a public multi-lesion dataset with patient-level survival; Geady 2025 uses it as TCIA-CRLM (494 lesions in 197 patients).
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Methodology (data).
- **Found by**: Layer 2, references of Geady 2025 (citation loop).
- **Read**: methods and results, from the full text (Europe PMC XML); read the methods (patients, CT acquisition, image processing, outcome data), the data records and the technical validation.

### Armato, McLennan, Bidaut et al. (2011). The Lung Image Database Consortium (LIDC) and Image Database Resource Initiative (IDRI): A Completed Reference Database of Lung Nodules on CT Scans.
- **Type**: Journal article (reference database), Medical Physics.
- **Method**: 1,018 thoracic CT scans from 1,010 patients at seven academic centres; each scan read by four thoracic radiologists in a two-phase process (blinded read, then an unblinded read in which each reader saw the others' anonymous marks and could revise their own, without forced consensus); readers outlined every "nodule of 3 mm or more" in each section and marked smaller nodules and non-nodules by their centre; marks inventoried and checked by a quality assurance protocol.
- **Key Findings**: 7,371 lesions were marked "nodule" by at least one radiologist; 2,669 were marked "nodule of 3 mm or more" by at least one, and only 928 of these (34.7%) by all four. Pathology was collected for 268 scans. The database keeps each reader's outlines separately and leaves the grouping of marks into distinct nodules to the user.
- **Step**: lesion detection and segmentation (reference database). **Correspondence assumed**: none across patients; within a scan, marks of different readers are matched to one nodule by spatial grouping that the user performs. **Error measured**: reader disagreement on whether a lesion exists, with up to four outlines per nodule. **Aggregation**: not applicable.
- **Relevance**: the per-patient lesion set itself differs between readers (two thirds of the larger nodules were not marked by all four), which a lesion-set predictor inherits; van Griethuysen 2017 uses its four outlines to measure feature stability.
- **Quality**: High.
- **Stance**: supports.
- **Potential Use**: Methodology (data); Discussion of segmentation error.
- **Found by**: Layer 2, references of Wilk 2025 (citation loop).
- **Read**: methods and results, from the full text (the PMC article page, HTML, listed by Unpaywall, after the Europe PMC full text returned HTTP 500, NCBI efetch returned no body, and the Wiley PDF, the doi.org page and the hdl.handle.net repository copy returned HTTP 403); read the methods (CT collection, two-phase reading, lesion categories, outlines, inventory and quality assurance) and the results.

### Karnath, Sperber and Rorden (2019). Reprint of: Mapping human brain lesions and their functional consequences.
- **Type**: Journal article (review), NeuroImage.
- **Method**: Review of voxel-based lesion behaviour mapping and the multivariate and connectome-based methods that supplement it.
- **Key Findings**: Voxel-based lesion behaviour mapping is limited by its mass-univariate design, and multivariate and normative-connectome methods complement it.
- **Step**: lesion segmentation and template registration feeding group analysis. **Correspondence assumed**: lesions in a common template space. **Error measured**: none. **Aggregation**: voxel-wise lesion maps.
- **Relevance**: the review of the lesion-mapping design, which needs both segmentation and registration before relating lesions to outcomes.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Related work on lesion-based prediction.
- **Found by**: PM16.
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (open access, one location: the ScienceDirect accepted manuscript, HTTP 403, and the Elsevier link resolver without the article body); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (the same accepted manuscript and PubMed); publisher page (Elsevier link resolver, 2.7 kB without the article body).

### Bowren, Bruss, Manzel et al. (2022). Post-stroke outcomes predicted from multivariate lesion-behaviour and lesion network mapping.
- **Type**: Journal article, Brain.
- **Method**: Multivariate lesion-behaviour maps and lesion network maps from two large cohorts applied to an independent stroke sample; overlap of each lesion with the maps related to 12-month outcomes by latent growth curve models.
- **Key Findings**: Each mapping modality predicted a significant amount of variance in 12-month cognitive and motor outcomes, and structural and functional lesion network maps added variance beyond lesion-behaviour maps.
- **Step**: lesion segmentation and spatial normalization. **Correspondence assumed**: voxel correspondence in MNI152 space; each manually segmented lesion was transformed to the 1 mm MNI152 template by linear and nonlinear registration and its accuracy reviewed by a neurologist in native and template space. **Error measured**: none for registration. **Aggregation**: "lesion load" per map: for lesion-behaviour maps, the lesion mask multiplied by the map's voxel weights (LESYMAP); for network maps, the sum of map intensities inside the lesion mask; one number per map and patient.
- **Relevance**: subject-level prediction that rests on template correspondence of lesions, with an explicit rule that reduces a lesion mask to one number per map.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Related work on lesion-based prediction.
- **Found by**: PM16.
- **Read**: methods and results, from the full text (the PMC article page, HTML, fetched directly after the Europe PMC full text returned HTTP 500, NCBI efetch returned no body and the Oxford Academic PDF returned HTTP 403); read the lesion segmentation, overlap quantification and modelling sections.

### Forkert, Verleger, Cheng et al. (2015). Multiclass Support Vector Machine-Based Lesion Mapping Predicts Functional Outcome in Ischemic Stroke Patients.
- **Type**: Journal article, PLOS ONE.
- **Method**: 68 follow-up FLAIR datasets; infarct segmentation; percentage of lesioned voxels in MNI, Harvard-Oxford and problem-specific regions as SVM features for 30-day mRS.
- **Key Findings**: Lesion location features improved mRS prediction; the best model reached 56% exact, 82% within one point and 85% binary accuracy.
- **Step**: lesion segmentation and atlas regions. **Correspondence assumed**: matched atlas regions; the MNI atlas was registered to each patient by an affine transform only (mutual information), the region labels were carried to the patient with nearest-neighbour interpolation, and for the problem-specific regions the inverted affine transforms brought each lesion into atlas space. **Error measured**: none for registration. **Aggregation**: the percentage of lesioned voxels per atlas region gives a fixed-length vector.
- **Relevance**: the region-wise aggregation of a lesion mask into a subject vector, on affine-only correspondence.
- **Quality**: Medium; 68 patients, leave-one-out only.
- **Stance**: neutral.
- **Potential Use**: Related work on lesion-based prediction; Methods (baseline).
- **Found by**: Layer 2, references of Jühling 2024.
- **Read**: methods and results, from the full text (Europe PMC XML); read the methods (segmentation, atlas registration, region definitions) and the results.

### Salvalaggio, De Filippo De Grazia, Zorzi, Thiebaut de Schotten and Corbetta (2020). Post-stroke deficit prediction from lesion and indirect structural and functional disconnection.
- **Type**: Journal article, Brain.
- **Method**: 132 first-time stroke patients; lesions embedded in atlases of healthy structural and functional connections; ridge regression of deficits in several domains.
- **Key Findings**: Lesion and indirect structural disconnection maps predicted deficits in all domains except verbal memory (R2 0.16 to 0.58). Indirect functional disconnection predicted little.
- **Step**: manual lesion segmentation, enantiomorphic normalization and atlas embedding. **Correspondence assumed**: voxel correspondence in MNI152 space; the lesioned tissue was replaced by the contralateral healthy tissue (the method of Nachev 2008) and the T1 image registered to MNI152 by affine and diffeomorphic deformations (BCBtoolkit); each lesion in MNI space then seeded tractography and functional connectivity in healthy HCP subjects. The authors note that registration succeeded or failed differently from the surface-based pipeline of earlier work on the same cohort, which changed the number of patients included. **Error measured**: none for registration beyond that note. **Aggregation**: each map (lesion, structural disconnection, functional disconnection) reduced by principal component analysis to the components explaining 95% of variance, which entered ridge regression with leave-one-patient-out cross-validation.
- **Relevance**: subject-level prediction that requires the lesion in a common atlas space, built on the enantiomorphic alignment step.
- **Quality**: High.
- **Stance**: neutral.
- **Potential Use**: Related work on lesion-based prediction.
- **Found by**: Layer 2, references of Jühling 2024.
- **Read**: methods and results, from the full text (the PMC article page, HTML, listed by Unpaywall and fetched on a second request after the first returned a browser check; the Europe PMC full text returned HTTP 500 and NCBI efetch returned no body); read the methods (segmentation, registration, disconnection maps, models) and the results.

### Roca, Attye, Colas et al. (2020). Artificial intelligence to predict clinical disability in patients with multiple sclerosis using FLAIR MRI.
- **Type**: Journal article (data challenge entry), Diagnostic and Interventional Imaging.
- **Method**: 971 training patients (OFSEP); a CNN on images combined with random forests and manifold learning on the location of lesion load with respect to white matter tracts; weighted averaging of predictors.
- **Key Findings**: Two-year EDSS predicted with MSE 3 on the test set (mean error 1.7).
- **Step**: lesion segmentation and tract atlas. **Correspondence assumed**: lesion load expressed in a common white matter tract space. **Error measured**: none for registration or segmentation. **Aggregation**: lesion load per tract.
- **Relevance**: MS subject-level prediction from lesion load per region.
- **Quality**: Medium; no external validation.
- **Stance**: neutral.
- **Potential Use**: Related work on lesion-based prediction.
- **Found by**: PM14, PM19.
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (open access, one location: the Elsevier link resolver, without the article body); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (the publisher, PubMed, and a HAL record that the HAL API lists as a notice without a file); publisher page (Elsevier link resolver, 2.7 kB without the article body).

### Pustina, Coslett, Ungar et al. (2017). Enhanced estimations of post-stroke aphasia severity using stacked multimodal predictions.
- **Type**: Journal article, Human Brain Mapping.
- **Method**: 53 left-hemisphere chronic stroke patients; lesions drawn manually on T1; T1 registered to a 208-subject elderly template with ANTs (antsRegistrationSyN) under cost function masking of the lesion; lesion load per region of a 268-region functional parcellation (72 regions damaged in at least one patient), virtual tractography lesions on a healthy HARDI template, and resting-state connectivity; random forests with recursive feature elimination per modality, then a final random forest stacking 11 single-modality predictions and lesion size (STAMP); 20 repetitions of 10-fold cross-validation.
- **Key Findings**: STAMP predictions correlated with four aphasia scores at r = 0.79 to 0.88 and exceeded the best single modality for naming, comprehension and aphasia quotient (repetition gain not significant, p = 0.06). With training and test fully separated, including variable selection, the naming correlation fell from 0.82 to 0.52, and to 0.66 after lowering the selection tolerance from 4% to 2%.
- **Step**: lesion segmentation and spatial normalization to a template. **Correspondence assumed**: voxel correspondence to the template outside the masked lesion; parcels shared across patients. **Error measured**: none for registration; the full-split validation measures the optimism of variable selection. **Aggregation**: lesion load per parcel (fraction of the parcel's voxels lesioned) as a fixed-length vector, then stacking across modalities.
- **Relevance**: a lesion-based subject-level predictor whose input exists only after template registration with lesion masking, and whose reported accuracy dropped when selection was moved inside the cross-validation.
- **Quality**: Medium; 53 patients; the authors call the main results possibly overoptimistic.
- **Stance**: neutral.
- **Potential Use**: Related work on lesion-based prediction; Methods (baseline).
- **Found by**: Layer 2, references of Jühling 2024 (citation loop).
- **Read**: methods and results, from the full text (the PMC article page, HTML, listed by Unpaywall, after the Europe PMC full text returned HTTP 500, NCBI efetch returned no body, the Europe PMC page returned HTTP 403 and the Wiley page HTTP 403); read the methods (lesion drawing, image processing, lesion load, models, stacking, full-split validation) and the results.

### Rajashekar, Mouchès, Fiehler et al. (2020). Structural integrity of white matter tracts as a predictor of acute ischemic stroke outcome.
- **Type**: Journal article, International Journal of Stroke.
- **Method**: 96 acute ischemic stroke patients with follow-up FLAIR one to seven days after onset; lesions segmented semi-automatically and registered nonlinearly to a common reference atlas; lesion overlap and tract integrity for each white matter tract of the AALCAT atlas used in a linear-kernel support vector regression of 24-hour NIHSS, with leave-one-patient-out cross-validation.
- **Key Findings**: The model with tract integrity and tract lesion overlap predicted 24-hour NIHSS with r = 0.7; adding tract integrity to overlap improved accuracy by 6% (p < 0.05).
- **Step**: lesion segmentation and nonlinear registration to an atlas. **Correspondence assumed**: tract correspondence through the atlas. **Error measured**: none for registration or segmentation. **Aggregation**: per-tract lesion overlap and integrity as a fixed-length vector.
- **Relevance**: a tract-wise reduction of a lesion mask to a subject vector, sharing authors (Forkert, Rajashekar) with Forkert 2015 and Jühling 2024.
- **Quality**: Medium; assessed on the abstract; leave-one-out only.
- **Stance**: neutral.
- **Potential Use**: Related work on lesion-based prediction.
- **Found by**: Layer 2, references of Jühling 2024 (citation loop).
- **Read**: abstract only. Routes tried: NCBI ID converter (no PMCID, so no PMC or Europe PMC full text); Unpaywall (not open access, no location); arXiv title search (no match); Europe PMC preprint search by title (no hit); OpenAlex locations (closed, publisher and PubMed only); publisher page (SAGE through doi.org, HTTP 403).

### Yourganov, Fridriksson, Rorden, Gleichgerrcht and Bonilha (2016). Multivariate Connectome-Based Symptom Mapping in Post-Stroke Patients: Networks Supporting Language and Speech.
- **Type**: Journal article, The Journal of Neuroscience.
- **Method**: 90 chronic post-stroke aphasia patients; lesions drawn manually on T2, resliced to T1 and smoothed; enantiomorphic normalization (Nachev 2008) with SPM12 unified segmentation, the transform applied to the T1 and the lesion map, binarized at 50%; regional damage as the proportion of lesioned voxels in each of the gray matter regions of an atlas, and probabilistic-tractography connectomes; linear support vector regression of five WAB scores with leave-one-patient-out cross-validation.
- **Key Findings**: Lesion-based prediction correlated with the actual scores at r = 0.46 (auditory comprehension) to 0.71 (fluency), and connectome-based prediction was comparable (differences not significant after Fisher transform). Lesion size alone was about as predictive as regional damage or connectome integrity (no significant difference), and combining lesion and connectome features gave accuracies similar to either alone.
- **Step**: lesion segmentation and enantiomorphic normalization. **Correspondence assumed**: voxel correspondence in standard space after replacing the lesion by mirrored healthy tissue; atlas regions shared across patients. **Error measured**: none for registration. **Aggregation**: proportion of each atlas region damaged, as a fixed-length vector; lesion size as a one-number baseline.
- **Relevance**: a lesion-based predictor built on the enantiomorphic alignment step, in which total lesion size matched the regional representation.
- **Quality**: Medium; 90 patients, leave-one-out only.
- **Stance**: neutral.
- **Potential Use**: Related work on lesion-based prediction; Methods (lesion size baseline).
- **Found by**: Layer 2, references of Jühling 2024 (citation loop).
- **Read**: methods and results, from the full text (the PMC article page, HTML, fetched directly with a browser user agent after the PMC page listed by Unpaywall returned a 21 kB browser check, the Europe PMC full text returned HTTP 500, NCBI efetch returned no body and the journal PDF returned HTTP 403); read the methods (lesions, normalization, parcellation, connectome, SVR) and the results.

### Literature Matrix

Themes: T1 registration, templates and common space; T2 measured effect of a pipeline step on downstream prediction or on its inputs; T3 radiomic feature standardization and reproducibility; T4 lesion segmentation benchmarks and reviews; T5 aggregation of per-lesion or per-region outputs into one subject-level input. "main" marks the source's principal theme and "x" a theme it also addresses.

| Source | Step | T1 | T2 | T3 | T4 | T5 | Method | Quality |
|---|---|---|---|---|---|---|---|---|
| Sotiras 2013 | Registration | main | | | | | Review | High |
| Haskins 2020 | Registration | main | | | | | Review | Medium |
| Fu 2020 | Registration | main | | | | | Review | Medium |
| Chen 2025 | Registration | main | | | | | Review | High |
| Hering 2023 | Registration | main | | | | | Challenge | High |
| Avants 2011 | Registration | main | | | | | Tool evaluation | High |
| Avants 2009 | Registration and template | main | | | | | Tool | Medium |
| Shamonin 2013 | Registration | main | | | | x | Tool and classification study | Medium |
| Thakran 2022 | Registration | x | main | | | | Quant | Medium |
| Jühling 2024 | Registration | x | main | | | | Quant | Medium |
| Arthofer 2024 | Template | main | x | | | | Template construction | High |
| Dalca 2019 | Learned template | main | | | | | Method | High |
| Dey 2021 | Learned template | main | | | | | Method | High |
| Abulnaga 2025 | Learned template | main | | | | x | Method | High |
| Hess 2018 | Atlases | main | | | | | Review | Low |
| Nenoff 2023 | Registration | main | x | | | | Review | Medium |
| Coll 2023 | Regions | x | main | | | | Quant | Medium |
| Brett 2001 | Registration (lesioned) | main | x | | | | Method evaluation | High |
| Crinion 2007 | Registration (lesioned) | main | x | | | | Method evaluation | High |
| Nachev 2008 | Registration (lesioned) | main | x | | | | Method | High |
| Andersen 2010 | Registration (lesioned) | main | x | | | | Method evaluation | High |
| Ripollés 2012 | Registration (lesioned) | main | x | | | | Benchmark | Medium |
| Zwanenburg 2020 | Radiomics | | | main | | | Standardization | High |
| Whybra 2024 | Radiomics | | | main | | | Standardization | High |
| Traverso 2018 | Radiomics | | x | main | | | Systematic review | High |
| Pfaehler 2021 | Radiomics | | x | main | | | Systematic review | Medium |
| Zhao 2021 | Radiomics | | x | main | | | Review | Medium |
| Lambin 2017 | Radiomics | | | main | | | Review | High |
| Spadarella 2022 | Radiomics | | | main | | | Systematic review | Medium |
| Aerts 2014 | Radiomics | | | main | | | Quant | High |
| van Griethuysen 2017 | Radiomics | | | main | | | Tool | High |
| Kumar 2012 | Radiomics | | | main | | | Review | Medium |
| Gillies 2016 | Radiomics | | | main | | x | Review | High |
| Liu 2019 | Radiomics | | | main | | | Review | Medium |
| van Timmeren 2020 | Radiomics | | x | main | | | Review | Medium |
| Traverso 2020 | Radiomics | | x | main | | | Quant | Medium |
| Poirot 2022 | Segmentation and radiomics | | main | x | | x | Quant | Medium |
| Chang 2021 | Aggregation | | x | | | main | Quant | High |
| Henry 2022 | Aggregation | | x | | | main | Quant | Medium |
| Geady 2025 | Aggregation | | x | | | main | Quantitative review | High |
| Wilk 2025 | Aggregation | | x | | | main | Quant | Medium |
| Sabouri 2025 | Aggregation | | x | | | main | Quant | Medium |
| Cavinato 2023 | Aggregation | | | | | main | Quant | Low |
| Eertink 2022 | Aggregation | | x | | | main | Quant | High |
| Gharibi 2026 | Aggregation | | | x | | main | Quant | Medium |
| Vargas 2017 | Aggregation | | | | | main | Quant | Low |
| Sun 2022 | Aggregation | | | | | main | Quant | Medium |
| Liao 2023 | Aggregation | | x | | | main | Quant | Medium |
| Hu 2024 | Aggregation | | | | | main | Quant | Low |
| Chen 2021 (AMINN) | Aggregation | | | | | main | Method | Medium |
| Geady 2024 | Lesion-level radiomics | | | x | | main | Quant | Medium |
| Zhao 2022 | Aggregation | | | | | main | Quant | Low |
| Lu 2021 | Aggregation | | x | | | main | Quant | Low |
| Xu 2022 | Aggregation | | x | | | main | Quant | Low |
| Peng 2024 | Aggregation (sub-regions) | | x | | | main | Quant | Low |
| Captier 2024 | Aggregation | | x | | | main | Method | Medium |
| Menze 2015 | Segmentation | | | | main | | Benchmark | High |
| Commowick 2018 | Segmentation | | | | main | | Challenge | High |
| Commowick 2021 | Segmentation | | | | main | | Dataset | High |
| Carass 2017 | Segmentation | | | | main | | Challenge | High |
| Moawad 2025 | Segmentation | x | | | main | x | Challenge | High |
| Wang 2024 | Segmentation | | | | main | | Systematic review and meta-analysis | Medium |
| Zeng 2020 | Segmentation | | | | main | | Review | Low |
| Spagnolo 2023 | Segmentation | | | | main | | Systematic review | Medium |
| Maier 2017 | Segmentation | | | | main | | Challenge | High |
| Mehta 2022 | Segmentation | | | | main | | Challenge | Medium |
| Moore 2023 | Segmentation and normalization | x | main | | x | | Quant | Medium |
| Simpson 2024 | Segmentation (dataset) | | | | main | x | Dataset | High |
| Armato 2011 | Segmentation (dataset) | | x | | main | | Dataset | High |
| Karnath 2019 | Lesion mapping | x | | | x | main | Review | High |
| Bowren 2022 | Lesion mapping | x | | | | main | Quant | High |
| Forkert 2015 | Lesion mapping | x | | | | main | Quant | Medium |
| Salvalaggio 2020 | Lesion mapping | x | | | | main | Quant | High |
| Roca 2020 | Lesion load | x | | | | main | Quant | Medium |
| Pustina 2017 | Lesion mapping | x | | | | main | Quant | Medium |
| Rajashekar 2020 | Lesion load | x | | | | main | Quant | Medium |
| Yourganov 2016 | Lesion mapping | x | | | | main | Quant | Medium |

Theme counts ("main" or "x"): T1 32, T2 29, T3 17, T4 14, T5 33. Every theme holds at least three sources.

### Identified Gaps

Each gap states what the documented search found with the queries listed above. None claims that work is absent from the literature at large.

1. **Measured propagation of registration error into subject-level prediction.** Among the screened records of PM4 (10 hits), PM17 (9), PM18 (10), AX4 (48) and OA6 (top 20), and the chained references of Jühling 2024, three included studies measure how the registration step changes a downstream result across subjects: Thakran 2022 (intra-subject registration, survival C-statistic), Jühling 2024 (inter-subject normalization, lesion-symptom maps) and Crinion 2007 (normalization of lesioned brains, group fMRI activations). Nachev 2008, Andersen 2010 and Ripollés 2012 measure the normalization error and lesion volume change that a lesion causes, without a predictor. Shamonin 2013 compares only standard and accelerated versions of one registration. Thakran 2022 reports a variant of its features computed without registration, which skips alignment and does not replace it. The lesion-based predictors from the citation loop each use one alignment without varying it: ANTs with cost function masking (Pustina 2017), enantiomorphic normalization in SPM12 (Yourganov 2016) and nonlinear registration to a tract atlas (Rajashekar 2020). The screened records contain no study that compares a registration-based predictor with a predictor built for non-aligned inputs (set, transport or template-learning) on the same cohort and outcome.
2. **Aggregation of variable lesion sets beyond fixed pooling rules.** The aggregation studies screened through PM8, PM13, PM15, AX2, AX3, OA3 and OA5 use fixed rules (averages, volume weighting, largest or top-k lesions, concatenation of ranked lesions, summary statistics, an extreme lesion), clustering into shared phenotypes (Gharibi 2026), pairwise-similarity summaries (Vargas 2017; a per-patient dendrogram in Cavinato 2023), pooling of per-lesion risks (Wilk 2025) or multiple instance pooling with attention (Chen 2021). The region-based studies from the citation loop concatenate fixed regions (Lu 2021, tumour and nodes; Peng 2024, three intratumoral clusters whose order across patients the methods do not state) or fuse per-region classifiers (Xu 2022), and Captier 2024 explains min, max, mean and SD aggregates lesion by lesion without changing them. Geady 2025 found that no fixed rule was best across three datasets, and Wilk 2025 reported test c-indices from 0.09 to 0.94 across cross-validation splits. No screened radiomics aggregation study matched lesions across subjects by optimal transport or learned a template of lesion sets.
3. **Segmentation error carried into lesion-set predictors.** The segmentation benchmarks (Menze 2015; Commowick 2018; Carass 2017; Maier 2017; Moawad 2025; Wang 2024) report inter-rater disagreement, missed small lesions, complete misses and detection error, and Moawad 2025 names misregistered masks. Armato 2011 shows that only 928 of 2,669 larger lung nodules were marked by all four readers, so the lesion set itself depends on the reader, and Moore 2023 measured how the segmentation source (CT or MR, mean mask Dice 0.42, with lesions missed on either) displaced lesion-symptom maps. Poirot 2022 measured the effect of segmentation method on a subject-level classifier for anatomical regions, not lesions. The reproducibility literature (Traverso 2018; Pfaehler 2021; Zhao 2021) reports delineation effects on single-lesion features and prognostic values, and Aerts 2014, van Griethuysen 2017 and Geady 2024 use delineation stability to filter features. No screened study propagated lesion detection or delineation error, or the voxel uncertainty of QU-BraTS (Mehta 2022), into an aggregated subject-level prediction over several lesions.
4. **Multiple sclerosis subject-level prediction from per-lesion sets.** The MS prediction studies retrieved by PM14, PM19 and OA4 use whole-brain or regional CNN inputs in MNI152 space, with the segmented lesions used only to fill the T1 scans (Coll 2023), or lesion load per tract (Roca 2020). No screened MS study encoded each patient's lesions as a set of per-lesion descriptors.
5. **Population concentration of multi-lesion aggregation evidence.** The aggregation studies concentrate on oncology: brain metastases (Chang 2021; Liao 2023), PET lymphoma and neuroendocrine tumours (Eertink 2022; Sabouri 2025; Gharibi 2026), lung cancer and metastatic melanoma (Henry 2022; Sun 2022; Wilk 2025; Zhao 2022; Captier 2024), liver metastases (Chen 2021; the Simpson 2024 dataset), ovarian cancer (Vargas 2017) and recurrent prostate cancer (Cavinato 2023); the region-based studies are also oncologic (Lu 2021, oesophageal cancer; Xu 2022, breast; Peng 2024, NSCLC). Hu 2024 is the one non-oncologic multi-lesion radiomics study in the set; the lesion-based stroke predictors (Forkert 2015, Salvalaggio 2020, Bowren 2022, Yourganov 2016, Pustina 2017, Rajashekar 2020) reduce each lesion mask to one load per atlas region or map.

### Recommended Sources by Paper Section

| Section | Key Sources |
|---|---|
| Introduction | sotiras2013deformable, brett2001spatial, juhling2024spatial, thakran2022impact, lambin2017radiomics, aerts2014decoding, henry2022investigation, geady2025radiomic, spagnolo2023how, gillies2016radiomics, kumar2012radiomics, liu2019the |
| Related work: registration and templates | sotiras2013deformable, haskins2020deep, fu2020deep, chen2025a, hering2023learn2reg, avants2011a, arthofer2024internally, dalca2019learning, dey2021generative, abulnaga2025multimorph, hess2018on, nenoff2023review, brett2001spatial, crinion2007spatial, nachev2008enantiomorphic, andersen2010cost, ripolles2012analysis, shamonin2013fast, avants2009advanced |
| Related work: radiomics | zwanenburg2020the, whybra2024the, traverso2018repeatability, pfaehler2021a, zhao2021understanding, spadarella2022systematic, vangriethuysen2017computational, poirot2022robustness, kumar2012radiomics, liu2019the, vantimmeren2020radiomics, traverso2020machine |
| Related work: lesion segmentation | menze2015the, commowick2018objective, commowick2021multiple, carass2017longitudinal, moawad2025the, wang2024brain, zeng2020review, maier2017isles, mehta2022qubrats, moore2023a, simpson2024preoperative, armato2011the |
| Related work: subject-level aggregation and lesion-based prediction | chang2021comparison, geady2025radiomic, wilk2025towards, sabouri2025enhancing, eertink2022comparing, gharibi2026radiomic, cavinato2023radiomics, vargas2017a, sun2022radiomics, liao2023predicting, hu2024lung, chen2021aminn, geady2024radiomic, karnath2019reprint, bowren2022poststroke, forkert2015multiclass, salvalaggio2020poststroke, roca2020artificial, coll2023global, zhao2022multilesion, lu2021dualregion, xu2022multiregion, peng2024a, captier2024radshap, pustina2017enhanced, rajashekar2020structural, yourganov2016multivariate |
| Methodology (baselines, data, feature definitions) | chang2021comparison, geady2025radiomic, wilk2025towards, chen2021aminn, forkert2015multiclass, shamonin2013fast, avants2011a, nachev2008enantiomorphic, zwanenburg2020the, vangriethuysen2017computational, commowick2021multiple, simpson2024preoperative, armato2011the, avants2009advanced, yourganov2016multivariate, pustina2017enhanced |
| Discussion | thakran2022impact, juhling2024spatial, crinion2007spatial, andersen2010cost, ripolles2012analysis, nenoff2023review, arthofer2024internally, poirot2022robustness, zhao2021understanding, eertink2022comparing, moawad2025the, mehta2022qubrats, chen2025a, geady2024radiomic, moore2023a, traverso2020machine, captier2024radshap, vantimmeren2020radiomics |

### Search stopping

Conditions of "Search Stopping Rules":

- 1, met: 77 included, above the Literature Review minimum of 30.
- 2, not met: the latest round is the citation loop over the four reference lists, which added 20 included sources (Crinion 2007, Nachev 2008, Andersen 2010 and the 17 of the reference-list screen), 20 of 77 (26%), above the 10% threshold. The query round before it (PM18 to PM20) added one source, Liao 2023.
- 3, met: every matrix theme has at least three sources (T1 32, T2 29, T3 17, T4 14, T5 33).
- 4, met for the four core reference lists and not met beyond them: all 153 references of Geady 2025, Wilk 2025, Chang 2021 and Jühling 2024 were screened with a recorded decision (Layer 2 paragraph), and those lists now hold no uncollected work that passes the criteria for this group, apart from one Geady 2025 reference that OpenAlex returned without a record. The reference lists of the 20 sources the loop added were not chained, so chaining has not yet been shown to stop discovering uncollected works.
- 5, met: foundational works from 2001, 2007, 2008, 2009, 2010, 2011, 2012, 2013 and 2014, and 16 sources from 2024 to 2026.

Three of the five conditions are met. Conditions 2 and 4 need a further chaining round over the reference lists of the 20 sources the loop added, followed by a round that adds under 10%.

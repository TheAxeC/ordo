## Paper outline

### Structure: IMRaD

### Overview

The paper type is IMRaD, from the Paper type row of config.md (row "Has original data collection" of the planner's table: the paper reports its own benchmark results). The outline keeps the section order of the existing draft, manuscript/main.tex, because a paper with a draft takes the draft's structure first: Introduction, Related work, Methods, Results, Discussion, Conclusion, with the draft's experimental set-up kept inside Methods as the draft has it. The paper's flow follows the pattern of engineering, problem, approach and validation. The Introduction states that label-free ECG analysis depends on the representation fed to the clusterer, that the foundation-model benchmarks score frozen encoders through supervised heads or compare foundation models only with each other, and asks which representation recovers sinus rhythm (SR) against atrial fibrillation (AF) on PTB-XL under chance-corrected, patient-grouped evaluation bounded by a supervised ceiling, and which stays robust under class imbalance and simulated federation. Related work places the hand-crafted, learned and foundation-model representations, the prior unsupervised ECG studies, the separability and clusterability literature, federated clustering and the evaluation measures, and ends on the gap. Methods define the cohorts, the five representations, each a feature map together with its conditioner, the clusterers, the metrics, the supervised ceilings, the out-of-fold discriminant test, the uncertainty protocol and the federated protocol, with the implementation settings in Appendix A. Results report observations only: agreement by representation on PTB-XL, its dependence on the conditioner and its replication on MIT-BIH; separability against clusterability; the internal-index check; the two deployment stressors with the extraction cost. Discussion explains each representation's position, compares the results with the prior benchmarks, gives the decision rule bounded to the two tasks, and states the scope boundaries. The Conclusion restates the findings within those boundaries.

The raw-flattening and convolutional-autoencoder (conv-AE) arms are planned as controls that locate where naive representations fail, as the draft does. No section, paragraph or table is planned around an approach that failed. The draft's two paragraphs on the earlier master's project (main.tex lines 104 to 111 and 734 to 738) are not planned: the raw-flattening arm is described as a control of whole-recording flattening, and the two evaluation cautions stand as results of this study, with their relevance to practice resting on the applied ECG clustering studies of Discussion 5.2.

Changes from the draft's structure, each with its reason:

- **Limitations** becomes Discussion 5.4. The planner's depth rule allows 3 to 6 level-1 sections and the IMRaD skeleton holds Limitations as a subsection of the Discussion (structure check, mismatch M2).
- **Results** are regrouped from seven subsections to four, with level-3 subsections, because the depth rule for 6,001 to 10,000 words allows 2 to 4 level-2 subsections per section. Results 4.1 and 4.2 keep the numbers Reviewer 2 cites (structure check, mismatch M3). Draft 4.1 becomes 4.1.1, draft 4.4 (conditioning) becomes 4.1.2, draft 4.5 (MIT-BIH) becomes 4.1.3, draft 4.2 stays 4.2, draft 4.3 (silhouette) becomes 4.3, draft 4.6 becomes 4.4.1 and 4.4.2, draft 4.7 (cost) becomes 4.4.3.
- **Interpretation** of each representation's position (draft lines 475 to 491 and 526 to 533) moves from Results to Discussion 5.1, so that Results hold observations and the Discussion holds the explanations. Reviewer 3, item 8, asks for that separation, and the IMRaD column of the allocation table gives Results and Discussion 20 percent each (structure check, mismatch M1).
- **Implementation settings** (clusterer settings, conv-AE training, foundation-model inference configuration, federated rounds, the seed-level bootstrap) move to Appendix A, which holds the reproducibility detail Reviewer 3, item 7, asks for; Methods 3.3 points to it (structure check, mismatch M1).
- **Headings** are written as labels. The draft's "Representation, not algorithm, governs clusterability", "Separability is not clusterability", "The silhouette trap" and "Conditioning matters" are claims; the outline's headings name the subject.
- **Related work** grows from three paragraphs to four subsections built on the 66 sources of review.md. The literature matrix holds 8 themes, more than the 6 the planner keeps; the outline merges them: T1 (encoders and benchmarks) with T8 (cost) in 2.1, T3 (hand-crafted features) in 2.1, T2 (unsupervised ECG and clusterability) with T6 (federated clustering) in 2.2, T4 (clustering evaluation) with T5 (statistical reporting) in 2.3. T7 (datasets) supplies Methods 3.1 and Discussion 5.4 and gets no Related-work subsection. T2 now holds 23 sources, the largest theme, and its separability-and-clusterability sources fill 2.2.2.
- **The response letter.** The renumbering changes section references in admin/reviews/revision-roadmap.md and the response letter skeleton: "new 4.7" becomes 4.4.3, "4.6" becomes 4.4.1 and 4.4.2, "Section 6 Limitations" becomes 5.4, "Section 7" becomes 6, and R3-7 is answered in Appendix A.

The word target is 7,000 words of running text, without the abstract, tables, figure captions, Appendix A, references and the back-matter statements. The Length row gives 5,000 to 8,000 words, and the draft now holds about 5,900 words of running text (about 7,100 with its tables and captions, counted with `wc -w` over the section line ranges of main.tex, markup included).

### Structure check

The four indicators of the planner's table, tested:

- **Causal research question against a Literature Review structure.** The research question is comparative (which representation gives clusters that recover SR against AF, and which stays robust), and the structure is IMRaD. No mismatch. The explanations in Discussion 5.1 are readings of comparisons, supported by the supervised ceilings and the out-of-fold discriminant test, and are worded as readings.
- **Materials without data or results against IMRaD.** The Materials in hand row holds results, as the numbers main.tex reports and the four figures, so the Results section is fed. No mismatch. Every number the outline plans traces to a line of main.tex; the numbers main.tex does not hold are marked as gaps in the evidence map, since code/results/ is not in the project.
- **One case or institution against a Policy Brief.** Not applicable: the paper is a benchmark on two public databases. No mismatch.
- **Length far below the type.** 7,000 words lies inside the 5,000 to 8,000 range of IMRaD. No mismatch.

Other mismatches found between the question, the materials and the structure:

**M1. The IMRaD proportions against the weights of the draft.** The draft gives Related work about 320 words, Methods about 2,080 words of running text and Results about 1,790 words of running text with its interpretation inside, against an IMRaD column of 25 percent for Related work, 15 percent for Methods and 20 percent each for Results and Discussion. The two do not fit because the draft places its explanations in Results and its implementation settings in Methods, and uses few of the sources the literature review found. The outline applies the column by moving interpretation to Discussion 5.1, moving the settings to Appendix A, and building Related work on the review's sources.
- Alternative A, the draft's weights: Methods about 30 percent and Results about 30 percent of the body, Related work about 6 percent, Discussion with Limitations about 17 percent, every setting in the body. It answers the research question by keeping each explanation beside the number it explains, and keeps every answer to the referees at the place the response letter now points to. It costs the separation of observation from interpretation that Reviewer 3, item 8, asks for, and it leaves out of the positioning the sources on the other foundation-model benchmarks that Reviewer 3, items 1 and 4, ask for, and the separability-and-clusterability sources that let the paper credit that phenomenon to prior work.
- Recommendation (a judgment): the outline as planned. It answers R3-8 by its structure, uses the review's sources for R3-1 and R3-4, and collects the R3-7 settings in one appendix the response letter can point to.

**M2. Seven level-1 sections in the draft.** The draft has a standalone Limitations section, which makes seven level-1 sections against the planner's limit of six. The outline places Limitations as Discussion 5.4.
- Alternative: keep Limitations as its own section 6 and the Conclusion as section 7. It matches the draft and the roadmap's section references, and it exceeds the six level-1 sections. The venue states no required sections (config.md, Venue limits).
- Recommendation (a judgment): Discussion 5.4, with the response letter's references renumbered.

**M3. Seven Results subsections against 2 to 4.** The draft's Results have seven level-2 subsections. The outline regroups them into four, keeping 4.1 and 4.2, and places the conditioning result beside the ranking it qualifies (4.1.2).
- Alternative: keep the seven flat subsections. The roadmap's numbers 4.6 and 4.7 stay valid. It exceeds the depth rule and keeps the conditioning result apart from the ranking, so a reader meets the ranking without the qualification that the order of ECGFounder and the hand-crafted features reverses under robust scaling.
- Recommendation (a judgment): the regrouped Results.

**M4. The federation part of the research question against the federated material.** The research question asks which representation stays robust "under federation across heterogeneous sites". The material is a simulation on one dataset, ten simulated sites whose heterogeneity is in class prevalence only (main.tex lines 380 to 393 and 788 to 796). Results 4.4.2 can answer only the simulated version.
- Alternative (a): state the question in Introduction 1.3 as robustness "under simulated federation across ten sites that differ in class prevalence". It answers the question as the evidence allows and meets the objection of Reviewer 3, item 5, in the question itself.
- Alternative (b): add a federated arm whose sites are the source institutions of the PhysioNet/Computing in Cardiology Challenge 2020 or 2021 sets [Perez_Alday_2020; Reyna_2021]. It answers the question as written and R3-5 in full, and needs new experiments whose results do not exist in this run's materials, so the outline cannot plan them.
- Recommendation: (a) for the manuscript planned from these materials; (b) is a decision for the user, because it is the stronger answer to R3-5 and needs new data and new runs.

### Detailed outline

#### Abstract (250 words, fixed, outside the total)
**Purpose**: State the question, the protocol, the results with their numbers, and the scope.
**Content**:
- The question: which representation family gives label-free clusters that recover SR against AF on PTB-XL.
- The protocol: five representations from four families, five clusterers, adjusted Rand index (ARI) with patient-grouped intervals, a supervised ceiling, ten seeds.
- The results: ECGFounder 0.885 [0.860, 0.909], the 16 hand-crafted features 0.711 [0.677, 0.746], the raw and conv-AE controls at a majority-class assignment; the same order of the three representations applied on MIT-BIH; the silhouette of 0.81 at ARI 0.000; the conditioner dependence; under 9:1 imbalance the hand-crafted features ahead of ECGFounder, under simulated non-IID federation 0.92 of their centralized ARI retained against 0.69, at one fifteenth of ECGFounder's extraction time.
- The scope: two tasks, two named foundation models, five clusterers, simulated federation.
**Sources**: none.
**Key arguments**: the thesis of arguments.md in one sentence.

#### 1. Introduction (about 1,050 words)
**Purpose**: State the problem, the gap, the research questions and the contributions, with the scope of every claim.
**Content**: The Introduction moves from the aim of label-free ECG analysis to the dependence of clustering on the representation, then to the gap the foundation-model benchmarks leave, and ends on the questions and four contributions. It defines a representation as a feature map together with its conditioner, a definition the rest of the paper keeps. It states that the ranking is expected from the class definitions and that the contribution is what the controls and the stressors show.
- 1.1 Context and problem (about 300 words)
  - Unsupervised ECG analysis seeks rhythm and morphology structure without cardiologist labels [Nezamabadi_2023].
  - Whether clustering recovers that structure depends on the representation: hand-crafted rhythm and morphology features [Wesselius_2021; Rouhi_2021], reconstruction autoencoders, and frozen foundation-model encoders [arxiv_2410_19877].
  - Classification rates such as purity should not be used to validate clusters [Steinley_2004].
  - A representation can carry a label that a linear probe recovers while a partition of the same space does not follow it. For frozen self-supervised image representations, linear-probe and nearest-centroid error depend on the variance along class-separating directions, which can be small while most within-class variance lies in other directions [arxiv_2603_03530]; linear-probe accuracy can stay unaffected while partition-based retrieval degrades [arxiv_2604_24469]; and k-means under-recovers class structure that the same pretrained features hold [Van_Gansbeke_2020; arxiv_2303_17896]. The paper credits the phenomenon to this work and treats it as background.
  - No source measures linear-probe accuracy and clustering agreement on the same ECG representation (review.md, sections 7 and 10), which is the measurement this paper makes.
- 1.2 Research gap (about 250 words)
  - The foundation-model benchmarks score frozen encoders through fine-tuning, linear probes or a fixed classifier [Lunelli_2026; arxiv_2509_25095; arxiv_2608_03597].
  - The evaluation protocol changes which representation ranks best, and a randomly initialized encoder is a needed baseline [arxiv_2602_17531].
  - The closest study scores Gaussian mixture clusters of six frozen foundation-model embeddings by ARI against the conduction-disturbance (CD) and AF labels and against dataset membership, over four datasets, beside downstream classifiers trained on the embeddings [lookingbeyond2026]. It evaluates AF on CODE-15%, Georgia and Chapman-Shaoxing and not on PTB-XL, states no interval for the ARI and no patient grouping, and its text names no hand-crafted features and no MIT-BIH data. Its own statement is that prior benchmarks lack a representation-wise evaluation.
  - No study compares hand-crafted features with frozen foundation-model embeddings under chance-corrected clustering against a supervised ceiling on the same patient-grouped split (review.md, gaps 1 and 2).
- 1.3 Purpose and research questions (about 250 words)
  - Question 1: which representation recovers SR against AF on PTB-XL under chance-corrected, patient-grouped evaluation bounded by a supervised ceiling.
  - Question 2: whether a low agreement reflects label information missing from the space or present in the wrong geometry.
  - Question 3: which representation stays robust under 9:1 class imbalance and under simulated federation across ten sites that differ in class prevalence (mismatch M4), and at what extraction cost; why siloed clinical data makes federation relevant [Rieke_2020].
  - A secondary question: whether the order of the representations carries to normal against premature ventricular beats (N-vs-V) on MIT-BIH.
  - The definition of a representation as a feature map with its conditioner.
- 1.4 Contributions and scope (about 250 words)
  - (i) A chance-corrected, patient-grouped benchmark of five representations on the SR-against-AF split of PTB-XL, each bounded by a linear and a non-linear supervised ceiling on the same split, stable over the cluster count from 2 to 8.
  - (ii) Two cautions: the silhouette scores a degenerate one-cluster partition above the partition that recovers the classes, and the conditioner changes the result and can reverse the order of the two leading representations.
  - (iii) The deployment finding under two stressors with the extraction cost of each representation.
  - (iv) The MIT-BIH beat-morphology check; the closest benchmark uses no MIT-BIH data [lookingbeyond2026].
  - No new method is proposed; every foundation-model statement is scoped to HuBERT-ECG and ECGFounder, and every clusterer statement to the five clusterers tested; the raw-flattening and conv-AE arms are controls.
**Sources**: Nezamabadi_2023, Wesselius_2021, Rouhi_2021, arxiv_2410_19877, Steinley_2004, arxiv_2603_03530, arxiv_2604_24469, Van_Gansbeke_2020, arxiv_2303_17896, Lunelli_2026, arxiv_2509_25095, arxiv_2608_03597, arxiv_2602_17531, lookingbeyond2026, Rieke_2020
**Key arguments**: The representation with its conditioner decides whether clustering recovers the structure. The divergence of probe accuracy and clustering is known for image representations and unmeasured for ECG. The foundation-model benchmarks leave the unsupervised comparison with hand-crafted features open. The paper's contribution is the controls and the stressors, since the ranking itself follows from the class definitions.
**Transition to next**: The Introduction ends on four contributions measured against existing benchmarks; Related work sets out each representation family, each clustering study and each evaluation measure those contributions rest on. The reader should hold the definition of a representation and the gap before the literature is placed against it. The connecting theme is label-free evaluation of ECG representations.

#### 2. Related work (about 1,800 words)
**Purpose**: Place the four representation families, the prior unsupervised ECG studies, the separability and clusterability literature, federated clustering and the evaluation measures, and confirm the gap.
**Content**: The section groups the 66 sources into four subsections, each stating where the sources agree and where they differ. It ends on the summary that confirms the gap of 1.2 against the full literature.
- 2.1 ECG representations (about 650 words)
  - 2.1.1 Hand-crafted rhythm and morphology features (about 200 words)
    - Heart rate variability measures [hrvstandards1996]; morphology, interval and RR features with the inter-patient split [dechazal2004].
    - AF features fall into atrial, ventricular and signal features, and 22 percent of methods use atrial features [Wesselius_2021]; a compact interpretable set reaches a mean F-score of 0.746 on CinC 2017 [Rouhi_2021].
    - Extraction tools [neurokit2021]; single-lead AF detection and inter-expert label disagreement [clifford2017af].
    - On PTB-XL, supervised convolutional networks outperform feature-based algorithms by a large margin [Strodthoff_2021]; that comparison is supervised and leaves the unsupervised case open.
  - 2.1.2 Self-supervised and foundation-model encoders (about 250 words)
    - Contrastive pretraining [clocs2021; threekg2021; mehari2022ssl], masked reconstruction [arxiv_2402_09450], latent prediction [arxiv_2410_08559], hybrid contrastive and generative pretraining [McKeen_2025], multimodal pretraining with reports [arxiv_2403_06659], multi-centre pretraining [arxiv_2503_00711], and the review of the field [arxiv_2410_19877].
    - HuBERT-ECG: self-supervised pretraining on 9.1 million ECGs [hubertecg2024].
    - ECGFounder: pretraining with expert annotations of 150 label categories on over 10 million ECGs, extended to lower-lead and single-lead ECGs [ecgfounder2024]. Its supervised pretraining bears on how label-free its embedding is, and the paper says so.
  - 2.1.3 Benchmarks of frozen encoders (about 200 words)
    - BenchECG ranks encoders by fine-tuning and linear probing [Lunelli_2026]; eight models on 26 tasks, where a compact state-space model leads most categories [arxiv_2509_25095]; nine frozen encoders on AF detection, with ECGFounder strongest and computational profiling [arxiv_2608_03597]; foundation models against time-series models [Xu_2025].
    - The evaluation protocol changes the ranking [arxiv_2602_17531].
    - Representation-level analysis among six foundation models: UMAP views, kNN agreement, centroid separation and the ARI of Gaussian mixture clusters against the clinical label and against dataset membership. For AF the label-level ARI is 0.70 for ECGFounder and 0.64 for ECG-FM against 0.00 to 0.04 for three HuBERT-ECG sizes and 0.00 for ECG-JEPA; HuBERT-ECG and ECG-JEPA organise by dataset [lookingbeyond2026].
    - Compute cost is reported for supervised pipelines [arxiv_2303_11429; arxiv_2608_03597; arxiv_2509_25095] and not for an unsupervised one.
- 2.2 Clustering of ECG representations (about 600 words)
  - 2.2.1 Unsupervised ECG studies (about 200 words)
    - The review of ECG clustering [Nezamabadi_2023]; wavelet tensors with spectral clustering on 12-lead ECG [wavelettensorecg2018]; hand-crafted single-lead markers that give clusters with distinct heart-failure risk [Madrid_2025]; convolutional variational autoencoder features that reflect rhythms [Jang_2021]; denoising autoencoder latents that associate with Phecodes [Friedman_2025]; a convolutional autoencoder with k-means over 96,921 ECGs in diastolic dysfunction [Shetty_2024]; intra-subject k-means of heartbeats from segmentation and engineered features, on MIT-BIH and a wearable database [Digiacomo_2025]; density-based clustering without a preset cluster count [hdbscan2013].
    - Each study clusters one representation, so none compares families.
  - 2.2.2 Separability and clusterability (about 250 words)
    - Linear evaluation is the standard test of ECG representations [mehari2022ssl].
    - Outside ECG, the divergence is reported and explained. Linear-probe and nearest-centroid error on frozen self-supervised representations depend on the variance along class-separating directions, which collapses during pretraining while the variance over all directions can stay large [arxiv_2603_03530]. Anisotropic, skewed self-supervised representations degrade partition-based retrieval while their linear-probe and kNN accuracy is unaffected [arxiv_2604_24469]. On the same pretext features, k-means reaches 65.9 percent accuracy on CIFAR-10 against 87.6 percent for a neighbour-based clustering objective [Van_Gansbeke_2020], and across 17 pretrained models a clustering head improves on k-means by 6.1 and 12.2 points on ImageNet and CIFAR-100 [arxiv_2303_17896].
    - Clustering properties differ between components of self-supervised vision models [sslclustering2025]; plain autoencoder latents of images show large inter-cluster overlap [Wheeldon_2023].
    - For ECG, the informativeness of autoencoder latents is shown through supervised associations [Friedman_2025; Jang_2021], and no source measures linear separability and clustering agreement on the same ECG representation (review.md, section 10).
  - 2.2.3 Federated clustering (about 150 words)
    - Federated averaging [fedavg2017], whose accuracy falls under Dirichlet client partitions [arxiv_1909_06335].
    - Federated k-means: one-shot k-FED, where heterogeneity can weaken the separation requirement [arxiv_2103_00697]; dynamically weighted federated k-means [arxiv_2310_14858]; one-shot hierarchical clustering for non-IID biomedical data [arxiv_2611_11481].
    - Federated ECG work is supervised [Alreshidi_2024]; siloed medical data motivates federation [Rieke_2020].
- 2.3 Clustering evaluation and statistical reporting (about 350 words)
  - The adjusted Rand index [hubertarabie1985]; its properties, its significance test, and the finding that classification rates should not validate clusters [Steinley_2004].
  - Chance-corrected information measures [vinh2010]; ARI suits a reference with large equal clusters and adjusted mutual information (AMI) an unbalanced reference [arxiv_1512_01286].
  - The silhouette as an internal, label-free index of tightness and separation that can also select the cluster count [rousseeuw1987].
  - The reliability of internal indices is disputed: they are unreliable for comparing partitions computed in different embedding spaces [Wang_2026], and some validation measures do not register the uniform effect of k-means and give misleading information [Hui_Xiong_2009].
  - Applied ECG clustering reports the silhouette as validation: it sets the cluster count for autoencoder embeddings [Shetty_2024] and is the only validation on an unlabelled wearable heartbeat database [Digiacomo_2025].
  - The statement that internal indices are maximized by degenerate partitions is not attributed to any source; the paper shows it for its own benchmark in 4.3 (needs literature, item 6 of the list at the end).
  - Effect sizes for ordinal and paired comparisons [Cliff_1993; Kerby_2014]; the bootstrap [Efron_1979]; paired bootstrap comparisons of encoders [arxiv_2608_03597].
- 2.4 Summary and research gap (about 200 words)
  - The benchmarks agree on supervised heads; the unsupervised studies cluster one representation each; the divergence of probe and partition is shown for image representations only; no source reports a supervised ceiling and chance-corrected agreement on the same patient-grouped split, the extraction cost of hand-crafted features against foundation-model embeddings, or ARI with AMI for an imbalanced ECG cohort (review.md, gaps 1, 2, 5 and 6).
  - What this paper adds to the closest study [lookingbeyond2026]: the hand-crafted axis; the linear and non-linear ceilings on the same patient-grouped split as the clustering, with the out-of-fold test; patient-grouped intervals; the SR-against-AF split on PTB-XL, which that study does not evaluate; MIT-BIH; the stressors with cost.
**Sources**: hrvstandards1996, dechazal2004, Wesselius_2021, Rouhi_2021, neurokit2021, clifford2017af, Strodthoff_2021, clocs2021, threekg2021, mehari2022ssl, arxiv_2402_09450, arxiv_2410_08559, McKeen_2025, arxiv_2403_06659, arxiv_2503_00711, arxiv_2410_19877, hubertecg2024, ecgfounder2024, Lunelli_2026, arxiv_2509_25095, arxiv_2608_03597, Xu_2025, arxiv_2602_17531, lookingbeyond2026, arxiv_2303_11429, Nezamabadi_2023, wavelettensorecg2018, Madrid_2025, Jang_2021, Friedman_2025, Shetty_2024, Digiacomo_2025, hdbscan2013, arxiv_2603_03530, arxiv_2604_24469, Van_Gansbeke_2020, arxiv_2303_17896, sslclustering2025, Wheeldon_2023, fedavg2017, arxiv_1909_06335, arxiv_2103_00697, arxiv_2310_14858, arxiv_2611_11481, Alreshidi_2024, Rieke_2020, hubertarabie1985, Steinley_2004, vinh2010, arxiv_1512_01286, rousseeuw1987, Wang_2026, Hui_Xiong_2009, Cliff_1993, Kerby_2014, Efron_1979
**Key arguments**: Frozen ECG encoders are evaluated through supervised heads, and the one representation-level study compares foundation models with each other. Unsupervised ECG studies cluster one representation at a time. Probe accuracy and clustering diverge in image representations for a stated reason. Chance-corrected external measures, read with the reference's balance and a cluster-size check, are the appropriate headline measures, and internal indices alone are not. The comparison of representation families under label-free clustering is open.
**Transition to next**: Related work ends on the measures and the comparison the literature lacks; Methods specifies the cohorts, the representations and the evaluation that fill it. The reader should know why ARI, AMI, a cluster-size check and a supervised ceiling are used together. The connecting theme is the evaluation protocol.

#### 3. Methods (about 1,150 words)
**Purpose**: Specify the data, the five representations, the clustering and evaluation protocol and the federated protocol so that the benchmark can be repeated.
**Content**: Methods give the cohorts with their input arrays, each representation with its leads, its array and its principle, and the protocol of clusterers, conditioners, metrics, ceilings, the out-of-fold discriminant test and the uncertainty estimates. Settings that a reader needs only to repeat the runs are in Appendix A.
- 3.1 Data and cohorts (about 250 words)
  - PTB-XL version 1.0.3 [ptbxl2020; physionet2000]: 21,799 records of 18,869 patients, 10 s strips (main.tex line 192); rhythm labels from the SCP-ECG statements with the presence-based rule; a balanced, patient-disjoint cohort of 2,542 records (1,282 SR, 1,260 AF), majority-class baseline 0.504.
  - The input array: the 100 Hz distribution read once into a float32 array of 1000 samples by 12 leads, no filtering at load time (answers R2-1a).
  - MIT-BIH [mitbih2001; physionet2000]: windows of -300 to +250 ms around each R-peak on both leads; a balanced N-vs-V task of 3,000 beats from 47 records, with the record as grouping unit, after the inter-patient practice of [dechazal2004].
  - All evaluation is patient-grouped.
- 3.2 Representations (about 350 words)
  - The definition: a representation is a feature map with its conditioner; power scaling is the default conditioner.
  - Raw flattening, a control: all twelve leads, a six-sample mean per lead, a 1992-dimensional vector; the principle is that sample amplitudes are the features.
  - Conv-AE, a control: twelve leads resampled to 12 by 2500 and z-scored per lead, a 32-unit bottleneck; the principle is that a reconstruction objective compresses what carries signal energy.
  - Hand-crafted features (16): RR statistics and irregularity, P-wave presence and amplitude, QRS width and amplitude, beat-template consistency on lead II, extracted with NeuroKit2 [hrvstandards1996; dechazal2004; neurokit2021; Wesselius_2021]; the principle is that the AF signature is RR irregularity with P-wave absence.
  - The lead, planned wording without a source: the features are extracted from one lead, lead II, because single-lead recordings are an established setting for automated AF detection [clifford2017af] and because a single-lead definition carries to the two-lead MIT-BIH beats (answers R2-1b, first part). The draft's sentence "Lead II is the standard rhythm lead, the one on which RR regularity and P-wave presence are read" (main.tex lines 240 to 242) and the phrase "single-lead by clinical convention" (line 264) are not carried, since no source read states either (needs literature, item 3 of the list). The choice of lead II among the twelve is then stated as the study's choice, and its implication goes to Discussion 5.4.
  - Frozen foundation models: HuBERT-ECG, the first 5 s at 100 Hz flattened to 6000 samples, mean-pooled to 768 dimensions [hubertecg2024]; ECGFounder, the strip resampled to 12 by 5000 and z-scored, pooled to 1024 dimensions [ecgfounder2024].
  - The lead sets differ by design: the raw arm receives more input than the hand-crafted arm, so the lead set cannot account for its chance-level agreement (answers R2-2a).
  - On MIT-BIH: a raw beat window (about 400 dimensions), a 21-dimensional beat-morphology and RR-context set, and the conv-AE. The two foundation models are not applied, because the checkpoints used take 10 s twelve-lead strips and the MIT-BIH unit is a 550 ms two-lead beat.
- 3.3 Clustering and evaluation (about 400 words)
  - 3.3.1 Clusterers, conditioners, metrics and probes (about 250 words)
    - k-means, Ward agglomerative, spectral, Gaussian mixture model (GMM) and hierarchical density-based clustering (HDBSCAN), with the cluster count set to the class count [sklearn2011; hdbscan2013].
    - Four conditioners swept (Yeo-Johnson power, standard, quantile, robust), because the choice of scaler changes the k-means result [Wongoutong_2024]. This replaces the draft's reason "Because heavy-tailed features can dominate Euclidean distance" (main.tex line 313), which no source read states (needs literature, item 4).
    - The metrics table (definition, range and reading of ARI, AMI, NMI, V-measure, Fowlkes-Mallows, purity, silhouette, largest-cluster fraction) [hubertarabie1985; vinh2010; rousseeuw1987] (answers R2-3). The largest-cluster fraction is the cluster-size check, since k-means tends to clusters of uniform size and some validation measures do not register it [Hui_Xiong_2009].
    - The HDBSCAN noise rule: noise is one further group for the agreement measures, purity and silhouette are computed on assigned records, no record is dropped or reassigned (answers R1-3).
    - The supervised ceiling: balanced logistic regression and a random forest under the same patient-grouped five-fold split, read against the supervised PTB-XL reference [Strodthoff_2021].
    - The out-of-fold discriminant test: a linear discriminant fitted on training patients, held-out patients projected onto its axis and clustered without labels, against k-means on the same held-out records.
    - AMI for cluster counts 2 to 8; the 9:1 SR:AF subsample, reported with AMI beside ARI because the reference is unbalanced [arxiv_1512_01286].
  - 3.3.2 Uncertainty and effect sizes (about 150 words)
    - Ten seeds for the seeded clusterers; Ward and HDBSCAN fitted once.
    - The reported interval: a patient-grouped percentile bootstrap over the cohort, 5,000 resamples, of the statistic the tables report [Efron_1979] (answers R1-1 and R3-3); the seed bootstrap is in Appendix A.
    - Paired Wilcoxon signed-rank tests, whose p-value floor is 0.002 with ten seeds; Cliff's delta [Cliff_1993] and the matched-pairs rank-biserial correlation [Kerby_2014]; the paired ARI difference with its own interval (answers R1-2 and R3-3); the significance test for ARI [Steinley_2004] as the reference for testing an observed ARI.
- 3.4 Federated robustness (about 150 words)
  - Federated k-means with centroid aggregation in the style of federated averaging [fedavg2017; arxiv_2310_14858]; no new federated method.
  - The 2,542 records split, patient-grouped, over ten simulated sites, IID or with class proportions drawn from a Dirichlet distribution of concentration 0.3 [arxiv_1909_06335]; conditioning fitted before the split, so the federation concerns the clustering step.
  - Ten seeds, each redrawing the site partition and the initialization; global ARI against centralized clustering of the same representation.
- Appendix A, Implementation settings (about 550 words, outside the total)
  - k-means restarts, Ward linkage, the spectral nearest-neighbour affinity with k-means label assignment, the GMM diagonal covariance with floor 1e-4, the HDBSCAN minimum cluster size of n/50 floored at 10 (50 records here), library tolerances [sklearn2011; hdbscan2013]. [GAP: the number of neighbours of the spectral affinity graph is not stated in main.tex; it is to be taken from code/core/, which is not in the project.]
  - Conv-AE training: Adam at 1e-3, batch 64, at most 50 epochs, 90/10 split, patience 8, best-validation weights restored.
  - Foundation-model inference: evaluation mode, published weights unchanged, HuBERT-ECG last hidden layer at batch 64, ECGFounder pooled layer at batch 32.
  - Conditioning fitted on the full matrix; undefined hand-crafted features filled with the cohort median.
  - Federated runs: 15 rounds of 3 local Lloyd iterations, centroids weighted by assigned records, initialization from two random records, sites with fewer records than clusters dropped.
  - The seed bootstrap: 10,000 resamples over the ten per-seed values, its width below 0.002 for k-means.
  - The cost measurement protocol of Table cost: 100 records, median of three passes, one CPU of one laptop without GPU.
  - These settings answer R3-7.
**Sources**: ptbxl2020, physionet2000, mitbih2001, dechazal2004, hrvstandards1996, neurokit2021, Wesselius_2021, clifford2017af, hubertecg2024, ecgfounder2024, sklearn2011, hdbscan2013, Wongoutong_2024, hubertarabie1985, vinh2010, rousseeuw1987, Hui_Xiong_2009, Strodthoff_2021, arxiv_1512_01286, Efron_1979, Cliff_1993, Kerby_2014, Steinley_2004, fedavg2017, arxiv_2310_14858, arxiv_1909_06335
**Key arguments**: Each representation receives the same input array and declares its own preprocessing. The lead sets differ by design and cannot explain the controls' result. The conditioner is swept because it changes the partition. The supervised ceiling and the out-of-fold test separate missing information from geometry. The reported interval is the patient-grouped one, because the seed interval is near zero width.
**Transition to next**: Methods end on the protocol and its uncertainty estimates; Results report what that protocol measures, in the order of the research questions. The reader should know that every interval is patient-grouped and that every representation includes its conditioner. The connecting theme is agreement under chance-corrected evaluation.

#### 4. Results (about 1,450 words)
**Purpose**: Report the measurements that answer the three research questions and the secondary MIT-BIH question, without interpretation.
**Content**: Results report agreement by representation with its conditioner dependence and its MIT-BIH replication, then the ceilings against agreement, the internal-index check, and the deployment stressors with the extraction cost. Each number traces to a line of main.tex (evidence map, results table). The explanations, with the sources that bear on them, are in Discussion 5.1.
- 4.1 Clustering agreement by representation (about 550 words)
  - 4.1.1 PTB-XL rhythm task (about 250 words)
    - Table 1: ARI by representation and clusterer at power scaling, with the supervised ceiling; patient-grouped intervals on each representation's best clusterer: ECGFounder 0.885 [0.860, 0.909], hand-crafted 0.711 [0.677, 0.746], HuBERT-ECG 0.195 [0.166, 0.227], raw flattening 0.013 [0.007, 0.019], conv-AE 0.008 [0.002, 0.016]; only the two controls overlap.
    - Over k-means, Ward, spectral and GMM, ECGFounder spans 0.709 to 0.885 and the hand-crafted features 0.544 to 0.711, while the representations span 0.000 to 0.885; HDBSCAN, which labels most records as noise at this minimum cluster size, sits lowest in every row; spectral clustering gives HuBERT-ECG 0.016 against 0.134 to 0.195 for the other three non-density clusterers.
    - The k-means contrasts: ECGFounder over hand-crafted 0.242 [0.202, 0.280], hand-crafted over HuBERT-ECG 0.470 [0.424, 0.515], HuBERT-ECG over raw 0.174 [0.146, 0.203], each at the p floor of 0.002 with Cliff's delta and rank-biserial 1.00.
    - AMI for cluster counts 2 to 8: ECGFounder leads at every count (0.825 to a minimum of 0.441), the hand-crafted features fall from 0.557 to 0.329, HuBERT-ECG stays at or below 0.132, raw flattening at or below 0.005.
    - Figure ari-heatmap.
  - 4.1.2 Dependence on feature conditioning (about 150 words)
    - Hand-crafted mean ARI over clusterers: 0.629 standard, 0.606 power, 0.360 robust, 0.229 quantile; ECGFounder 0.866 standard and 0.093 robust.
    - Under robust scaling the order of the two leading representations reverses (0.093 against 0.360).
    - The draft's clause "Robust scaling, a common default for physiological signals, leaves heavy arrhythmic tails unbounded so that a few outliers dominate Euclidean distance" (main.tex lines 580 to 582) is an explanation and leaves Results; Discussion 5.1 plans its wording.
    - [GAP: the averaging behind "mean ARI over clusterers" is not stated in main.tex, and the power values do not reproduce from Table 1's power row; the definition must be taken from code/results/, which is not in the project.]
  - 4.1.3 MIT-BIH beat morphology (about 150 words)
    - Table MIT-BIH: the 21-dimensional beat-morphology set reaches 0.783 (agglomerative), the raw beat window 0.018 (k-means) and 0.049 (agglomerative), the conv-AE at best 0.127 (GMM).
    - Supervised ceilings: beat-morphology 0.925, conv-AE 0.927, raw beat 0.741.
    - The order of the three representations applied matches PTB-XL.
    - [GAP: main.tex gives no interval and no paired test for MIT-BIH.]
- 4.2 Separability and clusterability (about 300 words)
  - Linear ceilings against best ARI: raw 0.519 against 0.013, conv-AE 0.678 against 0.008, HuBERT-ECG 0.899 against 0.195, hand-crafted 0.942 against 0.711, ECGFounder 0.983 against 0.885.
  - The random-forest ceilings: raw 0.714, hand-crafted 0.951, ECGFounder 0.983, HuBERT-ECG 0.825.
  - A new table from main.tex lines 521 to 524, the out-of-fold discriminant test, held-out k-means ARI native against projected: HuBERT-ECG 0.160 to 0.549, conv-AE 0.003 to 0.121, hand-crafted 0.646 to 0.758, ECGFounder 0.893 to 0.923, raw 0.000 to 0.001, on 508 or 509 held-out records per fold over five folds and ten seeds.
  - Figure sep-vs-clust.
- 4.3 Internal validity indices (about 150 words)
  - Raw flattening with Ward clustering: silhouette 0.81, largest-cluster fraction 1.00, ARI 0.000; the hand-crafted features: silhouette 0.28 at ARI 0.711 with balanced clusters.
  - Purity of a single cluster equals the majority share, 0.504.
  - Figure silhouette-trap, 157 solutions over 22 of the 25 cells.
- 4.4 Deployment stress and cost (about 450 words)
  - 4.4.1 Class imbalance (about 150 words)
    - At 9:1 SR:AF (majority 0.90), over ten seeds: hand-crafted ARI 0.265 [0.250, 0.280] and AMI 0.245 [0.233, 0.257]; ECGFounder ARI 0.063 [0.061, 0.065] and AMI 0.148 [0.143, 0.152]; HuBERT-ECG ARI 0.061 [0.053, 0.069] and AMI 0.044 [0.037, 0.050]; raw 0.000 and conv-AE 0.004.
    - The hand-crafted features lead under both ARI and AMI, the measure suited to the unbalanced reference.
    - [GAP: main.tex lines 620 to 626 do not name the clusterer of the imbalance result; it is to be taken from code/results/uncertainty_imbalance.csv, which is not in the project. Discussion 5.1 cites the uniform effect of k-means only if the clusterer is k-means.]
  - 4.4.2 Simulated federation (about 150 words)
    - IID federation keeps the centralized ARI of every representation (Table fed).
    - Non-IID: hand-crafted 0.644 to 0.591 (retention 0.92), ECGFounder 0.885 to 0.612 (0.69), HuBERT-ECG 0.174 to 0.106 (0.61), raw 0.000.
    - Over the ten site draws: hand-crafted interval [0.546, 0.631], lowest draw 0.455; ECGFounder interval [0.382, 0.796], three draws at or below 0.132 and one at chance, range from chance to 0.881.
    - Figure federated-ari.
  - 4.4.3 Computational cost (about 150 words)
    - Table cost: inference per record 0.058 ms raw, 1.441 ms conv-AE, 28.296 ms hand-crafted, 37.530 ms HuBERT-ECG, 434.713 ms ECGFounder (15.4 times the hand-crafted extraction); peak memory 364.0 MB hand-crafted against 1,037.6 MB ECGFounder and 1,864.8 MB HuBERT-ECG; no learned parameters in the hand-crafted path; k-means under 0.3 s for the whole cohort at every dimensionality.
    - The conv-AE's one-off training of 59.2 s; encoder loading 5.4 s and 0.8 s.
    - HuBERT-ECG costs 1.3 times the hand-crafted extraction, so the cost gap of note is the one to ECGFounder.
**Sources**: none required (original analysis). The comparisons with the literature are in the Discussion.
**Key arguments**: The representation with its conditioner moves agreement far more than the choice among the four non-density clusterers. The low-scoring representations differ in kind: HuBERT-ECG holds a transferable linear direction, raw flattening holds none. A degenerate partition scores the highest silhouette. Under imbalance and simulated federation the hand-crafted features keep more of their structure, at a fraction of ECGFounder's cost.
**Transition to next**: Results end on measurements without explanation; the Discussion explains why each representation sits where it does, compares the results with the prior benchmarks and states what the results allow a practitioner to conclude. The reader should have each representation's ceiling, agreement and out-of-fold gain in view. The connecting theme is the reading of the ceiling against the agreement.

#### 5. Discussion (about 1,450 words)
**Purpose**: Interpret the results, compare them with the literature, give the bounded implications and state the scope boundaries.
**Content**: The Discussion explains the position of each representation from its ceiling, its out-of-fold gain and its pretraining, and the effects of the conditioner, the clusterer and the imbalance, then sets the results against the frozen-encoder benchmarks, the closest prior study and the applied clustering practice. It gives the decision rule for the two tasks evaluated and ends on the limitations and the next studies.
- 5.1 Interpretation of the representation results (about 500 words)
  - ECGFounder: pretrained with expert labels on over 10 million ECGs [ecgfounder2024]; its out-of-fold gain is small (0.893 to 0.923), which places the rhythm split on its dominant axes (answers R2-4).
  - The hand-crafted features: each of the 16 coordinates is a quantity by which the classes are defined [Wesselius_2021; hrvstandards1996].
  - HuBERT-ECG: a ceiling of 0.899 against an agreement of 0.195; one direction fitted on other patients raises the held-out ARI 3.4 times, so the class information is present, transfers across patients and lies off the dominant axes of a self-supervised embedding [hubertecg2024]. The reading matches the mechanism stated for self-supervised image representations, a small variance along the class-separating direction beside large within-class variance in other directions [arxiv_2603_03530], and the report that HuBERT-ECG embeddings organise by dataset more than by label [lookingbeyond2026]. Its random-forest ceiling of 0.825 lies below the linear one, so probe linearity does not explain the gap (answers R2-5).
  - Conv-AE: a reconstruction bottleneck keeps 0.678 of a class it was not trained on and gains to 0.121 out of fold, so its class structure is off-axis and diffuse, in line with the overlap of image autoencoder latents [Wheeldon_2023]; ECG autoencoder latents carry clinical information shown by supervised association [Friedman_2025; Jang_2021], which agrees with a ceiling above the majority share.
  - Raw flattening: the linear ceiling of 0.519 and the out-of-fold result show no linear arrangement of the label, while the random forest at 0.714 shows non-linear label information; fixed sample offsets fall on different parts of the cardiac cycle in different recordings.
  - The general phenomenon: probe accuracy and partition diverge in image representations [arxiv_2603_03530; arxiv_2604_24469; Van_Gansbeke_2020; arxiv_2303_17896], with sslclustering2025 as background on clustering properties of self-supervised components; this study measures the divergence on ECG representations with a patient-grouped out-of-fold test.
  - The conditioner: the dependence of the partition on the scaler agrees with [Wongoutong_2024], where RobustScaler is not among the best of five scalings. The draft's explanation is worded as a reading the study does not test: robust scaling does not bound values far from the median, so a few extreme records can dominate Euclidean distance. "A common default for physiological signals" is not carried (needs literature, item 4).
  - The spectral cell of HuBERT-ECG (0.016): spectral clustering returns connected components as clusters when the nearest-neighbour graph has more components than clusters asked for [von_Luxburg_2007]. The connectivity of the graph is not reported in main.tex, so the sentence is worded as a possible cause unless code/results/ gives the component count [GAP].
  - The imbalance: every representation's ARI falls at 9:1; k-means-type algorithms tend to clusters of relatively uniform size when the true sizes differ [Hui_Xiong_2009; Liang_2012], which bears on isolating a 10 percent minority, provided the clusterer of 4.4.1 is k-means. The sources explain the fall common to all representations and not the order between them. The draft's "with a partitional method is intrinsically hard" (main.tex lines 620 to 621) is scoped to k-means-type algorithms, as the sources state it.
- 5.2 Comparison with prior work (about 350 words)
  - What the paper adds to [lookingbeyond2026]: the hand-crafted axis; the linear and non-linear ceilings on the clustering split and the out-of-fold test; patient-grouped intervals; SR against AF on PTB-XL, which that study does not evaluate; MIT-BIH; the two cautions; the stressors with cost (answers R3-1).
  - Agreement with [lookingbeyond2026]: its AF label-level ARI of Gaussian mixture clusters is 0.70 for ECGFounder against 0.00 to 0.04 for the HuBERT-ECG sizes, over CODE-15%, Georgia and Chapman-Shaoxing; here, on PTB-XL, ECGFounder reaches 0.851 with the GMM and HuBERT-ECG 0.195. The order of the two models agrees across datasets the two studies do not share. The magnitudes are not compared, since the datasets, the preprocessing and the cohort balance differ and that study gives no interval. Its finding that PTB-XL is the hardest of its datasets to embed concerns the CD label.
  - The frozen-encoder benchmarks [Lunelli_2026; arxiv_2509_25095; arxiv_2608_03597]: FOUND-AF also finds ECGFounder strongest for AF under a supervised head; the gap between HuBERT-ECG's ceiling and its agreement shows a probe ranking and a clustering ranking can diverge.
  - The raw-flattening control plays the role of the random-encoder baseline [arxiv_2602_17531].
  - Supervised networks outperform features on PTB-XL [Strodthoff_2021]; without labels the hand-crafted features are second only to ECGFounder; hand-crafted markers give clinically distinct clusters elsewhere [Madrid_2025].
  - ARI read with AMI under imbalance [arxiv_1512_01286; Steinley_2004].
  - The silhouette caution and practice: applied ECG clustering uses the silhouette to set the cluster count [Shetty_2024] and as the only validation on unlabelled data [Digiacomo_2025]; internal measures are unreliable for comparing partitions computed in different embedding spaces [Wang_2026], which is the comparison 4.3 makes between raw flattening and the hand-crafted features. The caution states what the silhouette alone cannot show and makes no statement about the results of those studies. Purity as validation rests on [Steinley_2004] and the single-cluster purity of 0.504.
- 5.3 Implications for practice (about 250 words)
  - The decision rule, bounded to SR against AF on PTB-XL and N-vs-V on MIT-BIH and to the five clusterers tested (answers R3-8): ECGFounder on balanced twelve-lead data; the hand-crafted features under class imbalance, under simulated site heterogeneity in prevalence, or where interpretability, dimensionality or cost decides.
  - Cost: the foundation-model profiling of [arxiv_2608_03597] and [arxiv_2509_25095] compares encoders with each other; the cost of feature preprocessing in supervised pipelines [arxiv_2303_11429]; here the hand-crafted path costs one fifteenth of ECGFounder's time and about a third of its memory (answers R1-4 and R3-6).
  - Federation: the degradation under Dirichlet partitions agrees with [arxiv_1909_06335]; federated clustering methods with heterogeneity-aware aggregation [arxiv_2103_00697; arxiv_2310_14858; arxiv_2611_11481] and multi-centre pretraining [arxiv_2503_00711] were not tested here; siloed clinical data [Rieke_2020].
  - The draft's clause "if the leads on hand are not the standard twelve" is not planned, since no reduced-lead foundation-model run was made and ECGFounder has a single-lead extension [ecgfounder2024].
- 5.4 Limitations and future research (about 350 words)
  - Two foundation models by selection: both publish frozen-loadable weights and differ in objective and architecture; other open-weight encoders [McKeen_2025; arxiv_2402_09450; arxiv_2410_08559; arxiv_2403_06659; Xu_2025] are outside the results, among them ECG-FM, whose AF label-level ARI is 0.64 in [lookingbeyond2026]; every statement is scoped to the two models (answers R3-4).
  - Five classical clusterers: clustering objectives learned on mined neighbours or clustering heads raise agreement over k-means on pretrained image features [Van_Gansbeke_2020; arxiv_2303_17896], and multicentre k-means counters the uniform effect [Liang_2012]; they are outside the results, and every clusterer statement is scoped to the five tested.
  - The hand-crafted features use lead II alone; main.tex reports no other lead and no multi-lead feature set, so the hand-crafted result is a result for one lead, with less input than the raw and foundation-model arms (answers R2-1b, second part).
  - ECGFounder on 100 Hz input upsampled to its 500 Hz length, with the 300-record check: 0.896 native against 0.909 upsampled.
  - Two binary tasks; no statement on multi-class rhythm structure; the multi-class 12-lead cohorts where that boundary lies [Zheng_2020; Perez_Alday_2020; Reyna_2021] (answers R3-2).
  - Inter-expert disagreement in AF labels bounds any agreement with them [clifford2017af].
  - Simulated federation on one dataset, heterogeneity in prevalence only; device, lead placement, case mix and labelling practice absent; the CinC 2020 and 2021 sets carry real institution splits [Perez_Alday_2020; Reyna_2021] (answers R3-5).
  - MIT-BIH without foundation models: the checkpoints take strips, the task unit is a beat; the single-lead ECGFounder extension [ecgfounder2024] is outside the results.
  - Future research: a multi-class PTB-XL rhythm cohort over the same embeddings; a federation over real institutions; further encoders and learned clustering objectives measured under both stressors.
**Sources**: ecgfounder2024, hubertecg2024, Wesselius_2021, hrvstandards1996, arxiv_2603_03530, lookingbeyond2026, Wheeldon_2023, Friedman_2025, Jang_2021, arxiv_2604_24469, Van_Gansbeke_2020, arxiv_2303_17896, sslclustering2025, Wongoutong_2024, von_Luxburg_2007, Hui_Xiong_2009, Liang_2012, Lunelli_2026, arxiv_2509_25095, arxiv_2608_03597, arxiv_2602_17531, Strodthoff_2021, Madrid_2025, arxiv_1512_01286, Steinley_2004, Shetty_2024, Digiacomo_2025, Wang_2026, arxiv_2303_11429, arxiv_1909_06335, arxiv_2103_00697, arxiv_2310_14858, arxiv_2611_11481, arxiv_2503_00711, Rieke_2020, McKeen_2025, arxiv_2402_09450, arxiv_2410_08559, arxiv_2403_06659, Xu_2025, Zheng_2020, Perez_Alday_2020, Reyna_2021, clifford2017af
**Key arguments**: Each representation's position follows from how much of the label its space holds and where the label lies, as the image literature predicts. The order of the two foundation models agrees with the closest study on other datasets, and the paper adds a hand-crafted axis and ceilings to it. The silhouette caution addresses a practice applied ECG clustering follows. The deployment reading holds for the two tasks, the two named models, the five clusterers and simulated prevalence heterogeneity.
**Transition to next**: The Discussion ends on the boundaries of what the results show; the Conclusion restates the findings inside those boundaries. The reader should hold the decision rule with its scope. The connecting theme is the bounded thesis.

#### 6. Conclusion (about 350 words)
**Purpose**: Restate the thesis with its evidence and its scope.
**Content**: The Conclusion states the findings for the two tasks with their key numbers and the boundaries of the claims. It names the questions the study leaves open without adding new claims.
- 6.1 Findings (about 200 words)
  - On balanced PTB-XL data ECGFounder leads (0.885); under 9:1 imbalance the hand-crafted features overtake it (0.265 against 0.063); under simulated non-IID federation they retain 0.92 of their centralized ARI against 0.69 and never fall below 0.455; they cost one fifteenth of ECGFounder's extraction time.
  - The raw and conv-AE controls stay at a majority-class assignment on PTB-XL under all five clusterers.
  - The internal index and the conditioner change the reading and must be reported.
- 6.2 Scope of the findings (about 150 words)
  - Two binary tasks, two named foundation models, five clusterers, a simulated federation.
  - Open: multi-class rhythm cohorts, further encoders and clustering objectives, a real multi-institution federation.
**Sources**: none.
**Key arguments**: The thesis, restated within its scope.
**Transition to next**: none (last section).

### Evidence map

Every source of review.md is assigned below, 66 in all: the 21 entries of manuscript/refs.bib and the 45 entries of the run's refs.bib. Each key carries its stance tag from review.md: (s) supports, (o) opposes, (n) neutral.

| Section | Assigned sources | Evidence type |
|---|---|---|
| Introduction 1.1 | Nezamabadi_2023 (s), Wesselius_2021 (n), Rouhi_2021 (s), arxiv_2410_19877 (n), Steinley_2004 (s), arxiv_2603_03530 (s), arxiv_2604_24469 (s), Van_Gansbeke_2020 (s), arxiv_2303_17896 (s) | Context: aim of unsupervised ECG analysis, representation families, the case against classification rates for cluster validation, the probe-and-partition divergence credited to prior work |
| Introduction 1.2 | Lunelli_2026 (n), arxiv_2509_25095 (s), arxiv_2608_03597 (s), arxiv_2602_17531 (s), lookingbeyond2026 (s) | Problem framing: frozen encoders scored through supervised heads, protocol dependence, what the closest study reports |
| Introduction 1.3 | Rieke_2020 (s) | Why federation matters for clinical data |
| Introduction 1.4 | lookingbeyond2026 (s) | The closest study uses no MIT-BIH data |
| Related work 2.1.1 | hrvstandards1996 (n), dechazal2004 (s), Wesselius_2021 (n), Rouhi_2021 (s), neurokit2021 (n), clifford2017af (n), Strodthoff_2021 (n) | Theme T3 results: feature families, compact AF features, supervised comparison on PTB-XL |
| Related work 2.1.2 | clocs2021 (n), threekg2021 (n), mehari2022ssl (n), arxiv_2402_09450 (n), arxiv_2410_08559 (n), McKeen_2025 (n), arxiv_2403_06659 (n), arxiv_2503_00711 (n), arxiv_2410_19877 (n), hubertecg2024 (n), ecgfounder2024 (n) | Theme T1: encoder families and their pretraining |
| Related work 2.1.3 | Lunelli_2026 (n), arxiv_2509_25095 (s), arxiv_2608_03597 (s), Xu_2025 (n), arxiv_2602_17531 (s), lookingbeyond2026 (s), arxiv_2303_11429 (s) | Themes T1 and T8: benchmark protocols, their disagreement, label-level and dataset-level ARI among foundation models, compute cost |
| Related work 2.2.1 | Nezamabadi_2023 (s), wavelettensorecg2018 (s), Madrid_2025 (s), Jang_2021 (s), Friedman_2025 (s), Shetty_2024 (n), Digiacomo_2025 (n), hdbscan2013 (n) | Theme T2: one representation clustered per study |
| Related work 2.2.2 | mehari2022ssl (n), arxiv_2603_03530 (s), arxiv_2604_24469 (s), Van_Gansbeke_2020 (s), arxiv_2303_17896 (s), sslclustering2025 (n), Wheeldon_2023 (s), Friedman_2025 (s), Jang_2021 (s) | Theme T2: the divergence of probe accuracy and partition, its mechanism, clusterability of latents |
| Related work 2.2.3 | fedavg2017 (n), arxiv_1909_06335 (n), arxiv_2103_00697 (s), arxiv_2310_14858 (n), arxiv_2611_11481 (n), Alreshidi_2024 (n), Rieke_2020 (s) | Theme T6: federated averaging and federated k-means under heterogeneity |
| Related work 2.3 | hubertarabie1985 (n), Steinley_2004 (s), vinh2010 (n), arxiv_1512_01286 (s), rousseeuw1987 (n), Wang_2026 (s), Hui_Xiong_2009 (s), Shetty_2024 (n), Digiacomo_2025 (n), Cliff_1993 (n), Kerby_2014 (n), Efron_1979 (n), arxiv_2608_03597 (s) | Themes T4 and T5: external and internal indices, their reliability, the silhouette in applied ECG clustering, effect sizes, bootstrap |
| Related work 2.4 | lookingbeyond2026 (s), Lunelli_2026 (n), arxiv_2608_03597 (s), arxiv_2602_17531 (s), Madrid_2025 (s), wavelettensorecg2018 (s) | Gap confirmation |
| Methods 3.1 | ptbxl2020 (n), physionet2000 (n), mitbih2001 (n), dechazal2004 (s) | Datasets and the inter-patient grouping |
| Methods 3.2 | hrvstandards1996 (n), dechazal2004 (s), neurokit2021 (n), Wesselius_2021 (n), clifford2017af (n), hubertecg2024 (n), ecgfounder2024 (n) | Feature definitions, extraction tool, single-lead AF setting, encoders; lead II without a source (item 3) |
| Methods 3.3.1 | sklearn2011 (n), hdbscan2013 (n), Wongoutong_2024 (s), hubertarabie1985 (n), vinh2010 (n), rousseeuw1987 (n), Hui_Xiong_2009 (s), Strodthoff_2021 (n), arxiv_1512_01286 (s) | Clusterers, the conditioner sweep, metric definitions, the cluster-size check, supervised reference, AMI under imbalance |
| Methods 3.3.2 | Efron_1979 (n), Cliff_1993 (n), Kerby_2014 (n), Steinley_2004 (s) | Bootstrap, effect sizes, ARI significance test |
| Methods 3.4 | fedavg2017 (n), arxiv_2310_14858 (n), arxiv_1909_06335 (n) | Federated k-means and Dirichlet partitions |
| Appendix A | sklearn2011 (n), hdbscan2013 (n) | Implementation settings |
| Results 4.1 to 4.4 | none | Original analysis (results table below) |
| Discussion 5.1 | ecgfounder2024 (n), hubertecg2024 (n), Wesselius_2021 (n), hrvstandards1996 (n), arxiv_2603_03530 (s), lookingbeyond2026 (s), Wheeldon_2023 (s), Friedman_2025 (s), Jang_2021 (s), arxiv_2604_24469 (s), Van_Gansbeke_2020 (s), arxiv_2303_17896 (s), sslclustering2025 (n), Wongoutong_2024 (s), von_Luxburg_2007 (s), Hui_Xiong_2009 (s), Liang_2012 (s) | Mechanism of each representation's position; conditioner, spectral cell and imbalance readings |
| Discussion 5.2 | lookingbeyond2026 (s), Lunelli_2026 (n), arxiv_2509_25095 (s), arxiv_2608_03597 (s), arxiv_2602_17531 (s), Strodthoff_2021 (n), Madrid_2025 (s), arxiv_1512_01286 (s), Steinley_2004 (s), Shetty_2024 (n), Digiacomo_2025 (n), Wang_2026 (s) | Comparison with the literature and with applied clustering practice |
| Discussion 5.3 | arxiv_2608_03597 (s), arxiv_2509_25095 (s), arxiv_2303_11429 (s), arxiv_1909_06335 (n), arxiv_2103_00697 (s), arxiv_2310_14858 (n), arxiv_2611_11481 (n), arxiv_2503_00711 (n), Rieke_2020 (s), ecgfounder2024 (n) | Cost, federation and lead-count implications |
| Discussion 5.4 | McKeen_2025 (n), arxiv_2402_09450 (n), arxiv_2410_08559 (n), arxiv_2403_06659 (n), Xu_2025 (n), lookingbeyond2026 (s), Van_Gansbeke_2020 (s), arxiv_2303_17896 (s), Liang_2012 (s), Zheng_2020 (n), Perez_Alday_2020 (n), Reyna_2021 (n), clifford2017af (n), ecgfounder2024 (n) | Scope boundaries and the cohorts, encoders and clusterers where the next studies lie |

The eight items of the earlier list "Needs literature", with what review.md section 11 found and where it goes:

| Item | Claim | Sources | Assigned to | Status |
|---|---|---|---|---|
| 1 | Linear-probe accuracy diverging from clustering on the same representation | arxiv_2603_03530, arxiv_2604_24469, Van_Gansbeke_2020, arxiv_2303_17896; sslclustering2025 as background | 1.1, 2.2.2, 5.1 | Assigned, for image representations; the ECG measurement is this paper's |
| 2 | What lookingbeyond2026 reports | lookingbeyond2026, read in full text | 1.2, 1.4, 2.1.3, 2.4, 5.1, 5.2, 5.4 | Assigned; the draft's statements corrected below |
| 3 | Lead II as the standard rhythm lead | none | 3.2, 5.4 | Needs literature; planned rewording to clifford2017af |
| 4 | Robust scaling as a common default for physiological signals; heavy tails dominating Euclidean distance after it | Wongoutong_2024 for the related claim that the scaler changes the k-means result | 3.3.1, 5.1 | Needs literature for both claims as worded; planned rewording |
| 5 | K-means and a 10 percent minority cluster | Hui_Xiong_2009, Liang_2012 | 5.1, 5.4 | Assigned, conditional on the clusterer of 4.4.1 being k-means |
| 6 | Internal indices maximized by degenerate partitions | Wang_2026 and Hui_Xiong_2009 for related claims | 2.3, 5.2 | Needs literature for the claim as worded; planned rewording |
| 7 | Spectral clustering on a poorly connected nearest-neighbour graph | von_Luxburg_2007 | 5.1 | Assigned; the sentence is kept as a possible cause, since the graph's connectivity is not reported |
| 8 | Applied ECG clustering reporting purity or the silhouette as validation | Shetty_2024, Digiacomo_2025 for the silhouette; Steinley_2004 for purity in principle | 2.2.1, 2.3, 5.2 | Assigned for the silhouette; no applied source for purity |

Stance notes. The tags are review.md's, stated against each source's own position. These read against a sub-argument of this paper and are the counter-evidence the Discussion answers:
- **Jang_2021 and Friedman_2025** support autoencoder features for rhythm structure and the informativeness of unsupervised ECG latents; against the conv-AE result they are the opposing sources, answered in 5.1 by the difference between information (the ceiling) and clusterability (the agreement).
- **arxiv_2103_00697** supports the view that heterogeneity need not harm federated clustering; against the non-IID degradation it is the opposing source, answered in 5.3 by the different method (one-shot k-FED) and its separation assumption.
- **Van_Gansbeke_2020 and arxiv_2303_17896** support sub-argument 2 and read against an unscoped form of the clusterer claim of sub-argument 1: a clustering objective learned on mined neighbours raises accuracy over k-means on the same features. The outline scopes every clusterer statement to the five clusterers tested and names learned clustering objectives in 5.4.
- **Wongoutong_2024** supports the conditioner sweep; its ranking of scalers comes from generic datasets, and the draft writer does not equate its percentile transformation with the quantile conditioner here without checking its definition.
- **ecgfounder2024** is tagged neutral; its extension to lower-lead and single-lead ECGs opposes the draft's statement that the foundation models cannot embed non-twelve-lead data, which the outline does not plan (5.3, 5.4).
- **wavelettensorecg2018** supports feature-based unsupervised classification, so its tensor representation is a further family outside the comparison, named in 2.2.1.
- **Shetty_2024 and Digiacomo_2025** are tagged neutral: they are examples of the practice the silhouette caution addresses, and the paper states nothing about their results.

Results of the project, each with its place in manuscript/main.tex:

| Result | Section | main.tex lines |
|---|---|---|
| Cohort sizes, majority 0.504, input array | Methods 3.1 | 192, 198 to 204, 210 to 211 |
| Table 1, ARI by representation and clusterer, ceilings | Results 4.1.1, 4.2 | 428 to 432 |
| Best-clusterer patient intervals; seed spread | Results 4.1.1 | 414 to 420 |
| Contrasts with paired intervals, Cliff's delta and rank-biserial | Results 4.1.1 | 452 to 459 |
| AMI for cluster counts 2 to 8 | Results 4.1.1 | 461 to 464 |
| Conditioner sweep means | Results 4.1.2 | 576 to 581 |
| MIT-BIH table and ceilings | Results 4.1.3 | 588 to 592, 600, 607 to 609 |
| Random-forest ceilings | Results 4.2 | 506 to 512 |
| Out-of-fold discriminant test | Results 4.2 | 515 to 525 |
| Silhouette and largest-cluster fraction | Results 4.3 | 550 to 554, 566 to 568 |
| Imbalance over ten seeds | Results 4.4.1 | 620 to 626 |
| Federation table, intervals, worst draws | Results 4.4.2 | 633 to 637, 652 to 655, 790 to 792 |
| Cost table | Results 4.4.3 | 676 to 682, 694 to 696, 703 to 707 |
| 500 Hz consistency check | Discussion 5.4 | 771 to 776 |

Gaps in the results, where main.tex holds no number and code/results/ is not in the project:
- The averaging behind the conditioner means of 4.1.2. The hand-crafted power-scaling mean of 0.606 matches neither the mean of Table 1's five power-scaling cells (0.526) nor of its four non-HDBSCAN cells (0.643), and ECGFounder's power-scaling mean is not given (computed with `bc` from Table 1's row).
- Intervals and paired tests for MIT-BIH (4.1.3).
- The clusterer of the imbalance result (4.4.1).
- The number of neighbours of the spectral affinity graph and the number of connected components of that graph on each representation (Appendix A, 5.1).
- Interval half-widths for the 25 cells of figure ari-heatmap, the per-solution values of figure silhouette-trap, and the federated intervals of HuBERT-ECG and raw flattening (figures table below).

Points in the draft that the outline corrects, for the draft writer:
- **What lookingbeyond2026 reports.** main.tex lines 122 to 123 ("a cluster-separability analysis on PTB-XL") and 180 to 181 ("reports cluster-separability (ARI) of foundation-model embeddings on PTB-XL") become: ARI of Gaussian mixture clusters against the CD and AF labels and against dataset membership over four datasets, one value per model and label, with AF not evaluated on PTB-XL. Lines 124 to 125 ("By its own statement it does not include a representation-wise comparison against hand-crafted features") become an observation about the source, that its text names no hand-crafted features and no MIT-BIH data, since the source makes no such statement. Lines 181 to 183 (some models cluster by clinical label and others by dataset; prior work omits a representation-wise evaluation) and 466 to 468 stand, as the full text supports them. Lines 777 to 778 ("other foundation models, including some reported to cluster well") name ECG-FM, whose AF label-level ARI is 0.64 there.
- **The separability-and-clusterability credit.** Lines 117 to 118, 504 to 505 and 740 to 741 credit the phenomenon to sslclustering2025, whose annotation reports clustering properties of self-supervised components without a comparison with linear probes. The credit goes to arxiv_2603_03530, arxiv_2604_24469, Van_Gansbeke_2020 and arxiv_2303_17896, with sslclustering2025 kept as background.
- **Degenerate partitions and rousseeuw1987.** Lines 176 to 177 cite rousseeuw1987 for internal indices that "can be maximised by degenerate solutions"; its annotation does not state it. The outline cites Wang_2026 and Hui_Xiong_2009 for the unreliability of internal measures and states the degenerate case as this paper's result.
- **Lead II and robust scaling.** Lines 240 to 242 and 264 (lead II as the standard rhythm lead, single-lead by clinical convention), 313 and 580 to 582 (robust scaling as a common default, heavy tails dominating Euclidean distance) carry claims no source read states; the planned wording is in 3.2, 3.3.1 and 5.1.
- **Spectral clustering.** Lines 470 to 471 state as fact that spectral clustering "collapses where the nearest-neighbour affinity graph is poorly connected"; main.tex reports no connectivity. The outline words it as a possible cause with von_Luxburg_2007.
- **The imbalance explanation.** Lines 620 to 621 ("isolating a 10% minority cluster with a partitional method is intrinsically hard") are scoped to k-means-type algorithms with Hui_Xiong_2009 and Liang_2012, and move to Discussion 5.1.
- **Raw flattening's label information.** main.tex line 488 reads the raw failure as "for want of label information in the space", and line 496 says it "carries almost no label information", while the random forest reaches 0.714 on it (line 506). The outline reads it as no linear arrangement of a label that is present non-linearly (5.1).
- **MIT-BIH controls.** Lines 729 to 732 say the raw and autoencoder representations sit at a majority-class assignment "on either task" "under all five clusterers"; on MIT-BIH three clusterers were run and the conv-AE reaches 0.127. The outline scopes that statement to PTB-XL.
- **The contrast list.** Line 452 says the Wilcoxon test "confirms every adjacent contrast" and tests HuBERT-ECG over raw, skipping the conv-AE, which sits between them under k-means (0.004). The outline names the three contrasts tested.
- **0.242.** The ECGFounder over hand-crafted difference of 0.242 differs from the 0.241 the rounded Table 1 entries give; the text states that differences are taken from unrounded seed means.
- **Conditioner reversal.** The draft does not state that robust scaling reverses the order of ECGFounder and the hand-crafted features; the outline states it in 4.1.2.
- **Numbers in the roadmap.** admin/reviews/revision-roadmap.md gives the input array as 5000 by 12 at 100 Hz and an out-of-fold ARI of 0.92 for HuBERT-ECG; main.tex gives 1000 by 12 (line 201) and 0.549 for HuBERT-ECG with 0.923 for ECGFounder (lines 521 to 524). The outline follows main.tex.

### Planned figures

| Label | Section | What it shows | Data |
|---|---|---|---|
| ari-heatmap | Results 4.1.1 | ARI of the 25 representation-by-clusterer cells at power scaling, so that the larger spread across rows (representations) than across the four non-density columns (clusterers) is seen at once | ARI values: Table 1, main.tex lines 428 to 432. Cell interval half-widths: only in the existing manuscript/figures/fig1_ari_heatmap.pdf [GAP: not in main.tex, code/results/ not in the project] |
| sep-vs-clust | Results 4.2 | Supervised ceiling against ARI for the five clusterers of each representation, the best one with its patient interval, against the parity line | Table 1 ceilings and ARI, main.tex lines 428 to 432; intervals, lines 414 to 416. Complete in main.tex; existing file manuscript/figures/fig3_sep_vs_clust.pdf |
| silhouette-trap | Results 4.3 | Silhouette against ARI for 157 single solutions, marker size the largest-cluster fraction, the degenerate partitions at high silhouette and zero ARI | Per-solution values: only in the existing manuscript/figures/fig2_silhouette_trap.pdf [GAP: not in main.tex]; summary points at lines 550 to 554 |
| federated-ari | Results 4.4.2 | Centralized, IID and non-IID ARI per representation with the spread over the ten site draws | Means: main.tex lines 652 to 655; intervals of ECGFounder and the hand-crafted features, lines 635 to 637; HuBERT-ECG and raw intervals only in the existing manuscript/figures/fig4_federated.pdf [GAP]. The per-draw values, which would show the three ECGFounder draws at or below 0.132, are in code/results/, not in the project |

The printed order is ari-heatmap (Figure 1), sep-vs-clust (Figure 2), silhouette-trap (Figure 3), federated-ari (Figure 4), as in the draft, where Reviewer 1, item 5, calls the separability plot Figure 2. The existing file names fig2 and fig3 run the other way; the labels are the names the draft writer and the visualization agent share. No figure is planned for the imbalance result, the cost or the out-of-fold test, which a sentence or a table shows as well; the out-of-fold test gets a table in 4.2.

### Word count summary

| Section | Target words |
|---|---|
| Abstract | 250 (fixed, outside the total) |
| 1. Introduction | 1,050 (1.1 300, 1.2 250, 1.3 250, 1.4 250) |
| 2. Related work | 1,800 (2.1 650: 2.1.1 200, 2.1.2 250, 2.1.3 200; 2.2 600: 2.2.1 200, 2.2.2 250, 2.2.3 150; 2.3 350; 2.4 200) |
| 3. Methods | 1,150 (3.1 250, 3.2 350, 3.3 400: 3.3.1 250, 3.3.2 150; 3.4 150) |
| 4. Results | 1,450 (4.1 550: 4.1.1 250, 4.1.2 150, 4.1.3 150; 4.2 300; 4.3 150; 4.4 450: 4.4.1 150, 4.4.2 150, 4.4.3 150) |
| 5. Discussion | 1,450 (5.1 500, 5.2 350, 5.3 250, 5.4 350) |
| 6. Conclusion | 350 (6.1 200, 6.2 150) |
| Appendix A | about 550 (outside the total) |
| Total | 7,250 words |

The sum is 7,250 words against the target of 7,000, a deviation of 3.6 percent. The shares are 14.5 percent Introduction, 24.8 percent Related work, 15.9 percent Methods, 20.0 percent Results, 20.0 percent Discussion and 4.8 percent Conclusion, against 15, 25, 15, 20, 20 and 5 in the IMRaD column. No section is below 200 words or above 35 percent, and every lowest heading holds at least 150 words.

Needs literature:
- Item 3. Methods 3.2 and Discussion 5.4: that lead II is the standard rhythm lead, the lead on which RR regularity and P-wave presence are read, and that the hand-crafted arm is single-lead "by clinical convention" (main.tex lines 240 to 242 and 264). The strategist found no source (review.md, section 11, item 3): the two Spodick notes have no abstract or text in the indexes, and the abstract of the AHA recommendations, part I, does not address the rhythm lead. Planned rewording that stands without a source: the features are extracted from lead II because single-lead recordings are an established setting for automated AF detection [clifford2017af] and a single-lead definition carries to the two-lead MIT-BIH beats; the choice of lead II among the twelve is stated as the study's choice, with its implication in 5.4. Otherwise a source the user holds.
- Item 4. Methods 3.3.1, Results 4.1.2 and Discussion 5.1: that robust scaling is a common default for physiological signals, and that heavy-tailed features dominate Euclidean distance after it (main.tex lines 313 and 580 to 582). No source found for either claim as worded (review.md, section 11, item 4). Planned rewording: the conditioners are swept because the scaler changes the k-means result [Wongoutong_2024]; "a common default for physiological signals" is cut; the heavy-tail explanation is worded in 5.1 as a reading the study does not test.
- Item 6. Related work 2.3: that internal indices can be maximized by degenerate partitions (main.tex lines 176 to 177, citing rousseeuw1987). No source found for the claim as worded (review.md, section 11, item 6). Planned rewording: internal measures are unreliable for comparing partitions computed in different embedding spaces [Wang_2026], some validation measures do not register the uniform effect of k-means [Hui_Xiong_2009], and the degenerate case is stated as this paper's result in 4.3.

Items 1, 2, 5, 7 and 8 of the earlier list have sources and are assigned (evidence map, table of the eight items).

Sources pending: none. Every source the outline assigns has an entry, the 21 in manuscript/refs.bib and the 45 in the run's refs.bib.

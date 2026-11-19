# settings.md

| Parameter | Value |
|---|---|
| Task | literature review |
| Arguments | Topic (text, no path): "supervised prediction from data whose spatial mode is not aligned across subjects, such as point clouds or sets of regions: multilinear and tensor partial least squares and tensor regression, decompositions of tensors with an unaligned mode, optimal transport with entropic regularization, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters and dictionaries with learnable templates, registration-free transport-based fusion in medical imaging, permutation-invariant set encoders, and the image registration, radiomics and lesion segmentation pipelines such methods avoid or build on". No `.tex` given, so no manuscript and no `.bib` patch. |
| Topic | As in Arguments. |
| Research question | Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines? |
| Paper type | IMRaD (the review serves as the related work of a methods paper). Not answered by the user; taken as the session's recommendation under the instruction not to stop (see Decisions). |
| Discipline | Machine learning, with medical image analysis as the application setting; methods admitted from any application domain. |
| Language | English; English-only abstract. |
| Materials in hand | None; no seed `.bib` or reference list. |
| Domain evidence profile | cs_ml |
| DOI checking | strict |
| Earlier run record | none (no `run/` folder stood before this run) |

## Notes

- Model of the role agents: opus, identifier `claude-opus-5-5`; agent effort medium.
- Served model: the launch record of the four theme runs names the model requested (opus) and no served model identifier, so no served identifier other than `claude-opus-5-5` is recorded.
- Instruction not to stop: "From here on, do not stop for a choice whose recommendation you would take; take it and record it in settings.md. I refuse to interact further." Every such choice is taken with its recommendation and recorded under Decisions.
- AI use, as the user stated it: research assistance, by this run. Each other category: uncertain. Tools and versions not known.
- Prose standard: the default prose standard (the repository has no `docs/dev/prose-standard.md`), with the default manuscript prose standard.

## Decisions

1. Intake confirmation: the user's reply of 2026-11-19 gave every row but Paper type and stated the instruction not to stop. The record is taken as confirmed with Paper type IMRaD, the session's recommendation from the intake question, since the topic reads as the related work of a methods paper.
2. themes. The request names four method areas that no single search covers: supervised tensor methods, optimal-transport distances and templates, permutation-invariant set encoders, and the medical-imaging pipelines with registration-free fusion. Each has its own literature, venues and search vocabulary, so the search is divided into four themes. The sub-questions below are fixed once for every theme run, the merge run and the annotations:
   - SQ1: How does the method handle the missing correspondence across subjects: registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance?
   - SQ2: Is the method supervised for a subject-level outcome (classification, regression, survival), and how does the outcome enter the objective (end to end, two-stage features then predictor, or unsupervised only)?
   - SQ3: Which pipeline step does it remove or rely on: image registration, radiomics feature extraction, lesion segmentation?
   - SQ4: What data does it take (point clouds, sets of lesions or regions, graphs, aligned tensors), and has it been applied to medical imaging?

   Theme 1, Supervised multilinear and tensor methods with an unaligned mode.
   - Scope: multilinear and tensor partial least squares (N-PLS, higher-order PLS), tensor regression (generalized linear tensor regression, low-rank tensor predictors), and decompositions of tensors where one mode has no correspondence across slices (PARAFAC2, CP and Tucker with an irregular or ragged mode, coupled decompositions). Literatures: chemometrics, statistics, signal processing, neuroimaging.
   - Overlap rule: tensor methods applied to medical images belong to theme 4 and are included here only when central to this scope, flagged as an overlap.
   - Target: 20 to 30 included sources.

   Theme 2, Optimal transport distances, barycenters and dictionaries with learnable templates.
   - Scope: entropic optimal transport and Sinkhorn, unbalanced transport, Gromov-Wasserstein and fused Gromov-Wasserstein distances, Wasserstein and Gromov-Wasserstein barycenters, transport dictionary learning and template-based transport layers, and supervised learning with transport (transport kernels, transport embeddings, regression on distributions). Literatures: machine learning, applied mathematics, graph learning.
   - Overlap rule: transport-based pooling inside set encoders belongs to theme 3, and transport in medical imaging belongs to theme 4. Each is included here only when central to this scope, flagged as an overlap.
   - Target: 25 to 35 included sources.

   Theme 3, Permutation-invariant set encoders and point-cloud learning.
   - Scope: set functions and permutation-invariant architectures (Deep Sets, Janossy pooling, Set Transformer), point-cloud networks (PointNet, PointNet++, graph-based point networks), attention-based multiple-instance learning, and transport or sliced-Wasserstein pooling of sets. Literatures: machine learning, computer vision.
   - Overlap rule: transport theory belongs to theme 2, and imaging applications belong to theme 4. Each is included here only when central to this scope, flagged as an overlap.
   - Target: 20 to 30 included sources.

   Theme 4, Medical-imaging pipelines and registration-free, transport-based fusion.
   - Scope: image registration and atlases (diffeomorphic and learned registration), radiomics (feature definitions, standardization, outcome prediction), lesion segmentation (lesion and tumour segmentation networks), registration-free or transport-based fusion and comparison of subjects in medical imaging, and subject-level prediction from sets of lesions, regions or point clouds of anatomy. Literatures: medical image analysis, neuroimaging, oncology imaging.
   - Overlap rule: the general method theory belongs to themes 1 to 3. It is included here only when central to this scope, flagged as an overlap.
   - Target: 25 to 35 included sources.
3. Merge-run quality gate: the currency gate (50 percent of works from 2022 to 2026) still fails after the page's failure handling, at 45 of 129 (34.9 percent), because the 42 foundational works before 2022 that the theme briefs named are kept. Taken by the run's goal: the foundational works stay, and no weaker recent source is added to meet the gate.
4. Sources' review (literature review item 4): taken as a recorded decision under the instruction not to stop that the Notes record; the user did not answer the stop; no source added or removed.
5. chen2026brainpicm: the identifier check shows a version of record (doi 10.1007/978-3-032-38069-2_44). Taken by the run's goal: the merge search agent is resumed to record the version of record after a live lookup.

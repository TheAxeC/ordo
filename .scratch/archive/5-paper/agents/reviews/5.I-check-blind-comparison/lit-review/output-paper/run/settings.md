# settings.md

| Parameter | Value |
|---|---|
| Task | literature review |
| Arguments | topic (text, no file): "supervised prediction from data whose spatial mode is not aligned across subjects, such as point clouds or sets of regions: multilinear and tensor partial least squares and tensor regression, decompositions of tensors with an unaligned mode, optimal transport with entropic regularization, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters and dictionaries with learnable templates, registration-free transport-based fusion in medical imaging, permutation-invariant set encoders, and the image registration, radiomics and lesion segmentation pipelines such methods avoid or build on"; no main `.tex`, so no `.bib` is read or patched |
| Topic | Supervised prediction from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions): multilinear and tensor partial least squares and tensor regression, decompositions of tensors with an unaligned mode, entropically regularized optimal transport, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters and dictionaries with learnable templates, registration-free transport-based fusion in medical imaging, permutation-invariant set encoders, and the image registration, radiomics and lesion segmentation pipelines such methods avoid or build on |
| Research question | Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines? |
| Parts of the research question | P1: Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions)? Answers: multilinear or tensor partial least squares or tensor regression / tensor decomposition with an unaligned mode / transport distance or transport embedding fed to a predictor / transport barycenter or dictionary with learnable templates / permutation-invariant set encoder / other. P2: How does each method handle the missing correspondence? Answers: registration to a common space / a learned template or barycenter / a transport coupling / permutation invariance / other. P3: Where does each method remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines? Answers: removes registration / builds on registration / removes handcrafted radiomics features / builds on radiomics features / builds on lesion or region segmentation / other |
| Discipline | Machine learning, with medical image analysis as the application setting; methods admitted from any application domain |
| Language | English; English-only abstract |
| Materials in hand | None: no seed `.bib` or reference list |
| Domain evidence profile | `cs_ml` |
| DOI checking | strict |
| AI use | Research assistance: used, by this run. Drafting assistance: uncertain. Revision assistance: uncertain. Editing assistance: uncertain. Analysis assistance: uncertain. Peer review simulation: uncertain. Tools and versions: [GAP: tools and versions not known to the user]; this run's roles: `claude-opus-5-5` |
| Earlier run record | none (`run/` held no run before this one) |

## Notes

- Model of the role agents: opus, identifier `claude-opus-5-5` from the runner's model list; agent effort medium.
- Instruction not to stop, given by the user at intake: "From here on, do not stop for a choice whose recommendation you would take; take it and record it in settings.md. I refuse to interact further." Each such choice is taken with its recommendation and recorded under Decisions.
- Methods are admitted from any application domain; medical image analysis is the application setting.
- The paper type of a literature review run is Literature Review (minimum 30 sources over the merged set).

## Decisions

- Intake confirmation: the user gave the answers above and refused further interaction; the record is taken as confirmed under the instruction not to stop.
- themes (the session's division, one per research community the request reaches; the merged set is held to the Literature Review minimum of 30 at the merge run's gates). Reason: the request joins four communities with their own literatures, venues and terms: multilinear and tensor statistics, optimal transport in machine learning, set and point-cloud deep learning, and medical image analysis pipelines.
  1. Tensor and multilinear methods: multilinear and tensor partial least squares, tensor regression, tensor decompositions with a mode not aligned across subjects (such as PARAFAC2), used for subject-level prediction. Strands: P1, P2. Range: 10 to 20 sources.
  2. Optimal transport for unaligned data: entropically regularized optimal transport, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters, Gromov-Wasserstein dictionaries and learnable templates, transport-based embeddings and pooling used for prediction. Strands: P1, P2. Range: 12 to 22 sources.
  3. Permutation-invariant set encoders and point-cloud learning: set functions, attention-based set pooling, point-cloud networks and multiple-instance learning for subject-level prediction from sets. Strands: P1, P2. Range: 8 to 15 sources.
  4. Medical-imaging pipelines: image registration to a template or atlas, radiomics feature extraction, lesion segmentation, and registration-free or transport-based fusion and prediction from lesion or region sets in medical imaging. Strands: P2, P3. Range: 10 to 20 sources.
- A reference that cannot be confirmed under strict DOI checking: under the instruction not to stop, the recommended option is taken, the reference is removed from `refs.bib` and the synthesis, and the final message names it with its line.
- Theme run 2 sent back once, by the run's goal: its report left work inside its scope undone and departed from its brief. It still had to run the ACM and IEEE searches of currency pass 3, apply the end conditions again, retry reading Ma 2023, and redo with allowed means what a script one-liner of its own had produced. Theme runs 1, 3 and 4 are taken as reported; their flagged entries go to the merge run.
- Sources' review: not answered by the user. It was taken as a recorded decision under the instruction not to stop: the 122 sources of `review.md` stand as the merge run included them, with no addition or removal.
- Merge run choices, taken by the run's goal and recorded here:
  - The merge-run search agent judged each source the theme runs cut at their upper bounds on its merits (its grounds a, b and c), in place of the theme cuts.
  - Where two theme runs held one work, it copied the theme-3 entries of Karimzadeh_2026 and Thiery_2025 and the theme-4 entries of Chen_2021 and Chen_2022.
  - It replaced Charles_2017 by arxiv_1612_00593 and Ren_2023 by arxiv_2208_00993.
  - It kept the arXiv-keyed entries of Deep Sets and ABMIL.
- No `screened-<list>.txt` is written: those files cover a screened `.bib`, and this run screened none.

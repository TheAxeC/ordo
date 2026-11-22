# Run record

| Parameter | Value |
|---|---|
| Task | literature review |
| Arguments | topic (text, no path): "supervised prediction from data whose spatial mode is not aligned across subjects, such as point clouds or sets of regions: multilinear and tensor partial least squares and tensor regression, decompositions of tensors with an unaligned mode, optimal transport with entropic regularization, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters and dictionaries with learnable templates, registration-free transport-based fusion in medical imaging, permutation-invariant set encoders, and the image registration, radiomics and lesion segmentation pipelines such methods avoid or build on"; no `.tex` given |
| Topic | Supervised prediction from data whose spatial mode is not aligned across subjects, such as point clouds or sets of regions: multilinear and tensor partial least squares and tensor regression, decompositions of tensors with an unaligned mode, optimal transport with entropic regularization, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters and dictionaries with learnable templates, registration-free transport-based fusion in medical imaging, permutation-invariant set encoders, and the image registration, radiomics and lesion segmentation pipelines such methods avoid or build on |
| Research question | Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines? |
| Discipline | Machine learning, with medical image analysis as the application setting; methods admitted from any application domain |
| Language | English; English-only abstract |
| Materials in hand | None; no seed `.bib` or reference list |
| Domain evidence profile | cs_ml |
| DOI checking | Strict |
| AI use | Research assistance: used, by this run. Drafting, revision, editing and analysis assistance, and peer review simulation: uncertain. Tools and versions: not known |
| Earlier run record | None (no `run/` folder existed before this run) |

## Notes

- Model of the role agents: opus, identifier `claude-opus-5-5` from the runner's model list; agent effort medium.
- The user instructed: "From here on, do not stop for a choice whose recommendation you would take; take it and record it in settings.md. I refuse to interact further."
- Prose standard: `repo-setup/templates/docs/dev/prose-standard.md` (the repository has no `docs/dev/prose-standard.md`).

## Decisions

- Intake confirmation: the user stated they will not interact further, so the record above, which holds only the user's answers and the topic of the call, is taken as confirmed. Reason: the run's goal, and the user's instruction not to stop.
- The sources' review: taken as "go on" with the 87 sources of `review.md` as screened, no source added or removed. Reason: the user's instruction not to stop and not to interact further; every entry prints CONFIRMED on `the lookup script resolve --entry` (re-run by the session on all 87 keys).
- The search agent served `claude-opus-5-5`, the configured identifier.

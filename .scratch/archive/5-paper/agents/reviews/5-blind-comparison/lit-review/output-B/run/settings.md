# settings.md

| Parameter | Value |
|---|---|
| Mode | lit-review |
| Arguments | topic (text): "supervised prediction from data whose spatial mode is not aligned across subjects, such as point clouds or sets of regions: multilinear and tensor partial least squares and tensor regression, decompositions of tensors with an unaligned mode, optimal transport with entropic regularization, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters and dictionaries with learnable templates, registration-free transport-based fusion in medical imaging, permutation-invariant set encoders, and the image registration, radiomics and lesion segmentation pipelines such methods avoid or build on"; no main .tex |
| Topic | Supervised prediction from data whose spatial mode is not aligned across subjects, such as point clouds or sets of regions: multilinear and tensor partial least squares and tensor regression, decompositions of tensors with an unaligned mode, optimal transport with entropic regularization, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters and dictionaries with learnable templates, registration-free transport-based fusion in medical imaging, permutation-invariant set encoders, and the image registration, radiomics and lesion segmentation pipelines such methods avoid or build on. |
| Research question | Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines? |
| Paper type | Literature Review (fixed by lit-review mode) |
| Discipline | Machine learning, with medical image analysis as the application setting; methods admitted from any application domain. |
| Language | English; English-only abstract. |
| Materials in hand | None; no seed .bib or reference list. |
| Domain evidence profile | cs_ml |
| DOI checking | strict |
| AI use | Research assistance: used, by this run (a search agent on claude-opus-5-5 at effort high). Drafting assistance: uncertain. Revision assistance: uncertain. Editing assistance: uncertain. Analysis assistance: uncertain. Peer review simulation: uncertain. Other tools and versions: not known. |
| Earlier run record | none (no run/ folder existed before this run) |

## Notes

- Model identifier of the reviewer alias claude:opus, from the runner's model list: claude-opus-5-5. Agent effort: high.
- Prose standard: the default prose standard.
- The user asked that from here on the run take the recommended option at every choice, the run's stops included, and record it here rather than stop: "From here on, do not stop for a choice whose recommendation you would take; take it and record it in settings.md. I refuse to interact further."

## Decisions

- Intake confirmation: the user's answers to all nine questions are the record above; under the user's instruction in the Notes the record is taken as confirmed without a further stop.
- The sources' review (lit-review item 2): taken as "go on" under the user's instruction in the Notes. The search agent's review.md includes 84 sources with 84 refs.bib entries; no source was added or removed. Reason: the two relevant works the search agent could not read (Ceyssens and Faes 2026, 10.2139/ssrn.7083858; Zhao et al. 2026, 10.1016/j.inffus.2026.104509) can be added only from a text the user supplies, and the user declined further interaction.
- Lit-review item 3: no .tex was given, so no patch is applied and the reference checks of Steps 11 do not run; DOI checking "strict" therefore has no check to apply in this run.

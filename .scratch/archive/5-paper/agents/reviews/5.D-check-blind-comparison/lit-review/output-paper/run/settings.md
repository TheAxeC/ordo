# Run record

| Parameter | Value |
|---|---|
| Task | literature review |
| Arguments | topic (text): "supervised prediction from data whose spatial mode is not aligned across subjects, such as point clouds or sets of regions: multilinear and tensor partial least squares and tensor regression, decompositions of tensors with an unaligned mode, optimal transport with entropic regularization, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters and dictionaries with learnable templates, registration-free transport-based fusion in medical imaging, permutation-invariant set encoders, and the image registration, radiomics and lesion segmentation pipelines such methods avoid or build on"; no main .tex, so no .bib is read or patched |
| Topic | Supervised prediction from data whose spatial mode is not aligned across subjects (point clouds, sets of regions): multilinear and tensor PLS and tensor regression; decompositions of tensors with an unaligned mode; entropic optimal transport; Gromov-Wasserstein and fused Gromov-Wasserstein distances; transport barycenters and dictionaries with learnable templates; registration-free transport-based fusion in medical imaging; permutation-invariant set encoders; and the registration, radiomics and lesion segmentation pipelines such methods avoid or build on |
| Research question | Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines? |
| Discipline | Machine learning, with medical image analysis as the application setting; methods admitted from any application domain |
| Language | English; English-only abstract |
| Materials in hand | None; no seed .bib or reference list |
| Domain evidence profile | `cs_ml` |
| DOI checking | strict |
| AI use | Research assistance: used, by this run. Drafting assistance, revision assistance, editing assistance, analysis assistance, peer review simulation: uncertain. Tools and versions: not known (user's answer) |
| Earlier run record | none (`run/` held no earlier run) |

## Notes

- Model of the role agents: opus, identifier `claude-opus-5-5` from the runner's model list; agent effort medium.
- Instruction not to stop (user, at intake, verbatim): "From here on, do not stop for a choice whose recommendation you would take; take it and record it in settings.md. I refuse to interact further."

## Decisions

- Intake confirmation: the user gave the answers to questions 1 to 7 with the instruction above; the record holding them is taken as confirmed.
- The search agent (served claude-opus-5-5, the configured opus identifier) ended with review.md and refs.bib (104 entries). The stop "The sources' review" is raised: its instructions keep every stop under an instruction not to stop, except "A research question the materials do not answer", so the user's instruction does not remove this stop.
- The sources' review (user, verbatim): "Go on: no sources to add or remove. Finish the run."
- Item 3 (apply the .bib patch and run the reference checks) is skipped: no main .tex was given, so the run has no manuscript .bib to patch or check.

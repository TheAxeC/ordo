# Run configuration

| Parameter | Value |
|---|---|
| Task | literature review |
| Arguments | topic (text): "supervised prediction from data whose spatial mode is not aligned across subjects, such as point clouds or sets of regions: multilinear and tensor partial least squares and tensor regression, decompositions of tensors with an unaligned mode, optimal transport with entropic regularization, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters and dictionaries with learnable templates, registration-free transport-based fusion in medical imaging, permutation-invariant set encoders, and the image registration, radiomics and lesion segmentation pipelines such methods avoid or build on"; no `.tex` given |
| Topic | Supervised prediction from data whose spatial mode is not aligned across subjects (point clouds, sets of regions), across tensor partial least squares and tensor regression, tensor decompositions with an unaligned mode, entropic optimal transport, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters and template dictionaries, registration-free transport-based fusion in medical imaging, permutation-invariant set encoders, and the registration, radiomics and lesion segmentation pipelines these methods avoid or build on. |
| Research question | Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines? |
| Discipline | Machine learning, with medical image analysis as the application setting; methods admitted from any application domain. |
| Language | English; English-only abstract. |
| Materials in hand | None; no seed `.bib` or reference list. |
| Domain evidence profile | `cs_ml` |
| DOI checking | strict |
| AI use | Research assistance: used, by this run (this literature review). Drafting assistance: uncertain. Revision assistance: uncertain. Editing assistance: uncertain. Analysis assistance: uncertain. Peer review simulation: uncertain. Tools and versions: [GAP: tools and versions not known]. |
| Earlier run record | none (no `run/` folder stood before this run) |

## Notes

- Model of the role agents: opus, identifier `claude-opus-5-5` from the runner's model list; agent effort medium.
- The user's instruction, given at intake: "From here on, do not stop for a choice whose recommendation you would take; take it and record it in settings.md. I refuse to interact further."

## Decisions

- Intake record confirmed by the user's answers of 2026-11-16, with the instruction not to stop recorded in the Notes.
- themes (session's division, one per research community the request reaches; written before the first start of the search agent):
  1. Tensor regression and multilinear PLS. Strands: multilinear and tensor partial least squares, tensor regression, decompositions of tensors with an unaligned mode (such as PARAFAC2 and related coupled or irregular-mode models). Range: 20 to 35 sources.
  2. Optimal transport for structured data. Strands: entropic optimal transport, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters, dictionaries and learnable templates, transport-based supervised learning on graphs and point clouds. Range: 25 to 40 sources.
  3. Permutation-invariant set encoders. Strands: set and point-cloud encoders (sum or attention pooling, set transformers, transport-based pooling), their use on unaligned medical data. Range: 12 to 25 sources.
  4. Medical image pipelines. Strands: image registration (atlas and deformable), radiomics feature pipelines, lesion segmentation, and registration-free or transport-based fusion in medical imaging. Range: 20 to 35 sources.
  - Reason: the request spans four fields with their own venues and terms (statistics and chemometrics for tensor models; ML and applied mathematics for transport; ML for set encoders; medical image analysis for the pipelines), so one search would under-cover the smaller communities.
- Theme run 1 wrote `theme-report-1.md` and `theme-refs-1.bib` to a mistyped folder (the run folder's path with its slashes written as hyphens). The session copied both into the run folder with `cp -n`, checked each with `cmp`, and removed the stray copies. The report's line that `settings.md` was gone came from that folder; `settings.md` stands in the run folder.
- The sources' review (literature review item 2): taken as "go on" with the 225 sources of `review.md` unchanged, under the user's instruction in the Notes not to stop for a choice whose recommendation the run would take and not to interact further. Reason: going on with the screened set is the step's default, and no addition or removal was given.
- Choices the merge run took and recorded in `review.md` for the user's review: Dutta 2026 excluded as a possibly predatory venue; `arxiv_2312_06467` kept as a preprint because `bibtex --page` refused the TMLR 2025 page at a title ratio of 0.42; the method-paper concentration of the distribution advisory (167 of 225) left as it stands because the question asks which methods exist.

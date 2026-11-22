# Run record

| Parameter | Value |
|---|---|
| Task | literature review |
| Arguments | topic (text, no path): "supervised prediction from data whose spatial mode is not aligned across subjects, such as point clouds or sets of regions: multilinear and tensor partial least squares and tensor regression, decompositions of tensors with an unaligned mode, optimal transport with entropic regularization, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters and dictionaries with learnable templates, registration-free transport-based fusion in medical imaging, permutation-invariant set encoders, and the image registration, radiomics and lesion segmentation pipelines such methods avoid or build on"; no `.tex`, so no `.bib` is read or patched |
| Topic | Supervised prediction from data whose spatial mode is not aligned across subjects, such as point clouds or sets of regions: multilinear and tensor partial least squares and tensor regression, decompositions of tensors with an unaligned mode, optimal transport with entropic regularization, Gromov-Wasserstein and fused Gromov-Wasserstein distances, transport barycenters and dictionaries with learnable templates, registration-free transport-based fusion in medical imaging, permutation-invariant set encoders, and the image registration, radiomics and lesion segmentation pipelines such methods avoid or build on. |
| Research question | Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines? |
| Discipline | Machine learning, with medical image analysis as the application setting; methods admitted from any application domain. |
| Language | English; English-only abstract. |
| Materials in hand | None; no seed `.bib` or reference list. |
| Domain evidence profile | `cs_ml` |
| DOI checking | Strict |
| AI use | Research assistance: used, by this run. Drafting assistance, revision assistance, editing assistance, analysis assistance, peer review simulation: uncertain. Tools and versions of other uses: [GAP: tools and versions not known]. |
| Earlier run record | None; no `run/` folder stood before this run. |

## Notes

- The user's instruction, given at intake: "From here on, do not stop for a choice whose recommendation you would take; take it and record it in settings.md. I refuse to interact further."
- Model of the role agents: opus, identifier `claude-opus-5-5` from the runner's model list; agent effort medium.

## Decisions

- Intake confirmation: taken under the user's instruction in the Notes. The record above holds the user's answers verbatim; the Topic row is the call's topic, which the user did not change. Recommendation taken: confirm the record.
- The sources' review: taken under the user's instruction in the Notes. Recommendation taken: keep the 66 sources and resume the search agent with one change, the correction of entry Charles_2017, whose author field from Crossref reads "Charles, R. Qi and Su, Hao and Kaichun, Mo and Guibas, Leonidas J." in place of Charles R. Qi, Hao Su, Kaichun Mo and Leonidas J. Guibas, and the page ranges of refs.bib written with an ASCII range in place of the en dash Crossref prints, accented letters in names kept. Reason: both are defects in delivered entries; the hub's prose rules ban the en dash in an authored .bib outside manuscript/.
- Currency gate: not met at 24 of 66 sources (36 percent) from 2021 to 2026 after the gate's searches ran once, as the search agent's instructions allow; the review goes on and the gate is named as not met.
- The search agent's recommendation after the first correction: make the 8 remaining non-name non-ASCII lines of refs.bib ASCII (Kiers_1999, Perros_2017, Peyr__2019, M_moli_2011, Prabhakar_2023, Ronneberger_2015, Lo_2025, Qian_2024). Taken under the user's instruction in the Notes. Reason: the hub's prose rules ban those characters in an authored .bib outside manuscript/; accented letters in names stay.
- Unescaped ampersands in refs.bib: Perros_2017's title holds the HTML entity `&amp;` and the publisher field of Kolda_2009, Benamou_2015, Agueh_2011 and Schmitz_2018 holds a bare `&`; both break a LaTeX build. Recommendation taken under the user's instruction in the Notes: write `\&` in all five and resolve the five entries again.

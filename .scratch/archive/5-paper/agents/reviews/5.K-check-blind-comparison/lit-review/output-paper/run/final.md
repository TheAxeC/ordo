# Final message: literature review run of 2026-11-19

The literature review is done. `review.md` covers 159 sources and `refs.bib` holds one entry for each of them. Under strict DOI checking, every entry passed an identifier check. No stop was raised: under your instruction not to stop, the intake confirmation and the sources' review were taken as recorded decisions in `settings.md`. No `.tex` was given, so no manuscript `.bib` was patched.

## What the run did

- **Theme runs.** Four search agents ran at once, one for each theme recorded in `settings.md` under "Decisions":
  - theme 1, tensor and multilinear regression with an unaligned mode: 23 sources;
  - theme 2, optimal transport: 30 sources;
  - theme 3, permutation-invariant set encoders: 25 sources;
  - theme 4, medical-imaging pipelines and prediction without registration: 30 sources.
- **Identifier check.** `the lookup script resolve` ran once on each of the 108 theme entries, on the DOI where an entry has one and on the arXiv ID otherwise. Every run exited 0 and printed a record from at least one index, so no identifier fails (`checks.md`, 108 runs).
- **Merge run.** One search agent merged the four themes.
  - It folded the duplicates across themes, for example `gutierrezbecker2018deep`, `thual2022aligning` and `naderializadeh2021set`, leaving 105 works.
  - It settled 15 titles that the indexes print differently. Each decision is in a table in `review.md`.
  - It added 53 sources from 2022 or later, because the currency gate failed at 27/106 (25.5%) and the gate's failure handling calls for a search of recent work. It also added Peyre, Cuturi and Solomon 2016 (ICML), which has no DOI or arXiv ID, under the proceedings-page rule recorded in `settings.md`.
  - With these additions the merge run reports every quality gate as passed. Currency passes at 80/159 (50.3%) from 2022 or later. The gate results are the merge run's own computation and were not recomputed by the session.
- **Check of the merged entries.** The session also ran the identifier check on the 54 added entries and the 2 entries whose identifier changed. 55 were checked with `resolve` and all exited 0 with a record. The `url` of `peyre2016gromov` was read on its PMLR page, which shows the entry's title. With these 56, all 159 entries of `refs.bib` have a passing check (`checks.md`).
- **Checks of the merged files.** `grep -c '^@' refs.bib` gives 159, all keys are unique, and `LC_ALL=C grep -c '[^ -~]' refs.bib` gives 0. A key-by-key comparison found every `refs.bib` key cited in `review.md`.

## What the review finds

`review.md` "Synthesis Analysis" sorts the methods by what each subject is compared with:

- **A common space.** Registration followed by tensor regression or multilinear PLS keeps the registration step. In PARAFAC2 the mode left unaligned is time, never space.
- **A learned template or barycenter.** Gromov-Wasserstein barycenters, transport dictionaries, the template-based FGW network and linear transport embeddings use a template in place of the group template of registration. In imaging they build on segmentation.
- **Another subject.** Pairwise entropic, unbalanced or fused GW couplings replace deformable registration where they are used to align subjects. They build on an affine registration or a segmentation.
- **Nothing outside the subject.** Permutation-invariant encoders (Deep Sets, PointNet, attention MIL, kernel mean embeddings) need no registration. In medical imaging, every lesion-set predictor found still takes segmented lesions as its input, and most keep radiomic features.

The review lists five open gaps:

1. No method found predicts a subject-level outcome from learned-template FGW couplings over per-patient lesion sets.
2. No source compares the four correspondence routes on one cohort and one outcome.
3. No tensor model found leaves the spatial mode unaligned, with each subject contributing its own number of lesions or regions.
4. No lesion-set predictor found works without an upstream lesion segmentation.
5. No learning guarantees were found for template-FGW predictors or for attention pooling at the cohort sizes of lesion studies (83 to 831 patients in the sources found).

## Issues that go to you

- **Databases.** IEEE Xplore, ACM DL and Scopus were not searched in any theme. The searches ran on web search, Crossref, arXiv, OpenAlex, Semantic Scholar and the proceedings pages.
  - Semantic Scholar answered HTTP 429 (rate limit) during themes 2, 3 and 4, so forward tracking is incomplete there.
  - Theme 4 was refused permission for the PubMed connector, so clinical work indexed only in PubMed may be missing from that theme.
  - No theme closed the citation loop (stopping condition 4), so each stopped on the other four conditions.
- **Discipline warning.** `review.md` carries the warning `[PROFILE-DISCIPLINE-MISMATCH]`. The Discipline row says "Machine learning" and does not name CS, Engineering or Technology. Admission still used `cs_ml`, and nothing was blocked.
- **Sources resting on arXiv comments only.** The ICLR 2026 acceptance of Nikolentzos and Skianis 2025 and the MICCAI 2025 acceptance of OTSurv (Ren et al. 2025) rest on their arXiv comments. The ICLR 2019 venue of Janossy pooling rests on its arXiv page, because OpenReview returned a browser check.
- **Excluded seminal works.** Harshman 1972, the origin of PARAFAC2, was excluded by the screening rule on age and citations. Smilde 1997 and Bro, Smilde and de Jong 2001 were excluded because they could not be confirmed. A text that needs the origin of PARAFAC2 has to add it by hand.
- **Shortened author list.** The `refs.bib` entry from Zwanenburg et al. 2020 (IBSI) lists the first 10 of its 63 Crossref authors, followed by "and others".
- **Annotations from abstracts.** The annotations of theme 2 rest on abstracts and landing pages; no full text was read for them.
- **Error in the theme 2 file.** The screening line of `theme-report-2.md` says "3 overlaps" where the theme has 4. `review.md` is the merged report.
- **Files outside the run folder.** The merge run wrote generator files outside the run folder, in `scratchpad/merge-gen/` (`gen.py`, `data.py`, `front.md`, `back.md`, `new_annotations.md`). The run's records do not depend on them. They are left in place for you to delete.

## The run folder

`run/` holds:

- `settings.md`: the intake record, the Notes and the Decisions;
- `theme-report-1.md` to `theme-report-4.md` and `theme-refs-1.bib` to `theme-refs-4.bib`: the outputs of the four theme runs;
- `checks.md`: 164 identifier checks with their commands, outputs and exit status;
- `review.md`: the merged literature search report with the Synthesis Analysis;
- `refs.bib`: 159 entries;
- `final.md`: this message.

The run made no temporary folder and no compile folder. The roles ran as `an agent at medium effort` on opus. The runner did not report which model each agent was served.

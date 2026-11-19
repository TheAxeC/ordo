# Final message: this literature review, 2026-11-19

The literature review is finished: `review.md` and `refs.bib` cover 129 included works, every identifier passed the identifier check, and no stop is left open. Five things are not as you would want them, and each is listed first below.

## Not done, or short

- **Currency gate fails.** 45 of 129 works (34.9 percent) are from 2022 to 2026, against the page's target of 50 percent. The merge run's own currency search (11 arXiv and 3 WebSearch queries) added five recent works and found no further in-scope ones. The shortfall comes from the 42 foundational works before 2022 that the theme briefs named and that the merge keeps; without them the share is 45 of 87 (51.7 percent). Recorded in `settings.md`, Decisions item 3.
- **Databases not reached.** IEEE Xplore (HTTP 418), ACM DL and Scopus (HTTP 403) and Google Scholar (verification page) could not be searched by any theme run. Semantic Scholar refused most queries with HTTP 429. The PubMed connector was denied permission, and theme 4 searched PubMed through its public search page. Crossref, OpenAlex, the arXiv API and WebSearch stand in for them, as `review.md` "Databases and access, by theme run" records.
- **Citation loop not closed** in any of the four theme runs (stopping condition 4); the other stopping conditions are met in each.
- **Leads not assessed.** Nineteen works named (6 from theme 1, 6 from theme 2, 3 from theme 3, 4 from theme 4) by the theme runs were not read or could not be confirmed, so they are not in the merged set. `review.md` "Leads not assessed" lists each with its DOI where known, among them Rakotomamonjy et al. 2018, Bonneel, Peyre and Cuturi 2016, Kwon et al. 2025, OTSurv (arXiv 2506.20741) and "Vulnerabilities of radiomic signature development" (doi:10.1016/j.radonc.2018.10.027).
- **Abstract-only readings.** Theme 3 reports that about half of its annotations rest on the abstract; the WDDL annotation (Zhang et al. 2024) rests on its abstract alone. Each annotation states what was read.

## What the review finds (from `review.md`, "Synthesis Analysis" and "Identified Gaps")

The five gaps, each with the searches that support it:

1. No work learns a transport template or barycenter jointly with a subject-level outcome on medical data. Templates trained on a label exist for graphs, sequences and molecules; in medical imaging transport templates are learned by reconstruction and used in two stages, or are fixed.
2. No supervised multilinear method has a spatial set as its unaligned mode. Supervised PARAFAC2 models keep a shared cross-product on a time mode.
3. No coupling between different patients' lesion sets is used for outcome prediction, and no medical method passes the coupling itself into the predictor.
4. No study compares a registration-free set model with a registration-based pipeline on the same subjects and outcome, apart from one registered-teacher and unregistered-student comparison on CTA images.
5. Every included outcome model on lesion sets, organ sets or anatomical point clouds relies on a segmentation step, and four rely on radiomics features.

The synthesis also qualifies each "registration-free" claim: several methods register rigidly to MNI152, use a tract atlas, FreeSurfer labelling or atlas parcellations.

## Checks

- Identifier check (literature review item 2), in `checks.md`: `python3 lookup resolve '<identifier>'` on each of the 126 theme entries with a DOI or arXiv ID; every run exited 0 and printed at least one index record, and no identifier provably fails. The 4 entries with only a url (`peyre2016gromov`, `rolet2016fast`, `huang2016supervised`, `naderializadeh2021pswe`) were checked on their official proceedings pages, each of which names the entry's title.
- The merge run's 5 added sources and 3 changed identifiers were resolved the same way; all print a matching record. `chen2026brainpicm` was then recorded as its version of record (MICCAI 2026, LNCS 16880, pages 461--471, doi 10.1007/978-3-032-38069-2_44), and that DOI resolves (literature review item 5).
- No entry was left unchecked, and under strict no entry fails.
- `grep -c '^@' refs.bib` prints 129, of which 9 are `@misc` arXiv preprints. `LC_ALL=C grep -c '[^ -~]'` prints 0 for `refs.bib` and `review.md`.

## Decisions taken under your instruction not to stop (`settings.md`, Decisions)

- Paper type IMRaD, which your reply did not give (item 1).
- Four themes with targets and sub-questions SQ1 to SQ4 (item 2).
- The currency gate left failing rather than dropping foundational works or adding weaker recent ones (item 3).
- The sources' review taken as a recorded decision, with no source added or removed (item 4).
- `chen2026brainpicm` updated to its version of record (item 5).

## Flags the reports return to you

- Themes 1, 2 and 4 and the merge run write `[PROFILE-DISCIPLINE-MISMATCH]`: the Discipline row "Machine learning" is none of the names the `cs_ml` profile lists. It is a warning only; screening ran under `cs_ml` as you chose.
- Theme 2: no "linear optimal transport" paper with Kolouri as first author was found; the brief's foundational item was resolved to WEGL (Kolouri et al., ICLR 2021), Wang et al. 2013 and Moosmuller and Cloninger 2023.
- Theme 4: Dong et al. 2024 states its AUCs only in the full text (0.8785 registered teacher, 0.8098 unregistered student, 0.632 plain supervised on unregistered images).

## Run details

- Roles ran at effort `medium` on opus (`claude-opus-5-5`). The runner's launch record names no served model, so no other served identifier is recorded.
- No `.tex` was given, so no manuscript `.bib` was patched; `refs.bib` stands in the run folder for a later full-manuscript run to take.
- No temporary folder and no `compile*` folder was made.

## Files in `run/`

- `settings.md`: the intake record, Notes and Decisions.
- `theme-report-1.md` to `theme-report-4.md`, `theme-refs-1.bib` to `theme-refs-4.bib`: the four theme runs.
- `checks.md`: every identifier-check run with its command, output and exit status.
- `review.md`: the merged Literature Search Report with the Synthesis Analysis.
- `refs.bib`: 129 entries.
- `final.md`: this message.

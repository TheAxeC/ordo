# Literature review run: final message

The literature review is done. It holds 122 sources and passes every gate except currency: 57 of the 122 sources (46.7 percent) date from 2022 to 2026, against a threshold of 50 percent. One extra search over 2024 to 2026 added no eligible source. The share stays low because the set keeps the founding works of three fields:

- multiple-instance learning (1997)
- PARAFAC2 (1999)
- transport distances (2000)

The session ran `resolve --entry` itself on all 122 entries of `refs.bib`, and all 122 printed CONFIRMED (`checks.md`). No entry was taken out. All 88 keys the synthesis cites are in `refs.bib`; the check compares the `[@key]` citations of `review.md` with the keys of `refs.bib`.

## Run folder

`run/` holds:

- `settings.md`: the record of the run, with your answers, the instruction not to stop and every decision taken under it.
- `review.md`: the review. Its sections are the search strategy, distribution advisory, screening results, 122 annotations, the matrix, the gaps, a synthesis by part (P1 to P3), recommended sources, the entries not written, the limitations and gate results, and the AI disclosure.
- `refs.bib`: 122 entries, each confirmed.
- `search-log.md`: the merge run's log. It names the four theme logs, which stay in the folder.
- `search-log-theme-1.md` to `search-log-theme-4.md`
- `theme-report-1.md` to `theme-report-4.md`
- `theme-refs-1.bib` to `theme-refs-4.bib`
- `checks.md`: each of the 122 `resolve --entry` runs, with its command, output and exit status.
- `final.md`: this message.

No `.tex` was given, so no manuscript `.bib` was changed and no reference checks were run on a manuscript. The temporary folder is removed. The run made no compile folder.

## How the run went

- **themes.** The search ran as four themes, then a merge:
  - tensor and multilinear methods (20 sources);
  - optimal transport (22);
  - set encoders and point clouds (20);
  - medical-imaging pipelines (20).

  The merge removed duplicates and judged on its merits each source a theme had cut at its upper bound. It then ran citation chaining, pair searches across themes and gap chaining, which brought the set to 122.
- **Theme 2 sent back.** It was sent back once to run the ACM and IEEE searches of a currency pass. It had also run a one-off script of its own, which its rules forbid, so it redid that work with the allowed tools. It added no source, and the values the script had printed were confirmed.
- **Your sources' review.** Under your instruction not to stop, the sources' review was taken as a recorded decision: the 122 sources stand as the merge included them. That decision and the merge's own choices are in `settings.md` under Decisions.
- **Gaps found.** The review finds three:
  - **MG1:** no method couples the lesion sets of different patients through transport, or a learned template, to predict an outcome.
  - **MG2:** no study compares registration-based and registration-free methods on the same cohort and outcome.
  - **MG3:** no tensor regression or tensor PLS treats a spatially unaligned set of lesions or points as a mode.

## Issues for you

- **Currency gate not met:** 57 of 122 sources (46.7 percent) date from 2022 to 2026.
- **Entries with defects.** These are left as the indexes print them, because the rules allow no hand edit of a field:
  - `Liu_2023a`: its author field ends in an empty name (`Kundu, Suprateek and }`).
  - `Yin_2020`, `Jurenaite_2024`, `Karimzadeh_2026`, `Perros_2017` and `Thi_ry_2023`: each holds `&amp;` in a title, booktitle or journal field.
  - `Naderializadeh_2021`, `Gaertner_2002` and `Ren_2025b`: each lists "and others" in place of authors the record does not name.
- **Preprints.** Five entries stand as preprints because no published version was confirmed: `arxiv_2006_09430`, `arxiv_1807_00094`, `arxiv_2603_06465`, `arxiv_2502_04907` and `arxiv_1910_10825`.
- **Deep Sets and ABMIL.** `arxiv_1703_06114` and `arxiv_1802_04712` keep their arXiv-keyed entries, confirmed against OpenAlex. Their NeurIPS and ICML proceedings pages are recorded in their annotations.
- **Assessed from the abstract only.** No full text could be reached for 27 sources, so their fields rest on the abstract. They are listed in section 10 of `review.md`:
  - `Zwanenburg_2020`, `Geady_2025`, `van_Griethuysen_2017`, `Salim_2026`, `Zhu_2021`, `Zhang_2025`, `Konyar_2025`
  - `Zhang_2021`, `M_moli_2011`, `Xu_2023b`, `Qian_2024`, `Zhang_2024`, `Papastergiou_2018`, `Papastergiou_2019`
  - `Rubner_2000`, `Belkhatir_2022`, `Zhu_2026`, `Quellec_2017`, `Gaertner_2002`, `Chikontwe_2020`, `Feng_2017`
  - `Lysukhin_2025`, `Zhang_2020`, `Zhu_2022`, `Xu_2024`, `Diao_2024`, `Zhao_2022`
- **Not read by any way tried.** These have no entry:
  - Amores 2013 (Artificial Intelligence), a review of multiple-instance classification that the search counts as must-include and seminal;
  - Zhao et al. 2026 (Information Fusion);
  - Ma et al. 2023 (Pattern Recognition);
  - Abramova 2026;
  - Phan 2026.
- **Databases not reached.** Scopus returned only 2 pages to the merge searches. Google Scholar, Scopus "Cited by" and Connected Papers were not reached. Semantic Scholar refused part of the lookups because of its rate limit.
- **Excluded by the merge.** Three works were judged out on their merits and have no entry:
  - `Xie_2025`, a survey, on relevance 2;
  - arXiv 2405.16519, a Fourier sliced-Wasserstein embedding, on relevance 2;
  - arXiv 2203.04964, injective multiple-instance pooling, an unpublished preprint with a total of 10.
- **Replaced entries.** `Charles_2017` (PointNet, author names swapped) is replaced by `arxiv_1612_00593`, and `Ren_2023` (MULTIPAR, truncated authors) by `arxiv_2208_00993`.
- **AI use.** Research assistance is marked used by this run. The other categories stay "uncertain", and the tools and versions you use are a gap you fill in. The review's own AI disclosure names `claude-opus-5-5`.
- **Unused entries.** No `unused:` lines apply, since no manuscript cites these entries yet.

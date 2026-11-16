# Final message: literature review run of 2026-11-16

The run is finished: `review.md` holds the review with its 11 sections and `refs.bib` holds 225 entries. No manuscript was given, so no `.bib` was patched and no reference checks or compile ran.

## Not done, or left for the user

- Search end condition 4 (the citation loop closes) did not hold: Harshman 1972, "PARAFAC2: Mathematical and technical notes", has no record in any index and has no entry (section 9 of `review.md`).
- The sources' review was not shown for additions or removals. Under the instruction in the Notes not to stop and not to interact, the run went on with the 225 sources unchanged; the choice is recorded in `settings.md` under Decisions.
- Choices the merge run took, for the user's review: Dutta 2026 excluded as a possibly predatory venue; `arxiv_2312_06467` (Thual et al.) kept as a preprint because the TMLR 2025 version's page was refused at a title ratio of 0.42; 167 of 225 sources are method papers, which triggers the distribution advisory, and the search was not widened.
- `Villani_2009` and `Galloway_1975` are included without their abstract read (each is cited by 3 or more core papers); their Method and Key results fields are GAP. Key results are also GAP for Bi 2021, Nikolentzos 2017, Sidiropoulos 2000, Barbe 2021, Shi 2021, Han 2025 and Barbarant 2026.
- 7 sources remain preprints (6 arXiv, `Barbarant_2026a` on bioRxiv); `Harshman_1970` is a working paper. The published version of `arxiv_2506_20065` was not checked in Semantic Scholar (HTTP 429).
- Databases not reached: IEEE Xplore, ACM DL and Scopus (the web search ignored the site limit); Semantic Scholar refused several calls.
- `Faes_2024` (BTTR, IEEE TNNLS) is the user's own earlier paper, kept on merit and marked so in its annotation.
- AI use: the tools-and-versions field of `settings.md` is a GAP. The review's disclosure line names research assistance only, because drafting assistance is marked uncertain; this run also wrote the synthesis of section 7.
- Entries taken out of `refs.bib` or a `theme-refs-<k>.bib` as not confirmed: none.

## Files in the run folder

`settings.md`, `theme-report-1.md` to `theme-report-4.md`, `theme-refs-1.bib` to `theme-refs-4.bib`, `review.md`, `refs.bib`, `final.md`.

The temporary folder is removed, and the run folder holds no compile folder.

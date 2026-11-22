# Final message, 2026-11-16

Every item of the review ran. Two gates of the review are not met: the currency gate (24 of 66 sources, 36 percent, from 2021 to 2026, against 50 percent, after its gate search ran once) and full-text reading (24 included sources judged from the abstract alone, two seminal works, M_moli_2011 and AVANTS_2008, with no abstract read). Three candidates were excluded because they could not be read, among them Zhao et al. 2026 (10.1016/j.inffus.2026.104509), which predicts surgical outcome from point-cloud features and radiomics and bears directly on the research question.

## Run folder

`run/` holds:

- `settings.md`: the intake record, the Notes with the instruction not to stop, and the Decisions taken under it (the intake confirmation, the sources' review, three corrections to refs.bib, the currency gate).
- `review.md`: the literature review (search strategy, passes, screening, annotated bibliography of 66 sources in five themes, literature matrix, five identified gaps, synthesis, recommended sources by paper section, search limitations and gate failures, AI disclosure).
- `refs.bib`: 66 entries.
- `final.md`: this message.

## Checks

- Every entry resolves: `the lookup script resolve --entry 'refs.bib' <key>` over all 66 keys printed CONFIRMED 66 times and no other last line.
- The keys cited in `review.md` and the keys of `refs.bib` are the same 66, by `comm` of the two sorted lists, empty both ways.
- No unescaped ampersand remains in `refs.bib`: `grep -n -o '[a-zA-Z]*={[^}]*[^\\]&[^}]*}' refs.bib` exits 1.
- `review.md` holds no non-ASCII character (`LC_ALL=C grep -c '[^ -~]'` prints 0). `refs.bib` holds no en or em dash (`grep -c` prints 0); its 26 non-ASCII lines hold accented letters in names, by the search agent's character tally.
- No `.tex` was given, so no manuscript `.bib` was patched and `cite-keys` and `check-urls` did not run; `checks.md` was not written.

## Corrections made to refs.bib at the sources' review

- Charles_2017 (PointNet): the author field, which Crossref prints as "Charles, R. Qi and Su, Hao and Kaichun, Mo and Guibas, Leonidas J.", now reads "Qi, Charles R. and Su, Hao and Mo, Kaichun and Guibas, Leonidas J.".
- The 37 page ranges use `--`; the dashes, curly apostrophes, non-breaking spaces and the registered sign of 8 entries are ASCII or LaTeX.
- The HTML entity in Perros_2017's title and the bare `&` of four SIAM publisher fields are written `\&`.

## Issues for the user

- AI use: the row marks drafting assistance as uncertain, but the search agent wrote the synthesis of `review.md`. The mark is the user's to set.
- Semantic Scholar returned HTTP 429 or "not found" on many strings, so its coverage of the search is thinner than that of Crossref, OpenAlex and arXiv.
- Records excluded at the title stage were not counted one by one.
- About 85 percent of the sources are computational method papers (the distribution advisory of `review.md`).
- No entry was taken out of `refs.bib` for a failed lookup.

The temporary folder of fetched texts is removed, and the run folder holds no compile folder.

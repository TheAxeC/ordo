# Final message, 2026-11-16

The run is finished. There is no manuscript in this run, so nothing was patched and no reference checks ran.

## Run folder

`run/`, holding:

- `settings.md`: the run record. It has your intake answers, your instruction not to stop, and the decisions, including your answer "Go on" at the sources' review.
- `review.md`: the literature review. It covers the search record and the passes, an annotated bibliography in five themes, a literature matrix, the gaps, a synthesis, recommended sources by paper section, the search limitations, and the AI disclosure.
- `refs.bib`: 104 entries. All 104 were confirmed against the literature indexes, and the review cites every one of them.
- `final.md`: this message.

The temporary folder holding the fetched texts was removed. The run folder holds no `compile*` folder.

## Issues left to you

1. **Recency.** 45.2 percent of the sources are from 2022 to 2026, below the 50 percent the review's recency check asks for. Counting 2021 as recent, the share is 51.0 percent.
2. **Stopping rule.** One extra search for recent work added 27 sources (36 percent) after the stopping rule had been met. The rule that the last pass adds under 10 percent therefore no longer holds for the final set.
3. **Non-ASCII in refs.bib.** 75 lines hold non-ASCII characters: en dashes in page ranges, curly quotes and accented author names, kept as the lookup printed them. The dashes and quotes break the ASCII rule; the accented names are allowed.
4. **Preprints.** 15 sources are preprints: arXiv `@misc` entries, plus bioRxiv and medRxiv items. WEGL (arxiv_2006_09430) stays `@misc`, because its ICLR 2021 version was not confirmed.
5. **Unusual entries.**
   - Naji et al. is a Zenodo deposit whose key is `https://doi.org/10.5281/zenodo.22212575`.
   - Li_2027 carries Crossref's year 2027, while OpenAlex and Semantic Scholar give 2025.
   - The author list of Thual_2025 ends with "and others".
   - The second Peng 2026 entry is keyed Peng_2026a.
6. **Venues not checked.** No check of publisher standing was run for Frontiers in Oncology (Gong_2026), BME Frontiers (Liu_2026) or Algorithms (Vayer_2020).
7. **Published versions not checked.** Semantic Scholar refused several requests for exceeding its rate limit, so the published versions of arxiv_1306_0895, Guti_rrez_Becker_2018 and arxiv_2111_00648 were not checked there.
8. **Method share.** 72.1 percent of the sources are computational methods papers. The review attributes this to the research question, which asks which methods exist.
9. **Indexes not reached.** Google Scholar blocks automated requests. IEEE Xplore, ACM DL and Scopus were reachable only by web search, which returned nothing new from them.
10. **No entry dropped.** The section "No entry written" of the review lists none.
11. **Using the entries in a manuscript.** A later run given a manuscript adds the entries to its `.bib` and offers this review and `refs.bib` at intake.

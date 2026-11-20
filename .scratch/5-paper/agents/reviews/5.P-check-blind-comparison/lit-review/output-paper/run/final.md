# this literature review: final message

The run is finished. Nothing in it is left undone, and the identifier check fails on no reference. A few things go to you and are listed under "Issues for you" below. The main ones: four of the databases named in settings.md could not be searched, about 45 sources were read at abstract level only, and the gaps hold only for the searches that were made.

## Deliverables (run folder `run/literature review-2026-11-20/`)

- `review.md`: the literature review over 270 included sources. It has these sections:
  - Search Strategy, given per strand, with each query string and the hit count it returned.
  - Coverage Distribution Advisory.
  - Screening Results.
  - Annotated Bibliography in 23 families.
  - Literature Matrix of 270 rows, covering how correspondence is handled, whether there is a subject-level predictor, and which pipeline step is removed or built on.
  - Identified Gaps, five of them.
  - Recommended Sources by Paper Section.
  - Quality Gates.
  - Synthesis Analysis of 8,923 words, counted with `awk '/^## Synthesis Analysis/{f=1} f' review.md | wc -w`. Its four sections follow the three parts of your research question, and the fourth states what the searches leave open.
- `refs.bib`: 270 entries (`grep -c '^@'`). 209 carry a DOI, 55 an arXiv ID and 6 an official page URL.
- `strand-A.md` and `.bib` (91 entries), `strand-B.md` and `.bib` (73), `strand-C.md` and `.bib` (40), `strand-D.md` and `.bib` (77). These are the four strand-group reports the review was merged from. Merging removed 11 duplicates.
- `checks.md`: the identifier checks of literature review items 2, 4 and 6, with each command, its output as printed and its exit status.
- `settings.md`: the confirmed record, with decisions D1 to D13.
- `final.md`: this message.

No other target format was made. Target formats is `markdown` only (D2), and `review.md` is that target.

## Identifier check (DOI checking: strict)

- **Item 2.** One `resolve` over the 264 DOIs and arXiv IDs exited 0 and printed 264 blocks. No identifier provably fails. The 6 URL-only entries were checked on their official pages, and each page names the entry's title.
- **Item 3.** The merge search agent compared every entry with the record the check printed. No title, year, venue, volume or pages field was wrong. It added 16 missing fields and enriched 2 notes, and changed no identifier.
- **The DOI_MISMATCH lines.** Seven lines in the first run were marked DOI_MISMATCH, and each belongs to the cited work. For SPARTan, COPA and TASTE, Crossref holds the short title. For Peyre and Cuturi 2019, Semantic Scholar holds the arXiv title. For the Set Transformer, Semantic Scholar holds the short title.
- **Item 4.** The second `resolve` over all 264 identifiers exited 0. No identifier provably fails, and no retraction or expression-of-concern notice was printed.
- **Item 6.** The sources' review changed no entry, so item 6 had nothing to check.
- **Result.** No entry is unchecked, and no entry fails. The stop "A reference that cannot be confirmed" was not reached.

## Decisions taken under your instruction not to stop

D1 to D10 are intake's recommendations. D11 to D13 are the session's:

- **D11.** Four strand-group search agents and one merge start.
- **D12.** No further chaining round for strand D. The search agent page says the search stops once three of its five stopping conditions are met, and strand D meets conditions 1, 3 and 5.
- **D13.** The sources' review was taken with no change.

The intake confirmation was a stop, and you answered it with "Confirm. Go on and finish the run."

## Issues for you

### From the search (all four strand starts and the merge start)
- Scopus, Web of Science, IEEE Xplore and the ACM Digital Library are named in the Sources row but were not searched, because the run has no subscription or API access to them. DBLP answered every request with a bot-check page. Papers from IEEE, ACM, MICCAI, TMI and Medical Image Analysis reached the screen through PubMed, OpenAlex, Semantic Scholar and arXiv. Every "not found" in the gaps and the synthesis refers to these searches only.
- Semantic Scholar returned HTTP 429 (rate limiting) during the searches of strands B and D, and during both identifier checks for some identifiers. In each case another index gave the record.
- Only the top-ranked 10 to 60 records of each query were screened in strand C, and strand D screened OpenAlex by relevance rank only. The counts are in the Search Strategy section.
- `review.md` states that 45 included sources were read at abstract level only. A claim resting on one of them says no more than its abstract does. Each strand report lists, per source, the open routes it tried: PMC, Europe PMC, Unpaywall, arXiv and publisher pages.
- The currency gate passes exactly at the threshold. 135 of 270 sources (50.0 percent) carry a year of 2022 or later, and this counts li2027functional, an accepted article that Crossref dates 2027. Counted from November 2021 by year, the figure is 154 of 270 (57.0 percent).

### Strand A (tensor methods)
- Bro 1997 ("PARAFAC. Tutorial and applications") is excluded under criterion (g). No route gave a readable text or abstract, and the routes tried are in `strand-A.md`. Two 2025 papers are excluded on the same ground: slice-wise irregular tensor decomposition and integrative tensor regression for stratified data. If you can supply PDFs, they can be screened.
- Harshman 1970 and 1972 are cited by the URL of the author's reproduced copy at psychology.uwo.ca. The original is UCLA Working Papers in Phonetics 16 and 22.

### Strand B (optimal transport)
- Villani is cited as the 2009 Springer book, but was read from the author's 2006 lecture notes. Memoli 2011 was read from a copy of the published article hosted on a course page.
- Three candidates are excluded under (g) because no route reached their text: Ma et al. 2023 (pyramid graph kernel for autism), Ma et al. 2026 (sliced Wasserstein graph kernel), and the Mikem et al. 2025 HAL poster. The routes tried are in `strand-B.md`.

### Strand C (set encoders and fusion)
- Zhang, Wan and Zhang 2020 (DOI 10.1007/978-3-030-59713-9_43) is excluded under (g), because no text or abstract was found. Luo 2022 and Zhang 2020 (glioblastoma subregions) were read at abstract level only.

### Strand D (registration, radiomics, lesion segmentation)
- 16 of its 77 sources were read at abstract level only. The routes tried for each are in `strand-D.md`.
- Two of its stopping conditions are not met: the share of sources added by the last round, and citation-loop closure. The 20 sources its citation loop added were not chained further (D12).
- The PubMed full-text tool was not used, because permission for it was denied in this run.

### Rows only you can fill
- Venue, Venue limits, Authors, Contributions, Funding and Conflicts of interest are not known.
- The name of the paper the review serves is `[GAP: the name or working title of the paper the review serves]`.
- AI use: research assistance is marked used. The other five categories (drafting, revision, editing, analysis and peer review simulation) are marked uncertain. Tools and versions are `[GAP: tools and versions not known to the user]`. The model the roles ran on is claude-opus-5-5.

## Next step

A later full-manuscript run offers this run's `review.md` and `refs.bib` at its intake as the literature base of the method paper.

## Clean-up

The run's temporary folder was removed with `rm -r`. The run folder holds no `compile*` folder (`find . -maxdepth 1 -type d -name 'compile*'` prints nothing).

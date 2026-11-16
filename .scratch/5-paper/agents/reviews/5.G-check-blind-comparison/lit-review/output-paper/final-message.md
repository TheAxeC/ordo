The literature review run is finished. The review is in `review.md`, which has all 11 sections, and `refs.bib` holds 225 entries. No manuscript was given, so no `.bib` was patched, and the reference checks and compile did not run. `final.md` holds the record of this message.

**Not done, or for your review:**
- **Citation loop.** One of the conditions for ending the search did not hold. Harshman 1972, "PARAFAC2: Mathematical and technical notes", is cited by the core papers, but no index holds a record of it, so it has no entry.
- **Sources' review skipped.** Under your no-stop instruction the run went on with the 225 sources unchanged. This is recorded under Decisions in `settings.md`.
- **Choices the merge run made:**
  - Dutta 2026 was excluded as a possibly predatory venue.
  - `arxiv_2312_06467` (Thual et al.) stays a preprint. A TMLR 2025 version exists, but its page was refused because its title matches at a ratio of only 0.42.
  - 167 of the 225 sources are method papers, which triggers the review's distribution advisory. The search was not widened, because the question asks which methods exist.
- **Gaps in the annotations:**
  - `Villani_2009` and `Galloway_1975` are included without their abstracts read, because three or more core papers cite each.
  - Key results are left as GAP for Bi 2021, Nikolentzos 2017, Sidiropoulos 2000, Barbe 2021, Shi 2021, Han 2025 and Barbarant 2026.
- **Preprints.** Seven sources are still preprints, and `Harshman_1970` is a working paper.
- **Databases not reached.** IEEE Xplore, ACM DL and Scopus were never searched directly, because the web search ignored the site limit.
- **Your own paper.** `Faes_2024` (BTTR, IEEE TNNLS) was kept on merit, and its annotation says it is your earlier work.
- **AI disclosure.** The tools and versions are still a gap in `settings.md`. The disclosure line names research assistance only, because you marked drafting as uncertain. This run did write the synthesis in section 7.
- **Theme run 1's mistyped path.** It wrote its two files to a folder with the path's slashes written as hyphens. I copied both into the run folder, checked each with `cmp`, and removed the stray copies.

**What I checked myself:**
- `grep -c '@[a-zA-Z]*{' refs.bib` counts 225 entries, with no duplicate keys or duplicate DOIs.
- `grep '^## ' review.md` lists the 11 sections.
- `LC_ALL=C grep -c '[^ -~]'` prints 0 for `review.md`, `refs.bib` and `settings.md`, so all three are plain ASCII.
- All five search agents were served `claude-opus-5-5`, read from their transcripts.
- The temporary folder is removed, and there is no compile folder.

**Not checked by me:** that every entry prints CONFIRMED under `resolve --entry`. That comes from the merge run's report and section 9 of `review.md`; I did not rerun the 225 lookups.

Files are in `run/`:
- `settings.md`
- `review.md`
- `refs.bib`
- `theme-report-1.md` to `theme-report-4.md`
- `theme-refs-1.bib` to `theme-refs-4.bib`
- `final.md`

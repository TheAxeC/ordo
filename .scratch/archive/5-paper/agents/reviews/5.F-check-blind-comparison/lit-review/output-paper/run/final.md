# Final message, 2026-11-16

The literature review is written: 87 sources, each with an annotation in `review.md` and an entry in `refs.bib`. All 87 entries print CONFIRMED on `the lookup script resolve --entry`, re-run by the session on every key. No `.tex` was given, so no manuscript `.bib` was patched and no reference checks or compile ran.

## Run folder

`run/`

- `settings.md`: the intake record, the Notes and the Decisions.
- `review.md`: search strategy, distribution advisory, screening results, annotated bibliography (87), literature matrix, 5 identified gaps, synthesis by part of the research question, recommended sources by paper section, "No entry written" (none), search limitations, AI disclosure.
- `refs.bib`: 87 entries, 10 of them arXiv `@misc`.
- `final.md`: this message.

## Decisions taken in place of stops

- The intake confirmation and the sources' review were not shown for an answer, because the user stated they would not interact further and asked that recommendations be taken. The record holds only the user's answers; the sources' review was taken as "go on" with no source added or removed. Both are in `settings.md` under "Decisions".

## Issues for the user

- Four arXiv entries name a published version that Semantic Scholar reports and no venue page confirmed: arxiv_2111_00648 (NeurIPS 2021), arxiv_2006_09430 (ICLR), arxiv_2006_12065 (ICLR), arxiv_2208_00993 (ML4H 2023, no DOI). Their entries stay as the arXiv record.
- Six entries are preprints with no published version found: arxiv_2602_07260, arxiv_2609_23705, arxiv_2401_01460, arxiv_2605_20883, arxiv_2510_22033, arxiv_2609_05919.
- Databases not reached: IEEE Xplore, ACM DL and Scopus (no page returned), Google Scholar and Scopus "Cited by" (bot check), Connected Papers (needs a browser). Semantic Scholar answered HTTP 429 to some calls.
- The search ended with 4 of 5 conditions holding; the citation loop did not close (cited works such as the PyRadiomics paper and elastix were not collected).
- AI use: drafting, revision, editing and analysis assistance and peer review simulation are recorded as uncertain, and tools and versions as not known. The disclosure in `review.md` section 11 says "tool and version not known"; this run's role ran on `claude-opus-5-5`.
- 87 sources is above the typical 40 to 80 for a literature review.

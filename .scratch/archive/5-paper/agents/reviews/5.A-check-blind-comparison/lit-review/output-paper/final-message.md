The literature review is done: 66 sources in `review.md`, with all 66 entries in `refs.bib` confirmed against the indexes. Two of the review's own quality checks fail.

- **Too few recent sources.** Only 24 of the 66 sources (36%) are from 2021 to 2026; the target is 50%. The extra search for recent work ran once, which is all its instructions allow, and added two sources.
- **Many sources not read in full.** 24 included sources were judged from their abstract alone. Two foundational papers, M<latin small letter e with acute>moli 2011 (Gromov-Wasserstein) and Avants 2008 (registration), had no abstract read either.

Three candidates were left out because their text could not be retrieved. One of them, Zhao et al. 2026 (10.1016/j.inffus.2026.104509), predicts surgical outcome from point-cloud features and radiomics, so it bears directly on your question.

## What the review contains

It covers five themes:
- tensor regression and decompositions with an unaligned mode;
- entropic transport and barycenters;
- Gromov-Wasserstein and fused Gromov-Wasserstein, with learned templates and dictionaries;
- permutation-invariant set encoders and multiple instance learning;
- the medical-imaging pipeline: registration, segmentation and radiomics.

It names five gaps. Two bear on novelty:
- **Gap 1:** no supervised outcome prediction from lesion or region sets through transport to learned templates.
- **Gap 2:** no multilinear PLS or tensor regression over an unaligned spatial mode. PARAFAC2 handles one unaligned mode but has no predictive PLS objective.

## Fixes to `refs.bib` before closing

Following your instruction, I took my recommendation at each choice instead of stopping, and each is logged under Decisions in `settings.md`. The search agent fixed:
- the PointNet entry, whose authors Crossref lists wrongly;
- the page-range dashes and the non-ASCII characters outside author names;
- five unescaped ampersands that would break a LaTeX build.

## Checks I ran myself

- `the lookup script resolve --entry` on all 66 keys printed CONFIRMED 66 times.
- The keys cited in `review.md` and the keys in `refs.bib` are the same 66 (`comm` of the two lists is empty both ways).
- The search for an unescaped `&` in `refs.bib` finds nothing.
- `review.md`, `settings.md` and `final.md` have no non-ASCII characters.
- `refs.bib` has no en or em dashes left. Its 26 non-ASCII lines are accented letters in author names, by the search agent's count.

You gave no `.tex`, so no manuscript bibliography was changed and the manuscript reference checks did not run.

## Still open

- **Your decision:** the AI-use record marks drafting assistance as uncertain, but the search agent wrote the synthesis in `review.md`.
- Semantic Scholar returned rate-limit or "not found" errors on many searches, so its coverage is thin.
- Records excluded on their title alone were not counted one by one.
- About 85% of the sources are computational method papers.

The temporary folder of downloaded texts has been removed.

Files are in `run/`:
- `review.md`
- `refs.bib`
- `settings.md`
- `final.md`

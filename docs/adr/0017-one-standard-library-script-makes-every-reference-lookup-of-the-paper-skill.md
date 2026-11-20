# 0017. One standard-library script makes every reference lookup of the paper skill

Status: proposed; superseded by 0032 in the part that makes `search`, `refs`, `cited-by` and `fetch` the only way the literature strategist finds and reads sources, and by 0034 in the part that makes `lookup.py` the only way the draft writer, the formatter and the citation compliance agent find a venue page, and by 0033 in the part that makes `lookup.py` the only way the citation compliance agent reads a source's text; superseded by the ruling The academic-paper strategist of plan 5 in the literature strategist's use of `lookup.py`, and by 0041, which makes `lookup.py` the way the strategist queries every index again, adds `index-abstract`, `dblp` and `resolve` over several inputs to its commands and PubMed E-utilities, Europe PMC and DBLP to its indexes, and keeps the strategist from `lookup.py bibtex`; superseded by 0042 in the literature strategist's search, where the strategist's own scripts may query an index

## Context

Roadmap entry 5 builds `paper` with the reference lookups of the coverage inventory: a lookup protocol for each of the four indexes, each with a title match at 0.70 similarity (`docs/academic-coverage.md`, rows 208, 211, 212 and 213), every reference looked up rather than trusted from memory (row 151), and the `\cite`-against-`.bib` and DOI checks (row 54). deep-research states those protocols as text and names client scripts (`deep-research/references/openalex_api_protocol.md:58`) that its folder does not hold, so its agents make the lookups themselves. Under the change standard's section "Scripts compute facts; judgment is read", a lookup, a similarity ratio, a URL's status, the keys a `.tex` cites and whether one text occurs in another are facts a script computes. The configuration sets `libraries: avoid` (`.agents/plan.yaml`). `lookup.py` and its offline test exist at commit 0074728.

## Decision

`skills/paper/templates/lookup.py`, on the Python standard library alone, taken from commit 0074728, makes every lookup of the skill: `resolve`, `search`, `refs`, `cited-by`, `bibtex`, `fetch`, `check-urls` and `quote-check`, and computes the `\cite` key check. A match needs a title similarity of 0.70 or more by `difflib.SequenceMatcher`, a DOI whose title is below that is flagged `DOI_MISMATCH`, records are merged only on an identical identifier, and an index that fails is left out with its reason. `check-urls` reads the manuscript's `.bib` and the `\cite`-family keys of its `.tex`. The key check reads the `\cite`-family keys of the `.tex` and of every file it `\input`s or `\include`s, and prints each key the `.bib` lacks and each `.bib` entry no `\cite` uses. `quote-check` reads the passage lines of the run's citation report and reports whether each passage occurs in its source's text, and judges nothing else. PDF text comes from `pdftotext`. `idea` calls the same script for its novelty check.

## Alternatives rejected

- Agents making the lookups with `curl` from the protocol text, as deep-research does: each agent computes the similarity and the pacing in its own reading, so the same reference can resolve in one run and not in another, and `idea` has nothing to reuse.
- The `\cite` key check in a script of its own: `check-urls` and the key check both need the cited keys, so `\cite` would be parsed in two places.
- The key check made by the model reading the files: a fact a machine computes exactly would rest on a reading.
- No quote check: a passage that is not in its source would be caught only by reading it against the source.

## Consequences

The script and its offline test, with recorded responses, are kept with `paper`, and the script is listed on `docs/dev/scripts.md`. A change to an index's API is fixed in one place for both skills. The quote check needs poppler's `pdftotext`, which the Read tool already needs for long PDFs. API keys are read from the environment where the user sets them.

# 0017. One standard-library script makes every reference lookup of the literature skill

Status: proposed

## Context

Roadmap entry 9's gate checks that every source the `literature` skill cites resolves, and entry 5 waits on entry 9 for the reference lookups (`.scratch/archive/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/plan.md:118`). The coverage inventory takes a lookup protocol for each of the four indexes, each with a title match at 0.70 similarity (`docs/academic-coverage.md`, rows 209, 212, 213 and 214). deep-research states those protocols as text and names client scripts (`deep-research/references/openalex_api_protocol.md:58`) that its folder does not hold, so its agents make the lookups themselves. Under the change standard's section "Scripts compute facts; judgment is read", a lookup, a similarity ratio, a URL's status and whether one text occurs in another are facts a script computes. The configuration sets `libraries: avoid` (`.agents/plan.yaml`).

## Decision

`skills/literature/templates/lookup.py`, on the Python standard library alone, makes every lookup of the skill: `resolve`, `search`, `refs`, `cited-by`, `bibtex`, `check-urls`, `fetch` and `quote-check`, as the entry's ruling D11 states them. A match needs a title similarity of 0.70 or more by `difflib.SequenceMatcher`, a DOI whose title is below that is flagged `DOI_MISMATCH`, records are merged only on an identical identifier, and an index that fails is left out with its reason. `quote-check` reports whether each quoted passage occurs in its source's text and judges nothing else. PDF text comes from `pdftotext`. `paper` calls the same script for its reference lookups.

## Alternatives rejected

- Agents making the lookups with `curl` from the protocol text, as deep-research does: each agent computes the similarity and the pacing in its own reading, so the same reference can resolve in one run and not in another, and `paper` has nothing to reuse.
- A quote check for HTML and text sources only, with no `pdftotext`: a passage quoted from a PDF-only source would be checked only when it falls in the gate's sample of twenty.
- No quote check: a passage that is not in its source is caught only when it falls in that sample.

## Consequences

The script and its offline test, with recorded responses, are built and kept with the skill, and the script is listed on `docs/dev/scripts.md`. A change to an index's API is fixed in one place for both skills. The quote check needs poppler's `pdftotext`, which the Read tool already needs for long PDFs. API keys are read from the environment where the user sets them.

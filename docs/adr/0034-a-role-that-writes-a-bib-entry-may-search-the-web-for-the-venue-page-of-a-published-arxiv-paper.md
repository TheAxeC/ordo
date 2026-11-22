# 0034. A role that writes a .bib entry may search the web for the venue page of a published arXiv paper

Status: proposed

## Context

ADR 0017 makes `lookup.py` the only way `paper`'s roles look a reference up, and ADR 0032 lifts that for the literature strategist. The draft writer, the formatter and the citation compliance agent also write `.bib` entries, and `lookup.py bibtex` prints "published in <venue> (<type>) per Semantic Scholar" for an arXiv paper published at a venue that gives it no DOI. The entry of the published version is built by `bibtex <arXiv ID> --page <url>` from the venue page, and no index names that page: OpenAlex's record of arXiv 1810.00825 lists arXiv and the Oxford archive only, and DBLP's API answers with a bot check. Without a search these roles write the `@misc` entry of the preprint, and judge 2 of step 5's lit-review comparison named published papers cited as preprints as a defect.

## Decision

When `lookup.py bibtex` prints the "published in" line for a source, the draft writer, the formatter and the citation compliance agent may run one web search, limited to finding that source's page at the venue it names, and the entry is the one `lookup.py bibtex '<arXiv ID>' --page '<url>'` prints, which checks the page's title and year. The page is never read through WebFetch, and no sign-in, payment or bot check is passed. When no page is found or `--page` refuses it, the `@misc` entry stays and the role's report names the key with the "published in" line. Every other lookup of these roles stays with `lookup.py`. This supersedes ADR 0017 in the part that makes `lookup.py` the only way these roles find a venue page.

## Alternatives rejected

- `--page` only with an address the role already holds: a draft writer answering a `missing:` line holds none, so a published paper is still cited as a preprint.
- The search left to the strategist alone: modes without a literature search, such as revision and format-convert, then never cite the published version.

## Consequences

A published paper is cited as published in every mode that writes an entry, at the cost of one web search per such source. `references/latex-template.md`, `draft_writer_agent.md`, `formatter_agent.md`, `citation_compliance_agent.md` and `SKILL.md`'s prompt rules carry it in step 5.D of plan 5.

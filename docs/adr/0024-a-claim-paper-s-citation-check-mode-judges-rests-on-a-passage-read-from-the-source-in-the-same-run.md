# 0024. A claim paper's citation-check mode judges rests on a passage read from the source in the same run

Status: proposed

## Context

ADR 0018 made each claim `paper`'s integrity check judges rest on a passage read in the same run from the source's full text. ADR 0025 (which supersedes ADR 0022) moves the integrity check to `researcher`, and the citation compliance agent keeps a claim check in citation-check mode. Ruling AF of plan 5 extends that check to full mode and revision mode. In these modes every cited sentence of the manuscript is checked against the source's full text (`skills/paper/references/citation-compliance.md`, "Reading the source" and "Judging a claim"). Claude Code's WebFetch runs a prompt over the page "in a separate model call, and Claude receives the result of that call rather than the raw page" (https://code.claude.com/docs/en/tools-reference, as ADR 0018 cites it), so a passage taken from it can be a paraphrase that is not in the source. `lookup.py fetch` writes a source's full text to a folder, and `lookup.py quote-check` reports whether a quoted passage occurs in that text (ADR 0017).

## Decision

Each claim `paper`'s citation compliance agent judges, in citation-check, full and revision mode, rests on a passage read in the same run from the source's full text. The full text is fetched by `lookup.py fetch` into a temporary folder, removed at the run's end, and read with the Read tool for a PDF or as text for HTML, never through WebFetch. The passage is written into `citation-report.md` as a passage line with its locator, and `lookup.py quote-check` checks that it occurs in the fetched text. A source of which only the abstract was read supports only what the abstract says, and the report marks it so. A source whose text cannot be fetched supports nothing, and its claim goes to the user with the URLs tried. The rules for reading the source are held in `references/citation-compliance.md`. The `.tex` keeps a plain `\cite`.

## Alternatives rejected

- Citation-check mode checking keys and DOIs only, the claim check left to `researcher`: no claim of a manuscript could be checked against its source until entry 13 is built.
- Claims judged from the abstract and the index metadata, or full text through WebFetch: rejected for ADR 0018's reasons, a claim judged on what the reviewer remembers or on a passage that may not be in the source.

## Consequences

Each cited source costs a fetch and a read in a citation-check, full or revision run. A lit-review run fetches the candidates' texts for screening only, and judges no claim from them. The reading rules stand in `paper` and will also stand in `researcher` when entry 13 rebuilds the integrity check. The quote check needs poppler's `pdftotext`, as `lookup.py fetch` does.

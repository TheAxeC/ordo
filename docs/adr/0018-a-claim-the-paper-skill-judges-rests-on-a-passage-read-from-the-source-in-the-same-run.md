# 0018. A claim the paper skill judges rests on a passage read from the source in the same run

Status: superseded by 0024

## Context

Roadmap entry 5 builds `paper` with the reference and claim integrity checks of the coverage inventory. The claim audit judges each cited claim against the retrieved source text, "never judging a source it did not read", and the integrity agent traces claims to their passages (`docs/academic-coverage.md`, rows 151 and 152). A manuscript cites with a plain `\cite`, so the passage cannot stand in the `.tex`. Claude Code's WebFetch runs a prompt over the page "in a separate model call, and Claude receives the result of that call rather than the raw page" (https://code.claude.com/docs/en/tools-reference), so a passage taken from it can be a paraphrase that is not in the source. `lookup.py fetch` writes a source's full text to a folder, and `lookup.py quote-check` reports whether a quoted passage occurs in that text (ADR 0017). A run keeps its records in `paper-runs/<mode>-<YYYY-MM-DD>/` beside the manuscript's folder (`.scratch/rulings/5-paper.md`, D27).

## Decision

Each claim `paper`'s integrity check judges rests on a passage read in the same run from the source's full text. The full text is fetched by `lookup.py fetch` into a temporary folder, removed at the run's end, and read with the Read tool for a PDF or as text for HTML, never through WebFetch. The passage is written into the run's integrity record as a passage line with its locator, and `lookup.py quote-check` checks that it occurs in the fetched text. A source of which only the abstract was read supports only what the abstract says, and the record marks it so. A source whose text cannot be fetched supports nothing, and its claim goes to the user with the URLs tried. The `.tex` keeps a plain `\cite`.

## Alternatives rejected

- Claims judged from the abstract and the index metadata: rows 151 and 152 ask for claims traced to their passages, and a claim the abstract does not state would be judged on what the reviewer remembers.
- ADR 0016 left as it is: it governs the report of the dropped `literature` skill, and nothing would govern `paper`.
- Full text through WebFetch: its output is a model's processing of the page, so a quoted passage may not be in the source.

## Consequences

Each cited source costs a fetch and a read in every run that checks its claims. The integrity record grows by one passage line per judged claim, and the user checks a claim against its passage without fetching the source. No paper's PDF is kept in the project. The quote check needs poppler's `pdftotext`, as `lookup.py fetch` does.

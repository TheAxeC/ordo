# 0016. A cited claim rests on a verbatim passage read from the source in the same run

Status: proposed

## Context

Roadmap entry 9's gate reads twenty citations drawn at random for whether the cited passage supports its claim, and wants a source that cannot be accessed reported, not written around. The coverage inventory requires a page, section or quote on each citation and counts a source verified only once its original was read (`docs/academic-coverage.md`, rows 185, 191 and 197). Claude Code's WebFetch runs a prompt over the page "in a separate model call, and Claude receives the result of that call rather than the raw page" (https://code.claude.com/docs/en/tools-reference), so a passage taken from it can be a paraphrase that is not in the source. The Read tool reads PDF files (same page). A plain model cites papers that do not exist: 78.7 percent of GPT-4o's cited papers in computer science, in OpenScholar's Table 3 (https://arxiv.org/html/2411.14199).

## Decision

Each claim the `literature` skill cites carries a locator (a page, a section or a paragraph) and a verbatim passage read in the same run from the source's full text. The full text is fetched by `lookup.py fetch` into a temporary folder and read with the Read tool for a PDF or as text for HTML, never through WebFetch. A source of which only the abstract was read is cited only for what the abstract says, and the citation is marked so. A source whose text cannot be fetched is cited for nothing and listed with the URLs tried.

## Alternatives rejected

- A locator without a passage: the gate's reader must find the passage, and nothing shows the writer read it.
- Abstracts and metadata only: the coverage rows that count a source verified only from its original go unmet.
- Full text through WebFetch: its output is a model's processing of the page, so a quoted passage may not be in the source.

## Consequences

Each cited source costs a fetch and a read. The report is longer by one passage per citation, and a reader checks a claim against the passage without fetching the source. `paper` cites through the same lookups (roadmap entry 5 waits on entry 9 for them) and is held to the same tie.

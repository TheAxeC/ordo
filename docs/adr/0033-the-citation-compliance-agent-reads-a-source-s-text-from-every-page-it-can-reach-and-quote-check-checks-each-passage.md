# 0033. The citation compliance agent reads a source's text from every page it can reach, and quote-check checks each passage

Status: proposed

## Context

ADR 0024 decides that each claim the citation compliance agent judges rests on a passage read in the same run from the source's full text, and that "The full text is fetched by `lookup.py fetch` into a temporary folder". `lookup.py fetch` takes HTML only from arxiv.org/html and otherwise only a body that starts `%PDF-` (`skills/paper/templates/lookup.py`, head comment), so an open-access full text on a PMC, Europe PMC or publisher HTML page counts as unread. In step 5's full run, the citation report holds 80 lines marked "abstract only" and 14 marked "full text"; in the revision run, claims C5 to C17 were overridden because the text "cannot be fetched by `lookup.py`" (`.scratch/5-paper/agents/reviews/5-blind-comparison/`). academic-paper verifies each citation "via DOI or WebSearch" and its runs read publishers' pages, PMC and PubMed. ADR 0032 already lets the literature strategist read from every page it can reach.

## Decision

The citation compliance agent, in full, revision and citation-check mode, reads each cited source's text from every page and file it can reach without a login, a payment or a bot check: the file `lookup.py fetch` writes first, then PMC, Europe PMC, the DOI's landing page and the venue's page. Each page is saved with `curl` into the run's temporary folder, and `lookup.py` makes its text as `fetch` makes it, so that `quote-check` reads it. No text is read through WebFetch. The passage line, its locator and `quote-check` stay as ADR 0024 decides, and a source of which only the abstract was read still supports only what the abstract says. This supersedes ADR 0024 in the part that makes `lookup.py fetch` the only way the text is obtained. It also supersedes ADR 0017 in the part that makes `lookup.py` the only way the citation compliance agent reads a source's text.

## Alternatives rejected

- The text fetched by `lookup.py fetch` alone, as ADR 0024 had it: most claims of a run are judged on abstracts, and a claim whose source is open on an HTML page goes to the user as unsupported.
- WebFetch for the text: its output is a model's processing of the page, so the passage could not be checked against what the source holds.

## Consequences

More claims rest on full texts, and the run's records still hold each passage checked by script. Each saved page costs a request and a read. The citation compliance page, `SKILL.md`'s prompt rules and anti-patterns, and `lookup.py` carry it in step 5.E of plan 5.

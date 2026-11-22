# 0037. Paper searches a request across research communities with one literature strategist per search theme and a merge run

Status: superseded by 0042

## Context

academic-paper 3.2.0 gives the search to one literature strategist and leaves the structure of the search to its session. ADR 0036 does the same for `paper`: "The session decides when to start a role agent fresh, when to resume one with a second message, and how many run at once."

In step 5's lit-review run of plan 5, academic-paper's session took decision D1: "the search stage is run as four theme-scoped search agent runs, each executing the agent's full 4-layer search, screening and annotation for its themes, followed by one search agent merge run that deduplicates, applies the shared criteria, and emits the single Literature Search Report". Its reason: "the eight topic areas come from at least four research communities and the source target is 40 to 80; one run would give each area a shallower search" (`settings.md:66-74` of that run's academic-paper output).

What that run did, read from its files under `search/` and `output/`:

- Each theme run had its own target range, and the Literature Review minimum of 30 was held to the merged report: "The Literature Review minimum of 30 applies to the merged report, not to one theme" (`search/theme_A_tensor.md:134`). The ranges were 12 to 25, 18 to 30, 12 to 25 and 15 to 28.
- The four theme runs kept 25, 30, 25 and 28 entries, 108 in all, as `grep -o '@[a-zA-Z]*{[^,]*,' <file> | sort -u | wc -l` over each `search/theme_*.bib` prints. One work was kept by two theme runs, so 107 were unique.
- The merge run searched on its own and added 40 sources, for 147 in `output/references.bib` (the same `grep` prints 147). It took in proceedings records the theme runs had excluded for a missing DOI, the five sources a theme run cut at its range's upper bound, judged on merit, works a theme run could not collect, by other routes, venue-filtered proceedings queries, backward chaining and forward tracking over 13 core papers across the four search themes until the citation loop closed, and nine searches where the search themes meet (`search/literature_search_report.md`, Items 2a to 2f).
- Its search record gives each theme run's counts and then the merge run's own counts (`search/literature_search_report.md`, "Screening Results").

`paper`'s run of the same request on `v8.4.0-rc.7` started one literature strategist, as the transcript's `subagents` folder lists, and kept 87 entries in its `refs.bib`, by the same `grep`. The user ruled The theme search in plan 5 (`.scratch/5-paper/plan.md`, Rulings): `paper` makes academic-paper's D1 its rule, recorded as a deviation from academic-paper's text, which leaves it to the session.

## Decision

In full, outline-only and lit-review mode, the session divides the topic and the research question into search themes before the first start of the literature strategist, one for each research community the request reaches. A research community is a field with its own literature, venues and terms. The session writes each search theme in `config.md` under "Decisions" with its name, the strands of the request it covers, its source-count range and the reason for the division. This is a choice of the session and no stop.

- A request inside one research community has one search theme, and one strategist runs as before, with no merge run.
- With two search themes or more, the session starts one literature strategist per search theme, all at once. Each theme run runs the whole search of `skills/academic/paper/agents/literature_strategist_agent.md`, read with the `paper` skill's `references/literature-strategist-theme-run.md`, for its search theme, with the parts of the research question that `config.md` records and its range in place of the paper type's minimum, saves its fetched texts in its own subfolder `theme-<k>/` of the temporary folder, and writes `review-theme-<k>.md`, `refs-theme-<k>.bib` and `search-log-theme-<k>.md` in the run folder.
- When every theme run has ended, the session starts one more strategist, fresh: the merge run. It first reads each theme report against the recorded parts and refuses one that numbers or words them otherwise; the session then resumes that theme run once with the recorded parts and starts the merge run again, and a report that still differs is mapped onto the recorded parts and named in the limitations and the final message. The merge run removes the duplicates, applies the shared criteria to every source again, and searches across the search themes. Its own searches are the sources the theme runs cut at their upper bound, judged on merit, backward chaining and forward tracking from the core papers that every theme run names in its search record until the citation loop closes, and a search for each pair of search themes the research question joins.
- The merge run runs the gates over the whole set with the paper type's minimum, runs `lookup.py resolve --entry` on every entry of the merged `refs.bib` as ADR 0032 decides, and writes the one `review.md`, the one `refs.bib`, the one `search-log.md` and the one patch.
- A search theme is a level above the themes of the literature matrix, whose topical themes stay its columns; each row of the merged matrix also names the search themes that kept the source.
- Every later input for the strategist goes to the merge run's strategist, which holds `review.md` and `refs.bib`.
- Each theme run selects two or three primary databases for each field of its search theme, as ADR 0036's deviation on databases says, and is a start of the literature strategist as ADRs 0027, 0030 and 0035 decide, its temporary files removed with the run's temporary folder as ADR 0020 decides.

This supersedes ADR 0036 in its sentence that the session decides when to start a role agent fresh and how many run at once, for the literature strategist's search for the review in full, outline-only and lit-review mode. Revision mode, which starts the strategist for the items that call for a new reference, is unchanged.

## Alternatives rejected

- Leaving the structure of the search to the session, which is academic-paper's text: `paper`'s runs of this request each gave the whole request one search, and the eight topic areas each got the depth of one share of it.
- One strategist with a higher source target: the eight areas still get one search design, one set of databases and one set of passes between them.
- A merge run that only removes the duplicates: it leaves out the 40 sources academic-paper's merge run found where the search themes meet, by the sources the theme runs cut and by chaining across them.

## Consequences

A request across research communities gets a search per community and a search where they meet. A run costs more: academic-paper's run of step 5, its LaTeX formatting included, cost $47.48 against $12.43 for `paper`'s run on `v8.4.0-rc.7`, a judgment of the order of the cost and not a measurement of this design. A request inside one community runs as before. `skills/academic/paper/SKILL.md`, `skills/academic/paper/agents/literature_strategist_agent.md`, `skills/academic/paper/agents/intake_agent.md`, the glossary entries "search theme" and "merge run", the README and the figures carry the change.

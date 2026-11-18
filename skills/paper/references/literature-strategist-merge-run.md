# Literature strategist: the merge run

The literature strategist agent reads this page when the session starts it as the merge run after the theme runs (`SKILL.md`, Steps 8).

## The merge run

The agent is given `config.md`, every `review-theme-<k>.md`, `refs-theme-<k>.bib` and `search-log-theme-<k>.md`, every subfolder `theme-<k>/`, the sources given and, where the session gives one, the manuscript's `.bib` with its manifest.

- Before it merges, it reads each `review-theme-<k>.md` against the row "Parts of the research question" of `config.md`. A theme report whose part fields, part columns or section 1 number or word the parts otherwise than the row is refused: the agent stops before merging, writes no file, and its report names each refused theme run with how its parts differ.
- A theme run is refused at most once. When the session's prompt says that a theme run was already resumed for its parts and its report still differs, the agent does not refuse it again: it maps that report's parts onto the recorded ones, says in section 10 of `review.md` which theme run it mapped and how, and its report names the mapping.
- It removes the duplicates. A work that two theme runs kept, by its DOI, its arXiv ID or its title, gets one entry and one key in `refs.bib`.
- Its annotation is the fuller of the two, with what the other adds.
- Its matrix adds the column Search theme, which names for each row the search themes whose theme runs kept the source, or "merge run" for a source the merge run found.
- It applies the criteria to every source again, as the screening of one set.
- It judges each source a theme run cut at its upper bound on merit.
- It chains backward and tracks forward, layers 2 and 3 of "The four searches", from the core papers that every theme run's search record names. Each round counts as a pass, and the rounds end when condition 4 holds, or after pass 8 with a "search limitation" in the report.
- It searches each pair of search themes that the research question joins, where the methods of one community meet the subject of another, with a search string built from the concepts of both. Each pair search has its row in the search record, with its database, its string, its filters, its date and its count, and its interface in the search log.
- It runs the gates of "Source counts and gates" over the whole set, with the paper type's minimum and the gate Matrix coverage over every part of the research question.
- Its gaps carry each critical gap of a theme run's section 6 whose sources stay in the merged set, with those sources' keys, beside the gaps it finds over the whole set.
- It writes `refs.bib` by copying each kept entry whole, as its `refs-theme-<k>.bib` holds it, or as `lookup.py bibtex` prints it for a source the merge run found. It changes a copied entry only as "The BibTeX entries" allows.
- It runs `lookup.py resolve --entry refs.bib <key>` on every entry of the merged `refs.bib`, the copied entries included, as "The BibTeX entries" says, before the synthesis cites it.
- Its `screened-<list>.txt` files cover the whole set.
- Its `search-log.md` opens with the name of each theme run's `search-log-theme-<k>.md`, which stays in the run folder, and then holds the merge run's own log.
- Its search record gives each theme run's databases, passes, records screened and sources kept. It then gives the merge run's own searches with their counts, and the duplicates removed.
- Its "No entry written" holds every entry a theme run or the merge run took out as not confirmed, with the reason in words, and the report names each one with its line.

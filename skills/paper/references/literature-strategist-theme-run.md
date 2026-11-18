# Literature strategist: a theme run

The literature strategist agent reads this page when the session starts it as a theme run for one search theme of several (`SKILL.md`, Steps 8).

## A theme run

- The agent runs the whole search of `references/literature-strategist.md` for its search theme only.
- Section 1 of its report states by number which of the recorded parts its search theme covers, as "This search theme covers P1 and P3". It uses those parts as `config.md` records them, with their numbers and sentences, and never renumbers, merges, splits or adds one.
- Each annotation it writes carries one field for every recorded part, P1 to Pn, also for a part its search theme does not cover, and its matrix has one column for every recorded part.
- It selects the databases of "The databases" for the fields of its search theme.
- It screens the sources given for its search theme and searches for what they miss.
- It runs the gates of "Source counts and gates" over its own set, with the range of its search theme in place of the paper type's minimum.
- Its gate Matrix coverage reads the themes of its own matrix and the parts its search theme covers. The gate over every part of the question is the merge run's.
- Its search record names its core papers of layer 1, the seeds of its citation chaining.
- It keeps at most the upper bound of its range. When more sources pass, it keeps those with the highest totals of the quick assessment, and its record lists the others as cut at the upper bound, each with its total.
- It fetches and saves every text and page into its subfolder `theme-<k>/` of the temporary folder.
- It writes `refs-theme-<k>.bib` in the run folder by the rules of "The BibTeX entries", and runs `lookup.py resolve --entry` on each entry of that file.
- It writes `search-log-theme-<k>.md` in the run folder, as "The search log" says.
- It writes `review-theme-<k>.md` in the run folder with the sections of "The report" other than the synthesis, the recommended sources by paper section and the AI disclosure. Its headings keep the numbers of that list, so they run 1 to 6, 9 and 10, and it writes no heading for a section it does not write.
- It writes no `review.md`, no `refs.bib`, no `search-log.md` and no patch.
- Its record lists the sources it cut at the upper bound and, under "No entry written", each entry it took out as not confirmed.
- A theme run whose set ends below the lower bound of its range says so in its record, and goes on.
- A theme run resumed after the merge run refused its report is given the recorded parts and the merge run's reason. It rewrites the part fields of its annotations, the part columns of its matrix and the sentence of section 1 with the recorded parts, and changes nothing else.

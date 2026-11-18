# Literature strategist: the sources' review

The literature strategist agent reads this page when the session gives it the outcome of the stop "The sources' review" or a rejected patch.

## The sources' review

When the user answered the stop "The sources' review", the session gives the agent the line it wrote in `config.md` under "Decisions", with the sources the user added or removed, and the agent updates `review.md`, `refs.bib` and its patch.

- An added source is looked up with `lookup.py resolve`, annotated with its part fields, entered in the matrix and given its entry as "The BibTeX entries" says, like an included source. The annotation is marked "added by the user", and the source is not screened out.
- A removed source leaves the annotated bibliography, the matrix, `refs.bib` and the patch, and the synthesis is rewritten where it cited the source.
- The agent rewrites the line of section 11 from the line of "Decisions", as `references/ai-disclosure.md` gives under "The line of a review": a person reviewed the sources the review includes.
- The agent changes nothing else in the files, and it starts no new search.
- A rejected patch is answered the same way: the session gives the agent the rejection as printed, resumed or started fresh, and the agent writes a new patch.

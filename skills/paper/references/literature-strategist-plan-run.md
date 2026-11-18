# Literature strategist: starting from a plan run

The literature strategist agent reads this page when intake took an earlier plan run's outputs.

## Starting from a plan run

In full mode, intake may take an earlier plan run's outputs (`references/intake.md`, "Earlier outputs"). The agent is then also given that run's `chapter-plan.md` and `insights.md`.

- The seeds are the references the chapter plan names under "Seeds for the literature strategist" and the keywords of the evidence in `insights.md`. The agent looks each seed up with `lookup.py` and screens it under the criteria like any source.
- The seeds are added to the search strings' concepts and synonyms. The full search of "The search design" and "The four searches" still runs, and no source is taken without screening.
- A seed that no index returns is named in the report with the searches made, and is not added to `refs.bib`.
- The research question is the one of `config.md`, which the plan run's `thesis_statement` insight informed, and its parts are the ones `config.md` records.

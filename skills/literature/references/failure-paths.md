# Failure paths

Each path below names its trigger and what the run does. No path stops the run to ask the user. The session names each path taken in the message that ends the run.

## Too few sources

- **Trigger.** The search agent keeps fewer than 5 sources after its stopping rule, or fewer than 3 remain after the verification agent removes sources.
- **The expansion.** It adds synonyms and broader terms and adds grey literature such as technical reports and working papers. It widens the date range from 5 years to 10 and tries the vocabulary of adjacent fields. Each of the two triggers below runs it once.
- **Fewer than 5 sources kept by the search agent.** It makes the expansion within its own run.
- **Fewer than 3 sources after verification.** The session starts the search agent once more for the expansion (`SKILL.md` Steps 10). Then it starts the verification agent for the sources the expansion added. The run goes on with the sources kept after that.
- **Still fewer than 5 sources.** `search.md` records "limited literature available" under "Search limitations". The synthesis agent states in the summary and the conclusion that the run is exploratory and the sources are few.
- **No source kept.** The run ends after the verification agent. The synthesis agent writes `report.md` with the method, the statement that no source was kept, and the two sections "Sources not accessed" and "References not confirmed". It writes `sources.md`. The bibliography writer writes an empty `references.bib`. The run leaves these three files in `<out>` and starts no reading agent, no editor agent, no devil's advocate agent and no revision.

## Weak sources

- **Trigger.** `verified.md` grades every kept source at evidence level V or below, or finds no peer-reviewed source. Under the `cs_ml` profile a preprint and a conference paper count as peer-reviewed.
- **The verification agent.** It keeps sources of overall grade D with their weakness stated, excludes sources of grade F, and records "all sources are weak" in its summary.
- **The synthesis agent.** It changes the report in three ways.
  - It writes the report as a preliminary exploration and not as a systematic review.
  - It annotates the evidence level of every source it cites.
  - It adds a section "Evidence quality limitations" after the discussion or the thematic synthesis.

## A conclusion beyond its evidence

- **Trigger.** An issue of the editor or the devil's advocate says that a conclusion goes beyond what the evidence supports.
- **The revision writer.** It flags each such conclusion. For each, it weakens the conclusion to match the evidence, or supports it with a passage already extracted.
- **The second review.** It checks the result. A conclusion still beyond its evidence after the second revision moves to "Acknowledged limitations".

## A critical issue of the devil's advocate

- **Trigger.** A devil's advocate issue has the severity Critical.
- **The revision writer.** It fixes the Critical issues before any other issue.
- **A Critical issue that stands after the second revision.** It is listed first under "Acknowledged limitations", and the editor's decision is not Accept.
- **A Critical issue in both passes.** It is named in the message that ends the run, with the suggestion that the question or the sources may need to be rethought.

## The revision limit

- **Trigger.** After the second revision, an issue of severity Major or above is still open.
- **The second revision writer.** It moves each such issue to "Acknowledged limitations" with what remains and why, and the report stays the final text.
- **The message that ends the run.** It gives the number of issues resolved and the number acknowledged.

## A failed cross-field synthesis

- **Trigger.** The synthesis agent cannot find a meaningful connection between the frameworks of two fields, or cannot reconcile them.
- **The synthesis agent.** It uses the framework of the primary field for the analysis, presents the other field's view in a section "Alternative perspectives", and does not force an integration.
- **The report.** It says in that section why the frameworks differ.

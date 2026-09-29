# Step 5, repair round 1

The reviewer's report is `.scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/agents/reviews/5-refuter.md` in the main checkout (/Users/axelfaes/workspace/ordo); read it whole first. The tree as it stood when the round was sent is `agents/reviews/5-round-0.diff` there. Each point below carries the orchestrator's ruling. The brief, the rules file, the no-git rule and the report path are unchanged; the path list gains `skills/land/SKILL.md`, `skills/plan/templates/orchestrator-state.md` and `README.md` for ruling 4.

1. Standards 1 (when the check runs, and what the commit carries, each stated twice): Steps 5 states when the check runs, and Steps 6 states that the preparation commit carries the report. The subsection "The brief check" opens by pointing at Steps 5 without restating the order, and its item 5 points at Steps 6 for the commit, keeping only what is its own (the `brief_check` record of Steps 9).
2. Standards 2 (the template copies the list of input forms): `skills/spec/templates/brief-check.md`, "6. Implied inputs", points at `templates/brief.md`'s "Cases" for the forms and keeps no list of its own.
3. Standards 3 (two requirements in one bullet): item 4's stop bullet becomes two bullets: the brief is restored to main's copy; the report is among the ledger files the stop commits.
4. Standards 4 (the brief-check agent's usage is recorded but never booked): the brief-check agent's tokens, tool uses and time reach the booking and the landing report.
   - `skills/land/SKILL.md` Steps 9: the booking states the builder's, each reviewer's and the brief-check agent's usage, read from `builder_usage`, `reviewer_report` and `brief_check`; Steps 11's landing report follows it as it does now. `metadata.version` up one patch; its description stays true and at most 1,024 characters.
   - `skills/plan/templates/orchestrator-state.md`: the dispatch entry's keys include `brief_check`, in the place `/spec` Steps 9 lists it.
   - `README.md` lines 17 and 34: the replacements of the report's "Doc text".
   - The report's "Doc text" and its list of sentences that stay true are corrected: `skills/plan-orchestration/SKILL.md` "each agent's tokens" and `/land`'s description hold once `/land` Steps 9 reads `brief_check`, and the report says so with the lines.
5. Standards 5 ("One per `/spec` run"): `skills/plan-orchestration/SKILL.md`, "Brief-check agent": one per `/spec` run that reaches "Steps / The brief check".
6. Declined to judge (Case 3's pattern, the description's missing comma): the description gets the comma, "under libraries: check, look for", if it stays at most 1,024 characters; Case 3 is closed by the builder's broader grep, reported.

After the changes: rerun the verify list through `checks.sh`, the length command and the ASCII grep. Append to the same report a section "Repair round 1" with each item's change, the command that shows it and its output verbatim, the new text quoted, and the updated line counts.

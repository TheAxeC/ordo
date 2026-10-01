# Repair round 1 of step 2

The findings of `agents/reviews/2-refuter.md` and the three points of your report's "Anything in the brief that was wrong or impossible", each with its ruling. Work in the same worktree under the same brief and rules. Run no git command of any kind, read-only ones included: the brief's launch rule is that the builder runs no git command, and your report says you ran `git diff --stat` and `git status --short`. Use `diff` against a copy, or read the files, instead.

1. Standards 1, and your point (1): the record of a reviewer stopped for another model.
   - In `skills/refute/SKILL.md`, remove the Steps 7 sentence "A reviewer stopped for another model is recorded the same way, with `stopped` in place of its usage."
   - Put the rule in Steps 1's stop bullet ("A served model that is not the configured one is the stop ..."): the stopped reviewer is recorded under the dispatch block's `reviewer_report`, a first-run reviewer as `(<agent id>, <served model>, stopped)` and a reviewer over round `<n>` as `over round <n>: <agent id>, <served model>, stopped`; it is written to disk in the main checkout, and the next resume-point commit carries it.
   - A record written later follows the records before it in the field, so a second first-run reviewer's record follows the stopped one's.
   - `skills/land/SKILL.md` Steps 9 already books "each first-run reviewer from `reviewer_report`, a stopped one included"; check that it also books a stopped reviewer over a round, as `reviewer of step <n> over round <r>`, and say so in the bullet if it does not.
   - The case "A first reviewer served another model, stopped, then a second first-run reviewer" must read met after the change.
2. Standards 2, and your point (2): the writers of the Agents section.
   - The sentence under `## Agents` in `skills/plan/templates/plan.md` names every writer: `/land` at a step's booking and when it takes a step back out of main, `/grill` for its lookup agents, `/spec` for a brief-check agent stopped for another model, and `/plan` when it copies the bullets of a rulings file.
   - The **Agents section** term, identical in `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`, adds `spec`, "Steps / The brief check" to its "Stated in".
3. Standards 3: the commit rule of a run over a round.
   - `skills/refute/SKILL.md` "Steps / Over a repair round" 6: the record goes "after the records before it", and is written to disk and carried by the next resume-point commit as Steps 7 says. Keep the form `over round <n>: ...` as it is.
4. Your point (3), the **dispatch entry** term's "Stated in": no change. The term names the places that state a key; `plan-orchestration` Steps 8 and "Resuming, and handing the plan over" point at places already listed, and `land` Steps 9 reads the entry without stating a key.

Then run the brief's "Verify before you report" again, the verify list through `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` from the worktree root, and quote the lines it prints verbatim. Add a section "Repair round 1" to your report at `.scratch/2-e-a-self-rule/agents/reviews/2-report.md`: each ruling, the lines before and after for each change, the case reread, and the verify lines verbatim. Your final message is that section.

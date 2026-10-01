# Repair round 1 of step 3

The findings of `agents/reviews/3-refuter.md`, each with its ruling. Work in the same worktree under the same brief and rules. Run no git command of any kind, read-only ones included; compare against copies of the files taken before your first change in this round. The tree as it stood when this round was sent is the diff `agents/reviews/3-before-round-1.patch` in the main checkout's ledger, against the base `2bf05e5`.

1. Standards 1: `skills/refute/SKILL.md` line 53 restates the model of a run over a repair round without its default.
   - Replace the parenthetical so that it points at the rule rather than restating it. The bullet becomes, word for word:

     ```
        - A served model that is not the configured one is the stop "A model other than the configured one" ("Stops"): the reviewer is stopped through the runner's stop tool, and nothing it wrote is used. The configured one is the `reviewer:` model for the first run, and for a run over a repair round the model "Steps / Over a repair round" 1 gives.
     ```

   - The Stops row (line 163) keeps "the configured value of the key the run was dispatched on (Steps 1)" only if it still reads true against the new bullet; otherwise it says "the configured model (Steps 1)".
   - A block without `repair_reviewer:`, a run over a round served Opus under `reviewer: claude:opus`: no stop, read from the two places.
2. Standards 2: `skills/plan-orchestration/SKILL.md`, the **Dictated text** bullet of Steps 8 (line 110) comes after **Before the resume**, which commits the round's brief.
   - Move the bullet so that it comes before **Before the resume** (skill-layout, "Lists and tables": a step that can stop comes before the step that commits what it guards).
   - Its timing becomes "before the round's brief or the ruling is committed", the same time Steps 6 (line 90) gives a cases ruling.
3. Standards 3: `skills/spec/templates/brief-check.md`, the "Closed" heading (lines 59 and 61) has no form for a dictated line added to the brief after the check, which `spec` line 275 names under "Closed".
   - The heading becomes, word for word: `## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)`
   - A second bullet form follows the first, word for word: `- <a dictated line added after the check, quoted>: holds, or each rule it broke and the rewrite that closed it.`
4. Proof 1: your report's row for verify 4 says DONE, while the brief expected one line per file and the grep prints two lines for `skills/spec/SKILL.md` (262 and 275).
   - In `agents/reviews/3-report.md`, the row and the "Verify 4" section say that the second line comes from item 4's new bullet in `spec` "Steps / The brief check" 4, which names the check, so the brief's "one line for each file" does not hold as written; the check stands on the three lines quoted.

Then rerun the brief's verify list through `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` from the worktree's root, and the greps of verify 2 to 4. Append to `agents/reviews/3-report.md` a section "Repair round 1": each ruling with what changed, its before and after, and the checks' output verbatim. Your final message is that section.

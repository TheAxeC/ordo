# Step 23, repair round 1: the rulings

The round starts from the worktree as you left it. The review is `agents/reviews/23-refuter.md`; read its Spec 1 and Behaviour 1. The brief `agents/briefs/23.md` holds unchanged. Do the two rulings below and nothing else: no other file or sentence changes.

The paths: `skills/spec/SKILL.md`, `skills/land/SKILL.md`, `skills/plan-orchestration/SKILL.md` ("Two steps in flight" and "On every resumption" only), `skills/plan/templates/orchestrator-state.md` (its dispatch comment only), and the report.

## Rulings

1. **A shared file is any file both briefs name** (Spec 1). `skills/spec/SKILL.md` Steps 4: a shared path is a file both briefs name, whatever lines each names. Non-overlapping line ranges are no longer exempt; they go to the orchestrator's judgment like any shared file. `plan-orchestration` "Two steps in flight" and the state template's dispatch comment already say "the same file"; make sure no sentence anywhere still exempts separate line ranges from the judgment.
2. **A stopped worktree removal can be resumed from the ledger** (Behaviour 1). In `skills/land/SKILL.md`, the Stops row "A worktree that cannot be removed" becomes a stop that leaves an open item.
   - The open item names the worktree path and both branches, as Steps 11 read them, and what stopped the removal.
   - It is booked in the state file's open items and committed by path, as any stop is (a resume point).
   - It is resumed by the cause put right, then "Removing a step's worktree" run on the worktree and branches the open item names; the open item is then closed.
   - The bullet under the table that says the last row "leaves no open item" says this instead.
   - `plan-orchestration` "On every resumption" gets the case: a landed step whose worktree is still there is named by its open item, and the removal is run from it.

## Report

Add a section "Repair round 1" to `agents/reviews/23-report.md` in the worktree's copy of the ledger. Give each ruling DONE or NOT DONE, with the changed sentences quoted with file and line. Then rerun the brief's four checks, quoting the last line of the verify run and the grep's output.

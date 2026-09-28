# Step 20, repair round 1: the rulings

The round starts from the worktree as the builder left it. The findings are in `agents/reviews/20-refuter.md`. The brief `agents/briefs/20.md` holds unchanged, and every check of its "Verify before you report" is run again after the round. The paths are the brief's, plus `skills/spec/SKILL.md` (ruling 4).

Each ruling below follows from ruling U 1 (every Codex part of the skills removed), so none is a choice left to the user.

## Rulings

1. **`land.sh`'s `<runs dir>` argument** (Standards 1, the builder's judgment call 1). Remove the argument, its existence check and its place in the usage line from `skills/land/templates/land.sh`. Update every call in `land.test.sh` and remove the fixture nothing reads (`write_session` into the runs folders). Change the README and `skills/land/SKILL.md` sentences that name the argument, if any. A case proves `land.sh` runs with the new arguments; name the revert that turns it red.
2. **`worker_effort`** (Spec 2). Its only reader was the Codex recipe, and the Agent tool takes no effort. Remove the key from `skills/plan/templates/plan.yaml`, `plan.projects.yaml`, `orchestrator-state.md`, the list in `skills/plan/SKILL.md` Steps 4, and every other place `git grep -n worker_effort -- ':!.scratch'` finds. `check_config.py` takes its key set from `plan.yaml`, so the key is then reported as unknown; add a case for it, as for `launch_note`.
3. **A dead builder, and the handover** (Standards 3). In `skills/plan-orchestration/SKILL.md`, say what a dead builder is under the Agent tool: the runner's agent listing no longer shows it and no completion notification with a report arrived, or a later session does not find its agent id in its own listing. Say what is reported to the user in that case: the worktree's `git status --short` and the builder's last message when there is one. Remove "what its transcript holds" or replace it with that. The Anti-patterns row on relaunching a dead builder then reads against this definition.
4. **`skills/spec/SKILL.md:125`** (Standards 2). The sentence on what differs per harness is false; rewrite it so it says what is true now (one runner, one recipe in `plan-orchestration`'s "Launching a builder"), or remove it if nothing true is left to say.
5. **History in test comments and names** (Standards 4). `check_config.test.sh:85` ("Red when the example carries the key again"), the case names `old-launch_note` and `old-worker_allow`, and `pin.test.sh:330` ("Red when the defaults name $d2 again"): say what the case checks and what revert turns it red, in present terms, without "again" or "old".
6. **The report's before and after** (Behaviour 2). Add rows for the Quick start line "continue the plan" (before "on another harness", after "in another session") and for the dispatch block's fields (before the launch fields `prompt`, `output`, `pid`, `exit`, `repair_*`, `cases_*`; after `session_id` as the agent id and `reviewer_report`).

## Not sent back

- `plan.md` line 75 (the models ruling) and `.agents/launch/2b-7` are the orchestrator's, done at landing.
- The links an earlier pin made in `~/.agents/skills` are the user's, since no session edits a skill folder's links; they are raised to the user at the pin of ruling W.
- The brief's line count for `launch-note.md` (35, the file has 34) changes nothing.

## Report

Add a section "Repair round 1" to `agents/reviews/20-report.md` in the worktree's copy of the ledger: each ruling DONE or NOT DONE with the command that proves it, each new or changed case with its revert's first `FAIL:` line quoted, "Verify before you report" rerun and quoted, and the files changed with line counts.

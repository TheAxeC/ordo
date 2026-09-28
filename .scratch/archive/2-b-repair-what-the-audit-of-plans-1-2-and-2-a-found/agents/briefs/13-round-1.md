# Step 13, repair round 1: the rulings

The round starts at the worktree's wip commit 16200ee. The findings are in `agents/reviews/13-refuter.md`. Each ruling stays inside the brief `agents/briefs/13.md`; its conventions, cases, "What it must do" and "Verify before you report" hold for the round unchanged, and the five cases are run again after the round.

## Paths this round writes

The brief's list, unchanged.

## Rulings

1. **The claim audit's constraint and drift checks** (Spec 1; row 155). Read `claim_ref_alignment_audit_agent.md` lines 50, 144, 176-223 and 261-283 and `academic-paper/agents/draft_writer_agent.md` lines 540-575 again, and give the two checks one disposition that holds on the files and agrees with row 58, which says the claim manifests have no successor: either the two checks are dropped with that reason, naming `academic-paper/agents/draft_writer_agent.md` as the file the manifest came from, or they go to `paper` with an input the paper skill has, named by the file whose row takes it. No row outside 147-181 changes.
2. **The orchestrator's parts left without a fate** (Spec 2; row 152). The run-level `slr_lineage` emission (orchestrator lines 497-510), the Style Profile carry-through (line 527) and the experiment-provenance carry-forward (line 452) each get a disposition in the reason: a skill and entry that take it, or dropped with a reason that holds on the lines (for `slr_lineage`, row 95's reason that no skill renders the PRISMA-trAIce anchor, if that holds).
3. **The up-front cost estimate** (Spec 3; row 151). The reason gives SKILL.md line 401 (a token-cost estimate the user confirms before Stage 1) a disposition of its own that holds on that line, kept apart from the round-trip caps of line 403 that `repair_rounds` answers.
4. **The build obligations** (Behaviour 1). The report's "Rows changed" table states, for each changed row, what the new reason asks each later entry to build (entries 5, 7, 13 and 15.A as the review lists them, and whatever rulings 1 to 3 change).
5. **The eight `holds` rows the reviewer did not read** (Not checked): the round's report states, for collaboration_depth_agent, full_pipeline_example, integrity_failure_recovery, mid_entry_example, adapters/overview, plagiarism_detection_protocol, team_collaboration_protocol and pipeline_status_template, the lines that decide each verdict.

## Report

Rewrite `agents/reviews/13-report.md` and `13-rows.md` in the worktree's copy of the ledger to the tree after the round, with a section "Repair round 1" that lists each ruling, DONE or NOT DONE, and the command that proves it. Rerun the brief's "Verify before you report" and the five cases in full and quote them.

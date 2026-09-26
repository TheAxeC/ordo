# Step 12, repair round 1: the rulings

The round starts at the worktree's wip commit 116df6d. The findings are in `agents/reviews/12-refuter.md`. Each ruling stays inside the brief `agents/briefs/12.md`; its conventions, cases, "What it must do" and "Verify before you report" hold for the round unchanged, and the five cases are run again after the round.

## Paths this round writes

The brief's list, plus `docs/academic-coverage.md` lines 14-18 (the mark definitions, ruling 6).

## Rulings

1. **The sprint section of the five agent rows** (Spec 1, Behaviour 1; rows 122-126). Each agent row sends to entry 15.A only what row 140 gives it, the pre-commitment rule, in the words row 120 uses; the contract-driven decision (the `failure_conditions` evaluation and its authority over the decision, e.g. eic_agent.md:77-80) is dropped with row 140's reason. No row sends to 15.A a part another row drops.
2. **The cross-model option** (Spec 2; rows 126 and 131). Read devils_advocate_reviewer_agent.md around line 348 and calibration_mode_protocol.md:49 and 191-193 again, and give the cross-model option one disposition with a reason that holds on the files: what the option does (a second model on an external provider reviewing the manuscript), and either the skill and entry that build it or why no new skill needs it. A missing how-to file is not by itself a reason. Row 131 names its cross-model default with the same disposition.
3. **The phase folders** (Spec 3; rows 122-127). The pipeline phase folders are dropped for the reason row 120 gives (`researcher`, entry 13, owns the order of stages); "not installed" is said only of `scripts/check_pipeline_integrity.py`.
4. **SKILL.md's other sections** (Spec 4; row 120). Version Info and Related Skills get a reason of their own that holds on SKILL.md:395-402 and 416-424; SKILL.md:68 (`shared/mode_spectrum.md`) is named with its disposition. Record 1 cites the dropped ranges exactly, without 406-412.
5. **The skill named with every 15.A deferral** (Spec 6; rows 120-127 and 140): each names `paper-review` at entry 15.A and the `rebuild later` file that carries the part.
6. **A part of a `rebuild` file deferred to a later entry of the same skill** (Spec 8). Add one sentence to the mark definitions of `docs/academic-coverage.md` (lines 14-18), after the `rebuild later` line: a part of a `rebuild: <skill>` file that the skill's first gate does not need may go to entry 15.A, named in the reason with the `rebuild later: <skill>` file of the same skill that carries it, so 15.A builds it when it builds that file. Check every row of the whole document that sends a part to entry 15.A (`grep -n '15\.A' docs/academic-coverage.md`) against that sentence, and report any that does not name such a file; do not change rows outside 116-146, list them in the report.
7. **The records and the report** (Proof 1, 2): the largest-sentence command is quoted so it runs as written; record 1's ranges are exact; each changed row's record states the new disposition.
8. **The eight `holds` rows the reviewer did not read** (Not checked): the round's report states, for interdisciplinary_review_example, hei_paper_review_example, editorial_decision_standards, review_criteria_framework, statistical_reporting_standards and the three templates, the lines that decide each verdict.

## Report

Rewrite `agents/reviews/12-report.md` and `12-rows.md` in the worktree's copy of the ledger to the tree after the round, with a section "Repair round 1" that lists each ruling, DONE or NOT DONE, the command that proves it, and for ruling 6 the rows outside 116-146 that name no carrying file. Rerun the brief's "Verify before you report" and the five cases in full and quote them.

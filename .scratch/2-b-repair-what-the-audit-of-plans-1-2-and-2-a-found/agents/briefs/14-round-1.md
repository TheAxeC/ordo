# Step 14, repair round 1: the rulings

The round starts at the worktree's wip commit 93ae923. The findings are in `agents/reviews/14-refuter.md`. Each ruling stays inside the brief `agents/briefs/14.md`; its conventions, cases, "What it must do" and "Verify before you report" hold for the round unchanged, and the five cases are run again after the round.

## Paths this round writes

The brief's list, which now also holds `docs/academic-coverage.md` line 55 (ruling 4).

## Rulings

1. **The ethics parts with no destination** (Spec 1; rows 190 and 218). Ethics training (`ethics_review_agent.md:108`, `ethics_checklist.md:190`), the AI-specific data checks (`ethics_checklist.md:133-137`), and the agent's review-level determination and vulnerable-population protections (`ethics_review_agent.md:104, 107`) each get a disposition in the row of the file that holds them: the skill and entry that take it, or dropped with a reason that holds on the lines.
2. **The Layer 5 questions' rebuttal reader** (Spec 2; row 197). Read `socratic_mentor_agent.md:257`, `academic-paper-reviewer/SKILL.md:153-160` and row 120, and name the `rebuttal` consumer (entry 7) with the part it takes, beside the paper-anchored questions that go to 15.A.
3. **The timeline sidecar files** (Spec 3; row 200). The phase folders keep the stage-order reason; the sidecar files (`timeline_extraction_agent.md:18-20`) get a disposition of their own that holds on the lines, taking into account that `report_compiler_agent.md:114-116` reads them for the temporal rule row 193 keeps.
4. **The abstract-only protections** (Spec 4; rows 193 and 55). Row 55 (`academic-paper/agents/abstract_bilingual_agent.md`, `rebuild: paper`) names the abstract-only protections row 193 sends it, so the part is recorded on the receiving row; row 55's other content stays, and its sentences stay within about 35 words. The case that checks the lines outside the section unchanged now allows line 55 and no other line.
5. **Record 42** (Spec 5; row of `references/socratic_mode_protocol.md`). The reason is made to hold on the 15-round end at protocol line 67 against the mentor's lines 549, 597 and 598: name where that rule goes, or why it is dropped.
6. **The repeated sentence** (Standards 1; rows 187, 189, 190, 194, 195, 198, 199, 200). Each row says what happens to its own pipeline parts in its own words, as the rows at lines 122-127 do; no sentence shape recurs across the rows, and no destination or reason is lost.
7. **The style profile** (Behaviour 4; rows 186 and 193). Both rows state the style profile as optional, applied when one is available, as deep-research SKILL.md:19 and report_compiler_agent.md:86-88 say, so the literature skill does not wait on entry 5.
8. **The report** (Standards 2 and 3; Behaviour 2): the report quotes the lines the verify runner printed, lists every file changed with its line count, and names roadmap line 122 (entry 15.A's "Waits on" 13, false once no `rebuild later: researcher` row is left) beside line 120.
9. **The twenty `holds` rows the reviewer did not read** (Not checked): the round's report states, for each of them, the lines that decide the verdict.

## Report

Rewrite `agents/reviews/14-report.md` and `14-rows.md` in the worktree's copy of the ledger to the tree after the round, with a section "Repair round 1" that lists each ruling, DONE or NOT DONE, and the command that proves it. Rerun the brief's "Verify before you report" and the five cases in full and quote them.

# Landing of step 8 of plan 3

Roadmap entry 3, the writing base. Step 8 of 10, the fourth runs, the last runs: landed, unticked, its check failed. Next: step 9, the last fixes (`/spec 3 9`), which ruling I runs because step 8 leaves failures.

## Open items

none

## The check before landing

No agent of the step was still running: the runner's agent listing showed no subagent, only two peer sessions outside this plan. The builder was inline (the session).

## NOT DONE

The step's check does not hold. 48 manuscript rows and 35 grant rows are not marked right by both markers; both markers mark 27 and 24 of them wrong. Gate conditions 2, 5 and 6 fail; 1, 3, 4 and 7 hold, condition 4 with the turn shape changed at the user's instruction. Step 8 stays unticked, and by ruling I step 9 fixes each failure in `skills/writing/` with no further run.

## What landed

The records of the fourth runs, all in the ledger: `agents/reviews/8-run/` (the two review reports, the four markers' marks and the three resume replies), `agents/reviews/8-marks.md` (228 manuscript rows and 74 grant rows), `agents/reviews/8-report.md`, `agents/reviews/8-refuter.md` with the run over round 1, this report, the booking in `plan.md` and the state file. The range a34bfbf..3-the-writing-base-8 holds no commit (`land.sh`: `nothing to copy`).

## What was found

- Condition 2: the group lines of manuscript groups 6, 11 and 14 and grant groups 1, 3, 5, 9 and 15 name no loss the draft shows.
- Condition 5: the tense entry at `b_implementation.tex:3` is a reference to finding 6.4, finding 5.2 gives an instruction, and three places are given twice.
- Condition 6: manuscript marker 1's third command printed draft lines; manuscript marker 1's first command and grant marker 1's third ran `grep` on the saved report; the grant marker prompts lacked the brief's `grep` rule; 17 marks have no reason of their own.
- The kinds of rows not marked right by both are in `8-report.md`, "The rows not marked right by both".
- The run over round 1 found Proof 1, Standards 1 and Standards 2 in the record, all fixed at landing.

## Fixes at landing

1. `8-report.md` and `8-marks.md`: the judgment call on reasons read alike for every marker leaves 17 marks without a reason of their own (manuscript marker 1's 12.1 to 12.9 and 14.2 to 14.5, manuscript marker 2's 14.2 to 14.4, grant marker 1's 16s), listed as failures of condition 6.
2. `8-report.md`, C11 names each marker it means.
3. `8-report.md`, the statement that entry numbers are 1-based stands before the first entry number.
4. `8-report.md`, "Files" line counts refreshed.

## Verification on main

`sh skills/land/templates/land.sh .scratch/3-the-writing-base/orchestrator-state.md 3-the-writing-base-8 a34bfbf` exit 0, and `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/3-the-writing-base/orchestrator-state.md` after the fixes: `PASS: land.sh scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `ok: the plan-terms block equals the template`, `PASS: pin.sh scratch tests`, the character-set check printing nothing, `checks: 6 commands passed`. The brief's checks 1 to 4 after the fixes: character-set check exit 0, `diff exit 0`, `cmp exit 0`, research-hub status and worktree status printing nothing. A/B: none. Look: none configured.

## Agents' usage

Brief check a4f02d8519832d0b6 claude-opus-5-5 218117 tokens, 45 tool uses, 7.1 min; builder inline (the session); review agents ad512c438c546f57c 179068 tokens, 38 tool uses, 28.7 min and ab89cdca00b160e9a 175667 tokens, 6 tool uses, 15.8 min; markers a8f3e0b981dc00ca4 285965 tokens, 43 tool uses, 21.0 min (333087 tokens in total, 18 tool uses, 2.6 min on its resume in round 1), aa83277990558acd9 213568 tokens, 40 tool uses, 29.4 min (232869 tokens in total, 1 tool use, 2.4 min on its resume), a5b964c740016412e 192438 tokens, 9 tool uses, 15.0 min (209838 tokens in total, 4 tool uses, 1.3 min on its resume) and a136ed68531e76d65 166605 tokens, 7 tool uses, 11.3 min; reviewer aa417a503739647c4 claude-opus-5-5 94498 tokens, 87 tool uses, 11.3 min; reviewer over round 1 ab480b5eb42266865 claude-sonnet-5-5 175986 tokens, 49 tool uses, 4.9 min.

The builder's first report did not pass its bar: the first review's Spec 1 and Proof 1 to 5 were closed in repair round 1, and the run over round 1's three findings at landing.

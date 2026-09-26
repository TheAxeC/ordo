# Landing: step 14 of plan 2.B, the coverage rows of deep-research

## Open items

- Open item M (step 10): the roadmap diff of step 10 for approval (now changes 1-7, change 7 being entry 15.A's goal counts and its wait on 13, which this step made false), and two choices (the order of entries 5 and 9; where the cover letter and blind-review removal go). Full text in `orchestrator-state.md`.
- Open item N (step 7): the account of step 7's shell-launched builder, and the oculus Agents view check. Full text in `orchestrator-state.md`.

Booked, no ruling needed: 3 items, carried by step 10 and the findings of steps 2 and 3's builders (`orchestrator-state.md`, "Booked, no ruling needed").

## NOT DONE

Nothing of step 14.

## What landed

Step 14 in the commit that carries this report: `docs/academic-coverage.md`, the deep-research section (23 rows) and row 55 of academic-paper, with the records `agents/reviews/14-rows.md` (52: 23 fixed, 29 hold). Six marks changed, among them the two ethics rows of the audit's finding 13, now `rebuild: paper`. The booking in `plan.md`, "Step 14", gives the before and after of the mark counts and of what entries 5 and 9 build.

## What was found

- The first review: 13 findings, sent back in repair round 1 with 9 rulings, each closed in the round (`agents/reviews/14-refuter.md`, Closed).
- The review over the round: 7 findings, fixed at landing, the main one that the phase-folder sentences gave the order of deep-research's own phases to `researcher`.
- Roadmap lines 120 and 122 (entry 15.A) are false after this step; open item M carries their correction as change 7.

## Verification

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` on main printed the lines quoted in the booking, ending `verify: 13 commands passed`, and exited 0. The coverage check printed `ok: docs/academic-coverage.md`.

## Next

Step 15's builder is running; step 16 follows its landing; steps 10 and 7 wait on open items M and N.

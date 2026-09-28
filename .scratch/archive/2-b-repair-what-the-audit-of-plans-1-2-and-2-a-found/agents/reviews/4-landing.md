# Landing: step 4 of plan 2.B, launch.sh

## Open items

- none.

Booked, no ruling needed: 6 items, carried by steps 1a, 1c, 6a, 14 and the findings of steps 2 and 3's builders (`orchestrator-state.md`, "Booked, no ruling needed").

## NOT DONE

Nothing of step 4.

## What landed

Step 4 in the commit that carries this report: `skills/plan-orchestration/templates/launch.sh` and `launch.test.sh`, `skills/plan-orchestration/SKILL.md`, `templates/launch-note.md`, `skills/plan/templates/orchestrator-state.md`, the archived inventory of plan-orchestration, and `README.md` lines 43 and 121. The booking in `plan.md`, "Step 4", says what each does, with the before and after of every user-visible change.

## What was found

- The first review: 10 findings, sent back in repair round 1 with 10 rulings, each closed in the round (`agents/reviews/4-refuter.md`, Closed).
- The review over the round: 10 findings, fixed at landing: the test-only environment variable removed; the runner's handlers set before its fork; cases for TERM while the note's `start` is being started and for the launcher's pid in the lock file; the lock file in `SKILL.md`; perl in `README.md`'s requirements; `README.md:121` as one sentence; the report brought to the landed tree.
- A red line at landing: "land sequence with KILL: no exit file" under three test runs at once. Fixed at landing: the runner starts one python3 session scanner and asks it over a pipe, the grace loop no longer rescans, and the runner passes its own pid to the scanner as a copied string so it leaves itself out of its sweep; a check in the signal cases is red when the runner stops itself.
- Each fix at landing is proved by a revert that turns `launch.test.sh` red, with its first FAIL line in `4-refuter.md`, Closed.

## Verification

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` on main: ten `PASS:` lines, ten `ok:` lines, `verify: 12 commands passed`, exit 0. Three runs of `launch.test.sh` at once: three `PASS: launch.sh scratch tests`.

## Next

Step 6a lands next, with its round review's three findings fixed at landing; step 11's repair round 1 is with its builder; then 1a alone, then 1c.

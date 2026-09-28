# Landing: step 12 of plan 2.B, the coverage rows of academic-paper-reviewer

## Open items

- Open item M (step 10): the roadmap diff of step 10 for approval, and two choices (the order of entries 5 and 9; where the cover letter and blind-review removal go). Full text in `orchestrator-state.md`.
- Open item N (step 7): the account of step 7's shell-launched builder, and the oculus Agents view check. Full text in `orchestrator-state.md`.

Booked, no ruling needed: 4 items, carried by steps 10 and 14 and the findings of steps 2 and 3's builders (`orchestrator-state.md`, "Booked, no ruling needed").

## NOT DONE

Nothing of step 12.

## What landed

Step 12 in the commit that carries this report: `docs/academic-coverage.md` (the academic-paper-reviewer section, the mark definitions on lines 14-15, and rows 54 and 60 of academic-paper), with the records `agents/reviews/12-rows.md` (26: ten fixed, 16 hold). No mark changed. The booking in `plan.md`, "Step 12", says what changed and the before and after of what entry 15.A builds.

## What was found

- The first review: 10 findings, sent back in repair round 1 with 8 rulings, each closed in the round (`agents/reviews/12-refuter.md`, Closed). Ruling 6, the orchestrator's, adds to the mark definitions that a part of a `rebuild` file may go to entry 15.A named with its carrying `rebuild later` file, which is what steps 11 and 12's rows do.
- The review over the round: 7 findings, fixed at landing, among them rows 54 and 60 of academic-paper naming their carrying files.

## Verification

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` on main: eleven `PASS:` lines, ten `ok:` lines, `verify: 13 commands passed`, exit 0. The coverage check printed `ok: docs/academic-coverage.md`.

## Next

Steps 13 and 14 (the coverage rows of academic-pipeline and deep-research); step 15's builder is running; steps 10 and 7 wait on open items M and N.

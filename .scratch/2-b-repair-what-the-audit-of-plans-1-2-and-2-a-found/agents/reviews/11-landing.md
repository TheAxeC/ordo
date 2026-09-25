# Landing: step 11 of plan 2.B, the coverage rows of academic-paper

## Open items

- none.

Booked, no ruling needed: 6 items, carried by steps 1a, 1c, 10, 14 and the findings of steps 2 and 3's builders (`orchestrator-state.md`, "Booked, no ruling needed").

## NOT DONE

Nothing of step 11.

## What landed

Step 11 in the commit that carries this report: `docs/academic-coverage.md` lines 50-115 (50 of 61 rows corrected, three marks changed), `docs/roadmap.md:120`, and ruling 2e's named exception in `skills/repo-setup/templates/docs/dev/prose-standard.md`. The records are in `agents/reviews/11-rows.md`, the rows that change what entry 5 or 15.A must build in `agents/reviews/11-report.md`, and the booking in `plan.md`, "Step 11".

## What was found

- The first review: 10 findings, sent back in repair round 1 with 12 rulings, and one booked at step 14 (the ethics rows are deep-research rows).
- The review over round 1: 13 findings; the shortening of the reason cells had removed destinations, so brief item 1 was unbuilt again and too large to fix at landing, and repair round 2 ran as the one round beyond the cap, with 12 rulings.
- The review over round 2: 14 findings, fixed at landing (rows 54, 57, 59, 60, 64, 66, 68, 77, 81 and 96, records 4, 7, 13, 15 and 28, the report), and one booked at step 10 (the cover letter against roadmap entry 14).
- A premise of the brief was wrong: ruling 2e limits the length of a sentence in a reason cell, not of the cell. The brief and the prose standard now say so.

## Verification

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` on main: ten `PASS:` lines, ten `ok:` lines, `verify: 12 commands passed`, exit 0. The coverage check prints `ok: docs/academic-coverage.md`; `11-rows.md` holds 61 records, the 50 changed rows equal the 50 `fixed` records, and no sentence of the section's reason cells is over 35 words.

## Next

Step 1a, alone; then 1c; then 10, 12 and 15.

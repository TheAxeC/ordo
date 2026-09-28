# Landing: step 1a of plan 2.B, the verify runner moved into the land skill

## Open items

- none.

Booked, no ruling needed: 5 items, carried by steps 1c, 10, 14 and the findings of steps 2 and 3's builders (`orchestrator-state.md`, "Booked, no ruling needed").

## NOT DONE

Nothing of step 1a. The installed land skill gets `verify.sh` only when a tag holding it is pinned with `utils/pin.sh <tag>`, which is the user's decision and is not part of this step.

## What landed

Step 1a in the commit that carries this report: `skills/land/templates/verify.sh` and `verify.test.sh` (moved from `utils/`), `skills/land/templates/land.sh` and `land.test.sh`, the land, refute and plan-orchestration skills, the brief, state and change-standard templates, `README.md`, `docs/dev/building.md` and `docs/dev/change-standard.md`, and this ledger's verify list. The booking in `plan.md`, "Step 1a", gives the before and after of each user-visible change.

## What was found

- The first review: 7 findings; two kept as built, five closed in repair round 1, whose rulings are in `agents/briefs/1a-round-1.md` (the step widened to `land.sh` and its test).
- The review over the round: 7 findings; one kept (the preflight refusal of a missing state file), six fixed at landing, among them `land.sh` failing a red verify list with exit 1 instead of `verify.sh`'s own status, proved by the new case "unusable state file".
- The builder ran one read-only git command against the main checkout in its first run, which the brief forbids; it changed nothing.

## Verification

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` on main: ten `PASS:` lines, ten `ok:` lines, `verify: 12 commands passed`, exit 0.

## Next

Step 1c, alone; then 10, 12 and 15.

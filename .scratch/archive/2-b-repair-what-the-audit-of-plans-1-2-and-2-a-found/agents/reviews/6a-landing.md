# Landing: step 6a of plan 2.B, collect_findings.py keeps every item

## Open items

- none.

Booked, no ruling needed: 5 items, carried by steps 1a, 1c, 14 and the findings of steps 2 and 3's builders (`orchestrator-state.md`, "Booked, no ruling needed").

## NOT DONE

Nothing of step 6a.

## What landed

Step 6a in the commit that carries this report: `skills/plan-retro/templates/collect_findings.py` and its test, `skills/plan-retro/SKILL.md`, `skills/plan-retro/templates/retro.md` and `README.md:119`. The booking in `plan.md`, "Step 6a", says what each does, with the before and after of every user-visible change.

## What was found

- The first review: 7 findings (Spec none), sent back in repair round 1 with 6 rulings, each closed in the round (`agents/reviews/6a-refuter.md`, Closed).
- The review over the round: 3 findings, fixed at landing: a `### Closed` subsection fixture that turns the test red without the `closed` entry of `NOT_READ`; `SKILL.md:74` and `README.md:119` name the list before a round's subheadings as unread only when a subheading is one of the four headings; the report's sentence count and the control of the `closed` entry.

## Verification

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` on main: ten `PASS:` lines, ten `ok:` lines, `verify: 12 commands passed`, exit 0.

## Next

Step 11's repair round 1 goes to its review; then 1a alone, then 1c.

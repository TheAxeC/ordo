# Step 6 landing: collect_findings.py

## Open items

- none.

Booked list: 7 entries, carried by steps 1a, 1b, 4 and 6a and by the landings of the steps that hold the stale lines (the state file, "Booked, no ruling needed").

## NOT DONE

Nothing of step 6's brief. The collector's narrower no-finding and closure forms, the tests for two heading suffixes and for `--exclude-listed`'s entry checks, and the complete list of archived items that report no defect are step 6a; the `refute` text on what a list item under the four headings is goes into step 1a.

## What landed

`skills/plan-retro/templates/collect_findings.py` and its test, `skills/plan-retro/SKILL.md`, `templates/retro.md` and the `README.md` bullet of the test, in the commit that carries this file. The booking in `plan.md` ("Step 6, collect_findings.py") says what each does and quotes the runner's output: `verify: 12 commands passed`, exit 0.

## What was found

- The first review: 10 findings, closed in repair round 1 under 7 rulings.
- The review over round 1: 4 fixed at landing, 5 booked as step 6a, 1 into step 1a (`6-refuter.md`, Closed).
- The review of the landing fixes (`6-landing-review.md`): 10 findings, fixed at landing.

## Next

Steps 4 and 8 are with their builders; 9 and 6a start as slots free; 1a runs alone after 4 and 8 land.

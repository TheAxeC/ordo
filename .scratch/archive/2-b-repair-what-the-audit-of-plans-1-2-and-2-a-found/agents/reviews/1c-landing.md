# Landing: step 1c of plan 2.B, a brief checked against its own cases and its paths against the steps in flight

## Open items

- none.

Booked, no ruling needed: 4 items, carried by steps 10 and 14 and the findings of steps 2 and 3's builders (`orchestrator-state.md`, "Booked, no ruling needed").

## NOT DONE

Nothing of step 1c. Not exercised: a real `/spec` run through the new Steps 4, and a builder handing back a wrong case through `plan-orchestration` Steps 6; both are covered by the texts and by `check_paths.test.sh`, not by a live run.

## What landed

Step 1c in the commit that carries this report: `skills/spec/templates/check_paths.py` and `check_paths.test.sh` (47 cases), `skills/spec/templates/brief.md`, `skills/spec/SKILL.md`, `skills/refute/SKILL.md`, `skills/plan-orchestration/SKILL.md`, `skills/plan-help/SKILL.md`, `skills/plan/templates/orchestrator-state.md`, `README.md`, `docs/dev/building.md` and `docs/dev/change-standard.md`; this ledger's verify list runs the new test. The booking in `plan.md`, "Step 1c", says what each does, with the before and after of every user-visible change.

## What was found

- The first review: 8 findings, sent back in repair round 1 with 8 rulings, each closed in the round (`agents/reviews/1c-refuter.md`, Closed). The builder's open question, a dispatch block written as a single mapping, was ruled by the orchestrator: the script reads it as one entry.
- The review over the round: 4 findings, fixed at landing: `refute` reads a cases ruling with the brief; `spec`'s preflight refuses a user change on `plan.md` or at the brief's path; the resume on a cases ruling follows the whole of Steps 8's resume with the `cases_` prefix; this ledger's dispatch `round:` line rewritten as valid YAML.
- A premise of the brief corrected: the dispatch block is in the state file's second `yaml` block.

## Verification

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` on main: eleven `PASS:` lines, ten `ok:` lines, `verify: 13 commands passed`, exit 0.

## Next

Steps 10, 12 and 15, each briefed with the new "Cases" and "Paths this step writes" sections and checked by `check_paths.py` before dispatch; 13 and 14 after 12; 7 after the oculus launch-note fixes; then 16 to 19.

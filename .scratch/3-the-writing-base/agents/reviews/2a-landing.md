# Step 2a landing report

Roadmap entry 3 (The writing base). Plan step 2a of 7: the checking script finished. Next: step 4, the `writing` skill.

## Open items

- None.

## The check of Steps 1

The runner's agent listing (ListAgents) showed the round's reviewer as completed and no subagent running. The builder had finished. The peer session research-hub-20 is not an agent of this step.

## NOT DONE

- Nothing inside step 2a.

## What landed

- `skills/writing/templates/check_prose.py` and `check_prose.test.sh`: every branch has a case that fails without it, except the empty-cell guard of a LaTeX table, removed as reached by no input's output. One-command LaTeX lines that carry prose (the eight prose commands and switch groups) are counted for semicolons, and other one-command lines stay data rows (ruling E). A code span ends the contrast window. Six throat-clearing phrases are added.
- `skills/writing/references/anti-patterns.md`: the six phrases are listed as found by the script, and the one-sentence contrast row is corrected (ruling D).
- `skills/land/templates/land.test.sh` and the ledger's copy: the runs under a scratch HOME keep the caller's Python user site (ruling F).
- Verification on main after the fixes at landing, with no PYTHONUSERBASE set: seven `PASS:` lines, `verify: 8 commands passed`.

## What was found

- The first review: 2 Spec, 2 Standards and 3 Behaviour findings, and the red verify list raised as open item F, closed in repair round 1.
- The review over round 1: 1 Spec, 1 Proof and 1 Standards finding, fixed at landing, 5 fixes in all with the ledger copies. Each disposition is under the Closed heading of `2a-refuter.md`.

## What is next

- `/spec 3 4`, the `writing` skill, with its build, review and landing. Then step 5 on the named draft `research-hub/funding/2026-fwo-senior-transplant/proposal/main.tex`.

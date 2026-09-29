# Step 5 landing report

Roadmap entry 2.C, scripts compute facts, and /writing is removed; plan step 5 of 8, the rules; next: step 8, the closing.

## Open items

None.

## Agents stopped

The runner's agent listing (ListAgents) showed no builder or reviewer of the step left, before the worktree was committed.

## Not done

Nothing inside the step. The step's gate, the user's reading and approval of the rewritten rules, is held for step 8, the closing.

## What landed

- The section "Scripts compute facts; judgment is read" in `docs/dev/change-standard.md` and `skills/repo-setup/templates/docs/dev/change-standard.md`, and the same rule in `skills/repo-setup/templates/shared-rules.md`.
- Rules 1, 6, 13 and 15 of both change standards and the test-beside line of Ordo's rewritten under it; a ledger file cites a page by its section.
- Under open item E, ruled (a): "code" where Ordo's change standard says "script", in the two template files; "a code step (a script, or a product's code)" in the brief template, `/spec` and `/refute`.
- `/plan-orchestration`'s recurring-findings pass and `/plan-retro`: a rule sentence or a text change first, a check only for a fact a machine computes, with the user's approval.
- The brief template's Cases paragraph; `/refute`'s Proof heading, its places of a finding and its report template.
- The ASCII check keeps a non-zero exit when perl dies, in `docs/dev/building.md`, `docs/dev/change-standard.md` and the plan's state file; `__pycache__/` in `.gitignore`.
- `README.md` lines 22 and 40, `skills/plan-help/SKILL.md` line 75 and `skills/spec/SKILL.md` line 94 carried to the change.

## What was found

- First review: three spec, one proof, eight standards and one behaviour finding; each closed in repair round 1 or at landing, or raised as open item E (`agents/reviews/5-refuter.md`, Closed).
- Run over round 1: one spec, one standards and two behaviour findings, all on the builder's report, fixed at landing.

## Verification on main

`sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md`, after the fixes at landing: `PASS: land.sh scratch tests`, `PASS: checks.sh scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`, `PASS: check_coverage.py scratch tests`, `checks: 7 commands passed`, exit 0.

## Usage

Builder claude:opus 152802 tokens, 42 tool uses, 535 s (round 0) and 177778 tokens, 13 tool uses, 171 s (round 1); reviewer claude:opus 180529 tokens, 38 tool uses, 484 s, and over round 1 148531 tokens, 36 tool uses, 330 s. First report passed its bar: no. Fixes at landing: 4, and open item E.

## Next

Step 8, the closing: the user reads and approves the rewritten rules, every clause of the gate is run, `/roadmap done 2.C`, the ledger moved to `.scratch/archive/`, then v2.3.0 tagged and pinned on the user's yes.

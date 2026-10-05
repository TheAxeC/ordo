# Step 1 landing

Roadmap entry 2.1, Scripts cut to their jobs; plan step 1 of 4, the rules in text; next: step 2, the gate clauses of entries 3, 4, 7, 8 and 16, once `utils/pin.sh v3.0.0` has run.

## Open items

none

## The landing

- Agents stopped: the runner's agent listing showed the builder and every reviewer of the step completed, none running.
- NOT DONE: nothing in the brief. The pin is the user's: `utils/pin.sh v3.0.0`.
- Landed in one commit: the case rule, rule 15 and rule 6 in both copies of the change standard; the glossary entry **small text step** and the entries that follow it; the brief template, the brief-check template, and `spec`, `refute`, `plan-orchestration`, `land`, `diagnose`, `ordo-help`, `README.md` and the `plan` skill's state template saying what a small text step gets, and that the builder and the reviewer run the checks the brief names while the whole verify list runs once at landing on main; the two figure labels; the versions spec 4.0.0, refute 3.0.0, plan-orchestration 4.0.0, land 2.0.0, diagnose 2.0.0, repo-setup 3.0.0, ordo-help 3.0.0, plan 3.0.0.
- Found: the first review's 6 findings, closed in repair round 1; the run over the round's 3 findings, fixed at landing; the shared-rules template's missing case rule, Open item B, ruled (a), carried by step 3.
- Verification on main, `sh skills/land/templates/checks.sh .scratch/2-1-scripts-cut-to-their-jobs/orchestrator-state.md`, after the fixes at landing: a PASS line for each of the ten test scripts, `ok: the plan-terms block equals the template`, the character-set check printing nothing, `checks: 12 commands passed`, exit 0.
- Next: the user runs `utils/pin.sh v3.0.0`; then `/spec 2.1 2`, a small text step under the new rules.

## Usage

- Brief check: claude-opus-5-5, 183460 tokens, 50 tool uses, 7.7 min.
- Builder: claude-sonnet-5-5, 318582 tokens, 80 tool uses, 16.8 min; round 1 346610 tokens, 17 tool uses, 4.0 min.
- Reviewer: claude-opus-5-5, 192454 tokens, 56 tool uses, 8.8 min. Over round 1: claude-sonnet-5-5, 177472 tokens, 41 tool uses, 9.3 min.
- The builder's first report did not pass its bar (6 findings). Fixes at landing: 3.

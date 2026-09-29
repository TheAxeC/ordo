# Step 6 landing report

Roadmap entry 2.C (Scripts compute facts, and /writing is removed). Plan step 6 of 8: the tests of the kept scripts held to the rule. Next: step 5, the rules, then step 7, the roadmap.

## Open items

None.

## Agents stopped

The runner's agent listing, before anything in the worktree was committed, showed no subagent of the step left: the builder and both reviewers had finished.

## Not done

Nothing of the step.

## What landed

- The four test files hold only cases whose failure costs lost work, a broken installation, or a wrong configuration or coverage list accepted: `utils/pin.test.sh` 383 lines (from 548), `skills/ordo-init/templates/check_config.test.sh` 125 (from 159), `skills/repo-setup/templates/sync_rules.test.sh` 180 (from 272), `utils/check_coverage.test.sh` 190 (from 486), before the two lines the fixes at landing removed. The removed cases and their reasons are the tables of `agents/reviews/6-report.md`, approved by the user.
- The strengthened cases: the not-UTF-8 CLAUDE.md is left byte for byte; a pin into a folder that is not a worktree leaves the live clone on its branch; a coverage list missing a file `find` cannot read is refused; the local-changes and foreign-link refusals leave the tag and the links as they were.
- `utils/pin.sh` line 69 deleted (open item D), and its two comments rewritten to the resolved-path comparison.

## What was found

- First review: two spec, one proof and two standards findings; closed in repair round 1, except `utils/pin.sh` line 69 (open item D, ruled) and rule 15 (carried to step 5).
- The run over round 1: one proof and three standards findings, fixed at landing.

## Verification on main

`sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md`, after the fixes at landing, printed the six `PASS:` lines, the ASCII check's empty output and `checks: 7 commands passed`, exit 0. `sh utils/pin.sh` printed `pinned: v2.2.0, 10 skills linked in: /Users/axelfaes/.claude/skills`, exit 0.

## Usage

- Builder, claude:opus: 276577 tokens, 45 tool uses, 1767 s (round 0); 317837 tokens, 15 tool uses, 641 s (round 1).
- Reviewer, claude:opus: 211445 tokens, 37 tool uses, 804 s; over round 1, 164110 tokens, 28 tool uses, 361 s.
- First report passed its bar: no. Fixes at landing: 4, and open item D.

## Next

Step 5, the rules, widened by open item C; step 7 waits on the user's approval of its roadmap diff.

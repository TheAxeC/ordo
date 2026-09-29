# Step 3 landing report

Roadmap entry 2.D (the plan skills take the comparison's process changes). Plan step 3 of 10: briefs and reports. Next: step 4, the roadmap and plan checks.

## Open items

- B (2026-09-29, step 3): whether the brief's list of inputs a step implies but never states covers product code as well as scripts. Your ruling row 4 says "for a step that builds a script", and step 3 landed with that wording in `skills/spec/templates/brief.md`, "Cases", and `skills/spec/SKILL.md`, Steps 4. The brief template serves every repository `/repo-setup` sets up, and its own "Cases" paragraph already speaks of "a code step (a script, or a product's code)". Options: (a) keep "a step that builds or changes a script"; pro: exactly your ruling, and briefs for product code stay shorter; con: in a product repository a step that changes a parser or an API handler gets no list of the inputs it implies, which is where a missed empty value or malformed line costs most. (b) widen to "a code step (a script, or a product's code)", the two lines changed on main; pro: the same protection for product code, and one wording with the template's paragraph; con: longer briefs in product repositories, and each listed input becomes a case the reviewer expects a test for. Recommendation: (b), because the reason for the rule (a wrong answer on an unstated input costs something) holds for product code as much as for scripts, and the cost condition already keeps the list short. (a) is the cheaper option, since nothing changes; (b) is recommended for the coverage, not the cost.

## Agents stopped

The runner's agent listing (ListAgents) showed the step's last reviewer as completed and no agent of the step running, before the worktree was committed.

## Not done

Nothing inside the step. Whether the implied inputs also cover product code waits on open item B.

## What landed

- `skills/spec/templates/brief.md` and `skills/spec/SKILL.md` (1.6.2): a brief for a step that builds or changes a script lists the inputs the step implies but never states, each with its expected result, where a wrong answer costs something.
- `docs/dev/change-standard.md` rule 21 and `skills/repo-setup/templates/docs/dev/change-standard.md` rule 20 (`/repo-setup` 1.1.2): a secret in quoted command output is written `<REDACTED>` in place of its value.
- `skills/refute/SKILL.md` (1.7.1), `skills/land/SKILL.md` (1.8.1) and `skills/roadmap/SKILL.md` (1.1.2): each redacts the command output it quotes; `/refute` reports a secret left in the builder's report as a Standards finding.
- User-visible: `/roadmap` reads the `rules` key and refuses without it, as it does for any required key.

## What was found

- First review: every item holds and every case is met; one standards finding and two points declined to judge, sent in repair round 1.
- Run over round 1: every item holds and every case is met; one spec finding (the widening to product code, taken without you, reverted at landing and raised as open item B), two standards findings and one behaviour finding, all closed at landing in `agents/reviews/3-refuter.md`, Closed.

## Verification on main

`sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md` after the fixes at landing: `checks: 7 commands passed`, exit 0. The gate's length command: 999 for spec, the highest.

## Usage

Builder claude:opus 136338 tokens, 37 tool uses, 387 s, and 156235 tokens, 10 tool uses, 122 s over round 1. Reviewer claude:opus 120045 tokens, 23 tool uses, 252 s, and 109962 tokens, 25 tool uses, 216 s over round 1. First report passed its bar: no. Fixes at landing: 4, and open item B.

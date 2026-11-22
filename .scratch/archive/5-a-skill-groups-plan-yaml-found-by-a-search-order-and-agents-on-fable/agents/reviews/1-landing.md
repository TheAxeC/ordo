# Step 1 landing

Entry 5.A of `docs/roadmap.md`, Skill groups, plan.yaml found by a search order, and agents on Fable; step 1 of 5, Fable and the session, landed on main; next, the landing of step 2, the skill groups, with `/land 5.A 2` after its review.

## Open items

- none

## The check of Steps 1

The builder (ad35ad4cb7d6e0618) and the two reviewers (af9bdf0f24d9b60a2, afa2da60d2fdec6cb) had each ended with a completion notice before the landing.

## NOT DONE

Nothing.

## What landed

27 files, 187 insertions(+), 211 deletions(-) against the base 650332d.

- The rule that kept plan agents off Fable is gone from `plan-orchestration`, with the two template comments.
- `writing` and `code-comments` start their agents on the runner's default agent, the prompt setting no model and no effort. `code-comments` reads no `plan.yaml` and takes no `<project>` argument.
- `spec`, `refute`, `plan-orchestration`, `grill` and `diagnose` print a warning that names a missing `ordo-<level>` agent and start the agent following the session. `CLAUDE_CODE_EFFORT_LEVEL` set stays the refusal.
- ADR 0007, 0014, 0030 and 0035 are edited in place. ADR 0007 names no model as Ordo's value. `.agents/plan.yaml` keeps every value, `repair_reviewer: claude:sonnet` among them.

## What was found

- The first review found nine points of wording, eight sent back in repair round 1 and closed there but one.
- That one, the Context of ADR 0035, was fixed at landing.
- A change of behaviour to know: `code-comments` no longer takes the prose standard from the page the `standards` key lists; it reads `docs/dev/prose-standard.md` of the repository, then the `repo-setup` template.

## Verification on main

`land.sh` exited 0: the ten tests each printed their `PASS:` line, the glossary check printed `ok: the plan-terms block equals the template`, the character-set check printed nothing, and `checks.sh` printed `checks: 12 commands passed`.

## Usage

- Brief check a3baabc725c3d4805, claude-fable-5-2: 136624 tokens, 17 tool uses, 3.8 minutes.
- Builder ad35ad4cb7d6e0618, claude-fable-5-2: 263337 tokens, 42 tool uses, 10.2 minutes for the build; 276426 tokens in all after round 1.
- Reviewer af9bdf0f24d9b60a2, claude-fable-5-2: 222767 tokens, 29 tool uses, 5.4 minutes.
- Reviewer over round 1 afa2da60d2fdec6cb, claude-sonnet-5-5: 99641 tokens, 10 tool uses, 1.3 minutes.

The builder's first report did not pass its bar. Fixes at landing: 1.

# Landing of step 9a

- Position: roadmap entry 2.E grill; step 9a, "Approval stops under a ruling", landed; next: step 14, the blind comparison on entry 3, then step 16, the closing.

## Open items

- None.

## The check of Steps 1

- `ListAgents` listed no builder or reviewer of step 9a; the agents it listed were step 14's comparison sides and an agent one of them started.

## NOT DONE

- Nothing inside the step.

## What landed

- `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` and `/grill` take `--ruling <ledger file> "<name>"`, and each writes without its approval stop only a draft that is the ruled change; `plan-orchestration`, `spec`, `ordo-help`, the glossary, the plan-terms template, the README and both figures say so. 14 files; the booking in `plan.md`, "Step 9a, approval stops under a ruling", has the detail.
- Fixes at landing: 2, both in `skills/grill/SKILL.md`, from the review over repair round 1: a roadmap diff a quoted ruling states is marked settled at Steps 3 and never enters the frontier; the Steps 6 sentence on sending no round fires only on an empty frontier.

## What was found

- The scratch runs of `/roadmap` under a quoted ruling gave each result the ruling's option (a) names: the ruled change written with no stop and a commit naming the ruling (run 7, 105ec39); a gate that could pass stops (run 2, and runs 1 and 6 on gates of mine the agents judged could pass); a name the file does not hold stops (run 3); a place the skill's rules reject stops with the difference named (run 4); a bullet not ending "(the user)" stops (run 5).
- Run 3 drafted from the wording of a bullet it had just found was not the named ruling; the stop stood and nothing was written.

## Verification

- `land.sh` exited 0 with `checks: 10 commands passed`; after the fixes at landing `checks.sh` printed `checks: 10 commands passed`, rc=0.

## Usage

- Brief check claude-opus-5-5 258965 tokens, 34 tool uses, 683 s; builder claude-sonnet-5-5 243201 tokens, 132 tool uses, 2226 s (round 0) and 288483 tokens, 14 tool uses, 321 s (round 1); reviewer claude-opus-5-5 291216 tokens, 54 tool uses, 880 s; reviewer over round 1 claude-opus-5-5 193193 tokens, 33 tool uses, 552 s.
- The builder's first report did not pass its bar (three Standards findings). Fixes at landing: 2.

# Step 1 landing

Roadmap entry 4.A (ordo-help skills). Plan step 1 of 3: `/ordo-help skills` in `skills/ordo-help/SKILL.md`. Next: step 2, the gate's run.

## Open items

- none

## The check of Steps 1

The step's builder, its brief-check agent and its two reviewers had all ended before the landing: `ListAgents` printed "No reachable agents".

## NOT DONE

Nothing of step 1. The run of `/ordo-help skills` through the Skill tool, with the count and the diffs, is step 2.

## What landed

- `skills/ordo-help/SKILL.md`, version 3.2.0: the `skills` mode. It has a Quick start line `/ordo-help skills` and new trigger phrases, and the argument `skills` is read before `<entry>`. The skills folder is the parent of this skill's folder after `cd <base directory> && pwd -P`. `### The sequence and the plans` holds the old steps. `### skills` sorts the folders bytewise and prints `/<name>` and the fenced Quick start block for each, skipping a folder with no `SKILL.md` and printing `no Quick start block` for a file with none. There is a Rules bullet that the mode prints only those lines, the "No stop" row and an Anti-patterns row.
- `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`: the **dispatch entry** "Stated in" names `ordo-help`, "Steps / The sequence and the plans" 3. `skills/repo-setup/SKILL.md` is at 5.3.1.
- `README.md`: the `ordo-help` row names the `skills` mode.
- `docs/figures/gen_figures.py` and `docs/figures/pipeline.svg`: the `/ordo-help` box adds "/ordo-help skills prints every skill's Quick start." `plan-loop.svg` is unchanged.

## What was found

- Brief check: 10 findings, each closed in the brief (`1-brief-check.md`, Closed).
- First review (`1-refuter.md`): four findings, Standards 1 to 3 and Behaviour 1. All four were closed in repair round 1.
- Review over round 1: two Standards findings, both fixed at landing:
  - "What it reads" 2 is now one ordered statement.
  - The restated order is dropped from "Steps / skills" 1, and the completion line of item 3 names the sorted order.

## Verification on main

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/land.sh .scratch/4-a-ordo-help-skills/orchestrator-state.md 4-a-ordo-help-skills-1 7e8082d
PASS: strip_comments.py scratch tests
PASS: land.sh scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
ok: the plan-terms block equals the template
PASS: pin.sh scratch tests
checks: 7 commands passed
 7 files changed, 51 insertions(+), 18 deletions(-)
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/4-a-ordo-help-skills/orchestrator-state.md
checks: 7 commands passed
```

The verify list equals the commands of `docs/dev/building.md` with their filters. A/B: none. Look: none configured.

## Usage

- Brief check: claude-opus-5-5, 168049 tokens, 40 tool uses, 7.6 min.
- Builder: claude-sonnet-5-5.
  - Round 0: 152050 tokens, 32 tool uses, 5.0 min.
  - Round 1: 185542 tokens, 11 tool uses, 2.4 min.
- Reviewer: claude-opus-5-5, 160305 tokens, 36 tool uses, 7.6 min.
- Reviewer over round 1: claude-sonnet-5-5, 132598 tokens, 24 tool uses, 2.8 min.

The builder's first report did not pass its bar. There were 2 fixes at landing.

## Next

Step 2: tag a release candidate of main and pin it with `utils/pin.sh <tag>`, which the user has allowed. Then run `/ordo-help skills` through the Skill tool, count its blocks against `ls skills/*/SKILL.md | wc -l`, and `diff` each block against its file.

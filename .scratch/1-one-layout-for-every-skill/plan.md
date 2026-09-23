# Plan: 1. One layout for every skill

Execution ledger for entry 1 of `docs/roadmap.md`. One bullet is one step of work; this plan's executor is inline, so the orchestrating session builds each step itself in the step's worktree, and bookkeeping steps are marked. A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

A written skill layout standard, `docs/dev/skill-layout.md` (the section order Quick start, Use instead, What it reads, Steps, Stops, Anti-patterns, Rules; a table where the content is a table; one rule per bullet), and all ten skills under `skills/` rewritten to it with no rule lost or changed in meaning.

## Gate

- The user approves `docs/dev/skill-layout.md`.
- A layout check over every `skills/*/SKILL.md` exits 0, and its test fails on a skill with a section missing or out of order.
- Each skill's rule inventory (one line per rule of the old file) maps every rule to its place in the new file; the inventory check exits 0, and its test fails on a rule with no place.
- `/refute` on each step finds no rule dropped or changed in meaning.
- Every command in `docs/dev/building.md` passes, and `npx skills add . --list` lists the ten skills.

## Steps, in execution order

- ✅ 1 `docs/dev/skill-layout.md`: the section order, when a table is used, one rule per bullet, the anti-pattern table, the Quick start and Use instead forms; the user approves it (1 commit; orchestrator, a stop for approval)
- 2 `utils/check_skill_layout.py` and its test: required sections in order, frontmatter present; the test fails on a missing section and on one out of order (1 commit)
- 3 `utils/check_rule_inventory.py` and its test: every non-empty line of the old file belongs to an inventory row, every row's new heading exists in the new file; the test fails on an uncovered line and on a missing heading (1 commit)
- 4 plan-orchestration restyled, with its inventory; the layout and inventory checks exit 0 for it, the building checks pass, `/refute` finds no rule dropped (1 commit)
- 5 plan restyled, with its inventory; same proof as 4 (1 commit)
- 6 spec restyled, with its inventory; same proof (1 commit)
- 7 refute restyled, with its inventory; same proof (1 commit)
- 8 land restyled, with its inventory; same proof (1 commit)
- 9 plan-help restyled, with its inventory; same proof (1 commit)
- 10 ordo-init restyled, with its inventory; same proof (1 commit)
- 11 roadmap restyled, with its inventory; same proof (1 commit)
- 12 plan-retro restyled, with its inventory; same proof (1 commit)
- 13 repo-setup restyled, with its inventory; same proof (1 commit)
- 14 the layout check wired in as the seventh check of `docs/dev/building.md` and its test in the README's list; every check passes and `npx skills add . --list` lists ten skills (1 commit)
- 15 the closing: `/roadmap done 1` with the gate's output, this folder moved to `.scratch/archive/` (orchestrator, no agent)

## Could run in parallel

Independent of each other; `workers_at_once: 1` serialises them.

- 5 to 13 with each other, after 4.

## Rulings (2026-09-23)

- The executor is inline for every step: the orchestrating session writes each step in its worktree, per the user's rule against sub-agents for work that writes files.
- `/refute` runs as a fresh read-only reviewer agent on every step; the user approved this exception to the sub-agent rule.
- The step list above is approved as drafted.
- `docs/dev/skill-layout.md` is approved as written. The ASCII check allows the green checkmark in Markdown files only. No further approval stops in this plan: step 4 lands like the others, and the user reads the restyled skills in the report.

## Blocked, and by what

- none.

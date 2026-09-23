# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 1 of `docs/roadmap.md`, one layout for every skill. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the user's instruction files and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: a session on either harness continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh utils/pin.test.sh 2>&1 | tail -1
- "! LC_ALL=C grep -rnI --exclude-dir=.git --exclude-dir=.agents '[^ -~]' ."
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: []                # files every brief tells the builder to read in full; docs/dev/skill-layout.md joins once step 1 is approved.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: inline             # ruled: the orchestrating session writes every step itself in the step's worktree.
worker: claude:opus          # the default worker.
worker_effort: high          # the reasoning effort passed to a worker whose harness takes one.
reviewer: claude:opus        # the model /refute runs on, as a fresh read-only agent (ruled).
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
workers_at_once: 1           # one step in flight.
bench: []                    # no A/B.
```

```yaml
dispatch: none
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim at the top of every report until ruled)

- Step 1: the user approves `docs/dev/skill-layout.md` once it is written.

## Booked, no ruling needed

- none.

## Closed items

- none.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: a named thing is its whole (a skill is its folder, templates included); never take the lazy option (no rule dropped to make a layout fit); no claim about state without a command in the same turn; plain prose, ASCII, no history in a rule file.
- `docs/dev/change-standard.md`, in full.
- The installed skills are pinned at v1.0.0 in `~/.local/share/ordo-stable`; nothing in this plan edits the pinned worktree, and the skills that run this plan are the pinned ones.
- Commits: a capitalised imperative subject, a blank line, `- Verb ...` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.

## Verification, every step

- The `verify` commands above, from the repository root of the worktree and again on main.
- From step 2 on: `python3 utils/check_skill_layout.py <skill>` for the step's skill; from step 3 on: `python3 utils/check_rule_inventory.py <inventory>` for the step's inventory.
- Every step: `git status --short` shows nothing of the step's after its commit.

## Where things are

- Design: `docs/dev/skill-layout.md` (step 1). Ledger: `.scratch/1-one-layout-for-every-skill/`, with `agents/briefs/` and `agents/reviews/`. Inventories: `.scratch/1-one-layout-for-every-skill/inventories/<skill>.md`.
- The skills: `skills/<name>/SKILL.md` and their templates.
- Must not be disturbed: `~/.local/share/ordo-stable` and the links in `~/.claude/skills`, `~/.claude-work/skills` and `~/.agents/skills`.

## Current position (rewritten before every step commit)

- 2026-09-23. The plan is opened on main after 24f8864. Nothing is built yet.
- Verified: `python3 skills/ordo-init/templates/check_config.py .` exits 0.
- Next step: 1, because every other step reads the layout standard.
- Open on Axel's side: none until step 1 is written.

## Usage

| step | worker (tokens / tool uses / wall) | reviewer (the review; the runs over the repair rounds) | repair rounds | findings sent back | lines +/- | first report passed | fixes at landing | findings booked for the user | orchestrator messages | orchestrator output tokens | orchestrator cache-write tokens | orchestrator cache-read tokens | orchestrator fresh input tokens | orchestrator minutes | the look |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|

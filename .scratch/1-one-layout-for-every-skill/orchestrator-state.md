# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 1 of `docs/roadmap.md`, one layout for every skill. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the user's instruction files and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: a session on either harness continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh utils/pin.test.sh 2>&1 | tail -1
- sh utils/check_skill_layout.test.sh 2>&1 | tail -1
- sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md] # files every brief tells the builder to read in full.
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
dispatch:
  step: 10
  executor: inline
  worker: claude:opus (the orchestrating session)
  worktree: .agents/worktrees/1-10
  base: 8ecfb4a
  launched: 2026-09-23
  report: .scratch/1-one-layout-for-every-skill/agents/reviews/10-report.md
  landing: not-started
  round: 0
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim at the top of every report until ruled)

- none.

## Booked, no ruling needed

- none.

## Closed items

- none.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: a named thing is its whole (a skill is its folder, templates included); never take the lazy option (no rule dropped to make a layout fit); no claim about state without a command in the same turn; plain prose, ASCII, no history in a rule file.
- `docs/dev/change-standard.md`, in full.
- The installed skills are pinned at v1.0.0 in `~/.local/share/ordo-stable`; nothing in this plan edits the pinned worktree, and the skills that run this plan are the pinned ones.
- Nothing is installed into the user's skill folders, no `utils/pin.sh <tag>` is run, and no installed skill is removed or replaced without the user's explicit permission, asked for each time.
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

- 2026-09-23. Steps 1 to 9 landed (971121b, 84ce1f7, 836f5c5, ea8d02d, a682c14, e4950d0, e643b34, 0fa6d65; step 9 in the commit that carries this line). The tree is clean after it.
- Verified: the verify list on main, seven `PASS:` lines and a clean ASCII check.
- Next step: 10, ordo-init restyled with its inventory.
- Open on Axel's side: none until step 1 is written.

## Usage

| step | worker (tokens / tool uses / wall) | reviewer (the review; the runs over the repair rounds) | repair rounds | findings sent back | lines +/- | first report passed | fixes at landing | findings booked for the user | orchestrator messages | orchestrator output tokens | orchestrator cache-write tokens | orchestrator cache-read tokens | orchestrator fresh input tokens | orchestrator minutes | the look |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 2 | inline (the orchestrating session) | 14 tool uses, about 15 minutes; round 1: 17 tool uses, about 20 minutes | 1 | 27 (worked inline) | +559 | no | 9 | 0 | 33 | 40797 | 69233 | 13667350 | 70 | 18 | none |
| 3 | inline (the orchestrating session) | 17 tool uses, about 25 minutes; round 1: 14 tool uses, about 20 minutes | 1 |  all first-run findings (worked inline) | +864 | no | the run over the round's findings | 0 | 36 | 69387 | 96719 | 18024585 | 76 | 26 | none |
| 4 | inline (the orchestrating session) | 12 tool uses, about 15 minutes; round 1: 13 tool uses, about 15 minutes | 1 | the first run's findings (worked inline) | +313 -35 | no | the run over the round's findings | 0 | 23 | 46479 | 71639 | 13495331 | 50 | 16 | none |
| 5 | inline (the orchestrating session) | 11 tool uses, about 12 minutes; round 1: 14 tool uses, about 15 minutes | 1 | the first run's findings (worked inline) | +110 -13 | no | 2 | 0 | 10 | 20095 | 32627 | 6379102 | 24 | 11 | none |
| 6 | inline (the orchestrating session) | 11 tool uses, about 12 minutes; round 1: 14 tool uses, about 15 minutes | 1 | the first run's findings (worked inline) | +167 -36 | no | 5 | 0 | 15 | 29490 | 47377 | 10216027 | 34 | 13 | none |
| 7 | inline (the orchestrating session) | 11 tool uses, about 15 minutes; round 1: 16 tool uses, about 12 minutes | 1 | the first run's findings (worked inline) | +195 -24 | no | 3 | 0 | 22 | 32213 | 55635 | 16227400 | 48 | 14 | none |
| 8 | inline (the orchestrating session) | 13 tool uses, about 12 minutes; round 1: 18 tool uses, about 15 minutes | 1 | the first run's findings (worked inline) | +169 -22 | no | 5 | 0 | 11 | 27065 | 41660 | 8629012 | 26 | 11 | none |
| 9 | inline (the orchestrating session) | 14 tool uses, about 10 minutes; round 1: 23 tool uses, about 15 minutes | 1 | the first run's findings (worked inline) | +125 -7 | no | 3 | 0 | 14 | 22128 | 33413 | 11517208 | 32 | 12 | none |

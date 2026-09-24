# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.B of `docs/roadmap.md`, the repair of what the audit of plans 1, 2 and 2.A found. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the user's instruction files and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: a session on either harness continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1
- sh utils/pin.test.sh 2>&1 | tail -1
- sh utils/check_skill_layout.test.sh 2>&1 | tail -1
- sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
- sh utils/check_coverage.test.sh 2>&1 | tail -1
- python3 utils/check_skill_layout.py
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md] # files every brief tells the builder to read in full.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # ruled: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:opus          # the default worker (ruled: Opus).
worker_effort: high          # the reasoning effort passed to a worker whose harness takes one.
reviewer: claude:opus        # the model /refute runs on, as a fresh read-only agent (ruled: Opus).
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
workers_at_once: 3           # ruled: up to three steps in flight, with disjoint paths.
bench: []                    # no A/B.
launch_note:                 # none recorded.
```

```yaml
dispatch: none
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim at the top of every report until ruled)

- The greenlight to start step 1. Nothing is dispatched until the user gives it.

## Booked, no ruling needed

- none.

## Closed items

- 2026-09-24: how to get back on track after the audit: ruled option C, this plan (see `plan.md`, Rulings).
- 2026-09-24: the audit's recommendations 2a to 2h, and contradictions 3a, 3b, 3c: ruled as recommended (see `plan.md`, Rulings).
- 2026-09-24: the step list of this plan: approved, with `workers_at_once: 3`.
- 2026-09-24: open items A to D from the review of the oculus changes: ruled A (a), B (a), C (b), D (a); written into steps 2, 3, 4 and 19 (see `plan.md`, Rulings).

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; a named thing is its whole (a skill is its folder, templates included); never take the lazy option; no claim about state without a command in the same turn; plain prose, ASCII, no history in a rule file or a comment; questions as plain text, never a question-box tool.
- `docs/dev/change-standard.md`, in full.
- The installed skills are pinned at v1.0.0 in `~/.local/share/ordo-stable`; nothing in this plan edits the pinned worktree, and the skills that run this plan are the pinned ones.
- Nothing is installed into the user's skill folders, no `utils/pin.sh <tag>` is run, and no installed skill is removed or replaced without the user's explicit permission, asked for each time.
- research-hub is read only.
- Commits: a capitalised imperative subject, a blank line, `- Verb ...` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.

## Verification, every step

- The `verify` commands above, from the repository root of the worktree and again on main, from step 2 on through `utils/verify.sh`.
- The step's own check command, named in its brief.
- Every step: `git status --short` shows nothing of the step's after its commit.

## Where things are

- Ledger: `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/`, with `agents/briefs/` and `agents/reviews/`.
- The findings: `.scratch/reviews/2026-09-24-audit/`.
- The files the coverage steps read: `/Users/axelfaes/workspace/research-hub/.agents/skills/{academic-paper,academic-paper-reviewer,academic-pipeline,deep-research}`, read only.
- Must not be disturbed: `~/.local/share/ordo-stable`, the links in `~/.claude/skills`, `~/.claude-work/skills` and `~/.agents/skills`, and research-hub.

## Current position (rewritten before every step commit)

- 2026-09-24. Plan opened; no step started.
- Next step: 1, the verify runner, on the user's greenlight.
- Open on Axel's side: the greenlight.

## Usage

| step | worker (tokens / tool uses / wall) | reviewer (the review; the runs over the repair rounds) | repair rounds | findings sent back | lines +/- | first report passed | fixes at landing | findings booked for the user | orchestrator messages | orchestrator output tokens | orchestrator cache-write tokens | orchestrator cache-read tokens | orchestrator fresh input tokens | orchestrator minutes | the look |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|

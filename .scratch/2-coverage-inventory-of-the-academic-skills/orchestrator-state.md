# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2 of `docs/roadmap.md`, the coverage inventory of the academic skills. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the user's instruction files and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: a session on either harness continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh utils/pin.test.sh 2>&1 | tail -1
- sh utils/check_skill_layout.test.sh 2>&1 | tail -1
- sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
- sh utils/check_coverage.test.sh 2>&1 | tail -1
- python3 utils/check_skill_layout.py
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
  step: 3
  executor: inline
  worker: claude:opus (the orchestrating session)
  worktree: .agents/worktrees/2-3
  base: a1b2330
  launched: 2026-09-23
  report: .scratch/2-coverage-inventory-of-the-academic-skills/agents/reviews/3-report.md
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

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: a named thing is its whole (a skill is its folder, templates included); never take the lazy option (every file read in full, never marked from its name); no claim about state without a command in the same turn; plain prose, ASCII, no history in a rule file.
- `docs/dev/change-standard.md`, in full.
- The installed skills are pinned at v1.0.0 in `~/.local/share/ordo-stable`; nothing in this plan edits the pinned worktree, and the skills that run this plan are the pinned ones.
- The academic skills in `research-hub/.agents/skills/` are read only; nothing in this plan changes them or anything else in research-hub.
- Nothing is installed into the user's skill folders, no `utils/pin.sh <tag>` is run, and no installed skill is removed or replaced without the user's explicit permission, asked for each time.
- Commits: a capitalised imperative subject, a blank line, `- Verb ...` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.

## Verification, every step

- The `verify` commands above, from the repository root of the worktree and again on main.
- From step 1 on: the step's own check command, named in its brief.
- Every step: `git status --short` shows nothing of the step's after its commit.

## Where things are

- Ledger: `.scratch/2-coverage-inventory-of-the-academic-skills/`, with `agents/briefs/` and `agents/reviews/`. The list: `docs/academic-coverage.md`.
- The files the list covers: `/Users/axelfaes/workspace/research-hub/.agents/skills/{academic-paper,academic-paper-reviewer,academic-pipeline,deep-research}`, 169 files (`find ... -type f | wc -l`), from `imbad0202/academic-research-skills` per research-hub's `skills-lock.json`. Read only.
- Must not be disturbed: `~/.local/share/ordo-stable`, the links in `~/.claude/skills`, `~/.claude-work/skills` and `~/.agents/skills`, and research-hub.

## Current position (rewritten before every step commit)

- 2026-09-23. Steps 1 and 2 landed (d44092c, and step 2 in the commit that carries this line). The tree is clean after it.
- Verified: the verify list on main: eight `PASS:` lines, ten `ok:` lines from the layout check, a clean ASCII check.
- Next step: 3, academic-paper's 61 files read in full and marked in `docs/academic-coverage.md`.
- Open on Axel's side: none until step 7.

## Usage

| step | worker (tokens / tool uses / wall) | reviewer (the review; the runs over the repair rounds) | repair rounds | findings sent back | lines +/- | first report passed | fixes at landing | findings booked for the user | orchestrator messages | orchestrator output tokens | orchestrator cache-write tokens | orchestrator cache-read tokens | orchestrator fresh input tokens | orchestrator minutes | the look |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | inline (the orchestrating session) | 80,660 tokens, 13 tool uses, 240 s; round 1: 93,021 tokens, 21 tool uses, 445 s | 1 | 14 (worked inline) | 2 files changed, 674 insertions(+) | no | 6 | 0 | 46 | 65884 | 270920 | 10403186 | 96 | 150 | none |
| 2 | inline (the orchestrating session) | 77,262 tokens, 18 tool uses, 167 s; round 1: 63,707 tokens, 12 tool uses, 169 s | 1 | 3 (worked inline) | 3 files changed, 4 insertions(+) | no | 3 | 0 | 14 | 12803 | 26079 | 4156461 | 32 | 9 | none |

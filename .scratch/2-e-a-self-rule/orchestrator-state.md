# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.E.A of `docs/roadmap.md`, self-rule. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/land/templates/checks.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
- sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
- python3 skills/repo-setup/templates/sync_rules.py . --only glossary
- sh utils/pin.test.sh 2>&1 | tail -1
- sh utils/check_coverage.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md, docs/glossary.md] # files every brief tells the builder to read in full, from .agents/plan.yaml.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:sonnet        # the default worker, from .agents/plan.yaml.
reviewer: claude:opus        # the model /refute, the brief check and the lookups of /grill run on.
libraries: avoid             # from .agents/plan.yaml: no new dependency.
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
workers_at_once: 3           # from .agents/plan.yaml; two steps share a file only when the merge at landing is judged simple.
bench: []                    # no A/B.
adr: docs/adr                # the ADR folder.
design_bar: industry         # the default.
design_references: []        # none.
worker_effort: high          # the default.
reviewer_effort: high        # the default.
```

```yaml
dispatch:
- step: 1
  executor: agent
  worker: claude:sonnet
  worktree: .agents/worktrees/2ea-1
  base: 67428df
  launched: 2026-10-01
  report: .scratch/2-e-a-self-rule/agents/reviews/1-report.md
  brief_check: .scratch/2-e-a-self-rule/agents/reviews/1-brief-check.md (ordo-high, agent a392a12ca146ff975, claude-opus-5-5, 153352 tokens, 25 tool uses, 285 s)
  landing: not-started
  round: 0
  session_id: a15eaa0740335c7a3 (ordo-high, claude-sonnet-5-5 at the launch, from its transcript)
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and becomes a step in `plan.md` only by the user's ruling; what is settled belongs in the closed list.

- none.

## Closed items (the log of what was raised and how it ended; no report carries it)

- none.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and its rules files: the skills' agents do the work; no claim about state without a command; the end state only; plain prose and ASCII; open items in plain text with options, one recommendation and the lazy option named.
- Commits: a capitalised imperative subject, then `- Verb` bullets; add by path. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree; a diff kept for the record is a patch file under `agents/reviews/`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The `verify` list above, each command from the repository root.
- The `verify` list above runs through the `land` skill's `templates/checks.sh <state file>` from the root of the checkout it checks, the worktree and then main. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what a report or a booking quotes.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 2.E.A, the Rulings of `plan.md`, ADRs 0004 to 0008. Ledger: `.scratch/2-e-a-self-rule/`, with `agents/briefs/` and `agents/reviews/`.
- The data the steps read: the agents' transcripts under `~/.claude/projects/`, read only.
- Anything running that a step must not disturb: none. Plan 2.F is paused until this plan lands (`.scratch/2-f-diagnose/orchestrator-state.md`).

## Current position (rewritten before every step commit)

- 2026-10-01. The plan is open; nothing has landed. The working tree is clean after the opening commit.
- Verified: the opening commit, `git status --short` empty.
- Next step: 1, because 3, 4, 6 and the rest depend on its keys and it runs alone.
- Open on Axel's side: none.

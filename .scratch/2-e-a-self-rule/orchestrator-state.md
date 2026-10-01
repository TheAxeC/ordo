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
reviewer: claude:opus        # the model the first run of /refute, the brief check and the lookups of /grill run on.
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
self_rule: off               # the default: every open item waits for the user; step 6b sets it on.
next_entry: off              # the default: the orchestrator stops at the closing.
repair_reviewer: claude:sonnet # from .agents/plan.yaml: the run of /refute over a repair round runs on Sonnet.
```

```yaml
dispatch:
- step: 4
  executor: agent
  worker: claude:sonnet
  worktree: .agents/worktrees/2ea-4
  base: 4aa05f2
  launched: 2026-10-01
  report: .scratch/2-e-a-self-rule/agents/reviews/4-report.md
  brief_check: .scratch/2-e-a-self-rule/agents/reviews/4-brief-check.md (aa5bff28e5e1bed90, claude-opus-5-5 (ordo-high), 209247 tokens, 56 tool uses, 10 min 47 s)
  landing: not-started
  round: 1
  session_id: ae1c05d01d496c9b9 (claude-sonnet-5-5)
  builder_usage: 334341 tokens, 81 tool uses, 41 min 7 s
  reviewer_report:
  - .scratch/2-e-a-self-rule/agents/reviews/4-refuter.md (a7eae9ce124bd2bd6, claude-opus-5-5 (ordo-high), 251863 tokens, 67 tool uses, 16 min 58 s)
- step: 6
  executor: agent
  worker: claude:sonnet
  worktree: .agents/worktrees/2ea-6
  base: 5f41763
  launched: 2026-10-01
  report: .scratch/2-e-a-self-rule/agents/reviews/6-report.md
  brief_check: .scratch/2-e-a-self-rule/agents/reviews/6-brief-check.md (acf87ddb30973c88b, claude-opus-5-5 (ordo-high), 239319 tokens, 43 tool uses, 9 min 48 s)
  landing: not-started
  round: 0
  session_id: a15fd806c8f78a9ab (claude-sonnet-5-5)
  builder_usage: 212645 tokens, 30 tool uses, 6 min 45 s (the first run of the cases, handed back: agents/reviews/6-cases-handback.md; ruled in agents/briefs/6-cases.md)
  shared_paths: skills/plan-orchestration/SKILL.md, skills/plan/SKILL.md, skills/plan/templates/plan.md, skills/repo-setup/templates/plan-terms.md, docs/glossary.md and README.md, each shared with step 4; the merge is simple, since each step changes other lines of each file (step 4: Steps 10 and "Usage", the closing's bullet, template line 21, the terms closing report, closing step and cost script, and its README paragraph; step 6: its own section and the lines its brief names, the terms quoted ruling and resume point, README lines 16-50). skills/repo-setup/templates/shared-rules.md is a template for other repositories, not a rules file Ordo's builders work under, so step 6 need not run alone.
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and becomes a step in `plan.md` only by the user's ruling; what is settled belongs in the closed list.

- none

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-10-01: Open item A, where the cost script takes each response's output count: ruled C by the user. Each response's counts come from its response body under `OTEL_LOG_RAW_API_BODIES` where the body exists, and from the transcript otherwise, that agent's row marked as a lower bound; ADR 0009; the user turns the setting on; the goal's sentence changes through a roadmap diff, Open item C.
- 2026-10-01: Open item B, self-rule against the written rules and the reach of kind 3: ruled (a) and (a) by the user. An exception sentence joins the shared-rules template, and the user adds it to `~/.claude/CLAUDE.md`; kind 3 is read narrow.
- 2026-10-01: Open item C, the roadmap diff of Open item A's ruling: ruled (a) by the user. `docs/roadmap.md` entry 2.E.A's Goal names the response bodies, and the transcripts as a lower bound; the Rulings line "Open item C".

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

- 2026-10-01. Steps 1, 2 and 3 landed; step 3's booking is in `plan.md` and its landing report at `agents/reviews/3-landing.md`.
- Verified: `sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` on main after the fixes at landing printed `checks: 10 commands passed`.
- Step 4 is built and refuted once (`agents/reviews/4-report.md`, `agents/reviews/4-refuter.md`); its builder is kept for repair round 1. Its run over a repair round is the first dispatched on `repair_reviewer` (claude:sonnet); its booking carries step 3's check ("Blocked, and by what").
- Open items A and B ruled. Step 4's repair round 1 is sent (ruling A and the first review's findings); step 6 is prepared under ruling B and its builder launched.
- Open item C ruled (a) and the roadmap changed. The setting of ADR 0009 is in `~/.claude/settings.json`, from the next session on. The sentence of ruling B is in `~/.claude/CLAUDE.md` line 24. Nothing is open on Axel's side.

# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for roadmap entry 7.A, referee. Rewritten before every step commit of this plan, so it describes this plan as of its own last resume point (`plan-orchestration`, "Resuming, and handing the plan over"). Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run once, at landing on main, in order; all must pass. The builder and the reviewer run the checks the brief names for the files the step changes before landing. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/code/code-comments/templates/strip_comments.test.sh 2>&1 | tail -1
- sh skills/orchestration/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/calibration_counts.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/lookup.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/reference_docx.test.sh 2>&1 | tail -1
- sh skills/ordo/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary
- sh utils/pin.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/ordo/repo-setup/templates/docs/dev/prose-standard.md, docs/glossary.md] # files every brief tells the builder to read in full, from docs/plan.yaml.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:fable         # from docs/plan.yaml.
reviewer: claude:fable       # the model the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill, the review agents of /writing and, the agents of /code-comments run on.
libraries: avoid             # from docs/plan.yaml: no new dependency.
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
bench: []                    # no A/B.
adr: docs/adr                # the ADR folder: grill writes the decision records into it, /plan, /spec and /refute read them.
design_bar: industry         # what grill's options are held to: industry, state-of-the-art or novel.
design_references: []        # the published standards a design is held to, such as WCAG 2.2 AA.
worker_effort: low           # the effort a builder runs at: low, medium, high, xhigh or max.
reviewer_effort: low         # the effort a reviewer, a brief-check agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
self_rule: on                # the plan runs under self-rule.
next_entry: on               # copied from docs/plan.yaml; after the closing, next-entry mode reads docs/plan.yaml itself.
repair_reviewer: claude:sonnet  # the model the run of /refute over a repair round runs on, at reviewer_effort.
```

```yaml
dispatch:
- step: 1b
  executor: agent
  worker: claude:fable
  base: a7be82a
  worktree: .agents/worktrees/7-a-referee-1b
  report: .scratch/7-a-referee/agents/reviews/1b-report.md
  brief_check: .scratch/7-a-referee/agents/reviews/1b-brief-check.md (a209c45f6fbb2d894, claude-fable-5-2, 211641 tokens, 17 tool uses, 5.6 minutes)
  session_id: af33cf9bca3b7181b (claude-fable-5-2)
  landing: not-started
  round: 0
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

- none

## Closed items (the log of what was raised and how it ended; no report carries it)

- Open item 1 (step 1, raised and ruled 2026-11-22): whether `paper-review-panel` names `referee`; ruled (a) by the user, as part of step 1.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: the skill is small and holds no copy of a page of `paper-review-panel`; work runs through the skills' agents; no claim about state without a command in the same turn; report the end state only, in plain short prose; no breakage testing.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree. Commit at resume points only.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <slug>-<step> <base> <plan.yaml>`, the last argument the path of the `plan.yaml` the call reads. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, 127 when `python3` is not installed, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The step's own check, named on its line in `plan.md` and in its brief, run from the repository root.
- The `verify` list above runs through the `land` skill's `templates/checks.sh <state file>` from the root of main's checkout, once, at landing. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what the booking quotes. The builder and the reviewer run the checks the brief names for the files the step changes before landing.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 7.A and the rulings in `plan.md`. Ledger: `.scratch/7-a-referee/`, with `agents/briefs/` and `agents/reviews/`.
- Plan configuration: `docs/plan.yaml`. In a call, in front of the entry: nothing.
- The data the steps read, and who may change it: `skills/academic/paper-review-panel/`, whose pages the skill runs and no step changes; `research-hub/tmp/BIOINF-2026-1778-review/`, the gate's manuscript and the comments sent, read only.
- Anything running that a step must not disturb: nothing.

## Current position (rewritten before every step commit of this plan)

- 2026-11-22. Step 1, the skill, has landed, and `v9.1.0-rc.1` is tagged on 0b4f269 and pinned. Step 2, the gate's two runs, is next: each run is made by a separate agent that invokes `/referee`, never in this session, and this session answers its stops with the skill's defaults and asks the user nothing (ruling "How every run is made"). The inputs are copied to `.agents/gate-7a/round1/` and `.agents/gate-7a/round2/`, since `research-hub` is read only.
- 2026-11-23. Both runs of step 2 have ended, each with its report written: the first round in `.agents/gate-7a/round1/referee-runs/round-1-2026-11-22/` (agent a8a1ce052177b256e, 144334 tokens, 27 tool uses, 17.5 minutes; 7 major and 7 minor points, 1193 words, 24 comments left out) and the second round in `.agents/gate-7a/round2/referee-runs/round-2-2026-11-22/` (agent a912c1d07c6e1f03e, 85014 tokens, 15 tool uses, 10.8 minutes; 7 major and 5 minor points, 1197 words, 1 comment left out, 3 first-round points resolved). Step 2 waits for the user's reading of each `referee-report.md` against the comments sent. The run agents' notes on the skill's text are in their final messages.
- 2026-11-23. The user read both reports: the first round is close to the comments sent, but its 7 major points equal the budget, which the user ruled bad; the second round is wrong, its points being mostly new items. Step 1b, added on those two rulings, changes the skill; step 2's runs are then made again.
- Roadmap entry 7.A (referee). Plan step 1b of 4: the count of points and the second round. Next: step 2, the gate's two runs. Next: step 3, the closing.
- Open on Axel's side: none.

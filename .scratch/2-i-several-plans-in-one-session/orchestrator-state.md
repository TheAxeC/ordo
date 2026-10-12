# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.I of `docs/roadmap.md`, several plans in one session. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- python3 skills/repo-setup/templates/sync_rules.py . --only glossary
- sh utils/pin.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md, docs/glossary.md] # files every brief tells the builder to read in full, from .agents/plan.yaml.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:sonnet        # from .agents/plan.yaml.
reviewer: claude:opus        # the model the first run of /refute, the brief check, the diagnosis agent and the lookups of /grill run on.
libraries: avoid             # from .agents/plan.yaml: no new dependency.
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
bench: []                    # no A/B.
adr: docs/adr                # the ADR folder: grill writes the decision records into it, /plan, /spec and /refute read them.
design_bar: industry         # what grill's options are held to: industry, state-of-the-art or novel.
design_references: []        # the published standards a design is held to, such as WCAG 2.2 AA.
worker_effort: high          # the effort a builder runs at: low, medium, high, xhigh or max.
reviewer_effort: high        # the effort a reviewer, a brief-check agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
self_rule: on                # the plan runs under self-rule.
next_entry: on               # copied from .agents/plan.yaml; after the closing, next-entry mode reads .agents/plan.yaml itself.
repair_reviewer: claude:sonnet  # the model the run of /refute over a repair round runs on, at reviewer_effort.
```

```yaml
dispatch: none               # or the block /spec writes (a list when .agents/plan.yaml's workers_at_once is above 1). /spec writes the entry at the end of its preflight with step and `landing: preparing`, writes `"running: <agent id>"` into brief_check while the brief-check agent runs, base after its preparation commit and worktree before it creates the worktree, and fills the entry at its Steps 9, so that it holds: step, executor, worker, worktree (<worktree_root>/<slug>-<step>), base, launched, report (the builder's report, at the path the brief names), brief_check (the brief check's report path, with the agent's id, its served model, tokens, tool uses and time, or `none, a small text step` for a small text step), landing, round. `landing` is `preparing` while /spec runs, then `not-started`, `cherry-picking` while /land cherry-picks, and `backed-out` after a red line took the step back out of main. The orchestrator adds session_id, the builder's agent id followed by the model the runner served it (<agent id> (<served model>)), as soon as the builder is dispatched and its model read, builders_before (the agent id and served model of each builder it replaced, as <agent id> (<served model>, stopped) or <agent id> (<served model>, dead), one after another), builder_usage (the builder's tokens, tool uses and time from its completion notice) beside report when the builder's report is saved, and reviewer_report (the refuter report's path, with each reviewer's agent id, served model, tokens, tool uses and time, or, for a reviewer stopped for another model, its agent id, served model and stopped) at the review. A value that holds `: ` (brief_check while its agent runs, builder_usage after a repair round, reviewer_report after a run over a round) is written in double quotes, so the block stays valid YAML. A diagnosis agent has no key here: the session that starts it writes its id and role into plan.md's Agents section, as the diagnose skill's Rules say. A step dispatched while another in flight, of this plan or of another open plan, names a file its brief also names carries shared_paths: each shared file, the other step's plan and step, and why the merge at landing is simple, as plan-orchestration's "Two steps in flight" says; with no shared file the key is left out.
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

- none.

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-10-12: Open item Step 3, how a step in /spec is recorded, a value of the dispatch entry for a step in `/spec`: closed under self-rule, C40.
- 2026-10-12: Open item Step 2, condition 7 shown only through a hold: ruled (a) by the user; steps 3 and 4 added before the closing, which becomes step 5.
- 2026-10-12: Open item Step 2, the scratch gates that could pass without their goals: ruled (a) by the user.
- 2026-10-12: Open item Step 2, what the scratch run needs approved: ruled (a) by the user.
- 2026-10-12: Open item ADR 0012, the landing commit's paths: ruled (a) by the user; the ADR's sentence names `--no-renames`.
- 2026-10-12: Open item Step 2, how the real run invokes step 1's texts: ruled (a) by the user; tag `v6.0.0-rc.1` and its pin.
- 2026-10-12: C39, the one limit and the worktree names in the projects form: agreed by the user.
- 2026-10-05: Open item A, the step list as drafted: closed under self-rule, C34.
- 2026-10-12: Open item Step 1, the projects form (the brief check `agents/reviews/1-brief-check.md`, section 3, finding 3): closed under self-rule, C39.
- 2026-10-07: C5, goal part, every open plan in one session: agreed by the user.
- 2026-10-07: C6, goal part, the roadmap's order: agreed by the user.
- 2026-10-07: C7, goal part, paths compared across plans: agreed by the user.
- 2026-10-07: C8, goal part, one limit across plans: agreed by the user.
- 2026-10-07: C9, goal part, landings one at a time across plans: agreed by the user.
- 2026-10-07: C10, goal part, one report: agreed by the user.
- 2026-10-07: C11, goal part, the current verify list: agreed by the user.
- 2026-10-07: C12, gate part, one real run over two plans sharing a file: agreed by the user.
- 2026-10-07: C13, gate part, the first plan in roadmap order starts: agreed by the user.
- 2026-10-07: C14, gate part, the second plan's step waits: agreed by the user.
- 2026-10-07: C15, gate part, the limit never exceeded: agreed by the user.
- 2026-10-07: C16, gate part, no overlapping landings: agreed by the user.
- 2026-10-07: C17, gate part, a new test command reaches the other plan: agreed by the user.
- 2026-10-07: C18, where the limit on steps in flight is read: agreed by the user.
- 2026-10-07: C19, how each plan's verify list stays equal to the verification page: agreed by the user.
- 2026-10-07: C20, where the steps in flight of every plan are recorded: agreed by the user.
- 2026-10-07: C21, worktree and branch names across plans: agreed by the user.
- 2026-10-07: C22, commits that cannot take another plan's staged landing: agreed by the user.
- 2026-10-07: C23, which plan's commit carries a record: agreed by the user.
- 2026-10-07: C24, the order steps of several plans are picked in: agreed by the user.
- 2026-10-07: C25, the rules of two steps in flight across plans: agreed by the user.
- 2026-10-07: C26, the scope of a pause: agreed by the user.
- 2026-10-07: C27, the shape of the one report: agreed by the user.
- 2026-10-07: C28, what a plan's state file describes after another plan's commit: agreed by the user.
- 2026-10-07: C29, next-entry mode while other plans are open: agreed by the user.
- 2026-10-07: C30, the recurring-findings pass and the night rule across plans: agreed by the user.
- 2026-10-07: C31, the invocations that run several plans: agreed by the user.
- 2026-10-07: C32, record as ADR?: agreed by the user.
- 2026-10-07: C33, the roadmap diff of entry 2.I: agreed by the user.
- 2026-10-07: C34, the step list of plan 2.I as drafted: agreed by the user.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option; nothing asked of Axel that an agent can do.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, 127 when `python3` is not installed, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The `verify` list above runs through `sh skills/land/templates/checks.sh <state file>` from the root of the checkout it checks, the worktree and then main. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what a report or a booking quotes.
- The step's own check, named on its line in `plan.md` and in its brief.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 2.I, the rulings in `plan.md`, and ADRs 0010, 0011 and 0012. Ledger: `.scratch/2-i-several-plans-in-one-session/`, with `agents/briefs/` and `agents/reviews/`.

## Current position (rewritten before every step commit)

- 2026-10-13. Step 5 of 5, the closing: the closing report `agents/reviews/closing.md` is written. The pin is `v6.0.0-rc.2` (61d3eab).
- Next: the roadmap diff of `/roadmap done 2.I`, the tag `v6.0.0` and its pin, each for Axel's approval, and the run findings of `agents/reviews/4-report.md` brought to Axel with options; then the move of this folder to `.scratch/archive/`.
- Plan 3's configuration block still holds `workers_at_once: 3` at line 27, removed at plan 3's next resume point (brief 1, Decisions 5); the texts read it as absent until then.
- No step in flight.
- Open on Axel's side: nothing.

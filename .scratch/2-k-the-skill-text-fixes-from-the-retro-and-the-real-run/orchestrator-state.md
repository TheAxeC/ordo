# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.K of `docs/roadmap.md`, the skill-text fixes from the retro and the real run. Rewritten before every step commit of this plan, so it describes this plan as of its own last resume point (`plan-orchestration`, "Resuming, and handing the plan over"). Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

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

- Open item Step 1, three clashes in the written rules (2026-10-13, kind 3: a clash between your written rules, and a change to a Rulings bullet). Three fixes of step 1, written as approved, would contradict a rule that stays on the tree (`agents/reviews/1-brief-check.md`, findings 1.5, 1.6 and 1.8). No brief is written until this is ruled.
  - Question 1. The new rule "No breakage testing" forbids putting old code back to watch a test fail. Rule 13 of both change standards still tells a builder: each time you edit a test, run it again on the old code. Example: a builder writes test T and runs it on the old code, where it fails; then changes the code; then edits T. Rule 13 now wants edited T run on the old code again, and the only way is to put the old code back in a copy. The same demand is in `spec`'s brief template ("Verify before you report" 4) and in `refute`'s Proof findings.
    - Option (a), recommended: a new test runs once on the old code, before the code is changed, and that run is its proof; an edit after that is checked by reading. Rule 13, the brief template and `refute` are reworded to say so.
    - Option (b): keep rule 13 as it is. The two rules keep contradicting each other.
    - Option (c): add the new rule only and change nothing else. The lazy option.
  - Question 2. The approved shared rule says a decision you give outside a plan is "committed in the same turn". A repository set up by `/repo-setup` can have the rule "Commit only when told". In such a repository the two rules order opposite things for the same commit. Also, the approved rule calls it a "ruling", a word Ordo's glossary reserves for your answer to an open item.
    - Option (a), recommended: write it as "**A decision is written down when it is given.** A decision the user gives outside a plan's ledger is written into a file in the repository in the same turn, and committed in that turn where the repository's commit rule allows it, so a compaction or a new session finds it."
    - Option (b): keep the approved words as they are.
    - Option (c): leave the rule out. The lazy option.
  - Question 3. Every report must open with what is NOT done (shared rule "Reports state the end state"). My self-ruled D19 puts the NOT DONE line of the orchestrator's final report after the landed steps and the choices, so that report would not open with it. D19 is wrong.
    - Option (a), recommended: the orchestrator's final report opens with the NOT DONE line (or "everything is done"), and ends with a DONE / NOT DONE table, one row per step. A new Rulings bullet replaces D19.
    - Option (b): keep D19 as it is.
    - Option (c): leave the report's description unchanged. The lazy option.
  - Recommendation: (a), (a), (a). Answer with `Ruled: (a), (a), (a)` or your own choice per question.

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-10-13: Open item A, the step list as drafted: closed under self-rule, C67.

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

- Design: `docs/roadmap.md` entry 2.K, the rulings in `plan.md`, ADR 0010, the retro `.scratch/retros/sessions-2026-10-12.md`, and the run reports `.scratch/archive/2-i-several-plans-in-one-session/agents/reviews/2-report.md` and `4-report.md`. Ledger: `.scratch/2-k-the-skill-text-fixes-from-the-retro-and-the-real-run/`, with `agents/briefs/` and `agents/reviews/`.

## Current position (rewritten before every step commit of this plan)

- 2026-10-13. The plan is opened; nothing has landed.
- Verified: none yet.
- Next step: 1, stopped before its brief on the open item "Step 1, three clashes in the written rules"; the closing waits on it.
- Open on Axel's side: that open item.

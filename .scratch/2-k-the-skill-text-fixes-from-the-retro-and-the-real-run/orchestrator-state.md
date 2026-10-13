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

- Open item Step 1, three clashes in the written rules (2026-10-13, kind 3: a clash between your written rules, and a change to a Rulings bullet). The brief check (`agents/reviews/1-brief-check.md`, findings 1.5, 1.6 and 1.8) found that three fixes of step 1, written as approved, contradict a rule that stays on the tree. No brief is written until this is ruled; every other finding of the check is closed in the brief, as the report's "Closed" heading says.
  - Question 1, no breakage testing against rule 13. Now: rule 13 of `docs/dev/change-standard.md` and of `skills/repo-setup/templates/docs/dev/change-standard.md`, first bullet, says a new or changed test "is run there again after every change to the test" on the unchanged tree (the tree at the step's base), "in the form it has after the change"; `skills/spec/templates/brief.md` "Verify before you report" 4 and `skills/refute/SKILL.md` "The four headings", Proof, ask the same. Once the code has changed, that run needs the old code put back under the new test, which is what your no-breakage rule bans ("a revert or removal of the code under test to watch a test go red").
    - Option (a), recommended: the test is written and run on the unchanged tree before the code changes, and that first run is the proof; a later change to the test is judged by reading, with no second run on the old code. Rule 13's first bullet, brief.md Verify 4 and refute's Proof bullet are reworded to that, beside the new "No breakage testing." rule. Pro: no run ever needs the old code restored, so the two rules agree; the order of work gives the failing run for free. Con: a test changed after its first run carries no failing run of its final form, only a reading.
    - Option (b): keep rule 13 as it stands and read "the unchanged tree" as the real tree at the base, which is not broken on purpose. Pro: the final form of each test keeps a quoted failing run. Con: getting that run after the change means putting the old code back in a copy, the practice your rule names.
    - Option (c): add the rule sentence only and leave the clash. The lazy option: the two rules keep contradicting each other.
  - Question 2, "A ruling is written down when it is given" against the commit rule. Now: the approved sentence for `skills/repo-setup/templates/shared-rules.md` says such a ruling is "committed in the same turn"; the `repo-setup` template `CLAUDE.md` gives a repository the commit rule "Commit only when told, each time.", and `repo-setup` "The questions" 5 asks for it. The glossary's **ruling** is "the user's decision on an open item, typed as `Ruled:`", narrower than this sentence's use.
    - Option (a), recommended: the bullet reads "**A decision is written down when it is given.** A decision the user gives outside a plan's ledger is written into a file in the repository in the same turn, and committed in that turn where the repository's commit rule allows it, so a compaction or a new session finds it." Pro: no clash with a repository that commits only when told, and no second sense for **ruling**. Con: the words differ from the approved proposal.
    - Option (b): keep the approved words, and the commit rule of a repository that sets "commit only when told" holds over them; **ruling** gains the wider sense in the glossary. Pro: your approved words stand. Con: two rules in one CLAUDE.md that say opposite things about the same commit.
    - Option (c): leave the bullet out. The lazy option: the approved fix is not made.
  - Question 3, where the orchestrator's report puts NOT DONE (replaces D19, self-rule). Now: D19 says the orchestrator's report, "after the landed steps and the choices, states anything NOT DONE first"; the shared rule "Reports state the end state" says "The first line says what is NOT done", and `plan-orchestration` Anti-patterns says "Put anything NOT DONE first".
    - Option (a), recommended: the orchestrator's report opens with a line naming anything NOT DONE, or that everything is done; then the position lines with their open items, the landed steps and the choices, as now; then the DONE / NOT DONE ledger, one row per step landed or stopped, naming the landing report or the open item that proves it. A Rulings bullet replaces D19. Pro: agrees with the shared rule and the anti-pattern. Con: none beyond the edit.
    - Option (b): keep D19 as written. Con: the report's first line is not what the shared rule asks.
    - Option (c): leave "Reports" as it is. The lazy option: finding 8 of the second run stays open.
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

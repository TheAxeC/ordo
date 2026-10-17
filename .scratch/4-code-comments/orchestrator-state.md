# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 4 of `docs/roadmap.md`, code-comments. Rewritten before every step commit of this plan, so it describes this plan as of its own last resume point (`plan-orchestration`, "Resuming, and handing the plan over"). Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run once, at landing on main, in order; all must pass. The builder and the reviewer run the checks the brief names for the files the step changes before landing. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/code-comments/templates/strip_comments.test.sh 2>&1 | tail -1
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- python3 skills/repo-setup/templates/sync_rules.py . --only glossary
- sh utils/pin.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md, docs/glossary.md] # files every brief tells the builder to read in full, from .agents/plan.yaml.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:sonnet        # from .agents/plan.yaml.
reviewer: claude:opus        # the model the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill, the review agents of /writing and, under ruling E2, the agents of /code-comments run on.
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

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says; what is settled belongs in the closed list.

- none.

## Closed items (the log of what was raised and how it ended; no report carries it)

- Open item A (2026-10-17), step 1, what `strip_comments.py` computes: closed 2026-10-17 by the user's ruling (a), booked in `plan.md`'s Rulings and under step 1's Step 0.
- Open item B (2026-10-17), step 1, the start and end of the file in `strip_comments.py`'s stripped form: closed 2026-10-17 by the user's ruling (a), booked in `plan.md`'s Rulings and under step 1's Step 0.
- Open item C (2026-10-17), step 2, the size of the agents' prompt: closed 2026-10-17 by the user's ruling (a), booked in `plan.md`'s Rulings and under step 2's Step 0; step 1a added.
- Open item D (2026-10-17), step 2, the tag and the pin before the gate run: closed 2026-10-17 by the user's ruling (a), booked in `plan.md`'s Rulings; `v8.2.0-rc.2` tagged on `7481267` and pinned.
- Open item F (2026-10-17), step 2, the tag and the pin after step 1b: closed 2026-10-17 by the user's ruling (a), booked in `plan.md`'s Rulings; `v8.2.0-rc.3` tagged on `436760d` and pinned.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option; nothing asked of Axel that an agent can do.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <slug>-<step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, 127 when `python3` is not installed, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The step's own check, named on its line in `plan.md` and in its brief, run from the repository root.
- The `verify` list above runs through the `land` skill's `templates/checks.sh <state file>` from the root of main's checkout, once, at landing. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what the booking quotes. The builder and the reviewer run the checks the brief names for the files the step changes before landing.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 4, the rulings in `plan.md` (D1 to D9, E1 and E2), ADR 0014. Ledger: `.scratch/4-code-comments/`, with `agents/briefs/` and `agents/reviews/`.
- game-engine is read only: the gate runs in a scratch clone of it at `a0aa831`, never in its checkout.

## Current position (rewritten before every step commit of this plan)

- 2026-10-17. Step 2 of 4, the gate run, done: the report shown, findings 1 to 4 and 6 to 33 rewritten, `equal` for each of the 10 files; booked in `plan.md`.
- Step 3, the closing: the closing report `agents/reviews/closing.md` written; the ticked roadmap entry, the move to the archive and the final tag and pin wait for the user.
- Open on Axel's side: the gate's reading of the report as useful, the closing's roadmap diff, and the final tag and pin.

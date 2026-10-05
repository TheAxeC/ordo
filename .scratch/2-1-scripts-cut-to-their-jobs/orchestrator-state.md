# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for roadmap entry 2.1, Scripts cut to their jobs. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run once, at landing on main, in order; the builder and the reviewer run the checks the brief names for the files the step changes; all must pass. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/land/templates/checks.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
- sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
- sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
- sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
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
worker: claude:sonnet        # the default worker.
reviewer: claude:opus        # the model /refute runs on, as a fresh read-only agent.
libraries: avoid             # from .agents/plan.yaml: no new dependency.
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
workers_at_once: 3           # steps in flight at once, from .agents/plan.yaml.
bench: []                    # no A/B.
adr: docs/adr                # the ADR folder: grill writes the decision records into it, /plan, /spec and /refute read them.
design_bar: industry         # what grill's options are held to: industry, state-of-the-art or novel.
design_references: []        # the published standards a design is held to, such as WCAG 2.2 AA.
worker_effort: high          # the effort a builder runs at: low, medium, high, xhigh or max.
reviewer_effort: high        # the effort a reviewer and a brief-check agent run at: low, medium, high, xhigh or max.
self_rule: on                # the plan runs under self-rule (ruling "Self-rule on").
next_entry: on               # copied from .agents/plan.yaml; after the closing, next-entry mode reads .agents/plan.yaml itself.
repair_reviewer: claude:sonnet  # the model the run of /refute over a repair round runs on, from .agents/plan.yaml.
```

```yaml
dispatch: none
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says; what is settled belongs in the closed list.

- Open item D (2026-10-06), kind 3 (the reversal of a ruling), raised from step 2's review (`agents/reviews/2-refuter.md`, "3. Standards" 1): plan 3's ledger, `.scratch/3-the-writing-base/plan.md`, opened and not started, still copies entry 3's old gate and rests on its planted text: its "## Gate" section and the gate questions under it, step 2 ("The runs: a planted text with one break of each rule of `references/` ..."), step 3's check ("every planted break named"), and its rulings D9, Open item Gate 3 and Open item Gate 3b, which you ruled when the planted clauses were added. Step 2 of plan 2.1 removed those clauses from the roadmap by your approval of entry 2.1 and your ruling C.
  - (a) Carry the change into plan 3's ledger now: its gate copied again from the roadmap, the gate questions rewritten to match, step 2 running `/writing` on the real manuscript and the real grant only, step 3's check reading "every finding marked right by both reviewers", and a Rulings bullet in plan 3 saying that plan 2.1's ruling C replaces the planted-text parts of D9, Gate 3 and Gate 3b. Pro: plan 3's ledger agrees with the roadmap before anything is built on it. Con: it rewrites rulings of yours in another plan's ledger.
  - (b) Leave plan 3's ledger, and let plan 3's own `/spec` meet the difference as a false premise when it runs. Pro: no change to plan 3 now. Con: plan 3 stays in contradiction with the roadmap until then, and its `/spec` stops on it then.
  - Recommendation: (a). The lazy option is (b). Plan 2.1 goes on: none of its steps depends on the ruling.

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-10-05: Open item C, step 2, entry 3's planted-text clauses: ruled (b) by the user, booked in `plan.md` Rulings.
- 2026-10-05: Open item B, the case rule in the shared rules (`skills/repo-setup/templates/shared-rules.md`): ruled (a) by the user, step 3 adds it, booked in `plan.md` Rulings.
- 2026-10-05: Open item A, step 1, three brief-check findings (the case rule's cost test, the place of the scripts-page line, what "fewer than 20 lines" counts): ruled A1 (a), A2 (a), A3 (a) by the user, booked in `plan.md` Rulings.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; scripts compute facts, judgment is read; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking (the user runs it at step 1's landing). research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The `verify` list above runs through `sh skills/land/templates/checks.sh <state file>` from the root of main's checkout, once, at landing. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what a report or a booking quotes.
- The step's own check, named on its line in `plan.md` and in its brief.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 2.1. Ledger: `.scratch/2-1-scripts-cut-to-their-jobs/`, with `agents/briefs/` and `agents/reviews/`.
- The data the steps read, and who may change it: the tree of Ordo; `~/.local/share/ordo-stable` and the skill links change only through the user's `utils/pin.sh <tag>`.
- Anything running that a step must not disturb: none.

## Current position (rewritten before every step commit)

- 2026-10-05. The plan is opened; no step has started.
- Step 1 landed; main tagged v3.0.0. Step 2 landed. Next step: 3, the scripts. Step 3's landing also deletes every `.py` and `.sh` file under `.scratch/` (`git ls-files '.scratch/*.py' '.scratch/*.sh'`, eight files) and makes the verify list of each open plan's state file equal to `docs/dev/building.md`'s, since the landing script leaves the ledger out of the worktree. The user ran `utils/pin.sh v3.0.0`. By the user's order, plans run one at a time: 2.1 first, then 2.F.
- Open on Axel's side: none.

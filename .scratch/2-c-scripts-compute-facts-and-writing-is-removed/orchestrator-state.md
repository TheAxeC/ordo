# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.C of `docs/roadmap.md`, scripts compute facts, and /writing is removed. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/land/templates/checks.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh utils/pin.test.sh 2>&1 | tail -1
- sh utils/check_coverage.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md] # files every brief tells the builder to read in full, from .agents/plan.yaml.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:opus          # the default worker.
reviewer: claude:opus        # the model /refute runs on, as a fresh read-only agent.
libraries: avoid             # from .agents/plan.yaml: no new dependency.
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
workers_at_once: 1           # steps in flight at once.
bench: []                    # no A/B.
```

```yaml
dispatch:
  step: 5
  executor: agent
  worker: claude:opus
  worktree: .agents/worktrees/2c-5
  base: 659c1eeee929fc8411ce6b0a812fb8cb56510a5d
  launched: 2026-09-29
  report: .scratch/2-c-scripts-compute-facts-and-writing-is-removed/agents/reviews/5-report.md
  landing: not-started
  round: 0
  session_id: aff737080ccfb46ce
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

None.

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-09-29: step 7's roadmap diff approved by the user and written (51ca1a5).
- 2026-09-29: open item C, the ASCII check's exit status and `__pycache__`: ruled (a), step 5 is widened to fix both.
- 2026-09-29: open item D, `utils/pin.sh` line 69: ruled (a), deleted at step 6's landing.
- 2026-09-29: step 6's removed cases approved by the user.
- 2026-09-29: step 4's case hand-back ruled by the orchestrator inside the brief (`agents/briefs/4-cases.md`).
- 2026-09-29: open item B, the tag and the pin: ruled (a), yes; main tagged v2.2.0 at 9a382b5 and `utils/pin.sh v2.2.0` run.
- 2026-09-28: open item A, who runs the verify list: ruled (b), a separate script `skills/land/templates/checks.sh <state file>` that the builder, the reviewer and `land.sh` run; the user approved its name and what it computes.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; scripts compute facts, judgment is read; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it. Until step 3's pin, the installed `land` skill is v2.1's, so steps land through `skills/land/templates/land.sh` of this checkout, run by path.
- The `verify` list above runs through `sh skills/land/templates/checks.sh <state file>` from the root of the checkout it checks, the worktree and then main. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what a report or a booking quotes.
- The step's own check, named on its line in `plan.md` and in its brief.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 2.C, and the rulings in `plan.md`. Ledger: `.scratch/2-c-scripts-compute-facts-and-writing-is-removed/`, with `agents/briefs/` and `agents/reviews/`.
- The v2.0.0 tag holds the text step 1 restores: `git show v2.0.0:<path>`.
- The comparison with other skill packs, its rulings and the count of past findings by cause: `.scratch/comparison-2026-09-28/`.
- Nothing running that a step must not disturb.

## Current position (rewritten before every step commit)

- 2026-09-29. Steps 1 to 4, 6 and 7 done. Step 7: the roadmap change the user approved, commit 51ca1a5. Step 6: the four test files hold only cases whose failure costs something; `utils/pin.sh` line 69 deleted.
- Verified: `sh skills/land/templates/checks.sh` on this state file on main, `checks: 7 commands passed`, exit 0.
- In flight: step 5, the rules, widened by open item C and carrying rule 15; its builder runs in `.agents/worktrees/2c-5`.
- Open on Axel's side: nothing until step 5's rules diff is ready for his reading.
- Also done outside the plan: the sentence "Write for a reader who was not inside my reasoning..." added to the plain-prose rule of `~/.claude/CLAUDE.md`, on Axel's yes.

# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 3 of `docs/roadmap.md`, the writing base. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/land/templates/verify.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh utils/pin.test.sh 2>&1 | tail -1
- sh utils/check_coverage.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: []                # files every brief tells the builder to read in full; .agents/plan.yaml names none (open item A).
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
dispatch: none
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

- Open item A (2026-09-28, the files every brief tells the builder to read): `.agents/plan.yaml` has no `standards` key, so the configuration block above lists none, and a builder of this plan would not be told to read `docs/dev/skill-layout.md` or the prose standard, which steps 1 to 4 are judged against. (a) Add `standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md]` to `.agents/plan.yaml` and to the block above now; step 1 then changes the prose standard's path in both, with the other references it moves. Pro: every brief points the builder at the two pages, and every later plan gets them too. (b) Leave `standards` empty and name the two pages in each brief by hand. Con: a brief that forgets them leaves the builder without them; this is the lazy option. Recommendation: (a).

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-09-28: the step list, and questions 1 and 2 of the draft: approved; question 1 (a), question 2 (a).

## The standing demands (from Axel, in force)

- `~/.claude-work/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- The ledger's landing script, from the repository root: `sh .scratch/3-the-writing-base/land.sh <step branch> <base> --session <session log> --since <previous landing commit time>`. It commits a wip in the worktree, copies the step's commits onto main (or prints `nothing to copy` when there are none), runs the verify list on main through `verify.sh`, and prints the booking data; exit 0 passes, 1 is a red check or a stop, 2 a conflict. `land.test.sh` beside it proves it.
- The `verify` list above runs through the `land` skill's `templates/verify.sh <state file>` from the root of the checkout it checks, the worktree and then main, and the lines it prints are what a report or a booking quotes.
- The step's own check, named on its line in `plan.md` and in its brief.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 3, `docs/academic-coverage.md` (the three `rebuild: writing` rows), `docs/dev/skill-layout.md`. Ledger: `.scratch/3-the-writing-base/`, with `agents/briefs/` and `agents/reviews/`.
- The source files the steps read, read only: `/Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper/references/academic_writing_style.md`, `writing_judgment_framework.md` and `writing_quality_check.md`.
- Nothing running that a step must not disturb.

## Current position (rewritten before every step commit)

- 2026-09-28. The plan is opened; nothing has landed. The installed skills are v2.0.0.
- Next step: 1, the prose standard moved, because steps 2 and 3 name its new path.
- Open on Axel's side: open item A.

## Usage

| step | worker (tokens / tool uses / wall) | reviewer (the review; the runs over the repair rounds) | repair rounds | findings sent back | lines +/- | first report passed | fixes at landing | findings booked for the user | orchestrator messages | orchestrator output tokens | orchestrator cache-write tokens | orchestrator cache-read tokens | orchestrator fresh input tokens | orchestrator minutes | the look |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|

# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.D of `docs/roadmap.md`, the plan skills take the comparison's process changes. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/land/templates/checks.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh utils/pin.test.sh 2>&1 | tail -1
- sh utils/check_coverage.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
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
  step: 1
  executor: agent
  worker: claude:opus
  worktree: .agents/worktrees/2d-1
  base: 8bb98e80a01c23d4dd55eb42499b6b0bbd5c9dc8
  launched: 2026-09-29
  report: .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/agents/reviews/1-report.md
  landing: not-started
  round: 1
  session_id: aa7c9f7235df0acd8
  builder_usage: round 0, 100397 tokens, 23 tool uses, 270 s
  reviewer_report: .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/agents/reviews/1-refuter.md, first run, 110523 tokens, 22 tool uses, 277 s
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

- A (2026-09-29, step 1): what "one trigger per case" means in `docs/dev/skill-layout.md`, Frontmatter. The ruling says "a description is a trigger (front-load the leading word, one trigger per case)". Step 1 wrote "`Triggers on:` lists one phrase for each case the skill is for.", and `/spec`'s description keeps four phrases for its one case (`spec <entry> <step>, brief <step>, prepare step <n>, write the brief`). Options: (a) each case the skill is for has at least one trigger phrase, and several phrasings of one case are allowed; the page sentence says so; pro: every case is covered and a request worded differently still matches; con: longer lists, and the line between a case and a phrasing is judged by reading. (b) exactly one phrase per case; `/spec` keeps one of its four and the other skills are brought in line by roadmap entry 23; pro: short lists; con: a request worded as "write the brief" or "prepare step 3" no longer matches its phrase. Recommendation: (a), since the purpose of the trigger list is that each case is found, and the other phrasings are how a request worded differently is found. (a) is also the cheaper option, since no description changes; it is recommended for the matching, not the cost.

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-09-29: the step list: approved by the user as drafted.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; scripts compute facts, judgment is read; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The `verify` list above runs through `sh skills/land/templates/checks.sh <state file>` from the root of the checkout it checks, the worktree and then main. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what a report or a booking quotes.
- The step's own check, named on its line in `plan.md` and in its brief.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 2.D, the rulings in `.scratch/comparison-2026-09-28/rulings.md` (the table "Ruled") and `findings-by-cause.md` beside it, and the rulings in `plan.md`. Ledger: `.scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/`, with `agents/briefs/` and `agents/reviews/`.
- The comparison's source repositories were cloned under an earlier session's scratchpad and are not kept; the rulings file quotes what the steps need.
- Nothing running that a step must not disturb.

## Current position (rewritten before every step commit)

- 2026-09-29. Plan opened; nothing landed. Main at the opening commit, working tree clean.
- Verified: `sh skills/land/templates/checks.sh` on this state file on main, before the opening commit.
- In flight: step 1, the writing rules for skill text; repair round 1 sent to its builder in `.agents/worktrees/2d-1`.
- Open on Axel's side: open item A.

# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.F of `docs/roadmap.md`, diagnose. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

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

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)


- Step 4, the call on the blind comparison (raised 2026-10-12; kind 5, your call). The rerun on the landed `diagnose` 2.1.0 is recorded at `agents/reviews/4-blind-comparison.md`. Both judges prefer `diagnosing-bugs` (judge 1 chose B, judge 2 chose A; the key puts `diagnosing-bugs` on both). Both name the same two failures of the `diagnose` output: (1) its "Not reproduced" section says the pin removed no links, which `utils/pin.sh:430-438` and its own quoted stderr contradict; (2) its record saw that the agent-folder derivation at `utils/pin.sh:112` also takes a last `.` as a folder name, and its fix left that line unchanged, because the new Steps 15 classes an input wrong at another operation as "another defect" and leaves it unfixed. Both judges rate the `diagnose` side's comparison and test above the other side's.
  - Option (a), recommended: call it a loss. Step 4 stays unticked, and a new step before the closing changes `diagnose` on the two causes, then runs the comparison again: an operation that breaks the same rule on the same value (here line 112 reading the same spelling) is part of the defect and fixed with it, and only an operation breaking another rule is another defect; a part of the symptom the red command does not show is read in the code that would produce it before the record or the message calls it not reproduced. Pro: it acts on what both judges found, which the text of 2.1.0 caused. Con: one more step and one more comparison (this one cost about $3.76 at list price for the sides and judges).
  - Option (b): call it a tie or a win. Pro: step 4 ticks and the plan closes. Con: both judges, read through the key, chose the other side, so the record does not support it. This is the lazy option.

## Closed items (the log of what was raised and how it ended; no report carries it)

- Step 3 reading (2026-10-05): Axel ruled (a); the real run is approved; step 3 is ticked once step 3a's comparison has his call.
- Pricing the diagnosis agent (2026-10-05): Axel ruled (a), the computation approved word for word; step 3b added.
- The reviewer comment in plan.yaml (2026-10-05): Axel ruled (a); the three comments changed in the same commit.
- Step 3, the call on the blind comparison (2026-10-05): Axel ruled (a); `diagnose` loses this run; step 3a added to plan.md, then the comparison runs again.
- Step 1 reading (2026-09-30): approved by Axel; step 1 ticked.

- A script for the person-driven red command (2026-09-30): Axel ruled (a); step 2a.

- The investigation of /spec and /diagnose (2026-09-30): Axel ruled (a); step 2b.

- Step 3, who runs `/diagnose` (2026-09-30): Axel ruled (a): he runs it on a scratch copy the orchestrator prepares.
- 2026-10-12: Step 3b against plan 2.1: ruled (b) by the user, step 3b removed and step 3a renumbered 4, booked in `plan.md` Rulings ("Steps 3a and 3b").
- 2026-10-12: Step 3's tick: ruled by the user, step 3 ticked and the win-or-tie condition moved to step 4, booked in `plan.md` Rulings ("Step 3 ticked").

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; scripts compute facts, judgment is read; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, 127 when `python3` is not installed, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The `verify` list above runs through `sh skills/land/templates/checks.sh <state file>` from the root of the checkout it checks, the worktree and then main. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what a report or a booking quotes.
- The step's own check, named on its line in `plan.md` and in its brief.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 2.F and the rulings in `plan.md`. Ledger: `.scratch/2-f-diagnose/`, with `agents/briefs/` and `agents/reviews/`.
- The reference skill mattpocock `diagnosing-bugs`: github.com/mattpocock/skills at d81f3a1, `skills/engineering/diagnosing-bugs/`, cloned into the session's scratch folder; clone it again at that commit when it is gone.
- Plan 2.E runs at the same time from `.scratch/2-e-grill/`; a step of this plan whose paths meet a 2.E step in flight waits for it to land.

## Current position (rewritten before every step commit)

- 2026-10-12. Steps 1, 2, 2a and 3 ticked; step 4 landed on main, not ticked: the blind comparison of step 3 runs again on the landed `diagnose`, and step 4 is ticked on Axel's call that `diagnose` wins or ties. The rerun is recorded at `agents/reviews/4-blind-comparison.md`; both judges prefer `diagnosing-bugs`. Next: Axel's call on it.
- Open items for you: "Step 4, the call on the blind comparison".

# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.E of `docs/roadmap.md`, grill. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/land/templates/checks.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
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
worker: claude:opus          # the default worker.
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
```

```yaml
dispatch:
- step: 3
  executor: agent
  worker: claude:opus
  worktree: .agents/worktrees/2e-3
  base: 44caaf6f2c34b7b25ec06d31c21ad711a0adbf01
  launched: 2026-09-29 21:44
  session_id: a4e5bce8772d0d657
  report: .scratch/2-e-grill/agents/reviews/3-report.md
  builder_usage: 270520 tokens, 83 tool uses, 1857 s
  cases_ruling: .scratch/2-e-grill/agents/briefs/3-cases.md (after the build; applies to 3 and 3s)
  reviewer_report: .scratch/2-e-grill/agents/reviews/3-refuter.md (197731 tokens, 33 tool uses, 621 s)
  brief_check: .scratch/2-e-grill/agents/reviews/3-brief-check.md (173243 tokens, 33 tool uses, 520 s)
  landing: not-started
  round: 0
- step: 3s
  trial: launched as the Sonnet 5.5 build of step 3 under the ruling "Sonnet trial"; it ran on claude-sonnet-5 (Sonnet 5), since the session was then Claude Code 2.1.283, whose `sonnet` alias gives claude-sonnet-5 (every model field of agent-afb733385e80a6b22.jsonl reads claude-sonnet-5); kept as a data point; only one of 3, 3s and 3s55 lands
  executor: agent
  worker: claude:sonnet (ran as claude-sonnet-5)
  worktree: .agents/worktrees/2e-3s
  base: 44caaf6f2c34b7b25ec06d31c21ad711a0adbf01
  launched: 2026-09-29 22:00
  session_id: afb733385e80a6b22
  report: .scratch/2-e-grill/agents/reviews/3s-report.md
  builder_usage: 322209 tokens, 118 tool uses, 1805 s
  reviewer_report: .scratch/2-e-grill/agents/reviews/3s-refuter.md (175588 tokens, 37 tool uses, 526 s)
  landing: not-started
  round: 0
- step: 3s55
  trial: the Sonnet 5.5 build of step 3 under the ruling "Sonnet trial", launched under Claude Code 2.1.285, whose `sonnet` alias gives claude-sonnet-5-5 (probe: a `claude -p` session's general-purpose agent with model sonnet recorded claude-sonnet-5-5); the same prompt as 3s with its paths; only one of 3, 3s and 3s55 lands
  executor: agent
  worker: claude:sonnet (claude-sonnet-5-5 under 2.1.285)
  worktree: .agents/worktrees/2e-3s55
  base: 44caaf6f2c34b7b25ec06d31c21ad711a0adbf01
  launched: 2026-09-29 23:25
  session_id: ae2714d2e377ffba9 (transcript model field: claude-sonnet-5-5, Claude Code 2.1.285)
  report: .scratch/2-e-grill/agents/reviews/3s55-report.md
  builder_usage: 205260 tokens, 47 tool uses, 1001 s
  landing: not-started
  round: 0
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

none

## Closed items (the log of what was raised and how it ended; no report carries it)

- Sonnet trial (2026-09-29): Axel ruled (a), a controlled trial of Sonnet 5.5 as builder on one step; booked in plan.md Rulings.

- C, for step 5 (2026-09-29): Axel: "Approved, read", on step 5's three pages as landed; the default `.clang-tidy` stays without `WarningsAsErrors`.

- C, for step 4 (2026-09-29): Axel: "Open item C: => Approved", on step 4's two pages as printed to him; step 4 landed with them.

- B (2026-09-29, found by step 5's brief check). Roadmap entry 11's goal (`docs/roadmap.md:108`) names "the Python standard (ruff, pyright in standard mode, Python 3.10 or newer) and the C++ standard", which step 5 of this plan delivers as `coding-standards/python.md` and `cpp.md`. After step 5 lands, entry 11 names work already done. Entry 11's gate does not check the standards, so only its goal is affected. Options: (a) at step 5's landing, change entry 11's goal to "`repo-setup` renamed to `scaffold`, with the `library` and `research-project` profiles, hub-specific config, and Ordo's own `CLAUDE.md`." through `/roadmap`, in one commit, the approval of this option being the approval of that diff; (b) make the same change at 2.E's closing step; (c) leave entry 11 as it is. Recommendation: (a), since the entry is wrong from the moment step 5 lands and the change is one line. (b) leaves the roadmap wrong for the rest of the plan; (c) is the lazy option, leaving a roadmap entry that asks for work that exists. Step 5 does not wait on this ruling. Ruled (2026-09-29): (a).

- 2026-09-29: open item A (step 12a, how the figures are drawn): ruled (a), a generator script `docs/figures/gen_figures.py` that computes only the SVG files from the boxes, arrows and labels written in it; no test.

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

- Design: `docs/roadmap.md` entry 2.E and the rulings in `plan.md`. Ledger: `.scratch/2-e-grill/`, with `agents/briefs/` and `agents/reviews/`.
- mattpocock's skills (`grilling`, `grill-with-docs`, `domain-modeling`) for step 14 and as a reference for step 12: github.com/mattpocock/skills at commit d81f3a1, cloned into the session's scratch folder; clone it again at that commit when it is gone.
- The sources of the default pages: game-engine `docs/dev/coding-standards.md`, cathedra `docs/dev/standards/coding-standards.md`, research-hub `tools/oculus/DESIGN.md`, `tools/oculus/eslint.config.js`, `tools/oculus/tests/checks/` and `tools/oculus/.scratch/migration/agents/spec.md`, and for step 12a research-hub `tools/figures/gen_figures.py` and `plan-loop.svg`, which research-hub embeds in `docs/AGENT-APPROACH.md`. game-engine, cathedra and research-hub are read only, except step 15's one line in each of game-engine's and cathedra's `.agents/plan.yaml`.
- Nothing running that a step must not disturb.

## Current position (rewritten before every step commit)

- 2026-09-29. Steps 1, 2, 4 and 5 are on main; roadmap entry 11's goal changed as ruling B (a) says (cb92d65).
- Step 3: built twice under the ruling "Sonnet trial": Opus in `.agents/worktrees/2e-3` (reviewed, `3-refuter.md`) and Sonnet 5.5 in `.agents/worktrees/2e-3s` (built, `3s-report.md`, not yet reviewed). Paused at Axel's request for a restart, with no agent running.
- Next on resume: a fresh Opus reviewer of the Sonnet build (`/refute`, the same instructions as the Opus build's, report saved as `3s-refuter.md`); then the comparison goes to Axel; the winning build gets its repair round and lands, and the other worktree and branch are removed.
- Open on Axel's side: nothing yet; the trial's comparison comes to him after the second review.

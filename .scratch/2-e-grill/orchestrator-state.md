# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.E of `docs/roadmap.md`, grill. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/land/templates/checks.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
- sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
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
reviewer: claude:opus        # the model /refute, the brief check and the lookups of /grill run on, as a fresh read-only agent.
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
reviewer_effort: high        # the effort a reviewer, a brief-check agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
```

```yaml
dispatch: none
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

- Step 9a, the two rulings the revert removed (2026-09-30, stop at /spec, from the brief check `agents/reviews/9a-brief-check.md`, check 2 finding 1): before the commit 8633553 ("Revert main to its state at 2bb8bd8", which undid 36 commits "whose work came from repeated brief checks of the same steps"), you had ruled (a) on two open items of step 9a: "Step 9a, how a skill is given the ruling and what the ruling must hold" (booked in cde9136) and "Step 9a, a file of `/repo-setup`'s draft that comes from no template" (booked in f3288ab). The revert removed both lines from `plan.md`, so this `/spec` found neither, and its brief gave the ruling no argument of its own, which is option (b) of the first open item, the one named the lazy option there. The brief check found 20 further findings in that brief; among them, `/roadmap add` cannot tell a quoted ruling from its own goal, a one-line ruling cannot hold a `/repo-setup` change, the figures' legend "it waits on you each time it runs" becomes false, and the builder's scratch runs need git commands the rules file forbids it. The design your two rulings chose closes each of them. Both texts, with the option (a) they approve, are at `git show 87130cc:.scratch/2-e-grill/plan.md`, section "Step 0 of step 9a".
  - (a) Both rulings stand. They are booked again in the Rulings section word for word, and step 9a's line gets back the tag `(ruling Step 9a, how a skill is given the ruling and what the ruling must hold)`. `/spec` then writes the brief to that option (a): `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` and `/grill` take `--ruling <ledger file> "<name>"`; a quoted ruling is the bullet of that name ending "(the user)" with its sub-bullets, written by the session that books the ruling; the skill drafts from it and writes with no stop only a draft that is the ruled change; the per-skill rules, the record in the commit or the list of files, the "every run" sentence in the README, the glossary and the figure (regenerated by `docs/figures/gen_figures.py`), and five scratch runs by fresh agents before the landing in place of the builder's; and a file from no template counts as ruled only when the ruling holds its full text. The brief is not checked a second time (the check runs once per step): the other findings of this report are closed in it. The orchestrator's own "Step 9a, the round's choices" of the reverted run is not booked again; what the new review raises is decided anew. Pro: your two decisions stand, and they close the findings. Con: the step writes about twelve files, the figure script among them.
  - (b) The revert withdrew both rulings. The brief is written as this `/spec` drafted it (saved outside the ledger), each finding closed in it, with the ruling quoted as plain words after the command. Pro: fewer new shapes. Con: a skill cannot tell the ruling from its own argument, the problem your first ruling chose (a) to end. This is the lazy option.
  - Recommendation: (a). The revert's stated reason was the repeated brief checks, not your design rulings, and (a) is the design you already chose after weighing (b).

## Closed items (the log of what was raised and how it ended; no report carries it)

- The pin at v2.6.0 (2026-09-30): Axel ruled (a) and ran the pin; 13 skills and 5 agents linked at v2.6.0 (ca8ae3e), booked in plan.md Rulings.

- Approval stops under a ruling (2026-09-30): Axel ruled (a); step 9a added after step 12a, booked in plan.md Rulings.

- Old rule 13 in game-engine and cathedra (2026-09-30): Axel ruled (a); step 15 rewrites rule 13 in both repositories.

- The old skill name in other repositories (2026-09-30): Axel ruled (a) and that research-hub's files are changed too; step 15 carries it, every edit left for Axel to commit.

- Step 6 reading (2026-09-30): approved by Axel; step 6 ticked.

- Step 12 reading (2026-09-30): approved by Axel; step 12 ticked.

- Step 12a reading (2026-09-30): approved by Axel; step 12a ticked.

- Step 3, "Sonnet trial" (2026-09-29): which build of step 3 lands, and the builder model after it. Builds: Opus 5.5 (`2e-3`, review `3-refuter.md`), Sonnet 5 (`2e-3s`, `3s-refuter.md`), Sonnet 5.5 (`2e-3s55`, `3s55-refuter.md`). Options: (a) land the Opus 5.5 build and set `worker:` to Sonnet 5.5 for the next three code steps, measured by their landing reports; (b) land the Opus 5.5 build and keep Opus as builder; (c) land the Sonnet 5.5 build and set `worker:` to Sonnet 5.5. Recommendation: (a). The lazy option is (b), which ends the trial on one sample. Ruled (2026-09-29): (a); booked in plan.md Rulings as "Sonnet trial result".

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

- 2026-09-30. Steps 1 to 12a landed and ticked. Axel's rulings of the morning are booked (plan.md Rulings, 2026-09-30, "(the user)").
- Step 9a stopped at /spec on the open item "Step 9a, the two rulings the revert removed"; its brief check has run (`agents/reviews/9a-brief-check.md`) and is not run again. Step 13 is in progress: `/grill 3` with Axel, its rulings in `.scratch/rulings/3-the-writing-base.md`.
- Next: step 9a after the ruling; step 13, `/grill` on entry 3 with Axel, D1 (b) and D2 (a) settled; step 14 after 13; step 15 done and ticked, its edits in game-engine, cathedra and research-hub left for Axel to commit.

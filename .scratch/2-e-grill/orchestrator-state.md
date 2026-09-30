# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 2.E of `docs/roadmap.md`, grill. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/land/templates/checks.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
- sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
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

- Step 9a, how a skill is given the ruling and what the ruling must hold (2026-09-30, stop at /spec, from the brief check `agents/reviews/9a-brief-check.md`): your ruling "Approval stops under a ruling" has the orchestrator quote the ruling and the skills skip an approval stop when the draft is the change the ruling states. The brief check walked each skill under a brief that built this with the ruling named in plain words, and found that a session would still stop, or would write what you never ruled. What it shows:
  - A skill cannot tell a named ruling from its own argument: in `/roadmap add <goal>` everything after `add` is the goal.
  - Most rulings have no line in a Rulings section, and the option's text is often not in `plan.md` at all (this plan's own `plan.md` has no "Step 0" heading), so the skill finds nothing to compare the draft with.
  - A Rulings line "decided by the orchestrator" is accepted as yours unless the skill checks that the line ends "(the user)".
  - `/roadmap` and `/plan` draft in their own words, so the draft differs from the ruled text on every run unless the skill drafts from the ruling.
  - `/repo-setup`'s ten answers hold none of `/ordo-init`'s keys, so `/ordo-init` inside it stops anyway; files that come from no template (build files, a fetched licence, pages adapted from a sibling repository) have no rule.
  - The README's stops figure, its sentence and the glossary's "every run" say such a stop "waits on you each time", which the change makes false.
  - The rules file forbids a builder every git command that changes state, so the builder cannot make the scratch runs of the step's check.
  - (a) The ruling is a bullet the skill reads, given by an option of the invocation. Your ruling on (a) approves all of the following:
    - The invocation form. `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` and `/grill` take `--ruling <ledger file> "<name>"` as their last arguments, shown in each Quick start. The glossary gains the term **quoted ruling** for it.
    - What a quoted ruling is. The bullet of that file's Rulings section (or of a rulings file) whose name is `<name>` and which ends "(the user)", with the sub-bullets under it. The session that books your ruling on an option that runs a skill writes that bullet, with the change the option stated copied under it as sub-bullets (`spec` "Steps / A ruling" and `plan-orchestration` "Stops" say so). A file that does not exist, a name it does not hold, or a bullet that does not end "(the user)" is no ruling: the skill says so and every stop stands.
    - What the skill does with it. It drafts from the ruling's text, applies its own rules, and compares. A draft that is the ruled change is written with no stop. A draft that differs in anything is shown whole with each difference named, and the stop stands whole; nothing is written in part.
    - `/roadmap`: every change of `add`, `move`, `done`, `drop`. For `add`, a ruled gate that could pass without the goal is not redrafted: it is shown with its answer, and the stop stands. The level, the insertion form and the dependencies are taken from the ruled entry.
    - `/plan`: written with no stop only when each step and its check are the ruling's (the closing step `/plan` adds itself does not count as a difference), every answer in "## Gate" is no, no design decision is named as unsettled and no rulings-file line is left to place. The step lines end `(approved)`, and the ruling's bullet is copied into the new plan's Rulings unless the rulings file already gave it.
    - `/ordo-init`: covered when the ruling states the form, each key with its value, the `.gitignore` change, and the full text of each page to create; a page whose text the ruling does not hold is shown and the stop stands. The stops "Several roadmaps" and "Worker, reviewer and libraries" are skipped for a key the ruling states. The commit rule is the ruling's, or the commit question alone is still asked. A fix to an existing file that the ruling states is made with no stop. Rules 5 gains the exception.
    - `/repo-setup`: covered when the ruling answers all ten questions and states `worker`, `reviewer` and `libraries` for `/ordo-init`, and every file of the draft comes from a template and the answers. `/ordo-init` inside it takes the same ruling and the keys it derives from the tree just written count as stated. A file that comes from no template is shown and the stop stands.
    - `/repo-setup sync`: covered when the ruling holds the hunks and the choice for each, and the diff the run shows is those hunks; otherwise the stop stands.
    - `/grill`: the roadmap diff is written with no decision asked when it is the ruled text and the changed gate's answer is no.
    - The record. The commit message names the ruling by its name and its ledger file; where no commit is made, the list of files written names it.
    - The pages that say "every run". The README's sentence, the stops figure (`docs/figures/gen_figures.py` and its SVG) and the glossary's line say the stop waits each time "unless the run is under a quoted ruling that states the change". `plan-orchestration`'s rule that every skill is invoked through the runner names the five skills.
    - The check. The builder makes no scratch run. Before the landing the orchestrator starts five fresh agents, one per run, each following the changed `roadmap` skill in a scratch repository: the ruled change is written with no stop and its commit names the ruling; a gate that could pass stops; a name the file does not hold stops; a place the skill's own rules reject stops; a bullet that does not end "(the user)" stops. Each run's result is booked.
    - Pro: the skill has a text to read and one rule for when it may skip, and nothing is written that you did not rule. Con: a new argument on five skills, and the step writes about twelve files.
  - (b) As (a), without the `--ruling` argument: the session names the ruling in plain words after the command. Pro: no new argument. Con: the skill cannot tell the ruling from its own argument, which the brief check showed for `/roadmap add` and `/plan`. This is the lazy option.
  - (c) Step 9a is dropped: an approval stop always stands, and an option that runs a skill names that stop, as the skills say today. Pro: no change. Con: each such ruling of yours is followed by a second stop for the same change, which is what the ruling "Approval stops under a ruling" set out to end.
  - Recommendation (a): it is the only one of the three in which a skill can check what you ruled before it writes.

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
- Step 9a is stopped at /spec on the open item "Step 9a, how a skill is given the ruling and what the ruling must hold".
- Next: step 9a once ruled; step 13, `/grill` on entry 3 with Axel, D1 (b) and D2 (a) settled; step 14 after 13; step 15 done and ticked, its edits in game-engine, cathedra and research-hub left for Axel to commit.

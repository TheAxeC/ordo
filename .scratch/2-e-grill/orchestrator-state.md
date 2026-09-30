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
```

```yaml
dispatch:
- step: 11
  executor: agent
  worker: claude:sonnet
  worktree: .agents/worktrees/2e-11
  base: acb79f6f2e85ffefe34480767e2692ee55c7e280
  launched: 2026-09-30 02:57
  session_id: ae449ee78f0bf9ddf (claude-sonnet-5-5 at the launch, from its transcript, Claude Code 2.1.285)
  report: .scratch/2-e-grill/agents/reviews/11-report.md
  brief_check: .scratch/2-e-grill/agents/reviews/11-brief-check.md (claude-opus-5-5; 172226 tokens, 33 tool uses, 387 s)
  landing: not-started
  round: 0
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

- Approval stops under a ruling (2026-09-30, raised at step 9's landing): step 9 landed the one-ruling sentence for the approvals the orchestrator itself asks for (what a new script computes, a change to the configuration or the verification list). A skill the option runs still stops at its own approval (`/roadmap`'s diff, `/ordo-init`'s and `/repo-setup`'s drafts, `/plan`'s step list), and the option names that stop. A version that let those skills skip their stop under a ruling was built in the repair round and left out of main, since its review found five gaps: the mechanics sat only in the glossary, which no skill reads; the ruling was to be named in a commit that a repository's commit rule can forbid, and `/ordo-init` run alone takes its commit rule from the very stop it would skip; the question stops, `/ordo-init` inside `/repo-setup` and `sync`'s hunks were not covered; `ordo-init`'s rule that a change to an existing file waits for approval was left without the exception; `/plan`'s gate answers are drafted after the ruling. Options: (a) a new step 9a, "approved by a ruling": `plan-orchestration` quotes the ruling when it runs a skill; each of `plan`, `roadmap`, `ordo-init` and `repo-setup` reads the quoted ruling ("What it reads") and, at each approval stop, compares the draft with the ruled text and skips the stop only when they are the same change; the question stops of `repo-setup` and `ordo-init` are skipped when the ruling states the answers; `/ordo-init` inside `/repo-setup` takes the same ruling; `sync`'s hunks included; the ruling is named in the commit, or, where the commit rule forbids one, in the list of files written that the skill shows; `ordo-init`'s Rules 5 gains the exception; `/plan` still stops when a gate or a step's check could pass without the goal. Approving (a) also approves adding that step to `plan.md` as "9a ... (ruling Approval stops under a ruling)", run before step 12, and its text in those four skills. (b) Keep what landed: a skill's own approval stop stays, and the option names it, so the user sees each such change twice. Recommendation: (a), since unattended runs meet those stops and one decision should not be asked twice; (b) is the lazy option.
- Old rule 13 in game-engine and cathedra (2026-09-30, raised at step 8's landing): step 8 rewrote rule 13 of Ordo's change standard and its template, and `/spec`'s brief template and `/refute` now brief and review under it. game-engine's `docs/dev/change-standard.md:25` and cathedra's `docs/dev/standards/change-standard.md:25` still hold the old rule ("names the revert that turns it red"), and `repo-setup` does not sync the change standard. After the next pin, a brief in either repository would ask for a failure on the unchanged tree while its rules file, which a brief never overrides, asks for a named revert per test. Options: (a) step 15, which already edits those two repositories and leaves the edits for Axel to commit, also rewrites rule 13 there to Ordo's text, adapted to each page's numbering; (b) leave their pages, and accept that Ordo's skills and their rules files disagree on this rule. Recommendation: (a), since the mismatch reaches every step run there after the pin and the edit rides on a step that already touches both. (b) is the lazy option.
- The old skill name in other repositories (2026-09-30, raised at step 10's review): after the next pin `/plan-help` no longer exists, and these files still name it (`grep -rIl -i plan-help`, `.git` and `.scratch` left out): `game-engine/.agents/plan.yaml:1` and `cathedra/.agents/plan.yaml:1` (the comment listing the plan skills); `research-hub/.agents/plan.yaml:1`, `research-hub/CLAUDE.md:33` (read by every session there), `research-hub/docs/AGENT-APPROACH.md`, `research-hub/tools/figures/gen_figures.py` and `plan-loop.svg`. research-hub is read only, and changing another repository waits for Axel under ruling "Overnight work" 5. Options: (a) step 15, which already edits game-engine's and cathedra's `.agents/plan.yaml` and leaves the edit for Axel to commit, also changes their line 1 to `/ordo-help`; Axel changes research-hub's files himself, or rules that a step of a later plan does. Pros: the pin at 2.E's closing leaves no repository pointing at a missing skill; no extra commit in each repository. Cons: step 15 grows by one line per repository. Approving (a) also approves adding "and line 1's `/plan-help` becomes `/ordo-help`" to step 15's line in plan.md. (b) leave them: the lazy option, since a session in research-hub reads CLAUDE.md's list and types a skill that no longer exists. Recommendation: (a).
- Step 6 reading (2026-09-30): step 6 landed with its check, Axel's reading of `skills/repo-setup/templates/docs/dev/ui-standard.md`, pending (ruling "Overnight work" 2); it stays unticked until he approves. Points for his reading: the three rules beyond the plan's four (colour never the only carrier, styling a shared component, text from the catalog) and the added thresholds (the brief's decision 3); the AA criteria not cited (1.4.4, 1.4.10, 2.5.8, 4.1.2), bound by the opening; 2.4.7 stated for keyboard focus in every mode, stricter than the criterion's "a mode of operation"; large text without the CJK clause of WCAG's definition. Options: (a) approve as landed; (b) name the changes, made on top of what landed as a correction. Recommendation: (a), after reading the page, which is 11 lines.

## Closed items (the log of what was raised and how it ended; no report carries it)

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

- 2026-09-30. Steps 1 to 5 and 7 to 10 landed and ticked; step 6 landed unticked, its reading by Axel pending (open item "Step 6 reading"). `worker: claude:sonnet` for every builder (ruling "Overnight work" 1). Plans 2.F, 2.G and 2.H are open beside this one.
- Verified: `checks.sh` on main printed `checks: 8 commands passed` after step 10's fixes at landing.
- Next step: 11, the ADR readers (rulings B, C and F). Unblocked by step 10: 2.F steps 1 and 2 and 2.H step 3.
- Carried to step 12's brief: a "Use instead" row in `skills/plan/SKILL.md` naming `/grill <entry>` for design decisions of the entry not yet settled (step 11's brief check, Decision 6 of brief 11).
- Open on Axel's side: the reading of step 6; the old rule 13 in game-engine and cathedra; approval stops under a ruling; the old skill name in other repositories.

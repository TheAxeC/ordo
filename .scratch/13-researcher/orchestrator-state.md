# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for roadmap entry 13, researcher. Rewritten before every step commit of this plan, so it describes this plan as of its own last resume point (`plan-orchestration`, "Resuming, and handing the plan over"). Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run once, at landing on main, in order; all must pass. The builder and the reviewer run the checks the brief names for the files the step changes before landing. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/code/code-comments/templates/strip_comments.test.sh 2>&1 | tail -1
- sh skills/orchestration/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/apply_tex_patch.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/calibration_counts.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/lookup.test.sh 2>&1 | tail -1
- sh skills/academic/paper/templates/reference_docx.test.sh 2>&1 | tail -1
- sh skills/academic/grant/templates/check_limits.test.sh 2>&1 | tail -1
- sh skills/academic/grant/templates/check_sections.test.sh 2>&1 | tail -1
- sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 | tail -1
- python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary
- sh skills/ordo/ordo-init/templates/utils/build.test.sh 2>&1 | tail -1
- sh utils/pin.test.sh 2>&1 | tail -1
- sh skills/code/wizard/templates/template.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/ordo/ordo-init/templates/docs/dev/prose-standard.md, docs/glossary.md] # files every brief tells the builder to read in full, from docs/plan.yaml.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:opus          # from docs/plan.yaml.
reviewer: claude:opus        # the model the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill, the review agents of /writing and, the agents of /code-comments run on.
libraries: avoid             # from docs/plan.yaml: no new dependency.
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
bench: []                    # no A/B.
adr: docs/adr                # the ADR folder: grill writes the decision records into it, /plan, /spec and /refute read them.
design_bar: industry         # what grill's options are held to: industry, state-of-the-art or novel.
design_references: []        # the published standards a design is held to, such as WCAG 2.2 AA.
worker_effort: medium        # the effort a builder runs at: low, medium, high, xhigh or max.
reviewer_effort: medium      # the effort a reviewer, a brief-check agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
self_rule: on                # the plan runs under self-rule.
next_entry: on               # copied from docs/plan.yaml; after the closing, next-entry mode reads docs/plan.yaml itself.
repair_reviewer: claude:sonnet  # the model the run of /refute over a repair round runs on, at reviewer_effort.
```

```yaml
dispatch:                    # one entry per step in flight, written by /spec, since docs/plan.yaml's workers_at_once is 5.
- step: 3
  base: fba2c70
  worktree: .agents/worktrees/13-researcher-3
  executor: agent
  worker: claude:opus
  launched: 2026-11-25
  session_id: a8e79c1e64120e263 (claude-opus-5-5)
  report: .scratch/13-researcher/agents/reviews/3-report.md
  round: 0
  brief_check: .scratch/13-researcher/agents/reviews/3-brief-check.md (a5b81d093a7ce8107, claude-opus-5-5, 217367 tokens, 55 tool uses, 487 s)
  landing: not-started
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says; what is settled belongs in the closed list.

- none.

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-11-25: Open item A, the source's files no ruling names: closed under self-rule, C144.
- 2026-11-25: Open item B, three differences of the copy no ruling names: closed under self-rule, C145.
- 2026-11-25: Open item C, the full example's integrity stages and how the integrity agent picks its claims: closed under self-rule, C146.
- 2026-11-25: Open item D, the command lines of `integrity` and `manuscript`: closed under self-rule, C147.
- 2026-11-25: Open item E, the missing scores of the re-review: ruled (a) by the user, the re-review of `paper-review-panel` gains the scores.
- 2026-11-25: Open item F, the Stage 3 scores the deltas start from: closed under self-rule, C148.
- 2026-11-25: Open item G, the command lines of `novelty` and `idea` and the place of a novelty page: closed under self-rule, C149.

## The standing demands (from the user, in force)

- `CLAUDE.md`, "A shipped file names nothing private". The ones that bite here: a file under `skills/`, `agents/` or `utils/`, and `README.md`, names no file, folder, project or person of the user's own; the source of the copy is named as its public repository and version; the default layout of the `research` mode is written as the skill's own, with a made-up example where one is needed.
- A copy is a copy: a difference from academic-pipeline is made only where ADR 0052 or a ruling of `plan.md` says so, and each one is listed in `deviations.md`. No rule puts a null or negative result into a manuscript (ruling D20).
- The source folder `research-hub/.agents/skills/academic-pipeline/`, beside this repository, is read only. Nothing about this repository or the user goes to an outside service; the public upstream repository is fetched by its public name only.
- Commits: a capitalised imperative subject and `- Verb` bullets, every commit naming its paths. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree; a diff kept for the record is a patch file under `agents/reviews/`.
- The pinned worktree and the skill links change only through `utils/pin.sh <tag>`; a release candidate for step 6 is tagged and pinned on the user's word, and the final tag is the user's. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`, written out in each command.
- No breakage testing. Every run of a skill for the gate is made by a separate agent, its stops answered by the orchestrator.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <slug>-<step> <base> <plan.yaml>`, the last argument the path of the `plan.yaml` the call reads. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, 127 when `python3` is not installed, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The step's own check, named on its line in `plan.md` and in its brief, run from the repository root.
- The `verify` list above runs through the `land` skill's `templates/checks.sh <state file>` from the root of main's checkout, once, at landing. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what the booking quotes. The builder and the reviewer run the checks the brief names for the files the step changes before landing.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/adr/0052-researcher-s-integrity-and-manuscript-modes-are-a-copy-of-academic-pipeline-with-the-documents-it-relies-on-and-a-notice-names-the-source.md`, `docs/adr/0053-researcher-s-research-mode-is-directed-by-the-session-through-six-stages-that-can-loop-with-a-brief-and-a-reviewer-for-each-builder-and-the-project-s-readme-as-its-entry-file.md`, `docs/adr/0054-researcher-s-idea-mode-forms-the-research-question-in-rounds-with-a-novelty-check-between-them-and-full-starts-with-it.md` and the Rulings of `plan.md`. Ledger: `.scratch/13-researcher/`, with `agents/briefs/` and `agents/reviews/`.
- Plan configuration: `docs/plan.yaml`. In a call, in front of the entry: nothing.
- The data the steps read, and who may change it: the source skill at `research-hub/.agents/skills/academic-pipeline/` (read only), and the public repository Imbad0202/academic-research-skills at its tag v3.13.0, from which step 1 saves the sources into `sources/` of this ledger.
- Anything running that a step must not disturb: nothing.

## Current position (rewritten before every step commit of this plan)

- 2026-11-25. Steps 1, 2 and 5 have landed. No step is in flight.
- Verified: `templates/checks.sh` on this file printed `checks: 16 commands passed` on main with step 2 staged and its fixes at landing made.
- Roadmap entry 13 (researcher). Plan step 3 of 7: the modes `novelty` and `idea`, its builder running. Next: step 4, the modes `research` and `full`.
- Open on the user's side: the review of the choices C144, C145, C146, C147, C148 and C149 in `.scratch/choices.md`, which blocks nothing.

# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for roadmap entry 27. A newcomer's README, researcher's project READMEs, a skill for a software repository's documentation and a figure for every skill. Rewritten before every step commit of this plan, so it describes this plan as of its own last resume point (`plan-orchestration`, "Resuming, and handing the plan over"). Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

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
reviewer: claude:opus        # the model the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill, run on.
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
- step: 1
  executor: agent
  worker: claude:opus
  session_id: aa853461e0bda0675 (claude-opus-5-5)
  worktree: .agents/worktrees/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill-1
  base: 50a98c8
  launched: 2026-11-25
  report: .scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/reviews/1-report.md
  brief_check: .scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/reviews/1-brief-check.md (a2f96bd6829d5adb2, claude-opus-5-5, 214981 tokens, 45 tool uses, 6.4 minutes)
  landing: not-started
  round: 0
- step: 2
  executor: agent
  worker: claude:opus
  session_id: a08312753d0d93b46 (claude-opus-5-5)
  worktree: .agents/worktrees/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill-2
  base: 929e519
  launched: 2026-11-25
  report: .scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/reviews/2-report.md
  brief_check: .scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/reviews/2-brief-check.md (aa8df1549baebff17, claude-opus-5-5, 195898 tokens, 28 tool uses, 4.8 minutes)
  landing: not-started
  round: 0
  shared_paths: "docs/glossary.md with step 4 of this plan: step 2 writes lines 146-190, Ordo's own terms, and step 4 lines 5-144, the plan-terms block; README.md with step 1 of this plan: step 2 writes line 34, the researcher row, and step 1 lines 72-132, the figure lines; the ranges do not touch, so the cherry-pick merges them without conflict"
- step: 4
  executor: agent
  worker: claude:opus
  session_id: ac96504d9c4e48105 (claude-opus-5-5)
  worktree: .agents/worktrees/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill-4
  base: e4e0198
  launched: 2026-11-25
  report: .scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/reviews/4-report.md
  brief_check: .scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/agents/reviews/4-brief-check.md (af6924bb5a482c6d5, claude-opus-5-5, 169399 tokens, 37 tool uses, 5.9 minutes)
  landing: not-started
  round: 0
  shared_paths: "docs/glossary.md with step 2 of this plan: step 4 writes lines 5-144, the plan-terms block, and step 2 writes lines 146-190, Ordo's own terms; the ranges do not touch, so the cherry-pick merges them without conflict"
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

- Open item B (2026-11-25, step 1, kind 4, the roadmap's gate): the gate's part "every `docs/figures/` path that `git grep` finds in `README.md`, `docs/` and `skills/` names a file that exists" cannot pass once step 1 moves the figures, because `docs/roadmap.md` line 67, the done line of entry 25, records that you read `docs/figures/paper/lifecycle.svg`, a path that then no longer exists (`git grep -n 'docs/figures/paper/lifecycle' -- docs/roadmap.md` prints line 67). Step 1 goes on meanwhile and runs its check without `docs/roadmap.md`, quoting both runs.
  - (a) Recommended. The gate's part reads "... in `README.md`, `docs/` outside `docs/roadmap.md`, and `skills/` ...", written into entry 27's gate by `/roadmap` at the closing. Pro: the done line stays the true record of what you read; the check still covers every page that shows a figure. Con: the roadmap's own figure paths go unchecked, and today it names none outside done lines.
  - (b) Entry 25's done line is edited to `docs/figures/academic/paper/lifecycle.svg`. Pro: the gate stays as written. Con: a done entry's record is rewritten to a path that did not exist when you read it.
  - Lazy option: neither; leaving the gate as written and accepting a failed part at the closing.
- Open item C (2026-11-25, step 4, kind 3, ruling D33): D33's check "`git grep -n 'rulings/<slug>'` over `skills/` and `docs/` prints nothing" can never print nothing, because `docs/roadmap.md` line 27, entry 27's own gate, holds the pattern (`git grep -n 'rulings/<slug>' -- docs/roadmap.md` prints line 27). Step 4 goes on meanwhile: it rewrites ADR 0059's Context line so it no longer holds the pattern, and runs the check without `docs/roadmap.md`, quoting both runs.
  - (a) Recommended. The check reads "`git grep -n 'rulings/<slug>' -- skills docs ':!docs/roadmap.md'` prints nothing", in D33 and in entry 27's gate, written by `/roadmap` at the closing. Pro: it checks every page that states the rule; the one line left out is the check itself. Con: none found.
  - (b) The gate keeps D33's words, and the closing records that the check printed its own line. Pro: no change to the ruling. Con: the gate's output then shows a part that did not pass as written.
  - Lazy option: (b), since it changes nothing now and leaves a failed check in the record.
- Open item D (2026-11-25, step 2, kind 3, a ruling against a standard): your rulings D1 and D15 and ADR 0057 give the README headings `### Why it matters`, `## What it is and why`, `### What it does`, `### What is not claimed`, `### What this project adds`, `## What each result comes from` and `## Dead ends (do not retry)`. The prose standard says "Headings are labels, not sentences." and gives "Why it is separate at all" as a heading it rejects. Step 2 writes the ruled headings meanwhile.
  - (a) Recommended. Keep the ruled headings. Pro: they are the list you approved, and each says what a newcomer finds under it; the standard's own heading `## How it is applied` and the brief template's `## What to build` already use this form. Con: they read close to the example the standard rejects.
  - (b) Shorten them to labels: `### Relevance`, `## Overview`, `### Scope`, `### Not claimed`, `### Contribution`, `## Provenance of results` and `## Dead ends`. Pro: the standard is met word for word. Con: a newcomer reads less from each heading, and D1, D15 and ADR 0057 are changed.
  - Lazy option: neither ruling, leaving the clash unstated.

## Closed items (the log of what was raised and how it ended; no report carries it)

- 2026-11-25: the layout engine's file name: `skills/code/handbook/templates/figures.py`, ruled by the user (Open item A).

## The standing demands (from the user, in force)

- `CLAUDE.md`, "A shipped file names nothing private". The ones that bite here: a file under `skills/`, `agents/` or `utils/`, and `README.md`, names no file, folder, project or person of the user's own; `handbook` and `researcher` are written from their ADRs with made-up or public examples; no shipped file names `research-hub`, `cathedra`, `game-engine` or `oculus`.
- `research-hub`, `cathedra`, `game-engine` and `oculus` are read only, except `research-hub/README.md` in step 7 and the repositories the user names for the runs of step 8, which the user's naming opens for those runs; nothing is committed in them by the session.
- No rule puts a null or negative result into a manuscript or a public deposit (ADR 0057, `.depositignore`).
- Commits: a capitalised imperative subject and `- Verb` bullets, every commit naming its paths. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree; a diff kept for the record is a patch file under `agents/reviews/`.
- The pinned worktree and the skill links change only through `utils/pin.sh <tag>`; the tag of step 8 is pinned on the user's word. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`, written out in each command.
- No breakage testing. Every run of a skill for the gate is made by a separate agent, its stops answered by the orchestrator.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <slug>-<step> <base> <plan.yaml>`, the last argument the path of the `plan.yaml` the call reads. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, 127 when `python3` is not installed, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The step's own check, named on its line in `plan.md` and in its brief, run from the repository root.
- The `verify` list above runs through the `land` skill's `templates/checks.sh <state file>` from the root of main's checkout, once, at landing. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what the booking quotes. The builder and the reviewer run the checks the brief names for the files the step changes before landing.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: ADRs 0057, 0058, 0059 and 0060 under `docs/adr/`, and the Rulings of `plan.md`. Ledger: `.scratch/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill/`, with `agents/briefs/` and `agents/reviews/`.
- Plan configuration: `docs/plan.yaml`. In a call, in front of the entry: nothing.
- The data the steps read, and who may change it: the READMEs of `cathedra`, `game-engine` and `oculus` beside this repository, and the README standard and projects of `research-hub`, all read only except as the standing demands say.
- Anything running that a step must not disturb: nothing.

## Current position (rewritten before every step commit of this plan)

- 2026-11-25. The plan is opened; nothing has landed. The working tree holds only this plan's opening files.
- Verified: nothing run yet for this plan.
- Next step: 1, 2 and 4, which nothing blocks and which can run in parallel.
- Open on the user's side: none.

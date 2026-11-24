# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for roadmap entry 25, Project rules, a build driver, submit and tutor. Rewritten before every step commit of this plan, so it describes this plan as of its own last resume point (`plan-orchestration`, "Resuming, and handing the plan over"). Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

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
dispatch:
- step: 2
  executor: agent
  worker: claude:opus
  session_id: a363858a943d81ea8 (claude-opus-5-5)
  worktree: .agents/worktrees/25-project-rules-a-build-driver-submit-and-tutor-2
  base: bacb674
  launched: 2026-11-24
  report: .scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/reviews/2-report.md
  builder_usage: 346662 tokens, 91 tool uses, 16 min 55 s
  brief_check: .scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/reviews/2-brief-check.md (a87e63407ae314392, claude-opus-5-5, 235254 tokens, 51 tool uses, 7 min 58 s)
  reviewer_report: .scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/reviews/2-refuter.md (a98a16ecb5987063a, claude-opus-5-5, usage at its notice)
  landing: not-started
  round: 1
  round_1: brief .scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/briefs/2-round-1.md, snapshot .agents/worktrees/25-project-rules-a-build-driver-submit-and-tutor-2-round-1
- step: 5
  executor: agent
  worker: claude:opus
  session_id: ab824b150f2570d7a (claude-opus-5-5)
  worktree: .agents/worktrees/25-project-rules-a-build-driver-submit-and-tutor-5
  base: a7850f3
  launched: 2026-11-24
  report: .scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/reviews/5-report.md
  builder_usage: 218919 tokens, 44 tool uses, 11 min 50 s
  brief_check: .scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/reviews/5-brief-check.md (a80a3d262da646252, claude-opus-5-5, 165019 tokens, 50 tool uses, 9 min 5 s)
  shared_paths: README.md and docs/figures/gen_figures.py with step 2, in other lines of each (step 2: the alt texts of the grant and paper figures and their two functions; step 5: the table, the group sentence, the install loop, the count and the note of pipeline()); simple to merge
  reviewer_report: .scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/reviews/5-refuter.md (aadec4c5e8a7aae13, claude-opus-5-5, 175234 tokens, 32 tool uses, 6 min 54 s)
  landing: not-started
  round: 1
  round_1: brief .scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/briefs/5-round-1.md, snapshot .agents/worktrees/25-project-rules-a-build-driver-submit-and-tutor-5-round-1
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

- Open item A (step 1, the user's reading of the rules): the five rules stand on their pages on main and wait for your reading: `skills/ordo/ordo-init/templates/shared-rules.md` (the bullets "An effort question is answered with the changes", "Every option meets every stated wish", "Every target in scope works", "An open item is for costs the user weighs"), `skills/orchestration/plan-orchestration/SKILL.md`, "Stops" (two sub-bullets under the stop-message bullet), rules 6 and 16 of `skills/ordo/ordo-init/templates/docs/dev/change-standard.md` and of `docs/dev/change-standard.md`, and "Markdown and YAML" of `skills/ordo/ordo-init/templates/docs/dev/coding-standards/common.md`. Two rules were narrowed from the goal's words after the review: the open-items rule to "an open item that offers options", since the plan skills also hold open items with no options (your reading of a page, a worktree that could not be removed, a diff to approve), and the effort rule to "a change to the repository", since `paper`'s revision coach gives a typical duration for a manuscript revision. One point is yours: neither page says what is done with a decision whose options do not each cost something. Option 1, leave it unsaid: the pages hold the goal's rule and nothing more; a reader gets no instruction for that case. Option 2, add "the recommended option is taken and the report states it": it tells the reader what to do, and the second review found that this sentence contradicts "No silent design decisions" and "Surface rule clashes" in the shared rules unless it excepts them. Recommendation: option 1, which is also the option that costs less to carry out; it is recommended because the other rules already say when a decision is raised. The reading blocks no later step.
- Open item B (step 3, the build driver; two questions, both before the brief can be final):
  - Question 1, what "the checks imported and called" in the entry's goal means. The goal says of the driver: "one entry point with `build`, `test`, `check` and `gate`, one command per invocation, the checks imported and called, and every failure a non-zero exit". Your ruling D9 and ADR 0051 say the driver is written "from the commands of the verification page", and those are shell commands, such as `sh utils/pin.test.sh`. A shell command cannot be imported.
    - Option 1 (recommended): the driver runs each command of the verification page as a shell command, under `bash -o pipefail`, and imports nothing. It works the same for a repository in any language, and it is what D9 says. The words "the checks imported and called" then describe nothing the driver does, and I take them out of the entry's goal in the roadmap diff at the closing.
    - Option 2: a command of the page that runs a Python script of the repository is imported and its entry function called inside the driver; every other command runs as a shell command. The goal's words hold for Python checks. The mode must then decide for each command which kind it is, a script that calls `sys.exit` or does work at import behaves differently inside the driver than on the command line, and the driver has two ways to run a command, each to be tested.
    - Recommendation: option 1, because D9 already rules the commands of the verification page and one way to run a command is easier to trust in a gate. Option 1 is also the one that costs less to build.
  - Question 2, a repository with no build step. ADR 0051 says "A subcommand with no command named says so and exits non-zero" and "`gate` runs the three". Read strictly, `gate` fails in every repository that has no build command, such as this one.
    - Option 1 (recommended): `gate` skips a list that holds no command and fails only when all three are empty; `build` called by itself on an empty list still says so and exits non-zero; the verification page names only the subcommands that have a command. ADR 0051 gets one sentence that says so.
    - Option 2: `gate` fails when any of the three lists is empty, so every repository must name a build, a test and a check command before its gate can pass.
    - Recommendation: option 1. Neither option costs less to build.
  - Step 3 waits for these two answers. Nothing else in the plan waits on step 3 except the gate's runs of step 6.
- Open item C (step 4, the skill `submit`; one question): how the submission sheet learns what the portal asks. ADR 0049 says the sheet holds "every field the portal asks for", that the agent "reads the portal's forms for what is asked", and that you approve the sheet "before the browser is touched". The forms of most journal and funder portals stand behind a sign-in, and reading them needs the browser.
  - Option 1: the sheet is first written from what the portal shows without a sign-in (its public pages and instructions) and from the folder. You approve it. During the walk, each field the portal asks that the sheet lacks is added to the sheet as a question to you. The browser is not opened before the approval, as the ADR says. For a portal behind a sign-in the first sheet holds little of the real form, and most fields reach you as questions during the walk.
  - Option 2 (recommended): two passes. You sign in, and the session goes through the portal's form pages reading only: it types nothing, uploads nothing and ticks nothing. The agent writes the sheet from those pages and the folder. You approve it. The session then fills the forms from the approved sheet. The sheet holds the real fields before you approve it. The browser is opened before the approval, so the ADR's sentence becomes "nothing is typed, uploaded or ticked before the approval". A portal that shows a later page only once an earlier one is filled still gives fields the first pass could not see, and those are added as questions, as in option 1.
  - Recommendation: option 2, because an approval of a sheet that lacks most of the form approves little. Option 1 is the one that costs less to build.
  - Taken without asking, since the layout's rule settles it: `submit` carries `disable-model-invocation: true`, so only you start it.
  - Step 4 waits for this answer. Nothing else in the plan waits on step 4 except the gate's runs of step 6.
- Open item D (step 5, the skill `tutor`; kind 3; blocks nothing): two of the source's format pages name a file `GLOSSARY.md`, while the skill writes a glossary as an HTML reference document under `reference/`. The copy names the glossary format page from the step that writes a glossary, as the layout asks, so a later run looks for `GLOSSARY.md` and does not find it.
  - Option 1 (recommended): the glossary is written as `reference/GLOSSARY.md` in the format page's structure; both format pages stay true word for word; ADR 0048 gets one line, since a Markdown file then stands among the HTML reference documents.
  - Option 2: leave it as built. This is the option that costs less.
- Open item E (step 2, limits and layout; kind 3; blocks nothing): ADR 0050 and ruling D4 say the layout "is only what the venue or the funder states". The formatter's page as built says that a value the venue does not state comes from the declared format profile, and with no profile is the current default.
  - Option 1 (recommended): ADR 0050 gets one sentence that says so, since a manuscript needs a font and a margin when the venue names none.
  - Option 2: where the venue states no value, the run asks the user for it and uses no profile value and no default.
  - Neither costs less in a way that decides it; option 1 keeps a run from stopping on each value.

## Closed items (the log of what was raised and how it ended; no report carries it)

- none

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: `tutor` follows mattpocock's `teach`, each deviation with its reason and ruling (ADR 0048); a shipped file names nothing private, and an example in a skill is made up or public and says which; every gate run is made by a separate agent that invokes the installed skill, its stops answered by the orchestrator.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree. Commit at resume points only.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and pin only with `utils/pin.sh <tag>`; a release candidate for step 6 is tagged and pinned on the user's word. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`. No agent sends anything about the repository or the user to an outside service.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <slug>-<step> <base> <plan.yaml>`, the last argument the path of the `plan.yaml` the call reads. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, 127 when `python3` is not installed, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The step's own check, named on its line in `plan.md` and in its brief, run from the repository root.
- The `verify` list above runs through the `land` skill's `templates/checks.sh <state file>` from the root of main's checkout, once, at landing. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what the booking quotes. The builder and the reviewer run the checks the brief names for the files the step changes before landing.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 25, ADRs 0048 to 0051 and the rulings in `plan.md`. Ledger: `.scratch/25-project-rules-a-build-driver-submit-and-tutor/`, with `agents/briefs/` and `agents/reviews/`.
- Plan configuration: `docs/plan.yaml`. In a call, in front of the entry: nothing.
- The data the steps read, and who may change it: the public repository mattpocock/skills, `skills/productivity/teach/`, read only; the repositories, the manuscript and the portals the user names for step 6, where the runs work on scratch copies and no final submit is pressed.
- Anything running that a step must not disturb: nothing.

## Current position (rewritten before every step commit of this plan)

- 2026-11-24. Step 1 has landed. `v10.0.0` is pinned. The working tree holds nothing of this plan outside its ledger.
- Verified: `sh skills/orchestration/land/templates/checks.sh .scratch/25-project-rules-a-build-driver-submit-and-tutor/orchestrator-state.md` printed `checks: 15 commands passed`.
- Roadmap entry 25 (Project rules, a build driver, submit and tutor). Plan step 1 of 7 landed: the project rules. Steps 2 and 5 are each in repair round 1. Steps 3 and 4 are stopped on open items B and C.
- Open on Axel's side: open item A, the reading of the rules; open item B, two questions on the build driver, which step 3 waits on; open item C, one question on the submission sheet, which step 4 waits on; open items D and E, which block nothing.

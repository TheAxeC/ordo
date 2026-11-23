# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for roadmap entry 19, codebase-design. Rewritten before every step commit of this plan, so it describes this plan as of its own last resume point (`plan-orchestration`, "Resuming, and handing the plan over"). Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

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
- sh skills/ordo/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- python3 skills/ordo/repo-setup/templates/sync_rules.py . --only glossary
- sh utils/pin.test.sh 2>&1 | tail -1
- sh skills/code/wizard/templates/template.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/ordo/repo-setup/templates/docs/dev/prose-standard.md, docs/glossary.md] # files every brief tells the builder to read in full, from docs/plan.yaml.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:fable         # from docs/plan.yaml.
reviewer: claude:fable       # the model the first run of /refute, the brief check, the diagnosis agent, the lookups of /grill, the review agents of /writing and, the agents of /code-comments run on.
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
worker_effort: low           # the effort a builder runs at: low, medium, high, xhigh or max.
reviewer_effort: low         # the effort a reviewer, a brief-check agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
self_rule: on                # the plan runs under self-rule.
next_entry: on               # copied from docs/plan.yaml; after the closing, next-entry mode reads docs/plan.yaml itself.
repair_reviewer: claude:sonnet  # the model the run of /refute over a repair round runs on, at reviewer_effort.
```

```yaml
dispatch: []
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

- Open item A. The skill differs from the two sources in points that `.scratch/19-codebase-design/deviations.md` does not list, and the gate asks for the user's ruling on each deviation. The points: (19) after the pick, "design it twice" runs before `/roadmap add` and `/grill`, and the ADR offer after them, where the source runs both inside its grilling; (20) the user may pick no candidate, and no roadmap entry is then written; (21) the scan agent has a sixth question, "Where does the code break a rule of a standards page?"; (22) the goal given to `/roadmap add` names the source's grilling topics (constraints, dependencies with their categories, the shape of the deepened module, what sits behind the seam, which tests survive) in place of the source walking them itself; (23) words the glossary gives another sense are reworded ("tier-spanning slice", "technical brief", "use cases", "the default case", "Step 2"), and a sentence marks each example as made up; (24) the report's header names each subject that applies and that the repository lacks; (25) the review's aim reads "friction that makes the code hard to understand and to test" where the source says "testability and AI-navigability"; (26) "a good stretch back" for the commit history is kept as the source has it, against the prose standard's rule on vague qualifiers. Options: (a) approve 19 to 26, booked as one ruling and added to `deviations.md`. Pro: the gate's check of the deviations list can pass; 19, 21 and 22 follow from rulings D4 and D5. Con: none found. (b) name the points to change, and each is changed in a step the ruling adds. Pro: a point the user does not want is removed. Con: one more step before the gate. Recommendation: (a). The lazy option is to leave the list as it is, which fails the gate.

## Closed items (the log of what was raised and how it ended; no report carries it)

- none

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: the skill follows its two sources, each deviation with its reason and ruling (ADR 0047); a shipped file names nothing private; every gate run is made by a separate agent, its stops answered by the orchestrating session; work runs through the skills' agents; no claim about state without a command in the same turn; report the end state only, in plain short prose; no breakage testing.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree. Commit at resume points only.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <slug>-<step> <base> <plan.yaml>`, the last argument the path of the `plan.yaml` the call reads. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, 127 when `python3` is not installed, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The step's own check, named on its line in `plan.md` and in its brief, run from the repository root.
- The `verify` list above runs through the `land` skill's `templates/checks.sh <state file>` from the root of main's checkout, once, at landing. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what the booking quotes. The builder and the reviewer run the checks the brief names for the files the step changes before landing.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 19, ADR 0047 and the rulings in `plan.md`. Ledger: `.scratch/19-codebase-design/`, with `agents/briefs/` and `agents/reviews/`.
- Plan configuration: `docs/plan.yaml`. In a call, in front of the entry: nothing.
- The data the steps read, and who may change it: the public repository mattpocock/skills, `skills/engineering/codebase-design/` and `skills/engineering/improve-codebase-architecture/`, read only; Cathedra, read only: step 2's runs work on a scratch copy of it.
- Anything running that a step must not disturb: nothing.

## Current position (rewritten before every step commit of this plan)

- 2026-11-23. Step 1 has landed: the skill `codebase-design` is on main. Next: the release candidate `v9.4.0-rc.1` tagged and pinned with `utils/pin.sh`, then step 2's two runs on a scratch copy of Cathedra, each by a separate agent.
- Roadmap entry 19 (codebase-design). Plan step 2 of 3: the gate's runs. Next: step 3, the closing.

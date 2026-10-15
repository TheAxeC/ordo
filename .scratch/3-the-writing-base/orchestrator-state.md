# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 3 of `docs/roadmap.md`, the writing base. Rewritten before every step commit of this plan, so it describes this plan as of its own last resume point (`plan-orchestration`, "Resuming, and handing the plan over"). Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run once, at landing on main, in order; all must pass. The builder and the reviewer run the checks the brief names for the files the step changes before landing. Copied from docs/dev/building.md by /plan, with the filters of docs/dev/change-standard.md.
- sh skills/land/templates/land.test.sh 2>&1 | tail -1
- sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
- sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
- python3 skills/repo-setup/templates/sync_rules.py . --only glossary
- sh utils/pin.test.sh 2>&1 | tail -1
- >-
  git ls-files -coz --exclude-standard | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: [docs/dev/skill-layout.md, skills/repo-setup/templates/docs/dev/prose-standard.md, docs/glossary.md] # files every brief tells the builder to read in full, from .agents/plan.yaml.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default: a builder is dispatched in the step's worktree for every step not marked orchestrator.
worker: claude:sonnet        # from .agents/plan.yaml.
reviewer: claude:opus        # the model the first run of /refute, the brief check, the diagnosis agent and the lookups of /grill run on.
libraries: avoid             # from .agents/plan.yaml: no new dependency.
review: every                # every step is refuted.
refute_after_repair: yes     # /refute runs again over each repair round.
repair_rounds: 1             # the most repair rounds a step gets.
review_minutes: 0            # no time box.
look:                        # none: no view changes.
bench: []                    # no A/B.
adr: docs/adr                # the ADR folder: grill writes the decision records into it, /plan, /spec and /refute read them.
design_bar: industry         # what grill's options are held to: industry, state-of-the-art or novel.
design_references: []        # the published standards a design is held to, such as WCAG 2.2 AA.
worker_effort: high          # the effort a builder runs at: low, medium, high, xhigh or max.
reviewer_effort: high        # the effort a reviewer, a brief-check agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
self_rule: on                # the plan runs under self-rule.
next_entry: on               # copied from .agents/plan.yaml; after the closing, next-entry mode reads .agents/plan.yaml itself.
repair_reviewer: claude:sonnet  # the model the run of /refute over a repair round runs on, at reviewer_effort.
```

```yaml
dispatch: none               # or the block /spec writes (a list when .agents/plan.yaml's workers_at_once is above 1). /spec writes the entry at the end of its preflight with step and `landing: preparing`, writes `"running: <agent id>"` into brief_check while the brief-check agent runs, base after its preparation commit and worktree before it creates the worktree, and fills the entry at its Steps 9, so that it holds: step, executor, worker, worktree (<worktree_root>/<slug>-<step>), base, launched, report (the builder's report, at the path the brief names), brief_check (the brief check's report path, with the agent's id, its served model, tokens, tool uses and time, or `none, a small text step` for a small text step), landing, round. `landing` is `preparing` while /spec runs, then `not-started`, `cherry-picking` while /land cherry-picks, and `backed-out` after a red line took the step back out of main. The orchestrator adds session_id, the builder's agent id followed by the model the runner served it (<agent id> (<served model>)), as soon as the builder is dispatched and its model read, builders_before (the agent id and served model of each builder it replaced, as <agent id> (<served model>, stopped) or <agent id> (<served model>, dead), one after another), builder_usage (the builder's tokens, tool uses and time from its completion notice) beside report when the builder's report is saved, and reviewer_report (the refuter report's path, with each reviewer's agent id, served model, tokens, tool uses and time, or, for a reviewer stopped for another model, its agent id, served model and stopped) at the review. A value that holds `: ` (brief_check while its agent runs, builder_usage after a repair round, reviewer_report after a run over a round) is written in double quotes, so the block stays valid YAML. A diagnosis agent has no key here: the session that starts it writes its id and role into plan.md's Agents section, as the diagnose skill's Rules say. A step dispatched while another in flight, of this plan or of another open plan, names a file its brief also names carries shared_paths: each shared file, the other step's plan and step, and why the merge at landing is simple, as plan-orchestration's "Two steps in flight" says; with no shared file the key is left out.
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

- Step 2, the case files (2026-10-15). Two parts of step 2's line cannot be done as written. Both answers change your gate or a verify command, so they are yours.
  - Question 1, the registers. `/writing` applies only the register of the draft's discipline (`skills/writing/SKILL.md` line 89). A case draft has one discipline, so one draft can test only 4 of the 16 register rules. Example: a passage where the authors call themselves "the authors" breaks the Voice rule of Medicine and Health only in a medical draft; in an engineering draft the review must not apply that register.
    - (a), recommended: four case drafts instead of one. The full case set in one discipline, plus one short draft for each other register that holds only that register's cases, each as a `.tex` with an `\input` file and as a `.docx`. Every register rule gets its break and its clean passage. Step 3 runs `/writing` 8 times on the cases instead of 2. Needs the Gate of roadmap entry 3 and the lines of steps 2 and 3 rewritten; the roadmap diff comes to you for approval.
    - (b): the `.tex` in one discipline and the `.docx` in another. 8 of the 16 register rules tested. The gate stays as it is.
    - (c): one discipline for both. 4 of the 16 tested. The lazy option.
  - Question 2, where the case files are kept. The verify list's character-set check reads every tracked file and fails on any byte outside ASCII. It exits 1 on a `.docx` (run on the NWO XS `.docx`), and the cases for the em dash rule and the straight-quotes rule must hold those characters. Also, a builder writes only its report in the ledger, and `land.sh` never carries another ledger file from the worktree to main, so case files the builder writes into this folder would not land.
    - (a), recommended: the case files go in `.scratch/3-the-writing-base/cases/`, committed with their real characters and the `.docx`. The character-set check in `docs/dev/building.md`, `docs/dev/change-standard.md` and the state file's verify list skips files under a ledger's `cases/` folder (`.scratch/*/cases/` and `.scratch/archive/*/cases/`). At landing the session copies `cases/` from the worktree to main, as it copies the builder's report. This changes a verify command.
    - (b): everything committed stays ASCII. The `.tex` cases spell the dash as ` -- ` and break the ASCII rule with `->` in prose, and the `.docx` is made at step 3 from a committed `.html` that writes the characters as codes such as `&#8212;` (tried: `textutil -convert docx` turns it into a real em dash, and `docx_paragraphs.py` prints it). The session copies `cases/` at landing. No check changes, but the `.tex` run never sees a real non-ASCII character.
    - (c): the case files kept outside git. Nothing of the cases is recorded. The lazy option.
  - Recommendation: (a), (a). Answer with `Ruled: (a), (a)` or your own choice per question.

## Closed items (the log of what was raised and how it ended; no report carries it)

- none.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option; nothing asked of Axel that an agent can do.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <slug>-<step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, 127 when `python3` is not installed, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The step's own check, named on its line in `plan.md` and in its brief, run from the repository root.
- The `verify` list above runs through the `land` skill's `templates/checks.sh <state file>` from the root of main's checkout, once, at landing. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what the booking quotes. The builder and the reviewer run the checks the brief names for the files the step changes before landing.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 3, the rulings in `plan.md`, ADRs 0001 to 0003, the three `rebuild: writing` rows of `docs/academic-coverage.md` and their source files in research-hub. Ledger: `.scratch/3-the-writing-base/`, with `agents/briefs/` and `agents/reviews/`.
- research-hub is read only: the source files and the NWO XS `.docx` are read, never changed.

## Current position (rewritten before every step commit of this plan)

- 2026-10-15. Step 1 is landed (6105b48). Step 2, the known cases, is stopped before its brief: the open item "Step 2, the case files" waits for Axel's ruling.
- Next step: 2, through `/spec 3 2` once the ruling is booked.
- Open on Axel's side: "Step 2, the case files"; later, the tag and the pin for step 3.

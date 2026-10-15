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

- Step 2, the brief check (2026-10-15). The brief check of step 2 (`agents/reviews/2-brief-check.md`) found two things that only you can settle. Every other finding is closed in the brief, as that report's Closed heading lists.
  - Question 1, the builder writing into the ledger. Your ruling "Step 2, the case files" has the builder write the case files into this folder's `cases/`. The rules file says the opposite: `docs/dev/change-standard.md`, "Where the work happens": "Nothing under the ledger folder is edited except the report the brief names." The builder's prompt says the same (`plan-orchestration`, "Launching a builder": "What is never touched: the ledger beyond the builder's report"). A builder given both stops, or its reviewer files the case files as a breach.
    - (a), recommended: the builder writes the case files in a scratch folder outside both repositories, which the brief names, and touches only its report in the ledger. Before `land.sh` runs, the session copies the folder into `.scratch/3-the-writing-base/cases/` on main, and the landing commit names each case file. The case files end up where you ruled, committed with their real characters, and no rule changes. What changes in your ruling is only where the session copies from: the builder's scratch folder instead of the worktree.
    - (b): the builder writes into the worktree's `cases/` as ruled, and the rules file's sentence, the builder's prompt in `plan-orchestration` and the term **ledger** in the glossary and its template each gain "and the files its brief names under the ledger". This changes a written rule and a skill.
    - (c): leave the clash in the brief and let the builder sort it out. The lazy option.
  - Question 2, the rules judged on a whole draft. Some rules are counted or judged over the whole draft: semicolons (at most 2 per 1000 words), binary contrast (at most twice per page), varied paragraph length, no repeated construction, no five same-length sentences in a row, no mirror structure, and "Objectivity / Limitations and alternative interpretations" ("The text acknowledges the limitations"). In the engineering draft that holds their breaks, no passage can keep them. Example: once the draft has three binary contrasts, a fourth sentence with one contrast is not a clean passage, it adds to the count.
    - (a), recommended: their clean rows stand in the three short drafts, whose text must already break no rule. Each short draft then holds its register's cases plus clean rows of these rules, and no other break. Your ruling said the short drafts hold "only that register's cases"; this adds clean rows, never a break, and no extra run.
    - (b): a fifth draft that holds only these clean cases, as a `.tex` and a `.docx`. Two more runs at step 3, and the Gate is rewritten again.
    - (c): no clean row for these rules. The lazy option.
  - Recommendation: (a), (a). Answer with `Ruled: (a), (a)` or your own choice per question.

## Closed items (the log of what was raised and how it ended; no report carries it)

- Step 2, the case files (2026-10-15): ruled (a), (a) by the user on 2026-10-15; booked in `plan.md` Rulings, with the lines of steps 2 and 3 rewritten.

## The standing demands (from Axel, in force)

- `~/.claude/CLAUDE.md` and the rules under `~/.claude/rules/`. The ones that bite here: work runs through the skills' agents, never inline; no claim about state without a command in the same turn; report the end state only; plain prose, ASCII, no hard wraps and no em dashes; open items as plain text with options, pros and cons, one recommendation and the lazy option named; never the lazy option; nothing asked of Axel that an agent can do.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree.
- Never edit `~/.local/share/ordo-stable` or the skill links by hand, and never run `utils/pin.sh <tag>` without asking. research-hub is read only. Tests that touch skill folders run under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <slug>-<step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, 127 when `python3` is not installed, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The step's own check, named on its line in `plan.md` and in its brief, run from the repository root.
- The `verify` list above runs through the `land` skill's `templates/checks.sh <state file>` from the root of main's checkout, once, at landing. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what the booking quotes. The builder and the reviewer run the checks the brief names for the files the step changes before landing.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches outside a ledger's `cases/` folder finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md` entry 3, the rulings in `plan.md`, ADRs 0001 to 0003, the three `rebuild: writing` rows of `docs/academic-coverage.md` and their source files in research-hub. Ledger: `.scratch/3-the-writing-base/`, with `agents/briefs/` and `agents/reviews/`.
- research-hub is read only: the source files and the NWO XS `.docx` are read, never changed.

## Current position (rewritten before every step commit of this plan)

- 2026-10-15. Step 1 is landed (6105b48). The Gate of entry 3 is rewritten for four case drafts (6f97b05). Step 2 is stopped after its brief check: the open item "Step 2, the brief check" waits for Axel's ruling.
- Next step: 2, through `/spec 3 2` once the ruling is booked; its brief check has run (`agents/reviews/2-brief-check.md`) and is not run again.
- Open on Axel's side: "Step 2, the brief check"; later, the tag and the pin for step 3.

# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for entry 3 of `docs/roadmap.md`, the guide's usage line and its FAQ. Rewritten before every step commit of this plan, so it describes this plan as of its own last resume point (`plan-orchestration`, "Resuming, and handing the plan over"). Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run once, at landing on main, in order; all must pass. The builder and the reviewer run the checks the brief names for the files the step changes before landing. Copied from the repository's verification page by /plan.
- >-
  git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
- sh tests/guide.test.sh 2>&1 | tail -1
rules: docs/dev/change-standard.md # the repository's change standard: the rules every builder works under; every brief points at it.
standards: []                # files every brief tells the builder to read in full.
worktree_root: .agents/worktrees # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default for who builds a step: agent (a builder dispatched in the worktree), inline (the orchestrating session writes the step itself), academic-paper (the step is built through that skill). Chosen per step by the orchestrator and recorded in the dispatch block; a step of manuscript content is always academic-paper.
worker: claude:sonnet        # the default worker is claude:opus; a builder never runs on Fable.
reviewer: claude:sonnet      # the model the first run of /refute, the brief check, the diagnosis agent and the lookups of /grill run on: claude:opus by default; a reviewer never runs on Fable.
libraries: avoid             # the project's library policy from plan.yaml: check, /spec looks for libraries before a brief; avoid, no new dependency.
review: every                # every, or earned: under the loop, the reviewer runs unless the worker's record earns the skip (plan-orchestration, "The review, earned"); a small text step is always reviewed once.
refute_after_repair: yes     # yes: /refute runs again over each repair round, its findings fixed at landing or raised as open items, never sent back; no: the orchestrator's read of the round stands in.
repair_rounds: 1             # the most repair rounds a step gets; a refutation that finds nothing ends them early; the round cap in plan-orchestration's Rules allows one beyond it under its exception.
review_minutes: 0            # the reviewer's time box in minutes; 0 is none.
look:                        # where a changed view is opened at landing (a page, a command); empty means no look step.
bench: []                    # the binaries /spec stages and /land runs interleaved, base against new; empty means no A/B.
adr: docs/adr                # the ADR folder: grill writes the decision records into it, /plan, /spec and /refute read them.
design_bar: industry         # what grill's options are held to: industry, state-of-the-art or novel.
design_references: []        # the published standards a design is held to, such as WCAG 2.2 AA.
worker_effort: high          # the effort a builder runs at: low, medium, high, xhigh or max.
reviewer_effort: high        # the effort a reviewer, a brief-check agent, a diagnosis agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
self_rule: on                # on: the plan runs under self-rule; off: every open item waits for the user.
next_entry: off              # copied from .agents/plan.yaml; after the closing, next-entry mode reads .agents/plan.yaml itself, as plan-orchestration's references/self-rule.md, "Next-entry mode", says.
repair_reviewer: claude:sonnet # the model the run of /refute over a repair round runs on, at reviewer_effort; the reviewer value when plan.yaml leaves it out.
```

```yaml
dispatch: none               # or the block /spec writes (a list when .agents/plan.yaml's workers_at_once is above 1). /spec writes the entry at the end of its preflight with step and `landing: preparing`, writes `"running: <agent id>"` into brief_check while the brief-check agent runs, base after its preparation commit and worktree before it creates the worktree, and fills the entry at its Steps 9, so that it holds: step, executor, worker, worktree (<worktree_root>/<slug>-<step>), base, launched, report (the builder's report, at the path the brief names), brief_check (the brief check's report path, with the agent's id, its served model, tokens, tool uses and time, or `none, a small text step` for a small text step), landing, round. `landing` is `preparing` while /spec runs, then `not-started`, `cherry-picking` while /land cherry-picks, and `backed-out` after a red line took the step back out of main. The orchestrator adds session_id, the builder's agent id followed by the model the runner served it (<agent id> (<served model>)), as soon as the builder is dispatched and its model read, builders_before (the agent id and served model of each builder it replaced, as <agent id> (<served model>, stopped) or <agent id> (<served model>, dead), one after another), builder_usage (the builder's tokens, tool uses and time from its completion notice) beside report when the builder's report is saved, and reviewer_report (the refuter report's path, with each reviewer's agent id, served model, tokens, tool uses and time, or, for a reviewer stopped for another model, its agent id, served model and stopped) at the review. A value that holds `: ` (brief_check while its agent runs, builder_usage after a repair round, reviewer_report after a run over a round) is written in double quotes, so the block stays valid YAML. A diagnosis agent has no key here: the session that starts it writes its id and role into plan.md's Agents section, as the diagnose skill's Rules say. A step dispatched while another in flight, of this plan or of another open plan, names a file its brief also names carries shared_paths: each shared file, the other step's plan and step, and why the merge at landing is simple, as plan-orchestration's "Two steps in flight" says; with no shared file the key is left out.
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says; what is settled belongs in the closed list.

- Open item Step 4, the roadmap diff of `/roadmap done 3` (2026-10-12), kind 4 of the six kinds left open: the closing step's `/roadmap done 3` drafted entry 3 removed from the open order and the line `- [x] 3. The guide's usage line and its FAQ: ...` added under "Done", with the gate's output as run on main at 141a975 (`1`; `# FAQ`; `2`; the two questions read in place; `1`). Options: (a) approve the diff, then the entry commit and the move of this folder to `.scratch/archive/` follow; pro, the plan closes with its gate's output on record; con, none found. (b) correct the diff; pro, a wording the user prefers; con, another round of the closing. Recommendation: (a). The lazy option is leaving the diff unruled, which keeps the plan open with nothing left to build.

## Closed items (the log of what was raised and how it ended; no report carries it)

- none.

## The standing demands (from the user, in force)

- `docs/dev/change-standard.md`. The ones that bite here: the builder runs no git command; the checks the brief names are quoted verbatim.
- Commits: a capitalised imperative subject and `- Verb` bullets. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree; a diff kept for the record is a patch file under `agents/reviews/`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <slug>-<step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, 127 when `python3` is not installed, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- The `verify` list above, from the repository root.
- The `verify` list above runs through the `land` skill's `templates/checks.sh <state file>` from the root of main's checkout, once, at landing. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what the booking quotes. The builder and the reviewer run the checks the brief names for the files the step changes before landing.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: `docs/roadmap.md`. Ledger: `.scratch/3-the-guide-s-usage-line-and-its-faq/`, with `agents/briefs/` and `agents/reviews/`.
- The data the steps read, and who may change it: `docs/` and `tests/`, changed only by a step.
- Anything running that a step must not disturb: nothing.

## Current position (rewritten before every step commit of this plan)

- 2026-10-12. Steps 1, 2 and 3 of 4 landed on main (cf5c5b6, c59dbea, 6379a69).
- Verified: `checks.sh` on main at the landing of step 3 printed `checks: 2 commands passed`, with `PASS: docs/guide.md`.
- Next step: 4, the closing: the closing report is committed (141a975); the roadmap diff waits for the user's ruling.
- Open on the user's side: Open item Step 4, the roadmap diff of `/roadmap done 3`.

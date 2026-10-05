# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for <the roadmap entry>. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: another Claude Code session continues from these files alone.

```yaml
verify:                      # commands run once, at landing on main, in order; all must pass. The builder and the reviewer run the checks the brief names for the files the step changes before landing. Copied from the repository's verification page by /plan.
- <command>
rules: <path>                # the repository's change standard: the rules every builder works under; every brief points at it.
standards: []                # files every brief tells the builder to read in full.
worktree_root: <path>        # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default for who builds a step: agent (a builder dispatched in the worktree), inline (the orchestrating session writes the step itself), academic-paper (the step is built through that skill). Chosen per step by the orchestrator and recorded in the dispatch block; a step of manuscript content is always academic-paper.
worker: claude:<model>       # the default worker is claude:opus; a builder never runs on Fable.
reviewer: claude:<model>     # the model the first run of /refute, the brief check, the diagnosis agent and the lookups of /grill run on: claude:opus by default; a reviewer never runs on Fable.
libraries: check|avoid       # the project's library policy from plan.yaml: check, /spec looks for libraries before a brief; avoid, no new dependency.
review: every                # every, or earned: under the loop, the reviewer runs unless the worker's record earns the skip (plan-orchestration, "The review, earned"); a small text step is always reviewed once.
refute_after_repair: yes     # yes: /refute runs again over each repair round, its findings fixed at landing or raised as open items, never sent back; no: the orchestrator's read of the round stands in.
repair_rounds: 1             # the most repair rounds a step gets; a refutation that finds nothing ends them early; the round cap in plan-orchestration's Rules allows one beyond it under its exception.
review_minutes: 0            # the reviewer's time box in minutes; 0 is none.
look:                        # where a changed view is opened at landing (a page, a command); empty means no look step.
workers_at_once: 1           # steps in flight at once; above 1, two of them share a file only when the orchestrator judges the merge at landing simple (plan-orchestration, "Two steps in flight").
bench: []                    # the binaries /spec stages and /land runs interleaved, base against new; empty means no A/B.
adr: docs/adr                # the ADR folder: grill writes the decision records into it, /plan, /spec and /refute read them.
design_bar: industry         # what grill's options are held to: industry, state-of-the-art or novel.
design_references: []        # the published standards a design is held to, such as WCAG 2.2 AA.
worker_effort: high          # the effort a builder runs at: low, medium, high, xhigh or max.
reviewer_effort: high        # the effort a reviewer, a brief-check agent, a diagnosis agent and a lookup agent of /grill run at: low, medium, high, xhigh or max.
self_rule: off               # on: the plan runs under self-rule; off: every open item waits for the user.
next_entry: off              # copied from .agents/plan.yaml; after the closing, next-entry mode reads .agents/plan.yaml itself, as plan-orchestration's references/self-rule.md, "Next-entry mode", says.
repair_reviewer: claude:<model>  # the model the run of /refute over a repair round runs on, at reviewer_effort; the reviewer value when plan.yaml leaves it out.
```

```yaml
dispatch: none               # or the block /spec writes (a list with workers_at_once above 1): step, executor, worker, worktree, base, launched, report (the builder's report, at the path the brief names), brief_check (the brief check's report path, with the agent's id, its served model, tokens, tool uses and time, or `none, a small text step` for a small text step), landing, round. The orchestrator adds session_id, the builder's agent id followed by the model the runner served it (<agent id> (<served model>)), as soon as the builder is dispatched and its model read, builders_before (the agent id and served model of each builder it replaced, as <agent id> (<served model>, stopped) or <agent id> (<served model>, dead), one after another), builder_usage (the builder's tokens, tool uses and time from its completion notice) beside report when the builder's report is saved, and reviewer_report (the refuter report's path, with each reviewer's agent id, served model, tokens, tool uses and time, or, for a reviewer stopped for another model, its agent id, served model and stopped) at the review. A diagnosis agent has no key here: the session that starts it writes its id and role into plan.md's Agents section, as the diagnose skill's Rules say. A step dispatched while another in flight names a file its brief also names carries shared_paths: each shared file and why the merge at landing is simple; with no shared file the key is left out.
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled or, under `self_rule: on`, until the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says)

A finding that is neither closed in the repair rounds nor fixed at landing is an open item here, and goes where `plan-orchestration`'s "What earns a step of its own" says; what is settled belongs in the closed list.

- <a stop awaiting the user's ruling, or a proposal of the recurring-findings pass, with its options, the pros and cons of each, what each would need approved later, and one recommendation, as plan-orchestration's Stops section says; or "none">. An item is booked here the moment it is raised; it leaves only when the user has ruled or, under `self_rule: on`, when the orchestrator closes it as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", says, and then goes to the closed list.

## Closed items (the log of what was raised and how it ended; no report carries it)

- <date>: <what was raised>: <how it ended>.

## The standing demands (from <the user>, in force)

- <the repository's instruction file>, the sections <...>. The ones that bite here: <the two or three rules this plan keeps hitting>.
- Commits: <the user's message shape>. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree; a diff kept for the record is a patch file under `agents/reviews/`.

## Verification, every step

- A landing runs the `land` skill's `templates/land.sh` from the repository root as `sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`. It commits the step's work in its worktree, cherry-picks the range onto main, runs the `verify` list on main through `templates/checks.sh` and prints the booking data. It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict and 64 on a refusal, or with git's own status when a git step fails; the `land` skill's `templates/land.test.sh` proves it.
- <the commands, and the directory each runs from>.
- The `verify` list above runs through the `land` skill's `templates/checks.sh <state file>` from the root of main's checkout, once, at landing. It prints `$ <command>` and the output of each command, then `checks: <n> commands passed`, and the lines it prints are what the booking quotes. The builder and the reviewer run the checks the brief names for the files the step changes before landing.
- Every step: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the step's.

## Where things are

- Design: <path>. Ledger: `<ledger_root>/<slug>/`, with `agents/briefs/` and `agents/reviews/`.
- The data the steps read, and who may change it: <paths>.
- Anything running that a step must not disturb: <the service, its port, and why>.

## Current position (rewritten before every step commit)

- <date>. <what has landed, with its commit hashes>. <state of the working tree>.
- Verified: <the command and the result it printed>.
- Next step: <n>, because <why it is next>; or PAUSED, until <the user> says otherwise.
- Open on <the user>'s side: <none, or the decision owed>.

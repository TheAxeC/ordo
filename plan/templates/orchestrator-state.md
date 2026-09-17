# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The catch-up note for <the roadmap entry>. Rewritten before every step commit. Everything here is also derivable from `plan.md`, the roadmap, the repository's instruction file and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: a session on either harness continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass. Copied from the repository's verification page by /plan.
- <command>
rules: <path>                # the repository's change standard: the rules every builder works under; every brief points at it.
standards: []                # files every brief tells the builder to read in full.
worktree_root: <path>        # where a step's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a step's worktree; empty means the whole tree.
executor: agent              # the plan's default for who builds a step: agent (a builder dispatched in the worktree), inline (the orchestrating session writes the step itself), academic-paper (the step is built through that skill). Chosen per step by the orchestrator and recorded in the dispatch block; a step of manuscript content is always academic-paper.
worker: <harness:model>      # the default worker: claude:opus, codex:gpt-5.6-sol, or another working-tier model.
worker_effort: high          # the reasoning effort passed to a worker whose harness takes one.
reviewer: <harness:model>    # the model /refute runs on.
review: every                # every, or earned: under the loop, the reviewer runs unless the worker's record earns the skip (plan-orchestration, "The review, earned").
refute_after_repair: yes     # yes: /refute runs again over each repair round, its findings fixed at landing or booked, never sent back; no: the orchestrator's read of the round stands in.
repair_rounds: 1             # the most repair rounds a step gets; a refutation that finds nothing ends them early; the exception in plan-orchestration allows one beyond it.
review_minutes: 0            # the reviewer's time box in minutes; 0 is none.
look:                        # where a changed view is opened at landing (a page, a command); empty means no look step.
workers_at_once: 1           # 1, or 2 when two steps with disjoint paths may run side by side.
```

```yaml
dispatch: none               # or the block /spec writes (a list with workers_at_once above 1): step, executor, worker, worktree, base, launched, prompt, events, report, exit, pid, session_id, landing, round, reviewer_report, and the repair_ entries while a fix round is in flight.
```

## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim at the top of every report until ruled)

Nothing here needs a command or a fix: a finding that needs no ruling is a step in the plan and belongs in the booked list below, and what is settled belongs in the closed list.

## Booked, no ruling needed (what a review, a look or the closure audit found; each is a step in plan.md and is worked in queue order, and a report names this list's count and its steps)

## Closed items (the log of what was raised and how it ended; no report carries it)

- <a stop awaiting the user's ruling, a fix owed, or nothing: "none">. A reported item is booked here the moment it is raised; it leaves only when it is done or the user has ruled.

## The standing demands (from <the user>, in force)

- <the repository's instruction file>, the sections <...>. The ones that bite here: <the two or three rules this plan keeps hitting>.
- Commits: <the user's message shape>. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree; a diff kept for the record is a patch file under `agents/reviews/`.

## Verification, every step

- <when the ledger holds a landing script: its invocation from the repository root, what it does, its exit codes, and the test that proves it>.
- <the commands, and the directory each runs from>.
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

## Usage

| step | worker (tokens / tool uses / wall) | reviewer (the review; the runs over the repair rounds) | repair rounds (up to repair_rounds, or one more under the exception) | findings sent back | lines +/- | first report passed | fixes at landing | findings booked for the user | orchestrator messages | orchestrator output tokens | orchestrator cache-write tokens | orchestrator cache-read tokens | orchestrator fresh input tokens | orchestrator minutes | the look (views, themes, what was seen) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|

# Orchestrator state (read this first after any context compaction, or as a new orchestrator)

The orchestrator's catch-up note for <feature>. Rewritten before every package commit. Everything here is also derivable from `plan.md`, <the design document>, <the repository's instruction file> and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript when there is one. Nothing needed to continue lives anywhere but this folder: an orchestrator on either harness continues from these files alone.

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass.
- <command>
worktree_root: .agents/worktrees   # where a package's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a package's worktree; empty means the whole tree.
standards: []                # files every brief tells the agent to read in full.
executor: agent              # agent | academic-paper | inline.
worker: <harness:model>      # the default worker: claude:opus, codex:gpt-5.6-sol, or another working-tier model.
worker_effort: high          # the reasoning effort passed to a worker whose harness takes one.
reviewer: none               # none, or harness:model of the optional reviewer stage.
```

```yaml
dispatch: none               # or the block: package, worker, worktree, base, launched, prompt, events, report, exit, pid, session_id, landing.
```

## The standing demands (from <the user>, in force)

- <the repository's instruction file>, the sections <...>. The ones that bite here: <the two or three rules this plan keeps hitting>.
- Agents: the worker the block names, on the working tier (Claude Opus 5 or GPT 5.6 Sol), one at a time, in a worktree at main's head; the orchestrator on the top tier (Claude Fable 5.1 or GPT 6 Astra); the worker is chosen per package. The agent never runs a git command and never edits a file under `.scratch/`.
- Commits: <the user's message shape>. No attribution of any kind. Never push. A worktree's branch is deleted with the worktree; a diff kept for the record is a patch file under `agents/reviews/`.
- <the artefact every package is measured against>, and what happens when it and the code disagree.

## Verification, every package

- <the commands, and the directory each runs from>.
- Every package: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows nothing of the package's.

## Where things are

- Design: <path>. Ledger: `.scratch/<feature>/`, with `agents/spec.md`, `agents/briefs/` and `agents/reviews/`.
- The data the packages read, and who may change it: <paths>.
- Anything running that a package must not disturb: <the service, its port, and why>.

## Current position (rewritten before every package commit)

- <date>. <what has landed, with its commit hashes>. <state of the working tree>.
- Verified: <the command and the result it printed>.
- Next package: <P>, because <why it is next>; or PAUSED, until <the user> says otherwise.
- Open on <the user>'s side: <none, or the decision owed>.

## Usage

- <package>, <harness:model at effort>, <tokens: input, cached, output>, <tool uses or completed items>, <seconds>, <lines added and removed>, <first report passed its bar: yes or no>, <repair rounds>, <fixes at landing, and their kind>, <orchestrator minutes on the read, the repairs and the landing>.

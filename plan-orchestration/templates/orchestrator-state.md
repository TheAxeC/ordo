# Orchestrator state (read this first after any context compaction)

The orchestrator's catch-up note for <feature>. Rewritten at every package. Everything here is also derivable from `plan.md`, <the design document>, <the repository's instruction file> and `git log`, but slower. Read this, then `plan.md`, then the tail of the transcript.

```yaml
verify:            # commands run in the worktree and again on main, in order; all must pass.
- <command>
worktree_paths: [] # sparse-checkout paths for a package's worktree; empty means the whole tree.
standards: []      # files every brief tells the agent to read in full.
executor: agent    # agent | academic-paper | inline.
model: opus        # for executor agent: opus or lower, never fable.
```

## The standing demands (from <the user>, in force)

- <the repository's instruction file>, the sections <...>. The ones that bite here: <the two or three rules this plan keeps hitting>.
- Agents: <model> or lower, never fable, one at a time, in a worktree at main's head. The agent never runs a git command and never edits a file under `.scratch/`.
- Commits: <the user's message shape>. No attribution of any kind. Never push.
- <the artefact every package is measured against>, and what happens when it and the code disagree.

## Verification, every package

- <the commands, and the directory each runs from>.
- Every package: `LC_ALL=C grep -n '[^ -~]'` over every file the diff touches finds nothing new, and `git status --short` shows only the package's files.

## Where things are

- Design: <path>. Ledger: `.scratch/<feature>/`, with `agents/spec.md`, `agents/briefs/` and `agents/reviews/`.
- The data the packages read, and who may change it: <paths>.
- Anything running that a package must not disturb: <the service, its port, and why>.

## Current position (rewritten at every package)

- <date>. <what has landed, with its commit hashes>. <state of the working tree>.
- Verified: <the command and the result it printed>.
- Next package: <P>, because <why it is next>.
- Open on <the user>'s side: <none, or the decision owed>.

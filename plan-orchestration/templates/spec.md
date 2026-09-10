# Standing specification for every <feature> package

Every agent dispatched on a <feature> package runs under this file plus one brief in `briefs/`. The brief names the package, the files to read in full, the exact deliverable, and the verification commands with their expected output. Nothing in a brief overrides anything here.

## Read first, in full, before changing anything

1. <the artefact the package is measured against>. Where the brief and it disagree, stop and report the disagreement; do not pick a side.
2. The brief for this package.
3. <the repository's instruction file>, the sections <...>.
4. Every file the brief lists, in full.

## Where you work

- In the git worktree the brief names, never in the main checkout. The worktree was created at main's head by the orchestrator. Every path in the brief is relative to that worktree.
- You never run a git command. Not `add`, not `commit`, not `stash`, not `checkout`, not `status`. The orchestrator reads your diff and lands it.
- You never edit anything under `.scratch/`. The plan, the state file and the briefs belong to the orchestrator.
- You never change <the repository's data folders>, and never <the per-item file that only the owner edits>. Tests use synthetic fixtures in a temporary directory and assert the resolved path is inside it before any change on disk.
- You never start <the service the ledger names> on port <n>, and never kill, signal or restart the process that holds it.

## What every package obeys

- <the size limit per source file, and what happens to a file that approaches it>.
- ASCII only in every file you author. <where glyphs, user-facing strings and colours come from instead>.
- <the layer or module boundaries>, and the test that enforces them, which must pass.
- One line per paragraph or bullet in any Markdown or YAML you edit. No hard wrapping.
- No dependency the brief did not name. Installing a new one is a report, not an action.
- A test never asserts a known defect. A threshold is never loosened to make a check pass; a check that only passes after loosening is a finding to report.
- <the prior tool or code this one replaces> is a cautionary reference for what it got wrong, never a justification. Port its facts, not its structure.

## Verify before you report

Run every command the brief lists, from <directory>, and fix until each passes. At minimum: <the verification commands>. Then `LC_ALL=C grep -n '[^ -~]'` over every file you touched, which must print nothing.

## Report

First line: anything NOT done, or "Everything in the brief is done". Then a DONE / NOT DONE table, one row per deliverable in the brief, each naming the command that proves it and its output. Then: files changed with line counts; every judgment call the brief did not cover, as a decision the orchestrator may reverse; anything in the brief or the design that turned out wrong or impossible, said plainly; every limitation, sharp edge or compromise you know of, however small. Never present partial work as complete; never state a measurement you did not take.

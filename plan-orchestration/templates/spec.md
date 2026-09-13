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

- Nothing inside this brief is left undone: a miss the read, the reviewer or the checks find is repaired or fixed at landing, and the package is not ticked while any acceptance item, test or convention is short. A miss is never reported as a gap or a sharp edge, unless it is a stop (the skill's Stops section), and then it is booked in the ledger and repeated in every report until the user rules.
- A fix of a defect in delivered work needs no yes from the user, whatever it makes visible; only a user-visible shape nobody asked for, a premise found wrong or a clash between two rules goes to the user.
- No history in code or comments: a comment says what the code does and why, never which package, session, date, earlier bug or reverted attempt it came from. This spec states rules the same way: no dates, no incidents.

Every convention a package is judged on is written in this section. A convention that lives only in the tree's existing files is not a rule: a worker told to read little will not meet it, and a miss against it is the spec's fault, not the worker's.

- <the size limit per source file, and what happens to a file that approaches it>.
- <the shape every new file opens with: a head comment naming its layer, what it is and why it is shaped as it is>.
- <the shared primitives every control is built from, and the markup style the tree is written in>.
- <where a configured value is read from, and that no default is hardcoded beside its key>.
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

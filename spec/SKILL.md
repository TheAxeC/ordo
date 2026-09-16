---
name: spec
description: "Prepare one step of an open plan: check every premise the step's text makes against the tree, write the brief (the checked premises, the fix text, the verification list, the report shape, the pointer to the repository's change standard), create the step's worktree at main's head, stage the base binaries, and record the dispatch in the state file. Triggers on: spec <entry> <step>, brief <step>, prepare step <n>, write the brief."
metadata:
  version: "1.0.0"
---

# Prepare a step

`/spec <entry> <step>` writes the one file a builder works from and puts the tree in the state the builder expects. It refuses rather than guesses: a premise found false is a stop, booked in the open items, and the brief is not written until the plan's text is corrected.

## What it reads

1. `.agents/plan.yaml`, then the ledger folder: `<entry>` resolves to the ledger folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title); `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has. No such folder is a refusal that names `/plan`.
2. `orchestrator-state.md`: the configuration block, the open items, and the dispatch block (a step already in flight is a refusal that names it, unless the block allows more than one).
3. `plan.md`: the step's line, the rulings that touch it, and everything the plan carries to it. A step not in the list is a refusal that prints the list.
4. The tree, on main at its head, for every count, path, name, line number and claim the step's text makes: each checked with a grep or a probe, never taken from the plan's text.

## What it writes

- `agents/briefs/<step>.md` from `templates/brief.md`: the premises as checked, with the command that checked each; the fix text, in the brief's own words, not a pointer; the verification commands from the configuration block plus the step's own gate, each with the directory it runs from and the output that counts as a pass; the report shape; the first line a pointer to the rules file the configuration names, and to the standards it lists. A choice the plan leaves open is taken in the brief and listed under "Decisions taken in this brief", each reversible; a choice that is user-visible (a public shape, a wire format, a config key, a vocabulary) is not taken: it is a stop.
- The preparation commit: the brief, and any amendment to `plan.md` the premise checks forced, committed by path. Its hash is the base.
- The worktree, from the base: `git worktree add -b <step> <worktree_root>/<step> <base>`, then from inside it `git sparse-checkout set <worktree_paths>` when the block names any, and the dependency install the project needs. Every git command on a worktree runs from inside it, never as `git -C`.
- The base binaries for the landing's A/B, copied aside from the current build (the configuration block's `bench:` line names them; none named, none staged).
- The dispatch block in the state file: step, worker, worktree, base, launched, report path, `landing: not-started`, `round: 0`; committed by path as a second small commit. The worker's identity goes into the block the moment it is known.

## Preflight, before any write

On `main`, nothing staged, no git operation in progress, and any unrelated change of the user's listed by path and left alone. A preflight that fails stops the skill with what it saw.

## Rules

- A premise found wrong is corrected in the plan before the brief exists, never left for the builder to hit; if the correction changes the step's scope, that is a stop for the user, booked in the open items.
- The brief carries every requirement the step is judged on in its own words: the acceptance list, the tests, the conventions, the checks. A builder told only where to look will not meet what it did not read.
- The brief names no harness and no vendor. What differs per harness is in `plan-orchestration`'s launch recipes, not here.
- No history in the brief: what to build and why, never what went wrong before.

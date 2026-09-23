---
name: spec
description: "Prepare one step of an open plan: check every premise the step's text makes against the tree, write the brief (the checked premises, the fix text, the verification list, the report shape, the pointer to the repository's change standard), create the step's worktree at main's head, stage the base binaries, and record the dispatch in the state file. Triggers on: spec <entry> <step>, brief <step>, prepare step <n>, write the brief; and on a ruling typed in reply to a stop (Ruled: ...)."
metadata:
  version: "1.4.0"
---

# Prepare a step

`/spec <entry> <step>` prepares one step of an open plan for its builder. It leaves behind the brief and the dispatch block, committed, the step's worktree at the base, and the base binaries copied aside.

## Quick start

```
/spec <entry> <step>     write the one file a builder works from, and put the tree in the state the builder expects
Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says; then /spec <entry> <step> again
```

## Use instead

| When | Use |
|---|---|
| The plan is not open yet | `/plan <entry>` |
| Every step of the plan, unattended | `/plan-orchestration <entry>` |
| The step is built and needs its review | `/refute <entry> <step>` |
| Where the plan stands and which command comes next | `/plan-help <entry>` |

## What it reads

1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them; a required key missing is a refusal ("Stops").
2. The ledger folder: `<entry>` resolves to the folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title).
   - `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has.
   - No such folder is a refusal ("Stops").
3. `orchestrator-state.md`: the configuration block, the open items, and the dispatch block.
   - A step already in flight is a refusal, under the condition in "Stops".
4. `plan.md`: the step's line, the rulings that touch it, and everything the plan carries to it.
   - A step not in the list is a refusal ("Stops").
5. The tree, on main at its head, for every count, path, name, line number and claim the step's text makes.
   - Each is checked with a grep or a probe, never taken from the plan's text.

## Steps

1. Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
   - Any unrelated change of the user's is listed by path and left alone.
   - A preflight that fails is a refusal ("Stops").
2. Check every premise the step's text makes against the tree.
   - A premise found false is a stop ("Stops"): the plan's text is corrected before the brief exists, never left for the builder to hit.
   - A correction that changes the step's scope is a stop for the user ("Stops").
3. Write `agents/briefs/<step>.md` from `templates/brief.md`.
   - The first line points at the rules file the configuration names, and at the standards it lists.
   - The premises as checked, with the command that checked each.
   - The fix text, in the brief's own words, not a pointer.
   - The verification commands from the configuration block plus the step's own gate, each with the directory it runs from and the output that counts as a pass.
   - The report shape.
   - A choice the plan leaves open is taken in the brief and listed under "Decisions taken in this brief", each reversible.
   - A user-visible choice (a public shape, a wire format, a config key, a vocabulary) is not taken: it is a stop ("Stops").
4. Make the preparation commit: the brief, and any amendment to `plan.md` the premise checks forced, committed by path. Its hash is the base.
5. Create the worktree from the base: `git worktree add -b <step> <worktree_root>/<step> <base>`.
   - Then, from inside it, `git sparse-checkout set <worktree_paths>` when the block names any.
   - Then the dependency install the project needs.
6. Stage the base binaries for the landing's A/B, copied aside from the current build.
   - The configuration block's `bench:` line names them; none named, none staged.
7. Write the dispatch block into the state file: step, executor, worker, worktree, base, launched, report path, `landing: not-started`, `round: 0`.
   - The executor is the configuration block's default, until the orchestrator chooses for the step.
   - Commit the block by path as a second small commit.
   - The worker's identity goes into the block the moment it is known.

### A stop

1. Leave three things and nothing else: the open item in the state file (the step, what the tree shows against the step's text, the choice the user owns, one recommendation with its reasons); the same text under the step's Step 0 in `plan.md` or the part file it names; the ledger committed by path, so the stop survives the session.
2. No brief, no worktree and no dispatch block exist for the stopped step.

### A ruling

1. The user closes a stop by typing the ruling as plain text, in any session on the repository:

   ```
   Ruled: <the choice, one clause per question the open item asked>
   ```

2. On that message the session books the ruling and nothing else:
   - the open item is closed with the ruling's text and its date;
   - the step's text in `plan.md` is rewritten to what was ruled;
   - a step the ruling splits gets its own line in the step list and its own Step 0, its carried premises with it;
   - a ruling that sets a public shape, a vocabulary or a rule is also written where the plan keeps its rulings, so later premise checks read it;
   - the ledger files are committed by path.
3. Then `/spec <entry> <step>` is typed again. It rechecks every premise against the tree, the ruled text included, and writes the brief.

## Stops

The first three rows are stops, which leave an open item as "Steps / A stop" says; the rest are refusals, which name their cause and leave nothing.

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| A false premise | A premise the step's text makes is false on the tree; the skill does not guess | The open item, booked in the open items | A ruling ("Steps / A ruling") |
| A scope change | A premise correction would change the step's scope | The open item, booked in the open items | A ruling |
| A user-visible choice | The brief would have to choose a public shape, a wire format, a config key or a vocabulary | The open item, booked in the open items | A ruling |
| A failed preflight | Not on `main`, something staged, or a git operation in progress | What it saw | The tree put right, then `/spec` again |
| A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/spec` again |
| No ledger folder | No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan`, then `/spec` |
| A step in flight | A step is already in flight, and the configuration block does not allow more than one | The step in flight, named | That step landed |
| No such step | The step is not in `plan.md`'s list | The list | `/spec` with a step in the list |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A brief that tells the builder where to look | A builder told only where to look will not meet what it did not read | Write every requirement the step is judged on into the brief in its own words: the acceptance list, the tests, the conventions, the checks |
| A harness or a vendor named in the brief | The brief then works for one harness only; what differs per harness is in `plan-orchestration`'s launch recipes | Leave it out |
| History in the brief | It tells the builder what went wrong, not what to build | What to build, and why |

## Rules

- Every git command on a worktree runs from inside it, never as `git -C`.

---
name: spec
description: "Prepare one step of an open plan: refuse a step whose line carries no authority of the user ((approved) or (ruling <name>)), check every premise the step's text makes against the tree, write the brief (the checked premises, the fix text, the verification list, the report shape, the pointer to the repository's change standard, the cases, the paths it writes), check those paths against the briefs of the steps in flight, create the step's worktree at main's head, stage the base binaries, and record the dispatch in the state file. Triggers on: spec <entry> <step>, brief <step>, prepare step <n>, write the brief; and on a ruling typed in reply to a stop (Ruled: ...)."
metadata:
  version: "1.5.0"
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
   - The brief of each step the dispatch block names, `agents/briefs/<step>.md` beside the state file, for its "Paths this step writes" (Steps 4).
4. `plan.md`: the step's line, the rulings that touch it, and everything the plan carries to it.
   - The step's authority is the tags that end its line: `(approved)` for a step of the list the user approved when the plan opened, or `(ruling <name>)` naming a line of the Rulings section that ends with "(the user)".
   - A step without that authority is a refusal ("Stops"), checked at Steps 1.
   - A step not in the list is a refusal ("Stops").
5. The tree, on main at its head, for every count, path, name, line number and claim the step's text makes.
   - Each is checked with a grep or a probe, never taken from the plan's text.

## Steps

1. Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
   - Any unrelated change of the user's is listed by path and left alone.
   - An uncommitted change on the ledger's `plan.md` or at the brief's path `agents/briefs/<step>.md` is a refusal ("Stops"), named by path, since Steps 3 writes the brief there and a refusal at Steps 4 restores both.
   - A preflight that fails is a refusal ("Stops").
   - Then, before any premise check, run `python3 templates/check_step.py <plan.md> <step>`, which reads the step's line and the Rulings section of `plan.md`.
   - Exit 0 prints one `ok:` line naming the tags that give the step the user's authority.
   - Exit 1 is a refusal ("Stops"): its `refused:` line names the step and the reason, and says the user's ruling is needed.
   - Exit 64 is a refusal on its `error:` line: `plan.md` missing or not UTF-8, a section missing, a step listed twice, or a step not in the list, the list printed.
   - A refusal here writes nothing.
2. Check every premise the step's text makes against the tree.
   - A premise found false that the plan can absorb is corrected in `plan.md` before the brief exists, never left for the builder to hit.
   - That correction goes into the preparation commit (Steps 5).
   - The brief records the correction beside the premise.
   - A premise found false that the plan cannot absorb is a stop ("Stops"): its correction would change the step's scope, or make a choice the user would see.
3. Write `agents/briefs/<step>.md` from `templates/brief.md`.
   - The first line points at the rules file the configuration names, and at the standards it lists.
   - The premises as checked, with the command that checked each.
   - The fix text, in the brief's own words, not a pointer.
   - The verification commands from the configuration block plus the step's own gate, each with the directory it runs from and the output that counts as a pass.
   - The report shape, with the cases' first run before the result table.
   - Under "Cases", every must-pass and must-refuse example the step's text gives, in one list, each an input and its expected result, and the builder's first task as the template states it: the cases turned into tests and run against the unchanged tree before any code changes, and a case the brief's rules get wrong handed back before any code changes.
   - Under "Paths this step writes", every path the step writes, one per line, the report path included: ``- `<path>` `` for a whole file, or ``- `<path>` lines <a>-<b>` `` for a range of a shared document, numbered as on main at the base.
   - A choice the plan leaves open is taken in the brief and listed under "Decisions taken in this brief", each reversible.
   - A choice that decides a format or a rule the builder applies across the tree (a directive shape, an anchor rule, a naming rule, a file layout) is run by the session writing the brief on at least five real cases from the tree, and the brief quotes each input and its output under the decision, so an unreadable or wrong result is seen before dispatch.
   - Every item of "What to build" is a change whose content is known. An item of the form "find why X happens and end it" is investigation: the session writing the brief does it first, read-only, and writes the found cause and its fix into the item; a cause it cannot find is left out of the brief and raised to the user as an open item.
   - A user-visible choice (a public shape, a wire format, a config key, a vocabulary) is not taken: it is a stop ("Stops").
   - A step that rewrites an existing skill's `SKILL.md`, as the standards define a rewrite, gets the rule inventory they require: the brief names the inventory's path in the ledger among the paths the step writes, and the inventory check the standards name among its verification commands, as `templates/brief.md` shows.
4. Run `python3 templates/check_paths.py <state file> <step>`, which compares the brief's "Paths this step writes" with the brief of every other step in the dispatch block.
   - Exit 0 prints one `ok:` line, and the step goes on to its preparation commit.
   - Exit 1 is a refusal ("Stops"): each `shared:` line names the path, this step and the step in flight whose brief names it.
   - Exit 64, or 69 when PyYAML is missing, is a refusal ("Stops") on the `error:` line, which names the argument, the state file or the brief and what is wrong with it.
   - A refusal here leaves nothing: the brief and any amendment of `plan.md` made at Steps 2 are restored to main's copies (`git restore -- <path>`, or the brief deleted when main has none), and no commit, worktree or dispatch block is made.
   - `/spec` run again redoes Steps 2 from the start, so the premise checks and their amendments are made again on the tree as it then is.
5. Make the preparation commit: the brief, and any amendment to `plan.md` the premise checks forced, committed by path. Its hash is the base.
6. Create the worktree from the base: `git worktree add -b <step> <worktree_root>/<step> <base>`.
   - Then, from inside it, `git sparse-checkout set <worktree_paths>` when the block names any.
   - Then the dependency install the project needs.
7. Stage the base binaries for the landing's A/B, copied aside from the current build.
   - The configuration block's `bench:` line names them; none named, none staged.
8. Write the dispatch block into the state file: step, executor, worker, worktree, base, launched, report path, `landing: not-started`, `round: 0`.
   - The entry takes the shape the `plan` skill's `templates/orchestrator-state.md` gives: one entry, `dispatch:` followed by its keys, when `workers_at_once` is 1; appended to the list of entries when it is above 1.
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
   - a step the ruling adds or splits gets its own line in the step list, ending with `(ruling <name>)`, and its own Step 0, its carried premises with it;
   - a ruling that adds or splits a step is also written in the Rulings section as a line ending with "(the user).", and the step's tag names it as `templates/check_step.py` reads it: `<L>` for a line `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, and the text before its first ` (` for any other line;
   - a ruling that sets a public shape, a vocabulary or a rule is also written where the plan keeps its rulings, so later premise checks read it;
   - the ledger files are committed by path.
3. Then `/spec <entry> <step>` is typed again. It rechecks every premise against the tree, the ruled text included, and writes the brief.

## Stops

The first two rows are stops, which leave an open item as "Steps / A stop" says; the rest are refusals, which name their cause and leave nothing.

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| A false premise the plan cannot absorb | A premise the step's text makes is false on the tree, and its correction would change the step's scope or make a choice the user would see (Steps 2); the skill does not guess | The open item, booked in the open items | A ruling ("Steps / A ruling") |
| A user-visible choice | The brief would have to choose a public shape, a wire format, a config key or a vocabulary | The open item, booked in the open items | A ruling |
| A step without the user's authority | The step's line ends with neither `(approved)` nor a `(ruling <name>)` naming a ruling of the user in the Rulings section, or it starts with `Removed by` (Steps 1) | The `refused:` line of `templates/check_step.py`, naming the step and the reason | The user's ruling, booked as "Steps / A ruling" says with the tag on the step's line, then `/spec` again |
| An unusable `plan.md` | `templates/check_step.py` exits 64 on a missing or unreadable `plan.md`, a missing section or a step listed twice (Steps 1) | Its `error:` line | `plan.md` put right, then `/spec` again |
| A failed preflight | Not on `main`, something staged, a git operation in progress, or an uncommitted change on the ledger's `plan.md` or at the brief's path | What it saw | The tree put right, then `/spec` again |
| A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/spec` again |
| No ledger folder | No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan`, then `/spec` |
| A step in flight | A step is already in flight, and the configuration block does not allow more than one | The step in flight, named | That step landed, or a red line took its landing back out of main and its dispatch block reads `landing: backed-out` (the `land` skill's Steps 6) |
| No such step | The step is not in `plan.md`'s list; `templates/check_step.py` exits 64 and prints the list (Steps 1) | The list | `/spec` with a step in the list |
| A path shared with a step in flight | The brief's "Paths this step writes" shares a path with the brief of another step in the dispatch block: the same file, named whole in one of them, or line ranges that overlap (Steps 4) | The `shared:` lines of `templates/check_paths.py`, each naming the path and both steps | The other step landed, or the step's paths changed so they share none, then `/spec` again |
| An unusable state file or brief | `templates/check_paths.py` exits 64, or 69 when PyYAML is missing (Steps 4) | Its `error:` line | The state file or the brief put right, or PyYAML installed, then `/spec` again |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A brief that tells the builder where to look | A builder told only where to look will not meet what it did not read | Write every requirement the step is judged on into the brief in its own words: the acceptance list, the tests, the conventions, the checks |
| A runner or a vendor named in the brief | The brief then ties the step to how it is launched, which `plan-orchestration`'s "Launching a builder" alone says | Leave it out |
| History in the brief | It tells the builder what went wrong, not what to build | What to build, and why |

## Rules

- Every git command on a worktree runs from inside it, never as `git -C`.

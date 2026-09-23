---
name: plan-help
description: "Print the command sequence for running a plan step by step (open, spec, build, refute, close, land, and the loop inside a step), and for the plan named, where it stands: the position, the open items, the step in flight, which of its artifacts exist, and the command that comes next. Triggers on: plan-help, plan help, what do I type next, where is the plan, how does the plan loop work."
metadata:
  version: "1.6.0"
---

# Plan help

`/plan-help` prints the command sequence for running a plan step by step, and, for a named plan, where that plan stands and the command that comes next.

## Quick start

```
/plan-help            print the sequence
/plan-help <entry>    print the sequence, then the named plan's position and the command that comes next
```

## Use instead

| When | Use |
|---|---|
| The plan should run its steps unattended | `/plan-orchestration <entry>` |
| No plan is open for the entry yet | `/plan <entry>` |
| What the reviews keep finding across plans | `/plan-retro` |

## What it reads

1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them; a required key missing is a refusal ("Stops").
2. For `/plan-help <entry>`, the ledger folder: `<entry>` resolves to the folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title).
   - `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has.
   - No such folder is a refusal ("Stops").
3. For `/plan-help <entry>`, the folder's state file, and the brief, the report and the refuter report of the step in flight.

## Steps

1. Print the sequence in "The sequence, printed verbatim".
2. For `/plan-help <entry>`, print the named plan's position.
   - From the state file: the position line, the open items verbatim, and the dispatch block (a step in flight, its worktree, its base, its round).
   - From the ledger folder, for the step in flight: which of the brief, the report and the refuter report exist, and whether the last refuter report has open findings.
3. For `/plan-help <entry>`, print one line from that position: the command that comes next, in the sequence.
   - An open item that waits on a ruling is printed with it, and the next line is `Ruled: ...`.

## The sequence, printed verbatim

```
/repo-setup                   once, for a new repository: the tree, the shared rules, the standards, then /ordo-init
/ordo-init                    once per repository: writes .agents/plan.yaml, or checks the one there
/roadmap add <goal>           an entry with its goal, gate and place in the order, for /plan to open
/plan <entry>                 once: opens the plan, shows the step list for approval

then, for every step:

/spec <entry> <step>          writes the brief, makes the worktree, stages the base binaries
"build it"                    the session writes the code in the worktree, runs the checks, writes the report
/refute <entry> <step>        a fresh reviewer reads the diff and reruns the checks, writes findings
"close them"                  a repair round: the session fixes the findings, reruns, rewrites the report
/refute <entry> <step>        again, over the repair round, when plan.yaml says refute_after_repair: yes
                              repeat these two up to repair_rounds times (plan.yaml); a refutation that finds nothing ends them; what the last one finds is fixed at landing or booked, never sent back
read the delta                when plan.yaml says refute_after_repair: no: the orchestrator reads the round and appends what it closed to the refuter report; what is left is booked as its own step and goes to the booked items
/land <entry> <step>          onto main, checks on main, small fixes, the look where plan.yaml's look: says, the A/B, the usage rows, the booking, the commit

when a command stops:

/spec stops                   a premise of the step is wrong on the tree, or a choice is yours: it wrote an open item and no brief
"Ruled: ..."                  you type the ruling as plain text; the session books it in the ledger and commits
/spec <entry> <step>          again; it now writes the brief
/land refuses or stops        it names the finding left unbooked or the red line: fix it at landing or book it, then /land again

/plan-orchestration <entry>   instead of the lines above: runs them for every step unattended, an agent at "build it" and "close them"

/plan-retro                   after plans have run: the findings the reviews keep making, and the rule, page or check that stops each
```

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| No stop | The skill never stops for a decision; the rows below are refusals, which name their cause and leave nothing | Nothing | Nothing |
| A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/plan-help` again |
| No ledger folder | No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan <entry>`, or `/plan-help` with an entry that has a plan |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Printing the sequence in other words | A reader matching what they typed against the sequence finds lines that are not there | Steps 1 |

## Rules

- The skill writes nothing.

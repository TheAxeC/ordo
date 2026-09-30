---
name: ordo-help
description: "Print the command sequence for running a plan step by step (open, spec, build, refute, close, land, and the loop inside a step), and for the plan named, where it stands: the position, the open items, the step in flight, which of its artifacts exist, and the command that comes next. Triggers on: ordo-help, ordo help, what do I type next, where is the plan, how does the plan loop work."
metadata:
  version: "1.8.3"
---

# Ordo help

`/ordo-help` prints the command sequence for running a plan step by step, and, for a named plan, where that plan stands and the command that comes next.

## Quick start

```
/ordo-help            print the sequence
/ordo-help <entry>    print the sequence, then the named plan's position and the command that comes next
```

## Use instead

| When | Use |
|---|---|
| The plan should run its steps unattended | `/plan-orchestration <entry>` |
| No plan is open for the entry yet | `/plan <entry>` |
| What the reviews keep finding across plans | `/plan-retro` |

## What it reads

1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
   - A required key missing is a refusal ("Stops").
2. For `/ordo-help <entry>`, the ledger folder: `<entry>` resolves to the folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title).
   - `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has.
   - No such folder is a refusal ("Stops").
3. For `/ordo-help <entry>`, the folder's state file, and the brief, the report and the refuter report of the step in flight.

## Steps

1. Print the sequence in "The sequence, printed verbatim".
2. For `/ordo-help <entry>`, print the named plan's position.
   - From the state file: the position line, the open items verbatim, and the dispatch block (a step in flight, its worktree, its base, its round).
   - From the ledger folder, for the step in flight: which of the brief, the report and the refuter report exist, and whether the last refuter report has open findings.
3. For `/ordo-help <entry>`, print one line from that position: the command that comes next, in the sequence.
   - An open item that waits on a ruling is printed with it, and the next line is `Ruled: ...`.

## The sequence, printed verbatim

```
/repo-setup                   once, for a new repository: the tree, the shared rules, the standards, then /ordo-init
/ordo-init                    once per repository: writes .agents/plan.yaml, or checks the one there
/roadmap add <goal>           an entry with its goal, gate and place in the order, for /plan to open
/roadmap add <entry>          for an entry not yet specified: its gate and place in the order, before /plan can open it
/plan <entry>                 once: opens the plan, shows the step list for approval

then, for every step:

/spec <entry> <step>          writes the brief, has a fresh agent check it against the tree (the brief check) and closes its findings in the brief, makes the worktree, stages the base binaries
"build it"                    the session writes itself into the dispatch entry and commits it. It then writes the code in the worktree, runs the checks and writes the report
/refute <entry> <step>        a fresh reviewer reads the diff and reruns the checks, writes verdicts and findings
"close them"                  a repair round: the session fixes the findings, reruns, rewrites the report
/refute <entry> <step>        again, over the repair round, when plan.yaml says refute_after_repair: yes
                              repeat these two up to repair_rounds times (plan.yaml), or once more under plan-orchestration's exception; a refutation that finds nothing ends them; what the last one finds is fixed at landing or raised to you as an open item, never sent back
read the delta                when plan.yaml says refute_after_repair: no: the orchestrator reads the round and appends what it closed to the refuter report; what is left is raised to you as an open item, and becomes a step only by your ruling
/land <entry> <step>          stops the step's agents, then onto main, checks on main, small fixes, the look where plan.yaml's look: says, the A/B, the booking, the commit

when a command stops:

/spec stops                   a premise of the step is wrong on the tree and the plan cannot absorb it, a finding of the brief check would change the step's scope, a choice is yours, or the brief-check agent was served a model other than the configured one (shown with the configured value, the served model and the Claude Code version): it wrote an open item and no brief
"Ruled: ..."                  you type the ruling as plain text; the session books it in the ledger, and the next /spec commits it
/spec <entry> <step>          again; it now writes the brief
/spec refuses                 the step's line lacks your authority ((approved), or (ruling <name>) of a ruling of yours), a file it reads is unusable, or the configured effort cannot apply (the runner lists no ordo-<level> effort agent the configuration names, or CLAUDE_CODE_EFFORT_LEVEL is set): it names the cause and leaves nothing; rule on the step, or install the effort agents as the plan skills are or unset the variable and start a new session, then /spec again. A file its brief shares with a step in flight is no refusal: the step runs beside that step when the orchestrator judges the merge at landing simple, named under shared_paths: in its dispatch entry, and waits otherwise
/refute stops                 the reviewer was served a model other than the configured one: it stops the reviewer, uses nothing it wrote, and shows the configured value, the served model and the Claude Code version; rule on it, then /refute again
/refute refuses               it names the cause and leaves nothing, such as the configured effort that cannot apply (the runner lists no ordo-<level> effort agent the configuration names, or CLAUDE_CODE_EFFORT_LEVEL is set): install the effort agents as the plan skills are, or unset the variable, then /refute again in a new session
/land refuses                 it names what is missing, such as a finding neither closed nor raised as an open item, or the step's dispatch block: supply it, then /land again
/land meets a red line        a red line no fix inside the brief closes: the step goes back out of main. Its failure is recorded in its Step 0 in plan.md. /spec that step again when it comes up, with no new ruling. When only you can decide what to do, /spec it after your ruling. /spec saves its work as a patch and prepares it again from main's head

/plan-orchestration <entry>   instead of the lines above: runs them for every step unattended, with the executor the plan names (an agent by default) at "build it" and "close them"

/plan-retro                   after plans have run: the findings the reviews keep making, and the rule sentence, text change or page that stops each, a check only for a fact
```

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| No stop | The skill never stops for a decision; the rows below are refusals, which name their cause and leave nothing | Nothing | Nothing |
| A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/ordo-help` again |
| No ledger folder | No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan <entry>`, or `/ordo-help` with an entry that has a plan |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Printing the sequence in other words | A reader matching what they typed against the sequence finds lines that are not there | Steps 1 |

## Rules

- The skill writes nothing.

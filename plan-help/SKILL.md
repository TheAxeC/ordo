---
name: plan-help
description: "Print the command sequence for running a plan step by step (open, spec, build, refute, close, land, and the loop inside a step), and for the plan named, where it stands: the position, the open items, the step in flight, which of its artifacts exist, and the command that comes next. Triggers on: plan-help, plan help, what do I type next, where is the plan, how does the plan loop work."
metadata:
  version: "1.4.0"
---

# Plan help

`/plan-help` prints the sequence. `/plan-help <entry>` prints the sequence and then the named plan's position. It reads `.agents/plan.yaml` (its required keys and defaults as `/plan` states them: a required key missing is a refusal that names it), the ledger folder and its state file, and writes nothing.

`<entry>` resolves to the ledger folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title); `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has. No such folder is a refusal that names `/plan`.

## The sequence, printed verbatim

```
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
```

## The position, for `<entry>`

From the state file: the position line, the open items verbatim, the dispatch block (a step in flight, its worktree, its base, its round). From the ledger folder: for the step in flight, which of the brief, the report and the refuter report exist, and whether the last refuter report has open findings. From that, one line: the command that comes next, in the sequence above. An open item that waits on a ruling is printed with it, and the next line is `Ruled: ...`.

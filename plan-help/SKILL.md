---
name: plan-help
description: "Print the command sequence for running a plan step by step (open, spec, build, refute, close, land, and the loop inside a step), and for the plan named, where it stands: the position, the open items, the step in flight, which of its artifacts exist, and the command that comes next. Triggers on: plan-help, plan help, what do I type next, where is the plan, how does the plan loop work."
metadata:
  version: "1.0.0"
---

# Plan help

`/plan-help` prints the sequence. `/plan-help <entry>` prints the sequence and then the named plan's position. It reads `.agents/plan.yaml`, the ledger folder and its state file, and writes nothing.

`<entry>` resolves to the ledger folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title); `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has. No such folder is a refusal that names `/plan`.

## The sequence, printed verbatim

```
/plan <entry>                 once: opens the plan, shows the step list for approval

then, for every step:

/spec <entry> <step>          writes the brief, makes the worktree, stages the base binaries
"build it"                    the session writes the code in the worktree, runs the checks, writes the report
/refute <entry> <step>        a fresh reviewer reads the diff and reruns the checks, writes findings
"close them"                  the session fixes the findings, reruns, rewrites the report
/refute <entry> <step>        again, on the fixed code; repeat "close them" and /refute until it finds nothing
/land <entry> <step>          onto main, checks on main, the A/B, the booking, the commit

/plan-orchestration <entry>   instead of the lines above: runs them for every step unattended, an agent at "build it" and "close them"
```

## The position, for `<entry>`

From the state file: the position line, the open items verbatim, the dispatch block (a step in flight, its worktree, its base, its round). From the ledger folder: for the step in flight, which of the brief, the report and the refuter report exist, and whether the last refuter report has open findings. From that, one line: the command that comes next, in the sequence above.

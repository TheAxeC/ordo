# Rule inventory: plan-help

- Old: `skills/plan-help/SKILL.md` at `0fa6d65`
- New: `skills/plan-help/SKILL.md`

| Old lines | Rule | New place |
|---|---|---|
| 2 | The skill's name, invoked as /plan-help | Quick start |
| 3 | Print the command sequence for running a plan step by step | Steps 1 |
| 3 | For the plan named, where it stands and the command that comes next | Steps 2 |
| 3 | The trigger phrases | Quick start |
| 4 | The metadata key | Quick start |
| 5 | The version, 1.5.0, now 1.6.0 in metadata.version | Quick start |
| 10 | /plan-help prints the sequence | Quick start |
| 10 | /plan-help <entry> prints the sequence and then the plan's position | Quick start |
| 10 | It reads .agents/plan.yaml, its keys and defaults as /plan states them | What it reads 1 |
| 10 | A required key missing is a refusal that names it | Stops 2 |
| 10 | It reads the ledger folder and its state file | What it reads 3 |
| 10 | It writes nothing | Rules 1 |
| 12 | <entry> resolves to the folder whose plan.md opens with # Plan: <entry> | What it reads 2 |
| 12 | /plan names a new folder by the slug; an older plan keeps its folder | What it reads 2 |
| 12 | No such folder is a refusal that names /plan | Stops 3 |
| 14 | The sequence is printed verbatim | Anti-patterns 1 |
| 17 | The repo-setup line of the sequence | The sequence, printed verbatim |
| 18 | The ordo-init line | The sequence, printed verbatim |
| 19 | The roadmap add line | The sequence, printed verbatim |
| 20 | The plan line | The sequence, printed verbatim |
| 22 | Then, for every step | The sequence, printed verbatim |
| 24 | The spec line | The sequence, printed verbatim |
| 25 | The build it line | The sequence, printed verbatim |
| 26 | The refute line | The sequence, printed verbatim |
| 27 | The close them line | The sequence, printed verbatim |
| 28 | The refute again line | The sequence, printed verbatim |
| 29 | The repeat line, with the rounds, the end and the last run's findings | The sequence, printed verbatim |
| 30 | The read the delta line | The sequence, printed verbatim |
| 31 | The land line | The sequence, printed verbatim |
| 33 | When a command stops | The sequence, printed verbatim |
| 35 | The spec stops line | The sequence, printed verbatim |
| 36 | The Ruled line | The sequence, printed verbatim |
| 37 | The spec again line | The sequence, printed verbatim |
| 38 | The land refuses or stops line | The sequence, printed verbatim |
| 40 | The plan-orchestration line | The sequence, printed verbatim |
| 42 | The plan-retro line | The sequence, printed verbatim |
| 45 | The position is printed for /plan-help <entry> only | Steps 2 |
| 45 | The next command is printed for /plan-help <entry> only | Steps 3 |
| 47 | From the state file: the position line, the open items verbatim, the dispatch block | Steps 2 |
| 47 | From the ledger folder, for the step in flight, which of the brief, the report and the refuter report exist, and open findings | Steps 2 |
| 47 | One line: the command that comes next, in the sequence | Steps 3 |
| 47 | An open item waiting on a ruling is printed with it, and the next line is Ruled | Steps 3 |

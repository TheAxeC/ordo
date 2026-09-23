# Rule inventory: plan

- Old: `skills/plan/SKILL.md` at `ea8d02d`
- New: `skills/plan/SKILL.md`

| Old lines | Rule | New place |
|---|---|---|
| 2 | The skill's name, invoked as /plan | Quick start |
| 3 | Open a plan for one roadmap entry: the ledger folder from the plan configuration | Steps 1 |
| 3 | plan.md with the entry's goal, gate and a drafted step list for approval | Steps 2 |
| 3 | orchestrator-state.md with the configuration block filled from the repository | Steps 4 |
| 3 | The trigger phrases | Quick start |
| 4 | The metadata key | Quick start |
| 5 | The version, 1.6.0, now 1.7.0 in metadata.version | Quick start |
| 10 | /plan turns one roadmap entry into a ledger folder that the step skills and the orchestrator run from | Quick start |
| 10 | It does the mechanical half and stops at the design half, the step list | Stops 1 |
| 10 | Nothing is written into the step list until the user approves it | Anti-patterns 1 |
| 14 | .agents/plan.yaml at the root is the only place a project specific lives | What it reads 1 |
| 14 | Its keys, the required ones and the defaults are in templates/plan.yaml and templates/plan.projects.yaml, with <entry> then <project>/<entry> | What it reads 1 |
| 14 | No file, no run: the skill stops, says the file is missing and names /ordo-init | Stops 2 |
| 14 | A required key missing is a refusal that names the key | Stops 3 |
| 14 | An optional key missing takes the example file's default | What it reads 1 |
| 15 | The roadmap the configuration names | What it reads 2 |
| 15 | <entry> matched by number or title | What it reads 2 |
| 15 | No match stops and prints the open entries | Stops 4 |
| 16 | The verification page, for the commands every step runs | What it reads 3 |
| 20 | The ledger folder <ledger_root>/<slug>/, the slug derived from the entry | Steps 1 |
| 20 | plan.md opens with # Plan: <entry>, which is how every other skill finds it | Steps 2 |
| 20 | The slug example: 38.3 One object per file gives 38-3-one-object-per-file | Steps 1 |
| 20 | A project prefix is dropped from the slug | Steps 1 |
| 20 | A folder that already exists is a refusal: a plan is opened once | Stops 5 |
| 22 | plan.md from templates/plan.md: the goal and the gate copied in | Steps 2 |
| 22 | The step list drafted from the gate, one step per verifiable piece, each with its check | Steps 2 |
| 22 | The draft is shown and written only after approval or correction | Steps 3 |
| 23 | orchestrator-state.md from templates/orchestrator-state.md: every key written, defaults included, the keys listed | Steps 4 |
| 23 | executor: is not a project specific and is not in plan.yaml | Steps 4 |
| 23 | executor: is written as agent unless the user says otherwise | Steps 4 |
| 23 | The orchestrator chooses the executor per step | Steps 4 |
| 23 | The dispatch block empty, the open items empty, the position naming the first step | Steps 4 |
| 24 | agents/briefs/ and agents/reviews/, empty | Steps 5 |
| 26 | Both files committed by path as the opening commit, the entry's number in the subject | Steps 6 |
| 30 | A step is one deliverable and one agent dispatch, with the command that proves it | Rules 1 |
| 30 | A step that cannot name its proof is booked under Blocked, and by what | Anti-patterns 2 |
| 31 | Every path in the ledger is relative to the repository root | Rules 2 |
| 31 | Every command names the directory it runs from | Rules 3 |
| 32 | No history: decisions with dates in the rulings list; the templates and this file carry none | Rules 4 |
| 33 | The last step is the closing: the entry ticked with the gate's output, the folder moved to the archive | Steps 2 |
| 33 | /plan writes the closing step itself at the end of the list | Steps 2 |

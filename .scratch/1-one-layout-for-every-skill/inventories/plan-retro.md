# Rule inventory: plan-retro

- Old: `skills/plan-retro/SKILL.md` at `9eda91c`
- New: `skills/plan-retro/SKILL.md`

| Old lines | Rule | New place |
|---|---|---|
| 2 | The skill's name, invoked as /plan-retro | Quick start |
| 3 | Read every refuter report, open and archived | What it reads 2 |
| 3 | Group the findings by kind | Steps 2 |
| 3 | Count the kinds that come back | Steps 3 |
| 3 | Propose for each the change that stops it at its source | Steps 7 |
| 3 | Writes a retro report | Steps 8 |
| 3 | Changes nothing else until the user approves | Anti-patterns 3 |
| 3 | The trigger phrases | Quick start |
| 4 | The metadata key | Quick start |
| 5 | The version, 1.0.0, now 1.1.0 in metadata.version | Quick start |
| 10 | /plan-retro, or /plan-retro <project> in the projects: form | Quick start |
| 10 | It turns every refute run's findings into proposed changes to the rules | Steps |
| 10 | A recurring finding is a rule not given, given where the brief did not point, or a check nobody runs | The proposal for a recurring kind |
| 10 | It finds the kinds | Steps 2 |
| 10 | It counts them | Steps 3 |
| 10 | It proposes the change for each | Steps 7 |
| 10 | It edits a rules page, a standards list or a check only after the user approves that proposal | Anti-patterns 3 |
| 14 | .agents/plan.yaml, its keys as /plan states them: ledger_root, archive_root, rules, standards, verification | What it reads 1 |
| 14 | A required key missing is a refusal that names it | Stops 2 |
| 15 | Every refuter report under the ledger and archive roots, collected by the collector | What it reads 2 |
| 18 | The collector command | Steps 1 |
| 21 | It prints one JSON line per finding with its fields | Steps 1 |
| 21 | The newest file under retros/ is the previous retro | What it reads 3 |
| 21 | Its Reports read list is passed to --exclude-listed unless the user asks for everything | Steps 1 |
| 22 | The rules page, every standards page and the verification page, whole | What it reads 4 |
| 23 | For an unclear finding, its report and its step's brief | What it reads 5 |
| 27 | Each finding is assigned one kind | Steps 2 |
| 27 | A kind is stated as a rule would forbid it, with the examples | Grouping 1 |
| 27 | Findings reporting the same defect in different words share a kind | Grouping 2 |
| 27 | A kind never merges two defects to raise a count | Anti-patterns 1 |
| 27 | Unclassified findings are assigned like the rest, or set aside when not checked | Grouping 3 |
| 29 | For each kind the counts of findings, steps and plans | Steps 3 |
| 29 | The heading they fell under | Steps 4 |
| 29 | Two or three findings quoted with their path and location | Steps 5 |
| 31 | A kind is recurring at three steps or two plans | Steps 6 |
| 31 | Recurring kinds get a proposal | Steps 7 |
| 31 | The rest are listed with their counts and no proposal | Steps 8 |
| 35 | Check where the rule should have come from, in order, and propose the first that applies | The proposal for a recurring kind |
| 37 | The rule not written anywhere: grep, then propose its text in the page's voice with the findings cited | The proposal for a recurring kind 1 |
| 38 | The rule on a page the briefs do not point at: add the page to standards | The proposal for a recurring kind 2 |
| 39 | The rule written where the briefs point and checkable by a command: propose the check, its output, and the verification line | The proposal for a recurring kind 3 |
| 39 | Not checkable by a command: a sharper sentence, quoting the findings | The proposal for a recurring kind 4 |
| 41 | A proposal never loosens a rule and never adds an exemption | Anti-patterns 2 |
| 45 | The retro file from the template, with the reports read, the counts, the recurring kinds and the others | Steps 8 |
| 45 | The retro is shown to the user | Steps 9 |
| 45 | Each proposal approved, corrected or declined one by one | Steps 10 |
| 45 | The decision is written beside it in the retro | Steps 11 |
| 47 | After the decisions, the approved edits are made | Steps 12 |
| 47 | Each check proposal's command is run | Steps 13 |
| 47 | Its output is shown | Steps 14 |
| 47 | The retro and the edited files committed by explicit path, one commit naming the retro | Steps 15 |
| 51 | The skill reads the ledgers and never edits a report, a brief or a plan | Rules 1 |
| 52 | Counts come from the collector's output and the grouping in the retro | Rules 2 |
| 52 | A number no line of the collector's output backs is not written | Anti-patterns 4 |
| 53 | A proposed rule states what to do and at most one clause of why | Rules 3 |
| 53 | It carries no date, no incident and no step number | Rules 4 |

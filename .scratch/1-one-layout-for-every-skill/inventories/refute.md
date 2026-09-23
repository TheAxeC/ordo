# Rule inventory: refute

- Old: `skills/refute/SKILL.md` at `e4950d0`
- New: `skills/refute/SKILL.md`

| Old lines | Rule | New place |
|---|---|---|
| 2 | The skill's name, invoked as /refute | Quick start |
| 3 | A fresh reviewer reads the diff against the brief and the standards, reruns every verification command and every quoted command | Quick start |
| 3 | An unreproduced claim is a finding | Rules 3 |
| 3 | The report's four headings | The four headings |
| 3 | Run once per step before its first repair round | Steps 1 |
| 3 | Again over each round when refute_after_repair says yes, up to repair_rounds | Steps / Over a repair round 1 |
| 3 | The trigger phrases | Quick start |
| 4 | The metadata key | Quick start |
| 5 | The version, 1.3.0, now 1.4.0 in metadata.version | Quick start |
| 10 | One reviewer, on the model reviewer: names | Steps 1 |
| 10 | The reviewer changes nothing | Anti-patterns 2 |
| 10 | The reviewer reruns the commands and reproduces the claims, what a report cannot do for itself | Steps 4 |
| 10 | The report is a list of findings, each with a file and a line, or none under a heading | Steps 6 |
| 10 | No praise and no summary of what the step did | Anti-patterns 1 |
| 14 | .agents/plan.yaml, its keys and defaults as /plan states them | What it reads 1 |
| 14 | A required key missing is a refusal that names it | Stops 2 |
| 14 | The ledger folder | What it reads 2 |
| 14 | orchestrator-state.md, whose dispatch block names the worktree, the base and the report path | What it reads 3 |
| 14 | <entry> resolves to the folder whose plan.md opens with # Plan: <entry> | What it reads 2 |
| 14 | /plan names a new folder by the slug; an older plan keeps its folder | What it reads 2 |
| 14 | No such folder is a refusal that names /plan | Stops 3 |
| 15 | The brief, the rules file and its standards, the plan's text for the step | What it reads 4 |
| 16 | The diff since the base from inside the worktree, the new files whole, a named sample of a sweep | What it reads 5 |
| 16 | git diff <base> and git status --short, read-only, are the only git it runs | What it reads 5 |
| 17 | The builder's report, last | What it reads 6 |
| 19 | No report on disk is a refusal naming the report path | Stops 4 |
| 23 | Spec: an item marked DONE whose diff does not do what the fix text says | The four headings 1 |
| 23 | Spec: a change no item asks for, naming the item expected or "no item" | The four headings 1 |
| 23 | Spec: a substitute mechanism where the brief named a shape | The four headings 1 |
| 23 | Spec: a decision reserved for the user, taken | The four headings 1 |
| 23 | Spec: a premise the reviewer's grep does not reproduce | The four headings 1 |
| 24 | Proof: a seen-failing-first claim with no quoted failing check | The four headings 2 |
| 24 | Proof: a test asserting a known defect | The four headings 2 |
| 24 | Proof: a threshold, tolerance or predicate widened | The four headings 2 |
| 24 | Proof: a check made to pass by copying or exempting | The four headings 2 |
| 24 | Proof: a static, thread_local or file-scope mutable added | The four headings 2 |
| 24 | Proof: a guard, early return or fallback where a fix was asked for | The four headings 2 |
| 24 | Proof: a count, path or measurement the reviewer's run does not reproduce | The four headings 2 |
| 24 | Proof: a test green with the change reverted, named with the revert | The four headings 2 |
| 25 | Standards: a documented standard broken, citing its file and rule | The four headings 3 |
| 25 | Standards: a comment carrying history | The four headings 3 |
| 25 | Standards: non-ASCII | The four headings 3 |
| 25 | Standards: a public surface changed without its page | The four headings 3 |
| 25 | Standards: a sentence the diff makes false, found by grepping each changed name | The four headings 3 |
| 25 | Standards: a file over the size limit | The four headings 3 |
| 25 | Standards: a check passed only because it does not read that path yet | The four headings 3 |
| 26 | Behaviour: a visible change not stated, or stated without the before and after | The four headings 4 |
| 30 | Every command in the verification list, from its directory, through the rules file's filter | Steps 3 |
| 30 | Every command the report quotes, in the same form, its output compared with the claim | Steps 4 |
| 30 | A claim needing a second build: say so, reproduce what the one build allows | Steps 4 |
| 30 | No background shells, no polling | Anti-patterns 3 |
| 30 | No benchmark suites, no sanitizer runs unless the brief lists them | Anti-patterns 4 |
| 30 | No edit to any file, anywhere | Anti-patterns 2 |
| 34 | With refute_after_repair: yes, /refute runs again after each round, at most repair_rounds, a fresh reviewer each time | Steps / Over a repair round 1 |
| 34 | A run that finds nothing ends the rounds | Steps / Over a repair round 1 |
| 34 | It reads the same files plus the first refuter report and the round entries | Steps / Over a repair round 2 |
| 34 | Its diff is the round's delta, read against the whole diff since the base | Steps / Over a repair round 3 |
| 34 | It looks for the same four things over the delta, and for every claimed closure | Steps / Over a repair round 4 |
| 34 | A finding closed by removing a check instead of fixing what it guarded | Steps / Over a repair round 4 |
| 34 | A fix that reaches beyond the finding | Steps / Over a repair round 4 |
| 34 | A claim of closure the reviewer's rerun does not reproduce | Steps / Over a repair round 4 |
| 34 | It reruns every verification command again | Steps / Over a repair round 5 |
| 34 | The last round's findings are never sent to the builder: fixed at landing when small and inside the brief, or booked (corrected to the booked list by the user's ruling) | Steps / Over a repair round 7 |
| 34 | With refute_after_repair: no these runs do not happen; the orchestrator's read stands in | Steps / Over a repair round 8 |
| 38 | The report from templates/report.md: verification lines first, verbatim | Steps 6 |
| 38 | Then the four headings, each with findings (file, line, hunk, what is wrong) or none | Steps 6 |
| 38 | Then what was not checked within the time box, named | Steps 6 |
| 38 | Then the reviewer's usage | Steps 6 |
| 38 | Each run over a round's findings are appended under Repair round <n>, refuted | Steps / Over a repair round 6 |
| 38 | The orchestrator or the session saves it | Steps 7 |
| 38 | The reviewer never writes into the ledger itself | Rules 2 |
| 38 | Its usage in the state file's table and the reviewer line in the dispatch block, both committed by path | Steps 7 |
| 42 | The reviewer is fresh every time, never the builder, never the brief's writer when another is available | Rules 1 |
| 43 | A finding is closed in a repair round, at landing, or booked as its own step in the booked list | Finding dispositions 1 |
| 43 | The open items hold only what the user must rule on | Finding dispositions 2 |
| 43 | After the last round the findings are appended, each disposition under Closed | Finding dispositions 3 |
| 43 | /land refuses while a finding is neither closed nor booked | Finding dispositions 4 |
| 44 | A time box is respected by reporting what was checked and naming what was not | Rules 4 |
| 44 | An unchecked point is not a finding and not a pass | Anti-patterns 5 |

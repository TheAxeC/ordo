---
name: plan-retro
description: "Read every refuter report of a repository's plans, open and archived, group the findings by the kind of defect, count the kinds that come back across steps and plans, and for each one propose the change that stops it at its source: a rule on the rules page, a page added to the standards the briefs point at, or a mechanical check. Writes a retro report and changes nothing else until the user approves. Triggers on: plan-retro, retro, run a retro, what do the reviews keep finding, mine the refuter reports."
metadata:
  version: "1.1.0"
---

# Retro over the refuter reports

`/plan-retro` turns the findings of every `/refute` run into proposed changes to the repository's rules. A finding the refuter keeps making is a rule the builder was not given, or was given where the brief did not point, or a check nobody runs. It leaves behind a retro report in the ledger and, for each proposal the user approves, the edit it proposes, committed together.

## Quick start

```
/plan-retro             the retro over every refuter report since the previous retro
/plan-retro <project>   the same, for one project of a plan.yaml in the projects: form
```

## Use instead

| When | Use |
|---|---|
| One step's findings, before it lands | `/refute <entry> <step>`, then `/land` |
| The recurring findings of the plan that is running | `plan-orchestration`'s recurring-findings pass |

## What it reads

1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them: `ledger_root`, `archive_root`, `rules`, `standards`, `verification`.
   - A required key missing is a refusal ("Stops").
2. Every refuter report under `<ledger_root>/` and `<archive_root>/`, through the collector (Steps 1).
3. The newest file under `<ledger_root>/retros/`, the previous retro, for its "Reports read" list.
4. The rules page, every page in `standards`, and the verification page, whole.
5. For a finding whose kind is unclear from its text, the report it came from and the brief of its step.

## Steps

1. Collect the findings:

   ```sh
   python3 <this skill's folder>/templates/collect_findings.py [--exclude-listed <previous retro>] <ledger_root> <archive_root>
   ```

   - It prints one JSON line per finding: plan, step, report, run, heading, location, text.
   - The previous retro is passed to `--exclude-listed` unless the user asks for a retro over everything.
2. Assign each finding one kind, as "Grouping" says.
3. For each kind, count the findings, the distinct steps and the distinct plans.
4. For each kind, name the heading its findings fell under.
5. For each kind, quote two or three findings with their report path and location.
6. Mark the recurring kinds: a kind is recurring when it appears in at least three steps, or in at least two plans.
7. For each recurring kind, draft the proposal, as "The proposal for a recurring kind" says.
8. Write `<ledger_root>/retros/<YYYY-MM-DD>.md` from `templates/retro.md`.
   - The reports read, every path, so the next retro can start after them.
   - The counts by heading.
   - The recurring kinds, each with its counts, its quoted findings and its proposal.
   - Then the other kinds, with their counts and no proposal.
9. Show the retro to the user.
10. Take the user's decision on each proposal, one by one: approved, corrected or declined ("Stops").
11. Write each decision beside its proposal in the retro.
12. Make the approved edits: the rules page, a standards page, `.agents/plan.yaml`, the verification page, a new check script.
13. Run each check proposal's command.
14. Show each command's output.
15. Commit the retro and the edited files by explicit path list, in one commit whose subject names the retro.

## Grouping

- A kind is a sentence that states the defect in general terms, the way a rule would forbid it: "a test that stays green with the change reverted", "a comment that names the step that wrote it", "a document sentence the diff makes false".
- Findings whose text reports the same defect in different words share a kind.
- `unclassified` findings from repair rounds are read and assigned like the rest, or set aside when they are a point the reviewer did not check.

## The proposal for a recurring kind

The skill checks where the rule should have come from, in this order, and proposes the first change that applies:

1. **The rule is not written anywhere.** Grep the rules page and the standards pages for it. When it is absent, the proposal is the rule's text, in the voice and numbering of the page it goes into (the rules page for how a change is made and reported, a standards page for what the code or prose looks like), with the findings it would have prevented cited.
2. **The rule is written on a page the briefs do not point at.** When the rule is on a page that is neither the rules page nor listed in `standards`, the proposal adds the page to `standards` in `.agents/plan.yaml`.
3. **The rule is written where the briefs point, and the defect still recurs, and a command can check it.** A grep over the diff, a lint rule or a script over the tree: the proposal is that check, with its command, the output it gives on the current tree, and the line to add to the verification page so every step runs it.
4. **The same, and no command can check it.** The proposal is a sharper sentence for the existing rule, quoting the findings that show how builders read the current one.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The proposals | Every retro with a recurring kind, at Steps 10 | The retro, each proposal in it | The user's decision on each: approved, corrected or declined |
| A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/plan-retro` again |

- The first row is a stop: it waits on the user.
- The second is a refusal: it names its cause and changes nothing.

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A kind that merges two defects | The count rises and the proposal fits neither defect | One kind per defect |
| A proposal that loosens a rule or adds an exemption | It turns the recurring defect into allowed behaviour | Propose the rule, the page or the check, as "The proposal for a recurring kind" says |
| An edit made before the user's decision on its proposal | The rules change without the user | Steps 10 to 12 |
| A number in the retro that no line of the collector's output backs | The count is a guess presented as a measurement | Rules 2 |

## Rules

- The skill reads the ledgers and never edits a report, a brief or a plan.
- Counts come from the collector's output and the grouping written in the retro.
- A proposed rule states what to do and at most one clause of why.
- A proposed rule carries no date, no incident and no step number; the retro file is where those live.

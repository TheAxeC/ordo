---
name: refute
description: "Review a built step without changing anything: a fresh reviewer reads the diff against the brief and the repository's standards, reruns every verification command and every command the builder's report quotes, treats an unreproduced claim as a finding, and writes a report under four headings (spec, proof, standards, behaviour). Run once per step before its first repair round, and again over each round when the configuration block says refute_after_repair: yes, up to repair_rounds. Triggers on: refute <entry> <step>, review the step, refute the diff, run the refuter."
metadata:
  version: "1.4.0"
---

# Refute a step

`/refute <entry> <step>` has one reviewer, who changes nothing, do what a builder's report cannot do for itself: rerun the commands and reproduce the claims. It leaves behind `agents/reviews/<step>-refuter.md`, a list of findings each with a file and a line, or "none" under a heading, saved and committed by the orchestrator or the session.

## Quick start

```
/refute <entry> <step>   a fresh reviewer reads the step's diff, reruns every check and every quoted command, and writes findings
```

## Use instead

| When | Use |
|---|---|
| The step has no brief or worktree yet | `/spec <entry> <step>` |
| The findings are closed or booked and the step is ready for main | `/land <entry> <step>` |
| Every step of the plan, unattended, the reviews included | `/plan-orchestration <entry>` |
| What the reviews keep finding across plans | `/plan-retro` |

## What it reads

1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them; a required key missing is a refusal ("Stops").
2. The ledger folder: `<entry>` resolves to the folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title).
   - `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has.
   - No such folder is a refusal ("Stops").
3. `orchestrator-state.md`: the dispatch block names the worktree, the base and the report path.
4. The brief `agents/briefs/<step>.md`, the rules file and the standards it points at, and the plan's text for the step.
5. The diff since the base, from inside the worktree, the new files whole, and a sample of a mechanical sweep with the sample named.
   - `git diff <base>` and `git status --short`, read-only, are the only git the reviewer runs.
6. The builder's report, last.
   - No report on disk is a refusal ("Stops").

## Steps

1. Dispatch one reviewer, on the model the configuration block's `reviewer:` names, once per step before its first repair round.
2. The reviewer reads the inputs in the order "What it reads" gives them.
3. The reviewer runs every command in the brief's verification list, from the directory each names, piped through the filter the rules file names.
4. The reviewer runs every command the report quotes as evidence, in the same form, and compares the output with what the report claims.
   - Where a claim needs a second build to reproduce (an A/B, a size figure), the reviewer says so and reproduces what it can from the one build.
5. The reviewer looks for the findings "The four headings" lists.
6. The reviewer writes the report from `templates/report.md`.
   - The verification lines first, verbatim.
   - Then the four headings, each with findings (the file, the line, the quoted hunk, what is wrong) or "none".
   - Then what was not checked within the time box, named.
   - Then the reviewer's usage.
7. The orchestrator or the session saves the report at `agents/reviews/<step>-refuter.md`, records its usage in the state file's table and the reviewer line in the dispatch block, and commits both by path.
8. Each finding is then closed or booked, as "Finding dispositions" says.

### Over a repair round

1. When the configuration block holds `refute_after_repair: yes`, `/refute` runs again after each of the step's repair rounds, at most `repair_rounds` of them, on a fresh reviewer each time, as Rules 1 says.
   - A run that finds nothing ends the rounds.
2. The reviewer reads the same files, plus the first refuter report and the dispatch block's round entries.
3. Its diff is the delta of the round (from the commit or tree state recorded when the round was sent), read against the whole diff since the base.
4. It looks for the same four things over that delta, and for every closure the builder claims:
   - a finding closed by removing a check rather than fixing what the check guarded;
   - a fix that reaches beyond the finding;
   - a claim of closure the reviewer's own rerun does not reproduce.
5. It reruns every verification command again.
6. The orchestrator or the session appends the run's findings to the same file under "Repair round <n>, refuted", in the same shape, and records and commits as Steps 7 says.
7. The findings of the run over the last round are never sent to the builder: each is fixed at landing when it is small and inside the brief, or booked as "Finding dispositions" says.
8. With `refute_after_repair: no` these runs do not happen, and the orchestrator's read of the delta stands in for them.

## The four headings

- **Spec.** A finding is:
  - an item the report marks DONE whose diff does not do what the brief's fix text says;
  - a change no item asks for (name the item you would expect, or say "no item");
  - a substitute mechanism where the brief named a shape;
  - a decision the brief reserved for the user, taken;
  - a premise in the brief's "What is on the tree" section that the reviewer's own grep does not reproduce.
- **Proof.** A finding is:
  - a "seen failing first" claim with no quoted failing check;
  - a test that asserts a known defect as the expected result;
  - a threshold, tolerance or predicate widened;
  - a check made to pass by copying or exempting;
  - a `static`, `thread_local` or file-scope mutable added;
  - a null guard, an early return or a fallback standing where a fix was asked for;
  - a count, a path or a measurement in the report that the reviewer's own run does not reproduce;
  - a test that stays green with the change reverted, named with the revert that leaves it green (an assertion over source text, over a label alone, over a constant, or over an effect the test environment never runs).
- **Standards.** A finding is:
  - a documented standard the diff breaks, citing the standard's file and rule;
  - a comment that carries history (a step or item number, a date, what the code did before);
  - non-ASCII;
  - a public surface changed without its page;
  - a sentence in a document, a head comment or a rules file that the diff makes false, found by grepping each name the diff changed across the documents and the comments;
  - a file over the size limit;
  - a rule of the repository's checks that the diff satisfies only because the check does not read that path yet.
- **Behaviour.** A finding is a host- or user-visible change the report does not state, or states without the before and after.

## Finding dispositions

- A finding is closed by the builder in a repair round (at most `repair_rounds` of them), or at landing, or booked as its own step in the plan and carried in the state file's booked list.
- The open items hold only what the user must rule on.
- After the last round, the run's findings (or, with `refute_after_repair: no`, the orchestrator's read of the delta) are appended to the report, each finding's disposition under the Closed heading.
- `/land` refuses while a finding is left neither closed nor booked.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| No stop | The skill never stops for a decision; the rows below are refusals, which name their cause and leave nothing | Nothing | Nothing |
| A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/refute` again |
| No ledger folder | No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan`, then the step prepared and built |
| No report | No builder's report on disk | The report path the builder was told to write to | The report written, then `/refute` again |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Praise, or a summary of what the step did | The report is read for what is wrong, and anything else hides it | Steps 6 |
| An edit to any file, anywhere, by the reviewer | The step under review is no longer the step that was built | Report the finding; the builder or the landing fixes it |
| A background shell, or polling | It outlasts the review | Run each command in the foreground and wait for it |
| A benchmark suite or a sanitizer run the brief does not list | It measures what the brief did not ask about | Steps 3 and 4 |
| An unchecked point reported as a finding or as a pass | The report then claims what nobody checked | Steps 6 |

## Rules

- The reviewer is a fresh session or agent every time, for the first run and every run over a repair round: never the builder, and never the session that wrote the brief when another is available.
- The reviewer never writes into the ledger itself.
- An unreproduced claim is a finding.
- A time box, the configuration block's `review_minutes` when above 0 or one the invocation names, is respected by reporting what was checked and naming what was not.

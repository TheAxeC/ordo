---
name: refute
description: "Review a built step without changing anything: a fresh reviewer reads the diff against the brief and the repository's standards, reruns every verification command and every command the builder's report quotes, treats an unreproduced claim as a finding (a count, a path or a measurement only when a decision rests on it), and writes a report that gives a verdict per item of the brief and per case (holds, violated or not applicable; met, partial, unmet or not verifiable) and findings under four headings (spec, proof, standards, behaviour), each with its failure scenario. Run once per step before its first repair round. Run again over each repair round when the configuration block says refute_after_repair: yes, up to repair_rounds. One more round is allowed only for a red verification command or an unbuilt acceptance item whose fix is too large for landing. Triggers on: refute <entry> <step>, review the step, refute the diff, run the refuter."
metadata:
  version: "1.7.1"
---

# Refute a step

`/refute <entry> <step>` dispatches one reviewer, who changes nothing. The reviewer does what a builder's report cannot do for itself: rerun the commands and reproduce the claims. It leaves behind `agents/reviews/<step>-refuter.md`: a verdict per item of the brief and per case, and a list of findings each with its place (a file and a line in code, a page and its section in a page) and its failure scenario, or "none" under a heading. The orchestrator or the session saves it, and the next resume point commits it.

## Quick start

```
/refute <entry> <step>   a fresh reviewer reads the step's diff, reruns every check and every quoted command, and writes verdicts and findings
```

## Use instead

| When | Use |
|---|---|
| The step has no brief or worktree yet | `/spec <entry> <step>` |
| A finding whose cause is not known | `/diagnose <entry> <step> <finding>` |
| The findings are closed or raised as open items and the step is ready for main | `/land <entry> <step>` |
| Every step of the plan, unattended, the reviews included | `/plan-orchestration <entry>` |
| What the reviews keep finding across plans | `/plan-retro` |
| What went well and what went wrong in the Claude Code sessions of a plan | `/session-retro <entry>` |

## What it reads

1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
   - A required key missing is a refusal ("Stops").
2. The ledger folder: `<entry>` resolves to the folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title).
   - `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has.
   - No such folder is a refusal ("Stops").
3. `orchestrator-state.md`: the dispatch block names the worktree, the base and the report path.
4. The brief `agents/briefs/<step>.md`, the rules file and the standards it points at, and the plan's text for the step.
   - The cases ruling `agents/briefs/<step>-cases.md` when one exists, read with the brief.
     - Where it rules a case, the diff is judged against the ruling.
5. The diff since the base, from inside the worktree, the new files whole, and a sample of a mechanical sweep with the sample named.
   - `git diff <base>` and `git status --short`, read-only, are the only git the reviewer runs.
   - Then the ADRs the brief names under "What is on the tree", and every other `NNNN-*.md` record in the folder the configuration block's `adr` names (`docs/adr` when the block has none) whose part in force governs a file, a name, a rule or a behaviour the diff changes, in force and decision as the `spec` skill's "What it reads" 5 says.
6. The builder's report, last.
   - No report on disk is a refusal ("Stops").

## Steps

1. Dispatch one reviewer as the effort agent `ordo-<reviewer_effort>` (the configuration block's `reviewer_effort`, `high` when the block has no such key), on the model the configuration block's `reviewer:` names, once per step before its first repair round.
   - Before the dispatch, check that the runner lists that agent among its agent types.
   - Before the dispatch, check that `CLAUDE_CODE_EFFORT_LEVEL` is unset: `printenv CLAUDE_CODE_EFFORT_LEVEL` exits 1.
   - Either check failing is the refusal "The configured effort cannot apply" ("Stops"), and no reviewer is dispatched.
   - Right after the dispatch, the orchestrator or the session reads the reviewer's agent id and the model the runner served it, from the runner's record of the agent as `plan-orchestration`'s "Launching a builder" says.
   - A served model that is not the configured one is the stop "A model other than the configured one" ("Stops"): the reviewer is stopped through the runner's stop tool, and nothing it wrote is used. The configured one is the model the configuration block's `reviewer:` names for the first run, and for a run over a repair round the model "Steps / Over a repair round" 1 gives.
   - The stopped reviewer is recorded under the dispatch block's `reviewer_report`, after the records before it.
     - A first-run reviewer: `(<agent id>, <served model>, stopped)`.
     - A reviewer over round `<n>`: `over round <n>: <agent id>, <served model>, stopped`.
     - The record is written and carried as Steps 7 says.
2. The reviewer reads the inputs in the order "What it reads" gives them.
3. The reviewer runs every command in the brief's verification list, from the directory each names, piped through the filter the rules file names.
   - The step's verify list runs through the `land` skill's `templates/checks.sh <state file>` from the root of the checkout it checks (the step's worktree).
   - The lines `checks.sh` prints are what the refuter report quotes.
4. The reviewer runs every command the report quotes as evidence, in the same form, and compares the output with what the report claims.
   - Where a claim needs a second build to reproduce (an A/B, a size figure), the reviewer says so.
     - It reproduces what it can from the one build.
5. The reviewer looks for the findings "The four headings" lists and gives the verdicts "The verdicts" lists, until every item of the brief's "What to build" and every case of its "Cases" has a verdict.
6. The reviewer writes the report from `templates/report.md`.
   - The verification lines first, verbatim.
   - Then the verdicts, as "The verdicts" says: one per item of the brief's "What to build", then one per case of its "Cases".
   - Then the four headings, each with findings, or "none", and each finding with its place (a file and a line in code, a page and its section in a page), the quoted hunk, what is wrong, its failure scenario as "The four headings" says, and the verdict it names when it has one, as "The verdicts" says.
   - Then "Declined to judge": each point the reviewer did not check, or declined because it is the user's call or outside what a read and a rerun can settle, with the reason.
   - Then the reviewer's usage line: its agent id, its served model, its tokens, its tool uses and its minutes.
7. The orchestrator or the session saves the report at `agents/reviews/<step>-refuter.md`.
   - It records the report's path under the dispatch block's `reviewer_report` field, after the records before it, followed by, in parentheses, the reviewer's agent id, its served model (Steps 1), and its tokens, tool uses and time from its completion notice: `<path> (<agent id>, <served model>, <tokens> tokens, <tool uses> tool uses, <time>)`.
   - Both are written to disk in the main checkout and not committed on their own. The next resume-point commit carries them, as `plan-orchestration`'s "Resuming, and handing the plan over" says.
8. Each finding is then closed or raised to the user, as "Finding dispositions" says.

### Over a repair round

1. When the configuration block holds `refute_after_repair: yes`, `/refute` runs again after each of the step's repair rounds, at most `repair_rounds`, or one more under `plan-orchestration`'s exception, on a fresh reviewer each time, as Rules 1 says, dispatched as Steps 1 says except for its model.
   - The model is the one the configuration block's `repair_reviewer:` names, or the `reviewer:` value when the block has no `repair_reviewer:` key, at the effort `reviewer_effort` names.
   - This holds for every run over a repair round, the run over the extra round of `plan-orchestration`'s exception and a reviewer started over a round in place of one stopped for another model included.
   - A run that finds nothing ends the rounds.
2. The reviewer reads the same files, plus the first refuter report and the dispatch block's round entries.
3. Its diff is the delta of the round (from the commit or tree state recorded when the round was sent), read against the whole diff since the base.
4. It looks for the same four things over that delta, and for every closure the builder claims:
   - a finding closed by removing a check rather than fixing what the check guarded;
   - a fix that reaches beyond the finding;
   - a claim of closure the reviewer's own rerun does not reproduce.
5. It reruns every verification command again.
6. The orchestrator or the session appends the run's verdicts, findings and points declined to judge to the same file under "Repair round <n>, refuted", in the shape `templates/report.md` gives it.
   - It records the run in the same field, after the records before it, as `over round <n>: <agent id>, <served model>, <tokens> tokens, <tool uses> tool uses, <time>`, written to disk and carried by the next resume-point commit as Steps 7 says.
7. The findings of the run over the last round are never sent to the builder.
   - Each is fixed at landing when it is small and inside the brief, or raised to the user as "Finding dispositions" says.
8. With `refute_after_repair: no` these runs do not happen.
   - The orchestrator's read of the delta stands in for them.

## The four headings

- **Spec.** A finding is:
  - an item the report marks DONE whose diff does not do what the brief's fix text says;
  - a change no item asks for (name the item you would expect, or say "no item");
  - a substitute mechanism where the brief named a shape;
  - a decision the brief reserved for the user, taken;
  - a dependency the diff adds that the brief does not name;
  - a premise in the brief's "What is on the tree" section that the reviewer's own grep does not reproduce;
  - a change that contradicts the part in force of an ADR, with the ADR's number and the sentence of its decision quoted, and whether the brief asked for it;
  - an ADR the diff is under that the brief's "What is on the tree" does not name;
  - a case of a code step in the brief's "Cases" that no test of the step checks;
  - a case whose first run on the unchanged tree the report does not give.
- **Proof.** A test of behaviour whose failure costs nothing is not a Proof pass; it is a Standards finding, as the next heading says. A finding is:
  - a "seen failing first" claim with no quoted failing check;
  - a test that asserts a known defect as the expected result;
  - a threshold, tolerance or predicate widened;
  - a check made to pass by copying or exempting;
  - a `static`, `thread_local` or file-scope mutable added;
  - a null guard, an early return or a fallback standing where a fix was asked for;
  - a count, a path or a measurement in the report that the reviewer's own run does not reproduce, when a decision rests on it, and the finding names that decision;
  - a new or changed test of a behaviour the change adds or changes with no failure on the unchanged tree quoted for it in the form it has after the change;
  - a new or changed test of a behaviour the change preserves with no passing run quoted for it after the change, or on the unchanged tree where it could run there;
  - a test that would still pass with the behaviour it is written for taken out of the code, found by reading it (an assertion over source text, over a label alone, over a constant, or over an effect the test environment never runs).
- **Standards.** A finding is:
  - a documented standard the diff breaks, citing the standard's file and rule;
  - a comment that carries history (a step or item number, a date, what the code did before);
  - non-ASCII;
  - a secret left unredacted in a line the builder's report quotes, under the rules file's rule on secrets in quoted command output;
  - a public surface changed without its page;
  - a sentence in a document, a head comment or a rules file that the diff makes false, found by grepping each name the diff changed across the documents and the comments;
  - a file over the size limit;
  - a rule of the repository's checks that the diff satisfies only because the check does not read that path yet;
  - a test of behaviour whose failure costs nothing (neither lost work, nor a broken installation, nor a wrong configuration accepted), under the rules file's rule that a test exists only for behaviour whose failure costs something.
- **Behaviour.** A finding is a host- or user-visible change the report does not state, or states without the before and after.
- Each finding, under any of the four headings, carries its failure scenario: the concrete input or state and the wrong result it gives, or, for a finding in text, the reader and what the text leads them to do wrong.

## The verdicts

- **Items.** One verdict per item of the brief's "What to build", in the brief's numbering:
  - holds: the diff does what the item's text says, with the evidence named;
  - violated: the diff does not do what the item's text says, with the finding under its heading named;
  - not applicable: the item does not apply to this tree, with the reason.
- **Cases.** One verdict per case of the brief's "Cases":
  - met: the test or the reading gives the expected result;
  - partial: the test or the reading gives part of the expected result, with the missing part named;
  - unmet: the test or the reading does not give the expected result;
  - not verifiable: neither a test nor a reading can settle the case here, with what would settle it.
- A verdict of violated, partial or unmet always has a finding under one of "The four headings", and the verdict and the finding name each other.
- Over a repair round, the reviewer gives the verdicts again for the whole diff since the base.

## Finding dispositions

- A finding is closed by the builder in a repair round (at most `repair_rounds`, or one more under `plan-orchestration`'s exception), or at landing, or raised to the user as an open item in the state file, as `plan-orchestration`'s Stops section says.
  - It becomes a step only by a ruling of the user or, under `self_rule: on`, a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books.
- A contradiction of an ADR that the brief asked for is a rule clash: it is raised to the user as an open item, never closed in a repair round or at landing, since only the user rules between the step and the ADR. One the builder made against the brief is closed like any other finding, by a change that follows the ADR.
- The open items hold only what the user must rule on.
- After the last round, the run's findings (or, with `refute_after_repair: no`, the orchestrator's read of the delta) are appended to the report, each finding's disposition under the Closed heading.
- `/land` refuses while a finding is left neither closed nor raised as an open item.

## Stops

The first row is a stop, a decision for the user: it leaves an open item, booked in the state file's open items. The rows below it are refusals, which name their cause and leave nothing.

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| A model other than the configured one | The runner served the reviewer a model that is not the configured one: a different model family, or an older version than the newest the configured alias names in the runner's model list (Steps 1) | The open item, booked in the open items, with the configured model (Steps 1), the served model and the Claude Code version | The user's ruling, then `/refute` again |
| A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/refute` again |
| No ledger folder | No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan`, then the step prepared and built |
| No report | No builder's report on disk | The report path the builder was told to write to | The report written, then `/refute` again |
| The configured effort cannot apply | The runner lists no `ordo-<level>` agent for the level the configuration block's `reviewer_effort` names, or `CLAUDE_CODE_EFFORT_LEVEL` is set, which runs every agent at its level whatever the definition says (Steps 1) | The missing agent, or the variable's value | The effort agents installed as the plan skills are, or the variable unset, then `/refute` again in a new session |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Praise, or a summary of what the step did | The report is read for what is wrong, and anything else hides it | Steps 6 |
| An edit to any file, anywhere, by the reviewer | The step under review is no longer the step that was built | Report the finding; the builder or the landing fixes it |
| A background shell, or polling, the brief does not list | It outlasts the review | Run each command in the foreground and wait for it |
| A benchmark suite or a sanitizer run the brief does not list | It measures what the brief did not ask about | Steps 3 and 4 |
| An unchecked point reported as a finding or as a pass | The report then claims what nobody checked | Name it under "Declined to judge" with the reason, as Steps 6 says |

## Rules

- The reviewer is a fresh session or agent every time, for the first run and every run over a repair round: never the builder, and never the session that wrote the brief when another is available.
- The reviewer never writes into the ledger itself.
- The reviewer invokes no skill: it reads the inputs "What it reads" lists, runs the commands this skill names, and writes its report itself.
- The reviewer starts no agent: every read and every command of the review runs in the reviewer's own session.
- The reviewer writes `<REDACTED>` in place of the value of a secret in every line it quotes, a verbatim one included, as the rules file's rule on secrets in quoted command output says.
- An unreproduced claim is a finding, except a count, a path or a measurement no decision rests on, as the Proof heading says.
- A time box, the configuration block's `review_minutes` when above 0 or one the invocation names, is respected by reporting what was checked and naming what was not.

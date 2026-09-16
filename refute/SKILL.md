---
name: refute
description: "Review a built step without changing anything: a fresh reviewer reads the diff against the brief and the repository's standards, reruns every verification command and every command the builder's report quotes, treats an unreproduced claim as a finding, and writes a report under four headings (spec, proof, standards, behaviour). Run it until it finds nothing. Triggers on: refute <entry> <step>, review the step, refute the diff, run the refuter."
metadata:
  version: "1.0.0"
---

# Refute a step

`/refute <entry> <step>` dispatches one reviewer that changes nothing, on the model the configuration block's `reviewer:` names. The reviewer reads the diff and the report, and then does what a report cannot do for itself: reruns the commands and reproduces the claims. Its report is a list of findings, each with a file and a line, or "none" under a heading. There is no praise and no summary of what the step did.

## What it reads

1. `.agents/plan.yaml`, the ledger folder, `orchestrator-state.md` (the dispatch block names the worktree, the base and the report path). `<entry>` resolves to the ledger folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title); `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has. No such folder is a refusal that names `/plan`.
2. The brief `agents/briefs/<step>.md`, the rules file and the standards it points at, and the plan's text for the step.
3. The diff since the base, from inside the worktree (`git diff <base>` and `git status --short`, the only git it runs, read-only), the new files whole, a sample of a mechanical sweep with the sample named.
4. The builder's report, last.

No report on disk is a refusal that names the report path the builder was told to write to.

## What the reviewer looks for

1. **Spec.** An item the report marks DONE whose diff does not do what the brief's fix text says; a change no item asks for (name the item you would expect, or say "no item"); a substitute mechanism where the brief named a shape; a decision the brief reserved for the user, taken; a premise in the brief's "What is on the tree" section that the reviewer's own grep does not reproduce.
2. **Proof.** A "seen failing first" claim with no quoted failing check; a test that asserts a known defect as the expected result; a threshold, tolerance or predicate widened; a check made to pass by copying or exempting; a `static`, `thread_local` or file-scope mutable added; a null guard, an early return or a fallback standing where a fix was asked for; a count, a path or a measurement in the report that the reviewer's own run does not reproduce; a test that stays green with the change reverted, named with the revert that leaves it green (an assertion over source text, over a label alone, over a constant, or over an effect the test environment never runs).
3. **Standards.** A documented standard the diff breaks, citing the standard's file and rule; a comment that carries history (a step or item number, a date, what the code did before); non-ASCII; a public surface changed without its page; a sentence in a document, a head comment or a rules file that the diff makes false, found by grepping each name the diff changed across the documents and the comments; a file over the size limit; a rule of the repository's checks that the diff satisfies only because the check does not read that path yet.
4. **Behaviour.** A host- or user-visible change the report does not state, or states without the before and after.

## What the reviewer runs

Every command in the brief's verification list, from the directory each names, piped through the filter the rules file names; then every command the report quotes as evidence, in the same form, and the output compared with what the report claims. Where a claim needs a second build to reproduce (an A/B, a size figure), the reviewer says so and reproduces what it can from the one build. No background shells, no polling, no benchmark suites, no sanitizer runs unless the brief lists them; no edit to any file, anywhere.

## What it writes

`agents/reviews/<step>-refuter.md` from `templates/report.md`: the verification lines first, verbatim; then the four headings, each with findings (file, line, the quoted hunk, what is wrong) or "none"; then what was not checked within the time box, named; then the reviewer's usage. The orchestrator or the session saves it there (the reviewer never writes into the ledger itself), records its usage in the state file's table and the reviewer line in the dispatch block, and commits both by path.

## Rules

- The reviewer is a fresh session or agent every time, never the builder, and never the session that wrote the brief when another is available.
- A finding is closed by the builder, not by the reviewer: `/refute` is run again after the fix, and `/land` refuses while the last refuter report has an open finding that is neither closed nor booked as a stop.
- A time box, when the invocation names one, is respected by reporting what was checked and naming what was not; an unchecked point is not a finding and not a pass.

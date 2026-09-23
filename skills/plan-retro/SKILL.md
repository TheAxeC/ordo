---
name: plan-retro
description: "Read every refuter report of a repository's plans, open and archived, group the findings by the kind of defect, count the kinds that come back across steps and plans, and for each one propose the change that stops it at its source: a rule on the rules page, a page added to the standards the briefs point at, or a mechanical check. Writes a retro report and changes nothing else until the user approves. Triggers on: plan-retro, retro, run a retro, what do the reviews keep finding, mine the refuter reports."
metadata:
  version: "1.0.0"
---

# Retro over the refuter reports

`/plan-retro` (or `/plan-retro <project>` in the `projects:` form) turns the findings of every `/refute` run into proposed changes to the repository's rules. A finding the refuter keeps making is a rule the builder was not given, or was given where the brief did not point, or a check nobody runs. The skill finds those kinds, counts them, and proposes the change for each; it edits a rules page, a standards list or a check only after the user approves that proposal.

## What it reads

1. `.agents/plan.yaml` (its required keys and defaults as `/plan` states them: a required key missing is a refusal that names it): `ledger_root`, `archive_root`, `rules`, `standards`, `verification`.
2. Every refuter report under `<ledger_root>/` and `<archive_root>/`, collected by

   ```
   python3 <this skill's folder>/templates/collect_findings.py [--exclude-listed <previous retro>] <ledger_root> <archive_root>
   ```

   which prints one JSON line per finding (plan, step, report, run, heading, location, text). The newest file under `<ledger_root>/retros/` is the previous retro; its "Reports read" list is passed to `--exclude-listed` unless the user asks for a retro over everything.
3. The rules page, every page in `standards`, and the verification page, whole.
4. For a finding whose kind is unclear from its text, the report it came from and the brief of its step.

## Grouping

Each finding is assigned one kind: a sentence that states the defect in general terms, the way a rule would forbid it ("a test that stays green with the change reverted", "a comment that names the step that wrote it", "a document sentence the diff makes false"). Findings whose text reports the same defect in different words share a kind; a kind never merges two defects to raise a count. `unclassified` findings from repair rounds are read and assigned like the rest, or set aside when they are a point the reviewer did not check.

For each kind: the number of findings, the number of distinct steps, the number of distinct plans, the heading they fell under, and two or three findings quoted with their report path and location.

A kind is **recurring** when it appears in at least three steps, or in at least two plans. Recurring kinds get a proposal; the rest are listed with their counts and no proposal.

## The proposal for a recurring kind

The skill checks where the rule should have come from, in this order, and proposes the first change that applies:

1. **The rule is not written anywhere.** Grep the rules page and the standards pages for it. When it is absent, the proposal is the rule's text, in the voice and numbering of the page it goes into (the rules page for how a change is made and reported, a standards page for what the code or prose looks like), with the findings it would have prevented cited.
2. **The rule is written on a page the briefs do not point at.** When the rule is on a page that is neither the rules page nor listed in `standards`, the proposal adds the page to `standards` in `.agents/plan.yaml`.
3. **The rule is written where the briefs point, and the defect still recurs.** When the rule can be checked by a command (a grep over the diff, a lint rule, a script over the tree), the proposal is that check, with its command, the output it gives on the current tree, and the line to add to the verification page so every step runs it. When no command can check it, the proposal is a sharper sentence for the existing rule, quoting the findings that show how builders read the current one.

A proposal never loosens a rule and never adds an exemption.

## What it writes

`<ledger_root>/retros/<YYYY-MM-DD>.md` from `templates/retro.md`: the reports read (every path, so the next retro can start after them), the counts by heading, the recurring kinds each with its counts, quoted findings and proposal, then the other kinds with their counts. The retro is shown to the user; each proposal is approved, corrected or declined one by one, and the decision is written beside it in the retro.

After the user's decisions, the approved edits are made (the rules page, a standards page, `.agents/plan.yaml`, the verification page, a new check script), each check proposal's command is run and its output shown, and the retro and the edited files are committed by explicit path list, in one commit whose subject names the retro.

## Rules

- The skill reads the ledgers and never edits a report, a brief or a plan.
- Counts come from the collector's output and the grouping written in the retro; a number in the retro that no line of the collector's output backs is not written.
- A proposed rule states what to do and at most one clause of why. It carries no date, no incident and no step number; the retro file is where those live.

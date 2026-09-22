---
name: plan
description: "Open a plan for one roadmap entry: create its ledger folder from the repository's plan configuration, write plan.md with the entry's goal, gate and a drafted step list for approval, and orchestrator-state.md with the configuration block filled from the repository. Triggers on: open a plan, start a plan, plan <roadmap entry>, new plan for <entry>."
metadata:
  version: "1.6.0"
---

# Open a plan

`/plan <entry>` turns one roadmap entry into a ledger folder that `/spec`, `/refute`, `/land` and `plan-orchestration` then run from. It does the mechanical half of opening a plan and stops at the design half: the step list is drafted and shown, and nothing is written into it until the user approves it.

## What it reads

1. `.agents/plan.yaml` at the repository root: the only place a project specific lives. Its keys, which of them are required and the default of each optional one are in `templates/plan.yaml` (one project) and `templates/plan.projects.yaml` (several, listed under `projects:`, with `<entry>` then `<project>/<entry>`). No file, no run: the skill stops, says the file is missing and names `/ordo-init`, which writes it. A required key missing is a refusal that names the key; an optional key missing takes the default the example file gives it.
2. The roadmap the configuration names. `<entry>` is matched against the entries by number or title; no match, and the skill stops and prints the open entries.
3. The verification page the configuration names, for the commands every step runs.

## What it writes

The ledger folder `<ledger_root>/<slug>/`, the slug derived from the entry (its `plan.md` opens with `# Plan: <entry>`, which is how every other skill finds it) (`38.3 One object per file` gives `38-3-one-object-per-file`; a project prefix is dropped, since the ledger root is already the project's). A folder that already exists is a refusal: a plan is opened once.

- `plan.md` from `templates/plan.md`: the entry's goal and its gate copied in, and the step list, drafted from the gate as one step per verifiable piece of it, each with the check that proves it. The draft is shown to the user and the file is written only after the user has approved or corrected it.
- `orchestrator-state.md` from `templates/orchestrator-state.md`: the configuration block filled in from `plan.yaml`, every key of the block written out with the default for an optional key the file leaves out (the verification commands copied from the page, the rules file, the standards, the worktree root and paths, the worker and its effort, the reviewer, the review cadence, `repair_rounds`, `refute_after_repair`, `review_minutes`, `look`, `workers_at_once`, `bench`), the dispatch block empty, the open items empty, the position naming the first step. The block's `executor:` is not a project specific and is not in `plan.yaml`: it is written as `agent` unless the user says otherwise when the plan is opened, and the orchestrator chooses per step over it.
- `agents/briefs/` and `agents/reviews/`, empty.

Both files are committed by path as the plan's opening commit, with the roadmap entry's number in the subject.

## Rules

- A step is one deliverable and one agent dispatch, with the command that proves it. A step that cannot name its proof is not a step yet and is booked under "Blocked, and by what".
- Every path in the ledger is relative to the repository root, and every command names the directory it runs from.
- No history: the ledger records decisions with their dates in `plan.md`'s rulings list; the templates and this file carry none.
- The last step of every plan is the closing: the roadmap entry ticked with the gate's output (`/roadmap done <entry>`), and the ledger folder moved to `<archive_root>/`. `/plan` writes that step itself at the end of the drafted list.

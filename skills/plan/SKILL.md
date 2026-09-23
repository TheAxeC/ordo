---
name: plan
description: "Open a plan for one roadmap entry: create its ledger folder from the repository's plan configuration, write plan.md with the entry's goal, gate and a drafted step list for approval, and orchestrator-state.md with the configuration block filled from the repository. Triggers on: open a plan, start a plan, plan <roadmap entry>, new plan for <entry>."
metadata:
  version: "1.7.0"
---

# Open a plan

`/plan <entry>` turns one roadmap entry into a ledger folder that `/spec`, `/refute`, `/land` and `plan-orchestration` then run from. It leaves behind `plan.md` and `orchestrator-state.md`, committed, and the empty `agents/briefs/` and `agents/reviews/`.

## Quick start

```
/plan <entry>             open the plan for one roadmap entry: the ledger folder the step skills and the orchestrator run from, its step list drafted for approval
/plan <project>/<entry>   the same, in a repository whose plan.yaml lists several projects
```

## Use instead

| When | Use |
|---|---|
| The repository has no `.agents/plan.yaml` | `/ordo-init` |
| The roadmap has no entry for the work yet | `/roadmap add <goal>` |
| The plan is open and a step is due | `/spec <entry> <step>`, or `/plan-orchestration <entry>` for every step |
| Where an open plan stands | `/plan-help <entry>` |

## What it reads

1. `.agents/plan.yaml` at the repository root: the only place a project specific lives.
   - Its keys, which of them are required and the default of each optional one are in `templates/plan.yaml` (one project) and `templates/plan.projects.yaml` (several, listed under `projects:`, with `<entry>` then `<project>/<entry>`).
   - An optional key missing takes the default the example file gives it.
   - No file, and a required key missing, are stops ("Stops").
2. The roadmap the configuration names.
   - `<entry>` is matched against the entries by number or title; no match is a stop ("Stops").
3. The verification page the configuration names, for the commands every step runs.

## Steps

1. Name the ledger folder `<ledger_root>/<slug>/`, the slug derived from the entry.
   - `38.3 One object per file` gives `38-3-one-object-per-file`.
   - A project prefix is dropped, since the ledger root is already the project's.
   - A folder that already exists is a stop ("Stops").
2. Draft `plan.md` from `templates/plan.md`.
   - It opens with `# Plan: <entry>`, which is how every other skill finds it.
   - The entry's goal and its gate are copied in.
   - The step list is drafted from the gate, one step per verifiable piece of it, each with the check that proves it.
   - The last step is the closing: the roadmap entry ticked with the gate's output (`/roadmap done <entry>`), and the ledger folder moved to `<archive_root>/`.
   - `/plan` writes the closing step itself, at the end of the drafted list.
3. Show the draft to the user, and write `plan.md` once the user has approved or corrected it.
4. Write `orchestrator-state.md` from `templates/orchestrator-state.md`.
   - The configuration block is filled in from `plan.yaml`, every key of the block written out with the default for an optional key the file leaves out: the verification commands copied from the page, the rules file, the standards, the worktree root and paths, the worker and its effort, the reviewer, the review cadence, `repair_rounds`, `refute_after_repair`, `review_minutes`, `look`, `workers_at_once`, `bench`, `launch_note`.
   - The block's `executor:` is not a project specific and is not in `plan.yaml`.
   - `executor:` is written as `agent` unless the user says otherwise when the plan is opened.
   - The orchestrator chooses the executor per step over that default.
   - The dispatch block is empty, the open items are empty, and the position names the first step.
5. Create `agents/briefs/` and `agents/reviews/`, empty.
6. Commit both files by path as the plan's opening commit, with the roadmap entry's number in the subject.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The drafted step list | Every plan, after Steps 2: the skill does the mechanical half of opening a plan and stops at the design half | The drafted `plan.md`: the goal, the gate, the steps and each step's check | The user's approval or correction |
| No configuration | `.agents/plan.yaml` is missing: no file, no run | That the file is missing, and `/ordo-init`, which writes it | `/ordo-init`, then `/plan` again |
| A required key missing | A required key is not in `plan.yaml`; the refusal names the key | The key | The key added, then `/plan` again |
| No such entry | `<entry>` matches no roadmap entry | The open entries | `/plan` with an entry that exists |
| The plan exists | The ledger folder is already there: a plan is opened once | The folder | Nothing |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Writing `plan.md` before the user has approved the step list | The step list is the design half, and the design half is the user's | Steps 3 |
| Keeping a step that cannot name its proof in the step list | Nothing can show it done | Book it under "Blocked, and by what" until it can name its proof |

## Rules

- A step is one deliverable and one agent dispatch, with the command that proves it.
- Every path in the ledger is relative to the repository root.
- Every command in the ledger names the directory it runs from.
- No history: the ledger records decisions with their dates in `plan.md`'s rulings list; the templates and this file carry none.

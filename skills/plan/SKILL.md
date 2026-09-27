---
name: plan
description: "Open a plan for one roadmap entry: create its ledger folder from the repository's plan configuration, write plan.md with the entry's goal, gate and a drafted step list for approval, each approved step tagged (approved), orchestrator-state.md with the configuration block filled from the repository, and the landing script copied into the ledger with its test, the verify runner and the usage script beside it. Triggers on: open a plan, start a plan, plan <roadmap entry>, new plan for <entry>."
metadata:
  version: "1.9.0"
---

# Open a plan

`/plan <entry>` turns one roadmap entry into a ledger folder that `/spec`, `/refute`, `/land` and `plan-orchestration` then run from. It leaves behind `plan.md`, `orchestrator-state.md`, `land.sh`, `land.test.sh`, `verify.sh` and `usage.py`, committed, and `agents/briefs/` and `agents/reviews/`, each holding an empty `.gitkeep`.

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
   - `<entry>` is matched against the entries by number or title.
     - No match is a stop ("Stops").
3. The verification page the configuration names, for the commands every step runs.
4. The `land` skill's `templates/land.sh`, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.py`, found as `land.sh` finds `verify.sh`. They are read from the `land` skill's `templates/` under the first of these that holds them: the repository's `.agents/skills`, `~/.agents/skills` or `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`).
   - Not found is a stop ("Stops").

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
3. Show the draft to the user.
   - Write `plan.md` once the user has approved or corrected it.
   - Each step line of the approved list ends with `(approved)`, the authority "Rules" describes.
4. Write `orchestrator-state.md` from `templates/orchestrator-state.md`.
   - The configuration block is filled in from `plan.yaml`, every key of the block written out with the default for an optional key the file leaves out: the verification commands copied from the page, the rules file, the standards, the worktree root and paths, the worker, the reviewer, `libraries`, the review cadence, `repair_rounds`, `refute_after_repair`, `review_minutes`, `look`, `workers_at_once`, `bench`.
   - The block's `executor:` is not a project specific and is not in `plan.yaml`.
   - `executor:` is written as `agent` unless the user says otherwise when the plan is opened.
   - The orchestrator chooses the executor per step over that default.
   - The dispatch block is empty.
   - The open items are empty.
   - The position names the first step.
5. Copy the `land` skill's `templates/land.sh`, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.py` into the ledger folder. `/land` requires the ledger's `land.sh`. With the four beside each other, the ledger's `land.sh` and `land.test.sh` run from the ledger whatever skills are installed.
   - Then make the `ADAPT` edits of `land.sh` and `land.test.sh` from `plan.yaml`:
     - `landing_worktree_root` is `worktree_root`.
     - `landing_ledger_root` is `ledger_root`, the project's own in the `projects:` form.
     - `landing_tool_path` stays `.`, the whole tree.
     - The model names of the usage rows are `worker` and `reviewer`, in `land.sh` and in the rows `land.test.sh` expects.
     - The `ADAPT` block holds the dependency install the verification page's commands need, and stays empty, running nothing, when they need none.
6. Create `agents/briefs/` and `agents/reviews/`, each with an empty `.gitkeep`, since git does not keep an empty folder.
7. Commit `plan.md`, `orchestrator-state.md`, `land.sh`, `land.test.sh`, `verify.sh`, `usage.py` and the two `.gitkeep` files by path as the plan's opening commit.
   - Its subject holds the roadmap entry's number.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The drafted step list | Every plan, after Steps 2: the skill does the mechanical half of opening a plan and stops at the design half | The drafted `plan.md`: the goal, the gate, the steps and each step's check | The user's approval or correction |
| No configuration | `.agents/plan.yaml` is missing: no file, no run | That the file is missing, and `/ordo-init`, which writes it | `/ordo-init`, then `/plan` again |
| A required key missing | A required key is not in `plan.yaml`; the refusal names the key | The key | The key added, then `/plan` again |
| No such entry | `<entry>` matches no roadmap entry | The open entries | `/plan` with an entry that exists |
| No landing script | One of the `land` skill's `templates/land.sh`, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.py` is in none of the places "What it reads" 4 names | The file missing and the places looked in | The `land` skill installed, then `/plan` again |
| The plan exists | The ledger folder is already there: a plan is opened once | The folder | Nothing |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Writing `plan.md` before the user has approved the step list | The step list is the design half, and the design half is the user's | Steps 3 |
| Keeping a step that cannot name its proof in the step list | Nothing can show it done | Book it under "Blocked, and by what" until it can name its proof |

## Rules

- A step is one deliverable and one dispatch of its executor (a builder agent by default; `inline` or `academic-paper` when chosen), with the command that proves it, except the bookkeeping steps the orchestrator does itself.
- Every step line of `plan.md` ends with its authority: `(approved)` for a step of the list the user approved, or `(ruling <name>)` for a step a ruling of the user added later, naming that ruling's line in the Rulings section as the `spec` skill's "Steps / A ruling" says.
- Every path in the ledger is relative to the repository root.
- Every command in the ledger names the directory it runs from.
- No history: the ledger records decisions with their dates in `plan.md`'s rulings list; the templates and this file carry none.

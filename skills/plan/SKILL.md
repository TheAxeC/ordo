---
name: plan
description: "Open a plan for one roadmap entry: create its ledger folder from the repository's plan configuration, write plan.md with the entry's goal, gate and a drafted step list for approval, the gate and each step's check asked whether it could pass without the goal being reached, each approved step tagged (approved), and orchestrator-state.md with the configuration block filled from the repository. Triggers on: open a plan, start a plan, plan <roadmap entry>, new plan for <entry>."
metadata:
  version: "1.10.1"
---

# Open a plan

`/plan <entry>` turns one roadmap entry into a ledger folder that `/spec`, `/refute`, `/land` and `plan-orchestration` then run from. It leaves behind `plan.md` and `orchestrator-state.md`, committed, and `agents/briefs/` and `agents/reviews/`, each holding an empty `.gitkeep`.

## Quick start

```
/plan <entry>             open the plan for one roadmap entry: the ledger folder the step skills and the orchestrator run from, its step list drafted for approval
/plan <project>/<entry>   the same, in a repository whose plan.yaml lists several projects
/plan <entry> --ruling <ledger file> "<name>"   the same, under a quoted ruling: a step list that is the ruled one is written without the stop
/plan <entry> --self-rule   the same, run by plan-orchestration in next-entry mode: the orchestrator takes the drafted step list as its choice
```

## Use instead

| When | Use |
|---|---|
| The repository has no `.agents/plan.yaml` | `/ordo-init` |
| The roadmap has no entry for the work yet | `/roadmap add <goal>` |
| The entry's design decisions are not settled | `/grill <entry>` |
| The plan is open and a step is due | `/spec <entry> <step>`, or `/plan-orchestration <entry>` for every step |
| Where an open plan stands | `/ordo-help <entry>` |

## What it reads

1. `.agents/plan.yaml` at the repository root: the only place a project specific lives.
   - Its keys, which of them are required and the default of each optional one are in `templates/plan.yaml` (one project) and `templates/plan.projects.yaml` (several, listed under `projects:`, with `<entry>` then `<project>/<entry>`).
   - An optional key missing takes the default the example file gives it.
   - No file, and a required key missing, are stops ("Stops").
2. The roadmap the configuration names.
   - `<entry>` is matched against the entries by number or title.
     - No match is a stop ("Stops").
     - An entry that stands under the roadmap's "Not yet specified" section is a refusal that names `/roadmap add <entry>`, which names its gate ("Stops").
3. The verification page the configuration names, for the commands every step runs.
4. The rulings file `<ledger_root>/rulings/<slug>.md`, the slug as Steps 1 derives it, when it exists: the settled design answers for the entry, the user's and those `/grill --self-rule` wrote, written while no plan was open, and, under its `## Agents` heading, the lookup agents `/grill` started while no plan was open.
5. The ADRs in the folder the configuration's `adr` names (`docs/adr` when it has none): each `NNNN-*.md` record for its part in force, as the `spec` skill's "What it reads" 5 says.
6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
   - `<ledger file>` is a plan's `plan.md` or a rulings file, given by a path the skill can read from where it runs.
   - The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.
   - The name is read as the `spec` skill's "What it reads" 4 reads a ruling's name.
   - It is matched against the bullet's text as written, a quotation mark in it included.
   - A draft is the ruled change when each change it makes to a file has a sub-bullet that states it and equals that sub-bullet.
     - What the skill shows beside the change, such as a gate's answer with its reason or the lines around a place, is not part of what is compared.
   - A text of several lines is compared line for line with the fenced block under its sub-bullet.
   - There is no ruling in any of these cases.
     - `--ruling` is not followed by the file and the name as the last two arguments of the invocation.
     - The file does not exist, or is neither of those two files.
     - No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
     - The name is a placeholder in angle brackets, such as `<L>`.
     - The bullet's first line ends with neither "(the user)" nor "(self-rule)", each with or without a full stop after it.
   - With no ruling, the skill says which of these it found, and every stop stands.
7. The argument `--self-rule`, right after `<entry>`, before any other argument.
   - It is refused ("Stops") unless `.agents/plan.yaml`, in the `projects:` form the project's keys, holds `self_rule: on` and `next_entry: on`.

## Steps

1. Name the ledger folder `<ledger_root>/<slug>/`, the slug derived from the entry.
   - `38.3 One object per file` gives `38-3-one-object-per-file`.
   - A project prefix is dropped, since the ledger root is already the project's.
   - A folder that already exists is a stop ("Stops").
2. Draft `plan.md` from `templates/plan.md`.
   - It opens with `# Plan: <entry>`, which is how every other skill finds it.
   - The entry's goal and its gate are copied in.
   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) that is not under its `## Agents` heading is copied into the Rulings section as it stands, in its order, in place of the template's placeholder line; the file's other lines, such as a heading or a blank line, are not copied. Any other line, such as a wrapped continuation or an indented sub-bullet, is shown with the draft at Steps 3; the user places it, and a line the user leaves unplaced is copied below the bullet line it follows, as it stands, so nothing of the file is lost when Steps 6 removes it.
   - A quoted ruling that stands in the rulings file is copied with every line under it, its sub-bullets and their fenced blocks, and none of them is a line left to place.
   - Each bullet line under the rulings file's `## Agents` heading is copied into the new plan's `## Agents` section as it stands and in its order, in place of the template's placeholder bullets, and is never copied into Rulings nor shown as a line to place.
   - With no agent bullet in the rulings file, and with no rulings file, the `## Agents` section is written with its sentence and no bullet.
   - The session asks of the copied gate "could this pass without the goal being reached?" and writes the answer with its reason in the section "## Gate", on the line the template gives the gate.
   - A copied gate that could pass without the goal is kept as the roadmap has it, and its answer and reason go to the user at Steps 3, since the gate is the roadmap's and the user's.
   - The step list is drafted from the gate, one step per verifiable piece of it, each with the check that proves it.
     - Under a quoted ruling ("What it reads" 6), the step list is the ruling's, each step with its check.
     - The rest of this step is worked on that list.
     - A closing step in the ruled list is dropped for the one `/plan` writes.
   - The session asks the same question of each step's check, "the goal" there being the part of the goal the step delivers, and writes the answer with its reason in "## Gate", one line per step, as the template gives it.
   - The answer stands only in "## Gate", and each step line keeps the shape the template gives it.
   - A step's check that could pass without the goal (such as the forms the `roadmap` skill's "Steps / add" 3 names) is redrafted and asked again, at most twice, before the draft is shown.
   - A check that could still pass after the second redraft is kept as drafted, and its answer and reason go to the user at Steps 3.
   - The last step is the closing: the roadmap entry ticked with the gate's output (`/roadmap done <entry>`), and the ledger folder moved to `<archive_root>/`.
     - Before the folder moves, the closing step runs the `plan-orchestration` skill's `templates/plan_cost.py` on the ledger folder.
     - The closing step writes the script's output to `agents/reviews/closing.md`, the closing report.
     - A non-zero exit of the script that no fix within the plan covers is the stop "A red check" of `plan-orchestration`, and the stop message holds the script's `error:` lines. A model the table lacks is covered by a row copied into the table from the pricing page, committed with the closing.
     - The ledger folder moves only when the script exits 0.
   - `/plan` writes the closing step itself, at the end of the drafted list.
   - The step is done when the draft holds the goal, the gate, the answers of "## Gate", the Rulings, the Agents section and the step list with the closing step last, and when the draft, read back, holds every agent bullet of the rulings file once, in its Agents section.
3. Show the draft to the user, its "## Gate" holding the answer and its reason for the gate and for each step's check (Steps 2).
   - With the draft, name each design decision the drafted steps rest on that no ADR in force and no line of the Rulings section settles: a public shape, a wire format, a config key, a vocabulary, a format or a rule the builder applies across the tree, or a library choice. The list is shown, not written into `plan.md`.
   - With the draft, show each line of the rulings file that Steps 2 did not copy as a bullet line, for the user to place.
   - `/grill <entry>` settles such decisions before the plan opens. It is not required: the user may approve the list with them unsettled.
   - Write `plan.md` once the user has approved or corrected it.
     - Under a quoted ruling, the draft is written without the stop only when four things hold.
       - Each step and its check are the ruling's, the closing step `/plan` writes itself left out of the comparison.
       - Every answer in "## Gate" is no.
       - No design decision is named as unsettled.
       - No line of the rulings file is left to place.
     - Otherwise the draft is shown whole with what differs, what could pass without the goal and what is unsettled, and the stop stands.
     - The ruling's bullet and every line under it are copied into the Rulings section of a plan written under a quoted ruling, unless Steps 2 copied them from the rulings file.
   - Under `--self-rule`, the stop "The drafted step list" is raised as `Open item A` of the new plan, written in full as a stop is: the draft, the answers of "## Gate", the lines of the rulings file left to place, the options "open the plan with the list as drafted" and "keep the draft for the user", their pros and cons, the recommendation and the lazy option.
     - The first option is the recommendation, and the second, which leaves the plan unopened, is named as the lazy option.
     - A line of the rulings file left to place does not keep the stop: it is copied as Steps 2 says for a line the user leaves unplaced, and Open item A names it.
     - It stays with the user, and the stop stands as without `--self-rule`, when any answer of "## Gate" is yes, since the gate is the roadmap's and a check that could pass without its goal has no recommendation the written rules rank.
     - It also stays with the user, and the stop stands, when any design decision is named unsettled, since settling it is `/grill`'s and `/plan` has no recommendation the written rules rank.
     - It also stays with the user, and the stop stands, when it is of one of the six kinds of `plan-orchestration`'s `references/self-rule.md`, "The six kinds left open".
     - Otherwise it is closed by items 1 to 5 of that reference's "Closing an open item".
       - The Rulings bullet is `- Open item A (<date>): the step list as drafted, <n> steps, which opens the plan (self-rule).`
       - Each step line, the closing step included, ends with `(ruling A)`.
       - Steps 4 writes the state file with the Closed items line of "Closing an open item" 4 and no open item.
       - The choice goes to the choices file under the entry's heading, `Booked:` naming the new `plan.md` and `Open item A`, and `Builds on it:` naming every step.
     - Open item A counts as a stop of no step, since it is raised before any step exists.
   - Each step line of the approved list ends with `(approved)`, the authority "Rules" describes.
     - A step list written under a quoted ruling whose bullet ends "(the user)" is the approved list.
     - A step list written under a quoted ruling whose bullet ends "(self-rule)" has each step line end with `(ruling <name>)`, naming that bullet, never `(approved)`.
   - When `plan.md` is written, each bullet line Steps 2 copied that ends "(self-rule)" has its choice rewritten: the choice in the choices file whose `Booked:` names the rulings file and that bullet's opening words gets `Booked:` rewritten to the new `plan.md` and the line the bullet stands on there.
   - A stop that stands writes nothing, the choices file and the rulings file included.
   - The step is done when `plan.md` is written and the `Booked:` lines are rewritten, or the draft is shown and the stop stands.
4. Write `orchestrator-state.md` from `templates/orchestrator-state.md`.
   - The configuration block is filled in from `plan.yaml`, every key of the block written out with the default for an optional key the file leaves out: the verification commands copied from the page, the rules file, the standards, the worktree root and paths, the worker, the reviewer, `libraries`, the review cadence, `repair_rounds`, `refute_after_repair`, `review_minutes`, `look`, `workers_at_once`, `bench`, `adr`, `design_bar`, `design_references`, `worker_effort`, `reviewer_effort`, `self_rule`, `next_entry`, `repair_reviewer`.
   - A `repair_reviewer` that `plan.yaml` leaves out is written with the `reviewer` value.
   - The block's `executor:` is not a project specific and is not in `plan.yaml`.
   - `executor:` is written as `agent` unless the user says otherwise when the plan is opened.
   - The orchestrator chooses the executor per step over that default.
   - The dispatch block is empty.
   - The open items are empty.
   - The position names the first step.
5. Create `agents/briefs/` and `agents/reviews/`, each with an empty `.gitkeep`, since git does not keep an empty folder.
6. Commit `plan.md`, `orchestrator-state.md` and the two `.gitkeep` files by path as the plan's opening commit.
   - Its subject holds the roadmap entry's number.
   - The opening commit also holds the choices file `<ledger_root>/choices.md` when Steps 3 changed it, as `plan-orchestration`'s `references/self-rule.md`, "Closing an open item" 6, says.
   - A plan written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
   - When Steps 2 copied the ruling from the rulings file, the ledger file named is the new `plan.md`.
   - The commit also removes the rulings file copied at Steps 2: when the last commit holds it (`git cat-file -e HEAD:<path>` exits 0), `git rm -q -f -- <path>`, and its path named in the commit with the others; otherwise, `git rm -q -f --cached -- <path>` when git lists it as staged, and the file deleted before the commit, its path not named. The `-f` removes a copy with uncommitted changes, whose bullet lines Steps 2 has already copied.
   - The step is done when the opening commit holds the four files, the choices file when Steps 3 changed it, and the removal of the rulings file when there was one.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The drafted step list | Every plan, after Steps 2, except a draft written under a quoted ruling as Steps 3 says, or under `--self-rule` outside the cases Steps 3 keeps with the user: the skill does the mechanical half of opening a plan and stops at the design half | The drafted `plan.md`: the goal, the gate, the steps and each step's check, and in "## Gate" the answer to "could this pass without the goal being reached?" with its reason for the gate and for each step's check, and the design decisions no ADR in force or ruling settles and the rulings file's lines left to place (Steps 3) | The user's approval or correction |
| No configuration | `.agents/plan.yaml` is missing: no file, no run | That the file is missing, and `/ordo-init`, which writes it | `/ordo-init`, then `/plan` again |
| A required key missing | A required key is not in `plan.yaml`; the refusal names the key | The key | The key added, then `/plan` again |
| No such entry | `<entry>` matches no roadmap entry | The open entries | `/plan` with an entry that exists |
| Not yet specified | `<entry>` stands under the roadmap's "Not yet specified" section, so it has no gate to draft steps from | A refusal that names the entry, what must be known before its gate can be named, and `/roadmap add <entry>` | `/roadmap add <entry>`, then `/plan` again |
| `--self-rule` without the keys | `--self-rule` is given and `.agents/plan.yaml` does not hold `self_rule: on` and `next_entry: on` | A refusal that names the two keys and their values | The two keys set to `on`, then `/plan` again, or `/plan` without `--self-rule` |
| The plan exists | The ledger folder is already there: a plan is opened once | The folder, and the entry's rulings file when one is still there, for the user to remove, with its Agents bullets named when it holds any, to be copied into the open plan's Agents section before the file is removed | Nothing |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Writing `plan.md` before the user has approved the step list, except as Steps 3 says under `--self-rule` | The step list is the design half, and the design half is the user's | Steps 3 |
| Keeping a step that cannot name its proof in the step list | Nothing can show it done | Book it under "Blocked, and by what" until it can name its proof |

## Rules

- A step is one deliverable and one dispatch of its executor (a builder agent by default; `inline` or `academic-paper` when chosen), with the command that proves it, except the bookkeeping steps the orchestrator does itself.
- Every step line of `plan.md` ends with its authority: `(approved)` for a step of the list the user approved, or `(ruling <name>)` for a step a ruling added, after the approval or under a quoted ruling ending "(self-rule)", the ruling being the user's or one booked under self-rule, naming that ruling's line in the Rulings section as the `spec` skill's "Steps / A ruling" says, or `(ruling A)` for a step of a list taken under `--self-rule`, naming that run's Open item A.
- Every path in the ledger is relative to the repository root.
- Every command in the ledger names the directory it runs from.
- No history: the ledger records decisions with their dates in `plan.md`'s rulings list; the templates and this file carry none.

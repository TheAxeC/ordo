---
name: roadmap
description: "Keep the roadmap that /plan opens entries from: show the open entries in order with what each waits on and which has a plan open, add an entry (goal, gate, what it waits on) in the file's own format and in dependency order, move an entry, mark one done with its gate's output, or drop one with the reason. Learns the format from the file, whether one file holds everything or an ordered build plan sits over a capability map of per-system files. Writes only after the user approves. Triggers on: roadmap, add to the roadmap, new roadmap entry, what is next on the roadmap, mark the entry done, drop the entry, reorder the roadmap."
metadata:
  version: "1.0.0"
---

# Keep the roadmap

The roadmap is the file `.agents/plan.yaml`'s `roadmap:` key names (in the `projects:` form, the project's; `/roadmap <project> ...`). `/plan <entry>` matches `<entry>` against its entries by number or title and copies the entry's goal and gate into the plan, so every entry this skill writes has both.

```
/roadmap                                  the open entries in order: status, what each waits on, the plan open for it, the next one
/roadmap add <goal>                       drafts an entry and its place in the order, writes it after approval
/roadmap move <entry> before|after <entry>
/roadmap done <entry>                     marks it done with the gate's output; the closing step of a plan uses it
/roadmap drop <entry> <reason>
```

## What it reads

1. `.agents/plan.yaml` (its required keys and defaults as `/plan` states them: a required key missing is a refusal that names it): `roadmap`, `ledger_root`, `archive_root`, `verification`. No file is a refusal that names `/ordo-init`.
2. The roadmap file, whole, and every file its introduction links as part of the roadmap.
3. The ledger folders under `<ledger_root>/` and `<archive_root>/`, for the plan each entry has (a folder whose `plan.md` opens with `# Plan: <entry>`).
4. The verification page, for the commands a gate can name.

## The format is the file's

The skill writes in the format the file already uses, read from its existing entries and its introduction:

- **Entry shape.** The heading level and numbering of an entry (`## Phase 38: Code health` with `38.0`, `38.1` steps as bullets under it; `### 5. <status> Asset system (layer)` with bullets and a `See:` line), and the parts of an entry's body.
- **Levels.** When entries exist at two levels (a phase and its steps), `/plan` can open either; an added entry goes at the level the user names, and the skill asks when the goal does not settle it.
- **Status vocabulary.** The legend the file states (glyphs, `[ ]` / `[~]` / `[x]`, or words), and the rules the introduction attaches to it: a phase with an open step is in progress, done means the full scope is met and tested, dropped work moves to another file with its reason. These rules bind the skill.
- **Numbering.** Entry numbers are referenced from ledgers, ADRs and commits, so the skill never renumbers an existing entry. A new entry between two others takes the file's own insertion form (`37.A`, `12.5`); a file with no such form yet is asked about once, and the answer is used from then on.

A repository with no roadmap gets `templates/roadmap.md`: the introduction, the legend, and the Open, Done and Dropped sections, with no entries.

## A capability map beside the ordered file

When the roadmap's introduction links an index as the map of what the product is (one file per system, each capability with its full scope), the roadmap file is the ordered build plan over it. Then:

- `add` also finds the capability the entry builds in its system file. A capability that is not there yet is drafted in that file, in its format, with every scope item open; the entry's pointer line names the file.
- `done` ticks the entry, and ticks the capability only when every scope item of it is met; an entry that meets part of a capability ticks those scope items and leaves the capability open.
- `/roadmap` shows, for each open entry, the capability and how many of its scope items are open.

## add

From the goal the user gives, the skill drafts:

- **The title**, in the file's form, and **the goal** in one or two sentences.
- **The gate**: the check that proves the entry done, as a command from the verification page, a test named and what it asserts, or an observable result someone can check. A goal whose gate cannot be named is not added: the skill says what is missing and asks.
- **What it waits on**: the entries (open or done) the work depends on, found from the goal and the entries' text, each with the reason.
- **The place**: after everything it waits on and before the entries that will depend on it, with that reason written out. When the file's order is foundation first, a new entry never goes ahead of an entry it depends on to reach something sooner.

The draft is shown with the lines around its place and, for a map, the capability's draft. It is written after the user approves or corrects it.

## move, done, drop

- **move** checks the new place against both entries' dependencies and refuses a place ahead of something the entry waits on, naming it.
- **done** needs the gate's output: the command and the lines it printed, from this session's run or quoted by the user. It marks the entry in the file's vocabulary and writes the output line beside it where the file keeps such lines. With no output, it refuses and prints the gate.
- **drop** moves the entry where the file's introduction says dropped work goes, with the reason, and never deletes it silently. An entry with an open plan is not dropped until the plan is closed or archived.

## Writing

Each change is shown as a diff of the roadmap file (and the system file, for a map) and written after approval. The files are committed by explicit path list, one commit per change, the subject naming the entry and what changed.

## Rules

- Nothing is added that the user did not ask for; a dependency the draft finds missing from the roadmap is shown as a question, not added as an entry.
- Entry text states the goal, the gate and the dependencies. Implementation narration, dates and history belong to the plan's ledger and the commits.
- Every path is relative to the repository root.

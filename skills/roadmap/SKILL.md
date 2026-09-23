---
name: roadmap
description: "Keep the roadmap that /plan opens entries from: show the open entries in order with what each waits on and which has a plan open, add an entry (goal, gate, what it waits on) in the file's own format and in dependency order, move an entry, mark one done with its gate's output, or drop one with the reason. Learns the format from the file, whether one file holds everything or an ordered build plan sits over a capability map of per-system files. Writes only after the user approves. Triggers on: roadmap, add to the roadmap, new roadmap entry, what is next on the roadmap, mark the entry done, drop the entry, reorder the roadmap."
metadata:
  version: "1.1.0"
---

# Keep the roadmap

`/roadmap` shows, adds, moves, marks done and drops the entries of the file `.agents/plan.yaml`'s `roadmap:` key names. It leaves behind each change the user approved, committed on its own.

## Quick start

```
/roadmap                                  the open entries in order: status, what each waits on, the plan open for it, the next one
/roadmap add <goal>                       drafts an entry and its place in the order, writes it after approval
/roadmap move <entry> before|after <entry>
/roadmap done <entry>                     marks it done with the gate's output; the closing step of a plan uses it
/roadmap drop <entry> <reason>
/roadmap <project> ...                    the same, for one project of a plan.yaml in the projects: form
```

## Use instead

| When | Use |
|---|---|
| An entry is ready to be opened as a plan | `/plan <entry>` |
| Where an open plan stands | `/plan-help <entry>` |

## What it reads

1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them: `roadmap`, `ledger_root`, `archive_root`, `verification`.
   - In the `projects:` form, the named project's keys.
   - No file, and a required key missing, are refusals ("Stops").
2. The roadmap file, whole, and every file its introduction links as part of the roadmap.
3. The ledger folders under `<ledger_root>/` and `<archive_root>/`, for the plan each entry has: a folder whose `plan.md` opens with `# Plan: <entry>`.
4. The verification page, for the commands a gate can name.

## Steps

1. Read the file's format, as "The format is the file's" says, and whether a capability map sits beside it ("A capability map beside the ordered file").
2. Draft the change, by the command's subsection below; nothing is written yet.
3. Show each change as a diff of the roadmap file, and of the system file for a map.
4. Write the change once the user approves or corrects it ("Stops").
5. Commit the files by explicit path list, one commit per change, the subject naming the entry and what changed.

### Show

1. Print the open entries in order: the status of each, what it waits on, the plan open for it.
2. Name the next one.

### add

1. From the goal the user gives, draft the title, in the file's form, and the goal, in one or two sentences.
2. Draft the gate: the check that proves the entry done, as a command from the verification page, a test named and what it asserts, or an observable result someone can check.
   - A goal whose gate cannot be named is not added: that is a stop ("Stops").
3. Draft what it waits on: the entries (open or done) the work depends on, found from the goal and the entries' text, each with the reason.
   - A dependency the roadmap does not hold is a stop ("Stops").
4. Draft the place: after everything it waits on and before the entries that will depend on it, with that reason written out.
   - When the file's order is foundation first, a new entry never goes ahead of an entry it depends on to reach something sooner.
5. Show the draft with the lines around its place and, for a map, the capability's draft.

### move

1. Check the new place against both entries' dependencies.
2. A place ahead of something the entry waits on is a refusal that names it ("Stops").

### done

1. Take the gate's output: the command and the lines it printed, from this session's run or quoted by the user.
   - No output is a refusal ("Stops").
2. Draft the entry marked in the file's vocabulary.
3. Draft the output line beside it, where the file keeps such lines.

### drop

1. An entry with an open plan is not dropped until the plan is closed or archived ("Stops").
2. Draft the entry moved where the file's introduction says dropped work goes, with the reason.

## The format is the file's

The skill writes in the format the file already uses, read from its existing entries and its introduction.

- **Entry shape.** The heading level and numbering of an entry (`## Phase 38: Code health` with `38.0`, `38.1` steps as bullets under it; `### 5. <status> Asset system (layer)` with bullets and a `See:` line), and the parts of an entry's body.
- **Levels.** When entries exist at two levels (a phase and its steps), `/plan` can open either.
- **The level of an added entry.** It goes at the level the user names; a goal that does not settle it is a stop ("Stops").
- **Status vocabulary.** The legend the file states (glyphs, `[ ]` / `[~]` / `[x]`, or words), and the rules the introduction attaches to it: a phase with an open step is in progress, done means the full scope is met and tested, dropped work moves to another file with its reason.
- **The status rules.** The rules the introduction attaches to the status vocabulary bind the skill.
- **Numbering.** A new entry between two others takes the file's own insertion form (`37.A`, `12.5`).
- **No insertion form yet.** A stop ("Stops").
- **No roadmap.** A repository with none gets `templates/roadmap.md`: the introduction, the legend, and the Open, Done and Dropped sections, with no entries.

## A capability map beside the ordered file

When the roadmap's introduction links an index as the map of what the product is (one file per system, each capability with its full scope), the roadmap file is the ordered build plan over it. Then:

- `add` also finds the capability the entry builds in its system file.
- A capability that is not there yet is drafted in that file, in its format, with every scope item open.
- The entry's pointer line names the capability's system file.
- `done` ticks the entry, and ticks the capability only when every scope item of it is met.
- An entry that meets part of a capability ticks those scope items and leaves the capability open.
- `/roadmap` shows, for each open entry, the capability and how many of its scope items are open.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The change | Every change, at Steps 3 | The diff | The user's approval or correction |
| No gate | The goal's gate cannot be named | What is missing | The user's answer |
| The level | Entries exist at two levels and the goal does not settle which | The two levels | The user's choice |
| The insertion form | The file has no insertion form yet | The question, once | The user's answer, used from then on |
| A missing dependency | The draft finds a dependency the roadmap does not hold | The dependency, as a question in the draft, not added as an entry | The user's answer |
| No configuration | `.agents/plan.yaml` is missing | A refusal that names `/ordo-init` | `/ordo-init`, then `/roadmap` again |
| A required key missing | A required key is not in `.agents/plan.yaml` | The key | The key added |
| A place too early | `move` to a place ahead of something the entry waits on | What it waits on | `move` to a place after it |
| No gate output | `done` with no output of the gate | The gate | The gate run, its output given |
| An open plan | `drop` of an entry whose plan is open | The plan | The plan closed or archived |

- The first five rows are stops: each waits on the user.
- The rest are refusals: each names its cause and changes nothing.

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Renumbering an existing entry | Entry numbers are referenced from ledgers, ADRs and commits, which then point at the wrong entry | "The format is the file's", Numbering |
| Adding anything the user did not ask for | The roadmap then holds work nobody decided | Rules 1 |
| Implementation narration, dates or history in entry text | They belong to the plan's ledger and the commits | Rules 2 |
| Deleting a dropped entry silently | The reason it was dropped is lost | Steps / drop 2 |

## Rules

- Nothing is added that the user did not ask for.
- Entry text states the goal, the gate and the dependencies.
- Every entry this skill writes has a goal and a gate, since `/plan <entry>` matches `<entry>` against the entries by number or title and copies the entry's goal and gate into the plan.
- Every path is relative to the repository root.

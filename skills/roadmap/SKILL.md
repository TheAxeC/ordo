---
name: roadmap
description: "Keep the roadmap, the ordered list of work a plan is opened for: show the open entries in order with what each waits on and which has a plan open, followed by the entries under \"Not yet specified\"; add an entry (goal, a gate that could not pass without the goal being reached, what it waits on) in the file's own format and in dependency order; put work whose gate cannot yet be named under \"Not yet specified\" with what must be known first; name the gate of such an entry and place it in the order; move an entry; mark one done with its gate's output; or drop one with the reason. Learns the format from the file, whether one file holds everything or an ordered build plan sits over a capability map of per-system files. Writes only after the user approves or under a quoted ruling. Triggers on: roadmap, add to the roadmap, new roadmap entry, what is next on the roadmap, not yet specified, park on the roadmap until its gate is known, name the gate of an entry, mark the entry done, drop the entry, reorder the roadmap."
metadata:
  version: "1.3.0"
---

# Keep the roadmap

`/roadmap` shows, adds, moves, marks done and drops the entries of the file `.agents/plan.yaml`'s `roadmap:` key names. It leaves behind each change written after the user's approval or under a quoted ruling, committed on its own.

## Quick start

```
/roadmap                                  the open entries in order: status, what each waits on, the plan open for it, the next one; then the entries not yet specified
/roadmap add <goal>                       drafts an entry and its place in the order, writes it after approval
/roadmap add <entry>                      for an entry under "Not yet specified": drafts its gate and its place in the order, writes it after approval
/roadmap move <entry> before|after <entry>  moves the entry to the place named, after approval
/roadmap done <entry>                     marks it done with the gate's output; the closing step of a plan uses it
/roadmap drop <entry> <reason>            moves the entry to where the file keeps dropped work, with the reason, after approval
/roadmap <project> ...                    the same, for one project of a plan.yaml in the projects: form
/roadmap <command> ... --ruling <ledger file> "<name>"   add, move, done or drop under a quoted ruling: a draft that is the ruled change is written without the stop
```

## Use instead

| When | Use |
|---|---|
| An entry's design decisions are to be settled before its plan | `/grill <entry>` |
| An entry is ready to be opened as a plan | `/plan <entry>` |
| Where an open plan stands | `/ordo-help <entry>` |

## What it reads

1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them: `roadmap`, `ledger_root`, `archive_root`, `verification`, `rules`.
   - In the `projects:` form, the named project's keys.
   - No file, and a required key missing, are refusals ("Stops").
2. The roadmap file, whole, and every file its introduction links as part of the roadmap.
3. The ledger folders under `<ledger_root>/` and `<archive_root>/`, for the plan each entry has: a folder whose `plan.md` opens with `# Plan: <entry>`.
4. The verification page, for the commands a gate can name.
5. The rules file `rules:` names, for its rule on secrets in quoted command output, which `done` applies to the gate's output.
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
     - The bullet's first line ends neither with "(the user)" nor, for `add` only, with "(self-rule)" on a bullet that names a finding of a running plan, each with or without a full stop after it.
       - Such a bullet names its finding by the path of its report under the plan's `agents/reviews/` (a refuter report, a brief-check report, a landing report or a diagnosis record), the heading the finding stands under and its number there.
       - `/roadmap` reads that report and finds the finding there.
       - `/roadmap` checks that the plan is open: its folder lies under `<ledger_root>/`, outside `<archive_root>/`.
       - `/roadmap` checks that the entry's goal is the finding's work, read against the finding's text.
       - A check that fails leaves no ruling.
       - The skill says which check failed.
   - With no ruling, the skill says which of these it found.
   - With no ruling, every stop stands.

## Steps

1. Read the file's format, as "The file's format" says, and whether a capability map sits beside it ("A capability map beside the ordered file").
   - The plain `/roadmap` then runs "Steps / Show" and ends there: it changes nothing and shows nothing for approval.
2. For `add`, `move`, `done` and `drop` only, draft the change by the command's subsection below.
   - Nothing is written yet.
   - Under a quoted ruling ("What it reads" 6), the draft takes the ruling's text.
   - For `add` that text is the entry's title, goal, gate, level, number, what it waits on and its place, with the capability's draft where the roadmap has a capability map.
   - For `move`, `done` and `drop` it is the change the ruling states.
   - Each item of the command's subsection is then worked on that draft.
   - An item replaces ruled text only where a rule of this skill gives another result, such as a place, a number, a level or the file's form.
   - The ruled wording of the title, the goal, the gate and what it waits on is kept.
   - The step is done when the change is drafted and nothing is written.
3. Show each change as a diff of the roadmap file, and of the system file for a map, and for `add` the gate's answer with its reason (Steps / add 6).
4. Write the change once the user approves or corrects it ("Stops").
   - Under a quoted ruling, compare the draft, after the command's subsection has been worked on it, with the change the ruling states.
   - A draft that is that change is written without the stop, for `add` only when the gate's answer of Steps / add 3 is no.
   - A draft that differs in anything, such as a place or a number the skill's own rules give, is shown whole with each difference named, and the stop stands.
   - The step is done when the change is written, or the draft is shown with each difference named and the stop stands.
5. Commit the files by explicit path list, one commit per change, the subject naming the entry and what changed.
   - A change written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
   - The step is done when each change written is in a commit of its own.

### Show

1. Print the open entries in order: the status of each, what it waits on, the plan open for it.
2. Name the next one.
3. After naming the next one, list every entry under "Not yet specified", apart from the open order, each with its title and what must be known before its gate can be named.
   - The show is done when every entry of that section is listed.

### add

1. From the goal the user gives, draft the title, in the file's form, and the goal, in one or two sentences.
   - When the argument matches an entry under "Not yet specified" by number or title, the title and the goal are that entry's.
   - The draft moves that entry out of "Not yet specified" to the place of Steps / add 5, with the gate of Steps / add 2 and 3 and what it waits on.
   - The entry keeps its number ("The file's format", bullet "Numbering under Not yet specified").
2. Draft the gate: the check that proves the entry done, as a command from the verification page, a test named and what it asserts, or an observable result someone can check.
   - A goal whose gate cannot be named is a stop ("Stops", row "No gate").
   - At that stop the user may put the entry under "Not yet specified": it is drafted in the form of "The file's format", bullet "Not yet specified".
     - The draft goes to Steps / add 6 without Steps / add 3 to 5.
3. Ask of the drafted gate "could this pass without the goal being reached?" and write the answer with its reason in the draft that Steps / add 6 shows, never in the roadmap entry.
   - A gate that could (a file that exists without saying what the goal asks, a command that exits 0 on an empty result, a count with no content behind it) is redrafted and asked again, at most twice.
     - Under a quoted ruling the ruled gate is not redrafted.
       - Its answer and its reason stand in the draft.
       - A ruled gate that could pass without the goal keeps the stop of Steps 4.
   - A goal whose gate could still pass after the second redraft is a goal whose gate cannot be named (Steps / add 2).
     - The stop "No gate" is not raised for a quoted ruling's gate.
   - The step is done when the answer with its reason stands in the draft, and the gate's answer is no or the gate is a quoted ruling's.
4. Draft what it waits on: the entries (open or done) the work depends on, found from the goal and the entries' text, each with the reason.
   - A dependency the roadmap does not hold is a stop ("Stops").
5. Draft the place: after everything it waits on and before the entries that will depend on it, with that reason written out.
   - When the file's order is foundation first, a new entry never goes ahead of an entry it depends on to reach something sooner.
6. Show the draft with the lines around its place, the gate's answer of Steps / add 3 with its reason and, for a map, the capability's draft.

### move

1. A `move` in which either entry, the one moved or the one it is placed before or after, stands under "Not yet specified" is a refusal that names `/roadmap add <entry>` for that entry ("Stops").
2. Check the new place against both entries' dependencies.
3. A place ahead of something the entry waits on is a refusal that names it ("Stops").

### done

1. Take the gate's output: the command and the lines it printed, from this session's run or quoted by the user.
   - The lines are written with `<REDACTED>` in place of the value of a secret, as the rules file's rule on secrets in quoted command output says (item 5 of "What it reads").
   - No output is a refusal ("Stops").
2. Draft the entry marked in the file's vocabulary.
3. Draft the output line beside it, where the file keeps such lines.

### drop

1. An entry with an open plan is not dropped until the plan is closed or archived ("Stops").
2. Draft the entry moved where the file's introduction says dropped work goes, with the reason.

## The file's format

The skill writes in the format the file already uses, read from its existing entries and its introduction.

- **Entry shape.** The heading level and numbering of an entry (`## Phase 38: Code health` with `38.0`, `38.1` steps as bullets under it; `### 5. <status> Asset system (layer)` with bullets and a `See:` line), and the parts of an entry's body.
- **Levels.** When entries exist at two levels (a phase and its steps), `/plan` can open either.
- **The level of an added entry.** It goes at the level the user names.
  - A goal that does not settle it, with no quoted ruling that does, is a stop ("Stops").
- **Status vocabulary.** The legend the file states (glyphs, `[ ]` / `[~]` / `[x]`, or words), and the rules the introduction attaches to it: a phase with an open step is in progress, done means the full scope is met and tested, dropped work moves to another file with its reason.
- **The status rules.** The rules the introduction attaches to the status vocabulary bind the skill.
- **Numbering.** A new entry between two others takes the file's own insertion form (`37.A`, `12.5`).
- **No insertion form yet.** A stop ("Stops"), unless a quoted ruling states the entry's number.
- **Not yet specified.** Work whose gate cannot yet be named sits in the section "Not yet specified", after the open entries and before the done ones.
  - Each entry there has its title, its goal and what must be known before its gate can be named.
- **Numbering under Not yet specified.** An entry put under "Not yet specified" takes the next whole number above the highest in the file, at the level it is added at, and never the insertion form of "Numbering".
  - It keeps that number when it moves to the open order.
- **No such section yet.** A roadmap without "Not yet specified" gets it, in the file's own heading form, the first time an entry goes there.
- **No roadmap.** A repository with none gets `templates/roadmap.md`: the introduction, the legend, and the Open, Not yet specified, Done and Dropped sections, with no entries.

## A capability map beside the ordered file

When the roadmap's introduction links an index as the map of what the product is (one file per system, each capability with its full scope), the roadmap file is the ordered build plan over it. Then:

- `add` also finds the capability the entry builds in its system file.
- A capability that is not there yet is drafted in that file, in its format, with every scope item open.
- The entry's pointer line names the capability's system file.
- `done` ticks the entry.
  - It ticks the capability only when every scope item of it is met.
- An entry that meets part of a capability ticks those scope items.
  - It leaves the capability open.
- `/roadmap` shows, for each open entry, the capability and how many of its scope items are open.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The change | Every change of `add`, `move`, `done` or `drop`, at Steps 3, except a draft written under a quoted ruling as Steps 4 says | What Steps 3 shows | The user's approval or correction |
| No gate | The goal's gate cannot be named | What is missing, and the two options: name the gate, or put the entry under "Not yet specified" with what must be known before its gate can be named | The user's gate, or the user's approval of the entry under "Not yet specified" |
| The level | Entries exist at two levels and neither the goal nor a quoted ruling settles which | The two levels | The user's choice |
| The insertion form | The file has no insertion form yet, and no quoted ruling states the entry's number | The question, once | The user's answer, used from then on |
| A missing dependency | The draft finds a dependency the roadmap does not hold | The dependency, as a question in the draft, not added as an entry | The user's answer |
| No configuration | `.agents/plan.yaml` is missing | A refusal that names `/ordo-init` | `/ordo-init`, then `/roadmap` again |
| A required key missing | A required key is not in `.agents/plan.yaml` | The key | The key added |
| A place too early | `move` to a place ahead of something the entry waits on | What it waits on | `move` to a place after it |
| Not yet specified | `move` in which the entry moved or the entry it is placed before or after stands under "Not yet specified" | That entry and `/roadmap add <entry>` for it | `/roadmap add <entry>` |
| No gate output | `done` with no output of the gate | The gate | The gate run, its output given |
| An open plan | `drop` of an entry whose plan is open | The plan | The plan closed or archived |

- The first five rows are stops: each waits on the user.
- The rest are refusals: each names its cause and changes nothing.

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Renumbering an existing entry | Entry numbers are referenced from ledgers, ADRs and commits, which then point at the wrong entry | "The file's format", Numbering |
| Adding anything Rules 1 does not allow | The roadmap then holds work nobody decided | Rules 1 |
| Implementation narration, dates or history in entry text | They belong to the plan's ledger and the commits | Rules 2 |
| Deleting a dropped entry silently | The reason it was dropped is lost | Steps / drop 2 |

## Rules

- Nothing is added except what the user asked for, or what a quoted ruling ending "(self-rule)" names as a finding of a running plan.
- Entry text states the goal, the gate and the dependencies, since `/plan <entry>` matches `<entry>` against the entries by number or title and copies the entry's goal and gate into the plan.
  - An entry under "Not yet specified" states the goal and what must be known before its gate can be named, in place of a gate.
- A goal names another repository only where the entry reads or changes it, such as the source of a migration.
- A gate and a dependency name another repository only under the same condition, such as the target of a switch-over or the repository a gate runs on.
- A file or folder in another repository is written as its path from the folder that holds this repository, such as `<other-repository>/tools/scripts`.
- Every path is relative to the repository root, except a path in another repository (the rule before) and a quoted command with its output, which keeps the paths it had.

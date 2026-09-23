# Rule inventory: roadmap

- Old: `skills/roadmap/SKILL.md` at `19d395a`
- New: `skills/roadmap/SKILL.md`

| Old lines | Rule | New place |
|---|---|---|
| 2 | The skill's name, invoked as /roadmap | Quick start |
| 3 | Show the open entries in order | Steps / Show 1 |
| 3 | Add, move, mark done or drop an entry | Steps 2 |
| 3 | In the file's own format | The format is the file's |
| 3 | Writes only after the user approves | Steps 4 |
| 3 | An added entry goes in dependency order | Steps / add 4 |
| 3 | Mark one done with its gate's output | Steps / done 1 |
| 3 | Drop one with the reason | Steps / drop 2 |
| 3 | Learns the format from the file | The format is the file's |
| 3 | Whether one file holds everything or an ordered plan sits over a capability map | A capability map beside the ordered file |
| 3 | The trigger phrases | Quick start |
| 4 | The metadata key | Quick start |
| 5 | The version, 1.0.0, now 1.1.0 in metadata.version | Quick start |
| 10 | The roadmap is the file the roadmap: key names | What it reads 1 |
| 10 | In the projects: form, the project's roadmap key | What it reads 1 |
| 10 | Invoked as /roadmap <project> ... | Quick start |
| 10 | /plan matches <entry> by number or title and copies the goal and gate, so every entry written has both | Rules 3 |
| 13 | /roadmap shows the open entries in order, status, waits, plan, the next one | Quick start |
| 14 | /roadmap add drafts an entry and its place, written after approval | Quick start |
| 15 | /roadmap move | Quick start |
| 16 | /roadmap done marks it done with the gate's output; the closing step uses it | Quick start |
| 17 | /roadmap drop | Quick start |
| 22 | .agents/plan.yaml, its keys as /plan states them: roadmap, ledger_root, archive_root, verification | What it reads 1 |
| 22 | A required key missing is a refusal that names it | Stops 7 |
| 22 | No file is a refusal that names /ordo-init | Stops 6 |
| 23 | The roadmap file whole, and the files its introduction links | What it reads 2 |
| 24 | The ledger folders, for the plan each entry has | What it reads 3 |
| 25 | The verification page, for the commands a gate can name | What it reads 4 |
| 27 | The format is the file's | The format is the file's |
| 29 | The skill writes in the format the file uses, read from its entries and introduction | The format is the file's |
| 31 | Entry shape: the heading level, numbering and body parts, with the two examples | The format is the file's 1 |
| 32 | Levels: /plan can open either level | The format is the file's 2 |
| 32 | An added entry goes at the level the user names | The format is the file's 3 |
| 32 | The skill asks when the goal does not settle it | Stops 3 |
| 33 | Status vocabulary: the legend and the rules the introduction attaches to it | The format is the file's 4 |
| 33 | These rules bind the skill | The format is the file's 5 |
| 34 | Entry numbers are referenced elsewhere, so the skill never renumbers an existing entry | Anti-patterns 1 |
| 34 | A new entry between two takes the file's insertion form | The format is the file's 6 |
| 34 | A file with no insertion form is asked about once, the answer used from then on | Stops 4 |
| 36 | A repository with no roadmap gets templates/roadmap.md, with no entries | The format is the file's 8 |
| 40 | When the introduction links an index as the map, the roadmap is the ordered build plan over it | A capability map beside the ordered file |
| 42 | add finds the capability the entry builds in its system file | A capability map beside the ordered file 1 |
| 42 | A capability not there yet is drafted in its file, every scope item open | A capability map beside the ordered file 2 |
| 42 | The entry's pointer line names the file | A capability map beside the ordered file 3 |
| 43 | done ticks the capability only when every scope item is met | A capability map beside the ordered file 4 |
| 43 | An entry meeting part of a capability ticks those scope items and leaves it open | A capability map beside the ordered file 5 |
| 44 | /roadmap shows each open entry's capability and its open scope items | A capability map beside the ordered file 6 |
| 48 | From the goal the user gives, the skill drafts | Steps / add 1 |
| 50 | The title in the file's form, the goal in one or two sentences | Steps / add 1 |
| 51 | The gate: a command, a test and its assertion, or an observable result | Steps / add 2 |
| 51 | A goal whose gate cannot be named is not added; the skill says what is missing and asks | Stops 2 |
| 52 | What it waits on, found from the goal and the entries, each with its reason | Steps / add 3 |
| 53 | The place: after what it waits on, before what depends on it, the reason written | Steps / add 4 |
| 53 | In a foundation-first file, never ahead of an entry it depends on | Steps / add 4 |
| 55 | The draft is shown with the lines around its place and the capability's draft | Steps / add 5 |
| 55 | It is written after the user approves or corrects it | Steps 4 |
| 59 | move checks the new place against both entries' dependencies | Steps / move 1 |
| 59 | move refuses a place ahead of something the entry waits on, naming it | Stops 8 |
| 60 | done needs the gate's output, from this session's run or quoted | Steps / done 1 |
| 60 | done marks the entry in the file's vocabulary | Steps / done 2 |
| 60 | done writes the output line beside it where the file keeps such lines | Steps / done 3 |
| 60 | With no output, done refuses and prints the gate | Stops 9 |
| 61 | drop moves the entry where the introduction says, with the reason | Steps / drop 2 |
| 61 | drop never deletes an entry silently | Anti-patterns 4 |
| 61 | An entry with an open plan is not dropped until the plan is closed or archived | Stops 10 |
| 65 | Each change shown as a diff of the roadmap file, and the system file for a map | Steps 3 |
| 65 | Written after approval | Steps 4 |
| 65 | Committed by explicit path, one commit per change, the subject naming the entry and the change | Steps 5 |
| 69 | Nothing is added that the user did not ask for | Rules 1 |
| 69 | A dependency missing from the roadmap is shown as a question, not added | Stops 5 |
| 70 | Entry text states the goal, the gate and the dependencies | Rules 2 |
| 70 | Narration, dates and history belong to the ledger and the commits | Anti-patterns 3 |
| 71 | Every path is relative to the repository root | Rules 4 |

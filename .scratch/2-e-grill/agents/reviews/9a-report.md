Everything in the brief is done.

Items 1 to 13 of "What to build" are built as dictated, checks 1 to 9 of "Verify before you report" hold (part 5 quotes each output), and no case R1 to R12 was found wrong by the brief's texts, in the first read (part 3) or in the walks after the change (part 4). The five fresh-agent scratch runs the brief names are the orchestrator's and are not part of this step. Part 11 names one line number in the brief that does not match the tree and two edge cases the dictated texts leave open; none of them changes a dictated text.

## 2. The open items of the state file, verbatim

$ sed -n '44,46p' .scratch/2-e-grill/orchestrator-state.md
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

- None.
[exit 0]

The section holds only `- None.`

## 3. The cases' first read, on the unchanged tree

The unchanged tree is `git archive HEAD` extracted to a folder under `$TMPDIR/9a-build/head`, read only; the commands below run in it; the R10 counts use `git grep ... HEAD` in the worktree, which reads the committed and unchanged tree. Each case is read against the lines the brief's "What is on the tree" names, then against the brief's texts for that case.

### R1, the glossary

```
$ grep -n -c 'quoted ruling' docs/glossary.md skills/repo-setup/templates/plan-terms.md
docs/glossary.md:0
skills/repo-setup/templates/plan-terms.md:0
[exit 1]

$ grep -n -e '^- \*\*commit rule\*\*' -e '^- \*\*ruling\*\*' -e '^- \*\*rulings file\*\*' -e '^- \*\*mark, of a figure\*\*' docs/glossary.md
25:- **commit rule**: whether the repository allows the skills to commit, the answer to `/repo-setup`'s question 5 or, for `/ordo-init` run alone, the user's answer at its approval stop. Stated in: `repo-setup`, "The questions"; `ordo-init`, "What it reads" 3.
96:- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled".
97:- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6 and "Steps / Writing what settled".
133:- **mark, of a figure**: the label a box of the README's figures carries where the user is asked, each drawn with its own shape and word: "every run", a stop that waits on the user each time the skill runs; "only when", a stop that waits on the user only when its condition occurs; and "optional", a skill the user may run or skip, drawn as a dashed box. Stated in: `README.md`, the figures.
[exit 0]

$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
[exit 0]
```

Before: neither file holds the words "quoted ruling" (counts 0, exit 1); the four entries the brief changes are at lines 25, 96, 97 and 133 of the glossary, with the wording items 1 and 2 replace; the plan-terms block equals the template (`ok`, exit 0). The brief's texts of items 1 and 2 give the after the case states: one new entry in alphabetical place, four changed entries, the script still printing `ok`. Result: as the brief says.

### R2, the orchestrator's side and a session run by hand

```
$ grep -n -e 'stay stops of their own' -e '--ruling' skills/plan-orchestration/SKILL.md skills/spec/SKILL.md skills/ordo-help/SKILL.md
skills/plan-orchestration/SKILL.md:304:  - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, and the approval stop of a skill the option runs, such as `/roadmap`'s shown diff, stay stops of their own, and the option names each of them.
skills/spec/SKILL.md:200:     - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, and the approval stop of a skill the option runs, such as `/roadmap`'s shown diff, stay stops of their own, and the option names each of them.
[exit 0]

$ sed -n 299,305p skills/plan-orchestration/SKILL.md
- A ruling that adds or splits a step is booked as the `spec` skill's "Steps / A ruling" says: the new line in the step list ends with `(ruling <name>)`, naming the ruling's line in the Rulings section.
- A stop is repeated in every report until the user has ruled.
- The stop message is plain text in the report: an open item with its options inside the written rules, the pros and cons of each, and one recommendation with its reasons.
  - It never goes through a question-box or multiple-choice tool.
  - Each option states in full every approval it would need later whose content exists when the option is written, such as what a new script computes or a change to the configuration or the verification list; the user's ruling on the item then approves them too, with no second stop.
  - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, and the approval stop of a skill the option runs, such as `/roadmap`'s shown diff, stay stops of their own, and the option names each of them.
- A pause the user asks for holds until they lift it.
[exit 0]

$ sed -n 218,230p skills/spec/SKILL.md
   - the step's text in `plan.md` is rewritten to what was ruled;
   - a step the ruling adds or splits gets its own line in the step list, ending with `(ruling <name>)`, and its own Step 0, its carried premises with it;
   - a ruling that adds or splits a step is also written in the Rulings section as a line ending with "(the user).";
   - for such a ruling, the step's tag names the Rulings line as "What it reads" 4 reads it: `<L>` for a line `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, and the text before its first ` (` for any other line;
   - a ruling that sets a public shape, a vocabulary, a rule or a library choice is also written where the plan keeps its rulings, so later premise checks and the library search of Steps 3 read it;
   - a ruling that answers a rule clash with a new ADR, raised by `/spec` or by `/refute`, is carried out before the step goes on:
     - the session writes the new record, numbered after the folder's highest, in the form of the folder's `template.md` or, with none, of its latest record, with status `proposed`;
     - its decision is the ruled option in the open item's words, its context the facts the open item gives, its alternatives rejected the old record's decision and each other option with the con the open item gave it, and its consequences what the open item says follows;
     - the old record is marked superseded in the words the folder uses (`superseded by NNNN` under the template), and the new record gets its row in the folder's index when there is one;
     - the session shows the user the new record and commits these files by path at once, a resume point, so that `/spec` or `/land` in any session reads them;
   - the ledger files are written and not committed on their own: the next `/spec` carries them in its preparation commit (Steps 6).
3. Then `/spec <entry> <step>` is typed again. It rechecks every premise against the tree, the ruled text included, and writes the brief.
   - A step whose brief check has run is not checked again (Steps 5).
[exit 0]

$ sed -n 75p skills/ordo-help/SKILL.md
"Ruled: ..."                  you type the ruling as plain text; the session books it in the ledger, and the next /spec commits it
[exit 0]
```

Before: `plan-orchestration` line 304 and `spec` line 200 say the approval stop of a skill an option runs stays a stop of its own, which is the sentence the case says no text may keep; `--ruling` is in none of the three files. "Steps / A ruling" 2 is a list of semicolon-ended bullets (lines 218 to 226 above) and 3 is the line that types `/spec` again. The texts of items 5 to 7 replace the sentence and add the ruling's booking and the run with `--ruling`, in the places the case names. Result: as the brief says.

### R3, `/roadmap` under a quoted ruling

```
$ sed -n 14,22p skills/roadmap/SKILL.md
```
/roadmap                                  the open entries in order: status, what each waits on, the plan open for it, the next one; then the entries not yet specified
/roadmap add <goal>                       drafts an entry and its place in the order, writes it after approval
/roadmap add <entry>                      for an entry under "Not yet specified": drafts its gate and its place in the order, writes it after approval
/roadmap move <entry> before|after <entry>
/roadmap done <entry>                     marks it done with the gate's output; the closing step of a plan uses it
/roadmap drop <entry> <reason>
/roadmap <project> ...                    the same, for one project of a plan.yaml in the projects: form
```
[exit 0]

$ sed -n 36,50p skills/roadmap/SKILL.md
   - No file, and a required key missing, are refusals ("Stops").
2. The roadmap file, whole, and every file its introduction links as part of the roadmap.
3. The ledger folders under `<ledger_root>/` and `<archive_root>/`, for the plan each entry has: a folder whose `plan.md` opens with `# Plan: <entry>`.
4. The verification page, for the commands a gate can name.
5. The rules file `rules:` names, for its rule on secrets in quoted command output, which `done` applies to the gate's output.

## Steps

1. Read the file's format, as "The format is the file's" says, and whether a capability map sits beside it ("A capability map beside the ordered file").
   - The plain `/roadmap` then runs "Steps / Show" and ends there: it changes nothing and shows nothing for approval.
2. For `add`, `move`, `done` and `drop` only, draft the change by the command's subsection below.
   - Nothing is written yet.
3. Show each change as a diff of the roadmap file, and of the system file for a map, and for `add` the gate's answer with its reason (Steps / add 6).
4. Write the change once the user approves or corrects it ("Stops").
5. Commit the files by explicit path list, one commit per change, the subject naming the entry and what changed.
[exit 0]

$ sed -n 67,70p skills/roadmap/SKILL.md
3. Ask of the drafted gate "could this pass without the goal being reached?" and write the answer with its reason in the draft that Steps / add 6 shows, never in the roadmap entry.
   - A gate that could (a file that exists without saying what the goal asks, a command that exits 0 on an empty result, a count with no content behind it) is redrafted and asked again, at most twice.
   - A goal whose gate could still pass after the second redraft is a goal whose gate cannot be named (Steps / add 2).
   - The step is done when the gate's answer is no and the answer with its reason stands in the draft.
[exit 0]

$ sed -n 103p skills/roadmap/SKILL.md; sed -n 107p skills/roadmap/SKILL.md; sed -n 117,118p skills/roadmap/SKILL.md
  - A goal that does not settle it is a stop ("Stops").
- **No insertion form yet.** A stop ("Stops").
- `add` also finds the capability the entry builds in its system file.
- A capability that is not there yet is drafted in that file, in its format, with every scope item open.
[exit 0]

$ sed -n 128,134p skills/roadmap/SKILL.md
| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The change | Every change of `add`, `move`, `done` or `drop`, at Steps 3 | What Steps 3 shows | The user's approval or correction |
| No gate | The goal's gate cannot be named | What is missing, and the two options: name the gate, or put the entry under "Not yet specified" with what must be known before its gate can be named | The user's gate, or the user's approval of the entry under "Not yet specified" |
| The level | Entries exist at two levels and the goal does not settle which | The two levels | The user's choice |
| The insertion form | The file has no insertion form yet | The question, once | The user's answer, used from then on |
| A missing dependency | The draft finds a dependency the roadmap does not hold | The dependency, as a question in the draft, not added as an entry | The user's answer |
[exit 0]
```

Before: Steps 4 (line 49) writes once the user approves, with no sub-bullet and no ruling; add 3 (lines 67 to 70) asks the gate question and stops the goal whose gate could still pass; "No gate" is raised for it; the Stops row "The change" fires for every change. Read against the brief's item 8: the ruled wording is kept by Steps 2, add 3 keeps a ruled gate that could pass and leaves Steps 4's stop, "No gate" is not raised for it, the place after what the entry waits on is add 5's own, the capability's draft is part of the ruled text or the draft differs. Result: as the brief says.

### R4, the cases with no ruling and the cases that are a ruling

```
$ grep -n -e '(the user)' skills/spec/SKILL.md
44:   - Each ruling a tag names is a line of the Rulings section that ends with "(the user)", named as the tag reads it: `<L>` for a line `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, and the text before its first ` (` for any other line.
220:   - a ruling that adds or splits a step is also written in the Rulings section as a line ending with "(the user).";
[exit 0]

$ grep -rn -e 'rulings file' skills/roadmap/SKILL.md skills/plan/SKILL.md skills/ordo-init/SKILL.md skills/repo-setup/SKILL.md
skills/plan/SKILL.md:40:4. The rulings file `<ledger_root>/rulings/<slug>.md`, the slug as Steps 1 derives it, when it exists: the user's settled design answers for the entry, written while no plan was open.
skills/plan/SKILL.md:52:   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) is copied into the Rulings section as it stands, in its order, in place of the template's placeholder line; the file's other lines, such as a heading or a blank line, are not copied. Any other line, such as a wrapped continuation or an indented sub-bullet, is shown with the draft at Steps 3; the user places it, and a line the user leaves unplaced is copied below the bullet line it follows, as it stands, so nothing of the file is lost when Steps 6 removes it.
skills/plan/SKILL.md:64:   - With the draft, show each line of the rulings file that Steps 2 did not copy as a bullet line, for the user to place.
skills/plan/SKILL.md:79:   - The commit also removes the rulings file copied at Steps 2: when the last commit holds it (`git cat-file -e HEAD:<path>` exits 0), `git rm -q -f -- <path>`, and its path named in the commit with the others; otherwise, `git rm -q -f --cached -- <path>` when git lists it as staged, and the file deleted before the commit, its path not named. The `-f` removes a copy with uncommitted changes, whose bullet lines Steps 2 has already copied.
skills/plan/SKILL.md:85:| The drafted step list | Every plan, after Steps 2: the skill does the mechanical half of opening a plan and stops at the design half | The drafted `plan.md`: the goal, the gate, the steps and each step's check, and in "## Gate" the answer to "could this pass without the goal being reached?" with its reason for the gate and for each step's check, and the design decisions no ADR in force or ruling settles and the rulings file's lines left to place (Steps 3) | The user's approval or correction |
skills/plan/SKILL.md:90:| The plan exists | The ledger folder is already there: a plan is opened once | The folder, and the entry's rulings file when one is still there, for the user to remove | Nothing |
[exit 0]
```

Before: no skill reads `--ruling`; "What it reads" 4 of `spec` (line 44) is the one place that says how a ruling line is named (`<L>` for an open-item line, the text before the first ` (` for another); `rulings file` is named only in `plan` among the four skills searched. The shared item of the brief (fourteen lines) gives each case its sentence: the no-ruling list (file absent, not a plan or rulings file, name absent, name twice, the placeholder `<L>`, `--ruling` not followed by the file and the name as the last two arguments, a bullet ending "(decided by the orchestrator)") and, by omission from it, the four cases that are a ruling. Result: as the brief says.

### R5, `/plan` under a quoted ruling

```
$ sed -n 49,61p skills/plan/SKILL.md
2. Draft `plan.md` from `templates/plan.md`.
   - It opens with `# Plan: <entry>`, which is how every other skill finds it.
   - The entry's goal and its gate are copied in.
   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) is copied into the Rulings section as it stands, in its order, in place of the template's placeholder line; the file's other lines, such as a heading or a blank line, are not copied. Any other line, such as a wrapped continuation or an indented sub-bullet, is shown with the draft at Steps 3; the user places it, and a line the user leaves unplaced is copied below the bullet line it follows, as it stands, so nothing of the file is lost when Steps 6 removes it.
   - The session asks of the copied gate "could this pass without the goal being reached?" and writes the answer with its reason in the section "## Gate", on the line the template gives the gate.
   - A copied gate that could pass without the goal is kept as the roadmap has it, and its answer and reason go to the user at Steps 3, since the gate is the roadmap's and the user's.
   - The step list is drafted from the gate, one step per verifiable piece of it, each with the check that proves it.
   - The session asks the same question of each step's check, "the goal" there being the part of the goal the step delivers, and writes the answer with its reason in "## Gate", one line per step, as the template gives it.
   - The answer stands only in "## Gate", and each step line keeps the shape the template gives it.
   - A step's check that could pass without the goal (such as the forms the `roadmap` skill's "Steps / add" 3 names) is redrafted and asked again, at most twice, before the draft is shown.
   - A check that could still pass after the second redraft is kept as drafted, and its answer and reason go to the user at Steps 3.
   - The last step is the closing: the roadmap entry ticked with the gate's output (`/roadmap done <entry>`), and the ledger folder moved to `<archive_root>/`.
   - `/plan` writes the closing step itself, at the end of the drafted list.
[exit 0]

$ sed -n 62,67p skills/plan/SKILL.md
3. Show the draft to the user, its "## Gate" holding the answer and its reason for the gate and for each step's check (Steps 2).
   - With the draft, name each design decision the drafted steps rest on that no ADR in force and no line of the Rulings section settles: a public shape, a wire format, a config key, a vocabulary, a format or a rule the builder applies across the tree, or a library choice. The list is shown, not written into `plan.md`.
   - With the draft, show each line of the rulings file that Steps 2 did not copy as a bullet line, for the user to place.
   - `/grill <entry>` settles such decisions before the plan opens. It is not required: the user may approve the list with them unsettled.
   - Write `plan.md` once the user has approved or corrected it.
   - Each step line of the approved list ends with `(approved)`, the authority "Rules" describes.
[exit 0]

$ sed -n 77,79p skills/plan/SKILL.md
6. Commit `plan.md`, `orchestrator-state.md` and the two `.gitkeep` files by path as the plan's opening commit.
   - Its subject holds the roadmap entry's number.
   - The commit also removes the rulings file copied at Steps 2: when the last commit holds it (`git cat-file -e HEAD:<path>` exits 0), `git rm -q -f -- <path>`, and its path named in the commit with the others; otherwise, `git rm -q -f --cached -- <path>` when git lists it as staged, and the file deleted before the commit, its path not named. The `-f` removes a copy with uncommitted changes, whose bullet lines Steps 2 has already copied.
[exit 0]

$ sed -n 85,86p skills/plan/SKILL.md
| The drafted step list | Every plan, after Steps 2: the skill does the mechanical half of opening a plan and stops at the design half | The drafted `plan.md`: the goal, the gate, the steps and each step's check, and in "## Gate" the answer to "could this pass without the goal being reached?" with its reason for the gate and for each step's check, and the design decisions no ADR in force or ruling settles and the rulings file's lines left to place (Steps 3) | The user's approval or correction |
| No configuration | `.agents/plan.yaml` is missing: no file, no run | That the file is missing, and `/ordo-init`, which writes it | `/ordo-init`, then `/plan` again |
[exit 0]
```

Before: Steps 2 copies a bullet line of the rulings file and shows an indented sub-bullet for the user to place (line 52); Steps 3 shows the draft and writes `plan.md` once the user approves (line 66), then tags each step `(approved)`; Steps 6 commits and removes the rulings file; the row "The drafted step list" fires every plan. Read against the brief's item 9: a quoted ruling in the rulings file is copied whole, leaving no line to place; the four things of Steps 3 (steps and checks are the ruling's, every answer of "## Gate" is no, no decision unsettled, no line left to place) are the conditions of writing without the stop; a ruled list that ends with a closing step drops it for the one `/plan` writes. Result: as the brief says.

### R6, `/ordo-init` alone and the check of an existing file

```
$ sed -n 14,16p skills/ordo-init/SKILL.md
```
/ordo-init     draft .agents/plan.yaml and the pages it lacks for approval, or check the .agents/plan.yaml that is there
```
[exit 0]

$ sed -n 28,33p skills/ordo-init/SKILL.md
1. The plan skill's `templates/plan.yaml` (one project) and `templates/plan.projects.yaml` (several), in the `plan` folder beside this skill's folder: the keys, which are required, each optional key's default, and the comment that says what the key is.
2. `.agents/plan.yaml`, when it exists.
   - Then the skill checks instead of drafting ("Steps / Checking an existing file").
3. The repository's commit rule: the answer to `repo-setup`'s question 5 when `/repo-setup` runs this skill, or, when it runs alone, the user's answer at the approval stop of Steps 11.
4. The repository: `git ls-files`, the CI configuration (`.github/workflows/`, `.gitlab-ci.yml` and the like), the build and package files (`package.json` scripts, `Makefile`, `CMakeLists.txt` and `CMakePresets.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`), the documentation folders, `README.md`, `CONTRIBUTING.md`, `AGENTS.md`, `CLAUDE.md`, and `.gitignore`.
[exit 0]

$ sed -n 38,41p skills/ordo-init/SKILL.md; sed -n 46p skills/ordo-init/SKILL.md; sed -n 60,64p skills/ordo-init/SKILL.md; sed -n 79,80p skills/ordo-init/SKILL.md; sed -n 85,87p skills/ordo-init/SKILL.md
1. Choose the form.
   - A repository whose tools each have their own build file and their own documentation under separate directories (`tools/<name>/`, `packages/<name>/`) is drafted in the `projects:` form, one project per directory, named by the directory and with `worktree_paths` set to it.
   - Otherwise the one-project form.
   - The draft says which form and why.
   - Several candidates are a stop ("Stops").
6. Ask the user for the keys the repository cannot give ("Stops").
   - `worker` and `reviewer` are asked with the example's value as the offered answer.
   - `libraries` is asked with its two values and what each means, and with no offered answer, since the example's value is only an example.
   - `check` means `/spec` looks for a library for every capability a step builds before it writes the brief.
   - `avoid` means a step adds no new dependency.
10. Show, in this order: the form and why; the draft `.agents/plan.yaml` in full; each page it would create, in full, with the commands' results for a verification page; the `.gitignore` changes, as Rules 5 says; and, when the skill runs alone, the question whether it may commit.
11. Stop for the approval ("Stops").
14. Commit the files written by explicit path list, in one commit whose subject names the plan configuration.
    - The commit is made only when the repository's commit rule ("What it reads" 3) allows it.
    - Otherwise the skill stops ("Stops"), except under `/repo-setup`, where the setup goes on and `repo-setup`'s Steps 12 raises the one stop.
[exit 0]

$ sed -n 95,97p skills/ordo-init/SKILL.md
4. For each error, propose the fix ("Stops").
5. Make each fix the user approved.
6. After the fixes, run the check again.
[exit 0]

$ sed -n 101,108p skills/ordo-init/SKILL.md
| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The draft | Every setup, at Steps 11 | What Steps 10 lists | The user's approval or correction, and, when the skill runs alone, the answer to the commit question |
| Several roadmaps | More than one roadmap candidate | The candidates | The user's pick |
| Worker, reviewer and libraries | Every setup, at Steps 6 | The offered answer for `worker` and `reviewer`, and the two values of `libraries` with what each means, as Steps 6 names them | The user's answers |
| A failing command | A command meant for the verification page fails its one run | What Steps 3 shows beside it | The user's decision |
| A fix in the check | The check reports an error in an existing file | The error and the proposed fix | The user's approval |
| No commit allowed | The repository's commit rule does not allow the commit, at Steps 14, when the skill runs alone | The files written, and the command that shows them (`git status --short`) | The user's commit |
[exit 0]

$ sed -n 119p skills/ordo-init/SKILL.md; sed -n 124p skills/ordo-init/SKILL.md
- The skill writes nothing until the user approves or corrects the draft. The one exception is Steps 3, where each verification command runs once before the draft is shown.
- A change to an existing file, `.gitignore` included, is shown as a diff and made after approval.
[exit 0]
```

Before: Steps 11 (line 80) stops every setup; the commit rule ("What it reads" 3) is the user's answer at that stop; a fix of the check (Steps 4 to 6 of the subsection) is proposed and made after approval; Rules 1 and 5 say nothing is written and an existing file is changed only after approval. Read against the brief's item 10: the draft takes the ruling's form, keys, `.gitignore` change and page texts; the commit question is left out when the ruling states the commit rule and asked alone when it does not; a page the ruling leaves out shows the draft whole and nothing is written; a rule that forbids the commit reaches "No commit allowed", which names the ruling; Rules 1 and 5 carry the sub-bullet that a quoted ruling is the approval. Result: as the brief says.

### R7, `/repo-setup` under a quoted ruling

```
$ sed -n 14,18p skills/repo-setup/SKILL.md
```
/repo-setup [<path>]          a new repository at <path> (default: the current folder, which must hold no tracked file)
/repo-setup sync [<path>]     an existing repository: its shared-rules block and its glossary's plan-terms block against their templates
```
[exit 0]

$ sed -n 32,34p skills/repo-setup/SKILL.md; sed -n 40p skills/repo-setup/SKILL.md; sed -n 48p skills/repo-setup/SKILL.md; sed -n 58p skills/repo-setup/SKILL.md
   - Files under `.git/` are left out.
4. The `ordo-init` and `roadmap` skills beside this skill's folder: `/ordo-init`, the `ordo-init` skill's `templates/check_config.py`, and the `roadmap` skill's `templates/roadmap.md`.
5. For `sync`, the repository's `CLAUDE.md` and `docs/glossary.md`, through `templates/sync_rules.py`, and the rules of its `CLAUDE.md` and the entries of its `docs/glossary.md` for the exit-2 draft.
2. Ask "The questions", together, in plain prose, each with its default in brackets ("Stops").
     - A placeholder none of these fills is listed with the draft at Steps 4, and the user gives its value.
4. Show the draft, the tree and every file's text, the copied hook named by its source, together ("Stops").
[exit 0]

$ sed -n 157,168p skills/repo-setup/SKILL.md
| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| The questions | Every setup, at Steps 2 | The ten questions, each with its default | The user's answers |
| The draft | Every setup, at Steps 4 | The tree, every file's text with the copied hook named by its source, and the placeholders that Steps 3 lists for the user's value | The user's approval or correction |
| A hunk to rule on | `sync` exits 1 | The diff | The user's ruling per hunk |
| The drafted sync change | `sync` exits 2 with an `error:` line of Steps / sync 4, for the shared-rules block or the plan-terms block | The change Steps / sync 4 drafts | The user's approval |
| A file sync cannot use | `sync` exits 2 with one of the `error:` lines of Steps / sync 7 | The `error:` line and the file it names | The file fixed, then the check again (Steps / sync 8) |
| The check still fails | The check run again after the change does not exit 0 on its second run (Steps / sync 8) | The check's output | The user's decision, then `/repo-setup sync` again |
| No commit allowed | The repository's commit rule (the answer to question 5 in a setup) does not allow the commit, at Steps 12 or Steps / sync 9 | The files changed, and the command that shows them (`git status --short`) | The user's commit |
| Tracked files | The folder for a new repository holds tracked files | A refusal that names `/repo-setup sync` and `/ordo-init` | One of those, or a folder with no tracked file |

- The first seven rows are stops: each waits on the user.
[exit 0]

$ sed -n 183p skills/repo-setup/SKILL.md; find skills/repo-setup/templates -maxdepth 1 -name 'README*'
- In a setup, after Steps 1, nothing is written until the user approves or corrects the draft (Steps 4).
[exit 0]
```

Before: Steps 2 asks all ten questions together; Steps 4 shows the draft and stops; the row "The draft" fires every setup; `/ordo-init` is run by Steps 8 with its own draft and approval; no template is a `README.md`. Read against the brief's item 11: a ruling that answers the ten questions, states the three keys and holds every file's text drafts without a question and without the Steps 4 stop, and runs `/ordo-init` with the same arguments; a build file, a `README.md` the ruling does not hold or a placeholder Steps 3 lists is a file named with the draft shown whole; eight answered questions leave two asked together. Result: as the brief says. The Rules bullet the brief places at "line 181" in item 11 is at line 183 (part 11).

### R8, `/repo-setup sync` under a quoted ruling

```
$ sed -n 94,110p skills/repo-setup/SKILL.md
3. Exit 1: a block differs; show the diff of each block that differs, for the user's ruling per hunk ("Stops").
   - The template's text goes into the repository: `--write`, after the approval.
   - Or the repository's text is the wording wanted everywhere: the change goes into `templates/shared-rules.md` or `templates/plan-terms.md` in this skill's folder, after which every repository set up from it differs until it is synced.
4. Exit 2 with `error: CLAUDE.md has no single shared-rules block` or `error: docs/glossary.md has no single plan-terms block`: draft the change for each block the lines name.
   - The shared-rules block inserted after the opening paragraph of `CLAUDE.md`.
   - Each rule of the existing `CLAUDE.md` that the block now states, listed for removal with the block rule that replaces it.
   - A rule that differs in substance, kept in Project rules and named.
   - With no `docs/glossary.md`, the file written from `templates/docs/glossary.md`, its plan-terms block filled from `templates/plan-terms.md`.
   - With a `docs/glossary.md` that has no single block, the plan-terms block inserted after its opening paragraph, and each existing entry that the block now defines listed for removal.
5. Show the drafted change ("Stops").
6. Write it once the user approves.
7. Exit 2 with any other `error:` line (`no CLAUDE.md in`, `is not UTF-8`, `cannot read`, `cannot write`, `does not read back as written`): draft nothing for the file that line names. A no-single-block line of the same run is still drafted, as step 4 says.
   - Show the line with the file it names ("Stops").
   - The file named in the line is fixed first, by the user or with the user's approval.
8. After a written draft or a fixed file: run the check again, at most twice, following steps 2 to 7 on its exit status each time.
   - A check that does not exit 0 on the second of those runs is a stop ("Stops").
9. After exit 1 or exit 2: commit the change by explicit path list when the repository's commit rule allows it; otherwise stop ("Stops").
[exit 0]
```

Before: sync 3 shows the diff of each differing block for the user's ruling per hunk, sync 5 shows the drafted change and sync 6 writes once the user approves. Read against the brief's item 11 sub-bullets of sync 3 and 5: a ruling whose hunks are the diff's applies without the stop, a hunk the ruling does not hold or a ruled hunk the diff does not show gives the diff whole, and a drafted exit-2 change equal to the ruling's text is written. Result: as the brief says.

### R9, `/grill` under a quoted ruling

```
$ sed -n 163,168p skills/grill/SKILL.md; sed -n 177,182p skills/grill/SKILL.md
1. Write the ruling for every settled answer, the roadmap diff, "record as ADR?", rule-clash and term decisions included.
   - It goes to the `## Rulings` section of the open plan's `plan.md`, or else to the rulings file, created with the heading line `# Rulings: <entry>` when it is absent.
   - It is one bullet: `- D<n> <the decision, as a phrase> (<date>): <the answer in one line> (the user).`
   - The phrase makes a step's `(ruling <name>)` tag name the decision as `D<n> <the decision, as a phrase>`.
   - A library pick names the capability in the phrase.
   - The item is done when the file, read back, holds the bullet whole.
3. Draft the change to the roadmap entry.
   - An answer that changes the entry's goal, gate or text is drafted into the entry in the file's own format and under the `roadmap` skill's Rules: the goal, the gate and the dependencies only, nothing the user did not ask for, no history, another repository only as a path.
   - A changed gate is asked "could this pass without the goal being reached?", as the `roadmap` skill's "Steps / add" 3 says, and the answer with its reason goes in the diff and never in the entry.
   - The draft is shown as a diff in the next round, as a decision of its own, and written on the user's yes.
   - An entry under "Not yet specified" is not moved and has no gate drafted into it, since such an entry states its goal and what must be known and no gate: a changed goal or "what must be known" is drafted into it as above, and the settled gate is its Rulings bullet of item 1, which the end prints (Steps 10).
   - The item is done when the diff is a decision of the next round, or, after the yes, the entry read back holds the change.
[exit 0]

$ sed -n 226p skills/grill/SKILL.md; sed -n 247p skills/grill/SKILL.md
| A round | Every round, at Steps 6, the roadmap diff and "record as ADR?" decisions riding in it | The frontier as decisions in the decision form, and the answer form | The user's answers |
- A decision is the user's: nothing is written as settled without the user's answer.
[exit 0]
```

Before: a roadmap diff is drafted at item 3 of "Writing what settled" and shown in the next round as a decision of its own, written on the user's yes; item 1 writes a Rulings bullet for every settled answer, the roadmap diff included; the row "A round" carries the diff and the ADR decisions; the Rules bullet says nothing is written as settled without the user's answer. Read against the brief's item 12: a diff that is the ruled text is written at the first write of Steps 8 with no decision and no bullet, a ruled gate that could pass is shown as the decision, and the row and the Rules sub-bullet agree. Result: as the brief says.

### R10, no sentence elsewhere is made false

```
$ git grep -n -i 'approv' HEAD -- skills docs utils README.md | wc -l
     109
[exit 0]

$ git grep -n -i 'every run\|each time' HEAD -- README.md docs skills utils | wc -l
      33
[exit 0]

$ git grep -n -i 'stops of their own\|second stop' HEAD -- skills docs README.md utils
HEAD:skills/plan-orchestration/SKILL.md:303:  - Each option states in full every approval it would need later whose content exists when the option is written, such as what a new script computes or a change to the configuration or the verification list; the user's ruling on the item then approves them too, with no second stop.
HEAD:skills/plan-orchestration/SKILL.md:304:  - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, and the approval stop of a skill the option runs, such as `/roadmap`'s shown diff, stay stops of their own, and the option names each of them.
HEAD:skills/spec/SKILL.md:200:     - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, and the approval stop of a skill the option runs, such as `/roadmap`'s shown diff, stay stops of their own, and the option names each of them.
[exit 0]

$ sed -n '113p;117p;124p' README.md
A new repository is set up with `/repo-setup` from an empty folder. It asks for the name, the kind, the license, the commit rule, the standards pages, whether the repository has a user interface, the project skills, and whether to install the git guard. It then shows the whole tree and every file's text, the git guard hook named by its source. After your approval it writes `CLAUDE.md`, the change and prose standards, the standards pages (by default the design principles, the coding standards for its languages and, with a user interface, the UI standard), a roadmap, a glossary, an ADR folder, `.gitignore`, `LICENSE` and `README.md`. On yes to the git guard, it also copies the guard into `.claude/hooks/`, which stays in the clone. It then installs the project skills, which writes `skills-lock.json`, and runs `/ordo-init`. After `/ordo-init` and the checks it prints the guard's settings text for you to add; it writes no settings file.
`/repo-setup sync` compares both blocks with their templates, shows the diff of each block that differs and rewrites it after approval. On a repository with no block yet, it drafts where the block goes and which existing rules or glossary entries it replaces. The same comparison runs on its own (`<skills>` is `~/.claude/skills`, or `skills/` in a clone), and `--only glossary` compares the plan-terms block alone, for a repository whose `CLAUDE.md` has no shared-rules block:
An existing repository opts in with `.agents/plan.yaml` at its root. Run `/ordo-init` from the repository root. It drafts the file from the repository and shows it, with any page it would create and the `.gitignore` lines it would add. It writes after you approve.
[exit 0]
```

Before: 109, 33 and 3 hits. The third grep's hits are the `plan-orchestration` Stops sentence (lines 303 and 304) and the `spec` sentence (line 200) that the brief's items 5 and 7 replace. Every hit outside the changed lines is listed with its reason after the change, in part 4. Result: the brief's premise (the sentences that say a skill writes after the user's approval stay, since a quoted ruling is that approval) is what each reason in part 4 uses.

### R11, every added text against the layout and the prose standard

```
$ grep -n '^## ' docs/dev/skill-layout.md
5:## Frontmatter
24:## Sections, in order
40:## Where a rule goes
47:## Lists and tables
56:## Writing for an agent
70:## Paths and names
78:## A rewrite of a skill
83:## Anti-patterns
[exit 0]

$ wc -l docs/dev/skill-layout.md skills/repo-setup/templates/docs/dev/prose-standard.md
      92 docs/dev/skill-layout.md
      75 skills/repo-setup/templates/docs/dev/prose-standard.md
     167 total
[exit 0]
```

Read in full before the change: `docs/dev/skill-layout.md` (92 lines: Frontmatter, Sections in order, Where a rule goes, Lists and tables, Writing for an agent, Paths and names, A rewrite of a skill, Anti-patterns) and the prose standard (75 lines). The after is read at check 6 and check 9 (parts 5 and 7). Result: as the brief says.

### R12, the figures

```
$ grep -c 'quoted ruling' docs/figures/pipeline.svg docs/figures/plan-loop.svg
docs/figures/pipeline.svg:0
docs/figures/plan-loop.svg:0
[exit 1]

$ grep -o 'viewBox="0 0 1040 [0-9]*"' docs/figures/pipeline.svg docs/figures/plan-loop.svg
docs/figures/pipeline.svg:viewBox="0 0 1040 966"
docs/figures/plan-loop.svg:viewBox="0 0 1040 889"
[exit 0]

$ sed -n 372,390p docs/figures/gen_figures.py
def draw_note(canvas: Canvas, x: float, y: float, label: str, width: float) -> None:
    _check_line(canvas.name, "a note", label, width, NAME_SIZE)
    canvas.text(x, y, label, NAME_SIZE, MUTED)


def draw_legend(canvas: Canvas, x: float, y: float, width: float) -> None:
    """The three marks and the dashed box, each with what it says, on one row."""
    draw_caption(canvas, x, y, "HOW TO READ THE MARKS", width)
    items = (
        (EVERY_RUN, "it waits on you each time it runs"),
        (ONLY_WHEN, "it waits on you in the named case"),
        (OPTIONAL, "you may skip it; the box is dashed"),
    )
    step = width / len(items)
    for index, (mark, meaning) in enumerate(items):
        left = x + index * step
        badge = draw_badge(canvas, left, y + 26, mark)
        _check_line(canvas.name, "the legend", meaning, step - badge - 22, NAME_SIZE)
        canvas.text(left + badge + 8, y + 26, meaning, NAME_SIZE)
[exit 0]

$ grep -n -e 'side_top + side_h + ' -e 'band_y + band_h + ' docs/figures/gen_figures.py
410:        side_top + side_h + 68,
546:    draw_legend(canvas, 25, side_top + side_h + 26, 990)
559:        band_y + band_h + 81,
705:    draw_legend(canvas, 25, band_y + band_h + 24, 990)
[exit 0]
```

Before: neither SVG holds "quoted ruling"; the viewBoxes are 966 and 889 high; `draw_legend` (lines 377 to 390) draws the caption and three marks on one row, `draw_note` (line 372) draws one line checked against a width; the heights are at lines 410 and 559. The brief's item 4 adds the note under the legend and raises both heights by 22; the brief records that it tried this on a scratch copy. Result: as the brief says.

## 4. The walks of R2 to R9 after the change

Each step names the sentence the skill follows, with the line as `grep -n -F` prints it in the changed file; a string that matched other than one line would have stopped the script that prints it. The result of each scenario is the last list of each walk.

### R2, the orchestrator's side and a session run by hand

1. In `plan-orchestration` "Stops", an option that runs `/roadmap add` (one of the five skills) states the entry in full, as `roadmap`'s text says a quoted ruling must state it:

       306:  - An option that runs a skill with an approval stop (`/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill`) states the change in full, as that skill's text says a quoted ruling must state it, or names that skill's approval stop as a stop of its own.

2. The same rule in `spec` "Steps / A stop" 1, for a session run by hand:

       202:     - An option that runs a skill with an approval stop states the change in full, or names that stop as a stop of its own, as `plan-orchestration`'s "Stops" says.

3. The user rules. The session books the ruling as `spec` "Steps / A ruling" 2 says, first as a Rulings bullet whose first line ends with "(the user).":

       225:   - a ruling on an option that runs a skill with an approval stop and states the change in full is written in the Rulings section as a bullet whose first line ends with "(the user).";

4. That bullet is the quoted ruling:

       226:   - that bullet is the quoted ruling the session gives the skill;

5. The change the option stated goes under it as sub-bullets. A page of several lines is a fenced block indented with its sub-bullet, and a page that holds a fence of its own gets a longer fence:

       227:   - the change the option stated is copied under that bullet as sub-bullets, a text of several lines as a fenced block indented with its sub-bullet, its fence longer than any fence inside the text;

6. The name the session passes is the bullet's text before its first ` (`, as "What it reads" 4 reads it:

       44:   - Each ruling a tag names is a line of the Rulings section that ends with "(the user)", named as the tag reads it: `<L>` for a line `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, and the text before its first ` (` for any other line.

7. The orchestrator books the ruling and runs the skill with the arguments:

       307:  - After the user's ruling on an option that states the change, the session books the ruling as the `spec` skill's "Steps / A ruling" says.

       308:  - It then runs the skill with `--ruling <ledger file> "<name>"`.

8. The skill is invoked through the runner, as "Rules" says:

       340:- Every skill the loop invokes (`/spec`, `/refute`, `/land`, `academic-paper` for manuscript content, `/roadmap` at the closing, and `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill` run under a quoted ruling) is invoked through the runner every time, after a compaction too, and never carried out from remembered text.

9. Run by hand, the session finds the same in `spec` "Steps / A ruling" 3:

       237:   - After a ruling on an option that runs a skill and states the change in full, that skill is run first, with `--ruling <ledger file> "<name>"`.

10. and in `ordo-help`'s sequence:

       76:                              after a ruling on an option that runs a skill and states the change, that skill is run with --ruling <ledger file> "<name>" before /spec is typed again

11. What still stays a stop of its own is the reading of a page a step will write:

       304:  - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own.

12. and the option names it:

       305:  - The option names that stop.

Scenarios:

- An option that runs `/roadmap add` and states the entry in full: steps 1, 3, 4, 5 and 7 give a Rulings bullet with the entry as sub-bullets and the run `/roadmap add ... --ruling <ledger file> "<name>"`. Result: as the brief says.
- A page of several lines: step 5 gives it as a fenced block under its sub-bullet. A page that holds a fenced block of its own: step 5 requires a fence longer than the inner one. Result: as the brief says.
- A session run by hand: steps 2, 3, 9 and 10 give the same booking and the same run. Result: as the brief says.
- No sentence of either skill says the approval stop of a skill an option runs always stays: `git grep -n 'stay stops of their own' -- skills docs` prints nothing (exit 1, check 5), and steps 11 and 12 show what remains a stop of its own.

### R3, `/roadmap add`, `move`, `done` and `drop` under a quoted ruling

1. The invocation is recognised:

       22:/roadmap <command> ... --ruling <ledger file> "<name>"   add, move, done or drop under a quoted ruling: a draft that is the ruled change is written without the stop

2. The item that reads the ruling:

       42:6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.

3. The ruling counts only under these cases, read from the list "There is no ruling in any of these cases":

       49:   - There is no ruling in any of these cases.

4. Steps 2 drafts from the ruling's text:

       63:   - Under a quoted ruling ("What it reads" 6), the draft takes the ruling's text.

5. For `add` that text is the whole entry:

       64:   - For `add` that text is the entry's title, goal, gate, level, number, what it waits on and its place, with the capability's draft where the roadmap has a capability map.

6. For `move`, `done` and `drop` it is the change stated:

       65:   - For `move`, `done` and `drop` it is the change the ruling states.

7. Each item of the command's subsection is worked on that draft:

       66:   - Each item of the command's subsection is then worked on that draft.

8. A ruled part is replaced only where a rule of the skill gives another result:

       67:   - An item replaces ruled text only where a rule of this skill gives another result, such as a place, a number, a level or the file's form.

9. The ruled wording is kept:

       68:   - The ruled wording of the title, the goal, the gate and what it waits on is kept.

10. add 3 does not redraft the ruled gate:

       98:   - Under a quoted ruling the ruled gate is not redrafted.

11. A ruled gate that could pass keeps the stop of Steps 4 and "No gate" is not raised:

       100:   - A ruled gate that could pass without the goal keeps the stop of Steps 4.

       101:   - The stop "No gate" is not raised for it.

12. add 5 gives the place by the skill's own rule:

       105:5. Draft the place: after everything it waits on and before the entries that will depend on it, with that reason written out.

13. A capability map: `add` drafts the capability in its system file:

       150:- A capability that is not there yet is drafted in that file, in its format, with every scope item open.

14. Steps 4 compares the draft, after the subsection has been worked on it, with the ruled change:

       72:   - Under a quoted ruling, compare the draft, after the command's subsection has been worked on it, with the change the ruling states.

15. and writes it without the stop, for `add` only when the gate's answer is no:

       73:   - A draft that is that change is written without the stop, for `add` only when the gate's answer of Steps / add 3 is no.

16. otherwise the draft is shown whole with each difference and the stop stands:

       74:   - A draft that differs in anything, such as a place or a number the skill's own rules give, is shown whole with each difference named, and the stop stands.

17. Steps 5 names the ruling in the commit message:

       77:   - A change written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.

18. The Stops row "The change":

       162:| The change | Every change of `add`, `move`, `done` or `drop`, at Steps 3, except a draft written under a quoted ruling as Steps 4 says | What Steps 3 shows | The user's approval or correction |

Scenarios:

- Gate that could not pass without the goal, place after what the entry waits on, all parts in the sub-bullets: steps 4 to 9 keep the ruled wording; step 10 leaves the gate; add 5 (step 12) gives the ruled place; step 14 finds the draft is the ruled change; step 15 writes it without the stop because the gate's answer is no; step 17 names the ruling in the commit message. Result: the ruled entry, no stop, the commit names the ruling.
- Gate "the file exists": add 3 answers that it could pass, and step 10 does not redraft it; step 11 keeps the stop of Steps 4 and does not raise "No gate"; step 15 writes without the stop only when the answer is no, so the change is shown and the stop of step 18 stands. Result: as the brief says.
- A place ahead of an entry it waits on: step 12 (add 5) gives another place, step 8 lets the skill's rule replace the ruled place, step 14 finds a difference, step 16 shows the draft whole with the difference and the stop stands. Result: as the brief says.
- A roadmap with a capability map, the ruling holding the capability's draft: step 5 puts the capability's draft in the ruled text and the draft equals it, so no stop (steps 14, 15). The ruling not holding it: step 13 drafts the capability in the system file, the draft has a part the ruling does not state, step 16 applies and the stop stands. Result: as the brief says.
- `move`, `done` and `drop`: step 6 takes the ruled change as the draft; steps 14 and 15 write it without the stop when the draft equals it. Result: as the brief says.

### R4, the cases with no ruling and the cases that are a ruling

1. The skill reads the arguments at the end of the invocation; `--ruling` without the file and the name as the last two arguments is no ruling, which covers `--ruling` with the file and no name and `--ruling` with a further argument after the name:

       50:     - `--ruling` is not followed by the file and the name as the last two arguments of the invocation.

2. A file that does not exist, or that is neither a plan's `plan.md` nor a rulings file, is no ruling:

       51:     - The file does not exist, or is neither of those two files.

3. A name that no bullet has, or that more than one bullet has, is no ruling:

       52:     - No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.

4. The placeholder name `<L>` is no ruling:

       53:     - The name is a placeholder in angle brackets, such as `<L>`.

5. A bullet whose first line does not end with "(the user)" is no ruling, so "(decided by the orchestrator)" is no ruling, and a bullet that ends "(the user)" with no full stop, or "(the user).", is a ruling:

       54:     - The bullet's first line does not end with "(the user)", with or without a full stop after it.

6. With no ruling the skill says which case it found and every stop stands:

       55:   - With no ruling, the skill says which of these it found, and every stop stands.

7. A name with a quotation mark is found by matching the bullet's text as written:

       46:   - It is matched against the bullet's text as written, a quotation mark in it included.

8. The name is read as a step's tag is read, so a name that also stands in a step's tag and under Step 0 names the one bullet that has it:

       45:   - The name is read as the `spec` skill's "What it reads" 4 reads a ruling's name.

9. The bullet is found by that rule in `spec`:

       44:   - Each ruling a tag names is a line of the Rulings section that ends with "(the user)", named as the tag reads it: `<L>` for a line `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, and the text before its first ` (` for any other line.

10. A quoted ruling with no sub-bullet, or whose sub-bullets state part of the change, is not the ruled change:

       47:   - A draft is the ruled change when each part of it has a sub-bullet that states it and equals that sub-bullet.

11. and the skill then shows the draft whole with the stop standing (roadmap Steps 4):

       74:   - A draft that differs in anything, such as a place or a number the skill's own rules give, is shown whole with each difference named, and the stop stands.

Scenarios:

- A file that does not exist; a file that is neither; a name the file does not hold; a name two bullets have; the name `<L>`; `--ruling` with the file and no name; `--ruling` with a further argument; a bullet ending "(decided by the orchestrator)": steps 1 to 5 each name the case, and step 6 says the skill says which one it found and every stop stands. Result: as the brief says, for each.
- A bullet ending "(the user)" with no full stop, a bullet whose name holds a quotation mark, a rulings-file bullet ending "(the user).", a name also in a step's tag and under Step 0 with one bullet of that name: steps 5, 7 and 8 leave none of the five no-ruling cases met, so each is a ruling. Result: as the brief says.
- A quoted ruling with no sub-bullet, or with sub-bullets that state part of the change: step 10 makes the draft not the ruled change; step 11 shows it whole and the stop stands. Result: as the brief says.
- The same five sentences and the closing sentence stand, each once, in `plan`, `ordo-init`, `repo-setup` and `grill` (check 2: the thirteen sub-bullets print 1 in each of the five skills).

### R5, `/plan` under a quoted ruling

1. Quick start:

       17:/plan <entry> --ruling <ledger file> "<name>"   the same, under a quoted ruling: a step list that is the ruled one is written without the stop

2. The item that reads the ruling:

       43:6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.

3. Steps 2 copies the rulings file's bullet lines:

       67:   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) is copied into the Rulings section as it stands, in its order, in place of the template's placeholder line; the file's other lines, such as a heading or a blank line, are not copied. Any other line, such as a wrapped continuation or an indented sub-bullet, is shown with the draft at Steps 3; the user places it, and a line the user leaves unplaced is copied below the bullet line it follows, as it stands, so nothing of the file is lost when Steps 6 removes it.

4. A quoted ruling in the rulings file is copied whole, none of its lines left to place:

       68:   - A quoted ruling that stands in the rulings file is copied with every line under it, its sub-bullets and their fenced blocks, and none of them is a line left to place.

5. The step list is the ruling's, each step with its check:

       72:   - Under a quoted ruling ("What it reads" 6), the step list is the ruling's, each step with its check.

6. The rest of Steps 2 is worked on that list:

       73:   - The rest of this step is worked on that list.

7. A closing step in the ruled list is dropped for the one `/plan` writes:

       74:   - A closing step in the ruled list is dropped for the one `/plan` writes.

8. Steps 2 writes the closing step itself:

       80:   - `/plan` writes the closing step itself, at the end of the drafted list.

9. Steps 3, the stop, written without it only when four things hold:

       87:   - Under a quoted ruling, the draft is written without the stop only when four things hold.

       88:     - Each step and its check are the ruling's, the closing step `/plan` writes itself left out of the comparison.

       89:     - Every answer in "## Gate" is no.

       90:     - No design decision is named as unsettled.

       91:     - No line of the rulings file is left to place.

10. Otherwise the draft is shown whole and the stop stands:

       92:   - Otherwise the draft is shown whole with what differs, what could pass without the goal and what is unsettled, and the stop stands.

11. The ruling's bullet is copied into the new Rulings once:

       93:   - The ruling's bullet and every line under it are copied into the Rulings section of a plan written under a quoted ruling, unless Steps 2 copied them from the rulings file.

12. The ruled list is the approved list, and each step line ends `(approved)`:

       94:   - A step list written under a quoted ruling is the approved list.

       95:   - Each step line of the approved list ends with `(approved)`, the authority "Rules" describes.

13. Steps 6 names the ruling in the commit message, and the new `plan.md` when the ruling came from the rulings file:

       108:   - A plan written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.

       109:   - When Steps 2 copied the ruling from the rulings file, the ledger file named is the new `plan.md`.

14. The Stops row "The drafted step list" (second cell):

       117:| The drafted step list | Every plan, after Steps 2, except a draft written under a quoted ruling as Steps 3 says: the skill does the mechanical half of opening a plan and stops at the design half | The drafted `plan.md`: the goal, the gate, the steps and each step's check, and in "## Gate" the answer to "could this pass without the goal being reached?" with its reason for the gate and for each step's check, and the design decisions no ADR in force or ruling settles and the rulings file's lines left to place (Steps 3) | The user's approval or correction |

Scenarios:

- The four things hold: steps 5 to 9 and 11 to 13 write `plan.md` with the ruled list plus the one closing step, each line ending `(approved)`, the ruling once, and the commit naming it. Result: as the brief says.
- A ruled list that already ends with a closing step: step 7 drops it for the one of step 8, so the plan has one closing step.
- A copied gate that could pass without the goal: its answer in "## Gate" is not no, the four things of step 9 fail, step 10 shows the draft whole and the stop stands. An unsettled design decision: step 9 fails the same way.
- A quoted ruling that stands in the rulings file: step 4 copies it with its sub-bullets and their fenced blocks and leaves no line to place; step 11 does not copy it a second time; step 13 names the new `plan.md`.

### R6, `/ordo-init` alone and the check of an existing file

1. Quick start:

       16:/ordo-init --ruling <ledger file> "<name>"   the same, under a quoted ruling: a draft the ruling states is written without the stop

2. The commit rule is what the ruling states, when it states one:

       33:   - When the skill runs alone under a quoted ruling that states whether it may commit, the commit rule is what the ruling states.

3. The item that reads the ruling:

       35:5. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.

4. Steps 1, the draft takes the ruling's form, keys, `.gitignore` changes and page texts:

       58:   - Under a quoted ruling ("What it reads" 5), the draft takes the ruling's form, keys, `.gitignore` changes and page texts.

5. Steps 2 to 9 replace a ruled part only where a rule of the skill gives another result:

       59:   - Steps 2 to 9 replace a ruled part only where a rule of this skill gives another result.

6. Steps 2, a stated `roadmap` key and no stop for several candidates:

       66:   - Under a quoted ruling that states `roadmap`, the key is the ruling's.

       67:   - The stop of several candidates is then not raised.

7. Steps 6, a stated key is not asked:

       83:   - A key whose value a quoted ruling states is not asked.

8. Steps 10, the commit question is left out when the ruling states the commit rule:

       105:    - The commit question is left out when a quoted ruling states whether the skill may commit.

9. Steps 11 compares the draft with the ruling:

       108:    - Under a quoted ruling, compare the draft Steps 10 shows with the ruling.

       109:    - The comparison covers the form, each key of `.agents/plan.yaml` with its value, each change to `.gitignore`, and the full text of each page to create.

10. A draft the ruling states in each of these is written without the stop:

       111:    - A draft the ruling states in each of these is written without the stop.

11. A commit question that Steps 10 shows is then asked alone:

       112:    - A commit question Steps 10 shows is then asked alone.

12. A differing draft, or a page whose text the ruling does not hold, is shown whole and nothing is written:

       113:    - A draft that differs in anything, or a page whose text the ruling does not hold, is shown whole with each difference named, and the stop stands with nothing written.

13. Steps 14 names the ruling in the commit message, or in the list of files when no commit is made:

       122:    - A setup written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.

       123:    - When no commit is made, the list of files written names the ruling the same way.

       124:    - That list is the one of the stop "No commit allowed", or under `/repo-setup` the one of `repo-setup`'s Steps 12.

14. Checking an existing file 4, a fix the ruling states is made without the stop:

       134:   - A fix a quoted ruling states is made without the stop.

15. A proposed fix that differs is shown with the difference and the stop stands:

       135:   - A fix the skill proposes that differs from the ruled fix is shown with the difference, and the stop stands.

16. Checking 6, the fix is listed with the check's output and the ruling:

       139:   - A fix made under a quoted ruling is listed with the check's output, with the ruling's name and its ledger file.

17. Stops, "The draft":

       146:| The draft | Every setup, at Steps 11, except a draft a quoted ruling states as Steps 11 says, where only a commit question the ruling leaves open is asked | What Steps 10 lists | The user's approval or correction, and, when the skill runs alone, the answer to the commit question |

18. Stops, "A fix in the check":

       150:| A fix in the check | The check reports an error in an existing file, and no quoted ruling states its fix | The error and the proposed fix | The user's approval |

19. Stops, "No commit allowed":

       151:| No commit allowed | The repository's commit rule does not allow the commit, at Steps 14, when the skill runs alone | The files written, the quoted ruling named when the setup was written under one, and the command that shows them (`git status --short`) | The user's commit |

20. Rules 1:

       163:  - A quoted ruling that states the draft is that approval.

21. Rules 5:

       169:  - Under a quoted ruling that states the change, it is made without being shown for approval, as Steps 11 and "Steps / Checking an existing file" 4 say.

Scenarios:

- A ruling that states the form, every key, the `.gitignore` change, each page's text and the commit rule: steps 4, 5, 6 and 7 give a draft the ruling states, step 8 leaves out the commit question, step 10 writes without the stop, step 13 names the ruling in the commit. Result: as the brief says.
- A ruling that states no commit rule: step 8 does not apply and the question stays, step 11 asks it alone. Result: the commit question alone, as the "The draft" cell (step 17) says.
- A ruling that leaves a page's text out: step 12 shows the draft whole, the stop stands, nothing is written, the `.gitignore` change included. Result: as the brief says.
- A repository whose commit rule forbids the commit: step 2 takes the rule from the ruling, step 13 lists the files naming the ruling, step 19 is the stop "No commit allowed". Result: as the brief says.
- Two roadmap candidates with `roadmap` stated: step 6 takes the key and raises no stop. Result: no stop.
- The check of an existing file with a stated fix: step 14 makes it without the stop and step 16 lists it after the check runs again with the ruling's name and its ledger file; a proposed fix that differs: step 15 shows it and the stop stands; an error the ruling does not state: no sentence of the skill applies the ruling, and the row of step 18 stands. Result: as the brief says.
- Rules 1 and 5 (steps 20 and 21) say a ruling that states the draft or the change is the approval, in the terms of Steps 11 and Checking 4. They agree.

### R7, `/repo-setup` under a quoted ruling

1. Quick start:

       17:/repo-setup ... --ruling <ledger file> "<name>"   either form, under a quoted ruling: a draft or a sync change the ruling states is written without the stop

2. The item that reads the ruling:

       36:6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.

3. Steps 2 does not ask a question the ruling answers, and asks the rest together:

       56:   - A question a quoted ruling answers ("What it reads" 6) is not asked.

       58:   - The questions the ruling leaves open are asked together.

4. Steps 3 drafts a file whose full text the ruling holds as that text:

       62:   - Under a quoted ruling ("What it reads" 6), a file whose full text the ruling holds is drafted as that text.

5. Steps 4, the draft is written without the stop only when four things hold:

       80:   - Under a quoted ruling, the draft is written without the stop only when four things hold.

       81:     - The ruling answers every question of "The questions".

       82:     - It states `worker`, `reviewer` and `libraries` for `/ordo-init`.

       83:     - Every file of the draft that this skill writes is a template filled from the answers, or has its full text in the ruling. The files `/ordo-init` drafts and the file the skills CLI writes are not counted.

       84:     - Steps 3 lists no placeholder for the user's value.

6. Otherwise the draft is shown whole, and the files that are neither a filled template nor held in the ruling, and each placeholder, are named:

       85:   - Otherwise the draft is shown whole, and the stop stands.

       86:   - Each file that is neither a filled template nor held in the ruling is named with the draft, such as a build file, a fetched licence text or a page adapted from a sibling repository.

       87:   - Each placeholder Steps 3 lists is named with it.

7. Steps 8 runs `/ordo-init` with the same arguments:

       96:   - Under a quoted ruling, `/ordo-init` is run with the same `--ruling` arguments.

8. `/ordo-init` counts a key it derives from the tree `/repo-setup` wrote as stated, and compares the rest:

       110:    - Under `/repo-setup`, a key this skill derives from the tree `/repo-setup` wrote counts as stated.

9. `/ordo-init` does not ask a key the ruling states (Steps 6):

       83:   - A key whose value a quoted ruling states is not asked.

10. `/ordo-init` compares the form, each key, each `.gitignore` change and each page's full text (Steps 11):

       109:    - The comparison covers the form, each key of `.agents/plan.yaml` with its value, each change to `.gitignore`, and the full text of each page to create.

11. Steps 12 names the ruling in the commit message, or in the list the stop shows:

       120:    - A setup written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.

12. Stops, "The questions":

       206:| The questions | Every setup, at Steps 2, for each question a quoted ruling does not answer | The questions asked, each with its default | The user's answers |

13. Stops, "The draft":

       207:| The draft | Every setup, at Steps 4, except a draft a quoted ruling covers as Steps 4 says | The tree, every file's text with the copied hook named by its source, and the placeholders that Steps 3 lists for the user's value | The user's approval or correction |

14. Rules:

       231:  - A quoted ruling that covers the draft as Steps 4 says is that approval.

Scenarios:

- A ruling that answers the ten questions, states the three keys and holds the text of `README.md`, no placeholder left: step 3 asks nothing, step 4 drafts `README.md` as the ruling's text, step 5 finds its four things true, so no stop at Steps 4, and step 7 runs `/ordo-init` with the same arguments. Result: as the brief says.
- `/ordo-init` inside it: step 9 does not ask the three keys; steps 8 and 10 leave it stopping at its Steps 11 unless the ruling also states the form, the keys it does not derive from that tree (`verification`, `ledger_root`, `archive_root`, `worktree_root`) and the text of each page it creates. The commit or the list names the ruling (step 11). Result: as the brief says.
- A build file for the kind, or a `README.md` whose text the ruling does not hold, or a placeholder Steps 3 lists: the third of the four things in step 5 fails for a file neither filled from a template nor held in the ruling, or the fourth fails for a placeholder, so step 6 shows the draft whole and names each file and placeholder. Result: as the brief says.
- Eight questions answered: step 3 asks the other two together, and the first of the four things in step 5 fails so step 6 shows the draft whole. Result: as the brief says.

### R8, `/repo-setup sync` under a quoted ruling

1. Exit 1, the ruling's hunks are the diff's, each with its choice, and are applied without the stop:

       133:   - Under a quoted ruling whose hunks are the hunks of the diff, each with the choice for it, the choices are applied without the stop.

2. A diff whose hunks are not the ruling's is shown whole and the stop stands:

       134:   - A diff whose hunks are not the ruling's is shown whole, and the stop stands.

3. Exit 2, the ruling states the drafted change and the draft takes the ruling's text:

       143:   - Under a quoted ruling that states the drafted change, the draft of Steps / sync 4 takes the ruling's text.

4. The rules of sync 4 are worked on it:

       144:   - The rules of Steps / sync 4 are worked on it.

5. A draft that is still the ruled change is written without the stop:

       145:   - A draft that is still the ruled change is written without the stop.

6. A draft that differs is shown whole with each difference:

       146:   - A draft that differs from it is shown whole with each difference named, and the stop stands.

7. sync 9 names the ruling in the commit message, or in the list the stop shows:

       155:   - A change written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.

8. Stops, "A hunk to rule on":

       208:| A hunk to rule on | `sync` exits 1, except a diff whose hunks are a quoted ruling's (Steps / sync 3) | The diff | The user's ruling per hunk |

9. Stops, "The drafted sync change":

       209:| The drafted sync change | `sync` exits 2 with an `error:` line of Steps / sync 4, for the shared-rules block or the plan-terms block, except a change a quoted ruling states (Steps / sync 5) | The change Steps / sync 4 drafts | The user's approval |

Scenarios:

- Exit 1 with the ruling's hunks being the diff's: step 1 applies the choices without the stop. Result: applied.
- Exit 1 with a hunk of the diff the ruling does not hold: the ruling's hunks are not the hunks of the diff, step 2 shows the diff whole and the stop stands. Result: shown whole.
- Exit 1 with a ruled hunk the diff does not show: the ruling's hunks are not the diff's, so the condition of step 1 fails and step 2 shows the diff whole. Result: shown whole.
- Exit 2 with a drafted change the ruling states: steps 3 to 5 write it without the stop. Result: written.
- Exit 2 with a draft that differs: step 6 shows it whole. Result: shown.

### R9, `/grill` under a quoted ruling

1. Quick start:

       18:/grill <entry> --ruling <ledger file> "<name>"                  the same, under a quoted ruling: a roadmap diff that is the ruled text is written without its decision

2. The item that reads the ruling:

       55:11. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.

3. Steps 4 puts the roadmap diff decision in the frontier:

       88:4. Compute the frontier: every decision whose prerequisites are settled, the roadmap diff and "record as ADR?" decisions included.

4. The Stops row "A round" leaves out a roadmap diff the ruling states:

       250:| A round | Every round, at Steps 6, the "record as ADR?" decisions and each roadmap diff no quoted ruling states riding in it | The frontier as decisions in the decision form, and the answer form | The user's answers |

5. "Writing what settled" 3, the draft is made at the first write of Steps 8:

       199:   - Under a quoted ruling ("What it reads" 11) whose sub-bullets hold the entry's changed text, the draft is made at the first write of Steps 8.

6. It takes the ruled text and the rules of the item are worked on it:

       200:   - It takes the ruled text.

       201:   - The rules of this item are worked on it.

7. A draft that is still the ruled text is written at once, unless it changes the gate and the changed gate could pass:

       202:   - A draft that is still the ruled text is written at once, unless it changes the gate and the changed gate could pass without the goal.

8. The roadmap diff decision then counts as answered:

       203:   - The roadmap diff decision then counts as answered.

9. A differing draft, or a changed gate that could pass, is shown as the decision:

       204:   - A draft that differs from the ruled text, or a changed gate that could pass without the goal, is shown as the decision.

10. "Writing what settled" 1 writes no bullet for it:

       185:   - A roadmap diff written under a quoted ruling gets no bullet, since the quoted ruling is its ruling.

11. Steps 9 ends when the frontier is empty and the roadmap diff is answered:

       116:9. Go back to Steps 3, until the frontier is empty and the roadmap diff and "record as ADR?" decisions are answered.

12. Steps 10 lists the entry with the ruling's name and its ledger file:

       120:    - An entry changed under a quoted ruling is listed with the ruling's name and its ledger file.

13. and the commit message names it:

       126:    - The commit message names a quoted ruling an entry was changed under, by its name and its ledger file.

14. The item's completion line:

       206:   - The item is done when the diff is a decision of the next round, or, after the yes or under a quoted ruling, the entry read back holds the change.

15. Rules:

       272:  - A quoted ruling that holds the entry's changed text is the user's answer to the roadmap diff.

Scenarios:

- The roadmap diff that is the ruled text with a gate whose answer is no: steps 5 to 8 write it at the first write of Steps 8 and count the decision answered; step 10 writes no bullet; step 11 ends Steps 9; steps 12 and 13 list the entry with the ruling and name it in the commit message. Result: as the brief says.
- A ruled text that changes the goal and no gate: step 7 writes it at once, since the gate is not changed. Result: written.
- A changed gate that could pass without the goal: steps 7 and 9 show it as the decision. Result: shown.
- The Stops row "A round" (step 4) and the Rules bullet (step 15) agree with steps 5 to 9: each says a quoted ruling that holds the entry's changed text answers the roadmap diff.

### R10 after the change, each hit outside the changed lines, with its reason

The three greps of the case run on the changed tree. A hit on a line the diff adds or changes is counted and read in the diff (parts 5 and 12); every other hit is listed with the key of its reason, and the reasons are written below the list.

```
$ git grep -n -i 'approv' -- skills docs utils README.md
  README.md:17 [QRAPP] | `plan` | Opens a plan for one roadmap entry: the ledger folder, `plan.md` with a drafted step list for approval, the gate and each step's check asked whether it could pass without the goal being reached, `orchestrator-state.md`. It refuses an entry not yet specified |
  README.md:18 [UNREL] | `spec` | Prepares one step. It checks that the user approved the step and checks the step's premises against the tree. It writes the brief and checks the paths it writes against the steps in flight. A fresh read-only agent checks the brief against the tree, and each finding is closed in the brief. It creates the worktree and stages the base binaries |
  README.md:24 [UNREL] | `plan-retro` | Reads every refuter report and groups the findings by kind. For each kind that recurs, it proposes the rule sentence, the change to the text that should have prevented it, or the standards page that stops it, and a check only for a fact a machine computes, which the user approves |
  README.md:35 [QRAPP] /plan <entry>                 once per entry: opens the plan, shows the step list for approval
  README.md:113 [QRAPP] A new repository is set up with `/repo-setup` from an empty folder. It asks for the name, the kind, the license, the commit rule, the standards pages, whether the repository has a user interface, the project skills, and whether to install the git guard. It then shows the whole tree and every file's text, the git guard hook named by its source. After your approval it writes `CLAUDE.md`, the change and prose standards, the standards pages (by default the design principles, the coding standards for its languages and, with a user interface, the UI standard), a roadmap, a glossary, an ADR folder, `.gitignore`, `LICENSE` and `README.md`. On yes to the git guard, it also copies the guard into `.claude/hooks/`, which stays in the clone. It then installs the project skills, which writes `skills-lock.json`, and runs `/ordo-init`. After `/ordo-init` and the checks it prints the guard's settings text for you to add; it writes no settings file.
  README.md:117 [QRAPP] `/repo-setup sync` compares both blocks with their templates, shows the diff of each block that differs and rewrites it after approval. On a repository with no block yet, it drafts where the block goes and which existing rules or glossary entries it replaces. The same comparison runs on its own (`<skills>` is `~/.claude/skills`, or `skills/` in a clone), and `--only glossary` compares the plan-terms block alone, for a repository whose `CLAUDE.md` has no shared-rules block:
  README.md:124 [QRAPP] An existing repository opts in with `.agents/plan.yaml` at its root. Run `/ordo-init` from the repository root. It drafts the file from the repository and shows it, with any page it would create and the `.gitignore` lines it would add. It writes after you approve.
  docs/academic-coverage.md:52 [UNREL] | `SKILL.md` | rebuild: paper | The paper skill takes full mode (approved outline, two revision rounds, no orphan citations, a closing check of six statements, limitations and the formatter's pre-output checklist). `rebuttal` takes revision-coach and rebuttal-audit, `literature` takes lit-review, and `paper` at entry 15.A builds plan mode with `references/plan_mode_protocol.md` and `agents/socratic_mentor_agent.md`. The paper skill leaves out the zh-TW triggers, the higher-education defaults and the generator-evaluator contract. |
  docs/academic-coverage.md:63 [UNREL] | `agents/structure_architect_agent.md` | rebuild: paper | The paper type picks a structure whose outline gives each section a purpose and a word count within 5 percent, maps every source and adds transitions. The user approves it before arguments are built. |
  docs/academic-coverage.md:188 [UNREL] | `agents/ethics_review_agent.md` | rebuild: paper | Before delivery an ethics self-check stops once on an integrity problem, never on subject matter, and can be overridden with recorded reasons; it covers data, human subjects, dual use, conflicts, disclosure, attribution and retractions. Entry 5's goal names disclosure statements, `academic-paper/SKILL.md` asks for an ethics statement on human subjects or sensitive data, and hub papers on patient data carry one. The paper skill takes the stop and override, data licence and privacy, dual use with a responsible-use statement, conflicts, AI disclosure and fair representation. For human data it takes whether the work involves any, the approval, consent obtained and de-identification. The review-level determination, consent-form elements and vulnerable-population protections are dropped, since they plan data collection under the approving board, and the paper states that approval. Ethics training is dropped too: it is a qualification that board checks before it approves. `academic-paper/agents/citation_compliance_agent.md` already audits citations and retractions. The pipeline's phase-five folder is not kept: the paper skill runs this check before delivery within its own run, and nothing installs the `scripts/check_pipeline_integrity.py` that enforced the folder. |
  docs/academic-coverage.md:192 [UNREL] | `agents/research_architect_agent.md` | rebuild: researcher | The method follows from the question, never the reverse, with data strategy and analysis tied to it, limitations stated up front and preregistration considered for confirmatory work. Entry 13's goal has the researcher loop propose a new method and run the next experiments when results do not beat the baseline, and designing them is this file's work. It belongs to that loop rather than to the idea interview. The paradigm tables and survey-item rules are dropped, since they choose between social-science paradigms and write questionnaire items, neither of which an ML experiment has. Ethics-board planning is dropped, since the study that collects human data plans it, and `paper` states the approval at entry 5 with `agents/ethics_review_agent.md`. The reporting guidelines are dropped with `references/equator_reporting_guidelines.md`. The blueprint's phase-one folder boundary goes too, since the `researcher` loop itself (entry 13) orders its stages; `scripts/check_pipeline_integrity.py`, which checked that boundary, is not installed. |
  docs/academic-coverage.md:216 [UNREL] | `references/ethics_checklist.md` | rebuild: paper | The checklist judges dual use on concrete enabling detail, never on topic, requires data used under its licence and privacy law, and protects indirect identifiers and small groups. The paper skill takes it at entry 5 with `agents/ethics_review_agent.md`, with its disclosure, conflict, reproducibility and fair-representation checks and the human-subject approval, consent and de-identification checks. Of its AI-specific data checks, labelling AI-generated data and never citing AI-generated content go to `paper` with the AI disclosure. The training-bias note goes to `paper` with the conflict-of-interest check of `agents/ethics_review_agent.md`, which acknowledges AI biases. The knowledge-cutoff note is dropped, since the literature skill takes sources from live index searches and traces every claim to a retrieved source. `academic-paper/agents/citation_compliance_agent.md` already audits attribution. The review-level table, consent-form contents and vulnerable-population planning are dropped, since they plan data collection, and the paper states the approval the collecting study obtained. The ethics-training item is a qualification the board checks before approval, so it goes with them. |
  docs/dev/change-standard.md:19 [UNREL] - A new script needs the user's approval of what it computes before it is written.
  docs/dev/change-standard.md:22 [UNREL] - A recurring finding is answered with a rule sentence or a change to the text that should have prevented it. A check is proposed only for a fact a machine computes, with the user's approval.
  docs/dev/change-standard.md:29 [UNREL] 3. **A check that goes red is a design fact, never a number to get under.** Find the coupling the check names and remove it by a change the brief would approve, or stop and report the check red with the reason.
  docs/figures/gen_figures.py:489 [FIG]             "Once per entry: opens the plan and shows the step list for approval.",
  docs/figures/pipeline.svg:81 [FIG] <text x="441" y="463" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="11.5" fill="#0f172a" font-weight="400" text-anchor="start">approval.</text>
  docs/glossary.md:11 [AUTH] - **authority**: the tags that end a step line of `plan.md`, `(approved)` for a step of the list the user approved when the plan opened and `(ruling <name>)` for each ruling the step rests on. Stated in: `plan`, Rules; `spec`, "What it reads" 4 and Steps 1.
  docs/glossary.md:61 [GLSTOP] - **open item**: an entry of the state file's open items. It is a decision only the user can make, with its options, their pros and cons, what each option would need approved later, and one recommendation, closed by the user's ruling, or a worktree `/land` could not remove, closed by running the removal. Stated in: `plan-orchestration`, "Stops"; `spec`, "Steps / A stop"; `land`, "Stops".
  docs/glossary.md:111 [GLSTOP] - **stop**: a halt for a decision that is the user's, which leaves an open item in the state file and under the step's Step 0. Stated in: `plan-orchestration`, "Stops"; `spec`, "Steps / A stop". Also any point in a skill's Stops table where it waits on the user, such as the approval of a draft, which leaves no open item. Stated in: `repo-setup`, "Stops"; `roadmap`, "Stops"; `land`, "Stops". To stop an agent is also to end a running agent through the runner's stop tool. Stated in: `land`, Steps 1; `plan-orchestration`, "The pace when a deadline is set". A builder also stops when it halts its work and returns what it has to the orchestrator, as a hand-back does. Stated in: `plan-orchestration`, Steps 6; `spec`, `templates/brief.md`.
  docs/glossary.md:112 [SYNCENT] - **sync**: `/repo-setup sync`, which compares a repository's shared-rules block and plan-terms block with their templates and rewrites them after approval. Stated in: `repo-setup`, "Steps / sync".
  docs/roadmap.md:25 [UNREL] - Gate: the skill follows `docs/dev/skill-layout.md`, read by you; one real run that redrafts roadmap entry 3 from its sources, whose glossary terms and rulings are on disk when the interview ends, reviewed by you; a blind comparison as `docs/dev/blind-comparison.md` says against mattpocock's `grill-with-docs` on the same entry, wins or ties; each default page read and approved by you; `repo-setup` run on a scratch repository holding C++ and TypeScript files installs the design-principles, common, C++ and TypeScript pages and lists them under `standards`; `check_config.test.sh` passes with a case for each new setting's wrong value.
  docs/roadmap.md:129 [UNREL] - Goal: The researcher skill: the new-project and revise roadmap templates, an adopt mode for a project already underway (it reads the code, configs, results, logs and draft, writes the roadmap with the finished stages marked done with their evidence, and continues after your approval from the first stage not done), a run over a named range of stages, venue files in `venues/`, and plan-orchestration's support for SLURM jobs. Each stage's input and output files have a written format, so any stage can start from files that exist. When experiments do not beat the baseline, the loop proposes a new method and runs the next experiments; it never writes up a negative result.
  docs/roadmap.md:136 [UNREL] - Goal: A skill that fills a submission portal from the project and the venue file, stops for every approval, never presses the final Submit, and writes a submission record. It also writes the cover letter, with suggested and excluded reviewers, and removes what identifies the authors for a blind review, from the venue file.
  docs/roadmap.md:207 [UNREL] - Gate: you read and approve the whole diff; a reviewer's report lists every deleted sentence with the behaviour it carried and where that behaviour still stands, or why it carried none, read by you.
  docs/roadmap.md:224 [UNREL] - [x] 1. One layout for every skill: `docs/dev/skill-layout.md` approved (plan 1's rulings); at the closing on main, `python3 utils/check_skill_layout.py` printed ten `ok:` lines, exit 0, `sh utils/check_skill_layout.test.sh` printed `PASS: check_skill_layout.py scratch tests`, `python3 utils/check_rule_inventory.py` over the ten inventories printed ten `ok:` lines, exit 0, and `sh utils/check_rule_inventory.test.sh` printed `PASS: check_rule_inventory.py scratch tests`, and the ASCII check printed nothing, exit 0; `/refute` ran on steps 2 to 14, once on the build and once over its one repair round; the findings of that last run that a rule was changed in meaning were fixed at landing with no further review: step 4 (a sentence the old file does not have), step 6 (a refusal stated without its condition), step 7 (`land`'s red line booked in the open items, against the ruling), step 8 (the refusal for a missing run over the last round merged into another refusal, and part of old line 10 lost), step 10 (the diff rule written twice with different scopes), step 11 (the `drop` refusal placed after the draft it prevents) and step 13 (the rule that nothing is written before approval not limited to the setup); the tests of `docs/dev/building.md` last ran together on main at step 14's landing, each through `| tail -1`, which hides its exit status, and the re-run at a866716 (`.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/15-rerun.md`, "Commit a866716") shows `PASS: land.sh and usage.py scratch tests`, `PASS: check_config.py scratch tests`, `PASS: collect_findings.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: check_rule_inventory.py scratch tests`, `PASS: check_skill_layout.py scratch tests` and `PASS: pin.sh scratch tests`, each test exiting 0; at step 14's landing `npx skills add . --list` printed `Found 10 skills`.
  docs/roadmap.md:225 [UNREL] - [x] 2. Coverage inventory of the academic skills: `docs/academic-coverage.md` names each of the 169 files once with its mark and reason; `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`, exit 0, and `sh utils/check_coverage.test.sh` printed `PASS: check_coverage.py scratch tests`; the user approved the list (plan 2's rulings).
  docs/roadmap.md:228 [UNREL] - [x] 2.C. Scripts compute facts, and /writing is removed: at the closing on main (566a198), the rule "scripts compute facts; judgment is read" stands in `docs/dev/change-standard.md` (its section) and `skills/repo-setup/templates/shared-rules.md` (line 15), and the user approved the rewritten rules on reading their diff; `skills/writing/`, `verify.sh`, `verify.test.sh`, `usage.py` and the plan's ledger copies of `land.sh` are absent (`test -e`), and `python3 utils/check_coverage.py --built paper ...` printed `usage error: --built: not an argument this script takes`, exit 2; `git grep -n -e check_prose -e verify.sh -e usage.py -e ADAPT -e no-browser -e '--built' -- ':!.scratch' ':!docs/roadmap.md'` printed nothing, exit 1; `grep -n -e --built docs/roadmap.md` printed only this entry's gate line; entry 3.A is under Dropped with its reason, and entries 3 and 4 read "drafted again, from its sources, before it is opened"; `git diff v2.0.0 -- skills/repo-setup/templates/docs/dev/prose-standard.md` printed nothing; `.scratch/3-the-writing-base/` is absent; each command of the verify list in `docs/dev/building.md`, run as written, exited 0, printing `PASS: land.sh scratch tests`, `PASS: checks.sh scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`, `PASS: check_coverage.py scratch tests` and nothing for the ASCII check; the last step to land, step 5, landed through `sh skills/land/templates/land.sh`, reading its paths from `.agents/plan.yaml`, exit 0.
  docs/roadmap.md:229 [UNREL] - [x] 2.D. The plan skills take the comparison's process changes: at the closing on main (ac10380), the user approved the diff of each changed skill, page and roadmap entry on reading it; the length command printed no length above 1,024, the highest 1022 for `skills/spec/SKILL.md`; step 9, the glossary, was prepared, built and refuted under v2.4.0 (`git -C ~/.local/share/ordo-stable describe --tags` printed `v2.4.0`), its brief-check report lists every name the step changes with the hits outside its path list under "1. Names", and its refuter report gives the verdict per item and per Case, both read by the user.
  skills/grill/SKILL.md:171 [AUTH] 1. An answer that changes the text of an approved step of the open plan is written as its Rulings bullet ("Steps / Writing what settled" 1).
  skills/ordo-help/SKILL.md:55 [QRAPP] /plan <entry>                 once: opens the plan, shows the step list for approval
  skills/ordo-help/SKILL.md:78 [AUTH] /spec refuses                 the step's line lacks your authority ((approved), or (ruling <name>) of a ruling of yours), a file it reads is unusable, or the configured effort cannot apply (the runner lists no ordo-<level> effort agent the configuration names, or CLAUDE_CODE_EFFORT_LEVEL is set): it names the cause and leaves nothing; rule on the step, or install the effort agents as the plan skills are or unset the variable and start a new session, then /spec again. A file its brief shares with a step in flight is no refusal: the step runs beside that step when the orchestrator judges the merge at landing simple, named under shared_paths: in its dispatch entry, and waits otherwise
  skills/ordo-init/SKILL.md:3 [QRAPP] description: "Set a repository up for the plan skills: draft .agents/plan.yaml from what the repository already has (the roadmap, the page that defines the checks, the change standard, the check commands its CI and build files run, one project or several), offer the pages it lacks, make git ignore the worktree root and keep the configuration tracked, and write nothing until the user approves. On a repository that already has .agents/plan.yaml it checks the file instead: required keys, unknown keys, values, the pages it names, the ignore rules. Triggers on: ordo-init, set up the plan skills, init plan.yaml, configure ordo, check plan.yaml."
  skills/ordo-init/SKILL.md:10 [QRAPP] `/ordo-init` writes the one file the plan skills (`plan`, `spec`, `refute`, `land`, `ordo-help`, `plan-orchestration`) need in a repository, `.agents/plan.yaml`, and the pages that file names when the repository lacks them. It leaves behind that file, the pages the user approved, the `.gitignore` lines it needed, and one commit when the repository's commit rule allows it.
  skills/ordo-init/SKILL.md:15 [QRAPP] /ordo-init     draft .agents/plan.yaml and the pages it lacks for approval, or check the .agents/plan.yaml that is there
  skills/ordo-init/SKILL.md:32 [QSTEP] 3. The repository's commit rule: the answer to `repo-setup`'s question 5 when `/repo-setup` runs this skill, or, when it runs alone, the user's answer at the approval stop of Steps 11.
  skills/ordo-init/SKILL.md:107 [QSTEP] 11. Stop for the approval ("Stops").
  skills/ordo-init/SKILL.md:115 [S12] 12. Write what was approved.
  skills/ordo-init/SKILL.md:137 [S5FIX] 5. Make each fix the user approved.
  skills/ordo-init/SKILL.md:162 [QSTEP] - The skill writes nothing until the user approves or corrects the draft. The one exception is Steps 3, where each verification command runs once before the draft is shown.
  skills/ordo-init/SKILL.md:168 [QSTEP] - A change to an existing file, `.gitignore` included, is shown as a diff and made after approval.
  skills/plan-orchestration/SKILL.md:209 [UNREL]   - The user's ruling on the proposal approves what it computes, before it is written.
  skills/plan-orchestration/SKILL.md:292 [NOTSTOP] | The roadmap diff | The closing step's `/roadmap done`, which shows its diff of the roadmap | The diff, in the stop message | The user's approval of the diff |
  skills/plan-orchestration/SKILL.md:303 [SECOND]   - Each option states in full every approval it would need later whose content exists when the option is written, such as what a new script computes or a change to the configuration or the verification list; the user's ruling on the item then approves them too, with no second stop.
  skills/plan-retro/SKILL.md:3 [UNREL] description: "Read every refuter report of a repository's plans, open and archived, group the findings by the kind of defect, count the kinds that come back across steps and plans, and for each one propose the change that stops it at its source: a rule sentence on the rules page, a change to the text that should have prevented the defect, a page added to the standards the briefs point at, or, for a fact a machine computes, a check the user approves. Writes a retro report and changes nothing else until the user approves. Triggers on: plan-retro, retro, run a retro, what do the reviews keep finding, mine the refuter reports."
  skills/plan-retro/SKILL.md:10 [UNREL] `/plan-retro` turns the findings of every `/refute` run into proposed changes to the repository's rules. A finding the refuter keeps making is a rule the builder was not given, or was given where the brief did not point, or was given in words the builders misread, or, for a fact a machine computes, is a check nobody runs. It leaves behind a retro report in the ledger and, for each proposal the user approves, the edit it proposes, committed together.
  skills/plan-retro/SKILL.md:59 [UNREL] 10. Take the user's decision on each proposal, one by one: approved, corrected or declined ("Stops").
  skills/plan-retro/SKILL.md:61 [UNREL] 12. Make the approved edits: the rules page, a standards page, the text that should have prevented the defect, `.agents/plan.yaml`, the verification page, and, for an approved check of a fact, its script.
  skills/plan-retro/SKILL.md:62 [UNREL] 13. Run each approved check's command.
  skills/plan-retro/SKILL.md:86 [UNREL]    - The user's decision on the proposal approves what it computes, before it is written.
  skills/plan-retro/SKILL.md:93 [UNREL] | The proposals | Every retro with a recurring kind, at Steps 10 | The retro, each proposal in it | The user's decision on each: approved, corrected or declined |
  skills/plan-retro/templates/retro.md:30 [UNREL] - Decision: <approved | corrected: ... | declined>.
  skills/plan/SKILL.md:3 [QRAPP] description: "Open a plan for one roadmap entry: create its ledger folder from the repository's plan configuration, write plan.md with the entry's goal, gate and a drafted step list for approval, the gate and each step's check asked whether it could pass without the goal being reached, each approved step tagged (approved), and orchestrator-state.md with the configuration block filled from the repository. Triggers on: open a plan, start a plan, plan <roadmap entry>, new plan for <entry>."
  skills/plan/SKILL.md:15 [QRAPP] /plan <entry>             open the plan for one roadmap entry: the ledger folder the step skills and the orchestrator run from, its step list drafted for approval
  skills/plan/SKILL.md:85 [PLAN85]    - `/grill <entry>` settles such decisions before the plan opens. It is not required: the user may approve the list with them unsettled.
  skills/plan/SKILL.md:86 [QSTEP]    - Write `plan.md` once the user has approved or corrected it.
  skills/plan/SKILL.md:95 [AUTH]    - Each step line of the approved list ends with `(approved)`, the authority "Rules" describes.
  skills/plan/SKILL.md:128 [AP] | Writing `plan.md` before the user has approved the step list | The step list is the design half, and the design half is the user's | Steps 3 |
  skills/plan/SKILL.md:134 [AUTH] - Every step line of `plan.md` ends with its authority: `(approved)` for a step of the list the user approved, or `(ruling <name>)` for a step a ruling of the user added later, naming that ruling's line in the Rulings section as the `spec` skill's "Steps / A ruling" says.
  skills/plan/templates/orchestrator-state.md:38 [UNREL] - <a stop awaiting the user's ruling, or a proposal of the recurring-findings pass, with its options, the pros and cons of each, what each would need approved later, and one recommendation, as plan-orchestration's Stops section says; or "none">. An item is booked here the moment it is raised; it leaves only when the user has ruled, and then goes to the closed list.
  skills/plan/templates/plan.md:18 [TPL] - <1> <what the step delivers, in one line; the check that proves it> (<n> commit) (approved)
  skills/plan/templates/plan.md:19 [TPL] - <2> <what the step delivers, in one line; the check that proves it> (<n> commit; orchestrator, no agent) (approved)
  skills/plan/templates/plan.md:20 [TPL] - <2a> <a step a ruling of the user added after the approval, in one line; the check that proves it> (<n> commit) (ruling <L>)
  skills/plan/templates/plan.md:21 [TPL] - <last> the closing: the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)
  skills/repo-setup/SKILL.md:3 [QRAPP] description: "Set up a new repository in the shape the plan skills expect: CLAUDE.md with the shared rules, docs/ with the change standard, the prose standard, the standards pages (design principles, coding standards, a UI standard), the building page, a roadmap, a glossary and an ADR folder, src/ and utils/, a .gitignore for the language, LICENSE, README, the project skills installed with skills-lock.json, and the plan configuration .agents/plan.yaml, and, on request, the git guard hook. Shows the whole tree and every file's text, the git guard hook named by its source, before writing. With sync, compares an existing repository's shared-rules block and its glossary's plan-terms block with their templates and rewrites them after approval. Triggers on: repo-setup, set up a new repo, scaffold a repository, new project repo, sync the shared rules, sync the glossary."
  skills/repo-setup/SKILL.md:10 [QRAPP] `/repo-setup` sets up a new repository in the shape the plan skills expect, or keeps an existing repository's shared-rules block and its glossary's plan-terms block equal to their templates. It leaves behind the approved tree, committed when the repository's commit rule allows it, or the synced blocks.
  skills/repo-setup/SKILL.md:89 [RS5] 5. Write the files the user approved.
  skills/repo-setup/SKILL.md:94 [QSTEP] 8. Run `/ordo-init`, with its own draft and approval: it writes `.agents/plan.yaml` and `docs/dev/building.md`.
  skills/repo-setup/SKILL.md:131 [SYNC3]    - The template's text goes into the repository: `--write`, after the approval.
  skills/repo-setup/SKILL.md:148 [SYNC6] 6. Write it once the user approves.
  skills/repo-setup/SKILL.md:151 [SYNC7]    - The file named in the line is fixed first, by the user or with the user's approval.
  skills/repo-setup/SKILL.md:230 [QSTEP] - In a setup, after Steps 1, nothing is written until the user approves or corrects the draft (Steps 4).
  skills/repo-setup/templates/docs/dev/change-standard.md:19 [UNREL] - A new script needs the user's approval of what it computes before it is written.
  skills/repo-setup/templates/docs/dev/change-standard.md:22 [UNREL] - A recurring finding is answered with a rule sentence or a change to the text that should have prevented it. A check is proposed only for a fact a machine computes, with the user's approval.
  skills/repo-setup/templates/docs/dev/change-standard.md:29 [UNREL] 3. **A check that goes red is a design fact, never a number to get under.** Find the coupling the check names and remove it by a change the brief would approve, or stop and report the check red with the reason.
  skills/repo-setup/templates/docs/dev/prose-standard.md:7 [UNREL] Calibration exemplar: <the first page the user approves as the register, named here once it exists>.
  skills/repo-setup/templates/plan-terms.md:6 [AUTH] - **authority**: the tags that end a step line of `plan.md`, `(approved)` for a step of the list the user approved when the plan opened and `(ruling <name>)` for each ruling the step rests on. Stated in: `plan`, Rules; `spec`, "What it reads" 4 and Steps 1.
  skills/repo-setup/templates/plan-terms.md:56 [GLSTOP] - **open item**: an entry of the state file's open items. It is a decision only the user can make, with its options, their pros and cons, what each option would need approved later, and one recommendation, closed by the user's ruling, or a worktree `/land` could not remove, closed by running the removal. Stated in: `plan-orchestration`, "Stops"; `spec`, "Steps / A stop"; `land`, "Stops".
  skills/repo-setup/templates/plan-terms.md:106 [GLSTOP] - **stop**: a halt for a decision that is the user's, which leaves an open item in the state file and under the step's Step 0. Stated in: `plan-orchestration`, "Stops"; `spec`, "Steps / A stop". Also any point in a skill's Stops table where it waits on the user, such as the approval of a draft, which leaves no open item. Stated in: `repo-setup`, "Stops"; `roadmap`, "Stops"; `land`, "Stops". To stop an agent is also to end a running agent through the runner's stop tool. Stated in: `land`, Steps 1; `plan-orchestration`, "The pace when a deadline is set". A builder also stops when it halts its work and returns what it has to the orchestrator, as a hand-back does. Stated in: `plan-orchestration`, Steps 6; `spec`, `templates/brief.md`.
  skills/repo-setup/templates/plan-terms.md:107 [SYNCENT] - **sync**: `/repo-setup sync`, which compares a repository's shared-rules block and plan-terms block with their templates and rewrites them after approval. Stated in: `repo-setup`, "Steps / sync".
  skills/repo-setup/templates/shared-rules.md:15 [UNREL] - **Scripts compute facts; judgment is read.** A script does only what has one correct answer that a machine computes exactly: moving files and commits, validating configuration keys, comparing two texts, counting, resolving an identifier such as a citation key or a DOI. Whether text is good, whether content is right, whether work is done, and anything a careful person could dispute is judged by reading, by the model or by the user; no script output stands in for that judgment, gates it, or is shown to the user as a finding. A script is never made more exact in the hope of reaching such a judgment, and a wrong hit of a helper script is dropped, not raised as work. A new script needs the user's approval of what it computes before it is written. A test exists only for code, and only for behaviour whose failure costs something: lost work, a broken installation, a wrong configuration accepted. A gate for a judgment is a review, the user's or a blind comparison; "a script prints ok" is a gate only for a fact. A recurring finding is answered with a rule sentence or a change to the text that should have prevented it, and a check is proposed only for a fact a machine computes, with the user's approval. What a skill or tool gives the user is written for a person to read, never in a machine's format.
  skills/roadmap/SKILL.md:3 [QRAPP] description: "Keep the roadmap, the ordered list of work a plan is opened for: show the open entries in order with what each waits on and which has a plan open, followed by the entries under \"Not yet specified\"; add an entry (goal, a gate that could not pass without the goal being reached, what it waits on) in the file's own format and in dependency order; put work whose gate cannot yet be named under \"Not yet specified\" with what must be known first; name the gate of such an entry and place it in the order; move an entry; mark one done with its gate's output; or drop one with the reason. Learns the format from the file, whether one file holds everything or an ordered build plan sits over a capability map of per-system files. Writes only after the user approves. Triggers on: roadmap, add to the roadmap, new roadmap entry, what is next on the roadmap, not yet specified, park on the roadmap until its gate is known, name the gate of an entry, mark the entry done, drop the entry, reorder the roadmap."
  skills/roadmap/SKILL.md:10 [QRAPP] `/roadmap` shows, adds, moves, marks done and drops the entries of the file `.agents/plan.yaml`'s `roadmap:` key names. It leaves behind each change the user approved, committed on its own.
  skills/roadmap/SKILL.md:16 [QRAPP] /roadmap add <goal>                       drafts an entry and its place in the order, writes it after approval
  skills/roadmap/SKILL.md:17 [QRAPP] /roadmap add <entry>                      for an entry under "Not yet specified": drafts its gate and its place in the order, writes it after approval
  skills/roadmap/SKILL.md:60 [UNREL]    - The plain `/roadmap` then runs "Steps / Show" and ends there: it changes nothing and shows nothing for approval.
  skills/roadmap/SKILL.md:71 [QSTEP] 4. Write the change once the user approves or corrects it ("Stops").
  skills/roadmap/SKILL.md:163 [NOGATE] | No gate | The goal's gate cannot be named | What is missing, and the two options: name the gate, or put the entry under "Not yet specified" with what must be known before its gate can be named | The user's gate, or the user's approval of the entry under "Not yet specified" |
  skills/session-retro/SKILL.md:133 [UNREL]     - A decision is approved, corrected (with the correction) or declined.
  skills/session-retro/SKILL.md:136 [UNREL]     - The step is done when each proposal has its decision and `## Approved proposals` lists each approved or corrected proposal with the file it goes into.
  skills/session-retro/SKILL.md:171 [UNREL] | The proposals | Steps 10, each proposal | The proposal with its point and places | The user's decision on it: approved, corrected or declined |
  skills/session-retro/SKILL.md:189 [UNREL] | An edit to a rule, skill or brief that a proposal names | The text changes outside the process of its owner | Make the change where the text is owned: an approved proposal goes into `/roadmap add` or a plan, or, for the user's own rules files, is made by the user |
  skills/session-retro/templates/sessions.md:26 [UNREL] - Decision: <approved | corrected: ... | declined>
  skills/session-retro/templates/sessions.md:35 [UNREL] - Decision: <approved | corrected: ... | declined>
  skills/session-retro/templates/sessions.md:37 [UNREL] ## Approved proposals
  skills/spec/SKILL.md:3 [AUTH] description: "Prepare one step of an open plan: refuse a step without the user's authority ((approved) or (ruling <name>)), check each premise of the step's text against the tree, under libraries: check, look for a library for each capability the step builds, a candidate being the user's choice, write the brief (checked premises, fix text, verification list, report shape, pointer to the rules file, cases, libraries checked, paths it writes), compare those paths with the briefs of steps in flight, a shared file judged by the orchestrator, run the brief check (a fresh read-only agent checks the brief against the tree, each finding closed in the brief), create the worktree at main's head, stage the base binaries, and record the dispatch in the state file. A step a red line took back out of main is prepared again, its old work saved as a patch in the ledger and applied in the new worktree. Triggers on: spec <entry> <step>, brief <step>, prepare step <n>, write the brief; and on a ruling typed in reply to a stop (Ruled: ...)."
  skills/spec/SKILL.md:43 [AUTH]    - The step's authority is the tags that end its line: `(approved)` for a step of the list the user approved when the plan opened, or `(ruling <name>)` for each ruling it rests on.
  skills/spec/SKILL.md:199 [QSTEP]      - Each option states in full every approval it would need later whose content exists when the option is written, such as what a new script computes or a change to the configuration or the verification list; the user's ruling then approves them too.
  skills/spec/SKILL.md:290 [AUTH] | A step without the user's authority | The step's line ends with neither `(approved)` nor a `(ruling <name>)` for each ruling it rests on, each naming a ruling of the user in the Rulings section, or it starts with `Removed by` (Steps 1) | The step and the authority it lacks | The user's ruling, booked as "Steps / A ruling" says with the tag on the step's line, then `/spec` again |
  hits: 119; on changed or added lines: 20; outside them: 99

$ git grep -n -i 'every run\|each time' -- README.md docs skills utils
  README.md:56 [FIGS] ![The pipeline of one roadmap entry as boxes in order: /repo-setup for a new repository or /ordo-init for an existing one, /roadmap add, the optional /grill, /plan, every step, and the closing, with the optional /plan-retro, /session-retro, /diagnose and /ordo-help beside them. Each box lists the stops where you are asked, marked every run, only when or optional.](docs/figures/pipeline.svg)
  README.md:60 [FIGS] ![The loop of one step as boxes in order: /spec, build it, /refute, close them, which sends a finding whose cause is not known through /diagnose, /refute over the round, and /land, with a return for a further round, a card for when a command stops, a card for when it refuses, the optional /ordo-help card, and the optional /plan-orchestration band. Each box lists the stops where you are asked, marked every run, only when or optional.](docs/figures/plan-loop.svg)
  docs/dev/building.md:11 [EACH] sh skills/session-retro/templates/transcript_window.test.sh  # transcript_window.py on scratch transcript folders: the window and its boundaries in each time form, the main and subagent files, the order and the prefix, what counts as a user message, assistant text and tool calls, each redaction pattern, skipped lines, an unreadable file and the usage errors
  docs/dev/skill-layout.md:67 [EACH] - A reference section of row 6 of "Sections, in order" holds only material every run reads.
  docs/figures/gen_figures.py:20 [FIGS] by a word: a filled square "every run", an outlined square "only when", a dashed pill "optional".
  docs/figures/gen_figures.py:71 [FIGS] EVERY_RUN = "every run"
  docs/figures/gen_figures.py:381 [FIGS]         (EVERY_RUN, "it waits on you each time it runs"),
  docs/figures/gen_figures.py:422 [FIGS]         "beside them. Each box lists the stops where you are asked, marked every run, only when "
  docs/figures/gen_figures.py:572 [FIGS]         "box lists the stops where you are asked, marked every run, only when or optional.",
  docs/figures/pipeline.svg:2 [FIGS] <title>The pipeline of one roadmap entry as boxes in order: /repo-setup for a new repository or /ordo-init for an existing one, /roadmap add, the optional /grill, /plan, every step, and the closing, with the optional /plan-retro, /session-retro, /diagnose and /ordo-help beside them. Each box lists the stops where you are asked, marked every run, only when or optional.</title>
  docs/figures/pipeline.svg:12 [FIGS] <text x="72.6" y="122" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="10" fill="#ffffff" font-weight="700" text-anchor="middle">every run</text>
  docs/figures/pipeline.svg:26 [FIGS] <text x="442.6" y="122" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="10" fill="#ffffff" font-weight="700" text-anchor="middle">every run</text>
  docs/figures/pipeline.svg:50 [FIGS] <text x="72.6" y="514" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="10" fill="#ffffff" font-weight="700" text-anchor="middle">every run</text>
  docs/figures/pipeline.svg:68 [FIGS] <text x="275.6" y="510" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="10" fill="#ffffff" font-weight="700" text-anchor="middle">every run</text>
  docs/figures/pipeline.svg:83 [FIGS] <text x="478.6" y="484" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="10" fill="#ffffff" font-weight="700" text-anchor="middle">every run</text>
  docs/figures/pipeline.svg:106 [FIGS] <text x="884.6" y="499" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="10" fill="#ffffff" font-weight="700" text-anchor="middle">every run</text>
  docs/figures/pipeline.svg:137 [FIGS] <text x="326.6" y="824" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="10" fill="#ffffff" font-weight="700" text-anchor="middle">every run</text>
  docs/figures/pipeline.svg:165 [FIGS] <text x="62.6" y="950" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="10" fill="#ffffff" font-weight="700" text-anchor="middle">every run</text>
  docs/figures/pipeline.svg:166 [FIGS] <text x="108.2" y="950" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="11" fill="#0f172a" font-weight="400" text-anchor="start">it waits on you each time it runs</text>
  docs/figures/plan-loop.svg:2 [FIGS] <title>The loop of one step as boxes in order: /spec, build it, /refute, close them, which sends a finding whose cause is not known through /diagnose, /refute over the round, and /land, with a return for a further round, a card for when a command stops, a card for when it refuses, the optional /ordo-help card, and the optional /plan-orchestration band. Each box lists the stops where you are asked, marked every run, only when or optional.</title>
  docs/figures/plan-loop.svg:144 [FIGS] <text x="72.6" y="713" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="10" fill="#ffffff" font-weight="700" text-anchor="middle">every run</text>
  docs/figures/plan-loop.svg:156 [FIGS] <text x="62.6" y="858" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="10" fill="#ffffff" font-weight="700" text-anchor="middle">every run</text>
  docs/figures/plan-loop.svg:157 [FIGS] <text x="108.2" y="858" font-family="ui-sans-serif, -apple-system, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif" font-size="11" fill="#0f172a" font-weight="400" text-anchor="start">it waits on you each time it runs</text>
  skills/plan-retro/SKILL.md:32 [EACH] 3. The newest file under `<ledger_root>/retros/` named `<YYYY-MM-DD>.md`, the previous retro, for its "Reports read" list. With no previous retro, every run is read.
  skills/refute/SKILL.md:75 [EACH] 1. When the configuration block holds `refute_after_repair: yes`, `/refute` runs again after each of the step's repair rounds, at most `repair_rounds`, or one more under `plan-orchestration`'s exception, on a fresh reviewer each time, as Rules 1 says, dispatched as Steps 1 says.
  skills/refute/SKILL.md:175 [EACH] - The reviewer is a fresh session or agent every time, for the first run and every run over a repair round: never the builder, and never the session that wrote the brief when another is available.
  skills/repo-setup/SKILL.md:152 [EACH] 8. After a written draft or a fixed file: run the check again, at most twice, following steps 2 to 7 on its exit status each time.
  skills/repo-setup/templates/CLAUDE.md:10 [EACH] - **Commits.** <Commit only when told, each time. | Committing is allowed.>
  utils/pin.test.sh:98 [EACH] # Every run starts here; a relative folder would land in this folder.
  hits: 36; on changed or added lines: 7; outside them: 29

$ git grep -n -i 'stops of their own\|second stop' -- skills docs README.md utils
  skills/plan-orchestration/SKILL.md:303 [SECOND]   - Each option states in full every approval it would need later whose content exists when the option is written, such as what a new script computes or a change to the configuration or the verification list; the user's ruling on the item then approves them too, with no second stop.
  hits: 1; on changed or added lines: 0; outside them: 1

Reasons:
  [CHG] a line this step changes or adds, read in the diff
  [QRAPP] says a skill writes after the user's approval; a quoted ruling is that approval (brief decision 7), and the skill says where: `roadmap` Steps 4, `plan` Steps 3, the Rules sub-bullets of `ordo-init`, `repo-setup` and `grill`, and Steps / sync 3 and 5
  [QSTEP] the first line of a step or bullet whose own sub-bullets, added by this step, give the quoted-ruling case
  [AUTH] the `(approved)` authority tag or the authority entry; decision 2 keeps it, and `plan` Steps 3 makes a ruled list the approved list
  [UNREL] unrelated to an approval stop of a skill an option runs: a new script's computation, a proposal of another skill, an academic skill, a roadmap entry or a template for another file
  [FIG] the figure's /plan box text; it states the run with no ruling, and the note under the legend says the ruled case
  [NOTSTOP] an approval that is not a stop of a skill run under a ruling (the closing step's `/roadmap done` runs with no quoted ruling, brief line 'What is on the tree')
  [GLSTOP] the glossary entry for stop or open item; both stay true, since a Stops row whose condition excludes the ruled case does not fire
  [SYNCENT] the entry sync; its rewrite after approval holds, since the sub-bullets of Steps / sync 3 and 5 say where a quoted ruling is that approval
  [TPL] a template that shows the `(approved)` tag; decision 13 keeps it
  [EACH] unrelated to the figures' marks or to stops: a count of repetitions, a commit-rule sentence or a test comment
  [FIGS] the figures' own text: the head comment, the constant or the alt text; each still holds, since the note under the legend says the ruled case
  [S12] Steps 12 writes what Steps 11 approved; the sub-bullets of Steps 11 make the draft a quoted ruling states the one that is written
  [S5FIX] item 5 makes the fixes the user approved; the sub-bullets of item 4 make a fix a quoted ruling states the one that is made, and Rules 5's sub-bullet says so
  [PLAN85] it says the user may approve the list with design decisions unsettled; the four things of Steps 3 under a quoted ruling require none unsettled, so the two do not meet
  [AP] the anti-pattern row points at Steps 3, which says a step list written under a quoted ruling is the approved list
  [RS5] Steps 5 writes the files the user approved; Steps 4's completion line says the draft is approved by the user or covered by a quoted ruling
  [SYNC3] the non-ruled case of sync 3; the sub-bullets added below it say the ruled case
  [SYNC6] sync 6 writes after the approval; the sub-bullets of sync 5 say a draft that is still the ruled change is written without the stop
  [SYNC7] the stop "A file sync cannot use" of sync 7, which no quoted ruling covers (the brief lists sync 3 and 5 only)
  [NOGATE] the row "No gate"; a ruled gate does not raise it (Steps / add 3), and a ruling that puts an entry under "Not yet specified" is not covered
  [SECOND] the sentence 'with no second stop' of the approvals whose content exists when the option is written; the new sub-bullets that follow it say what a quoted ruling changes, and the two agree
```

Result: no hit is left without a reason, and no sentence outside the changed lines is made false. The two hits marked SYNC7 and NOGATE are stops the brief does not cover with a quoted ruling (the stop "A file sync cannot use" and a ruling that puts an entry under "Not yet specified"); they stay stops, and the skills say so in the lines named.

## 5. The DONE / NOT DONE table

| Item or check | Status | Where it is shown |
|---|---|---|
| Item 1, `plan-terms.md` four changes and the sync of the glossary block | DONE | check 3 (`sync_rules.py ... --only glossary` exits 0 after `--write`), check 2 texts of item 1, part 6 |
| Item 2, **mark, of a figure** | DONE | check 2 (changed text, `docs/glossary.md`), part 10 |
| Item 3, `README.md` line 54 | DONE | check 2, part 10 |
| Item 4, `gen_figures.py` and the two SVG files | DONE | checks 2, 3, 8 |
| Item 5, `spec` | DONE | check 2 (item 5), check 7 |
| Item 6, `ordo-help` line | DONE | check 2 (item 6, exact line in column 31) |
| Item 7, `plan-orchestration` | DONE | check 2 (item 7) |
| Item 8, `roadmap` | DONE | check 2 (item 8 and the shared item) |
| Item 9, `plan` | DONE | check 2 (item 9 and the shared item) |
| Item 10, `ordo-init` | DONE | check 2 (item 10 and the shared item) |
| Item 11, `repo-setup` | DONE | check 2 (item 11 and the shared item); part 11 on the line number |
| Item 12, `grill` | DONE | check 2 (item 12 and the shared item) |
| Item 13, completion lines | DONE | check 2 (item 13, each quoted completion line prints 1) |
| Check 1, the land runner | DONE | below |
| Check 2, each dictated text once | DONE | below |
| Check 3, sync, figures, status, stat | DONE | below |
| Check 4, ASCII over the fourteen files | DONE | below |
| Check 5, the removed sentence | DONE | below |
| Check 6, counts of `quoted ruling` and `--ruling` | DONE | below |
| Check 7, indents | DONE | below |
| Check 8, R12 and ruff | DONE | below |
| Check 9, reading and long sentences | DONE | below and part 7 |

NOT DONE: nothing. Out of this step by the brief's own words: the five fresh-agent scratch runs, which the orchestrator starts after the review.

### Check 1, the land runner

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-e-grill/orchestrator-state.md
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
[exit 0]
```

It prints `$ <command>` and the output of each of the ten commands, then `checks: 10 commands passed`, and exits 0.

### Check 2, each dictated text is in its file the number of times the brief gives

The script `verify_texts.py` (disclosed in part 8) reads the texts from the fences of the brief's "What to build" and from the quoted completion lines and changed cells and sentences, writes each as the one line of a scratch file with no empty line, and runs `grep -c -F -f <that file> <file>` for it. Each row below prints the count, the count the brief gives, the file and the text; a row for an ordo-help line also prints the count of exact lines (`grep -c -x -F -f`, the text in column 31). The two rows marked `MISMATCH` are the sub-bullet "When no commit is made, the list of files the stop shows names the ruling the same way." of `repo-setup`, which the brief says stands twice and prints 2 there; the script's own expected count of 1 came from counting it once per fence, so those two rows print the result the brief gives. The last line counts the rows.

The brief's three further counts: the thirteen sub-bullets of the quoted-ruling item print 1 in each of the five skills (the rows of "shared item" below); the first two sub-bullets of "Steps / A stop" of `spec` and of "Stops" of `plan-orchestration` print 1 in each (rows of items 5 and 7); the line of item 6 prints 1 in `ordo-help` with the exact-line count 1; of item 4 the docstring line, `y + 48,`, the two string lines and the two heights print 1 each (the last six rows).

```
1  (expected 1)  skills/roadmap/SKILL.md  The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
1  (expected 1)  skills/roadmap/SKILL.md  `<ledger file>` is a plan's `plan.md` or a rulings file, given by a path the skill can read from where it runs.
1  (expected 1)  skills/roadmap/SKILL.md  The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.
1  (expected 1)  skills/roadmap/SKILL.md  The name is read as the `spec` skill's "What it reads" 4 reads a ruling's name.
1  (expected 1)  skills/roadmap/SKILL.md  It is matched against the bullet's text as written, a quotation mark in it included.
1  (expected 1)  skills/roadmap/SKILL.md  A draft is the ruled change when each part of it has a sub-bullet that states it and equals that sub-bullet.
1  (expected 1)  skills/roadmap/SKILL.md  A text of several lines is compared line for line with the fenced block under its sub-bullet.
1  (expected 1)  skills/roadmap/SKILL.md  There is no ruling in any of these cases.
1  (expected 1)  skills/roadmap/SKILL.md  `--ruling` is not followed by the file and the name as the last two arguments of the invocation.
1  (expected 1)  skills/roadmap/SKILL.md  The file does not exist, or is neither of those two files.
1  (expected 1)  skills/roadmap/SKILL.md  No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
1  (expected 1)  skills/roadmap/SKILL.md  The name is a placeholder in angle brackets, such as `<L>`.
1  (expected 1)  skills/roadmap/SKILL.md  The bullet's first line does not end with "(the user)", with or without a full stop after it.
1  (expected 1)  skills/roadmap/SKILL.md  With no ruling, the skill says which of these it found, and every stop stands.
1  (expected 1)  skills/plan/SKILL.md  The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
1  (expected 1)  skills/plan/SKILL.md  `<ledger file>` is a plan's `plan.md` or a rulings file, given by a path the skill can read from where it runs.
1  (expected 1)  skills/plan/SKILL.md  The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.
1  (expected 1)  skills/plan/SKILL.md  The name is read as the `spec` skill's "What it reads" 4 reads a ruling's name.
1  (expected 1)  skills/plan/SKILL.md  It is matched against the bullet's text as written, a quotation mark in it included.
1  (expected 1)  skills/plan/SKILL.md  A draft is the ruled change when each part of it has a sub-bullet that states it and equals that sub-bullet.
1  (expected 1)  skills/plan/SKILL.md  A text of several lines is compared line for line with the fenced block under its sub-bullet.
1  (expected 1)  skills/plan/SKILL.md  There is no ruling in any of these cases.
1  (expected 1)  skills/plan/SKILL.md  `--ruling` is not followed by the file and the name as the last two arguments of the invocation.
1  (expected 1)  skills/plan/SKILL.md  The file does not exist, or is neither of those two files.
1  (expected 1)  skills/plan/SKILL.md  No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
1  (expected 1)  skills/plan/SKILL.md  The name is a placeholder in angle brackets, such as `<L>`.
1  (expected 1)  skills/plan/SKILL.md  The bullet's first line does not end with "(the user)", with or without a full stop after it.
1  (expected 1)  skills/plan/SKILL.md  With no ruling, the skill says which of these it found, and every stop stands.
1  (expected 1)  skills/ordo-init/SKILL.md  The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
1  (expected 1)  skills/ordo-init/SKILL.md  `<ledger file>` is a plan's `plan.md` or a rulings file, given by a path the skill can read from where it runs.
1  (expected 1)  skills/ordo-init/SKILL.md  The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.
1  (expected 1)  skills/ordo-init/SKILL.md  The name is read as the `spec` skill's "What it reads" 4 reads a ruling's name.
1  (expected 1)  skills/ordo-init/SKILL.md  It is matched against the bullet's text as written, a quotation mark in it included.
1  (expected 1)  skills/ordo-init/SKILL.md  A draft is the ruled change when each part of it has a sub-bullet that states it and equals that sub-bullet.
1  (expected 1)  skills/ordo-init/SKILL.md  A text of several lines is compared line for line with the fenced block under its sub-bullet.
1  (expected 1)  skills/ordo-init/SKILL.md  There is no ruling in any of these cases.
1  (expected 1)  skills/ordo-init/SKILL.md  `--ruling` is not followed by the file and the name as the last two arguments of the invocation.
1  (expected 1)  skills/ordo-init/SKILL.md  The file does not exist, or is neither of those two files.
1  (expected 1)  skills/ordo-init/SKILL.md  No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
1  (expected 1)  skills/ordo-init/SKILL.md  The name is a placeholder in angle brackets, such as `<L>`.
1  (expected 1)  skills/ordo-init/SKILL.md  The bullet's first line does not end with "(the user)", with or without a full stop after it.
1  (expected 1)  skills/ordo-init/SKILL.md  With no ruling, the skill says which of these it found, and every stop stands.
1  (expected 1)  skills/repo-setup/SKILL.md  The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
1  (expected 1)  skills/repo-setup/SKILL.md  `<ledger file>` is a plan's `plan.md` or a rulings file, given by a path the skill can read from where it runs.
1  (expected 1)  skills/repo-setup/SKILL.md  The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.
1  (expected 1)  skills/repo-setup/SKILL.md  The name is read as the `spec` skill's "What it reads" 4 reads a ruling's name.
1  (expected 1)  skills/repo-setup/SKILL.md  It is matched against the bullet's text as written, a quotation mark in it included.
1  (expected 1)  skills/repo-setup/SKILL.md  A draft is the ruled change when each part of it has a sub-bullet that states it and equals that sub-bullet.
1  (expected 1)  skills/repo-setup/SKILL.md  A text of several lines is compared line for line with the fenced block under its sub-bullet.
1  (expected 1)  skills/repo-setup/SKILL.md  There is no ruling in any of these cases.
1  (expected 1)  skills/repo-setup/SKILL.md  `--ruling` is not followed by the file and the name as the last two arguments of the invocation.
1  (expected 1)  skills/repo-setup/SKILL.md  The file does not exist, or is neither of those two files.
1  (expected 1)  skills/repo-setup/SKILL.md  No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
1  (expected 1)  skills/repo-setup/SKILL.md  The name is a placeholder in angle brackets, such as `<L>`.
1  (expected 1)  skills/repo-setup/SKILL.md  The bullet's first line does not end with "(the user)", with or without a full stop after it.
1  (expected 1)  skills/repo-setup/SKILL.md  With no ruling, the skill says which of these it found, and every stop stands.
1  (expected 1)  skills/grill/SKILL.md  The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
1  (expected 1)  skills/grill/SKILL.md  `<ledger file>` is a plan's `plan.md` or a rulings file, given by a path the skill can read from where it runs.
1  (expected 1)  skills/grill/SKILL.md  The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.
1  (expected 1)  skills/grill/SKILL.md  The name is read as the `spec` skill's "What it reads" 4 reads a ruling's name.
1  (expected 1)  skills/grill/SKILL.md  It is matched against the bullet's text as written, a quotation mark in it included.
1  (expected 1)  skills/grill/SKILL.md  A draft is the ruled change when each part of it has a sub-bullet that states it and equals that sub-bullet.
1  (expected 1)  skills/grill/SKILL.md  A text of several lines is compared line for line with the fenced block under its sub-bullet.
1  (expected 1)  skills/grill/SKILL.md  There is no ruling in any of these cases.
1  (expected 1)  skills/grill/SKILL.md  `--ruling` is not followed by the file and the name as the last two arguments of the invocation.
1  (expected 1)  skills/grill/SKILL.md  The file does not exist, or is neither of those two files.
1  (expected 1)  skills/grill/SKILL.md  No bullet of the Rulings section, or of the rulings file, has the name, or more than one has it.
1  (expected 1)  skills/grill/SKILL.md  The name is a placeholder in angle brackets, such as `<L>`.
1  (expected 1)  skills/grill/SKILL.md  The bullet's first line does not end with "(the user)", with or without a full stop after it.
1  (expected 1)  skills/grill/SKILL.md  With no ruling, the skill says which of these it found, and every stop stands.
1  (expected 1)  skills/repo-setup/templates/plan-terms.md  **quoted ruling**: a ruling of the user given to a skill by the arguments `--ruling <ledger file> "<name>"`. The file is a plan's `plan.md` or a rulings file. The quoted ruling is the bullet of that name in it, whose first line ends with "(the user)", with the sub-bullets under it. The sub-bullets state the change in full. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops"; `plan`, "What it reads" 6; `roadmap`, "What it reads" 6; `ordo-init`, "What it reads" 5; `repo-setup`, "What it reads" 6; `grill`, "What it reads" 11.
1  (expected 1)  docs/glossary.md  **quoted ruling**: a ruling of the user given to a skill by the arguments `--ruling <ledger file> "<name>"`. The file is a plan's `plan.md` or a rulings file. The quoted ruling is the bullet of that name in it, whose first line ends with "(the user)", with the sub-bullets under it. The sub-bullets state the change in full. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops"; `plan`, "What it reads" 6; `roadmap`, "What it reads" 6; `ordo-init`, "What it reads" 5; `repo-setup`, "What it reads" 6; `grill`, "What it reads" 11.
1  (expected 1)  skills/spec/SKILL.md  a ruling on an option that runs a skill with an approval stop and states the change in full is written in the Rulings section as a bullet whose first line ends with "(the user).";
1  (expected 1)  skills/spec/SKILL.md  that bullet is the quoted ruling the session gives the skill;
1  (expected 1)  skills/spec/SKILL.md  the change the option stated is copied under that bullet as sub-bullets, a text of several lines as a fenced block indented with its sub-bullet, its fence longer than any fence inside the text;
1  (expected 1)  skills/spec/SKILL.md  After a ruling on an option that runs a skill and states the change in full, that skill is run first, with `--ruling <ledger file> "<name>"`.
1  (expected 1)  skills/spec/SKILL.md  An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own.
1  (expected 1)  skills/spec/SKILL.md  The option names that stop.
1  (expected 1)  skills/spec/SKILL.md  An option that runs a skill with an approval stop states the change in full, or names that stop as a stop of its own, as `plan-orchestration`'s "Stops" says.
1  (expected 1)  skills/ordo-help/SKILL.md  after a ruling on an option that runs a skill and states the change, that skill is run with --ruling <ledger file> "<name>" before /spec is typed again
    exact line: 1
1  (expected 1)  skills/plan-orchestration/SKILL.md  An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own.
1  (expected 1)  skills/plan-orchestration/SKILL.md  The option names that stop.
1  (expected 1)  skills/plan-orchestration/SKILL.md  An option that runs a skill with an approval stop (`/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill`) states the change in full, as that skill's text says a quoted ruling must state it, or names that skill's approval stop as a stop of its own.
1  (expected 1)  skills/plan-orchestration/SKILL.md  After the user's ruling on an option that states the change, the session books the ruling as the `spec` skill's "Steps / A ruling" says.
1  (expected 1)  skills/plan-orchestration/SKILL.md  It then runs the skill with `--ruling <ledger file> "<name>"`.
1  (expected 1)  skills/roadmap/SKILL.md  /roadmap <command> ... --ruling <ledger file> "<name>"   add, move, done or drop under a quoted ruling: a draft that is the ruled change is written without the stop
    exact line: 1
1  (expected 1)  skills/roadmap/SKILL.md  Under a quoted ruling ("What it reads" 6), the draft takes the ruling's text.
1  (expected 1)  skills/roadmap/SKILL.md  For `add` that text is the entry's title, goal, gate, level, number, what it waits on and its place, with the capability's draft where the roadmap has a capability map.
1  (expected 1)  skills/roadmap/SKILL.md  For `move`, `done` and `drop` it is the change the ruling states.
1  (expected 1)  skills/roadmap/SKILL.md  Each item of the command's subsection is then worked on that draft.
1  (expected 1)  skills/roadmap/SKILL.md  An item replaces ruled text only where a rule of this skill gives another result, such as a place, a number, a level or the file's form.
1  (expected 1)  skills/roadmap/SKILL.md  The ruled wording of the title, the goal, the gate and what it waits on is kept.
1  (expected 1)  skills/roadmap/SKILL.md  Under a quoted ruling the ruled gate is not redrafted.
1  (expected 1)  skills/roadmap/SKILL.md  Its answer and its reason stand in the draft.
1  (expected 1)  skills/roadmap/SKILL.md  A ruled gate that could pass without the goal keeps the stop of Steps 4.
1  (expected 1)  skills/roadmap/SKILL.md  The stop "No gate" is not raised for it.
1  (expected 1)  skills/roadmap/SKILL.md  Under a quoted ruling, compare the draft, after the command's subsection has been worked on it, with the change the ruling states.
1  (expected 1)  skills/roadmap/SKILL.md  A draft that is that change is written without the stop, for `add` only when the gate's answer of Steps / add 3 is no.
1  (expected 1)  skills/roadmap/SKILL.md  A draft that differs in anything, such as a place or a number the skill's own rules give, is shown whole with each difference named, and the stop stands.
1  (expected 1)  skills/roadmap/SKILL.md  A change written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
1  (expected 1)  skills/plan/SKILL.md  /plan <entry> --ruling <ledger file> "<name>"   the same, under a quoted ruling: a step list that is the ruled one is written without the stop
    exact line: 1
1  (expected 1)  skills/plan/SKILL.md  A quoted ruling that stands in the rulings file is copied with every line under it, its sub-bullets and their fenced blocks, and none of them is a line left to place.
1  (expected 1)  skills/plan/SKILL.md  Under a quoted ruling ("What it reads" 6), the step list is the ruling's, each step with its check.
1  (expected 1)  skills/plan/SKILL.md  The rest of this step is worked on that list.
1  (expected 1)  skills/plan/SKILL.md  A closing step in the ruled list is dropped for the one `/plan` writes.
1  (expected 1)  skills/plan/SKILL.md  Under a quoted ruling, the draft is written without the stop only when four things hold.
1  (expected 1)  skills/plan/SKILL.md  Each step and its check are the ruling's, the closing step `/plan` writes itself left out of the comparison.
1  (expected 1)  skills/plan/SKILL.md  Every answer in "## Gate" is no.
1  (expected 1)  skills/plan/SKILL.md  No design decision is named as unsettled.
1  (expected 1)  skills/plan/SKILL.md  No line of the rulings file is left to place.
1  (expected 1)  skills/plan/SKILL.md  Otherwise the draft is shown whole with what differs, what could pass without the goal and what is unsettled, and the stop stands.
1  (expected 1)  skills/plan/SKILL.md  The ruling's bullet and every line under it are copied into the Rulings section of a plan written under a quoted ruling, unless Steps 2 copied them from the rulings file.
1  (expected 1)  skills/plan/SKILL.md  A step list written under a quoted ruling is the approved list.
1  (expected 1)  skills/plan/SKILL.md  A plan written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
1  (expected 1)  skills/plan/SKILL.md  When Steps 2 copied the ruling from the rulings file, the ledger file named is the new `plan.md`.
1  (expected 1)  skills/ordo-init/SKILL.md  /ordo-init --ruling <ledger file> "<name>"   the same, under a quoted ruling: a draft the ruling states is written without the stop
    exact line: 1
1  (expected 1)  skills/ordo-init/SKILL.md  When the skill runs alone under a quoted ruling that states whether it may commit, the commit rule is what the ruling states.
1  (expected 1)  skills/ordo-init/SKILL.md  Under a quoted ruling ("What it reads" 5), the draft takes the ruling's form, keys, `.gitignore` changes and page texts.
1  (expected 1)  skills/ordo-init/SKILL.md  Steps 2 to 9 replace a ruled part only where a rule of this skill gives another result.
1  (expected 1)  skills/ordo-init/SKILL.md  Under a quoted ruling that states `roadmap`, the key is the ruling's.
1  (expected 1)  skills/ordo-init/SKILL.md  The stop of several candidates is then not raised.
1  (expected 1)  skills/ordo-init/SKILL.md  A key whose value a quoted ruling states is not asked.
1  (expected 1)  skills/ordo-init/SKILL.md  Its value is the ruling's.
1  (expected 1)  skills/ordo-init/SKILL.md  The commit question is left out when a quoted ruling states whether the skill may commit.
1  (expected 1)  skills/ordo-init/SKILL.md  Under a quoted ruling, compare the draft Steps 10 shows with the ruling.
1  (expected 1)  skills/ordo-init/SKILL.md  The comparison covers the form, each key of `.agents/plan.yaml` with its value, each change to `.gitignore`, and the full text of each page to create.
1  (expected 1)  skills/ordo-init/SKILL.md  Under `/repo-setup`, a key this skill derives from the tree `/repo-setup` wrote counts as stated.
1  (expected 1)  skills/ordo-init/SKILL.md  A draft the ruling states in each of these is written without the stop.
1  (expected 1)  skills/ordo-init/SKILL.md  A commit question Steps 10 shows is then asked alone.
1  (expected 1)  skills/ordo-init/SKILL.md  A draft that differs in anything, or a page whose text the ruling does not hold, is shown whole with each difference named, and the stop stands with nothing written.
1  (expected 1)  skills/ordo-init/SKILL.md  A setup written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
1  (expected 1)  skills/ordo-init/SKILL.md  When no commit is made, the list of files written names the ruling the same way.
1  (expected 1)  skills/ordo-init/SKILL.md  That list is the one of the stop "No commit allowed", or under `/repo-setup` the one of `repo-setup`'s Steps 12.
1  (expected 1)  skills/ordo-init/SKILL.md  A fix a quoted ruling states is made without the stop.
1  (expected 1)  skills/ordo-init/SKILL.md  A fix the skill proposes that differs from the ruled fix is shown with the difference, and the stop stands.
1  (expected 1)  skills/ordo-init/SKILL.md  A fix made under a quoted ruling is listed with the check's output, with the ruling's name and its ledger file.
1  (expected 1)  skills/ordo-init/SKILL.md  A quoted ruling that states the draft is that approval.
1  (expected 1)  skills/ordo-init/SKILL.md  Under a quoted ruling that states the change, it is made without being shown for approval, as Steps 11 and "Steps / Checking an existing file" 4 say.
1  (expected 1)  skills/repo-setup/SKILL.md  /repo-setup ... --ruling <ledger file> "<name>"   either form, under a quoted ruling: a draft or a sync change the ruling states is written without the stop
    exact line: 1
1  (expected 1)  skills/repo-setup/SKILL.md  Under a quoted ruling ("What it reads" 6), a file whose full text the ruling holds is drafted as that text.
1  (expected 1)  skills/repo-setup/SKILL.md  A question a quoted ruling answers ("What it reads" 6) is not asked.
1  (expected 1)  skills/repo-setup/SKILL.md  Its answer is the ruling's.
1  (expected 1)  skills/repo-setup/SKILL.md  The questions the ruling leaves open are asked together.
1  (expected 1)  skills/repo-setup/SKILL.md  Under a quoted ruling, the draft is written without the stop only when four things hold.
1  (expected 1)  skills/repo-setup/SKILL.md  The ruling answers every question of "The questions".
1  (expected 1)  skills/repo-setup/SKILL.md  It states `worker`, `reviewer` and `libraries` for `/ordo-init`.
1  (expected 1)  skills/repo-setup/SKILL.md  Every file of the draft that this skill writes is a template filled from the answers, or has its full text in the ruling. The files `/ordo-init` drafts and the file the skills CLI writes are not counted.
1  (expected 1)  skills/repo-setup/SKILL.md  Steps 3 lists no placeholder for the user's value.
1  (expected 1)  skills/repo-setup/SKILL.md  Otherwise the draft is shown whole, and the stop stands.
1  (expected 1)  skills/repo-setup/SKILL.md  Each file that is neither a filled template nor held in the ruling is named with the draft, such as a build file, a fetched licence text or a page adapted from a sibling repository.
1  (expected 1)  skills/repo-setup/SKILL.md  Each placeholder Steps 3 lists is named with it.
1  (expected 1)  skills/repo-setup/SKILL.md  Under a quoted ruling, `/ordo-init` is run with the same `--ruling` arguments.
1  (expected 1)  skills/repo-setup/SKILL.md  It skips the stops the ruling covers, as its own text says.
1  (expected 1)  skills/repo-setup/SKILL.md  A setup written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
MISMATCH 2  (expected 1)  skills/repo-setup/SKILL.md  When no commit is made, the list of files the stop shows names the ruling the same way.
1  (expected 1)  skills/repo-setup/SKILL.md  Under a quoted ruling whose hunks are the hunks of the diff, each with the choice for it, the choices are applied without the stop.
1  (expected 1)  skills/repo-setup/SKILL.md  A diff whose hunks are not the ruling's is shown whole, and the stop stands.
1  (expected 1)  skills/repo-setup/SKILL.md  Under a quoted ruling that states the drafted change, the draft of Steps / sync 4 takes the ruling's text.
1  (expected 1)  skills/repo-setup/SKILL.md  The rules of Steps / sync 4 are worked on it.
1  (expected 1)  skills/repo-setup/SKILL.md  A draft that is still the ruled change is written without the stop.
1  (expected 1)  skills/repo-setup/SKILL.md  A draft that differs from it is shown whole with each difference named, and the stop stands.
1  (expected 1)  skills/repo-setup/SKILL.md  A change written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
MISMATCH 2  (expected 1)  skills/repo-setup/SKILL.md  When no commit is made, the list of files the stop shows names the ruling the same way.
1  (expected 1)  skills/repo-setup/SKILL.md  A quoted ruling that covers the draft as Steps 4 says is that approval.
1  (expected 1)  skills/grill/SKILL.md  /grill <entry> --ruling <ledger file> "<name>"                  the same, under a quoted ruling: a roadmap diff that is the ruled text is written without its decision
    exact line: 1
1  (expected 1)  skills/grill/SKILL.md  An entry changed under a quoted ruling is listed with the ruling's name and its ledger file.
1  (expected 1)  skills/grill/SKILL.md  The commit message names a quoted ruling an entry was changed under, by its name and its ledger file.
1  (expected 1)  skills/grill/SKILL.md  A roadmap diff written under a quoted ruling gets no bullet, since the quoted ruling is its ruling.
1  (expected 1)  skills/grill/SKILL.md  Under a quoted ruling ("What it reads" 11) whose sub-bullets hold the entry's changed text, the draft is made at the first write of Steps 8.
1  (expected 1)  skills/grill/SKILL.md  It takes the ruled text.
1  (expected 1)  skills/grill/SKILL.md  The rules of this item are worked on it.
1  (expected 1)  skills/grill/SKILL.md  A draft that is still the ruled text is written at once, unless it changes the gate and the changed gate could pass without the goal.
1  (expected 1)  skills/grill/SKILL.md  The roadmap diff decision then counts as answered.
1  (expected 1)  skills/grill/SKILL.md  A draft that differs from the ruled text, or a changed gate that could pass without the goal, is shown as the decision.
1  (expected 1)  skills/grill/SKILL.md  A quoted ruling that holds the entry's changed text is the user's answer to the roadmap diff.
1  (expected 1)  skills/spec/SKILL.md  The item is done when the open item, its text under Step 0 and the commit of the ledger files exist.
1  (expected 1)  skills/spec/SKILL.md  The item is done when the skill a quoted ruling was booked for has run under it, and `/spec` has written the brief.
1  (expected 1)  skills/roadmap/SKILL.md  The step is done when the change is drafted and nothing is written.
1  (expected 1)  skills/roadmap/SKILL.md  The step is done when the change is written, or the draft is shown with each difference named and the stop stands.
1  (expected 1)  skills/roadmap/SKILL.md  The step is done when each change written is in a commit of its own.
1  (expected 1)  skills/plan/SKILL.md  The step is done when the draft holds the goal, the gate, the answers of "## Gate", the Rulings and the step list with the closing step last.
1  (expected 1)  skills/plan/SKILL.md  The step is done when `plan.md` is written, or the draft is shown and the stop stands.
1  (expected 1)  skills/plan/SKILL.md  The step is done when the opening commit holds the four files, and the removal of the rulings file when there was one.
1  (expected 1)  skills/ordo-init/SKILL.md  The step is done when the draft names the form and why.
1  (expected 1)  skills/ordo-init/SKILL.md  The step is done when the draft names the roadmap file, offers `docs/roadmap.md`, or the stop of several candidates stands.
1  (expected 1)  skills/ordo-init/SKILL.md  The step is done when every key the repository cannot give has its value.
1  (expected 1)  skills/ordo-init/SKILL.md  The step is done when everything this item lists is shown.
1  (expected 1)  skills/ordo-init/SKILL.md  The step is done when the draft is written, or it is shown and the stop stands with nothing written.
1  (expected 1)  skills/ordo-init/SKILL.md  The step is done when the files written are in one commit, or the list of files written is shown.
1  (expected 1)  skills/ordo-init/SKILL.md  The item is done when each error has its fix made under a quoted ruling, or proposed at the stop.
1  (expected 1)  skills/ordo-init/SKILL.md  The item is done when the check's output after the fixes is shown.
1  (expected 1)  skills/repo-setup/SKILL.md  The step is done when every question of "The questions" has its answer.
1  (expected 1)  skills/repo-setup/SKILL.md  The step is done when every file of "The tree" is drafted with its full text, the copied hook named by its source and each placeholder with no value listed.
1  (expected 1)  skills/repo-setup/SKILL.md  The step is done when the user has approved or corrected the draft, or a quoted ruling covers it.
1  (expected 1)  skills/repo-setup/SKILL.md  The step is done when `/ordo-init` has written `.agents/plan.yaml` and its check passes.
1  (expected 1)  skills/repo-setup/SKILL.md  The step is done when the files are committed, or the stop "No commit allowed" shows them.
1  (expected 1)  skills/repo-setup/SKILL.md  The item is done when each hunk has the user's ruling or the quoted ruling's choice.
1  (expected 1)  skills/repo-setup/SKILL.md  The item is done when the drafted change is shown, or written under a quoted ruling.
1  (expected 1)  skills/repo-setup/SKILL.md  The item is done when the change is committed, or the stop shows the files changed.
1  (expected 1)  skills/plan-orchestration/SKILL.md  `/roadmap` at the closing, and `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill` run under a quoted ruling)
1  (expected 1)  docs/glossary.md  "every run", a stop that waits on the user each time the skill runs, unless the run is under a quoted ruling that states the change;
1  (expected 1)  README.md  A stop marked "every run" waits on you each time, unless the run is under a quoted ruling that states the change. One marked "only when" waits on you in a named case.
1  (expected 1)  skills/repo-setup/templates/plan-terms.md  or, for `/ordo-init` run alone, the user's answer at its approval stop or what a quoted ruling states on whether the skill may commit.
1  (expected 1)  skills/repo-setup/templates/plan-terms.md  A ruling on an option that runs a skill with an approval stop and states the change is written there as a bullet with the change as sub-bullets, the quoted ruling.
1  (expected 1)  skills/repo-setup/templates/plan-terms.md  one bullet line each, and a quoted ruling with its sub-bullets, while no plan is open.
1  (expected 1)  docs/glossary.md  or, for `/ordo-init` run alone, the user's answer at its approval stop or what a quoted ruling states on whether the skill may commit.
1  (expected 1)  docs/glossary.md  A ruling on an option that runs a skill with an approval stop and states the change is written there as a bullet with the change as sub-bullets, the quoted ruling.
1  (expected 1)  docs/glossary.md  one bullet line each, and a quoted ruling with its sub-bullets, while no plan is open.
1  (expected 1)  skills/roadmap/SKILL.md  The step is done when the answer with its reason stands in the draft, and the gate's answer is no or the gate is a quoted ruling's.
1  (expected 1)  skills/roadmap/SKILL.md  A goal that does not settle it, with no quoted ruling that does, is a stop ("Stops").
1  (expected 1)  skills/roadmap/SKILL.md  - **No insertion form yet.** A stop ("Stops"), unless a quoted ruling states the entry's number.
1  (expected 1)  skills/roadmap/SKILL.md  | Every change of `add`, `move`, `done` or `drop`, at Steps 3, except a draft written under a quoted ruling as Steps 4 says |
1  (expected 1)  skills/roadmap/SKILL.md  | Entries exist at two levels and neither the goal nor a quoted ruling settles which |
1  (expected 1)  skills/roadmap/SKILL.md  | The file has no insertion form yet, and no quoted ruling states the entry's number |
1  (expected 1)  skills/plan/SKILL.md  Every plan, after Steps 2, except a draft written under a quoted ruling as Steps 3 says: the skill does
1  (expected 1)  skills/ordo-init/SKILL.md  | Every setup, at Steps 11, except a draft a quoted ruling states as Steps 11 says, where only a commit question the ruling leaves open is asked |
1  (expected 1)  skills/ordo-init/SKILL.md  | More than one roadmap candidate, and no quoted ruling states `roadmap` |
1  (expected 1)  skills/ordo-init/SKILL.md  | Every setup, at Steps 6, for each key a quoted ruling does not state |
1  (expected 1)  skills/ordo-init/SKILL.md  | The check reports an error in an existing file, and no quoted ruling states its fix |
1  (expected 1)  skills/ordo-init/SKILL.md  | The files written, the quoted ruling named when the setup was written under one, and the command that shows them (`git status --short`) |
1  (expected 1)  skills/repo-setup/SKILL.md  | Every setup, at Steps 2, for each question a quoted ruling does not answer | The questions asked, each with its default |
1  (expected 1)  skills/repo-setup/SKILL.md  | Every setup, at Steps 4, except a draft a quoted ruling covers as Steps 4 says |
1  (expected 1)  skills/repo-setup/SKILL.md  | `sync` exits 1, except a diff whose hunks are a quoted ruling's (Steps / sync 3) |
1  (expected 1)  skills/repo-setup/SKILL.md  for the shared-rules block or the plan-terms block, except a change a quoted ruling states (Steps / sync 5) |
1  (expected 1)  skills/repo-setup/SKILL.md  | The files changed, the quoted ruling named when they were written under one, and the command that shows them (`git status --short`) |
1  (expected 1)  skills/grill/SKILL.md  or, after the yes or under a quoted ruling, the entry read back holds the change.
1  (expected 1)  skills/grill/SKILL.md  Every round, at Steps 6, the "record as ADR?" decisions and each roadmap diff no quoted ruling states riding in it
1  (expected 1)  docs/figures/gen_figures.py  """The three marks and the dashed box with what each says, on one row, and a note under it."""
1  (expected 1)  docs/figures/gen_figures.py  y + 48,
1  (expected 1)  docs/figures/gen_figures.py  'A stop marked "every run" waits each time, unless the run is under a quoted ruling that '
1  (expected 1)  docs/figures/gen_figures.py  "states the change."
1  (expected 1)  docs/figures/gen_figures.py  side_top + side_h + 90,
1  (expected 1)  docs/figures/gen_figures.py  band_y + band_h + 103,
texts checked: 233, mismatches: 2
```

### Check 3, sync, figures, status and stat

```
$ git status --short > $TMPDIR/9a-build/st_before.txt; cat $TMPDIR/9a-build/st_before.txt
 M README.md
 M docs/figures/gen_figures.py
 M docs/figures/pipeline.svg
 M docs/figures/plan-loop.svg
 M docs/glossary.md
 M skills/grill/SKILL.md
 M skills/ordo-help/SKILL.md
 M skills/ordo-init/SKILL.md
 M skills/plan-orchestration/SKILL.md
 M skills/plan/SKILL.md
 M skills/repo-setup/SKILL.md
 M skills/repo-setup/templates/plan-terms.md
 M skills/roadmap/SKILL.md
 M skills/spec/SKILL.md
[exit 0]

$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
[exit 0]

$ python3 docs/figures/gen_figures.py
wrote docs/figures/pipeline.svg (31507 bytes)
wrote docs/figures/plan-loop.svg (31160 bytes)
[exit 0]

$ git status --short > $TMPDIR/9a-build/st_after.txt; diff $TMPDIR/9a-build/st_before.txt $TMPDIR/9a-build/st_after.txt && echo 'status unchanged by gen_figures.py'
status unchanged by gen_figures.py
[exit 0]

$ git diff --stat
 README.md                                 |  2 +-
 docs/figures/gen_figures.py               | 14 ++++++--
 docs/figures/pipeline.svg                 |  5 +--
 docs/figures/plan-loop.svg                |  5 +--
 docs/glossary.md                          |  9 ++---
 skills/grill/SKILL.md                     | 29 ++++++++++++++--
 skills/ordo-help/SKILL.md                 |  1 +
 skills/ordo-init/SKILL.md                 | 55 ++++++++++++++++++++++++++---
 skills/plan-orchestration/SKILL.md        |  8 +++--
 skills/plan/SKILL.md                      | 34 +++++++++++++++++-
 skills/repo-setup/SKILL.md                | 58 ++++++++++++++++++++++++++++---
 skills/repo-setup/templates/plan-terms.md |  7 ++--
 skills/roadmap/SKILL.md                   | 44 +++++++++++++++++++----
 skills/spec/SKILL.md                      | 10 +++++-
 14 files changed, 244 insertions(+), 37 deletions(-)
[exit 0]

$ git diff --name-only | wc -l
      14
[exit 0]
```

`sync_rules.py ... --only glossary` exits 0; `gen_figures.py` exits 0 and leaves `git status --short` as it was (the two listings are equal); `git diff --stat` shows the fourteen files and no other, and the ledger files of the worktree are tracked and unchanged. After this report was written, the only entry of `git status --short` besides the fourteen modified files is the report itself:
```
$ git status --short | grep -v '^ M'
?? .scratch/2-e-grill/agents/reviews/9a-report.md
[exit 0]
```

### Check 4, ASCII over the fourteen files

```
$ LC_ALL=C grep -n '[^ -~]' README.md docs/figures/gen_figures.py docs/figures/pipeline.svg docs/figures/plan-loop.svg docs/glossary.md skills/grill/SKILL.md skills/ordo-help/SKILL.md skills/ordo-init/SKILL.md skills/plan-orchestration/SKILL.md skills/plan/SKILL.md skills/repo-setup/SKILL.md skills/repo-setup/templates/plan-terms.md skills/roadmap/SKILL.md skills/spec/SKILL.md 
[exit 1]

$ cd $TMPDIR/9a-build/head && LC_ALL=C grep -n '[^ -~]' README.md docs/figures/gen_figures.py docs/figures/pipeline.svg docs/figures/plan-loop.svg docs/glossary.md skills/grill/SKILL.md skills/ordo-help/SKILL.md skills/ordo-init/SKILL.md skills/plan-orchestration/SKILL.md skills/plan/SKILL.md skills/repo-setup/SKILL.md skills/repo-setup/templates/plan-terms.md skills/roadmap/SKILL.md skills/spec/SKILL.md 
[exit 1]
```

Both print no line and exit 1 (grep's status for no match): the changed tree prints no line, so it prints none the unchanged tree did not print (the second command is the same grep on the unchanged tree). The land runner's own ASCII command (check 1, last command) covers the tracked and untracked files and passed.

### Check 5, the removed sentence

```
$ git grep -n 'stay stops of their own' -- skills docs
[exit 1]
```

### Check 6, counts of `quoted ruling` and `--ruling`

```
$ git grep -n -c 'quoted ruling\|--ruling' -- skills docs README.md
README.md:1
docs/figures/gen_figures.py:1
docs/figures/pipeline.svg:1
docs/figures/plan-loop.svg:1
docs/glossary.md:5
skills/grill/SKILL.md:11
skills/ordo-help/SKILL.md:1
skills/ordo-init/SKILL.md:21
skills/plan-orchestration/SKILL.md:3
skills/plan/SKILL.md:11
skills/repo-setup/SKILL.md:21
skills/repo-setup/templates/plan-terms.md:4
skills/roadmap/SKILL.md:14
skills/spec/SKILL.md:3
[exit 0]
```

Each hit was read as case R11 says. `git grep -n 'quoted ruling\|--ruling'` over the skills, the README and the script prints 94 lines outside `plan-terms.md`; the list below is that output. Each use is in the glossary sense of **quoted ruling** (a bullet given to a skill by `--ruling <ledger file> "<name>"`, with its sub-bullets), each line holds one rule, each rule stands in the step where it applies, and the word is never used for an ordinary ruling.

```
$ git grep -n 'quoted ruling\|--ruling' -- skills README.md docs/figures/gen_figures.py | grep -v -e 'templates/plan-terms.md'
README.md:54:The pipeline below marks where each skill of a roadmap entry asks you. A stop marked "every run" waits on you each time, unless the run is under a quoted ruling that states the change. One marked "only when" waits on you in a named case. You may skip a skill marked "optional".
docs/figures/gen_figures.py:395:        'A stop marked "every run" waits each time, unless the run is under a quoted ruling that '
skills/grill/SKILL.md:18:/grill <entry> --ruling <ledger file> "<name>"                  the same, under a quoted ruling: a roadmap diff that is the ruled text is written without its decision
skills/grill/SKILL.md:55:11. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
skills/grill/SKILL.md:57:    - The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.
skills/grill/SKILL.md:63:      - `--ruling` is not followed by the file and the name as the last two arguments of the invocation.
skills/grill/SKILL.md:120:    - An entry changed under a quoted ruling is listed with the ruling's name and its ledger file.
skills/grill/SKILL.md:126:    - The commit message names a quoted ruling an entry was changed under, by its name and its ledger file.
skills/grill/SKILL.md:185:   - A roadmap diff written under a quoted ruling gets no bullet, since the quoted ruling is its ruling.
skills/grill/SKILL.md:199:   - Under a quoted ruling ("What it reads" 11) whose sub-bullets hold the entry's changed text, the draft is made at the first write of Steps 8.
skills/grill/SKILL.md:206:   - The item is done when the diff is a decision of the next round, or, after the yes or under a quoted ruling, the entry read back holds the change.
skills/grill/SKILL.md:250:| A round | Every round, at Steps 6, the "record as ADR?" decisions and each roadmap diff no quoted ruling states riding in it | The frontier as decisions in the decision form, and the answer form | The user's answers |
skills/grill/SKILL.md:272:  - A quoted ruling that holds the entry's changed text is the user's answer to the roadmap diff.
skills/ordo-help/SKILL.md:76:                              after a ruling on an option that runs a skill and states the change, that skill is run with --ruling <ledger file> "<name>" before /spec is typed again
skills/ordo-init/SKILL.md:16:/ordo-init --ruling <ledger file> "<name>"   the same, under a quoted ruling: a draft the ruling states is written without the stop
skills/ordo-init/SKILL.md:33:   - When the skill runs alone under a quoted ruling that states whether it may commit, the commit rule is what the ruling states.
skills/ordo-init/SKILL.md:35:5. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
skills/ordo-init/SKILL.md:37:   - The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.
skills/ordo-init/SKILL.md:43:     - `--ruling` is not followed by the file and the name as the last two arguments of the invocation.
skills/ordo-init/SKILL.md:58:   - Under a quoted ruling ("What it reads" 5), the draft takes the ruling's form, keys, `.gitignore` changes and page texts.
skills/ordo-init/SKILL.md:66:   - Under a quoted ruling that states `roadmap`, the key is the ruling's.
skills/ordo-init/SKILL.md:83:   - A key whose value a quoted ruling states is not asked.
skills/ordo-init/SKILL.md:105:    - The commit question is left out when a quoted ruling states whether the skill may commit.
skills/ordo-init/SKILL.md:108:    - Under a quoted ruling, compare the draft Steps 10 shows with the ruling.
skills/ordo-init/SKILL.md:122:    - A setup written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
skills/ordo-init/SKILL.md:134:   - A fix a quoted ruling states is made without the stop.
skills/ordo-init/SKILL.md:136:   - The item is done when each error has its fix made under a quoted ruling, or proposed at the stop.
skills/ordo-init/SKILL.md:139:   - A fix made under a quoted ruling is listed with the check's output, with the ruling's name and its ledger file.
skills/ordo-init/SKILL.md:146:| The draft | Every setup, at Steps 11, except a draft a quoted ruling states as Steps 11 says, where only a commit question the ruling leaves open is asked | What Steps 10 lists | The user's approval or correction, and, when the skill runs alone, the answer to the commit question |
skills/ordo-init/SKILL.md:147:| Several roadmaps | More than one roadmap candidate, and no quoted ruling states `roadmap` | The candidates | The user's pick |
skills/ordo-init/SKILL.md:148:| Worker, reviewer and libraries | Every setup, at Steps 6, for each key a quoted ruling does not state | The offered answer for `worker` and `reviewer`, and the two values of `libraries` with what each means, as Steps 6 names them | The user's answers |
skills/ordo-init/SKILL.md:150:| A fix in the check | The check reports an error in an existing file, and no quoted ruling states its fix | The error and the proposed fix | The user's approval |
skills/ordo-init/SKILL.md:151:| No commit allowed | The repository's commit rule does not allow the commit, at Steps 14, when the skill runs alone | The files written, the quoted ruling named when the setup was written under one, and the command that shows them (`git status --short`) | The user's commit |
skills/ordo-init/SKILL.md:163:  - A quoted ruling that states the draft is that approval.
skills/ordo-init/SKILL.md:169:  - Under a quoted ruling that states the change, it is made without being shown for approval, as Steps 11 and "Steps / Checking an existing file" 4 say.
skills/plan-orchestration/SKILL.md:306:  - An option that runs a skill with an approval stop (`/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill`) states the change in full, as that skill's text says a quoted ruling must state it, or names that skill's approval stop as a stop of its own.
skills/plan-orchestration/SKILL.md:308:  - It then runs the skill with `--ruling <ledger file> "<name>"`.
skills/plan-orchestration/SKILL.md:340:- Every skill the loop invokes (`/spec`, `/refute`, `/land`, `academic-paper` for manuscript content, `/roadmap` at the closing, and `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill` run under a quoted ruling) is invoked through the runner every time, after a compaction too, and never carried out from remembered text.
skills/plan/SKILL.md:17:/plan <entry> --ruling <ledger file> "<name>"   the same, under a quoted ruling: a step list that is the ruled one is written without the stop
skills/plan/SKILL.md:43:6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
skills/plan/SKILL.md:45:   - The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.
skills/plan/SKILL.md:51:     - `--ruling` is not followed by the file and the name as the last two arguments of the invocation.
skills/plan/SKILL.md:68:   - A quoted ruling that stands in the rulings file is copied with every line under it, its sub-bullets and their fenced blocks, and none of them is a line left to place.
skills/plan/SKILL.md:72:   - Under a quoted ruling ("What it reads" 6), the step list is the ruling's, each step with its check.
skills/plan/SKILL.md:87:   - Under a quoted ruling, the draft is written without the stop only when four things hold.
skills/plan/SKILL.md:93:   - The ruling's bullet and every line under it are copied into the Rulings section of a plan written under a quoted ruling, unless Steps 2 copied them from the rulings file.
skills/plan/SKILL.md:94:   - A step list written under a quoted ruling is the approved list.
skills/plan/SKILL.md:108:   - A plan written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
skills/plan/SKILL.md:117:| The drafted step list | Every plan, after Steps 2, except a draft written under a quoted ruling as Steps 3 says: the skill does the mechanical half of opening a plan and stops at the design half | The drafted `plan.md`: the goal, the gate, the steps and each step's check, and in "## Gate" the answer to "could this pass without the goal being reached?" with its reason for the gate and for each step's check, and the design decisions no ADR in force or ruling settles and the rulings file's lines left to place (Steps 3) | The user's approval or correction |
skills/repo-setup/SKILL.md:17:/repo-setup ... --ruling <ledger file> "<name>"   either form, under a quoted ruling: a draft or a sync change the ruling states is written without the stop
skills/repo-setup/SKILL.md:36:6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
skills/repo-setup/SKILL.md:38:   - The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.
skills/repo-setup/SKILL.md:44:     - `--ruling` is not followed by the file and the name as the last two arguments of the invocation.
skills/repo-setup/SKILL.md:56:   - A question a quoted ruling answers ("What it reads" 6) is not asked.
skills/repo-setup/SKILL.md:62:   - Under a quoted ruling ("What it reads" 6), a file whose full text the ruling holds is drafted as that text.
skills/repo-setup/SKILL.md:80:   - Under a quoted ruling, the draft is written without the stop only when four things hold.
skills/repo-setup/SKILL.md:88:   - The step is done when the user has approved or corrected the draft, or a quoted ruling covers it.
skills/repo-setup/SKILL.md:96:   - Under a quoted ruling, `/ordo-init` is run with the same `--ruling` arguments.
skills/repo-setup/SKILL.md:120:    - A setup written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
skills/repo-setup/SKILL.md:133:   - Under a quoted ruling whose hunks are the hunks of the diff, each with the choice for it, the choices are applied without the stop.
skills/repo-setup/SKILL.md:135:   - The item is done when each hunk has the user's ruling or the quoted ruling's choice.
skills/repo-setup/SKILL.md:143:   - Under a quoted ruling that states the drafted change, the draft of Steps / sync 4 takes the ruling's text.
skills/repo-setup/SKILL.md:147:   - The item is done when the drafted change is shown, or written under a quoted ruling.
skills/repo-setup/SKILL.md:155:   - A change written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
skills/repo-setup/SKILL.md:206:| The questions | Every setup, at Steps 2, for each question a quoted ruling does not answer | The questions asked, each with its default | The user's answers |
skills/repo-setup/SKILL.md:207:| The draft | Every setup, at Steps 4, except a draft a quoted ruling covers as Steps 4 says | The tree, every file's text with the copied hook named by its source, and the placeholders that Steps 3 lists for the user's value | The user's approval or correction |
skills/repo-setup/SKILL.md:208:| A hunk to rule on | `sync` exits 1, except a diff whose hunks are a quoted ruling's (Steps / sync 3) | The diff | The user's ruling per hunk |
skills/repo-setup/SKILL.md:209:| The drafted sync change | `sync` exits 2 with an `error:` line of Steps / sync 4, for the shared-rules block or the plan-terms block, except a change a quoted ruling states (Steps / sync 5) | The change Steps / sync 4 drafts | The user's approval |
skills/repo-setup/SKILL.md:212:| No commit allowed | The repository's commit rule (the answer to question 5 in a setup) does not allow the commit, at Steps 12 or Steps / sync 9 | The files changed, the quoted ruling named when they were written under one, and the command that shows them (`git status --short`) | The user's commit |
skills/repo-setup/SKILL.md:231:  - A quoted ruling that covers the draft as Steps 4 says is that approval.
skills/roadmap/SKILL.md:22:/roadmap <command> ... --ruling <ledger file> "<name>"   add, move, done or drop under a quoted ruling: a draft that is the ruled change is written without the stop
skills/roadmap/SKILL.md:42:6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
skills/roadmap/SKILL.md:44:   - The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.
skills/roadmap/SKILL.md:50:     - `--ruling` is not followed by the file and the name as the last two arguments of the invocation.
skills/roadmap/SKILL.md:63:   - Under a quoted ruling ("What it reads" 6), the draft takes the ruling's text.
skills/roadmap/SKILL.md:72:   - Under a quoted ruling, compare the draft, after the command's subsection has been worked on it, with the change the ruling states.
skills/roadmap/SKILL.md:77:   - A change written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
skills/roadmap/SKILL.md:98:   - Under a quoted ruling the ruled gate is not redrafted.
skills/roadmap/SKILL.md:102:   - The step is done when the answer with its reason stands in the draft, and the gate's answer is no or the gate is a quoted ruling's.
skills/roadmap/SKILL.md:135:  - A goal that does not settle it, with no quoted ruling that does, is a stop ("Stops").
skills/roadmap/SKILL.md:139:- **No insertion form yet.** A stop ("Stops"), unless a quoted ruling states the entry's number.
skills/roadmap/SKILL.md:162:| The change | Every change of `add`, `move`, `done` or `drop`, at Steps 3, except a draft written under a quoted ruling as Steps 4 says | What Steps 3 shows | The user's approval or correction |
skills/roadmap/SKILL.md:164:| The level | Entries exist at two levels and neither the goal nor a quoted ruling settles which | The two levels | The user's choice |
skills/roadmap/SKILL.md:165:| The insertion form | The file has no insertion form yet, and no quoted ruling states the entry's number | The question, once | The user's answer, used from then on |
skills/spec/SKILL.md:226:   - that bullet is the quoted ruling the session gives the skill;
skills/spec/SKILL.md:237:   - After a ruling on an option that runs a skill and states the change in full, that skill is run first, with `--ruling <ledger file> "<name>"`.
skills/spec/SKILL.md:238:   - The item is done when the skill a quoted ruling was booked for has run under it, and `/spec` has written the brief.
[exit 0]
```

### Check 7, the indent of each added line

The script `indent_check.py` lists each added bullet line with its indent, the indent of the line above and below it, and its parent; a line with a neighbour at its own indent is `OK`, the others `CHECK`. The rule of "What to build": three spaces under a one-digit numbered item, four under a two-digit one, two under a top-level bullet, two more than the parent under a sub-bullet. Each `CHECK` line is resolved below by the parent line it stands under.

```
OK   docs/glossary.md:25 indent=0 above=0 below=0 parent=None
OK   docs/glossary.md:80 indent=0 above=0 below=0 parent=None
OK   docs/glossary.md:97 indent=0 above=0 below=0 parent=None
OK   docs/glossary.md:98 indent=0 above=0 below=0 parent=None
OK   docs/glossary.md:134 indent=0 above=0 below=0 parent=None
OK   skills/grill/SKILL.md:56 indent=4 above=0 below=4 parent=(55, 0)
OK   skills/grill/SKILL.md:57 indent=4 above=4 below=4 parent=(55, 0)
OK   skills/grill/SKILL.md:58 indent=4 above=4 below=4 parent=(55, 0)
OK   skills/grill/SKILL.md:59 indent=4 above=4 below=4 parent=(55, 0)
OK   skills/grill/SKILL.md:60 indent=4 above=4 below=4 parent=(55, 0)
OK   skills/grill/SKILL.md:61 indent=4 above=4 below=4 parent=(55, 0)
OK   skills/grill/SKILL.md:62 indent=4 above=4 below=6 parent=(55, 0)
OK   skills/grill/SKILL.md:63 indent=6 above=4 below=6 parent=(62, 4)
OK   skills/grill/SKILL.md:64 indent=6 above=6 below=6 parent=(62, 4)
OK   skills/grill/SKILL.md:65 indent=6 above=6 below=6 parent=(62, 4)
OK   skills/grill/SKILL.md:66 indent=6 above=6 below=6 parent=(62, 4)
OK   skills/grill/SKILL.md:67 indent=6 above=6 below=4 parent=(62, 4)
CHECK skills/grill/SKILL.md:68 indent=4 above=6 below=None parent=(55, 0)
OK   skills/grill/SKILL.md:120 indent=4 above=4 below=4 parent=(118, 0)
OK   skills/grill/SKILL.md:126 indent=4 above=4 below=4 parent=(118, 0)
OK   skills/grill/SKILL.md:185 indent=3 above=3 below=3 parent=(180, 0)
OK   skills/grill/SKILL.md:199 indent=3 above=3 below=3 parent=(195, 0)
OK   skills/grill/SKILL.md:200 indent=3 above=3 below=3 parent=(195, 0)
OK   skills/grill/SKILL.md:201 indent=3 above=3 below=3 parent=(195, 0)
OK   skills/grill/SKILL.md:202 indent=3 above=3 below=3 parent=(195, 0)
OK   skills/grill/SKILL.md:203 indent=3 above=3 below=3 parent=(195, 0)
OK   skills/grill/SKILL.md:204 indent=3 above=3 below=3 parent=(195, 0)
OK   skills/grill/SKILL.md:206 indent=3 above=3 below=0 parent=(195, 0)
CHECK skills/grill/SKILL.md:272 indent=2 above=0 below=0 parent=(271, 0)
CHECK skills/ordo-init/SKILL.md:33 indent=3 above=0 below=0 parent=(32, 0)
OK   skills/ordo-init/SKILL.md:36 indent=3 above=0 below=3 parent=(35, 0)
OK   skills/ordo-init/SKILL.md:37 indent=3 above=3 below=3 parent=(35, 0)
OK   skills/ordo-init/SKILL.md:38 indent=3 above=3 below=3 parent=(35, 0)
OK   skills/ordo-init/SKILL.md:39 indent=3 above=3 below=3 parent=(35, 0)
OK   skills/ordo-init/SKILL.md:40 indent=3 above=3 below=3 parent=(35, 0)
OK   skills/ordo-init/SKILL.md:41 indent=3 above=3 below=3 parent=(35, 0)
OK   skills/ordo-init/SKILL.md:42 indent=3 above=3 below=5 parent=(35, 0)
OK   skills/ordo-init/SKILL.md:43 indent=5 above=3 below=5 parent=(42, 3)
OK   skills/ordo-init/SKILL.md:44 indent=5 above=5 below=5 parent=(42, 3)
OK   skills/ordo-init/SKILL.md:45 indent=5 above=5 below=5 parent=(42, 3)
OK   skills/ordo-init/SKILL.md:46 indent=5 above=5 below=5 parent=(42, 3)
OK   skills/ordo-init/SKILL.md:47 indent=5 above=5 below=3 parent=(42, 3)
CHECK skills/ordo-init/SKILL.md:48 indent=3 above=5 below=None parent=(35, 0)
OK   skills/ordo-init/SKILL.md:58 indent=3 above=3 below=3 parent=(54, 0)
OK   skills/ordo-init/SKILL.md:59 indent=3 above=3 below=3 parent=(54, 0)
OK   skills/ordo-init/SKILL.md:60 indent=3 above=3 below=0 parent=(54, 0)
OK   skills/ordo-init/SKILL.md:66 indent=3 above=3 below=3 parent=(61, 0)
OK   skills/ordo-init/SKILL.md:67 indent=3 above=3 below=3 parent=(61, 0)
OK   skills/ordo-init/SKILL.md:69 indent=3 above=3 below=0 parent=(61, 0)
OK   skills/ordo-init/SKILL.md:83 indent=3 above=0 below=3 parent=(82, 0)
OK   skills/ordo-init/SKILL.md:84 indent=3 above=3 below=3 parent=(82, 0)
OK   skills/ordo-init/SKILL.md:89 indent=3 above=3 below=0 parent=(82, 0)
OK   skills/ordo-init/SKILL.md:105 indent=4 above=0 below=4 parent=(104, 0)
OK   skills/ordo-init/SKILL.md:106 indent=4 above=4 below=0 parent=(104, 0)
OK   skills/ordo-init/SKILL.md:108 indent=4 above=0 below=4 parent=(107, 0)
OK   skills/ordo-init/SKILL.md:109 indent=4 above=4 below=4 parent=(107, 0)
OK   skills/ordo-init/SKILL.md:110 indent=4 above=4 below=4 parent=(107, 0)
OK   skills/ordo-init/SKILL.md:111 indent=4 above=4 below=4 parent=(107, 0)
OK   skills/ordo-init/SKILL.md:112 indent=4 above=4 below=4 parent=(107, 0)
OK   skills/ordo-init/SKILL.md:113 indent=4 above=4 below=4 parent=(107, 0)
OK   skills/ordo-init/SKILL.md:114 indent=4 above=4 below=0 parent=(107, 0)
OK   skills/ordo-init/SKILL.md:122 indent=4 above=4 below=4 parent=(119, 0)
OK   skills/ordo-init/SKILL.md:123 indent=4 above=4 below=4 parent=(119, 0)
OK   skills/ordo-init/SKILL.md:124 indent=4 above=4 below=4 parent=(119, 0)
OK   skills/ordo-init/SKILL.md:125 indent=4 above=4 below=None parent=(119, 0)
OK   skills/ordo-init/SKILL.md:134 indent=3 above=0 below=3 parent=(133, 0)
OK   skills/ordo-init/SKILL.md:135 indent=3 above=3 below=3 parent=(133, 0)
OK   skills/ordo-init/SKILL.md:136 indent=3 above=3 below=0 parent=(133, 0)
OK   skills/ordo-init/SKILL.md:139 indent=3 above=0 below=3 parent=(138, 0)
OK   skills/ordo-init/SKILL.md:140 indent=3 above=3 below=None parent=(138, 0)
CHECK skills/ordo-init/SKILL.md:163 indent=2 above=0 below=0 parent=(162, 0)
CHECK skills/ordo-init/SKILL.md:169 indent=2 above=0 below=0 parent=(168, 0)
OK   skills/plan-orchestration/SKILL.md:304 indent=2 above=2 below=2 parent=(301, 0)
OK   skills/plan-orchestration/SKILL.md:305 indent=2 above=2 below=2 parent=(301, 0)
OK   skills/plan-orchestration/SKILL.md:306 indent=2 above=2 below=2 parent=(301, 0)
OK   skills/plan-orchestration/SKILL.md:307 indent=2 above=2 below=2 parent=(301, 0)
OK   skills/plan-orchestration/SKILL.md:308 indent=2 above=2 below=0 parent=(301, 0)
CHECK skills/plan-orchestration/SKILL.md:340 indent=0 above=2 below=None parent=None
OK   skills/plan/SKILL.md:44 indent=3 above=0 below=3 parent=(43, 0)
OK   skills/plan/SKILL.md:45 indent=3 above=3 below=3 parent=(43, 0)
OK   skills/plan/SKILL.md:46 indent=3 above=3 below=3 parent=(43, 0)
OK   skills/plan/SKILL.md:47 indent=3 above=3 below=3 parent=(43, 0)
OK   skills/plan/SKILL.md:48 indent=3 above=3 below=3 parent=(43, 0)
OK   skills/plan/SKILL.md:49 indent=3 above=3 below=3 parent=(43, 0)
OK   skills/plan/SKILL.md:50 indent=3 above=3 below=5 parent=(43, 0)
OK   skills/plan/SKILL.md:51 indent=5 above=3 below=5 parent=(50, 3)
OK   skills/plan/SKILL.md:52 indent=5 above=5 below=5 parent=(50, 3)
OK   skills/plan/SKILL.md:53 indent=5 above=5 below=5 parent=(50, 3)
OK   skills/plan/SKILL.md:54 indent=5 above=5 below=5 parent=(50, 3)
OK   skills/plan/SKILL.md:55 indent=5 above=5 below=3 parent=(50, 3)
CHECK skills/plan/SKILL.md:56 indent=3 above=5 below=None parent=(43, 0)
OK   skills/plan/SKILL.md:68 indent=3 above=3 below=3 parent=(64, 0)
OK   skills/plan/SKILL.md:72 indent=3 above=3 below=3 parent=(64, 0)
OK   skills/plan/SKILL.md:73 indent=3 above=3 below=3 parent=(64, 0)
OK   skills/plan/SKILL.md:74 indent=3 above=3 below=3 parent=(64, 0)
OK   skills/plan/SKILL.md:81 indent=3 above=3 below=0 parent=(64, 0)
OK   skills/plan/SKILL.md:87 indent=3 above=3 below=5 parent=(82, 0)
OK   skills/plan/SKILL.md:88 indent=5 above=3 below=5 parent=(87, 3)
OK   skills/plan/SKILL.md:89 indent=5 above=5 below=5 parent=(87, 3)
OK   skills/plan/SKILL.md:90 indent=5 above=5 below=5 parent=(87, 3)
OK   skills/plan/SKILL.md:91 indent=5 above=5 below=3 parent=(87, 3)
OK   skills/plan/SKILL.md:92 indent=3 above=5 below=3 parent=(82, 0)
OK   skills/plan/SKILL.md:93 indent=3 above=3 below=3 parent=(82, 0)
OK   skills/plan/SKILL.md:94 indent=3 above=3 below=3 parent=(82, 0)
OK   skills/plan/SKILL.md:96 indent=3 above=3 below=0 parent=(82, 0)
OK   skills/plan/SKILL.md:108 indent=3 above=3 below=3 parent=(106, 0)
OK   skills/plan/SKILL.md:109 indent=3 above=3 below=3 parent=(106, 0)
OK   skills/plan/SKILL.md:111 indent=3 above=3 below=None parent=(106, 0)
OK   skills/repo-setup/SKILL.md:37 indent=3 above=0 below=3 parent=(36, 0)
OK   skills/repo-setup/SKILL.md:38 indent=3 above=3 below=3 parent=(36, 0)
OK   skills/repo-setup/SKILL.md:39 indent=3 above=3 below=3 parent=(36, 0)
OK   skills/repo-setup/SKILL.md:40 indent=3 above=3 below=3 parent=(36, 0)
OK   skills/repo-setup/SKILL.md:41 indent=3 above=3 below=3 parent=(36, 0)
OK   skills/repo-setup/SKILL.md:42 indent=3 above=3 below=3 parent=(36, 0)
OK   skills/repo-setup/SKILL.md:43 indent=3 above=3 below=5 parent=(36, 0)
OK   skills/repo-setup/SKILL.md:44 indent=5 above=3 below=5 parent=(43, 3)
OK   skills/repo-setup/SKILL.md:45 indent=5 above=5 below=5 parent=(43, 3)
OK   skills/repo-setup/SKILL.md:46 indent=5 above=5 below=5 parent=(43, 3)
OK   skills/repo-setup/SKILL.md:47 indent=5 above=5 below=5 parent=(43, 3)
OK   skills/repo-setup/SKILL.md:48 indent=5 above=5 below=3 parent=(43, 3)
CHECK skills/repo-setup/SKILL.md:49 indent=3 above=5 below=None parent=(36, 0)
OK   skills/repo-setup/SKILL.md:56 indent=3 above=0 below=3 parent=(55, 0)
OK   skills/repo-setup/SKILL.md:57 indent=3 above=3 below=3 parent=(55, 0)
OK   skills/repo-setup/SKILL.md:58 indent=3 above=3 below=3 parent=(55, 0)
OK   skills/repo-setup/SKILL.md:59 indent=3 above=3 below=0 parent=(55, 0)
OK   skills/repo-setup/SKILL.md:62 indent=3 above=3 below=3 parent=(60, 0)
CHECK skills/repo-setup/SKILL.md:78 indent=3 above=5 below=0 parent=(60, 0)
CHECK skills/repo-setup/SKILL.md:80 indent=3 above=0 below=5 parent=(79, 0)
OK   skills/repo-setup/SKILL.md:81 indent=5 above=3 below=5 parent=(80, 3)
OK   skills/repo-setup/SKILL.md:82 indent=5 above=5 below=5 parent=(80, 3)
OK   skills/repo-setup/SKILL.md:83 indent=5 above=5 below=5 parent=(80, 3)
OK   skills/repo-setup/SKILL.md:84 indent=5 above=5 below=3 parent=(80, 3)
OK   skills/repo-setup/SKILL.md:85 indent=3 above=5 below=3 parent=(79, 0)
OK   skills/repo-setup/SKILL.md:86 indent=3 above=3 below=3 parent=(79, 0)
OK   skills/repo-setup/SKILL.md:87 indent=3 above=3 below=3 parent=(79, 0)
OK   skills/repo-setup/SKILL.md:88 indent=3 above=3 below=0 parent=(79, 0)
OK   skills/repo-setup/SKILL.md:96 indent=3 above=3 below=3 parent=(94, 0)
OK   skills/repo-setup/SKILL.md:97 indent=3 above=3 below=3 parent=(94, 0)
OK   skills/repo-setup/SKILL.md:100 indent=3 above=3 below=0 parent=(94, 0)
OK   skills/repo-setup/SKILL.md:120 indent=4 above=4 below=4 parent=(116, 0)
OK   skills/repo-setup/SKILL.md:121 indent=4 above=4 below=4 parent=(116, 0)
OK   skills/repo-setup/SKILL.md:124 indent=4 above=4 below=None parent=(116, 0)
OK   skills/repo-setup/SKILL.md:133 indent=3 above=3 below=3 parent=(130, 0)
OK   skills/repo-setup/SKILL.md:134 indent=3 above=3 below=3 parent=(130, 0)
OK   skills/repo-setup/SKILL.md:135 indent=3 above=3 below=0 parent=(130, 0)
OK   skills/repo-setup/SKILL.md:143 indent=3 above=0 below=3 parent=(142, 0)
OK   skills/repo-setup/SKILL.md:144 indent=3 above=3 below=3 parent=(142, 0)
OK   skills/repo-setup/SKILL.md:145 indent=3 above=3 below=3 parent=(142, 0)
OK   skills/repo-setup/SKILL.md:146 indent=3 above=3 below=3 parent=(142, 0)
OK   skills/repo-setup/SKILL.md:147 indent=3 above=3 below=0 parent=(142, 0)
OK   skills/repo-setup/SKILL.md:155 indent=3 above=0 below=3 parent=(154, 0)
OK   skills/repo-setup/SKILL.md:156 indent=3 above=3 below=3 parent=(154, 0)
OK   skills/repo-setup/SKILL.md:157 indent=3 above=3 below=None parent=(154, 0)
CHECK skills/repo-setup/SKILL.md:231 indent=2 above=0 below=0 parent=(230, 0)
OK   skills/repo-setup/templates/plan-terms.md:20 indent=0 above=0 below=0 parent=None
OK   skills/repo-setup/templates/plan-terms.md:75 indent=0 above=0 below=0 parent=None
OK   skills/repo-setup/templates/plan-terms.md:92 indent=0 above=0 below=0 parent=None
OK   skills/repo-setup/templates/plan-terms.md:93 indent=0 above=0 below=0 parent=None
OK   skills/roadmap/SKILL.md:43 indent=3 above=0 below=3 parent=(42, 0)
OK   skills/roadmap/SKILL.md:44 indent=3 above=3 below=3 parent=(42, 0)
OK   skills/roadmap/SKILL.md:45 indent=3 above=3 below=3 parent=(42, 0)
OK   skills/roadmap/SKILL.md:46 indent=3 above=3 below=3 parent=(42, 0)
OK   skills/roadmap/SKILL.md:47 indent=3 above=3 below=3 parent=(42, 0)
OK   skills/roadmap/SKILL.md:48 indent=3 above=3 below=3 parent=(42, 0)
OK   skills/roadmap/SKILL.md:49 indent=3 above=3 below=5 parent=(42, 0)
OK   skills/roadmap/SKILL.md:50 indent=5 above=3 below=5 parent=(49, 3)
OK   skills/roadmap/SKILL.md:51 indent=5 above=5 below=5 parent=(49, 3)
OK   skills/roadmap/SKILL.md:52 indent=5 above=5 below=5 parent=(49, 3)
OK   skills/roadmap/SKILL.md:53 indent=5 above=5 below=5 parent=(49, 3)
OK   skills/roadmap/SKILL.md:54 indent=5 above=5 below=3 parent=(49, 3)
CHECK skills/roadmap/SKILL.md:55 indent=3 above=5 below=None parent=(42, 0)
OK   skills/roadmap/SKILL.md:63 indent=3 above=3 below=3 parent=(61, 0)
OK   skills/roadmap/SKILL.md:64 indent=3 above=3 below=3 parent=(61, 0)
OK   skills/roadmap/SKILL.md:65 indent=3 above=3 below=3 parent=(61, 0)
OK   skills/roadmap/SKILL.md:66 indent=3 above=3 below=3 parent=(61, 0)
OK   skills/roadmap/SKILL.md:67 indent=3 above=3 below=3 parent=(61, 0)
OK   skills/roadmap/SKILL.md:68 indent=3 above=3 below=3 parent=(61, 0)
OK   skills/roadmap/SKILL.md:69 indent=3 above=3 below=0 parent=(61, 0)
OK   skills/roadmap/SKILL.md:72 indent=3 above=0 below=3 parent=(71, 0)
OK   skills/roadmap/SKILL.md:73 indent=3 above=3 below=3 parent=(71, 0)
OK   skills/roadmap/SKILL.md:74 indent=3 above=3 below=3 parent=(71, 0)
OK   skills/roadmap/SKILL.md:75 indent=3 above=3 below=0 parent=(71, 0)
OK   skills/roadmap/SKILL.md:77 indent=3 above=0 below=3 parent=(76, 0)
OK   skills/roadmap/SKILL.md:78 indent=3 above=3 below=None parent=(76, 0)
OK   skills/roadmap/SKILL.md:98 indent=3 above=3 below=3 parent=(95, 0)
OK   skills/roadmap/SKILL.md:99 indent=3 above=3 below=3 parent=(95, 0)
OK   skills/roadmap/SKILL.md:100 indent=3 above=3 below=3 parent=(95, 0)
OK   skills/roadmap/SKILL.md:101 indent=3 above=3 below=3 parent=(95, 0)
OK   skills/roadmap/SKILL.md:102 indent=3 above=3 below=0 parent=(95, 0)
CHECK skills/roadmap/SKILL.md:135 indent=2 above=0 below=0 parent=(134, 0)
OK   skills/roadmap/SKILL.md:139 indent=0 above=0 below=0 parent=None
OK   skills/spec/SKILL.md:200 indent=5 above=5 below=5 parent=(197, 3)
OK   skills/spec/SKILL.md:201 indent=5 above=5 below=5 parent=(197, 3)
OK   skills/spec/SKILL.md:202 indent=5 above=5 below=3 parent=(197, 3)
OK   skills/spec/SKILL.md:205 indent=3 above=3 below=0 parent=(196, 0)
OK   skills/spec/SKILL.md:225 indent=3 above=3 below=3 parent=(219, 0)
OK   skills/spec/SKILL.md:226 indent=3 above=3 below=3 parent=(219, 0)
OK   skills/spec/SKILL.md:227 indent=3 above=3 below=3 parent=(219, 0)
OK   skills/spec/SKILL.md:237 indent=3 above=3 below=3 parent=(235, 0)
OK   skills/spec/SKILL.md:238 indent=3 above=3 below=None parent=(235, 0)
```

186 lines are `OK`. The 14 `CHECK` lines, each resolved by its parent line (printed by the same scratch run):

```
skills/grill/SKILL.md:68 indent 4; parent line 55 (numbered item with 2-digit numeral, expected 4): 11. The quoted ruling, when the invocation ends with `--ruling <ledger
skills/grill/SKILL.md:272 indent 2; parent line 271 (top-level bullet, expected 2): - A decision is the user's: nothing is written as settled without the 
skills/ordo-init/SKILL.md:33 indent 3; parent line 32 (numbered item with 1-digit numeral, expected 3): 3. The repository's commit rule: the answer to `repo-setup`'s question
skills/ordo-init/SKILL.md:48 indent 3; parent line 35 (numbered item with 1-digit numeral, expected 3): 5. The quoted ruling, when the invocation ends with `--ruling <ledger 
skills/ordo-init/SKILL.md:163 indent 2; parent line 162 (top-level bullet, expected 2): - The skill writes nothing until the user approves or corrects the dra
skills/ordo-init/SKILL.md:169 indent 2; parent line 168 (top-level bullet, expected 2): - A change to an existing file, `.gitignore` included, is shown as a d
skills/plan/SKILL.md:56 indent 3; parent line 43 (numbered item with 1-digit numeral, expected 3): 6. The quoted ruling, when the invocation ends with `--ruling <ledger 
skills/repo-setup/SKILL.md:49 indent 3; parent line 36 (numbered item with 1-digit numeral, expected 3): 6. The quoted ruling, when the invocation ends with `--ruling <ledger 
skills/repo-setup/SKILL.md:78 indent 3; parent line 60 (numbered item with 1-digit numeral, expected 3): 3. Draft "The tree", every file with its full text.
skills/repo-setup/SKILL.md:80 indent 3; parent line 79 (numbered item with 1-digit numeral, expected 3): 4. Show the draft, the tree and every file's text, the copied hook nam
skills/repo-setup/SKILL.md:231 indent 2; parent line 230 (top-level bullet, expected 2): - In a setup, after Steps 1, nothing is written until the user approve
skills/roadmap/SKILL.md:55 indent 3; parent line 42 (numbered item with 1-digit numeral, expected 3): 6. The quoted ruling, when the invocation ends with `--ruling <ledger 
skills/roadmap/SKILL.md:135 indent 2; parent line 134 (top-level bullet, expected 2): - **The level of an added entry.** It goes at the level the user names
```

`skills/plan-orchestration/SKILL.md:340` is the top-level Rules bullet the brief changes in place (item 7), at the indent it had; the other thirteen stand alone at the indent their parent gives.

### Check 8, case R12 and ruff

```
$ ruff check --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 --line-length 100 --target-version py39 docs/figures/gen_figures.py
All checks passed!
[exit 0]

$ ruff format --check --line-length 100 docs/figures/gen_figures.py
1 file already formatted
[exit 0]

$ grep -c 'A stop marked "every run" waits each time, unless the run is under a quoted ruling that states the change.' docs/figures/pipeline.svg docs/figures/plan-loop.svg
docs/figures/plan-loop.svg:1
docs/figures/pipeline.svg:1
[exit 0]

$ grep -o 'viewBox="0 0 1040 [0-9]*"' docs/figures/pipeline.svg docs/figures/plan-loop.svg
docs/figures/pipeline.svg:viewBox="0 0 1040 988"
docs/figures/plan-loop.svg:viewBox="0 0 1040 911"
[exit 0]

$ rsvg-convert docs/figures/pipeline.svg -o "$TMPDIR/pipeline.png" && rsvg-convert docs/figures/plan-loop.svg -o "$TMPDIR/plan-loop.png" && ls -l "$TMPDIR/pipeline.png" "$TMPDIR/plan-loop.png"
-rw-r--r--@ 1 axelfaes  staff  229850 Sep 30 19:54 /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//pipeline.png
-rw-r--r--@ 1 axelfaes  staff  259213 Sep 30 19:54 /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//plan-loop.png
[exit 0]
```

Both renders were read as images (`$TMPDIR/pipeline.png` and `$TMPDIR/plan-loop.png`). In each, the note "A stop marked "every run" waits each time, unless the run is under a quoted ruling that states the change." stands on its own muted line under the legend's row, inside the canvas and above its bottom edge; every box, arrow and label is where it was (the pipeline's roadmap row, the retro row, the /plan-orchestration band of the loop and the cards are unchanged in position; only the canvas is 22 px higher). Each SVG holds the note once (the two counts above), `pipeline.svg` has `viewBox="0 0 1040 988"` and `plan-loop.svg` `viewBox="0 0 1040 911"`, and `gen_figures.py` exits 0 (check 3).

### Check 9, reading

```
$ git diff -U0 -- README.md docs/glossary.md docs/figures/gen_figures.py skills | grep '^+' | grep -v '^+++' > $TMPDIR/9a-build/added_now.txt; echo "added lines: $(wc -l < $TMPDIR/9a-build/added_now.txt | tr -d ' ')"; echo "tabs: $(grep -c -e $'\t' $TMPDIR/9a-build/added_now.txt)"; echo "spaced hyphens inside a sentence: $(grep -c -E '[^ +] - ' $TMPDIR/9a-build/added_now.txt)"; echo "trailing spaces: $(grep -c -e ' $' $TMPDIR/9a-build/added_now.txt)"; echo "date or history words: $(grep -c -i -E '[0-9]{4}-[0-9]{2}-[0-9]{2}|previously|formerly|reverted|no longer|used to|originally|step 9a|2\.E' $TMPDIR/9a-build/added_now.txt)"
added lines: 238
tabs: 0
spaced hyphens inside a sentence: 0
trailing spaces: 0
date or history words: 0
[exit 0]
```

Each bullet, list item, cell and sentence the diff adds or changes was read against `docs/dev/skill-layout.md` and the prose standard's "E. Sentence shapes". Sentences longer than about 20 words are in part 7 with the reason each needs its length; none is rewritten. No other rule of the standard is broken by an added line: the counts above show no tab, no spaced hyphen inside a sentence, no trailing space and no date or history word in the added lines; each added line is one line of its item or cell.

## 6. The terms

### Entries the diff adds or changes, and entries whose named place the diff changes

Each line below is `grep -n -F` of the line of the named place that states the term, in the changed tree (the script `places.py`, disclosed in part 8, stops if a string matches other than one line in its file). The entries added or changed are in `docs/glossary.md` at: **quoted ruling** line 80, **commit rule** line 25, **ruling** line 97, **rulings file** line 98, **mark, of a figure** line 134 (`grep -n '^- \*\*quoted ruling\*\*' ...` below).

```
$ grep -n -e '^- \*\*quoted ruling\*\*' -e '^- \*\*commit rule\*\*' -e '^- \*\*ruling\*\*' -e '^- \*\*rulings file\*\*' -e '^- \*\*mark, of a figure\*\*' docs/glossary.md
25:- **commit rule**: whether the repository allows the skills to commit, the answer to `/repo-setup`'s question 5 or, for `/ordo-init` run alone, the user's answer at its approval stop or what a quoted ruling states on whether the skill may commit. Stated in: `repo-setup`, "The questions"; `ordo-init`, "What it reads" 3.
80:- **quoted ruling**: a ruling of the user given to a skill by the arguments `--ruling <ledger file> "<name>"`. The file is a plan's `plan.md` or a rulings file. The quoted ruling is the bullet of that name in it, whose first line ends with "(the user)", with the sub-bullets under it. The sub-bullets state the change in full. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops"; `plan`, "What it reads" 6; `roadmap`, "What it reads" 6; `ordo-init`, "What it reads" 5; `repo-setup`, "What it reads" 6; `grill`, "What it reads" 11.
97:- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. A ruling on an option that runs a skill with an approval stop and states the change is written there as a bullet with the change as sub-bullets, the quoted ruling. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled".
98:- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, and a quoted ruling with its sub-bullets, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6 and "Steps / Writing what settled".
134:- **mark, of a figure**: the label a box of the README's figures carries where the user is asked, each drawn with its own shape and word: "every run", a stop that waits on the user each time the skill runs, unless the run is under a quoted ruling that states the change; "only when", a stop that waits on the user only when its condition occurs; and "optional", a skill the user may run or skip, drawn as a dashed box. Stated in: `README.md`, the figures.
[exit 0]
```

```
- quoted ruling (entry added)
  - spec, "Steps / A ruling":
        skills/spec/SKILL.md:226:   - that bullet is the quoted ruling the session gives the skill;
  - plan-orchestration, "Stops":
        skills/plan-orchestration/SKILL.md:306:  - An option that runs a skill with an approval stop (`/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill`) states the change in full, as that skill's text says a quoted ruling must state it, or names that skill's approval stop as a stop of its own.
  - plan, "What it reads" 6:
        skills/plan/SKILL.md:43:6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
  - roadmap, "What it reads" 6:
        skills/roadmap/SKILL.md:42:6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
  - ordo-init, "What it reads" 5:
        skills/ordo-init/SKILL.md:35:5. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
  - repo-setup, "What it reads" 6:
        skills/repo-setup/SKILL.md:36:6. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.
  - grill, "What it reads" 11:
        skills/grill/SKILL.md:55:11. The quoted ruling, when the invocation ends with `--ruling <ledger file> "<name>"`.

- commit rule (entry changed)
  - repo-setup, "The questions":
        skills/repo-setup/SKILL.md:166:5. The commit rule for this repository [commit only when told].
  - ordo-init, "What it reads" 3:
        skills/ordo-init/SKILL.md:32:3. The repository's commit rule: the answer to `repo-setup`'s question 5 when `/repo-setup` runs this skill, or, when it runs alone, the user's answer at the approval stop of Steps 11.

- ruling (entry changed)
  - spec, "Steps / A ruling" 1:
        skills/spec/SKILL.md:213:1. The user closes a stop by typing the ruling as plain text, in any session on the repository:
  - spec, "What it reads" 4:
        skills/spec/SKILL.md:44:   - Each ruling a tag names is a line of the Rulings section that ends with "(the user)", named as the tag reads it: `<L>` for a line `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, and the text before its first ` (` for any other line.
  - plan-orchestration, "Stops":
        skills/plan-orchestration/SKILL.md:307:  - After the user's ruling on an option that states the change, the session books the ruling as the `spec` skill's "Steps / A ruling" says.
  - grill, "Steps / Writing what settled" 1:
        skills/grill/SKILL.md:180:1. Write the ruling for every settled answer, the roadmap diff, "record as ADR?", rule-clash and term decisions included.

- rulings file (entry changed)
  - plan, "What it reads" 4:
        skills/plan/SKILL.md:41:4. The rulings file `<ledger_root>/rulings/<slug>.md`, the slug as Steps 1 derives it, when it exists: the user's settled design answers for the entry, written while no plan was open.
  - plan, Steps 2:
        skills/plan/SKILL.md:67:   - Each bullet line (`- ...`) of the rulings file ("What it reads" 4) is copied into the Rulings section as it stands, in its order, in place of the template's placeholder line; the file's other lines, such as a heading or a blank line, are not copied. Any other line, such as a wrapped continuation or an indented sub-bullet, is shown with the draft at Steps 3; the user places it, and a line the user leaves unplaced is copied below the bullet line it follows, as it stands, so nothing of the file is lost when Steps 6 removes it.
  - plan, Steps 6:
        skills/plan/SKILL.md:110:   - The commit also removes the rulings file copied at Steps 2: when the last commit holds it (`git cat-file -e HEAD:<path>` exits 0), `git rm -q -f -- <path>`, and its path named in the commit with the others; otherwise, `git rm -q -f --cached -- <path>` when git lists it as staged, and the file deleted before the commit, its path not named. The `-f` removes a copy with uncommitted changes, whose bullet lines Steps 2 has already copied.
  - plan, Stops:
        skills/plan/SKILL.md:122:| The plan exists | The ledger folder is already there: a plan is opened once | The folder, and the entry's rulings file when one is still there, for the user to remove | Nothing |
  - grill, "What it reads" 6:
        skills/grill/SKILL.md:47:6. The Rulings of the open plan, when a folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>`, and otherwise the rulings file `<ledger_root>/rulings/<slug>.md` when it exists.
  - grill, "Steps / Writing what settled" 1:
        skills/grill/SKILL.md:181:   - It goes to the `## Rulings` section of the open plan's `plan.md`, or else to the rulings file, created with the heading line `# Rulings: <entry>` when it is absent.

- mark, of a figure (entry changed)
  - README.md, the figures:
        README.md:54:The pipeline below marks where each skill of a roadmap entry asks you. A stop marked "every run" waits on you each time, unless the run is under a quoted ruling that states the change. One marked "only when" waits on you in a named case. You may skip a skill marked "optional".

- stop (named places changed)
  - plan-orchestration, "Stops":
        skills/plan-orchestration/SKILL.md:297:- A stop is booked in the state file's open items the moment it is raised, and under the step's Step 0 in `plan.md`.
  - spec, "Steps / A stop":
        skills/spec/SKILL.md:196:1. Leave three things and nothing else.
  - repo-setup, "Stops":
        skills/repo-setup/SKILL.md:215:- The first seven rows are stops: each waits on the user.
  - roadmap, "Stops":
        skills/roadmap/SKILL.md:174:- The first five rows are stops: each waits on the user.

- open item (named places changed)
  - plan-orchestration, "Stops":
        skills/plan-orchestration/SKILL.md:301:- The stop message is plain text in the report: an open item with its options inside the written rules, the pros and cons of each, and one recommendation with its reasons.
  - spec, "Steps / A stop":
        skills/spec/SKILL.md:197:   - The open item in the state file. It holds the step, what the tree shows against the step's text, the choice the user owns with its options and the pros and cons of each, and one recommendation with its reasons.

- booking (named place changed)
  - plan-orchestration, "Stops":
        skills/plan-orchestration/SKILL.md:297:- A stop is booked in the state file's open items the moment it is raised, and under the step's Step 0 in `plan.md`.

- rule clash (named place changed)
  - plan-orchestration, "Stops":
        skills/plan-orchestration/SKILL.md:290:| A rule clash | A contradiction between two established rules or decisions, an ADR among them | The stop message, below | The user's ruling |

- Step 0 (named places changed)
  - spec, "Steps / A stop":
        skills/spec/SKILL.md:203:   - The same text under the step's Step 0 in `plan.md` or the part file it names.
  - spec, "Steps / A ruling":
        skills/spec/SKILL.md:222:   - a step the ruling adds or splits gets its own line in the step list, ending with `(ruling <name>)`, and its own Step 0, its carried premises with it;

- part file (named place changed)
  - spec, "Steps / A stop":
        skills/spec/SKILL.md:203:   - The same text under the step's Step 0 in `plan.md` or the part file it names.

- session, the (used in its sense; named place is Steps 1, unchanged)
  - spec, "Steps / A ruling" 2:
        skills/spec/SKILL.md:219:2. On that message the session books the ruling and nothing else:

- acceptance item (named place changed: Rules)
  - plan-orchestration, "Rules":
        skills/plan-orchestration/SKILL.md:332:- The round cap: a step gets at most `repair_rounds` repair rounds, and one more only when the delta leaves a verification command red or an acceptance item of the brief unbuilt and the fix is too large for landing. A new finding of a review never earns that round, and the user's yes never extends the cap.

- loop (named places changed: the sequence, Steps unchanged)
  - ordo-help, "The sequence, printed verbatim":
        skills/ordo-help/SKILL.md:47:## The sequence, printed verbatim
  - plan-orchestration, "Rules":
        skills/plan-orchestration/SKILL.md:340:- Every skill the loop invokes (`/spec`, `/refute`, `/land`, `academic-paper` for manuscript content, `/roadmap` at the closing, and `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill` run under a quoted ruling) is invoked through the runner every time, after a compaction too, and never carried out from remembered text.

- sequence, the (named place changed)
  - ordo-help, "The sequence, printed verbatim":
        skills/ordo-help/SKILL.md:47:## The sequence, printed verbatim

- standards (named place changed: the sequence)
  - ordo-help, "The sequence, printed verbatim":
        skills/ordo-help/SKILL.md:50:/repo-setup                   once, for a new repository: the tree, the shared rules, the standards, then /ordo-init

- plan skills (named place changed: repo-setup Rules)
  - repo-setup, "Rules":
        skills/repo-setup/SKILL.md:235:- The plan skills are never installed per project: they are installed per user, and one copy is loaded.

- closing step (named place changed)
  - plan, Steps 2:
        skills/plan/SKILL.md:79:   - The last step is the closing: the roadmap entry ticked with the gate's output (`/roadmap done <entry>`), and the ledger folder moved to `<archive_root>/`.

- goal (named places changed)
  - plan, Steps 2:
        skills/plan/SKILL.md:66:   - The entry's goal and its gate are copied in.
  - roadmap, "Steps / add" 1:
        skills/roadmap/SKILL.md:88:1. From the goal the user gives, draft the title, in the file's form, and the goal, in one or two sentences.

- gate (named places changed)
  - plan, Steps 2:
        skills/plan/SKILL.md:66:   - The entry's goal and its gate are copied in.
  - roadmap, "Steps / add" 3:
        skills/roadmap/SKILL.md:95:3. Ask of the drafted gate "could this pass without the goal being reached?" and write the answer with its reason in the draft that Steps / add 6 shows, never in the roadmap entry.

- question, the (named places changed)
  - plan, Steps 2:
        skills/plan/SKILL.md:69:   - The session asks of the copied gate "could this pass without the goal being reached?" and writes the answer with its reason in the section "## Gate", on the line the template gives the gate.
  - roadmap, "Steps / add" 3:
        skills/roadmap/SKILL.md:95:3. Ask of the drafted gate "could this pass without the goal being reached?" and write the answer with its reason in the draft that Steps / add 6 shows, never in the roadmap entry.

- ledger (named place changed: plan Steps 3)
  - plan, Steps 3, the line that writes `plan.md` into the ledger folder:
        skills/plan/SKILL.md:86:   - Write `plan.md` once the user has approved or corrected it.

- plan (named place changed: plan Steps)
  - plan, Steps 2:
        skills/plan/SKILL.md:64:2. Draft `plan.md` from `templates/plan.md`.

- roadmap entry (named places changed)
  - roadmap, "Steps / add" 1:
        skills/roadmap/SKILL.md:88:1. From the goal the user gives, draft the title, in the file's form, and the goal, in one or two sentences.
  - roadmap, "The format is the file's":
        skills/roadmap/SKILL.md:138:- **Numbering.** A new entry between two others takes the file's own insertion form (`37.A`, `12.5`).

- insertion form (named place changed)
  - roadmap, "The format is the file's":
        skills/roadmap/SKILL.md:138:- **Numbering.** A new entry between two others takes the file's own insertion form (`37.A`, `12.5`).

- Not yet specified (named place changed)
  - roadmap, "The format is the file's":
        skills/roadmap/SKILL.md:140:- **Not yet specified.** Work whose gate cannot yet be named sits in the section "Not yet specified", after the open entries and before the done ones. Each entry there has its title, its goal and what must be known before its gate can be named.

- plan-terms block and shared-rules block (named places changed)
  - repo-setup, Steps 3:
        skills/repo-setup/SKILL.md:63:   - The plan-terms block of `docs/glossary.md` is filled from `templates/plan-terms.md`, as the shared-rules block of `CLAUDE.md` is from `templates/shared-rules.md`.
  - repo-setup, "Steps / sync" 1:
        skills/repo-setup/SKILL.md:128:1. Run `python3 <this skill's folder>/templates/sync_rules.py <path>`, which checks the shared-rules block of `CLAUDE.md` and then the plan-terms block of `docs/glossary.md`; steps 2 to 9 follow its exit status and, on exit 2, its `error:` lines.

- plan configuration (named place changed: ordo-init Steps)
  - ordo-init, Steps 13:
        skills/ordo-init/SKILL.md:116:13. Run `python3 <this skill's folder>/templates/check_config.py .`.

- `projects:` form (named place changed: ordo-init Steps 1)
  - ordo-init, Steps 1:
        skills/ordo-init/SKILL.md:55:   - A repository whose tools each have their own build file and their own documentation under separate directories (`tools/<name>/`, `packages/<name>/`) is drafted in the `projects:` form, one project per directory, named by the directory and with `worktree_paths` set to it.

- questions, the (named place unchanged; used at repo-setup Steps 2 and Stops)
  - repo-setup, "The questions":
        skills/repo-setup/SKILL.md:159:## The questions
```

Every line above still states its term: the lines of the five skills' "What it reads" item and of `spec` and `plan-orchestration` state the **quoted ruling**; each line named for an entry the diff does not change (for instance **gate**, **goal**, **closing step**, **plan-terms block**) is in a section the diff changed at other lines, and the named line itself is as it was. One entry's named place is worded by the entry and not by the skill: the entry **ledger** names `plan`, Steps 3; the line of Steps 3 that writes `plan.md` into the ledger folder is printed above.

### Terms the diff uses

`terms.py` (part 8) lists each glossary term whose name occurs as a word in a line the diff adds to a skill, the README or `plan-terms.md` (the SVG files, the script and the glossary page are left out); the output follows, and my reading of each term is below it.

```
$ python3 $TMPDIR/9a-build/terms.py
ADR: 2 lines in {'skills/grill/SKILL.md': 1, 'skills/plan/SKILL.md': 1}
brief: 1 lines in {'skills/spec/SKILL.md': 1}
capability map: 1 lines in {'skills/roadmap/SKILL.md': 1}
case: 2 lines in {'README.md': 1, 'skills/repo-setup/templates/plan-terms.md': 1}
case, of a diagnosis: 2 lines in {'README.md': 1, 'skills/repo-setup/templates/plan-terms.md': 1}
closing step: 3 lines in {'skills/plan/SKILL.md': 3}
commit rule: 4 lines in {'skills/ordo-init/SKILL.md': 2, 'skills/repo-setup/SKILL.md': 1, 'skills/repo-setup/templates/plan-terms.md': 1}
decision form: 1 lines in {'skills/grill/SKILL.md': 1}
finding: 1 lines in {'skills/repo-setup/templates/plan-terms.md': 1}
frontier: 1 lines in {'skills/grill/SKILL.md': 1}
gate: 12 lines in {'skills/grill/SKILL.md': 2, 'skills/plan/SKILL.md': 3, 'skills/roadmap/SKILL.md': 7}
goal: 10 lines in {'skills/grill/SKILL.md': 2, 'skills/plan/SKILL.md': 3, 'skills/roadmap/SKILL.md': 5}
insertion form: 2 lines in {'skills/roadmap/SKILL.md': 2}
ledger: 29 lines in {'skills/grill/SKILL.md': 5, 'skills/ordo-help/SKILL.md': 1, 'skills/ordo-init/SKILL.md': 5, 'skills/plan-orchestration/SKILL.md': 1, 'skills/plan/SKILL.md': 5, 'skills/repo-setup/SKILL.md': 5, 'skills/repo-setup/templates/plan-terms.md': 1, 'skills/roadmap/SKILL.md': 4, 'skills/spec/SKILL.md': 2}
loop: 1 lines in {'skills/plan-orchestration/SKILL.md': 1}
open item: 2 lines in {'skills/repo-setup/templates/plan-terms.md': 1, 'skills/spec/SKILL.md': 1}
orchestrator: 1 lines in {'skills/repo-setup/templates/plan-terms.md': 1}
part, of an output: 6 lines in {'skills/grill/SKILL.md': 1, 'skills/ordo-init/SKILL.md': 2, 'skills/plan/SKILL.md': 1, 'skills/repo-setup/SKILL.md': 1, 'skills/roadmap/SKILL.md': 1}
place, of a point: 6 lines in {'skills/plan/SKILL.md': 3, 'skills/roadmap/SKILL.md': 3}
plan: 20 lines in {'skills/grill/SKILL.md': 1, 'skills/ordo-init/SKILL.md': 2, 'skills/plan-orchestration/SKILL.md': 2, 'skills/plan/SKILL.md': 9, 'skills/repo-setup/SKILL.md': 2, 'skills/repo-setup/templates/plan-terms.md': 3, 'skills/roadmap/SKILL.md': 1}
plan-terms block: 1 lines in {'skills/repo-setup/SKILL.md': 1}
question, the: 10 lines in {'skills/ordo-init/SKILL.md': 3, 'skills/repo-setup/SKILL.md': 5, 'skills/repo-setup/templates/plan-terms.md': 1, 'skills/roadmap/SKILL.md': 1}
questions, the: 5 lines in {'skills/repo-setup/SKILL.md': 4, 'skills/repo-setup/templates/plan-terms.md': 1}
quoted ruling: 82 lines in {'README.md': 1, 'skills/grill/SKILL.md': 10, 'skills/ordo-init/SKILL.md': 20, 'skills/plan-orchestration/SKILL.md': 2, 'skills/plan/SKILL.md': 10, 'skills/repo-setup/SKILL.md': 20, 'skills/repo-setup/templates/plan-terms.md': 4, 'skills/roadmap/SKILL.md': 13, 'skills/spec/SKILL.md': 2}
repair round: 1 lines in {'skills/repo-setup/templates/plan-terms.md': 1}
reviewer: 2 lines in {'skills/ordo-init/SKILL.md': 1, 'skills/repo-setup/SKILL.md': 1}
roadmap entry: 2 lines in {'README.md': 1, 'skills/repo-setup/templates/plan-terms.md': 1}
round, of an interview: 3 lines in {'skills/grill/SKILL.md': 2, 'skills/repo-setup/templates/plan-terms.md': 1}
ruling: 117 lines in {'README.md': 1, 'skills/grill/SKILL.md': 13, 'skills/ordo-help/SKILL.md': 1, 'skills/ordo-init/SKILL.md': 27, 'skills/plan-orchestration/SKILL.md': 3, 'skills/plan/SKILL.md': 15, 'skills/repo-setup/SKILL.md': 32, 'skills/repo-setup/templates/plan-terms.md': 4, 'skills/roadmap/SKILL.md': 17, 'skills/spec/SKILL.md': 4}
rulings file: 24 lines in {'skills/grill/SKILL.md': 3, 'skills/ordo-init/SKILL.md': 3, 'skills/plan/SKILL.md': 9, 'skills/repo-setup/SKILL.md': 3, 'skills/repo-setup/templates/plan-terms.md': 3, 'skills/roadmap/SKILL.md': 3}
runner: 1 lines in {'skills/plan-orchestration/SKILL.md': 1}
session, the: 3 lines in {'skills/plan-orchestration/SKILL.md': 1, 'skills/repo-setup/templates/plan-terms.md': 1, 'skills/spec/SKILL.md': 1}
shared-rules block: 1 lines in {'skills/repo-setup/SKILL.md': 1}
slug: 1 lines in {'skills/repo-setup/templates/plan-terms.md': 1}
step: 29 lines in {'skills/ordo-init/SKILL.md': 6, 'skills/plan-orchestration/SKILL.md': 1, 'skills/plan/SKILL.md': 10, 'skills/repo-setup/SKILL.md': 5, 'skills/repo-setup/templates/plan-terms.md': 1, 'skills/roadmap/SKILL.md': 4, 'skills/spec/SKILL.md': 2}
Step 0: 1 lines in {'skills/spec/SKILL.md': 1}
stop: 53 lines in {'README.md': 1, 'skills/grill/SKILL.md': 2, 'skills/ordo-init/SKILL.md': 12, 'skills/plan-orchestration/SKILL.md': 3, 'skills/plan/SKILL.md': 6, 'skills/repo-setup/SKILL.md': 13, 'skills/repo-setup/templates/plan-terms.md': 2, 'skills/roadmap/SKILL.md': 10, 'skills/spec/SKILL.md': 4}
sync: 6 lines in {'skills/repo-setup/SKILL.md': 6}
worker: 2 lines in {'skills/ordo-init/SKILL.md': 1, 'skills/repo-setup/SKILL.md': 1}
case, of a skill's description: 2 lines in {'README.md': 1, 'skills/repo-setup/templates/plan-terms.md': 1}
loop, in the README: 1 lines in {'skills/plan-orchestration/SKILL.md': 1}
mark, of a figure: 5 lines in {'skills/grill/SKILL.md': 1, 'skills/ordo-init/SKILL.md': 1, 'skills/plan/SKILL.md': 1, 'skills/repo-setup/SKILL.md': 1, 'skills/roadmap/SKILL.md': 1}
[exit 0]
```

Reading of the uses, each read in the lines `termlines.py` prints (the lines are in the diff):

- In the glossary sense, each use in a line the diff adds: **quoted ruling** (82 lines, read in check 6), **ruling**, **rulings file**, **commit rule**, **stop**, **open item**, **closing step**, **gate**, **goal**, **insertion form**, **capability map**, **Step 0**, **ledger** (the ledger files of `spec` line 205 and the ledger folder; the words "ledger file" are the term **quoted ruling** defines), **plan**, **step**, **sync**, **plan-terms block**, **shared-rules block**, **questions, the** ("The questions" as the ten questions), **frontier**, **decision form**, **ADR** and **round, of an interview** (grill lines 206 and 250: "the next round" and "Every round" are the interview's), **session, the** (`plan-orchestration` line 307, `spec` line 226), **loop** (`plan-orchestration` line 340, the unattended loop), **brief** (`spec` line 238, the file), **worker** and **reviewer** (the two plan configuration keys, as the existing Stops row names them).
- Matches that are ordinary English and not the term: **part, of an output** ("each part of it has a sub-bullet", "a ruled part"), **place, of a point** ("its place" in the roadmap order, "a line left to place"), **mark, of a figure** ("a quotation mark"), **case** and **case, of a diagnosis** ("in a named case" in `README.md`, unchanged words in the **ruling** entry), **question, the** ("the commit question" and "question 5" are the question `ordo-init` and `repo-setup` put to the user, not the gate question; `roadmap` line 135 is "a goal that does not settle it").
- Matches that are the unchanged words of an entry in `plan-terms.md`: **case**, **finding**, **repair round**, **orchestrator**, **slug**, **roadmap entry**, **session, the**, **round, of an interview** and **open item** at the lines of the **ruling** and **rulings file** entries (`plan-terms.md` lines 92 and 93 after the change), which the diff changes only by the added clauses.
- **loop, in the README** matches `plan-orchestration` line 340 by its word "loop"; the line uses the term **loop**, not the README's.

## 7. Sentences longer than the standard allows

`sentences.py` (part 8) splits each line the diff adds (the script and the SVG files left out) into cells and sentences and lists the ones over 20 words, once per text, with the files that hold it. The prose standard allows about 20 words unless the mechanism needs more. The list has 67 sentences. The word count is a script's indication; the reason is read. Each sentence is dictated by the brief and is not rewritten; the reason each needs its length is the group it is in.

Groups and their reasons:

- Q, Quick start lines and the sequence line: An invocation and what it does in the column the file's other lines use; the condition (under a quoted ruling that states the change) and the result (written without the stop) are one statement that splits into a command and its effect only in the layout's two-column form.
- T, Stops-table cells: A cell states a condition and its exception ("Every setup, at Steps 11, except a draft a quoted ruling states") or a list of what the stop shows; a cell holds one condition, and splitting it would move the exception out of the row that fires.
- D, Completion lines: "The step is done when" lists the outputs that must exist; each item is a named output of the step, and the line is a checklist of them.
- G, Glossary entry sentences: A definition of a term with the clause the quoted ruling adds; the entry is one line of the plan-terms block and the added clause states a condition of the term.
- U, README sentence: A condition and its exception for the mark "every run"; the same words are in the glossary entry and the figure note.
- R, Rule sentences of the steps: One rule with its condition and its result ("A draft that differs in anything ... is shown whole with each difference named, and the stop stands"); the condition and result are the rule, and "one rule per bullet" puts them in one bullet.

### Group Q: Quick start lines and the sequence line (6 sentences)

```
28 ['skills/ordo-help/SKILL.md'] :: after a ruling on an option that runs a skill and states the change, that skill is run with --ruling <ledger file> "<name>" before /spec is typed again
28 ['skills/roadmap/SKILL.md'] :: /roadmap <command> ... --ruling <ledger file> "<name>"   add, move, done or drop under a quoted ruling: a draft that is the ruled change is written without the stop
26 ['skills/repo-setup/SKILL.md'] :: /repo-setup ... --ruling <ledger file> "<name>"   either form, under a quoted ruling: a draft or a sync change the ruling states is written without the stop
25 ['skills/grill/SKILL.md'] :: /grill <entry> --ruling <ledger file> "<name>"                  the same, under a quoted ruling: a roadmap diff that is the ruled text is written without its decision
25 ['skills/plan/SKILL.md'] :: /plan <entry> --ruling <ledger file> "<name>"   the same, under a quoted ruling: a step list that is the ruled one is written without the stop
21 ['skills/ordo-init/SKILL.md'] :: /ordo-init --ruling <ledger file> "<name>"   the same, under a quoted ruling: a draft the ruling states is written without the stop
```

### Group T: Stops-table cells (13 sentences)

```
60 ['skills/plan/SKILL.md'] :: The drafted `plan.md`: the goal, the gate, the steps and each step's check, and in "## Gate" the answer to "could this pass without the goal being reached?" with its reason for the gate and for each step's check, and the design decisions no ADR in force or ruling settles and the rulings file's lines left to place (Steps 3)
35 ['skills/spec/SKILL.md'] :: a ruling on an option that runs a skill with an approval stop and states the change in full is written in the Rulings section as a bullet whose first line ends with "(the user).";
34 ['skills/spec/SKILL.md'] :: the change the option stated is copied under that bullet as sub-bullets, a text of several lines as a fenced block indented with its sub-bullet, its fence longer than any fence inside the text;
33 ['skills/plan/SKILL.md'] :: Every plan, after Steps 2, except a draft written under a quoted ruling as Steps 3 says: the skill does the mechanical half of opening a plan and stops at the design half
31 ['skills/repo-setup/SKILL.md'] :: `sync` exits 2 with an `error:` line of Steps / sync 4, for the shared-rules block or the plan-terms block, except a change a quoted ruling states (Steps / sync 5)
27 ['skills/ordo-init/SKILL.md'] :: Every setup, at Steps 11, except a draft a quoted ruling states as Steps 11 says, where only a commit question the ruling leaves open is asked
25 ['skills/repo-setup/SKILL.md'] :: The repository's commit rule (the answer to question 5 in a setup) does not allow the commit, at Steps 12 or Steps / sync 9
24 ['skills/repo-setup/SKILL.md'] :: The tree, every file's text with the copied hook named by its source, and the placeholders that Steps 3 lists for the user's value
23 ['skills/ordo-init/SKILL.md'] :: The files written, the quoted ruling named when the setup was written under one, and the command that shows them (`git status --short`)
23 ['skills/roadmap/SKILL.md'] :: Every change of `add`, `move`, `done` or `drop`, at Steps 3, except a draft written under a quoted ruling as Steps 4 says
22 ['skills/ordo-init/SKILL.md'] :: The offered answer for `worker` and `reviewer`, and the two values of `libraries` with what each means, as Steps 6 names them
22 ['skills/repo-setup/SKILL.md'] :: The files changed, the quoted ruling named when they were written under one, and the command that shows them (`git status --short`)
21 ['skills/grill/SKILL.md'] :: Every round, at Steps 6, the "record as ADR?" decisions and each roadmap diff no quoted ruling states riding in it
```

### Group D: Completion lines (8 sentences)

```
30 ['skills/grill/SKILL.md'] :: The item is done when the diff is a decision of the next round, or, after the yes or under a quoted ruling, the entry read back holds the change.
30 ['skills/repo-setup/SKILL.md'] :: The step is done when every file of "The tree" is drafted with its full text, the copied hook named by its source and each placeholder with no value listed.
28 ['skills/plan/SKILL.md'] :: The step is done when the draft holds the goal, the gate, the answers of "## Gate", the Rulings and the step list with the closing step last.
27 ['skills/roadmap/SKILL.md'] :: The step is done when the answer with its reason stands in the draft, and the gate's answer is no or the gate is a quoted ruling's.
23 ['skills/plan/SKILL.md'] :: The step is done when the opening commit holds the four files, and the removal of the rulings file when there was one.
23 ['skills/spec/SKILL.md'] :: The item is done when the skill a quoted ruling was booked for has run under it, and `/spec` has written the brief.
22 ['skills/roadmap/SKILL.md'] :: The step is done when the change is written, or the draft is shown with each difference named and the stop stands.
21 ['skills/spec/SKILL.md'] :: The item is done when the open item, its text under Step 0 and the commit of the ledger files exist.
```

### Group G: Glossary entry sentences (7 sentences)

```
52 ['docs/glossary.md'] :: **mark, of a figure**: the label a box of the README's figures carries where the user is asked, each drawn with its own shape and word: "every run", a stop that waits on the user each time the skill runs, unless the run is under a quoted ruling that states the change;
40 ['docs/glossary.md', 'skills/repo-setup/templates/plan-terms.md'] :: **commit rule**: whether the repository allows the skills to commit, the answer to `/repo-setup`'s question 5 or, for `/ordo-init` run alone, the user's answer at its approval stop or what a quoted ruling states on whether the skill may commit.
31 ['docs/glossary.md', 'skills/repo-setup/templates/plan-terms.md'] :: A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names.
31 ['docs/glossary.md', 'skills/repo-setup/templates/plan-terms.md'] :: A ruling on an option that runs a skill with an approval stop and states the change is written there as a bullet with the change as sub-bullets, the quoted ruling.
30 ['docs/glossary.md', 'skills/repo-setup/templates/plan-terms.md'] :: **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, and a quoted ruling with its sub-bullets, while no plan is open.
29 ['docs/glossary.md'] :: "only when", a stop that waits on the user only when its condition occurs; and "optional", a skill the user may run or skip, drawn as a dashed box.
23 ['docs/glossary.md', 'skills/repo-setup/templates/plan-terms.md'] :: The quoted ruling is the bullet of that name in it, whose first line ends with "(the user)", with the sub-bullets under it.
```

### Group U: README sentence (1 sentences)

```
22 ['README.md'] :: A stop marked "every run" waits on you each time, unless the run is under a quoted ruling that states the change.
```

### Group R: Rule sentences of the steps (32 sentences)

```
46 ['skills/plan-orchestration/SKILL.md'] :: Every skill the loop invokes (`/spec`, `/refute`, `/land`, `academic-paper` for manuscript content, `/roadmap` at the closing, and `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill` run under a quoted ruling) is invoked through the runner every time, after a compaction too, and never carried out from remembered text.
44 ['skills/plan-orchestration/SKILL.md'] :: An option that runs a skill with an approval stop (`/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill`) states the change in full, as that skill's text says a quoted ruling must state it, or names that skill's approval stop as a stop of its own.
35 ['skills/grill/SKILL.md', 'skills/ordo-init/SKILL.md', 'skills/plan/SKILL.md', 'skills/repo-setup/SKILL.md', 'skills/roadmap/SKILL.md'] :: The quoted ruling is the bullet named `<name>` in that file's Rulings section, or in the file itself when it is a rulings file, with every line under it: its sub-bullets and their fenced blocks.
35 ['skills/repo-setup/SKILL.md'] :: Each file that is neither a filled template nor held in the ruling is named with the draft, such as a build file, a fetched licence text or a page adapted from a sibling repository.
32 ['skills/plan/SKILL.md'] :: A quoted ruling that stands in the rulings file is copied with every line under it, its sub-bullets and their fenced blocks, and none of them is a line left to place.
31 ['skills/plan/SKILL.md'] :: The ruling's bullet and every line under it are copied into the Rulings section of a plan written under a quoted ruling, unless Steps 2 copied them from the rulings file.
30 ['skills/ordo-init/SKILL.md'] :: A draft that differs in anything, or a page whose text the ruling does not hold, is shown whole with each difference named, and the stop stands with nothing written.
30 ['skills/plan-orchestration/SKILL.md', 'skills/spec/SKILL.md'] :: An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own.
30 ['skills/roadmap/SKILL.md'] :: For `add` that text is the entry's title, goal, gate, level, number, what it waits on and its place, with the capability's draft where the roadmap has a capability map.
29 ['skills/roadmap/SKILL.md'] :: A draft that differs in anything, such as a place or a number the skill's own rules give, is shown whole with each difference named, and the stop stands.
29 ['skills/spec/SKILL.md'] :: An option that runs a skill with an approval stop states the change in full, or names that stop as a stop of its own, as `plan-orchestration`'s "Stops" says.
28 ['skills/ordo-init/SKILL.md'] :: Under a quoted ruling that states the change, it is made without being shown for approval, as Steps 11 and "Steps / Checking an existing file" 4 say.
27 ['skills/roadmap/SKILL.md'] :: An item replaces ruled text only where a rule of this skill gives another result, such as a place, a number, a level or the file's form.
26 ['skills/grill/SKILL.md'] :: Under a quoted ruling ("What it reads" 11) whose sub-bullets hold the entry's changed text, the draft is made at the first write of Steps 8.
26 ['skills/grill/SKILL.md'] :: A draft that is still the ruled text is written at once, unless it changes the gate and the changed gate could pass without the goal.
26 ['skills/spec/SKILL.md'] :: After a ruling on an option that runs a skill and states the change in full, that skill is run first, with `--ruling <ledger file> "<name>"`.
25 ['skills/ordo-init/SKILL.md'] :: The comparison covers the form, each key of `.agents/plan.yaml` with its value, each change to `.gitignore`, and the full text of each page to create.
25 ['skills/plan-orchestration/SKILL.md'] :: After the user's ruling on an option that states the change, the session books the ruling as the `spec` skill's "Steps / A ruling" says.
25 ['skills/repo-setup/SKILL.md'] :: Under a quoted ruling whose hunks are the hunks of the diff, each with the choice for it, the choices are applied without the stop.
25 ['skills/roadmap/SKILL.md'] :: A draft that is that change is written without the stop, for `add` only when the gate's answer of Steps / add 3 is no.
24 ['skills/repo-setup/SKILL.md'] :: Every file of the draft that this skill writes is a template filled from the answers, or has its full text in the ruling.
23 ['skills/grill/SKILL.md'] :: A draft that differs from the ruled text, or a changed gate that could pass without the goal, is shown as the decision.
23 ['skills/ordo-init/SKILL.md'] :: When the skill runs alone under a quoted ruling that states whether it may commit, the commit rule is what the ruling states.
23 ['skills/plan/SKILL.md'] :: Otherwise the draft is shown whole with what differs, what could pass without the goal and what is unsettled, and the stop stands.
22 ['skills/grill/SKILL.md', 'skills/ordo-init/SKILL.md', 'skills/plan/SKILL.md', 'skills/repo-setup/SKILL.md', 'skills/roadmap/SKILL.md'] :: `<ledger file>` is a plan's `plan.md` or a rulings file, given by a path the skill can read from where it runs.
22 ['skills/roadmap/SKILL.md'] :: Under a quoted ruling, compare the draft, after the command's subsection has been worked on it, with the change the ruling states.
21 ['skills/grill/SKILL.md', 'skills/ordo-init/SKILL.md', 'skills/plan/SKILL.md', 'skills/repo-setup/SKILL.md', 'skills/roadmap/SKILL.md'] :: A draft is the ruled change when each part of it has a sub-bullet that states it and equals that sub-bullet.
21 ['skills/ordo-init/SKILL.md', 'skills/repo-setup/SKILL.md'] :: A setup written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
21 ['skills/ordo-init/SKILL.md'] :: A fix made under a quoted ruling is listed with the check's output, with the ruling's name and its ledger file.
21 ['skills/plan/SKILL.md'] :: A plan written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
21 ['skills/repo-setup/SKILL.md'] :: Under a quoted ruling ("What it reads" 6), a file whose full text the ruling holds is drafted as that text.
21 ['skills/repo-setup/SKILL.md', 'skills/roadmap/SKILL.md'] :: A change written under a quoted ruling names the ruling in the commit message, by its name and its ledger file.
```

Total: 67 sentences.

## 8. Files

Changed files, with `git diff --numstat` and the line count of the file now (`wc -l`):

```
$ git diff --numstat; echo; wc -l $(git diff --name-only)
1  1  README.md
11  3  docs/figures/gen_figures.py
3  2  docs/figures/pipeline.svg
3  2  docs/figures/plan-loop.svg
5  4  docs/glossary.md
27  2  skills/grill/SKILL.md
1  0  skills/ordo-help/SKILL.md
50  5  skills/ordo-init/SKILL.md
6  2  skills/plan-orchestration/SKILL.md
33  1  skills/plan/SKILL.md
53  5  skills/repo-setup/SKILL.md
4  3  skills/repo-setup/templates/plan-terms.md
38  6  skills/roadmap/SKILL.md
9  1  skills/spec/SKILL.md

     180 README.md
     750 docs/figures/gen_figures.py
     174 docs/figures/pipeline.svg
     165 docs/figures/plan-loop.svg
     136 docs/glossary.md
     274 skills/grill/SKILL.md
     107 skills/ordo-help/SKILL.md
     170 skills/ordo-init/SKILL.md
     340 skills/plan-orchestration/SKILL.md
     137 skills/plan/SKILL.md
     237 skills/repo-setup/SKILL.md
     119 skills/repo-setup/templates/plan-terms.md
     194 skills/roadmap/SKILL.md
     313 skills/spec/SKILL.md
    3296 total
[exit 0]
```

Scratch scripts, all under `$TMPDIR/9a-build/` (`/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/9a-build/`), each disclosed with what it computes; none of their output stands for a judgment, and each result that matters was read:

- apply.py, data.txt: apply.py writes the brief's dictated texts from data.txt into their files: each operation names an anchor line prefix that must match exactly one line, and nothing is written when one does not. data.txt holds the dictated texts copied from the brief.
- verify_texts.py: counts, for each dictated text, the lines of its file that contain it (`grep -c -F -f`), and for the ordo-help line the exact-line count.
- indent_check.py, indent_resolved.txt's script: prints each added bullet line's indent, its neighbours' indents and its parent line; the resolved list prints each parent line with the indent it calls for.
- sentences.py: counts the words of each sentence of each added line and lists those over 20.
- terms.py, termlines.py, stated.py, sections.py, places.py: list the glossary terms whose name occurs in an added line, the added lines that contain a given term, the Stated-in segments of each glossary entry that name a changed skill, the headings and items that hold changed lines, and the `grep -n -F` line of each named place (stopping when a string matches other than one line).
- walks.py: prints each walk step's description (written by hand) followed by the `grep -n -F` line of the skill it names.
- r10.py: lists each hit of the three R10 greps, marks the hits on lines the diff adds, and prints, for every other hit, the reason key written by hand in it; it stops when a hit has no reason.
- build_report.py: runs the read-only commands of part 3 in the unchanged tree's export and joins their output with the hand-written text and the files above into this report.
- firstread*.txt, verify_out*.txt, verify_final.txt, walks_out*.md, r10_out.txt, sentences_out.txt, indent_out.txt, places_out.txt, checks_out.txt, added.txt: the outputs of the scripts and commands above.

The unchanged tree was exported with `git archive HEAD` into `$TMPDIR/9a-build/head`; no git command that changes state was run, and no scratch repository or scratch run of a skill was made.

## 9. Judgment calls

None that the brief left open. One application call: item 11 places the `repo-setup` Rules sub-bullet under "The Rules bullet at line 181", and the tree's Rules bullet "In a setup, after Steps 1, nothing is written until the user approves or corrects the draft (Steps 4)." is at line 183 (the brief's own "What is on the tree" says 183); I placed the sub-bullet under that bullet by its text. Part 11 gives the evidence.

## 10. User-visible changes, before and after

```
$ git diff -U0 README.md docs/glossary.md skills/repo-setup/templates/plan-terms.md skills/ordo-help/SKILL.md skills/plan-orchestration/SKILL.md skills/spec/SKILL.md
diff --git a/README.md b/README.md
index a568814..509e865 100644
--- a/README.md
+++ b/README.md
@@ -54 +54 @@ for every step:
-The pipeline below marks where each skill of a roadmap entry asks you. A stop marked "every run" waits on you each time, and one marked "only when" waits on you in a named case. You may skip a skill marked "optional".
+The pipeline below marks where each skill of a roadmap entry asks you. A stop marked "every run" waits on you each time, unless the run is under a quoted ruling that states the change. One marked "only when" waits on you in a named case. You may skip a skill marked "optional".
diff --git a/docs/glossary.md b/docs/glossary.md
index 3954eaf..957011b 100644
--- a/docs/glossary.md
+++ b/docs/glossary.md
@@ -25 +25 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **commit rule**: whether the repository allows the skills to commit, the answer to `/repo-setup`'s question 5 or, for `/ordo-init` run alone, the user's answer at its approval stop. Stated in: `repo-setup`, "The questions"; `ordo-init`, "What it reads" 3.
+- **commit rule**: whether the repository allows the skills to commit, the answer to `/repo-setup`'s question 5 or, for `/ordo-init` run alone, the user's answer at its approval stop or what a quoted ruling states on whether the skill may commit. Stated in: `repo-setup`, "The questions"; `ordo-init`, "What it reads" 3.
@@ -79,0 +80 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
+- **quoted ruling**: a ruling of the user given to a skill by the arguments `--ruling <ledger file> "<name>"`. The file is a plan's `plan.md` or a rulings file. The quoted ruling is the bullet of that name in it, whose first line ends with "(the user)", with the sub-bullets under it. The sub-bullets state the change in full. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops"; `plan`, "What it reads" 6; `roadmap`, "What it reads" 6; `ordo-init`, "What it reads" 5; `repo-setup`, "What it reads" 6; `grill`, "What it reads" 11.
@@ -96,2 +97,2 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled".
-- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6 and "Steps / Writing what settled".
+- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. A ruling on an option that runs a skill with an approval stop and states the change is written there as a bullet with the change as sub-bullets, the quoted ruling. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled".
+- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, and a quoted ruling with its sub-bullets, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6 and "Steps / Writing what settled".
@@ -133 +134 @@ This page defines each term that the Ordo skills, the pages under `docs/dev/` an
-- **mark, of a figure**: the label a box of the README's figures carries where the user is asked, each drawn with its own shape and word: "every run", a stop that waits on the user each time the skill runs; "only when", a stop that waits on the user only when its condition occurs; and "optional", a skill the user may run or skip, drawn as a dashed box. Stated in: `README.md`, the figures.
+- **mark, of a figure**: the label a box of the README's figures carries where the user is asked, each drawn with its own shape and word: "every run", a stop that waits on the user each time the skill runs, unless the run is under a quoted ruling that states the change; "only when", a stop that waits on the user only when its condition occurs; and "optional", a skill the user may run or skip, drawn as a dashed box. Stated in: `README.md`, the figures.
diff --git a/skills/ordo-help/SKILL.md b/skills/ordo-help/SKILL.md
index 39bc314..339cdba 100644
--- a/skills/ordo-help/SKILL.md
+++ b/skills/ordo-help/SKILL.md
@@ -75,0 +76 @@ when a command stops:
+                              after a ruling on an option that runs a skill and states the change, that skill is run with --ruling <ledger file> "<name>" before /spec is typed again
diff --git a/skills/plan-orchestration/SKILL.md b/skills/plan-orchestration/SKILL.md
index 28eeb3d..49b512f 100644
--- a/skills/plan-orchestration/SKILL.md
+++ b/skills/plan-orchestration/SKILL.md
@@ -304 +304,5 @@ The table holds seven kinds of stop, each for a decision that is the user's, and
-  - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, and the approval stop of a skill the option runs, such as `/roadmap`'s shown diff, stay stops of their own, and the option names each of them.
+  - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own.
+  - The option names that stop.
+  - An option that runs a skill with an approval stop (`/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill`) states the change in full, as that skill's text says a quoted ruling must state it, or names that skill's approval stop as a stop of its own.
+  - After the user's ruling on an option that states the change, the session books the ruling as the `spec` skill's "Steps / A ruling" says.
+  - It then runs the skill with `--ruling <ledger file> "<name>"`.
@@ -336 +340 @@ The table holds seven kinds of stop, each for a decision that is the user's, and
-- Every skill the loop invokes (`/spec`, `/refute`, `/land`, `academic-paper` for manuscript content, and `/roadmap` at the closing) is invoked through the runner every time, after a compaction too, and never carried out from remembered text.
+- Every skill the loop invokes (`/spec`, `/refute`, `/land`, `academic-paper` for manuscript content, `/roadmap` at the closing, and `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill` run under a quoted ruling) is invoked through the runner every time, after a compaction too, and never carried out from remembered text.
diff --git a/skills/repo-setup/templates/plan-terms.md b/skills/repo-setup/templates/plan-terms.md
index 196b966..2916bde 100644
--- a/skills/repo-setup/templates/plan-terms.md
+++ b/skills/repo-setup/templates/plan-terms.md
@@ -20 +20 @@
-- **commit rule**: whether the repository allows the skills to commit, the answer to `/repo-setup`'s question 5 or, for `/ordo-init` run alone, the user's answer at its approval stop. Stated in: `repo-setup`, "The questions"; `ordo-init`, "What it reads" 3.
+- **commit rule**: whether the repository allows the skills to commit, the answer to `/repo-setup`'s question 5 or, for `/ordo-init` run alone, the user's answer at its approval stop or what a quoted ruling states on whether the skill may commit. Stated in: `repo-setup`, "The questions"; `ordo-init`, "What it reads" 3.
@@ -74,0 +75 @@
+- **quoted ruling**: a ruling of the user given to a skill by the arguments `--ruling <ledger file> "<name>"`. The file is a plan's `plan.md` or a rulings file. The quoted ruling is the bullet of that name in it, whose first line ends with "(the user)", with the sub-bullets under it. The sub-bullets state the change in full. Stated in: `spec`, "Steps / A ruling"; `plan-orchestration`, "Stops"; `plan`, "What it reads" 6; `roadmap`, "What it reads" 6; `ordo-init`, "What it reads" 5; `repo-setup`, "What it reads" 6; `grill`, "What it reads" 11.
@@ -91,2 +92,2 @@
-- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled".
-- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6 and "Steps / Writing what settled".
+- **ruling**: the user's decision on an open item, typed as `Ruled: <the choice>` and booked by the session. A ruling that adds or splits a step is also written in the Rulings section of `plan.md` as a line ending with "(the user)", which the step's `(ruling <name>)` tag names. A ruling on an option that runs a skill with an approval stop and states the change is written there as a bullet with the change as sub-bullets, the quoted ruling. Stated in: `spec`, "Steps / A ruling" and "What it reads" 4. Also the orchestrator's decision on a finding sent in a repair round, or on a case in a cases ruling. Stated in: `plan-orchestration`, Steps 6 and 8. Also a settled `grill` decision, one bullet of the Rulings or the rulings file. Stated in: `grill`, "Steps / Writing what settled".
+- **rulings file**: `<ledger_root>/rulings/<slug>.md`, which holds the user's settled design answers for a roadmap entry, one bullet line each, and a quoted ruling with its sub-bullets, while no plan is open. `/plan` copies its bullet lines into the new plan's Rulings and removes it. Stated in: `plan`, "What it reads" 4, Steps 2 and 6, and Stops; `grill`, "What it reads" 6 and "Steps / Writing what settled".
diff --git a/skills/spec/SKILL.md b/skills/spec/SKILL.md
index f51d5bb..479d226 100644
--- a/skills/spec/SKILL.md
+++ b/skills/spec/SKILL.md
@@ -200 +200,3 @@ A step whose dispatch entry reads `landing: backed-out` has its old worktree and
-     - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, and the approval stop of a skill the option runs, such as `/roadmap`'s shown diff, stay stops of their own, and the option names each of them.
+     - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own.
+     - The option names that stop.
+     - An option that runs a skill with an approval stop states the change in full, or names that stop as a stop of its own, as `plan-orchestration`'s "Stops" says.
@@ -202,0 +205 @@ A step whose dispatch entry reads `landing: backed-out` has its old worktree and
+   - The item is done when the open item, its text under Step 0 and the commit of the ledger files exist.
@@ -221,0 +225,3 @@ A step whose dispatch entry reads `landing: backed-out` has its old worktree and
+   - a ruling on an option that runs a skill with an approval stop and states the change in full is written in the Rulings section as a bullet whose first line ends with "(the user).";
+   - that bullet is the quoted ruling the session gives the skill;
+   - the change the option stated is copied under that bullet as sub-bullets, a text of several lines as a fenced block indented with its sub-bullet, its fence longer than any fence inside the text;
@@ -230,0 +237,2 @@ A step whose dispatch entry reads `landing: backed-out` has its old worktree and
+   - After a ruling on an option that runs a skill and states the change in full, that skill is run first, with `--ruling <ledger file> "<name>"`.
+   - The item is done when the skill a quoted ruling was booked for has run under it, and `/spec` has written the brief.
[exit 0]
```

- README, line 54. Before: "A stop marked "every run" waits on you each time, and one marked "only when" waits on you in a named case." After: "A stop marked "every run" waits on you each time, unless the run is under a quoted ruling that states the change. One marked "only when" waits on you in a named case."
- Glossary and `plan-terms.md`: one new entry **quoted ruling**; **commit rule**, **ruling** and **rulings file** each gain the clause the diff above shows; **mark, of a figure** gains "unless the run is under a quoted ruling that states the change". The plan-terms block of `docs/glossary.md` equals the template (check 3).
- Figures: `pipeline.svg` grows from 966 to 988 px high and `plan-loop.svg` from 889 to 911 px, each with the note "A stop marked "every run" waits each time, unless the run is under a quoted ruling that states the change." under the legend's row; no box moved (check 8).
- Skills: `roadmap`, `plan`, `ordo-init`, `repo-setup` and `grill` each take `--ruling <ledger file> "<name>"` (a Quick start line and the shared "What it reads" item) and write without their approval stop a draft that equals the quoted ruling; `spec` and `plan-orchestration` say how an option's ruling is booked as a quoted ruling and how the skill is run with it; `ordo-help` prints one more line of the sequence. Before, every approval stop of a skill an option runs stayed a stop of its own (the sentence at `plan-orchestration` line 304 and `spec` line 200, now gone: check 5).
- Host-visible: none. No hook, configuration key, script interface or installed file changes.

## 11. What in the brief was wrong or impossible, with the evidence

Nothing made a dictated text impossible. Three points the orchestrator may want to know:

1. Item 11 names the `repo-setup` Rules bullet as "at line 181"; the tree has it at line 183, and the brief's "What is on the tree" says 183. Evidence:

```
$ sed -n 183p skills/repo-setup/SKILL.md
- In a setup, after Steps 1, nothing is written until the user approves or corrects the draft (Steps 4).
[exit 0]

$ grep -n 'line 181\|at line 18[13]' /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/agents/briefs/9a.md
18:- `skills/repo-setup/SKILL.md`: "Quick start" two lines, the text after each invocation starting in column 31; "What it reads" has five items, the last at line 34; Steps 2 at line 40 and Steps 4 at line 58, each with no sub-bullet; Steps 3 at lines 41 to 57, its sub-bullet on the copied git guard hook at line 42; line 48, "A placeholder none of these fills is listed with the draft at Steps 4, and the user gives its value."; Steps 8 at lines 64 to 67; Steps 12 at lines 83 to 88; of Steps 1 to 12, only Steps 10 and 11 have completion lines; "sync" 3 at lines 94 to 96, 5 at line 103 ("Show the drafted change ("Stops").", no sub-bullet, the item that carries the stop), 8 at lines 108 and 109 (the check run again at most twice), 9 at line 110; "The questions" holds ten; the Stops rows "The questions" (159, third cell "The ten questions, each with its default"), "The draft" (160), "A hunk to rule on" (161), "The drafted sync change" (162), "The check still fails" (164), "No commit allowed" (165), and line 168 "The first seven rows are stops: each waits on the user."; the Rules bullet "In a setup, after Steps 1, nothing is written until the user approves or corrects the draft (Steps 4)." at line 183. No template under `skills/repo-setup/templates` is a `README.md` (`find skills/repo-setup/templates -maxdepth 1 -name 'README*'` prints nothing).
373:    - The Rules bullet at line 181 gains one sub-bullet:
[exit 0]
```

   The sub-bullet is under the bullet with that text (`repo-setup` line 231 now, parent line 230 in check 7).

2. `grill`, a round with no decision to ask. Under a quoted ruling the ruled roadmap diff is in the frontier (Steps 4, line 88) but is not asked (the row "A round", line 250, leaves out a roadmap diff a quoted ruling states), and the draft is made at the first write of Steps 8 (line 199). Steps 8 follows Steps 6 (line 100, "Ask the round", whose last sub-bullet at line 104 ends the turn) and Steps 7 (line 106, "Read the answers"). When the ruled diff is the only open decision of the first pass of Steps 3 to 5, Steps 6 has no decision to ask, and no sentence of the skill says that the round, the turn end and Steps 7 are then skipped so that Steps 8 is reached. The walk of R9 follows the texts as if Steps 8 were reached at once, which is what the case states (the draft is made at the first write of Steps 8 with no answer having changed the entry); the texts give it only when some other decision was asked in that round. I did not change it, since the wording is dictated; the orchestrator can rule whether Steps 6 gets a sentence for an empty round.
3. `roadmap` Steps 4, the completion line (line 75): "The step is done when the change is written, or the draft is shown with each difference named and the stop stands." With a quoted ruling whose gate could pass without the goal (the answer of Steps / add 3 is yes), a draft equal to the ruled change is not written (line 73 requires the answer no) and the stop stands (the row "The change", line 162); no difference exists, so the clause "with each difference named" has nothing to name in that case. The behaviour is right; the completion line's clause is empty there.

## 12. Sentences about a changed file as a whole, each with the line that shows it still holds

The rules file's rule 14 asks for these: the description and opening paragraph of each changed skill, the lines under each Stops table that count its stops, the "Every skill the loop invokes" rule, the head comment and docstrings of `gen_figures.py`, and the alt texts of the two figures in `README.md`. Each was read in the changed tree; the lines are printed by the commands below.

```
$ for s in roadmap plan ordo-init repo-setup grill spec plan-orchestration ordo-help; do echo "== $s"; grep -n -m1 '^description:' skills/$s/SKILL.md; awk 'NR>3 && /^# /{f=1;next} f&&NF{print NR": "$0; exit}' skills/$s/SKILL.md; done
== roadmap
3:description: "Keep the roadmap, the ordered list of work a plan is opened for: show the open entries in order with what each waits on and which has a plan open, followed by the entries under \"Not yet specified\"; add an entry (goal, a gate that could not pass without the goal being reached, what it waits on) in the file's own format and in dependency order; put work whose gate cannot yet be named under \"Not yet specified\" with what must be known first; name the gate of such an entry and place it in the order; move an entry; mark one done with its gate's output; or drop one with the reason. Learns the format from the file, whether one file holds everything or an ordered build plan sits over a capability map of per-system files. Writes only after the user approves. Triggers on: roadmap, add to the roadmap, new roadmap entry, what is next on the roadmap, not yet specified, park on the roadmap until its gate is known, name the gate of an entry, mark the entry done, drop the entry, reorder the roadmap."
10: `/roadmap` shows, adds, moves, marks done and drops the entries of the file `.agents/plan.yaml`'s `roadmap:` key names. It leaves behind each change the user approved, committed on its own.
== plan
3:description: "Open a plan for one roadmap entry: create its ledger folder from the repository's plan configuration, write plan.md with the entry's goal, gate and a drafted step list for approval, the gate and each step's check asked whether it could pass without the goal being reached, each approved step tagged (approved), and orchestrator-state.md with the configuration block filled from the repository. Triggers on: open a plan, start a plan, plan <roadmap entry>, new plan for <entry>."
10: `/plan <entry>` turns one roadmap entry into a ledger folder that `/spec`, `/refute`, `/land` and `plan-orchestration` then run from. It leaves behind `plan.md` and `orchestrator-state.md`, committed, and `agents/briefs/` and `agents/reviews/`, each holding an empty `.gitkeep`.
== ordo-init
3:description: "Set a repository up for the plan skills: draft .agents/plan.yaml from what the repository already has (the roadmap, the page that defines the checks, the change standard, the check commands its CI and build files run, one project or several), offer the pages it lacks, make git ignore the worktree root and keep the configuration tracked, and write nothing until the user approves. On a repository that already has .agents/plan.yaml it checks the file instead: required keys, unknown keys, values, the pages it names, the ignore rules. Triggers on: ordo-init, set up the plan skills, init plan.yaml, configure ordo, check plan.yaml."
10: `/ordo-init` writes the one file the plan skills (`plan`, `spec`, `refute`, `land`, `ordo-help`, `plan-orchestration`) need in a repository, `.agents/plan.yaml`, and the pages that file names when the repository lacks them. It leaves behind that file, the pages the user approved, the `.gitignore` lines it needed, and one commit when the repository's commit rule allows it.
== repo-setup
3:description: "Set up a new repository in the shape the plan skills expect: CLAUDE.md with the shared rules, docs/ with the change standard, the prose standard, the standards pages (design principles, coding standards, a UI standard), the building page, a roadmap, a glossary and an ADR folder, src/ and utils/, a .gitignore for the language, LICENSE, README, the project skills installed with skills-lock.json, and the plan configuration .agents/plan.yaml, and, on request, the git guard hook. Shows the whole tree and every file's text, the git guard hook named by its source, before writing. With sync, compares an existing repository's shared-rules block and its glossary's plan-terms block with their templates and rewrites them after approval. Triggers on: repo-setup, set up a new repo, scaffold a repository, new project repo, sync the shared rules, sync the glossary."
10: `/repo-setup` sets up a new repository in the shape the plan skills expect, or keeps an existing repository's shared-rules block and its glossary's plan-terms block equal to their templates. It leaves behind the approved tree, committed when the repository's commit rule allows it, or the synced blocks.
== grill
3:description: "Settle a roadmap entry's design decisions before its plan opens, by an interview in rounds: list the decisions the entry's goal and gate need, ask every decision whose prerequisites are settled in one round, each with its options, their pros and cons, a reference line for the configured design bar, one recommendation and the lazy option named, have facts looked up by agents instead of asked, and write each answer as it settles into the plan's Rulings or the entry's rulings file, the roadmap entry, the glossary and, on the user's yes, a proposed ADR. Triggers on: grill <entry>, grill me on the entry, settle the design decisions of an entry, interview me about the design, design decisions before the plan, stress-test the design of an entry."
10: `/grill <entry>` interviews the user, in rounds, until the design decisions of one roadmap entry are settled. It leaves behind each settled answer as a bullet of the plan's Rulings or of the entry's rulings file, the roadmap entry the answers changed, the glossary terms they settled, a proposed ADR for each decision the user chose to record, and one commit when the user allows it.
== spec
3:description: "Prepare one step of an open plan: refuse a step without the user's authority ((approved) or (ruling <name>)), check each premise of the step's text against the tree, under libraries: check, look for a library for each capability the step builds, a candidate being the user's choice, write the brief (checked premises, fix text, verification list, report shape, pointer to the rules file, cases, libraries checked, paths it writes), compare those paths with the briefs of steps in flight, a shared file judged by the orchestrator, run the brief check (a fresh read-only agent checks the brief against the tree, each finding closed in the brief), create the worktree at main's head, stage the base binaries, and record the dispatch in the state file. A step a red line took back out of main is prepared again, its old work saved as a patch in the ledger and applied in the new worktree. Triggers on: spec <entry> <step>, brief <step>, prepare step <n>, write the brief; and on a ruling typed in reply to a stop (Ruled: ...)."
10: `/spec <entry> <step>` prepares one step of an open plan for its builder. It leaves behind the brief and its brief check's report in the preparation commit, and the dispatch entry written to the state file. It also leaves the step's worktree at the base, and the base binaries copied aside.
== plan-orchestration
3:description: "Run an open plan unattended, step by step, from its ledger folder: pick the next unblocked step, prepare its brief and worktree, dispatch one builder agent in the step's worktree, have a reviewer refute the result, send its findings back to the builder for the repair rounds plan.yaml allows, read the delta, land the step with the small fixes made at landing, book it, and repeat; stop only where a decision is the user's. Every project specific comes from .agents/plan.yaml and the ledger, so the same skill runs a code tool, a research project or a manuscript under Claude Code, and one orchestrator session can hand the plan to another mid-way. Triggers on: run the plan, next step, orchestrate the plan, plan orchestration, dispatch the next step, continue the plan, resume the plan."
10: The unattended loop that runs an open plan's steps, one after another, until a pause or until nothing unblocked is left; a stop blocks only its own step. It leaves behind each landed step on main, its landing report in the ledger, and a state file that says where the plan stands.
== ordo-help
3:description: "Print the command sequence for running a plan step by step (open, spec, build, refute, diagnose, close, land, and the loop inside a step), and for the plan named, where it stands: the position, the open items, the step in flight, which of its artifacts exist, and the command that comes next. Triggers on: ordo-help, ordo help, what do I type next, where is the plan, how does the plan loop work."
10: `/ordo-help` prints the command sequence for running a plan step by step, and, for a named plan, where that plan stands and the command that comes next.
[exit 0]
```

```
$ grep -n -e '^- The first' -e '^The first' skills/roadmap/SKILL.md skills/repo-setup/SKILL.md skills/grill/SKILL.md skills/spec/SKILL.md; grep -n -e '^- The last row' skills/repo-setup/SKILL.md
skills/roadmap/SKILL.md:174:- The first five rows are stops: each waits on the user.
skills/repo-setup/SKILL.md:215:- The first seven rows are stops: each waits on the user.
skills/grill/SKILL.md:246:The first three rows are stops, which wait on the user. The rest are refusals, which name their cause and change nothing.
skills/spec/SKILL.md:280:The first six rows are stops, which leave an open item as "Steps / A stop" says. The rest are refusals. A refusal names its cause and leaves nothing beyond what "Steps / A step taken back out of main" has already done.
216:- The last row is a refusal: it names its cause and changes nothing.
[exit 0]
```

```
$ sed -n '340p' skills/plan-orchestration/SKILL.md; sed -n '56p;60p' README.md; sed -n '1,12p' docs/figures/gen_figures.py; grep -n -A2 'def draw_legend' docs/figures/gen_figures.py
- Every skill the loop invokes (`/spec`, `/refute`, `/land`, `academic-paper` for manuscript content, `/roadmap` at the closing, and `/plan`, `/roadmap`, `/ordo-init`, `/repo-setup` or `/grill` run under a quoted ruling) is invoked through the runner every time, after a compaction too, and never carried out from remembered text.
![The pipeline of one roadmap entry as boxes in order: /repo-setup for a new repository or /ordo-init for an existing one, /roadmap add, the optional /grill, /plan, every step, and the closing, with the optional /plan-retro, /session-retro, /diagnose and /ordo-help beside them. Each box lists the stops where you are asked, marked every run, only when or optional.](docs/figures/pipeline.svg)
![The loop of one step as boxes in order: /spec, build it, /refute, close them, which sends a finding whose cause is not known through /diagnose, /refute over the round, and /land, with a return for a further round, a card for when a command stops, a card for when it refuses, the optional /ordo-help card, and the optional /plan-orchestration band. Each box lists the stops where you are asked, marked every run, only when or optional.](docs/figures/plan-loop.svg)
"""Write the two SVG figures of the README: the pipeline of one roadmap entry and the plan loop.

Writes, beside this file:

- pipeline.svg: /repo-setup or /ordo-init, /roadmap add, /grill, /plan, every step, the closing,
  with /plan-retro, /session-retro, /diagnose and /ordo-help beside them.
- plan-loop.svg: /spec, build it, /refute, close them, /refute over the round, /land, the return
  for a further round, the stops and refusals, and the /plan-orchestration band.

Every box, arrow and label is written in this file, taken from each skill's Stops table and from
the sequence /ordo-help prints; the script reads no skill file. A change to a Stops table, to the
sequence or to a skill name is made in the labels below, and the script is run again.
377:def draw_legend(canvas: Canvas, x: float, y: float, width: float) -> None:
378-    """The three marks and the dashed box with what each says, on one row, and a note under it."""
379-    draw_caption(canvas, x, y, "HOW TO READ THE MARKS", width)
[exit 0]
```

Each holds:

- `roadmap` description "Writes only after the user approves" and opening "each change the user approved": `roadmap` Steps 4 (line 71) still says "Write the change once the user approves or corrects it", and its sub-bullets (lines 72 to 75) say a draft that is the quoted ruling's change is written without the stop, so the ruling is that approval; Stops count "The first five rows are stops" (line 174) holds: the table has five stop rows ("The change", "No gate", "The level", "The insertion form", "A missing dependency"), and three of them ("The change", "The level", "The insertion form") changed in their "When" cell only.
- `plan` description ("a drafted step list for approval", "each approved step tagged (approved)") and opening: Steps 3 of `plan` says a step list written under a quoted ruling is the approved list and each step line ends with `(approved)`.
- `ordo-init` description ("write nothing until the user approves") and opening ("the pages the user approved"): Rules 1 sub-bullet, `ordo-init` line 163, "A quoted ruling that states the draft is that approval." The skill has no Stops count line.
- `repo-setup` description ("Shows the whole tree and every file's text ... before writing", "rewrites them after approval") and opening ("the approved tree"): Steps 4 still begins "Show the draft, the tree and every file's text ... together" (line 79) and its sub-bullet says only that the draft is then written without the stop; Rules line 231 says a quoted ruling that covers the draft is that approval; Stops count "The first seven rows are stops" (line 215) holds (seven stop rows, the eighth "Tracked files" a refusal, line 216).
- `grill` description and opening: the settled answers are written as before; the roadmap diff "on the user's yes" is, under a quoted ruling, the ruling (`grill` line 272 and Steps 8 lines 199 to 206); Stops count "The first three rows are stops" (line 246) holds ("A round", "The end", "A lookup agent served another model").
- `spec` description and opening: the sentence about the authority tags is unchanged; the Stops count "The first six rows are stops" (line 280) holds, since no row of its Stops table changed.
- `plan-orchestration` description and opening ("stop only where a decision is the user's"): the new Stops sub-bullets (lines 306 to 308) keep the stop where the option names one, and the skill's closing-step stop "The roadmap diff" stays; the rule "Every skill the loop invokes ... is invoked through the runner every time" (line 340) now also names the five skills run under a quoted ruling, as the brief's item 7 gives it.
- `ordo-help` description and opening: the sequence still prints the commands, and its one new line continues the `"Ruled: ..."` line in column 31.
- `gen_figures.py`: the head comment (lines 1 to 12 printed above) says the script writes the two SVG files and that every box, arrow and label is written in the file; the note is one more label written in the file, and the head comment's list of errors ("a caption, a note or the legend that does not fit one line") covers it. The docstring of `draw_legend` is the dictated one ("The three marks and the dashed box with what each says, on one row, and a note under it."); the other docstrings describe functions the diff does not change.
- `README.md` alt texts (lines 56 and 60): they describe the boxes and the stops marked every run, only when or optional; the figures still show exactly those, with one more note under the legend that the alt text does not need to name.


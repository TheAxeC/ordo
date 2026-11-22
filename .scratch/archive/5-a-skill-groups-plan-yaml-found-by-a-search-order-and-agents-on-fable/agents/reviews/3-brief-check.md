# Brief check, step 3 of plan 5.A (brief `.scratch/5-a-skill-groups-plan-yaml-found-by-a-search-order-and-agents-on-fable/agents/briefs/3.md`, tree at cd05466)

Nothing in the repository was changed. No test was run; the commands below are greps, reads and one path resolution.

## 1. Names

Command: `git grep -n -F 'plan.yaml' -- ':!.scratch'` (192 lines, 40 files), plus `git grep -n -E 'ledger_root|worktree_root|archive_root|worktree_paths|\.agents/worktrees|check_config|land\.sh|plan configuration|projects: form|<project>'` over the files outside the main ones, plus `git grep -n -i -E 'plan\.yaml|\.agents|ledger_root|worktree_root|archive_root' -- agents docs/figures utils skills/paper skills/writing`.

- No file outside "Paths this step writes" names the configuration by a fixed place. `agents/*.md`, `docs/figures` (scripts and `.svg`), `skills/paper`, `skills/writing` and `utils/` print no line about the configuration; the only `utils` hits are `~/.agents/skills` in `utils/pin.sh:29,30,118,124` and `utils/pin.test.sh`, which is another folder.
- `skills/spec/templates/brief.md:5` (`Read <rules file from plan.yaml> first`) is outside the paths list. It names no place and stays true; listed so it is read once.
- `CLAUDE.md` is in the paths list and does not exist at the repository root. `git ls-files CLAUDE.md '*CLAUDE.md'` prints only `skills/repo-setup/templates/CLAUDE.md`, which is not in the list. The entry names a file the step cannot change, and a builder can read it as a file to create.
- The open plan's own state file, `.scratch/5-a-.../orchestrator-state.md:83`, tells a landing to run `land.sh <state file> <slug>-<step> <base>` with three arguments. Item 6 makes that call exit 64. The file is the orchestrator's, not the builder's, and no later step of plan 5.A lands through `land.sh`.

## 2. The step line

Each part of the step 3 line has an item:

| Part of the line | Item |
|---|---|
| The folder in front of the entry | 2, decision 1 |
| The order, first found | 1 |
| Paths relative to the file's folder | 3 |
| Default `.agents/worktrees` | 4 |
| `land.sh` and `check_config.py` given the path | 5, 6 |
| Ordo's configuration moved, `.gitignore` | 7 |
| The checks | C1 to C6, C11, C14, C15, C16 |

Requirements that neither the line nor the rulings carry:

- **`check_config.py --find` (item 5, decision 4).** It is a new interface. Only `ordo-init`, `repo-setup` and the test run it. The other skills find the file by reading the `plan` skill's text (item 1).
- **Decision 3.** `ordo-init` and `repo-setup` keep writing a new file to `.agents/plan.yaml`, and item 8 lets such lines keep the name. The Gate says every line the grep prints "states the search order or names the file it found". A line that names `.agents/plan.yaml` as the place a new file is written does neither. `git grep -c` shows where they are: `skills/ordo-init/SKILL.md:11`, `skills/repo-setup/SKILL.md:5`, `README.md:8`, `check_config.test.sh:18`.
- **Decision 2.** `/plan-orchestration` with no entry reads only the root places.
- **Item 6, "not be its root".** It is carried from today's refusal of `.` in `land.sh:141`, not from the line.

Requirements the brief needs and does not state:

- **The values of the example files and of `ordo-init`'s draft.** `skills/plan/templates/plan.yaml:1` says "Copy it to .agents/plan.yaml", and its values are `docs/roadmap.md`, `.scratch` and so on. Under item 3 a file at `.agents/plan.yaml` needs `../docs/roadmap.md` and `ledger_root: ../.scratch`. Item 4 changes the examples only for `worktree_root`. `skills/ordo-init/SKILL.md:208` ("Every path is relative to the repository root") and its draft steps are not named in any item. The builder would have to choose the shape of a configuration value, which rule 4 of the change standard reserves.
- **The base of a path default.** `adr` defaults to `docs/adr` (`plan.yaml:23`). Item 4 states the base only for `worktree_root`.
- **Which other keys hold a path.** Item 3 ends with "any other key the example file gives a path". `bench` ("Binaries /spec stages", `plan.yaml:22`) and `look` ("a page, a command", line 20) are left to the builder.

## 3. Premises

- **"the fifteen `SKILL.md` of the skills other than `paper` and `writing`".** `git grep -c -F '.agents/plan.yaml' -- ':!.scratch'` lists 14 `SKILL.md`: code-comments, diagnose, grill, land, ordo-help, ordo-init, plan-orchestration, plan-retro, plan, refute, repo-setup, roadmap, session-retro, spec. `ls skills` shows 16 folders, so 14 without the two. The paths list names 14.
- **"eight refusals name `.agents/plan.yaml`" in `land.sh`.** `grep -c 'refuse(.*\.agents/plan.yaml' skills/land/templates/land.sh` prints 7 (lines 153, 155, 157, 164, 172, 176, 181). The 9 lines in total hold.
- **`check_config.py` "opens `<root>/.agents/plan.yaml` (line 201)".** Line 201 is `root = os.path.abspath(...)`; the path is built at line 202 and opened at line 207.
- **161 lines in 39 files, and every per-file count.** They hold.
- **The remaining line references.** `land.sh:148`, `land.test.sh:44`, `plan.yaml` lines 2 and 10, `skills/plan/SKILL.md:16`, `skills/grill/SKILL.md:17`, `self-rule.md:78`, `README.md:182`, `plan-terms.md:84`, `ordo-init/SKILL.md:128`, `repo-setup/SKILL.md:109`, both `.gitignore` files and the values of `.agents/plan.yaml` hold.

## 4. Cases and checks

- **C17 against rule 6 and the brief's own "Verify before you report".** C17 runs `sh skills/land/templates/checks.sh <the plan's state file>`, which is the whole verify list, in the worktree. Rule 6 and the brief say the whole list runs once, at landing on main. `checks.sh` is also not in the paths list, so the case checks a place the step does not change.
- **"Every case the test has today is kept" against items 3 and 5.** `check_config.test.sh:119` is `adr|../elsewhere|adr is not a path under the repository root: '../elsewhere'`. With the file at `.agents/plan.yaml`, `../elsewhere` resolves to `<root>/elsewhere`, inside the repository, which item 3 allows. The kept case then expects a refusal the items forbid.
- **The kept cases and their fixtures.** `check_config.test.sh:24,40` copy the examples to `.agents/plan.yaml` with pages at `<repo>/docs/...`. `land.test.sh:78-79,102-108` write `ledger_root: ledger` and `tools/b/.scratch` into `.agents/plan.yaml`. Under item 3 each fixture's values or place must change. The brief says only "run on the path of the file" and "with the path of its `plan.yaml` given".
- **C6 against item 5.** C6 says the check passes "when `apps/web/ledger` ... exist". `check_config.py` makes no check that `ledger_root` exists (lines 153 to 162 cover `roadmap`, `verification`, `rules`, `standards` and `worktree_paths`). Item 5 says "Every check it makes today is kept" and adds none. The case implies a check that no item asks for, and one that would refuse a new repository with no ledger folder yet.
- **Item 9 against `docs/dev/skill-layout.md:23`.** The standard says "A plan that changes a skill raises one part of its `metadata.version` once". `grep -n -i version` on briefs 1 and 2 shows brief 1 item 7 raising the second part for `code-comments`, `spec`, `refute`, `plan-orchestration`, `grill` and `diagnose` and the third for `plan` and `ordo-help`, and brief 2 item 7 raising the third part of each skill whose text changes. Step 3 raises the same skills again, so the plan raises a skill up to three times, and the three steps change the same version line.
- **"Report" against rule 7.** The brief's list leaves out the state file's open items verbatim, every file changed with its line count, and each user-visible change with before and after. It also leaves out the grep that rule 14 has the report quote.

## 5. The question

- **C1 to C5, C7.** Yes. They run `--find`, which `/plan`, `/spec`, `/refute`, `/land` and the other plan skills never run; those skills find the file from text. A skill text with a wrong order passes every case.
- **C5.** Yes. It sets `docs` against `.agents`, and the named folder against both. A script that looks in `docs/` before `.scratch/` passes. The Gate asks for one pair only, so the brief matches the Gate, and the order of `.scratch` against `docs` has no case.
- **C6.** Yes, for its `ledger_root` half. The Gate asks for "a nested file's relative `ledger_root` resolves under that file's folder". `check_config.py` does nothing with `ledger_root`, so the case passes whether the key is read from the folder or from the root. Only the pages half fails on a read from the root. A value such as `ledger_root: ../ledger` in `apps/web/plan.yaml` is inside the repository from the folder and outside it from the root, so a pass on it shows the base; that needs the outside-the-repository check of item 3.
- **C8.** Yes. `../../elsewhere` in `docs/plan.yaml` is outside the repository from `docs/` and from the root alike, so it does not show which base is used.
- **C10.** Yes, for the no-argument half as a proof under rule 13. The unchanged script run with no argument in a folder without a configuration already prints `error: no .agents/plan.yaml in ...` and exits 1 (lines 201 to 205). The first run fails there only when started in a repository that holds a configuration.
- **C15.** Yes. Ordo's file has no `adr` line. If the default `docs/adr` is read from the file's folder it becomes `docs/docs/adr`, and `check_adr` (lines 117 to 119) prints a note, not an error, for an absent default folder. C15 passes while `/grill` would write records into `docs/docs/adr`.
- **C16.** Yes. It asks for a clause per line that stays; the Gate asks that each line state the order or name the file found (see check 2, decision 3).
- **C14.** Yes on its own, since a moved file with unrewritten values passes it; C15 covers that.
- **Item 2.** Yes. No case or run in this step reads a call with a folder; the first such run is step 4's.
- **Item 3, the configuration block.** Yes. "`/plan` writes each path as it reads from the repository root" has no case in this step; step 4's real run is the first check.
- **The Gate's cases.** The six of `check_config.test.sh` map to C1, C2, C3, C4, C5 and C6. The one of `land.test.sh` maps to C11, which fails on a read from the root, since the state file would then not be under `ledger`.

## 6. Implied inputs

Missing from "Cases" unless marked covered.

1. **An existing `.agents/plan.yaml` with paths from the repository root.** Every repository set up before this step has one; `README.md:182` and the examples show the form. Expected: `check_config.py` names each page as missing under `.agents/`, and `land.sh` refuses with 64 because the state file is not under `.agents/<ledger_root>`. No case, and no item says what the user is told.
2. **A default path key left out** (`adr`, in Ordo's own file). Expected: stated base, and for Ordo `docs/adr` at the root. No case; see C15.
3. **A symlinked folder on the path.** It happens on this machine: `python3 -c 'import os,tempfile; ...'` prints `/var/folders/.../T /private/var/folders/.../T False`. `check_config.test.sh:14` does not resolve its scratch folder, while git's top level and `land.sh:109` (`pwd -P`) are resolved. Expected: the file's path and the root are both resolved before "outside the repository" and "the path from the repository root" are computed, and `..` is applied after resolving the folder. A wrong answer refuses a right configuration. No case.
4. **`.scratch/plan.yaml` with `ledger_root: .`**, the natural value for the second place of the order. Expected: accepted by both scripts, ledger root `.scratch`. `land.sh:141` refuses `.` today, and item 6 forbids only the repository root. No case.
5. **`ledger_root` or `worktree_root` resolving outside the repository or to its root, in `land.sh`.** Expected: exit 64 before anything is touched (item 6). Rule 15 makes it a case, since the value becomes the worktree path and the pathspec left out of `git add`. C8 covers `check_config.py` only.
6. **The `projects:` form with relative ledger roots in a nested file** (`tools/plan.yaml`, `ledger_root: a/.scratch`). Expected: the project whose resolved ledger root holds the state file. Covered only if the kept case of `land.test.sh:100-125` is rewritten to a nested file; the brief does not say so.
7. **A state file given as an absolute path.** Covered by the same kept case (`land.test.sh:118`).
8. **The `plan.yaml` path absolute, or relative to another folder than the root.** Expected for `check_config.py`: any path works, the root coming from git. Expected for `land.sh`: relative to the repository root or absolute, as the state file. The brief states neither, and item 6 says "names the file by the path given". No case; low cost, a refusal.
9. **A `plan.yaml` in no git repository, given to `check_config.py`.** Expected: an `error:` line and exit 1. Not stated.
10. **A named folder with a trailing slash, as `.`, absolute, or leading out through `..`, given to `--find`.** Expected: `apps/web/` prints `apps/web/plan.yaml`; a folder outside the repository is refused (rule 15); `.` is stated either way. No case.
11. **A project named like a folder that holds a `plan.yaml`.** Decision 1 gives the folder; covered by its five examples, read by the reviewer only.
12. **The configuration block of a state file already written.** Its paths are from the repository root and item 3 keeps that reading, so it is read as today. The open plan's block (`worktree_root: .agents/worktrees`, `standards` with the old skill path) stays valid, apart from the layout change of step 2.
13. **Plan 5.A at this step's landing.** The pinned `land.sh` opens `<root>/.agents/plan.yaml` before the cherry-pick removes it, so the landing reads it. Steps 1 and 2 change `.agents/plan.yaml` (brief 1 item 6 the `reviewer` comment, brief 2 item 6 the `standards` value) and step 3 moves it and rewrites the same `standards` line, so the cherry-pick meets a conflict or a stale value there. The ruling "Three steps in flight" puts the fix at landing. Once step 3 is on main, the pinned skills find no `.agents/plan.yaml` until step 4 pins; the same ruling names this.
14. **A state file's landing sentence with three arguments** (the open plan's line 83, and any open plan elsewhere). Expected: exit 64, nothing touched. Covered by C12 for the script; the stale sentence is not addressed.

## 7. ADRs

Command: `for f in docs/adr/[0-9]*.md; do awk '/^## Decision/{p=1;next} /^## /{p=0} p' "$f"; done`, filtered with `grep -i -E 'plan\.yaml|configuration|ledger_root|worktree|projects:|check_config|land\.sh|repository root|\.agents'`.

No decision governs where the configuration stands, how its paths are read, what `check_config.py` or `land.sh` take, or the `projects:` form. Decisions that touch the area, none contradicted:

- **ADR 0030:** "`paper` and `writing` read no `.agents/plan.yaml`." The decision sentence itself names the place. It stays literally true after the step and narrower than its title ("read no plan configuration"). Item 8 forbids a change to a decision, and step 1 edits this record in place.
- **ADR 0007:** "Ordo's `.agents/plan.yaml` sets it to `claude:sonnet`." The sentence is inside the Decision; the ruling "Fable and the session" has step 1 remove it. If step 3 rewords it, the two steps change one line.
- **ADR 0005:** "written to `<ledger_root>/choices.md`". With a `plan.yaml` per folder each file has its own ledger root, so its own choices file.
- **ADR 0011:** "The skills read the dispatch blocks of every open plan to count the steps in flight against the one limit". Decision 2 limits a call with no folder to the plans of the root file; the count then leaves out the plans of a nested file. Not a contradiction of the sentence, and not stated in the brief.
- **ADR 0012:** the landing commit takes its paths with `--no-renames`, so the move of `.agents/plan.yaml` names both paths.

## 8. Dictated text

Command for the paths: a `python3` run resolving each new value from `docs/` with `os.path.normpath` and comparing it with the present value. Output: nine lines, each `same exists`.

| Dictated text | Result |
|---|---|
| `roadmap: roadmap.md` | holds, resolves to `docs/roadmap.md` |
| `verification: dev/building.md` | holds |
| `rules: dev/change-standard.md` | holds |
| `ledger_root: ../.scratch` | holds |
| `archive_root: ../.scratch/archive` | holds |
| `worktree_root: ../.agents/worktrees` | holds; `git check-ignore -v --no-index .agents/worktrees/x` prints `.gitignore:2:.agents/*` |
| `standards: [dev/skill-layout.md, ../skills/repo-setup/templates/docs/dev/prose-standard.md, glossary.md]` | holds on this tree; names the layout step 2 removes, which the ruling leaves to the landing |
| "No other value changes" | leaves the file without an `adr` line; see check 5, C15 |
| `check_config.py <path of plan.yaml>` | holds |
| `check_config.py --find <repository root> [<folder>]` | holds |
| `land.sh <state file> <slug>-<step> <base> <path of plan.yaml>` | holds |
| `error:` lines, exit 1 and exit 64 | hold against today's forms (`check_config.py:204`, `land.sh:73`) |
| "the `plan.yaml` found", "the plan configuration" (item 8) | hold; **plan configuration** is a glossary term (`docs/glossary.md:80`) whose entry the step rewrites |
| The line removed from `.gitignore`, `!.agents/plan.yaml` | holds, present at `.gitignore:3` |

The brief itself is ASCII: `LC_ALL=C grep -n '[^ -~]'` on it prints nothing.

## Declined to judge

- Whether the brief's wording meets the prose standard and the skill layout. I read those two pages only at the lines this check needed (the version rule, `skill-layout.md:12-23,81,98`), not in full.
- The glossary beyond the ten entries that name `.agents/plan.yaml` or the repository root.
- The decisions of ADR 0036 to 0043, which were cut at 1500 characters and read through the keyword filter only.
- Whether decisions 1 to 6 of the brief are the right designs; they are the orchestrator's and the user's.
- Whether the merge of steps 1, 2 and 3 at landing is simple; the ruling "Three steps in flight" gives that to the orchestrator.
- Whether the existing tests pass on the tree; none was run.

Agent usage: a4d3ffc7dd382169a, claude-fable-5-2, 156175 tokens, 19 tool uses, 5.6 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1, `CLAUDE.md` in the paths: replaced by `skills/repo-setup/templates/CLAUDE.md`; `skills/spec/templates/brief.md` added.
- 1, the landing sentence of the open plan's state file: the ledger is the orchestrator's; the pinned `land.sh` takes three arguments until step 4 pins the new skills, and the orchestrator rewrites the sentence then.
- 2, the example values and `ordo-init`'s draft: item 8, a new configuration at `docs/plan.yaml` with the examples written for that place (choice C134).
- 2, decision 3 against the gate's reading of each line: item 9 keeps the name only for the fourth place of the order and a test that builds it.
- 2, the base of a path default and which keys hold a path: item 3, decision 7.
- 2, `--find` and the script arguments: choice C135.
- 3, fourteen `SKILL.md`, seven refusals, lines 201 to 207: corrected in "What is on the tree".
- 4, C17 running the whole verify list: replaced by a reading case; check 6 says the list is not run in the worktree.
- 4, the kept cases and their fixtures, the `adr` case: the cases say how each fixture is written.
- 4, C6 and a check of `ledger_root` that no item asks for: C6 uses `ledger_root: ../../ledger`, which is inside the repository only from the file's folder.
- 4, the versions: item 10 leaves the lines step 1 raises.
- 4, the report shape: rules 7, 13 and 14.
- 5, the order in the skills' text: C17. `.scratch` against `docs`: C5. C8 keeps its refusal, and C6 shows the base. C10: run inside a repository with a sound configuration. C15 and the default `adr`: item 3, C10a. C16: worded as the gate words it.
- 6, an existing `.agents/plan.yaml`: item 8's paragraph of the README. A link on the path: item 3, C10d. `ledger_root: .`: item 3, C10b. `land.sh` outside the repository: C13a. The nested `projects:` form and the absolute state file: the kept case. The forms of the path: items 5 and 6. No git repository: item 5, C10. The folder given to `--find`: item 5, C10c.
- 7, ADR 0007's line: left to step 1, the record removed from the paths. ADR 0011: decision 2.
- 8, dictated text added after the check: `roadmap: roadmap.md`, `ledger_root: ../.scratch`, `archive_root: ../.scratch/archive` for the example files: each holds, a path from `docs/` to the place the present value names from the root.

# Report of step 3: the build driver

Everything in the brief is done.

## Open items of the state file, verbatim

The section "## Open items" of `.scratch/25-project-rules-a-build-driver-submit-and-tutor/orchestrator-state.md`, read in the main checkout with `sed -n '/^## Open items/,/^## Closed items/p'`, holds no item: its heading line is followed by two empty lines and then "## Closed items".

## The cases' first run

`build.test.sh` was written first and run once on the tree with no `templates/utils/build.py` (`ls skills/ordo/ordo-init/templates/utils/` printed `build.test.sh` only):

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/ordo/ordo-init/templates/utils/build.test.sh; echo "exit $?"
cp: .../skills/ordo/ordo-init/templates/utils/build.py: No such file or directory
FAIL: passing: cannot copy the template .../skills/ordo/ordo-init/templates/utils/build.py
exit 1
```

Each reading case, read on the unchanged skill (version 4.0.0):

| Case | Result on the unchanged skill |
|---|---|
| `/ordo-init build` with no `plan.yaml` | No mode exists: "What it reads" 4 says "a single argument is the path", so `build` is the folder `build`; Steps 1 finds no tracked file there and runs "Steps / A new repository" in it. No refusal. |
| `/ordo-init build` on a page with no command | Same: `build` is a path, no refusal names the page. |
| `/ordo-init build` run a second time | Same: no driver is read, no lists exist. |
| `/ordo-init build` with another `utils/build.py` | Same: no stop for the file. |
| `/ordo-init ./build` | The folder `build` is the path and no mode runs: holds already. |
| A page command with `\0` and quotes | No read-back exists. |
| A new-repository run where the user declines the driver | No question on the driver exists; no `utils/build.py` is written and the page holds the commands themselves: holds already. |
| An existing-repository run | No driver is written, and no mode is named. |

No case is one the brief's own rules get wrong.

## DONE / NOT DONE

| # | Check | Output as printed | State |
|---|---|---|---|
| 1 | `sh skills/ordo/ordo-init/templates/utils/build.test.sh 2>&1 \| tail -1` | `PASS: build.py scratch tests` | DONE |
| 2 | `sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 \| tail -1`; `sh skills/ordo/ordo-init/templates/sync_rules.test.sh 2>&1 \| tail -1` | `PASS: check_config.py scratch tests`; `PASS: sync_rules.py scratch tests` | DONE |
| 3 | `python3 -B -W error skills/ordo/ordo-init/templates/utils/build.py; echo "exit $?"`; `test -x ...; echo $?` | `usage: build.py build\|test\|check\|gate`, `exit 2`; `0` | DONE |
| 4 | `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary; echo "exit $?"` | `ok: the plan-terms block equals the template`, `exit 0` | DONE |
| 5 | The character-set check over the 16 files the step changes (list from `git diff --name-only` and `git ls-files -o --exclude-standard`, `wc -l` printed `16`) | nothing printed, `exit 0` | DONE |
| 6 | Description length; `grep -n 'version:' skills/ordo/ordo-init/SKILL.md` | `1011`; `5:  version: "5.0.0"` | DONE |
| 7 | `grep -n 'build.test.sh' docs/dev/scripts.md docs/dev/building.md docs/dev/change-standard.md` | `docs/dev/scripts.md:51:`, `docs/dev/change-standard.md:82:`, `docs/dev/building.md:18:` | DONE |
| 8 | `python3 docs/figures/gen_figures.py; echo "exit $?"`; `git status --short docs/figures` | `exit 0`; ` M docs/figures/gen_figures.py`, ` M docs/figures/pipeline.svg` | DONE |
| 9 | The skill read against ADR 0051 and ruling B | see the section below | DONE |
| 10 | New list items and sentences read against the rules on list items and sentence length | see "Departures from the list and sentence rules" | DONE |

Beside the brief's checks, the template was held to `python.md` with the tools that page names, run from `$TMPDIR` with no repository configuration: `ruff check --isolated --target-version py310 --line-length 100 --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602` prints seven `E501` lines, each on a line of the docstring, which keeps one paragraph or bullet per line (see the departures); `ruff format --isolated --line-length 100 --check` prints `1 file already formatted`; `pyright --pythonversion 3.10` prints `0 errors, 0 warnings, 0 informations`.

## The driver's subcommands, with the exit status of each case as the test printed it

```
ok: gate, three passing lists: exit 0
ok: gate, a failing test command filtered by tail: exit 3
ok: test, the first of two commands failing: exit 1
ok: build, false && echo reached: exit 1
ok: check, a command with a trailing comment: exit 0
ok: build on an empty list: exit 1
ok: gate, build empty, test and check passing: exit 0
ok: gate, all three lists empty: exit 1
ok: no subcommand: exit 2
ok: frobnicate: exit 2
ok: gate extra: exit 2
ok: build, a pipe and a quoted argument with a space: exit 0
ok: build, quotes, a dollar and backslashes: exit 0
ok: test, a command that changes folder: exit 0
ok: build, called from another folder: exit 0
ok: build, a driver in tools/a/utils/: exit 0
ok: check, a command that reads standard input: exit 0
ok: test, a command ended by a signal: exit 1
ok: ./utils/build.py gate: exit 0
ok: no __pycache__ folder after the runs
PASS: build.py scratch tests
```

What each case asserts beside the exit status, by reading `build.test.sh`: the first case holds the whole output equal to the echo lines, outputs and count lines in the order build, test, check; the filtered failure holds the last line `build.py test: failed with exit 3: sh -c "exit 3" 2>&1 | tail -1` and that no `check` command was echoed or run; the two-command failure holds that `second-ran` was not made; the `&&` case holds no line `reached`; the signal case holds the last line `build.py test: failed with exit 143: (kill -TERM $$)`; the special-character case holds the file byte for byte equal to `q'd"s$v\0\x20`; the folder cases hold `pwd -P` equal to the scratch tree's root; the input case pipes `leaked` into the driver and holds that no line `leaked` was printed. The test fills each list the way the skill tells the mode to write it, each command in double quotes with each backslash and double quote escaped.

## ADR 0051 and ruling B, each with the section of the skill that holds it

| Bullet | Where the skill holds it |
|---|---|
| `ordo-init` has a mode, `/ordo-init build` | Quick start; "What it reads" 4 and 10; Steps 1; "Steps / The build driver" |
| The mode writes `utils/build.py` from a standard-library template filled with the page's commands | "What it reads" 1; "Steps / The build driver" 2, 5 and 7; `templates/utils/build.py` imports only `subprocess`, `sys` and `pathlib` |
| It rewrites the page to name the driver's `build`, `test` and `check`, one per line; `gate` runs the three | "Steps / The build driver" 6, part 3; the template's `main` |
| A subcommand with no command named says so and exits non-zero | The template's head comment and `main`; cases "build on an empty list" and "gate, all three lists empty" |
| A new-repository run writes the driver by the same steps unless the user answers it should not | "Steps / A new repository" 9; question 11 of `references/new-repository.md` |
| An existing or a configured repository gets the driver only through the mode | "Steps / An existing repository" 3 and "Steps / A configured repository" 1, one sentence each |
| The rule on build files stands, and names the new-repository run as the one exception | Rules, "Build files are written only for what the user names." with its two sub-bullets |
| The template has a test | `templates/utils/build.test.sh`; `docs/dev/scripts.md`, `docs/dev/building.md`, `docs/dev/change-standard.md` |
| The added sentence: `gate` skips an empty subcommand, fails only when all three are empty, and the page names only subcommands that have a command | The template's `main`; "Steps / The build driver" 6, part 3 ("a subcommand whose list is empty left out") |
| Ruling B: each command runs under `bash -o pipefail` and the driver imports nothing of the repository | The template's `run_list` and head comment; cases "a failing test command filtered by tail" and "false && echo reached"; the `__pycache__` case |
| Ruling B: `gate` skips an empty list and fails only when all three are empty | The template's `main`; cases "gate, build empty" and "gate, all three lists empty" |
| Ruling B: `build`, `test` or `check` on an empty list says so and exits non-zero | The template's `main`; case "build on an empty list" |
| Ruling B: the page names only the subcommands that have a command | "Steps / The build driver" 6, part 3 |
| Ruling B: ADR 0051 gets one sentence | `docs/adr/0051-*.md`, Decision, the new third bullet; `git diff` shows one added line and no other change |

## The pages item 4 and item 9 found, each with its change

Item 4, `grep -rn 'building.md\|utils/' skills/ordo/ordo-init/templates skills/ordo/ordo-init/references`:

- `skills/ordo/ordo-init/templates/CLAUDE.md:27`, the Build placeholder: it now says that with the build driver the block holds its `python3 utils/build.py` lines as the page names them. Line 15 (`docs/dev/building.md` in "Read before you act") stays true and is unchanged.
- `skills/ordo/ordo-init/templates/docs/dev/change-standard.md:64` and `:67`: the sentence on filters says the filter stands inside `utils/build.py` where the repository has the build driver, and the placeholder of the command block says it then holds the driver's lines.
- `skills/ordo/ordo-init/references/new-repository.md:28` (`README.md` row): stays true, unchanged. `:39` (`docs/dev/building.md` row): now says the page names the driver's commands when the driver was written and the commands themselves otherwise. `:46` (`utils/` row): unchanged, and a row `utils/build.py` follows it.
- `skills/ordo/ordo-init/templates/check_config.test.sh` (lines 35 to 276) and `templates/gitignore/common.gitignore:14`: they name `building.md` and `utils/` for other purposes and stay true, unchanged.

Item 9, `grep -rn 'Build files\|build file'` and `grep -rln 'ordo-init'` and `grep -rln 'building.md'` over `skills/ utils/ docs/ README.md`, `docs/roadmap.md` and `docs/adr/` left out:

- `skills/ordo/ordo-help/SKILL.md:99`: the printed sequence gains the line of `/ordo-init build`; its version rises to 5.1.0 (see the judgment calls).
- `README.md:13` (the row of `ordo-init`): names the mode and the driver. `README.md:41` (the command block): gains the same line as `ordo-help`. `README.md:69` (the alt text of `pipeline.svg`): gains the three new boxes. `README.md:176` (the paragraph "A new repository is set up with `/ordo-init`"): names the question on the driver and the driver's draft, and that an existing repository gets it only from `/ordo-init build`.
- Every other hit stays true and is unchanged: the `ordo-init` hits in `wizard`, `codebase-design`, `code-comments`, `paper`, `grant`, `writing`, `grill`, `roadmap`, `plan`, `spec`, `plan-orchestration` and its `references/self-rule.md`, `shared-rules.md`, `check_config.py`, `templates/docs/glossary.md`, `docs/plan.yaml`, `docs/dev/skill-layout.md`, `docs/dev/scripts.md`, `codebase-design.svg` and `README.md` lines 7, 36, 127, 161, 178 to 196; the "build files" hits in `wizard` and in `ordo-init`'s own Steps and `references/new-repository.md:8`; the `building.md` hits in the `plan` skill's two templates and `docs/plan.yaml`.
- `"Steps / A new repository" 9` to `12` were cited six times, all inside `ordo-init/SKILL.md` (`grep -rnoE '"Steps / A new repository" (9|1[0-2])[^0-9]' skills docs README.md`); each now cites the renumbered item.

## The terms

- Added: **build driver**, in `skills/ordo/ordo-init/templates/plan-terms.md` after **builder**, and by `sync_rules.py . --only glossary --write` in `docs/glossary.md` (`written: the plan-terms block now equals the template`).
- Unchanged and still true: **questions, the** (it names questions 1, 5 and 9 as also asked elsewhere; question 11 is asked only in a new repository) and **new repository**.
- Used in a new place: **verification page** and **quoted ruling** in "Steps / The build driver"; **commit rule** at its items 6 and 10; **gate** names the subcommand of the build driver, defined in the new entry.

## The files with line counts

| File | Lines added, removed (`git diff --numstat`) or total |
|---|---|
| `skills/ordo/ordo-init/templates/utils/build.py` | new, 100 lines, mode 755 |
| `skills/ordo/ordo-init/templates/utils/build.test.sh` | new, 230 lines |
| `skills/ordo/ordo-init/SKILL.md` | 101 added, 19 removed |
| `skills/ordo/ordo-init/references/new-repository.md` | 3, 1 |
| `skills/ordo/ordo-init/templates/CLAUDE.md` | 1, 1 |
| `skills/ordo/ordo-init/templates/docs/dev/change-standard.md` | 2, 2 |
| `skills/ordo/ordo-init/templates/plan-terms.md` | 1, 0 |
| `skills/ordo/ordo-help/SKILL.md` | 2, 1 |
| `docs/glossary.md` | 1, 0 |
| `docs/adr/0051-*.md` | 1, 0 |
| `docs/dev/scripts.md` | 2, 0 |
| `docs/dev/building.md` | 1, 0 |
| `docs/dev/change-standard.md` | 1, 0 |
| `docs/figures/gen_figures.py` | 9, 6 |
| `docs/figures/pipeline.svg` | 107, 100 |
| `README.md` | 4, 3 |

## Judgment calls the brief left open

1. The driver's printed lines: `$ <command>` before each command, as `checks.sh` prints it; `build.py <subcommand>: failed with exit <status>: <command>` and `build.py <subcommand>: <n> command(s) passed`; in `gate` a count line per subcommand, `build.py <subcommand>: no command is named, skipped` for an empty list, and `build.py gate: <n> commands passed` last. The usage and the two no-command lines go to standard error, the rest to standard output.
2. The template catches `OSError` from starting bash (bash missing, root folder missing), prints `build.py <subcommand>: cannot run bash: <reason>` and exits 1, since `python.md` says a command-line script catches the exceptions it expects; no case exercises it, as the brief names none.
3. The empty lists are written `BUILD: list[str] = []`. An empty two-line list (`BUILD = [` then `]`) is collapsed by `ruff format`, and the annotation gives pyright the list's type; the mode writes a filled list over several lines with a trailing comma, which `ruff format` keeps.
4. Each command is written as a Python string in double quotes, each backslash written `\\` and each `"` written `\"`; the head comment says so, the skill's "Steps / The build driver" 5 says so, and the test fills its lists that way.
5. A file at the driver's path is this driver when the first line of its docstring is the template's and it assigns `ROOT`, `BUILD`, `TEST` and `CHECK`, so that a driver from an older template is read and refilled, not stopped on.
6. A page that names the driver's commands and also other commands: the other commands are sorted into the lists read from the driver, so that no command of the page is lost ("Steps / The build driver" 5).
7. "Steps / A new repository" 9 to 12 became 10 to 13, so that the driver is its own item between the page's write and the fill of `CLAUDE.md`; the brief's "item 12's commit" is item 13 now.
8. In the `projects:` form the project's folder is the first folder of its `worktree_paths`; a project with none is asked for its folder with the draft.
9. The draft of the mode asks the commit question where the repository's rules state no commit rule, as "What it reads" 7 already does for the configured-repository stops, and its Stops row says so.
10. The "Use instead" table is unchanged: no neighbouring skill is the right one for a situation near the mode, so no row applies.
11. The figure gains boxes for the three new stop rows ("Another utils/build.py", "The draft of the driver", "A command that does not read back"), in the order of the Stops table. The fourth new row, "The mode refused", is a refusal, and the figure's own note says "A refusal names its cause and leaves nothing, so it is not drawn", as for "A skill's folder not found".
12. `ordo-help`'s `metadata.version` rose from 5.0.0 to 5.1.0: its printed sequence gains a line, which `docs/dev/skill-layout.md`, "Frontmatter", makes a minor change, and no other step of this plan has raised it (`git log -- skills/ordo/ordo-help/SKILL.md` shows no commit of this plan).
13. The description was shortened to 1011 characters: "the change standard, the prose standard" became "the change and prose standards"; "and syncs a block that is already there" was cut; "the shared rules in CLAUDE.md, the glossary's plan terms" became "the shared rules, the plan terms"; "compares the shared-rules block and the glossary's plan-terms block" became "syncs the two blocks". Every trigger phrase stays, and `ordo-init build` and `write the build driver` are added.
14. The test prints one `ok: <case>: exit <status>` line per case before its `PASS:` line, so that the exit status of each case can be quoted; the filter `2>&1 | tail -1` still keeps the `PASS:` line.

## Departures from the list and sentence rules

- `templates/utils/build.py`, docstring: its paragraphs and bullets are one line each, as the prose standard's section F and the change standard's rule 10 set; under a line length of 100 they are the seven `E501` lines ruff prints. The same holds in this repository's other scripts, such as `check_config.py`.
- `SKILL.md`, "Steps / The build driver" 5, the bullet on sorting: one rule (where a command goes), with three destinations; split, it would be three bullets that each hold a third of one rule.
- `SKILL.md`, "Steps / The build driver" 8: the read-back command is one line of 494 characters, its indent included, in a `sh` code block, since it is run as written.
- The Stops rows hold a sentence per cell, as the other rows do.

## Every user-visible change, before and after

| Surface | Before | After |
|---|---|---|
| `/ordo-init build` | `build` was the path of a folder | the mode "Steps / The build driver" |
| `/ordo-init ./build` | the folder `build` | unchanged: the folder `build` |
| A new repository | 10 questions; no `utils/build.py` | question 11 on the driver [yes]; the driver written at "Steps / A new repository" 9 unless the answer is no, its draft shown for approval, `docs/dev/building.md` naming `python3 utils/build.py build`, `test` and `check` |
| An existing or a configured repository | no driver | no driver; the run says `/ordo-init build` writes it |
| `templates/utils/build.py` | absent | the driver template, run as `./utils/build.py build\|test\|check\|gate` |
| `ordo-init` Stops | 13 rows | 17 rows: "The mode refused", "Another utils/build.py", "The draft of the driver", "A command that does not read back" |
| `ordo-init` version | 4.0.0 | 5.0.0 |
| `ordo-help` printed sequence | no line for the mode | a line for `/ordo-init build`; version 5.1.0 |
| `docs/figures/pipeline.svg` | 12 boxes in the `/ordo-init` lane | 15 boxes |
| `docs/glossary.md` | no **build driver** | the entry **build driver** |

## Anything in the brief that was wrong or impossible

- "What to build" 3 asks that a refusal "names the run of `/ordo-init` that writes" what is missing. For a page that states no command, no run of `/ordo-init` writes one: "Steps / An existing repository" 3 offers `docs/dev/building.md` only where no page qualifies, and runs only in a repository with no `plan.yaml`, which the mode always has. The refusal therefore names the page and says that its commands are written there first, since no run writes a command onto a page that exists. For a missing page, the refusal names `/ordo-init`, whose configuration check reports the missing page and proposes its fix, which is the run that acts on it. The brief's case for the empty page ("the refusal that names the page") holds as written.

## Repair round 1

Every ruling of `agents/briefs/3-round-1.md` is carried out. One point stays open for the orchestrator, stated under ruling 6: a filled driver whose command and comment together pass 100 characters still gets an `E501` from ruff, since the step's brief places the comment beside the string.

### Each finding, what changed and where

1. **The driver shown in full on a second run.** `SKILL.md`, "Steps / The build driver" 6, part 2: a driver written for the first time is shown in full; over a file that is this driver, as a diff against the file as it stands, as Rules says of a change to an existing file; beside a file that is not this driver, in full. The Stops row "The draft of the driver" now shows "the filled driver in full or, over a driver that stands, as a diff against it".
2. **A second run on a page that names only some of the driver's subcommands.** "Steps / The build driver" 5: a line `python3 <the driver's path>` followed by `build`, `test` or `check` is never sorted into a list, whichever of the three the page names. When the page names one or more of them, the lists start from those item 4 read, and each other command is sorted and added to its list. The completion criterion now reads "each command the lists started from stands in its list, and each command of the page stands in one list or is one of the driver's own". "Steps / The build driver" 8: a command that came from the page is held equal to the page's command with its filter; a command that came from the driver as it stood is held equal to that command as item 4 read it before the write. The Stops row "A command that does not read back" names both comparisons.
3. **`worktree_paths` in the `projects:` form.** "Steps / The build driver" 3: each entry of `worktree_paths` is read relative to the folder that holds the `plan.yaml`, as item 1 reads `verification`. The project's folder is its first entry resolved to a path from the repository root. Example: the entry `../tools/a` in `docs/plan.yaml` resolves to `tools/a`, the driver is `tools/a/utils/build.py` and `ROOT` is `../../..`. A project with no entry, or whose first entry resolves outside the repository or to its root, is asked about in the draft.
4. **The line of `build.test.sh` in `docs/dev/building.md`.** It now reads `sh skills/ordo/ordo-init/templates/utils/build.test.sh` with its comment and no filter, the comment aligned with the page's other lines. `docs/dev/scripts.md` and `docs/dev/change-standard.md` keep their form (the change standard's block keeps `2>&1 | tail -1`, as its neighbours do).
5. **The count of `E501` lines.** After ruling 6, `ruff check` on the template prints `All checks passed!`, so the count is 0.
6. **The docstring over the line length.** `templates/utils/build.py`'s head docstring is now short lines, each one sentence or one bullet, none broken across two lines: the usage; how a command is added and quoted; what each subcommand does; the lines on standard output and on standard error; that the driver imports and writes no file; the exit statuses. `awk 'length($0) > 100'` on the file prints nothing. The one thing the docstring no longer holds, that `bash -o pipefail` makes a failure in a pipe or an `&&` chain fail the command, now stands in the opening paragraph of "Steps / The build driver". The printed lines did not change, and the test is unchanged.
   - `ruff check --no-cache --isolated --target-version py310 --line-length 100 --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602` on the template prints `All checks passed!`.
   - `ruff format --no-cache --isolated --line-length 100 --check` prints `1 file already formatted`.
   - `pyright --pythonversion 3.10` prints `0 errors, 0 warnings, 0 informations`.
   - Open point: a scratch copy of the template, filled with one test command of this repository's page and its comment beside it (`"sh skills/ordo/ordo-init/templates/check_config.test.sh 2>&1 | tail -1",  # check_config.py on complete and broken configurations`), gets `build.py:53:101: E501 Line too long (134 > 100)` from the same `ruff check`. The step's brief says the comment stands beside the string, and the ruling covers the template's own lines, so I left it as it is. Ending it needs one of these choices, which are the orchestrator's: (a) the mode writes a comment that would pass the length on its own line above the string; (b) the mode splits a long string into adjacent literals inside parentheses, which `ast.literal_eval` reads back as one string; (c) the mode accepts `E501` on such lines in a repository that runs ruff.
7. **The failure line on standard output.** Nothing changed in the code. The docstring now says on which stream each line goes: the failure line, the count lines and the skip line on standard output, in order with the commands' output; the usage and the no-command and cannot-run lines on standard error.
8. **A new repository whose page holds no command.** `SKILL.md`, "Steps / A new repository" 9 gains the bullet: a `docs/dev/building.md` that names no command gets no driver; the user is told in one sentence that the page names no command yet and that `/ordo-init build` writes the driver once it does; the refusal "The mode refused" is not raised, and the setup goes on to item 10. The completion criterion gains "or the user is told that the page names no command yet". The Stops row "The mode refused" adds "never from "Steps / A new repository" 9". `references/new-repository.md`: question 11 gains the sub-bullet "A page that names no command gets no driver, whatever the answer, and `/ordo-init build` writes it once the page names one."; the row of `utils/build.py` reads "absent when question 11 gave no or docs/dev/building.md names no command".
9. **A page that names its filter in a sentence.** "Steps / The build driver" 2: each command is taken with its filter as `/plan` copies it, the filter written on its line or the filter the page names in a sentence for its test commands, written after the command. Item 5: the driver's string holds the command with that filter. Item 6, part 3: the three driver lines on the page carry no filter, and a sentence that names a filter for the test commands says that the filters stand in the driver. The sentence of `templates/docs/dev/change-standard.md` on the filter inside `utils/build.py` is unchanged and is now true as written.

### The four runs read again

- **First run, test lines with no filter and the filter named in a sentence:** item 2 takes each test command with the sentence's filter; item 5 writes the filtered string; item 6 shows the page with three unfiltered driver lines and the filter sentence rewritten; item 8 holds each string equal to the page's command plus its filter.
- **Second run on that result:** item 4 finds this driver and reads its lists; item 5 sorts no driver line and adds no command; item 6 shows the driver as a diff against itself; item 8 holds each command equal to its read before the write.
- **The `projects:` form:** item 3 resolves `worktree_paths` from the `plan.yaml`'s folder, as in the `docs/plan.yaml` example.
- **A new repository:** with a command on the page, items 1 to 8 run with no command run and no commit, and item 13 commits; with none, the one sentence to the user and item 10 follows.

Places these runs showed false, and corrected:
- `README.md:13`: now "a new repository whose verification page names a command gets the driver unless you answer that it should not".
- `README.md:177`: now "Unless you answered that it should not, and when `docs/dev/building.md` names a command, it then drafts the build driver `utils/build.py` from those commands".
- The entry **build driver** in `templates/plan-terms.md`, and by `sync_rules.py . --only glossary --write` in `docs/glossary.md`: now "a new repository whose verification page names a command gets unless the user answers that it should not".
- The figure's boxes are unchanged, since no stop was added, removed or renamed.
- ADR 0051 is unchanged, as the round's brief allows no other change to it. Its bullet "A new-repository run writes the driver by the same steps" still holds, since those steps include the check that the page states a command.

### The checks' lines

| # | Output as printed |
|---|---|
| 1 | `PASS: build.py scratch tests` |
| 2 | `PASS: check_config.py scratch tests`; `PASS: sync_rules.py scratch tests` |
| 3 | `usage: build.py build\|test\|check\|gate`, `exit 2`; `test -x` prints `0` |
| 4 | `ok: the plan-terms block equals the template`, `exit 0` |
| 5 | over the 16 changed files (`wc -l` printed `16`): nothing printed, `exit 0` |
| 6 | `1011`; `5:  version: "5.0.0"` |
| 7 | `docs/dev/building.md:18:`, `docs/dev/change-standard.md:82:`, `docs/dev/scripts.md:51:` |
| 8 | `exit 0`; ` M docs/figures/gen_figures.py`, ` M docs/figures/pipeline.svg` |

Line counts that moved in this round: `templates/utils/build.py` is 124 lines (`wc -l`); `git diff --numstat` against the base gives `skills/ordo/ordo-init/SKILL.md` 108 added, 19 removed, and `skills/ordo/ordo-init/references/new-repository.md` 4 added, 1 removed; `README.md` stays 4, 3, and `docs/glossary.md` and `templates/plan-terms.md` stay 1, 0.

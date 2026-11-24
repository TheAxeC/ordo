# Refuter report: step 3 of plan 25

## Verification lines

Each command was run from the worktree root, with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE` in front of each test and script.

1. `sh skills/ordo/ordo-init/templates/utils/build.test.sh 2>&1 | tail -1`
```
PASS: build.py scratch tests
```
Run without the filter, it prints 20 `ok:` lines, from `ok: gate, three passing lists: exit 0` to `ok: no __pycache__ folder after the runs`, and then `PASS: build.py scratch tests`. These are the same lines the report quotes.

2. `check_config.test.sh` and `sync_rules.test.sh`, each with `2>&1 | tail -1`
```
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
```

3. `python3 -B -W error skills/ordo/ordo-init/templates/utils/build.py; echo "exit $?"` and `test -x ...; echo $?`
```
usage: build.py build|test|check|gate
exit 2
0
```

4. `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary; echo "exit $?"`
```
ok: the plan-terms block equals the template
exit 0
```

5. The character-set check over every path `git status --short` lists, plus `templates/utils/build.py` and `build.test.sh`: it printed nothing, then `exit 0`.

6. The description length and the version
```
1011
5:  version: "5.0.0"
```

7. `grep -n 'build.test.sh' docs/dev/scripts.md docs/dev/building.md docs/dev/change-standard.md`: one line in each file, `docs/dev/scripts.md:51`, `docs/dev/building.md:18` and `docs/dev/change-standard.md:82`.

8. `python3 docs/figures/gen_figures.py; echo "exit $?"`: 23 `wrote ...` lines, then `exit 0`. Afterwards `git status --short docs/figures` printed ` M docs/figures/gen_figures.py` and ` M docs/figures/pipeline.svg`, and the whole `git status --short` output was byte-equal to the output taken before the run (`diff` printed nothing, then `same`).

The commands the builder's report quotes, rerun on a copy under `$TMPDIR`:
- `ruff check --isolated --target-version py310 --line-length 100 --select E,F,W,I,B,UP,SIM,N,PTH,ANN,BLE,S602 build.py`: six `E501` errors, on lines 6, 8, 10, 14, 15 and 17, ending `Found 6 errors.` The report says seven.
- `ruff format --isolated --line-length 100 --check build.py`: `1 file already formatted`.
- `pyright --pythonversion 3.10 build.py`: `0 errors, 0 warnings, 0 informations`.
- `grep -rnoE '"Steps / A new repository" (9|1[0-3])[^0-9]' skills docs README.md agents utils`: hits only in `skills/ordo/ordo-init/`, `templates/plan-terms.md` and `docs/glossary.md`, each naming the renumbered item.
- The open-items read of the state file in the main checkout prints the heading, two empty lines and then `## Closed items`, as the report says.

The read-back probe. On a copy of the template under `$TMPDIR`, `BUILD` was filled with the command `printf '%s' 'q'\''d"s$v\0\x20' > special.txt`, written the way "Steps / The build driver" 5 says and given a comment. The command of "Steps / The build driver" 8 printed:
```
ROOT: ..
BUILD: printf '%s' 'q'\''d"s$v\0\x20' > special.txt
```
The command part of that line compared byte-equal (`cmp`) with the page line. So the read-back prints the command exactly as the page holds it, and it left no `__pycache__` folder. On the same copy, `./utils/build.py gate` printed `build.py gate: 1 command passed` and exited 0, and the file it wrote holds `q'd"s$v\0\x20`.

## Verdicts

Items of "What to build":
1. `templates/utils/build.py`: violated (Standards 1). Everything else holds: the shebang, mode 755, the lists and `ROOT`, `bash -o pipefail -c` with no `shell=True`, `cwd=root`, `stdin=DEVNULL`, each command echoed, the failure line and the count line, `gate` skipping an empty list, a refusal for empty lists, exit 2 for usage, a signal giving a non-zero exit, no import of the repository.
2. `build.test.sh`: holds.
3. `SKILL.md`: violated (Spec 1, Spec 2, Spec 3, Behaviour 1). The rest holds: the Quick start, `./build`, the three refusals, sorting, the draft, the read-back, the `gate` run and the Rules sentence, the new-repository item 9, the one sentence in the existing and configured runs, the narrowed rule on build files, version 5.0.0.
4. `references/new-repository.md` and the templates it names: holds.
5. Glossary term **build driver**: holds. The entries **questions, the** and **new repository** still hold.
6. ADR 0051, one sentence added: holds. The diff adds one line to the Decision and changes nothing else.
7. This repository's pages: holds, with Spec 4 on the form of the line in `building.md`.
8. Figures: holds. Three boxes were added. The refusal row is not drawn, which follows the figure's rule on refusals (`gen_figures.py:2199`).
9. Other places: holds. The `ordo-help` line was added and its version raised to 5.1.0; see "Declined to judge".

Cases:
- `gate`, three passing lists: met. The whole output is compared with the expected text.
- `gate` with the filtered `exit 3`: met. Exit 3, the failure as last line, `check` not run.
- `test`, the first of two commands failing: met.
- `false && echo reached`: met.
- A trailing `# comment`: met.
- `build` on an empty list: met.
- `gate` with `build` empty: met.
- `gate` with all three lists empty: met.
- No subcommand, `frobnicate`, `gate extra`: met.
- A pipe and a quoted argument with a space: met.
- `'`, `"`, `$`, `\0`, `\x20`: met. The file is compared byte for byte.
- `cd` in one command, the next still at the root: met.
- Called from another folder: met.
- `tools/a/utils/` with `ROOT` `../../..`: met.
- A command that reads standard input: met. Input is piped into the driver, and `leaked` is not printed.
- A command ended by a signal: met. Exit 1, and the line gives 143.
- `./utils/build.py gate`: met.
- No `__pycache__` after the runs: met.
- By reading, no `plan.yaml`: met ("Steps / The build driver" 1 names `/ordo-init`).
- By reading, a page with no command: met (item 2 names the page).
- By reading, a second run: partial (Spec 2).
- By reading, another `utils/build.py`: met (item 4 and the Stops row "Another utils/build.py").
- By reading, `/ordo-init ./build`: met ("What it reads" 4).
- By reading, `\0` and quotes in a page command: met (item 8 and the probe above).
- By reading, a new repository that declines the driver: met ("Steps / A new repository" 9, last bullet).
- By reading, an existing-repository run: met ("Steps / An existing repository" 3).

## Spec

1. **The driver is shown in full, never as a diff, when it is rewritten.**
   - Place: `skills/ordo/ordo-init/SKILL.md`, "Steps / The build driver" 6.2: "Each filled `utils/build.py` in full, beside the file that stands there when it is not this driver."
   - What is wrong: brief item 3 says that when the page already names the driver, the mode "fills the template with them, and shows the difference from the file as it stands". The skill's own Rules also say "A change to an existing file ... is shown as a diff and made after approval." On a second run, item 6.2 shows the new file in full and nothing beside it, so no diff against the existing driver is shown. The verdict on item 3 names this finding.
   - Failure scenario: `/ordo-init build` is run again after the user added one command to the page. The draft shows a 100-line file in full. The user cannot see that one command was added, or that a comment changed, without comparing the two files by hand, and approves a rewrite they did not read.

2. **A second run whose page names only some of the driver's subcommands meets no instruction, and its read-back has nothing to compare with.**
   - Place: "Steps / The build driver" 5, first bullet: "A page that already names the driver's commands, `python3 <the driver's path> build`, `test` and `check`, is not sorted again".
   - What is wrong: ruling B and item 6.3 leave a subcommand with an empty list off the page. A page from a first run in a repository with no check command therefore names only `build` and `test`, and the condition as written ("build, test and check") does not hold for it. The next bullet then sorts "each other command of the page" by what it does, so `python3 utils/build.py build` lands in `BUILD`.
   - Second part: item 8 holds each command "equal ... to the page's command it was copied from". On a second run the commands come from the driver, not from the page, so there is nothing to compare them with, and the text does not say what replaces it. The verdict on the second-run case names this finding.
   - Failure scenario: a first run on a repository with build and test commands and no check command. On the second run a literal reader writes `"python3 utils/build.py build"` into `BUILD`. `gate` then calls itself without end, and the brief's case "no list names `utils/build.py`" fails.

3. **In the `projects:` form, `worktree_paths` is used as if it were a path from the repository root.**
   - Place: "Steps / The build driver" 3: "the driver is `utils/build.py` in the project's folder, the first folder its `worktree_paths` names".
   - What is wrong: `worktree_paths` is read relative to the folder that holds the `plan.yaml` (the `plan` skill's "What it reads" 1, and `templates/plan.projects.yaml` holds `worktree_paths: [../tools/tool-a]`). Item 1 of the same section says this for `verification` ("read from the folder that holds the `plan.yaml`"). Item 3 does not say it for `worktree_paths`, and its example `tools/a/utils/build.py` is a path from the root. The verdict on item 3 names this finding.
   - Failure scenario: `docs/plan.yaml` in the `projects:` form with `worktree_paths: [../tools/tool-a]`. Taken from the root, the driver path becomes `../tools/tool-a/utils/build.py`, outside the repository, with a matching wrong `ROOT`. The page then names a driver that does not exist, and `python3 ../tools/tool-a/utils/build.py test` fails on every plan's verify list.

4. **The new line in `docs/dev/building.md` carries a filter that the page's other test lines do not carry.**
   - Place: `docs/dev/building.md:18`, `sh skills/ordo/ordo-init/templates/utils/build.test.sh 2>&1 | tail -1    # build.py, ...`
   - What is wrong: every other `.test.sh` line on the page has no filter. Line 24 states the filter once: "The filter that keeps the summary line is `2>&1 | tail -1`." Brief item 7 asks both "with its comment and filter" and "in the form and place of the other lines of `ordo-init`", and the two disagree. The report takes one side and does not name the disagreement.
   - Failure scenario: `/plan` copies "each test command with the filter the page names for its summary line" (the `plan` skill's Steps 4). A reader who applies line 24 to every test line writes `... 2>&1 | tail -1 2>&1 | tail -1` for this one line. That still passes, but the page now has two forms of the same kind of line.

## Proof

1. **A count in the report does not reproduce.**
   - Place: the report, in the checks section and in "Departures from the list and sentence rules": "prints seven `E501` lines".
   - What is wrong: my run of the same command prints six (`Found 6 errors.`, on lines 6, 8, 10, 14, 15 and 17).
   - Failure scenario: the orchestrator weighs the departure against the Python page on a count that is wrong. The decision of Standards 1 rests on this count.

No other proof finding. The test's failing run before the template existed is quoted. Read in full, each case asserts its printed line or its effect, beyond the exit status.

## Standards

1. **The template fails the line length of the Python page it is written to, in every repository that runs ruff.**
   - Place: `skills/ordo/ordo-init/templates/utils/build.py`, lines 6, 8, 10, 14, 15 and 17 (the docstring), of 403, 764, 104, 101, 105 and 203 characters.
   - What is wrong: brief item 1 says the template is "written to `templates/docs/dev/coding-standards/python.md`". That page says: "ruff formats and lints every module from its section of `pyproject.toml`, with a line length of <100>", with the starting selection including `E`. The one-line-per-paragraph rule of `common.md` ("Markdown and YAML") and of the prose standard's section F covers source formatting of prose, not a Python docstring that ruff's `E501` checks.
   - The report defends the long lines by pointing at `check_config.py`. That script is not copied into another repository; `build.py` is copied into every new repository. The report records this as a "departure" and does not stop on it. The verdict on item 1 names this finding.
   - Failure scenario: a new Python repository set up with the default pages and a `ruff check .` line on its verification page. After the driver is written, `python3 utils/build.py check` runs `ruff check .`, which reports `E501` on `utils/build.py` itself, and the gate the mode just wrote fails on the driver. In an existing repository, "Steps / The build driver" 9 shows that failure on the first `gate` run.

2. **The failure line goes to standard output, where the Python page asks for standard error.**
   - Place: `build.py:65`, `print(f"build.py {name}: failed with exit {status}: {command}", flush=True)`.
   - What is wrong: the Python page says "A command-line script catches the exception classes it expects, prints the error to stderr and exits non-zero." The failure line is printed to standard output. The head comment is consistent with itself, since it does not list this line among the errors it prints on standard error. I judge this as low weight: `checks.sh` also prints its failure line on standard output, which keeps it in order with the command's output.
   - Failure scenario: a caller that runs `python3 utils/build.py test 2>err.txt` and reads `err.txt` for the error finds nothing there when a command fails.

No other standards finding. Non-ASCII: none. History in comments: none. The greps for `build.py`, `ordo-init build`, `Build files`, `build driver`, the renumbered items 9 to 13, `5.0.0` and `5.1.0` across `skills/`, `docs/`, `README.md`, `agents/` and `utils/` found no sentence left false outside `docs/roadmap.md` and `docs/adr/`. No shipped file names anything private.

## Behaviour

1. **A new repository whose verification page holds no command meets a refusal the setup has no instruction for.**
   - Place: `SKILL.md`, "Steps / A new repository" 9 ("by 'Steps / The build driver' 1 to 8"), together with "Steps / The build driver" 2 and the Stops row "The mode refused". That row's When cell is "`/ordo-init build` at 'Steps / The build driver' 1 or 2", and its What resumes it cell is "What is missing written, then `/ordo-init build` again".
   - What is wrong: a new repository whose question 3 fixed no build system can get a `docs/dev/building.md` with no command, since item 8 writes only the commands named. Item 9 then reaches the refusal of item 2. Nothing says whether the setup stops there or goes on with items 10 to 13 without the driver. The Stops row covers only the typed mode, and item 9's completion criterion ("the driver is written and reads back equal to the page, or the answer to question 11 is no") covers neither outcome. The verdict on item 3 names this finding.
   - Failure scenario: a new `python` repository whose user fixed no test harness yet, with the default answer yes to question 11. The session either stops mid-setup, so `CLAUDE.md`'s Build section is never filled, the checks of item 11 never run and nothing is committed, or it invents a way to go on. Either way the user is left with a partial setup and no message explaining why.

2. **Where the verification page states its filter in a sentence, the mode gives no instruction for the filter.**
   - Place: "Steps / The build driver" 5 ("A command is copied whole: its filter and an `&&` chain stay with it") and 6.3 and 6.4. Also the changed template `templates/docs/dev/change-standard.md:64`: "its output goes through a filter for its summary lines, inside `utils/build.py` where the repository has the build driver".
   - What is wrong: on a page like this repository's `docs/dev/building.md`, the test lines carry no filter, line 24 names it once, and the rules page's command block holds the filtered forms (`docs/dev/change-standard.md`, "Commands and their filters"). The mode copies the page's unfiltered commands into the driver, and 6.4 replaces the rules page's filtered lines with the three driver lines. Nothing says to carry the filter into each command, or whether the filter sentence of the page stays. The changed template sentence then says the filter is inside the driver when it is not.
   - Failure scenario: `/ordo-init build` run on this repository. If the session removes line 24 under 6.3 ("its sentences say that the commands themselves stand in the driver"), the verify list runs `python3 utils/build.py test` with no filter. The full output of every test then enters the context, against the change standard's "raw build output never enters the context".

Every user-visible change the report states is given with its before and after. It also mentions the change of `ordo-help`'s version.

Following the mode as a person running it, in the four runs the brief names:
- In a repository with a page like `docs/dev/building.md`: Behaviour 2.
- A second time on the result: Spec 1 and Spec 2.
- In the `projects:` form: Spec 3.
- As part of a new-repository run: Behaviour 1.

No place writes before an approval: items 4 and 6 hold every write back until the answer. The only way I found to a `gate` that exits 0 while a page command fails is a page command that ends up in no list, and the completion criterion of item 5 ("each command of the page stands in one list, or is one of the driver's own") covers that.

## Declined to judge

- Whether `ordo-help`'s `metadata.version` was already raised earlier in this plan, which would make the raise to 5.1.0 a second raise against `docs/dev/skill-layout.md`, "Frontmatter". This needs `git log -- skills/ordo/ordo-help/SKILL.md`, which the report quotes and which is outside my three git commands. The base holds `version: "5.0.0"` (from the diff).
- The report's `git diff --numstat` line counts and its `git ls-files -o --exclude-standard` file list. Those commands are outside my three. Its added and removed counts agree with the totals `git diff ed1f928 --stat` printed for each file it lists.
- The test's failing run before the template existed. It cannot be rerun on this tree, and my rules forbid removing the template to watch the test fail. It is quoted in the report.
- A real run of `/ordo-init build` or of a new-repository setup. The four runs were judged by reading the skill. The runs themselves are step 7's gate runs.

Agent usage: a5bc4b4e441d63e90, claude-opus-5-5, 191856 tokens, 31 tool uses, 8 min 0 s.

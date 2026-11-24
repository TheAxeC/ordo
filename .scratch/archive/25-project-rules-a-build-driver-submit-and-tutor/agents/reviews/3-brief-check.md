# Brief check: step 3 of plan 25 (brief `.scratch/25-project-rules-a-build-driver-submit-and-tutor/agents/briefs/3.md`)

Every command below was run from `/Users/axelfaes/workspace/ordo`. `git rev-parse --short HEAD` printed `ed4e961`. `git status --short` shows step 1's landing staged in the main checkout, not yet committed: `M  docs/dev/change-standard.md`, `M  skills/ordo/ordo-init/templates/docs/dev/change-standard.md`, `M  skills/ordo/ordo-init/templates/docs/dev/coding-standards/common.md`, `M  skills/ordo/ordo-init/templates/shared-rules.md` and `M  skills/orchestration/plan-orchestration/SKILL.md`. Step 3 writes two of those pages too. Once step 1 lands, the base the brief names ("read on main at ed4e961") is out of date for them.

## 1. Names

Commands: `grep -rn -i --exclude-dir=.git --exclude-dir=.agents --exclude-dir=.scratch '<name>' .` for `build\.py`, `build\.test\.sh`, `ordo-init build`, `Build files are written only` and `build file`. Then `grep -rn 'ordo-init' skills utils docs README.md --exclude-dir=adr`, leaving out `docs/roadmap.md` and the skill's own folder, and `grep -rn '4\.0\.0' skills/ordo docs README.md utils`.

Hits outside "Paths this step writes":

- `docs/roadmap.md:34,35` (the goal and the gate name `utils/build.py` and `/ordo-init build`). Not made false. The brief leaves the file as it is.
- `docs/adr/0051-...md:7,11,13,17,22`. Not made false.
- `docs/roadmap.md:71,81` ("ordo-init 4.0.0", in entries that are done). This is a record of a closed entry and stays.
- `.scratch/archive/...` hits for "Build files are written only", "build file" and `build.py`. These are ledger history. One of them matters for check 6: an archived brief check quotes another repository's verification page naming `./utils/build.py site`. A real repository of this user already has a `utils/build.py` with a subcommand of its own.
- `skills/ordo/ordo-init/references/new-repository.md`: line 8 (question 2, "for the `.gitignore` and the build files"), lines 26-47 ("The tree") and line 28 (the `README.md` row, "how to build (a pointer to docs/dev/building.md)"). The change makes this file false or incomplete in three ways:
  - "The tree" has no `utils/build.py` row.
  - The `docs/dev/building.md` row says the page is written "each command as named and not run", but after the change it names the driver's commands.
  - "The questions" holds no question on the driver, yet item 3 says the question "is asked with the run's other questions".
  - The file is not in "Paths this step writes". It is the place the new-repository run's questions and tree live, so it has to be added.
- `docs/glossary.md:94` ("questions, the") and its source `skills/ordo/ordo-init/templates/plan-terms.md`. If the driver question is added to "The questions", this stays true. If it is asked somewhere else, the entry's "Stated in" is incomplete.
- `docs/glossary.md:68` ("new repository ... sets up whole from The questions and The tree") stays true only if `references/new-repository.md` is changed.
- "build driver" is a new term the goal and ADR 0051 use, and `plan-terms.md` has no entry for it. `docs/dev/skill-layout.md` "Writing for an agent" says a new term is added to `skills/ordo/ordo-init/templates/plan-terms.md` first. Neither `plan-terms.md` nor `docs/glossary.md` is in the Paths.
- `docs/figures/gen_figures.py:2198-2213` and `docs/figures/pipeline.svg`. The `/ordo-init` lane draws one box per Stops row ("The questions" ... "No commit allowed"). The new Stops rows the mode adds make the figure incomplete. The brief routes this to "Doc text" because step 4 changes the figure script.
  - `docs/dev/building.md` says: "A change to a skill's Stops table ... changes the labels in the script that draws it, which is then run again."
  - Step 4's line in `plan.md` names only `submit`'s figure and `lifecycle.svg`, not `ordo-init`'s lane. No brief for step 4 exists yet (`ls .../agents/briefs` holds 2.md and 3.md).
  - The hand-off is legitimate only if the orchestrator carries the label change into step 4's brief.
- `README.md:175` ("It asks for the name, the kind, the license, the commit rule, the standards pages, whether the repository has a user interface, and the project skills ... drafts the plan configuration"). Made false by the driver question and by the driver being written. `README.md` is in the Paths, but item 5 names only the row (line 13) and the command-block line (line 40). Item 6's grep finds it, so this is covered only if the builder reads item 6 as covering README prose.
- `skills/code/wizard/SKILL.md:22,29`, `skills/code/codebase-design/SKILL.md`, `skills/orchestration/{grill,plan,roadmap,plan-orchestration,spec}/SKILL.md`, `skills/academic/*`: not made false.
- `skills/ordo/ordo-init/templates/gitignore/common.gitignore:14` ("# Python helpers under utils/" with `__pycache__/`): not made false.
- `utils/`: no hit. `docs/dev/`: hits only in `building.md`, `change-standard.md` and `scripts.md`, all in the Paths, plus `skill-layout.md:3,66`, which is not made false.

## 2. The step line

The step line for step 3 in `plan.md`, part by part:

- "`ordo-init` has the mode `/ordo-init build`": item 3.
- "the template `utils/build.py` on the Python standard library": item 1.
- "with its test": item 2.
- "the new-repository run that writes the driver by the same steps unless the user answers that it should not": the "Steps / A new repository" bullet of item 3.
- "the rule on build files narrowed": the brief says instead that the rule "stays", and names the drivers as "what the user names by typing the mode or by not declining". This does not narrow the rule. ADR 0051 says "its text names the new-repository run as the one exception". This part has no requirement that delivers it as the line and the ADR state it.
- "as ruling D9 and ADR 0051 give them": premises.
- "the script and its test listed on `docs/dev/scripts.md`, `docs/dev/building.md` and the command block of `docs/dev/change-standard.md`": item 5.
- The line's check ("the template's test passes, run from the repository root, and it runs the driver's `gate` on a scratch tree whose commands pass (exit 0) and on one where one command fails (non-zero exit)"): cases 1 and 2 and verify 1.

Part with no requirement: "narrowed" (above).

## 3. Premises

- `grep -n '^## \|^### ' skills/ordo/ordo-init/SKILL.md` prints 12 Quick start, 19 Use instead, 26 What it reads, 81 Steps, 93 A new repository, 199 An existing repository, 322 A configured repository, 423 Stops, 441 Anti-patterns, 454 Rules. `sed -n 12,18p` shows the two invocations and no word mode. Holds.
- `grep -n -i 'build file' skills/ordo/ordo-init/SKILL.md` prints 148, 160, 202, 220, `445:| A build file for something the user did not name |...` and `475:- Build files are written only for what the user names.`. Holds.
- `sed -n 159,171p` shows item 8 (writes `docs/plan.yaml` and `docs/dev/building.md`, "No command meant for the verification page is run") and item 9 ("Fill the Build section of `CLAUDE.md` and the command block of `docs/dev/change-standard.md` from `docs/dev/building.md`"). Holds.
- `ls skills/ordo/ordo-init/templates` prints `check_config.py check_config.test.sh CLAUDE.md docs gitignore LICENSE-MIT plan-terms.md shared-rules.md sync_rules.py sync_rules.test.sh`. Holds.
  - Item 4's "`skills/ordo/ordo-init/templates/docs/dev/building.md` when there is one": `ls skills/ordo/ordo-init/templates/docs/dev/` shows no such file.
  - A new repository's `building.md` and its README are described in `references/new-repository.md` "The tree", which item 4's grep (`grep -rn 'building.md\|utils/' skills/ordo/ordo-init/templates`) does not search. That grep prints only `templates/CLAUDE.md:15,27`, `templates/docs/dev/change-standard.md:67`, `templates/gitignore/common.gitignore:14` and `check_config.test.sh` lines.
- `grep -n 'verification' skills/orchestration/plan/templates/plan.yaml` prints `6:verification: dev/building.md ... /plan copies its commands into the ledger.` Holds in part.
  - `/plan` copies the commands (plan SKILL.md Steps 4: "The verify list is the verification page's commands, each test command with the filter the page names for its summary line").
  - `/spec` and `/land` compare the list with the page and rewrite it (ADR 0010). The brief says `/spec` and `/land` copy.
  - `checks.sh` runs each item "through bash -o pipefail -c '<command>', from the directory checks.sh was started in" (its head comment). Holds.
- The last paragraph of `docs/dev/building.md`: "a new script is listed on `docs/dev/scripts.md`, and adds its test here and to the command block of `docs/dev/change-standard.md` only when it has one." Holds.
  - The brief's "(one table of scripts, one of tests)" is wrong. `docs/dev/scripts.md` has two script tables, "Development scripts" and "User scripts", and one "Test scripts" table. The template belongs in "User scripts", as `skills/code/wizard/templates/template.sh` does.
- The description-length command prints `1013`. Holds, with 11 characters to spare. Adding the mode and its trigger phrases forces a rewording of the description's existing text.
- "Step 3, Step 0" of `plan.md`: "Step 3 raises `metadata.version` ... once for the plan, by its minor part". Holds as quoted; see check 8 on whether minor is right.
- The ADR 0051 premise: the decision and its six bullets are quoted correctly. The title is cut short (the full title ends "..., and by its new-repository run unless the user says no").
- "ADR 0005 holds: a rule is written once, on the page that holds its kind." False. `cat docs/adr/0005-*.md` shows "The choices of every plan go to one file at the ledger root". The rule the brief means is in `docs/dev/skill-layout.md` "Where a rule goes" ("A rule is written once. Another place that needs it names the section it is in.").
- Ruling D9 is quoted correctly (`plan.md` Rulings).
- The brief's reading list says "the coding standards under `docs/dev/coding-standards/` for Python and shell". `ls docs/dev/coding-standards/` fails with "No such file or directory". The only coding-standards pages are the templates under `skills/ordo/ordo-init/templates/docs/dev/coding-standards/` (`common.md cpp.md python.md typescript.md`), and there is no shell page anywhere.

## 4. Cases and checks

Read against `docs/dev/change-standard.md` ("Scripts compute facts; judgment is read", rules 1, 11, 13, 15, 16), `docs/dev/skill-layout.md`, the prose standard, the glossary and the template coding-standards pages.

- **Inconsistent with the rules file, rule 13.** The brief's instruction for the first run ("the test does not exist there, so each test case is 'no driver, no test'") replaces the run rule 13 requires. Rule 13: "A new or changed test of a behaviour the change adds or changes is run once on the unchanged tree, before the code is changed, and fails there. That run is its proof, and the report quotes the failure." The builder should write `build.test.sh` first, run it with no `templates/utils/build.py`, and quote its `FAIL:` line.
- **Inconsistent with the template `python.md`.** Item 1 runs each command "through the shell". The default page a new repository gets says "A subprocess runs with a list of arguments. ruff's `S602` fails `shell=True`." It also says "The code runs on Python <3.10> or newer" and "Annotations use ... `X | None`", while the brief says 3.9.
  - Result: a new Python repository whose `check` list runs ruff with that page's selection fails its own `gate` on its own driver.
  - The command can run as `["bash", "-o", "pipefail", "-c", command]`, the form `checks.sh` uses. That is a list of arguments, avoids `S602`, and fixes the pipefail defect below.
- **Inconsistent with ADR 0051** (cases "gate with `build` empty ... exit 0" and decision 3; see check 7).
- **Rule 15 (a supplied value reaching generated text) has no case.** The mode writes each command of the verification page into Python source as a list item. Ordo's own page holds the ASCII check, with `'`, `"`, `$`, `\x20-\x7E`, `\x{2705}` and `\0`.
  - Written into a non-raw Python string literal, `\0` becomes a NUL character and `\x20` a space, and the check changes meaning silently.
  - The command has happened (Ordo's page, and any page copied from it), and a wrong answer costs a check that passes on everything.
  - Missing case: each command written into the driver reads back equal to the page's text. Rule 16 ("A write verifies its own result ... re-parses what it wrote") asks for that read-back. The brief's only check after the write is `py_compile`, which does not compare the lists with the page.
- **Cases whose failure costs nothing:** none clearly. "`gate extra`" costs little, since an ignored extra argument runs the whole gate, but the usage case as a whole guards a `gate` typo that would otherwise exit 0.
- **Cases that ask the builder to check or explain a place the step does not change:** none. The three reading cases read `skills/ordo/ordo-init/SKILL.md`, which the step changes. The second reading case ("a new-repository run where the user answers that no driver should be written") also depends on `references/new-repository.md`, which the step must change but does not list (check 1).

## 5. The question

The goal step 3 delivers is: `/ordo-init build` writes `utils/build.py` in the repository it runs in, a new-repository run writes one unless the user declines, there is one entry point with `build`, `test`, `check` and `gate`, one command per invocation, "the checks imported and called", and every failure is a non-zero exit.

- **The step line's check:** yes, it could pass without the goal.
  - It exercises only the template on a scratch tree. The mode's text (sorting the commands, rewriting the page, the new-repository question) is not exercised.
  - Its failing command can be a bare `exit 3`, which passes while a failing command written as the verification pages write them (`... 2>&1 | tail -1`) exits 0 through `/bin/sh`. Probe: `python3 -c 'import subprocess; print(subprocess.call("sh -c \"exit 3\" 2>&1 | tail -1", shell=True))'` printed `0`, and the same command under `["bash","-o","pipefail","-c",...]` printed `3`.
  - "The checks imported and called" has no requirement in the brief. The brief runs shell commands and imports nothing. ADR 0051's decision, unlike its Context, does not repeat the phrase.
  - The plan's own answer for step 3 ("no, the test runs the driver's gate on a passing tree and on a failing one") does not hold for these reasons.
- Case 1 (gate, all pass): yes. It holds with a driver that ignores failures.
- Case 2 (a failing `test` command with exit 3): yes, because pipefail is not tested.
- Case 3 (the first of two `test` commands fails): yes, same reason.
- Case 4 (`build` on an empty list): yes. It does not reach the mode.
- Case 5 (`build` empty, `test` and `check` pass): yes.
- Case 6 (all three lists empty): yes.
- Case 7 (usage, exit 2): yes.
- Case 8 (a pipe and a quoted argument): yes. It checks that the command runs as written, not that a failing pipeline fails. To close the gap, give this case a failing left side.
- Case 9 (a `cd`, then the next command from the root): yes.
- Case 10 (the driver called from another directory): yes. Its "repository root" is defined as the folder above the script's folder, which is wrong in the `projects:` form (check 6).
- Case 11 (a command ended by a signal): yes.
- The three reading cases: yes each. They are read, not run, and the plan puts the real runs in step 6.
- Verify 1 (`PASS: build.py scratch tests`): yes, as for the step line.
- Verify 2 (the other two tests): yes, unrelated to the goal.
- Verify 3 (`py_compile` and the usage exit 2): yes.
- Verify 4 (the ASCII check): yes.
- Verify 5 (description length and 4.1.0): yes.
- Verify 6 (`grep` for `build.test.sh` in three pages): yes, a name in a file.
- Verify 7 (reading list items against the standards): yes.
- Each item of "What to build" with its check:
  - Item 1 (verify 1 and 3): yes. The pipefail gap, the missing shebang and mode for `./utils/build.py gate` (the plan's gate and step 6 run it that way), and the projects-form root.
  - Item 2 (verify 1): yes.
  - Item 3 (verify 5 and the reading cases): yes.
  - Item 4 (no check of its own): yes.
  - Item 5 (verify 6): yes.
  - Item 6 (no check of its own): yes.

## 6. Implied inputs

Each item gives the input, whether it has happened or would cost something, and the expected result.

1. **A failing command with a filter (`... 2>&1 | tail -1`, or the grep the template change standard names: "piped through the grep that keeps its summary lines").** Happened: every test line of Ordo's `docs/dev/building.md`. Cost: a gate that exits 0 on a failing test. Expected: a non-zero exit, so each command runs under `bash -o pipefail -c`.
2. **Commands joined with `&&`.** Happened: `building.md` names the form. Expected: one list item, run whole; a failing left side gives a non-zero exit.
3. **A command with a trailing `# comment`.** Happened: every line of Ordo's page and of `templates/CLAUDE.md:27` ("each with a comment"). Expected: the shell treats it as a comment. The brief does not say where the page's per-command comments go once the page names only the three driver lines. They would be lost unless the mode keeps each one beside its command in the driver.
4. **A verification page with no command block, or one whose block holds no command.** Cost: a driver with three empty lists. Expected: a refusal that names the page, matching "An existing page qualifies only when it states commands" in "Steps / An existing repository" 3.
5. **A page in the `projects:` form.**
   - Item 1 defines the root as "the folder above the script's own folder". For `tools/a/utils/build.py` that is `tools/a`, while item 3 says the page's commands "run from the repository root". The two contradict each other.
   - Expected: the driver runs from the repository root in both forms, by a root the mode writes or by `git rev-parse --show-toplevel`, with a case for it.
   - The brief's signature `/ordo-init build [<path>]` drops `<folder>`, which "What it reads" 4 needs in order to find `tools/plan.yaml` or name a project.
6. **A `utils/build.py` that already exists and is not this driver.** Happened: a user repository's page names `./utils/build.py site`. Expected: a diff and approval, as the brief says, plus the rewritten page keeping every command the old driver served.
7. **A verification page that already names the driver** (the mode run a second time, or on a repository written with the driver). Cost: the mode reads `python3 utils/build.py build` as a build command and the driver calls itself without end. Expected: the mode recognises the driver's three lines and reads the lists from the existing driver, or refuses.
8. **The word `build` as the first argument.** Today it is `<path>`, so `/ordo-init build` sets up the folder `build` (a common CMake build folder). Expected: the text says that the word is the mode and that a path named `build` is given as `./build`. This changes a run that worked before (see check 8 on the version).
9. **`/spec` and `/land` after the page names the driver.**
   - `/plan` copies the three driver lines, "each test command with the filter the page names", and `/spec` and `/land` keep the list equal (ADR 0010).
   - `checks.sh` runs each through `bash -o pipefail -c` from the root, so `python3 utils/build.py test` works there.
   - The brief does not say whether the rewritten page keeps a filter for the driver lines. Without one, the whole raw output enters the booking, against `building.md` ("A command with long output uses its tool's quiet mode or a filter under `pipefail`").
   - With `2>&1 | tail -1`, the driver's failure line must be its last line. It is, as item 1 describes it. A passing run's last line is then the last command's output; the driver prints no success line of its own.
   - Expected: the page names the filter, and the driver ends a failing run with its failure line.
10. **The new-repository commit.**
    - "Steps / A new repository" 12 names "Every file written ... except those committed at 'Steps / A new repository' 8". `docs/dev/building.md` is committed at 8 and then rewritten by the driver step.
    - Item 9 fills `CLAUDE.md` from `building.md`, so the driver step must come between 8 and 9.
    - Expected: the driver step sits after 8 and before 9, and item 12's commit names `utils/build.py` and `docs/dev/building.md` again.
11. **The mode's command runs and writes against the skill's Rules.**
    - "The skill writes nothing until the user approves ... with two exceptions" lists only `git init` and the verification commands' one run. The mode's `py_compile` and `gate` run after the write, which is approved, so this Rule is not broken, but it should name them.
    - `python3 -m py_compile utils/build.py` writes `utils/__pycache__/*.pyc`. That path is ignored only in a repository with `templates/gitignore/common.gitignore`. Expected: a parse that writes nothing, such as `python3 -c 'import ast,sys; ast.parse(open(sys.argv[1]).read())'`, or `PYTHONDONTWRITEBYTECODE=1`.
    - "The skill never overwrites an existing page" and "A change to an existing file ... is shown as a diff": the rewrite of the verification page, `CLAUDE.md` and the change standard is a change to existing files. Expected: shown as diffs. The brief says "the verification page rewritten".
12. **A command that reads standard input.** `checks.sh` gives `/dev/null`, and the brief does not say what the driver gives. Cost: a `gate` that hangs inside the mode's one run. Expected: stdin from `/dev/null`, as `checks.sh` does.
13. **A shebang and an executable mode.** The plan's gate and step 6 run `./utils/build.py gate`. The brief requires neither, so that call fails with "permission denied". Expected: `#!/usr/bin/env python3`, the file written with mode 755, and a case that runs `./utils/build.py gate` (the test copies the template, so it must keep the mode).

## 7. ADRs

Every record's Decision was read (`awk '/^## Decision/...'` over `docs/adr/0*.md`).

- **ADR 0051 touched, item by item:**
  - "The mode writes `utils/build.py` from a template on the Python standard library, filled with the commands of the verification page, and rewrites that page to name the driver's `build`, `test` and `check`, one per line. `gate` runs the three."
    - The brief's "a list that is empty left out" contradicts "name the driver's `build`, `test` and `check`".
    - Decision 3 and case 5 ("`gate` skips an empty list") contradict "`gate` runs the three" read with the next bullet, under which an empty `build` says so and exits non-zero.
    - The projects-form driver at `<project>/utils/build.py` goes beyond "`utils/build.py`".
    - Each is a rule clash for a ruling: the ADR README says "A step whose text or brief contradicts an ADR is a rule clash: it stops and is ruled on." My judgment is that skipping an empty list is the better behaviour, since Ordo's own page says "Ordo has no build step", but it needs the ADR changed or a ruling.
  - "A subcommand with no command named says so and exits non-zero." Holds (case 4, case 6).
  - "A new-repository run writes the driver by the same steps, unless the user answers that it should not." Holds (item 3).
  - "An existing or a configured repository gets the driver only through the mode." Holds.
  - "The rule on build files stands, since typing the mode names the driver, and its text names the new-repository run as the one exception." Contradicted. The brief has the text name the new-repository driver as something "the user names ... by not declining", not as the one exception.
  - "The template has a test, since a gate that exits 0 on a failure costs a broken change on main." Holds as an item. The cases do not test the failure that happens (check 6, item 1).
- **ADR 0010, touched and not named by the brief:** "`/spec` at its preflight, and `/land` before it runs the verify list, compare the plan's verify list with the verification page's commands ...". ADR 0051's Consequences cite it ("so each plan's verify list follows (ADR 0010)"). The brief's premise wrongly says `/spec` and `/land` copy the commands.
- **ADR 0005, named by the brief:** not touched. Its decision is the choices file, not "a rule is written once".
- Other ADRs:
  - 0001, 0014 and 0047 read the `ordo-init` templates' prose standard or standards pages. Not touched.
  - 0012 ("Every commit a skill makes on main names its paths") binds the new-repository commit the step changes. The brief keeps the existing form, so there is no contradiction.
  - No other record is touched.

## 8. Dictated text

- `PASS: build.py scratch tests` and the `FAIL:` form: holds (`grep -n 'PASS:\|FAIL:' skills/ordo/ordo-init/templates/*.test.sh` prints `PASS: check_config.py scratch tests` and `PASS: sync_rules.py scratch tests`).
- `python3 utils/build.py build`, `python3 utils/build.py test`, `python3 utils/build.py check`, one per line: holds against the prose and layout pages. It does not match the plan's gate, which runs `./utils/build.py gate` (check 6, item 13).
- `sh skills/ordo/ordo-init/templates/utils/build.test.sh`: holds. Its comment is not dictated.
- `/ordo-init build [<path>]`: holds against the Quick start form of `skill-layout.md`. It drops `[<folder>]` (check 6, item 5).
- "Build files are written only for what the user names." kept: holds against the prose standard. It breaks ADR 0051's bullet that "its text names the new-repository run as the one exception" (check 7).
- `metadata.version` 4.1.0 breaks `docs/dev/skill-layout.md` "Frontmatter", in my judgment: "The major part when, under the same inputs and the default keys, a run that worked before is refused, or its output is changed or removed."
  - `/ordo-init build` today sets up the folder `build`, and after the change it runs the mode.
  - A new-repository run with the default answer now writes `utils/build.py` and rewrites `docs/dev/building.md` and the `CLAUDE.md` Build section to name the driver.
  - Both change the output of a run that worked before. Under that rule the raise is major, 5.0.0. The plan's "Step 3, Step 0" fixes the minor raise, so this is a clash for a ruling.
- "for Python 3.9 or later" breaks `skills/ordo/ordo-init/templates/docs/dev/coding-standards/python.md` "Language and tooling" (default `<3.10>`) and "Typing" (`X | None` annotations, which need 3.10 at runtime, or `from __future__ import annotations` on 3.9).
- "each through the shell" breaks the same page's "Files and processes": "A subprocess runs with a list of arguments. ruff's `S602` fails `shell=True`."
- The brief dictates no other text word for word.

## Declined to judge

- What "the checks imported and called" in the plan's goal is meant to require. It could mean in-process calls to Python check functions, or only that the driver is the one entry point. That is the user's reading of his own goal. The brief delivers neither reading explicitly, and ADR 0051's decision omits the phrase.
- Whether "build driver" needs a glossary entry or is plain English. The skill-layout rule applies only if it is a term in a sense of its own.

Agent usage: ab554d078f519c4bd, claude-opus-5-5, 193217 tokens, 32 tool uses, 6 min 59 s.

## Closed

- Names: `references/new-repository.md` (the question, the tree rows), `plan-terms.md` and `docs/glossary.md` (the term **build driver**), the README paragraph on a new repository, and `gen_figures.py` with `pipeline.svg` for the lane of `/ordo-init` are in "What to build" and in the paths.
- The step line, "narrowed": item 3 words the rule as ADR 0051 does, the new-repository run as the one exception.
- Premises: the base is main's head; the three tables of `scripts.md`, ADR 0010 for how the verify list follows the page, the layout's "Where a rule goes" in place of ADR 0005, the template coding-standards pages in place of a path that does not exist, and the full title of ADR 0051 are corrected.
- Cases, rule 13: the test is written first and run once on the tree without the template, and the report quotes its failing line.
- Cases, the Python page: each command runs as the list of arguments `bash -o pipefail -c <command>`, never with `shell=True`, on Python 3.10 or later.
- Cases, rules 15 and 16: the read-back after the write holds each command equal to the page's text, with a test case for quotes and backslash sequences and a reading case.
- The question: the failing command of the gate case carries a filter, so the case fails without `pipefail`; cases are added for `&&`, a trailing comment, standard input, the `projects:` form, the call by path and no bytecode folder.
- Implied inputs 1 to 13: each has a requirement in items 1 and 3 and a case: the filter and `&&`, the comment kept beside its command, a page with no command (refusal), the root value for the `projects:` form and `[<folder>]` in the call, a `utils/build.py` of another kind (stop), a page that already names the driver, the word `build` against a folder named `build`, the page's lines and the driver's last line, the place of the driver step between items 8 and 9 with the commit of item 12, the diffs of existing files and the parse that writes no bytecode, standard input from `/dev/null`, the shebang and mode 755.
- ADRs: ruled by the user, ruling B: `gate` skips an empty list, the page names only the subcommands that have a command, and ADR 0051 gets one sentence (item 6). The driver of a project in the `projects:` form stands in that project's `utils/`, with the root value filled.
- Dictated text: the version goes to 5.0.0 by its major part, as "Step 3, Step 0" now says.
- Declined to judge, "the checks imported and called": ruled by the user, ruling B, question 1: shell commands, nothing imported.

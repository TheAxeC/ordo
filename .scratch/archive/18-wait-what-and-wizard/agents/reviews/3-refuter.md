# Step 3, refuted

Worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/18-wait-what-and-wizard-3`, base `3167b2e`. Nothing was written in the worktree; `git status --short` after my runs prints the same eight lines as before them (six ` M` lines, `?? .scratch/18-wait-what-and-wizard/agents/reviews/3-report.md`, `?? skills/code/wizard/templates/template.test.sh`).

## Verification (the lines each check printed, verbatim)

Checks of the brief's "Verify before you report":

1. Character-set check over the seven changed files, with `; echo "exit $?"` appended: no line of its own, then
   ```
   exit 0
   ```
2. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/code/wizard/templates/template.test.sh 2>&1 | tail -1`:
   ```
   PASS: template.sh scratch tests, 7 cases
   ```
   The same command without the filter, with `; echo "exit $?"`:
   ```
   ok: case_yes
   ok: case_no
   ok: case_end_of_input
   ok: case_failing_command
   ok: case_one_word
   ok: case_have
   ok: case_wizard_os
   PASS: template.sh scratch tests, 7 cases
   exit 0
   ```
   `command -v bash` on this host prints `/bin/bash`, `GNU bash, version 3.2.57(1)-release`, so the scratch scripts ran under bash 3.2.
3. `bash -n skills/code/wizard/templates/template.sh; echo "exit $?"`:
   ```
   exit 0
   ```
4. Description length command:
   ```
   987
   ```

Commands the builder's report quotes, rerun:

- The function loop (names from `git show 3167b2e:skills/code/wizard/templates/template.sh | sed -n 's/^\([a-z_]*\)().*/\1/p'`, each body compared by `sed -n "/^$f()/,/^}/p"`): `same:` for each of `_clear`, `banner`, `stage`, `say`, `step`, `note`, `warn`, `open_url`, `pause`, `confirm`, `_existing`, `ask`, `ask_secret`, `write_env`, `set_secret`, `set_var`, `finish`, `run_wizard`. 18 names, as the report says. I ran it against `3167b2e`; the report ran it against `4d63a7f` (see "Declined to judge").
- The `cmp` of `run_wizard() {` to the end, against `3167b2e`: `cmp exit 0`.
- `grep -rn 'only a person can take\|only the actions\|runs no command\|agent can perform' skills/code/wizard README.md docs/dev/scripts.md`: two hits, `docs/dev/scripts.md:18` and `README.md:29`, as the report says.
- `grep -rn 'run_cmd\|WIZARD_OS' skills utils docs README.md | grep -v '^skills/code/wizard/'`: `docs/dev/scripts.md:51` and `docs/dev/building.md:19`, as the report says.
- `grep -n '^## ' skills/code/wizard/SKILL.md`: eight headings at lines 12, 18, 25, 34, 79, 85, 92, 101. `grep -c -F` of each sentence of 3.10: `1` and `1`.
- `git diff 3167b2e --stat`: `README.md | 2 +-`, `docs/dev/building.md | 1 +`, `docs/dev/change-standard.md | 1 +`, `docs/dev/scripts.md | 3 +-`, `skills/code/wizard/SKILL.md | 38 ...`, `skills/code/wizard/templates/template.sh | 51 ...`. Matches the report.
- `wc -l`: 112, 280, 210, 257, 51, 42, 96. Matches the report. `ls -l`: `template.test.sh` is mode 644, as every other `skills/*/*/templates/*.test.sh`.
- Description length on the base (`git show 3167b2e:skills/code/wizard/SKILL.md` piped to the same Python): `803`. Matches.
- `shellcheck skills/code/wizard/templates/template.sh`: exit 1, SC1087 at line 132, SC2329 at lines 103 (`confirm`), 187 (`set_var`), 213 (`have`), 221 (`run_cmd`), no SC2034. The base (`git show 3167b2e:... | shellcheck -`): SC1087 at line 128, SC2329 at lines 99 and 183. The report's sentence about the base reproduces. The two new SC2329 notes are for `have` and `run_cmd`, which the template's example stage does not call.

Two numbers of the report my run does not reproduce; no decision rests on either, so neither is a finding:

- "The additions stand between `set_var` and `finish` (lines 195 to 232 of the template)", repeated in the row of the head-comment case. `cat -n` shows the additions at lines 199 to 236.
- "`docs/dev/building.md`, `docs/dev/change-standard.md` | 13 test commands" as the before state. The base block of `docs/dev/building.md` holds 12 lines of the form `sh ...test.sh`, plus the glossary check and the ASCII check, 14 commands as the brief counts them.

My own runs of the helpers on edge inputs, in a `mktemp -d` folder outside the worktree, removed afterwards (library = the template's lines above `run_wizard() {`, stages written by me, `bash`):

- `run_cmd printf '%s|' "it's" 'a "b"' '' '$HOME' $'x\ny' '*' 'a '` with `y`: the line shown is `  printf %s\| it\'s a\ \"b\" '' \$HOME $'x\ny' \* a\ ` on one line, above the question; the command printed `it's|a "b"||$HOME|x<newline>y|*|a |`; exit 0. Each word reached the command whole, the empty word included, and the trailing space of the last word survived the strip of the separator.
- `run_cmd cat` then `run_cmd echo second`, input `y`, `line for cat`, `y`: `cat` printed `line for cat` and `y`, then the second question met the end of input, printed `! skipped command: echo second`, and `finish` listed `- command echo second`; exit 0. The command reads the script's standard input, as 1.4 asks.
- `run_cmd ""` with `y`: shown as `''`, then `: command not found`, `! command failed with status 127: ''`, exit 127.
- `run_cmd` with no word and `y`: shown as `''`, then `ok ran ''`, and the script went on (Standards 3).
- A scratch `uname` that exits 3, first on `PATH`: `os=unknown`, exit 0. A `PATH` of one empty folder: `os=unknown`, exit 0, nothing on standard error.
- Answers `Yes`, `yikes`, ` y`: the command ran; an empty line: skipped. This is `confirm`, which the step leaves unchanged.
- `have stage` and `have if` succeed (`command -v` finds functions and keywords, as 1.3 words it); `have ""` fails.

## Verdicts

### Items

- 1.1 holds. All 18 function bodies equal the base's; line 47 reads `SKIPPED=()        # things left to do by hand: gh wasn't ready, or the person declined a command`; the additions stand at lines 199 to 236, after `set_var` (ends line 197) and before `finish` (line 239), each under a comment in the form of the neighbouring ones.
- 1.2 holds. `_UNAME=$(uname -s 2>/dev/null) || _UNAME=""` stands in an `||` list, so neither `set -e` nor a missing `uname` ends the script; the `case` gives `macos`, `linux`, `windows` for `MINGW*|MSYS*|CYGWIN*`, `unknown` otherwise. The test and my two runs agree.
- 1.3 holds. `have() { command -v "$1" >/dev/null 2>&1; }`.
- 1.4 holds on every input the brief names. Line 224 prints the quoted words before line 225 calls `confirm`; a non-yes, the end of input included, adds `command <words>` to `SKIPPED`, warns and returns 0; line 230 runs `"$@"` with no `eval` and no second shell, on the script's own standard input; a non-zero status warns and `exit "$rc"`; a zero status prints `ok ran <words>`. Finding Standards 3 is an input the brief does not name.
- 1.5 holds. Lines 13 and 14 (the two inputs), 19 and 20 (the two warnings with their conditions), 21 ("and each command the person declined"), 22 ("A command run through run_cmd that fails ends the script with that command's status").
- 1.6 holds. `cmp exit 0`.
- 2 holds. POSIX `sh` (no `local`, no arrays), head comment with what it exercises and why each case is kept, scratch folder under `${TMPDIR:-/tmp}` removed by the `trap`, last line `PASS:` with exit 0 or `FAIL:` with exit 1, library cut by `sed '/^run_wizard() {/,$d'`, no stage calls `banner`, `ENV_FILE` set into the scratch folder, no network, no installer.
- 3.1 holds. Description 987 characters, "runs the commands a stage needs, each shown and confirmed first", "installing a tool or a project's dependencies", trigger "walk me through installing the dependencies"; the opening paragraph has three sentences; Quick start carries the clause; `version: "1.0.0"`.
- 3.2 holds. Lines 27 and 30.
- 3.3 holds. Lines 36 and 41 to 44.
- 3.4 holds. Line 50.
- 3.5 holds. Lines 55 and 62 to 65. Standards 2 is a rule of the layout on line 64, not a miss of the item.
- 3.6 holds. Lines 73 and 75.
- 3.7 holds. Line 82.
- 3.8 holds. Line 89.
- 3.9 holds. Line 96 and the description's sentence, which equals 3.10's second sentence; "What it reads" 1 and the Anti-patterns row name Rules; no Anti-patterns row was added.
- 3.10 holds. Lines 104 and 105 word for word, each once; line 103 names "runs commands on the person's machine".
- 4.1 holds. `README.md` line 29.
- 4.2 holds. `docs/dev/scripts.md` lines 18 and 51.
- 4.3 holds. `docs/dev/building.md` line 19 and `docs/dev/change-standard.md` line 83, each after the line of `utils/pin.test.sh`.

### Cases

- test, a yes: met. `case_yes` asserts exit 0, the file, and the whole line `  touch <quoted path>` above the first `[y/N]` line. It fails if the command does not run, or if the line is printed after the question (the prompt has no newline, so the `-x` match would fail).
- test, a no: met. File absent, line above the question, the command under "still to do by hand:" read from the summary's lines only.
- test, the end of input: met.
- test, a failing command: met. Exit 7, `second` absent, the warning with the status.
- test, one word stays one word: met. The file with the whole name exists, `<scratch>/c` does not, the line is one quoted word, and the literal `a\ b\;\ touch\ ` is checked apart from the helper `quoted`.
- test, `have`: met. Both branches and the empty output file.
- test, `WIZARD_OS`: met. Six scratch `uname` commands first on `PATH`, then `PATH` set to one empty scratch folder with `bash` started by its absolute path, so no `uname` can be found; the Linux and FreeBSD rows pass on a Darwin host, which shows the scratch command is the one found.
- run, `bash -n`: met.
- run, the functions unchanged: met against `3167b2e`.
- run, `run_wizard() {` to the end: met against `3167b2e`.
- read, the head comment against the additions: met.
- read, `SKILL.md` against 3.1 to 3.10: met.
- read, no sentence says only actions or no command: met for the three files the case names. Standards 1 is about the template's own head comment, which the case does not name.
- read, a shipped file names nothing private: met. The diff's shipped lines hold no path outside the repository and no name of a person, project or document; `[[ -d <folder> ]]` is a placeholder, the `uname` names in the test are the public ones, and the Stripe example is unchanged and said to be made up.

None of the seven test cases would pass with its behaviour taken out of the code, by reading. The test installs nothing, contacts no network and writes only under its scratch folder.

## Spec

none

## Proof

none

## Standards

1. `skills/code/wizard/templates/template.sh:3`, `# A wizard walks a human through a manual procedure, step by step.`, and line 252, `# STAGES: author this section. One stage() per step the human takes.` Page `docs/dev/change-standard.md`, rule 14: "A sentence about the changed file as a whole (its introduction, its head comment, a count, an 'every' or an 'only') is reread against the file after the change, and the report lists each one with the line that shows it still holds." The script now runs commands for the person, and a stage may be a command the script runs. The builder replaced the same phrase, "a manual procedure", in the opening paragraph of `SKILL.md` (judgment call 10) and kept it here (judgment call 8, "line 3 still holds"). Neither line is inside a function 1.1 keeps byte for byte, and line 3 stands above the block 1.5 rewrites. Failure scenario: a person opens a generated script before running it, reads in its first comment line that it walks them through a manual procedure, and does not expect it to offer to run an install; an agent filling the stages reads "One stage() per step the human takes" and gives a command no stage of its own. The banner's text ("You drive the browser; this wizard tells you exactly what to do and captures the values you copy back") has the same content, but `banner` is a function 1.1 and ADR 0046 keep unchanged, so that part is outside the builder's reach.

2. `skills/code/wizard/SKILL.md`, Steps 5, line 64: "Choose a command that differs by operating system by `WIZARD_OS`, and give a system the list does not cover a `warn` that names it." Page `docs/dev/skill-layout.md`, "Lists and tables": "two requirements that can each be broken while the other holds, joined by 'and', 'then', a semicolon or a second sentence, are two bullets." A script can choose by `WIZARD_OS` and print no `warn`, and the reverse. The report names the departure and calls the second clause a limit of the first; it is a second requirement, what to do for a system with no command. Failure scenario: an agent writes a `case "$WIZARD_OS"` with no branch for the other systems and counts the bullet as followed; on a system the list does not cover the script prints nothing for that stage and ends with "Setup complete".

3. `skills/code/wizard/templates/template.sh:223` to `235`, `shown=$(printf '%q ' "$@"); shown="${shown% }"` and `printf '  %sok ran%s %s\n' "$GREEN" "$RESET" "$shown"`. Page `docs/dev/change-standard.md`, rule 15: "Each place where a supplied value reaches a command, a path or generated text is a case." Called with no word, `run_cmd` shows `''`, asks, runs nothing on a yes and prints `ok ran ''`, where `run_cmd ""` shows the same `''` and fails with 127 (both runs under Verification). The brief's 1.4 names `COMMAND` as required and gives no case for its absence. Failure scenario: a stage chooses its command by `WIZARD_OS` into a variable and writes `run_cmd $install` unquoted; on a system whose branch left the variable empty, the person is asked to confirm `''`, answers yes, reads "ok ran", and the next stage runs without the tool. Whether this is a case the script must handle is for the orchestrator; the verdict of 1.4 stays "holds".

## Behaviour

none

## Declined to judge

- The comparison of the library's functions and of `run_wizard() {` to the end against `4d63a7f`, the commit the brief's two run cases and the builder's commands name. `git show 4d63a7f:<path>` is outside the three git commands I may run. I compared against `3167b2e`, the worktree's base.
- The first run of the test on the unchanged tree. Running the worktree's test beside the base's template in a scratch folder was refused by the runner's permission check, and I did not try another route. By reading: the base template defines no `run_cmd`, no `have` and no `WIZARD_OS` (the diff adds all three), and the quoted failures (`run_cmd: command not found`, `have: command not found`, `WIZARD_OS: unbound variable`) are what a scratch script built from it prints. The report's claim "The test was not edited after its first run" cannot be checked from the diff.
- Steps 5, line 65, the bullet on a command that needs a secret. Its wording follows the brief's 3.5. `run_cmd` prints its words after the shell has expanded them, so a stage that writes `run_cmd tool --token "$TOKEN"` prints the value; the bullet's own last clause ("so the printed line holds the variable's name and never the value") and the rule on line 108 forbid that, but the bullet does not say that the variable must not be expanded on the `run_cmd` line. Whether the brief's wording is enough is the orchestrator's call, not a defect of the diff.
- The banner's text against a script whose stages run commands: decided by 1.1 and ADR 0046, which keep the source's helpers unchanged.
- That a command reading standard input takes the answers meant for later questions when the answers are piped (my `cat` run). 1.4 asks for the command to read the script's standard input; later commands are then skipped, not run, and the report names the point as not covered by the test.
- Whether `docs/roadmap.md`, entry 18, or the figure script should change: neither is in the brief's paths.
- The state file's `verify:` list: the session's at landing, under ADR 0010.

## The builder's ten judgment calls

1. The wording of what `run_cmd` prints: stands; 1.4 fixes what is printed and when, not the words.
2. No `$` in front of the command line: stands; 1.4 asks for a line that runs when pasted.
3. `# shellcheck disable=SC2034` on the `case`: stands; my `shellcheck` run prints no SC2034, and the comment gives its reason.
4. `have` listed as an input in the head comment: stands under rule 14 of the change standard.
5. Each case in a subshell, the last line naming the failed cases: stands; the last line is still `PASS:` with exit 0 or `FAIL:` with exit 1.
6. The folders made for the word of "one word stays one word": stands; the word the brief dictates holds slashes, and the folders are inside the scratch folder.
7. The Stops row "An action not known" widened: stands; it serves 3.4 and is listed with that item, as rule 20 asks.
8. Line 3 of the template and the banner left as they are: the banner stands (1.1); line 3 does not, see Standards 1.
9. "What it reads" 1 and Anti-patterns row 1 naming Rules: stands; it is what 3.9 asks.
10. "a manual procedure" replaced by "a setup, a migration or a cutover" in the opening paragraph: stands; the case "no sentence says the script holds only actions a person must take" needs it.

Usage: a35934f5ab790b7de, claude-fable-5-2, 173906 tokens, 13 tool uses, 5.0 minutes

## Repair round 1, refuted
### Verification (the lines each check printed, verbatim)
All run from the worktree, tests under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

1. Character-set check over the seven changed files, `; echo "exit $?"` appended. It printed no line of its own, then `exit 0`.
2. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/code/wizard/templates/template.test.sh 2>&1` printed the lines below. `... | tail -1` printed `PASS: template.sh scratch tests, 8 cases`.
   ```
   ok: case_yes
   ok: case_no
   ok: case_end_of_input
   ok: case_failing_command
   ok: case_no_command
   ok: case_one_word
   ok: case_have
   ok: case_wizard_os
   PASS: template.sh scratch tests, 8 cases
   exit 0
   ```
3. `bash -n skills/code/wizard/templates/template.sh; echo "bn exit $?"` printed `bn exit 0`.
4. The description-length command printed `987`.
5. Function loop against `git show 3167b2e:skills/code/wizard/templates/template.sh`, each body cut by `sed -n "/^$f()/,/^}/p"`. It printed `same:` for each of `_clear`, `banner`, `stage`, `say`, `step`, `note`, `warn`, `open_url`, `pause`, `confirm`, `_existing`, `ask`, `ask_secret`, `write_env`, `set_secret`, `set_var`, `finish`, `run_wizard`. That is 18 names, with no `DIFF:`. The `sed -n '/^run_wizard() {/,$p'` of base and worktree compared with `cmp` printed `cmp 0`.
6. `git diff 3167b2e --stat | tail -1` printed ` 6 files changed, 89 insertions(+), 21 deletions(-)`. `git status --short` printed ` M README.md`, ` M docs/dev/building.md`, ` M docs/dev/change-standard.md`, ` M docs/dev/scripts.md`, ` M skills/code/wizard/SKILL.md`, ` M skills/code/wizard/templates/template.sh`, `?? .scratch/.../briefs/3-round-1.md`, `?? .scratch/.../reviews/3-report.md` and `?? skills/code/wizard/templates/template.test.sh`.
7. `wc -l`: SKILL.md 113, template.sh 289, template.test.sh 245, README.md 257, scripts.md 51, building.md 42, change-standard.md 96. These match the report's "Files" section.
8. Line numbers the report quotes, by `grep -n`: SKILL.md lines 64, 65 and 66 are the three bullets of rulings 2 and 4. The two 3.10 sentences are at 105 and 106, and `grep -c -F` of each printed `1`. `docs/dev/building.md` line 19 is the test line.
9. The delta against the snapshot (`diff -u`, over each path of `files.txt`) shows changes in these files only. README.md, change-standard.md and scripts.md show none.
   - `building.md`: one comment gains "a call with no command".
   - `SKILL.md`: Steps 5 bullets 64 to 66.
   - `template.sh`: lines 3 and 4, head comment lines 22 and 24, the `run_cmd` comment and guard, and marker lines 260 and 261.
   - `template.test.sh`: the head-comment line, `case_no_command` and the case list.
   - The report.
10. My own runs of the `run_cmd` guard, in a `mktemp -d` folder outside the worktree, since removed. The library was the template's lines above `run_wizard() {`, followed by one stage line and `echo AFTER`, run under `bash` with `y` on standard input.
    - `run_cmd`, `run_cmd ""` and `e=; run_cmd $e` each printed `  ! no command given to run_cmd`, then `status 2`. They asked no question and did not print AFTER.
    - `run_cmd " "` printed `\ `, asked, then printed `command not found` and `! command failed with status 127: \ `, then `status 127`.
    - `run_cmd " " x` and `run_cmd -- true` behaved the same, with status 127.

### The rulings
1. Carried out as ruled. Template line 3 and the marker comment (lines 260 and 261) now cover the commands. The 18 function bodies and `run_wizard() {` to the end are equal to the base (item 5 above).
2. Carried out as ruled. SKILL.md lines 64 and 65 are one bullet per requirement.
3. Carried out as ruled. The guard `[[ -z "${1:-}" ]]` comes first in `run_cmd`, before the quoting, `confirm` and the run. It warns and does `exit 2`.
   - No word, an empty first word and an empty unquoted variable all end with status 2, with no question and no AFTER (item 10).
   - A first word of one space is not empty. It is shown as `\ `, asked, and on a yes fails loudly with 127 through the existing failure path. It never prints "ok ran".
   - The head comment lists the warning (line 22) and the status (line 24).
   - `case_no_command` runs the unquoted-empty and quoted-empty-first-word forms. It asserts status 2, no later file, the warning, no `[y/N]` and no `ok ran`. Its head-comment line states the reason for keeping it.
   - Read against the base `run_cmd`, which has no guard, both scripts would end 0 and 127. The test asserts 2, so it would fail there. This is by reading only (see Declined to judge).
4. Carried out as ruled. Line 66 says the `run_cmd` line never holds the variable's expansion, and that the command reads the variable from its environment or asks for the secret itself. It is one requirement.

The one change beyond the rulings' own lines is `docs/dev/building.md` line 19, which adds "a call with no command" to the test's comment. It keeps the listing equal to the test's cases, as 4.3 asks, so it holds.

### Verdicts
#### Items
- 1.1 holds.
- 1.2 holds.
- 1.3 holds.
- 1.4 holds.
- 1.5 holds. The head comment lists the `uname -s` and `have` inputs, all three warnings with their conditions, the declined commands in "still to do by hand:", and exit status 2.
- 1.6 holds.
- 2 holds.
- 3.1 holds. The description is 987 characters, the opening paragraph has three sentences, and the version is `1.0.0`.
- 3.2 holds.
- 3.3 holds.
- 3.4 holds.
- 3.5 holds.
- 3.6 holds.
- 3.7 holds.
- 3.8 holds.
- 3.9 holds.
- 3.10 holds. Both sentences are word for word and counted once each.
- 4.1 holds.
- 4.2 holds.
- 4.3 holds.

#### Cases
- test, a yes: met.
- test, a no: met.
- test, the end of input: met.
- test, a failing command: met.
- test, one word stays one word: met.
- test, `have`: met.
- test, `WIZARD_OS`: met.
- run, `bash -n`: met.
- run, the functions unchanged: met, against `3167b2e`.
- run, `run_wizard() {` to the end: met, against `3167b2e`.
- read, the head comment against the additions: met.
- read, `SKILL.md` against 3.1 to 3.10: met.
- read, no sentence says "only actions" or "no command": met. This is by reading `SKILL.md`, the README row and the scripts row, which all name commands beside the actions.
- read, no private name in a shipped file: met. `git diff 3167b2e -- skills README.md docs/dev`, added lines, grepped for `/Users`, `.scratch`, `axel`, `manuscript` and `~/` printed nothing.

### Spec
none

### Proof
none. By reading, `case_no_command` is a proof and not an audit. Both its scratch scripts would fail against a `run_cmd` without the guard: one ends 0 after "ok ran ''", the other ends 127. The test asserts 2.

### Standards
none

### Behaviour
none

### Declined to judge
- The red run of `case_no_command` on the template as it stood before the guard, and the report's claim that the test was not edited after it. Reproducing it needs the pre-guard template, which the three allowed git commands cannot produce without writing outside the worktree, and I did not break code to test a test. The quoted failure agrees with the base `run_cmd`, which has no guard. The base is `git show 3167b2e:<path>` and the guard is not in it.
- The comparison against `4d63a7f`, which the brief's own run cases name. I compared against `3167b2e`, the worktree's base, since `git show 4d63a7f:<path>` is outside the three commands I may run.
- The first run of the cases on the unchanged tree, which is the builder's first task. I ran none on the base.
- The state file's `verify:` list. ADR 0010 gives it to the session at landing.
- Whether the banner text ("You drive the browser; this wizard tells you exactly what to do...") should change. It is inside `banner`, which ruling 1 keeps byte for byte.

Usage: a4b6a6a0a1e30749c, claude-sonnet-5-5 with one recorded call on claude-opus-5-5, 118093 tokens, 12 tool uses, 1.4 minutes

## Closed

- First run, Standards 1 to 3 and the point on the secrets bullet under "Declined to judge": closed in repair round 1, each as `agents/briefs/3-round-1.md` rules it; the run over the round found each ruling carried out and gave no finding.

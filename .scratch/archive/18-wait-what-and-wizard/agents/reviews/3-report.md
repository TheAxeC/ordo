Everything in the brief is done.

# Report: step 3, wizard writes stages that run commands, each shown and confirmed first

## Open items of the state file

- none

## The cases' first run, on the unchanged tree

The test was written first and run on the unchanged template with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/code/wizard/templates/template.test.sh 2>&1`. It exited 1. Each test case runs in a subshell, so one run gives the first run of all seven. Its whole output:

```
FAIL: a yes: the script exited 127: 
> Stage 1/1: A command
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.StyDH8/touch-made.sh: line 217: run_cmd: command not found
FAIL: a no: the script exited 127: 
> Stage 1/1: A command
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.StyDH8/touch-made.sh: line 217: run_cmd: command not found
FAIL: the end of input: the script exited 127: 
> Stage 1/1: A command
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.StyDH8/touch-made.sh: line 217: run_cmd: command not found
FAIL: a failing command: the script exited 127, not 7: 
> Stage 1/2: A command that fails
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.StyDH8/failing.sh: line 217: run_cmd: command not found
FAIL: one word stays one word: the script exited 127: 
> Stage 1/1: One word
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.StyDH8/one-word.sh: line 217: run_cmd: command not found
FAIL: have: the script exited 127: 
> Stage 1/1: have
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.StyDH8/have.sh: line 217: have: command not found
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.StyDH8/have.sh: line 218: have: command not found
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.StyDH8/have.sh: line 218: run_cmd: command not found
FAIL: WIZARD_OS: the script exited 1 with uname printing Darwin: 
> Stage 1/1: The operating system
/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/wizard-test.StyDH8/os.sh: line 217: WIZARD_OS: unbound variable
FAIL: template.sh scratch tests, of 7 cases these failed: case_yes case_no case_end_of_input case_failing_command case_one_word case_have case_wizard_os
```

| Case | Checked by | First run |
|---|---|---|
| test, a yes | `case_yes` of the test | fails: `FAIL: a yes: the script exited 127:` with `run_cmd: command not found` |
| test, a no | `case_no` | fails: `FAIL: a no: the script exited 127:` with `run_cmd: command not found` |
| test, the end of input | `case_end_of_input` | fails: `FAIL: the end of input: the script exited 127:` with `run_cmd: command not found` |
| test, a failing command | `case_failing_command` | fails: `FAIL: a failing command: the script exited 127, not 7:` with `run_cmd: command not found` |
| test, one word stays one word | `case_one_word` | fails: `FAIL: one word stays one word: the script exited 127:` with `run_cmd: command not found` |
| test, `have` | `case_have` | fails: `FAIL: have: the script exited 127:` with `have: command not found` |
| test, `WIZARD_OS` | `case_wizard_os` | fails: `FAIL: WIZARD_OS: the script exited 1 with uname printing Darwin:` with `WIZARD_OS: unbound variable` |
| run, `bash -n` | `bash -n skills/code/wizard/templates/template.sh; echo "exit $?"` | prints `exit 0` and nothing else |
| run, the functions unchanged | for each name `git show 4d63a7f:skills/code/wizard/templates/template.sh \| sed -n 's/^\([a-z_]*\)().*/\1/p'` prints, the lines `sed -n "/^$f()/,/^}/p"` gives on the base compared with those of the worktree | `same:` for each of `_clear`, `banner`, `stage`, `say`, `step`, `note`, `warn`, `open_url`, `pause`, `confirm`, `_existing`, `ask`, `ask_secret`, `write_env`, `set_secret`, `set_var`, `finish`, `run_wizard` (the worktree's file was the base's) |
| run, `run_wizard() {` to the end | `git show 4d63a7f:skills/code/wizard/templates/template.sh \| sed -n '/^run_wizard() {/,$p' \| cmp - <(sed -n '/^run_wizard() {/,$p' skills/code/wizard/templates/template.sh); echo "cmp exit $?"` | `cmp exit 0` |
| read, the head comment against the additions | reading lines 6 to 18 of the unchanged template | not met: no `uname`, no warning of a skipped or failed command, no exit status of a failed command, since the additions do not exist |
| read, `SKILL.md` against 3.1 to 3.10 | reading the unchanged `SKILL.md` | not met: no item of 3.1 to 3.10 is present, and neither sentence of 3.10 |
| read, no sentence says only actions a person must take | reading the unchanged files | not met: `SKILL.md` description ("the actions only a person can take", "It is not for actions the agent can perform itself"), "What it reads" 1 ("that only a person can take"), Anti-patterns row 1 ("the script holds only the actions a person must take"); `README.md` line 29 and `docs/dev/scripts.md` line 18 ("through the actions only a person can take") |
| read, a shipped file names nothing private | reading the unchanged `SKILL.md`, template, README row and scripts row | met: the one example is the made-up stage around the public API-keys page of Stripe's dashboard, and "The template" says so |

No case was found that the brief's rules get wrong, so there was no hand-back and no ruling.

## Repair round 1

The four rulings of `agents/briefs/3-round-1.md` are carried out. The tables below this section give the state after the round.

| Ruling | Lines changed |
|---|---|
| 1. The template's line 3 and the marker comment cover the commands | `skills/code/wizard/templates/template.sh` lines 3 and 4: "A wizard walks a human through a procedure, step by step: the actions the human takes, and the commands a stage runs once the human has confirmed them." Lines 260 and 261: "STAGES: author this section. One stage() per step: what the human does, and the commands the script runs there once the human has confirmed each." Every function, the banner included, is unchanged: the function loop prints `same:` for all 18 names |
| 2. Two bullets for the operating system | `skills/code/wizard/SKILL.md` lines 64 and 65: "Choose a command that differs by operating system by `WIZARD_OS`." and "Give an operating system the stage list does not cover a `warn` that names it." |
| 3. `run_cmd` with no command | `template.sh` lines 227 to 230: with no word or an empty first word, `run_cmd` prints through `warn` "no command given to run_cmd" and ends the script with status 2, before it prints or asks anything. Its comment (lines 222 to 224), the head comment's warning (line 22) and the exit status sentence (line 24) say so. The test gains `case_no_command` and a line of its head comment that says why it is kept. `docs/dev/building.md` line 19 names the case among the test's cases |
| 4. The secret's variable is never expanded on the `run_cmd` line | `SKILL.md` line 66: "Keep the expansion of a secret's variable off the `run_cmd` line, where bash replaces it by the value before the line is printed: the command reads the variable from its environment, which the stage exports after `ask_secret`, or asks for the secret itself." |

The new case was added first and the test run on the template as it stood, before `run_cmd` was changed, with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/code/wizard/templates/template.test.sh 2>&1`. It exited 1 and printed:

```
ok: case_yes
ok: case_no
ok: case_end_of_input
ok: case_failing_command
FAIL: no command: no-word exited 0, not 2: 
> Stage 1/2: No command
  ''
  ? Run this command? [y/N]   ok ran ''

> Stage 2/2: A later stage

  ok Setup complete
ok: case_one_word
ok: case_have
ok: case_wizard_os
FAIL: template.sh scratch tests, of 8 cases these failed: case_no_command
```

The case runs two scratch scripts, one that calls `run_cmd` with an empty unquoted variable and one with an empty quoted first word followed by `--flag`. For each it asserts exit status 2, that the later stage's file does not exist, the warning, no question and no "ok ran". The test was not edited after that run.

The checks of "Verify before you report", rerun after the round:

| Check | Output |
|---|---|
| 1, the character-set check over the seven changed files | prints nothing; `exit 0` |
| 2, the test, without the filter | `ok: case_yes`, `ok: case_no`, `ok: case_end_of_input`, `ok: case_failing_command`, `ok: case_no_command`, `ok: case_one_word`, `ok: case_have`, `ok: case_wizard_os`, `PASS: template.sh scratch tests, 8 cases`, `exit 0` |
| 3, `bash -n skills/code/wizard/templates/template.sh; echo "exit $?"` | `exit 0` and nothing else |
| 4, the description length | `987` |
| 5, the new case red before the change | the failure quoted above |
| 6, the changed bullets read against the list rules | each of `SKILL.md` lines 64, 65 and 66 holds one requirement; line 66 is over 20 words, since it gives the reason and the two ways the command gets the secret |
| the functions against `4d63a7f` | `same:` for all 18 names |
| `run_wizard() {` to the end against `4d63a7f` | `cmp exit 0` |

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| Verify 1, character set over the changed files | DONE | `printf '%s\0' skills/code/wizard/SKILL.md skills/code/wizard/templates/template.sh skills/code/wizard/templates/template.test.sh README.md docs/dev/scripts.md docs/dev/building.md docs/dev/change-standard.md \| xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $found = 1 } close ARGV if eof; END { exit($found ? 1 : 0) }'; echo "exit $?"` | prints no line of its own; `exit 0` |
| Verify 2, the test | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/code/wizard/templates/template.test.sh 2>&1 \| tail -1` | `PASS: template.sh scratch tests, 8 cases` |
| Verify 3, `bash -n` | DONE | `bash -n skills/code/wizard/templates/template.sh; echo "exit $?"` | `exit 0` and nothing else |
| Verify 4, description length | DONE | `python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/code/wizard/SKILL.md").read().split("---")[1])["description"]))'` | `987` |
| Verify 5, test red before, green after | DONE | the first run above; then the same command without the filter | before: the 7 `FAIL:` lines quoted above, exit 1. After: `ok: case_yes`, `ok: case_no`, `ok: case_end_of_input`, `ok: case_failing_command`, `ok: case_one_word`, `ok: case_have`, `ok: case_wizard_os`, `PASS: template.sh scratch tests, 7 cases`, exit 0. Repair round 1 added `case_no_command`, with its own red run quoted under "Repair round 1", and the test now prints `PASS: template.sh scratch tests, 8 cases` |
| Verify 6, list items and sentences read against the standards | DONE | reading | departures listed under "Departures from the list and sentence rules" below |
| 1.1 library functions byte for byte, `SKIPPED` comment, additions in one place | DONE | the function loop of the first-run table, run after the change | `same:` for all 18 names. The additions stand between `set_var` and `finish` (lines 201 to 244 of the template) |
| 1.2 `WIZARD_OS` | DONE | `case_wizard_os` | `ok: case_wizard_os` |
| 1.3 `have` | DONE | `case_have` | `ok: case_have` |
| 1.4 `run_cmd` | DONE | `case_yes`, `case_no`, `case_end_of_input`, `case_failing_command`, `case_no_command`, `case_one_word` | `ok:` for each |
| 1.5 head comment | DONE | `git diff 3167b2e -- skills/code/wizard/templates/template.sh` | two inputs added (`uname -s`, the tools passed to `have`), three warnings with their conditions, the "still to do by hand:" line naming declined commands, one sentence on the exit status of a failed command and of a call with no command |
| 1.6 example stage and `run_wizard() {` to the end | DONE | the `cmp` of the first-run table, run after the change | `cmp exit 0` |
| 2 the test | DONE | Verify 2 | `PASS: template.sh scratch tests, 8 cases` |
| 3.1 to 3.10 `SKILL.md` | DONE | reading; `grep -n '^## ' skills/code/wizard/SKILL.md`; `grep -c -F` of each sentence of 3.10 | the eight `##` headings in the old order under the title; each sentence of 3.10 counted `1`, at lines 105 and 106; `version: "1.0.0"` at line 5 |
| 4.1 `README.md` line 29 | DONE | `git diff 3167b2e --stat` | `README.md \| 2 +-` |
| 4.2 `docs/dev/scripts.md` | DONE | `git diff 3167b2e --stat` | `docs/dev/scripts.md \| 3 +-`: line 18 and the new row at line 51 |
| 4.3 `docs/dev/building.md`, `docs/dev/change-standard.md` | DONE | `git diff 3167b2e --stat` | `docs/dev/building.md \| 1 +`, `docs/dev/change-standard.md \| 1 +`, each after the line of `utils/pin.test.sh` |
| Case read: head comment against the additions | DONE | reading the head comment against lines 201 to 244 | every input (`uname -s`, `command -v` of a tool, the answer), the three warnings and both exit statuses are listed |
| Case read: no sentence says only actions, or no command | DONE | `grep -rn 'only a person can take\|only the actions\|runs no command\|agent can perform' skills/code/wizard README.md docs/dev/scripts.md` | two hits, `docs/dev/scripts.md:18` and `README.md:29`, each naming the actions only a person can take beside the commands a stage runs |
| Case read: nothing private in a shipped file | DONE | reading the diff | no path outside the repository and no private name; the one new example, `[[ -d <folder> ]]`, is a placeholder; the Stripe example is unchanged and stated as made up |
| Rule 14, the new names carried | DONE | `grep -rn 'run_cmd\|WIZARD_OS' skills utils docs README.md \| grep -v '^skills/code/wizard/'` | `docs/dev/building.md:19` and `docs/dev/scripts.md:51`, the two listings the step adds |

Behaviours whose failure costs something, with their cases and the failing line of the first run:

| Behaviour | Case | Failing line on the unchanged tree |
|---|---|---|
| A confirmed command runs, after being shown | `case_yes` | `FAIL: a yes: the script exited 127:` |
| A declined command does not run and is listed in the closing summary | `case_no` | `FAIL: a no: the script exited 127:` |
| The end of input runs nothing | `case_end_of_input` | `FAIL: the end of input: the script exited 127:` |
| A failed command ends the script with its status | `case_failing_command` | `FAIL: a failing command: the script exited 127, not 7:` |
| `run_cmd` with no command ends the script and reports nothing as run | `case_no_command` | `FAIL: no command: no-word exited 0, not 2:` (the run of repair round 1) |
| An argument with a space and a `;` stays one word | `case_one_word` | `FAIL: one word stays one word: the script exited 127:` |
| `have` answers for an installed and a missing tool | `case_have` | `FAIL: have: the script exited 127:` |
| `WIZARD_OS` names the system | `case_wizard_os` | `FAIL: WIZARD_OS: the script exited 1 with uname printing Darwin:` |

What the green test does not cover: a `uname` that exists and exits non-zero (the brief lists no case for it; the code gives `unknown` by `_UNAME=$(uname -s 2>/dev/null) || _UNAME=""`), the colours on a terminal, and an installer that reads the person's answers from standard input.

### Departures from the list and sentence rules

- `SKILL.md`, the opening paragraph's second sentence, and the `README.md` row: over 20 words, since each is the list of what the script does and the brief adds the commands to that list.
- `SKILL.md` Steps 1, the bullet on the check of a command: over 20 words, since it names the two forms of the check the brief dictates.
- `SKILL.md` Steps 5, the bullet on a secret's variable: over 20 words, since it gives the reason and the two ways the command gets the secret.
- `SKILL.md` Rules, the rule "The session never runs the script": over 20 words with its three reasons.
- `docs/dev/building.md` line 19 and `docs/dev/scripts.md` line 18: one long line each, in the form of the lines around them.

## Terms

- **session, the**: used in new places in `SKILL.md` (the description, Anti-patterns row 1, the two new Rules bullets and the rule on never running the script). Each use is the Claude Code session that runs the skill, as the entry says.
- **stop**: used in a new place in `SKILL.md` Steps 3 ("at the same stop"). It is a point of the skill's Stops table where it waits on the user, the entry's second sense.
- **step**: Steps 1, 3, 5 and 6 are cited as "Steps <n>", the entry's second sense.
- No glossary entry is added or changed, so no "Stated in" was to check.

## Files, with line counts (`wc -l`)

- `skills/code/wizard/SKILL.md`: 113
- `skills/code/wizard/templates/template.sh`: 289
- `skills/code/wizard/templates/template.test.sh`: 245 (new, mode 644 as the other test scripts under `templates/`)
- `README.md`: 257 (line 29 changed)
- `docs/dev/scripts.md`: 51
- `docs/dev/building.md`: 42
- `docs/dev/change-standard.md`: 96

## Judgment calls the brief left open

1. The wording of what `run_cmd` prints: the command line as two spaces and the quoted words, in bold on a terminal; the question `Run this command?`; `ok ran <command>` after a success; the warnings `skipped command: <command>` and `command failed with status <status>: <command>`; the `SKIPPED` entry `command <command>`.
2. The command line carries no `$` prompt in front of it, so that the whole line pasted into a shell runs the command, as 1.4 asks.
3. `# shellcheck disable=SC2034` stands on the `case` that sets `WIZARD_OS`, with its reason. Without it `shellcheck`, which Steps 6 of the skill runs on every script, warns that `WIZARD_OS` is unused in each script whose stages do not read it.
4. The head comment also lists, as an input, whether each tool a stage passes to `have` is installed, since rule 14 of the change standard asks for every input.
5. The test runs each case in a subshell and its last line names every case that failed. The shape is otherwise that of `utils/pin.test.sh`.
6. In the case "one word stays one word" the test makes, inside the scratch folder, the folders that the slashes of the word `<scratch>/a b; touch <scratch>/c` name, so that `touch` can create one file with that whole name.
7. Stops, row "An action not known": its When and What it shows now also name a command not known for an operating system. Item 3.4 sends that case to the same stop, and the row would otherwise not cover it.
8. The banner's text is left as it is, since the banner is a function that stays byte for byte. Line 3 of the template and the marker comment were reworded under ruling 1 of repair round 1.
9. `SKILL.md` "What it reads" 1 and Anti-patterns row 1 name Rules for the scope ("that Rules leaves to the skill", "an action Rules leaves to the session"), so the rule is written once, in Rules. The description repeats the sentence word for word, as 3.9 asks of it.
10. The opening paragraph's "a manual procedure" became "a setup, a migration or a cutover", the three procedures Quick start names.

## Host- and user-visible changes

| Surface | Before | After |
|---|---|---|
| A script written from the template | no helper runs a command | `run_cmd COMMAND [ARGUMENT ...]` prints the command, asks `Run this command? [y/N]`, runs it on a yes, prints `ok ran <command>`; on anything else warns `skipped command: <command>` and lists `command <command>` under "still to do by hand:"; on a failure warns `command failed with status <status>: <command>` and exits with that status; called with no word or an empty first word, it warns `no command given to run_cmd` and exits 2 |
| The same | no check of a tool | `have TOOL` |
| The same | no operating system | `WIZARD_OS` is `macos`, `linux`, `windows` or `unknown` |
| `wizard`'s description | "walks a person through the actions only a person can take"; "It is not for actions the agent can perform itself"; 803 characters | "walks a person through a setup or another procedure", with "runs the commands a stage needs, each shown and confirmed first" and "installing a tool or a project's dependencies" among the uses; "It is not for an action the session can take itself, now, on the machine it runs on"; the trigger "walk me through installing the dependencies"; 987 characters |
| `wizard`'s stage list shown to the user | stages, values, where written, whether secret | also each stage's commands with the operating systems they hold for |
| `README.md` row of `wizard` | actions only a person can take | a setup: those actions and the commands a stage runs, each shown and confirmed first |
| `docs/dev/building.md`, `docs/dev/change-standard.md` | 13 test commands | one more, `sh skills/code/wizard/templates/template.test.sh`. The state file's `verify:` list gains it at landing, by the session |

## Anything in the brief that was wrong or impossible

Nothing. One fact beside the brief: `shellcheck skills/code/wizard/templates/template.sh` exits 1 on the base as well, with SC1087 at the line of `ask` that builds the prompt and SC2329 for unused functions. Those lines are inside functions the brief keeps byte for byte and are unchanged.

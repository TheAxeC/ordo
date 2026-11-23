# Step 5 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/18-wait-what-and-wizard-5, base a1b314d)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/code/wizard/templates/template.test.sh 2>&1 | tail -1
PASS: template.sh scratch tests, 12 cases
  (unfiltered: 12 lines "ok:", case_yes, case_no, case_end_of_input, case_failing_command, case_no_command, case_one_word, case_have, case_wizard_os, case_version_equal_and_later, case_version_earlier, case_not_a_version, case_by_hand; exit 0)

printf '%s\0' skills/code/wizard/SKILL.md skills/code/wizard/templates/template.sh skills/code/wizard/templates/template.test.sh docs/dev/scripts.md docs/dev/building.md | xargs -0 perl -CSD -ne '...' (the brief's command, whole)
  printed nothing, exit 0

shellcheck skills/code/wizard/templates/template.sh
  printed nothing, exit 0

bash -n skills/code/wizard/templates/template.sh
  printed nothing, exit 0
/bin/bash -n skills/code/wizard/templates/template.sh        (GNU bash, version 3.2.57(1)-release)
  printed nothing, exit 0

python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/code/wizard/SKILL.md").read().split("---")[1])["description"]))'
987

git status --short
 M docs/dev/building.md
 M docs/dev/scripts.md
 M skills/code/wizard/SKILL.md
 M skills/code/wizard/templates/template.sh
 M skills/code/wizard/templates/template.test.sh
?? .scratch/18-wait-what-and-wizard/agents/reviews/5-report.md

Commands the builder's report quotes:

shellcheck -f gcc on `git show a1b314d:skills/code/wizard/templates/template.sh` (copied under $TMPDIR)
  105:1 SC2329, 134:36 SC1087, 189:1 SC2329, 215:1 SC2329, 225:1 SC2329; exit 1   (as the report quotes)

git diff a1b314d, hunks counted per file: template.sh 8, in the head comment (3), at old line 49, at old lines 64 to 66, at old line 134, the block between run_cmd and finish, and the one pause; SKILL.md 15 lines added and 5 removed; building.md and scripts.md one line each   (as the report quotes)

wc -l: SKILL.md 123, template.sh 330, template.test.sh 382, building.md 42, scripts.md 51   (as the report quotes)

grep -rn 'version_at_least\|by_hand' skills utils docs README.md, outside skills/code/wizard: docs/dev/building.md:19 and docs/dev/scripts.md:51 only

The reviewer's own runs, the template's lines above "run_wizard() {" sourced by /bin/bash 3.2.57 (set -euo pipefail in force) in a scratch folder under $TMPDIR:

version_at_least succeeds, nothing printed: 3.28 3.28; 3.28.0 3.28; 3.28 3.28.0; 4.0.1 3.28; 3.30 3.28; 24.04 24.4; 1.09 1.8; 1.010 1.9; 08 8; 008.09 8.9; 0 0; 0.0.0 0; 3.0.0.1 3; 3.28.0.0 3.28; 1.2.3.4.5 1.2.3.4.5; 10 9
version_at_least fails, nothing printed: 3.9 3.28; 3.27.9 3.28; 2.99 3; 3 3.0.0.1; 9 10; abc 3.28; 3.x 3.28; 3..28 3.28; 3. 3.28; .5 3.28; v3.28 3.28; 3.28-rc1 3.28; 3x28 3.28; 3.28 3.x; 3.28 3.; 3.28 v3.28; -1 0; +1 0; 1e3 1; 0x10 1; '3.*' 3.28; " 3.28" 3.28; "3.28 " 3.28; "3.28<newline>" 3.28; "" 3.28; 3.28 ""; "" ""; one argument; no argument
after `if version_at_least; then ...; fi` with no argument the script went on
a third argument is ignored: 3.28 3.28 extra succeeds
a part beyond 64 bits wraps without a message: 9223372036854775808 1 fails, 99999999999999999999 1 succeeds

by_hand "install the tool: run stage 2 first": prints "  ! left to do by hand: install the tool: run stage 2 first", returns 0; finish then lists "    - install the tool: run stage 2 first" under "  ! still to do by hand:"
by_hand with a text holding $HOME, backquotes, %s, \n, * and two spaces: printed and listed unchanged
( by_hand ) and ( by_hand "" ): each prints "  ! no text given to by_hand", status 2

ask, old line 134: the string built with ${e}[Enter keeps current] compares equal to the string the base builds ("same"; od shows 001 D 002 [Enter keeps current] 001 R 002 and a space)
banner: three text lines of 73, 77 and 60 columns (base: 69, 73 and 49)
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1.1: holds, the 8 hunks of `git diff a1b314d` in `template.sh` touch no function other than `banner` (text only) and `ask` (one line); `SKIPPED`'s comment names "or a stage called by_hand" (template.sh:54); the two additions stand at template.sh:251-284, after `run_cmd` and before `finish`, each under a comment.
- 1.2: holds, template.sh:139 reads `${e}[Enter keeps current]`; the built string equals the base's; shellcheck prints nothing.
- 1.3: holds, template.sh:69-71, three printed lines, the Ctrl-C sentence kept.
- 1.4: holds, the reviewer's runs above under /bin/bash 3.2, each input of the item included, nothing printed in any call; no `sort` in the function.
- 1.5: holds, the reviewer's runs above; `run_cmd` unchanged and does not call it.
- 1.6: holds, template.sh:2 with its reason; shellcheck prints nothing, exit 0.
- 1.7: holds, template.sh:17-18, 26-29 name both helpers; Standards 2 is a wording finding on line 17 that does not change the verdict.
- 1.8: holds, template.sh:324 is the only changed line from `run_wizard() {` to the end.
- 2: holds, four functions added, the eight existing ones untouched in the diff, head line 2 names the five helpers, each new `version_at_least` function asserts the empty `-printed` file, last line `PASS: template.sh scratch tests, 12 cases`.
- 3.1: holds, Steps 5, the bullet "End each stage on `pause`".
- 3.2: holds, Steps 5, the three bullets from "Where a command needs a tool that an earlier stage installs"; Standards 1 is on the form of the second.
- 3.3: holds, Steps 5, the bullets "Write a command that needs a shell" and "Print the plain line with `say`"; Spec 2 is a gap the brief's text shares.
- 3.4: holds, Steps 5, the one rewritten bullet "Skip the commands of a stage that is already done".
- 3.5: holds as the brief words it, Steps 1 (the check bullet) and Steps 5 (three bullets); Spec 1 is the clash with ADR 0046 that the brief asked for.
- 3.6: holds, Steps 6, the bullet "Fix in the stages each line `shellcheck` prints" and the "Done when".
- 3.7: holds, Steps 5's helper list and "The template", second bullet.
- 3.8: holds, `metadata.version` is "1.0.0", the description is not in the diff, and no sentence of it is made false.
- 4.1: holds, docs/dev/building.md line 19 and docs/dev/scripts.md line 51, the only changed lines of those pages.

Cases of the brief's "Cases":

- test, `version_at_least`, equal and later: met, `case_version_equal_and_later` passes and asserts the five pairs; the reviewer's runs agree.
- test, `version_at_least`, earlier: met, `case_version_earlier` passes and asserts the three pairs.
- test, `version_at_least`, leading zeros: met, asserted in `case_version_equal_and_later` with the empty `-printed` file.
- test, `version_at_least`, not a version: met, `case_not_a_version` passes, asserts the seven inputs, the empty `-printed` file, exit 0 and the later stage's file.
- test, `by_hand`: met, `case_by_hand` passes and asserts exit 0, the later stage's file, the line above "still to do by hand:" and the text below it.
- run, shellcheck: met, prints nothing and exits 0; on the base's file it exits 1 with SC1087 once and SC2329 four times.
- run, `bash -n`: met, also under /bin/bash 3.2.
- run, the diff of `template.sh`: met, 8 hunks in the places the case names.
- run, the existing eight cases: met, eight "ok:" lines in the reviewer's run; their functions are not in the diff.
- read, `SKILL.md` against 3.1 to 3.8: met, each rule read once in the file; no bullet found that disagrees with another (the bullet on a secret's variable and the `bash -c` bullet agree: a single-quoted line leaves the variable to the inner bash).
- read, the head comment against 1.4 and 1.5: met, template.sh:17-18 and 26-29.
- read, a shipped file names nothing private: met, the new text names no file, folder, project or person; the one example stays the made-up stage around Stripe's public API-keys page, which "The template" says.

## 1. Spec

- 1. skills/code/wizard/SKILL.md, Steps 5: "Read the installed version outside `run_cmd`: the read is part of the check, reads and changes nothing and is no command of the stage."; what is wrong: reading a version runs the tool itself (for example `cmake --version`) with nothing shown and no yes, and ADR 0046's decision says "No command runs without being shown and confirmed."; the skill's own Rules says "No command runs without being shown to the person and confirmed with a yes". The checks the base allowed were `have` and a bash test, neither of which starts a program. The brief asked for this (3.5 and its decision 7, which reads the ADR's sentence as about the commands of a stage), so it is a contradiction the brief asked for, which only the user rules; failure scenario: a script runs `<tool> --version` on the person's machine at the top of a stage, before any question, where the tool on PATH is not the one the person expects or its version call is slow or has an effect; the person was told by the opening screen that the wizard "runs each command only after you have confirmed it"; verdict: none, 3.5 holds as the brief words it.
- 2. skills/code/wizard/SKILL.md, Steps 5: "Print the plain line with `say` right above that `run_cmd`, since `run_cmd` prints each word quoted for the shell"; what is wrong: the bullet before it says the `run_cmd` line is in single quotes "so that bash expands nothing before the command is shown", and this bullet says nothing on how the `say` line is quoted. Every `say` of the template's example stage is in double quotes. The brief's 3.3 has the same gap, so no item asks for the quoting; failure scenario: the agent writes `say "export PATH=$(brew --prefix)/bin:$PATH"` above `run_cmd bash -c '...'`; bash runs `brew --prefix` unshown and unconfirmed when the `say` line is reached, and the person reads the expanded text, not the line that will run (reviewer's run: `say "line with $(echo SUBSTITUTED) and $HOME"` printed "line with SUBSTITUTED and <home>"). ADR 0046: "No command runs without being shown and confirmed."; verdict: none, 3.3 holds as the brief words it.

## 2. Proof

- none. Each new test function was read: `case_version_equal_and_later` fails when the comparison is missing or always fails; `case_version_earlier` and `case_not_a_version` each fail when the helper is undefined (the `-printed` file is then not empty) or always succeeds, and a helper that always fails silently is caught by `case_version_equal_and_later`; `case_by_hand` fails when the text is not recorded, not printed, or when the call ends the script. None asserts source text, a label alone or a constant. The report quotes a failure on the unchanged tree for each of the four functions.

## 3. Standards

- 1. skills/code/wizard/SKILL.md, Steps 5: "When that tool is missing, call `by_hand` with what is left and the stage to run first, run none of the stage's commands and read none of its values."; what is wrong: three requirements in one bullet, each of which can be broken while the others hold (a stage can call `by_hand` and still ask for the value); `docs/dev/skill-layout.md`, "Lists and tables": "two requirements that can each be broken while the other holds, joined by 'and', 'then', a semicolon or a second sentence, are two bullets". The builder's report names this bullet under its judgment calls and keeps it. The rewritten bullet "Skip the commands of a stage that is already done ... : a value the stage reads is asked for and written whether or not the check skipped the commands" also holds two such requirements, and there the brief's 3.4 asks for one bullet; failure scenario: an agent that reads the bullet as one act calls `by_hand` and goes on to `ask` for the stage's value, which is not known yet, and writes it to `.env`; verdict: none.
- 2. skills/code/wizard/templates/template.sh:17: "#   - the two versions a stage passes to version_at_least, the installed one and the minimum, which prints nothing;"; what is wrong: "which prints nothing" follows "the minimum", so the clause reads as said of the minimum or of the versions and not of `version_at_least`; the prose standard, E, "Cold opens" asks that a reference has its antecedent; failure scenario: a reader of the head comment's Inputs list cannot tell what prints nothing without reading the function's own comment at line 252; verdict: none.

## 4. Behaviour

- none. The report states the opening screen, the two helpers with their warnings and status, the shellcheck result and the example stage's `pause`, each with before and after, and the reviewer's runs agree.

## Declined to judge

- The failures the report quotes from the first run of the four new functions on the unchanged tree were not rerun: that needs a tree holding the new test beside the base's template, which the reviewer does not build. The base's `template.sh` defines neither helper (both stand only in added lines of `git diff a1b314d`), which agrees with the quoted "command not found" lines.
- The first run of the existing eight cases on the unchanged tree ("PASS: template.sh scratch tests, 8 cases") was not rerun, for the same reason; the eight pass now and their functions are unchanged.
- A version part too large for bash's 64-bit arithmetic wraps without a message (`9223372036854775808 1` fails, `99999999999999999999 1` succeeds). The brief's 1.4 does not name this input and the builder's report lists it as not covered; whether a part of 19 digits or more is an input that has happened is the user's call.
- Whether "since the library gives none" (Steps 6) holds under a shellcheck version other than the one installed here: only the installed version was run.
- Whether the Steps 5 bullets that run past 20 words need their length: the builder's report names them with a reason each, and the prose standard's limit yields "unless the mechanism needs more", which is the user's or the orchestrator's read.
- What git ignores and the tree after staging: outside the three git commands a reviewer runs.

Reviewer usage: a69309a3c1d1e4eec, claude-fable-5-2, 137311 tokens, 11 tool uses, 3.3 minutes.

## Repair round 1, refuted

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/code/wizard/templates/template.test.sh 2>&1 | tail -3
ok: case_not_a_version
ok: case_by_hand
PASS: template.sh scratch tests, 12 cases

printf '%s\0' <the five files> | xargs -0 perl -CSD -ne '<the brief's command>'
printed nothing, charset exit 0

shellcheck skills/code/wizard/templates/template.sh
printed nothing, exit 0

bash -n skills/code/wizard/templates/template.sh
printed nothing, exit 0

python3 -c 'import yaml; ...'   (the brief's command)
987

git diff a1b314d -- skills/code/wizard/templates/template.sh | grep -c '^@@'
8

wc -l: SKILL.md 127, template.sh 330   (as the round's report quotes)

grep -n 'prints nothing' skills/code/wizard/templates/template.sh
218:# have TOOL succeeds when TOOL is installed, and prints nothing. Use it in the
252:# version MINIMUM or a later one, and prints nothing. Each is numbers joined by
```

The round's delta, `diff -u` snapshot against worktree over the six paths of `files.txt`: `docs/dev/building.md`, `docs/dev/scripts.md` and `template.test.sh` are unchanged. `template.sh` differs on line 17 only. `SKILL.md` differs in Steps 5 only. The ledger report gained its "Repair round 1" section. Every changed path is one the round's findings name or the builder's own report. The round's claims 1 to 3 each reproduce. No check was removed: the one clause dropped in `template.sh` line 17 is a wording fix, and the round did not touch the test file.

### Verdicts

Items of the brief's "What to build", for the whole diff since a1b314d:

- 1.1: holds, 8 hunks in `template.sh`, in the head comment, at old line 49, at old lines 64 to 66, at old line 134, in the block between `run_cmd` and `finish`, and the one `pause`. The round touched only a comment line.
- 1.2: holds, shellcheck prints nothing, exit 0.
- 1.3: holds, unchanged by the round.
- 1.4: holds, unchanged by the round; `case_version_equal_and_later`, `case_version_earlier` and `case_not_a_version` pass.
- 1.5: holds, unchanged by the round; `case_by_hand` passes.
- 1.6: holds, shellcheck prints nothing, exit 0.
- 1.7: holds, the head comment's Inputs list no longer carries "which prints nothing" on line 17, and the function's own comment says it (line 252).
- 1.8: holds, unchanged by the round.
- 2: holds, 12 cases pass; the test file is unchanged by the round.
- 3.1: holds, Steps 5, "End each stage on `pause`".
- 3.2: holds, Steps 5, the check bullet and the three bullets "When that tool is missing, ...", plus "Name each value left unread in the text given to `by_hand`."
- 3.3: holds, Steps 5, the `bash -c` bullet, the `say` bullet and the new bullet "Give `say` the same line in single quotes". This closes the first report's Spec 2.
- 3.4: holds, Steps 5, the bullet "Skip the commands of a stage that is already done ..." and the bullet "Ask for and write each value the stage reads outside that `if` ...". The orchestrator's ruling on "no second bullet beside it" is applied.
- 3.5: holds as the brief words it, Steps 1 and Steps 5. Spec 1 of the first report stands and is the user's open item, not part of this round.
- 3.6: holds, Steps 6.
- 3.7: holds, Steps 5's helper list and "The template".
- 3.8: holds, the description's length is 987 and `metadata.version` is unchanged.
- 4.1: holds, `docs/dev/building.md` and `docs/dev/scripts.md` are unchanged by the round.

Cases of the brief's "Cases":

- test, `version_at_least`, equal and later: met, `case_version_equal_and_later` passes.
- test, `version_at_least`, earlier: met, `case_version_earlier` passes.
- test, `version_at_least`, leading zeros: met, asserted in `case_version_equal_and_later`.
- test, `version_at_least`, not a version: met, `case_not_a_version` passes.
- test, `by_hand`: met, `case_by_hand` passes.
- run, shellcheck: met, prints nothing, exit 0.
- run, `bash -n`: met, prints nothing, exit 0.
- run, the diff of `template.sh`: met, 8 hunks in the places the case names.
- run, the existing eight cases: met, they pass inside the 12.
- read, `SKILL.md` against 3.1 to 3.8: met, with the Standards finding below on the length of two bullets.
- read, the head comment against 1.4 and 1.5: met.
- read, a shipped file names nothing private: met, the new bullets name nothing private.

### Findings

1. Spec: none.
2. Proof: none.
3. Standards:
   - `skills/code/wizard/SKILL.md`, Steps 5: "Give `say` the same line in single quotes, so that bash expands nothing in it and the person reads the line that will run." (24 words) and "When that tool is missing, read none of the stage's values, since a value that depends on the tool is not known yet." (23 words). What is wrong: both pass the roughly 20 words that `prose-standard.md`, "Sentence length" sets, and each carries a reason clause that is not needed to follow the rule. The round's report says only the bullet on values outside the `if` runs past 20 words, which the rerun does not reproduce. Failure scenario: none that mis-leads the builder of a wizard, since each reads as one requirement; the cost is a departure from the standard that the report did not name. Verdict: none.
   - `skills/code/wizard/SKILL.md`, Steps 5: "Ask for and write each value the stage reads outside that `if`, so that it is read whether or not the check skipped the commands." What is wrong: "that `if`" has its antecedent only in the bullet above it, so the bullet cannot be read alone, and it states "each value ... read whether or not the check skipped the commands" while the missing-tool bullet states "read none of the stage's values", with no sentence saying the second takes precedence when the tool is missing. Failure scenario: an agent writing a stage whose tool may be missing reads the values bullet as always, asks for the value outside the `if`, and has the person type a value the install has not made known yet. Verdict: none (3.2 and 3.4 each hold as written).
4. Behaviour: none.

### Declined to judge

- The round's report line "`grep -n 'prints nothing' skills/code/wizard/templates/template.sh` prints line 252": the command prints lines 218 and 252. No decision rests on it, so it is not a finding.
- Spec 1 of the first report, the version read outside `run_cmd` against ADR 0046: Open item A with the user, not part of this round.
- The first-run failures of the four new test functions on the unchanged tree: not rerun, as in the first report; they need a tree holding the new test beside the base's template.
- Whether a part of 19 digits or more is an input that has happened for `version_at_least`: the user's call, as in the first report.

Reviewer usage: a69d33b29fac68577, claude-sonnet-5-5, 83704 tokens, 6 tool uses, 0.8 minutes.

## Closed

- First run, Spec 1 (the version read outside `run_cmd`, against ADR 0046): raised as Open item A; ruled (a) by the user on 2026-11-23, carried out at landing in `SKILL.md` and ADR 0046.
- First run, Spec 2 and Standards 1 and 2: closed by the builder in repair round 1.
- Round 1, Standards, the two bullets past the sentence length: fixed at landing.
- Round 1, Standards, the values bullet against the missing-tool bullet: fixed at landing.

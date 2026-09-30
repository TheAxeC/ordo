# Step 2a refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/2f-2a, base 22878c5dc5d1e2c11ebe1a3e86cf158663bcc76e)

A page this report cites is named with its section. A finding in code keeps its `file:line`. All paths below are relative to the worktree unless absolute.

## Verification (rerun by the reviewer)

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md`, from the worktree's root, exit 0:

```
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
```

The verify list does not yet hold the new test (the brief leaves that to the landing), so these ten lines say nothing about `person-driven.test.sh`. The brief's checks 2 to 7 and the report's quoted commands, each run with the same `env -u` prefix:

```
check 2: sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
  PASS: person-driven.sh scratch tests        (the unfiltered run printed only that line, exit 0: no note: line; command -v dash gives /bin/dash, id -u gives 502)
check 3: LC_ALL=C grep -n '[^ -~]' <the five files>                     printed nothing, exit 1
         the same grep over docs/dev/change-standard.md and skills/diagnose/SKILL.md   printed nothing, exit 1
check 4: grep -n -A1 'git_guard.test.sh' docs/dev/building.md docs/dev/change-standard.md
  building.md:10 git_guard line, building.md-11 person-driven line; change-standard.md:71 git_guard line, change-standard.md-72 "sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1"
check 5: grep -n 'person-driven' skills/diagnose/SKILL.md      two lines, 198 and 208, each naming references/person-driven.md
         git diff --stat -- skills/diagnose/SKILL.md           skills/diagnose/SKILL.md | 4 ++--  /  1 file changed, 2 insertions(+), 2 deletions(-)
check 6: the python3 description-length command                 905
wc -l: person-driven.sh 109, person-driven.test.sh 335, references/person-driven.md 20
grep -c of a literal tab in the script and in the test: 0 and 0
grep -rn 'person-driven' skills docs README.md utils: hits only in the three new files, SKILL.md lines 198 and 208, building.md:11, change-standard.md:72
grep -n 'exit \|refuse ' person-driven.sh: exit 64 at 44 and 71, exit 1 at 60 and 66, refuse at 76, 82, 85, 92
git status --short:  M docs/dev/building.md,  M docs/dev/change-standard.md,  M skills/diagnose/SKILL.md,  A skills/diagnose/references/person-driven.md,  M skills/diagnose/templates/diagnosis.md,  A skills/diagnose/templates/person-driven.sh,  A skills/diagnose/templates/person-driven.test.sh, ?? .scratch/2-f-diagnose/agents/reviews/2a-report.md
```

The first run: a scratch copy of the test with no script beside it, each case alone (`sh person-driven.test.sh C<n>`), printed `FAIL: person-driven.sh does not exist at <path>/person-driven.sh` and exited 1 for each of C1 to C14, as the report says.

The builder's mutation table, each mutation applied to a scratch copy of the script beside a copy of the test under `$TMPDIR`, whole suite run, the last `FAIL:` line (the scratch path shortened to `<t>`). All fourteen reproduce:

```
C1  Observed: %s -> Observed:%s                      FAIL: C1 under sh: <t>/c1/obs differs from the expected text
C2  holds_text "$action" || continue removed         FAIL: C2: exit status 1, expected 0
C3  action text moved into the printf format         FAIL: C3: <t>/c3/obs differs from the expected text
C4  [ -f $actions ] unquoted                         FAIL: C4: exit status 64, expected 0
C5  input_ended "$n"                                 FAIL: C5: <t>/stderr differs from the expected text
C6  n=0; : >"$observations"                          FAIL: C6: <t>/c6/obs exists
C7  holds_text "$observed" && break -> break         FAIL: C7: <t>/stderr differs from the expected text
C8  || [ -n "$observed" ] removed                    FAIL: C8: exit status 1, expected 0
C9  || [ -L "$observations" ] removed                FAIL: C9, a link without a target: exit status 0, expected 64
C10 [ -f ] -> [ -e ]                                 FAIL: C10, a folder: exit status 1, expected 64
C11 -gt 0 -> -ge 0                                   FAIL: C11, an empty file: exit status 0, expected 64
C12 the folder check line removed                    FAIL: C12: exit status 1, expected 64
C13 exit 1 in append_pair -> :                       FAIL: C13: exit status 0, expected 1
C14 || [ -n "$action" ] removed                      FAIL: C14: missing [Action 2 of 2: last]
```

The reviewer's own mutations, same method. Those that the suite catches (the case that failed in brackets): closing message wording, its leading newline, closing message sent to standard error, the prompt text, a newline after the prompt, `of <m>` wrong on standard output, `>>` changed to `>` (all C1); the action read without `IFS=` or without `-r`, the observation read without `IFS=` or without `-r`, the action unquoted on standard output (all C3); the file touched before the first append (C6); `-e` removed, `-e` replaced by `-f`, `-e` replaced by `-d`, the text of the "exists" message, `refuse` exiting 1 (all C9); `-r` removed, `-f` removed, the "cannot read" text (C10); the "holds no action" text (C11); the folder check removed with the append exiting 64 (C12, `found [Action]`); the append's standard error not silenced, an append failure that goes on and exits 1 at the end (C13); the tab or the space taken out of the blank set, the count loop counting blank lines (C2); the count loop's no-newline guard removed (C14); the re-ask message on standard output or reworded (C7); the "input ended" text or its status (C5); a bash-only `[[ ]]` test (`FAIL: C1 under dash: exit status 64, expected 0`); the folder checks unquoted (C4). The whole suite with `run_script sh` replaced by `run_script dash` in a scratch copy printed `PASS: person-driven.sh scratch tests`.

Mutations that leave the suite green (`PASS: person-driven.sh scratch tests`, exit 0):

```
a. [ -e $observations ] || [ -L $observations ] unquoted (also with only the -L test unquoted)    Proof 1
b. [ -w "$folder" ] removed from the folder check                                                   Proof 2
c. the "exists" check moved before the actions-file checks; the folder check moved before the "exists" check   (order of the four refusals; each still refuses with exit 64, judged to cost nothing)
d. the pair written by two printf calls instead of one                                              (see Declined to judge)
e. usage exit status 1, usage text changed, "$#" -eq 2 changed to -ge 2                             (the brief rules that wrong argument counts have no case)
f. the count loop's read without -r, or without IFS=                                                (changes <m> only for an action line ending in a backslash; judged to cost nothing)
g. *) folder=. changed to a folder that does not exist; the line [ -n "$folder" ] || folder=/ removed   (a bare relative name or a path in / is then refused with exit 64; nothing typed is lost, judged to cost nothing)
```

Runs driven by the reviewer with standard input from a here-document or a pipe, on the script as built:

```
normal run, absolute paths, 2 actions                 exit 0, four lines in order, closing message
3 lines pasted at action 1 of 2                       exit 0, "wrote 2 of 2"; line 2 of the paste is the observation of action 2, line 3 is dropped    Behaviour 1
action and observation holding $(...), backquotes, ;, >, |, %s, %d, %n, \n, \c, quotes, !!   written byte for byte, no file created, exit 0
paths with spaces, relative ('a dir/my actions.txt')  exit 0, file written there
bare relative names                                    exit 0, file written in the folder the script was started in
paths starting with a dash (-actions -obs; -f -n; '!' -L; -e -e; under dash -f -d)   taken as file names; -e -e refused as existing (it is the actions file)
0, 1 and 3 arguments                                   the usage line on standard error, exit 64
observations argument ''                               action 1 shown, observation read, then "person-driven: cannot write the observations file ", exit 1    Behaviour 2
actions argument ''                                    "person-driven: cannot read the actions file ", exit 64
observations path ending in /, observations path in /  exit 64, cannot write
observations path a link to an existing file; the actions file named as the observations file   exit 64, exists; the actions file unchanged
blank line and spaces line, then end of input          two "type what you observed" lines, "the input ended after observation 0 of 2", exit 1, no file
CRLF actions file and CRLF input                       a line holding only a carriage return is an action ("Action 2 of 3: ") and is accepted as an observation; this follows the brief's definition (a character other than a space or a tab)
blanks and re-ask under dash                           as under sh
grep -c '^Observed: ' on the observations files        2 and 2, equal to the 2 actions, so the count the reference file asks for works on the file as written
```

The brief's premises reread on this tree: `wc -l skills/diagnose/SKILL.md` 237; `wc -l skills/land/templates/checks.test.sh` 77; `skills/land/templates/checks.sh:28` is the usage line; `ls docs/adr` gives `README.md` and `template.md`; `ls -d skills/*/references` gives `skills/diagnose/references` and `skills/grill/references`; the tab premise prints 1; the `read` premises print `[a]`, `[  a  ]` and `1 [partial]`; `[ -e ]` on a link without a target returns 1. The scratch folder under `$TMPDIR` is removed (`ls -d` on it: No such file or directory), and `cmp` of the worktree's script against the copy taken at the start printed no difference.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. 109 lines; the four refusals stand in the brief's order at `person-driven.sh:76`, `:82`, `:84`, `:92`; both reads of user text are `IFS= read -r` (`:96`, `:102`); the actions file is read on descriptor 3 (`:94`, `:96`); the pair is one `printf` with every text a `%s` argument (`:58`); the head comment lists the usage, the six error lines, the re-ask line and the statuses 0, 1 and 64, and `grep -n 'exit \|refuse '` shows no other.
- 2: holds. One function per case, `case_c1` to `case_c14`; the fourteen mutations reproduce. Proof 1, Proof 2 and Standards 2 are findings on the test that name no case.
- 3: violated, Standards 1. Every point of the brief's list is present, in 16 bullets; one of them is worded so that it contradicts another.
- 4: holds. Two lines changed, 198 and 208, each as the brief words it.
- 5: holds. Six lines added between the existing placeholder line and "Runs after the tightening".
- 6: holds. Both lines stand directly after the `git_guard.test.sh` line. Standards 3 is a finding on the comment's text.

Cases of the brief's "Cases":

- C1: met. `case_c1_with` compares the observations file and standard output whole, under `sh` and under `dash`; the `[[ ]]` mutation fails only the dash run.
- C2: met. Blank, two-space, two-tab and space-tab-space lines; `of 2` and four lines.
- C3: met. Both files compared whole; `ran` and `ran2` checked absent.
- C4: met.
- C5: met. Standard error compared whole, the file holds two lines.
- C6: met. The file is absent and the same command then exits 0.
- C7: met. Standard error holds exactly two re-ask lines; the file holds one `Observed:` line.
- C8: met.
- C9: met. Regular file (bytes compared with `cmp`), folder, link without a target (target absent); each of the three fails under a mutation of its own.
- C10: met. Missing, folder, `chmod 000`; the unreadable part ran, as user 502.
- C11: met. Empty, and blank lines only.
- C12: met.
- C13: met.
- C14: met.
- R1, R2: met. The removed lines of the diff of `skills/diagnose/SKILL.md` name no file and no command.
- R3: met. The diff of `diagnosis.md` only adds.
- R4: met. The diffs of `docs/dev/building.md` and `docs/dev/change-standard.md` each add the one line.

## 1. Spec

none.

## 2. Proof

1. `skills/diagnose/templates/person-driven.test.sh:151` (`case_c4`) and `:207` (`case_c9`), against `skills/diagnose/templates/person-driven.sh:84`: "if [ -e "$observations" ] || [ -L "$observations" ]; then"; what is wrong: no test runs the "exists" refusal on a path with a space. C9 uses `$d/obs`, and C4 uses a path with a space that does not exist. With the two tests unquoted (`[ -e $observations ] || [ -L $observations ]`) the suite prints `PASS: person-driven.sh scratch tests`; failure scenario: on that mutant, an observations file `<folder>/demo dir/obs file.txt` that holds an earlier run's two lines is not refused: the run prints `[: too many arguments` twice, shows the action, exits 0, and the file then holds the earlier pair followed by `Action 1: do it` and `Observed: new`. The script as built refuses the same input with exit 64 and leaves the file unchanged. The cost is the one C9 names, an earlier run's observations changed. No verdict named.
2. `skills/diagnose/templates/person-driven.test.sh:279` (`case_c12`), against `skills/diagnose/templates/person-driven.sh:92`: "[ -d "$folder" ] && [ -w "$folder" ] || refuse "cannot write the observations file $observations""; what is wrong: the brief's "What it must do" 2, fourth refusal, covers a folder that "does not exist or is not writable". C12 tests the missing folder only. With `[ -w "$folder" ]` removed the suite prints `PASS: person-driven.sh scratch tests`; failure scenario: on that mutant, an observations path in a folder with mode 555 shows `Action 1 of 1: do it`, reads the observation, then prints `cannot write the observations file` and exits 1, so the observation the person typed is lost. The script as built refuses the same input with exit 64 before any action. The cost is C12's. No verdict named.

## 3. Standards

1. `skills/diagnose/references/person-driven.md`, the bullet list, bullet 13 against bullet 7: "Fewer `Observed:` lines than actions is an unfinished run, which the skill runs again with a new observations file." and "The session never runs the script itself, since the script reads what the user types and the session has no terminal on its standard input."; what is wrong: the brief's point reads "an unfinished run, which is run again with a new observations file", with no actor. The file gives the actor as "the skill", which in this file is the same actor as "the session" ("The skill writes the actions file", "the skill counts", "the skill quotes"). The two bullets then say opposite things (`docs/dev/change-standard.md`, "The rules", rule 19), and one actor carries two names (prose standard, "D. Structure", no synonym cycling); failure scenario: a session that reads bullet 13 after an unfinished run starts the script itself. With no terminal it gets `the input ended after observation 0 of <m>`, or it feeds the script lines from a here-document and the record then quotes observations no person made; verdict: item 3 violated.
2. `skills/diagnose/templates/person-driven.test.sh:10`, `:313` to `:314` and `:331`: "# Input: sh <the diagnose skill's folder>/templates/person-driven.test.sh [C<n> ...]. With no argument every case runs, in order; with case names, only those run.", "cases='C1 C2 C3 C4 C5 C6 C7 C8 C9 C10 C11 C12 C13 C14'", "[ "$#" -eq 0 ] || cases=$*", "*) fail "unknown case $name" ;;"; what is wrong: the case-name arguments are a parameter no caller in the tree uses (`docs/dev/change-standard.md`, "The rules", rule 11): `docs/dev/building.md` and the command block of the change standard run the test with no argument, and `checks.test.sh`, `land.test.sh` and `check_config.test.sh` take none. The report lists it as a judgment call needed for the first run and the mutation runs. The reviewer's reruns show it is not needed: with no script every case fails on the same first line, and each of the fourteen mutations was reproduced with the whole suite and gave the named case's `FAIL:` line. The head comment also omits the error `FAIL: unknown case <name>` that the parameter adds (rule 14); failure scenario: a later case is added as a function and a row of the `case` table but not to the `cases=` string. The run with no argument never calls it and still prints `PASS: person-driven.sh scratch tests`. No verdict named.
3. `docs/dev/building.md`, the command block, the `person-driven.test.sh` line: "... a last line with no newline, each refusal, and an append that fails"; what is wrong: the script's head comment lists five refusals under exit 64, and the test runs four of them. The refusal on a number of arguments other than two has no case, by the brief's ruling, and the not-writable half of the fifth has none (Proof 2). "each refusal" is a sentence with an "each" that the file does not bear out (`docs/dev/change-standard.md`, "The rules", rule 14); failure scenario: a reader who changes the usage check, or the writable test, takes from this line that the test covers it and relies on a green run that does not. No verdict named.
4. `skills/diagnose/references/person-driven.md`, the bullet list, bullet 7: "The session never runs the script itself, since the script reads what the user types and the session has no terminal on its standard input."; what is wrong: `docs/dev/skill-layout.md`, "Writing for an agent", first bullet, asks that a rule written as a prohibition name the behaviour to do instead in the same bullet. The behaviour to do instead is in bullet 8; failure scenario: the reader meets a bare prohibition, the form that section says draws attention to what it forbids. No verdict named.
5. `skills/diagnose/references/person-driven.md`, the bullet list, bullet 10: "A longer output is saved by the user to a file, and the observation names that file."; what is wrong: passive voice with the actor named (prose standard, "E. Sentence shapes", passive voice). "The user saves a longer output to a file" states the same; failure scenario: none beyond the rule, which the prose standard judges per instance. No verdict named.

## 4. Behaviour

1. `skills/diagnose/templates/person-driven.sh:102`: "IFS= read -r observed || [ -n "$observed" ] || input_ended "$((n - 1))""; what is wrong: a pasted observation of several lines is taken as the observations of the following actions, and the report and the brief do not state it. The code follows the brief's "What it must do" 4; failure scenario: with two actions, three lines pasted at action 1 give `Observed: line one of a paste` for action 1 and `Observed: line two of a paste` for action 2, which the person never carried out. The third line is dropped, the script prints `wrote 2 of 2 actions` and exits 0. The count of `Observed:` lines that `references/person-driven.md` asks for equals the actions, so the skill reads the run as finished and the record quotes a run that did not happen. The only guard is "(one line)" in the prompt. Whether the script should detect this, or the reference file should tell the session to warn the user, is a ruling for the orchestrator. No verdict named.
2. `skills/diagnose/templates/person-driven.sh:87` to `:92`: "case $observations in", "*/*) folder=${observations%/*} ;;", "*) folder=. ;;"; what is wrong: an empty observations argument passes every refusal, since `[ -e "" ]` is false and the folder is taken as `.`. The brief and the report do not state it, and `docs/dev/change-standard.md`, "The rules", rule 15, names an empty value among the forms weighed; failure scenario: `sh person-driven.sh actions.txt ''` shows `Action 1 of 2`, reads the observation, then prints `person-driven: cannot write the observations file ` and exits 1. The observation typed is lost, where the brief's "What it must do" 2 refuses an unwritable observations file before any action. It needs a command whose second path expands to nothing; the reference file asks for absolute paths written out. No verdict named.

## Declined to judge

- The brief's "What it must do" 7, both lines of a pair in one `printf`: checked by reading `person-driven.sh:58` only. The mutation to two `printf` calls leaves the suite green, and a test would need a signal between the two writes, which the reviewer did not build.
- Who made the three new files appear as ` A` (intent to add) in `git status --short`. The report describes them as the new `references/` folder and two new scripts, which is how untracked files print. Adding them is a git command that changes state, which the change standard's "Where the work happens" forbids a builder. The reviewer cannot tell whether the builder or the orchestrator ran it. No decision rests on the report's description.
- The report's `sed -n 198p`, `sed -n 208p` and `grep` commands for R1 to R4 on the unchanged tree: not rerun, since the tree has changed and the reviewer's git is limited to `git diff <base>` and `git status --short`. The removed and added lines of the diff stand in for them.
- The name of the new observations file when an unfinished run `<n>` is run again: the reference file names the file of run `<n>` `observations-<n>.txt` and says nothing for the rerun, as the brief does. When the unfinished run wrote a file, the same name is refused with exit 64. This is the brief's text, the orchestrator's to rule.
- Whether `$tmp` of Steps 3 exists for a diagnosis run by a person outside a plan on the checkout itself, and whether Steps 4's "its output quoted in the record" fits a command whose output the session never sees. The brief states that this step changes neither Steps 3 nor Steps 4.
- Whether the command shown to the user should quote its paths. The reference file asks for absolute paths and says nothing about a path with a space, as the brief does; an unquoted path with a space gives three or more arguments and the usage line.
- A run at a real terminal: every run here had standard input from a here-document, a pipe or a file.
- The two skipped-part notes of the test (C10 as root, no `dash`): neither condition held on this machine, so neither note was seen printed.
- Sentence length in `references/person-driven.md` (the opening sentence and bullet 14 have 33 words each): the prose standard's limit is "roughly 20 words unless the mechanism needs more", and the reviewer did not rule on whether the mechanism needs them.
- ADRs: `docs/adr` holds `README.md` and `template.md` only, so none was read against the diff.

Reviewer usage: not available to the reviewer from inside its own session; 22 tool uses; minutes not measured.

## Repair round 1, refuted

Step 2a, worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/2f-2a`, base `22878c5dc5d1e2c11ebe1a3e86cf158663bcc76e`. All paths below are relative to the worktree unless absolute. Every command ran with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE` in front.

`sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md`, from the worktree's root, exit 0:

```
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
```

The verify list still does not hold the new test (the brief leaves that to the landing), so these lines say nothing about `person-driven.test.sh`. The brief's checks 2 to 7 and the commands the rewritten report quotes:

```
check 2: sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
  PASS: person-driven.sh scratch tests
  unfiltered: the same single line, exit 0, no note: line (command -v dash gives /bin/dash, id -u gives 502)
check 3: LC_ALL=C grep -n '[^ -~]' <the five files>        printed nothing, exit 1
         the same grep over docs/dev/change-standard.md and skills/diagnose/SKILL.md   printed nothing, exit 1
check 4: grep -n -A1 'git_guard.test.sh' docs/dev/building.md docs/dev/change-standard.md
  change-standard.md:71 git_guard line, change-standard.md-72 "sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1"
  building.md:10 git_guard line, building.md-11 the person-driven.test.sh line
check 5: grep -n 'person-driven' skills/diagnose/SKILL.md   lines 198 and 208, each naming references/person-driven.md
         git diff <base> --stat -- skills/diagnose/SKILL.md   skills/diagnose/SKILL.md | 4 ++--  /  1 file changed, 2 insertions(+), 2 deletions(-)
check 6: the python3 description-length command             905
wc -l: person-driven.sh 109, person-driven.test.sh 346, references/person-driven.md 21
grep -c '^- ' references/person-driven.md                   17
grep -n 'the skill' references/person-driven.md             nothing, exit 1
grep -n 'unknown case\|cases=\|\$#' person-driven.test.sh   nothing, exit 1
grep -c '^case_c[0-9]*() {' person-driven.test.sh           14
grep -n 'exit \|refuse ' person-driven.sh                   exit 64 at 44 and 71, exit 1 at 60 and 66, refuse at 76, 82, 85, 92
sed -n 36p person-driven.sh                                 "#       target; an observations path that is empty or whose folder is missing or not writable."
grep -n 'person-driven.test' docs/dev/building.md           line 11
grep -n 'order of the four refusals' <the report>           lines 155 and 186
grep -rn 'person-driven' skills docs README.md utils        hits only in the three new files, SKILL.md 198 and 208, building.md:11, change-standard.md:72
grep -c of a literal tab in the script and in the test      0 and 0
state file, "Open items"                                    none
git diff <base> --stat -- diagnosis.md docs                 diagnosis.md 6 +, building.md 1 +, change-standard.md 1 +
git status --short                                          M building.md, M change-standard.md, M SKILL.md, A references/person-driven.md, M diagnosis.md, A person-driven.sh, A person-driven.test.sh, ?? the report
git diff <base> -- . ':!.scratch' against 2a-round-1.diff   identical, 557 lines
```

Every line above equals what the report states.

The first run, reproduced: a scratch copy of the test with no script beside it and its final list of calls cut to one case, for each of C1 to C14, printed one line, `FAIL: person-driven.sh does not exist at <scratch>/f/person-driven.sh`, and exited 1.

The report's seventeen mutation rows, each applied to a scratch copy of the script beside a copy of the test under `$TMPDIR`, whole suite each time, exit 1 each time, the scratch path shortened to `<t>`. All seventeen reproduce:

```
1  C1   line 58  Observed: %s -> Observed:%s                     FAIL: C1 under sh: <t>/c1/obs differs from the expected text
2  C2   line 97  removed                                         FAIL: C2: exit status 1, expected 0
3  C3   line 58  action text moved into the printf format        FAIL: C3: <t>/c3/obs differs from the expected text
4  C4   line 76  [ -f $actions ] unquoted                        FAIL: C4: exit status 64, expected 0
5  C5   line 102 input_ended "$n"                                FAIL: C5: <t>/stderr differs from the expected text
6  C6   line 95  n=0; : >"$observations"                         FAIL: C6: <t>/c6/obs exists
7  C7   line 103 -> break                                        FAIL: C7: <t>/stderr differs from the expected text
8  C8   line 102 || [ -n "$observed" ] removed                   FAIL: C8: exit status 1, expected 0
9  C9   line 84  || [ -L "$observations" ] removed               FAIL: C9, a link without a target: exit status 0, expected 64
10 C9   line 84  both tests unquoted                             FAIL: C9, a regular file: exit status 0, expected 64
11 C10  line 76  [ -f ] -> [ -e ]                                FAIL: C10, a folder: exit status 1, expected 64
12 C11  line 82  -gt 0 -> -ge 0                                  FAIL: C11, an empty file: exit status 0, expected 64
13 C12  line 92  removed                                         FAIL: C12, a missing folder: exit status 1, expected 64
14 C12  line 92  && [ -w "$folder" ] removed                     FAIL: C12, a folder that is not writable: exit status 1, expected 64
15 C12  line 92  [ -n "$observations" ] && removed               FAIL: C12, an empty path: exit status 1, expected 64
16 C13  line 60  exit 1 -> :                                     FAIL: C13: exit status 0, expected 1
17 C14  line 96  || [ -n "$action" ] removed                     FAIL: C14: missing [Action 2 of 2: last]
```

The reviewer's own mutations, same method:

```
only the -e test of line 84 unquoted                   FAIL: C9, a regular file: exit status 0, expected 64
only the -L test of line 84 unquoted                   FAIL: C12, an empty path: <t>/stderr differs from the expected text
[ -w "$folder" ] -> [ -x "$folder" ]                   FAIL: C12, a folder that is not writable: exit status 1, expected 64
[ -w "$folder" ] -> [ -r "$folder" ]                   FAIL: C12, a folder that is not writable: exit status 1, expected 64
[ -w $folder ] unquoted; [ -d $folder ] unquoted       FAIL: C4: exit status 64, expected 0 (each)
[ -n "$observations" ] -> [ -n "$folder" ]             FAIL: C12, an empty path: exit status 1, expected 64
[ -n $observations ] unquoted                          FAIL: C4: exit status 64, expected 0
empty path refused with exit 1 instead of 64           FAIL: C12, an empty path: exit status 1, expected 64
empty-path message without its trailing space          FAIL: C12, an empty path: <t>/stderr differs from the expected text
line 92 moved to after the first "Action" print        FAIL: C12, a missing folder: found [Action]
line 92's refusal exiting 1                            FAIL: C12, a missing folder: exit status 1, expected 64
the path unquoted in the "exists" message              FAIL: C9, a regular file: <t>/stderr differs from the expected text
${observations%/*} -> ${observations%%/*}              FAIL: C1 under sh: exit status 64, expected 0
&& [ -d "$folder" ] removed from line 92               PASS: person-driven.sh scratch tests (the same refusals follow from -w on a missing folder; no input gives a different result)
```

The test's own behaviour, on scratch copies and with a private `TMPDIR`:

```
trap line made a no-op, run, ls -ld c12/readonly       drwxr-xr-x (the mode is back at 755 after the run); c12 holds actions, expected, in, readonly; nothing in readonly
mutation 14 with the real trap                          the FAIL: line above, exit 1, private TMPDIR empty afterwards (the scratch folder is removed when the 555 part fails)
an id that prints 0 first in PATH                       note: C10 with an unreadable file skipped, the test runs as root
                                                        note: C12 with a folder that is not writable skipped, the test runs as root
                                                        PASS: person-driven.sh scratch tests     exit 0, private TMPDIR empty
PATH of links to /bin and /usr/bin without dash         note: C1 under dash skipped, dash is not installed
                                                        PASS: person-driven.sh scratch tests     exit 0, private TMPDIR empty
both at once                                            the three note: lines, then PASS: as the last line (also through 2>&1 | tail -1), exit 0
the id that prints 0, with mutation 14                  the C12 note, then PASS: (the skipped part cannot catch the mutant, as the note says)
find $TMPDIR -maxdepth 1 -name 'person-driven-test.*' after all runs     0
```

The script driven by the reviewer, standard input from a pipe:

```
observations argument '' under sh and under dash, and as "$nothing"    "person-driven: cannot write the observations file " (trailing space), exit 64, nothing on standard output, no file created
observations path in a folder of mode 555, absolute                     "person-driven: cannot write the observations file <path>", exit 64, no Action text, folder empty
a bare name, started inside a folder of mode 555                        "person-driven: cannot write the observations file obs.txt", exit 64
an existing file at '<s>/a dir/obs file.txt'                            "... exists; name a new file", exit 64, cmp against a copy: no difference
a link without a target at '<s>/a dir/link obs'                         "... exists; name a new file", exit 64, target not created
the command as references/person-driven.md has it written: sh '<s>/a dir/person-driven.sh' '<s>/a dir/my actions.txt' '<s>/a dir/observations-1.txt', as one command line
                                                                        exit 0, four lines in order, grep -c '^Observed: ' gives 2 for 2 actions
the same command with no quotes                                         the usage line
one observation for two actions, then the same file name, then observations-2.txt
                                                                        exit 1 "the input ended after observation 1 of 2", 1 Observed: line; then exit 64 "exists"; then exit 0, 2 Observed: lines
three lines pasted at action 1 of 2                                     exit 0, line 2 is the observation of action 2, line 3 dropped (the script is unchanged here, as point 7 and the ruling on Behaviour 1 have it; the reference file now carries the instruction)
```

The round's seven points, each against the delta between `2a-round-0.diff` and `2a-round-1.diff`:

1. Made as ruled. `person-driven.test.sh:213` to `:219`: `mkdir "$d/a folder"`, `printf 'kept\n' >"$d/a folder/an obs.txt"`, the run on that path, and `cmp -s "$d/a folder/an obs.txt" "$d/copy" || fail "C9, a regular file: its bytes changed"`. Mutation row 10 fails it.
2. Made as ruled. `:289` to `:300`: the `id -u` test with `printf 'note: C12 with a folder that is not writable skipped, the test runs as root\n'`, else `chmod 555 "$d/readonly"`, the run, `chmod 755 "$d/readonly"` directly after the run and before any check that can fail, exit 64, the message compared whole, no `Action`. It also checks that `$d/readonly/obs` is absent, which the ruling does not name and which is the same refusal's "no file created". Mutation row 14 fails it.
3. Made as ruled. `person-driven.sh:92`: `[ -n "$observations" ] && [ -d "$folder" ] && [ -w "$folder" ] || refuse "cannot write the observations file $observations"`. `:36`: "an observations path that is empty or whose folder is missing or not writable". `person-driven.test.sh:302` to `:305` is the third part. Mutation row 15 fails it. These two are the only lines of the script the round changed.
4. Made as ruled. `person-driven.test.sh:11`: "Input: sh <the diagnose skill's folder>/templates/person-driven.test.sh, with no argument."; `:331` to `:344` are the fourteen calls; the `cases=` string, the `$#` line and the `case` table are gone (the grep above). The report's judgment call on the argument form is gone; its first judgment-call bullet now states that the test takes no argument.
5. Made as ruled. `docs/dev/building.md:11` holds "the refusals of an actions file it cannot read or that holds no action and of an observations file that exists or cannot be written", word for word. It matches what the test runs: C10, C11, C9 and C12.
6. Made as ruled, with one sentence left past the length the last sub-point sets (finding 1). Line 6 "The session writes the actions file"; lines 17, 18 and 20 name "the session"; line 5 keeps "the diagnose skill's folder". Line 11 joins the prohibition and what to do instead; line 12 "The session writes the command with the script's path and both files' paths absolute, each in single quotes."; line 18 "Fewer `Observed:` lines than actions is an unfinished run. The session asks the user to run the command again with a new observations file."; line 10 "Run `<n>` counts every run of the script, finished or not, so a run made again takes the next number."; line 15 "The user saves a longer output to a file, and the observation names that file."; line 14 is the new bullet, directly after "An observation is one line."; the opening is two sentences.
7. Held. The delta changes no line of the usage check (`:69` to `:72`), of the order of the refusals (`:76`, `:82`, `:84`, `:92`), of the count loop (`:79`) or of the pair's `printf` (`:58`), and adds no test for them.

No check was removed to close a finding, no change reaches beyond its point, and the delta holds no change that no point asks for: the other changed lines are the test's head comment (`:7` to `:9`, `:16` to `:17`) and the labels of C12's first part, which points 1 to 4 make necessary under rule 14.

### Verdicts

Items of the brief's "What to build":

- 1: holds. 109 lines; the refusals in the brief's order at `person-driven.sh:76`, `:82`, `:84`, `:92`; both reads of user text are `IFS= read -r` (`:96`, `:102`); descriptor 3 for the actions file (`:94`, `:96`); one `printf` per pair with each text a `%s` argument (`:58`); the head comment lists the usage, the six error lines, the re-ask line and the statuses 0, 1 and 64, and the grep of `exit` and `refuse` shows no other.
- 2: holds. `case_c1` to `case_c14`, called in order with no argument; the seventeen mutations reproduce. Finding 2 is on the head comment and names no case.
- 3: holds. A `#` title, an opening, 17 bullets; every point of the brief's list and every sub-point of the round's point 6 is present; line 8, which defines the observations file, is the definition the brief's decision 9 places in this file. Finding 1 is on one sentence's length.
- 4: holds. Lines 198 and 208, as the brief words them; the round did not touch them.
- 5: holds. Six lines added between the existing placeholder line and "Runs after the tightening".
- 6: holds. Both lines stand directly after the `git_guard.test.sh` line; the comment names the four refusals the test runs.

Cases:

- C1: met, observations file and standard output compared whole under `sh` and under `dash`.
- C2: met. C3: met. C4: met. C5: met. C6: met. C7: met. C8: met.
- C9: met. A regular file at a path whose folder and name each hold a space (bytes compared with `cmp`), a folder, a link without a target (target absent); rows 9 and 10 each fail a part of their own.
- C10: met, the unreadable part ran as user 502.
- C11: met.
- C12: met. Missing folder, folder of mode 555, empty path; rows 13, 14 and 15 each fail a part of their own.
- C13: met. C14: met.
- R1, R2: met, the removed lines of the diff of `skills/diagnose/SKILL.md` name no file and no command.
- R3: met, the diff of `diagnosis.md` only adds.
- R4: met, each of the two diffs adds the one line.

### Findings

Spec: none.

Proof: none.

Standards:

1. `skills/diagnose/references/person-driven.md`, the bullet list, bullet 7, second sentence: "The session has no terminal on its standard input, so it shows the user the whole command to paste into a terminal of their own."; what is wrong: the round's point 6, last sub-point, has any bullet of more than one main clause past the prose standard's length split into two sentences (prose standard, "E. Sentence shapes", sentence length: under roughly 20 words). This sentence has two main clauses joined by "so" and 25 words, counted with `perl` over the file; every other sentence of two main clauses in the file has 20 words or fewer. The report's Verify 6 says sentences were "split where they ran past the length "E" allows"; failure scenario: none beyond the rule, which the prose standard judges per instance; the bullet's meaning is what point 6 rules. No verdict named. Small and inside the brief, fixable at landing. Replacement for line 11: `- The session never runs the script itself, since the script reads what the user types and the session has no terminal on its standard input. It shows the user the whole command to paste into a terminal of their own.` This is the clause grouping point 6 words; its first sentence has 24 words and one main clause with its reason, and its second has 15.
2. `skills/diagnose/templates/person-driven.test.sh:8` to `:9`, the head comment: "# with no action; an observations file in a missing folder, in a folder that is not writable and" / "# named by an empty path; an append that fails during the run; and a last action with no newline."; what is wrong: "a folder that is not writable and named by an empty path" reads as one folder with two properties, where C12 has three separate parts, and the empty path names the observations file, not a folder (`docs/dev/change-standard.md`, "The rules", rule 14, a head comment reread against the file); failure scenario: a maintainer reading the head comment takes the mode-555 part and the empty-path part for one part, and on removing or skipping one believes the comment still describes the file. No verdict named. Small and inside the brief, fixable at landing. Replacement for line 8, line 9 unchanged: `# with no action; an observations file in a missing folder, in a folder that is not writable, or`

Behaviour: none.

### Declined to judge

- The pair written by one `printf` (`person-driven.sh:58`): read only. Point 7 rules that it has no test.
- A run at a real terminal: every run here had standard input from a pipe or a file.
- A real run as root and a real machine without `dash`: both were simulated, by an `id` that prints 0 placed first in `PATH` and by a `PATH` of links without `dash`. The three notes and the last line were seen under the simulation only.
- A signal arriving between `chmod 555` and `chmod 755` in C12 (`person-driven.test.sh:293` to `:295`): not run. The folder is empty at that point, so the trap's `rm -rf` needs write access to its parent only; that reading was not exercised.
- A path that itself holds a single quote, under "each in single quotes" (reference file, bullet 8): the wording is point 6's, and the orchestrator's to rule. A folder name such as `o'brien` in the skill's path would end the quoting early.
- "then the observations file read by the skill" in the Stops row (`skills/diagnose/SKILL.md:208`) beside "the session" in the reference file: the brief dictates that cell's text and point 6 limits the change of name to the reference file. `SKILL.md` itself names "the skill" as the actor at lines 97, 114 and 115 and "the session" four times. The report states it as a judgment call. It is the orchestrator's call.
- The sentences of the reference file that pass 20 words with one main clause: bullet 15 (32 words), bullet 16 (26), bullet 10 first sentence (22), bullet 12 (22), bullet 13 (21). Point 6 asks for a split only where there is more than one main clause; whether the mechanism needs these lengths was not ruled by the reviewer.
- The name of the actions file: the reference file gives none, as the brief gives none.
- The report's `sed -n 198p`, `sed -n 208p` and `grep` commands for R1 to R4 on the unchanged tree: not rerun, since the reviewer's git is limited to `git diff <base>` and `git status --short`. The removed and added lines of the diff stand in for them.
- Who ran the intent-to-add that makes the three new files print as ` A`: not visible to the reviewer.
- ADRs: `docs/adr` was not reread this round; the first review found `README.md` and `template.md` only, and the delta touches no file there.

The scratch folders made under `$TMPDIR` are removed (`find $TMPDIR -maxdepth 1 -name 'person-driven-test.*' -o -name 'refute-2a*'` counts 0), and `git status --short` in the worktree prints the same eight lines as at the start.

Reviewer usage: claude-opus-5-5 (ordo-high), 165136 tokens, 25 tool uses, 6.7 minutes ($1.02 to $3.79), from its completion notice.

## Closed

- Proof 1 and 2, Standards 1 to 5, Behaviour 1 and 2 of the first run: closed by repair round 1 (`agents/briefs/2a-round-1.md`, points 1 to 6), each reproduced by the reviewer over the round; point 7 rules what has no test.
- Round 1, Standards 1 (the bullet on who runs the script): fixed at landing with the reviewer's wording.
- Round 1, Standards 2 (the test's head comment on the empty path): fixed at landing with the reviewer's wording.
- Round 1, declined, a path that holds a single quote: fixed at landing, the reference file says how it is written.
- Round 1, declined, the sentences past 20 words with one main clause, and "the skill" in the Stops row of `SKILL.md`: read by the orchestrator and left, each for the reason the booking of step 2a gives.
- Round 1, the other declined points (a real terminal, a real run as root, a signal during C12, the name of the actions file): no change; each is outside what the brief asks.

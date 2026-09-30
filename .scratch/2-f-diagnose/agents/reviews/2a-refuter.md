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


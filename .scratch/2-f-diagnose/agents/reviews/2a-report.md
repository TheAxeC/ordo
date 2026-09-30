Everything in the brief is done.

## Open items of the state file

`.scratch/2-f-diagnose/orchestrator-state.md`, section "Open items": `none`.

## The cases' first run, on the unchanged tree

The unchanged tree has no `skills/diagnose/templates/person-driven.sh` (`ls skills/diagnose/templates` printed `diagnosis.md` and, after I wrote the test, `person-driven.test.sh`). The test takes case names as arguments, so each case ran alone with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/diagnose/templates/person-driven.test.sh <case>`. Each of C1 to C14 printed this line and exited 1:

```
FAIL: person-driven.sh does not exist at /Users/axelfaes/workspace/ordo/.agents/worktrees/2f-2a/skills/diagnose/templates/person-driven.sh
```

| Case | Result on the unchanged tree |
|---|---|
| C1 | fails, line above |
| C2 | fails, line above |
| C3 | fails, line above |
| C4 | fails, line above |
| C5 | fails, line above |
| C6 | fails, line above |
| C7 | fails, line above |
| C8 | fails, line above |
| C9 | fails, line above |
| C10 | fails, line above |
| C11 | fails, line above |
| C12 | fails, line above |
| C13 | fails, line above |
| C14 | fails, line above |
| R1 | holds as the brief says: `sed -n 198p skills/diagnose/SKILL.md` prints item 11 with "a script that prints each action ..." and `grep -c 'person-driven\|references/' skills/diagnose/SKILL.md` prints `0` |
| R2 | holds: `sed -n 208p skills/diagnose/SKILL.md` prints the row with the cells "The script that prints each action for the user to take" and "The user's actions and what they observed, read back by the script"; no file and no command |
| R3 | holds: `grep -n -i 'observ\|person' skills/diagnose/templates/diagnosis.md` prints only line 60, "none, no person present"; no place for the observations |
| R4 | holds: `grep -n 'person-driven' docs/dev/building.md docs/dev/change-standard.md` prints nothing (exit 1) |

No case is one the brief's rules get wrong, and the brief and the tree agree: line numbers 198 and 208, the 237 lines of `SKILL.md`, the three code blocks and the placeholder line of `diagnosis.md`, the ten commands of `docs/dev/building.md` lines 6 to 15 and of `docs/dev/change-standard.md` lines 66 to 77 all match. Rulings of the orchestrator on cases: none needed.

## DONE / NOT DONE

| Item | Status | Command that proves it, and its output |
|---|---|---|
| What to build 1: `person-driven.sh` | DONE | `wc -l skills/diagnose/templates/person-driven.sh` prints `109`; the test below passes on it |
| What to build 2: `person-driven.test.sh`, one case per C1 to C14 | DONE | the mutation table below; `sh skills/diagnose/templates/person-driven.test.sh 2>&1 \| tail -1` prints `PASS: person-driven.sh scratch tests` |
| What to build 3: `skills/diagnose/references/person-driven.md` | DONE | `wc -l` prints `20`; it opens with a `#` title and one sentence, then 16 bullets, one for each point of "What to build" 3 (the actions file, its lines, the observations file, the two files' place, the file name for run `<n>`, the session never runs the script, the command shown with absolute paths, an observation is one line, a longer output goes to a file, the red stated in the record before the run, the count against the actions, an unfinished run, one run per run of the steps, the whole file quoted before Steps 22, the exit statuses left to the head comment) |
| What to build 4: two places of `SKILL.md` | DONE | `git diff --stat -- skills/diagnose/SKILL.md` prints ` skills/diagnose/SKILL.md \| 4 ++--` and ` 1 file changed, 2 insertions(+), 2 deletions(-)`; `grep -n 'person-driven' skills/diagnose/SKILL.md` prints the two lines quoted under check 5 |
| What to build 5: placeholder and code block in `diagnosis.md` | DONE | `git diff -- skills/diagnose/templates/diagnosis.md` adds 6 lines between the placeholder line beginning `<for a symptom seen only sometimes:` and `Runs after the tightening, with the output of each quoted:` |
| What to build 6: the two command blocks | DONE | check 4 below |
| Verify 1: the plan's verify list | DONE | quoted below |
| Verify 2: the test | DONE | quoted below |
| Verify 3: ASCII grep | DONE | quoted below |
| Verify 4: the two blocks | DONE | quoted below |
| Verify 5: `SKILL.md` | DONE | quoted below |
| Verify 6: reading and description length | DONE | quoted below |
| Verify 7: the mutation table and the test run again | DONE | the table below and the run after it |

### Verify 1

`sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md` from the worktree's root, with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`, exit status 0, printed:

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

### Verify 2

`sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1` (both pipeline statuses 0):

```
PASS: person-driven.sh scratch tests
```

The run printed no `note:` line, so `dash` was installed (`/bin/dash`) and C1 ran under it, and C10's unreadable file ran because the test ran as user 502, not root.

### Verify 3

`LC_ALL=C grep -n '[^ -~]' skills/diagnose/templates/person-driven.sh skills/diagnose/templates/person-driven.test.sh skills/diagnose/references/person-driven.md skills/diagnose/templates/diagnosis.md docs/dev/building.md` printed nothing (exit 1). The same grep over `docs/dev/change-standard.md` and `skills/diagnose/SKILL.md` printed nothing (exit 1).

### Verify 4

`grep -n -A1 'git_guard.test.sh' docs/dev/building.md docs/dev/change-standard.md` (the `#` comment lines cut at 150 characters by `cut -c1-150` in my run; the full comment of the new line is in the diff under "Every user-visible change"):

```
docs/dev/building.md:10:sh skills/repo-setup/templates/hooks/git_guard.test.sh  # git_guard.py on the commands it must block (push, reset --hard, clea
docs/dev/building.md-11-sh skills/diagnose/templates/person-driven.test.sh    # person-driven.sh on scratch actions and input files: a complete run, a
docs/dev/change-standard.md:71:sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
docs/dev/change-standard.md-72-sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
```

### Verify 5

`grep -n 'person-driven' skills/diagnose/SKILL.md`:

```
198:11. For a symptom only a person can trigger, the script `templates/person-driven.sh`, which prints each action for the user to take and reads back what they observed, used as `references/person-driven.md` states; this way is the stop "A red command a person drives".
208:| A red command a person drives | Run by a person, when only a person can trigger the symptom | The actions file and the command for the user to run, as `references/person-driven.md` gives it | The user's word that the script has ended, then the observations file read by the skill |
```

`git diff --stat -- skills/diagnose/SKILL.md`:

```
 skills/diagnose/SKILL.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
```

Two lines of the file changed (line 198 and line 208); git's stat counts each as one deletion and one insertion.

### Verify 6

`python3 -c 'import yaml; print(len(yaml.safe_load(open("skills/diagnose/SKILL.md").read().split("---")[1])["description"]))'` printed:

```
905
```

Reading: I reread every sentence of `references/person-driven.md`, the two changed places of `SKILL.md` and the new placeholder line of `diagnosis.md` against the prose standard (its section 0 and A to F, "E. Sentence shapes" included) and against `docs/dev/skill-layout.md` ("Lists and tables", "Writing for an agent", "Paths and names"): one rule per bullet, no em dash, no hard wrap, ASCII only, the file of `references/` named `references/<file>`, "red command", "diagnosis record" (as "the record") and "case" used in their glossary senses only, "actions file" and "observations file" used every time as the two names. All 16 bullets of "What to build" 3 are present.

## The mutation table (rule 13, fourth bullet)

Each mutation was made on a scratch copy of the finished `person-driven.sh` beside a copy of the test, under `$TMPDIR`; the finished script in the worktree is unchanged by the runs. Each row is one line of the script changed or removed, and the `FAIL:` line is the last line the test printed for that mutation (exit status 1 each time).

| Behaviour | Case | Mutation | `FAIL:` line printed |
|---|---|---|---|
| A complete run writes the six lines in order and prints the actions and the closing message | C1 | line 58: `Observed: %s` changed to `Observed:%s` | `FAIL: C1 under sh: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//person-driven-test.sfUqZe/c1/obs differs from the expected text` |
| Blank lines and lines of spaces or tabs are no action | C2 | line 97, `holds_text "$action" \|\| continue`, removed | `FAIL: C2: exit status 1, expected 0` |
| Supplied text is written byte for byte and never expanded or run | C3 | line 58: the `printf` format `'Action %s: %s\nObserved: %s\n' "$1" "$2" "$3"` changed to `"Action $1: $2\nObserved: %s\n" "$3"`, so the action text is part of the format | `FAIL: C3: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//person-driven-test.Ec1boI/c3/obs differs from the expected text` |
| Paths with a space are file names | C4 | line 76: `[ -f "$actions" ]` changed to `[ -f $actions ]` | `FAIL: C4: exit status 64, expected 0` |
| Input that ends early keeps the pairs typed and reports how many | C5 | line 102: `input_ended "$((n - 1))"` changed to `input_ended "$n"` | `FAIL: C5: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//person-driven-test.Z7ByyL/stderr differs from the expected text` |
| Input that ends before the first observation leaves no observations file | C6 | line 95: `n=0` changed to `n=0; : >"$observations"` | `FAIL: C6: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//person-driven-test.xA2hEU/c6/obs exists` |
| A blank observation is asked for again | C7 | line 103: `holds_text "$observed" && break` changed to `break` | `FAIL: C7: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//person-driven-test.ziIOuu/stderr differs from the expected text` |
| A last line of input with no newline is the observation | C8 | line 102: `\|\| [ -n "$observed" ]` removed | `FAIL: C8: exit status 1, expected 0` |
| An existing observations path is refused, a link without a target included | C9 | line 84: `\|\| [ -L "$observations" ]` removed | `FAIL: C9, a link without a target: exit status 0, expected 64` |
| An actions file that is not a readable regular file is refused | C10 | line 76: `[ -f "$actions" ]` changed to `[ -e "$actions" ]` | `FAIL: C10, a folder: exit status 1, expected 64` |
| An actions file with no action is refused | C11 | line 82: `[ "$total" -gt 0 ]` changed to `[ "$total" -ge 0 ]` | `FAIL: C11, an empty file: exit status 0, expected 64` |
| An observations file in a missing folder is refused before an action is shown | C12 | line 92, the `[ -d "$folder" ] && [ -w "$folder" ] \|\| refuse ...` line, removed | `FAIL: C12: exit status 1, expected 64` |
| An append that fails ends the run at once | C13 | line 60: `exit 1` in `append_pair` changed to `:` | `FAIL: C13: exit status 0, expected 1` |
| A last action with no newline is shown | C14 | line 96: `\|\| [ -n "$action" ]` removed | `FAIL: C14: missing [Action 2 of 2: last]` |

After the last mutation, check 2 was run again on the finished files:

```
PASS: person-driven.sh scratch tests
```

## Files changed

| File | Lines |
|---|---|
| `skills/diagnose/templates/person-driven.sh` (new) | 109 |
| `skills/diagnose/templates/person-driven.test.sh` (new) | 335 |
| `skills/diagnose/references/person-driven.md` (new) | 20 |
| `skills/diagnose/SKILL.md` | 2 lines changed (4 in the stat: 2 insertions, 2 deletions) |
| `skills/diagnose/templates/diagnosis.md` | 6 added |
| `docs/dev/building.md` | 1 added |
| `docs/dev/change-standard.md` | 1 added |
| `.scratch/2-f-diagnose/agents/reviews/2a-report.md` (this report) | new |

`git status --short` shows the four modified files, the new `skills/diagnose/references/` folder and the two new scripts; nothing else.

## Judgment calls

- The test takes case names as arguments (`sh person-driven.test.sh C5 C9`), and runs every case with none. The brief asks for the first run of each case on the unchanged tree and for a `FAIL:` line per mutation, and a test that stops at its first failure gives one case per run without it. The head comment of the test states the form.
- The test's helper fails first with `person-driven.sh does not exist at <path>` when the script is missing, so the first-run line names the one reason every case fails.
- `append_pair` runs its `printf` inside a group with standard error sent to `/dev/null`, so that the shell's own redirection error does not add a second line to the one `person-driven: cannot write the observations file <path>` line that the brief dictates for C13; C13 compares standard error whole.
- "Each path reaches only a redirection or a `[` test" (item 9) is read as the rule for how a path is used in the code. The path also appears as an argument of `%s` in the messages, as the dictated messages contain it, and the folder is taken with `${observations%/*}` so that no command receives a path.
- The closing message and the usage line use the words the brief dictates; the usage line is a double-quoted `printf` format because it holds an apostrophe.
- The state file's verify list holds ten commands and does not yet hold the new test, as the brief says the orchestrator adds it at landing, so `checks: 10 commands passed` does not include `person-driven.test.sh`; that test's own result is verify 2 above.

## Every user-visible change, before and after

- `skills/diagnose/SKILL.md` item 11 of "Ways to build a red command".
  - Before: `11. For a symptom only a person can trigger, a script that prints each action for the user to take and reads back what they observed, which is the stop "A red command a person drives".`
  - After: line 198 as quoted under Verify 5.
- `skills/diagnose/SKILL.md` Stops row "A red command a person drives".
  - Before: `| A red command a person drives | Run by a person, when only a person can trigger the symptom | The script that prints each action for the user to take | The user's actions and what they observed, read back by the script |`
  - After: line 208 as quoted under Verify 5.
- `skills/diagnose/templates/diagnosis.md`, section "Red command", between the placeholder line beginning `<for a symptom seen only sometimes:` and `Runs after the tightening`, added:

  ```
  <for a red command a person drives: the observations file of each run quoted whole, and which observation is the red>

  ```
  <the observations file of each run>
  ```
  ```

  Before, the section had no place for the actions a person took and what they observed.
- `docs/dev/building.md` line 11, added after the `git_guard.test.sh` line: `sh skills/diagnose/templates/person-driven.test.sh    # person-driven.sh on scratch actions and input files: a complete run, also under dash, blank lines in the actions file, format characters, backslashes and shell syntax in the text, paths with a space, input that ends early, a blank observation asked for again, a last line with no newline, each refusal, and an append that fails`. Before, the block held ten commands and no line for this test.
- `docs/dev/change-standard.md` line 72, added after the `git_guard.test.sh` line: `sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1`. Before, the block held ten commands and no line for this test.
- New: `skills/diagnose/templates/person-driven.sh`, `skills/diagnose/templates/person-driven.test.sh` and `skills/diagnose/references/person-driven.md`.

Rule 14, the grep of the names the change adds: `grep -rn 'person-driven' skills docs README.md utils` prints hits only in the three new files, the two changed places of `SKILL.md`, and the two command blocks; `grep -rn 'diagnose/templates\|diagnose/references\|diagnosis.md' skills docs README.md utils .agents` shows no other page that lists the files of the `diagnose` skill or counts the tests. The sentences about a whole file: the head comment of `person-driven.sh` lists the usage, the standard output, the files it reads and writes, the six error lines and the exit statuses 0, 1 and 64, and the code holds exactly those (`grep -n 'exit \|refuse ' skills/diagnose/templates/person-driven.sh`); the head comment of the test lists the cases C1 to C14 and the argument form, and the file holds `case_c1` to `case_c14`.

## Anything in the brief that was wrong or impossible

Nothing found. The tree matched every fact of "What is on the tree", and each case's rule produced the result its case states when the finished script ran under `sh` (bash 3.2 in POSIX mode) and, for C1, under `dash`.

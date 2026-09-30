Everything in the brief is done, and every point of round 1 is done.

## Open items of the state file

`.scratch/2-f-diagnose/orchestrator-state.md`, section "Open items": `none`.

## The cases' first run, on the unchanged tree

The unchanged tree has no `skills/diagnose/templates/person-driven.sh`. The test takes no argument, so each case ran alone from a scratch copy of the finished test, with no script beside it and its final list of calls holding that one case, with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <copy>`. Each of C1 to C14 printed one line and exited 1: `FAIL: person-driven.sh does not exist at <the scratch folder>/person-driven.sh`, the scratch folder being `/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/first.<six characters>`. The six characters were vEXs9x for C1, x0Gah9 for C2, hdHBTu for C3, D4QNWi for C4, h7UOGy for C5, Ha6FGj for C6, RAz3ML for C7, sAhAOq for C8, Dfc0hf for C9, HJGKAc for C10, akVKUZ for C11, xtbSFa for C12, 496vuf for C13 and hBOmft for C14.

| Case | Result on the unchanged tree |
|---|---|
| C1 to C14 | each fails with the line above |
| R1 | holds as the brief says: `sed -n 198p skills/diagnose/SKILL.md` printed item 11 as "a script that prints each action ..." on the tree before the change, and `grep -c 'person-driven\|references/'` on that text printed `0` |
| R2 | holds: line 208 of the unchanged `SKILL.md` was the row with "The script that prints each action for the user to take" and "The user's actions and what they observed, read back by the script"; no file and no command |
| R3 | holds: `grep -n -i 'observ\|person' skills/diagnose/templates/diagnosis.md` on the unchanged file printed only line 60, "none, no person present" |
| R4 | holds: `grep -n 'person-driven' docs/dev/building.md docs/dev/change-standard.md` on the unchanged files printed nothing (exit 1) |

No case is one the brief's rules get wrong, and the brief and the tree agree (line numbers 198 and 208, the 237 lines of `SKILL.md`, the three code blocks and the placeholder of `diagnosis.md`, the ten commands of both command blocks). Rulings of the orchestrator on cases: none needed.

## DONE / NOT DONE

| Item | Status | Proof |
|---|---|---|
| What to build 1: `person-driven.sh` | DONE | `wc -l` prints `109` (at most 120); the test passes on it |
| What to build 2: `person-driven.test.sh`, one case per C1 to C14 | DONE | the mutation table; `sh skills/diagnose/templates/person-driven.test.sh 2>&1 \| tail -1` prints `PASS: person-driven.sh scratch tests` |
| What to build 3: `references/person-driven.md` | DONE | `wc -l` prints `21`: a `#` title, an opening of two sentences, 17 bullets, one rule each, covering every point of "What to build" 3 |
| What to build 4: two places of `SKILL.md` | DONE | `git diff --stat -- skills/diagnose/SKILL.md` prints ` skills/diagnose/SKILL.md \| 4 ++--` and ` 1 file changed, 2 insertions(+), 2 deletions(-)`; the two lines under Verify 5 |
| What to build 5: placeholder and code block in `diagnosis.md` | DONE | `git diff` adds 6 lines between the placeholder beginning `<for a symptom seen only sometimes:` and `Runs after the tightening, with the output of each quoted:` |
| What to build 6: the two command blocks | DONE | Verify 4 |
| Verify 1 to 7 | DONE | quoted below |

### Verify 1

`sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md`, run with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`, exit 0:

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

`sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1`:

```
PASS: person-driven.sh scratch tests
```

The same command without the `tail` filter printed only that line and exited 0, so no `note:` line was printed and `dash` (`/bin/dash`) was installed and C1 ran under it, and C10's unreadable file and C12's folder of mode 555 ran because the user is 502, not root.

### Verify 3

`LC_ALL=C grep -n '[^ -~]' skills/diagnose/templates/person-driven.sh skills/diagnose/templates/person-driven.test.sh skills/diagnose/references/person-driven.md skills/diagnose/templates/diagnosis.md docs/dev/building.md` printed nothing and `grep exit 1`.

### Verify 4

`grep -n -A1 'git_guard.test.sh' docs/dev/change-standard.md`:

```
71:sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
72-sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1
```

`grep -n -A1 'git_guard.test.sh' docs/dev/building.md` prints line 10, the `git_guard.test.sh` line, and line 11, the `person-driven.test.sh` line, whose full text is under "Every user-visible change".

### Verify 5

`grep -n 'person-driven' skills/diagnose/SKILL.md` prints lines 198 and 208, whose full text is under "Every user-visible change", each naming `references/person-driven.md`. `git diff --stat -- skills/diagnose/SKILL.md`:

```
 skills/diagnose/SKILL.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
```

Two lines of the file changed (198 and 208); git's stat counts each as one deletion and one insertion.

### Verify 6

The `python3 -c 'import yaml; ...'` command printed `905`.

Reading: every sentence of `references/person-driven.md`, of the two changed places of `SKILL.md` and of the new placeholder line of `diagnosis.md` was reread against the prose standard (section 0 and A to F, "E. Sentence shapes" included) and `docs/dev/skill-layout.md`: one rule per bullet, sentences split where they ran past the length "E" allows, active voice, no em dash, no hard wrap, ASCII only, `references/<file>` naming, "red command", "diagnosis record" (as "the record") and "case" only in their glossary senses, "actions file" and "observations file" used every time as the two names, and the actor of a run named "the session" throughout the reference file (`grep -n 'the skill' skills/diagnose/references/person-driven.md` prints nothing). Every point of "What to build" 3 is present.

### Verify 7

The mutation table follows. After the last mutation, `sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1` on the finished files printed `PASS: person-driven.sh scratch tests`.

## The mutation table (rule 13, fourth bullet)

Each mutation was made on a scratch copy of the finished `person-driven.sh` beside a copy of the test under `$TMPDIR`, and the whole suite ran on it with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh <copy of the test>`; the finished script in the worktree is unchanged by the runs. Each row is one line of the script changed or removed, and the `FAIL:` line is the last line the suite printed for it (exit 1 each time). The scratch folder name in a line is a random name.

| Behaviour | Case | Mutation | `FAIL:` line printed |
|---|---|---|---|
| A complete run writes the six lines in order and prints the actions and the closing message | C1 | line 58: `Observed: %s` changed to `Observed:%s` | `FAIL: C1 under sh: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//person-driven-test.U4h1r2/c1/obs differs from the expected text` |
| Blank lines and lines of spaces or tabs are no action | C2 | line 97, `holds_text "$action" \|\| continue`, removed | `FAIL: C2: exit status 1, expected 0` |
| Supplied text is written byte for byte and never expanded or run | C3 | line 58: the `printf` format `'Action %s: %s\nObserved: %s\n' "$1" "$2" "$3"` changed to `"Action $1: $2\nObserved: %s\n" "$3"`, so the action text is part of the format | `FAIL: C3: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//person-driven-test.gihVUY/c3/obs differs from the expected text` |
| Paths with a space are file names | C4 | line 76: `[ -f "$actions" ]` changed to `[ -f $actions ]` | `FAIL: C4: exit status 64, expected 0` |
| Input that ends early keeps the pairs typed and reports how many | C5 | line 102: `input_ended "$((n - 1))"` changed to `input_ended "$n"` | `FAIL: C5: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//person-driven-test.LtQJHu/stderr differs from the expected text` |
| Input that ends before the first observation leaves no observations file | C6 | line 95: `n=0` changed to `n=0; : >"$observations"` | `FAIL: C6: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//person-driven-test.MuuocT/c6/obs exists` |
| A blank observation is asked for again | C7 | line 103: `holds_text "$observed" && break` changed to `break` | `FAIL: C7: /var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T//person-driven-test.xlJ0Y5/stderr differs from the expected text` |
| A last line of input with no newline is the observation | C8 | line 102: `\|\| [ -n "$observed" ]` removed | `FAIL: C8: exit status 1, expected 0` |
| An existing observations path is refused, a link without a target included | C9 | line 84: `\|\| [ -L "$observations" ]` removed | `FAIL: C9, a link without a target: exit status 0, expected 64` |
| An existing observations file whose path holds a space is refused and its bytes kept | C9 (regular file, path with a space) | line 84: the two tests unquoted, `if [ -e $observations ] \|\| [ -L $observations ]; then` | `FAIL: C9, a regular file: exit status 0, expected 64` |
| An actions file that is not a readable regular file is refused | C10 | line 76: `[ -f "$actions" ]` changed to `[ -e "$actions" ]` | `FAIL: C10, a folder: exit status 1, expected 64` |
| An actions file with no action is refused | C11 | line 82: `[ "$total" -gt 0 ]` changed to `[ "$total" -ge 0 ]` | `FAIL: C11, an empty file: exit status 0, expected 64` |
| An observations file in a missing folder is refused before an action is shown | C12 (missing folder) | line 92, the `[ -n "$observations" ] && [ -d "$folder" ] && [ -w "$folder" ] \|\| refuse ...` line, removed | `FAIL: C12, a missing folder: exit status 1, expected 64` |
| An observations file in a folder that is not writable is refused before an action is shown | C12 (folder of mode 555) | line 92: `&& [ -w "$folder" ]` removed | `FAIL: C12, a folder that is not writable: exit status 1, expected 64` |
| An empty observations path is refused before an action is shown | C12 (empty path) | line 92: `[ -n "$observations" ] &&` removed | `FAIL: C12, an empty path: exit status 1, expected 64` |
| An append that fails ends the run at once | C13 | line 60: `exit 1` in `append_pair` changed to `:` | `FAIL: C13: exit status 0, expected 1` |
| A last action with no newline is shown | C14 | line 96: `\|\| [ -n "$action" ]` removed | `FAIL: C14: missing [Action 2 of 2: last]` |

## Files changed

| File | Lines |
|---|---|
| `skills/diagnose/templates/person-driven.sh` (new) | 109 |
| `skills/diagnose/templates/person-driven.test.sh` (new) | 346 |
| `skills/diagnose/references/person-driven.md` (new) | 21 |
| `skills/diagnose/SKILL.md` | 2 lines changed (2 insertions, 2 deletions in the stat) |
| `skills/diagnose/templates/diagnosis.md` | 6 added |
| `docs/dev/building.md` | 1 added |
| `docs/dev/change-standard.md` | 1 added |
| `.scratch/2-f-diagnose/agents/reviews/2a-report.md` | this report |

`git status --short` shows the four modified files, the three new files of the step (listed with `A`) and this report; nothing else.

## Judgment calls

- The test takes no argument and calls `case_c1` to `case_c14` one after another at the end of the file, as the other tests run every case. The first run of each case on the unchanged tree therefore ran from scratch copies of the test that call one case, as the first section says.
- The test's helper fails first with `person-driven.sh does not exist at <path>` when the script is missing, so the first-run line names the one reason every case fails.
- `append_pair` runs its `printf` inside a group with standard error sent to `/dev/null`, so the shell's own redirection error does not add a second line to the one dictated `person-driven: cannot write the observations file <path>` line; C13 compares standard error whole.
- "Each path reaches only a redirection or a `[` test" (item 9) is read as the rule for how a path is used in code. The path also appears as an argument of `%s` in the dictated messages, and the folder is taken with `${observations%/*}` so no command receives a path.
- The fourth refusal is one test line, `[ -n "$observations" ] && [ -d "$folder" ] && [ -w "$folder" ]`, since an empty path would otherwise take the folder `.` and pass; its message is the dictated one with the empty path after the final space.
- The Stops row of `SKILL.md` ends "then the observations file read by the skill", as the brief dictates for that cell; the reference file names the actor "the session".
- The usage line is a double-quoted `printf` format because it holds an apostrophe.
- The state file's verify list holds ten commands and does not yet hold the new test, which the brief leaves to the orchestrator at landing, so `checks: 10 commands passed` does not include `person-driven.test.sh`; that test's result is Verify 2.
- No test covers the order of the four refusals, the usage check, the count loop's `read` or the one `printf` that writes a pair; a carriage return is a character, as the brief defines an action.

## Every user-visible change, before and after

- `skills/diagnose/SKILL.md` item 11 of "Ways to build a red command".
  - Before: `11. For a symptom only a person can trigger, a script that prints each action for the user to take and reads back what they observed, which is the stop "A red command a person drives".`
  - After, line 198: `11. For a symptom only a person can trigger, the script `templates/person-driven.sh`, which prints each action for the user to take and reads back what they observed, used as `references/person-driven.md` states; this way is the stop "A red command a person drives".`
- `skills/diagnose/SKILL.md` Stops row "A red command a person drives".
  - Before: `| A red command a person drives | Run by a person, when only a person can trigger the symptom | The script that prints each action for the user to take | The user's actions and what they observed, read back by the script |`
  - After, line 208: `| A red command a person drives | Run by a person, when only a person can trigger the symptom | The actions file and the command for the user to run, as `references/person-driven.md` gives it | The user's word that the script has ended, then the observations file read by the skill |`
- `skills/diagnose/templates/diagnosis.md`, section "Red command": before, no place for the actions a person took and what they observed. After, between the placeholder beginning `<for a symptom seen only sometimes:` and `Runs after the tightening`, the line `<for a red command a person drives: the observations file of each run quoted whole, and which observation is the red>` and a code block holding `<the observations file of each run>`.
- `docs/dev/building.md` line 11, after the `git_guard.test.sh` line: `sh skills/diagnose/templates/person-driven.test.sh    # person-driven.sh on scratch actions and input files: a complete run, also under dash, blank lines in the actions file, format characters, backslashes and shell syntax in the text, paths with a space, input that ends early, a blank observation asked for again, a last line with no newline, the refusals of an actions file it cannot read or that holds no action and of an observations file that exists or cannot be written, and an append that fails`. Before, ten commands and no line for this test.
- `docs/dev/change-standard.md` line 72, after the `git_guard.test.sh` line: `sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1`. Before, ten commands and no line for this test.
- New: `skills/diagnose/templates/person-driven.sh`, `skills/diagnose/templates/person-driven.test.sh` and `skills/diagnose/references/person-driven.md`.

Rule 14: `grep -rn 'person-driven' skills docs README.md utils` hits only the three new files, the two changed places of `SKILL.md` and the two command blocks; `grep -rn 'diagnose/templates\|diagnose/references\|diagnosis.md' skills docs README.md utils .agents` shows no other page that lists the files of the `diagnose` skill or counts the tests. The head comment of `person-driven.sh` lists the usage, the standard output, the files it reads and writes, the six error lines and the exit statuses 0, 1 and 64, and says that the fourth refusal covers an empty path; `grep -n 'exit \|refuse ' skills/diagnose/templates/person-driven.sh` shows exit 64 at lines 44 and 71, exit 1 at lines 60 and 66, and the refusals at lines 76, 82, 85 and 92, which match. The head comment of the test lists C1 to C14 without an argument form, and the file holds `case_c1` to `case_c14` (`grep -c '^case_c[0-9]*() {'` prints 14; `grep -n 'unknown case\|cases=\|\$#'` prints nothing).

## Anything in the brief that was wrong or impossible

Nothing found. The tree matched every fact of "What is on the tree", and each case's rule gave the result its case states when the finished script ran under `sh` (bash 3.2 in POSIX mode) and, for C1, under `dash`.

## Round 1

| Point | Status | Command that shows it |
|---|---|---|
| 1. C9's regular-file part uses a folder and a file name that each hold a space, and compares the bytes with `cmp` | DONE | the mutation row "C9 (regular file, path with a space)": `FAIL: C9, a regular file: exit status 0, expected 64` |
| 2. C12 gains the folder of mode 555, skipped with a note as root, the mode put back before the scratch folder is removed | DONE | the mutation row "C12 (folder of mode 555)": `FAIL: C12, a folder that is not writable: exit status 1, expected 64` |
| 3. The fourth refusal refuses an empty observations path; the head comment says so; C12 gains the empty-path part | DONE | the mutation row "C12 (empty path)": `FAIL: C12, an empty path: exit status 1, expected 64`; `sed -n 36p skills/diagnose/templates/person-driven.sh` prints the head comment line that names an empty path |
| 4. The test takes no argument and calls the cases one after another; the report's judgment call on the argument form is removed | DONE | `grep -n 'unknown case\|cases=\|\$#' skills/diagnose/templates/person-driven.test.sh` prints nothing; the 17 mutation rows above ran the whole suite |
| 5. The comment in `docs/dev/building.md` names the refusals the test runs | DONE | `grep -n 'person-driven.test' docs/dev/building.md` prints line 11 with "the refusals of an actions file it cannot read or that holds no action and of an observations file that exists or cannot be written" |
| 6. The reference file: "the session" as the actor, one bullet for the prohibition with what to do instead, a bullet for the command's quoting, the unfinished-run bullet, the run number bullet, the active voice, the new bullet on typing each observation, sentences split | DONE | `grep -n 'the skill' skills/diagnose/references/person-driven.md` prints nothing; `wc -l` prints `21` |
| 7. The order of the four refusals, the usage check, the count loop's `read` and the pair's one `printf` get no test | DONE | `grep -n 'order of the four refusals' .scratch/2-f-diagnose/agents/reviews/2a-report.md` prints the Judgment calls bullet that states it; the test and the script are otherwise as the other points leave them |

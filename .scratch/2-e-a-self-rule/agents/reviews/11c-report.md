Everything in the brief is done.

## Open items of the state file

`.scratch/2-e-a-self-rule/orchestrator-state.md`, section "Open items", holds no item: the section is its heading and one paragraph, and every raised item sits under "Closed items".

## The cases' first run, on the unchanged tree

Each case ran on scratch state files under the session scratchpad (`build-11c/first-out`), `sh <base checks.sh> <state file>` from a scratch directory, with the base copy of `checks.sh` taken before any change. No case showed a result the brief's rules get wrong, so the build went ahead without a stop.

| Case | First run on the unchanged tree |
|---|---|
| 1 | `$ true`, `$ printf 'noise\n' \| tail -1`, `noise`, `checks: 2 commands passed`, exit 0 |
| 2 | The test written first, run on the unchanged `checks.sh`: `FAIL: failing list did not run the command after the failed ones`, exit 1. The run stopped after the first command. |
| 3 | The signal test written first, run alone on the unchanged `checks.sh`: `FAIL: signal list: the output differs from the expected text`, with the diff lines `3,5d2`, `< $ echo after`, `< after`, `< checks: 1 of 2 commands failed`. `echo after` did not run. |
| 4 | `$ false`, `checks: failed with exit 1: false`, exit 1. The run stopped after the first command. |
| 5 | `checks: <scratch>/c5.md has no yaml block`, exit 2, `refused-ran` not created |
| 6 | `$ echo oops >&2; exit 1`, `oops`, `checks: failed with exit 1: echo oops >&2; exit 1`, exit 1 |
| 7 | `PASS: land.sh scratch tests` |
| 8 | `checks: 11 commands passed`, exit 0 |
| 9 | `$ false`, `checks: failed with exit 1: false`, exit 1 |
| 10 | `$ printf 'no newline'; exit 1`, then `no newlinechecks: failed with exit 1: printf 'no newline'; exit 1` on one line, exit 1. `echo next` did not run. |
| 11 | `$ false && touch dep-ran`, `checks: failed with exit 1: false && touch dep-ran`, exit 1, `dep-ran` not created. The two `true` items did not run. |
| 12 | `$ mkdir -p sub && cd sub`, `$ pwd`, the scratch directory the run started in, `checks: 2 commands passed`, exit 0 |
| 13 | `$ cat; read x; echo "read status $?"`, `read status 1`, `checks: 1 commands passed`, exit 0 |
| 14 | `$ false`, `checks: failed with exit 1: false`, exit 1. The run stopped at `false`, so `kill -TERM $PPID` did not run. |
| 15 | `$ false`, `checks: failed with exit 1: false`, exit 1. The second `false` did not run. |

The cases on the changed tree (`build-11c/after-out`, same harness `build-11c/cases.sh`):

| Case | Result on the changed tree |
|---|---|
| 1 | Same as before: both `$` lines, `noise`, `checks: 2 commands passed`, exit 0 |
| 2 | Whole output equals the item 3 text, exit 1, `third-ran` exists (the test passes) |
| 3 | `$ kill -TERM $$`, `checks: failed with exit 143: kill -TERM $$`, `$ echo after`, `after`, `checks: 1 of 2 commands failed`, exit 1 (the test passes) |
| 4 | `$ false`, `checks: failed with exit 1: false`, `$ exit 2`, `checks: failed with exit 2: exit 2`, `checks: 2 of 2 commands failed`, exit 1 |
| 5 | Same as before: refused, exit 2 |
| 6 | `$ echo oops >&2; exit 1`, `oops`, `checks: failed with exit 1: echo oops >&2; exit 1`, `checks: 1 of 1 commands failed`, exit 1 |
| 7 | `PASS: land.sh scratch tests`; its failing check still asserts `checks: failed with exit 1: false` (`land.test.sh:135`, unchanged) |
| 8 | `checks: 11 commands passed`, exit 0 (the output is under Verify 1) |
| 9 | `$ false`, `checks: failed with exit 1: false`, `checks: 1 of 1 commands failed`, exit 1 |
| 10 | `no newlinechecks: failed with exit 1: printf 'no newline'; exit 1` on one line, `$ echo next`, `next`, `checks: 1 of 2 commands failed`, exit 1 |
| 11 | `$ false && touch dep-ran`, one failure line naming the whole item, `$ true`, `$ true`, `checks: 1 of 3 commands failed`, exit 1, `dep-ran` not created |
| 12 | Same as before: `pwd` prints the directory the run started in, exit 0 |
| 13 | Same as before: `read status 1`, `checks: 1 commands passed`, exit 0 |
| 14 | `$ false`, `checks: failed with exit 1: false`, `$ kill -TERM $PPID`, then nothing more and no count line, exit 143 |
| 15 | Two failure lines, `checks: 2 of 2 commands failed`, exit 1 |

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1. Run loop | DONE | `skills/land/templates/checks.sh:108-124`; cases 2, 3, 4, 9, 10, 11, 15 above |
| 2. Head comment | DONE | `skills/land/templates/checks.sh:8-26`: every command runs, the failure line continues an output without a trailing newline, the count lines, a signal that ends `checks.sh` itself ends the run with no count line and status 128 plus the signal's number, exit 1 reads "one or more commands exited non-zero". The line "the commands after it do not run" is gone. |
| 3. Two tests | DONE | `skills/land/templates/checks.test.sh`; both written first and failing on the unchanged `checks.sh` (cases 2 and 3 above); the failing case is the three commands of the brief and ends in a passing `touch third-ran`; both compare the whole output with `diff` against an expected text; the passing and refusal cases stay |
| 4. `SKILL.md` | DONE | `skills/land/SKILL.md:63` ends at "each through its filter."; `:156-158` are three bullets: `Every command runs, whatever the exit of the one before.`, `A command that exits non-zero is followed by checks: failed with exit <status>: <command>, after its output.`, `After the last command, when one or more failed, it prints checks: <k> of <n> commands failed and exits 1.`; `:159` (the passing line) unchanged |
| 5. `README.md:149` | DONE | `Every command runs, each failure is printed, and the run ends with the count of failures. Commands that depend on each other are written as one item joined with && ...` |
| 6. `docs/dev/building.md` | DONE | `:21` "and runs every command, whatever the exit of the one before"; `:24` the exit 1 line with the count line; `:27` the sentence on `&&` |

Verify 1, `sh /Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-11c/skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md` from the worktree root, exit 0, printed:

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
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
```

| Verify | State | Output |
|---|---|---|
| 2. `sh skills/land/templates/checks.test.sh 2>&1 \| tail -1` | DONE | `PASS: checks.sh scratch tests`. The same test file next to the base `checks.sh` in a scratch folder prints `FAIL: failing list did not run the command after the failed ones`. |
| 3. `git diff --name-only` | DONE | `README.md`, `docs/dev/building.md`, `skills/land/SKILL.md`, `skills/land/templates/checks.sh`, `skills/land/templates/checks.test.sh`; the ledger report is untracked |
| 4. `git diff -U0 \| grep '^+' \| LC_ALL=C grep -n '[^ -~]'` | DONE | prints nothing (grep exit 1) |
| 5. grep of "What it must do" | DONE | `grep -rn -i 'first command that\|first failure\|do not run\|does not run\|stops at the first\|stops the run' skills/land README.md docs/dev` prints one hit, `skills/land/SKILL.md:185`, the Stops-section row "for a first failure" about a landing, which stays |

The behaviours the change adds or changes, each with its case and failing line on the unchanged tree:

| Behaviour | Case | Failing line on the unchanged `checks.sh` |
|---|---|---|
| A failure does not stop the run, a later command runs, the exit stays 1 though the last command passes, each failure line follows its output, the count line ends the output | `checks.test.sh`, "failing list" | `FAIL: failing list did not run the command after the failed ones` |
| A command ended by a signal is a failure, status 128 plus the number, and the next command runs | `checks.test.sh`, "signal list" | `FAIL: signal list: the output differs from the expected text`, diff `< $ echo after` |

Run against the changed tree, two changes to a copy of `checks.sh` turn the failing-list case red: ending with `sys.exit(0)` prints `FAIL: failing list exited 0, expected 1`, and not counting failures prints the same line.

Rule 14, the sentences about the changed files as a whole, each reread after the change:

- `skills/land/templates/checks.sh:2`, "Runs a plan's verify list and says whether every command in it exited 0": holds, the run reports per command and the exit status is 0 only when every command exited 0 (`:20-21` of the head comment).
- `skills/land/templates/checks.sh` head comment lists the inputs (`:4-6`), every printed line (`:8-17`) and the exit statuses 0, 1 and 2 (`:19-26`); the count line `checks: <k> of <n> commands failed` is in both the output paragraph and under exit 1.
- `skills/land/templates/checks.test.sh:2-11` lists the four cases the file runs: failing list, signal list, passing list, no yaml block.
- `docs/dev/building.md:7` ("checks.sh on a failing list, a passing list and a state file with no yaml block") stays true; the signal list is a failing list.
- `skills/land/SKILL.md:161-162`, the descriptions of `land.test.sh` and `checks.test.sh`, stay true.
- `README.md:149`, `docs/dev/building.md:21-27` and `skills/land/SKILL.md:156-159` state the same behaviour (every command runs, the failure line after the output, the count line, exit 1); `skills/land/templates/land.sh` reads only the exit status (`land.sh:443-446`); `land.test.sh:135` and `:151` are unchanged and pass.

## Files, with line counts (`wc -l`)

| File | Lines |
|---|---|
| `skills/land/templates/checks.sh` | 127 |
| `skills/land/templates/checks.test.sh` | 118 |
| `skills/land/SKILL.md` | 219 |
| `README.md` | 190 |
| `docs/dev/building.md` | 33 |

`git diff --stat`: 5 files changed, 77 insertions(+), 26 deletions(-).

## Judgment calls

- The test compares the whole output by writing the expected text to a scratch file and running `diff` on the two files, which prints the differing lines on a failure. The brief asks for a line-for-line comparison of two texts and names no tool.
- The `&&` sentence in `README.md:149` and in `docs/dev/building.md:27` ends with "since each item runs in its own `bash`", the reason case 12 shows; the brief's item 5 and item 6 name the rule and not the reason.
- `docs/dev/building.md:7` (the one-line description of `checks.test.sh`) is outside the step's paths and stays true, so it is not changed.

## User-visible changes, before and after

- `checks.sh` on a list with a failing command. Before: it printed `checks: failed with exit <status>: <command>`, skipped every later command and exited 1. After: it prints that line after the command's output, runs the later commands, prints `checks: <k> of <n> commands failed` and exits 1.
- `checks.sh` on a clean list, and its refusals with exit 2: unchanged.
- `land.sh` on a failing check: unchanged exit 1 with `checks.sh`'s output; the output now also holds the later commands' lines and the count line.
- The head comment of `checks.sh`, `skills/land/SKILL.md` Steps 6 and "The landing script", `README.md:149`, `docs/dev/building.md:21-27`: carry the new behaviour as the DONE table lists.

## Anything in the brief wrong or impossible

Nothing found.

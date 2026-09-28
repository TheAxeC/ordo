Everything in the brief is done.

# Report: step 18a, `land.sh` lands a step that has no commit to copy

## Open items of the state file (verbatim)

- Open item JJ (audit finding 1-15, review files that do not say how each problem was resolved): every review file ends with a section, written by the orchestrator before the landing, that records how each problem the reviewer found was resolved. The template asks for one line per problem, naming where it was fixed and how to check it. Eleven review files of plan 1 and fifteen of this plan give one line for all the problems, or one line for a group (the closure table's row 1-15 names each file). Those sections are records of what was checked at each landing; rewriting them now would present checks as made at the landing that were not recorded then. (a) Count the finding as dealt with, as open item II ruled for the briefs: the old sections stay as they were written, and every Closed section from now on gives one line per problem. (b) Keep the old sections, and add below each a separate section, headed and dated as a later check, that checks each problem on today's tree. Con: a pass over 26 files, which would find out whether a problem closed only in a group was in fact left unfixed. Recommendation: (a).

## The cases' first run (on the unchanged `land.sh`)

The tests were written into `skills/land/templates/land.test.sh` and run against the base `land.sh` before it was changed. `land.test.sh` stops at its first failure, so Case 2 and the failed-count case were each run from a copy of the test with the earlier red case cut out, beside unchanged copies of `land.sh`, `verify.sh` and `usage.py`.

| Case | Result on the unchanged tree | As the brief predicts |
|---|---|---|
| 1, empty range, green list | `FAIL: empty range: exit 128, expected 0: worktree git commit: nothing staged, no wip commit made` / `Switched to a new branch 'empty-land'` / `error: empty commit set passed` / `fatal: cherry-pick failed` / `worktree git cherry-pick failed` | yes, exit 128 with `error: empty commit set passed` |
| 2, empty range, red list | `FAIL: empty range red: exit 128, expected 1: worktree git commit: nothing staged, no wip commit made` / `Switched to a new branch 'empty-red-land'` / `error: empty commit set passed` / `fatal: cherry-pick failed` / `worktree git cherry-pick failed` (no `RED:` line) | yes |
| 3, clean landing unchanged | passed: `clean: exit 0, staged paths, usage rows, the orchestrator row and the verify list verified` | yes |
| failed count (added, see judgment call 1) | `FAIL: failed count message: missing [worktree git rev-list --count failed]` | not a case of the brief |

No case of the brief was wrong under its own rules; nothing was handed back.

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| 1. `land.sh` counts `<base>..<pkg>` after the checkout; at 0 prints the line, skips both cherry-picks, runs the verify list and the booking | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/land.test.sh 2>&1 \| grep -n "nothing to copy\|empty range"` | `23:empty range: nothing to copy, the verify list ran on main and the step booked, exit 0` / `24:empty range red: nothing to copy, the red verify list fails the landing, exit 1` / `25:empty range count: a count git cannot take fails the landing with its exit 128` |
| 1. A failed count fails with git's output and exit status | DONE | a scratch repository, `sh land.sh pkg 0000000000000000000000000000000000000000 --no-browser` | `fatal: Invalid revision range 0000000000000000000000000000000000000000..pkg` / `worktree git rev-list --count failed` / exit 128, nothing staged on main (`git diff --cached --name-only \| wc -l` prints 0) |
| 1. A non-empty range behaves exactly as before | DONE | the same scratch landing (one committed file, one pending file, commit dates fixed so hashes match) run with `git show HEAD:skills/land/templates/land.sh` and with the changed `land.sh`, outputs diffed with the ledger path normalised | `diff` printed nothing, then `outputs identical`; both exit 0 |
| 2. Head comment gains the sentence | DONE | `git diff skills/land/templates/land.sh` | see "Before and after" |
| 3. `land.test.sh`: Cases 1 and 2 as tests, Case 3 checked, header extended | DONE | the verify list below, first line | `PASS: land.sh and usage.py scratch tests` |
| 4. `SKILL.md`: sub-bullet under Steps 4, bullet under "The landing script" | DONE | `git diff skills/land/SKILL.md` | see "Before and after" |
| Verify list (brief check 1) | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"` | `PASS: land.sh and usage.py scratch tests` / `PASS: check_config.py scratch tests` / `PASS: sync_rules.py scratch tests` / `PASS: pin.sh scratch tests` / `PASS: verify.sh scratch tests (runner under sh dash)` / `PASS: check_coverage.py scratch tests` / `verify: 7 commands passed` / `exit 0`; nothing printed for the ASCII check |
| Only the three paths (brief check 3) | DONE | `git diff --stat` | `skills/land/SKILL.md \| 6 +-` / `skills/land/templates/land.sh \| 63 +++++++++++++-------` / `skills/land/templates/land.test.sh \| 117 ++++++++++++++++++++++++++++++++++++-` / `3 files changed, 161 insertions(+), 25 deletions(-)` |
| ASCII, no double blank lines, POSIX syntax | DONE | `LC_ALL=C grep -n '[^ -~]'` on each changed file; an awk scan for two blank lines in a row; `sh -n` and `dash -n` on `land.sh` | no lines from either scan; `syntax 0` |

## Reverts and their red runs (brief check 4)

Each revert was applied to a copy of `land.sh` in the scratchpad and the test run from that copy.

| Branch or rule | Case | Revert | Red line |
|---|---|---|---|
| Count the range and skip both cherry-picks at 0 | 1 | `land.sh` as at the base (the count and the skip removed) | `FAIL: empty range: exit 128, expected 0: ...` / `error: empty commit set passed` (first run above) |
| Count the range and skip both cherry-picks at 0 | 2 | the same, Case 1 cut from the test copy | `FAIL: empty range red: exit 128, expected 1: ...` / `error: empty commit set passed` (first run above) |
| The verify list still runs on an empty range | 1 | `exit 0` added after the `nothing to copy` line | `FAIL: empty range verify list: missing [nothing to copy: ebccd919d8895d44f941aae619de6f0e1cdb49a6..empty holds no commit` / `PASS: empty range green` / `main-report-on-main` / `verify: 2 commands passed]` |
| The verify list still runs on an empty range | 2 | the same, Case 1 cut from the test copy | `FAIL: empty range red: exit 0, expected 1: worktree git commit: nothing staged, no wip commit made` / `Switched to a new branch 'empty-red-land'` / `nothing to copy: b0bd93a0db982ac31a2e0d870e45ee74e84d7c32..empty-red holds no commit` |
| A failed count fails the landing with git's status | failed count | the `if [ "$landing_status" -ne 0 ]` block after the count removed | `FAIL: failed count message: missing [worktree git rev-list --count failed]` |
| The line is printed only for an empty range (control for Case 1's line) | 3 | the `nothing to copy` printf moved before the `if`, so it prints whatever the count | `FAIL: clean: a range with commits printed [nothing to copy]` |
| A non-empty range is still copied | 3 | the count test replaced by `if true; then` (cherry-picks always skipped) | `FAIL: clean landing exited 1, expected 0` (the clean ledger's `test -f committed.txt` is red, since nothing reaches main) |

## Files changed

| File | Lines now | Base |
|---|---|---|
| `skills/land/templates/land.sh` | 486 | 467 |
| `skills/land/templates/land.test.sh` | 1065 | 952 |
| `skills/land/SKILL.md` | 200 | 196 |
| `.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/18a-report.md` | this report | new |

## Judgment calls

1. A third new test, the failed count (a base that names no commit, `0000000000000000000000000000000000000000`), because the brief's item 1 adds that branch and change-standard rule 13 requires a case for every added branch. It asserts exit 128, a `fatal: ` line, `worktree git rev-list --count failed`, no cherry-pick message and nothing staged on main.
2. The count is preceded by `wait_for_index "$landing_worktree"`, since the head comment says the script waits for the lock before each git step.
3. The failure message of the count is `worktree git rev-list --count failed`, in the form of the other step messages. The head comment's new sentence names it, per rule 14 (a script's head comment lists every error it prints); it is still one sentence.
4. The comment above the verify list's run said "on main as the cherry-pick left it"; it now adds "or as it was when the range holds no commit" (rule 14, a sentence the change made false).
5. The `SKILL.md` bullet under "The landing script" is one bullet (the skip) with two sub-bullets (the printed line; the verify list still runs), because `docs/dev/skill-layout.md` line 45 makes two requirements that break independently two items.
6. `SKILL.md` line 158 (Removing a step's worktree, step 4) gave as the reason for `-D` that neither branch is an ancestor of main; after an empty-range landing both are. The instruction is unchanged; the reason now reads that `-D` deletes them whether or not they are merged into main. Serves item 4 under rule 14; it is in a path the brief names.
7. Case 1's fixture follows `ledger_case`: the ledger is committed on main, the worktree is made at that base, the builder's report is left untracked in the worktree, and main commits its own copy after the worktree is made, so "main's copy of the ledger file is unchanged" has a main copy to check. Its verify list reads main's copy from the repository root (`grep -qx 'main copy' ...`).
8. Case 2's red command is inline in the verify list (`printf 'FAIL: planted\n'; exit 1`) instead of a script file in the repository.
9. Left unchanged, each still true: `README.md:117` ("does the cherry-pick and the checks on `main` as one command") describes the script in general and is outside the paths; `SKILL.md:125` ("after main's cherry-pick it runs") has the new empty-range bullet directly under it; `SKILL.md:166` ("A red line after the cherry-pick") names the point in the landing, which Steps 6 still follows. Grep used: `grep -rn "cherry-pick" skills/ utils/ docs/ README.md`.

## Before and after

`land.sh` on an empty range, before:

```
worktree git commit: nothing staged, no wip commit made
Switched to a new branch 'empty-land'
error: empty commit set passed
fatal: cherry-pick failed
worktree git cherry-pick failed
```

exit 128, verify list not run. After, green list: `nothing to copy: <base>..empty holds no commit`, then the verify lines, `verify: 2 commands passed`, the `=== booking ===` block, exit 0, nothing staged on main. After, red list: the same line, then verify.sh's `RED:` block, `verify list failed`, exit 1.

`land.sh` with a base that names no commit, before: `worktree git cherry-pick failed` at exit 128. After: `fatal: Invalid revision range ...` and `worktree git rev-list --count failed`, exit 128, no cherry-pick run.

`land.sh` head comment, added: "A range <base>..<pkg> that holds no commit (git rev-list --count prints 0) copies nothing: both cherry-picks are skipped, "nothing to copy: <base>..<pkg> holds no commit" is printed, and the verify list still runs on main, while a count git fails ends the landing with "worktree git rev-list --count failed", git's output and its exit status."

`SKILL.md`, added under Steps 4: "A range with no commit, as when the step's only output is a ledger file, has nothing to copy, and the landing goes on to Steps 6."

`SKILL.md`, added under "The landing script":

```
- When `<base>..<step>` holds no commit, it skips both cherry-picks.
  - It prints `nothing to copy: <base>..<step> holds no commit` in place of the cherry-picks' output.
  - It still runs the verify list on main (Steps 6).
```

`SKILL.md:158`, before: "`-D` deletes them, since the cherry-pick made new commits and neither branch is an ancestor of main." After: "`-D` deletes them whether or not they are merged into main; after a cherry-pick neither is, since the cherry-pick made new commits."

## Anything in the brief that was wrong

Nothing. The brief's line numbers (cherry-picks at 371 and 391, verify list at 398, test file 952 lines, `SKILL.md` Steps 4 at line 55, "The landing script" at 118 to 145) matched the base.

NOT DONE: the Cases grep `git grep -n -e 'usage row' -e 'usage table' -e 'Usage section' -e "ledger's .land\.sh" -- ':!.scratch' ':!docs/roadmap.md'` still prints two lines, `docs/academic-coverage.md:155` and `docs/academic-coverage.md:177`, exit 0. That file is outside the brief's "Paths this step writes" and the dispatch prompt forbids writing outside that list, so it is a stop for the orchestrator (evidence under "Wrong or impossible in the brief"). Everything else in the brief is done.

## Open items of the state file, verbatim

```
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

- none.
```

## First run of the cases on the unchanged tree

`checks.test.sh` and the four-case `land.test.sh` were written first and run against the unchanged `land.sh` with no `checks.sh`. To record every case and not only the first, a scratch copy of each test under `$TMPDIR` had `fail`'s `exit 1` replaced by `: continue`. Output:

```
FAIL: conflict exited 64, expected 2
FAIL: conflict: missing [Conflicting paths:
base.txt]
arguments failed: invalid package name: /private/var/folders/.../ledger/tools/b/.scratch/plan/orchestrator-state.md
FAIL: ledger landing exited 64, expected 0
FAIL: ledger landing staged [], expected [tools/b/change.txt]
FAIL: failing check exited 64, expected 1
FAIL: failing check: missing [checks: failed with exit 1: false]
FAIL: clean landing exited 64, expected 0
FAIL: clean landing: missing [checks: 1 commands passed]
FAIL: clean landing staged [], expected [change.txt pending.txt]
---
sh: .../checks.sh: No such file or directory
FAIL: failing list exited 127, expected 1
FAIL: no yaml block exited 127, expected 2
FAIL: passing list exited 127, expected 0
```

Every case was red for the reason the brief expects: the old `land.sh` takes `<pkg> <base>` and refuses a state-file path as a package name (exit 64), and `checks.sh` did not exist (exit 127). No case of the brief was found wrong, so work went on without a hand-back.

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| 1. `checks.sh` | DONE | `sh skills/land/templates/checks.test.sh; echo "exit $?"` | `PASS: checks.sh scratch tests` / `exit 0` |
| 1. `checks.sh` refusals, each exit 2 before anything runs | DONE | hand run in a scratch folder (no arg, two args, missing, a directory, not UTF-8, unclosed, invalid YAML, no key, `verify: true`, `[]`, `[1]`, `["  "]`, a NUL item, `verify:` empty) | each printed a `checks: ` line and `[... exit 2]`, for example `checks: the state file bad.md is not UTF-8`, `checks: the verify: list of empty.md is empty`, `checks: item 1 of the verify: list of nonstr.md is not a non-empty string` |
| 1. a command ended by a signal | DONE | the same hand run with `kill -TERM $$` as the second command | `checks: failed with exit 143: kill -TERM $$`, `[signal exit 1]`, `echo never` not run |
| 2. `checks.test.sh` | DONE | as above | `PASS: checks.sh scratch tests`, exit 0 |
| 3. `land.sh` rewritten | DONE | `sh skills/land/templates/land.test.sh; echo "exit $?"` | `PASS: land.sh scratch tests` / `exit 0` |
| 3. argument and configuration refusals, exit 64 | DONE | hand run in a scratch repository | `[two args exit 64]`, `invalid step name: a/b` 64, `base must be a hexadecimal commit id` 64, `LANDING_LOCK_WAIT must be a whole number of seconds: 1s` 64, `.agents/plan.yaml not found` 64, `no ledger_root in .agents/plan.yaml` 64, `state file not found: led/p/missing.md` 64, `the state file other/s.md is not under the ledger_root led` 64, `ledger_root must be a folder inside the repository: ../led` 64, `... : .` 64, invalid YAML 64, `no ledger_root of the project b` 64, `is under no project's ledger_root` 64; nested ledger roots chose the deepest (`worktree not found: .../wt-b/st`, exit 1) |
| 3. lock age read with `python3` | DONE | hand run: `touch -t 202001010000 .git/index.lock`, then a landing; then a fresh lock with `LANDING_LOCK_WAIT=2` | stale lock: landing exit 0 and `ls: .git/index.lock: No such file or directory`; fresh lock: `index lock failed: ... still held after 2 s of waiting; main is untouched; the worktree is on st-land, ...`, exit 1 |
| 3. no `node` | DONE | `grep -n node skills/land/templates/land.sh; echo "exit $?"` | `exit 1`, no line |
| 4. `land.test.sh`, four cases | DONE | as item 3 | `PASS: land.sh scratch tests`, exit 0 |
| 5. deletions | DONE | `git status --short` | ` D skills/land/templates/usage.py`, ` D skills/land/templates/verify.sh`, ` D skills/land/templates/verify.test.sh` |
| 6. texts: removed names gone | DONE | `git grep -n -e verify.sh -e usage.py -e ADAPT -e no-browser -- ':!.scratch' ':!docs/roadmap.md'; echo "exit $?"` | `exit 1`, no line (before, on 6c41c02: 138 lines over 15 files, the three deleted files included) |
| 6. texts: usage rows, tables, a ledger's `land.sh` gone | NOT DONE | `git grep -n -e 'usage row' -e 'usage table' -e 'Usage section' -e "ledger's .land\.sh" -- ':!.scratch' ':!docs/roadmap.md'; echo "exit $?"` | `docs/academic-coverage.md:155: ... the plan ledger books each step's usage row. ...` and `docs/academic-coverage.md:177: ... The plan ledger already records each decision, finding and usage row, ...`, `exit 0`; every other hit of 6c41c02 (26 lines over 8 files) is gone |
| Verify 1: old runner | ran, one line red as the brief expects | `sh ~/.claude/skills/land/templates/verify.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md; echo "exit $?"` | `PASS: land.sh scratch tests` / `RED: sh skills/land/templates/verify.test.sh 2>&1 \| tail -1` / `exit status: 127` / `sh: skills/land/templates/verify.test.sh: No such file or directory` / `exit 1` |
| Verify 1: the other commands by hand | DONE | each through `bash -o pipefail -c` | `PASS: checks.sh scratch tests` exit 0; `PASS: check_config.py scratch tests` exit 0; `PASS: sync_rules.py scratch tests` exit 0; `PASS: pin.sh scratch tests` exit 0; `PASS: check_coverage.py scratch tests` exit 0; ASCII check: no offending line, exit 0, with three perl warnings `Can't open skills/land/templates/usage.py` / `verify.sh` / `verify.test.sh: No such file or directory` (deleted, still in the index) |
| Verify 2: new runner | ran, one line red as the brief expects | `sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md; echo "exit $?"` | `$ sh skills/land/templates/land.test.sh 2>&1 \| tail -1` / `PASS: land.sh scratch tests` / `$ sh skills/land/templates/verify.test.sh 2>&1 \| tail -1` / `sh: skills/land/templates/verify.test.sh: No such file or directory` / `checks: failed with exit 127: sh skills/land/templates/verify.test.sh 2>&1 \| tail -1` / `exit 1` |
| Verify 2: whole list with `checks.test.sh` in place of `verify.test.sh` | DONE | the state file copied to `$TMPDIR` with that one path replaced by `sed`, then `sh skills/land/templates/checks.sh <copy>` | the seven `$ <command>` lines, `PASS: land.sh scratch tests`, `PASS: checks.sh scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`, `PASS: check_coverage.py scratch tests`, the three `Can't open` warnings, `checks: 7 commands passed`, exit 0 |
| Verify 4: ASCII over every file written | DONE | `LC_ALL=C grep -n '[^ -~]'` over the 15 files written (report excluded), then again over the three docs after their last edit | no line, `exit 1` both times |

## Revert proofs

Each revert was made on a scratch copy of `skills/land/templates/` under `$TMPDIR`, and the copy's test was run from that copy.

| Branch or rule | Case | Revert | Red line |
|---|---|---|---|
| `checks.sh` exits 1 at a failed command (brief) | failing list | `sys.exit(1)` after the failure line changed to `sys.exit(0)` | `FAIL: failing list exited 0, expected 1` |
| `checks.sh` stops at the first failed command | failing list | that `sys.exit(1)` removed, so the run goes on | `FAIL: failing list exited 0, expected 1` |
| `checks.sh` prints the count | passing list | count printed as `len(commands) - 1` | `FAIL: passing list: missing [checks: 2 commands passed]` |
| no yaml block refused with exit 2 | no yaml block | refusal replaced by `sys.exit(1)` | `FAIL: no yaml block exited 1, expected 2` |
| `land.sh` runs `checks.sh` on main (brief) | failing check | the `sh "$landing_script_dir/checks.sh" "$landing_state"` line replaced by `true` | `FAIL: failing check exited 0, expected 1` |
| the add leaves the ledger root out (brief) | ledger | `git add -A -- "$2" ":(exclude,literal)$3"` changed to `git add -A -- "$2"` | `FAIL: ledger landing staged [tools/b/.scratch/plan/agents/reviews/report.md` / `tools/b/change.txt], expected [tools/b/change.txt]` |
| a conflict exits 2 | conflict | `exit 2` after the conflicting paths changed to `exit 1` | `FAIL: conflict exited 1, expected 2` |
| `projects:` form reads the matched project's `worktree_root` | ledger | `project.get("worktree_root", ...)` replaced by `".agents/worktrees"` | `FAIL: ledger landing exited 1, expected 0` |
| one-project form reads `worktree_root` | conflict | `config.get("worktree_root", ...)` replaced by `".agents/worktrees"` | `FAIL: conflict exited 1, expected 2` |
| main's cherry-pick stages the range | ledger | `run_step "main git cherry-pick" ...` replaced by `:` | `FAIL: ledger landing staged [], expected [tools/b/change.txt]` |

The check in the clean case runs `test -f change.txt` from the repository root, so it passes only after main's cherry-pick; the main cherry-pick revert above turns the ledger case red first, since it runs before the clean case.

The kept git work that none of the four cases reaches (the resume of a landing stopped after its checkout, the lock wait and its stale-lock rule, the empty range) has no case in `land.test.sh`, because the brief and the approved plan hold it to four cases (brief decision 5). The one line of that work this step changed, the lock age now read with `python3`, was run by hand as the DONE table shows.

## Files

| File | Lines now | Change (`git diff --numstat`, or new) |
|---|---|---|
| `skills/land/templates/checks.sh` | 119 | new |
| `skills/land/templates/checks.test.sh` | 74 | new |
| `skills/land/templates/land.sh` | 448 | +194 -232 |
| `skills/land/templates/land.test.sh` | 156 | +113 -1035 |
| `skills/land/templates/verify.sh` | deleted | -245 |
| `skills/land/templates/verify.test.sh` | deleted | -510 |
| `skills/land/templates/usage.py` | deleted | -141 |
| `skills/land/SKILL.md` | 199 | +41 -42 |
| `skills/plan/SKILL.md` | 89 | +4 -14 |
| `skills/plan/templates/orchestrator-state.md` | 62 | +2 -7 |
| `skills/spec/templates/brief.md` | 63 | +1 -1 |
| `skills/refute/SKILL.md` | 144 | +3 -3 |
| `skills/plan-orchestration/SKILL.md` | 309 | +12 -19 |
| `skills/plan-help/SKILL.md` | 94 | +2 -2 |
| `README.md` | 146 | +8 -12 |
| `docs/dev/building.md` | 27 | +10 -10 |
| `docs/dev/change-standard.md` | 64 | +3 -3 |
| `skills/repo-setup/templates/docs/dev/change-standard.md` | 50 | +1 -1 |

No `metadata.version` was changed; step 1 of this plan changed `skills/repo-setup/SKILL.md` without a version change (`git show 6c41c02 | grep '^[-+]  version'` shows only the two deleted `writing` files' versions).

## Judgment calls

1. `checks.sh` refuses with exit 2, before running anything, when `python3`, PyYAML or `bash` is missing and when an item holds a NUL character. The brief's refusal list does not name these; without them a missing tool gives exit 127 and a NUL item a Python traceback in the middle of the run. They serve "A list it cannot read never passes". An item of only whitespace counts as not a non-empty string.
2. `checks.sh` and `land.sh` let the commands' output through as it comes, not captured and printed at the end, so a long verify list shows progress during a landing.
3. `land.sh` refuses with exit 64, in the one-project form too, a state file that is not under `ledger_root`; the brief names this refusal for "a state file under no project's `ledger_root`". A missing state file is also exit 64 (an argument refusal). A missing `python3` or PyYAML in `land.sh` is exit 1, a stop, since it is neither an argument nor configuration.
4. In the `projects:` form, when ledger roots nest the deepest one that holds the state file is taken; each project's `worktree_root` defaults to `.agents/worktrees`, as `skills/plan/templates/plan.projects.yaml` says each project takes the defaults of `plan.yaml`; a project with no `ledger_root` is refused with exit 64, as the brief's "no `ledger_root`".
5. `worktree_root: .` stays allowed and `ledger_root: .` stays refused, as in the old `land.sh`'s checks; a leading `./` and trailing `/` are dropped from both.
6. The booking data is the diff stat and the staged paths only; the numstat counts, which fed the usage rows, are gone with them.
7. Texts the change made false and that sit in files of the path list were carried: `skills/land/SKILL.md` Steps 3 read "`git add -A` scoped to the step's tree", now "of the whole tree" (brief decision 2); `skills/refute/SKILL.md` 60 recorded the usage "in the state file's table", now beside the `reviewer_report` path; `skills/plan-orchestration/SKILL.md` 41 ("the usage table"), 139 ("usage row") and 140 ("a usage line"); `README.md` 16, whose `plan` row listed "the landing script"; `docs/dev/building.md` 3 and `docs/dev/change-standard.md` 62, which said each test runs on scratch repositories, now "or scratch files", since `checks.test.sh` uses scratch state files.
8. `land.test.sh` runs its ledger case under the `projects:` form, with the state file under the second project's ledger root (written `./tools/b/.scratch/`) and given as an absolute path, and its other cases under a one-project `plan.yaml` with non-default roots (`ledger`, `.agents/wt`), so both forms and both path forms are exercised inside the four cases.

## User-visible changes

| What | Before | After |
|---|---|---|
| The landing invocation | `sh <ledger>/land.sh <pkg> <base> [--no-browser] [--session <log> --since <time>]`, a copy in the ledger with `ADAPT` edits | `sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`, run from the skill, reading `worktree_root` and `ledger_root` from `.agents/plan.yaml` |
| The verify runner | `verify.sh`: `PASS:` rule on a `tail` stage, `RED:` line, exit 0/1/64/69/128+n | `checks.sh`: `$ <command>` and its output, `checks: failed with exit <n>: <command>` (exit 1) or `checks: <n> commands passed` (exit 0), refusals exit 2 |
| The usage table | a Usage section and table in `orchestrator-state.md`, `usage.py` rows printed by `land.sh` | gone; the booking and the landing report state each agent's tokens, tool uses and time from its completion notice, whether the first report passed its bar, and the fixes at landing |
| `/plan`'s ledger contents | `plan.md`, `orchestrator-state.md`, `land.sh`, `land.test.sh`, `verify.sh`, `usage.py`, two `.gitkeep` | `plan.md`, `orchestrator-state.md`, two `.gitkeep` |
| README requirements | `bash` and `ps` for `verify.sh`; `node` and `npx` for `land.sh`'s lock wait, the usage rows and the skills CLI | `bash` for `checks.sh`; `node` and `npx` for the skills CLI only |

## Wrong or impossible in the brief

1. The brief's list of lines to rewrite leaves out `docs/academic-coverage.md` 155 and 177, which the brief's own grep pattern `usage row` matches on 6c41c02 (`git grep -n -e 'usage row' ... 6c41c02` counts 2 lines there). Both say the plan ledger books a usage row per step, which is false after this step. The file is not in "Paths this step writes", so the Cases grep cannot reach exit 1 within the brief. The orchestrator can widen the path list or fix the two cells at landing.
2. `skills/plan-help/SKILL.md` 70 now reads, as the brief dictates, that `/land` refuses naming a missing "land skill's templates/land.sh", while the brief also removes the `land` skill's Stops row "No landing script" and its "What it reads" 4 carries no refusal. The two texts now disagree on whether `/land` has that refusal. Which one holds is the orchestrator's to rule.
3. The plan's verify list names `verify.test.sh`, which this step deletes, so both runners go red on that line, as the brief expected; the state file's list is the orchestrator's to change at landing.
4. The ASCII check prints `Can't open` warnings for the three deleted files because `git ls-files -c` still lists them in the index; it still exits 0 with no offending line. That the warnings stop once the deletion is committed is not verified, since this step makes no commit.

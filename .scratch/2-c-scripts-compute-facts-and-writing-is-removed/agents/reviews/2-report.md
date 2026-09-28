Everything in the brief is done, with the twelve rulings of repair round 1 made (section "Repair round 1" at the end).

## Open items of the state file, verbatim

```
## Open items (only what the user must rule on: a stop, and a proposal of the recurring-findings pass; repeated verbatim after the position line of the orchestrator's reports and the landing report until ruled)

- none.
```

## First run of the cases on the unchanged tree

`checks.test.sh` and the four-case `land.test.sh` were written before any code change. The run below is on a scratch copy of the base tree outside the worktree: `git -C <worktree> archive 410997a | tar -x -C <scratch folder>`, which holds the base `land.sh`, `land.test.sh`, `usage.py`, `verify.sh` and `verify.test.sh` and no `checks.sh`. The two tests as they now stand (the failing-list command as repair round 1 item 4 set it) were copied into its `skills/land/templates/` with `fail`'s `    exit 1` replaced by `    : continue` (`grep -c ': continue'` prints 1 for each file), so every case runs and not only the first. Each test ran from the scratch copy's root under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`. The trailing `PASS:` line of each run is printed by the `: continue` copy after its failures, and the real test would have stopped at its first `FAIL:` with exit 1. Output, verbatim:

```
$ sh skills/land/templates/land.test.sh
arguments failed: invalid package name: ledger/plan/orchestrator-state.md
FAIL: conflict exited 64, expected 2
arguments failed: invalid package name: ledger/plan/orchestrator-state.md
FAIL: conflict: missing [Conflicting paths:
base.txt]
arguments failed: invalid package name: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/land-test.7BBPMM/ledger/tools/b/.scratch/plan/orchestrator-state.md
FAIL: ledger landing exited 64, expected 0
FAIL: ledger landing staged [], expected [tools/b/change.txt]
arguments failed: invalid package name: ledger/plan/orchestrator-state.md
FAIL: failing check exited 64, expected 1
arguments failed: invalid package name: ledger/plan/orchestrator-state.md
FAIL: failing check: missing [checks: failed with exit 1: false]
arguments failed: invalid package name: ledger/plan/orchestrator-state.md
FAIL: clean landing exited 64, expected 0
arguments failed: invalid package name: ledger/plan/orchestrator-state.md
FAIL: clean landing: missing [checks: 1 commands passed]
FAIL: clean landing staged [], expected [change.txt pending.txt]
PASS: land.sh scratch tests
exit 0
$ sh skills/land/templates/checks.test.sh
sh: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/base.S3sY1o/skills/land/templates/checks.sh: No such file or directory
FAIL: failing list exited 127, expected 1
sh: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/base.S3sY1o/skills/land/templates/checks.sh: No such file or directory
FAIL: failing list: missing [checks: failed with exit 3: sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1]
sh: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/base.S3sY1o/skills/land/templates/checks.sh: No such file or directory
FAIL: failing list echo: missing [$ echo first ran]
sh: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/base.S3sY1o/skills/land/templates/checks.sh: No such file or directory
FAIL: passing list exited 127, expected 0
sh: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/base.S3sY1o/skills/land/templates/checks.sh: No such file or directory
FAIL: passing list: missing [checks: 2 commands passed]
sh: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/base.S3sY1o/skills/land/templates/checks.sh: No such file or directory
FAIL: no yaml block exited 127, expected 2
sh: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/base.S3sY1o/skills/land/templates/checks.sh: No such file or directory
FAIL: no yaml block: missing [checks: ]
PASS: checks.sh scratch tests
exit 0
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
| 6. texts: usage rows, tables, a ledger's `land.sh` gone | DONE (repair round 1, item 1) | `git grep -n -e 'usage row' -e 'usage table' -e 'Usage section' -e "ledger's .land\.sh" -- ':!.scratch' ':!docs/roadmap.md'; echo "exit $?"` | `exit 1`, no line; before, on 6c41c02: 28 lines over 9 files |
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
| `projects:` form reads the matched project's `worktree_root` | ledger | `project["worktree_root"]` (`land.sh` line 207) replaced by `".agents/worktrees"` | `FAIL: ledger landing exited 1, expected 0` |
| one-project form reads `worktree_root` | conflict | `config["worktree_root"]` (`land.sh` line 216) replaced by `".agents/worktrees"` | `FAIL: conflict exited 1, expected 2` |
| main's cherry-pick stages the range | ledger | `run_step "main git cherry-pick" ...` replaced by `:` | `FAIL: ledger landing staged [], expected [tools/b/change.txt]` |

The check in the clean case runs `test -f change.txt` from the repository root, so it passes only after main's cherry-pick; the main cherry-pick revert above turns the ledger case red first, since it runs before the clean case.

The kept git work that none of the four cases reaches (the resume of a landing stopped after its checkout, the lock wait and its stale-lock rule, the empty range) has no case in `land.test.sh`, because the brief and the approved plan hold it to four cases (brief decision 5). The one line of that work this step changed, the lock age now read with `python3`, was run by hand as the DONE table shows.

## Files

This table is the count after round 0; the table under "Line counts after the round" in the section "Repair round 1" gives the counts that landed.

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
4. In the `projects:` form, when ledger roots nest the deepest one that holds the state file is taken, and a project with no `ledger_root` is refused with exit 64, as the brief's "no `ledger_root`". `worktree_root` is a required key in both forms, refused with exit 64 when missing (repair round 1, item 6).
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
| `/land`'s "No landing script" refusal | a Stops row of the `land` skill: the ledger folder holds no `land.sh`; resumed by copying `templates/land.sh`, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.py` into the ledger with the `ADAPT` edits (the `plan` skill's Steps 5), then `/land` again | none; `land.sh` ships in the `land` skill, and a missing `checks.sh` beside it is `land.sh`'s exit-64 refusal `preflight failed: checks.sh not found beside land.sh: <path>`, before anything is touched |

## Wrong or impossible in the brief

1. The brief's list of lines to rewrite leaves out `docs/academic-coverage.md` 155 and 177, which the brief's own grep pattern `usage row` matches on 6c41c02 (`git grep -n -e 'usage row' ... 6c41c02` counts 2 lines there). Both say the plan ledger books a usage row per step, which is false after this step. The file is not in "Paths this step writes", so the Cases grep cannot reach exit 1 within the brief. The orchestrator can widen the path list or fix the two cells at landing. Ruled in repair round 1 (item 1): the path list was widened to those two lines, and they are rewritten.
2. `skills/plan-help/SKILL.md` 70 now reads, as the brief dictates, that `/land` refuses naming a missing "land skill's templates/land.sh", while the brief also removes the `land` skill's Stops row "No landing script" and its "What it reads" 4 carries no refusal. The two texts now disagree on whether `/land` has that refusal. Which one holds is the orchestrator's to rule. Ruled in repair round 1 (item 2): line 70 now names the step's dispatch block, and `/land` has no "No landing script" refusal.
3. The plan's verify list names `verify.test.sh`, which this step deletes, so both runners go red on that line, as the brief expected; the state file's list is the orchestrator's to change at landing.
4. The ASCII check prints `Can't open` warnings for the three deleted files because `git ls-files -c` still lists them in the index; it still exits 0 with no offending line. That the warnings stop once the deletion is committed is not verified, since this step makes no commit.

## Repair round 1

Every ruling of `agents/briefs/2-round-1.md` is made; none was found wrong. Tests ran under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

### Items

1. `docs/academic-coverage.md` 155 now ends "... because `repair_rounds` caps each step's repair rounds and each step's landing report states its agents' tokens, tool uses and time." and 177's last sentence reads "The plan ledger already records each decision and finding, each landing report states the agents' tokens, tool uses and time, and no new skill scores the user." The rest of both lines is unchanged (`git diff --numstat docs/academic-coverage.md`: `2` added and `2` deleted). The Cases grep `git grep -n -e 'usage row' -e 'usage table' -e 'Usage section' -e "ledger's .land\.sh" -- ':!.scratch' ':!docs/roadmap.md'; echo "exit $?"` prints `exit 1` and no line.
2. `skills/plan-help/SKILL.md` 70 reads "/land refuses                 it names what is missing, such as a finding neither closed nor raised as an open item, or the step's dispatch block: supply it, then /land again". `git grep -n 'No landing script' -- skills docs README.md` prints nothing.
3. `skills/plan-orchestration/SKILL.md` Steps 6 has the bullet "The orchestrator writes the builder's tokens, tool uses and time, from its completion notice, into the dispatch block under `builder_usage`, beside `report`, on disk; the next resume-point commit carries them." The dispatch comment of `skills/plan/templates/orchestrator-state.md` 26 names "builder_usage (the builder's tokens, tool uses and time from its completion notice) beside report when the builder's report is saved" between `session_id` and `reviewer_report`. `skills/land/SKILL.md` Steps 9 reads "The booking states the builder's and each reviewer's tokens, tool uses and time, from their completion notices, read from the dispatch block's `builder_usage` and `reviewer_report`." Shown by `git grep -n builder_usage -- skills`: `skills/land/SKILL.md:87`, `skills/plan-orchestration/SKILL.md:77`, `skills/plan/templates/orchestrator-state.md:26`.
4. `checks.test.sh`'s failing-list case keeps its three commands, and its second is now `sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1`, asserting exit 1 and `checks: failed with exit 3: sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1`. The head comment says the case holds only under pipefail. Revert proof on a scratch copy, `["bash", "-o", "pipefail", "-c", command]` changed to `["bash", "-c", command]`:

   ```
   $ echo first ran
   first ran
   $ sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1
   FAIL: x
   $ touch third-ran
   checks: 3 commands passed
   FAIL: failing list exited 0, expected 1
   exit 1
   ```

5. The block "First run of the cases on the unchanged tree" above is replaced by the verbatim output of a rerun on `git -C <worktree> archive 410997a | tar -x -C <scratch folder>`, with the procedure stated there.
6. `land.sh` refuses a missing `worktree_root` with exit 64 in both forms, and the default is gone from its head comment, from `README.md` 119 ("`land.sh` reads `worktree_root` and `ledger_root` from `.agents/plan.yaml`, and refuses with exit 64 when either is missing.") and from `skills/land/SKILL.md` 125, whose refusal bullet 128 now names "no `worktree_root`". `land.test.sh` keeps its four cases. Hand run on a scratch repository:

   ```
   --- one-project form, no worktree_root
   configuration failed: no worktree_root in .agents/plan.yaml
   exit 64
   --- projects: form, the matched project without worktree_root
   configuration failed: no worktree_root of the project b in .agents/plan.yaml
   exit 64
   ```

7. `docs/dev/building.md` 21 reads "`2`: it refused before running anything: no argument or more than one, `python3`, PyYAML or `bash` missing, a state file it cannot read, no usable `yaml` block, or a `verify:` list that is missing, empty or holds an item that is not a command."
8. `land.sh`'s exit-1 list now names each stop, checked against `grep -n 'fail "\|exit \|refuse(' skills/land/templates/land.sh`: checks.sh non-zero (the `checks failed` line); not the root of a git checkout (`run this script from the repository root`); the script's folder unresolved; `python3` missing; PyYAML missing (the Python `refuse(..., 1)`); the temporary directory, and the ledger ignore file written in it; the worktree not found; the main checkout's branch or the step worktree's branch unreadable; main not on `main`, or the worktree on another branch; the seven refusals of a resume's preflight (main staged or unmerged, main's staged state unreadable, a cherry-pick in progress, `<step>-land`'s status unreadable, changes not committed, the comparison failing, a foreign commit); the lock held past the bound, its `.git` unresolved, a stale lock not removable. The git steps that end with git's own status (`run_step`, the `diff --cached`, the `rev-list --count`, a cherry-pick failure without a conflict, the two booking diffs) stay under the `n` line.
9. `skills/land/SKILL.md` 136 ends "..., and 64 when it refuses its arguments or its configuration, or with git's own status when a git step fails.", and `skills/plan/templates/orchestrator-state.md` 46 reads "... 2 on a conflict and 64 on a refusal, or with git's own status when a git step fails; ...".
10. `skills/land/SKILL.md` 144 starts "- `land.sh`'s zero exit passes the checks on main (Steps 6)."
11. `land.sh` checks, right after resolving its own folder and before reading the configuration or any git step, `[ ! -f "$landing_script_dir/checks.sh" ]`, refused with `preflight failed: checks.sh not found beside land.sh: <path>` and exit 64. The refusal is in the head comment's exit-64 list and in `skills/land/SKILL.md` 128. Hand run with `land.sh` copied alone into a folder of a scratch repository whose worktree `st` held an uncommitted `z.txt`:

    ```
    --- land.sh alone in a folder, no checks.sh beside it
    preflight failed: checks.sh not found beside land.sh: /private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/r1.1x8B4j/alone/checks.sh
    exit 64
    --- after: main HEAD, main status, worktree branch and log
    main HEAD unchanged
    ?? alone/
    st
           1
    ?? z.txt
    ```

    Main's HEAD is the base, main has nothing staged (`?? alone/` is the scratch folder holding the copy), the worktree is still on `st` with its one commit, and `z.txt` is still uncommitted, so no wip commit was made.
12. The user-visible table above has the row for `/land`'s "No landing script" refusal, before and after.

### Verification after the round

The brief's verify 1, the old runner:

```
PASS: land.sh scratch tests
RED: sh skills/land/templates/verify.test.sh 2>&1 | tail -1
exit status: 127
sh: skills/land/templates/verify.test.sh: No such file or directory
exit 1
```

The other commands by hand, each through `bash -o pipefail -c`:

```
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
exit 0
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
exit 0
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
exit 0
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
exit 0
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
exit 0
$ ascii check
Can't open skills/land/templates/usage.py: No such file or directory at -e line 1.
Can't open skills/land/templates/verify.sh: No such file or directory at -e line 1.
Can't open skills/land/templates/verify.test.sh: No such file or directory at -e line 1.
exit 0
```

Verify 2, `sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md`:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/verify.test.sh 2>&1 | tail -1
sh: skills/land/templates/verify.test.sh: No such file or directory
checks: failed with exit 127: sh skills/land/templates/verify.test.sh 2>&1 | tail -1
exit 1
```

Verify 2 on a scratch copy of the state file whose `verify.test.sh` line is replaced by `sh skills/land/templates/checks.test.sh 2>&1 | tail -1` (`diff` shows that one line and nothing else):

```
8c8
< - sh skills/land/templates/verify.test.sh 2>&1 | tail -1
---
> - sh skills/land/templates/checks.test.sh 2>&1 | tail -1
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { exit($bad ? 1 : 0) }'
Can't open skills/land/templates/usage.py: No such file or directory at -e line 1.
Can't open skills/land/templates/verify.sh: No such file or directory at -e line 1.
Can't open skills/land/templates/verify.test.sh: No such file or directory at -e line 1.
checks: 7 commands passed
exit 0
```

The Cases and verify 4:

```
$ sh skills/land/templates/checks.test.sh
PASS: checks.sh scratch tests
exit 0
$ sh skills/land/templates/land.test.sh
PASS: land.sh scratch tests
exit 0
$ git grep verify.sh usage.py ADAPT no-browser
exit 1
$ git grep usage row ...
exit 1
$ grep -n node land.sh
exit 1
$ ascii over written files
exit 1
```

The two grep lines run the Cases' commands as the brief writes them; the ASCII line is `LC_ALL=C grep -n '[^ -~]'` over the 16 files the step writes, `docs/academic-coverage.md` included, and this report.

The brief's revert proofs, rerun on a scratch copy (the `FAIL: x` lines in the first two are the failing command's own output, shown by `grep -A1 '^FAIL'`):

```
-- pipefail removed from checks.sh
FAIL: x
$ touch third-ran
--
FAIL: failing list exited 0, expected 1
-- checks.sh exit 0 on a failed command
FAIL: x
checks: failed with exit 3: sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1
FAIL: failing list exited 0, expected 1
-- land.sh call of checks.sh removed
FAIL: failing check exited 0, expected 1
-- ledger root dropped from the add
FAIL: ledger landing staged [tools/b/.scratch/plan/agents/reviews/report.md
tools/b/change.txt], expected [tools/b/change.txt]
```

### Line counts after the round

| File | Lines now (`wc -l`) | `git diff --numstat` against the base |
|---|---|---|
| `skills/land/templates/checks.sh` | 119 | new |
| `skills/land/templates/checks.test.sh` | 77 | new |
| `skills/land/templates/land.sh` | 468 | +213 -231 |
| `skills/land/templates/land.test.sh` | 156 | +113 -1035 |
| `skills/land/templates/verify.sh` | deleted | -245 |
| `skills/land/templates/verify.test.sh` | deleted | -510 |
| `skills/land/templates/usage.py` | deleted | -141 |
| `skills/land/SKILL.md` | 199 | +42 -43 |
| `skills/plan/SKILL.md` | 89 | +4 -14 |
| `skills/plan/templates/orchestrator-state.md` | 62 | +3 -8 |
| `skills/spec/templates/brief.md` | 63 | +1 -1 |
| `skills/refute/SKILL.md` | 144 | +3 -3 |
| `skills/plan-orchestration/SKILL.md` | 310 | +13 -19 |
| `skills/plan-help/SKILL.md` | 94 | +2 -2 |
| `README.md` | 146 | +8 -12 |
| `docs/dev/building.md` | 27 | +10 -10 |
| `docs/dev/change-standard.md` | 64 | +3 -3 |
| `skills/repo-setup/templates/docs/dev/change-standard.md` | 50 | +1 -1 |
| `docs/academic-coverage.md` | 241 | +2 -2 |

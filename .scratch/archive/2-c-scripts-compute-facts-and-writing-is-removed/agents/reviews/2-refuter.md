# Step 2 refuter report (on .agents/worktrees/2c-2, base 410997a352e408005a7949d2f24f47771a663b22)

## Verification (rerun by the reviewer)

Every command was run from the worktree root. The ones that touch skill folders ran under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`. The worktree's copy of the state file carries the same verify list as the main checkout's: `diff` of lines 5-30 of the two files exits 0.

Brief, verify 1: the plan's list through the old installed runner.

```
$ sh ~/.claude/skills/land/templates/verify.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md; echo "exit $?"
PASS: land.sh scratch tests
RED: sh skills/land/templates/verify.test.sh 2>&1 | tail -1
exit status: 127
sh: skills/land/templates/verify.test.sh: No such file or directory
exit 1
```

Brief, verify 1: the other commands of the list by hand, each through `bash -o pipefail -c`.

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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'   (the ASCII check as written in the list)
Can't open skills/land/templates/usage.py: No such file or directory at -e line 1.
Can't open skills/land/templates/verify.sh: No such file or directory at -e line 1.
Can't open skills/land/templates/verify.test.sh: No such file or directory at -e line 1.
exit 0
```

Plan verify list (a): the new runner on the state file as it is.

```
$ sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md; echo "exit $?"
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/verify.test.sh 2>&1 | tail -1
sh: skills/land/templates/verify.test.sh: No such file or directory
checks: failed with exit 127: sh skills/land/templates/verify.test.sh 2>&1 | tail -1
exit 1
```

Plan verify list (b): the new runner on a scratch copy of the state file whose line 8 is `- sh skills/land/templates/checks.test.sh 2>&1 | tail -1` (the `diff` of the copy against the original shows that one line and nothing else).

```
$ sh skills/land/templates/checks.sh <scratch>/state-copy.md; echo "exit $?"
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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
Can't open skills/land/templates/usage.py: No such file or directory at -e line 1.
Can't open skills/land/templates/verify.sh: No such file or directory at -e line 1.
Can't open skills/land/templates/verify.test.sh: No such file or directory at -e line 1.
checks: 7 commands passed
exit 0
```

Brief, Cases.

```
$ git show 410997a352e408005a7949d2f24f47771a663b22:skills/land/templates/checks.test.sh
fatal: path 'skills/land/templates/checks.test.sh' exists on disk, but not in '410997a352e408005a7949d2f24f47771a663b22'
$ sh skills/land/templates/checks.test.sh; echo "exit $?"
PASS: checks.sh scratch tests
exit 0
$ sh skills/land/templates/land.test.sh; echo "exit $?"
PASS: land.sh scratch tests
exit 0
$ git grep -n -e verify.sh -e usage.py -e ADAPT -e no-browser -- ':!.scratch' ':!docs/roadmap.md'; echo "exit $?"
exit 1
$ git grep -n -e 'usage row' -e 'usage table' -e 'Usage section' -e "ledger's .land\.sh" -- ':!.scratch' ':!docs/roadmap.md'; echo "exit $?"
docs/academic-coverage.md:155:| `SKILL.md` | rebuild: researcher | ... the plan ledger books each step's usage row. ...
docs/academic-coverage.md:177:| `references/process_summary_protocol.md` | drop | ... The plan ledger already records each decision, finding and usage row, and no new skill scores the user. |
exit 0
$ grep -n node skills/land/templates/land.sh; echo "exit $?"
exit 1
```

The "before" of the first grep, counted with a plain `grep -rnI` over the main checkout (whose tree outside `.scratch` equals the base: `git diff --stat 410997a HEAD` names only the state file), `.git`, `.scratch`, `.agents` and `docs/roadmap.md` left out: 138 lines over 15 files, as the report says. The second pattern over the same tree: 28 lines over 9 files, 2 of them in `docs/academic-coverage.md`, which matches the report's "26 lines over 8 files" plus the two lines left.

Brief, verify 4: `LC_ALL=C grep -n '[^ -~]'` over the 15 written files and the report: no line, exit 1. `wc -l` and `git diff --numstat 410997a` reproduce every line count and every +/- of the report's Files table.

Revert proofs, each made on a scratch copy of `skills/land/templates/` and run there:

```
checks.sh sys.exit(1) after the failure line -> sys.exit(0):     FAIL: failing list exited 0, expected 1
checks.sh that sys.exit(1) removed:                               FAIL: failing list exited 0, expected 1
checks.sh count printed as len(commands) - 1:                     FAIL: passing list: missing [checks: 2 commands passed]
checks.sh "has no yaml block" refusal -> sys.exit(1):             FAIL: no yaml block exited 1, expected 2
land.sh `sh "$landing_script_dir/checks.sh" ...` -> true:          FAIL: failing check exited 0, expected 1
land.sh add without ":(exclude,literal)$3":                       FAIL: ledger landing staged [tools/b/.scratch/plan/agents/reviews/report.md
                                                                  tools/b/change.txt], expected [tools/b/change.txt]
land.sh conflict `exit 2` -> `exit 1`:                            FAIL: conflict exited 1, expected 2
land.sh projects: worktree_root -> ".agents/worktrees":           FAIL: ledger landing exited 1, expected 0
land.sh one-project worktree_root -> ".agents/worktrees":         FAIL: conflict exited 1, expected 2
land.sh main's cherry-pick -> ":":                                 FAIL: ledger landing staged [], expected [tools/b/change.txt]
checks.sh ["bash", "-o", "pipefail", "-c", ...] -> ["bash", "-c", ...] (the reviewer's own revert):
                                                                  PASS: checks.sh scratch tests; PASS: land.sh scratch tests
```

First run of the cases on the unchanged scripts (the new tests beside the base `land.sh`, `verify.sh` and `usage.py`, no `checks.sh`, `fail`'s `exit 1` replaced by `: continue`): every land case exits 64 with `arguments failed: invalid package name: <state file>`, and every checks case exits 127 with `sh: .../checks.sh: No such file or directory`. The substance of the report's first run reproduces.

checks.sh refusals, each tried on a scratch file (every one exit 2, a `checks: ` line, and the marker command `touch ran` not run): no argument; two arguments; a missing file; a directory; a file with mode 000 (`Permission denied`); no yaml block; an unclosed block; invalid YAML; no `verify:` key; `verify:` with no value (`is not a list`); `verify: []` (`is empty`); `verify: "touch ran"` (`is not a list`); an item `5`; an item `""`; an item holding `\0`; a file that is not UTF-8; `python3` not on `PATH`; `bash` not on `PATH`; a `python3` run with `-S` (`python3 cannot import yaml; install PyYAML`). A `text` block before a `YML` block runs the `YML` block's list; a `~~~yaml` block runs.

land.sh, tried on scratch repositories: no `.agents/plan.yaml`, no `ledger_root`, a one-project state file outside `ledger_root`, a `projects:` state file under no project's `ledger_root`, a project with no `ledger_root`, a missing state file, `ledger_root: ../led`, `ledger_root: .`, `worktree_root: /abs`, a plan.yaml that is not a mapping, invalid YAML, two arguments, the old two-argument form, four arguments, a step `a/b`, a base `xyz`, `LANDING_LOCK_WAIT=1s`: each exit 64 with its message. Nested ledger roots `led` and `led/b` take `led/b` and its `worktree_root` (`worktree not found: .../wt-b/st`, exit 1). A missing `worktree_root` takes `.agents/worktrees`. Run from a subfolder: `preflight failed: run this script from the repository root`, exit 1. The kept git work: an empty range with only an uncommitted ledger file prints `nothing to copy: <base>..st holds no commit`, runs the list (`checks: 1 commands passed`), stages nothing, exit 0; a worktree left on `st-land` prints `resume: the worktree is back on st, st-land removed` and lands, exit 0; a fresh worktree lock with `LANDING_LOCK_WAIT=2` stops with `index lock failed: ... still held after 2 s of waiting; main is untouched; the worktree is on st. ...`, exit 1; a main lock with mtime 2020-01-01 is removed and the landing exits 0. No `ADAPT`, `find_template`, `--no-browser`, `--session`, `--since` or `node` is left in `land.sh` (the grep of the removed names above, and `grep -n node`).

## 1. Spec

- `docs/academic-coverage.md:155` and `:177`: the brief's Cases grep for `usage row` prints these two lines and exits 0, and "What it must do" says no text of the tree names a usage row. Line 155 reads "the plan ledger books each step's usage row", and line 177 reads "The plan ledger already records each decision, finding and usage row". The brief's "What is on the tree" says it lists every text line its grep matches on 6c41c02, and it leaves these two out, although the same grep over the base tree finds them. The file is outside the brief's path list, so the builder left it. Correct text: line 155, "... end because `repair_rounds` caps each step's repair rounds and each step's landing report states its agents' tokens, tool uses and time."; line 177, "The plan ledger already records each decision and finding, each landing report states the agents' tokens, tool uses and time, and no new skill scores the user." The step's path list should be widened to take the file. Nothing else in flight writes it (step 4, which edits its lines 30-33, is blocked behind step 3), so the fix can be made at landing or in the repair round. Booking it for a later step would be the lazy option.
- `skills/plan-help/SKILL.md:70`: "/land refuses ... such as a finding neither closed nor raised as an open item, or the land skill's templates/land.sh: supply it, then /land again". The brief dictated this text and also removed the `land` skill's Stops row "No landing script". After the step, `skills/land/SKILL.md` "What it reads" 4 (line 35) states no refusal, and its Stops table (lines 164-174) has no row for a missing `land.sh`. The `land` skill's text is right. `land.sh` ships in the `land` skill's own `templates/`, beside the `SKILL.md` that `/land` runs from, so a user has nothing to "supply" into a ledger. A missing script means a broken install, and `utils/pin.sh` repairs that. Correct text for line 70: "it names what is missing, such as a finding neither closed nor raised as an open item, or the step's dispatch block: supply it, then /land again". Both of those examples are Stops rows of the `land` skill ("The step not ready", "No dispatch block"). A missing `checks.sh` beside `land.sh` has its own finding under Behaviour.
- The builder's usage has no place in the ledger before the landing. Decision C and `skills/land/SKILL.md:87` have the booking state "the builder's and each reviewer's tokens, tool uses and time, from their completion notices". The step gives the reviewer's notice a place on disk: `skills/refute/SKILL.md:60` and `skills/plan-orchestration/SKILL.md:89` put it beside `reviewer_report`. It gives the builder's notice none. `skills/plan-orchestration/SKILL.md` Steps 6 (lines 73-77) saves the builder's report and says nothing of its usage. The dispatch block's comment in `skills/plan/templates/orchestrator-state.md:26` names no usage field. Before the step, the builder's row went into the state file's Usage table. After it, a handover or a compaction between the builder's completion and the landing loses the builder's numbers. "Resuming, and handing the plan over" (line 138) forbids that: "Nothing needed to continue lives only in a runner's memory". No brief item covers this. Fix: Steps 6 writes the builder's tokens, tool uses and time, from its completion notice, into the dispatch block beside `report`. Each repair round's reply does the same beside its round entry. The dispatch comment of `templates/orchestrator-state.md:26` names the field.

## 2. Proof

- `skills/land/templates/checks.test.sh` (whole file): no case checks that a command runs under `pipefail`. With `"-o", "pipefail"` removed from `checks.sh:108`, both `checks.test.sh` and `land.test.sh` print `PASS:`. On a scratch state file whose only command is `sh -c "echo FAIL: x; exit 1" 2>&1 | tail -1`, that reverted copy prints `checks: 1 commands passed` and exits 0, while the real `checks.sh` prints `checks: failed with exit 1: ...` and exits 1. Every command of the plan's verify list pipes into `tail -1`. Decision E rests on this rule, and `checks.sh`'s head comment (line 8) states it, so rule 13 of `docs/dev/change-standard.md` requires a case for it. The brief's three cases did not ask for one, so this is also a gap in the brief. Fix: make the failing-list case's second command a failing command piped into `tail -1` (for example `sh -c 'echo x; exit 3' | tail -1`, asserting `checks: failed with exit 3: ...`), or add that command to the list. The revert above then turns it red.
- Report, "First run of the cases on the unchanged tree" (lines 15-32): the quoted block is not what the described procedure prints. With `fail`'s `exit 1` replaced by `: continue`, each run prints an `arguments failed: invalid package name: ...` line for every land case and a `missing [...]` line for every `assert_contains`. For example, `FAIL: failing list: missing [checks: failed with exit 3: sh -c 'exit 3']` and `FAIL: failing list echo: missing [$ echo first ran]` appear in the reviewer's run and not in the report. The report's order of the checks lines (failing, no yaml block, passing) is also not the file's order (failing, passing, no yaml block). The substance reproduces: every case is red, at exit 64 or 127. Change standard rule 7 requires this output verbatim, and here it was edited.

## 3. Standards

- `README.md:105` against `README.md:119`, `skills/land/SKILL.md:125` and `skills/land/templates/land.sh:49-51,188,195`: README 105 says `worktree_root` is one of the nine required keys and that "A skill that needs a missing required key stops and names it". `skills/plan/templates/plan.yaml:10` marks it `# required.`, and `skills/land/SKILL.md:28-29` ("What it reads" 1) makes a missing required key a refusal. The step makes `land.sh` default a missing `worktree_root` to `.agents/worktrees` without a word, and README 119 and land SKILL.md 125 say "(default `.agents/worktrees`)". These statements contradict each other (change standard rule 19). The brief dictated the default, since its item 3 says "`worktree_root` (default `.agents/worktrees`)", so the choice is the orchestrator's. Recommended: `land.sh` refuses a missing `worktree_root` with exit 64, as it does `ledger_root`, in both forms. The "(default ...)" is dropped from README 119, land SKILL.md 125 and `land.sh`'s head comment, lines 49 and 51.
- `docs/dev/building.md:21`: "`2`: it refused before running anything: no argument or more than one, a state file it cannot read, no usable `yaml` block, or a `verify:` list that is missing, empty or holds an item that is not a command." `checks.sh` also exits 2 when `python3`, PyYAML or `bash` is missing (head comment lines 19-20, code lines 31-38 and 52; reproduced above). The page's list of exit-2 causes is therefore incomplete, and building.md line 17 says the runner "needs `python3` with PyYAML and `bash`" without saying what happens when one is missing. Fix: add "`python3`, PyYAML or `bash` missing" to line 21.
- `skills/land/templates/land.sh:55-70`: change standard rule 14 says a head comment lists every error the script prints and its exit status. Exit 1 is also returned for "could not create a temporary directory" (line 117), "could not write" the ignore file (line 218), "cannot resolve the folder of $0" (line 112), and "cannot read the main checkout branch" and "cannot read the step worktree branch" (lines 298, 308). None of these appears in the exit-1 list. Fix: add them to the exit-1 list of the head comment.
- `skills/land/SKILL.md:136` and `skills/plan/templates/orchestrator-state.md:46`: "It exits 0 ..., 1 on a failed check or a stop, 2 on a conflict, and 64 ...". `land.sh`'s head comment line 63 has a fifth case: a failed git step ends the landing with git's own exit status (for example 128). Both texts present the four statuses as the whole list. Fix: add "or git's own status when a git step fails" to both, matching the head comment.
- `skills/land/SKILL.md:144`: "- Its zero exit passes the checks on main (Steps 6)." now follows the bullet on `templates/checks.test.sh`, so "Its" reads as that test's exit. The step rewrote the section. `docs/dev/prose-standard` E (cold opens) applies. Fix: "- `land.sh`'s zero exit passes the checks on main (Steps 6)."

## 4. Behaviour

- `land.sh` finds out that `checks.sh` is missing from its own folder only after it has touched both checkouts. On a scratch repository with `land.sh` copied alone into a folder, the run made the wip commit in the worktree, left the worktree on `st-land` and staged the range on main (`A  z.txt`). Only then did it print `sh: .../alone/checks.sh: No such file or directory` and `checks failed: checks.sh exited 127`, exit 1. The base `land.sh` refused a missing `verify.sh` before main was touched (base lines 195-200, "preflight failed: verify.sh not found ..."). The report does not state this change. Fix: a preflight in `land.sh`, before any git step, `[ -f "$landing_script_dir/checks.sh" ] || fail "preflight failed: checks.sh not found beside land.sh: $landing_script_dir" 64`, with the refusal added to the head comment's exit-64 list and a case in `land.test.sh`.
- The report's user-visible table does not state that `/land` loses its Stops row "No landing script", which was the refusal of a ledger without `land.sh`. With the texts this step writes, `/land` never shows that refusal again, and plan-help line 70 still says it does (see Spec).

## Declined to judge

- The builder's extra refusals in `checks.sh` (exit 2 for a missing `python3`, PyYAML or `bash`, for a NUL in an item, and for an item that is only whitespace). Judged against open item A, they are not findings. The ruling reserves exit 1 for "stops at the first non-zero exit" and makes exit 2 the refusal before anything runs. Without these refusals, a missing PyYAML gives a Python traceback with exit 1, which reads as a failed command. A missing `python3` gives exit 127 from `exec`. A NUL item raises a `ValueError` after the earlier commands have run. Each refusal keeps the ruling's split between "refused" and "a command failed". The only defect they leave is the incomplete page, reported under Standards.
- The brief's line numbers for the base `land.sh` are off by one to three lines in places: `node` at 162-164 and 253, not 163-165 and 250; the usage rows at 445-462. No decision rests on them.
- `land.test.sh` has no case for the resume, the lock wait, the stale-lock rule, the empty range or the exit-64 refusals, which change standard rule 13 would ask for. The brief's decision 5 and the approved plan hold the file to four cases. The reviewer ran each of these by hand (above), and each behaves as the head comment states. Whether rule 13 or the approved four-case limit governs is the orchestrator's decision.
- The ASCII check's `Can't open` warnings for the three deleted files. They come from the files still being in the index of an uncommitted worktree, and the check exits 0. That they stop after the landing's commit is not verified.

## Not checked

- `checks.sh` and `land.sh` under `dash`. The removed `verify.test.sh` ran its runner under `dash` when it was installed. Nothing in the brief asks for that now, and the reviewer did not look for `dash`.
- The interruption of `checks.sh` by a signal (INT, TERM) and the exit status it then returns. The base `verify.sh` documented 128+n for this, and `checks.sh`'s head comment only covers a command ended by a signal.
- A state file or ledger root reached through a symbolic link: `land.sh` compares `os.path.realpath` of the state file with the literal `ledger_root`.

Reviewer usage: not available to the reviewer; the orchestrator takes it from the completion notice.

## Repair round 1, refuted

On `.agents/worktrees/2c-2`, base `410997a352e408005a7949d2f24f47771a663b22`. Every command ran from the worktree root unless named otherwise; those that touch skill folders ran under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`. The worktree's state file and the main checkout's hold the same verify list (lines 1-33 equal; the first difference is the dispatch block at line 34). No round-0 snapshot of the tree exists, so the round's delta was read as the whole diff since the base against the twelve rulings of `agents/briefs/2-round-1.md` and the first refuter report's quoted hunks and line numbers.

```
$ sh ~/.claude/skills/land/templates/verify.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md; echo "exit $?"
PASS: land.sh scratch tests
RED: sh skills/land/templates/verify.test.sh 2>&1 | tail -1
exit status: 127
sh: skills/land/templates/verify.test.sh: No such file or directory
exit 1
```

The other commands of the list by hand, each through `bash -o pipefail -c`:

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
$ ascii (the list's perl command as written)
Can't open skills/land/templates/usage.py: No such file or directory at -e line 1.
Can't open skills/land/templates/verify.sh: No such file or directory at -e line 1.
Can't open skills/land/templates/verify.test.sh: No such file or directory at -e line 1.
exit 0
```

`checks.sh` on the state file as it is:

```
$ sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md; echo "exit $?"
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/verify.test.sh 2>&1 | tail -1
sh: skills/land/templates/verify.test.sh: No such file or directory
checks: failed with exit 127: sh skills/land/templates/verify.test.sh 2>&1 | tail -1
exit 1
```

`checks.sh` on a scratch copy with that one line replaced (`diff` of copy against original):

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
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
Can't open skills/land/templates/usage.py: No such file or directory at -e line 1.
Can't open skills/land/templates/verify.sh: No such file or directory at -e line 1.
Can't open skills/land/templates/verify.test.sh: No such file or directory at -e line 1.
checks: 7 commands passed
exit 0
```

The Cases:

```
$ git show 410997a...:skills/land/templates/checks.test.sh
fatal: path 'skills/land/templates/checks.test.sh' exists on disk, but not in '410997a352e408005a7949d2f24f47771a663b22'
$ sh skills/land/templates/checks.test.sh; echo "exit $?"
PASS: checks.sh scratch tests
exit 0
$ sh skills/land/templates/land.test.sh; echo "exit $?"
PASS: land.sh scratch tests
exit 0
$ git grep -n -e verify.sh -e usage.py -e ADAPT -e no-browser -- ':!.scratch' ':!docs/roadmap.md'; echo "exit $?"
exit 1
$ git grep -n -e 'usage row' -e 'usage table' -e 'Usage section' -e "ledger's .land\.sh" -- ':!.scratch' ':!docs/roadmap.md'; echo "exit $?"
exit 1
$ grep -n node skills/land/templates/land.sh; echo "exit $?"
exit 1
$ LC_ALL=C grep -n '[^ -~]' <the 16 files the step writes> <the report>; echo "exit $?"
exit 1
```

Revert proofs, each on a fresh copy of `skills/land/templates/*.sh` under the scratch folder, the copy's test run from the copy:

```
-- checks.sh ["bash", "-o", "pipefail", "-c", command] -> ["bash", "-c", command]
$ echo first ran
first ran
$ sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1
FAIL: x
$ touch third-ran
checks: 3 commands passed
FAIL: failing list exited 0, expected 1
exit 1
-- checks.sh sys.exit(1) after the failure line -> sys.exit(0)
FAIL: failing list exited 0, expected 1
-- checks.sh count printed as len(commands) - 1
FAIL: passing list: missing [checks: 2 commands passed]
-- checks.sh "has no yaml block" refusal -> sys.exit(1)
FAIL: no yaml block exited 1, expected 2
-- land.sh line 442 (sh "$landing_script_dir/checks.sh" "$landing_state") -> true
FAIL: failing check exited 0, expected 1
-- land.sh add without ":(exclude,literal)$3"
FAIL: ledger landing staged [tools/b/.scratch/plan/agents/reviews/report.md
-- land.sh conflict exit 2 -> exit 1
FAIL: conflict exited 1, expected 2
-- land.sh main's cherry-pick -> :
FAIL: ledger landing staged [], expected [tools/b/change.txt]
-- land.sh folder(project["worktree_root"], ...) -> folder(".agents/worktrees", ...)
FAIL: ledger landing exited 1, expected 0
-- land.sh folder(config["worktree_root"], ...) -> folder(".agents/worktrees", ...)
FAIL: conflict exited 1, expected 2
```

First run of the cases, ruling 5: `git archive 410997a | tar -x` into the scratch folder, the two current tests copied into its `skills/land/templates/` with `^    exit 1$` replaced by `    : continue` (`grep -c ': continue'` prints 1 for each). The output matches the report's block line for line except the `mktemp` names in the paths:

```
$ sh skills/land/templates/land.test.sh
arguments failed: invalid package name: ledger/plan/orchestrator-state.md
FAIL: conflict exited 64, expected 2
arguments failed: invalid package name: ledger/plan/orchestrator-state.md
FAIL: conflict: missing [Conflicting paths:
base.txt]
arguments failed: invalid package name: /private/var/folders/.../land-test.qIArJ0/ledger/tools/b/.scratch/plan/orchestrator-state.md
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
sh: <scratch>/base/skills/land/templates/checks.sh: No such file or directory
FAIL: failing list exited 127, expected 1
(the same sh: line before each of the next five FAIL lines)
FAIL: failing list: missing [checks: failed with exit 3: sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1]
FAIL: failing list echo: missing [$ echo first ran]
FAIL: passing list exited 127, expected 0
FAIL: passing list: missing [checks: 2 commands passed]
FAIL: no yaml block exited 127, expected 2
FAIL: no yaml block: missing [checks: ]
PASS: checks.sh scratch tests
exit 0
```

Ruling 6 by hand. On a scratch repository with a step worktree `wt/st` holding an uncommitted `z.txt`, and `.agents/plan.yaml` first `ledger_root: led` alone, then a `projects:` form whose matched project `b` has no `worktree_root`:

```
--- one-project, no worktree_root
configuration failed: no worktree_root in .agents/plan.yaml
exit 64
--- projects, matched project b without worktree_root
configuration failed: no worktree_root of the project b in .agents/plan.yaml
exit 64
--- after
main HEAD unchanged
 M .agents/plan.yaml        (the reviewer's own edit of the fixture between the two runs)
staged: 0
worktree: st, 1 commit, ?? z.txt
```

Ruling 11 by hand. `land.sh` copied alone into a scratch folder; the scratch repository's worktree `st` holds one commit and an uncommitted `z.txt`:

```
--- land.sh alone, no checks.sh
preflight failed: checks.sh not found beside land.sh: <scratch>/alone/checks.sh
exit 64
--- after
main HEAD unchanged
staged: 0
worktree: st, 1 commit past the base, ?? z.txt; branches: st only (no st-land)
--- control: the same repository with the real land.sh
... [st-land 362e3a5] c ... [st-land 27bb079] wip ...
$ true
checks: 1 commands passed
=== booking === ... Staged paths: c.txt z.txt === end booking ===
exit 0
```

Report round-1 claims rerun: `git grep -n builder_usage -- skills` prints `skills/land/SKILL.md:87`, `skills/plan-orchestration/SKILL.md:77`, `skills/plan/templates/orchestrator-state.md:26`; `git grep -n 'No landing script' -- skills docs README.md` prints nothing, exit 1; `git diff --numstat 410997a` and `wc -l` reproduce every row of "Line counts after the round"; `grep -n 'fail "\|exit \|refuse(' skills/land/templates/land.sh` lists 21 exit-1 `fail` calls (22 lines match without a trailing ` 64`, one of them the continued `LANDING_LOCK_WAIT` refusal at line 115, whose `64` is on line 116) plus the PyYAML `refuse(..., 1)`, and each is named in the head comment's exit-1 list (lines 58-73). `git status --short` in the worktree after all runs is the same 20 entries as before them.

The twelve rulings against the tree:

1. `docs/academic-coverage.md:155,177`: both clauses read as ruled, numstat `2 2`; the Cases grep exits 1. Closed.
2. `skills/plan-help/SKILL.md:70`: reads as ruled. Closed.
3. `skills/plan-orchestration/SKILL.md:77`, `skills/plan/templates/orchestrator-state.md:26`, `skills/land/SKILL.md:87`: as ruled. Closed; see the Spec finding on repair-round usage.
4. `skills/land/templates/checks.test.sh:52,57`: the pipeline case; the `pipefail` revert is red. Closed. No check was loosened: the three approved cases keep every assertion they had.
5. Report lines 13-53: reproduced above. Closed.
6. `land.sh:204-205,213-214`, head comment line 51, `README.md:119`, `skills/land/SKILL.md:125,128`: refusal in both forms, default gone. Closed.
7. `docs/dev/building.md:21`: as ruled. Closed.
8. `land.sh:58-73`: every exit-1 stop listed. Closed.
9. `skills/land/SKILL.md:134`, `skills/plan/templates/orchestrator-state.md:46`: both carry git's own status. Closed.
10. `skills/land/SKILL.md:144`: as ruled. Closed.
11. `land.sh:126-128`, head comment line 79, `skills/land/SKILL.md:128`: preflight before any git step, reproduced above. Closed; see the Standards finding on "What it reads" 4.
12. Report line 145: the row is there with before and after. Closed.

### 1. Spec

- `skills/plan-orchestration/SKILL.md:104-105` ("**After each reply.** Read the whole delta. ... invoke `/refute` ... its path and its usage recorded under `reviewer_report` beside the first."): a repair round's reviewer usage has a place, and the round's builder usage has none. Steps 6 (line 77) writes `builder_usage` "On the report", and `/land` Steps 9 (`skills/land/SKILL.md:87`) books the builder's usage from `builder_usage` alone, so the tokens, tool uses and time of a repair round's reply reach the booking only if Steps 6 is read as covering each reply. The ledger's own state file already records the round there (`builder_usage: ... (round 0); 263090 / 24 / 322 s (round 1)`), which the text does not say to do. Line 142's list of on-disk records ("a builder's report saved, a refuter report saved, a reviewer recorded and a ruling booked") also leaves the builder's usage out. Ruling 3 did not ask for this (the first refuter proposed it), so the builder was right not to add it; it is a gap the ruling left. Correct fix, small and inside the brief's "What it must do" (the landing report is where each agent's usage is written), at landing: in Steps 8 "After each reply", add "Add the round's builder tokens, tool uses and time from its completion notice to `builder_usage`, marked with the round." and name "the builder's usage recorded" in line 142's list.

### 2. Proof

- Report `2-report.md:102-121` ("Files" table): `checks.test.sh` 74 lines, `land.sh` 448 and `+194 -232`, `skills/land/SKILL.md` `+41 -42`, `orchestrator-state.md` `+2 -7`, `plan-orchestration/SKILL.md` 309 and `+12 -19`, and no row for `docs/academic-coverage.md`. The rerun gives 77, 468 and `+213 -231`, `+42 -43`, `+3 -8`, 310 and `+13 -19`, and `2 2` for `docs/academic-coverage.md`; the round's table at lines 326-346 carries the right numbers. The report now states two different counts for the same files, and the first set is not the end state (change standard rule 7). Fix at landing: replace the "Files" table's numbers with those of lines 326-346, or delete the older table and point to the round's.
- Report `2-report.md:92-93` (revert proofs): "`project.get("worktree_root", ...)` replaced by `".agents/worktrees"`" and "`config.get("worktree_root", ...)` replaced by ...". After ruling 6, `land.sh` holds no `.get(` (`grep -n 'get(' skills/land/templates/land.sh` exits 1); the code is `folder(project["worktree_root"], ...)` and `folder(config["worktree_root"], ...)` at lines 206 and 215. The same revert on those lines gives the quoted red lines (above), so the proof holds, but the revert the report names cannot be made on the tree. Fix at landing: rewrite the two cells to name `folder(project["worktree_root"], ...)` and `folder(config["worktree_root"], ...)`.

### 3. Standards

- `skills/land/SKILL.md:35` ("4. This skill's `templates/land.sh` and `templates/checks.sh`, as \"The landing script\" says."): after ruling 11 a missing `checks.sh` is a refusal (exit 64, before anything is touched, line 128), and `docs/dev/skill-layout.md` "Sections, in order", row 4, says "An input whose absence is a refusal says so in its item." Item 4 does not, and the Stops table has no row for it, although the report's user-visible row (line 145) calls it "`land.sh`'s exit-64 refusal". Fix at landing: add under item 4 "- A missing `templates/checks.sh` is refused by `land.sh` with exit 64 before anything is touched (\"The landing script\")." A Stops row (When: `land.sh` exits 64 with `checks.sh not found beside land.sh`; What resumes it: the `land` skill reinstalled, then `/land` again) would make the refusal complete; which of the two is the orchestrator's choice.
- `skills/land/templates/land.sh:77-83` (exit-64 list): `land.sh:192` refuses "projects: in .agents/plan.yaml is not a mapping of projects" and `land.sh:185` refuses "cannot read .agents/plan.yaml: ..." for an `OSError` or a file that is not UTF-8, both with exit 64. The list names "no .agents/plan.yaml, or one that is not valid YAML or not a mapping", which covers neither. Change standard rule 14: a head comment lists every error the script prints and its exit status. This predates the round (ruling 8 covered exit 1 only) and the first review did not name it. Fix at landing: add "a projects: key that is not a non-empty mapping; a plan.yaml that cannot be read or is not UTF-8" to the exit-64 list.

### 4. Behaviour

- none. The two behaviours the round adds (the `worktree_root` refusal and the `checks.sh` preflight) are stated with before and after in the report (Judgment calls 4, round items 6 and 11, user-visible row at line 145) and reproduce above.

### Declined to judge

- Rule 13 of the change standard asks for a case per branch; the two refusals ruling 6 and ruling 11 add have hand proofs and no case in `land.test.sh`. The ruling holds `land.test.sh` to its four approved cases, so the hand proofs are what was asked; whether rule 13 or the four-case limit governs is the orchestrator's, as the first review said.
- The exit-status table of `land.sh`'s head comment lists `n` (git's own status) between `2` and `64`, and a git step that fails with status 1 or 2 is then indistinguishable from the rows `1` and `2`. This is the shape the base script had and the rulings kept; no ruling asked for it.

### Not checked

- The exact delta of round 1 against the round-0 tree: no snapshot of the round-0 tree exists (no commit, no patch in the ledger). The round was judged by the twelve rulings, the first review's quoted hunks and line numbers, and the numstat difference between the report's two tables (`land.sh` +19 net lines, `checks.test.sh` +3, the text files +1 each). A change to `land.sh` in the round beyond rulings 6, 8 and 11 that leaves those counts would not be seen.
- `checks.sh` and `land.sh` under `dash`, a signal sent to `checks.sh` itself, and a state file or ledger root reached through a symbolic link, as in the first review.
- That the main checkout of the repository is untouched was not checked with a command; every hand run above was in scratch repositories under the scratch folder, and the tests create theirs under `$TMPDIR`.

Reviewer usage: not available to the reviewer; the orchestrator takes it from the completion notice.

## Closed

- First review, findings 1 to 12 (Spec 1-3, Proof 4-5, Standards 6-10, Behaviour 11-12): each sent to the builder as the ruling of the same number in `agents/briefs/2-round-1.md`, made in repair round 1, and each closure reproduced by the run over the round ("Repair round 1, refuted": "All twelve rulings are closed").
- Round 1, finding 1 (Spec, the builder's usage of a repair round has no place): fixed at landing. `skills/plan-orchestration/SKILL.md` "After each reply" adds the round's builder usage to `builder_usage`, and the list of on-disk records under "Resuming, and handing the plan over" names `builder_usage`.
- Round 1, finding 2 (Proof, the round-0 Files table of the report is stale): fixed at landing. The table is marked as the count after round 0, and points at the round-1 table, which the reviewer's rerun reproduces.
- Round 1, finding 3 (Proof, two revert cells name `.get(` code that is gone): fixed at landing. The cells name `project["worktree_root"]` (`land.sh` line 207) and `config["worktree_root"]` (line 216); rerun on a scratch copy of the landed `land.sh`, the reverts print `FAIL: ledger landing exited 1, expected 0` and `FAIL: conflict exited 1, expected 2`.
- Round 1, finding 4 (Standards, a missing `checks.sh` not stated as a refusal in the `land` skill): fixed at landing. "What it reads" 4 says a `checks.sh` missing beside `land.sh` is a refusal, and the Stops table has the row "No verify runner".
- Round 1, finding 5 (Standards, two exit-64 refusals missing from `land.sh`'s head comment): fixed at landing. The exit-64 list names a plan.yaml that cannot be read or is not UTF-8, and a `projects:` key that is not a mapping of projects.

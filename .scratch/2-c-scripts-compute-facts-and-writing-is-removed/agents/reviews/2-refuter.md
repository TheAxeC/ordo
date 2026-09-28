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

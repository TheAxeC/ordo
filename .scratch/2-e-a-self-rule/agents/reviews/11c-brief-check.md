# Step 11c brief check (on main at 03712ad)

The report of the brief-check agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/11c.md`. `git log --oneline -1` printed `03712ad Land step 11b of plan 2.E.A, the closing of a plan with no agent`. `git status --short` printed only `?? .scratch/2-e-a-self-rule/agents/briefs/11c.md`, before and after every run below. Scratch work is under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/brief-check-11c`. That folder holds `before/`, a copy of the unchanged `checks.sh`, and `after/`, a copy with only item 1's loop applied (a failure counter, then the count line and exit 1 after the loop).

## 1. Names

- The output lines `checks: failed with exit` and `commands passed`: `grep -rn 'commands passed\|failed with exit' skills docs README.md utils`. These hits are outside the paths:
  - `skills/land/templates/land.test.sh:135:assert_contains "$failing_output" "checks: failed with exit 1: false" "failing check"`. Not made false. It is an `assert_contains`, and `TMPDIR=$S/tmp sh $S/after/land.test.sh 2>&1 | tail -1` printed `PASS: land.sh scratch tests`, with the item-1 copy of `checks.sh` beside it.
  - `skills/land/templates/land.test.sh:151:assert_contains "$clean_output" "checks: 1 commands passed" "clean landing"`. Not made false, because the clean line stays.
  - `skills/plan/templates/orchestrator-state.md:56` and `skills/spec/templates/brief.md:60`. Both describe a passing run, so neither is made false.
  - `docs/roadmap.md:234`, the done entry 2.B quoting `verify: 7 commands passed`. This is the record of an older runner and is not made false.
- The stop wording ("stops at the first", "first failure", "first command that", "do not run"): `git ls-files | grep -v '^\.scratch/' | xargs grep -n -i 'first command that\|first failure\|do not run\|stops at the first\|stop at the first\|stopping at the first\|the run stops\|commands after'`. Every hit is inside the paths except `skills/land/SKILL.md:183` ("for a first failure"), which is about a landing's failure and is not made false. Two hits that are not inside the paths and that the change makes false are in `checks.test.sh`, a whole-file path: `:3` "names that command and does not run the third" and `:47` "A failing command stops the run with exit 1 and its line; the command after it does not run." The grep in "What it must do" does not find either one (see Findings).
- The test's failing case: `git ls-files | grep -v '^\.scratch/' | xargs grep -n 'checks\.sh\|checks\.test\.sh'`. These hits are outside the paths, and none is made false:
  - `docs/dev/building.md:7`, "checks.sh on a failing list, a passing list and a state file with no yaml block".
  - `README.md:165`.
  - `skills/land/SKILL.md:160`.
  - `skills/land/templates/land.sh:19-21` and `:56-59`, which read only the exit status.
  - `skills/refute/SKILL.md:60-61`.
  - `skills/plan-orchestration/SKILL.md:70`.
  - The glossary entries **verify list** and **red line**.
- The `&&` rule: `git ls-files | grep -v '^\.scratch/' | xargs grep -n 'pipefail\|verify list\|verify:'`. Two places outside the paths state the companion rule, "Each command in the verify list exits non-zero when it fails, as written": `docs/dev/change-standard.md:80` and `skills/repo-setup/templates/docs/dev/change-standard.md:69`. Neither is made false. `skills/ordo-init/SKILL.md:73` (Steps 3) drafts another repository's `docs/dev/building.md` from "install, build, test, lint, type check" commands and says nothing about joining dependent commands. That is not made false either. The ruling names only `README.md` and `docs/dev/building.md`.

Findings:
- `checks.test.sh:3` and `:47` state the old behaviour, and the grep of "What it must do" (`'first command that\|first failure\|do not run\|stops at the first'`) does not match them. Confirmed with `grep -n -i 'does not run\|stops the run\|after the failed' skills/land/templates/checks.test.sh`, which printed lines 3, 47 and 59. The grep needs `does not run\|stops the run` added.

## 2. The step line

- "`checks.sh` runs every command of the verify list": item 1.
- "prints each failure's line `checks: failed with exit <status>: <command>`": item 1.
- "then `checks: <k> of <n> commands failed` and exits 1": item 1.
- "its exit statuses and its line on a clean run unchanged": item 1, which ends "as today" and "The refusals and exit 2 are unchanged".
- "commands that depend on each other are written as one item joined with `&&`": items 5 and 6.
- "`checks.test.sh`'s failing case reversed (two failing commands of three, the third run, both failure lines and the count printed)": item 3.
- "the head comments of both files": item 2 for `checks.sh`, and item 3 ("The head comment says what the case proves") for the test.
- "`skills/land/SKILL.md` Steps 6 and 'The landing script'": item 4.
- "`README.md`'s verify-list paragraph": item 5.
- "`docs/dev/building.md`'s runner paragraph": item 6.
- "check: the reversed case ... fails on the unchanged `checks.sh` and passes after the change": case 2 and "Verify before you report" 2.

Findings: none.

## 3. Premises

- `sed -n 105,118p skills/land/templates/checks.sh` printed the loop at 105-114 and `sys.stdout.write("checks: " + str(len(commands)) + " commands passed\n")` at 116. This matches the brief.
- `sed -n 8,23p skills/land/templates/checks.sh` printed the head comment with "At the first command that exits non-zero it prints ... (a command ended by signal n has status 128+n), and the commands after it do not run." and the exit statuses 0, 1 and 2. This matches.
- `cat -n skills/land/templates/checks.test.sh`: lines 2-3 hold "a list whose second of three commands fails exits 1, names that command and does not run the third", which matches. The case runs from 47 to 59 (line 46 is blank), with the three commands and the four assertions the brief lists. This matches.
- `awk 'NR==63' skills/land/SKILL.md` printed "6. Run the verification commands of the configuration block on main, in order, each through its filter, stopping at the first failure." This matches.
- `awk 'NR>=150 && NR<=160' skills/land/SKILL.md` printed line 156 and line 157 as quoted. This matches.
- `awk 'NR==149' README.md` holds "The run stops at the first command that fails." This matches.
- `awk 'NR>=1 && NR<=35' docs/dev/building.md`: lines 21, 24 and 27 are as quoted. This matches.
- `awk 'NR>=15 && NR<=25' skills/land/templates/land.sh` (lines 19-21) and `land.test.sh:135` match.
- The brief says `land.sh` and `land.test.sh:135` "read only `checks.sh`'s exit status and its line `checks: failed with exit 1: false`". The brief's own grep also prints `land.test.sh:151:assert_contains "$clean_output" "checks: 1 commands passed" "clean landing"`. The step keeps that line as well, so nothing depends on this, but the premise is incomplete.
- `orchestrator-state.md:56` and `brief.md:60` match.
- The ruling, in `plan.md` Rulings, "checks.sh runs every command (2026-10-01)", matches the brief's quote with its ellipses.
- `grep -ln 'checks.sh\|verify list' docs/adr/*.md` printed nothing, exit 1. This matches.

Findings: the `land.test.sh` premise leaves out `land.test.sh:151` (`checks: 1 commands passed`), which the step also keeps. The case is at lines 47-59, not 46-59.

## 4. Cases and checks

I ran each case with `(cd $S/run && sh <copy>/checks.sh $S/<case>.md 2>&1); echo "exit=$?"`, on state files written by the same `write_state` form `checks.test.sh` uses.

- Case 1 before printed `$ true`, `$ printf 'noise\n' | tail -1`, `noise`, `checks: 2 commands passed`, `exit=0`. The item-1 copy printed the same. The case holds and is consistent with the rules.
- Case 2: I applied item 3's assertions to a scratch copy of the test.
  - On the unchanged `checks.sh`: `FAIL: failing list third: missing [checks: failed with exit 5: touch third-ran; exit 5]`.
  - On the item-1 copy: `PASS: checks.sh scratch tests`.
  - Change standard, rule 13 holds: the test fails before the change and passes after it.
- Case 3 before printed `$ kill -TERM $$`, `checks: failed with exit 143: kill -TERM $$`, `exit=1`. The item-1 copy printed that, then `$ echo after`, `after`, `checks: 1 of 2 commands failed`, `exit=1`. The "after" expectation follows from item 1 and Decision 2.
  - The change standard's rule 13, last bullet, says each behaviour the change adds whose failure costs something has a case. Decision 3 gives case 2 its test on the ground that "a later command skipped ... costs a landing a second fix-and-rerun cycle". A signal-ended command that stopped the run would skip later commands at the same cost, yet case 3 is not made a test. See Findings.
- Case 4 before printed `$ false`, `checks: failed with exit 1: false`, `exit=1`. The item-1 copy printed both failure lines, then `checks: 2 of 2 commands failed`, `exit=1`. This follows from item 1 and is consistent.
- Case 5, before and after, printed `checks: <path>/c5.md has no yaml block`, `exit=2`. `ls $S/run` showed no `refused-ran`. The case holds before and after.
- Case 6 before printed `$ echo oops >&2; exit 1`, `oops`, `checks: failed with exit 1: echo oops >&2; exit 1`, `exit=1`. After, it printed the same plus `checks: 1 of 1 commands failed`. The case holds.
- Case 7: `TMPDIR=$S/tmp sh $S/before/land.test.sh 2>&1 | tail -1` and the same command on `$S/after/` both printed `PASS: land.sh scratch tests`. The case holds.
- Case 8 before: `TMPDIR=$S/tmp sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md` from the repository root printed eleven `$` lines with their `PASS:` and `ok:` lines, then `checks: 11 commands passed`, exit 0. The case holds before the change.

Findings:
- The change adds a behaviour whose failure costs a red check landing: exit 1 when an earlier command failed and the last one passed. No test covers it. In case 2 the last command is itself the one that fails with exit 5.
- Case 3, which carries the cost Decision 3 names for case 2, is run only once. Under the change standard's rule 13, last bullet, both behaviours need a case in `checks.test.sh`.

## 5. The question

- Case 1: yes, it could pass without the goal being reached, because a list of passing commands behaves the same before and after. It guards the clean output the ruling keeps.
- Case 2 and the step line's check: yes, it could pass without the goal being reached. I built `$S/wrong/checks.sh`. It runs every command, collects the failure lines and prints them after the last command, and sets its exit and count line from the last command's result.
  - `sh $S/wrong/checks.test.sh 2>&1 | tail -1`, with item 3's assertions, printed `PASS: checks.sh scratch tests`.
  - The same copy on case 3 printed `$ kill -TERM $$`, `$ echo after`, `after`, `checks: failed with exit 143: kill -TERM $$`, `checks: 2 commands passed`, `exit=0`.
  - `land.sh` reads only the exit status, so a landing would pass with a red command in the list.
  - `assert_contains` does not check order. Item 1's "right after its output" and the count line's place last are therefore unasserted.
- Case 3: no, a run that stops does not print `$ echo after`. It is run once, though, and is not kept in a test.
- Case 4: no, the unchanged runner prints one failure line.
- Case 5: yes, the refusal is unchanged. It is a regression guard.
- Case 6: yes, the behaviour is unchanged. It is a regression guard.
- Case 7: yes, the test passes before and after. It is a regression guard.
- Case 8: yes, a list where every command passes cannot show the goal.
- Item 1 (Verify 1, Verify 2, cases 2 to 4): yes, as for case 2.
- Item 2 (the grep of "What it must do", read): the grep alone could pass, because it misses "does not run" and "stops the run". A reader of the head comment closes that gap.
- Item 3 (Verify 2): yes, as for case 2.
- Items 4, 5 and 6 (read in place): no, the old sentences are quoted and a reader checks that they are gone. No case shows the `&&` sentence's claim that "the later one runs only when the earlier one passed".

Findings:
- Case 2, the step line's check and item 3's test pass for an implementation whose exit follows the last command and which prints failure lines at the end. Two changes would close this, and both fit the step line's "two failing commands of three, the third run":
  - Order the list so the last command passes, for example `sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1`, `exit 5`, `touch third-ran`, and keep `third-ran` exists and exit 1.
  - Assert the whole output against the exact expected text (comparing two texts), so the order of the lines is checked.
  - Making case 3 a test would also catch the exit-from-last-command defect.

## 6. Implied inputs

This is a code step. I ran each input below on `before/` and `after/`.

- A list of one failing command, the form `land.test.sh` uses (`false`). After: `$ false`, `checks: failed with exit 1: false`, `checks: 1 of 1 commands failed`, exit 1. This is missing as a case. Case 7 asserts only the failure line.
- A failing command whose output has no trailing newline (`printf 'no newline'; exit 1`, then `echo next`). Before and after, the output reads `no newlinechecks: failed with exit 1: printf 'no newline'; exit 1`, with the failure line joined to the output. After, the run continues with `$ echo next`, `next`, `checks: 1 of 2 commands failed`. This is missing, and the brief should state the expected result. "As today" fits the ruling's "the clean run's output stay".
- A joined item (`false && touch dep-ran`). It gives one failure line naming the whole item and `dep-ran` is not created. After, the count line is `checks: 1 of 3 commands failed` in a three-item list. This is missing, and it is the behaviour items 5 and 6 document.
- Dependent commands written as separate items (`mkdir -p sub && cd sub`, then `pwd`). `pwd` prints the start folder, before and after, because each item runs in its own bash. This is missing. It is the reason for the `&&` rule, and its expected result is the start folder.
- A command that reads stdin (`cat; read x; echo "read status $?"`). It prints `read status 1`, then `checks: 1 commands passed`, exit 0, before and after, because stdin is `/dev/null`. This is missing, and the expected result is unchanged.
- A command that ends `checks.sh` itself after an earlier failure (`false`, `kill -TERM $PPID`, `echo after`). After: `$ false`, the failure line, `$ kill -TERM $PPID`, then nothing more, exit 143, with no count line. This is missing. Decision 2 states the behaviour but gives no case. The change standard's rule 14 asks the head comment to list every exit status, and item 2 lists only 0, 1 and 2 ("as item 1 states them"). The expected result is: the run ends, no count line, exit 128+n.
- Two identical failing commands (`false`, `false`). After: two failure lines and `checks: 2 of 2 commands failed`. This is missing. It is low cost, and its expected result is that items are counted, not distinct texts.

Findings: every input above is missing from "Cases". The ones that matter most are the one-command failing list, the output without a trailing newline, the joined `&&` item, and the run ended by a signal to `checks.sh`, with its exit status absent from the head comment.

## 7. ADRs

- 0001 to 0003 cover the writing base, the prose standard over academic sources, and the read-only draft reviewer. None of them touches the step.
- 0004 and 0005 cover "(self-rule)" bookings and `choices.md`. Neither touches the step.
- 0006 to 0009 cover agent ids, `repair_reviewer`, and the cost script's price table and response bodies. None of them touches the step.
- `grep -rn -i 'verif\|check\|land' docs/adr/0*.md` and `grep -ln 'checks.sh\|verify list' docs/adr/*.md` (no output, exit 1) found no record about `checks.sh` or the verify list.

Findings: none.

## 8. Dictated text

- `checks: <k> of <n> commands failed` (`grep -n 'of <n> commands failed'` found lines 23, 28 and 61): holds. It is plain and ASCII, and it is a shipped diagnostic in the existing `checks: ` form.
- The test's commands `echo first ran`, `sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1` and `touch third-ran; exit 5` (`grep -n 'touch third-ran; exit 5'` found lines 25 and 35): hold as code lines. In the literal-block form of `write_state`, the scratch run shows `touch third-ran; exit 5` running and exiting 5.
- The asserted lines `checks: failed with exit 3: sh -c 'echo FAIL: x; exit 3' 2>&1 | tail -1`, `checks: failed with exit 5: touch third-ran; exit 5`, `checks: 2 of 3 commands failed` and `$ echo first ran` (line 25): hold. Each appears verbatim in the item-1 run.
- Item 4's direction for `skills/land/SKILL.md` (line 26) gives what to say, not the words. I read it against the standards anyway:
  - It has `:156` state the failure lines, the count line, exit 1 and that every command runs. That is several rules in one bullet, against `docs/dev/skill-layout.md`, "Lists and tables", one rule per bullet.
  - It has Steps 6 state "every command runs, and each failure is named" while "The landing script" states the same behaviour. That goes against `docs/dev/skill-layout.md`, "Where a rule goes" ("A rule is written once. Another place that needs it names the section it is in.").
- `LC_ALL=C grep -n '[^ -~]'` on the brief printed nothing, exit 1.

Findings:
- Item 4 should say that the bullet at `:156` is split one rule per bullet.
- Item 4 should say that Steps 6 drops "stopping at the first failure" and leaves the run's behaviour to "The landing script", which its sub-bullet at `:64` already names, instead of stating it a second time.

## Declined to judge

- Whether the `&&` rule should also reach two places outside the ruling's `README.md` and `docs/dev/building.md`:
  - `docs/dev/change-standard.md`, "Commands and their filters", and its `repo-setup` template.
  - `skills/ordo-init/SKILL.md` Steps 3, which drafts another repository's verify commands (install, build, test).
  - Nothing in either place is made false. Widening the ruling's reach is the user's call.
- Whether a failure line printed after output with no trailing newline should get a newline of its own. That changes the printed output, which the ruling keeps, so it is a choice for the session or the user. Section 6 asks only that the brief states the expected result.
- I did not run case 8 after the change, because the worktree does not exist yet.

Agent usage: aca524bdfd236c383, claude-opus-5-5 (ordo-high), 152401 tokens, 35 tool uses, 8 min 19 s.

## Closed

- Names, `checks.test.sh:3` and `:47` missed by the grep: the brief's "What it must do" grep adds `does not run\|stops the run`; item 3 has the head comment and the comment above the failing case say the commands after a failure run.
- Premises, `land.test.sh:151` left out and the case's lines: "What is on the tree" names `land.test.sh:151` (`checks: 1 commands passed`) and the case at lines 47-59.
- Cases and checks, the exit taken from the last command untested, and case 3 run once: item 3's failing case ends with a passing command (`touch third-ran`), and case 3 becomes a second test; Decision 3 says both are tests.
- The question, case 2 passing for an implementation that prints failures at the end or exits by the last command: item 3 compares the whole output with the expected text line for line, so the order is checked, and the last command passes.
- Implied inputs: cases 9 to 15 added (one failing command, output with no trailing newline, a joined `&&` item, dependent commands as separate items, a command reading standard input, a signal ending `checks.sh` itself, two identical failing commands); item 2 has the head comment state the exit of a run ended by a signal to `checks.sh` and the failure line after output with no newline.
- Dictated text, item 4: `:156` is split one rule per bullet, and Steps 6 drops "stopping at the first failure" without restating the run, which "The landing script" states.
- Declined to judge, the `&&` rule in `docs/dev/change-standard.md` and `skills/ordo-init/SKILL.md`: the ruling names `README.md` and `docs/dev/building.md`, and neither other place is made false; not widened. The newline after output without one: kept as today (case 10), as the ruling keeps the output.

# Step 11c refuter report (on .agents/worktrees/2ea-11c, base dcadca2)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

Scratch work is under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/refute-11c` (written `$S` below), with `TMPDIR=$S/tmp`. `$S/base/checks.sh` is `git show dcadca2:skills/land/templates/checks.sh`. The only git run in the worktree was `git diff dcadca2`, `git diff --name-only`, `git diff -U0` and `git status --short`, plus that `git show` the brief named, and the `git ls-files` the verify list runs.

## Verification (rerun by the reviewer)

```
$ cd /Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-11c && sh /Users/axelfaes/workspace/ordo/.agents/worktrees/2ea-11c/skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-a-self-rule/orchestrator-state.md; echo "exit=$?"
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
exit=0

Verify 2:
sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
The worktree's checks.test.sh copied beside $S/base/checks.sh, sh $S/base/checks.test.sh:
FAIL: failing list did not run the command after the failed ones
exit=1

Verify 3, git diff --name-only:
README.md
docs/dev/building.md
skills/land/SKILL.md
skills/land/templates/checks.sh
skills/land/templates/checks.test.sh
git status --short also shows ?? .scratch/2-e-a-self-rule/agents/reviews/11c-report.md (the report path the brief names).

Verify 4, git diff -U0 | grep '^+' | LC_ALL=C grep -n '[^ -~]':
(nothing) grep exit=1
LC_ALL=C grep -n '[^ -~]' over the five changed files whole: nothing, exit 1.

Verify 5, grep -rn -i 'first command that\|first failure\|do not run\|does not run\|stops at the first\|stops the run' skills/land README.md docs/dev:
skills/land/SKILL.md:185:| A red line for the user | ... under `self_rule: on`, for a first failure, the choice ... |
(one hit, about a landing's failure, true after the change)

Evidence the report quotes, rerun:
- Signal test alone (the worktree's test with its failing case cut out, beside $S/base/checks.sh):
  3,5d2
  < $ echo after
  < after
  < checks: 1 of 2 commands failed
  FAIL: signal list: the output differs from the expected text
  exit=1
  (matches the report's case 3 first run)
- A copy of checks.sh ending with sys.exit(0) on failure: FAIL: failing list exited 0, expected 1 (matches)
- A copy with "failures += 1" removed: FAIL: failing list exited 0, expected 1 (matches)
- land.sh:443-446 reads only checks.sh's exit status: `sh "$landing_script_dir/checks.sh" "$landing_state"`, `landing_status=$?`, `fail "checks failed: checks.sh exited $landing_status"` (matches)
- wc -l: 127 checks.sh, 118 checks.test.sh, 219 SKILL.md, 190 README.md, 33 building.md (matches)
- The original base checks.test.sh beside the base checks.sh: PASS: checks.sh scratch tests
```

Wrong versions of `checks.sh` run under the worktree's `checks.test.sh` (each a copy under `$S/mut/<name>/`):

```
A_exit_from_last (exit 1 only when the last command failed): FAIL: failing list exited 0, expected 1
B_failures_at_end (failure lines printed after the last command): FAIL: failing list: the output differs from the expected text
C_no_count_line (exit 1, no count line): FAIL: failing list: the output differs from the expected text
D_stop_after_signal (run stops after a command ended by a signal): FAIL: signal list: the output differs from the expected text
E_count_wrong_n_of_n (prints "<n> of <n>"): FAIL: failing list: the output differs from the expected text
F_passed_line_on_failure (prints "commands passed" after the count line): FAIL: failing list: the output differs from the expected text
G_exit_zero (count line printed, exit 0): FAIL: failing list exited 0, expected 1
H_signal_status_raw (status printed as -15): FAIL: signal list: the output differs from the expected text
I_exit_status_k (exit status = number of failures): FAIL: failing list exited 2, expected 1
J_no_pipefail: FAIL: failing list: the output differs from the expected text
K_stdin_inherited (stdin not /dev/null): PASS: checks.sh scratch tests
L_distinct (counts distinct failing command texts): PASS: checks.sh scratch tests
```

Every wrong version of the behaviour this step adds is caught. K is a preserved behaviour (case 13), and L is case 15; the brief's Decision 3 keeps both as one-off scratch runs, not tests.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `checks.sh:108-124` counts failures, keeps the failure line after each command's output, prints `checks: <k> of <n> commands failed` and exits 1, and leaves the clean line and refusals unchanged. Cases 2 to 4, 9 to 11 and 15 below, and mutations A, B, C, E, F, G and I, show this.
- 2: holds. `checks.sh:8-21` drops "the commands after it do not run" and states every command running, the failure line continuing an output with no trailing newline, both count lines, exit 1 as "one or more", and the signal to `checks.sh` itself with no count line and 128 plus n. What it still leaves out is Standards 1.
- 3: holds. The failing case at `checks.test.sh:66-83` has the brief's three commands, asserts exit 1 and `third-ran`, and compares the whole output with `diff` against the brief's text verbatim. The signal case at `:87-100` has the brief's text verbatim. The head comment `:2-11` and the comment at `:61-65` say the later commands run. The passing case and the refusal case stay. Verify 2 and the mutations above show this.
- 4: holds. `SKILL.md:63` ends "each through its filter.". `:156-158` are three bullets, and `:159` is unchanged. See Standards 3 and 4 on the wording.
- 5: holds as to the item's text (`README.md:149`). The clause added beyond the item and the unconditional "count of failures" are Standards 2 and 5.
- 6: holds as to the item's text (`docs/dev/building.md:21`, `:24`, `:27`). See Standards 2 and 4.

Cases of the brief's "Cases" (each scratch run: `cd <scratch run dir> && sh <checks.sh> <state file>`, base is `$S/base/checks.sh`, after is the worktree's):

- 1: met. Before and after both printed `$ true`, `$ printf 'noise\n' | tail -1`, `noise`, `checks: 2 commands passed`, exit=0.
- 2: met. After, Verify 2 PASS (whole output equals the item 3 text, exit 1, `third-ran` exists). Before, `FAIL: failing list did not run the command after the failed ones`.
- 3: met. After, the test's signal case passes inside Verify 2. Before, the signal case alone printed the diff `< $ echo after` and `FAIL: signal list: the output differs from the expected text`.
- 4: met. After: `$ false`, `checks: failed with exit 1: false`, `$ exit 2`, `checks: failed with exit 2: exit 2`, `checks: 2 of 2 commands failed`, exit=1.
- 5: met. Before and after: `checks: <path>/c5.md has no yaml block`, exit=2, and the run directory was empty.
- 6: met. After: `$ echo oops >&2; exit 1`, `oops`, `checks: failed with exit 1: echo oops >&2; exit 1`, `checks: 1 of 1 commands failed`, exit=1.
- 7: met. `land.test.sh` beside the base `checks.sh` (`$S/landbase`) and in the worktree both printed `PASS: land.sh scratch tests`. Its assertion `land.test.sh:135` (`checks: failed with exit 1: false`) is unchanged.
- 8: met. After, see Verification, `checks: 11 commands passed`, exit=0. Before, `$S/base/checks.sh` run from the worktree root printed `checks: 11 commands passed`.
- 9: met. After: `$ false`, `checks: failed with exit 1: false`, `checks: 1 of 1 commands failed`, exit=1.
- 10: met. After: `no newlinechecks: failed with exit 1: printf 'no newline'; exit 1`, `$ echo next`, `next`, `checks: 1 of 2 commands failed`, exit=1. Before gave the same joined line.
- 11: met. After: `$ false && touch dep-ran`, `checks: failed with exit 1: false && touch dep-ran`, `$ true`, `$ true`, `checks: 1 of 3 commands failed`, exit=1, and no `dep-ran` in the run directory.
- 12: met. Before and after, `pwd` printed `.../cases/<base|after>/run`, the directory the run started in, then `checks: 2 commands passed`, exit=0.
- 13: met. Before and after: `read status 1`, `checks: 1 commands passed`, exit=0.
- 14: met. After: `$ false`, `checks: failed with exit 1: false`, `$ kill -TERM $PPID`, then no line from `checks.sh`, exit=143. The one extra line, `Terminated: 15`, came from my wrapper shell.
- 15: met. After: two `checks: failed with exit 1: false` lines, `checks: 2 of 2 commands failed`, exit=1. The test does not hold this case (mutation L passes it), as Decision 3 chose.

## 1. Spec

none

## 2. Proof

none

## 3. Standards

1. `skills/land/templates/checks.sh:16-21`
   - Quoted hunk: "A signal that ends checks.sh itself ends the run with no count line, # and its exit status is 128 plus the signal's number. # # Exit status: #   0 ... #   1  one or more commands exited non-zero. #   2 ..."
   - What is wrong: `docs/dev/change-standard.md` "The rules" 14 says a head comment lists every error the script prints and every exit status it returns, and the orchestrator asked that the head comment state every exit status and output. This comment falls short in two ways.
     - The "Exit status:" list, which reads as complete, gives only 0, 1 and 2. The 128 plus n of a signal sits only in the Output paragraph.
     - For SIGINT, the signal a Ctrl-C sends, the run does not just end. Python prints a `KeyboardInterrupt` traceback on standard error. I reproduced it with the list `false`, `kill -INT $PPID`, `echo after`: it printed `$ kill -INT $PPID`, then a `Traceback (most recent call last):` block ending `KeyboardInterrupt`, exit=130. `kill -HUP`, `-TERM` and `-QUIT` printed nothing and exited 129, 143 and 131.
     - The comment's new signal sentence describes this case without the traceback.
     - `README.md:149` sends the reader to this comment for "what it prints and its exit statuses".
   - Failure scenario: someone presses Ctrl-C during a landing, sees a Python traceback the head comment says nothing about, and takes it for a crash of `checks.sh`. Someone reading the Exit status list to handle `checks.sh`'s statuses handles 0, 1 and 2 and misses 130 or 143.
   - Verdict: none (item 2's own text is met).
2. `README.md:149` and `docs/dev/building.md:27`
   - Quoted hunk: "Commands that depend on each other are written as one item joined with `&&`, so the later one runs only when the earlier one passes, since each item runs in its own `bash`."
   - What is wrong: the "since" clause gives a wrong reason for the clause it ends.
     - The later command runs only when the earlier one passes because of `&&`, not because each item has its own `bash`.
     - "Each item runs in its own `bash`" explains a different dependency: shell state such as `cd` or a variable does not carry from one item to the next (case 12).
     - The reason the rule is needed now is the one this step creates: every item runs whatever the one before did. Neither sentence states it.
     - The sentence also runs to about 33 words with two stacked clauses ("so ..., since ..."), against the prose standard, E "Sentence length".
     - The builder lists the clause as a judgment call. Neither item 5 nor item 6 asks for a reason.
   - Failure scenario: an Ordo user's verify list has `make build` and `make test` as two items, and the test depends on files the build writes, not on shell state. The reason given ("its own `bash`") does not seem to apply, so the user keeps them separate. Under the new runner, a failed build is followed by a test run against a stale or missing build, which prints a second, misleading failure line.
   - Verdict: none.
3. `skills/land/SKILL.md:158`
   - Quoted hunk: "After the last command, when one or more failed, it prints `checks: <k> of <n> commands failed` and exits 1."
   - What is wrong: `docs/dev/skill-layout.md`, "Lists and tables", says "two requirements that can each be broken while the other holds, joined by 'and' ... are two bullets". Printing the count line and exiting 1 can each break while the other holds (mutations C and G each break one). The brief's item 4 dictated this bullet's content, and `:159` ("prints ... and exits 0"), which the brief kept, has the same shape. So the fix to both is the orchestrator's call at landing.
   - Failure scenario: a reviewer checking a later change to the runner against this bullet cannot tell whether the bullet means one rule or two. For example, a change that prints the count line but keeps exit 0 is judged against a single sentence that mixes both.
   - Verdict: none.
4. `skills/land/SKILL.md:157`, `skills/land/templates/checks.sh:11-12` and `docs/dev/building.md:21`
   - Quoted hunks: "A command that exits non-zero is followed by `checks: failed with exit <status>: <command>`, after its output." and "It runs each command in order through `bash -o pipefail -c`, prints `$ <command>` and the command's output, and runs every command, whatever the exit of the one before."
   - What is wrong:
     - The first is passive ("is followed by") where the actor matters, against the prose standard, E "Passive voice". Its neighbouring bullets say "it prints". Item 4 put it as "prints ... after its output".
     - The second says "runs" twice in one sentence ("runs each command in order ... and runs every command"). It could read as two runs, and it is not the plain form.
   - Failure scenario: a reader of `building.md:21` asks whether `checks.sh` makes a second pass over the list after the first. A reader of `SKILL.md:157` cannot tell from the sentence whether the command or `checks.sh` writes the failure line, which matters to anyone filtering a command's own output.
   - Verdict: none. Both are small, and both can be fixed at landing.
5. `README.md:149`
   - Quoted hunk: "Every command runs, each failure is printed, and the run ends with the count of failures."
   - What is wrong: the sentence is unconditional. A clean run ends with `checks: <n> commands passed`, not a count of failures. The ruling and item 5 tie the count of failures to a failing run ("then a count of the failures and exit 1"). The paragraph now has five sentences, against the prose standard, D, "under roughly four sentences".
   - Failure scenario: a user reads the README and expects `checks: 0 of 11 commands failed` on a green run. A script or a booking that looks for "commands failed" to find the result then misreads a clean run.
   - Verdict: none.

## 4. Behaviour

none

## Declined to judge

- The raise of the `land` skill's `metadata.version`. It is step 12's work under ruling L, which the state file's position line puts after 11c. It is outside this brief.
- Whether `checks.sh` should catch `KeyboardInterrupt` and print one `checks: ` line in place of the traceback (Standards 1). That is a code change beyond item 1, and stating the traceback in the head comment is the alternative. Which of the two to take is the orchestrator's call.
- Whether the `&&` rule should also reach `docs/dev/change-standard.md`, "Commands and their filters", and its `repo-setup` template. Neither is made false (the last two sentences of that section were reread), and the brief check closed this as not widened.
- `docs/dev/building.md:7` ("checks.sh on a failing list, a passing list and a state file with no yaml block"). It is outside the step's paths and is not made false, since the signal list is a failing list.
- `docs/figures/gen_figures.py:657` "WHEN ANY COMMAND OF THE ROW HALTS". It is about a row of skill commands in the plan-loop figure, not about `checks.sh`, so it is not judged here.
- Runs under shells other than the macOS `/bin/sh`. I did not try them, and the brief lists none.

Reviewer usage: agent id not visible to the reviewer, claude-opus-5-5, tokens not visible to the reviewer, 33 tool uses, minutes not measured.

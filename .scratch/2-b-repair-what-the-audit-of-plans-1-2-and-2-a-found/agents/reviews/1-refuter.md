# Step 1 refuter report (on .agents/worktrees/2b-1, base 2ce1804)

## Verification (rerun by the reviewer)

```
$ sh utils/verify.test.sh 2>&1 | tail -1
PASS: verify.sh scratch tests

$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit $?"
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 11 commands passed
exit 0

The state file's verify list by hand, through its filters, with sh utils/verify.test.sh as a tenth test:
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md ... ok: skills/spec/SKILL.md (ten ok: lines, same as above)
layout exit 0
ascii exit 0

$ grep -n 'verify.test.sh' README.md docs/dev/building.md docs/dev/change-standard.md
README.md:111:sh utils/verify.test.sh
README.md:123:- `verify.test.sh` checks that `verify.sh` passes a list holding a filtered test, [...]
docs/dev/building.md:12:sh utils/verify.test.sh                         # verify.sh on green, red and unusable verify lists
docs/dev/change-standard.md:48:sh utils/verify.test.sh 2>&1 | tail -1

Four-list comparison (README code block, README bullets, building.md, change-standard.md, test names extracted with grep/sed): all four print
land.test.sh check_config.test.sh collect_findings.test.sh sync_rules.test.sh launch.test.sh pin.test.sh verify.test.sh check_skill_layout.test.sh check_rule_inventory.test.sh check_coverage.test.sh
equal

Report evidence rerun:
$ (verify.test.sh copied alone, no verify.sh) sh verify.test.sh 2>&1 | tail -3
FAIL: all green: exit 127, expected 0; output: sh: .../rv/none/verify.sh: No such file or directory
$ wc -l utils/verify.sh utils/verify.test.sh  ->  153, 245
$ git diff 2ce1804 --numstat  ->  4 0 README.md / 3 0 docs/dev/building.md / 3 0 docs/dev/change-standard.md
$ grep -n 'verify' skills/land/SKILL.md  ->  (nothing)

Reverts reproduced on copies of verify.sh (scratchpad/rv/<name>, sh verify.test.sh 2>&1; echo "exit $?"):
r1 judge filtered test by the pipeline as written:
  FAIL: a filtered test that exits 1: exit 0, expected 1; output: PASS: green / PASS: x / verify: 2 commands passed ; exit 1   (matches the report)
r2 PASS: check removed:
  FAIL: a filtered test without a PASS last line: exit 0, expected 1; output: done / verify: 1 commands passed ; exit 1   (matches)
r3b stop at first red removed (continue, exit 1 at end):
  FAIL: a command after the first red command ran ; exit 1   (matches)
r4 refuse on missing list replaced by sys.exit(0):
  FAIL: a block with no verify: key: exit 70, expected 64; output: verify: the list reader printed no count:  ; exit 1   (matches)
r5 non-yaml fences not tracked:
  FAIL: a verify list only in a second yaml block: exit 0, expected 64; output: verify: 1 commands passed ; exit 1   (matches)
r6 `</dev/null` removed from the sh -c line:          PASS: verify.sh scratch tests ; exit 0
r7 `printf x` trailing-newline guard removed:         PASS: verify.sh scratch tests ; exit 0
r8 the signal trap loop (lines 28-30) removed:        PASS: verify.sh scratch tests ; exit 0
r9 the count check (lines 108-113) removed:           PASS: verify.sh scratch tests ; exit 0
```

## 1. Spec

1. `utils/verify.test.sh:117-125`: the case "a command with another tail filter" is in no item of the brief's case list (brief, What to build, item 2). It asserts `sh passexit1.test.sh 2>&1 | tail -n 1` exits 0 with `verify: 1 commands passed`. See Proof 1 and Behaviour 1.
2. `utils/verify.sh:47`, `:111`: exit statuses 69 (no PyYAML) and 70 (no count) are not in the brief. The brief names 0, 1 and 64 only. The head comment (lines 2-8) does not list them either (Standards 2). The orchestrator should rule on them or accept them.
3. The state file's verify list (`orchestrator-state.md` yaml block, commented "Copied from docs/dev/building.md by /plan") still holds nine tests. `docs/dev/building.md` now holds ten. `sh utils/verify.sh <state file>` therefore does not run `utils/verify.test.sh` on any later landing. This belongs to the orchestrator, since the builder may not edit the ledger. The step is incomplete until the state file's list gets the line.

## 2. Proof

1. `utils/verify.test.sh:117-125`: the test enforces the defect the runner exists to end. The comment reads "A suffix other than the exact filter is not the filter: the command is judged on its exit status alone, and tail's status is 0." The expected result is a red test (exits 1) reported as passed. Change standard rule 9: "A test never asserts a known defect". The README bullet (`README.md:123`, "that a command with any other `tail` suffix is judged on its exit status alone") records the same thing as checked behaviour.
2. `utils/verify.sh:125` (`sh -c "$run" >"$output" 2>&1 </dev/null`): the report's judgment call 7 ("Each command runs with standard input from /dev/null") has no test. Revert r6 (drop `</dev/null`) leaves `PASS: verify.sh scratch tests`. This breaks change standard rule 13.
3. `utils/verify.sh:119-120` (`command=$(cat ...; printf x)` / `${command%x}`): judgment call 6 ("keeps quotes, newlines and carriage returns in a command as they are") has no test. Revert r7 leaves the test green.
4. `utils/verify.sh:28-30` (the signal traps): judgment call 4 ("A signal exits 128 plus its number, after the scratch folder is removed") has no test. Revert r8 leaves the test green. Without the trap, a signalled runner leaves its scratch folder behind.
5. `utils/verify.sh:108-113` (the count check): no case reaches it. Revert r9 leaves the test green. The report calls it an asserted invariant ("the code has no such path"). The brief's fourth revert (r4) turns red only through this check, with exit 70, not through any assertion that the refusal exits 64 for its own reason.
6. `.scratch/.../agents/reviews/1-report.md:99` and `:246`: the brief asks for output quoted verbatim, but the report shortens the grep hits with "..." (`README.md:123:- `verify.test.sh` checks that `verify.sh` passes a list holding a filtered test, ...`).

## 3. Standards

1. `docs/dev/change-standard.md:56`: "A step's verification runs through `sh utils/verify.sh <state file>`". The diff makes three sentences in the skills contradict this, and none of them is booked:
   - `skills/refute/SKILL.md:44`: "The reviewer runs every command in the brief's verification list, from the directory each names, piped through the filter the rules file names."
   - `skills/spec/templates/brief.md:32`: "Run from <directory>, each must hold, each output piped through the filter the rules file names:"
   - `skills/land/SKILL.md:45`: "Run the verification commands of the configuration block on main, in order, each through its filter, stopping at the first failure."

   The booked item (`orchestrator-state.md:59`) covers only the `land` and `plan-orchestration` texts. The refute and spec texts are neither changed nor booked. This breaks change standard rule 14.
2. `docs/dev/building.md:22`: "A landing books the lines the runner prints." No skill does this yet (`grep -n 'verify' skills/land/SKILL.md` prints nothing). The page describes behaviour the skills do not have. It is booked for step 3 (`orchestrator-state.md:59`), so this is recorded here as booked, not open.
3. `utils/verify.sh:2-8`: the head comment names exit 1 and 64 only. Exits 69, 70 and 128+n are not in it. `docs/dev/building.md:22` and the `README.md:134` paragraph do not name them either. Only the README bullet mentions 69. This breaks change standard rule 5 (a user-visible surface documented in its header comment).

## 4. Behaviour

1. `utils/verify.sh:121-124`: a red test passes green whenever its filter is spelled any way other than the exact suffix ` 2>&1 | tail -1`. Reproduced with `red.test.sh` (`printf 'FAIL: x\n'; exit 1`) in scratch state files:
   - `- sh red.test.sh 2>&1 | tail -n 1` printed `FAIL: x` and was not stopped.
   - `- sh red.test.sh 2>&1  | tail -1` (two spaces) printed `FAIL: x` and was not stopped.
   - `- sh red.test.sh | tail -1` printed `FAIL: x`, `verify: 1 commands passed`, exit 0.
   - `- sh red.test.sh 2>&1 | tail -1 ; true` printed `FAIL: x`, `verify: 1 commands passed`, exit 0.
   - A literal block `- |` followed by `sh red.test.sh 2>&1 | tail -1`, then another key, printed `FAIL: x`, `verify: 1 commands passed`, exit 0. The kept trailing newline defeats the suffix match.

   This follows brief decision 2, but it keeps the failure mode the plan's step 1 names ("fails on a test's exit status") for any list not typed exactly. The report states the rule (judgment call 9) but not this consequence. A line starting `FAIL:` still passes as green. The orchestrator should rule on decision 2. The choice is between refusing, or at least treating as red, any command that ends in a pipe into `tail`, and keeping the rule as it is.
2. `utils/verify.sh:49-50`: a state file that is not UTF-8 ends in a Python traceback (`UnicodeDecodeError: 'utf-8' codec can't decode byte 0xff in position 4`) and exit 1. That is the same status as a red command. The brief says an unreadable state file prints a message naming what is missing and exits 64. Reproduced with `printf '# S \xff\n\n```yaml\nverify:\n- echo hi\n```\n'`.
3. `utils/verify.sh:28-30`: a SIGTERM sent to the runner alone does not stop the running command. sh runs the trap only after the foreground child ends. With `sleep 3; echo after > after.txt` running, `kill -TERM` returned runner exit 143 only after the command had finished and written `after.txt`, and the next command did not run. The report's judgment call 4 does not say this.
4. `utils/verify.sh:52`, `:60`: only a fence whose info word is exactly `yaml` counts. ```` ```YAML ```` and ```` ```yml ```` blocks are refused with "has no yaml block" (exit 64). The report's judgment call 5 does not say this. The same probe found no defect in these cases:
   - A path holding a space.
   - A runner started from `/`.
   - CRLF line endings.
   - An info string with attributes (```` ```yaml title="x" ````).
   - Output with no trailing newline.
   - `PASS:` printed on stderr only.
   - A heredoc and quotes in a command.
   - `read` on stdin, which got EOF.

## Not checked

- The builder's `reverts.py` harness is in the builder's scratchpad and was not available. Nine reverts were reproduced independently (r1 to r9 above). The report's other twelve were not rerun.
- Running `utils/verify.test.sh` while it is interrupted by a signal was not tried (its trap without `exit` follows the other tests' convention).
- Behaviour under a `/bin/sh` other than macOS's bash-as-sh (dash, busybox) was not run.

Reviewer usage: 111,656 tokens, 24 tool uses, 421 s (the runner's completion notification).

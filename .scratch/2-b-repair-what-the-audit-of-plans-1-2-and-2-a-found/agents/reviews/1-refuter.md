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

## Repair round 1, refuted

Reviewed worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/2b-1`. The round's delta is `git diff 00e8f8b`, read against `git diff 2ce1804`. `git status --short` shows ` M` on the report, `README.md`, `docs/dev/building.md`, `utils/verify.sh` and `utils/verify.test.sh`. Under `.scratch/`, only `1-report.md` differs from the base, so ruling 9 holds.

```
$ sh utils/verify.test.sh 2>&1 | tail -1
PASS: verify.sh scratch tests

$ sh utils/verify.test.sh; echo "exit $?"
PASS: verify.sh scratch tests
exit 0

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
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh and usage.py scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1
PASS: collect_findings.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1
PASS: launch.sh scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/verify.test.sh 2>&1 | tail -1
PASS: verify.sh scratch tests
$ sh utils/check_skill_layout.test.sh 2>&1 | tail -1
PASS: check_skill_layout.py scratch tests
$ sh utils/check_rule_inventory.test.sh 2>&1 | tail -1
PASS: check_rule_inventory.py scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ python3 utils/check_skill_layout.py; echo "exit $?"
(the ten ok: lines above)
exit 0
$ <the ASCII check>; echo "exit $?"
exit 0

$ grep -n 'verify.test.sh' README.md docs/dev/building.md docs/dev/change-standard.md   (cut to 120 columns)
README.md:111:sh utils/verify.test.sh
README.md:123:- `verify.test.sh` checks that `verify.sh` passes a list holding a filtered test, an unfiltered command an
docs/dev/building.md:12:sh utils/verify.test.sh                         # verify.sh on green, red and unusable verify li
docs/dev/change-standard.md:48:sh utils/verify.test.sh 2>&1 | tail -1

$ awk 'length>100' utils/verify.sh utils/verify.test.sh ; LC_ALL=C grep -n '[^ -~]' (same files, README.md, building.md)
(no output)

The report's reproductions, rerun (scratch folder, red.test.sh = printf 'FAIL: x\n'; exit 1):
| tail -n 1, two spaces, no 2>&1, literal block: each RED, exit status 1, FAIL: x, exit 1 (matches)
; true: FAIL: x / verify: 1 commands passed / exit 0 (matches)

Reverts reproduced on copies (sh verify.test.sh 2>&1 | tail -3), each red as the report says:
exact suffix only        -> FAIL: the spelling sh red.test.sh 2>&1 | tail -n 1: exit 0, expected 1
no rstrip                -> FAIL: a literal block ending in a newline: exit 0, expected 1
runner's stdin           -> FAIL: a command reading standard input: output differs; got: read from stdin
stop() does not kill     -> FAIL: the runner waited for the command to end
no set -m                -> FAIL: the runner waited for the command to end
fence word yaml only     -> FAIL: a yml fence: exit 64, expected 0
decode error not caught  -> UnicodeDecodeError traceback (red)
any pipe into tail       -> FAIL: a command ending in ; true: exit 1, expected 0
python3 check removed    -> FAIL: no python3: exit 1, expected 69
traps reduced to 15 only -> PASS: verify.sh scratch tests   (stays green, see Proof 1)

Signals: the runner was started by a Python parent with default dispositions, while "echo $$ >cmd.pid; sleep 4; touch after" ran:
sh INT: returncode 130 after 0.0s; after=False second=False scratch_left=0
sh HUP: returncode 129 after 0.0s; after=False second=False scratch_left=0
sh TERM: returncode 143 after 0.0s; after=False second=False scratch_left=0
sh QUIT: returncode 131 after 0.0s; after=False second=False scratch_left=0
dash INT: returncode 130 after 4.0s; after=True second=False scratch_left=0 out="../verify.sh: 163: set: can't access tty; job control turned off\n"
dash HUP: returncode 129 after 4.0s; after=True ...
dash TERM: returncode 143 after 4.0s; after=True ...
dash QUIT: returncode 131 after 4.0s; after=True ...

$ command -v dash  ->  /bin/dash   (/bin/sh here is GNU bash 3.2.57)
```

### Spec

1. `utils/verify.sh:29-32`:
   ```
   command -v python3 >/dev/null 2>&1 || {
       printf 'verify: python3 is not on PATH\n' >&2
       exit 69
   ```
   This adds a new refusal path. Ruling 2 said to keep exit 69, which existed for a missing PyYAML, and no ruling asks for a separate check that `python3` is on `PATH`. Without the check, a missing `python3` already stops the runner before any command runs, through the failed `count=$(python3 ...)`. The expected ruling item would be ruling 2, but it does not ask for this. The finding is small, and the orchestrator can accept it or drop it at landing.
2. `utils/verify.sh:133-134`, `utils/verify.test.sh:289-295`:
   ```
   if run == "":
       refuse(where + " pipes nothing into tail")
   ```
   This adds a new exit-64 refusal that no ruling asks for. The README bullet at line 123 documents it. The head comment's list of 64 causes (lines 15-16: "no file, not UTF-8, no yaml block, no verify list, a command that is not a non-empty string") leaves it out.

### Proof

1. `utils/verify.test.sh:322-353`: the signal case sends only `kill -TERM`. `verify.sh:49` traps `1 2 3 15`, and the README (`:136`, "128 plus the signal number when a signal stops it") and the head comment speak of any signal. With the trap loop reduced to `for signal in 15; do`, the test prints `PASS: verify.sh scratch tests`. No case proves that INT, HUP or QUIT stop the command, although my own run above shows they do under bash-as-sh.
2. The suite passes only when `sh` is bash. With the runner invoked as `dash` (the six `sh "$verify"` calls in the test changed to `dash "$verify"`), the first case goes red:
   ```
   FAIL: all green: output differs; got: .../verify.sh: 163: set: can't access tty; job control turned off
   PASS: green
   .../verify.sh: 163: set: can't access tty; job control turned off
   unfiltered out
   ```
   On a system whose `/bin/sh` is dash, `sh utils/verify.test.sh` is red. The report's judgment call 4 records that dash was not run, which leaves this check undone rather than done (change standard rule 12).

### Standards

1. `README.md:134` ("takes every command whose last pipeline stage is `tail`, in any spelling, as a filtered test"), `docs/dev/building.md:22` ("A command whose last pipeline stage is `tail`, in any spelling"), `utils/verify.sh:5` ("and any other spelling"). These sentences are false for the spellings in Behaviour 1, where the last pipeline stage is `tail` and the runner treats the command as unfiltered. Change standard rule 14: "A sentence in a document or a head comment that the change makes false is a defect of the change."
2. `utils/verify.sh:9-10` ("Each command runs in its own process group ..., so a signal to the runner stops the running command at once") and `README.md:136` ("a signal also stops the running command"). Both are false under dash (Behaviour 2). The page presents the script as POSIX `sh` (brief, What to build, item 1). The same rule 14 applies.

### Behaviour

1. `utils/verify.sh:118-119`, the tail-stage expression `(?P<run>.*?)\s*(?<!\|)\|(?!\|)\s*(?:\S*/)?tail(?:[ \t]+[^|;&<>()`$\n]*)?\Z`. Each probe below used `red.test.sh` (prints `FAIL: x`, exits 1), each in a literal block. In each, the last pipeline stage is `tail`, yet the command is judged on tail's exit status, and a red test passes green (`FAIL: x` / `verify: 1 commands passed` / `exit 0`):
   - `sh red.test.sh 2>&1 | tail -1 2>/dev/null` (a redirection on tail)
   - `sh red.test.sh 2>&1 | tail -1 >&2`
   - `sh red.test.sh 2>&1 | tail -1;` (a trailing semicolon, nothing after it)
   - `sh red.test.sh 2>&1 | tail -1 # keep | last` (a shell comment holding a pipe)
   - `sh red.test.sh 2>&1 | \` then `tail -1` on the next line (backslash-newline)

   These spellings behaved correctly:
   - `| /usr/bin/tail -1`: red, as required.
   - `| tail -1 -q`: red, as required.
   - A comment without a pipe (`| tail -1 # summary`): red, as required.
   - `|` followed by a newline and then `tail -1`: red, as required.
   - `sh red.test.sh || tail -1 /dev/null`: judged on exit status and green, which is correct for `||`.
   - `{ ...| tail -1; }`, `( ... | tail -1 )` and `... | tail -1 && true`: green, since the last stage there is a group or `true`, the same class as `; true`.
2. `utils/verify.sh:163-164`: under dash with no terminal, `set -m` prints `set: can't access tty; job control turned off` to stderr once per command, and the command gets no process group of its own. `stop()` then sends `kill -TERM -- "-$job"` to a group that does not exist and `wait`s for the command to end. With INT, HUP, TERM and QUIT alike, the runner returned only after the 4-second command finished and had written `after`, which is the defect ruling 4 was meant to close. The report states before and after only for bash-as-sh.
3. `utils/verify.sh:118-119`: a pipe inside quotes becomes a false red that shows as a shell syntax error:
   ```
   == "echo 'PASS: a | tail -1'"
   RED: echo 'PASS: a | tail -1'
   exit status: 2
   sh: -c: line 0: unexpected EOF while looking for matching `''
   ```
   The report states this as judgment call 1 ("no command in the lists does this"). That records a known defect as a limit, which change standard rule 12 does not allow.
4. `utils/verify.sh:131-132` (the run is everything before the last `| tail`). In `sh passexit1.test.sh 2>&1 | grep PASS | tail -1`, where the test prints `PASS: x` and exits 1, the runner judges the command by grep's exit status and prints `PASS: x` / `verify: 1 commands passed` / `exit 0`. This follows ruling 1's wording, but a red test still passes when an earlier stage sits between it and `tail`. The report does not state this among the user-visible changes.

### Not checked

- 27 of the report's 36 reverts were not rerun; nine were reproduced, plus one of my own (traps reduced to 15).
- Busybox `sh`.
- dash with a real terminal attached, where `set -m` may succeed.
- A command that ignores TERM, which keeps the runner waiting (the report's judgment call 2).
- A raw carriage return in a command was probed. YAML itself reads it as a line break (`yaml.safe_load('x: "a\rb"')` gives `'a b'`), so it is not a runner finding.

Reviewer usage: 124,041 tokens, 29 tool uses, 778 s (the runner's completion notification).

## Repair round 2, refuted

Reviewed worktree `/Users/axelfaes/workspace/ordo/.agents/worktrees/2b-1`. The round's delta is `git diff 80ab53a`, read against `git diff 2ce1804`. `git status --short` shows ` M` on the report, `README.md`, `docs/dev/building.md`, `utils/verify.sh` and `utils/verify.test.sh`. Every probe ran on copies in the reviewer's scratchpad (`.../scratchpad/r2`). The worktree was not changed.

```
$ sh utils/verify.test.sh 2>&1 | tail -1          (timed: 25.6 s; again 24.2 s)
PASS: verify.sh scratch tests
$ sh utils/verify.test.sh; echo "exit $?"         (timed: 16.4 s)
PASS: verify.sh scratch tests
exit 0
$ VERIFY_TEST_SHELL=dash sh utils/verify.test.sh; echo "exit $?"   (timed: 8.5 s)
exit 0
$ dash utils/verify.test.sh; echo "exit $?"       (16.4 s)
PASS: verify.sh scratch tests
exit 0
$ for i in 1 2 3 4 5; do sh utils/verify.test.sh 2>&1 | tail -1; done
PASS: verify.sh scratch tests   (x5)

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
$ dash utils/verify.sh <same state file>; echo "exit $?"
(the same 19 lines)
verify: 11 commands passed
exit 0
$ sh utils/verify.sh /Users/axelfaes/workspace/ordo/<same path>   (main's state file; the verify lists are identical by diff)
verify: 11 commands passed
exit 0

The state file's verify list by hand, through its filters, with sh utils/verify.test.sh as a tenth test:
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1                     PASS: land.sh and usage.py scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1        PASS: check_config.py scratch tests
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1   PASS: collect_findings.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1         PASS: sync_rules.py scratch tests
$ sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1     PASS: launch.sh scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1                                      PASS: pin.sh scratch tests
$ sh utils/verify.test.sh 2>&1 | tail -1                                   PASS: verify.sh scratch tests
$ sh utils/check_skill_layout.test.sh 2>&1 | tail -1                       PASS: check_skill_layout.py scratch tests
$ sh utils/check_rule_inventory.test.sh 2>&1 | tail -1                     PASS: check_rule_inventory.py scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1                           PASS: check_coverage.py scratch tests
$ python3 utils/check_skill_layout.py      (ten ok: lines)  layout exit 0
$ <the ASCII check>                        ascii exit 0

$ grep -n 'verify.test.sh' README.md docs/dev/building.md docs/dev/change-standard.md   (cut to 120 columns)
README.md:111:sh utils/verify.test.sh
README.md:123:- `verify.test.sh` checks that `verify.sh` passes a list holding a summary test, a plain command and a com
docs/dev/building.md:12:sh utils/verify.test.sh                         # verify.sh on green, red and unusable verify li
docs/dev/change-standard.md:48:sh utils/verify.test.sh 2>&1 | tail -1
Four lists (README code block, README bullets, building.md, change-standard.md): equal, the same ten tests in the same order.
$ awk 'length>100' utils/verify.sh utils/verify.test.sh; LC_ALL=C grep -n '[^ -~]' <those files, README.md, building.md>
(no output; grep exit 1)
$ wc -l utils/verify.sh utils/verify.test.sh   ->  237, 471
$ git diff --numstat 2ce1804 -- README.md docs utils  ->  14 0 / 9 0 / 3 0 / 237 0 / 471 0   (matches the report)
$ git diff --numstat 80ab53a -- README.md docs utils  ->  11 3 / 7 1 / 156 113 / 188 89     (matches the report)

The report's reproductions, rerun (scratch folder; red.test.sh = printf 'FAIL: x\n'; exit 1):
| tail -1 2>/dev/null, | tail -1 >&2, | tail -1;, | tail -1 # keep | last, backslash-newline, | grep PASS | tail -1: each RED, exit 1 (matches)
echo 'PASS: a | tail -1': PASS: a | tail -1 / verify: 1 commands passed / exit 0 (matches)

Signals (Python driver: the runner under sh and dash; the command is "sleep 30 & echo $! >grand.pid; <python that calls setsid and sleeps 8> & echo $$ >cmd.pid; sleep 4; touch after"; then "- touch second"; a sleep in the driver's own group and one in another session run outside):
sh INT:   rc 130 after 0.09s; cmd alive=False grandchild alive=False escaped(setsid) alive=True after=False second=False scratch_left=0 outside_same_group alive=True outside_other_session alive=True out=b''
sh HUP:   rc 129 after 0.07s; (same)
sh QUIT:  rc 131 after 0.07s; (same)
sh TERM:  rc 143 after 0.06s; (same)
dash INT: rc 130 after 0.08s; (same)
dash HUP: rc 129 after 0.06s; (same)
dash QUIT: rc 131 after 0.06s; (same)
dash TERM: rc 143 after 0.06s; (same)

Reverts on copies of verify.sh (sh verify.test.sh; exit status of the test):
no pipefail                        -> FAIL: a summary test that exits 1: exit 0, expected 1 ...            test exit 1
PASS: check removed                -> FAIL: a summary test without a PASS last line: exit 0, expected 1    test exit 1
signal only the leader group       -> FAIL: the second process group of the session still runs            test exit 1
start_new_session=False            -> FAIL: INT: the runner did not stop within 10 seconds                test exit 1
stdin=DEVNULL removed              -> FAIL: a command reading standard input: output differs; got: read from stdin   test exit 1
handlers for TERM only             -> FAIL: INT: the runner did not stop within 10 seconds                test exit 1
rstrip removed                     -> red                                                                 test exit 1
';' allowed in the tail stage      -> FAIL: x (the "; true" control)                                      test exit 1
KILL at once, no TERM and no grace -> PASS: verify.sh scratch tests                                       test exit 0
no signal blocking around Popen    -> PASS: verify.sh scratch tests                                       test exit 0
status = code (negative kept)      -> PASS: verify.sh scratch tests                                       test exit 0
comment stripped before detection  -> PASS: verify.sh scratch tests                                       test exit 0 (a change of detection the tests allow)
```

### Spec

1. `utils/verify.sh:181-186`:
   ```
   tail_stage = re.compile(r"(?:\S*/)?tail(?:[ \t][^;|\n]*)?\Z")
   def prints_summary(command):
       head, pipe, rest = command.rpartition("|")
   ```
   Ruling item 2 keeps the `PASS:` rule for any command that ends in a pipe into tail. `sh t 2>&1 | tail -1;`, `sh t 2>&1 | tail -1 ;` and `sh t 2>&1 | tail -1 # keep | last` all end in a pipe into tail, but the runner takes them as plain commands and drops the `PASS:` condition. A test that exits 0 with a last line that is not `PASS:` counts as red under `docs/dev/building.md:20`. Under these spellings it passes. With `nopass.test.sh` (last line `done`, exit 0): `| tail -1;`, `| tail -1 ;` and `| tail -1 # keep | last` each exit 0 with `verify: 1 commands passed`. `| tail -1 2>/dev/null`, `>&2`, two spaces, no spaces and the backslash-newline each exit 1. The head comment states the narrower rule ("options with no ";""). The ruling asked for the wider one.

### Proof

1. `utils/verify.test.sh:188-198`: every spelling runs only with `passexit1.test.sh`, a test that exits 1. The red therefore comes from pipefail alone, and no spelling checks that the `PASS:` condition applies. The cases in Spec 1 show that it does not apply for two of the listed spellings (`tail -1;` and `# keep | last`), and the test stays green.
2. `utils/verify.test.sh:119-128`: the quoted-pipe case `echo 'PASS: a | tail -1'` is itself read as a summary test (the text after its last pipe is `tail -1'`). It passes only because the echoed text starts with `PASS:`. The case cannot show the misreading that Behaviour 1 below produces. With the same shape, `echo 'done | tail -1'` goes red.
3. `utils/verify.sh:92-94` (`signal_session(sid, signal.SIGTERM)` and the two-second grace): the head comment, `README.md:138` and the report ("TERM ... then KILL two seconds later") state TERM first. With the TERM call and the grace removed, so that KILL goes at once, the suite prints `PASS: verify.sh scratch tests`. No case shows that a command gets TERM and can clean up.
4. `utils/verify.sh:203` (`signal.pthread_sigmask(signal.SIG_BLOCK, stopping)`): the report's claim "so the runner always knows the pid of a command a signal can reach" has no test. With the block removed, the suite stays green.
5. `utils/verify.sh:212` (`status = 128 - code if code < 0 else code`): no case covers a command killed by a signal. With `status = code`, the suite stays green, and `- kill -9 $$` then prints `exit status: -9` instead of `exit status: 137`.
6. `utils/verify.test.sh:22-29`: when dash is not installed, the dash pass is skipped with `continue`, and the file prints the same `PASS: verify.sh scratch tests`. Change standard rule 9 requires a green result to say what it does not cover.

### Standards

1. `utils/verify.sh:4-5` ("Needs python3 with PyYAML ... and bash"), `README.md:134` ("The runner needs `python3` with PyYAML and `bash`"), `docs/dev/building.md:22` ("needs `python3` with PyYAML and `bash`"), and the exit-69 lines (`verify.sh:31`, `README.md` and `building.md` lists): the runner also needs `ps` (`verify.sh:69`), and the builder's report says so (judgment call 3). No check exits 69 without `ps`, and no page names the requirement. Ruling item 4 says every exit status is named. The status shown in Behaviour 2 is named nowhere. Change standard rule 5.
2. `utils/verify.test.sh:22-29`: `VERIFY_TEST_SHELL=dash sh utils/verify.test.sh` exits 0 and prints nothing. `docs/dev/building.md:20` says "A test passes when it exits 0 and its last line starts with `PASS:`", and the brief's conventions put `PASS: <script> scratch tests` last. Through the runner itself, `- VERIFY_TEST_SHELL=dash sh utils/verify.test.sh 2>&1 | tail -1` gives `RED: ... / exit status: 0 / last line does not start with PASS:`. Ruling item 5 names this invocation as a pass.
3. `utils/verify.sh:7-8` ("a red test piped into tail is red however the pipe is spelled") and `README.md:134` ("a red test piped into `tail` is red however the pipe is spelled") are false in two cases:
   - `sh passexit1.test.sh 2>&1 | tail -1 & wait` and `... | tail -1 & sleep 1` each print `PASS: x` / `verify: 1 commands passed` / exit 0. The pipeline runs in the background, so pipefail never reaches the status.
   - The Spec 1 spellings with a test that is red by its last line.

   Change standard rule 14.

### Behaviour

1. `utils/verify.sh:181-186`: a `| tail` inside quotes at the end of a command still makes it a summary test, so a green command goes red. `- echo 'done | tail -1'` gives `RED: echo 'done | tail -1'` / `exit status: 0` / `last line does not start with PASS:` / `done | tail -1`, exit 1. This is the false red of round 1's Behaviour 3 in a new form (a `PASS:` failure instead of a syntax error). The report does not state it.
2. `utils/verify.sh:69`, `:84`: without `ps` on `PATH`, a signal to the runner ends in `FileNotFoundError: [Errno 2] No such file or directory: 'ps'` and exit 1, which is also the status of a red command. The command is not stopped (alive after the signal, and it wrote `after` 5 s later), and the scratch folder is left behind (`scratch_left=['verify.i08o8jvr']`). This was reproduced with PATH holding only python3, bash, sleep and touch. The report states "the runner needs bash and ps" only as a judgment call, not as a user-visible change with its before and after (its item 4 names only `bash`).
3. The builder's two stated changes, checked against the pages:
   - A red summary test now shows only what its pipeline printed. `README.md:136` says the runner prints "its output". `docs/dev/change-standard.md:55` already says to rerun a red test without its filter. The pages state this change.
   - The runner needs `ps`. The pages do not state it (Standards 1).
4. `utils/verify.sh:183-186`: other probe results.
   - These are misread as summary tests. Each result is still red or correct:
     - `| tail -1 &` gives an empty output, exit status 0 and a red.
     - `| tail -1 &&true` with a red test gives exit 1.
     - `echo $(sh red.test.sh 2>&1 | tail -1)` gives exit status 0 and is red only on its `FAIL: x` last line.
     - `| tail -1 # summary` is red for a test without a `PASS:` last line.
   - These are plain commands with `FAIL: x` printed, in the `; true` class that ruling 2 accepts:
     - `x=$(sh red.test.sh 2>&1 | tail -1); echo "$x"`: green.
     - `| tail -1 || true`: green.
   - Heredocs:
     - `cat <<'EOF' | tail -1` with a heredoc is a plain command and passes on its output.
     - A heredoc fed to `tail` is red (status 141).
   - The kill does not reach processes outside the command's session. A sleep in the driver's own process group and one in another session both stayed alive under all eight signal runs. A process the command moves out with `setsid` also stays alive (judgment call 3). The pages say "every process group of that session", which is accurate.

### Not checked

- 32 of the report's 44 reverts were not rerun. Twelve reverts were run: the report's pipefail, `PASS:` check, leader group, new session, stdin and rstrip reverts, plus six of the reviewer's own.
- The report's "30 of 30 sh passes" and "25 dash passes" were not rerun at that count. Seven full runs over sh and dash, one dash-only run and one run of the file under dash were green.
- Linux, where `getsid` on a zombie may succeed and change the grace loop's exit, and busybox `sh`.
- A second signal arriving while the handler is in its two-second grace.
- Why the suite takes about 24 s through `| tail -1` against about 16 s without it.

Reviewer usage: 144,379 tokens, 34 tool uses, 1,123 s (the runner's completion notification).

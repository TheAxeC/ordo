# Refutation: step 7c

Reviewer: claude:opus, a fresh agent, aeb6c6afaff3c9c42; 99,985 tokens, 25 tool uses, 1,409 s.

## 1. Verification lines, verbatim

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh /Users/axelfaes/workspace/ordo/.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` (exit=0, 3:50 wall):
```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: allow_list.py scratch tests
PASS: check_paths.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
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
verify: 14 commands passed
```
`LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` (2:20 wall): `PASS: launch.sh scratch tests`

Load runs. Each was 16 whole runs of `launch.test.sh` at 16 at once (`xargs -P 16`), started by the scratch script `scratchpad/one.sh`:
- sh: `secs=318`, `pass=16 exit0=16 red=0`, no `FAIL:` line.
- `LAUNCH_SHELL=dash`: `secs=336`, `pass=16 exit0=16 red=0`, no `FAIL:` line.

Reverts. Each revert was applied to a copy under `scratchpad/rev/<r>/`, the whole suite was run on that copy, and the first `FAIL:` line is quoted. Every run exited 1:
- r0 (the guard's `last if zombie($watch);` removed and the refusal put back to `kill -0`): `FAIL: zombie leader: no exit file five seconds after the KILL`
- r1 (only the guard's `last if zombie($watch);` removed): `FAIL: zombie leader: no exit file five seconds after the KILL`
- r2 (`if ! pid_gone "$old_pid"` put back to `if kill -0 "$old_pid" 2>/dev/null`): `FAIL: zombie-relaunch: launch.sh failed`
- r3 (`my $asked = Time::HiRes::time();` changed to `my $asked = 0;`): `FAIL: a normal end: the guard asked ps: -o stat= -p 72850`
- r4 (`not_alive` put back to `! kill -0 "$1" 2>/dev/null`): `FAIL: zombie leader: the session leader is still running five seconds after the KILL`

The brief's premises reproduce on 372401f:
- `wc -l` gives 806 and 1662.
- `grep -n 'kill 0\|getpgrp\|kill -0'` gives lines 388, 399 and 744.
- `not_alive` is at line 301 and `patched` at line 279.
- The texts at SKILL.md 106/183/194/216, land SKILL.md 37-47 and launch-note.md 31 read as the brief says.

File line counts reproduce (`wc -l`): 840, 1796, 34, 299 and 136.

## 2. Findings

### Spec
- `7c-report.md`, "Doc text". The brief asks for the README line "as `grep -n` prints it". The report gives it cut short with "..." (`124:- \`launch.test.sh\` runs \`launch.sh\` under \`sh\`, or the shell \`LAUNCH_SHELL\` names, ...`). The orchestrator cannot apply the replacement from the report alone. The insertion anchor ("It checks the lock: a launch is refused while a killed run's runner or guard lives...") does exist in README.md (`grep -c` gives 1).
- Otherwise none. The mechanisms match the brief:
  - Zombies are found with `ps -o stat=`.
  - `ps` is asked only inside `while (kill 0, $watch)`, at most once a second.
  - The patched intermediate process sleeps 20 seconds, then `POSIX::_exit(0)`, and closes the lock descriptor.
  - The relaunch case asserts `zombie "$leader"` before it relaunches, so the case really runs on a zombie.

### Proof
- `7c-report.md`, "Sentences added, word counts" says "20: The pid is gone when `kill -0 <pid>` fails or `ps -o stat= -p <pid>` shows a state starting with `Z`." `printf '%s' '<that sentence>' | wc -w` prints 21. The report also says "19: the same sentence in `land/SKILL.md:44`", and `wc -w` prints 20. Two counts in the report do not reproduce.
- The report ran 32 runs per shell and my load runs were 16 per shell, so its "32 of 32" counts are not reproduced at that size. My 16 per shell were 0 red.
- No threshold was widened, and no check was made to pass by exempting a case. All five reverts reproduce as reported.

### Standards
- `skills/plan-orchestration/templates/launch.sh`, head comment, lines 44-46: "While kill -0 succeeds, it asks ps once a second, the first time one second after its start. So a normal end starts no ps."
  - The sentence is false for a normal end whose note `end` takes between 1 and 3 seconds. `launch-note.md` line 9 allows a call 3 seconds, and the leader lives through that call.
  - The report's own judgment calls say so ("A leader that lives longer, such as a slow note `end` (up to 3 s), gets one `ps` per second while it lives"). The head comment states the claim without that condition.
  - The test's "normal end" case uses an `end` that returns at once, so it does not show the claim false.
- `launch.sh` head comment line 9, "They also do so while the pid file names a live process". It is followed by "A pid counts as gone when kill -0 fails or ps shows it in a state starting with Z." The refusal is defined by "live" and the new term is "gone", two terms for one concept (prose-standard D, no synonym cycling). SKILL.md line 186 was changed to "a pid that is not gone"; the head comment was not.
- Added sentences over about 20 words: the SKILL.md:195 sentence above is 21 by `wc -w`. It is borderline and nothing else is over.
- none for:
  - Non-ASCII: `LC_ALL=C grep -n '[^ -~]'` over the added lines is empty.
  - Added `.sh` lines over 100 characters: `awk` prints none.
  - History in comments: no step or plan wording. `2.B/9` in the added lines is a test fixture `--label` value.

### Behaviour
- The report's "Host- and user-visible changes" leaves out two things.
- **The guard's `ps` call has no time limit.** In `launch.sh` line 387-393, `sub zombie` runs `open my $ps, "-|", "ps", ...` and blocks on `<$ps>` and `close $ps`, with no time limit.
  - While a `ps` call hangs, the guard's loop checks nothing. That delays the exit file and the release of the lock by however long `ps` takes.
  - The same holds for the launcher's `pid_gone` (lines 560-568, `state=$(ps -o stat= -p "$1" 2>/dev/null)`). It runs whenever the pid file names a pid that `kill -0` reaches, and a slow `ps` delays the launch.
  - Before this change, neither path ran `ps`. I did not measure `ps` latency under load, so this is not verified either way. The 16x load runs stayed green.
- **When `ps` fails or answers nothing, the result is "alive", with no message.**
  - Guard: `zombie()` returns 0 when `open` fails, for example no `ps` on the builder's `PATH`. The guard then waits on `kill 0` alone, which is the old behaviour, and says nothing on stderr.
  - Launcher: `pid_gone` with empty `ps` output returns 1 ("not gone") and refuses with 75.
  - Both fall back to the old behaviour, not to a wrong "gone", so a wrong write is not possible. Neither is stated in the report or in a comment.
  - Pid reuse cannot mislead the guard, because it is in the leader's process group. In the launcher, a reused pid that is itself a zombie counts as gone, which is correct because the leader is gone either way.
- **`ps` resolves through the builder's `PATH`.** The guard runs `ps` from the `PATH` the builder's environment carries, not from a fixed path. The test relies on this to insert its recording `ps`. The report does not state it as host-visible.
- **Nothing else reads a zombie leader as alive.** `grep -rn 'kill -0\|kill 0\|kill(0\|zombie\|ps -o stat\|is gone\|pid.*gone' skills utils docs README.md` gives these hits:
  - `launch.sh:365`: the stop's grace loop over session members. The scanner skips the leader's sid, and the loop is bounded to 1 second.
  - `land.test.sh:290,294` and `verify.test.sh:455,484`: these watch processes that are not session leaders.
  - The land skill's Steps item 1 now carries the zombie rule at line 44.
  - Item 5 of `plan-orchestration/SKILL.md` (lines 195-196) now carries it, and line 106 points to item 5.

## 3. Not checked
- Behaviour on Linux, including under a child subreaper that does not reap, and Linux `ps` output with a leading blank or a `Z+` state. I ran on macOS only.
- The latency of `ps` under load, and a hanging `ps`. The finding above is by reading the code.
- 32-run load counts: I ran 16 per shell.
- The `[:space:]` strip in `pid_gone` and `zombie` under dash on output with leading blanks. On macOS, `ps -o stat=` for a zombie has no leading blank, so the strip was not exercised.

## 4. Usage
- About 30 minutes of wall time. It was mostly the verify runner (3:50), the dash suite (2:20), the five parallel revert suites, and the two load runs (318 s and 336 s).
- About 60k tokens of context.
- Scratch files are under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/6266a558-ed92-43a1-ac08-9bf8f4bc78a8/scratchpad/` (`rev/`, `load-sh/`, `load-dash/`, `one.sh`, `base-launch.sh`). No file in the repository or ledger was changed.

# Repair round 1, refuted

Reviewer: claude:opus, a fresh agent, a064e914eab636e39; 135,664 tokens, 43 tool uses, 4,961 s.

## 1. Verification lines, verbatim

Command: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh /Users/axelfaes/workspace/ordo/.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`. It exited 0 after 4:06 wall time, with load 14.87 before the run.
```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: allow_list.py scratch tests
PASS: check_paths.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
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
verify: 14 commands passed
```
`LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1`: `PASS: launch.sh scratch tests`

**How the base files were established.** I rebuilt the base files by reverse-applying `git diff 372401f -- <file>` to copies of the step's files. `cmp` against `/Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/{launch.sh,launch.test.sh}` printed `same launch.sh` and `same launch.test.sh`. `wc -l` gives 806 and 1662 for the base, and 878 and 1946 for the step.

**Batch method.** Each batch is 16 whole runs of `launch.test.sh` at 16 at once (`xargs -P 16`), from `scratchpad/7c-rr1/batch.sh`. `uptime` was recorded before each batch. The machine has 11 cores (`sysctl -n hw.ncpu`). During the runs, `ps -Ao pcpu,comm -r` showed Microsoft Defender at 97.5 %, 42 % and 34.8 %, mds_stores at 32.8 % and node at about 30 % each.

| # | Files | Shell | Load before (1/5/15 min) | Wall time | Red | First `FAIL:` line of each red run |
|---|---|---|---|---|---|---|
| 1 | base | sh | 4.47 9.77 15.17 | 428 s | 0/16 | none |
| 2 | step | sh | 11.24 12.71 14.77 | 462 s | 3/16 | `FAIL: a hanging start held the exit file for 7118 ms`, `... for 7750 ms`, `... for 9751 ms` |
| 3 | base | sh | 11.70 13.05 14.37 | 397 s | 1/16 | `FAIL: a hanging start held the exit file for 6254 ms` |
| 4 | step | sh | 12.42 13.39 13.99 | 393 s | 5/16 | `FAIL: a hanging start held the exit file for` 7093, 7085, 7085, 6205 and 7098 ms |
| 5 (extra) | step | sh | 31.87 23.74 17.61 | 452 s | 0/16 | none |
| 6 (extra) | base | sh | 19.92 20.84 18.64 | 350 s | 3/16 | `FAIL: start printing two lines: calls were`; `FAIL: a job of the leader's session: process 93310 is still running`; `FAIL: a job of the leader's session: process 93314 is still running` |
| M (control) | step `launch.sh` with the base `launch.test.sh` | sh | 10.15 9.17 11.35 | 446 s | 1/16 | `FAIL: a hanging start held the exit file for 6188 ms` |
| D1 | step | dash | 10.20 10.68 11.50 | 438 s | 1/16 | `FAIL: guard waits: no guard in the session while end hangs` |
| D0 (control) | base | dash | 6.19 9.66 11.13 | 436 s | 2/16 | `FAIL: guard waits: no guard in the session while end hangs`; `FAIL: a hanging start held the exit file for 6950 ms` |

**Are the step's files redder than the base's under the same load?**
- In the four required alternating `sh` batches, yes: the step had 8 red of 32 runs and the base had 1 of 32. Every one of those reds was the same older case, "a hanging start held the exit file" (limit 6000 ms).
- Over all six `sh` batches, the step had 8 red of 48 and the base had 4 of 48.
- Under dash, the step had 1 red of 16 and the base had 2 of 16.
- None of the reds is in a case this step adds or changes. None of them lies on a path that the step's code runs or lengthens, by the code reading below.
- Control batch M ran the step's `launch.sh` with the base's test file and had 1 red of 16, the same as the base. That points to the step's longer test file, which puts other load on the 16 parallel runs, and not to `launch.sh`. It is one batch, so this is not proven.

**The red cases, read against the step's code:**
- **"a hanging start held the exit file"** (`launch.test.sh:1187-1199`). The timed window runs from the moment the note's start records its pid until the exit file appears. In that window: the start hangs, the runner stops it after its 3-second limit, then the scanner and the grace period run, then the builder runs, then the leader writes the exit file.
  - There is no id, so no `end` runs, and the leader writes the exit file right after the builder's runner exits.
  - The guard's first `ps_state` call comes 1 second after the guard starts. Even when it runs, it does not block the leader's write.
  - `pid_gone` does not run: the run folder is new, so there is no pid file. Its timing would also fall outside the timed window.
  - What the step adds on this path is only the compile of the `ps_state` sub text inside each runner's perl script.
  - Conclusion: the step's code does not lengthen this path.
- **"guard waits: no guard in the session while end hangs"** (line 1388, unchanged). The guard is looked up once, right after `end` starts. `ps_state` cannot end the guard: the guard only leaves its loop on a state starting with `Z`, and a running leader does not show one. A `ps` child of the guard has the guard as its parent, not pid 1, so it does not hide the guard from `orphans_of`. The base shows the same red under dash (batch D0).
- **The builder's reported reds, read without being reproduced:**
  - "the builder ended as the leader was killed" (lines 953-974): the runner writes the exit file itself and forks no guard. There is no `ps` call on that path.
  - "a launch while a killed run's guard lives exited 0" (line 1359): the launch takes the lock before it calls `pid_gone` (`launch.sh`, the `exec perl -e "$take_lock"` line comes before `if ! pid_gone`). A `ps_state` call in flight in the guard delays the guard noticing the leader's end, which lengthens the time the guard holds the lock. That makes a 75 more likely, not less.

**Reverts.** Each revert was applied to a copy of the step's `launch.sh` under `scratchpad/7c-rr1/rev/<r>/`, with the step's test file beside it, and the whole suite was run:

| Revert | Exit | First `FAIL:` line |
|---|---|---|
| nolimit: `time() + 2` changed to `time() + 1000` in `ps_state` | 1 | `FAIL: ps hang: the session, its guard included, runs on five seconds after the leader's end` |
| pidgone: `pid_gone` back to `state=$(ps -o stat= -p "$1" 2>/dev/null)` | 1 | `FAIL: a ps that never answers the launch: its ps ended 20023 ms after its start` |
| nokill: `kill "KILL", $child;` removed | 1 | `FAIL: ps hang: the session, its guard included, runs on five seconds after the leader's end` |
| noline: the guard's `print STDERR "launch.sh: the guard cannot run ps..."` removed | 1 | `FAIL: no ps: the stderr file holds 0 lines on ps, expected 1` |
| asked0: `my $asked = 0;` | 1 | `FAIL: a normal end: the guard asked ps 26 ms after the builder: -o stat= -p 13341` |
| askonce: `$ask_ps = 0;` removed | **0** | none (the suite stays green) |

`grep -n alarm launch.sh` finds only the comment at line 211, so the guard has no alarm.

## Repair round 1, refuted

### Spec
- **The README Doc text sentence "A normal end starts no `ps` in the guard."** (`7c-report.md`, Doc text). The round changed the case so that it checks only for no `ps` in the guard's first second, and the new head comment says "One that lives longer gets one ps a second while it lives". The README sentence states the stronger claim, which the case no longer checks.
- **The README Doc text sentence "A guard with no `ps` on its `PATH` says so once in the stderr file."** Nothing proves the "once": see Proof, the askonce revert.

### Proof
- **Ruling 2's "one line, then asks ps no more" is an audit, not a proof.** `launch.sh:453` `$ask_ps = 0;` removed leaves the whole suite green (exit 0).
  - The no-ps case keeps the leader alive only 2 seconds after its write (`patched leader-lives ... sleep 2`). So the guard reaches `ps` about once whether or not it stops asking.
  - The case's check `[ "$lines" -eq 1 ]` (`launch.test.sh`, end of the no-ps case) passes with or without the flag.
  - The report's ruling 2 row claims the guard "asks `ps` no more" and cites the case; the builder names only the print-line revert.
- **The normal-end check was widened without a ruling.** At `launch.test.sh`, the case "A normal end starts no ps in the guard's first second":
  ```
  -[ ! -s "$PS_STATE_LOG" ] || fail "a normal end: the guard asked ps: $(cat "$PS_STATE_LOG")"
  +    [ $((at - builder_end)) -ge 1000 ] ||
  +        fail "a normal end: the guard asked ps $((at - builder_end)) ms after the builder: $call"
  ```
  - The predicate went from "no call recorded" to "no call within 1000 ms of the builder's end".
  - Ruling 4 asked for the head comment to be changed, not the test. The brief's "What it must do" still says "A normal end starts no `ps` in the guard."
  - The asked0 revert still turns it red (quoted above), but the case now passes a normal end that does start a `ps`.
  - The report lists this under "changed" cases with no ruling cited for the widening.
- **The launch-case bound does not measure what ruling 1 asked.** In the new case, the check is `[ $((killed - asked)) -le 4000 ]`. Ruling 1 asked for the refusal "within about 2 seconds of the `ps` call". The case measures when the stub `ps` is killed, with a 4-second bound, and does not time the refusal itself. It still discriminates against the unbounded revert (20023 ms).
- **The report's first part is stale.** `7c-report.md` line 3 still says "Everything in the brief is done", and "The new cases" still says of the normal-end case "the log is empty". Both contradict the round section: its NOT DONE for the load runs, and the widened check above.
- **The load-run closure does not reproduce as 0 red.** The builder reports `sh` load runs of 26 of 32 and 31 of 32 passed. My required `sh` batches were 8 red of 32 for the step and 1 red of 32 for the base (table above). The brief's requirement of 32 runs at 16 at once under `sh` and dash, each with 0 red, is not met on this tree under this machine's load. It is not met by the base either.

### Standards
- **`launch.sh:49-51` and `skills/plan-orchestration/SKILL.md:183` state bounds the round's own 2-second `ps` limit breaks.** `launch.sh` says "The guard ends within about a tenth of a second of a leader that is reaped. It ends within about a second of a leader left a zombie." `SKILL.md:183` says the same.
  - While a `ps_state` call is in flight, the guard does not check `kill 0` for up to 2 seconds. A reaped leader can therefore be followed by the guard's end about 2 seconds later, and a zombie by about 3 seconds.
  - The round's own ps-hang case allows 5 seconds for exactly that.
  - Neither text mentions the `ps` window.
- **`launch.test.sh` head comment, line 36** says "a normal end starts no ps in the guard, checked through a ps that records its calls". The round narrowed the case to the guard's first second (see Proof), and this line was not carried.
- none further. The round's added lines have no non-ASCII characters and no added `.sh` line over 100 characters (by `awk` over `git diff 59409d1`). I found no history in the comments.
  - The word counts in the report reproduce with `printf '%s' ... | wc -w`: 9, 8, 16, 17, 18, 19 and 18.
  - The README line 124 quoted in the report equals `grep -n '' README.md | sed -n 124p`, byte for byte.
  - Ruling 5 holds: head comment line 9 reads "names a pid that is not gone". The remaining uses of "live" in `launch.sh` (lines 8, 92 and 539) refer to the lock, not to the pid file.

### Behaviour
- **The zombie cases' patched copy now also raises the note's limit from 3 to 15 seconds.** The change is `s/"\$runner" 3 "\$\$"/"\$runner" 15 "\$\$"/g` added to `zombie_parent`. No ruling covers it, and it changes what the zombie cases run. It does not weaken what they assert: the r1 revert (the guard's zombie test removed) and the r2 revert (the refusal back to `kill -0`) still turn them red, per the builder; I did not rerun those two. The report states it only as "changed: the copy raises the note's limit to 15 s".
- none further. The report states the host-visible changes with before and after:
  - `ps` is found through the builder's `PATH` for the guard and the caller's `PATH` for the launch.
  - Each call is bounded at 2 seconds.
  - The guard writes one line to stderr when `ps` cannot be started.

## Not checked
- Linux, and a child subreaper that does not reap.
- The builder's r1, r2, r4, r5, r6, r7 and r8 reverts as the builder built them. I ran my own nolimit, pidgone, nokill, noline, asked0 and askonce reverts instead.
- Runs of 32 at 16 at once. Each of my batches was 16 runs.
- Whether the step's test file causes the extra "hanging start" reds, beyond the one control batch M.
- Why the unchanged "guard waits" lookup misses the guard under load. It happens on the base too.

## Usage
- About 95 minutes of wall time, mostly nine load batches of 350 to 462 s each, one 5-way revert batch, one asked0 revert run, the verify runner (4:06) and one dash suite run.
- About 32 tool calls, and about 100k tokens of context.
- The scratch files are under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/6266a558-ed92-43a1-ac08-9bf8f4bc78a8/scratchpad/7c-rr1/`: `base/`, `step/`, `mix/`, `recon/`, `rev/`, the batch outputs `b1`, `b2`, `b3`, `s1`, `s2`, `s3`, `m1`, `d1` and `bd1`, and `batch.sh`.
- No file in the worktree, the repository or the ledger was changed. `git status --short` shows only the builder's four modified files and the untracked report.

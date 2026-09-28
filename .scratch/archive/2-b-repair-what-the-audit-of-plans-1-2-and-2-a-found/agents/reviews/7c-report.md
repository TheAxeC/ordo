# Report: 7c, a session leader left as a zombie counted as gone

Everything in the brief is done.

## Open items of the state file, verbatim

- none.

## DONE / NOT DONE

| Item | State | Proof (command, output) |
|---|---|---|
| 1. One meaning of "gone" in the guard | DONE | Whole suite with the guard's `last if zombie($watch);` removed (copy in `$TMPDIR/7c/rev/r1`): first `FAIL: zombie leader: no exit file five seconds after the KILL`. |
| 1. The same meaning in the pid-file refusal | DONE | Whole suite with `if ! pid_gone "$old_pid"` put back to `if kill -0 "$old_pid" 2>/dev/null` (`rev/r2`): the launch prints `.../a test root/zombie-relaunch out/pid names pid 43815, which is still running; not launched`, first `FAIL: zombie-relaunch: launch.sh failed`. |
| 1. `ps` only while `kill 0` succeeds, at most once a second; a normal end starts no `ps` | DONE | Whole suite with `my $asked = Time::HiRes::time();` changed to `my $asked = 0;` (asks at the first check, `rev/r3`): first `FAIL: a normal end: the guard asked ps: -o stat= -p 45437`. The trimmed normal-end case on that revert: 10 of 10 runs red; on the fix under dash: 10 of 10 `PASS: trimmed`. The control is the zombie-leader case, which asserts `PS_STATE_LOG` is not empty. |
| 2. The texts made true | DONE | `launch.sh` head comment (Launch and Exit file paragraphs) and runner comment; `pid_gone` comment; `SKILL.md` lines 106, 183, 186, 195-196, 218; `launch-note.md` line 32; `land/SKILL.md` line 44. `grep -rn 'kill -0\|kill 0' skills utils docs README.md` output is listed under "Carried to every place". |
| 3. `not_alive` counts a zombie as gone | DONE | Whole suite with `not_alive` put back to `! kill -0 "$1" 2>/dev/null` (`rev/r4`): first `FAIL: zombie leader: the session leader is still running five seconds after the KILL`. |
| The brief's cases run first, on the unchanged `launch.sh` | DONE | Trimmed test (helpers plus the new cases) on the unchanged tree: `FAIL: zombie leader: no exit file five seconds after the KILL`. The relaunch case alone: `FAIL: zombie relaunch: the leader 75550 was reaped before the relaunch`, since the unchanged guard waits until the reap (20 s), so the precondition fails before the refusal is reached. Whole suite on the unchanged code (both code changes reverted, `rev/r0`): first `FAIL: zombie leader: no exit file five seconds after the KILL`. |
| Verify 1 | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`: exit 0, twelve `PASS:` lines (land.sh and usage.py, check_config.py, collect_findings.py, sync_rules.py, launch.sh, allow_list.py, check_paths.py, pin.sh, `verify.sh scratch tests (runner under sh dash)`, check_skill_layout.py, check_rule_inventory.py, check_coverage.py), ten `ok:` lines (land, ordo-init, plan, plan-help, plan-orchestration, plan-retro, refute, repo-setup, roadmap, spec), `verify: 14 commands passed`. |
| Verify 2 | DONE | `LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 \| tail -1`: `PASS: launch.sh scratch tests`. |
| Verify 3, load | DONE | 32 runs at 16 at once (`xargs -P 16`), output per run in `$TMPDIR/7c/load/`. sh: runs=32 pass=32 exit0=32 fail=0 (569 s). dash (`LAUNCH_SHELL=dash`): runs=32 pass=32 exit0=32 fail=0 (567 s). |
| Verify 4, each case red under a revert | DONE | See the reverts above. Each new case is a proof, not an audit. |
| Conventions | DONE | `sh -n` and `dash -n` on both scripts pass; `LC_ALL=C grep -n '[^ -~]'` on the five files prints nothing; `awk 'length > 100'` lists only lines that were already over 100 (launch.sh 171, 769, 798, 814, the option and detach lines; launch.test.sh lines outside the added ranges). |

## The new cases (all in `launch.test.sh`)

- **Zombie leader.** A patched copy (`zombie_parent`) forks an intermediate process in `$detach`'s child. It closes the lock's descriptor, sleeps 20 s without reaping, and the leader is its child. The pid-file check accepts any pid. The builder exits 3, `end` hangs, and the leader is killed. The case asserts: the leader shows `Z` in `ps`; within 5 s of the KILL the leader counts gone (`not_alive`), the exit file is present and the guard (found with `orphans_of`) is gone; the file holds `exit 3`; the guard asked `ps` for a state. Red under r0, r1 and r4.
- **Normal end starts no `ps`.** The same recording `ps`, first on PATH for this launch only, logs every call with `stat=`. A note launch whose `end` returns at once ends; the log is empty. Red under r3.
- **Pid file naming a zombie leader.** The zombie copy with the guard held 3 s before its write. After the KILL, a launch at once is refused with 75 by the lock the guard holds. After the guard has written `exit 3` and ended, the case asserts the leader is still a zombie. Then a launch of the same pid file runs and its exit file is `exit 4`. Red under r2.
- The head comment names these cases, and `not_alive`'s new meaning.

## Files changed, with line counts (`wc -l`)

- `skills/plan-orchestration/templates/launch.sh`: 878 (806 before the step).
- `skills/plan-orchestration/templates/launch.test.sh`: 1946 (1662 before the step).
- `skills/plan-orchestration/templates/launch-note.md`: 34 (33 before the step).
- `skills/plan-orchestration/SKILL.md`: 300.
- `skills/land/SKILL.md`: 136.
- This report.

## Judgment calls the brief left open

- The guard's first `ps` comes one second after the guard starts, then once a second. So a normal end in which the leader ends within a second of the builder starts no `ps`. A leader that lives longer, such as a slow note `end` (up to 3 s), gets one `ps` per second while it lives.
- The zombie test is `ps -o stat= -p <pid>` with leading blanks stripped and a first character `Z`; macOS prints `Z   ` for a zombie (checked with a perl fork: `kill0=1`, `Z`).
- `SKILL.md` line 186 ("names a live process") was carried too, pointing at item 5 for the meaning of gone.
- The runner's `stop` grace loop (`launch.sh:365`, `kill 0` on session members) is unchanged: it is bounded by its one-second grace and does not wait on the leader. The `kill -0` loops in `land.test.sh` and `verify.test.sh` watch processes that are not session leaders and are unchanged.
- The recording `ps` sits in a folder of its own, put first on PATH only for the two launches that `launch_state_logged` starts, so the test's own `ps` calls are not recorded.
- The skills' `metadata.version` values were not changed.

## Host- and user-visible changes

- Guard. Before: it waited while `kill 0` succeeded, so a killed leader its parent did not reap kept it waiting and holding the lock, with no exit file. After: a leader that `ps` shows as a zombie counts as gone, and the guard writes the builder's code within about a second.
- Launch refusal. Before: a pid file naming a zombie leader refused with exit 75. After: it does not refuse; the lock still refuses while the killed run's runner or guard lives.
- `ps` through `PATH`. Before: neither the guard nor the launch ran `ps`. After: both run the `ps` found on `PATH` (the guard on the builder's, the launch on the caller's), each call bounded at 2 seconds. A `ps` that cannot run, answers nothing or takes longer counts the pid as not gone. The guard then says so once in the stderr file and waits on `kill 0` alone.
- `plan-orchestration` and `land` skill texts now state that a pid is gone when `kill -0` fails or `ps -o stat= -p <pid>` shows a state starting with `Z`.

## Carried to every place

`grep -rn 'kill -0\|kill 0' skills utils docs README.md` (without `launch.test.sh`) hits: `land/SKILL.md:44` (new meaning); `land/templates/verify.test.sh:455,484` and `land.test.sh:290,294` (not session leaders, unchanged); `launch.sh:10,44,45,228,558` (comments stating the meaning), `365` (stop grace, unchanged), `415` (the guard), `561` (`pid_gone`); `plan-orchestration/SKILL.md:195,196`; `launch-note.md:32`.

## Sentences added, word counts (`wc -w`)

Every count is what `printf '%s' '<sentence>' | wc -w` prints, on the text as it stands after repair round 1. No added sentence is over 20 words. The longest:

- 19: "A pid counts as gone when kill -0 fails or ps shows it in a state starting with Z." (`launch.sh` head comment).
- 19: "A state starting with `Z` marks a zombie: a leader that ended and that its parent has not reaped." (`SKILL.md:197`).
- 19: "A ps that fails, answers nothing or has not answered within 2 seconds counts the pid as not gone." (`launch.sh` runner comment).
- 19: "no ps on the guard's PATH: one line in the stderr file, and the guard ends with the leader" (`launch.test.sh` head comment clause).
- 18: "While kill 0 succeeds, it asks ps for that pid's state once a second, starting one second in." (`launch.sh` runner comment).
- 16: "It is also gone when `ps -o stat= -p <pid>` shows a state starting with `Z`." (`SKILL.md:195` and `land/SKILL.md:44`, after the split).

The test's head-comment bullet keeps the file's semicolon list form, and each clause is 19 words or fewer.

## Anything in the brief wrong or impossible

- Nothing found wrong. The brief's premise that `kill 0` succeeds on a zombie holds on macOS (perl fork check: `kill0=1`, `ps` state `Z`, `sh -c 'kill -0'` succeeds).

## Doc text

`grep -n 'launch.test.sh. runs' README.md` prints, whole:

```
124:- `launch.test.sh` runs `launch.sh` under `sh`, or the shell `LAUNCH_SHELL` names, with stub `claude`, `codex` and launch-note commands, in paths that contain spaces, and checks each recipe's arguments, exit code and note calls, resumed sessions, relative paths, the session id, the lock and the refusal of a second launch, the note calls stopped after 3 seconds, the exit file, and that TERM, INT or HUP to the pid, the land skill's TERM-then-KILL sequence, a signal while the builder or a note call is being started, and KILL to the leader alone each leave no builder process behind. It also checks the exit file each stop leaves: the land skill's sequence, a slow stop, a scanner that never answers, a KILL to the leader alone, a builder that ended as the leader was killed, TERM and KILL while `end` hangs, and a KILL while `end` hangs or during the leader's write, which the runner's guard covers. It checks that the runner's guard is in the leader's process group, and that a guard outside it writes no exit file and says so in the stderr file. It checks that the guard waits for a leader that lives more than 10 seconds after the builder's end, and that the leader's KILL then leaves the builder's code. It checks that no writer replaces an exit file present, that no temporary file is left, and that a launch removes an exit file and a temporary exit file an earlier run left. It checks the lock: a launch is refused while a killed run's runner or guard lives, and the builder and the note calls do not hold the lock. It also checks the allow file: a `claude` launch passes each of its lines as `--allowedTools "Bash(<line>:*)"`, on a first launch and on `--resume`, and is refused without `--allow-file`, with a file that is missing or holds no command, or with a line holding a character no rule can hold or a carriage return.
```

Replacement for README line 124, whole (the line without its `124:` prefix):

```
- `launch.test.sh` runs `launch.sh` under `sh`, or the shell `LAUNCH_SHELL` names, with stub `claude`, `codex` and launch-note commands, in paths that contain spaces, and checks each recipe's arguments, exit code and note calls, resumed sessions, relative paths, the session id, the lock and the refusal of a second launch, the note calls stopped after 3 seconds, the exit file, and that TERM, INT or HUP to the pid, the land skill's TERM-then-KILL sequence, a signal while the builder or a note call is being started, and KILL to the leader alone each leave no builder process behind. It also checks the exit file each stop leaves: the land skill's sequence, a slow stop, a scanner that never answers, a KILL to the leader alone, a builder that ended as the leader was killed, TERM and KILL while `end` hangs, and a KILL while `end` hangs or during the leader's write, which the runner's guard covers. It checks that the runner's guard is in the leader's process group, and that a guard outside it writes no exit file and says so in the stderr file. It checks that the guard waits for a leader that lives more than 10 seconds after the builder's end, and that the leader's KILL then leaves the builder's code. It checks that no writer replaces an exit file present, that no temporary file is left, and that a launch removes an exit file and a temporary exit file an earlier run left. It checks the lock: a launch is refused while a killed run's runner or guard lives, and the builder and the note calls do not hold the lock. It checks a session leader that its parent leaves a zombie. Its KILL leaves the exit file within five seconds. A pid file naming it does not refuse a launch. A normal end starts no `ps` in the guard. When `ps` never answers the guard, the guard still ends within five seconds of the leader. When `ps` never answers the launch, a pid file naming a live process is still refused. The launch kills that `ps` within 4 seconds. A guard with no `ps` on its `PATH` says so once in the stderr file. It also checks the allow file: a `claude` launch passes each of its lines as `--allowedTools "Bash(<line>:*)"`, on a first launch and on `--resume`, and is refused without `--allow-file`, with a file that is missing or holds no command, or with a line holding a character no rule can hold or a carriage return.
```

## Repair round 1

NOT DONE: the load runs under `sh` did not reach 0 red on the final tree. The other rulings and checks are done. The evidence is under "Verify before you report".

### Rulings

| Ruling | State | Proof |
|---|---|---|
| 1. A 2-second limit on each `ps` | DONE | `launch.sh` has one perl sub, `ps_state`, used by the guard and by `pid_gone`. It reads the pipe through `IO::Select` with a 2-second deadline, with no alarm. Past the deadline it sends KILL to the `ps` it started, and the answer is empty ("not a zombie"). `pid_gone` runs it through `perl -e "$ps_state"`. The guard case and the launch case are below, each red under its revert. |
| 2. A `ps` that cannot run or answers nothing | DONE | `ps_state` returns undef when `ps` cannot start. The guard then prints `launch.sh: the guard cannot run ps: $!; it waits on kill 0 alone` once (`launch.sh:452`) and asks `ps` no more. Perl's own exec warning is off (`no warnings "exec"`), so that line is the only one. The head comment and the runner comment say a `ps` that fails, answers nothing or takes over 2 seconds counts the pid as not gone. The case is below. |
| 3. `ps` through `PATH` | DONE | The runner comment says the guard runs the `ps` found on the builder's `PATH`, through `ps_state`. The report's "Host- and user-visible changes" gives the before and after. |
| 4. What the head comment says of a normal end | DONE | The head comment now says: "A leader that ends within a second of the builder starts no ps. One that lives longer gets one ps a second while it lives. A note end of up to 3 seconds is such a case." |
| 5. One term | DONE | Head comment line 9: "They also do so while the pid file names a pid that is not gone." `grep -n 'live process' launch.sh` finds no text that calls it live. |
| 6. Sentence length and counts | DONE | `SKILL.md:195` and `land/SKILL.md:44` are now two sentences: "The pid is gone when `kill -0 <pid>` fails." (9 and 8 words) and "It is also gone when `ps -o stat= -p <pid>` shows a state starting with `Z`." (16). The "Sentences added" section above was recounted with `printf '%s' '<sentence>' \| wc -w`. |
| 7. Doc text | DONE | The "Doc text" section above quotes line 124 whole and its replacement whole, naming the six cases this step adds. |

### New and changed cases, and the reverts that turn them red

Each revert was applied to a copy of the final files under `$TMPDIR/7c/rev8/<r>`, and the whole suite ran on it. The line quoted is the first `FAIL:` line of the whole suite. The fix itself passed under `sh` and under `LAUNCH_SHELL=dash` in the same batch (`PASS: launch.sh scratch tests`).

| Case | Revert | First `FAIL:` line |
|---|---|---|
| A `ps` that never answers the guard (new): a patched copy keeps the leader 2 s after its write; the recording `ps` sleeps 20 s; within 5 s of the leader's end the exit file holds `exit 0` and the session is gone | r5, the guard's `ps_state($watch)` replaced by an unbounded `` `ps -o stat= -p $watch` `` | `FAIL: ps hang: the session, its guard included, runs on five seconds after the leader's end` |
| The same case | r7, the shared limit made 1e6 seconds | `FAIL: ps hang: the session, its guard included, runs on five seconds after the leader's end` |
| A `ps` that never answers the launch (new): a pid file naming a live process still refuses with 75, naming the pid; the launch kills that `ps` within 4 s of its start | r6, `pid_gone` back to an unbounded `state=$(ps -o stat= -p "$1" 2>/dev/null)` | `FAIL: a ps that never answers the launch: its ps ended 20021 ms after its start` |
| A guard that cannot start `ps` (new): `PATH` holds no `ps`; one line in the stderr file; exit 0; the session gone within 5 s of the leader's end | r8, the guard's `print STDERR` line removed | `FAIL: no ps: the stderr file holds 0 lines on ps, expected 1` |
| A normal end starts no `ps` in the guard's first second (changed): every recorded state call comes at least 1000 ms after the time the builder records at its end | r3, `my $asked = 0;` | `FAIL: a normal end: the guard asked ps 47 ms after the builder: -o stat= -p 62611` |
| Zombie leader (changed: the copy raises the note's limit to 15 s, and the guard is polled for) | r1, the guard's zombie test removed | `FAIL: zombie leader: no exit file five seconds after the KILL` |
| Zombie leader | r4, `not_alive` back to `! kill -0` | `FAIL: zombie leader: the session leader is still running five seconds after the KILL` |
| Zombie leader | r0, both code changes of the step reverted | `FAIL: zombie leader: no exit file five seconds after the KILL` |
| Pid file naming a zombie leader (changed as the zombie leader case) | r2, the refusal back to `kill -0` | `FAIL: zombie-relaunch: launch.sh failed` |

Other test changes this round:
- **Recording `ps` runs once at setup.** The first run of a new script took over 2 seconds under load: in 32 parallel runs of the new cases without that call, the guard's `ps_state` timed out before the stub logged anything. With it, 32 of 32 passed.
- **`ps_hang` records a start and an end time.** It records its own start. A child it forks records when `ps_hang` ends, so the launch case times the kill from inside the stub.
- **Session check in the guard cases.** The two new guard cases wait for the session to be gone instead of looking up the guard's pid. A lookup in the guard's two-second window missed the guard under load.
- **The launch bound of 4 seconds.** It is the 2-second limit plus the scheduling delay seen under load; a run gave 2964 ms. The file's existing cases use the same shape, 6 seconds for a 3-second note limit. The revert gives 20 seconds.

### Verify before you report

- `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` on the final files: exit 0, twelve `PASS:` lines, ten `ok:` lines, `verify: 14 commands passed`.
- `LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` on the final files: exit 0, `PASS: launch.sh scratch tests`.
- Load runs, 32 whole runs at 16 at once (`xargs -P 16`), on the final files:
  - `LAUNCH_SHELL=dash`: 32 runs, 32 with `PASS: launch.sh scratch tests`, no `FAIL:` line.
  - `sh`: 32 runs, 26 with the `PASS:` line, 6 red. All six: `FAIL: the builder ended as the leader was killed: no exit file five seconds after the KILL`.
  - `sh` again: 32 runs, 31 with the `PASS:` line, 1 red. The one: `FAIL: a launch while a killed run's guard lives exited 0, expected 75`.
- The state of the machine during those runs:
  - The machine has 11 cores (`sysctl -n hw.ncpu`). `uptime` read during the runs gave load averages between about 16 and 34. The value is not kept in a file, so it is not verified now. `uptime` after the runs gave `load averages: 13.05 18.66 19.66`.
  - Before the runs, with no test of this step running, `ps -Ao pcpu,comm` showed node, cpptools, mds_stores, mediaanalysisd and Microsoft Defender among the busiest processes.
- The two red cases are older cases of the file, unchanged in this step. Their bounds are a 2-second window and a 3-second window.
  - In "the builder ended as the leader was killed", the runner writes the exit file itself, and no guard is forked. That path does not run `ps_state`.
  - In "a launch while a killed run's guard lives", the guard holds the lock for 3 seconds in a patched copy. The relaunch must start within those 3 seconds.
  - I did not change either bound, and did not show whether this step's code affects them.
- The same final code, apart from this round's last test changes, passed 64 of 64 in an earlier pair of load runs this round (sh 32 of 32, dash 32 of 32, each counted from its 32 output files). Those changes were the normal-end timing, the 4-second launch bound and the stub's timestamps.

### Files changed (`wc -l`)

- `skills/plan-orchestration/templates/launch.sh`: 878.
- `skills/plan-orchestration/templates/launch.test.sh`: 1946.
- `skills/plan-orchestration/SKILL.md`: 300.
- `skills/land/SKILL.md`: 136.
- `skills/plan-orchestration/templates/launch-note.md`: 34, unchanged this round.
- This report.

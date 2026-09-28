# Report: 7b, an exit file after every stop of a started builder, and no stale one after a relaunch

Everything in the brief is done. One present case, "a second launch while the first runs", could not stay green as written; see "What in the brief was wrong".

## Open items of the state file (verbatim)

- none.

## DONE / NOT DONE

| Item | State | Command | Output |
|---|---|---|---|
| 1. Guard left by the builder's runner | DONE | cases "KILL while end hangs" and "KILL during the leader's write", run alone | `PASS: launch.sh scratch tests`; red on the base tree, quoted below |
| 2. Lock held by the leader, the runner and the guard, not by the builder or the note calls | DONE | cases "a second launch", "relaunch", "guard lock", "daemons" | reds under reverts, quoted below |
| 3. Scanner read limited to two seconds | DONE | case "a scanner that never answers" | red on the base tree, quoted below |
| 4. One temporary file name per writer | DONE | `write_exit` writes `<exit>.tmp.$$`; `publish` writes `<exit>.tmp.$$` (runner or guard pid); the launch runs `rm -f "$opt_exit" "$opt_exit".tmp.*` | cases "moved into place", "KILL during the leader's write" |
| 5. Texts made true | DONE | `git diff` of `launch.sh` head comment, runner, `$detach` and `$take_lock` comments; `SKILL.md` lines 182-185, 194, 196 and 214; `launch-note.md` lines 30-32 | see "User-visible changes" |
| Verify 1 | DONE | `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` | see below; exit 0 |
| Verify 2 | DONE | `LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 \| tail -1` | `PASS: launch.sh scratch tests` |
| Verify 3, load | DONE | whole `launch.test.sh` 32 times, 16 at once (`xargs -P 16`), under `sh` and under `LAUNCH_SHELL=dash` | `sh: 32 runs, 32 exit 0, 32 PASS, 0 FAIL`; `dash: 32 runs, 32 exit 0, 32 PASS, 0 FAIL` |
| Verify 4, reverts | DONE | each case below run against a copy of `launch.sh` with its revert applied | first `FAIL:` line quoted below |
| ASCII check | DONE | the change standard's `perl -CSD` command | empty output, exit 0 |
| No added `.sh` line over 100 characters | DONE | `git diff -U0 -- '*.sh' \| grep '^+' \| grep -v '^+++' \| awk 'length > 101' \| wc -l` | `0` |

The verify run printed:

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

The load runs' logs are in `$TMPDIR/7b/load-sh/` and `$TMPDIR/7b/load-dash/` (`run-<n>.log`, `status`). `$TMPDIR` is `/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/`.

## The brief's cases run first, on the base tree

Each case was run alone, with the test's prelude, against the base `launch.sh`:

- KILL while end hangs: `FAIL: KILL while end hangs: no exit file five seconds after the KILL`
- KILL during the leader's write: `FAIL: KILL during the leader's write: no exit file five seconds after the KILL`
- Relaunch while a killed run's runner lives: `FAIL: a launch while a killed run's runner lives exited 0, expected 75`
- Scanner that never answers: `FAIL: the land sequence with a scanner that never answers: no exit file five seconds after the KILL`
- A second launch while the first runs, expecting the lock's refusal: `FAIL: a second launch printed .../launch.sh: .../twice out/pid names pid 13607, which is still running; not launched`
- Normal end, the two no-replace cases and a pid file naming a live process: `PASS` on the base tree. They prove guards the base tree already has, or new guards; their reds come from the reverts below.

## Each new or changed case, its revert and its red

Every revert was applied to a copy of the final `launch.sh`, and only the named case was run against it. The control, all these cases against the unchanged final `launch.sh`, printed `PASS: launch.sh scratch tests`.

| Case | Revert | First `FAIL:` line |
|---|---|---|
| KILL while end hangs (builder exit 0) | runner leaves no guard (`guard($code) if ...` replaced by `1;`) | `FAIL: KILL while end hangs: no exit file five seconds after the KILL` |
| KILL between the leader's temporary write and its move (sleep 3 in a patched copy) | runner leaves no guard | `FAIL: KILL during the leader's write: no exit file five seconds after the KILL` |
| same case, no temporary file left | the guard's `unlink "$exit_file.tmp.$watch"` removed | `FAIL: KILL during the leader's write: a temporary file was left: exit` |
| normal end: exit file written once (leader held one second after its write in a patched copy) | the guard writes and renames without the no-replace check | `FAIL: a normal end: the exit file was written twice` |
| normal end: guard gone with the leader | the guard polls every 5 seconds instead of every tenth | `FAIL: a normal end: a process of the session ran on 3 seconds after the leader` |
| normal end: end called before the exit file | a `write_exit "$status"` put before the end call | `FAIL: a normal end: calls were` (the stub logs `exit file already written`) |
| relaunch while the killed run's runner lives (stop widened 2.5 s), refused with 75 naming the lock; the next launch's own code kept | the builder's runner closes the lock descriptor (`if ($limit > 0)` made `if (1)`) | `FAIL: a launch while a killed run's runner lives exited 0, expected 75` |
| relaunch while the killed run's guard lives (guard held 3 s before its write) | the guard closes the lock (`close $lock if $lock;`) | `FAIL: a launch while a killed run's guard lives exited 0, expected 75` |
| builder and note start each leave a process in a session of its own; the next launch runs | the runner does not open its handle on the descriptor (so it is not closed on exec) | `FAIL: daemons: launch.sh failed` |
| same case | the note call's runner does not close the descriptor | `FAIL: daemons: launch.sh failed` |
| exit file present at the runner's check (`keep-exit` with a 3 s window after the temporary write) | the `-e` return removed | `FAIL: an exit file present at the runner's check: a temporary file was written` |
| exit file put in place between the runner's check and its link (same window, the test writes exit 5 in it) | `link` replaced by `rename` | `FAIL: an exit file put in place during the runner's write: .../link-window out/exit holds exit 137, expected exit 5` |
| scanner that never answers: TERM, KILL two seconds later, exit file within five seconds | the stop's scanner deadline made 600 seconds | `FAIL: the land sequence with a scanner that never answers: no exit file five seconds after the KILL` |
| a second launch while the first runs: exit 75 naming the lock | the session leader closes the lock descriptor (as the base `$detach` did) | `FAIL: a second launch printed .../twice out/pid names pid 59281, which is still running; not launched` |
| a pid file naming a live process, no lock held: exit 75 naming the pid | the pid file check made `if false` | `FAIL: a pid file naming a live process: exited 0, expected 75` |
| exit file moved into place, no temporary file left | the leader's move replaced by a copy through a new name, and the guard's removal of the leader's temporary file removed (with only the first, the guard removes the file and the case stays green) | `FAIL: the exit file's temporary file was left behind: exit` |
| hanging start and hanging end, timed from the hanging call's start | note calls' limit made 20 seconds instead of 3 | `FAIL: a hanging start held the exit file for 20062 ms` |
| builder ended as the leader was killed (KILL sent once the builder has ended) | the runner's write after its parent is gone replaced by `1;` | `FAIL: the builder ended as the leader was killed: no exit file five seconds after the KILL` |

The "keep-exit" case (the leader writes `exit 5` before the KILL) is unchanged and green.

## Files changed

| File | Lines now | `git diff --stat` |
|---|---|---|
| `skills/plan-orchestration/templates/launch.sh` | 792 | 157 changed |
| `skills/plan-orchestration/templates/launch.test.sh` | 1581 | 324 changed |
| `skills/plan-orchestration/SKILL.md` | 295 | 10 changed |
| `skills/plan-orchestration/templates/launch-note.md` | 33 | 4 changed |

## What the code does now

- The runner takes the lock descriptor from `LAUNCH_LOCK_FD` and removes the variable from its environment. A note call's runner closes the descriptor first. The builder's runner opens a perl handle on it, which perl marks close-on-exec, so the builder and the scanner do not inherit it. `$detach` no longer closes it in the session leader.
- When the builder ends while the leader lives, the builder's runner forks a guard and exits. The guard ignores HUP, INT and TERM, closes the scanner's pipes, puts its standard input and output on `/dev/null`, and checks `kill 0` on the leader every tenth of a second. Once the leader is gone, it writes the code through the no-replace write and removes `<exit>.tmp.<leader pid>`.
- `stop` sets one two-second deadline for the scanner. `session_members` reads through `IO::Select` and `sysread`. At the deadline it prints `launch.sh: the session scanner did not answer within 2 seconds` to the stderr file, kills the scanner, and returns nothing. From then on only `descendants` is used.
- `publish` writes `<exit>.tmp.<pid>`. A failed write prints `launch.sh: cannot write <tmp>: <error>` and removes the temporary file.

## Judgment calls the brief left open

1. **The refusal names the launcher's pid.** When the lock is held after the launcher has returned, the refusal text is unchanged: `another launch (pid <launcher pid>) holds <lock>; not launched`. That pid is the launcher's, which may have ended. The head comment and `SKILL.md` say so. I did not change the text, since the present case "a lock held by a live launch" matches it.
2. **Guard poll interval.** 0.1 seconds, inside the brief's "about a second".
3. **Close-on-exec.** The builder does not inherit the lock because perl marks close-on-exec the handle it opens on a descriptor above `$^F`. `perl -MFcntl -e '...'` printed `before: 0` and `after fdopen: 1` for `F_GETFD`. So no explicit `fcntl` is written.
4. **The `-e` return.** Reverting it alone changes no exit file's content, because `link` refuses to replace a file present. Its only effect is that no temporary file is written beside a present exit file. Its case asserts exactly that.
5. **The `run` helper.** It now also waits until the leader is gone and its session holds no process, so the next launch of the same pid file is not refused while the guard lives.
6. **The two hanging-note cases.** They now time from the hanging call's start, the first pid it records, in milliseconds, against 6000 ms. Before, they timed from before the launch, in whole seconds, against 6. With `run` also waiting for the session, the old measure counted that wait and failed under load. The 20-second revert above turns the new measure red.
7. **The late-look case.** The builder now exits at once, and the KILL is sent once the builder is gone or waits to be reaped (`ps -o stat=`). Before, the builder slept one second against the runner's two-second delay. One of 32 runs under load read `exit 137`, and the brief requires 0 red. If the runner has already looked by the time of the KILL, the guard writes the same `exit 3`.

## User-visible changes, before and after

- **A relaunch after a killed run.** Before: allowed once the launcher had returned, and a killed run's runner could then write `exit 137` into the new run's exit file. After: refused with exit 75 naming `<pid file>.lock` while the killed run's leader, runner or guard lives.
- **A relaunch right after a normal end.** Before: allowed at once. After: refused with exit 75 until the leader and guard have ended, about a tenth of a second after the leader.
- **A second launch while the first runs.** Before: `names pid <leader>, which is still running; not launched`. After: `another launch (pid <launcher>) holds <pid file>.lock; not launched`, both exit 75.
- **KILL after the builder ended, or during the leader's write.** Before: no exit file, or only `<exit>.tmp`. After: the builder's code in the exit file, and no temporary file left. One path still leaves a temporary file: TERM and then KILL during the leader's own write. There the exit file is present, and `<exit>.tmp.<leader pid>` is left until the next launch removes it.
- **The temporary file's name.** Before: `<exit>.tmp`. After: `<exit>.tmp.<writer pid>`. The launch removes `<exit>.tmp.*`.
- **A scanner that never answers.** Before: the stop waited forever and left no exit file. After: it waits two seconds, and a line saying so goes to the stderr file.

## What in the brief was wrong

- "The present cases stay green" cannot hold for the present case at line 997, "a second launch while the first runs", which expected `names pid $first_pid, which is still running; not launched`. With the session leader holding the lock (item 2), the lock refuses first. The run above of that case against the reverted "leader-no-lock" copy shows the old text coming back only when the leader does not hold the lock. That case now expects the lock refusal, as the brief's own relaunch case does. A new case keeps the pid-file refusal covered: a pid file naming a live `sleep`, with no lock held, is refused naming that pid.

## Doc text

`grep -n '^- \`launch.test.sh\` runs' README.md` prints:

```
124:- `launch.test.sh` runs `launch.sh` under `sh`, or the shell `LAUNCH_SHELL` names, with stub `claude`, `codex` and launch-note commands, in paths that contain spaces, and checks each recipe's arguments, exit code and note calls, resumed sessions, relative paths, the session id, the lock and the refusal of a second launch, the note calls stopped after 3 seconds, the exit file, and that TERM, INT or HUP to the pid, the land skill's TERM-then-KILL sequence, a signal while the builder or a note call is being started, and KILL to the leader alone each leave no builder process behind. It also checks the exit file each stop leaves: the land skill's sequence, a slow stop, a KILL to the leader alone, a builder that ended as the leader was killed, and TERM and KILL while `end` hangs; and the allow file: a `claude` launch passes each of its lines as `--allowedTools "Bash(<line>:*)"`, on a first launch and on `--resume`, and is refused without `--allow-file`, with a file that is missing or holds no command, or with a line holding a character no rule can hold or a carriage return.
```

Replacement:

```
- `launch.test.sh` runs `launch.sh` under `sh`, or the shell `LAUNCH_SHELL` names, with stub `claude`, `codex` and launch-note commands, in paths that contain spaces, and checks each recipe's arguments, exit code and note calls, resumed sessions, relative paths, the session id, the lock and the refusal of a second launch, the note calls stopped after 3 seconds, the exit file, and that TERM, INT or HUP to the pid, the land skill's TERM-then-KILL sequence, a signal while the builder or a note call is being started, and KILL to the leader alone each leave no builder process behind. It also checks the exit file each stop leaves: the land skill's sequence, a slow stop, a scanner that never answers, a KILL to the leader alone, a builder that ended as the leader was killed, TERM and KILL while `end` hangs, and a KILL while `end` hangs or during the leader's write, which the runner's guard covers. It checks that the runner's guard is in the leader's process group, and that it waits for a leader that lives more than 10 seconds after the builder's end, leaving the builder's code after that leader's KILL. It checks that no writer replaces an exit file present, that no temporary file is left, and that a launch removes an exit file and a temporary exit file an earlier run left. It checks the lock: a launch is refused while a killed run's runner or guard lives, and the builder and the note calls do not hold the lock. It also checks the allow file: a `claude` launch passes each of its lines as `--allowedTools "Bash(<line>:*)"`, on a first launch and on `--resume`, and is refused without `--allow-file`, with a file that is missing or holds no command, or with a line holding a character no rule can hold or a carriage return.
```

## Repair round 1

All eight rulings are done.

### Rulings

| Ruling | State | Command that proves it | Output |
|---|---|---|---|
| 1. Stale temporary file removed at the launch; report line corrected | DONE | the case "an earlier run's exit file and a temporary file a writer left beside it", against `rm -f "$opt_exit"` in a copy | `FAIL: an earlier run's temporary exit file was still there after the launch` |
| 1. Report line | DONE | `grep -n "One path still leaves a temporary file" 7b-report.md` | the "User-visible changes" bullet now says: after TERM and then KILL during the leader's own write, the exit file is present and `<exit>.tmp.<leader pid>` is left until the next launch removes it |
| 2. Guard ends at most 10 seconds after it starts | DONE | the case "the guard ends at its bound", against a copy with the bound removed | `FAIL: guard bound: the guard ran on past its bound` |
| 3. Checked open of the lock handle | DONE, an audit | code in `launch.sh`: `} elsif (!open $lock, "+<&=", $lock_fd) {` then one `print STDERR` line and `POSIX::close($lock_fd);`, before the fork of the builder | No case can make that open fail, so no revert turns anything red |
| 4. `launch.sh:43` made true | DONE | the Exit file paragraph | now reads: "The leader then moves its own file, holding the same line, into place over the runner's." and "The runner and the guard never replace an exit file present." |
| 5. One rule, one place | DONE | `SKILL.md` | the bullet "After the builder has ended" holds the rule; the item-5 sub-bullet says "A KILL after the builder ended leaves the exit file too, as the bullet "After the builder has ended" below says." |
| 6. Sentence length | DONE | a script splitting the changed lines into sentences and counting words | every sentence the review listed is rewritten; no sentence this step added is over 24 words; `launch.sh` line 15's early line end is gone (the Launch paragraph is reflowed to 100 columns) |
| 7. A number for "a few seconds" | DONE | `SKILL.md` item 2 | "A killed run's builder runner is gone about 3 seconds after the KILL: at most 2 seconds waiting on the session scanner, then 1 second of grace." and "The guard that runner leaves once the builder has ended is gone at most 10 seconds after the builder's end." |
| 8. Judgment calls | No change | | |

### What the code does now

- **The guard.** It sets `$guard_until` to its start plus 10 seconds. While `kill 0` on the leader succeeds, it calls `POSIX::_exit(0)` once that time has passed, and otherwise sleeps a tenth of a second. Only when the leader is gone does it write and remove the leader's temporary file.
- **The lock handle.** When `open $lock, "+<&=", $lock_fd` fails, the runner prints `launch.sh: cannot hold the lock on descriptor <n>: <error>` and closes the descriptor. It does this before it forks the builder.
- **The texts.** The head comment (Launch and Exit file paragraphs), the runner comment and `SKILL.md` state the 10-second bound.

### New and changed cases, each revert's first `FAIL:` line

- **Stale temporary file (new, in the case of an earlier run's exit file).** It puts `exit` and `exit.tmp.1` in place before a launch, and requires both gone once the launch returns. Revert: `rm -f "$opt_exit" "$opt_exit".tmp.*` made `rm -f "$opt_exit"`.
  - `FAIL: an earlier run's temporary exit file was still there after the launch`
- **The guard's bound (new).** A patched copy sets the bound to 2 seconds and the note calls' limit to 8. `end` hangs, so the leader lives past the bound. Within 5 seconds of `end` hanging, no process of the session whose parent is pid 1 is left, the leader aside. The leader is still alive then, and no exit file exists. Afterwards the leader's `exit 0` is in place, and the calls are start, the builder, end. Revert: `POSIX::_exit(0) if Time::HiRes::time() >= $guard_until;` removed.
  - `FAIL: guard bound: the guard ran on past its bound`
  - The case does not need to see the guard before its bound. An earlier form did, and under load the guard had already ended before the test looked.
- **The normal-end case's guard poll.** The revert now targets the new loop: its `Time::HiRes::sleep(0.1)` made `sleep(5)`.
  - `FAIL: a normal end: a process of the session ran on 3 seconds after the leader`

The earlier cases were all run again against the final `launch.sh`, each with its revert:

| Revert | First `FAIL:` line |
|---|---|
| runner leaves no guard (end hangs) | `FAIL: KILL while end hangs: no exit file five seconds after the KILL` |
| runner leaves no guard (leader's write) | `FAIL: KILL during the leader's write: no exit file five seconds after the KILL` |
| guard does not remove the leader's temporary file | `FAIL: KILL during the leader's write: a temporary file was left: exit` |
| guard writes over a present exit file | `FAIL: a normal end: the exit file was written twice` |
| `write_exit` put before the end call | `FAIL: a normal end: the exit file was written twice` (the extra write moves a new file into place before the inode is read; the order check follows it in the same case) |
| builder's runner closes the lock | `FAIL: a launch while a killed run's runner lives exited 0, expected 75` |
| `-e` return removed | `FAIL: an exit file present at the runner's check: a temporary file was written` |
| `link` replaced by `rename` | `FAIL: an exit file put in place during the runner's write: .../link-window out/exit holds exit 137, expected exit 5` |
| scanner deadline 600 seconds | `FAIL: the land sequence with a scanner that never answers: no exit file five seconds after the KILL` |
| leader closes the lock in `$detach` | `FAIL: a second launch printed .../twice out/pid names pid 42877, which is still running; not launched` |
| pid file check disabled | `FAIL: a pid file naming a live process: exited 0, expected 75` |
| guard closes the lock | `FAIL: a launch while a killed run's guard lives exited 0, expected 75` |
| runner opens no handle on the lock (the checked-open branch removed) | `FAIL: daemons: launch.sh failed` |
| note call's runner keeps the lock | `FAIL: daemons: launch.sh failed` |
| leader's temporary file kept and the guard's removal of it removed | `FAIL: the exit file's temporary file was left behind: exit` |
| note calls' limit 20 seconds | `FAIL: a hanging start held the exit file for 20157 ms` |
| runner writes nothing after its parent is gone | `FAIL: the builder ended as the leader was killed: no exit file five seconds after the KILL` |

The control, all these cases against the unchanged final `launch.sh`, printed `PASS: launch.sh scratch tests`.

### Verify before you report, rerun

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0:

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

- `LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` printed `PASS: launch.sh scratch tests`.
- **Load runs.** The whole `launch.test.sh`, 32 runs, 16 at once (`xargs -P 16`), on the final tree, with no other load run going:
  - under `sh`: `32 runs, 32 exit 0, 32 PASS, 0 FAIL`
  - under `LAUNCH_SHELL=dash`: `32 runs, 32 exit 0, 32 PASS, 0 FAIL`
  - The logs are in `$TMPDIR/7b/load-sh/` and `$TMPDIR/7b/load-dash/`.
- **ASCII and line length.** The ASCII check runs inside verify and passed. `git diff -U0 | grep '^+' | LC_ALL=C grep -c '[^ -~]'` printed `0`. No added `.sh` line is over 100 characters (count `0`).

### Files changed in this round

| File | Lines now | `git diff --stat` against the round's start |
|---|---|---|
| `skills/plan-orchestration/templates/launch.sh` | 803 | 89 changed |
| `skills/plan-orchestration/templates/launch.test.sh` | 1634 | 55 changed |
| `skills/plan-orchestration/SKILL.md` | 297 | 12 changed |
| `skills/plan-orchestration/templates/launch-note.md` | 33 | 2 changed |
| this report | | the "User-visible changes" bullet and this section |

## Repair round 2

All four rulings are done.

In this worktree I ran read-only `git diff` and `git status` during the first build and round 1. The dispatch said to run no git command. I ran none in this round. The checks below that compare with the base use the base files I saved at the start of the step under `$TMPDIR/7b/base/`.

### Rulings

| Ruling | State | Command that proves it | Output |
|---|---|---|---|
| 1. The guard waits for the leader with no time bound | DONE | the case "the guard waits for the leader however long", against round 1's bound put back in a copy | `FAIL: a KILL more than 10 seconds after the builder's end: no exit file five seconds after the KILL` |
| 1. The guard checks its process group once, at its start | DONE | the same case, against `setpgrp(0, 0)` after the guard's fork | `FAIL: guard waits: no guard in the session while end hangs` (the check makes the moved guard exit at once); with the check also removed: `FAIL: guard waits: the guard 98169 is in process group 98169, not the leader's 98112` |
| 1. No text names a 10-second bound | DONE | `grep -n '10 seconds\|bound' SKILL.md launch.sh launch-note.md` | only `one bounded call` (the note call's comment) matches, and the command filtered it out; the rest printed nothing |
| 2. The test's head comment and the README replacement name the new cases | DONE | `sed -n 1,35p launch.test.sh`; `grep -c "leader's process group, and that it waits" 7b-report.md` | the head comment names the stale temporary exit file, the guard in the leader's process group, and the guard waiting for a leader that lives more than 10 seconds after the builder's end; the grep printed `1` |
| 3. Sentence length | DONE | `printf '%s' "<sentence>" \| wc -w` for each sentence this round added | largest 19 (see below) |
| 4. "Within about a second" | DONE | `launch.sh` Exit file paragraph; `SKILL.md` item 5 and the KILL bullet | each now says the runner stops the builder and its session "within about 3 seconds at most" |

### What the code does now

- **The guard's check.** After its fork, the guard compares `getpgrp()` with the leader's pid. When they differ, it prints `launch.sh: the guard is not in process group <leader pid>; it writes no exit file` to the stderr file and exits with `POSIX::_exit(0)`.
- **The guard's wait.** It checks every tenth of a second, with no bound, until `kill 0` on the leader fails. It then writes as before.
- **The reason, in the head comment and in `SKILL.md`.** The leader's pid is not reused while its process group lives, and the guard is in that group.

### Sentence lengths (`wc -w`)

Each sentence this round added or rewrote:

```
  8  They refuse with exit 75 before anything starts.
 12  They do so while another live launch or run holds that lock.
 12  They also do so while the pid file names a live process.
 18  It then stops the builder and the session within about 3 seconds at most and writes exit 137.
 10  It waits for the leader however long the leader lives.
 18  The leader's pid is not reused while its process group lives, and the guard is in that group.
 13  The guard ends within about a tenth of a second of the leader.
 12  It then writes the builder's code if no exit file is present.
 11  The guard first checks that its process group is <watch pid>.
 14  When it is not, it says so on standard error and exits without writing.
 12  Its wait would then rest on a pid that can be reused.
 13  A killed run's builder runner is gone about 3 seconds after the KILL.
 10  It waits at most 2 seconds on the session scanner.
  9  It also gives the builder 1 second of grace.
 10  The runner leaves a guard once the builder has ended.
 13  The guard is gone about a tenth of a second after the leader.
 10  The session leader may be killed while the builder runs.
 16  The builder's runner then stops the builder and its session within about 3 seconds at most.
 19  While the builder runs, its runner then stops the builder and its session within about 3 seconds at most.
 11  The guard waits for the leader however long the leader lives.
 18  It is in the leader's process group, and the leader's pid is not reused while that group lives.
```

### New and changed cases, each revert's first `FAIL:` line

**The guard waits for the leader however long (new; replaces round 1's guard-bound case).** A patched copy raises the note calls' limit to 15 seconds. The builder exits 3 and `end` hangs. While `end` hangs, the guard's process group (`ps -o pgid=`) must be the leader's pid. More than 10 seconds after the builder's end, the leader is still alive and no exit file exists. The leader is then killed. Within five seconds of the KILL (`land_wait`), the exit file must say `exit 3` and no process of the session may be left.

| Revert | First `FAIL:` line |
|---|---|
| round 1's bound put back (the guard exits 10 seconds after it started) | `FAIL: a KILL more than 10 seconds after the builder's end: no exit file five seconds after the KILL` |
| `setpgrp(0, 0)` after the guard's fork | `FAIL: guard waits: no guard in the session while end hangs` |
| `setpgrp(0, 0)` after the fork, and the guard's check removed | `FAIL: guard waits: the guard 98169 is in process group 98169, not the leader's 98112` |

**Changed revert text.** The normal-end case's poll revert now targets `Time::HiRes::sleep(0.1) while kill 0, $watch;`, made `sleep(5)`:
- `FAIL: a normal end: a process of the session ran on 3 seconds after the leader`

Every other case was run again against the final `launch.sh`, each with its revert:

| Revert | First `FAIL:` line |
|---|---|
| launch removes only the exit file | `FAIL: an earlier run's temporary exit file was still there after the launch` |
| runner leaves no guard (end hangs) | `FAIL: KILL while end hangs: no exit file five seconds after the KILL` |
| runner leaves no guard (leader's write) | `FAIL: KILL during the leader's write: no exit file five seconds after the KILL` |
| guard does not remove the leader's temporary file | `FAIL: KILL during the leader's write: a temporary file was left: exit` |
| guard writes over a present exit file | `FAIL: a normal end: the exit file was written twice` |
| `write_exit` put before the end call | `FAIL: a normal end: calls were` |
| builder's runner closes the lock | `FAIL: a launch while a killed run's runner lives exited 0, expected 75` |
| `-e` return removed | `FAIL: an exit file present at the runner's check: a temporary file was written` |
| `link` replaced by `rename` | `FAIL: an exit file put in place during the runner's write: .../link-window out/exit holds exit 137, expected exit 5` |
| scanner deadline 600 seconds | `FAIL: the land sequence with a scanner that never answers: no exit file five seconds after the KILL` |
| leader closes the lock in `$detach` | `FAIL: a second launch printed .../twice out/pid names pid 16245, which is still running; not launched` |
| pid file check disabled | `FAIL: a pid file naming a live process: exited 0, expected 75` |
| guard closes the lock | `FAIL: a launch while a killed run's guard lives exited 0, expected 75` |
| runner opens no handle on the lock | `FAIL: daemons: launch.sh failed` |
| note call's runner keeps the lock | `FAIL: daemons: launch.sh failed` |
| leader's temporary file kept, and the guard's removal of it removed | `FAIL: the exit file's temporary file was left behind: exit` |
| note calls' limit 20 seconds | `FAIL: a hanging start held the exit file for 20031 ms` |
| runner writes nothing after its parent is gone | `FAIL: the builder ended as the leader was killed: no exit file five seconds after the KILL` |

The control, all these cases against the unchanged final `launch.sh`, printed `PASS: launch.sh scratch tests`. Afterwards no process held a file under the scratch folder: `lsof` on `$TMPDIR/7b/tmp/` counted `0`.

### Verify before you report, rerun

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0:

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

- `LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` printed `PASS: launch.sh scratch tests`.
- **Load runs.** The whole `launch.test.sh`, 32 runs, 16 at once (`xargs -P 16`), on the final tree, one shell after the other, with no other load run going:
  - under `sh`: `32 runs, 32 exit 0, 32 PASS, 0 FAIL`
  - under `LAUNCH_SHELL=dash`: `32 runs, 32 exit 0, 32 PASS, 0 FAIL`
  - The logs are in `$TMPDIR/7b/load-sh/` and `$TMPDIR/7b/load-dash/`.
- **ASCII.** `LC_ALL=C grep -c '[^ -~]'` printed `0` for `launch.sh`, `launch.test.sh`, `SKILL.md`, `launch-note.md` and this report.
- **Line length.** Against the base files in `$TMPDIR/7b/base/`, `comm -23` of the sorted lines over 100 characters of `launch.test.sh` printed nothing. `launch.sh` has 4 lines over 100 characters, as the base file does.

### Files changed in this round

| File | Lines now |
|---|---|
| `skills/plan-orchestration/templates/launch.sh` | 806 |
| `skills/plan-orchestration/templates/launch.test.sh` | 1638 |
| `skills/plan-orchestration/SKILL.md` | 297 |
| this report | the "Doc text" replacement and this section |

`skills/plan-orchestration/templates/launch-note.md` (33 lines) is not changed in this round.

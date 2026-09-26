# Refutation: step 7b

On .agents/worktrees/2b-7b, base f761538; reviewer claude:opus, a fresh agent, af93f73cb98c31111.

Worktree: /Users/axelfaes/workspace/ordo/.agents/worktrees/2b-7b. Base: f761538. Nothing in the worktree or the ledger was changed. The only git commands run were `git diff f761538` and `git status --short`. Every revert and probe ran on copies under my scratchpad, `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/6266a558-ed92-43a1-ac08-9bf8f4bc78a8/scratchpad/7b/`.

## 1. Verification lines, verbatim

All commands ran from the worktree root with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

`sh skills/land/templates/verify.sh /Users/axelfaes/workspace/ordo/.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` (3 min 51 s)
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
exit 0
```
That is 12 PASS lines, 10 ok lines and `verify: 14 commands passed`, the same as the report's quote.

- `LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` printed `PASS: launch.sh scratch tests` (2 min 23 s).
- **Load runs.** The whole `launch.test.sh`, 16 at once (`xargs -P16`), on a copy of `skills/plan-orchestration/templates`:
  - `sh`, 16 runs: `16 0` exit statuses and `16 PASS: launch.sh scratch tests`. 0 red, 275 s.
  - `LAUNCH_SHELL=dash`, 16 runs: `16 0` and `16 PASS: launch.sh scratch tests`. 0 red, 254 s.
- **Reverts.** Each was made on its own copy of the final `launch.sh`, and the whole suite ran against it. Every one reproduced the red the report gives:
  - r1, `guard($code) if $exit_file ne "";` replaced by `1;`: `FAIL: KILL while end hangs: no exit file five seconds after the KILL`
  - r2, the guard's `unlink "$exit_file.tmp.$watch";` removed: `FAIL: KILL during the leader's write: a temporary file was left: exit`
  - r3, `-e $exit_file` removed from the early return: `FAIL: an exit file present at the runner's check: a temporary file was written`
  - r4, `link(...) or -e ... or rename(...)` replaced by `link($tmp, $exit_file) if 0; rename($tmp, $exit_file);`: `FAIL: an exit file put in place during the runner's write: .../link-window out/exit holds exit 137, expected exit 5`. A plain `rename(...)` line instead stops the suite with `FAIL: the patch for link-window changed nothing`, because the test's patch matches the `link(` line.
  - r13, only `or -e $exit_file` removed from the link line: the same `holds exit 137, expected exit 5` red.
  - r5, the builder's runner closes the descriptor (`if (1)`): `FAIL: a launch while a killed run's runner lives exited 0, expected 75`
  - r6, `close $lock if $lock;` added in the guard: `FAIL: a launch while a killed run's guard lives exited 0, expected 75`
  - r7, the stop's deadline set to `+ 600`: `FAIL: the land sequence with a scanner that never answers: no exit file five seconds after the KILL`
  - r8, the builder's runner does not open its handle on the descriptor: `FAIL: daemons: launch.sh failed`. The line before it is `launch.sh: another launch (pid 58874) holds .../daemons out/pid.lock; not launched`.
  - r9, the note call's runner does not close the descriptor: `FAIL: daemons: launch.sh failed`. The line before it is the same lock refusal.
  - r10, the session leader closes the descriptor in `$detach`: `FAIL: a second launch printed .../twice out/pid names pid 49658, which is still running; not launched`
  - r11, the guard polls every 5 s: `FAIL: a normal end: a process of the session ran on 3 seconds after the leader`
  - r12, the runner's `publish($code);` after its parent has gone replaced by `1;`: `FAIL: the builder ended as the leader was killed: no exit file five seconds after the KILL`
  - r14, `rm -f "$opt_exit" "$opt_exit".tmp.*` reverted to `rm -f "$opt_exit"`: `PASS: launch.sh scratch tests`. This revert stays green; see Proof 1.
- **ASCII and line length.** The ASCII check runs inside verify and passed. `LC_ALL=C grep '[^ -~]'` over the added lines of `git diff -U0 f761538` found nothing. No added `.sh` line is over 100 characters. No added comment carries history.

## 2. Findings

### Spec

None. Each of the brief's decisions was built with the mechanism the brief named, not a substitute:
- The guard is forked by the builder's runner before it exits (`launch.sh:398-399`, `guard` at 370-389). It watches the leader by pid with `kill 0` (385).
- The lock is held by the session leader (the descriptor is no longer closed in `$detach`), by the builder's runner (`open $lock, "+<&=", $lock_fd`, 237) and, by inheritance, by the guard. A note call's runner closes it (235).
- `end` is still called before the exit file is written (`run_body` 698-705).
- The scanner's limit is 2 s (340).
- Each writer names its own temporary file: `write_exit` 632 and `publish` 360.

### Proof

1. **The launch's removal of an earlier run's temporary files has no case that turns red.** `launch.sh:740`:
   ```
   rm -f "$opt_exit" "$opt_exit".tmp.*
   ```
   Revert r14 (`rm -f "$opt_exit"` only) printed `PASS: launch.sh scratch tests`. No case puts a stale `<exit>.tmp.<pid>` in place before a launch. The two cases the report cites for item 4 ("moved into place", "KILL during the leader's write") check the temporary file left by their own run, not the launch's cleanup. So the second sentence of brief item 4 is unproven, which fails change-standard rule 13. The head comment's "One a KILL leaves is removed by the next launch" (`launch.sh:47`) rests on this unproven line, and Behaviour 2 shows a real path that leaves such a file.

2. **Judgment call 6, the hanging-note cases (`launch.test.sh`, "a hanging start" and "a hanging end").** The clock now starts once the hanging call has recorded its pid, not before the launch.
   - The measured interval therefore leaves out the launch itself: the launcher, `$detach`, the python3 lookup and the spawn of `start`.
   - The bound went from `-le 6` in whole seconds from `date +%s` (which truncation lets reach about 6.99 s) to `-le 6000` ms.
   - The 20-second revert still turns it red, as the report quotes. I did not rerun that revert.
   - A limit raised to about 5 s would pass both the old and the new form.

   I judge this a change of what is measured, not a loosening of the check on the 3-second stop. The report's reason for it ("the old measure counted that wait") does not require moving the start: the new code already measures before its `session_gone` wait.

3. **Judgment call 7, the late-look case.** The builder now exits at once, and the KILL is sent once `ps -o stat=` shows it gone or a zombie. The case still reaches `publish($code)` after the parent has gone (r12 red).
   - If a loaded machine delays the test by more than the runner's patched 2-second first look, the runner sees the leader alive, forks a guard, and the guard writes the same `exit 3`. In that ordering r12 would stay green.
   - So the proof depends on timing. The case itself cannot go red for a correct `launch.sh`.
   - The report states this. It does not weaken what the case guards.

4. **Judgment call 5, the "second launch" case and the new pid-file case.** The expected text changed from `names pid ..., which is still running` to the lock refusal.
   - This follows from brief item 2: the leader now holds the lock, so the lock refuses first.
   - The pid-file refusal keeps its own case: a live `sleep` named in the pid file with no lock held, red when the pid-file check is disabled (the report's revert; I did not rerun it).
   - r10 (the leader not holding the lock) turns the changed case red.
   - No check was weakened.

5. **Judgment call 5, `run` now waits for the session to be empty.** This adds two bounded waits, the leader gone and `session_gone`, each of which fails when it runs out. It is a stricter check, not a weaker one.

6. **Judgment call 4, the `-e` case asserts only that no temporary file is written.** `link` never replaces a file that is present, and with `-e` removed the `or -e` still stops the `rename`. So a temporary file written beside a present exit file is the only observable effect of the `-e` return, and the case asserts exactly that (r3 red). The path where both guards decide the content, `link` failing with an error other than EEXIST on a file system without hard links, is not exercised by any case.

### Standards

1. **`launch.sh:43` is false.** It says:
   ```
   # leaves the exit file. No writer replaces an exit file present. Only a KILL before the builder's
   ```
   After a stop on TERM, INT or HUP, the runner publishes the exit file (407) and exits. The leader's `write_exit` (632, `mv -f "$opt_exit.tmp.$$" "$opt_exit"`) then replaces that file. Lines 34-35 of the same comment say the leader "writes the same line after it".

   Probe: a TERM to a running launch, with the inode of the exit file sampled every millisecond. It printed `inode 245412579: exit 143` and then `final inode 245412582`. The content is the same; the claim is not. The runner comment's "No write replaces a file present" (221) is about the runner and the guard and is true. Change-standard rule 14.

2. **The same rule is written twice in `SKILL.md`, in lines this diff adds.**
   - Line 194: "When the session leader is killed after the builder ended, while the note's `end` runs or during the leader's own write, the runner's guard writes the builder's code."
   - Line 214: "After the builder has ended, the guard its runner left writes the builder's code once the leader is gone, unless the leader wrote the exit file first."

   `docs/dev/skill-layout.md`, "Where a rule goes": "A rule is written once. Another place that needs it names the section it is in."

3. **Sentences well over the brief's "under about 20 words" (brief, Conventions; prose standard E).** In added or changed lines:
   - `launch.sh:11-13`, "The system releases the lock once all of its holders have ended, so a lock file left by a run that has ended, whatever pid it still names, is taken over.": about 30 words.
   - `launch.sh:14-18`, the changed sentence "The launch then removes an exit file and the temporary files an earlier run left, and starts this script again ... Linux alike.": about 50 words. Line 15 also ends early ("and starts") in the middle of the paragraph.
   - `SKILL.md:184`, "So a launch of the same pid file is refused with exit 75 while any of them lives, and a killed run never writes an exit file after a later launch removed it.": about 33 words.
   - `SKILL.md:185`, "It refuses with exit 75, starting nothing, while the pid file names a live process, or while a live launch or run of the same pid file holds its lock file, `<pid file>.lock`.": about 32 words.
   - `SKILL.md:194`: about 29 words.
   - `launch-note.md:31`: about 33 words.

4. **`SKILL.md:182` says "for a few seconds after the KILL".** This step bounds the stop at 2 s of scanner time plus 1 s of grace. Prose standard A replaces a vague qualifier with the number.

5. The other texts match the code: the "Exit file" paragraph apart from line 43, the runner, `$detach` and `$take_lock` comments, `SKILL.md` 182-185, 193-195 and 212-216, and `launch-note.md` 27-33.
   - I grepped `exit file`, `.lock`, `guard`, `137` and `.tmp` across `skills/`, `docs/` and `README.md`. No other text the diff makes false was found.
   - `skills/land/SKILL.md:43` ("The builder's runner writes the exit file after its stop") is still true.
   - The README bullet is the orchestrator's to apply from the report's "Doc text".

### Behaviour

1. **The guard can outlive its purpose when the leader's pid is reused.** Its only exit condition is `Time::HiRes::sleep(0.1) while kill 0, $watch;` (`launch.sh:385`).
   - If the leader's pid goes to another process of the same user between two polls, the guard waits for that process. For all that time it holds the lock, so every launch of the same pid file is refused with 75.
   - After a KILL, it also writes no exit file until that process ends, so the land skill's five-second check fails.
   - A pid owned by another user makes `kill 0` fail with EPERM, and the guard then ends normally.
   - Reuse within 0.1 s needs the sequential pid counter to wrap to exactly that pid, so it is very unlikely. It is not bounded, though.
   - The same holds while the leader stays a zombie that no one reaps. With launchd reaping it this did not occur here; see "Not checked".
   - `kill 0` by pid is the mechanism brief decision 1 names. A check that also compares the process's start time or session would close this. That decision is the orchestrator's.

2. **A TERM followed by a KILL during the leader's own write leaves `<exit>.tmp.<leader pid>`.** In this path the runner has already published and exited, and no guard exists.
   - Probe: a copy with `sleep 3` between `printf` and `mv` in `write_exit`, then TERM, the temporary file seen, then KILL, then 3 s.
   - The directory then held `exit` (`exit 143`) and `exit.tmp.97417`.
   - The exit file is present, so the brief's requirement holds. The head comment says the next launch removes such a file, which is Proof 1's unproven line.
   - The report's "User-visible changes" says "KILL ... during the leader's write. After: the builder's code in the exit file, and no temporary file left" without this exception.

3. **The lock.** I checked it by running `lsof -t <pid file>.lock` on a live scratch launch, whose stub builder and note `start` each started a `setsid` process, with the lines of code for support.
   - While the builder ran, only the session leader and the builder's runner held it.
   - While `end` ran, only the leader and a perl process with ppid 1 (the guard) held it. The `end` runner had closed it.
   - After the run, nobody held it.
   - The builder, its `setsid` process, the scanner and the note's `setsid` process do not appear.
   - The reasons in the code:
     - `$^F = 1023` in `$take_lock` keeps the descriptor across exec into the launcher and the leader.
     - The builder's runner's `open $lock, "+<&=", $lock_fd` gives it a perl handle above `$^F`, which perl marks close-on-exec, so the builder, the scanner and `ps` do not inherit it. Revert r8 shows the builder's `setsid` process holding the lock without this open.
     - A note call's runner uses `POSIX::close` before it forks (r9).
   - Short-lived children of the leader (`mv`, `head`) hold it until they exit. So does an orphaned `mv` from a killed leader, which is harmless.
   - The return value of `open $lock, "+<&=", ...` (237) is not checked. If it failed, the descriptor would stay without close-on-exec and the builder would inherit the lock. I did not probe that failure.

4. **Relaunch after a normal end.** It is refused with 75 for as long as the guard polls. With `flock` polled every 2 ms, over 6 unloaded runs the lock came free 94 to 97 ms after the leader was gone, and the exit file appeared 0 ms before the leader was gone. `SKILL.md:184` covers this ("refused with exit 75 while any of them lives"), and the report states it with before and after. In the plan's own dispatch block, the first launch, the resume and the repair round each use their own pid file (`orchestrator-state.md` lines 66, 77, 94), so this window does not affect them.

5. **The scanner deadline** is per stop. `stop` sets one `$until` (340) that both `members` calls share, and `session_members` stops at `$left <= 0`. A scanner past the deadline gets KILL, its pipes are closed, and it is reaped by `waitpid($scanner, 0)` (309). That wait has no limit only for a scanner in uninterruptible sleep. Its `ps` child, if one runs, ends by itself. Later calls return nothing because `$scanner` is undefined.

6. **Can the land skill's check fail because of the guard?** Not in any path I found. After a KILL during `end`, the guard writes within one 0.1 s poll, and "KILL while end hangs" passed `land_wait` in all 32 of my load runs. After a normal end, the leader has written the file before it exits. The guard is not part of the pid the land skill watches. The exception is the pid-reuse case in Behaviour 1.

7. **The lock refusal names the pid of the launcher, which has already ended** when the holder is a leader, runner or guard: `another launch (pid <launcher>) holds <lock>`. The report (judgment call 1) and `SKILL.md:185` state this, so it is recorded here and not as a finding.

## 3. Not checked

- The report's 32-run counts per shell. I ran 16 at 16 at once under `sh` and 16 under `dash`, 0 red in each.
- The report's reverts for the pid-file check (`if false`), the 20-second note limit, `write_exit` put before the `end` call, and the leader's move replaced by a copy. I did not rerun them.
- Pid reuse and a leader left as a zombie under a subreaper that does not reap. Both are reasoned from the code, not reproduced.
- `publish` on a file system where `link` fails with an error other than EEXIST.
- A failed `open $lock, "+<&=", $lock_fd`.
- A real `claude -p` or `codex exec` run.
- The base tree's reds for the new cases, as the report quotes them.

## 4. Usage

About 118k tokens (the counter went from about 14,965,000 to about 14,847,000) and about 35 tool uses. The wall time went mostly to runs:
- verify: 3 min 51 s.
- The `dash` suite: 2 min 23 s.
- The two load batches: 4 min 35 s and 4 min 14 s.
- The revert batches: 3 min 18 s for 11 in parallel, then about 2.5 min each for 3 more.

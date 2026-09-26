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

# Repair round 1, refuted

Reviewer: claude:opus, a fresh agent, ac652ca64cd8de6c9; 132,302 tokens, 34 tool uses, 1,532 s.

## 1. Verification lines, verbatim

All commands ran from the worktree root under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`. The only git commands run were `git diff` and `git status --short`, and no file in the worktree or the ledger was edited. Reverts and probes ran on copies under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/6266a558-ed92-43a1-ac08-9bf8f4bc78a8/scratchpad/7b-r1/`.

`sh skills/land/templates/verify.sh /Users/axelfaes/workspace/ordo/.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` (208 s):
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
That is 12 PASS lines, 10 ok lines and `verify: 14 commands passed`, with exit 0.

- `LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` printed `PASS: launch.sh scratch tests` (124 s).
- **Load runs.** The whole `launch.test.sh` ran on a copy of the final `launch.sh` and `launch.test.sh`, 16 runs at 16 at once (`xargs -P 16`), in the foreground:
  - `sh`: exit codes `16 0`, output `16 PASS: launch.sh scratch tests`. 0 red, 325 s.
  - `LAUNCH_SHELL=dash`: exit codes `16 0`, output `16 PASS: launch.sh scratch tests`. 0 red, 336 s.
- **Reverts.** Each revert was made on its own copy of the final `launch.sh`, and the whole suite ran against it. The 11 copies ran at once. First `FAIL:` line of each:
  - A, `rm -f "$opt_exit" "$opt_exit".tmp.*` reverted to `rm -f "$opt_exit"`: `FAIL: an earlier run's temporary exit file was still there after the launch`
  - B, the guard's bound line `POSIX::_exit(0) if Time::HiRes::time() >= $guard_until;` removed: `FAIL: guard bound: the guard ran on past its bound`
  - B2, that line made `last if ...`, so the guard writes at its bound: `FAIL: guard bound: an exit file was written while the leader lived`
  - C, the guard's `Time::HiRes::sleep(0.1)` made `sleep(5)`: `FAIL: a normal end: a process of the session ran on 3 seconds after the leader`
  - D, the guard's `unlink "$exit_file.tmp.$watch";` removed: `FAIL: KILL during the leader's write: a temporary file was left: exit`
  - E, `guard($code) if $exit_file ne "";` made `1;`: `FAIL: KILL while end hangs: no exit file five seconds after the KILL`
  - F, the checked open made `} elsif (0) {`, so no handle is opened: `FAIL: daemons: launch.sh failed`
  - G, the scanner deadline `+ 2` made `+ 600`: `FAIL: the land sequence with a scanner that never answers: no exit file five seconds after the KILL`
  - H, `|| -e $exit_file` removed from `publish`'s early return: `FAIL: an exit file present at the runner's check: a temporary file was written`
  - I, the builder's runner closes the descriptor (`if (1)`): `FAIL: a launch while a killed run's runner lives exited 0, expected 75`
  - Control, the unchanged final `launch.sh` in the same batch: `PASS: launch.sh scratch tests`
- **ASCII and line length.** `git diff -U0 5fba16f | grep '^+' | LC_ALL=C grep -c '[^ -~]'` printed `0`. The count of added `.sh` lines over 100 characters is `0`.

## 2. Repair round 1, refuted

### Spec

1. **Ruling 2 leaves a stop with no exit file, which contradicts the brief's "What it must do".** `launch.sh:392-396`:
   ```
   my $guard_until = Time::HiRes::time() + 10;
   while (kill 0, $watch) {
       POSIX::_exit(0) if Time::HiRes::time() >= $guard_until;
   ```
   - When the leader is still alive at the guard's bound and is then killed, no process is left to write the exit file.
   - Probe 1 used a patched copy (bound 2 s, note limit 8 s, `end` hanging). After the guard was gone the leader was still alive, and I sent it a KILL. Six seconds later: `PROBE: no exit file`, and the directory held `id pid pid.lock report session stderr`.
   - Probe 2 left the bound at 10 s and raised only the note limit to 15 s. Output: `PROBE: guard gone 10293 ms after end hung; leader alive: yes`, then `PROBE: no exit file 6 s after the KILL`.
   - The brief's "What it must do" bullet 1 requires an exit file within five seconds of every KILL of a started builder, "a KILL after the builder ended (the guard, the builder's code)" included. This path breaks that.
   - Ruling 2 chose this design ("when not, it exits without writing, since the leader then writes").
   - In the unpatched script the leader outlives the bound only when it is still alive more than 10 s after the builder's end. Its `end` call is stopped after 3 s, so this needs a stalled or stopped leader, or an `end` process that a KILL cannot reap. I did not reproduce it on the unpatched script.
   - Whether the brief's requirement admits this window is the orchestrator's decision. The texts' claim that it cannot happen is Standards 1.

### Proof

1. **Report, ruling 6 row: "no sentence this step added is over 24 words" is not true.** Two sentences added in this round are 27 words each (`wc -w`):
   - `launch.sh:8-9`, "They refuse with exit 75, before anything starts, in two cases: another live launch or run holds that lock, or the pid file names a live process."
   - `SKILL.md:182`, "A killed run's builder runner is gone about 3 seconds after the KILL: at most 2 seconds waiting on the session scanner, then 1 second of grace."

   The brief's Conventions ask for sentences "under about 20 words". The sentences the review listed were rewritten as ruled.
2. Every other closure in the report reproduced: rulings 1 and 2 (reverts A, B and B2) and the earlier cases I reran (C to I). Ruling 3 is an audit, as the report says. My probe ran the extracted runner with `LAUNCH_LOCK_FD=77` (not open) and printed `launch.sh: cannot hold the lock on descriptor 77: Bad file descriptor`. The builder then ran (`rc 3`) and the guard wrote `exit 3`.

### Standards

1. **The texts say a KILL after the builder's end always leaves an exit file. Spec 1 shows it does not after the guard's bound.**
   - `SKILL.md:216`: "When the leader still lives then, the guard exits without writing, and the leader writes the file. So every KILL once the builder's runner has started leaves an exit file."
   - `launch.sh:43-44`: "When the leader still lives at the bound, the guard exits without writing, since the leader writes the file. So a KILL while end runs, or during the leader's write, still leaves the exit file."
   - `launch.sh:32`: "Every stop once the builder's runner has started leaves an exit file."
   - `SKILL.md:196`: "A KILL after the builder ended leaves the exit file too, as the bullet "After the builder has ended" below says."

   Each sentence is false for a leader killed after the guard's bound. Change-standard rule 14.
2. **The test's head comment does not list the round's two new cases.** `launch.test.sh:1-59` is unchanged in this round, and the brief says the file "names its cases in the head comment".
   - Line 7 still says only "an exit file left by an earlier run removed at the launch". It does not mention the stale `<exit>.tmp.<pid>` the case at line 568 now checks.
   - No line mentions the guard's bound (the case at line 1287).
   - The report's "Doc text" README replacement (report line 143) was not updated for either case.
3. **Two sentences are over the brief's limit**, as Proof 1 gives (27 words each at `launch.sh:8-9` and `SKILL.md:182`).
4. **Sentences the review did not list, checked against the code:**
   - Correct against the code: ruling 4's `launch.sh:32-34` (the leader moves its own file over the runner's) and "The runner and the guard never replace an exit file present."
   - Correct against the code: ruling 5's `SKILL.md:196`, which names the bullet at 216, and that bullet exists.
   - Correct as a total: ruling 7's numbers in `SKILL.md:182-183`. `stop` shares one 2-second scanner deadline across both of its `members` calls (340 and 355), with the 1-second grace between them. So "2 seconds ... then 1 second of grace" is right as a total, not as an order.
   - Not made false by this round: `SKILL.md:195`, `SKILL.md:215` and `launch.sh:37` still say the runner stops the builder "within about a second". With a scanner that does not answer, the stop takes up to about 3 s, and `SKILL.md:182` now says so. Those lines are context in `git diff f761538`.

### Behaviour

1. Spec 1: a leader killed after the guard's bound leaves no exit file, reproduced in two patched copies.
2. The report's user-visible line for a KILL during the leader's write (report line 124) is true. After TERM and then KILL during the leader's write, the runner has already published and exited, and no guard exists, so `<exit>.tmp.<leader pid>` stays. After a normal end the guard removes it (revert D). The launch removes any `<exit>.tmp.*` (revert A).
3. The guard ends at most about 10.1 s after it starts, whatever `kill 0` returns: the bound is checked before every 0.1 s sleep. Probe 2 measured the guard gone 10293 ms after `end` began to hang, a moment after the guard started. When the leader is still alive at the bound, the guard writes nothing: B2 is red, and the guard-bound case finds no exit file while the leader lives.
4. Ruling 3: `open`'s return value is checked. The descriptor is closed with `POSIX::close` at the top of the runner, before `fork`. The one line goes to the runner's standard error, which the leader inherits from `$detach`'s `2>"$opt_stderr"`, so it lands in the stderr file.

## 3. Not checked

- The report's 32-run counts per shell. I ran 16 at 16 at once per shell.
- The report's other reverts: the pid-file check disabled, `write_exit` before `end`, the guard writing over an existing exit file, the note limit set to 20 s, the leader's move replaced by a copy, the runner writing nothing after its parent is gone, the guard closing the lock, and the note call's runner keeping the lock.
- A leader still alive more than 10 s after the builder's end on the unpatched script. Reasoned from the code and shown only in patched copies.
- A `POSIX::close` after an `open` that failed on a descriptor that is actually open. Only EBADF was probed.
- A real `claude -p` or `codex exec` run.

## 4. Usage

About 90k tokens (the counter went from about 14,964,500 to about 14,874,500) and about 24 tool uses. Wall time went mostly to runs:
- verify: 208 s.
- The `dash` suite: 124 s.
- The 11 revert copies at once: 191 s.
- The two load batches: 325 s and 336 s.
- Two probes: about 30 s each.

# Repair round 2, refuted

Reviewer: claude:opus, a fresh agent, a768f6cb4fe57e278; 132,373 tokens, 32 tool uses, 1,448 s.

Worktree: /Users/axelfaes/workspace/ordo/.agents/worktrees/2b-7b. Nothing in the worktree or the ledger was changed. The only git commands run were `git diff a211aa5`, `git diff f761538` and `git status --short`. Every revert and probe ran on copies under `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/6266a558-ed92-43a1-ac08-9bf8f4bc78a8/scratchpad/7b-r2/`.

## 1. Verification lines, verbatim

All commands ran from the worktree root under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

**verify.sh.** `sh skills/land/templates/verify.sh /Users/axelfaes/workspace/ordo/.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` took 235 s:
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
That is 12 PASS lines, 10 ok lines and `verify: 14 commands passed`, exit 0.

**Suite under dash.** `LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` printed `PASS: launch.sh scratch tests` (128 s).

**Load runs.** The whole `launch.test.sh` ran on a copy of the final `launch.sh` and `launch.test.sh`, 16 runs at 16 at once (`xargs -P 16`), in the foreground:
- `sh`: exit codes `16 0`, last lines `16 PASS: launch.sh scratch tests`, no `FAIL` line. 0 red, 284 s.
- `LAUNCH_SHELL=dash`: exit codes `16 0`, last lines `16 PASS: launch.sh scratch tests`, no `FAIL` line. 0 red, 270 s.

**Reverts.** Each revert is a copy of the final `launch.sh` with the unchanged `launch.test.sh`, 11 copies run at once (203 s). The first `FAIL:`/`PASS:` line of each:
- bound: round 1's 10-second bound put back in the guard: `FAIL: a KILL more than 10 seconds after the builder's end: no exit file five seconds after the KILL`
- pg-after: `setpgrp(0, 0)` placed after the guard's group check: `FAIL: guard waits: the guard 7281 is in process group 7281, not the leader's 7039`
- pg-before: `setpgrp(0, 0)` placed right after the guard's fork, with the check still in place: `FAIL: claude without a note: .../a0 out/stderr holds claude stderr` / `launch.sh: the guard is not in process group 92878; it writes no exit file, expected claude stderr`
- nocheck: the `getpgrp() != $watch` block removed: `PASS: launch.sh scratch tests`
- rmtmp: the launch's `rm -f "$opt_exit" "$opt_exit".tmp.*` reverted to `rm -f "$opt_exit"`: `FAIL: an earlier run's temporary exit file was still there after the launch`
- nounlink: the guard's `unlink "$exit_file.tmp.$watch";` removed: `FAIL: KILL during the leader's write: a temporary file was left: exit`
- noe: `|| -e $exit_file` removed from `publish`: `FAIL: an exit file present at the runner's check: a temporary file was written`
- deadline: the scanner deadline `+ 2` made `+ 600`: `FAIL: the land sequence with a scanner that never answers: no exit file five seconds after the KILL`
- slowpoll: the guard's `sleep(0.1)` made `sleep(5)`: `FAIL: a normal end: a process of the session ran on 3 seconds after the leader`
- noguard: `guard($code) if $exit_file ne "";` made `1;`: `FAIL: KILL while end hangs: no exit file five seconds after the KILL`
- control, the unchanged final `launch.sh`: `PASS: launch.sh scratch tests`

**Process-group probe.** This is a copy of the test's setup (lines 1-453) with two live launches, under `sh` and under `LAUNCH_SHELL=dash`, listed with `ps -o pid,ppid,pgid,sess,command` over the members of the leader's session (found with `os.getsid`):
- While the builder runs (`sh`): leader 63470 has pgid 63470. The builder's runner 63582 has pgid 63470. The scanner 63584 has pgid 63470. The builder 63583 has pgid 63583.
- While `end` hangs (`sh`): leader 63910. The guard 63936 has ppid 1 and pgid 63910. The `end` runner 63937 has pgid 63910.
- After a KILL, `exit file: exit 3 after 403 ms`.
- Under `dash` the result is the same: runner 65491 and scanner 65514 have pgid 65391 (the leader); the guard 66207 has ppid 1 and pgid 66157 (the leader). `exit 3 after 404 ms`.
- On macOS the `SESS` column prints 0 for every process.

**ASCII and line length.** `git diff -U0 a211aa5 | grep '^+' | LC_ALL=C grep -c '[^ -~]'` printed `0`. The added `.sh` lines over 100 characters counted `0`.

## 2. Repair round 2, refuted

### Spec

None. Ruling by ruling:
- **Ruling 1.** The bound is gone: `launch.sh:399` is `Time::HiRes::sleep(0.1) while kill 0, $watch;`. The `getpgrp` check is at 388-392, and the guard-bound case is replaced by the guard-waits case at `launch.test.sh:1289-1319`.
- **Ruling 2.** The head comment names the new cases (`launch.test.sh:7`, `:29-31`), and so does the report's "Doc text" replacement.
- **Ruling 4.** `launch.sh:38`, `SKILL.md:195` and `SKILL.md:215` now say "within about 3 seconds at most".

On this machine the process-group premise holds under both shells: the builder's runner and its guard are in the leader's group, while the builder runs and while `end` hangs. That is the probe above.

### Proof

1. **The report's sentence-length list leaves out the sentences the round added to `launch.test.sh`, so its claim "Each sentence this round added or rewrote ... largest 19" is false.** The report's "Sentence lengths" section lists only sentences from `launch.sh` and `SKILL.md`. Counted with `printf '%s' ... | wc -w`, the test's new comment has three sentences over the limit (see Standards 1).

2. **The report's quoted red for "`setpgrp(0, 0)` after the guard's fork" is not the suite's first `FAIL:` line.**
   - The report gives `FAIL: guard waits: no guard in the session while end hangs`.
   - On the whole suite, the same revert (pg-before) turns red at the first case: `FAIL: claude without a note: .../a0 out/stderr holds claude stderr` / `launch.sh: the guard is not in process group 92878; it writes no exit file, expected claude stderr`. The guard's message reaches the stderr file of every run.
   - The revert is red either way, so the closure holds. The quoted line was presumably taken from a run of that one case, and the report does not say so.
   - The other form, the check removed as well, reproduced as quoted: the pg-after revert above.

3. **The guard's `getpgrp` check (`launch.sh:388-392`) has no case that turns red when it is removed (the nocheck revert is `PASS`).**
   ```
       if (getpgrp() != $watch) {
           print STDERR "launch.sh: the guard is not in process group $watch; ",
               "it writes no exit file\n";
           POSIX::_exit(0);
       }
   ```
   - The check asserts an invariant that the leader's shell keeps, since it does no job control. So no case can reach its branch, and the ruling did not ask for one.
   - Change-standard rule 13 still asks the report to say that it is an audit, not a proof. The report's rulings table does not say so.
   - Its "exits without writing" branch is reached only in the pg-before revert, where the red comes from its message in the stderr file, not from the missing write.

4. The rest reproduced:
   - The ruling 1 case is red with the bound put back, and red with `setpgrp` in either place.
   - Seven earlier cases stay red under their reverts on the final `launch.sh`: rmtmp, nounlink, noe, deadline, slowpoll, noguard, and bound.
   - No finding was closed by removing a check. The guard-bound case was removed because its subject, the bound, was withdrawn by ruling 1, and its replacement asserts the opposite behaviour.

### Standards

1. **Sentences well over "about 20 words", added by this round in `launch.test.sh:1289-1295`** (ruling 3: "every sentence the round adds keeps to it"; brief, Conventions). Counted with `wc -w`:
   - "The builder exits 3, and end hangs with the note's limit raised to 15 seconds in a patched copy, so the leader lives more than 10 seconds after the builder's end.": 31 words.
   - "The leader is then killed, and within five seconds of the KILL the exit file holds exit 3 and no process of the session, the guard included, is left.": 29 words.
   - "Red when the guard is put in a process group of its own (no guard in the leader's group), and when the guard gives up 10 seconds after it started (no exit file).": 33 words.
   - The head comment's new clause at `launch.test.sh:29-31` ("the guard in the leader's process group, waiting for a leader that lives more than 10 seconds after the builder's end, and after that leader's KILL leaving the builder's code;") is 30 words. It sits inside a list item in the list-style head comment.
   - The report's "Doc text" replacement adds "It checks that the runner's guard is in the leader's process group, and that it waits ... after that leader's KILL.", about 35 words.

2. **`launch.test.sh:1291-1292` is garbled:**
   ```
   # seconds after the builder's end. While end hangs, the guard's process group is the leader's pid,
   # whose pid is then not reused.
   ```
   "the leader's pid, whose pid" names a pid's pid. The intended statement is the one in `launch.sh:42`: the leader's pid is not reused while its process group lives.

3. I grepped `10 seconds`, `bound`, `about a second`, `process group`, `tenth of a second`, `about 3 seconds`, `getpgrp`, `reused` and `guard_until` across `launch.sh`, the head comment of `launch.test.sh`, `SKILL.md`, `launch-note.md`, `skills/land/SKILL.md` and `README.md`. No sentence is left or made false:
   - "bound" in `launch.sh` matches only `:518`, "one bounded call", which is about the note call.
   - `README.md` matches only unrelated bullets (`land.test.sh`, `verify.test.sh`, `check_rule_inventory.test.sh`).
   - `skills/land/SKILL.md:43` is still true.
   - The head comment's `launch.test.sh:21` ("no process of the builder left within about a second") describes the case at 796-808, where the scanner answers. It is context, not changed by the round, and matches that case.
   - `SKILL.md:216` states the process-group reason in one clause, as ruling 1 asks. `SKILL.md:182-183` split the long sentence into sentences of 13, 10, 9, 10 and 13 words.

### Behaviour

1. **Ruling 4's numbers, "about 3 seconds at most", are true against the code within the word "about".**
   - `stop` sets one `$until` 2 s ahead (`launch.sh:349`), and both `members` calls share it.
   - The grace loop lasts at most 1 s.
   - After the deadline, `session_members` calls `drop_scanner`.
   - The remaining time is two `ps` runs in `descendants`, the `waitpid` after KILL, and the runner's 0.05 s poll of `getppid`.

2. **Every stop of a started builder leaves an exit file within five seconds of a KILL, in every path I traced.**
   - KILL while the builder runs: the runner stops it within about 3 s and writes 137 ("KILL to the leader alone" and the land-sequence cases, green in 32 of 32 load runs).
   - KILL after the builder ended, at any time, including more than 10 s later: the guard writes within about 0.1 s of the leader's end. The probe measured `exit 3 after 403 ms`, including the test's own polling.
   - KILL during the leader's write: the guard writes.
   - Builder ended and leader killed before the runner's `getppid` check: the runner itself publishes.

   There are two exceptions:
   - The guard's `fork` failing, which was already reported on standard error before this round.
   - The group check failing. Under the shells here that cannot happen (the probe).

3. **The guard's exit condition is "the leader has been reaped", not "the leader has ended".** `kill 0` succeeds on a zombie.
   - On macOS the leader is reparented to launchd (ppid 1 in the probe), which reaps it at once.
   - On Linux, under a child subreaper that does not reap (for example some container inits or a harness that sets `PR_SET_CHILD_SUBREAPER`), a killed leader would stay a zombie. The guard would then wait with no bound, hold the lock, and write no exit file.
   - Round 1's bound limited this case to 10 s. Now it has no limit.
   - This is reasoned from the code, not reproduced. The texts ("The guard is gone about a tenth of a second after the leader", `SKILL.md:183`) hold wherever the leader is reaped.

4. The guard-waits case has about a 4-second margin: KILL at `hung + 11000` ms, while the patched note limit stops `end` at 15 s. If a loaded run is delayed by more than that, the case fails with "the leader was gone before the KILL". It was green in all 32 of my load runs.

## 3. Not checked

- The report's 32-run load counts. I ran 16 at 16 at once per shell, 0 red in each.
- These reverts from the report: `write_exit` before `end`, the guard writing over an exit file present, the pid-file check disabled, the leader closing the lock in `$detach`, the guard closing the lock, the runner opening no handle on the lock, the note call's runner keeping the lock, `link` replaced by `rename`, the note limit set to 20 s, the runner writing nothing after its parent is gone, and the leader's temporary file kept.
- XNU's and Linux's pid allocator skipping a pid that is still a process group ID. The ruling cites POSIX XBD 4.14. The kernels' allocation code was not read, and reuse was not reproduced.
- A leader left as a zombie under a subreaper (Behaviour 3).
- A real `claude -p` or `codex exec` run.

## 4. Usage

About 89k tokens (the counter went from about 14,965,000 to about 14,876,000) and 22 tool uses. Wall time:
- verify: 235 s
- the `dash` suite: 128 s
- the 11 revert copies at once: 203 s
- the load batches: 284 s and 270 s
- the process-group probes: about 60 s

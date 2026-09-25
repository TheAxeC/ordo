# Step 4 refuter report (on .agents/worktrees/2b-4, base ec6586e)

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE HOME=$TMPDIR/refute4.8LShF1/home PYTHONUSERBASE=/Users/axelfaes/Library/Python/3.13 PYTHONDONTWRITEBYTECODE=1 sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit=$?"
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
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
verify: 12 commands passed
exit=0
(With the scratch HOME alone the runner printed "verify: python3 cannot import yaml; install PyYAML" and exit 69, since PyYAML is in the user site; PYTHONUSERBASE was added for that.)

$ TMPDIR=<scratch> sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1
PASS: launch.sh scratch tests      (32 s)
$ TMPDIR=<scratch> LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1
PASS: launch.sh scratch tests      (30 s; command -v dash -> /bin/dash)

$ python3 -B utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md; echo rc=$?
ok: ...land.md / ordo-init.md / plan-help.md / plan-orchestration.md / plan-retro.md / plan.md / refute.md / repo-setup.md / roadmap.md / spec.md (ten ok: lines)
rc=0

$ git status --short
 M .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md
 M skills/plan-orchestration/SKILL.md
 M skills/plan-orchestration/templates/launch-note.md
 M skills/plan-orchestration/templates/launch.sh
 M skills/plan-orchestration/templates/launch.test.sh
?? .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/4-report.md

$ git diff ec6586e --numstat          (matches the report's Files table)
9 9 inventories/plan-orchestration.md; 19 14 SKILL.md; 6 5 launch-note.md; 350 58 launch.sh; 544 107 launch.test.sh
$ wc -l: launch.sh 505, launch.test.sh 827, launch-note.md 29, SKILL.md 271, inventory 139 (matches)

Reverts, each applied to a copy of launch.sh beside a copy of launch.test.sh under $TMPDIR, first FAIL line:
leader-no-setsid (setsid block deleted from detach): FAIL: the pid file's process 21045 is in process group 17895, not its own
no-signal-traps (the three traps in run_body deleted): FAIL: no file at .../sig-TERM out/exit
no-kill-after-grace (kill "-KILL"/"KILL" deleted from stop): FAIL: land sequence: process 36655 is still running
start-unbounded (limit 0 for start only): FAIL: no file at .../hang-start out/exit
end-unbounded (limit 0 for end only): FAIL: no file at .../hang-end out/exit
transcript-unbounded (note_call limit 0): FAIL: a failing transcript call printed: transcript stderr
no-live-pid-check (kill -0 -> false): FAIL: a second launch exited 0, expected 75
no-session-id-flag (--session-id not passed): FAIL: claude without a note: calls were
exit-file-in-place (write_exit writes in place): FAIL: the exit file was written through the link, not moved into place
pid-before-start-dead (start given --pid "$PPID"): FAIL: claude resuming a session with a note: calls were
term-only-group (kill "TERM", keys %seen deleted from stop): PASS: launch.sh scratch tests

Premises of "What is on the tree", checked on ec6586e: launch.sh 213 lines, launch.test.sh 390; nohup line 193, echo $! line 194, --pid "$$" line 168, exit file in place line 176, --label <step> in usage lines 20-21. All reproduced.

Inventory: awk over "## Launching a builder" lists 17 top-level items; the moved rows (9, 11, 12, 13, 14, 16; Resuming 9, 10, 11) name the items holding their rules, checked by reading.

Grep from the report (-e 'survives a hangup' -e 'detached process' -e 'label <step>' -e 'at its step 8' -e 'nohup' -e 'session_file' -e 'note_id_file', plus 'session-file' and 'hangup') over skills utils docs README.md, outside the changed files: skills/plan/templates/orchestrator-state.md:27 and README.md:121 only. Reproduced.

After all runs, ps shows no process of this review's scratch folder left (two "sleep 60" processes seen belong to another session's zsh loop, ppid 80558 and 66522, left alone).
```

## 1. Spec

1. `.scratch/.../agents/reviews/4-report.md:3` and `launch.sh:17-19,192-210`: the report's first line says "Everything in the brief is done", while brief item 2 asks that TERM, INT or HUP "ends every process of the builder's session". The runner's `stop` kills only the builder's process group and the processes it finds by parent pid, so a process of the leader's session that has left both survives. Reproduced with a stub `claude` that ran `sh -c 'set -m; sleep 300 & ...; exit 0'` and a double fork with setsid, then `sleep 60`. Python `os.getsid` showed the job `5426 sid 5368 pgid 5426`, with 5368 as the leader. After TERM to the leader the exit file said `exit 143`, the leader was gone, and the output was `job (same session, own pgrp, reparented) 5426 STILL ALIVE`. The report's "What the green run does not cover" (line 156) states this as a limit. Rule 12 of `docs/dev/change-standard.md` forbids that ("A miss is never reported as a known limit"). The same-session case can be fixed: `getsid(2)` exists on macOS (Python's `os.getsid` answered above), so the stop can sweep every pid whose session id is the leader's. `ps -o sess` prints 0 on macOS, so ps cannot do this sweep.
2. `launch.test.sh:4` and audit `5-plan-2a-launch.md` finding 8: two of finding 8's untested cases are still untested: "a codex resume with a note" and "a transcript call on a codex record". `grep -n 'codex.*--note\|transcript --note' launch.test.sh` shows codex with a note only at :454 (`c2`, no resume, no transcript after it). The brief points the builder at findings 1 to 11, and the plan's step line says "`launch.test.sh` covers each case". The head comment's claim is covered under Standards 2.

## 2. Proof

1. `4-report.md:197` (judgment call 9): "The longest line of `launch.sh` is now 108 characters (`awk 'length > 104'`)". Rerun: `awk '{ if (length > m) { m = length; l = FNR } } END { print m, l }' launch.sh` prints `104 116`, and `awk 'length > 104' launch.sh | wc -l` prints `0`. The measurement does not reproduce.
2. `launch.sh:19,196-197`: the head comment says a signal sends "TERM to its process group and to every process descended from it, KILL one second later". No test checks that a descendant outside the builder's group gets TERM before KILL. With `kill "TERM", keys %seen;` deleted (revert `term-only-group`) the suite prints `PASS: launch.sh scratch tests`. The land sequence case passes on the KILL alone.
3. `launch.test.sh:547-563`: the land sequence case does not run the KILL branch it is named for. The leader's own grace is one second, so it is gone before the test's `sleep 2`, and `kill -KILL "$leader"` (line 558) is not reached. Case 2 of item 10 ("TERM, then KILL two seconds later ... leaving no process and an exit file") is proven only for a leader that has already ended. No case has a leader still alive at two seconds, for example one blocked in a hanging `end` on the signal path, which is the case where KILL reaches the leader.

## 3. Standards

1. `README.md:121`: "a launch that returns before its builder ends and survives a hangup" is false after this step, since HUP now stops the builder. `skills/plan/templates/orchestrator-state.md:27` says the orchestrator adds the launch fields "at the launch" and lacks `session_file`. `SKILL.md:167` now says both are written and committed before the launch. `docs/dev/change-standard.md` rule 14 says "A sentence in a document or a head comment that the change makes false is a defect of the change". The report lists both as left for the landing, because the brief's path list excludes them.
2. `launch.test.sh:3-4` (head comment): "each recipe with no note and with an empty note, each with a note (start, the builder, end, then transcript)". No codex case calls `transcript` (grep above: every `transcript --note "$note"` call follows a claude record). The sentence is false for codex. `README.md:121` repeats the same claim ("with no note, an empty note and a note (`start`, the builder, `end`, then `transcript`)"). Rule 14 of `docs/dev/change-standard.md` applies.

## 4. Behaviour

1. `launch.sh:416-417` (and `:405-407` for `start`): a signal can arrive after `"run_$harness" &` has started the builder and before `running=$!` is set. `on_signal` then finds `running` empty, writes `exit 143` and exits, and the builder runs on. I reproduced this by widening the window with a `sleep 1` between the two lines in a scratch copy and sending TERM 0.4 s after the launch. The output was `exit file: exit 143` and `builder 1712 STILL RUNNING after the leader wrote its exit file`. The window in the real script is the gap between two shell commands. The brief asks for signals during startup to end the builder, and change-standard rule 15 asks that concurrent paths be exercised in flight.
2. `SKILL.md:102` and `SKILL.md:180` ("A dead pid with no exit file is a dead builder") are false after KILL to the leader alone, or after the leader crashes. The builder's runner and the builder are orphaned and keep running. Reproduced: after KILL to the leader, the output was `leader gone`, `exit file present: False` and `builder 28188 running`. "Resuming, and handing the plan over" then lets a continuation builder take over the same worktree while the first one still writes to it. The head comment's "KILL alone ends the leader only" states this, but neither SKILL.md sentence does. The report does not state this user-visible consequence either.
3. `launch.sh:434-440`: the lock directory `<pid file>.lock` is a refusal the brief did not ask for (brief item 4 refuses only when the pid file names a live process). A launcher killed with KILL, or one whose shell dies between `mkdir` and its EXIT trap, leaves the directory behind. Every later launch of that step then exits 75 with no process running, until someone removes the directory by hand. The lock records no pid, so a dead holder cannot be detected. `SKILL.md:173` names only one refusal ("It refuses with exit 75, starting nothing, while the pid file names a live process"), so an orchestrator reading the skill cannot interpret the lock refusal. The report lists the lock under judgment calls (line 191) but not under user-visible changes with before and after.

## Not checked

- The report's audit reproductions (`sh $TMPDIR/red4/audit.sh`, findings 1 to 4): the script was not in the worktree or the ledger, so its output was not rerun. The same behaviours were checked through the test's cases and my own runs above.
- The revert set of `body-stderr-to-null`, `no-descendant-sweep`, `note-not-exec`, `end-not-waited`, `no-lock`, `no-absolute-paths`, `no-session-file-write`, `session-file-after-start` and `usage-label-step` was not rerun (reverts for items 1, 2, 3, 4, 6 and 7 were).
- The report's timings (49 s under sh, 37 s under dash): not reproduced exactly (32 s and 30 s here). Timing varies between runs, so this is not a finding.
- The prose standard, sentence by sentence, on the changed SKILL.md and launch-note.md lines beyond the layout check and a read.
- Behaviour on Linux: every run here was on macOS (Darwin 24.6.0).

Reviewer usage: not known.

## Repair round 1, refuted

```
(worktree root, CLAUDE_CONFIG_DIR unset)
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1                      PASS: land.sh and usage.py scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1         PASS: check_config.py scratch tests
$ sh skills/plan-retro/templates/collect_findings.test.sh 2>&1 | tail -1    PASS: collect_findings.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1          PASS: sync_rules.py scratch tests
$ sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1      PASS: launch.sh scratch tests (49 s)
$ sh utils/pin.test.sh 2>&1 | tail -1                                       PASS: pin.sh scratch tests
$ sh utils/verify.test.sh 2>&1 | tail -1                                    PASS: verify.sh scratch tests (runner under sh dash)
$ sh utils/check_skill_layout.test.sh 2>&1 | tail -1                        PASS: check_skill_layout.py scratch tests
$ sh utils/check_rule_inventory.test.sh 2>&1 | tail -1                      PASS: check_rule_inventory.py scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1                            PASS: check_coverage.py scratch tests
$ python3 utils/check_skill_layout.py                                       ten ok: lines (land ... spec), rc=0
$ <ASCII check from the verify list>                                        no output, rc=0

Report commands:
$ sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit=$?"
  ten PASS: lines, ten ok: lines, "verify: 12 commands passed", exit=0 (matches the report)
$ LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1
  PASS: launch.sh scratch tests (47 s; report says 43 s)
$ python3 -B utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md; echo rc=$?
  ten ok: lines, rc=0 (matches)
$ awk '{ if (length > m) { m = length; l = FNR } } END { print m, l }' skills/plan-orchestration/templates/launch.sh
  105 546 (matches)
$ awk '/^## Launching a builder/,/^## What earns/' skills/plan-orchestration/SKILL.md | grep -c '^\(- \|[0-9]\. \)'   17 (matches)
  same over "Resuming, and handing the plan over" (to the next ## heading)                                              12 (matches)
$ git diff --numstat 1aa7a17; wc -l
  SKILL.md 4/4 271; launch-note.md 1/0 30; launch.sh 146/38 613; launch.test.sh 145/20 952; orchestrator-state.md 1/1 69 (matches)
$ find . -name __pycache__ -not -path './.git/*'     nothing
$ ls $TMPDIR/red4/reverts1.py $TMPDIR/red4/r1final.out
  No such file or directory (both)

Reverts (copy of launch.sh beside a copy of launch.test.sh under $TMPDIR/rr4.49YIpL, TMPDIR pointed there), first FAIL or PASS line:
term-only-group (kill "TERM", keys %seen deleted):      FAIL: a descendant outside the builder's group: .../term.log holds , expected it to contain TERM
no-session-sweep (session_members returns ()):          FAIL: a job of the leader's session: process 16858 is still running
no-watchdog (getppid() != $watch block deleted):        FAIL: KILL to the leader alone: process 23613 is still running
no-spawn-pending (spawning block of on_signal deleted): FAIL: TERM while the builder is being started: the builder ran on after the exit file was written
harness-always-claude:                                  FAIL: codex resuming a session with a note: calls were
transcript-noop (if read_id -> if false):               FAIL: transcript on a codex record: calls were
lock-not-taken (flock condition -> if (0)):             FAIL: a launch with the lock held exited 0, expected 75
lock-file-refuses (-s $lock || !flock(...)):            FAIL: a second launch printed launch.sh: another launch (pid 60808) holds .../twice out/pid.lock; not launched
no-kill-after-grace (both KILL lines deleted):          FAIL: land sequence with KILL: no exit file
exit-after-end-on-signal (write_exit after end):        FAIL: land sequence with KILL: no exit file
lock-pid-not-written (print $fh "$$\n" deleted from take_lock):   PASS: launch.sh scratch tests
start-no-spawning (spawning=1 before note_exec start deleted):    PASS: launch.sh scratch tests

Race reproduction (scratch copy of launch.sh with "Time::HiRes::sleep(1) if $limit == 0;" inserted after setpgrp($pid, $pid) in the runner; stub claude = exec sleep 30; TERM to the leader 0.4 s after the launch returned):
  launch rc=0 / exit file: exit 143 / leader 70376 gone / "70380     1 sleep 30" (builder alive, reparented to 1)
```

### Spec

- `skills/plan-orchestration/templates/launch.sh:24-25,487-491`: ruling 8 is closed through `LAUNCH_TEST_SPAWN_DELAY`, an environment variable read by the shipped script whose only user is the test. That is a substitute for a proof the test could make on a patched scratch copy, as the first review did. It is listed under Standards as a rule 11 breach.

### Proof

- `launch.sh:340` (take_lock writes the launcher's pid into the lock file) and `4-report.md` ruling 10 ("A live holder refuses with exit 75 and `another launch (pid <n>) holds <lock>`"): with `print $fh "$$\n";` deleted the suite prints `PASS: launch.sh scratch tests`. The "lock held" case uses a perl holder that writes its own pid (`launch.test.sh:604-605`), so no case checks that a real launch names itself in the lock. Change-standard rule 13.
- `launch.sh:506` (`spawning=1` before `note_exec start`): the report's ruling 8 row says the pending mechanism works "for the note's start and for the builder". With that line deleted the suite prints `PASS: launch.sh scratch tests`. Only the builder's window has a case (`launch.test.sh`, "A signal while the builder is being started"). Rule 13.
- `4-report.md`, "Reverts" paragraph: `$TMPDIR/red4/reverts1.py` and `$TMPDIR/red4/r1final.out`, named as the script and the whole output behind the 26 reverts, do not exist (`ls` above). The 10 reverts rerun by the reviewer print the same first FAIL lines the report quotes.

### Standards

- `launch.sh:24-25` and `:487-491`: `LAUNCH_TEST_SPAWN_DELAY` is a parameter whose only user is the test. That breaks `docs/dev/change-standard.md` rule 11 ("no member, parameter or file whose only user is a test") and rule 8. A production launch whose environment sets it sleeps inside the signal window.
- `4-report.md:358-end` (Doc text for `README.md:121`): the replacement bullet runs to about ten sentences. The state file's standing demands, cut (2), say "A README bullet for a test is one sentence saying what the test covers".
- `4-report.md:1-3,175-189`: the report keeps the first report's sections with facts the round changed. The Files table gives `launch.sh` 505 and `launch.test.sh` 827 lines (now 613 and 952), and judgment call 1 describes the runner's stop without the session sweep or the watchdog. The line-3 disclaimer does not meet rule 7, "The report states the end state only".
- `README.md:43` lists "git, POSIX `sh`, and `python3` with PyYAML" as requirements. The round's head comment, `launch.sh:48`, says "Needs perl and python3", and perl appears on no requirement line (`grep -n perl README.md docs/dev/building.md` finds no requirement). Rule 14.

### Behaviour

- `launch.sh:193-208` (runner): a same-class window remains between `fork` and the install of the runner's TERM/INT/HUP handlers. `setpgrp($pid, $pid)` and `$got = 0` still run with the default dispositions. TERM from the leader's `on_signal` in that window kills the runner, and the builder, already forked into its own process group, runs on. The leader writes `exit 143` and exits, and no watchdog or sweep remains to stop the builder. The reproduction above, with the window widened by a 1 s sleep, printed `exit file: exit 143`, `leader gone` and the builder `sleep 30` alive with ppid 1. The brief asks that a signal during startup end the builder. The fix is to install the handlers (or block the signals) before the fork.
- `SKILL.md:174` and `launch.sh:7-10`: after every launch, `<pid file>.lock` now stays as a file beside the pid file, where the lock directory was removed by the EXIT trap. The report states this. SKILL.md does not say it: the file stays, it is not among the dispatch paths of item 1, and when the pid file sits in the ledger it shows as untracked in `git status --short`.

### The first review's findings, one by one

- Spec 1 (the session sweep): closed. `session_members` with `os.getsid` is in `launch.sh:228-238`; no-session-sweep is red.
- Spec 2 (a codex resume with a note, and transcript on a codex record): closed; harness-always-claude and transcript-noop are red.
- Proof 1 (the longest-line figure): closed; the awk prints `105 546`, as the report says.
- Proof 2 (TERM to a descendant outside the group): closed; term-only-group is red.
- Proof 3 (the land sequence with the leader alive at two seconds): closed; no-kill-after-grace and exit-after-end-on-signal are red.
- Standards 1 (`README.md:121`, `orchestrator-state.md:27`): the template is closed; `README.md:121` is carried as Doc text for the landing, as ruled, and that Doc text breaks cut (2).
- Standards 2 (the test head comment claiming codex transcript): closed.
- Behaviour 1 (the signal between `&` and `running=$!`): closed for the shell-level window; no-spawn-pending is red. The note-start half is untested (Proof), the fix depends on a test-only variable (Standards), and a same-class window remains inside the runner (Behaviour).
- Behaviour 2 (KILL to the leader leaves the builder running): closed; the watchdog is at `launch.sh:268-271`, no-watchdog is red, and `SKILL.md:102,180,192` and `launch-note.md:29` state the outcome.
- Behaviour 3 (a stale lock directory blocks every later launch; SKILL.md names one refusal): closed; the lock is flock, released by the system, and `SKILL.md:174` names both refusals. The pid named in the refusal is unproven for a real launch (Proof).

### Not checked

- The report's other reverts (leader-no-setsid, no-signal-traps, no-descendant-sweep, start-unbounded, end-unbounded, transcript-unbounded, note-not-exec, end-not-waited, no-live-pid-check, no-absolute-paths, body-stderr-to-null, no-session-id-flag, no-session-file-write, session-file-after-start, exit-file-in-place, usage-label-step): not rerun.
- The first-report audit reproductions: not rerun as a script.
- Behaviour on Linux: every run was on macOS (Darwin 24.6.0).
- The prose standard, sentence by sentence, on the four changed SKILL.md lines and the one launch-note.md line, beyond a read and the layout check.

Reviewer usage: 166,201 tokens, 29 tool uses, 1,060 s (the runner's completion notification).

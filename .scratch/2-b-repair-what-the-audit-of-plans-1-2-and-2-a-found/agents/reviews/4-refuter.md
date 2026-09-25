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

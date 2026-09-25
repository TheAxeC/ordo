# Report: step 4, launch.sh: a pid that owns the builder, bounded note calls, one launch per step

Everything in the brief is done. Two sentences outside this step's path list are made false or incomplete by it and are left for the landing, since the brief keeps this step to its five paths: `README.md:121` and `skills/plan/templates/orchestrator-state.md:27` (see "Found outside the brief").

## Open items of the state file, verbatim

- I (raised 2026-09-25 by step 5's builder, `agents/reviews/5-report.md`): a reproduction run of `utils/pin.sh` with the session's `CLAUDE_CONFIG_DIR=/Users/axelfaes/.claude-work` still set created one link in the user's real skill folder, `/Users/axelfaes/.claude-work/skills/alpha`, pointing at a scratch folder that no longer exists; nothing else there changed (`ls /Users/axelfaes/.claude-work/skills/` lists alpha, the ten Ordo skills and synced). The builder's removal was refused by the runner's permission check, so the orchestrator does not remove it either. Options: (a) the user removes it with `! rm /Users/axelfaes/.claude-work/skills/alpha`, and every later brief that runs a tool touching skill folders unsets `CLAUDE_CONFIG_DIR` and names every variable that reaches a real folder; (b) leave it. Recommended (a): it is a dangling link the step made in a folder the user's rules keep untouched. (b) is the lazy option.
- H (raised 2026-09-25 by `/spec 2.B 2`): where the verify runner lives. Step 1 put it at `utils/verify.sh`, a path of the Ordo repository. The skills run in other repositories (cathedra, research-hub) from the installed copy, where no `utils/verify.sh` exists, so a skill that names `utils/verify.sh` names a file those repositories do not have; the booked step 3 item asks the `land`, `plan-orchestration`, `refute` and `spec` texts to name it. Options: (a) move the runner and its test into the `land` skill's `templates/` (`skills/land/templates/verify.sh`, `verify.test.sh`), where a skill can name it as "the land skill's `templates/verify.sh`" and every repository has it through the installed skills; Ordo's pages name that path; step 1a's paths follow; (b) keep it in `utils/`, and let the skills say "the repository's verify runner, when it has one", so other repositories run their lists as before. Recommended (a): the runner exists so that no landing can book a red test as green, in every repository the skills run in; (b) leaves every other repository with the defect the runner ends. (b) is the lazy option.

## DONE / NOT DONE

Scratch paths in quoted output are shortened: `/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/` is written `$TMPDIR/`. Nothing else in a quote is changed.

| # | Item | State | Command and output |
|---|---|---|---|
| 1 | The pid owns the builder: the pid file's process leads a new session, is the `start --pid`, alive at start and end, gone after the exit file | DONE | `launch.test.sh` cases "A note" (`expect_file "$ALIVE" "start: alive / end: alive"`, leader gone) and "a session of its own" (`ps -o pgid=` equals the pid); red under revert `leader-no-setsid`, below |
| 2 | TERM, INT, HUP end the whole builder, exit file `exit 143/130/129`, `end` called; TERM then KILL after 2 s leaves no process and an exit file | DONE | cases "TERM, INT and HUP" and "The land skill's sequence"; red under `no-signal-traps`, `no-kill-after-grace`, `no-descendant-sweep` |
| 3 | Every note call bounded at 3 s; a stopped start is a failed one; no `timeout` | DONE | cases "A note that hangs" (start, end, transcript) and "TERM while start hangs"; red under `start-unbounded`, `end-unbounded`, `transcript-unbounded`, `note-not-exec` |
| 4 | A second live launch refused, exit 75, pid named | DONE | cases "A second launch", lock held, stale pid files, two launches together; red under `no-live-pid-check`, `no-lock` |
| 5 | Paths absolute before any `cd`; the body's errors in the stderr file | DONE | cases "Relative files resolve from the caller's directory" (codex resume, codex first run, claude with a note) and "The body's own errors"; red under `no-absolute-paths`, `body-stderr-to-null` |
| 6 | A first claude launch generates a session id, passes `--session-id`, writes `--session-file` before the builder starts; a resume writes its id | DONE | cases "The session id" and "claude resuming a session" (`expect_file "$d/session" "sess-r"`); red under `no-session-id-flag`, `no-session-file-write`, `session-file-after-start` |
| 7 | The exit file moved into place | DONE | case "The exit file is moved into place"; red under `exit-file-in-place` |
| 8 | Usage text names `--label <entry>/<step>` and `--session-file` | DONE | usage case checks both harness lines; red under `usage-label-step` |
| 9 | Head comment says each of the above | DONE | `sed -n 1,42p skills/plan-orchestration/templates/launch.sh`, sections Launch, Body, Session id, Note, Exit status |
| 10 | `launch.test.sh`: a case per item, each red under its revert, polling every 0.1 s, head comment naming the cases, passes under sh and dash | DONE | see "Verification" and "Reds" |
| 11 | SKILL.md "Launching a builder": commit paths (with `session_file`) before the launch; launch is item 2; identity at once after; monitor watches the exit file and `kill -0`; launch-note.md: 3 s bound, `--pid` leads the session | DONE | `git diff skills/plan-orchestration/SKILL.md skills/plan-orchestration/templates/launch-note.md`, summarised under "User-visible changes" |
| 12 | Resumption: `landing: backed-out` case | DONE | `SKILL.md:106`: "A step at `landing: backed-out` was taken back out of main by a red line at its landing: its worktree and branch are kept, it stays unticked in `plan.md`, and it is worked again when its booked item comes up." |
| 13 | Usage: `/land` at its Steps 9 | DONE | `SKILL.md:216`: "`/land` produces it at its Steps 9 with the land skill's `templates/usage.py ...`" |
| 14 | Inventory rows whose place moved | DONE | nine rows moved (Launching a builder 8, 10, 11, 12, 13, 15 to 9, 11, 12, 13, 14, 16; Resuming 8, 9, 10 to 9, 10, 11), each checked by listing the section's items: `awk '/^## Launching a builder/,/^## What earns/' skills/plan-orchestration/SKILL.md \| grep -n '^\(- \|[0-9]\. \)'` and the same for "Resuming"; `check_rule_inventory.py` output below |

## Verification

`sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md; echo "exit=$?"`:

```
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
```

`sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` (timed with `date +%s`):

```
PASS: launch.sh scratch tests
sh took 49s
```

The same with `launch.sh` and the process it starts run through dash, `LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1`:

```
PASS: launch.sh scratch tests
dash took 37s
```

That the dash run starts the body under dash: a launch with `bin/sh` linked to `/bin/dash` first on `PATH`, then `lsof -p "$(cat pid)" | awk '$4=="txt"{print $9}' | head -2` printed `/bin/dash` and `/usr/lib/dyld`.

`python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md; echo rc=$?`:

```
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/land.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/ordo-init.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-help.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan-retro.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/plan.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/refute.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/repo-setup.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/roadmap.md
ok: .scratch/archive/1-one-layout-for-every-skill/inventories/spec.md
rc=0
```

This check proves each named place exists; that each moved row names the place holding its rule was checked by reading the item lists quoted in row 14.

Test time: the base test, `sh $TMPDIR/red4/old/launch.test.sh` (the test and `launch.sh` of `HEAD`), printed `PASS: launch.sh scratch tests` and `base test took 33s`. The new test's cases carried over from the base (everything before "A note command that cannot run", without the usage-error block), cut into `$TMPDIR/red4/subset/launch.test.sh`, printed `PASS: subset` and `subset took 12s`. The whole new test takes longer than the base because its new cases wait by design: three note calls held for their 3 s bound, the land sequence's 2 s, a builder kept running for the second launch.

The new test against `HEAD`'s `launch.sh` (`sh $TMPDIR/red4/base/launch.test.sh 2>&1 | tail -2`) is red on the first launch, which passes `--session-file`:

```
       $TMPDIR/red4/base/launch.sh transcript --note <command> --id <file> <path>
FAIL: a0: launch.sh failed
```

## Reds, one per revert

Each revert was applied to a copy of the final `launch.sh` beside a copy of the final test, by `python3 $TMPDIR/red4/reverts.py <name>`, which prints the diff and `sh launch.test.sh 2>&1 | tail -12`. The first FAIL block of each run:

| Revert | Diff (final, then reverted) | Output |
|---|---|---|
| `leader-no-setsid` | the four lines `defined POSIX::setsid() or do { ... POSIX::_exit(126); };` deleted from the detach program | `FAIL: the pid file's process 84792 is in process group 60094, not its own` |
| `no-signal-traps` | `trap 'on_signal 1' HUP`, `trap 'on_signal 2' INT`, `trap 'on_signal 15' TERM` deleted from `run_body` | `FAIL: no file at $TMPDIR/launch-test.8etEFE/a test root/sig-TERM out/exit` |
| `no-kill-after-grace` | `kill "-KILL", $pid;` and `kill "KILL", keys %seen;` deleted from `stop` | `FAIL: land sequence: process 96065 is still running` |
| `no-descendant-sweep` | `return ();` added as the first statement of `descendants` | `FAIL: land sequence: process 15786 is still running` |
| `start-unbounded` | the runner's timeout test becomes `if ($limit > 0 && $what !~ /start call/ && ...)` | `FAIL: no file at $TMPDIR/launch-test.EE0yDL/a test root/hang-start out/exit` |
| `end-unbounded` | the same with `/end call/` | `FAIL: no file at $TMPDIR/launch-test.snOgMD/a test root/hang-end out/exit` |
| `transcript-unbounded` | the same with `/transcript call/` | `FAIL: a hanging transcript held its caller for 60 seconds` |
| `note-not-exec` | `note_exec` runs `perl ...` instead of `exec perl ...` | `FAIL: TERM while start hangs: note process 88299 outlived the session leader` |
| `end-not-waited` | `wait "$running"` after `note_exec end ... &` deleted | `FAIL: claude resuming a session with a note: calls were` followed by the start, claude and `note\|end\|note-6` lines and `exit file already written`, against the same three lines expected |
| `no-live-pid-check` | `if kill -0 "$old_pid" 2>/dev/null; then` becomes `if false; then` | `FAIL: a second launch exited 0, expected 75` |
| `no-lock` | `if ! mkdir "$lock" 2>/dev/null; then` becomes `if false; then` | `FAIL: a launch with the lock held exited 0, expected 75` |
| `no-absolute-paths` | the fourteen `abs_path` lines for cwd, prompt, report, stderr, exit, pid and events deleted | quoted below |
| `body-stderr-to-null` | the detach started with `2>/dev/null`, and each builder given `2>"$opt_stderr"` as before | `FAIL: a hanging start: $TMPDIR/launch-test.N7KSd4/a test root/hang-start out/stderr holds claude stderr, expected it to contain the launch note's start call did not return within 3 seconds and was stopped` |
| `no-session-id-flag` | `set -- "$@" --session-id "$opt_session_id"` becomes `:` | quoted below |
| `no-session-file-write` | the `printf` to the session file and its reread replaced by `[ -n "$session" ] \|\| {` | quoted below |
| `session-file-after-start` | the session file written after the detach instead of before | `FAIL: the session id before the builder: calls were` / the claude line / `no session file` / `expected` / the claude line / `session file\|4172d09d-a519-44ed-8aac-3c798f723caa` |
| `exit-file-in-place` | `write_exit` becomes `printf 'exit %s\n' "$1" >"$opt_exit"` | `FAIL: the exit file was written through the link, not moved into place` |
| `usage-label-step` | the claude usage line says `--label <step>` | `FAIL: the usage text does not name --label <entry>/<step> for both harnesses: Usage: ...` |

`no-absolute-paths`:

```
FAIL: a relative codex resume: calls were

expected
codex|/private$TMPDIR/launch-test.h27O9l/a test root/work dir|exec|resume|-c|sandbox_mode="workspace-write"|-c|model_reasoning_effort="high"|-m|m1|-o|/private$TMPDIR/launch-test.h27O9l/a test root/rel-c out/report|--json|thr-1|-
```

`no-session-id-flag`:

```
FAIL: claude without a note: calls were
claude|/private$TMPDIR/launch-test.PJS8AX/a test root/work dir|-p|--model|m1|--permission-mode|acceptEdits|--output-format|json
expected
claude|/private$TMPDIR/launch-test.PJS8AX/a test root/work dir|-p|--session-id|1ed2a2be-374f-4b60-befc-6686cc805828|--model|m1|--permission-mode|acceptEdits|--output-format|json
```

`no-session-file-write`:

```
cat: /private$TMPDIR/launch-test.1e2qeY/a test root/a0 out/session: No such file or directory
FAIL: claude without a note: calls were
claude|/private$TMPDIR/launch-test.1e2qeY/a test root/work dir|-p|--session-id|9cfab4d3-3a24-4c13-8bd7-998ba7315f24|--model|m1|--permission-mode|acceptEdits|--output-format|json
expected
claude|/private$TMPDIR/launch-test.1e2qeY/a test root/work dir|-p|--session-id||--model|m1|--permission-mode|acceptEdits|--output-format|json
```

What the green run does not cover: a builder process that leaves the builder's process tree (a daemon that forks twice or calls setsid itself) is not stopped; the stale-pid refusal trusts `kill -0`, so a pid file naming a live process of another program also refuses; the missing-prompt case and the missing `--cwd` case are red under `body-stderr-to-null` only after the hanging-start case, which is earlier in the file and fails first.

## The audit's reproductions, rerun with stubs

`sh $TMPDIR/red4/audit.sh` (stub `claude` and a stub note that sleeps 1000 s on the call named by `HANG`; findings 1 to 4 of `5-plan-2a-launch.md`):

```
finding 1, note hangs on start: exit file 'exit 0' after 3.4 s; log: note start;claude ran in $TMPDIR/audit4.58TXNw/wt;
finding 1, note hangs on end: exit file 'exit 0' after 3.4 s; log: note start;claude ran in $TMPDIR/audit4.58TXNw/wt;note end;
launch.sh: the launch note's transcript call did not return within 3 seconds and was stopped
finding 1, note hangs on transcript: returned rc=0 after 3.2 s
finding 2, TERM to the pid: session leader alive? no; builder alive? no; exit file 'exit 143'
finding 3, two launches at once: start calls 1, end calls 1, claude runs 1; refusal: /Users/axelfaes/workspace/ordo/.agents/worktrees/2b-4/skills/plan-orchestration/templates/launch.sh: another launch holds $TMPDIR/audit4.58TXNw/pid.lock; not launched (remove it if no launch is running)
finding 4, repo-relative claude paths, prompt missing at first: exit file ledger/exit2 'exit 1', wt/ledger/exit2 present? no, ledger/err2: /Users/axelfaes/workspace/ordo/.agents/worktrees/2b-4/skills/plan-orchestration/templates/launch.sh: line 349: $TMPDIR/audit4.58TXNw/ledger/prompt: No such file or directory
finding 4, repo-relative claude paths, prompt present: exit file 'exit 0', wt/ledger/exit2 present? no, log: claude ran in $TMPDIR/audit4.58TXNw/wt;
```

After these runs and the test runs, `ps -A -o pid=,command= | grep -e launch-test -e audit4 | grep -v grep` printed nothing.

## Files

`wc -l` and `git diff --numstat`:

| File | Lines | Added | Removed |
|---|---|---|---|
| `skills/plan-orchestration/templates/launch.sh` | 505 | 350 | 58 |
| `skills/plan-orchestration/templates/launch.test.sh` | 827 | 544 | 107 |
| `skills/plan-orchestration/templates/launch-note.md` | 29 | 6 | 5 |
| `skills/plan-orchestration/SKILL.md` | 271 | 19 | 14 |
| `.scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md` | 139 | 9 | 9 |

## Judgment calls the brief left open

1. **The tool for the session leader and the bounds: perl.** `POSIX::setsid` starts the leader; one perl program (`runner`) runs the builder and each note call in a process group of its own, bounds a note call at 3 s, and on TERM, INT or HUP sends TERM to that group and to every descendant it finds with `ps -A -o pid= -o ppid=`, then KILL one second later. A third perl program makes the session id from 16 bytes of `/dev/urandom`. Reason, in the head comment: macOS has no `setsid` command, and perl ships on macOS and Linux and already runs the ASCII check.
2. **The pid file is written by the session leader itself**, and the launch returns once the file holds the leader's pid. Writing `$!` from the launcher returned before `setsid` had run, so the pid file could name a process that did not yet lead its session and had no signal handlers.
3. **A lock directory, `<pid file>.lock`,** held from the live-pid check to the pid file's write, so two launches started together cannot both pass the check; a launch that finds it refuses with exit 75 and names it. A launcher killed with KILL in that window leaves the directory, and the message says to remove it when no launch runs.
4. **The grace inside the leader is one second**, so the land skill's KILL at two seconds finds the builder already gone and the exit file written.
5. **On the signal path the exit file carries the builder's own code when the builder had already ended** (a signal that arrives during `end`), and 128 plus the signal number otherwise.
6. **`--session-file` is for claude only** (a codex launch with it is a usage error, exit 64); an empty value is a usage error; the file is reread after the write and a mismatch exits 1. `--session-id` is an internal option of `_body_claude`, refused as unknown in the public modes.
7. **A note call stopped by the bound writes one line to the stderr file** (in the body) or to the caller's stderr (transcript mode): `launch.sh: the launch note's <call> call did not return within 3 seconds and was stopped`. A note call's own stderr still goes to `/dev/null`.
8. **The launch exits 1** when the stderr, pid or session file cannot be written, or when the detached process ends before it writes the pid file.
9. **The usage text is wrapped** over several lines per harness; the two usage lines of the base were 270 and 291 characters. The longest line of `launch.sh` is now 108 characters (`awk 'length > 104'`).
10. **Two cases beyond the brief's list**, from audit finding 8: a note command that cannot run (no record, the builder runs) and a builder killed by a signal (`exit 137`, `end` called).
11. **The skill's `metadata.version` is unchanged at 2.7.0**; the brief does not name a version change.

## User-visible changes

- `launch.sh claude|codex`: before, returned at once with the pid of a wrapper shell; after, returns once the session leader has written its own pid, and that pid leads a new session holding the builder.
- TERM, INT or HUP to the pid: before, ended the wrapper only, the builder ran on, no exit file and no `end`; after, the builder and its descendants stop, the exit file reads `exit 143`, `exit 130` or `exit 129`, then `end`. HUP no longer leaves the builder running (the base test's "survives a hangup" case is replaced by the session-leader case).
- Note calls: before, unbounded; after, stopped after 3 s with their processes, with one line naming the call.
- A second launch while the pid file names a live process: before, started a second builder; after, exit 75 with `launch.sh: <pid file> names pid <n>, which is still running; not launched`.
- Relative paths: before, resolved from `--cwd` for claude and from the caller for codex; after, from the caller for both, `--cwd` included.
- The body's errors: before, `/dev/null`; after, the `--stderr` file.
- claude first launch: before, no session id until the builder ended; after, `--session-id <uuid>` passed and written to `--session-file` before the builder starts. A claude resume writes its `--resume` id there.
- The exit file: before, written in place; after, written to `<exit file>.tmp` and moved.
- Usage text: before, `--label <step>` on two long lines; after, `--label <entry>/<step>` and `[--session-file <file>]`, wrapped.
- `SKILL.md` "Launching a builder": before, launch first, then paths and identity, and a monitor on the exit file; after, the paths (with `session_file`) committed before the launch, the launch as item 2 with its exit 75, the identity (pid and session id from the session file) as soon as it returns, the transcript folder named as `--cwd` with `/` and `.` replaced by `-`, and a monitor on the exit file and `kill -0` on the pid, a dead pid with no exit file being a dead builder; a bullet on TERM, INT, HUP and KILL to the pid. "Resuming": the CLI check states running, finished and dead, and the `landing: backed-out` case. Steps 8's resume options name the session file. "Usage": `/land` at its Steps 9.
- `launch-note.md`: the 3 s bound, `--pid` naming the session leader, a stopped start counted as failed, and the order of the exit file and `end` on the signal path.

## Found outside the brief

- `README.md:121` says `launch.test.sh` covers "a launch that returns before its builder ends and survives a hangup". After this step HUP to the pid stops the builder, so that clause is false, and the sentence names none of the new cases. Proposed text for the clause: "a launch that returns before its builder ends, a pid that leads the builder's session, TERM, INT and HUP to that pid, the land skill's TERM-then-KILL sequence, note calls that hang, a second launch refused, the session id, the exit file moved into place". `README.md` is not in this step's path list.
- `skills/plan/templates/orchestrator-state.md:27` lists the fields the orchestrator adds at the launch ("prompt, output ..., events, stderr, exit, pid, note_id_file and session_id") and lacks `session_file`, which `SKILL.md`'s "Launching a builder" item 1 now writes. The file belongs to the `plan` skill, not in this step's path list.
- `docs/dev/building.md:10` lists `sh skills/plan-orchestration/templates/launch.test.sh`; the dash run (`LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh`) is not in the verify list. Not in this step's path list.

The grep that found these, `grep -rn -e 'survives a hangup' -e 'detached process' -e 'label <step>' -e 'at its step 8' -e 'nohup' -e 'session_file' -e 'note_id_file' skills utils docs README.md`, printed, besides lines of the five changed files, `skills/plan/templates/orchestrator-state.md:27` and `README.md:121`.

## The brief against the tree

- Nothing in the brief was found wrong. The brief's reading "the claude recipe changes directory before it opens `--prompt`, `--report`, `--stderr` and `--exit`" held: the base `run_claude` ran `cd "$opt_cwd"` before its redirections (`git show HEAD:skills/plan-orchestration/templates/launch.sh`, lines 133-139).

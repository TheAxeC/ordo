# Report: step 4, launch.sh: a pid that owns the builder, bounded note calls, one launch per step

Everything in the brief and in the ten rulings of repair round 1 is done. The Files table and judgment call 1 state the tree as it landed; the reverts that prove the landed tree are the table under "Repair round 1", "Reverts", and the landing's own fixes are in `4-landing.md`.

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

What the green run does not cover: the missing-prompt case and the missing `--cwd` case are red under `body-stderr-to-null` only after the hanging-start case, which is earlier in the file and fails first; the stale-pid refusal trusts `kill -0`, so a pid file naming a live process of another program also refuses.

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

`wc -l` and `git diff --numstat ec6586e`, on main at the landing:

| File | Lines | Added | Removed |
|---|---|---|---|
| `skills/plan-orchestration/templates/launch.sh` | 627 | 472 | 58 |
| `skills/plan-orchestration/templates/launch.test.sh` | 1020 | 739 | 109 |
| `skills/plan-orchestration/templates/launch-note.md` | 30 | 7 | 5 |
| `skills/plan-orchestration/SKILL.md` | 271 | 19 | 14 |
| `skills/plan/templates/orchestrator-state.md` | 69 | 1 | 1 |
| `.scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md` | 139 | 9 | 9 |

## Judgment calls the brief left open

1. **The tool for the session leader and the bounds: perl.** `POSIX::setsid` starts the leader; one perl program (`runner`) runs the builder and each note call in a process group of its own, bounds a note call at 3 s, and on TERM, INT or HUP sends TERM to that group, to every descendant it finds with `ps -A -o pid= -o ppid=` and, for the builder, to every other process of the leader's session, found through one python3 process the runner starts with the builder and asks over a pipe (`os.getsid`); it looks for them once more and sends KILL to what is left one second later. The runner installs its handlers before it forks, and when its parent is no longer the leader it stops the builder the same way. A third perl program makes the session id from 16 bytes of `/dev/urandom`. Reason, in the head comment: macOS has no `setsid` command, and perl ships on macOS and Linux and already runs the ASCII check.
2. **The pid file is written by the session leader itself**, and the launch returns once the file holds the leader's pid. Writing `$!` from the launcher returned before `setsid` had run, so the pid file could name a process that did not yet lead its session and had no signal handlers.
3. **A lock on `<pid file>.lock`,** held from the live-pid check to the pid file's write, so two launches started together cannot both pass the check. Its end state is under "Repair round 1", ruling 10.
4. **The grace inside the leader is one second**, so the land skill's KILL at two seconds finds the builder already gone and the exit file written.
5. **On the signal path the exit file carries the builder's own code when the builder had already ended** (a signal that arrives during `end`), and 128 plus the signal number otherwise.
6. **`--session-file` is for claude only** (a codex launch with it is a usage error, exit 64); an empty value is a usage error; the file is reread after the write and a mismatch exits 1. `--session-id` is an internal option of `_body_claude`, refused as unknown in the public modes.
7. **A note call stopped by the bound writes one line to the stderr file** (in the body) or to the caller's stderr (transcript mode): `launch.sh: the launch note's <call> call did not return within 3 seconds and was stopped`. A note call's own stderr still goes to `/dev/null`.
8. **The launch exits 1** when the stderr, pid or session file cannot be written, or when the detached process ends before it writes the pid file.
9. **The usage text is wrapped** over several lines per harness; the two usage lines of the base were 270 and 291 characters. The longest line of `launch.sh` is given under "Repair round 1", ruling 3.
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

## Repair round 1

The round started at commit 1aa7a17. Its path list adds `skills/plan/templates/orchestrator-state.md`. `README.md:121` is given under "Doc text" below, for the orchestrator to apply at landing. Scratch paths in quoted output are shortened: `/private/var/folders/7r/49ks4w4558vcr57tvb9svmph0000gp/T/` is written `$TMPDIR/`.

### Rulings and what closes each

| # | Ruling | What closes it |
|---|---|---|
| 1 | `stop` also ends every process of the leader's session, found with getsid; TERM to all, KILL after the grace; the "limit" wording removed | The runner in `launch.sh` has a `session_members` step, used for the builder only (seconds 0). It runs `python3 -B -c` with `os.getsid` over the pids that `ps -ax -o pid=` lists, leaves out the leader and the runner, and returns nothing unless the watched pid leads the runner's session. `stop` sends TERM to the builder's group, its descendants and these session members, then KILL one second later. Test case: "A process of the leader's session that is neither in the builder's group nor descended from it". The stub `STUB_SESSION_JOB` forks a sleeper into a process group of its own and exits its parent. The head comment states the one case the mechanism cannot reach: a process that starts a session of its own (setsid) is no longer in the leader's session. The "does not cover" paragraph of the first report no longer lists a miss. |
| 2 | A codex resume with a note, and a transcript call on a codex record | Test case "A resumed codex run with a note". It checks start with `--harness codex`, the resume call and `note\|end\|note-8`, then `transcript` passing a rollout path to that codex record. |
| 3 | The longest-line figure reproduced | `awk '{ if (length > m) { m = length; l = FNR } } END { print m, l }' skills/plan-orchestration/templates/launch.sh` prints `105 546`. Judgment call 9 now points here. |
| 4 | A descendant outside the builder's group gets TERM before KILL | Test case "A descendant of the builder outside its process group gets TERM before the KILL". The stub `STUB_TRAP_CHILD` writes each TERM it receives to `TERM_LOG` and keeps running, and the case asserts that `TERM_LOG` holds `TERM`. |
| 5 | The land sequence with the leader still alive at two seconds | Test case "The land skill's sequence with the leader still alive at two seconds". The builder ignores TERM. The note's `end` hangs on the signal path, with a child in a process group of its own. The case fails if the leader is gone before the KILL. After the KILL it asserts: the leader gone, the exit file present with `exit 143`, and no builder or note process left. Red under `exit-after-end-on-signal` (no exit file), `no-kill-after-grace` (no exit file: the leader waits on a runner that never ends the builder), `no-descendant-sweep` (the note's child survives) and `no-signal-traps` (the leader dies at TERM, before the KILL). |
| 6 | The template line; README.md:121 as Doc text | `skills/plan/templates/orchestrator-state.md:27` now reads "The orchestrator writes and commits prompt, output (...), events, stderr, exit, pid, session_file (a claude -p launch's --session-file) and note_id_file before the launch, adds session_id as soon as the launch returns, reviewer_report at the review, ...". Doc text below. |
| 7 | The test's head comment says exactly what is covered | Its first sentence now reads: "each recipe with no note, with an empty note and with a note (start, the builder, end), a transcript call after a claude record and after a resumed codex record, each recipe resuming a session (codex also with the network setting, with relative files and with a note, claude also with a note)". It then lists every case of this round. |
| 8 | Close the window between starting a process and recording its pid | `on_signal` checks `spawning`. When a process is being started, it keeps the signal in `pending` and returns. `spawned "$!"` sets `running`, clears `spawning` and acts on `pending`, for the note's start and for the builder. `LAUNCH_TEST_SPAWN_DELAY` (named in the head comment) sleeps inside the window. Test case "A signal while the builder is being started": the builder ignores TERM, TERM is sent inside a 3 s window, and the case asserts the builder is gone by the time the exit file is written, `exit 143`, and no process left. |
| 9 | A watchdog inside the builder's session | The runner takes the leader's pid as `<watch pid>`. When `getppid()` differs from it (the leader ended), the runner stops the builder, its descendants and the session members the same way, then exits. The same holds for a note call's runner. Test case "KILL to the leader alone": within 3 s no process of the builder is left, and no exit file exists. `SKILL.md` "Resuming", item 5 of "Launching a builder" and the TERM/KILL bullet state that case (no exit file, the builder gone within about a second, no `end`). `launch-note.md` states that neither the exit file nor `end` follows a KILL to the leader. |
| 10 | The lock records its holder, a dead holder's lock is stale; SKILL.md names both refusals | `take_lock` (perl) opens `<pid file>.lock`, takes an exclusive non-blocking `flock`, writes its pid, and re-runs the launch with the lock descriptor kept open. The session leader closes that descriptor. The system releases the lock when the launcher ends, so a lock file naming a dead launcher is free and is taken over. A live holder refuses with exit 75 and `another launch (pid <n>) holds <lock>; not launched`. Test cases: "A lock held by a live launch refuses with exit 75, naming its pid" and "A lock file left by a launcher that died, naming its dead pid, is taken over". `SKILL.md` item 2 of "Launching a builder" names both refusals. |

### Checks

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

`sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1` and `LAUNCH_SHELL=dash sh skills/plan-orchestration/templates/launch.test.sh 2>&1 | tail -1`, timed with `date +%s`:

```
PASS: launch.sh scratch tests
sh took 43s
PASS: launch.sh scratch tests
dash took 43s
```

`python3 -B utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md; echo rc=$?`:

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

The round added no item to `SKILL.md`: `awk '/^## Launching a builder/,/^## What earns/' skills/plan-orchestration/SKILL.md | grep -c '^\(- \|[0-9]\. \)'` prints `17`, and the same over "Resuming" prints `12`. The inventory's places therefore stand as before.

After the runs, `find . -name __pycache__ -not -path './.git/*'` printed nothing. `ps -A -o pid=,command= | grep -e launch-test -e 'red4/r1' | grep -v grep` also printed nothing.

### Reverts

Each revert was applied to a copy of the final `launch.sh` beside a copy of the final test, by a script under `$TMPDIR/red4/` that printed each diff and the run's `tail -12`; neither the script nor its output is kept. The first FAIL line of each run is quoted below; all 26 were red, and the round's reviewer reran ten of them with the same first FAIL lines.

| Revert | Change | First FAIL line |
|---|---|---|
| `term-only-group` | `kill "TERM", keys %seen;` deleted from `stop` | `FAIL: a descendant outside the builder's group: $TMPDIR/launch-test.Em70UX/a test root/term.log holds , expected it to contain TERM` |
| `no-session-sweep` | `session_members` returns `()` always | `FAIL: a job of the leader's session: process 21832 is still running` |
| `no-watchdog` | the `getppid() != $watch` block deleted | `FAIL: KILL to the leader alone: process 27644 is still running` |
| `no-spawn-pending` | the `spawning`/`pending` block deleted from `on_signal` | `FAIL: TERM while the builder is being started: the builder ran on after the exit file was written` |
| `exit-after-end-on-signal` | `write_exit` moved after the note's `end` in `on_signal` | `FAIL: land sequence with KILL: no exit file` |
| `harness-always-claude` | `--harness "$harness"` becomes `--harness claude` | `FAIL: codex resuming a session with a note: calls were` |
| `transcript-noop` | the transcript mode's `if read_id; then` becomes `if false; then` | `FAIL: transcript on a codex record: calls were` |
| `lock-not-taken` | `if (!flock($fh, LOCK_EX \| LOCK_NB)) {` becomes `if (0) {` | `FAIL: a launch with the lock held exited 0, expected 75` |
| `lock-file-refuses` | the condition becomes `if (-s $lock \|\| !flock(...)) {` | `FAIL: a second launch printed launch.sh: another launch (pid 54430) holds $TMPDIR/launch-test.7BgzUE/a test root/twice out/pid.lock; not launched` |
| `leader-no-setsid` | the setsid block deleted from `detach` | `FAIL: the pid file's process 33541 is in process group 31400, not its own` |
| `no-signal-traps` | the three traps deleted from `run_body` | `FAIL: land sequence with KILL: the leader was gone before the KILL` |
| `no-kill-after-grace` | `kill "-KILL", $pid;` and `kill "KILL", keys %seen;` deleted | `FAIL: land sequence with KILL: no exit file` |
| `no-descendant-sweep` | `descendants` returns `()` | `FAIL: land sequence with KILL, the note: process 44178 is still running` |
| `start-unbounded` | no timeout for the start call | `FAIL: no file at $TMPDIR/launch-test.opSHZm/a test root/hang-start out/exit` |
| `end-unbounded` | no timeout for the end call | `FAIL: no file at $TMPDIR/launch-test.KBL8nw/a test root/hang-end out/exit` |
| `transcript-unbounded` | no timeout for the transcript call | `FAIL: a hanging transcript held its caller for 60 seconds` |
| `note-not-exec` | `note_exec` runs perl without `exec` | `FAIL: claude resuming a session with a note: calls were` |
| `end-not-waited` | `wait "$running"` after `note_exec end &` deleted | `FAIL: claude resuming a session with a note: calls were` |
| `no-live-pid-check` | `kill -0 "$old_pid"` becomes `false` | `FAIL: a second launch exited 0, expected 75` |
| `no-absolute-paths` | the `abs_path` lines for cwd, prompt, report, stderr, exit, pid, events deleted | `FAIL: a relative codex resume: calls were` |
| `body-stderr-to-null` | the detach's stderr to `/dev/null`, the builders given `2>"$opt_stderr"` | `FAIL: a hanging start: $TMPDIR/launch-test.VYbYrb/a test root/hang-start out/stderr holds claude stderr, expected it to contain the launch note's start call did not return within 3 seconds and was stopped` |
| `no-session-id-flag` | `--session-id` not passed | `FAIL: claude without a note: calls were` |
| `no-session-file-write` | the session file not written | `FAIL: claude without a note: calls were` |
| `session-file-after-start` | the session file written after the detach | `FAIL: the session id before the builder: calls were` |
| `exit-file-in-place` | `write_exit` writes the exit file in place | `FAIL: the exit file was written through the link, not moved into place` |
| `usage-label-step` | the claude usage line says `--label <step>` | `FAIL: the usage text does not name --label <entry>/<step> for both harnesses: Usage: ...` |

### User-visible changes of this round

- The launch lock: before, a directory `<pid file>.lock` made by `mkdir` and removed by the launcher's EXIT trap. A launcher killed between the two left it behind, and every later launch of the step then exited 75 until the directory was removed by hand. After, a file `<pid file>.lock` held with `flock` by the live launcher, holding its pid. A live holder refuses with exit 75 and `launch.sh: another launch (pid <n>) holds <lock>; not launched`. A file left by a dead launcher is taken over. The file stays beside the pid file after the launch.
- TERM, INT or HUP to the leader: before, the builder's group and its descendants were stopped. After, every other process of the leader's session is stopped as well.
- KILL to the leader alone, or a leader that ends without writing the exit file: before, the builder ran on. After, the builder's runner stops the builder and every process of the session within about a second. No exit file is written and `end` is not called.
- A signal while the builder or the note's start is being started: before, the builder could run on. After, it is stopped as soon as its pid is known.
- `launch.sh` now needs python3 as well as perl (head comment, "Needs perl and python3").
- `SKILL.md`, `launch-note.md` and the state template, as in rulings 6, 9 and 10.

### Files, since 1aa7a17

`git diff --numstat 1aa7a17` and `wc -l`:

| File | Lines | Added | Removed |
|---|---|---|---|
| `skills/plan-orchestration/templates/launch.sh` | 613 | 146 | 38 |
| `skills/plan-orchestration/templates/launch.test.sh` | 952 | 145 | 20 |
| `skills/plan-orchestration/templates/launch-note.md` | 30 | 1 | 0 |
| `skills/plan-orchestration/SKILL.md` | 271 | 4 | 4 |
| `skills/plan/templates/orchestrator-state.md` | 69 | 1 | 1 |

### Doc text

`grep -n 'launch.test.sh. runs' README.md` prints:

```
121:- `launch.test.sh` runs `launch.sh` with stub `claude`, `codex` and launch-note commands, in paths that contain spaces. It checks that each recipe runs with its exact arguments and keeps the builder's exit code with no note, an empty note and a note (`start`, the builder, `end`, then `transcript`). It also covers a resumed session for each harness, the ways `start` can fail to give an id, a launch that returns before its builder ends and survives a hangup, an exit file left by an earlier run, relative files, and every usage error with its message.
```

Replacement for line 121:

```
- `launch.test.sh` runs `launch.sh` with stub `claude`, `codex` and launch-note commands, in paths that contain spaces. It checks that each recipe runs with its exact arguments and keeps the builder's exit code with no note, an empty note and a note (`start`, the builder, `end`), and a `transcript` call after a claude record and after a resumed codex record. It also covers a resumed session for each harness (codex also with the network setting, with relative files and with a note), the ways `start` can fail to give an id, a note command that cannot run, a builder killed by a signal, a launch that returns before its builder ends, an exit file left by an earlier run, and every usage error with its message. It checks that the pid in the pid file leads a session of its own and is the pid `start` receives; that TERM, INT and HUP to it stop the builder and write `exit 143`, `130` and `129` before `end`; that the land skill's TERM-then-KILL sequence leaves no process and an exit file, with the leader gone within its grace and with the leader still alive at two seconds; that a descendant outside the builder's group gets TERM before KILL and a process of the leader's session outside the builder's tree is stopped; that KILL to the leader alone leaves no builder process and no exit file; that TERM while the builder is being started stops it; that a note call hanging on `start`, `end` or `transcript` is stopped after 3 seconds; that a second launch is refused with exit 75 while the first runs or while a live launch holds the lock, and that a lock left by a dead launcher is taken over; that relative paths resolve from the caller's directory for both harnesses; that the body's errors reach the stderr file; that the session id is written before the builder starts and passed with `--session-id`; and that the exit file is moved into place. It runs `launch.sh` under `sh`, and under `dash` with `LAUNCH_SHELL=dash`.
```

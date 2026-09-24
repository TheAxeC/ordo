Review of plan 2.A: launch notes for builders run as their own process. Diff range 9673198^..HEAD, where 9673198 is the plan's opening commit.

## What was run
- `sh skills/plan-orchestration/templates/launch.test.sh` printed `PASS: launch.sh scratch tests` (34 s).
- `sh skills/ordo-init/templates/check_config.test.sh` printed `PASS: check_config.py scratch tests`.
- `sh skills/land/templates/land.test.sh` printed `PASS: land.sh and usage.py scratch tests`.
- `python3 utils/check_skill_layout.py` exited 0.
- Real runs through `launch.sh` in the scratchpad, outside the repository:
  - **Claude:** `claude` with `--model haiku` wrote `exit 0` and session `4b77113b-...`. `--resume` with that id returned the same `session_id` and wrote to the same `<session>.jsonl`.
  - **Codex:** `codex` with `gpt-5.6-sol` wrote `exit 0` and thread `01a0d463-...`. `--resume` of that thread returned `AGAIN`. The rollout shows both turns with `sandbox_policy` `workspace-write`, cwd set to `--cwd`, effort `low`.
- The flags match the help output:
  - `codex exec --help` lists `-C`, `-s`, `-c`, `-m`, `-o`, `--json` and `-` for stdin.
  - `codex exec resume --help` lists `-c`, `-m`, `-o`, `--json`, then `[SESSION_ID] [PROMPT]`, and has no `-C` or `-s`.
  - `claude --help` lists `-p`, `-r/--resume`, `--model`, `--permission-mode acceptEdits` and `--output-format json`.
- Stub runs worked as intended for these cases:
  - the detached process survives the end of the tool call;
  - the pid given to the note's `start --pid` equals the pid in the pid file;
  - a note that is not executable: builder ran, `exit 0`, empty id file, no `end`;
  - a builder killed with `kill -9`: `exit 137`, and `end` was called.

## Findings

1. **Wrong behaviour.** A note command that hangs blocks the builder or the exit file. This contradicts the documentation.
   - **Where:**
     - `launch.sh:167-169`, `:174` and `:210` make the note calls.
     - `launch.sh:13` says the note's "failure never stops the builder or this script".
     - `launch-note.md:9` says "the builder runs, and the launch finishes, whatever the note command does".
   - **Reproduction:** a stub note that runs `sleep 1000`:
     - on `start`: the builder never started, and after 4 s there was no exit file;
     - on `end`: the builder finished (`claude` ran, `end` was logged), but the exit file was never written, so the monitor waits forever;
     - on `transcript`: the orchestrator's own `launch.sh transcript` call blocked until `alarm 5` killed it (rc 142).
   - **Fix:** bound each note call. Run it in the background and kill it after a few seconds. macOS has no `timeout`, so use `sleep N; kill` from a watcher subshell. As a minimum, write the exit file before `end`.
   - **Untested:** no test case covers a hanging call.

2. **Wrong behaviour / design concern.** Killing the pid in the pid file leaves the builder running, with no `end` and no exit file.
   - **Where:** `launch.sh:171` runs the builder as a foreground child with no trap. `SKILL.md:101` has resumption judge a CLI worker by its pid file and exit file.
   - **Reproduction:** launch with `SLEEP=8`, then `kill $(cat pid)`. Result: "detached sh alive? no; builder alive? yes". The exit file never appears, and the note record is never closed.
   - **Consequence:** a new orchestrator sees a dead pid and no exit file. It reports a dead builder while that builder is still writing to the worktree. `launch-note.md:14` tells the note that `--pid` is "the pid of the detached process", which does not identify the builder.
   - **Fix:** run the builder in the background, then `wait`. Add `trap 'kill "$child"; wait "$child"' TERM INT` so that the exit file and `end` still follow. Alternatively, write the builder's own pid to the pid file.

3. **Wrong behaviour.** Two launches of the same step at once are not refused.
   - **Where:** `launch.sh:179-194` has no check of an existing live pid.
   - **Reproduction:** two concurrent launches that share the pid, id and exit files:
     - two `start` calls ran (pids 88823 and 88824);
     - `end id-88828` was called twice, and the other record was never closed;
     - the pid file named 88824, but the exit file first held `exit 1`, written by the run whose pid is not in the pid file, and later `exit 2`.
   - **Consequence:** a monitor would take the first run's result for the recorded builder's. Both builders write the same worktree.
   - **Fix:** refuse (exit 64 or 75) when the pid file exists and `kill -0 $(cat pid)` succeeds. Add a test.

4. **Documentation mismatch.** Relative paths resolve differently for the two harnesses, and nothing tells the orchestrator. A repo-relative claude launch fails silently.
   - **Where:**
     - `launch.sh:133-138` (the claude branch changes into `--cwd` first) and `:188-191`;
     - `SKILL.md:163-168`, which says nothing about relative paths;
     - `.agents/plan.yaml:2` says "Every path is relative to the repository root", so the dispatch fields hold repo-relative paths;
     - `launch.sh:164` sends the body's own stderr to `/dev/null`.
   - **Reproduction 1:** `launch.sh claude --cwd wt --prompt ledger/prompt --report ledger/rep2 ... --exit ledger/exit2` from the repository root. `claude` never ran, no exit file was written anywhere, and the pid died. The monitor waits forever.
   - **Reproduction 2:** with `wt/ledger/` present, as it is in a real worktree because the ledger is tracked, the run wrote `exit 1` to `wt/ledger/exit3`. That is inside the builder's worktree, where `/land`'s wip commit can pick it up. The claude process was never started, and the error went to `/dev/null`.
   - The same paths work for codex, which resolves them from the caller's directory.
   - **Fix:** either make every path absolute in the launch mode, as `run_codex` already does for `--report` on resume, and drop the per-harness rule; or refuse relative paths. In both cases say it in `SKILL.md` item 1. Also send the body's stderr to the `--stderr` file, or to a launch log, rather than `/dev/null`.

5. **Documentation mismatch / design concern.** A `claude -p` builder's session id is not known while it runs.
   - **Where:** `SKILL.md:169-174` and `:98` ("A dispatch in flight is recorded in the state file before the builder starts").
   - **The gaps:**
     - Item 2 has the orchestrator find the session id from "the file name of the builder's transcript (item 3)", but item 3 is skipped when `launch_note` is empty.
     - Item 3 places the transcript "in the folder named after the worktree's directory". The folder is actually the full `--cwd` path with `/` and `.` turned into `-`. The real run wrote to `-private-tmp-claude-502--Users-...-scratchpad-real-wt/`, which includes the tool dir.
     - Nothing tells the orchestrator which `.jsonl` in that folder belongs to the builder.
   - **Consequence:** with the note off, `session_id` is known only after exit. An orchestrator that dies mid-run cannot resume the builder.
   - **Fix:** have `launch.sh` pass `--session-id <uuid>` on a first claude run (`claude --help` lists it) and print or write the uuid for the dispatch block. The session id and the transcript path are then known before the builder starts. Correct the folder description in item 3.

6. **Documentation mismatch.** The first launch does not say to commit the paths before launching.
   - **Where:** `SKILL.md:163-169`. Item 1 runs the launch, and "Every path ... goes into the dispatch block" is a sub-bullet under it. Item 2 then commits the identity.
   - The rule at `SKILL.md:98` needs the block committed before the builder starts. Step 8 (`SKILL.md:67`) says so for a resume, but the first launch does not.
   - **Fix:** make "write the paths into the dispatch block and commit" item 1, and the launch item 2.

7. **Documentation mismatch.** The monitor watches only the exit file.
   - **Where:** `SKILL.md:175` (item 4).
   - Given findings 1, 2 and 4, a run can end with no exit file. The monitor should also treat a dead pid with no exit file as a finished-dead builder, which is how the resumption check at `:101` already works.
   - **Fix:** in item 4, watch the exit file and `kill -0` on the pid.

8. **Untested behaviour.** `launch.test.sh` does not cover:
   - a hanging note call;
   - a note that is not executable (it runs correctly by hand);
   - a builder killed by a signal (`exit 137`, which works by hand);
   - killing the detached process;
   - concurrent launches;
   - a codex resume with a note (only claude resume with a note is tested, at `:181`);
   - a transcript call on a codex record, although `README.md:120` says each recipe is checked "with a note (start, the builder, end, then transcript)", and `launch.test.sh:266-271` never calls transcript for codex;
   - a relative `--cwd`.

   **Fix:** add these cases, and the tests for findings 1 to 3 once they are fixed.

9. **Cosmetic.** The exit file is not written atomically.
   - **Where:** `launch.sh:176` truncates and then writes the file. A monitor testing `-e` rather than `-s` can read an empty file.
   - **Fix:** write `$opt_exit.tmp` and then `mv` it into place.

10. **Design concern, minor.** The note cannot tell apart records whose labels collide.
    - **Where:** `SKILL.md:166` and `launch-note.md:14`.
    - `--label` is "the step", and step numbers repeat across plans. A resumed round's `start` carries neither the session id nor any mark that it is a resume, so the note can link a round to its first run only through `--label` plus `--parent`.
    - **Fix:** without changing the three calls, make the label `<entry>/<step>`, for example `2.A/3`, in `SKILL.md`.

11. **Cosmetic.** The test takes 34 s.
    - **Where:** `launch.test.sh:80-87`. `wait_file` polls with `sleep 1` about 25 times, although most stubs exit at once.
    - **Fix:** poll at 0.1 s where the platform's `sleep` accepts fractions.

## check_config.py
- `check_config.py:69-78` reports a launch_note that is relative, `~`, blank, a directory, missing or not executable, in both configuration forms. There is one test case for each.
- The default `""` is read correctly from `plan.yaml`.
- No defects found.

## The --resume widening of step 3
It was the right design. Without it, a repair round is a second detached process that the orchestrator starts, and it would run outside `launch.sh`: unrecorded by the note, and with a second copy of the flags in `SKILL.md`. The mode adds about 15 lines.

The codex form (change into `--cwd`, `-c sandbox_mode="workspace-write"`, report path made absolute) is needed because `codex exec resume` has no `-C` or `-s`. The real resume above ran in `--cwd` under `workspace-write`. A simpler route would not have served the entry's goal of recording every builder the orchestrator starts as its own process.

The weaknesses around it are findings 5 and 10: a claude session id known only late, and a resumed record that is not marked as a resume.

## Verdict
Works with fixes. Both recipes and both resumes work against the real `claude` and `codex`, and the default with the note left empty is safe. The following must be fixed before a real unattended run relies on it:
- the hanging note blocking the builder or the exit file (finding 1);
- the pid that does not own the builder (finding 2);
- the missing guard against a second launch (finding 3);
- the silent failure with repo-relative claude paths (finding 4).

Files: `/Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/launch.sh`, `/Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/launch.test.sh`, `/Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/launch-note.md`, `/Users/axelfaes/workspace/ordo/skills/plan-orchestration/SKILL.md`, `/Users/axelfaes/workspace/ordo/skills/plan/templates/orchestrator-state.md`, `/Users/axelfaes/workspace/ordo/skills/ordo-init/templates/check_config.py`. Nothing in the repository was changed.

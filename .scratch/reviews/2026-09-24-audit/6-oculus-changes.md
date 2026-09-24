Read-only review of the oculus session's Ordo-related changes, checked against ordo HEAD 9be174e. I changed nothing in either repository; every script ran on copies in my scratchpad, with a temporary HOME.

## Q1. Does the hub's configuration work with Ordo's launch_note?

**F1 (high): the hub's value fails both checkers.**
- The hub's `.agents/plan.yaml:23` sets `launch_note: "node tools/oculus/bin/dispatch-note.mjs"`. That is a command line with a relative path, not an absolute path to an executable.
- The HEAD checker fails it. `python3 skills/ordo-init/templates/check_config.py /Users/axelfaes/workspace/research-hub` prints `error: oculus: launch_note is not an absolute path: 'node tools/oculus/bin/dispatch-note.mjs'` and exits 1. The same happens on a copy. The `projects:` form is handled: the error carries the `oculus:` prefix (check_config.py:38-39, 99-103).
- The pinned v1.0.0 checker fails it too. `python3 ~/.local/share/ordo-stable/ordo-init/templates/check_config.py <hub>` prints `error: oculus: unknown key: launch_note` and exits 1. So `/ordo-init` check on the hub fails today under either version.

**F2 (high): with this value, launch.sh starts no builder at all.** The note is not merely skipped.
- launch.sh:92-95 refuses a relative `--note`, before it detaches.
- I ran `sh launch.sh claude ... --note "node tools/oculus/bin/dispatch-note.mjs" ...`. It printed `--note must be an absolute path` plus the usage text, exited 64, and wrote no pid file.
- Even an absolute `node /abs/...` would fail: launch.sh:167 runs `"$opt_note"` as a single word.

**F3 (medium): the script is not executable, so an absolute path alone is not enough.**
- `git ls-files -s tools/oculus/bin/dispatch-note.mjs` shows `100644`. It has a `#!/usr/bin/env node` first line but no execute bit.
- End-to-end run with a fake `claude` on PATH:
  - a non-executable copy: the builder ran (`exit 0`), the id file was empty, and no record was written;
  - a `chmod +x` copy: id `e67c4d04-...` was written, and the record had `pid` 43385 (the same pid as the pid file), `label` "2.B/4" and `endedAt` set.
- Fix, on the hub side:
  1. Commit the execute bit (`git update-index --chmod=+x`).
  2. Set `launch_note: "/Users/axelfaes/workspace/research-hub/tools/oculus/bin/dispatch-note.mjs"`.
  3. Correct the comment on that line.

## Q2. Does dispatch-note.mjs implement launch-note.md?

**F4 (ok, checked): the three calls, their arguments and the id line all match.**
- `start` takes the flags launch.sh passes: `--launcher --label --harness --model --parent --cwd --pid` (dispatch-note.mjs:53-62).
- The id is the only stdout line (:399).
- `transcript <id> <path>` and `end <id>` behave as launch-note.md says (:366-384).
- A failure exits 1 with a message on stderr, and launch.sh ignores it. Measured: a dead pid gives `--pid 999999 names no running process` (exit 1); an unknown id gives `no launch with the id nope` (exit 1).
- A second `end` keeps the first stamp (:381).
- `--cwd` and the transcript path are resolved against the caller's working directory (:340-341, :371). This is correct once 2.B makes every path absolute.

**F5 (medium): a call does not always return at once.**
- `start` waits up to `LOCK_WAIT_MS` 10000 ms plus 2000 ms on a held lock (:68-69, :222), and `ps` up to 3000 ms (:94).
- Measured with a lock held by a live `sleep`: `start` took 10 s, then cleared the lock by age and wrote its record.
- Without contention it took 0.08 s (`/usr/bin/time -p`).
- For 2.B step 4 (a note call bounded in time):
  - A bound under about 15 s cuts off a legitimate wait.
  - A kill after the rename but before the print leaves a record whose id never reaches the id file, so `end` is never called for it. The reader then relies on the recorded pid.
  - Either set the bound above 15 s, or have the hub cut `LOCK_WAIT_MS` to about 2 s so that "return at once" holds.
  - `timeout` is not in base macOS, so launch.sh needs its own watchdog (a background `sleep` and `kill`).

**F6 (medium): what 2.B's "pid of the builder" means for dispatch-note.**
- `start` refuses a pid that is not alive at the call (:331) and records that process's start time (:332).
- launch-note.md:13 has `start` run before the builder starts, so the builder's own pid cannot be passed then.
- 2.B step 4 must do one of two things:
  - (a) keep passing the pid of the process that owns the builder and outlives it (today that is `$$` of the detached shell, launch.sh:168, which equals the pid file). This keeps launch-note.md:14's "the same pid the launch writes to the step's pid file".
  - (b) start the builder in the background, then call `start` with `$!`. That changes launch-note.md:13, and loses the record when the builder exits before the call.
- Either way the pid given must live until `end`. Otherwise the reader reads the row as done early (dispatches.ts:115, :142-148).
- Recommended: (a). The owning process is what the pid file names, the note has to say so, and the process must stay alive through `end`.

**F7 (low, answers ruling 2g): the label `<entry>/<step>` is accepted as is.**
- The label is free text. It is used only as the row's description (dispatches.ts:119) and is never parsed.
- In the hub's `projects:` form the entry is `oculus/migration`, so the label reads `oculus/migration/Q69`, with two slashes. That is harmless.

**F8 (low): a resumed run as a new record works.**
- A second `start` with the same label made a second record `7876b136-...` beside the first.
- Each record is its own row under the parent (dispatches.ts:184-202), and no two share an id (:85).
- Two records pointing at the same transcript join the same child session to both rows. The ended row keeps its `endedAt`, so it still reads done.

**F9 (medium): any flag 2.B adds to `start` breaks every record.**
- `readFlags` refuses unknown flags (:309). Tested: `--session s` gives `not a flag of start: --session`, exit 1.
- If 2.B passes the Claude session id known before the builder starts, or any new field, every `start` fails and nothing is recorded. The builder still runs.
- Fix, choose one:
  - 2.B passes the transcript at `start` through the flag dispatch-note already takes, `--transcript <path>` (:60), and adds it to launch-note.md as optional;
  - dispatch-note ignores unknown flags.
  - Either way, a flag is added to the interface page before launch.sh sends it.

## Q3. The oculus standing demands (orchestrator-state.md:50-58), against the Ordo skills

**F10 (high, belongs in 2.B step 3): "a landing ends every agent of its step" (line 56) is sound, is missing from Ordo, and is placed too late.**
- Missing from Ordo: land/SKILL.md steps 1-11 (lines 39-71) have no step that stops the builder or the reviewers. plan-orchestration/SKILL.md only waits for a running builder (line 102) and stops agents only at a deadline (line 216).
- Placed too late: "before the landing commit" is after land step 2's wip commit (land/SKILL.md:40). A builder or reviewer still writing after that is missed by the cherry-pick, and races `git worktree remove` at step 10.
- Fix in land/SKILL.md: a new first step, before step 2:
  - stop the builder and every reviewer of the step through the runner's stop tool;
  - check through the runner's agent listing that none is left;
  - for a shell builder, check that the pid is gone and the exit file exists;
  - have the landing report name the check.
- Ordo's rule says the skill carries no vendor names (plan-orchestration/SKILL.md:253), so it cannot write `TaskStop` or `ListAgents`. It should use the same generic phrasing as line 101's "the runner's own agent listing".
- The hub ledger's "added there with O32's recipes" did not happen: the recipes shipped in 7d1f90e without it. 2.B's plan.md does not list it: `grep -i "stop.*agent"` on it finds nothing.

**F11 (high, conflicts, belongs in 2.B step 3): "landed work is finished forward, never reverted" (line 51) contradicts land/SKILL.md:112-113.**
- Those lines say "undoing a step is `git revert` of that commit ... A reverted step is booked as reverted."
- The hub rule is the better one. It agrees with plan-orchestration/SKILL.md:188-190 and 254 (a defect is closed by work on top, and a fix of delivered work needs no yes).
- Fix: keep the one-commit property as the reason a step stays traceable, and replace the revert sentences with: "a landed step found short or wrong gets a new step that finishes it on top; a landed commit is reverted only on the user's ruling." Remove "booked as reverted", or restrict it to that ruling.
- Not a conflict: land step 5 (lines 48-49) taking a red step back out of main before its commit. That un-applies a step that never landed.

**F12 (medium, belongs in 2.B step 2): "every step through the skills as skills" (line 52) is sound but not stated in Ordo.**
- plan-orchestration/SKILL.md:46, 61, 70 and 76 say "Invoke /spec" and so on.
- Nothing says the skill is loaded through the runner every time, including after a compaction, and never carried out from remembered text.
- Fix: add that sentence to plan-orchestration's Rules and to the resumption section (lines 91-110).

**F13 (low, will conflict after 2.B): "reports open with the open items verbatim, then the booked count" (line 53) is already in Ordo.**
- Ordo already says it: plan-orchestration/SKILL.md:195-197 and land/SKILL.md:70.
- 2.B's ruling puts a position line first, then the open items, so once 2.B lands this demand is out of date. The hub should drop it rather than repeat Ordo's rule.

**F14 (low): "each look covers every theme the step changes" (line 54) is already in Ordo.** land/SKILL.md:76 says "under the themes the step touches". Nothing to add.

**F15 (low, hub only): the VS Code parity demand (line 57) and the pause and run lines (58-60) are project-specific.** They are not for Ordo.

## Q4. What the oculus ledger says about Ordo that is wrong now

**F16 (medium): the comments describe Ordo wrongly.**
- orchestrator-state.md:22 says "run from the repository root by the launch recipes once the Ordo plan skills carry the key", and plan.yaml:23 says the same.
- Ordo HEAD does not run the command from the repository root. It requires an absolute path to an executable (launch.sh:92-95, launch-note.md:3).

**F17 (medium): the found-note in state line 102 is out of date or wrong in three places.**
- The booked requirement is "with the builder's own pid". Ordo HEAD passes the detached shell's `$$` (launch.sh:168), and 2.B step 4 changes it.
- "Blocked by ... `.scratch/1-one-layout-for-every-skill`" is stale. That plan is archived (`ls .scratch/archive` lists it), and the Ordo plan in flight is 2.B.
- The item implies Ordo HEAD would work once installed. It would not, because of F1-F3.
- Correct as it stands:
  - "the installed copy lacks the recipes": `grep` for launch_note in `~/.local/share/ordo-stable` finds nothing;
  - the link `~/.claude-work/skills/plan-orchestration -> ~/.local/share/ordo-stable/plan-orchestration`, which `ls -la` confirms.
- The stale part is what it leaves out: the copy is deliberately pinned to v1.0.0 (commit 80cfa51 "Pin the installed skills to a tag while Ordo is changed").
- No Ordo roadmap entry or 2.B step moves the pin, and 2.B's state file (lines 59-60) forbids running `pin.sh`. So "closed when Axel names the Ordo commit" is not reachable without a re-pin that is booked nowhere.

**F18 (medium): O32's tick condition cannot be met in the hub's normal flow.**
- plan.md:166 ticks O32 only when "one real launch has written its note".
- The hub's `worker: claude:opus` builders are native Agent-tool agents. launch-note.md:5 says those are not recorded.
- So no note is written unless a step is built by `claude -p` or Codex. The condition needs a named shell-launched step, or rewording.

## Q5. Defects in the oculus changes themselves

- **F19 (high):** F1-F3 together. The configuration committed in b059c57f fails both checkers, stops every shell launch under Ordo HEAD, and names a file that is not executable. The O32 landing's verification never ran the Ordo checker on it.
- **F20 (medium):** the key was committed while the pinned skills reject it as unknown (F1), so the hub's own `/ordo-init` check has been red since 2026-09-23.
- **F21 (medium):** F5. dispatch-note's 10-12 s lock wait is its own violation of "every call must return at once" (launch-note.md:9).
- **F22 (low):** F10's placement. "Before the landing commit" leaves the wip commit and the worktree removal exposed to a builder that is still running.

## Verdict

- **Configuration and interface (poor):** the configuration does not work with Ordo in either version. dispatch-note.mjs itself matches the three-call interface; its only faults are the missing execute bit and the long lock wait. The ledger overstates how close O32 is to closing.
- **Standing demands (sound):** the two that matter (stopping every agent at landing, finishing forward) are correct, and Ordo does not have them.

**What 2.B should take:**
- **Step 3 (land):**
  - a first step, before the wip commit, that stops and lists the step's agents and checks a shell builder's pid, in vendor-neutral words;
  - replace the `git revert` rule (land/SKILL.md:112-113) with finish-forward, revert only on the user's ruling.
- **Step 2 (plan-orchestration):**
  - skills are invoked as skills every time, including after a compaction;
  - launch-note.md states that the `--pid` process owns the builder and lives until `end`;
  - any new `start` field is optional and added to the page first, since dispatch-note refuses unknown flags;
  - optionally, `--transcript` at `start` once the Claude session id is known in advance.
- **Step 4 (launch.sh):**
  - a time bound above dispatch-note's worst case of about 15 s, or an agreed shorter lock wait on the oculus side;
  - pass the pid-file pid, alive before `start`;
  - label `<entry>/<step>`, which oculus accepts as free text.
- **Outside 2.B's steps, for the user to decide:**
  - who re-pins the installed skills;
  - the hub-side fixes: the execute bit, an absolute `launch_note` path, the corrected comments and ledger lines 22 and 102, and O32's tick condition.

# Plan: 2.A Launch notes for builders run as their own process

Execution ledger for entry 2.A of `docs/roadmap.md`. One bullet is one step of work; this plan's executor is inline, so the orchestrating session builds each step itself in the step's worktree, and bookkeeping steps are marked. A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

An optional `launch_note:` key in the plan configuration, default "" (nothing recorded), holding one absolute path to a command that must return at once. When it is set, plan-orchestration's two shell launch recipes (`claude -p` and `codex exec`) run it around the builder: `start` before, `end` after (skipped when `start` wrote no id), and `transcript` as a numbered orchestration step once the transcript or rollout path is known; the builder's exit code still reaches the exit file. The three calls and their arguments are written down in Ordo as its interface. The key appears in every place that lists the optional keys: the plan skill's key list, both example `plan.yaml` files, the state template, the ordo-init skill and the README. The native Claude-agent recipe is unchanged.

## Gate

a test with a stub launch-note command shows the recipes unchanged with the key empty, `start`, `transcript` and `end` run with it set, `end` skipped after a failed `start`, and the builder's exit code in the exit file in every case; `land.test.sh` and `check_config.test.sh` pass with the key; the layout check passes.

## Steps, in execution order

- ✅ 1 `skills/plan-orchestration/templates/launch.sh` and `launch.test.sh`: the script runs the `claude -p` and `codex exec` recipes detached, with the pid and exit files; with `launch_note` empty it runs today's command unchanged; with it set it calls `start` before the builder and `end` after it (skipped when `start` wrote no id), and its `transcript` subcommand passes the transcript or rollout path on; the test, with stub `claude`, `codex` and launch-note commands on `PATH`, shows the command unchanged with the key empty, `start`, `transcript` and `end` run with it set, `end` skipped after a failed `start`, and the builder's exit code in the exit file in every case; the three calls and their arguments written down as Ordo's interface in `skills/plan-orchestration/templates/launch-note.md` (1 commit; the page was written at `docs/launch-note.md` and moved beside the script in step 2)
- ✅ 2 the `launch_note` key in every place that lists the optional keys: `skills/plan/SKILL.md`'s key list, `skills/plan/templates/plan.yaml`, both projects of `plan.projects.yaml`, the `orchestrator-state.md` template, `skills/ordo-init/SKILL.md` and the README; `check_config.py` accepts it, with a test case; `land.test.sh` and `check_config.test.sh` pass with the key set (1 commit)
- ✅ 3 `skills/plan-orchestration/SKILL.md`, "Launching a builder": the two shell recipes call `launch.sh`, the `transcript` call is a numbered orchestration step, and the native Agent-tool recipe stays the default for Claude builders under Claude Code, unchanged; a repair round's resume of a shell builder (Steps, item 8) also runs through `launch.sh`, which gains a `--resume <session id>` option for both harnesses, with `launch.test.sh` cases and the page `templates/launch-note.md` saying a round is a record of its own; the layout check passes and `launch.test.sh` passes (1 commit)
- ✅ 4 `launch.test.sh` joined to `README.md`, `docs/dev/building.md`, `docs/dev/change-standard.md` and the verify list; every check passes (1 commit)
- ✅ 5 the closing: `/roadmap done 2.A` with the gate's output, this folder moved to `.scratch/archive/` (orchestrator, no agent)

## Could run in parallel

Independent of each other; `workers_at_once: 1` serialises them.

- 2 with 1.

## Rulings (2026-09-23)

- The step list above is approved (the user), after the clarification that the native Agent-tool recipe stays the default for Claude builders under Claude Code and only the two shell recipes use `launch.sh`.
- The executor is inline for every step: the orchestrating session writes each step in its worktree, per the user's rule against sub-agents for work that writes files.
- `/refute` runs as a fresh read-only reviewer agent on every step, as in plans 1 and 2.
- The launch-note interface is the one in the oculus session's note: `start --launcher --label --harness --model --parent --cwd --pid` printing an id, `transcript <id> <path>`, `end <id>`; a failed `start` never stops the builder; the skills name no project and no vendor path.
- Nothing is installed into the user's skill folders, no `utils/pin.sh <tag>` is run, and no installed skill is removed or replaced without the user's explicit permission, asked for each time (the user). The pinned copy `~/.local/share/ordo-stable` does not get this change until the user allows a pin.

## Rulings (2026-09-24)

- Step 3's widening to the `--resume` option of `launch.sh`, so that a repair round's resumed builder is recorded by the launch note, is approved (the user).

## Premise corrections

- Step 3 (2026-09-24): a repair round resumes a shell builder as a new detached process (`claude -p --resume`, `codex exec resume`), so without a resume mode that process would run outside `launch.sh` and go unrecorded, against the entry's goal of recording every builder the orchestrator starts as its own process. The step's path list is widened to `launch.sh`, `launch.test.sh` and `launch-note.md`; the interface's three calls do not change, and each round is a record of its own under the same `--label`.

## Blocked, and by what

- none.

### Step 1, the launch script (landed 2026-09-23)

- Landed: `skills/plan-orchestration/templates/launch.sh` (184 lines), `launch.test.sh` (256 lines) and `docs/launch-note.md` (26 lines, moved to `skills/plan-orchestration/templates/launch-note.md` in step 2); `sh skills/plan-orchestration/templates/launch.test.sh` prints `PASS: launch.sh scratch tests`; 29 planted faults each turn it red (`agents/reviews/1-plants.md`).
- `launch.sh` refuses a relative launch-note command and makes a relative id file absolute, since the claude recipe changes directory in the detached shell.
- Reviews: `agents/reviews/1-refuter.md`; the first run's findings closed in repair round 1; the run over the round's findings fixed at landing. Nothing booked.
- Verification on main: eight `PASS:` lines, ten `ok:` lines from the layout check, a clean ASCII check; the launch test passes (it joins the verify list in step 4).
- Usage, orchestrator f11e113 to landing: 40 messages, 56606 output tokens, 903380 cache-write tokens, 34143192 cache-read tokens, 84 fresh input tokens, 111 minutes.
- Reviewer usage: first run 85,757 tokens, 20 tool uses, 295 seconds; run over the round 89,827 tokens, 20 tool uses, 503 seconds.

### Step 2, the launch_note key (landed 2026-09-24)

- Landed: `launch_note: ""` in `skills/plan/templates/plan.yaml`, both projects of `plan.projects.yaml` and the `orchestrator-state.md` template; the key in `skills/plan/SKILL.md`'s key list, `skills/ordo-init/SKILL.md` (the drafting rule and the error list) and the README. `check_config.py` reports a launch-note value that is not an absolute path, names a directory, names no file or names a file that is not executable; `check_config.test.sh` covers each, in both forms.
- The interface page moved from `docs/launch-note.md` to `skills/plan-orchestration/templates/launch-note.md`, beside `launch.sh`, since an installed skill carries its templates and not the repository's `docs/`; ruled by the orchestrator at landing (`agents/reviews/2-refuter.md`, Closed, Spec 1).
- Reviews: `agents/reviews/2-refuter.md`; the first run's findings closed in repair round 1; the run over the round's findings fixed at landing (7 fixes). Nothing booked.
- Verification on main: eight `PASS:` lines, ten `ok:` lines from the layout check, a clean ASCII check; `launch.test.sh` passes; each of six planted faults in `check_config.py` turns `check_config.test.sh` red.
- Usage, orchestrator 5e9ec86 to landing: 30 messages, 26910 output tokens, 87743 cache-write tokens, 20447140 cache-read tokens, 64 fresh input tokens, 18 minutes.
- Reviewer usage: first run 81,975 tokens, 16 tool uses, 222 seconds; run over the round 96,421 tokens, 27 tool uses, 266 seconds.

### Step 3, the launch recipes call launch.sh (landed 2026-09-24)

- Landed: `skills/plan-orchestration/SKILL.md`'s two shell recipes call `templates/launch.sh`; a numbered list for a shell launch (the launch with the dispatch fields of its paths, the builder's identity and session id, the transcript call, the monitor); Steps, item 8 resumes a `claude -p` or Codex worker through `launch.sh --resume`, naming the options a round keeps and the `repair_` fields of its paths. The native Agent-tool recipe is unchanged.
- `launch.sh` gained `--resume <session id>` (claude `-p --resume`; codex `exec resume` inside `--cwd` with `-c sandbox_mode="workspace-write"`), refuses an empty or option-like session id, and removes an exit file an earlier run left before it detaches. `launch-note.md` says a resumed run is a record of its own. The plan skill's `templates/orchestrator-state.md` names which dispatch fields `/spec` writes and which the orchestrator adds (`stderr`, `note_id_file` among them).
- Scope widened to the resume mode by the premise correction above, approved by the user (Rulings, 2026-09-24).
- Reviews: `agents/reviews/3-refuter.md`; the first run's 17 findings closed in repair round 1; the run over the round's 12 findings fixed at landing. Nothing booked.
- Verification on main: eight `PASS:` lines, ten `ok:` lines from the layout check, a clean ASCII check; `launch.test.sh` passes, and 19 planted faults in `launch.sh` each turn it red (`agents/reviews/3-plants.md`).
- Not verified: a real `claude -p --resume` or `codex exec resume` run; the tests use stubs.
- Usage, orchestrator c8d673a to landing: 75 messages, 70812 output tokens, 135046 cache-write tokens, 11540204 cache-read tokens, 158 fresh input tokens, 42 minutes.
- Reviewer usage: first run 124,900 tokens, 31 tool uses, 431 seconds; run over the round 118,199 tokens, 24 tool uses, 380 seconds.

### Step 4, launch.test.sh in the documented checks (landed 2026-09-24)

- Landed: `sh skills/plan-orchestration/templates/launch.test.sh` in `README.md` (with a bullet on what it checks), `docs/dev/building.md` and `docs/dev/change-standard.md`, after `sync_rules.test.sh`, and in this plan's `verify:` block. The three lists name the same nine tests in the same order.
- The step's paths widened to `launch.test.sh`, so that the README's description holds: it checks every usage error of `launch.sh` with its exit code and message, and the empty note for both harnesses.
- Reviews: `agents/reviews/4-refuter.md`; the first run's 5 findings closed in repair round 1; the run over the round's 4 findings fixed at landing. Nothing booked.
- Verification on main: nine `PASS:` lines (the verify list now with `launch.test.sh`), ten `ok:` lines from the layout check, a clean ASCII check; 15 planted faults in `launch.sh` each turn `launch.test.sh` red (`agents/reviews/4-plants.md`).
- The scratchpad's verify script now fails on a test whose last line does not start with `PASS:`, rather than on the filter's exit status.
- Usage, orchestrator 916a144 to landing: 31 messages, 24601 output tokens, 46090 cache-write tokens, 7536057 cache-read tokens, 68 fresh input tokens, 35 minutes.
- Reviewer usage: first run 91,433 tokens, 17 tool uses, 230 seconds; run over the round 95,754 tokens, 25 tool uses, 808 seconds.

### Step 5, the closing (2026-09-24)

- `docs/roadmap.md`: entry 2.A moved to Done with the gate's output: `launch.test.sh`, `land.test.sh` and `check_config.test.sh` each printed their `PASS:` line, and the layout check printed ten `ok:` lines, exit 0.
- This folder moved to `.scratch/archive/2-a-launch-notes-for-builders-run-as-their-own-process/`.
- Not done by this plan: the pinned copy `~/.local/share/ordo-stable` does not carry 2.A until the user allows a pin.

# Plan: 2.A Launch notes for builders run as their own process

Execution ledger for entry 2.A of `docs/roadmap.md`. One bullet is one step of work; this plan's executor is inline, so the orchestrating session builds each step itself in the step's worktree, and bookkeeping steps are marked. A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

An optional `launch_note:` key in the plan configuration, default "" (nothing recorded), holding one absolute path to a command that must return at once. When it is set, plan-orchestration's two shell launch recipes (`claude -p` and `codex exec`) run it around the builder: `start` before, `end` after (skipped when `start` wrote no id), and `transcript` as a numbered orchestration step once the transcript or rollout path is known; the builder's exit code still reaches the exit file. The three calls and their arguments are written down in Ordo as its interface. The key appears in every place that lists the optional keys: the plan skill's key list, both example `plan.yaml` files, the state template, the ordo-init skill and the README. The native Claude-agent recipe is unchanged.

## Gate

a test with a stub launch-note command shows the recipes unchanged with the key empty, `start`, `transcript` and `end` run with it set, `end` skipped after a failed `start`, and the builder's exit code in the exit file in every case; `land.test.sh` and `check_config.test.sh` pass with the key; the layout check passes.

## Steps, in execution order

- 1 `skills/plan-orchestration/templates/launch.sh` and `launch.test.sh`: the script runs the `claude -p` and `codex exec` recipes detached, with the pid and exit files; with `launch_note` empty it runs today's command unchanged; with it set it calls `start` before the builder and `end` after it (skipped when `start` wrote no id), and its `transcript` subcommand passes the transcript or rollout path on; the test, with stub `claude`, `codex` and launch-note commands on `PATH`, shows the command unchanged with the key empty, `start`, `transcript` and `end` run with it set, `end` skipped after a failed `start`, and the builder's exit code in the exit file in every case; the three calls and their arguments written down as Ordo's interface in `docs/launch-note.md` (1 commit)
- 2 the `launch_note` key in every place that lists the optional keys: `skills/plan/SKILL.md`'s key list, `skills/plan/templates/plan.yaml`, both projects of `plan.projects.yaml`, the `orchestrator-state.md` template, `skills/ordo-init/SKILL.md` and the README; `check_config.py` accepts it, with a test case; `land.test.sh` and `check_config.test.sh` pass with the key set (1 commit)
- 3 `skills/plan-orchestration/SKILL.md`, "Launching a builder": the two shell recipes call `launch.sh`, the `transcript` call is a numbered orchestration step, and the native Agent-tool recipe stays the default for Claude builders under Claude Code, unchanged; the layout check passes (1 commit)
- 4 `launch.test.sh` joined to `README.md`, `docs/dev/building.md`, `docs/dev/change-standard.md` and the verify list; every check passes (1 commit)
- 5 the closing: `/roadmap done 2.A` with the gate's output, this folder moved to `.scratch/archive/` (orchestrator, no agent)

## Could run in parallel

Independent of each other; `workers_at_once: 1` serialises them.

- 2 with 1.

## Rulings (2026-09-23)

- The step list above is approved (the user), after the clarification that the native Agent-tool recipe stays the default for Claude builders under Claude Code and only the two shell recipes use `launch.sh`.
- The executor is inline for every step: the orchestrating session writes each step in its worktree, per the user's rule against sub-agents for work that writes files.
- `/refute` runs as a fresh read-only reviewer agent on every step, as in plans 1 and 2.
- The launch-note interface is the one in the oculus session's note: `start --launcher --label --harness --model --parent --cwd --pid` printing an id, `transcript <id> <path>`, `end <id>`; a failed `start` never stops the builder; the skills name no project and no vendor path.
- Nothing is installed into the user's skill folders, no `utils/pin.sh <tag>` is run, and no installed skill is removed or replaced without the user's explicit permission, asked for each time (the user). The pinned copy `~/.local/share/ordo-stable` does not get this change until the user allows a pin.

## Blocked, and by what

- none.

---
name: plan-orchestration
description: "Run a multi-package plan from a ledger folder under .scratch/<feature>/ with agents: pick the next unblocked package, author its brief and check every premise on the tree, dispatch one agent in a git worktree, read the whole diff, run the verification commands, land on main by cherry-pick, book the package, commit by path. Every project specific is read from the ledger folder, so the same skill runs a code tool, a research project, a funding proposal or a manuscript, and the same skill runs on either agent harness (Claude Code or Codex) with either as the worker. Triggers on: run the plan, next package, orchestrate the plan, plan orchestration, dispatch the next package, ledger folder, continue the plan, resume the plan."
metadata:
  version: "1.1.0"
  last_updated: "2026-09-11"
---

# Plan orchestration

A plan of many packages, each one agent dispatch, run from files on disk rather than from what is still in context. The orchestrator reads the ledger, authors briefs, dispatches one agent at a time into a git worktree, reads the whole diff, verifies, lands by cherry-pick, books and commits. This file holds the mechanics; every project specific (the verification commands, the paths, the standards, the executor, the harness and model of the worker) is read from the plan's own ledger folder, so the skill carries no project name and no vendor name and is the same in every repository and under every runner.

## The two tiers, and the harnesses

Two tiers of model take part, and neither tier is tied to one vendor:

- The orchestrator runs on a top-tier model: Claude Fable 5.1 under Claude Code, or GPT 6 Astra under Codex. It reads, decides, authors, lands and books. It never writes package code itself beyond a fix at landing.
- The worker runs on the working tier: Claude Opus 5 under Claude Code, or GPT 5.6 Sol under Codex. One worker per package, in a worktree, under the spec and one brief.

Any combination is allowed: a Fable orchestrator with a Sol worker, an Astra orchestrator with an Opus worker, or both tiers from one vendor. The choice is made per package, not once for the plan: one orchestrator may send one package to Opus and the next to Sol, and a plan may alternate or mix them freely, since every package has the same brief shape, the same worktree, the same checks and the same landing whichever worker built it. The configuration block names the default worker as `harness:model` and a brief may name another for its package; the orchestrator is whatever runner this skill is loaded in. A trial of a new combination is booked in the ledger's Rulings list with what decides it, and its usage row names the harness, so the rows of both workers sit in one table and can be compared.

## The ledger folder

A plan lives under `.scratch/<feature>/` inside the tool or project it belongs to, tracked in git:

- `plan.md`: the packages in execution order, one bullet per package and one agent dispatch, the bookkeeping ones marked. A package is ticked with the green checkmark only after its verification commands ran and the orchestrator read the whole diff; nothing is ticked on inspection. The file also carries a "Could run in parallel" list, a "Rulings" list of the user's decisions with their dates, and a "Blocked, and by what" list.
- `orchestrator-state.md`: the catch-up note, read first after any context compaction and rewritten at every package. It opens with the configuration block below.
- `agents/spec.md`: the standing rules every package runs under, unchanged by any brief. Every convention a package is judged on is written here; a convention that lives only in the tree's existing files is not a rule, since a worker told to read little will not meet it.
- `agents/briefs/<package>.md`: one brief per package, authored before dispatch.
- `agents/reviews/`: a second agent's read of a diff, when the reviewer stage is used, and any diff kept for the record without landing it.

Reading order after any compaction: the state file, then `plan.md`, then the tail of the transcript.

## The configuration block

The top of `orchestrator-state.md` carries the only project specifics the skill consumes. It reads this block and nothing else:

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass.
- <command>
worktree_root: .agents/worktrees   # where a package's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a package's worktree; empty means the whole tree.
standards: []                # files every brief tells the agent to read in full.
executor: agent              # agent | academic-paper | inline.
worker: claude:opus          # harness:model of the worker for executor agent: claude:opus, codex:gpt-5.6-sol, or another working-tier model.
reviewer: none               # none, or harness:model of the optional reviewer stage (step 8 below).
```

## Executors

- `agent`: a general-purpose agent on the configured worker, in a worktree, landed by cherry-pick. This is the executor for a code tool, a research project, and any package whose deliverable is source or data.
- `academic-paper`: the package's brief is a dispatch of the `academic-paper` skill in the mode the brief names. This is the executor for a manuscript, a response to reviewers, grant text, and anything else under the rule that manuscript content is never produced by a raw agent and a `.tex` is never hand-edited. Verification is the PDF build plus whatever else the brief names; landing is the same cherry-pick.
- `inline`: bookkeeping the orchestrator does itself, no agent.

A package may name its own executor or worker in its brief; the block gives the default.

## The workflow, one package at a time

1. Read the state file, then the ledger, then the tail of the transcript.
2. Pick the next package that nothing blocks. One package at a time, whatever the parallel list allows.
3. Author its brief from `agents/spec.md` and the ledger. Every count, path, name and claim in the brief is checked on the tree with a grep or a probe before dispatch; a premise found wrong is corrected in the brief, never left for the agent to hit.
4. Create the worktree yourself, at main's head, never through a runner's own isolation feature: `git worktree add -b <package> <worktree_root>/<package> HEAD`, then from inside the worktree `git sparse-checkout set <worktree_paths>` when the block names any, then the dependency install the project needs. Every git command on a worktree is run from inside it (a `cd` in the command, or the runner's working-directory setting), never as `git -C <path> ...`: a command rule matches a command by its leading words, so the repository's Codex rules forbid the `-C` form outright, and one recipe has to hold under both runners. The folder is a git concept and is the same whichever harness the worker runs in.
5. Dispatch one worker with the worktree path, the spec and the brief, by the recipe under "Launching a worker" for its harness. The prompt carries, in its own words, every requirement the package is judged on (the acceptance list, the tests, the conventions of the spec, the checks), not only a pointer to the files that hold them. The agent never runs a git command and never edits anything in the ledger folder.
6. While it runs, do ledger work only: the next brief, the bookings, the usage table. Never dispatch a second worker, and never redo a package on another harness without the user's word.
7. On the report: read the whole diff. The report is a lead, not a fact.
8. Reviewer stage, when the block names one: dispatch the reviewer with the diff, the brief and the spec, asking for the acceptance items not met, the spec rules broken and the tests missing, as a report into `agents/reviews/<package>.md`; the orchestrator reads it as one more lead before its own read. Its usage goes into the table under its own row.
9. Run the `verify` commands in the worktree.
10. Land it: in the worktree `git add -A && git commit -q -m wip`; on main `git cherry-pick -n <package>`. A conflict is resolved on main by the orchestrator, never by an agent on main.
11. Run the `verify` commands again on main.
12. Book the package in `plan.md`.
13. Commit by explicit path, from `git diff --cached --name-only`, in the user's message shape: a capitalised imperative subject, a blank line, `- Verb ...` bullets, the last bullet the plan booking. No attribution of any kind, and never push. `git status --short` is empty after it.
14. Remove the worktree and its branch. A worktree's branch is a local branch that exists only until this step; a diff kept for the record is saved as a patch file under `agents/reviews/`, never as a branch.
15. The state file is rewritten last, so the next session resumes cold from it.

## Launching a worker

Both harnesses take the same prompt. What differs is the launch, the sandbox, and where the report comes back.

**Claude Code worker (`claude:<model>`).** Dispatch through the runner's Agent tool with `subagent_type: general-purpose` and the model named; run it in the background and wait for its completion notification; its final message is the report. It works under the runner's own permission settings (`.claude/settings.local.json` in the repository), which is where the ask list of git commands lives.

**Codex worker (`codex:<model>`).** Dispatch with `codex exec`, from a shell, detached from the runner's command timeout:

```sh
nohup sh -c 'codex exec -C <worktree>/<tool dir> -s workspace-write \
    -c "sandbox_workspace_write.network_access=true" -m <model> \
    -o <report file> --json - < <prompt file> > <event log> 2> <stderr file>; echo "exit $?" > <exit file>' &
```

- `-C` is the working root; `-s workspace-write` confines writes to it and the system temp directory. The sandbox with the network off also refuses to open a local port, which a test suite with a server, a socket or a watcher needs, so `sandbox_workspace_write.network_access=true` is passed whenever the `verify` commands bind a port; without it `npm test` fails with `listen EPERM` and the failure is the harness's, not the model's.
- The worker's patch tool refuses a path outside the working root; a file that must be written elsewhere (a temporary config file) is written with a shell command, and the prompt says so.
- `-o` writes the worker's final message (the report) to a file; `--json` streams the event log, whose last `turn.completed` event carries the token usage for the usage table. The session is not run with `--ephemeral`: the rollout Codex then writes under `~/.codex/sessions/` is the worker's transcript, kept the way a Claude sub-agent's is, and a sessions tool that reads rollouts can list the worker while it runs. A worker on the other harness is not linked to the orchestrating session in any file, so it appears as a session of its own.
- A runner's shell tool caps a command at ten minutes and a package takes fifteen to forty; the launch is detached with `nohup` and `&`, and a monitor watches the exit file, so nothing is killed mid-package.
- Codex loads `AGENTS.md` from the git root down to the working root, plus the user's `~/.codex/AGENTS.md`; with the working root at the tool's own folder, only the user-level file reaches it. The spec's reading order still holds and the prompt says which files to read.
- Codex project settings live in `<repo>/.codex/config.toml` and its command rules in `<repo>/.codex/rules/*.rules`, read only for a project the user has marked trusted in their own `~/.codex/config.toml`; the orchestrator never edits a user-level file.
- The id passed to `-m` is the user's to name; the CLI does not list models and the event log does not carry the id.

**The prompt**, for either harness, states: the worktree path and that it is the only place to work; the no-git rule (not even `git status` for Codex, whose shell is sandboxed but not read-only); what is never touched (the ledger folder, the reference tree, the user's home folders, the main checkout); the toolchain path; the port and the environment override for the server check; the reading order; the requirements the package is judged on; the report shape.

## Undoing a package

The worktree and the cherry-pick are what make a package undoable: one package is one commit, so undoing a package is `git revert` of that one commit.

## Stops

The turn ends only when nothing unblocked is left. Four things are put to the user, each in one message with one recommendation, and everything else keeps moving:

- a user-visible shape the ledger does not name (a manifest key, a config vocabulary, a wire format, a public interface);
- a premise found wrong that the plan cannot absorb;
- a red check that no fix within the plan covers;
- a contradiction between two established rules or decisions.

A package that fails its bar is reported, with its misses sorted by cause (the orchestrator's configuration, the brief, a rule nobody wrote, the worker), and what happens next is the user's call; the diff is kept as a patch under `agents/reviews/`.

## Reports

From the orchestrator to the user after a package, and from an agent to the orchestrator: anything NOT DONE first, then a DONE / NOT DONE ledger naming the command that proves each row. No narration of wrong turns taken and backed out. No measurement stated that was not taken. Partial work is never presented as complete.

## Usage

Per package, the worker's harness and model, tokens, tool uses or completed items, duration, lines added and removed, and the number of fixes at landing go into a table in the state file, so a change to the process, the harness or the model can be judged by its numbers against the rows before it.

## Adopting it in a repository

The skill carries no project name and no vendor name, and the templates under `templates/` are the whole of what a repository has to fill in: `plan.md`, `orchestrator-state.md`, `spec.md` and `brief.md`, each with `<placeholders>` in angle brackets. A repository adopts the skill by creating `.scratch/<feature>/` from those four templates, filling the configuration block with its own verification commands, worktree root, sparse paths, standards, default executor and worker, and listing its packages. The skill is installed once at the user level of each runner (`~/.claude/skills/plan-orchestration`, `~/.codex/skills/plan-orchestration`) or linked from a repository's `.agents/skills/` into `.claude/skills/` and `.codex/skills/`, so both runners see one copy.

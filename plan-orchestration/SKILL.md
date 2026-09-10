---
name: plan-orchestration
description: "Run a multi-package plan from a ledger folder under .scratch/<feature>/ with agents: pick the next unblocked package, author its brief and check every premise on the tree, dispatch one agent in a git worktree, read the whole diff, run the verification commands, land on main by cherry-pick, book the package, commit by path. Every project specific is read from the ledger folder, so the same skill runs a code tool, a research project, a funding proposal or a manuscript. Triggers on: run the plan, next package, orchestrate the plan, plan orchestration, dispatch the next package, ledger folder, continue the plan, resume the plan."
metadata:
  version: "1.0.0"
  last_updated: "2026-09-10"
---

# Plan orchestration

A plan of many packages, each one agent dispatch, run from files on disk rather than from what is still in context. The orchestrator reads the ledger, authors briefs, dispatches one agent at a time into a git worktree, reads the whole diff, verifies, lands by cherry-pick, books and commits. This file holds the mechanics; every project specific (the verification commands, the paths, the standards, the executor) is read from the plan's own ledger folder, so the skill carries no project name and is the same in every repository.

## The ledger folder

A plan lives under `.scratch/<feature>/` inside the tool or project it belongs to, tracked in git:

- `plan.md`: the packages in execution order, one bullet per package and one agent dispatch, the bookkeeping ones marked. A package is ticked with the green checkmark only after its verification commands ran and the orchestrator read the whole diff; nothing is ticked on inspection. The file also carries a "Could run in parallel" list, a "Rulings" list of the user's decisions with their dates, and a "Blocked, and by what" list.
- `orchestrator-state.md`: the catch-up note, read first after any context compaction and rewritten at every package. It opens with the configuration block below.
- `agents/spec.md`: the standing rules every package runs under, unchanged by any brief.
- `agents/briefs/<package>.md`: one brief per package, authored before dispatch.
- `agents/reviews/`: a second agent's read of a diff, when one is used.

Reading order after any compaction: the state file, then `plan.md`, then the tail of the transcript.

## The configuration block

The top of `orchestrator-state.md` carries the only project specifics the skill consumes. It reads this block and nothing else:

```yaml
verify:            # commands run in the worktree and again on main, in order; all must pass.
- <command>
worktree_paths: [] # sparse-checkout paths for a package's worktree; empty means the whole tree.
standards: []      # files every brief tells the agent to read in full.
executor: agent    # agent | academic-paper | inline.
model: opus        # for executor agent: opus or lower, never fable.
```

## Executors

- `agent`: a general-purpose agent on the configured model, in a worktree, landed by cherry-pick. This is the executor for a code tool, a research project, and any package whose deliverable is source or data.
- `academic-paper`: the package's brief is a dispatch of the `academic-paper` skill in the mode the brief names. This is the executor for a manuscript, a response to reviewers, grant text, and anything else under the rule that manuscript content is never produced by a raw agent and a `.tex` is never hand-edited. Verification is the PDF build plus whatever else the brief names; landing is the same cherry-pick.
- `inline`: bookkeeping the orchestrator does itself with the Write and Edit tools, no agent.

A package may name its own executor in its brief; the block gives the default.

## The workflow, one package at a time

1. Read the state file, then the ledger, then the tail of the transcript.
2. Pick the next package that nothing blocks. One package at a time, whatever the parallel list allows.
3. Author its brief from `agents/spec.md` and the ledger. Every count, path, name and claim in the brief is checked on the tree with a grep or a probe before dispatch; a premise found wrong is corrected in the brief, never left for the agent to hit.
4. Create the worktree yourself, at main's head, never through the Agent tool's own isolation: `git worktree add -b <package> .claude/worktrees/<package> HEAD`, then `git -C .claude/worktrees/<package> sparse-checkout set <worktree_paths>` when the block names any.
5. Dispatch one agent with the worktree path, the spec and the brief. The agent never runs a git command and never edits anything in the ledger folder.
6. While it runs, do ledger work only: the next brief, the bookings, the usage table.
7. On the report: read the whole diff. The report is a lead, not a fact.
8. Run the `verify` commands in the worktree.
9. Land it: in the worktree `git add -A && git commit -q -m wip`; on main `git cherry-pick -n <package>`. A conflict is resolved on main by the orchestrator with the Edit tool, never by an agent on main.
10. Run the `verify` commands again on main.
11. Book the package in `plan.md`.
12. Commit by explicit path, from `git diff --cached --name-only`, in the user's message shape: a capitalised imperative subject, a blank line, `- Verb ...` bullets, the last bullet the plan booking. No attribution of any kind, and never push. `git status --short` is empty after it.
13. Remove the worktree and the branch.
14. The state file is rewritten last, so the next session resumes cold from it.

## Undoing a package

An agent's file changes and any commit are outside the harness rewind command. The worktree and the cherry-pick are what make a package undoable: one package is one commit, so undoing a package is `git revert` of that one commit.

## Stops

The turn ends only when nothing unblocked is left. Four things are put to the user, each in one message with one recommendation, and everything else keeps moving:

- a user-visible shape the ledger does not name (a manifest key, a config vocabulary, a wire format, a public interface);
- a premise found wrong that the plan cannot absorb;
- a red check that no fix within the plan covers;
- a contradiction between two established rules or decisions.

## Reports

From the orchestrator to the user after a package, and from an agent to the orchestrator: anything NOT DONE first, then a DONE / NOT DONE ledger naming the command that proves each row. No narration of wrong turns taken and backed out. No measurement stated that was not taken. Partial work is never presented as complete.

## Usage

Per package, the agent's tokens, tool uses and duration go into a table in the state file, so a change to the process can be judged by its numbers.

## Adopting it in a repository

The skill carries no project name, and the templates under `templates/` are the whole of what a repository has to fill in: `plan.md`, `orchestrator-state.md`, `spec.md` and `brief.md`, each with `<placeholders>` in angle brackets. A repository adopts the skill by creating `.scratch/<feature>/` from those four templates, filling the configuration block with its own verification commands, sparse paths, standards and default executor, and listing its packages; installing the skill at `~/.claude/skills/plan-orchestration` makes it available in every repository without a copy per tree.

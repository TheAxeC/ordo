# Ordo

Ordo is a set of agent skills for running a multi-step change as a plan: one roadmap entry becomes a ledger folder, each step is briefed, built in its own git worktree, reviewed by a fresh reviewer that changes nothing, and cherry-picked onto `main` only after its checks pass there. The skills carry no project name and no path. Everything specific to a repository comes from that repository's `.agents/plan.yaml`, so the same skills run a C++ engine, a TypeScript tool or a research project, under Claude Code or Codex, with either as the worker.

## The skills

| Skill | What it does |
|---|---|
| `plan` | Opens a plan for one roadmap entry: the ledger folder, `plan.md` with a drafted step list for approval, `orchestrator-state.md` |
| `spec` | Prepares one step: checks the step's premises against the tree, writes the brief, creates the worktree, stages the base binaries |
| `refute` | Reviews a built step without changing it: reruns every check and every command the builder's report quotes, writes findings |
| `land` | Cherry-picks a reviewed step onto `main`, runs the checks there, books the step, commits by explicit path, removes the worktree |
| `plan-orchestration` | Runs an open plan unattended, step by step, and stops only where a decision belongs to the user |
| `plan-help` | Prints the command sequence, and for a named plan its position and the command that comes next |

The sequence for one step, as `/plan-help` prints it:

```
/plan <entry>                 once: opens the plan, shows the step list for approval
/spec <entry> <step>          writes the brief, makes the worktree, stages the base binaries
"build it"                    the session writes the code in the worktree, runs the checks, writes the report
/refute <entry> <step>        a fresh reviewer reads the diff and reruns the checks, writes findings
"close them"                  a repair round, up to repair_rounds times
/land <entry> <step>          onto main, checks on main, the booking, the commit
```

## Requirements

- git, POSIX `sh` and `python3`.
- `node` on `PATH`, for `land/templates/land.sh` (its index-lock wait and the usage rows).
- Claude Code, Codex, or both.

## Install

Clone the repository and link each skill into the user-level skill folders, so every repository on the machine sees one copy. Claude Code reads `~/.claude/skills` (or `$CLAUDE_CONFIG_DIR/skills` for a second account); Codex reads `~/.agents/skills`.

```sh
git clone <this repository> ~/workspace/ordo
for dir in ~/.claude/skills ~/.agents/skills; do
    mkdir -p "$dir"
    for skill in land plan plan-help plan-orchestration refute spec; do
        ln -sfn ~/workspace/ordo/$skill "$dir/$skill"
    done
done
```

For a second Claude Code account, repeat the inner loop with that account's `$CLAUDE_CONFIG_DIR/skills`. Remove any copy of these skills under a repository's `.agents/skills` or `.claude/skills`, so that the linked copy is the only one loaded. Updating is `git pull` in `~/workspace/ordo`; the links need no change.

## Configuring a repository

A repository opts in with `.agents/plan.yaml` at its root. Paths are relative to the repository root.

```yaml
roadmap: docs/roadmap.md                  # the source of truth for what is open; a plan is one entry of it
verification: docs/dev/building.md        # the page that defines the green check; /plan copies its commands into the ledger
rules: docs/dev/change-standard.md        # how a change is made; every brief points here first
standards:                                # further standards the reviewer holds a diff to
  - docs/dev/coding-standards.md
ledger_root: .scratch                     # a plan lives in <ledger_root>/<slug>/
archive_root: .scratch/archive            # where a closed plan's folder moves
worktree_root: .agents/worktrees          # gitignored; one worktree per step
worktree_paths: []                        # sparse-checkout paths for a step's worktree; empty means the whole tree
worker: claude:opus                       # harness:model of the builder, e.g. codex:gpt-5.6-sol
worker_effort: high
reviewer: claude:opus                     # harness:model of the refuter
review: every                             # every, or earned (plan-orchestration, "The review, earned")
refute_after_repair: yes                  # yes: /refute runs again over each repair round
repair_rounds: 1                          # the most repair rounds a step gets
review_minutes: 0                         # the reviewer's time box in minutes; 0 is none
look: ""                                  # where a changed view is opened at landing; empty means no look step
workers_at_once: 1                        # steps built at once (plan-orchestration, "Two steps in flight")
bench: []                                 # binaries /spec stages and /land runs interleaved, base against new
```

A repository that holds several projects lists each under `projects:` with the same keys, and a plan is then named `<project>/<entry>`.

Add `.agents/worktrees/` (or whatever `worktree_root` names) to `.gitignore`.

## The landing script

`land/templates/land.sh` does the cherry-pick, the checks on `main` and the booking data as one command. A plan copies it into its ledger folder and makes the three `ADAPT` edits: `landing_tool_path` (the directory a step's changes are scoped to), the dependency install and verify commands with their pass rules, and the harness and model names in the usage rows. Copy `land.test.sh` beside it; it reads `landing_tool_path` from `land.sh` and proves the landing on scratch repositories.

```sh
sh land/templates/land.test.sh
```

`land.sh` finds `usage.py` beside itself, then in the land skill's `templates/` under the repository's `.agents/skills`, `~/.agents/skills` or `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`).

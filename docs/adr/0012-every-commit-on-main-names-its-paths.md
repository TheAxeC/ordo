# 0012. Every commit on main names its paths

Status: proposed

## Context

The plan skills stage named paths with `git add -- <path> ...` and then commit the whole index (`skills/plan-orchestration/SKILL.md`, Steps 4; `skills/land/SKILL.md`, Steps 12). `/land` stages a step on main with `git cherry-pick -n` and runs the verify list before its commit. A scratch run showed that a commit made in that window by `git add -- <path>` and a bare `git commit` also records the staged step, and that `git commit -- <path>` records only the path named. With several plans in one session (roadmap entry 2.I), another plan's commit can fall in that window.

## Decision

Every commit a skill makes on main names its paths in the commit command, `git commit -m <message> -- <path> ...`. The landing commit takes its paths from `git diff --cached --name-only`. A landing runs from its cherry-pick to its commit before the session makes any other commit or starts any other skill.

## Alternatives rejected

- The order rule alone: a commit made out of order still records the staged landing, with nothing to stop it.
- The pathspec commits alone: `/spec` of another plan, started while a landing is staged, refuses on its "nothing staged" preflight.

## Consequences

A commit records only what it names, whatever another skill has staged. Every skill text that makes a commit names the command form.

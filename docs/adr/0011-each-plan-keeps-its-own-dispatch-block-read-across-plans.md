# 0011. Each plan keeps its own dispatch block, read across plans

Status: proposed

## Context

Roadmap entry 2.I has one session run every open plan, with one limit on steps in flight, a path comparison across plans and one landing at a time. Each plan's state file holds the dispatch block of its own steps in flight (`skills/plan/templates/orchestrator-state.md`), and the ledger is the whole handoff of a plan (`skills/plan-orchestration/SKILL.md`, "Resuming, and handing the plan over").

## Decision

Each plan keeps its own dispatch block in its own state file. The skills read the dispatch blocks of every open plan to count the steps in flight against the one limit, to compare a brief's paths with the steps in flight, and to resume.

## Alternatives rejected

- One session file at the ledger root listing every step in flight: a second record of each dispatch entry, which drifts from the plan's own, and a file that belongs to no plan when a plan is archived.

## Consequences

A plan's ledger stays its whole handoff. Each count and each comparison reads the state file of every open plan. A plan archived leaves no record behind in a shared file.

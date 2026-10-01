# Plan: <roadmap entry number and title>

Execution ledger for <the roadmap entry, linked>. One bullet is one step of work and one dispatch of its executor (a builder agent by default), except the bookkeeping steps the orchestrator does itself (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

<the roadmap entry's text, verbatim>

## Gate

<the roadmap entry's completeness contract: what must hold, and the command or check that proves each part>

- The gate: could this pass without the goal being reached? <no or yes>, <the reason>
- Step <1>: could this pass without the goal being reached? <no>, <the reason, for the part of the goal the step delivers>

## Steps, in execution order

- <1> <what the step delivers, in one line; the check that proves it> (<n> commit) (approved)
- <2> <what the step delivers, in one line; the check that proves it> (<n> commit; orchestrator, no agent) (approved)
- <2a> <a step a ruling of the user added after the approval, in one line; the check that proves it> (<n> commit) (ruling <L>)
- <last> the closing: the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless the configuration block allows more.

- <1> with anything after <0>.

## Rulings (<date>)

- Open item <L> (<date>): <the user's decision in one line, and what it unblocks> (the user).

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent stopped for another model, and `/plan` copies the bullets of a rulings file.

- <agent id>: <role, such as builder of step <n>>, <served model>
- <agent id>: grill lookup, <served model>

## Blocked, and by what

- <3>: <what it waits for, and whether that is a decision the user owes or a moment that has not come>.

# Plan: <roadmap entry number and title>

Execution ledger for <the roadmap entry, linked>. One bullet is one step of work and one agent dispatch, except the bookkeeping steps the orchestrator does itself (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

<the roadmap entry's text, verbatim>

## Gate

<the roadmap entry's completeness contract: what must hold, and the command or check that proves each part>

## Steps, in execution order

- <1> <what the step delivers, in one line; the check that proves it> (<n> commit)
- <2> <what the step delivers, in one line; the check that proves it> (<n> commit; orchestrator, no agent)
- <last> the closing: the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless the configuration block allows more.

- <1> with anything after <0>.

## Rulings (<date>)

- <the user's decision in one line, and what it unblocks>.

## Blocked, and by what

- <3>: <what it waits for, and whether that is a decision the user owes or a moment that has not come>.

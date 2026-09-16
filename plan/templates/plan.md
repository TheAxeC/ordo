# Plan: <feature>

Execution ledger for <the design document or the goal this plan serves>. One bullet is one package of work and one agent dispatch, except the bookkeeping packages the orchestrator does itself (marked). A package is ticked only after its verification commands ran and the orchestrator read the whole diff; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Packages, in execution order
- <P1> <what the package delivers, in one line> (<n> commit)
- <P2> <what the package delivers, in one line> (<n> commit; orchestrator, no agent)

## Could run in parallel
Independent of each other; the standing rule of one agent at a time still serialises them.
- <P1> with anything after <P0>.

## Rulings (<date>)
- <the user's decision in one line, and what it unblocks>.

## Blocked, and by what
- <P3>: <what it waits for, and whether that is a decision the user owes or a moment that has not come>.

# Plan: 4.A ordo-help skills

Execution ledger for roadmap entry 4.A in `docs/roadmap.md`. One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

`/ordo-help skills` prints, for every skill in the `skills/` folder that holds `ordo-help` itself, the skill's name and its Quick start block copied from its `SKILL.md`, so every mode of every Ordo skill is listed by one command. `skills` is read as this command before `<entry>` is matched against the roadmap.

## Gate

`/ordo-help skills`, run once through the Skill tool on main, prints one block per folder of `skills/` that holds a `SKILL.md`, as many blocks as `ls skills/*/SKILL.md | wc -l` counts, and `diff` of each printed block against the Quick start block of that skill's `SKILL.md` prints nothing; `skills/ordo-help/SKILL.md` is read against `docs/dev/skill-layout.md`, its version raised by the minor part.

- The gate: could this pass without the goal being reached? No, since the number of blocks must equal the number of `SKILL.md` files `ls skills/*/SKILL.md | wc -l` counts and each block must equal its file's Quick start block, so a skill left out or a block changed fails it.
- Step 1: could this pass without the goal being reached? Yes, since its check is a reading of the text: a skill text that reads right can still print a block wrongly or miss a skill. Step 2's run closes that, since the Skill tool loads the installed skill and the builder cannot install it.
- Step 2: could this pass without the goal being reached? No, since it is the gate's run on the installed skill, with the count and the diff of every block.

## Steps, in execution order

- 1 `/ordo-help skills` in `skills/ordo-help/SKILL.md`: the Quick start line, the description's trigger phrase, the input read (the `skills/` folder that holds `ordo-help` itself, its own folder's real path followed through the link), a Steps subsection that prints the name and the Quick start block of every skill there, `skills` read before `<entry>` is matched, the version raised by the minor part, and the `ordo-help` row of `README.md`; the review reads the skill against `docs/dev/skill-layout.md` and the diff against the goal (1 commit) (approved)
- 2 The gate's run: a release-candidate tag of main with step 1, pinned with `utils/pin.sh <tag>` only after you allow it, `/ordo-help skills` run once through the Skill tool on main, its blocks counted against `ls skills/*/SKILL.md | wc -l` and each compared with `diff` against the Quick start block of its `SKILL.md` (1 commit; orchestrator, no agent) (approved)
- 3 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless `.agents/plan.yaml`'s `workers_at_once` allows more.

- None: step 2 runs the skill step 1 changes.

## Rulings (2026-10-19)

- D1 How each skill is printed by `/ordo-help skills` (2026-10-19): (a), a line `/<name>`, then its Quick start block exactly as its `SKILL.md` has it, the skills in folder-name order; no option was the lazy one (the user).
- D2 Whether `/ordo-help skills` also prints the sequence and the choices awaiting review (2026-10-19): (a), no, only the blocks; no option was the lazy one (the user).

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent in no role the cost script prices, which has a numbered item under the heading "Agents in no role the cost script prices:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, the orchestrator writes a brief-check agent it stopped under "The review of a choice", the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.

## Blocked, and by what

- 2: the pin of step 1's tag, which waits for your permission.

# 0022. A paper run is done by five agent roles, and the integrity and ethics checks belong to researcher

Status: proposed

## Context

ADR 0019 gave a `paper` run the nine agent roles of academic-paper and the integrity verification agent, and placed the integrity check and the ethics check inside full, revision and lit-review mode. academic-paper names no integrity agent among its phases (`research-hub/.agents/skills/academic-paper/SKILL.md:119-128`). academic-pipeline runs its integrity check at stage 2.5 and stage 4.5, after academic-paper's writing stage (`research-hub/.agents/skills/academic-pipeline/SKILL.md:103-111`), and limits academic-paper's review loop to 1 round when it runs it (`academic-paper/references/workflow_phase_details.md:116`). With the checks inside `paper`, full mode ran the integrity check twice, each with up to 3 correction passes (`skills/paper/SKILL.md`, full items 11 and 13), so the draft writer got up to 9 passes driven by other agents' issues against academic-paper's 2. A `paper` revision run stopped seven times, three of them for questions that only the in-loop claim check and its fetching raise (plan 5's ledger, the run's turns 2, 4 and 5). Roadmap entry 13, `researcher`, is the counterpart of academic-pipeline.

## Decision

`paper` is the counterpart of academic-paper, and its runs hold no integrity check and no ethics check. A full run is done by five roles, each a fresh agent started through the Agent tool with its own page under `skills/paper/references/`, run as `ordo-<reviewer_effort>` on the model the configuration's `reviewer` names: the literature strategist, only when no `.bib` is held; a planner, which writes the outline and the argument map; the draft writer, which writes the body, the abstract and the statements; the visualization agent, in parallel with the draft writer; and the peer reviewer, which gives the draft review. The citation compliance agent runs only in citation-check mode. After the draft the session runs `lookup.py cite-keys` and `check-urls` and gives their output to draft review round 1. Intake is the session's interview with the user. The integrity check, of the references, of the claims against each source's full text, of the numbers against the saved runs and of the figures against their traces, and the ethics check belong to `researcher`, which runs each once on the finished draft and once after its revision.

## Alternatives rejected

- The checks kept inside every run, as ADR 0019 had them: every run pays for checks that matter at submission, the writer gets their correction passes inside its loop, and `researcher` would later run its own integrity stages on top of the two in `paper`.
- The checks kept in `paper` behind an opt-in argument: a new argument, and the checks stay inside the writing loop whenever they run.
- The structure architect and the argument builder kept as two agents: the argument builder reads the outline second-hand and both go to the same stop.
- The nine roles of ADR 0019: the citation compliance and abstract agents add a handoff and a patch each for work the scripts and the draft writer already cover.

## Consequences

A full run starts at most five roles and makes at most three writer passes driven by other agents' issues. No full, revision or lit-review run checks claims against their sources until `researcher` exists; citation-check mode does, as ADR 0024 says. `references/integrity-verification.md` and `references/ethics.md` leave `skills/paper/`, and the coverage rows they held are marked `rebuild: researcher` with the commit that holds them. The later writing skills (`paper-review`, `rebuttal`, `grant`) have this record to follow or supersede.

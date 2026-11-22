# 0022. A paper run is done by five agent roles, and the integrity and ethics checks belong to researcher

Status: superseded by 0025

## Context

ADR 0019 gave a `paper` run the nine agent roles of academic-paper and the integrity verification agent, and placed the integrity check and the ethics check inside full, revision and lit-review mode. academic-paper names no integrity agent among its phases (`research-hub/.agents/skills/academic-paper/SKILL.md:119-128`). academic-pipeline runs its integrity check at stage 2.5 and stage 4.5, after academic-paper's writing stage (`research-hub/.agents/skills/academic-pipeline/SKILL.md:103-111`), and limits academic-paper's review loop to 1 round when it runs it (`academic-paper/references/workflow_phase_details.md:116`). With the checks inside `paper`, full mode ran the integrity check twice, each with up to 3 correction passes (`skills/academic/paper/SKILL.md`, full items 11 and 13), so the draft writer got up to 9 passes driven by other agents' issues against academic-paper's 2. A `paper` revision run ended five of its first six turns waiting on the user, two of them at stops its mode lists; of the other three, turn 2 asked whether the user's "no downloads" covered the fetching of the cited sources that the in-loop claim check needs, turn 4 asked to compute numbers from the saved results so that each number could be traced to a file, and how to change figures the mode has no visualization agent for, and turn 5 asked to run an edited figure script with a visualization agent and to add references the mode has no literature role to find (plan 5's ledger, `agents/reviews/3-blind-comparison.md`). Roadmap entry 13, `researcher`, is the counterpart of academic-pipeline.

## Decision

`paper` is the counterpart of academic-paper, and its runs hold no integrity check and no ethics check. A full run is done by five roles, each a fresh agent started through the Agent tool with its own page under `skills/academic/paper/agents/`, run as `ordo-<reviewer_effort>` on the model the configuration's `reviewer` names: the literature strategist, only when no `.bib` is held; a planner, which writes the outline and the argument map; the draft writer, which writes the body, the abstract and the statements; the visualization agent, in parallel with the draft writer; and the peer reviewer, which gives the draft review. The citation compliance agent runs only in citation-check mode. After the draft the session runs `lookup.py cite-keys` and `check-urls` and gives their output to draft review round 1. Intake is the session's interview with the user. The integrity check, of the references, of the claims against each source's full text, of the numbers against the saved runs and of the figures against their traces, and the ethics check belong to `researcher`, which runs each once on the finished draft and once after its revision.

## Alternatives rejected

- The checks kept inside every run, as ADR 0019 had them: every run pays for checks that matter at submission, the writer gets their correction passes inside its loop, and `researcher` would later run its own integrity stages on top of the two in `paper`.
- The checks kept in `paper` behind an opt-in argument: a new argument, and the checks stay inside the writing loop whenever they run.
- The structure architect and the argument builder kept as two agents: the argument builder reads the outline second-hand and both go to the same stop.
- The nine roles of ADR 0019: the citation compliance and abstract agents add a handoff and a patch each for work the scripts and the draft writer already cover.

## Consequences

A full run starts at most five roles and makes at most three writer passes driven by other agents' issues. No full, revision or lit-review run checks claims against their sources until `researcher` exists; citation-check mode does, as ADR 0024 says. `references/integrity-verification.md` and `references/ethics.md` leave `skills/academic/paper/`, and `researcher` takes what they held. The later writing skills (`paper-review`, `rebuttal`, `grant`) have this record to follow or supersede.

# Plan: 6. paper-review

Execution ledger for roadmap entry 6, paper-review (`docs/roadmap.md`). One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

The internal review skill, a copy of academic-paper-reviewer (`research-hub/.agents/skills/academic-paper-reviewer/`): its `SKILL.md` and every file of its `agents/`, `references/`, `templates/` and `examples/`, with its seven agents and its six modes (full, re-review, quick, methodology-focus, guided and calibration) as the source has them. It is copied as `paper` was copied from academic-paper, with the same edits and no others (ADR 0043, Decision 1): this repository's names, the character set and the no-history rule, the Chinese-language text left out with the English kept, and a sentence on a skill or a mechanism that does not exist left out. Nothing else the source has is cut, moved or replaced, and no file of another skill is added.

## Gate

a fresh agent reads `diff -r` of the skill's folder against `research-hub/.agents/skills/academic-paper-reviewer/` once and lists each difference with which of those edits it is, or none; you read that list; the verify list of `docs/dev/building.md` passes on main.

- The gate: could this pass without the goal being reached? no, the fresh agent lists every difference `diff -r` prints against the source, and a difference that is none of the four edits is listed as none and read by the user.
- Step 1: could this pass without the goal being reached? no, each copied page is read against its source by `diff`, so a page cut, moved or changed beyond the four edits shows as a difference.
- Step 2: could this pass without the goal being reached? no, the reviewer reads the source's `SKILL.md` and the new one and checks that every section's words are carried, and reads each page that lists the skills.
- Step 3: could this pass without the goal being reached? no, it is the gate's reading, made on the folder as it stands on main after steps 1 and 2.

## Steps, in execution order

- 1 the pages: each file of `research-hub/.agents/skills/academic-paper-reviewer/` under `agents/`, `references/`, `templates/` and `examples/`, except `references/changelog.md`, copied into `skills/academic/paper-review/` under its own folder and name, with the edits of ADR 0043, Decision 1, and no others; `diff` of each page against its source shows only those edits, and the character-set check of `docs/dev/building.md` prints nothing for the folder (1 commit) (approved)
- 2 `SKILL.md` and the places that list the skills: the source's `SKILL.md` carried section by section, with its words, into the layout of `docs/dev/skill-layout.md` as `skills/academic/paper-review/SKILL.md`, with the three things the source does not state taken as `paper` has them (ruling The three things the source does not state); the README's row and its count of skills, `paper`'s Use instead row, the glossary's entry "panel review" and the skill's figure; the reviewer reads the source's `SKILL.md` against the new one, and the verify list of `docs/dev/building.md` passes on main (1 commit) (approved) (ruling 2-contracts) (ruling 2-questions) (ruling 2-call)
- 3 the gate's reading: a fresh agent reads `diff -r` of `skills/academic/paper-review/` against `research-hub/.agents/skills/academic-paper-reviewer/` once and writes `agents/reviews/3-diff-reading.md`, which lists each difference with which edit of ADR 0043, Decision 1, it is, or none; the user reads that list (0 commit) (approved)
- 4 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless `plan.yaml`'s `workers_at_once` allows more.

- 1 with 2: they write different files, and the page names `SKILL.md` refers to are the source's own (ruling Steps 1 and 2 in parallel).

## Rulings (2026-11-22)

- The step list (2026-11-22): approved as drafted, four steps, with the gate's reading as a step of its own after steps 1 and 2 (the user).
- Steps 1 and 2 in parallel (2026-11-22): steps 1 and 2 run in parallel (the user).
- A copy and nothing else (2026-11-22): `paper-review` is academic-paper-reviewer copied as `paper` was copied, with the edits of ADR 0043, Decision 1, and no others; no option that cuts, moves or replaces anything the source has is offered or taken, and no file of another skill is added (the user).
- The three things the source does not state (2026-11-22): each of the seven roles runs as its own agent, the reports are saved in a run folder beside the manuscript, and a reviewer's second call, after its scoring plan, goes to the same agent, each as `paper` has it; shown with the drafted step list, which the user approved (the user).
- No calibration script (2026-11-22): the source has no script for the calibration numbers, and none is added; shown with the drafted step list, which the user approved (the user).
- Open item 2-contracts (2026-11-22): the two scoring contracts the source's two-call protocol names, `shared/contracts/reviewer/full.json` and `methodology_focus.json`, which its folder does not hold, are taken from the source's upstream repository at the source's version (contract ids `reviewer/reviewer_full/v1` and `reviewer/reviewer_methodology_focus/v1`) and written into `SKILL.md`, which unblocks step 2 (self-rule).
- Open item 2-questions (2026-11-22): the three contribution questions of Phase 2.5 step 3, which the source reads from deep-research's page, are written into the step with their text, which unblocks step 2 (self-rule).
- Open item 2-call (2026-11-22): the skill is called as `/paper-review <mode> <manuscript>`, the source's six mode names under it and `full` when no mode is named, with the source's plain requests kept as triggers, as `paper` is called, which unblocks step 2 (self-rule).

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent the plan leaves unpriced, which has a numbered item under the heading "Agents the cost script leaves unpriced:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, the orchestrator writes a brief-check agent it stopped under "The review of a choice", the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.

## Blocked, and by what

- 3: waits for steps 1 and 2 on main.

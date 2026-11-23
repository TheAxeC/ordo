# Plan: 18. wait-what and wizard

Execution ledger for roadmap entry 18, wait-what and wizard (`docs/roadmap.md`). One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

A `wait-what` skill you type when a message did not land: the message explained again in simple English with the context it left out, using the glossary's terms. A `wizard` skill that writes a script walking a person through the steps only a person can do (open a dashboard, copy a key, paste it), writing each value to `.env`, a GitHub secret or a GitHub variable, asking before each irreversible action and never printing a secret.

## Gate

`wait-what` runs on three real messages you name as not landed, each re-explanation read by you and judged clear; one real run of `wizard` for a project's manual setup you name, the script run by you, reviewed by you.

- The gate: could this pass without the goal being reached? no, each skill runs on real input the user names and the user judges each output; it is checked once, on the finished skills.
- Step 1: could this pass without the goal being reached? no, a reviewer reads the text of both skills against their sources and ADR 0045, and the template's library line by line against the source; whether a re-explanation is clear and whether a script works is step 2's.
- Step 2: could this pass without the goal being reached? no, it is the gate's run on the finished skills, judged by the user.

## Steps, in execution order

- 1 the two skills: `skills/ordo/wait-what/` with its `SKILL.md` in the skill layout, the source's one-sentence instruction and `disable-model-invocation: true`; `skills/code/wizard/` with its `SKILL.md` in the skill layout and the source's four steps, and `templates/template.sh`, the source's library in ASCII; `docs/dev/skill-layout.md`, "Frontmatter", with `disable-model-invocation` as an optional key; both skills listed where the skills are listed (`README.md`, `docs/dev/scripts.md` for the template, the install and pin text); `bash -n skills/code/wizard/templates/template.sh` exits 0, the ASCII check prints nothing, and a reviewer reads both skills against ADR 0045 and the two source files, and the library line by line against the source for any change beyond printed symbols (1 commit) (approved)
- 2 the gate's runs, on a release candidate tagged and pinned: `wait-what` typed by the user in the user's own sessions on three real messages that did not land, each re-explanation read by the user and judged clear; one run of `wizard` for a project's manual setup the user names, made by a separate agent that invokes the installed skill, the user confirming the stage list, running the script and reviewing it (orchestrator, no agent) (approved)
- 3 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless `plan.yaml`'s `workers_at_once` allows more.

- none: step 2 needs step 1 landed and pinned.

## Rulings (2026-11-23)

- D1 (2026-11-23). Goal part, wait-what: kept as the entry writes it (the user).
- D2 (2026-11-23). Goal part, wizard: changed to name all three destinations, "writing each value to `.env`, a GitHub secret or a GitHub variable" (the user).
- D3 (2026-11-23). Gate part, wait-what: kept as the entry writes it (the user).
- D4 (2026-11-23). Gate part, wizard: kept as the entry writes it (the user).
- D6 (2026-11-23). Who may invoke wait-what: only the user, by typing it; its frontmatter holds `disable-model-invocation: true`, and `docs/dev/skill-layout.md`, "Frontmatter", gains that key as optional (the user).
- D7 (2026-11-23). Who may invoke wizard: the user and the model; the script is written to a scratch path and committed only on the user's word (the user).
- D8 (2026-11-23). Group folders: `wait-what` in `skills/ordo`, `wizard` in `skills/code` (the user).
- D9 (2026-11-23). The wizard template gets no test: "I dont think a test is necessary?" (the user).
- D10 (2026-11-23). Both skills are copies of their sources, mattpocock/skills `skills/productivity/wait-what` and `skills/engineering/wizard`, with only the differences this repository forces: the sections and frontmatter of `docs/dev/skill-layout.md`, the glossary found at the path the plan configuration lists, `template.sh` in ASCII and listed on `docs/dev/scripts.md`, no `agents/openai.yaml`, and the prose standard applied to the skill text. This answers D5 (the user).
- D11 (2026-11-23). The roadmap diff of D2 is written as shown: entry 18's goal reads "writing each value to `.env`, a GitHub secret or a GitHub variable" (the user).
- D12 (2026-11-23). D10 is recorded as an ADR, `docs/adr/0045-wait-what-and-wizard-are-copies-of-their-sources-with-the-differences-this-repository-forces.md`, status proposed (the user).
- The step list (2026-11-23): both skills are built in one step, "one step" (the user).
- The gate's runs (2026-11-23): `wait-what` is typed by the user in the user's own sessions, the next three times a message does not land, and the user gives the verdict for each; the `wizard` run is made by a separate agent that invokes the installed skill on the project the user names, the orchestrating session answering its stops except the stage list, which the user confirms, and the user runs the script: "(a)" (the user).

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent the plan leaves unpriced, which has a numbered item under the heading "Agents the cost script leaves unpriced:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, the orchestrator writes a brief-check agent it stopped under "The review of a choice", the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.

- a84939439ef3b0753: grill lookup, claude-fable-5-2

## Blocked, and by what

- 2: waits for step 1 landed, a release candidate tagged and pinned on the user's word, and for three messages that do not land in the user's sessions.

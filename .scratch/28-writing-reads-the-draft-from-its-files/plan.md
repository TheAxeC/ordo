# Plan: 28. writing reads the draft from its files

Execution ledger for roadmap entry 28 of `docs/roadmap.md`. One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

`/writing` gives each of its four agents the paths of the draft's files in place of their text, and each agent reads every file of the draft whole itself, so the session no longer copies the whole draft into four prompts. The paragraphs `docx_paragraphs.py` prints for a `.docx` and the output of `prose_facts.py` are written to a temporary folder that the agents read from and that is deleted after the report is shown.

## Gate

The user reads the diff of `skills/academic/writing/` and approves it, having found in it that the prompts of "Agent prompts" give the paths of the draft's files and of the files in the temporary folder in place of their text, that every agent is told to read each of those files whole and no other file, that no agent prompt still holds the draft's text or the output of either script, and that the steps make the temporary folder before the first agent starts and delete it after the report is shown; each command of the verify list in `docs/dev/building.md`, run as written, exits 0.

- The gate: could this pass without the goal being reached? No, the user reads the diff for each of the four parts of the goal by name, and a skill text that still pasted the draft or the scripts' output into a prompt, or left the folder in place, fails one of them.
- Step 1: could this pass without the goal being reached? No, the reviewer quotes the lines of the diff that hold each of the four parts, and the grep finds any sentence left that tells an agent to read no file or gives it the draft's text as `cat -n` prints it.
- Step 2: could this pass without the goal being reached? No, it is the gate's own reading, made by the user on the landed text.

## Steps, in execution order

- 1 `/writing` reads the draft from its files: in `skills/academic/writing/SKILL.md` the session makes the temporary folder with `mktemp -d` once the draft's file list is known and before the scripts run, writes the output of `prose_facts.py` and, for a `.docx`, of `docx_paragraphs.py` to files in it, and gives each of the four agents the absolute paths of the draft's files, of the paragraphs file for a `.docx`, and of the facts file in place of their text; every agent is told to read each of those files whole and no other file; the folder is removed after the report is shown, and on every refusal raised after it was made; "What it reads", Steps, "Agent prompts", the agents' bullets, Stops, Anti-patterns, Rules and the description say the same; `metadata.version` goes to 2.3.0; ADR 0061 records the decision, ADR 0013's status names the part 0061 supersedes, and `docs/adr/README.md` lists 0061; `docs/figures/gen_figures.py` and `docs/figures/academic/writing.svg` change only if a label or the note of `writing()` no longer holds. Check: the reviewer quotes, for each of the four parts of the gate, the lines of the diff that hold it; `grep -n -e 'read no file' -e 'cat -n' skills/academic/writing/SKILL.md` prints nothing; `python3 docs/figures/gen_figures.py` exits 0 and `git status --short docs/figures` prints nothing after it; the verify list exits 0 (1 commit) (approved)
- 2 the gate's reading: the user reads the diff of `skills/academic/writing/` and of ADR 0061 on main and approves it, or names what to change, which goes back to step 1 as a repair round. Check: the user's approval stands in this file's Rulings (orchestrator, no agent) (approved)
- 3 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless `plan.yaml`'s `workers_at_once` allows more.

- None: step 2 reads what step 1 lands, and step 3 closes after both.

## Rulings (2026-11-27)

- Open item A (2026-11-27): the paragraphs `docx_paragraphs.py` prints and the output of `prose_facts.py` go to a temporary folder that the agents read from and that is deleted after the report is shown, in place of a run folder that is kept (the user).
- Open item B (2026-11-27): the gate makes no run of `/writing`; it is the user's reading of the diff of `skills/academic/writing/` and the verify list (the user).

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent the plan leaves unpriced, which has a numbered item under the heading "Agents the cost script leaves unpriced:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, the orchestrator writes a brief-check agent it stopped under "The review of a choice", the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.

## Blocked, and by what

- 2: the landing of step 1.

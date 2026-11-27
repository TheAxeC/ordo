# Plan: 28. writing reads the draft from its files

Execution ledger for roadmap entry 28 of `docs/roadmap.md`. One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

`/writing` gives each of its four agents the paths of the draft's files in place of their text, and each agent reads every file of the draft whole itself, so the session no longer copies the whole draft into four prompts. The paragraphs `docx_paragraphs.py` prints for a `.docx` and the output of `prose_facts.py` are written to a temporary folder that the agents read from and that is deleted once the last agent has ended and before the report is shown.

## Gate

The user reads the diff of `skills/academic/writing/` and approves it, having found in it that the prompts of "Agent prompts" give the paths of the draft's files and of the files in the temporary folder in place of their text, that every agent is told to read each of those files whole and no other file, that no agent prompt still holds the draft's text or the output of either script, and that the steps make the temporary folder before the first agent starts and delete it once the last agent has ended and before the report is shown; each command of the verify list in `docs/dev/building.md`, run as written, exits 0.

- The gate: could this pass without the goal being reached? No, the user reads the diff for each of the four parts of the goal by name, and a skill text that still pasted the draft or the scripts' output into a prompt, or left the folder in place, fails one of them.
- Step 1: could this pass without the goal being reached? No, the reviewer quotes the lines of the diff that hold each of the four parts, and the grep finds any sentence left that tells an agent to read no file or gives it the draft's text as `cat -n` prints it.
- Step 2: could this pass without the goal being reached? No, it is the gate's own reading, made by the user on the landed text.

## Steps, in execution order

- ✅ 1 `/writing` reads the draft from its files: in `skills/academic/writing/SKILL.md` the session makes the temporary folder with `mktemp -d` once the draft's file list is known and before the scripts run, writes the output of `prose_facts.py` and, for a `.docx`, of `docx_paragraphs.py` to files in it, and gives each of the four agents the absolute paths of the draft's files, of the paragraphs file for a `.docx`, and of the facts file in place of their text; every agent is told to read each of those files whole and no other file; the folder is removed once the last agent has ended and before the report is shown, and on every refusal raised after it was made; "What it reads", Steps, "Agent prompts", the agents' bullets, Stops, Anti-patterns, Rules and the description say the same; `metadata.version` goes to 2.3.0; ADR 0061 records the decision, ADR 0013's status names the part 0061 supersedes, and `docs/adr/README.md` lists 0061; `docs/figures/gen_figures.py` and `docs/figures/academic/writing.svg` change only if a label or the note of `writing()` no longer holds. Check: the reviewer quotes, for each of the four parts of the gate, the lines of the diff that hold it; `grep -n -e 'read no file' -e 'cat -n' skills/academic/writing/SKILL.md` prints nothing; `python3 docs/figures/gen_figures.py` exits 0 and `git status --short docs/figures` prints nothing after it; the verify list exits 0 (1 commit) (approved)
  - Step 0: Open item C ruled (a), the folder removed once the last agent has ended and before the report is shown; the builder resumed with `agents/briefs/1-cases.md`.
  - Booking (2026-11-28): landed on main. `skills/academic/writing/SKILL.md` 2.3.0 makes the temporary folder with `mktemp -d` at Steps 4, writes `facts.txt` and, for a `.docx`, `paragraphs.txt` into it at Steps 5, gives the four agents the paths in place of the text, tells each to read every named file whole and no other file, and removes the folder with `rm -r` at Steps 8, once the checking agent has ended and before the report, and before a "No facts" refusal; ADR 0061 "Each writing agent reads the draft and the script outputs from their files" is added, ADR 0013's status names the part it supersedes, and `docs/adr/README.md` lists 0061; the figures are unchanged. Premise corrections: none in the plan; the brief check's eleven findings were closed in the brief before the preparation commit (`agents/reviews/1-brief-check.md`, Closed). The builder's first run of the cases handed back the case "A run that ends normally" (`agents/reviews/1-cases-handback.md`), ruled as Open item C. The first review found four small findings (S1, P1, P2, B1), all closed in repair round 1; the run over round 1 found nothing (`agents/reviews/1-refuter.md`). Findings outside the brief: none. The builder's first report did not pass its bar (four findings sent back); fixes at landing: none. The verify list was unchanged. `sh skills/orchestration/land/templates/land.sh .scratch/28-writing-reads-the-draft-from-its-files/orchestrator-state.md 28-writing-reads-the-draft-from-its-files-1 2d4005a docs/plan.yaml` exited 0 and printed `checks: 16 commands passed`. Usage: builder aa4686ded176983bc (claude-opus-5-5) 491709 tokens, 51 tool uses, 6.6 minutes over the cases hand-back, the build and round 1; brief check a92c188eb9f947915 (claude-opus-5-5) 135741 tokens, 22 tool uses, 4.0 minutes; reviewer ad51bb4d543e67209 (claude-opus-5-5) 148152 tokens, 32 tool uses, 4.8 minutes; reviewer over round 1 ac6a4bc80c156981f (claude-sonnet-5-5) 76856 tokens, 8 tool uses, 0.6 minutes. No look and no A/B: the configuration block's `look:` and `bench:` are empty.
- 2 the gate's reading: the user reads the diff of `skills/academic/writing/` and of ADR 0061 on main and approves it, or names what to change, which goes back to step 1 as a repair round. Check: the user's approval stands in this file's Rulings (orchestrator, no agent) (approved)
- 3 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless `plan.yaml`'s `workers_at_once` allows more.

- None: step 2 reads what step 1 lands, and step 3 closes after both.

## Rulings (2026-11-27)

- Open item A (2026-11-27): the paragraphs `docx_paragraphs.py` prints and the output of `prose_facts.py` go to a temporary folder that the agents read from and that is deleted after the report is shown, in place of a run folder that is kept (the user).
- Open item B (2026-11-27): the gate makes no run of `/writing`; it is the user's reading of the diff of `skills/academic/writing/` and the verify list (the user).
- Open item C (2026-11-27): the temporary folder is deleted once the last agent has ended and before the report is shown, since the report is the message that ends the turn and no command runs after it; this carries out Open item A, whose "after the report is shown" was the session's wording, and the goal, the gate and step 1 say the same (the user).

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent the plan leaves unpriced, which has a numbered item under the heading "Agents the cost script leaves unpriced:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, the orchestrator writes a brief-check agent it stopped under "The review of a choice", the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.

- aa4686ded176983bc: builder of step 1, claude-opus-5-5
- a92c188eb9f947915: brief check of step 1, claude-opus-5-5
- ad51bb4d543e67209: reviewer of step 1, claude-opus-5-5
- ac6a4bc80c156981f: reviewer of step 1 over round 1, claude-sonnet-5-5

## Blocked, and by what

- 2: the user's reading of the diff of `skills/academic/writing/` and ADR 0061, on main.

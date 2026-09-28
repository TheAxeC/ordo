# Plan: 3 The writing base

Execution ledger for roadmap entry 3 in `docs/roadmap.md`. One bullet is one step of work and one dispatch of its executor (a builder agent by default), except the bookkeeping steps the orchestrator does itself (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

A `writing` skill folder the writing skills share: the prose standard, the anti-pattern table, and the checks for non-ASCII, dash asides, history words and word counts per section.

## Gate

the checks run on one sample file holding one planted violation per check, flag each of them, and flag nothing in a clean file; the checks run on a real draft of yours, and you review what they flag; the skill follows `docs/dev/skill-layout.md`; the coverage check with `--built writing` (the command in `docs/academic-coverage.md`) prints `ok:`, and the plan's ledger holds a record for each `rebuild: writing` row that the file of `skills/writing/` the row names holds what the source file did, checked by reading both.

## Steps, in execution order

- 1 The prose standard moved: `skills/repo-setup/templates/docs/dev/prose-standard.md` becomes `skills/writing/references/prose-standard.md` with its text unchanged; `/repo-setup` copies it into a new repository from there, and its Stops name the `writing` skill as needed beside it; `docs/dev/skill-layout.md` line 3, `skills/repo-setup/SKILL.md` line 109, `skills/repo-setup/templates/CLAUDE.md` line 18 and `skills/repo-setup/templates/shared-rules.md` line 22 point at the new path; the check: `git grep -n "templates/docs/dev/prose-standard"` outside `.scratch` prints nothing, `sh skills/repo-setup/templates/sync_rules.test.sh` prints `PASS:`, and the reviewer compares the moved page with the old one (1 commit) (approved)
- 2 The checking script `skills/writing/templates/check_prose.py` and its test `check_prose.test.sh`: non-ASCII, dash asides (em dash, en dash, spaced hyphen, `--`), history words (such as "previously", "was changed", "added in", a step number, a date), word counts per section against given limits, semicolons per 1000 words of running prose, throat-clearing openers, filler and flagged words, five or more consecutive sentences of about the same length, "not X, Y" contrasts over the limit, and two consecutive paragraphs that each open with a colon and a list; the test runs it on a sample file with one planted violation per check and on a clean file, and joins `docs/dev/building.md`, `docs/dev/change-standard.md`'s command block and this plan's verify list; the check: the test flags every planted violation and nothing in the clean file, and the reviewer turns off each check in a copy and sees the test fail (1 commit) (approved)
- 3 The reference pages in `skills/writing/references/`: the academic prose rules from research-hub's `academic_writing_style.md` (terms defined at first use, clear antecedents, the hedging scale, tense per section, the Engineering and CS register), the judgment rules from `writing_judgment_framework.md` (the paragraph-removal clarity test, the four questions a reader must answer, each discipline's voice, each section's "so what"), and the table of the anti-patterns of `writing_quality_check.md` that the script cannot find (forced groups of three, synonym cycling, mirror structure, uniform paragraph length); a rule the prose standard already holds is named there and not repeated; one record per `rebuild: writing` row in `agents/reviews/3-rows.md`; the check: the reviewer reads each research-hub file against its new file (1 commit) (approved)
- 4 The skill `skills/writing/SKILL.md`, following `docs/dev/skill-layout.md`: `/writing <file>` runs `templates/check_prose.py`, reads the text against the reference pages, and lists each problem with its line, changing nothing; the three `rebuild: writing` rows of `docs/academic-coverage.md` name their files of `skills/writing/`; the check: `python3 utils/check_coverage.py --built writing docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` prints `ok:`, and the reviewer checks the layout by reading (1 commit) (approved)
- 5 A real draft of the user's: the user names a draft, the orchestrator runs `/writing` on it, and the user reviews what it flags; a wrong flag is fixed in the script and reviewed as a step before the plan closes; the check: the user's review of the flags (orchestrator, no agent) (approved)
- 6 the closing: `/roadmap done 3` with the gate's output, the diff shown to the user; this folder moved to `.scratch/archive/` (orchestrator, no agent) (approved)

## Could run in parallel

Independent of each other; the configuration block's `workers_at_once: 1` still serialises them unless the user raises it.

- 2 with 3, both after 1.

## Rulings (2026-09-28)

- The step list: approved as drafted in the conversation of 2026-09-28 (the user).
- Question 1 (2026-09-28): (a), the prose standard moves into the `writing` skill, and `/repo-setup` copies it from there, so each rule is written once (the user).
- Question 2 (2026-09-28): (a), `/writing <file>` checks a file and reports each problem with its line, changing nothing; rewriting belongs to entries 4 and 5, as the roadmap's entry texts give it (the user).

## Blocked, and by what

- 2: step 1's landing, since the script's test and the reference pages name the moved page.
- 3: step 1's landing.
- 4: steps 2 and 3.
- 5: step 4, and the user naming a draft.
- 6: steps 1 to 5.

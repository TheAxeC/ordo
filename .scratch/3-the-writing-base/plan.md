# Plan: 3 The writing base

Execution ledger for roadmap entry 3 in `docs/roadmap.md`. One bullet is one step of work and one dispatch of its executor (a builder agent by default), except the bookkeeping steps the orchestrator does itself (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

A `writing` skill folder the writing skills share: the prose standard, the anti-pattern table, and the checks for non-ASCII, dash asides, history words and word counts per section.

## Gate

the checks run on one sample file holding one planted violation per check, flag each of them, and flag nothing in a clean file; the checks run on a real draft of yours, and you review what they flag; the skill follows `docs/dev/skill-layout.md`; the coverage check with `--built writing` (the command in `docs/academic-coverage.md`) prints `ok:`, and the plan's ledger holds a record for each `rebuild: writing` row that the file of `skills/writing/` the row names holds what the source file did, checked by reading both.

## Steps, in execution order

- ✅ 1 The prose standard moved: `skills/repo-setup/templates/docs/dev/prose-standard.md` becomes `skills/writing/references/prose-standard.md` with its text unchanged; `/repo-setup` copies it into a new repository's `docs/dev/prose-standard.md` from there, and names the `writing` skill beside its folder where it names `ordo-init` and `roadmap` ("What it reads" 1 and 3, the tree at line 109, Rules); `docs/dev/skill-layout.md` line 3 points at the new path (premise corrected at /spec: `skills/repo-setup/templates/CLAUDE.md` line 18 and `templates/shared-rules.md` line 22 name the copy's path in the set-up repository, `docs/dev/prose-standard.md`, which stays, and `/repo-setup` has no Stops row for a sibling skill), and so do the `standards` line of `.agents/plan.yaml` and of this plan's `orchestrator-state.md` (ruling A); the check: `git grep -n "templates/docs/dev/prose-standard"` outside `.scratch` prints nothing, `sh skills/repo-setup/templates/sync_rules.test.sh` prints `PASS:`, and the reviewer compares the moved page with the old one (1 commit) (approved) (ruling A)
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
- Open item A (2026-09-28): (a), `standards: [docs/dev/skill-layout.md, <the prose standard>]` in `.agents/plan.yaml` and in the state file, so every brief points the builder at both pages; step 1 changes the prose standard's path in both. The lazy option was (b), naming the pages in each brief by hand (the user).
- Steps 2 and 3 in parallel (2026-09-28): (a), in sequence; step 2 edits the rules file `docs/dev/change-standard.md`, and a step that touches a rule file runs alone. Neither option left work undone (the user).

## Blocked, and by what

- 2: step 1's landing, since the script's test and the reference pages name the moved page.
- 3: step 1's landing.
- 4: steps 2 and 3.
- 5: step 4, and the user naming a draft.
- 6: steps 1 to 5.

### Step 1, the prose standard moved (landed 2026-09-28)

- Landed: `skills/repo-setup/templates/docs/dev/prose-standard.md` is `skills/writing/references/prose-standard.md`, byte for byte (git records a 100% rename). `skills/repo-setup/SKILL.md` reads the `ordo-init`, `roadmap` and `writing` skills beside its folder, one "What it reads" item each, and its tree names the `writing` skill's `references/prose-standard.md` as the source of `docs/dev/prose-standard.md`; its Rules name the three skills. `docs/dev/skill-layout.md` line 3 and the `standards` line of `.agents/plan.yaml` and of `orchestrator-state.md` name the new path. `README.md`'s copy-install loop copies `writing`, and its install sentence says the skills read each other's templates and references.
- Premise correction (at /spec): `skills/repo-setup/templates/CLAUDE.md` line 18 and `templates/shared-rules.md` line 22 name the copy's path in the set-up repository, which does not change, so they stay; `/repo-setup` has no Stops row for a sibling skill.
- Repair round 1: four rulings (the README install, "What it reads" split per sibling skill, the SKILL.md check's commands quoted, the report's reruns). The paths widened to `README.md`.
- Fixes at landing: 1, the report's revert row r2 of case 1 quoted line 109 from before the round; set to line 111 with the round reviewer's rerun output. The state file's `standards` line was changed at landing, as the brief assigns to the orchestrator.
- Findings outside the brief: none raised. The dispositions are under the Closed heading of `agents/reviews/1-refuter.md`.
- Verification on main, `sh .scratch/3-the-writing-base/land.sh 3-1 c1de4b5 --session <session log> --since 2026-09-28T12:24:19+02:00`: `PASS: land.sh and usage.py scratch tests`, `PASS: verify.sh scratch tests (runner under sh dash)`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: pin.sh scratch tests`, `PASS: check_coverage.py scratch tests`, `verify: 7 commands passed`; the ASCII check printed nothing once the deletion was committed.
- A/B: none (`bench: []`). The look: none (`look:` empty).
- Usage: worker 91,634 tokens, 28 tool uses, 371 s; round 1: 132,384 tokens, 14 tool uses, 302 s. Reviewer 113,019 tokens, 20 tool uses, 470 s; round 1: 121,092 tokens, 23 tool uses, 530 s. Orchestrator (2026-09-28T12:24:19+02:00 to 2026-09-28T13:26:09+02:00): 66 messages, 54292 output tokens, 223787 cache-write tokens, 16479072 cache-read tokens, 140 fresh input tokens, 62 minutes.

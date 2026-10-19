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

- ✅ 1 `/ordo-help skills` in `skills/ordo-help/SKILL.md`: the Quick start line, the description's trigger phrase, the input read (the `skills/` folder that holds `ordo-help` itself, its own folder's real path followed through the link), a Steps subsection that prints the name and the Quick start block of every skill there, `skills` read before `<entry>` is matched, the version raised by the minor part, and the `ordo-help` row of `README.md`; the review reads the skill against `docs/dev/skill-layout.md` and the diff against the goal (1 commit) (approved)
- ✅ 2 The gate's run: a release-candidate tag of main with step 1, pinned with `utils/pin.sh <tag>` only after you allow it, `/ordo-help skills` run once through the Skill tool on main, its blocks counted against `ls skills/*/SKILL.md | wc -l` and each compared with `diff` against the Quick start block of its `SKILL.md` (1 commit; orchestrator, no agent) (approved)
- 3 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless `.agents/plan.yaml`'s `workers_at_once` allows more.

- None: step 2 runs the skill step 1 changes.

## Rulings (2026-10-19)

- D1 How each skill is printed by `/ordo-help skills` (2026-10-19): (a), a line `/<name>`, then its Quick start block exactly as its `SKILL.md` has it, the skills in folder-name order; no option was the lazy one (the user).
- D2 Whether `/ordo-help skills` also prints the sequence and the choices awaiting review (2026-10-19): (a), no, only the blocks; no option was the lazy one (the user).
- The pin of step 2 (2026-10-19): step 2 may tag a release candidate of main with step 1 and pin it with `utils/pin.sh <tag>` without asking again (the user).
- The final tag of the closing (2026-10-19): the closing tags the release `v8.3.0` on main and pins it with `utils/pin.sh v8.3.0` without asking (the user).

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent in no role the cost script prices, which has a numbered item under the heading "Agents in no role the cost script prices:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, the orchestrator writes a brief-check agent it stopped under "The review of a choice", the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.

- aa44557b3704429d8: brief check of step 1, claude-opus-5-5
- a157a6a4203c3d078: builder of step 1, claude-sonnet-5-5
- a6c49cd6b72bbc846: reviewer of step 1, claude-opus-5-5
- a248c71344ddb9568: reviewer of step 1 over round 1, claude-sonnet-5-5
- a53a068ce215da323: brief check of step 2, claude-opus-5-5
- a196390485e816956: reviewer of step 2, claude-opus-5-5
- af7ac9ea3e0384a8b: reviewer of step 2 over round 1, claude-sonnet-5-5

## Blocked, and by what

- none.

### Step 1, `/ordo-help skills` in the skill text (landed 2026-10-19)

- Landed: 7 files, 51 insertions and 18 deletions against 7e8082d, plus the fixes at landing. `skills/ordo-help/SKILL.md` gains the `skills` mode: the Quick start line `/ordo-help skills`, the description and its trigger phrases, the argument `skills` read before `<entry>`, the skills folder read as the parent of this skill's folder resolved through any link by `pwd -P`, `## Steps` split into `### The sequence and the plans` (the old four items) and `### skills` (find, sort, print the name line `/<name>` and the fenced Quick start block, skip a folder with no `SKILL.md`, `no Quick start block` for a file with none), the "No stop" row, an Anti-patterns row, and a Rules bullet that the `skills` mode prints only those lines (rulings D1 and D2). The three references to the old Steps by number are rewritten to `"Steps / The sequence and the plans" <n>`, among them the **dispatch entry** "Stated in" of `skills/repo-setup/templates/plan-terms.md`, synced into `docs/glossary.md`. `README.md`'s `ordo-help` row and the pipeline figure's `/ordo-help` box (`docs/figures/gen_figures.py`, `docs/figures/pipeline.svg` regenerated; `plan-loop.svg` unchanged) name the new mode. Versions: ordo-help 3.2.0, repo-setup 5.3.1.
- Ticked: the step's check holds. The first reviewer and the reviewer over round 1 read the skill against `docs/dev/skill-layout.md` and the diff against the Goal (`1-refuter.md`, Verdicts: every item holds and all 15 cases met over round 1); the builder's report maps each part of the Goal to its line (`1-report.md`, "The diff read against the Goal"). The run through the Skill tool is step 2.
- Premise corrections (at /spec): the brief check's findings closed in the brief (`1-brief-check.md`, Closed): the pinned skills folder holds `literature` with no `SKILL.md`; the Steps list moved under a subsection, widening the paths to `plan-terms.md`, `docs/glossary.md` and `skills/repo-setup/SKILL.md`; the skills CLI and copy installs added as cases; the figure body over two literals.
- Review: `1-refuter.md`, 4 findings (Standards 1 to 3, Behaviour 1); repair round 1 (`agents/briefs/1-round-1.md`) with a ruling per finding. The run over the round closed all four and found 2, both fixed at landing.
- Raised: none.
- Fixes at landing: round 1 Standards 1, "What it reads" 2 written as one ordered statement in place of the "First" and "Then" bullets; round 1 Standards 2, the restated order dropped from "Steps / skills" 1 and item 3's completion line reading "every folder in the sorted order". 2 fixes.
- Verification on main: the verify list equals the page's commands with their filters. `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/land.sh .scratch/4-a-ordo-help-skills/orchestrator-state.md 4-a-ordo-help-skills-1 7e8082d` printed `checks: 7 commands passed` and `7 files changed, 51 insertions(+), 18 deletions(-)`; after the fixes at landing `sh skills/land/templates/checks.sh .scratch/4-a-ordo-help-skills/orchestrator-state.md` printed `checks: 7 commands passed`.
- A/B: none. Look: none configured.
- Usage: brief check claude-opus-5-5 168049 tokens, 40 tool uses, 7.6 min; builder claude-sonnet-5-5 152050 tokens, 32 tool uses, 5.0 min (round 0) and 185542 tokens, 11 tool uses, 2.4 min (round 1); reviewer claude-opus-5-5 160305 tokens, 36 tool uses, 7.6 min; reviewer over round 1 claude-sonnet-5-5 132598 tokens, 24 tool uses, 2.8 min.
- The builder's first report did not pass its bar: the review found the skills folder's location readable two ways, the print rule stated only in the title paragraph, the figure naming `skills` as a bare word, and no before-and-after section in the report. Fixes at landing: 2.

### Step 2, the gate's run (landed 2026-10-19)

- Landed: the lightweight tag `v8.3.0-rc.2` on a6c643f, the pin of `~/.local/share/ordo-stable` at it, and the two ledger files `agents/reviews/2-run.txt` and `agents/reviews/2-report.md`. `land.sh`'s booking data showed an empty diff stat against 8e30949 and no staged path, since the step's only outputs are ledger files and the tag and the pin outside the tree. Built inline.
- Ticked: the step's check holds. `utils/pin.sh v8.3.0-rc.2` printed `pinned: v8.3.0-rc.2 (a6c643f), 15 skills linked in: /Users/axelfaes/.claude/skills, /Users/axelfaes/.claude-backup/skills, /Users/axelfaes/.claude-work/skills` and `pinned: 5 agents linked in: /Users/axelfaes/.claude/agents, /Users/axelfaes/.claude-backup/agents, /Users/axelfaes/.claude-work/agents`; `/ordo-help skills` ran once through the Skill tool, resolved its folder to `/Users/axelfaes/.local/share/ordo-stable/skills/ordo-help` and read the 15 pinned `SKILL.md` files; its output message (transcript uuid `3ce9e401-8756-4f01-9788-cb6dae6088dd`) is `2-run.txt` byte for byte; 15 name lines in `LC_ALL=C ls -1 skills/` order against `ls skills/*/SKILL.md | wc -l` printing `15`; 15 empty `diff` runs of each block against its `SKILL.md`; the fence-aware layout `awk` printed nothing (`2-report.md`, cases 1 to 9; `2-refuter.md`, every case met in both runs).
- Premise corrections (at /spec): the brief check's findings closed in the brief (`2-brief-check.md`, Closed), among them the tag named `v8.3.0-rc.2` since `v8.3.0-rc.1` was plan 9's deleted tag.
- Review: `2-refuter.md`, 6 findings (Spec 1 to 3, Standards 1 and 2, Behaviour 1); repair round 1 (`agents/briefs/2-round-1.md`) with a ruling per finding. The run over the round found 3 (Spec 1, Proof 1, Proof 2), all fixed at landing.
- Raised: none.
- Fixes at landing: Proof 2, `2-run.txt` rewritten as the message text byte for byte (6886 bytes, no final newline), as the brief's item 4 asks, with the report's counts and case 9's `diff` redone and the false reason for the added newline removed; Proof 1, the progress line's reminder cited as record `157e4d0a-e88f-490d-9bd2-03b89bd081fd`; Spec 1, each bullet of the report's "Repair round 1" naming its check; and the report's sentence on the worktree's ledger copy rewritten, since the landing script's checkout put main's committed copies there. 4 fixes.
- Verification on main: the verify list equals the page's commands with their filters (`docs/dev/building.md` unchanged since 7e8082d). `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/land.sh .scratch/4-a-ordo-help-skills/orchestrator-state.md 4-a-ordo-help-skills-2 8e30949` printed `checks: 7 commands passed`; after the fixes at landing `sh skills/land/templates/checks.sh .scratch/4-a-ordo-help-skills/orchestrator-state.md` printed `checks: 7 commands passed`.
- A/B: none. Look: none configured.
- Usage: brief check claude-opus-5-5 187645 tokens, 46 tool uses, 8.6 min; builder inline (the orchestrating session); reviewer claude-opus-5-5 190111 tokens, 49 tool uses, 8.1 min; reviewer over round 1 claude-sonnet-5-5 146032 tokens, 25 tool uses, 4.2 min.
- The builder's first report did not pass its bar: the review found the place the files were written misstated, the added final newline called a judgment call, a shortened command and no line count, line-number citations, a one-line quote of a two-line output, and the progress line printed during the run unstated. Fixes at landing: 4.

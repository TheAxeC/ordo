# Plan: 6. paper-review-panel

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

- ✅ 1 the pages: each file of `research-hub/.agents/skills/academic-paper-reviewer/` under `agents/`, `references/`, `templates/` and `examples/`, except `references/changelog.md`, copied into `skills/academic/paper-review/` under its own folder and name, with the edits of ADR 0043, Decision 1, and no others; `diff` of each page against its source shows only those edits, and the character-set check of `docs/dev/building.md` prints nothing for the folder (1 commit) (approved)
- ✅ 2 `SKILL.md` and the places that list the skills: the source's `SKILL.md` carried section by section, with its words, into the layout of `docs/dev/skill-layout.md` as `skills/academic/paper-review/SKILL.md`, with the three things the source does not state taken as `paper` has them (ruling The three things the source does not state); the README's row and its count of skills, `paper`'s Use instead row, the glossary's entry "panel review" and the skill's figure; the reviewer reads the source's `SKILL.md` against the new one, and the verify list of `docs/dev/building.md` passes on main (1 commit) (approved) (ruling 2-contracts) (ruling 2-questions) (ruling 2-call)
- ✅ 2.A the name: the skill is renamed `paper-review-panel`: its folder `skills/academic/paper-review-panel/`, the name in its frontmatter, its call `/paper-review-panel`, its run folder `paper-review-panel-runs/`, its figure `docs/figures/paper-review-panel.svg`, and every place of the repository outside the ledgers that names it (the README, `paper`, the glossary, the roadmap, the ADRs, the figure scripts and the pages on them); `git grep -nE '(^|[^-a-z])paper-review([^-a-z]|$)' -- . ':!.scratch'` and `git grep -n 'paper-review-runs' -- . ':!.scratch'` print nothing, and the verify list of `docs/dev/building.md` passes (1 commit) (ruling The skill's name)
- ✅ 3 the gate's reading: a fresh agent reads `diff -r` of `skills/academic/paper-review-panel/` against `research-hub/.agents/skills/academic-paper-reviewer/` once and writes `agents/reviews/3-diff-reading.md`, which lists each difference with which edit of ADR 0043, Decision 1, it is, or none; the user reads that list (0 commit) (approved) (ruling The skill's name)
- ✅ 4 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output, this folder moved to the archive (orchestrator, no agent) (approved)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless `plan.yaml`'s `workers_at_once` allows more.

- 1 with 2: they write different files, and the page names `SKILL.md` refers to are the source's own (ruling Steps 1 and 2 in parallel).

## Rulings (2026-11-22)

- The step list (2026-11-22): approved as drafted, four steps, with the gate's reading as a step of its own after steps 1 and 2 (the user).
- Steps 1 and 2 in parallel (2026-11-22): steps 1 and 2 run in parallel (the user).
- A copy and nothing else (2026-11-22): `paper-review` is academic-paper-reviewer copied as `paper` was copied, with the edits of ADR 0043, Decision 1, and no others; no option that cuts, moves or replaces anything the source has is offered or taken, and no file of another skill is added (the user).
- The three things the source does not state (2026-11-22): each of the seven roles runs as its own agent, the reports are saved in a run folder beside the manuscript, and a reviewer's second call, after its scoring plan, goes to the same agent, each as `paper` has it; shown with the drafted step list, which the user approved (the user).
- No calibration script (2026-11-22): the source has no script for the calibration numbers, and none is added; shown with the drafted step list, which the user approved (the user).
- Open item 2-contracts (2026-11-22): the two scoring contracts the source's two-call protocol names, `shared/contracts/reviewer/full.json` and `methodology_focus.json`, which its folder does not hold, are taken from the source's upstream repository at the source's version (contract ids `reviewer/reviewer_full/v1` and `reviewer/reviewer_methodology_focus/v1`) and written into `SKILL.md`, which unblocks step 2 (the user).
- Open item 2-questions (2026-11-22): the three contribution questions of Phase 2.5 step 3, which the source reads from deep-research's page, are written into the step with their text, which unblocks step 2 (the user).
- Open item 2-call (2026-11-22): the skill is called as `/paper-review <mode> <manuscript>`, the source's six mode names under it and `full` when no mode is named, with the source's plain requests kept as triggers, as `paper` is called, which unblocks step 2 (the user).
- The skill's name (2026-11-22): the skill is called `paper-review-panel`, not `paper-review`; the rename is step 2.A, before the gate's reading, and step 3 reads the folder under its new name (the user).
- The two refusals (2026-11-22): the refusals "Unknown mode" and "A missing input" of `SKILL.md` stay; they follow from the call form of Open item 2-call (the user).
- Version tags and the words beside them (2026-11-22): where a version tag or a version plan is removed, a slight rewording of its sentence is accepted, and `Kong A1` and `SR` stay left out (the user).
- The parts the layout requires (2026-11-22): the parts `docs/dev/skill-layout.md` requires of a `SKILL.md` (the steps with their `Done when` lines, the Stops table, the frontmatter limited to its keys, the layout's headings), written from what the source says, are part of the copy, as in `paper` (the user).

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it, except an agent the plan leaves unpriced, which has a numbered item under the heading "Agents the cost script leaves unpriced:"; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent it stopped for another model or found dead when it took a run over, the orchestrator writes a brief-check agent it stopped under "The review of a choice", the session that starts a diagnosis agent writes its numbered item right after the start, and `/plan` copies the bullets of a rulings file.
- a7158d80e8b21c9c4: brief check of step 1, claude-fable-5-2
- a840c1d8f45ecd55f: builder of step 1, claude-fable-5-2
- a8df6fcc33e1a61cf: reviewer of step 1, claude-fable-5-2
- ae4197d6f7ce23142: reviewer of step 1 over round 1, claude-sonnet-5-5
- a10369c9579256655: brief check of step 2, claude-fable-5-2
- a21f2ad5c98eaac0b: builder of step 2, claude-fable-5-2
- a915fb8ba1219bbe2: reviewer of step 2, claude-fable-5-2
- ab963ce95a5408f40: reviewer of step 2 over round 1, claude-sonnet-5-5
- a44ce4cabb3f13e0e: brief check of step 2.A, claude-fable-5-2
- ac00f95bb01eebccf: builder of step 2.A, claude-fable-5-2
- a545e898ed137ea94: reviewer of step 2.A, claude-fable-5-2
- afefa3411b72942e8: brief check of step 3, claude-fable-5-2
- a57f5bfda7baf53ac: builder of step 3, claude-fable-5-2
- a4244c99937ed072e: reviewer of step 3, claude-fable-5-2

## Blocked, and by what

- nothing.

### Step 1, the pages (landed 2026-11-22)

- Landed: 24 files, 5245 insertions(+) against the base ea700fc: the seven pages of `agents/`, the eleven of `references/` (`changelog.md` left out), the three of `templates/` and the three of `examples/`, under `skills/academic/paper-review/`.
- Ticked: every edit of the brief holds (edit 6 applies nowhere) and every case is met, by the run over round 1.
- Premise corrections: none in `plan.md`. The brief check's points were closed in the brief before the build (`agents/reviews/1-brief-check.md`, "Closed").
- Review: `agents/reviews/1-refuter.md`; the first run found Spec 1 to 3, Proof 1 and Standards 1, sent back as the five rulings of repair round 1 (`agents/briefs/1-round-1.md`) and closed there. The run over round 1 found no finding in the pages and two in the builder's report (Proof 1 and 2, statements the round had made stale).
- Fixes at landing: 2, both in the builder's report in the ledger: the list "Per page, what is left out" of the calibration page, and the sentence under check 6 with judgment calls 1 and 11. No page changed at landing.
- The builder's first report did not pass its bar: five findings went back in the round.
- Findings outside the brief: none raised as an open item.
- Verification on main: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude/skills/land/templates/land.sh .scratch/6-paper-review/orchestrator-state.md 6-paper-review-1 ea700fc docs/plan.yaml` exited 0 and printed `checks: 12 commands passed`.
- Look: none, the configuration block's `look:` is empty. A/B: none, `bench: []`.
- Usage: brief check a7158d80e8b21c9c4 claude-fable-5-2 234992 tokens, 29 tool uses, 7.2 minutes; builder a840c1d8f45ecd55f claude-fable-5-2 154702 tokens, 65 tool uses, 13.5 minutes, and its round 1 ended at 164616 tokens, 3 tool uses, 1.0 minutes; reviewer a8df6fcc33e1a61cf claude-fable-5-2 201785 tokens, 28 tool uses, 5.4 minutes; reviewer over round 1 ae4197d6f7ce23142 claude-sonnet-5-5 117692 tokens, 18 tool uses, 1.4 minutes.

### Step 2, `SKILL.md` and the places that list the skills (landed 2026-11-22)

- Landed: 8 files, 653 insertions(+), 10 deletions(-) against the base 90fe644, before the two fixes at landing: `skills/academic/paper-review/SKILL.md` (534 lines) and `docs/figures/paper-review.svg` new; `README.md`, `skills/academic/paper/SKILL.md`, `docs/glossary.md`, `docs/dev/building.md`, `docs/dev/scripts.md` and `docs/figures/gen_figures.py` changed. No conflict with step 1.
- Ticked: every item of the brief holds after the fixes at landing and every case is met, by the run over round 1; the two cases that run a figure script were run at landing, where `python3 docs/figures/gen_figures.py` and `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py` left `git status --short` with no changed figure.
- Premise corrections: none in `plan.md`. The brief check's points were closed in the brief before the build (`agents/reviews/2-brief-check.md`, "Closed"). Open items 2-contracts, 2-questions and 2-call were closed under self-rule before the build (C141 to C143).
- Review: `agents/reviews/2-refuter.md`; the first run found Spec 1 to 5 and declined the glossary's "Stated in:", sent back as the six rulings of repair round 1 (`agents/briefs/2-round-1.md`) and closed there. The run over round 1 found Spec 1 and 2.
- Fixes at landing: 2, both in `skills/academic/paper-review/SKILL.md`. Steps, "quick", item 2 says the EIC starts in one call, with no sprint contract, since `references/sprint_contract_protocol.md` gives a contract to `reviewer_full` and `reviewer_methodology_focus` only. Quick start, the line of `full`, reads "the same review, with the mode named", so it no longer disagrees with Steps 1.
- The builder's first report did not pass its bar: five findings went back in the round.
- Findings outside the brief: `docs/figures/academic-pipeline/gen_academic_pipeline.py` and `docs/roadmap.md` entry 13 say "paper-review, entry 6 (not built yet)"; they become false at the closing and are step 4's.
- Verification on main: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude/skills/land/templates/land.sh .scratch/6-paper-review/orchestrator-state.md 6-paper-review-2 90fe644 docs/plan.yaml` exited 0 and printed `checks: 12 commands passed`; `checks.sh` run again after the fixes printed `checks: 12 commands passed`.
- Look: the configuration block's `look:` is empty. The orchestrator rendered `docs/figures/paper-review.svg` with `rsvg-convert` and read it: every box, arrow and the three note lines are inside the canvas. A/B: none, `bench: []`.
- Usage: brief check a10369c9579256655 claude-fable-5-2 183232 tokens, 21 tool uses, 6.9 minutes; builder a21f2ad5c98eaac0b claude-fable-5-2 314218 tokens, 30 tool uses, 11.1 minutes, and its round 1 ended at 326086 tokens, 3 tool uses, 1.7 minutes; reviewer a915fb8ba1219bbe2 claude-fable-5-2 232088 tokens, 24 tool uses, 6.3 minutes; reviewer over round 1 ab963ce95a5408f40 claude-sonnet-5-5 111059 tokens, 15 tool uses, 1.7 minutes.

### Step 2.A, the name (landed 2026-11-22)

- Landed: 40 files, 72 insertions(+), 72 deletions(-) against the base a988ed2, before the fix at landing: the 25 files of the skill moved from `skills/academic/paper-review/` to `skills/academic/paper-review-panel/`, the name written in them, in `README.md`, `skills/academic/paper/SKILL.md`, `docs/glossary.md`, `docs/roadmap.md`, `docs/dev/building.md`, `docs/dev/scripts.md`, ADRs 0001, 0019, 0022, 0025 and 0027, `docs/figures/gen_figures.py` (the function `paper_review_panel()`) and `docs/figures/academic-pipeline/gen_academic_pipeline.py` with its figure; `docs/figures/paper-review.svg` became `docs/figures/paper-review-panel.svg`. The run folder reads `paper-review-panel-runs/`.
- Ticked: every item of the brief holds and nine of the ten cases are met by the reviewer's rerun; the tenth, the two figure scripts, was run at landing, where both exited 0 and left `git status --short` with no figure changed. `git grep -nE '(^|[^-a-z])paper-review([^-a-z]|$)' -- . ':!.scratch'` on the staged tree prints nothing.
- Premise corrections: none in `plan.md`. The brief check's seven points were closed in the brief before the build (`agents/reviews/2.A-brief-check.md`, "Closed").
- Review: `agents/reviews/2.A-refuter.md`; one run, four findings, none making an item violated, each closed under its "Closed" heading. No repair round.
- Fixes at landing: 2. `docs/glossary.md`, the entry **panel review**: its "Stated in" names `skills/academic/paper/SKILL.md`, "Cross-session resume scope and known limitations", and `docs/roadmap.md`, the entry of `referee`, the two places that hold the term, since the opening paragraph of the skill's `SKILL.md` does not. `plan.md`, the first line: `# Plan: 6. paper-review-panel`, the roadmap's heading of the entry.
- The builder's first report passed its bar: nothing went back.
- Findings outside the brief: none new. The label "paper-review-panel, entry 6" with its value "todo" in `gen_academic_pipeline.py` and roadmap entry 13 stay step 4's.
- Decisions inside the rename: the run folder and the figure take the new name; the ledger folder `.scratch/6-paper-review/` keeps the old one.
- Verification on main: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude/skills/land/templates/land.sh .scratch/6-paper-review/orchestrator-state.md 6-paper-review-2.A a988ed2 docs/plan.yaml` exited 0; `checks.sh` run again after the fix printed `checks: 12 commands passed`.
- Look: the configuration block's `look:` is empty. A/B: none, `bench: []`.
- Usage: brief check a44ce4cabb3f13e0e claude-fable-5-2 144130 tokens, 22 tool uses, 5.0 minutes; builder ac00f95bb01eebccf claude-fable-5-2 143476 tokens, 21 tool uses, 4.7 minutes; reviewer a545e898ed137ea94 claude-fable-5-2 135375 tokens, 26 tool uses, 5.0 minutes.

### Step 3, the gate's reading (landed 2026-11-22)

- Landed: no file outside the ledger; `land.sh` printed `nothing to copy: 78cc139..6-paper-review-3 holds no commit`. The page is `agents/reviews/3-diff-reading.md`: the 25 files and 426 hunks of `diff -r` of the source against `skills/academic/paper-review-panel/`, 788 verdicts: edit 1 109, edit 2 65, edit 3 7, edit 4 442, edit 5 1, edit 6 0; none under ADR 0043 Decision 2 97; none under a ruling 27; none with nothing that allows it 40.
- Ticked: every hunk is named under its file and the per-file counts equal `diff`'s, by the reviewer's rerun; the 40 verdicts "none, nothing allows it" are right, by the reviewer's reading of each; in 18 files other than `SKILL.md` read whole, no difference is missing and no verdict contradicts the diff.
- The user's rulings on what the page found (2026-11-22): "The two refusals", "Version tags and the words beside them", "The parts the layout requires". With them no difference the page lists under "nothing allows it" is left for a ruling: 38 are parts the layout requires or the two refusals, and two are `Kong A1` and `SR`.
- Premise corrections: none in `plan.md`. The brief was put to the renamed folder before its preparation commit; the diff's counts did not change with the rename.
- Review: `agents/reviews/3-refuter.md`; one run, Spec 1 to 4. Repair round 1 (`agents/briefs/3-round-1.md`) was sent and stopped on the user's word before it ended; nothing of it is used. Spec 1 and 2 are closed by the ruling "The parts the layout requires", Spec 3 is left as it is and named in the page's opening section, Spec 4 needed no change.
- NOT DONE: no reviewer compared the non-shared entries of six files with their diff (`agents/domain_reviewer_agent.md`, `agents/methodology_reviewer_agent.md`, `agents/perspective_reviewer_agent.md` and the three examples, 152 hunks). The run over the round was to read them.
- Fixes at landing: 1. The page opens with the section "The user's rulings after the reading".
- The builder's first report did not pass its bar: four findings.
- Findings outside the brief: none.
- Verification on main: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude/skills/land/templates/land.sh .scratch/6-paper-review/orchestrator-state.md 6-paper-review-3 78cc139 docs/plan.yaml` exited 0 and printed `checks: 12 commands passed`.
- Look: the configuration block's `look:` is empty. A/B: none, `bench: []`.
- Usage: brief check afefa3411b72942e8 claude-fable-5-2 120526 tokens, 11 tool uses, 3.9 minutes; builder a57f5bfda7baf53ac claude-fable-5-2 163816 tokens, 49 tool uses, 25.8 minutes, its round 1 stopped with no completion notice; reviewer a4244c99937ed072e claude-fable-5-2 276245 tokens, 28 tool uses, 5.8 minutes.

### Step 4, the closing (2026-11-22)

- The closing report: `agents/reviews/closing.md`, the cost script's output, exit 0 (01c2f29).
- The pipeline figure and the roadmap's description of it show `paper-review-panel` as built (e0c97e0).
- The roadmap entry: marked done with the gate's output through `/roadmap done 6`, the diff approved by the user.
- The folder moves to `.scratch/archive/6-paper-review/`.

# Brief check: step 5

## 1 Names

Commands used. These were run from `/Users/axelfaes/workspace/ordo`:
- a loop of `git grep -n -F "<path>"` over the sixteen new paths (`code/diagnose.svg` ... `researcher/lifecycle.svg`);
- `git grep -n -F "<phrase>" -- . ':!.scratch'` for each changed phrase;
- `git grep -n 'gen_figures' -- . ':!.scratch' ':!docs/figures/gen_figures.py'`;
- `git grep -n -i 'its figure\|has a figure\|have a figure\|a figure for' -- skills utils docs README.md ':!docs/roadmap.md'`.

1. The sixteen new figure paths: each grep printed nothing. No hit exists anywhere.
2. "Every skill that launches agents" and "launches agents": the only hit is `docs/dev/building.md:41`, which is inside the paths.
3. "writes the README sections it lacks": the hit is `docs/figures/gen_figures.py:1051`, inside the paths. `grep -c 'sections it lacks' docs/figures/academic/researcher/research.svg` printed `1`, and that file is also inside the paths.
4. "novelty and idea start no agent": the hits are `docs/figures/academic/researcher/manuscript.svg:157` and `gen_figures.py:977`, both inside the paths.
5. "A project underway: research adopt offered" and "The jobs submitted: the job ids": the hits are `README.md:90,92`, `research.svg:1-2`, `revision.svg:1-2` and `gen_figures.py:1041,1042,1149`. All are inside the paths.
6. Sentences about the file as a whole that the step makes false. Each is inside the paths, but no item of "What to build" names it, and Verify item 5 does not grep it:
   - `gen_figures.py:1`, `"""Write the SVG figures of the README: the runs of the skills that start agents.` The step adds figures of skills that start no agent, and those figures are not in the README.
   - `docs/dev/scripts.md:9`, "Writes the SVG figures of the README". The sixteen new figures are not README figures. Item 6 only adds names to this row.
   - `gen_figures.py:47`, "Every figure but the last two shows the order of a run", and `gen_figures.py:58`, "Each of the two has its own legend." `academic/researcher/lifecycle.svg` draws no run. Item 1 has it grouped with the researcher figures, so it is not among "the last two".
   - `gen_figures.py` lines 66-67, "A change to a Stops table, to a skill's agents, its cycles or its name is made in the labels below". `building.md:41` has the same sentence, "A change to a skill's Stops table, its sequence, its agents, its cycles or its name changes the labels". The new figures draw a skill's Steps, so a change to Steps also changes labels. Both sentences become incomplete.
   - `building.md:41`, "the three figures of `researcher` under `docs/figures/academic/researcher/`". This becomes four with `lifecycle.svg`. Item 5 ("names every figure") covers it only implicitly.
7. Hits outside the paths:
   - `README.md:70`, "Scripts and the session's own steps are left out, except in the figure of paper's lit-review mode". This describes the figures shown in the README. The new figures are not shown there, so the step does not make it false. It is already inexact on main, because research.svg and revision.svg draw grey and rounded boxes. Step 6 rewrites the README.
   - `README.md:78`, "The skills that launch agents each have a figure of their own." This stays true, since the step only adds figures.
   - `docs/adr/0060-...md:7,11,13,18` (gen_figures.py imports the engine) stays true.
   - `docs/figures/academic/researcher/gen_academic_pipeline.py:6` and `docs/figures/ordo_kinds.py:3` stay true.
   - `docs/dev/scripts.md:13`, the folder rule, stays true.
   - The note of `pipeline.svg` (`gen_figures.py:1545-1546`, "These start no agent: /ordo-init, /roadmap, /plan, /land, /plan-retro, /session-retro, /wizard, /tutor, and /wait-what and /ordo-help") stays true.

## 2 The step line

The plan's line for step 5 (read with `sed -n '23,40p' plan.md`) maps to the brief as follows:
1. "A figure for each of the fifteen skills the goal names, drawn by `gen_figures.py`" is served by item 1, together with Decisions 1 to 3.
2. "and researcher's lifecycle figure" is served by item 2.
3. "with the script's head comment stating the folder rule of D5" is served by item 3, third bullet ("stays as it stands"). That paragraph is on main at `gen_figures.py:42`, found by `grep -n 'A figure stands in the folder'`.
4. "`docs/dev/building.md` naming the figures it writes" is served by item 5.
5. "check: each of the fifteen skills has a figure file under `docs/figures/` (listed, one per skill)" is served by item 9 and the case "The fifteen skills".
6. "both scripts exit 0 and `git status --short docs/figures` prints nothing" is served by item 9 and the cases "Both scripts" and "A second run". Item 9 replaces `git status` with a `shasum` comparison before and after a second run, because new figures stay untracked until the commit. The plan's own form of the check can hold only after the commit, at landing, and the brief does not say so.
7. "the user reads each new figure against its skill's Steps and Stops and approves" is served by item 10.
8. "(1 commit)" and "(approved)" have no requirement in "What to build". Both belong to the orchestrator.
9. Items with no part in the step line:
   - item 4, the carried Doc text, including `README.md` lines 90-92;
   - item 6, `docs/dev/scripts.md`, which the goal names ("`docs/dev/scripts.md` ... following");
   - items 7 and 8, which are constraints.

## 3 Premises

Reruns on main at `bcfb2e8` (from `git rev-parse --short HEAD`). The figure scripts were run on a copy made with `git archive HEAD | tar -x` in the scratchpad.

1. The loop `ls -d skills/*/$n; git ls-files docs/figures | grep -E "/$n(\.svg|/)"` printed the fifteen skill folders and only `docs/figures/academic/paper/plan.svg`. Holds.
2. `git ls-files docs/figures | wc -l` printed `31`. `grep -c '\.svg$'` printed `28`. The three non-SVG files are the three named scripts. `wc -l` printed `1588`. Holds.
3. Both scripts printed `exit 0`, `git status --short docs/figures` printed nothing, and `find docs skills -name __pycache__` printed nothing. Holds.
4. Both ruff commands printed `All checks passed!` and `awk 'length>100' ... | wc -l` printed `34`. Holds.
5. "The head comment of `gen_figures.py` (lines 1-90)" is wrong. `grep -n '^"""'` printed `1:` and `106:`, so the head comment is lines 1-106.
6. The legend at line 174 holds. `grep -n 'Legend("choice"'` printed `174`, and also `1068` and `1177` with the same text.
7. The kinds of the engine at lines 168-173 and `FIGURE_KINDS` at line 156 hold.
8. The line numbers of `grill()` (742), `code_comments()` (1281), `paper_lifecycle()` (605) and `figures()` (1554) hold, from `grep -n '^def '`.
9. "The figures that stand draw a skill's stops that wait on the user" is false for `grill`. Its Stops section says "The first four rows are stops, which wait on the user." The fourth of those rows is "Another entry's rulings file", which step 4 added, and `grill()` (lines 742-763) does not draw it. The row count of ten holds. Because of the case "The figures that stand", `grill.svg` cannot be brought up to date in this step.
10. building.md line 41 and scripts.md lines 9 and 13 hold, from `sed -n`.
11. The Doc text lines hold, from `grep -n`: lines 976, 977, 980, 1042, 1049-1051 (1050 and 1051 as quoted) and 1149. `researcher/SKILL.md:410` and `:91` hold, and README lines 90 and 92 hold.
12. The ADR premise "`grep -ln 'docs/figures\|gen_figures' docs/adr/*.md` lists 0043, 0049 and 0060 only" holds as a grep. The conclusion drawn from it, "No other ADR's part in force governs ... the step changes", does not hold (see 7).
13. Decisions 1 says "six of the fifteen skills start no agent". This is false: eleven of the fifteen start none.
    - The note of `pipeline.svg` (`gen_figures.py:1545-1546`) lists ten of them: ordo-init, roadmap, plan, land, plan-retro, session-retro, wizard, tutor, wait-what and ordo-help.
    - `skills/code/handbook/SKILL.md:165` says "starts no agent".
    - Only diagnose, plan-orchestration, refute and spec start agents.

## 4 Cases and checks

1. "A skill that starts no agent" says `code/wizard.svg` "draws its steps as rounded and grey boxes". Decisions 1's own wizard example has only rounded boxes, and no step of `wizard` runs a script the skill ships: Steps 6 runs `bash -n` and `shellcheck`. The case and the decision contradict each other. Either the case fails on a figure that follows the decision, or it makes the builder draw a grey box that Decisions 1's rule does not give.
2. Decisions 1's `roadmap add` example leaves out two Stops rows of `roadmap` that wait on the user during `add`: "The level" ("The user's choice") and "The insertion form" ("The user's answer"). That contradicts item 1's "the stops of its Stops table that wait on the user".
3. "What it must do" says "A cycle is a dotted arrow drawn as a return", and item 8 says "a cycle not marked as a return". In the engine, the style `"return"` draws a solid arrow: `figures.py:862` and `:888` use `DOTTED if edge.style == "back" else ""`. The figures that stand draw every cycle with `"back"`: `grep -c '"back")'` printed 46 and `'"return")'` printed 0. A builder who follows the words draws a solid cycle, unlike the figures that stand.
4. "The pages" asks `grep -c '<path>' docs/dev/building.md` for each of the sixteen paths. building.md line 41 names the researcher figures by bare file name after "under `docs/figures/academic/researcher/`". A correct extension in that form writes bare `lifecycle.svg`, so a grep of `academic/researcher/lifecycle.svg` fails, and a grep of bare `lifecycle.svg` also matches `academic/paper/lifecycle.svg`.
5. "The Doc text" dictates that the phrase `novelty, idea and readme start no agent` sits on one source line of `gen_figures.py`. Item 4 does not say this. It is workable but is a constraint the item does not state.
6. Cases that check a place the step does not change:
   - "The engine unchanged" (`skills/code/handbook/templates/figures.py`, `docs/figures/ordo_kinds.py`);
   - "The figures that stand" (25 figures outside the paths);
   - "No bytecode", which checks over `skills/`.
   Each is a preservation check that item 7, or the "only these paths" rule, calls for.
7. No case is inconsistent with the test rules of the rules file. No test is asked for, and the paragraph saying `gen_figures.py` has no test agrees with "Scripts compute facts; judgment is read".

## 5 The question

1. "The fifteen skills" (`ls`): yes, it could pass. Any file at the path passes, a hand-written SVG included. No case checks that `gen_figures.py` writes each new figure: "A second run" leaves a hand-made file unchanged, and "The pages" grep of `gen_figures.py` is met by a path in the head comment alone. A case that the script's stdout holds a `wrote docs/figures/<path>` line for each of the sixteen paths would close this.
2. "The lifecycle figure": yes for the `ls`, for the same reason. The reading half covers the content.
3. "Both scripts" and "A second run": yes, a figure missing from `figures()` still passes. They show the scripts are deterministic, not that the figures exist.
4. "No bytecode", "ASCII", "Figure paths" and "The engine unchanged": yes. These are constraints and do not show the goal on their own.
5. "Refusals left out", "A skill with no stop", "A skill that starts no agent" and "A skill whose run repeats": no, as readings of the named figures. They cover only four of the sixteen.
6. "The Doc text":
   - The grep for the old words passes when the sentence is deleted.
   - `grep -c ... README.md` "at least 1" passes when only one of the two alt texts (lines 90 and 92) is changed. README.md needs 2.
7. "The pages":
   - The grep of `gen_figures.py` passes on `figures()` alone, without the head comment listing the figure (item 3).
   - `grep -n 'Every skill that launches agents'` printing nothing passes when the sentence is deleted, without the new sentence item 5 asks for.
8. "The figures that stand": not applicable to the goal, which it preserves.
9. The step line's check: no. The `ls` listing and the scripts' rerun alone could pass, but the user's reading of each figure against its Steps and Stops, and of the lifecycle figure against D19, cannot.
10. Items 1 and 2: their checks could pass with figures not drawn by the script, as in point 1. The user's reading (item 10) closes this only if the user is told which file the script wrote.
11. Item 3: yes (point 7).
12. Item 4: yes for README.md (point 6).
13. Item 5: yes for its second sentence (point 7).
14. Item 6: no. A path grep of `scripts.md` fails while a path is missing, since the row uses full paths.
15. Items 7 and 8: these are constraints with no tie to the goal.
16. Items 9 and 10: as point 9.

## 6 Implied inputs

1. The script is run from another directory. This is covered by "Both scripts".
2. The new folders `explain/` and `ordo/` are absent on the first run. `write_figures` creates them (`figures.py:1311`, `path.parent.mkdir(parents=True, exist_ok=True)`), so a separate case is not needed. The first run exercises it.
3. A label the engine refuses (too long, or a cycle not marked). The engine already reports it, and item 8 covers it.
4. A figure path that is the same file name as one that stands (`orchestration/plan.svg` and `academic/paper/plan.svg`, `academic/researcher/lifecycle.svg` and `academic/paper/lifecycle.svg`). This is missing from "Cases" and has happened in the brief's own premise grep. A wrong answer is a check that passes on the wrong file. Expected result: every grep and `ls` uses the path from `docs/figures/` down. "The pages" fails this for bare `lifecycle.svg` (4.4).
5. A figure listed in the head comment but not returned by `figures()`, or the reverse. This is missing. A wrong answer is a committed figure that no script redraws. Expected result: the script's stdout holds one `wrote` line for each of the sixteen paths (5.1).
6. None other found.

## 7 ADRs

Status lines were read with `sed -n '1,4p'` and Decisions with `awk '/^## Decision/,/^## /'`.

1. 0060, in force. The step is under "`gen_figures.py` imports the engine from the skill's folder, so one engine draws Ordo's figures and every documented repository's diagrams." The brief names it and does not contradict it.
2. 0043 and 0049: the step changes no paper figure. The brief names both.
3. 0057, in force and not named by the brief. The step is under "The adopt mode brings a project's README to the layout by the readme mode's rewrite, with the same approval stop" (the research.svg note) and "The mode `/researcher readme <project folder>` reads both files and the project's files, drafts each whole in its layout, ... and writes after the user's approval" (the manuscript.svg note and the lifecycle figure). The brief does not contradict it.
4. 0053, in force except the parts 0056 and 0057 supersede, and not named. The lifecycle figure is under "It goes through six named stages, ...: Frame, Build, Baseline, Experiments, Compare, Consolidate. A stage can send the work back to itself or to an earlier stage." D19 draws only the loop back from Compare, which is a choice of overview and not a contradiction.
5. 0054, in force and not named. The lifecycle figure is under "`full` runs `idea`, then `research` and `manuscript`" and under idea's rounds with novelty between them. Item 2 does not say whether `full` appears in the lifecycle figure or its note.
6. 0055, in force and not named. revision.svg's new stop is under its Decision. Its Consequences sentence "its figure of `research` or a figure of its own shows the mode" stays true.
7. 0045 and 0046 (wizard and wait-what), 0048 ("its two stops are the source's", for tutor), 0058 ("Its first stop shows which kinds ...", "Every page is shown as a draft and written after the user's approval", for handbook) and 0007 (the run over a repair round, for refute's dashed box): all in force and not named. Each new figure draws the runs these Decisions fix. The brief does not contradict any of them.
8. No part of the brief contradicts an ADR in force.

## 8 Dictated text

The lines were found with `grep -n` on the brief: legend at 126, the five examples at 127-131, `Node("O"` at 51, README at 52-53, and the phrase at 75. "Holds" means the line breaks no rule of the change standard, the prose standard, skill-layout or the glossary.

1. Line 126, the legend "Rounded box: a step the session does itself": holds.
2. Line 127, the wizard labels:
   - "Scope the procedure: each action, command and value", "The stage list", "Map each stage's journey", "An action not known", "The script checked, not run" and "How to run it": hold. "checked, not run" is one binary contrast and is the point of Steps 6.
   - "The script from templates/template.sh, one stage per stage": holds against the named rules, but reads as a tautology. The SKILL.md's "one `stage` per stage" relies on code formatting, which an SVG label loses.
3. Line 128, the refute labels "Reviewer: the diff against the brief, the checks and the quoted commands rerun", "A model other than the configured one", "The report saved, its usage filled", "Each finding closed or raised" and "Reviewer over a repair round: the delta": hold. "with a dotted arrow back" holds, but see 4.3 on "return".
4. Line 129, the land labels "The step's agents stopped", "land.sh: the wip commit, the cherry-pick, the verify list on main", "A red line for the user", "A rule clash", "The look and the A/B, where configured", "The booking, the state file, the landing report", "The commit by explicit path", "The worktree and branches removed", "A worktree that cannot be removed" and "A lock held": hold. A/B and booking are used in their glossary senses.
5. Line 130, the roadmap labels "The file's format read", "The draft: title, goal, gate and its answer, what it waits on, its place", "No gate", "A missing dependency", "The change" and "Written and committed": hold as prose. The stop list is incomplete (4.2).
6. Line 131, the ordo-help labels "The sequence, printed", "The choices awaiting review", "The plan's position and open items" and "The command that comes next": hold.
7. Line 51, `Node("O", "A README in the old layout: /researcher readme offered", "stop")`: holds. It is the Stops row's name at `researcher/SKILL.md:689`, in the form of node `A`.
8. Lines 52-53, the README alt-text replacements: hold, in the form of the alt texts that stand.
9. Line 75, the phrase `novelty, idea and readme start no agent`: holds.
10. Line 126, "six of the fifteen skills start no agent": this is not text for a file, but it is false (3.13).

## Declined to judge

1. Whether Decisions 1's step groupings for land (the grey box `land.sh` for Steps 2-6) match what `templates/land.sh` runs. I did not read `land.sh`.
2. Whether `plan-orchestration`'s `inline` form and its `C<n> Agree` review count as modes that the note must name, against Decisions 2's "Every other skill of the fifteen has one mode". Its Quick start (read with `awk`) shows `/plan-orchestration <entry> inline`. This is a judgment for the orchestrator.
3. Whether the figures other than `grill.svg` that stand miss a stop that waits on the user. I checked only `grill`.
4. Whether the five example label sets fit the engine's box widths. No figure was built.

Usage: a9a2c1a5a8e296d2c, claude-opus-5-5, 183573 tokens, 57 tool uses, 9 min 17 s.

## Closed

Each finding, closed by a change to the brief `agents/briefs/5.md`:

- 1.6 (sentences the step makes false that no item names): "What is on the tree" names each; item 3 has line 1, the paragraph from line 47 and the sentence of lines 66-67 rewritten; item 5 has `building.md` line 41 count the researcher figures as four and name a skill's Steps among what changes the labels; item 6 has `scripts.md` line 9 drop "of the README"; Verify item 5 greps the phrases.
- 1.7 (`README.md` line 70): named under "What is on the tree" as not made false, since the new figures are not shown in the README; step 6 rewrites it.
- 2.6 (`git status --short docs/figures` holds only after the commit): item 9 says the plan's form of the check runs on main at landing.
- 3.5 (the head comment is lines 1-106): corrected.
- 3.9 (`grill.svg` does not draw "Another entry's rulings file"): the premise is corrected; new item 11 has `grill()` draw the stop and `README.md` line 80 name it, and has the builder read each other figure that stands against its skill's Stops table and add a missing stop that waits on the user with its alt text; the paths widen to `grill.svg`, each figure item 11 changes and `README.md` lines 70-132; the case "The figures that stand" leaves those figures out; a new case checks grill's fourth stop.
- 3.13 (eleven of the fifteen start no agent, not six): corrected in Decisions 1, with the list under "What is on the tree".
- 4.1 (wizard has no script step): the case reads "rounded boxes".
- 4.2 (roadmap add's stops "The level" and "The insertion form"): added to Decisions 1's example.
- 4.3 (a cycle is an edge of style "back", which the engine draws dotted): "What it must do", item 8 and Decisions 1 say `"back"`, with the engine's lines under "What is on the tree".
- 4.4 (bare file names on `building.md` and `scripts.md`): the case "The pages" is a reading of the two lines, and a case says every grep and listing gives the path from `docs/figures/` down.
- 4.5 (the phrase on one source line): item 4 states it.
- 4.6 (cases on places the step does not change): kept, each a preservation check item 7 or the path rule calls for, as the report says.
- 5.1 and 6.5 (a figure not written by the script passes): new case, the script's output holds a `wrote docs/figures/<path>` line for each of the sixteen paths.
- 5.6 (the Doc text greps): a grep of the new adopt words prints 1, and `README.md` must hold the new alt-text phrase twice.
- 5.7 (the head comment and the replacing sentence): new case, an `ast` read of the head comment names each of the sixteen paths; the case "The pages" asks for the sentence that replaces "Every skill that launches agents".
- 6.4 (two figures share a file name): the case on paths from `docs/figures/` down.
- 7.3 to 7.7 (ADRs 0057, 0053, 0054, 0055, 0045, 0046, 0048, 0058 and 0007 not named): named under "What is on the tree", each with the sentence the step is under; item 2 has the lifecycle figure's note say that `full` runs idea, then research and manuscript (ADR 0054).
- 8.2 (the wizard label "one stage per stage"): rewritten as "a stage function for each stage".
- Declined 1 (land's grouping): Decisions 1's land example sets Steps 2 as a rounded box and Steps 3-6 as the grey box of `templates/land.sh`, which the land skill's "The landing script" says runs those steps as one command.
- Declined 2 (plan-orchestration's modes): Decisions 2 names its main mode and has its note name `<entry>`, `inline` and the review of a choice.
- Dictated lines added or rewritten after the check, held line by line against the change standard, the prose standard and the skill layout: "The script from templates/template.sh, a stage function for each stage" holds; "landing: cherry-picking set, the verify list compared with the page" holds, `landing: cherry-picking` being the dispatch entry's value as the land skill's Steps 2 writes it; "land.sh: the wip commit, the cherry-pick, the ledger restored, the verify list on main" holds; the stop labels "The level" and "The insertion form" hold, each the name of its Stops row in `roadmap`.

# Report: step 5, a figure for each of fifteen skills and researcher's lifecycle figure

Everything in the brief is done. Item 10, the user's reading of the sixteen figures, is the step's check at landing and is listed below for that reading.

## Open items of the state file

None.

## The cases' first run, on the unchanged tree (HEAD 6947c94, whose tree outside the ledger is bcfb2e8)

No case of the brief was found that its own rules get wrong, so the build went on.

- The fifteen skills: `ls docs/figures/<group>/<name>.svg` for each of the fifteen printed `ls: docs/figures/code/diagnose.svg: No such file or directory` and the same line for each of the other fourteen paths.
- The lifecycle figure: `ls docs/figures/academic/researcher/lifecycle.svg` printed `ls: docs/figures/academic/researcher/lifecycle.svg: No such file or directory`.
- Both scripts: from the root `python3 docs/figures/gen_figures.py` printed 28 `wrote` lines and `exit 0`; `gen_academic_pipeline.py` printed `wrote docs/figures/academic/researcher/academic-pipeline.svg (22164 bytes)` and `exit 0`; from `/tmp` with the scripts' paths both printed `exit 0`.
- A second run: `find docs/figures -type f | sort | xargs shasum` before and after the runs: `diff` printed nothing (31 lines).
- No bytecode: `find docs skills -name __pycache__` printed nothing.
- ASCII: no new figure existed; `LC_ALL=C grep -c '[^ -~]' docs/figures/code/diagnose.svg` printed `ugrep: warning: docs/figures/code/diagnose.svg: No such file or directory`. The same grep over `orchestration/grill.svg` and `academic/paper/lifecycle.svg` printed `0` and `0`.
- Figure paths: 31 distinct paths found by `git grep -ohE 'docs/figures/[A-Za-z0-9_/.-]*\.(svg|py)' -- README.md docs ':!docs/roadmap.md' skills`, each printed `ok` under `test -f`.
- Refusals left out, A skill with no stop, A skill that starts no agent, A skill whose run repeats: readings of figures that did not exist; the Stops tables were read instead: `refute`'s first row "A model other than the configured one" is its one stop and the four named rows are refusals; `wait-what`'s Stops table has the one row "No stop"; `wizard`'s has "The stage list" and "An action not known" and no step runs a script the skill ships; `plan-orchestration`'s Steps 10 is "Continue with step 2".
- The Doc text: `grep -n 'writes the README sections it lacks' ...` printed `docs/figures/gen_figures.py:1051:        "project underway against each stage, writes the README sections it lacks, moves nothing "`; the grep of the new adopt words printed `0`; the old-layout grep printed `revision.svg:0` and `research.svg:0`; the README grep printed `0`; the `novelty, idea and readme` grep printed nothing.
- The script writes each new figure: `grep -cE` of the sixteen `wrote` lines in the script's output printed `0`.
- The head comment: the `ast` command printed all sixteen paths, `['code/diagnose.svg', 'code/wizard.svg', 'code/handbook.svg', 'explain/wait-what.svg', 'explain/tutor.svg', 'orchestration/land.svg', 'orchestration/plan.svg', 'orchestration/plan-orchestration.svg', 'orchestration/plan-retro.svg', 'orchestration/refute.svg', 'orchestration/roadmap.svg', 'orchestration/spec.svg', 'ordo/ordo-help.svg', 'ordo/ordo-init.svg', 'ordo/session-retro.svg', 'academic/researcher/lifecycle.svg']`.
- The pages, by reading: `building.md` line 41 and `scripts.md` line 9 name none of the sixteen, and `grep -n 'Every skill that launches agents' docs/dev/building.md` printed `41:...`.
- Paths from `docs/figures/` down: every path in these checks was given from `docs/figures/` down.
- grill's fourth stop: `grep -c "Another entry's rulings file" docs/figures/orchestration/grill.svg` printed `0`; `sed -n 80p README.md | grep -c ...` printed `0`.
- The engine unchanged: `git diff --stat bcfb2e8 -- skills/code/handbook/templates/figures.py docs/figures/ordo_kinds.py` printed nothing.
- The figures that stand: `git diff --quiet bcfb2e8 -- <path>` exited 0 for all 28 figures after a regeneration.

## DONE / NOT DONE

| Item | State | Command and output |
|---|---|---|
| 1 The fifteen figures | DONE | `ls docs/figures/<group>/<name>.svg` printed each of the fifteen paths, `docs/figures/code/diagnose.svg` to `docs/figures/ordo/session-retro.svg`; each has its own function and a note (list below) |
| 2 The lifecycle figure | DONE | `ls docs/figures/academic/researcher/lifecycle.svg` printed the path; drawn by `researcher_lifecycle()` with `lanes_figure` and its own legend |
| 3 The head comment | DONE | the `ast` case printed `[]`; line 1 reads `"""Write the SVG figures of the skills under docs/figures/, one or more for each skill.` |
| 4 The carried Doc text | DONE | `grep -n 'writes the README sections it lacks' docs/figures/gen_figures.py docs/figures/academic/researcher/*.svg` printed nothing; `grep -c "drafts its README in the layout by the readme mode's" docs/figures/gen_figures.py` printed `1`; old-layout grep printed `docs/figures/academic/researcher/research.svg:2` and `docs/figures/academic/researcher/revision.svg:2`; `grep -c 'A README in the old layout: /researcher readme offered, a stop;' README.md` printed `2`; `grep -n 'novelty, idea and readme start no agent' docs/figures/gen_figures.py` printed `1076:        "novelty, idea and readme start no agent and are not drawn: novelty searches the "` |
| 5 `building.md` line 41 | DONE | read: it names the sixteen, counts "the four figures of `researcher`", names "its Steps", and `grep -o` printed ``Every skill of `skills/` has its figure under `docs/figures/`.``; `grep -n 'Every skill that launches agents' docs/dev/building.md` printed nothing |
| 6 `scripts.md` line 9 | DONE | read: it begins "Writes the SVG figures under `docs/figures/`" and names the sixteen |
| 7 The engine unchanged | DONE | `git diff --stat bcfb2e8 -- skills/code/handbook/templates/figures.py docs/figures/ordo_kinds.py` printed nothing |
| 8 ASCII, panel, labels reworded | DONE | `LC_ALL=C grep -c '[^ -~]'` printed `0` for each of the sixteen; each figure is drawn by `_single` or `lanes_figure`, which draw the panel |
| 9 The step's check | DONE | the fifteen `ls` lines above; both scripts `exit 0` from the root and from `/tmp`; the second run: `second run: same` (47 lines); figure paths: no `MISSING` line over 31 paths |
| 10 The user's reading | DONE as far as the builder can | the sixteen figures are listed below for the reading at landing |
| 11 The figures that stand | DONE | `grep -c "Another entry's rulings file" docs/figures/orchestration/grill.svg` printed `2`; `sed -n 80p README.md \| grep -c "Another entry's rulings file"` printed `1`; each figure read, below |

Verify before you report:

1. The character-set check over the files the step changes (the command of the brief, this report included) printed only `exit: 0` (quoted from its run after this report was written).
2. `ruff check --select F,W2 docs/figures/gen_figures.py` printed `All checks passed!`; `ruff check --preview --select E3 docs/figures/gen_figures.py` printed `All checks passed!`; `git diff -U0 bcfb2e8 -- docs/figures/gen_figures.py | grep '^+' | grep -v '^+++' | awk 'length>101'` printed nothing.
3. The cases after the change:
   - The fifteen skills: each `ls` printed its path.
   - The lifecycle figure: `ls` printed `docs/figures/academic/researcher/lifecycle.svg`; reading: novelty and idea, the six stages Frame to Consolidate with dotted returns from Compare to Experiments ("a method cause"), Build ("an implementation cause") and Frame ("a dataset cause"), manuscript with Stage 2.5 and Stage 4.5 integrity checks inside it, revision, the README lane and `/researcher readme, beside them`.
   - Both scripts: `exit 0` and `exit 0` from the root, `exit 0` and `exit 0` from `/tmp`.
   - A second run: `diff` of the two `shasum` lists printed nothing, `same, 47 lines`.
   - No bytecode: `find docs skills -name __pycache__` printed nothing.
   - ASCII: `0` for each of the sixteen new figures.
   - Figure paths: 31 paths, no `MISSING` line.
   - Refusals left out: `grep -c` in `orchestration/refute.svg` printed `2` for "A model other than the configured one" and `0` for each of "A required key missing", "No ledger folder", "No report" and "The configured effort cannot apply".
   - A skill with no stop: `grep -c 'fff1e6' docs/figures/explain/wait-what.svg` (the stop fill) printed `0`; its note says "Its Stops row is No stop, so no box is orange".
   - A skill that starts no agent: `grep -c 'stroke-dasharray="6 4"' docs/figures/code/wizard.svg` printed `0`; its title lists each box as `(a step of the session)` (rounded) or `(stop)`, "The stage list (stop)" and "An action not known (stop)".
   - A skill whose run repeats: `orchestration/plan-orchestration.svg` draws a dotted arrow from `/land` back to the first box, "the next step, until a pause or no unblocked step", and one from the repair round to the review, "a further round, at most repair_rounds".
   - The Doc text: as item 4 above.
   - The script writes each new figure: the output holds the sixteen lines, from `wrote docs/figures/code/diagnose.svg (19813 bytes)` to `wrote docs/figures/academic/researcher/lifecycle.svg (26482 bytes)`.
   - The head comment: `[]`.
   - The pages: by reading, as items 5 and 6 above.
   - grill's fourth stop: `2` and `1`.
   - The engine unchanged: nothing printed.
   - The figures that stand: `git diff --quiet bcfb2e8` exits 0 for 15 of the 28 and not for 13: `academic/grant.svg`, `academic/referee.svg`, `academic/researcher/manuscript.svg`, `academic/researcher/research.svg`, `academic/researcher/revision.svg`, `academic/submit.svg`, `code/codebase-design.svg`, `orchestration/grill.svg`, `orchestration/pipeline.svg` (the five the case leaves out and the four item 11 brings up to their skills), `academic/paper/disclosure.svg` (item 11, ruling 4 of the repair round), and `academic/paper/full.svg`, `academic/paper/lit-review.svg`, `academic/paper/outline-only.svg` (ruling 1 of the repair round alone).
4. Sentence length and list items, read against the prose standard and skill layout:
   - `building.md` line 41, the sentence that begins ``python3 docs/figures/gen_figures.py` writes``, runs past 20 words: it is the enumeration of every figure the script writes, which item 5 asks for in that sentence; it stays one sentence as it stood.
   - `scripts.md` line 9 is a table cell holding the same enumeration, as it stood.
   - The head comment's sentence "A figure listed above with the steps of a skill draws a step, or a run of steps that make one move, as one box: ..." runs past 20 words, since it names the four kinds of box of Decisions 1 in one list; the other added sentences are under 25 words.
   - The added head-comment list entries each take the form of the entries that stand.
5. The grep of rule 14 (`git grep -n -F "<phrase>" -- skills utils docs README.md`): "Every skill that launches agents", "writes the README sections it lacks", "novelty and idea start no agent", "figures of the README", "the runs of the skills that start agents" and "the three figures of" printed nothing. "the last two" printed eight lines, none about the figures: `skills/academic/paper-review-panel/SKILL.md:493`, `skills/academic/referee/SKILL.md:217`, `skills/academic/researcher/SKILL.md:317`, `skills/academic/researcher/SKILL.md:672`, `skills/orchestration/grill/SKILL.md:89`, `skills/orchestration/plan-orchestration/SKILL.md:459`, `skills/orchestration/plan/SKILL.md:91`, `skills/orchestration/roadmap/SKILL.md:53`, `skills/ordo/ordo-init/SKILL.md:76`. Sentences about the script as a whole, reread after the change: the head comment's "Every box, arrow and label is written in this file ... the script reads no skill file" holds (no new function reads a file); `README.md` line 78, "The skills that launch agents each have a figure of their own.", holds; ADR 0060 lines 7, 11, 13 hold (the engine is imported, unchanged); the note of `pipeline.svg`, "These start no agent: ...", holds.

## The terms

- **stop** is used in the figures and the head comment in the glossary's second sense, "any point in a skill's Stops table where it waits on the user"; the entry is read at `docs/glossary.md` line 130.
- **refusal** is used as the glossary's entry, "a skill's end without a decision for the user" (line 102), in every note's "The refusals are not drawn".
- **repair round** in `refute.svg` and `plan-orchestration.svg` is used as its entry (line 104).
- **step** in the head comment, in the legend row "Rounded box: a step the session does itself" and in the words of the kind `step`, "a step of the session", is used in the entry's second sense, "an item of a skill's Steps, cited as \"Steps <n>\"" (`docs/glossary.md` line 128): each rounded box of a figure of a skill's steps draws one item of that skill's Steps, or a run of them, and the report cites them as "Steps <n>". The plan step of the entry's first sense appears only as "the next step" on `plan-orchestration.svg`'s arrow back, where it is that sense.
- No glossary entry is added or changed, so no "Stated in" is checked.

## The sixteen figures, for the user's reading

Each box is a rounded box (a step the session does itself) unless marked: [stop] orange, [script] grey, [agent] solid, [maybe] dashed.

1. `docs/figures/code/diagnose.svg`, `diagnose()`, run by a person, `/diagnose <symptom>`: "The diagnosis record opened ..." (Steps 2-3); "The red command ..." (Steps 4-5); [stop] "No red command", with a dotted arrow back to the red command (Stops row, Steps 4); [stop] "A red command a person drives" (Stops row, "Ways to build a red command" 11); [stop] "Not enough output after redaction" (Stops row); "The case shrunk ..." (Steps 6); "Three to five ranked hypotheses ..." (Steps 7-8); [stop] "The hypotheses" (Steps 9-10); "A probe ..." (Steps 11-13), a dotted loop "one per hypothesis, in rank order" and a dotted arrow back to the hypotheses "every hypothesis falsified: a second list, once" (Steps 14); "The cause at its operation ..." (Steps 15); [stop] "The cause not found" (Stops row, Steps 15); "The test red without the fix, then the fix ..." (Steps 16-19); "The record shown, the scratch copy removed, the cause in the commit message" (Steps 21-23).
2. `docs/figures/code/wizard.svg`, `wizard()`, its one mode: the labels of Decisions 1 (Steps 1, Stops "The stage list", Steps 3, Stops "An action not known" with a dotted arrow back "your answer", Steps 4-5, 6, 7).
3. `docs/figures/code/handbook.svg`, `handbook()`, its one mode: "The repository read ..." (Steps 1-3); "The kinds chosen ..." (Steps 4); [stop] "The kinds" (Steps 5); "Each page drafted ..." (Steps 6); [script] "The diagrams drafted and drawn by templates/figures.py in a scratch folder" (Steps 7), dotted loop "a diagram refused: corrected, at most 3 times"; [stop] "The drafts" (Steps 8); "The approved drafts written, the diagrams and manual.html built" (Steps 9); [stop] "A command that fails" (Steps 9 and 10); "One commit of every file written" (Steps 10); "The end ..." (Steps 11).
4. `docs/figures/explain/wait-what.svg`, `wait_what()`, its one mode: one box, "The last message explained again ..." (Steps 1); Stops "No stop" in the note.
5. `docs/figures/explain/tutor.svg`, `tutor()`, teaching, `/tutor <topic>`: "MISSION.md read" (Teaching 1); [stop] "The mission interview" (Teaching 2); [stop] "The confirmation before the mission is changed" (Teaching 3); "Resources found ..." (4); "What the lesson teaches ..." (5); "The lesson designed ..." (6); "The lesson written ..." (7-8); "The lesson opened" (9).
6. `docs/figures/orchestration/land.svg`, `land()`, its one mode: the labels of Decisions 1, Steps 1, 2, [script] 3-6, [stop] "A lock held", "A red line for the user", "A rule clash", 7-8, 9-11, 12, 13, [stop] "A worktree that cannot be removed".
7. `docs/figures/orchestration/plan.svg`, `plan()`: Steps 1; Steps 2; [stop] "A gate with no count"; [stop] "The drafted step list" (Steps 3); Steps 4; Steps 5; Steps 6.
8. `docs/figures/orchestration/plan-orchestration.svg`, `plan_orchestration()`, `/plan-orchestration` and `continue the plan`: Steps 1-2; Steps 3 (`/spec`); [stop] "A wrong premise"; [maybe] the builder (Steps 4); [stop] "A model other than the configured one"; Steps 6-7; [maybe] "Builder, resumed: a repair round ..." (Steps 8) with a dotted arrow back "a further round, at most repair_rounds"; [stop] "A finding that is the user's"; Steps 9 (`/land`); [stop] "A red check"; [stop] "The roadmap diff"; dotted arrow back to the first box (Steps 10); apart: [stop] "A shape nobody named", "A rule clash".
9. `docs/figures/orchestration/plan-retro.svg`, `plan_retro()`: Steps 1; 2-5; 6-7; 8-9; [stop] "The proposals" (Steps 10); 11-12; 13-14; 15.
10. `docs/figures/orchestration/refute.svg`, `refute()`, the first run with the run over a repair round: the labels of Decisions 1: [agent] reviewer (Steps 1-6), [stop] "A model other than the configured one", Steps 7, Steps 8, [maybe] "Reviewer over a repair round: the delta" ("Steps / Over a repair round") with the dotted arrow back "its findings, at most repair_rounds".
11. `docs/figures/orchestration/roadmap.svg`, `roadmap()`, `/roadmap add <goal>`: the labels of Decisions 1 (Steps 1; "add" 1-5; [stop] "No gate", "The level", "The insertion form", "A missing dependency"; [stop] "The change", Steps 3; Steps 4-5).
12. `docs/figures/orchestration/spec.svg`, `spec()`: Steps 1-2; [maybe] "Diagnosis agent, for a part that asks for a cause" (Steps 2); [stop] "A false premise the plan cannot absorb", "A rule clash with an ADR", "A cause not found"; Steps 3; [stop] "A user-visible choice"; Steps 4-5; [maybe] "Brief-check agent, for a full step" ("Steps / The brief check"); [stop] "A brief check finding the brief cannot absorb", "A model other than the configured one"; Steps 6-9; apart: [stop] "A step that does not converge".
13. `docs/figures/ordo/ordo-help.svg`, `ordo_help()`, `/ordo-help <entry>`: the four labels of Decisions 1 ("The sequence and the plans" 1-4).
14. `docs/figures/ordo/ordo-init.svg`, `ordo_init()`, an existing repository with no `plan.yaml`: "An existing repository" 1-2; [stop] "Several roadmaps"; 3-5; [stop] "A failing command"; [stop] "Worker, reviewer and libraries" (6); [stop] "The questions" (6, no `CLAUDE.md`); 7-11; [stop] "The draft of the configuration" (12-13); 14; [script] `check_config.py` then `sync_rules.py` (15); [stop] "A fix in the configuration check", "A hunk to rule on", "The drafted sync change", "A file sync cannot use", "The sync still fails" (15, the sync of "A configured repository" 7-14); 16; [stop] "No commit allowed".
15. `docs/figures/ordo/session-retro.svg`, `session_retro()`, `/session-retro <entry>`: Steps 1; 2; [script] "The reader, transcript_window.py ..." (3); [stop] "A large output" (4); 5-6; 7-9; [stop] "The proposals" (10); 11-12.
16. `docs/figures/academic/researcher/lifecycle.svg`, `researcher_lifecycle()`, ruling D19: lanes for novelty and idea; the six stages of research with the returns from Compare; manuscript with its stages and both integrity checks; revision; the README frame captioned "README.md, read and written by idea, research, research adopt, full, revision and readme" and the readme mode beside it; the note says `full runs idea, then research and manuscript` (ADR 0054).

## Item 11: each figure that stands, read against its skill's Stops table

- `orchestration/grill.svg`: missing "Another entry's rulings file"; added, before the first round, with an arrow to "A round" labelled "the file put right, then /grill again"; README line 80 names it.
- `orchestration/pipeline.svg`: the `/grill` lane missed "Another entry's rulings file"; added; README line 72 names it. The other lanes (ordo-init 15 stops, roadmap add 5, plan 2, roadmap done, plan-retro, session-retro 2, diagnose 5) miss none.
- `orchestration/plan-loop.svg`: none missing (spec 7, refute 1, land 4, plan-orchestration 7).
- `academic/writing.svg`, `code/code-comments.svg`: none; every row of both tables is a refusal.
- `academic/paper-review-panel.svg`: none for the full mode ("The Reviewer Configuration", "The coaching question"; the tagged rows end the run and do not wait).
- `academic/referee.svg`: missing "The round"; added apart as "The round, for a plain request that does not say it"; README line 86 follows.
- `academic/submit.svg`: missing "A run folder that exists" and "Which config"; added apart; README line 94 follows.
- `academic/grant.svg`: missing "The mode" and "Which config"; added apart; README line 96 follows.
- `code/codebase-design.svg`: missing "The user interface"; added at the head of both panels; README line 100 follows.
- `academic/researcher/manuscript.svg`: missing "The entry point", "An unfinished run", "An incomplete revision", "A run that fails", "The parsed comments", "The strategic coaching" and "The checkpoint after the completeness check" (the last three for a call with a comments file); "An incomplete revision" added after Stage 4, the others apart; README line 88 follows.
- `academic/researcher/research.svg`: missing "A README in the old layout" (item 4), "The entry point" and "A run that fails"; added apart; README line 90 follows.
- `academic/researcher/revision.svg`: missing "A README in the old layout" (item 4), "An incomplete revision", "The entry point", "An unfinished run" and "A run that fails"; "An incomplete revision" added after Stage 4 and after the completeness check, the others apart; README line 92 follows.
- The twelve `academic/paper/<mode>.svg`: read stop by stop in the table of "Repair round 1", ruling 4. `disclosure.svg` drew "The session's questions" and "The venue's policy" in one box; each now has its own box, and README line 116 follows. The other eleven miss none.
- `academic/paper/lifecycle.svg`, `academic/paper/run-folder.svg`, `academic/researcher/academic-pipeline.svg`: draw no run and no stop, by design; not changed.

## Files

- `docs/figures/gen_figures.py`: 2593 lines (1071 added, 66 removed, `git diff --numstat bcfb2e8`).
- New figures: `code/diagnose.svg` 92, `code/wizard.svg` 44, `code/handbook.svg` 77, `explain/wait-what.svg` 16, `explain/tutor.svg` 51, `orchestration/land.svg` 64, `orchestration/plan.svg` 48, `orchestration/plan-orchestration.svg` 87, `orchestration/plan-retro.svg` 52, `orchestration/refute.svg` 46, `orchestration/roadmap.svg` 46, `orchestration/spec.svg` 80, `ordo/ordo-help.svg` 23, `ordo/ordo-init.svg` 90, `ordo/session-retro.svg` 54, `academic/researcher/lifecycle.svg` 131 (`wc -l`).
- Rewritten figures (added/removed by `git diff --numstat bcfb2e8`): `academic/grant.svg` 36/29, `academic/paper/disclosure.svg` 43/35, `academic/paper/full.svg` 2/2, `academic/paper/lit-review.svg` 2/2, `academic/paper/outline-only.svg` 2/2, `academic/referee.svg` 21/18, `academic/researcher/manuscript.svg` 195/168, `academic/researcher/research.svg` 26/16, `academic/researcher/revision.svg` 282/261, `academic/submit.svg` 30/22, `code/codebase-design.svg` 63/51, `orchestration/grill.svg` 41/36, `orchestration/pipeline.svg` 52/49.
- `README.md` 10/10 (lines 72, 80, 86, 88, 90, 92, 94, 96, 100, 116); `docs/dev/building.md` 1/1 (line 41); `docs/dev/scripts.md` 1/1 (line 9).
- This report.

## Judgment calls the brief left open

- `plan`'s Stops row "The plan exists" resumes with "Nothing" and the table does not say whether it is a stop; it is drawn as a refusal, as `pipeline.svg` already leaves it out, and the note of `plan.svg` names it among the refusals not drawn.
- `ordo-init.svg` holds 17 boxes, past the "about twelve" of Decisions 1, since the existing-repository mode has eleven stops that wait on the user and the brief has every one drawn; the steps are grouped into six boxes.
- `plan-orchestration.svg` draws `/spec`, `/refute` and `/land` as rounded boxes, the session's invocations, with their own agents and stops pointed to `plan-loop.svg` in the note; "A shape nobody named" and "A rule clash" stand apart, since they can arise at any step.
- The lifecycle figure draws three returns from Compare (method to Experiments, implementation to Build, dataset to Frame), the causes "research" item 15 names; the research-question cause reopening idea is in the note, since a row's return reaches only a lane of its own row. The README frame names the modes that read and write the README, idea, research, research adopt, full, revision and readme, and manuscript in a box with its condition; novelty writes into `notes/` and reads no README, which the note says.
- Stops added under item 11 that a figure's run does not reach from one box ("The entry point", "An unfinished run", "A run that fails", the mode and config questions of `grant` and `submit`, "The round" of `referee`) stand apart, as the paper figures draw "The mode to run".
- A helper `_steps` builds the legend of each figure of steps from the kinds and arrows it draws, so a legend holds only its rows (item 1); the rounded-box row reads "Rounded box: a step the session does itself" (Decisions 1), and a dotted loop on a step has its own row, "Dotted loop on one box: a step repeated, with its cap", since the row of the figures that stand speaks of an agent.

## User-visible changes

- Sixteen new SVG files under `docs/figures/`, none shown in the README.
- The text alternative (`<title>` and `aria-label`) of every rounded box: before "(question)"; after "(a step of the session)" in the fifteen figures of a skill's steps, "(the session reads and judges)" in the paper figures and in `research.svg` and `revision.svg`. `run-folder.svg`'s text alternative names its arrows, not its boxes, and does not change.
- `README.md` alt texts of nine figures: before, e.g. line 80 `![The grill skill: Lookup agent, when a decision needs ...`; after `![The grill skill: Another entry's rulings file, a stop, going to the first round once the file is put right and /grill runs again; Lookup agent, when a decision needs ...`. Line 90 before `and apart: A project underway: research adopt offered, a stop; The jobs submitted: ...`, after `and apart: A project underway: research adopt offered, a stop; A README in the old layout: /researcher readme offered, a stop; The jobs submitted: ...`. Line 92 before `and apart: The jobs submitted: ...`, after `and apart: A README in the old layout: /researcher readme offered, a stop; The jobs submitted: ...`. Lines 72, 86, 88, 94, 96 and 100 each gain the stops item 11 added, in the same form. Line 116 before `You name the venue, and paste the policy of a venue it does not know, a stop;`, after `The session's questions: the venue, for a call with no selector, a stop; The venue's policy: you paste it, for a venue not in the database, a stop reached from the questions or from the call's own venue;`.
- `docs/dev/building.md` line 41: before "the three figures of `researcher` ... Every skill that launches agents has its figure under `docs/figures/`. A change to a skill's Stops table, its sequence, ..."; after it names the sixteen, "the four figures of `researcher`", "Every skill of `skills/` has its figure under `docs/figures/`." and "A change to a skill's Stops table, its Steps, its sequence, ...".
- `docs/dev/scripts.md` line 9: before "Writes the SVG figures of the README from the labels ..."; after "Writes the SVG figures under `docs/figures/` from the labels ...", with the sixteen named and the kinds `step`, `judge` and `folder` beside `paper`.
- The notes of `research.svg` (the adopt sentence) and `manuscript.svg` (novelty, idea and readme) as item 4 dictates.

## Anything in the brief wrong or impossible

None.

## Repair round 1

Each ruling of `agents/briefs/5-round-1.md` is carried out. Every check below was run after the last edit of the round.

1. **The text alternative of a rounded box.** Done.
   - `FIGURE_KINDS` holds `paper` and three new kinds: `step` ("a step of the session"), `judge` ("the session reads and judges") and `folder` ("a folder"). Each takes its style from the engine as `ROUNDED = next(kind.style for kind in KINDS.values() if kind.style.pill)`, the one rounded kind of the engine's `KINDS`. A short `python3 -c` over `KINDS` printed `['choice']` as the only kind with `pill`, so no style is copied by hand. `KINDS` and `Kind` are added to the import from the engine.
   - Which boxes take which kind: `step` in the fifteen figures of a skill's steps, with `STEP_LEGEND` and the test in `_steps`. `judge` in `_search`, `paper_lit_review_graph`, `researcher_research` and `researcher_revision`, and in the legend rows `PAPER_KIND_LEGEND` and the two of `research.svg` and `revision.svg`. `folder` in `paper_run_folder` and `RUN_FOLDER_LEGEND`.
   - `grep -c '"choice"' docs/figures/gen_figures.py` printed `0`. `grep -l '(question)' docs/figures/*/*.svg docs/figures/*/*/*.svg` printed nothing.
   - The engine and `ordo_kinds.py` are unchanged: `git diff --stat bcfb2e8 -- skills/code/handbook/templates/figures.py docs/figures/ordo_kinds.py` printed nothing.
   - The head comment's paragraph on the mapping of kinds names the three kinds and their words. `sed -n 9p docs/dev/scripts.md | grep -o` printed ``the kinds `step`, `judge` and `folder` ``.
   - Figures whose SVG changes by this ruling alone: `academic/paper/full.svg`, `academic/paper/lit-review.svg` and `academic/paper/outline-only.svg` (2 lines each, the `aria-label` and the `<title>`).
   - Figures whose text alternative this ruling also changes, beside changes they already had: `academic/researcher/research.svg`, `academic/researcher/revision.svg`, `academic/paper/disclosure.svg` and the fifteen new figures of a skill's steps.
   - `academic/paper/run-folder.svg` does not change: its text alternative names its arrows and the files on them, and the kind of a box is not part of it.
2. **The README frame of the lifecycle figure.** Done.
   - The caption reads "README.md, read and written by idea, research, research adopt, full, revision and readme". The modes come from "What it reads" 18 (idea), 20 (research, research adopt, full, revision) and 25 (readme, research adopt).
   - Manuscript writes `## Papers` only when the README holds it (researcher "manuscript" Steps, SKILL.md line 547). It therefore stands in a box with that condition, "revision, and manuscript when the README holds ## Papers: each paper and the results it reports", and is not in the caption.
   - The legend row reads "Solid box: a part of the mode, the stage or the README named above it".
   - The note says "novelty reads no README and writes its page into notes/" and "a frame is a mode, a stage of research or the project's README".
   - The head comment says "In academic/researcher/lifecycle.svg a frame is a mode, a stage of research or the project's README", and its list entry names "the project's README with the modes that read and write it".
   - `grep -c 'which each mode reads first' docs/figures/academic/researcher/lifecycle.svg` printed `0`. `git grep -n -F 'which each mode reads first'` and `git grep -n -F 'a part of the mode or the stage'` over skills, utils, docs and README.md printed nothing.
   - The render was read: the frame's caption fits on one line, at `node_width=270`.
3. **The term step.** Done. The section "The terms" above lists **step** in the second sense of `docs/glossary.md` line 128, "an item of a skill's Steps", as the head comment, the legend row and the kind `step` use it.
4. **The paper mode figures.** Done. The table is below. One stop was found merged into another box and is now drawn as its own box: in `disclosure.svg`, the box "You name the venue, and paste the policy of a venue it does not know" drew two rows of the Stops table. It is now two stop boxes, "The session's questions: the venue, for a call with no selector" and "The venue's policy: you paste it, for a venue not in the database", with an arrow labelled "a venue not in the database" from the first to the second. README line 116 follows (`grep -c "a stop reached from the questions" README.md` printed `1`). The render was read.
5. **`plan`'s "The plan exists".** No change: it stays drawn as a refusal, and `plan.svg`'s note names it among the refusals not drawn.

The paper mode figures against `skills/academic/paper/SKILL.md` "Stops". For each mode, the stops are those its heading lists as "Stops this mode can reach". "Note" means the sentence `STOPS_NOT_DRAWN`, "Not drawn, since they hold in every mode: at every patch, a structural patch, a patch that does not apply or a failed script stops the run.", which every one of the twelve figures carries. Each box is quoted from the figure's `<title>`.

| Figure | Stop of the Stops table | Where the figure draws it |
|---|---|---|
| full.svg | The mode to run | box "The mode to run, for a plain request that fits two modes" |
| full.svg | The intake confirmation | box "Intake agent: you confirm" |
| full.svg | The sources' review | box "You review the sources, optional" |
| full.svg | The outline's approval | box "Outline approval" |
| full.svg | A generator phase aborted | box "A generator phase aborted" |
| full.svg | The draft review does not pass | box "The draft review does not pass" |
| full.svg | A claim the run cannot support | box "A claim the run cannot support" |
| full.svg | A reference that cannot be confirmed | box "A reference that cannot be confirmed, only under strict" |
| full.svg | The citation style to confirm | box "The citation style to confirm" |
| full.svg | A structural patch, A patch that does not apply, A script failed | note |
| full.svg | A converted file to replace | box "A converted file to replace" |
| full.svg | The reply to the closing review | box "The reply to the closing review" |
| outline-only.svg | The mode to run | box "The mode to run, ..." |
| outline-only.svg | The intake confirmation | box "Intake agent: you confirm" |
| outline-only.svg | The sources' review | box "You review the sources, optional" |
| outline-only.svg | The outline's approval | box "Outline approval" |
| revision.svg | The mode to run | box "The mode to run, ..." |
| revision.svg | The session's questions | box "The session's questions, in one message" |
| revision.svg | A revision item that needs restructuring | box "A revision item that needs restructuring" |
| revision.svg | A claim the run cannot support | box "A claim the run cannot support" |
| revision.svg | A reference that cannot be confirmed | box "A reference that cannot be confirmed, only under strict" |
| revision.svg | The citation style to confirm | box "The citation style to confirm" |
| revision.svg | A structural patch, A patch that does not apply, A script failed | note |
| revision.svg | The reply to the closing review | box "The reply to the closing review" |
| response-letter.svg | The mode to run | box "The mode to run, ..."; the heading lists no other stop |
| revision-coach.svg | The mode to run | box "The mode to run, ..." |
| revision-coach.svg | The parsed comments | box "You confirm the parsed comments" |
| rebuttal-audit.svg | The mode to run | box "The mode to run, ..."; the heading lists no other stop |
| abstract-only.svg | The mode to run | box "The mode to run, ..." |
| abstract-only.svg | The intake confirmation | box "Intake agent: you confirm" |
| abstract-only.svg | A structural patch, A patch that does not apply, A script failed | note |
| lit-review.svg | The mode to run | box "The mode to run, ..." |
| lit-review.svg | The intake confirmation | box "Intake agent: you confirm" |
| lit-review.svg | The sources' review | box "You review the sources, optional" |
| lit-review.svg | A reference that cannot be confirmed | box "A reference that cannot be confirmed" |
| format-convert.svg | The mode to run | box "The mode to run, ..." |
| format-convert.svg | The session's questions | box "The session's questions, in one message" |
| format-convert.svg | The target to settle | box "The target to settle" |
| format-convert.svg | A converted file to replace | box "A converted file to replace" |
| format-convert.svg | A structural patch, A patch that does not apply, A script failed | note |
| citation-check.svg | The mode to run | box "The mode to run, ..." |
| citation-check.svg | The session's questions | box "The session's questions, in one message" |
| citation-check.svg | A claim the run cannot support | box "A claim the run cannot support" |
| citation-check.svg | A reference that cannot be confirmed | box "A reference that cannot be confirmed, only under strict" |
| citation-check.svg | The citation style to confirm | box "The citation style to confirm, when more than half the cited entries follow another style than the Citation Format row" |
| citation-check.svg | A structural patch, A patch that does not apply, A script failed | note |
| disclosure.svg | The mode to run | box "The mode to run, ..." |
| disclosure.svg | The session's questions (only with no selector) | box "The session's questions: the venue, for a call with no selector" (added this round) |
| disclosure.svg | The venue's policy | box "The venue's policy: you paste it, for a venue not in the database" (added this round) |
| disclosure.svg | The uncertain AI use | box "You confirm each uncertain kind of AI use" |
| disclosure.svg | A structural patch, A patch that does not apply, A script failed | note |
| plan.svg | The mode to run | box "The mode to run, ..." |
| plan.svg | The intake confirmation | box "Intake agent: 3 questions, you confirm" |
| plan.svg | The mentor's question | box "The mentor's question" |

Rows that wait on the user but are not in any mode figure: "The calibration's folder" and "The calibration's pairs" belong to the calibration, a run of its own (Steps 12), which no mode reaches. The rows after "A script failed" are refusals.

The checks, rerun after the last edit:
- Both scripts exit 0 from the repository root (`exit 0`, `exit 0`, with `wrote docs/figures/academic/researcher/academic-pipeline.svg (22164 bytes)`) and from `/tmp` (`exit 0`, `exit 0`).
- The second run: `diff` of the two `shasum` lists printed nothing, `second run: same, 47 lines`.
- `find docs skills -name __pycache__` printed nothing.
- The script's output holds the sixteen `wrote` lines of the new figures: `grep -cE` printed `16`.
- `ruff check --select F,W2 docs/figures/gen_figures.py` printed `All checks passed!`, and `ruff check --preview --select E3 docs/figures/gen_figures.py` printed `All checks passed!`.
- The awk check of added lines over 101 characters printed nothing. Lines whose only change was the new kind word were wrapped into multi-line `Node(...)` calls. A copy of `docs/figures/` taken before a regeneration and compared with `diff -rq` afterwards showed no figure changed by the wrap.
- ASCII: `LC_ALL=C grep -c '[^ -~]'` printed `0` for each of the sixteen new figures. The brief's perl check over its file list, this report included, printed `exit: 0`.
- Figure paths: the 31 paths `git grep` finds each pass `test -f`.
- The `ast` check printed `[]`.
- The Doc text:
  - The grep for "writes the README sections it lacks" printed nothing.
  - The adopt phrase count printed `1`.
  - "A README in the old layout" counts printed `2` in each of research.svg and revision.svg, and `2` in README.md.
  - The `novelty, idea and readme start no agent` count printed `1`.
- grill: `2` and `1`.
- Pages: `grep -c 'Every skill that launches agents' docs/dev/building.md` printed `0`, and the new sentence count printed `1`.
- The engine is unchanged.
- Refusals left out of refute.svg: `2` for its stop, and `0` for each of the four refusals.
- wait-what.svg has no stop fill: `0`.
- wizard.svg has no dashed box: `0`. Its `<title>` gives each rounded box as "(a step of the session)".
- The figures that stand: 15 of the 28 are unchanged. The 13 that changed are named in the cases section above with the item or ruling that changed each.

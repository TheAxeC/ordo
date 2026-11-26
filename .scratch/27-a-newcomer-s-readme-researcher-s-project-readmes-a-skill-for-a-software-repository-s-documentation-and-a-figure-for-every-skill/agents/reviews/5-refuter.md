# Step 5 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill-5, base 6947c94)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

The script runs below were made on a copy of the worktree, made with `rsync -a --exclude .git`, at /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/refute5/wt. Before copying, I took the `shasum` of every file under `docs/figures/` in the worktree (47 lines). The copy's first run of both scripts gave the same 47 hashes, so the figures in the worktree are what the script writes.

```
$ printf '%s\0' docs/figures/gen_figures.py docs/figures/code/*.svg docs/figures/explain/*.svg docs/figures/orchestration/*.svg docs/figures/ordo/*.svg docs/figures/academic/researcher/*.svg docs/dev/building.md docs/dev/scripts.md README.md <ledger>/agents/reviews/5-report.md | xargs -0 perl -CSD -ne '...'; echo "exit: $?"
exit: 0
$ ruff check --select F,W2 docs/figures/gen_figures.py
All checks passed!
$ ruff check --preview --select E3 docs/figures/gen_figures.py
All checks passed!
$ git diff -U0 6947c94 -- docs/figures/gen_figures.py | grep '^+' | grep -v '^+++' | awk 'length>101'
(nothing)
$ git diff --stat 6947c94 -- skills/code/handbook/templates/figures.py docs/figures/ordo_kinds.py
(nothing)
(copy) $ python3 docs/figures/gen_figures.py; echo "exit $?"
43 wrote lines, the sixteen new ones among them: wrote docs/figures/orchestration/land.svg (12684 bytes) ... wrote docs/figures/code/diagnose.svg (19813 bytes) ... wrote docs/figures/academic/researcher/lifecycle.svg (26482 bytes) ... wrote docs/figures/explain/wait-what.svg (2982 bytes) ... wrote docs/figures/ordo/session-retro.svg (10899 bytes)
exit 0
(copy) $ python3 docs/figures/academic/researcher/gen_academic_pipeline.py; echo "exit $?"
wrote docs/figures/academic/researcher/academic-pipeline.svg (22164 bytes)
exit 0
(copy) shasum list after run 1 vs worktree before: diff printed nothing (SAME1)
(copy) second run of both scripts: exit 0, exit 0; shasum diff printed nothing (SAME2)
(from /tmp, the scripts given by path) exit 0, exit 0; shasum diff printed nothing (SAME3)
$ find docs skills -name __pycache__
(nothing)
$ for each of the 16 paths: ls docs/figures/<p>.svg; LC_ALL=C grep -c '[^ -~]' docs/figures/<p>.svg
each path printed, each count 0
$ git grep -ohE 'docs/figures/[A-Za-z0-9_/.-]*\.(svg|py)' -- README.md docs skills ':!docs/roadmap.md' | sort -u   -> 31 paths; test -f printed no MISSING
$ grep -n 'writes the README sections it lacks' docs/figures/gen_figures.py docs/figures/academic/researcher/*.svg
(nothing, exit 1)
$ grep -c "drafts its README in the layout by the readme mode's" docs/figures/gen_figures.py
1
$ grep -c 'A README in the old layout: /researcher readme offered' research.svg revision.svg
revision.svg:2
research.svg:2
$ grep -c 'A README in the old layout: /researcher readme offered, a stop;' README.md
2
$ grep -n 'novelty, idea and readme start no agent' docs/figures/gen_figures.py
1041:        "novelty, idea and readme start no agent and are not drawn: novelty searches the "
$ python3 -c "import ast, sys; ..." <the sixteen paths>
[]
$ grep -n 'Every skill that launches agents' docs/dev/building.md
(nothing, exit 1)
$ grep -c "Another entry's rulings file" docs/figures/orchestration/grill.svg
2
$ sed -n 80p README.md | grep -c "Another entry's rulings file"
1
$ for each tracked figure: git diff --quiet 6947c94 -- <path> || echo CHANGED
CHANGED docs/figures/academic/grant.svg
CHANGED docs/figures/academic/referee.svg
CHANGED docs/figures/academic/researcher/manuscript.svg
CHANGED docs/figures/academic/researcher/research.svg
CHANGED docs/figures/academic/researcher/revision.svg
CHANGED docs/figures/academic/submit.svg
CHANGED docs/figures/code/codebase-design.svg
CHANGED docs/figures/orchestration/grill.svg
CHANGED docs/figures/orchestration/pipeline.svg
$ grep -c <each> docs/figures/orchestration/refute.svg
A model other than the configured one: 2; A required key missing: 0; No ledger folder: 0; No report: 0; The configured effort cannot apply: 0
$ grep -c 'fff1e6' docs/figures/explain/wait-what.svg docs/figures/code/wizard.svg
wait-what.svg:0
wizard.svg:3
$ grep -o 'stroke-dasharray="[^"]*"' docs/figures/orchestration/plan-orchestration.svg | sort | uniq -c
   3 stroke-dasharray="2 4"
   3 stroke-dasharray="6 4"
$ rule 14 greps (git grep -n -F "<phrase>" -- skills utils docs README.md): "Every skill that launches agents", "writes the README sections it lacks", "novelty and idea start no agent", "figures of the README", "the runs of the skills that start agents", "the three figures of": nothing each; "the last two": 9 lines, none about figures (paper-review-panel:493, referee:217, researcher:317, researcher:672, grill:89, plan-orchestration:459, plan:91, roadmap:53, ordo-init:76)
$ ls -d skills/*/*/ against ls docs/figures/*/ docs/figures/*/*/ : each of the 25 skills has at least one figure
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. I read each of the fifteen new functions against its skill's Steps and Stops table: `diagnose`, `wizard`, `handbook`, `land`, `plan`, `plan_orchestration`, `plan_retro`, `refute`, `roadmap`, `spec`, `wait_what`, `tutor`, `ordo_help`, `ordo_init` and `session_retro`. Each figure is drawn at its D5 path and its function sits in its group's place in `figures()`. Every stop that waits on the user is drawn and no refusal is drawn: I checked this against each Stops table's own text on which rows are stops. Each figure has a note that names the other modes. The legend holds only the kinds drawn, through `_steps`. The rounded boxes' text alternative is raised under Behaviour 1, which is outside the brief's named kind.
- 2: holds. `researcher_lifecycle()` writes `academic/researcher/lifecycle.svg` with `lanes_figure` and its own legend. It draws novelty, idea, the six stages with returns from Compare to Experiments, Build and Frame (which matches researcher "research" item 15's causes), manuscript with Stage 2.5 and Stage 4.5, revision, the README lane and the readme lane. Its note says "full runs idea, then research and manuscript". One wording defect is raised under Standards 1.
- 3: holds. The `ast` case printed `[]`. Line 1 reads "Write the SVG figures of the skills under docs/figures/, one or more for each skill." The paragraph now reads "Every figure but three shows the order of a run" and names all three figures that draw no run. The paragraph on the folder rule is unchanged (it is a context line in the diff). The sentence on what changes the labels now names "Steps".
- 4: holds. The doc-text greps above give nothing, 1, 2 and 2, 2, and one line. Node `O` stands before `J` in both floating tuples (gen_figures.py, `researcher_research` and `researcher_revision`). README lines 90 and 92 are as the brief dictates (word diff).
- 5: holds. `docs/dev/building.md` line 41 names the sixteen new figures, "the four figures of `researcher`", "its Steps", and "Every skill of `skills/` has its figure under `docs/figures/`.". That last sentence is true by the skills/figures listing above.
- 6: holds. `docs/dev/scripts.md` line 9 reads "Writes the SVG figures under `docs/figures/`" and names the sixteen.
- 7: holds. The `git diff --stat` of the engine and of `ordo_kinds.py` printed nothing.
- 8: holds. The ASCII count is 0 for each new figure and the character-set check gives `exit: 0`. Each figure goes through `_single`/`compose` or `lanes_figure`, which draw the panel.
- 9: holds. Each of the fifteen files exists, both scripts exit 0 from the root and from /tmp, the second run is byte-identical over 47 files, and no figure path is missing.
- 10: not applicable to the build. It is the user's reading at landing, and the report lists the sixteen figures with their paths and the source of each box.
- 11: holds. `grill()` draws "Another entry's rulings file" with an arrow into "A round" (grill, "Steps" 2: raised "before the first round"), and README line 80 names it. I checked the additions to referee, submit, grant, codebase-design, manuscript, research, revision and pipeline against those skills' Stops tables. I also checked that plan-loop, writing, code-comments and paper-review-panel miss no stop that waits on the user (see the Declined point on the paper mode figures).

Cases of the brief's "Cases":

- The fifteen skills: met. Each `ls` printed its path. The builder's report gives the first run as "No such file".
- The lifecycle figure: met. `ls` printed the path. I read it as summarised in item 2.
- Both scripts: met. Each run printed exit 0, from the root and from /tmp.
- A second run: met. The shasum lists were identical (SAME2).
- No bytecode: met. The `find` printed nothing.
- ASCII: met. The count is 0 for each of the sixteen.
- Figure paths: met. There are 31 paths and none is missing.
- Refusals left out: met. The refute.svg counts are 2 for the stop and 0 for each of the four refusals.
- A skill with no stop: met. The stop fill count in wait-what.svg is 0, and the note says "Its Stops row is No stop, so no box is orange".
- A skill that starts no agent: met. The aria-label of wizard.svg lists only `(question)` and `(stop)` boxes, and both stops are named.
- A skill whose run repeats: met. Two dotted back edges are drawn: "the next step, until a pause or no unblocked step" and "a further round, at most repair_rounds".
- The Doc text: met. See the greps above.
- The script writes each new figure: met. All sixteen `wrote` lines are in the output.
- The head comment: met. It printed `[]`.
- The pages, by reading: met. Both lines name the sixteen, and the grep of "Every skill that launches agents" prints nothing.
- Paths from `docs/figures/` down: met. Every path in my run and in the report is given that way.
- grill's fourth stop: met. The counts are 2 and 1.
- The engine unchanged: met. Nothing was printed.
- The figures that stand: met. Exactly the five figures the case leaves out changed, plus the four the report names under item 11 (grant, referee, submit, codebase-design). pipeline.svg is counted with grill, through its `/grill` lane.

## 1. Spec

- <ledger>/agents/reviews/5-report.md, "The terms":
  - Quoted: the section lists only "stop", "refusal" and "repair round".
  - What is wrong: the brief's Report asks for "each term of the glossary the diff adds, changes or uses in a new place". The diff uses **step** in a new place, in the head comment ("A figure listed above with the steps of a skill draws a step, or a run of steps that make one move, as one box") and in the legend `STEP_LEGEND`. That is the glossary's second sense, "an item of a skill's Steps". The report does not list it. The use itself agrees with the entry, so only the report is short.
  - Failure scenario: a reader checking terms through the report never learns that "step" now carries its second sense in the script's head comment.
  - Verdict: none. No item or case depends on it.

## 2. Proof

none

## 3. Standards

- docs/figures/gen_figures.py:1325, :1274 and :1359 (also the head comment at :84):
  - Quoted: `"The project's README.md, which each mode reads first and writes"`, `Legend("agent", "Solid box: a part of the mode or the stage named above it")` and `"The figure draws no run: a frame is a mode or a stage, and a box in it is a part of it."`
  - What is wrong (first point): `novelty` neither reads nor writes the README. Researcher "novelty" leaves its page and `.bib` "both in the project's `notes/`", and "What it reads" 20 has the README read first only "For `research`, `research adopt`, `full` and `revision`". The builder's own report says so: "novelty writes into `notes/`, not into the README". The frame's caption still says "each mode".
  - What is wrong (second point): the README frame is neither a mode nor a stage, yet the note, the legend row and the head comment ("In academic/researcher/lifecycle.svg a frame is a mode or a stage of research") say every frame is one of the two.
  - Rule broken: prose standard 0, "State the fact". Rule 14 of the change standard: a sentence the change makes false.
  - Failure scenario: a reader of the figure concludes that `/researcher novelty` reads and updates the project README, and expects its verdicts there. A reader of the legend looks for a mode called "The project's README.md".
  - Two possible rewordings: "which the modes read first and write" with novelty left out, and a note clause "the last frame is the project's README".
  - Verdict: none. Item 2 holds as D19 rules it, since D19's own words are "the README as the file each mode reads first and writes". Whether to keep D19's wording or say it exactly is the orchestrator's call.

## 4. Behaviour

- skills/code/handbook/templates/figures.py:172 and docs/figures/gen_figures.py:223, as rendered in every new figure of steps:
  - Quoted: `"choice": Kind(Style(CARD, EDGE, "", INK, 1.5, True), "question")` and `STEP_LEGEND = Legend("choice", "Rounded box: a step the session does itself")`.
  - What is wrong: `describe()` writes each box's kind word into the SVG `<title>` and `aria-label`. Every rounded step box of the fifteen new figures is described as "(question)". For example, code/wizard.svg reads "How to run it (question); The script checked, not run (question)".
  - This contradicts the figure's own legend and Decisions 1, which say a rounded box is "a step the session does itself".
  - The builder's report says "its title lists each box as `(question)` (rounded)" but does not state this as a user-visible text alternative.
  - Failure scenario: a reader using a screen reader, or the alt text a page reuses, is told that "The commit by explicit path" in land.svg is a question put to them, and expects to be asked.
  - Possible fix without editing the engine: a new kind in `gen_figures.py`, such as `with_kinds({"paper": PAPER, "step": Kind(<choice's style>, "step")})`. That replaces the brief's named `choice` kind, so it is the orchestrator's to rule, not the builder's.
  - Verdict: none against the brief's items, since the brief named `choice`. Raised for a ruling.

## Declined to judge

- The twelve `academic/paper/<mode>.svg` figures against the Stops of `paper` (item 11). I did not read the paper skill's Stops table row by row against each mode figure. The report's "none missing" is unverified by me. Reading `skills/academic/paper/SKILL.md` "Stops" against the twelve paper functions in `gen_figures.py` would settle it.
- Whether each new figure reads well as a picture (layout, crowding, ordo-init.svg's 17 boxes against "about twelve"). That is the user's reading at landing (item 10), and the report names the 17-box call as a judgment call.
- `plan`'s row "The plan exists" drawn as a refusal. The Stops table does not say which of its rows are stops, and the row's resume is "Nothing". The builder's judgment call is reasonable by my reading, but the classification is the orchestrator's.
- `git status --short docs/figures` printing nothing after the scripts run. That holds only once the figures are committed, and is run on main at landing. Running it now in the worktree lists the untracked new figures.

Reviewer usage: aa254c90a04682a8f, claude-opus-5-5, 219604 tokens, 57 tool uses, 7 min 51 s.

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

## Repair round 1, refuted

```
(worktree) $ printf '%s\0' docs/figures/gen_figures.py docs/figures/code/*.svg docs/figures/explain/*.svg docs/figures/orchestration/*.svg docs/figures/ordo/*.svg docs/figures/academic/researcher/*.svg docs/dev/building.md docs/dev/scripts.md README.md <ledger>/agents/reviews/5-report.md | xargs -0 perl -CSD -ne '...'; echo "exit: $?"
exit: 0
$ ruff check --select F,W2 docs/figures/gen_figures.py
All checks passed!
$ ruff check --preview --select E3 docs/figures/gen_figures.py
All checks passed!
$ git diff -U0 6947c94 -- docs/figures/gen_figures.py | grep '^+' | grep -v '^+++' | awk 'length>101'
(nothing)
$ awk 'length>100' <base gen_figures.py> | wc -l   -> 34 ;  awk 'length>100' docs/figures/gen_figures.py | wc -l   -> 10
$ git diff --stat 6947c94 -- skills/code/handbook/templates/figures.py docs/figures/ordo_kinds.py
(nothing)
(copy at scratchpad/refute5r1/wt, rsync -a --exclude .git; shasum of the 47 files under docs/figures/ taken in the worktree first)
$ python3 docs/figures/gen_figures.py | grep -c wrote      -> 43
$ python3 docs/figures/gen_figures.py; echo "exit $?"      -> exit 0
$ python3 docs/figures/academic/researcher/gen_academic_pipeline.py -> wrote docs/figures/academic/researcher/academic-pipeline.svg (22164 bytes); exit 0
shasum list after the runs vs the worktree's: diff printed nothing (SAME)
from /tmp with the script given by path: exit 0; shasum diff printed nothing (SAME3)
$ find docs skills -name __pycache__
(nothing)
$ grep -c '"choice"' docs/figures/gen_figures.py
0
$ grep -l '(question)' docs/figures/*/*.svg docs/figures/*/*/*.svg
(nothing, exit 1)
each of the 16 new paths: ls prints it; LC_ALL=C grep -c '[^ -~]' prints 0
$ grep -n 'writes the README sections it lacks' docs/figures/gen_figures.py docs/figures/academic/researcher/*.svg   (nothing, exit 1)
$ grep -c "drafts its README in the layout by the readme mode's" docs/figures/gen_figures.py   -> 1
$ grep -c 'A README in the old layout: /researcher readme offered' research.svg revision.svg   -> 2 and 2
$ grep -c 'A README in the old layout: /researcher readme offered, a stop;' README.md   -> 2
$ grep -n 'novelty, idea and readme start no agent' docs/figures/gen_figures.py   -> 1076:        "novelty, idea and readme start no agent and are not drawn: novelty searches the "
$ python3 -c "import ast, sys; ..." <the sixteen paths>   -> []
$ git grep -ohE 'docs/figures/...\.(svg|py)' -- README.md docs skills ':!docs/roadmap.md' | sort -u | test -f   -> no MISSING
$ grep -c <each> docs/figures/orchestration/refute.svg   -> configured-model stop 2; A required key missing 0; No ledger folder 0; No report 0; The configured effort cannot apply 0
$ grep -c 'fff1e6' wait-what.svg wizard.svg -> 0 and 3 ; grep -c 'stroke-dasharray="6 4"' wizard.svg -> 0
$ grep -o 'stroke-dasharray=...' plan-orchestration.svg | sort | uniq -c -> 3 "2 4", 3 "6 4"
$ grep -c "Another entry's rulings file" grill.svg -> 2 ; sed -n 80p README.md | grep -c ... -> 1
$ for each tracked figure: git diff --quiet 6947c94 -- <path> || echo CHANGED
grant, paper/disclosure, paper/full, paper/lit-review, paper/outline-only, referee, researcher/manuscript, researcher/research, researcher/revision, submit, codebase-design, grill, pipeline  (13)
$ git grep -n -F 'Every skill that launches agents' / 'the three figures of' / 'figures of the README' -- skills utils docs README.md   (nothing each)
snapshot vs worktree: 20 files of files.txt differ (gen_figures.py, scripts.md, README.md, lifecycle, research, revision, the 15 new figures except none unlisted); 4 paths changed that files.txt does not list: paper/disclosure.svg, paper/full.svg, paper/lit-review.svg, paper/outline-only.svg (plus the round brief and the report in the ledger)
rendered by rsvg-convert to scratchpad/refute5r1/life.png and disc.png and read
```

## Verdicts

Items of the brief's "What to build", whole diff since the base:

- 1: holds. The fifteen figures stand at their D5 paths. Every `choice` box is now `step`, `judge` or `folder`, with no `(question)` left.
- 2: holds. See Standards 2 and 3 for two wording points on the README frame; neither makes the item violated.
- 3: holds. The `ast` case prints `[]`. See Standards 4 for a sentence over the length standard.
- 4: holds. The doc-text greps give nothing, 1, 2 and 2, 2 and one line.
- 5: holds. `docs/dev/building.md` line 41 is unchanged by the round.
- 6: holds, with Standards 5 (a missing word in the row).
- 7: holds. `git diff --stat` of the engine and `ordo_kinds.py` prints nothing.
- 8: holds. ASCII count 0 for each; the character-set check exits 0; the engine refuses any caption or label that does not fit, and both scripts exit 0.
- 9: holds. Both scripts exit 0, a second run changes no byte, and no figure path is missing.
- 10: not applicable to the build. It is the user's reading at landing.
- 11: holds. The twelve paper figures were read stop by stop (ruling 4 below). `disclosure.svg` now draws both stops. Standards 1 concerns how it draws their reach.

Cases of the brief's "Cases":

- The fifteen skills: met.
- The lifecycle figure: met.
- Both scripts: met.
- A second run: met.
- No bytecode: met.
- ASCII: met.
- Figure paths: met.
- Refusals left out: met.
- A skill with no stop: met.
- A skill that starts no agent: met.
- A skill whose run repeats: met.
- The Doc text: met.
- The script writes each new figure: met. I counted 43 `wrote` lines of the 47 files; I did not list the sixteen by name in my own run.
- The head comment: met.
- The pages, by reading: met.
- Paths from `docs/figures/` down: met.
- grill's fourth stop: met.
- The engine unchanged: met.
- The figures that stand, with the ruling 1 figures left out: met. Of the 13 figures changed since the base, `full`, `lit-review` and `outline-only` are the ruling 1 figures. `disclosure` is item 11 through ruling 4. The other nine are the five the case names plus the four item 11 figures the first report names.

The five rulings of the round's brief, against the tree:

- 1: carried out as asked (the kinds, the legends, `choice` count 0, `(question)` none, the engine unchanged, the head comment, `scripts.md`). `ROUNDED = next(kind.style for kind in KINDS.values() if kind.style.pill)` gives exactly the style of `choice`: `KINDS` holds one kind with `pill` True, `choice`, so the three kinds draw as `choice` drew. A script over every figure shows each text alternative carries a kind word exactly when the legend carries its row; `run-folder.svg` is the one flow figure whose label names arrows, not kinds. See Spec 1 and Proof 1 on what else the round changed or said.
- 2: carried out. The caption, the legend row, the note and the head comment say what the brief asks. I checked the modes against "What it reads" 18 (`idea`), 20 (`research`, `research adopt`, `full`, `revision`) and 25 (`readme`, `research adopt`): the caption's six modes are exactly those. `novelty` has no README line in its Steps. See Standards 2 and 3.
- 3: carried out. "The terms" lists **step** in its second sense.
- 4: carried out. Table of the twelve paper figures, below.
- 5: carried out. No change; `plan.svg`'s note names the refusal.

Ruling 4, table checked against `skills/academic/paper/SKILL.md` "Stops" and each mode's "Stops this mode can reach", with the stop boxes read from each SVG's `aria-label`:

| Figure | Stops its heading lists | Drawn |
|---|---|---|
| full | mode to run, intake, sources' review, outline approval, generator aborted, draft review, claim, reference, citation style, structural patch, patch not applied, converted file, closing-review reply, script failed | 10 stop boxes plus "The mode to run"; the three patch and script rows in the note. All present. |
| outline-only | mode, intake, sources' review, outline approval | all four |
| revision | mode, session's questions, restructuring, claim, reference, citation style, patch rows, reply, script failed | all, patch and script rows in the note |
| response-letter, rebuttal-audit | mode only | "The mode to run" only |
| revision-coach | mode, parsed comments | both |
| abstract-only | mode, intake, patch and script rows | mode, intake, note |
| lit-review | mode, intake, sources' review, reference | all four |
| format-convert | mode, session's questions, target, converted file, patch and script rows | all, note for the rest |
| citation-check | mode, session's questions, claim, reference, citation style, patch and script rows | all |
| disclosure | mode, session's questions (no selector), venue's policy, uncertain AI use, patch and script rows | all four boxes now drawn; see Standards 1 |
| plan | mode, intake, mentor's question | all three |

The report's table agrees with these figures row by row.

## 1. Spec

- `docs/figures/gen_figures.py`, the Node calls of `paper_lit_review_graph` (`SC`, `L2`, `RC`), `researcher_research` (`FQ`, `FD`, `BA`, `EX`, `MS`, `CO`, `K`), `researcher_revision` (`FD`, `EX`, `MS`, `CA`, `CO`, `BA`, `PR`), `submit()` (`C`) and `grant()` (`L`): "Node(\n \"SC\",\n \"Script: every entry's DOI or arXiv ID resolved, one resolve over refs.bib\",\n \"script\",\n),", where the base line was `Node("SC", "Script: every entry's DOI or arXiv ID resolved, one resolve over refs.bib", "script"),`. What is wrong: 19 base lines whose kind word the round did not change were wrapped into multi-line calls. Base had 34 lines over 100 characters, the tree has 10. Ruling 1 asks for the kind words only, and change standard rule 20 says "Nothing is changed that no brief item asks for". The `submit()` and `grant()` hunks do not touch a rounded box at all. The brief's own line-length rule covers only lines the step adds or changes, so these lines needed no change. Failure scenario: the round's diff holds about 70 lines of reflow that the reviewer and the landing read as if they were part of ruling 1, and `git blame` for those nodes now points at this step. The figures' bytes did not change (the snapshot's `grant.svg` and `submit.svg` equal the worktree's), so nothing user-visible breaks. Verdict: none against an item; a change beyond the ruling.
- `5-report.md`, "Repair round 1", the checks: "Lines whose only change was the new kind word were wrapped into multi-line `Node(...)` calls." What is wrong: the 19 lines above changed in layout and not in kind word, so the sentence misdescribes what was done. The report must say the truth of the end state. Verdict: none.

## 2. Proof

- `5-report.md`, "Repair round 1" item 1: "Figures whose text alternative this ruling also changes, beside changes they already had: `academic/researcher/research.svg`, `academic/researcher/revision.svg`, `academic/paper/disclosure.svg` and the fifteen new figures". What is wrong: `disclosure.svg` has no rounded box. `git show 6947c94:docs/figures/academic/paper/disclosure.svg | grep -c 'question)'` prints 0, and the file today holds no "the session reads and judges". Ruling 1 does not change it; only ruling 4 does. The decision that rests on it: the brief asks for "every figure whose SVG changes by this ruling alone", and the landing's check on figures that stand reads this list. Failure scenario: a reader checking which figures changed by ruling 1 looks for a kind-word change in `disclosure.svg` and finds none. Verdict: none.

## 3. Standards

- `docs/figures/gen_figures.py`, `paper_disclosure_graph` (edges `S -> V`, `S -> F`, `V -> F`) and `README.md` line 116: "The venue's policy: you paste it, for a venue not in the database, a stop reached from the questions or from the call's own venue". What is wrong: `skills/academic/paper/SKILL.md` "disclosure" item 1 and the Stops row "The venue's policy" raise the stop for any venue outside `references/venue_disclosure_policies.md`, whether the venue came from the questions or from `--venue=<v>`. The figure's only way into "The venue's policy" is the arrow from "The session's questions", and the render (`disc.png`) shows no other entry. The README alt text says the figure also reaches the stop from the call's own venue, which the figure does not draw. Failure scenario: a reader with `/paper disclosure --venue=X` for a venue the database lacks reads the figure as saying the policy stop cannot arise for them, since "The session's questions" is drawn as the first box and the policy box hangs below it; the alt text then describes an arrow that is not there. Verdict: none against an item; fix the arrow or the alt text.
- `docs/figures/gen_figures.py` `researcher_lifecycle()`, caption of the README lane: "README.md, read and written by idea, research, research adopt, full, revision and readme" against the third box "revision, and manuscript when the README holds ## Papers: each paper and the results it reports". What is wrong: `skills/academic/researcher/SKILL.md` "manuscript" item 4 writes the paper's folder into the README's `## Papers`, so `manuscript` writes the README, and the figure's own box says so, while the caption that lists the modes leaves `manuscript` out. Ruling 2 asks for the modes "as 'What it reads' 18, 20 and 25 and each mode's Steps give them". Failure scenario: a reader counts the modes that write the README from the caption and misses `manuscript`; the box under it names it. Verdict: none; the caption is read as "reads and writes", which `manuscript` does not do by "What it reads" 20, so this is a wording point.
- `docs/figures/gen_figures.py` `researcher_lifecycle()`, the second README box: "research, research adopt and full: the working state a new session resumes from, and the results". What is wrong: `full` itself writes `## Next` (researcher "full" items 3, 4 and 6), which the figure does not show; the working state is written by the `research` mode `full` runs. `skills/academic/researcher/SKILL.md` "full" Steps give the README line `full` writes. Failure scenario: a reader reads that `full` writes the working state itself and looks for `## Next` nowhere in the figure. Verdict: none.
- `docs/figures/gen_figures.py` head comment, lines 94-101: "It imports the kind PAPER, ... builds its mapping of kinds once with the engine's with_kinds, the engine's kinds, paper and three rounded kinds drawn in the style of the engine's rounded box, each with its own words for the text alternative: step, a step of the session; judge, the session reads and judges; and folder, a folder." What is wrong: one sentence of about 70 words with two semicolons; `prose-standard.md` E, "Sentence length": "under roughly 20 words unless the mechanism needs more". Failure scenario: a maintainer reading the head comment to learn what a kind word is for has to take the whole mapping in one sentence. Verdict: none.
- `docs/dev/scripts.md` line 9: "using the engine `skills/code/handbook/templates/figures.py` the kind `paper` of `docs/figures/ordo_kinds.py` and the kinds `step`, `judge` and `folder` it defines". What is wrong: the base text read "...figures.py and the kind `paper` of ..."; the word "and" after the engine's path is gone, so the list of what the script uses has no joint and reads as "the engine the kind paper". Failure scenario: a reader cannot tell whether the engine and `paper` are two things or one. Verdict: none.
- `5-report.md`, "User-visible changes": "`README.md` alt texts of nine figures". What is wrong: `git diff --numstat 6947c94 -- README.md` prints 10 and 10, and `git diff 6947c94 -- README.md | grep -c '^+!\['` prints 10, which the report's own line list (72, 80, 86, 88, 90, 92, 94, 96, 100, 116) also gives. Failure scenario: the landing reads nine and checks nine. Verdict: none.
- `docs/figures/gen_figures.py` lines 154-157: the import list `Legend, KINDS, Kind, Node` is out of order against the list's alphabetical order (`Edge, FigureError, Graph, Lane, Legend, Node`). `ruff --select F,W2` does not check it. Failure scenario: none beyond a reader looking for a name. Verdict: none.

## 4. Behaviour

none. The round's user-visible changes are named: the text alternative of each rounded box (the report names the figures changed by ruling 1 alone, with the `disclosure.svg` error under Proof 1), the new `disclosure.svg` boxes with README line 116, and the lifecycle caption.

## Declined to judge

- Whether each of the 15 new figures reads well as a picture, and `ordo-init.svg`'s 17 boxes against "about twelve": the user's reading at landing (item 10). I read `lifecycle.svg` and `disclosure.svg` only.
- `git status --short docs/figures` printing nothing: it holds only once the figures are committed. The command `git -C <main> status --short docs/figures` run after landing settles it.
- Ruling 5 as a choice (whether "The plan exists" is a stop): it is the orchestrator's classification; the figure is as the brief rules.
- That the wrapped lines (Spec 1) leave every figure byte-identical to the snapshot: I confirmed it for `grant.svg` and `submit.svg` against the snapshot copies, and for the whole `docs/figures/` tree against a regeneration of the worktree's own files, but I did not diff the wrapped figures' regeneration against the base's for the unchanged-kind nodes beyond those.

Reviewer usage: a64a84c7d081865f5, claude-sonnet-5-5, 184702 tokens, 36 tool uses, 5 min 4 s.

## Closed

The first run's findings went to the builder in repair round 1 (`agents/briefs/5-round-1.md`): Spec 1 by ruling 3, Standards 1 by ruling 2, Behaviour 1 by ruling 1, the paper mode figures declined to judge by ruling 4, and `plan`'s row "The plan exists" by ruling 5. The findings of the run over round 1 are closed at landing on main:

- Spec 1, the re-wrapped calls: the 18 `Node` and `Edge` calls whose arguments the round left unchanged are written again on one line as at the base, so the diff changes only calls whose kind word or text the step changed; a regeneration left every figure byte-identical.
- Spec 1, the report's sentence on the wrap, and Proof 1, `disclosure.svg` named under ruling 1: the builder's report stands as the builder wrote it; this section is the record. `disclosure.svg` changed by ruling 4 and by the fix to Standards 1 below, and the figures ruling 1 alone changed are `full.svg`, `lit-review.svg` and `outline-only.svg`.
- Standards 1, the venue's policy reached from the call's own venue: `disclosure.svg` gains the rounded box "The selector of the call: --venue=<v> or --policy-anchor=<a>" (kind `judge`), with arrows to "The session's questions" (no selector), to "The venue's policy" (a venue not in the database) and to the formatter; `README.md`'s alt text names the box and says the policy stop is reached from the call's selector or from the questions.
- Standards 2, `manuscript` left out of the caption: the README frame's caption reads "README.md: what each mode that reads or writes it keeps there", and its boxes name the modes, `manuscript` among them.
- Standards 3, `full` and the working state: the box reads "research and research adopt: the working state a new session resumes from, and the results", and a box "full: the modes it runs, in order, in ## Next" is added.
- Standards 4, the head comment's long sentence: split into four sentences, the words of each kind quoted.
- Standards 5, `docs/dev/scripts.md` line 9: a comma after the engine's path.
- Standards 6, nine alt texts against ten: the builder's report stands; this section is the record that `README.md` changes ten alt texts (lines 72, 80, 86, 88, 90, 92, 94, 96, 100 and 116).
- Standards 7, the import order: `KINDS` first, then the classes in alphabetical order, `Kind` among them; `ruff check --select I` passes.

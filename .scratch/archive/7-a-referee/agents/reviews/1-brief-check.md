# Step 1 brief check (on main at 87100fa)

Every command below was run from `/Users/axelfaes/workspace/ordo`. Nothing in the repository was written. One scratch copy of `docs/figures` was made under the session scratchpad for check 6.

## 1. Names

Command: `grep -rn -i -w 'referee' --exclude-dir=.scratch --exclude-dir=.agents --exclude-dir=.git .`, and the same form for `academic/referee`, `referee\.svg`, `referee()`, `7\.A`, `not built yet`, `seventeen`, `paper-review-panel`.

- `academic/referee`: one hit, `docs/roadmap.md:27` (the gate). Not made false.
- `referee\.svg` and `referee()`: no hit. Both names are free.
- `(roadmap entry 7.A, not built yet)`: one hit, `skills/academic/paper/SKILL.md:69`, inside the brief's paths.
- `referee review`: `docs/glossary.md:149`, `:153`, `:156`, `:157`, all in a path the step writes. Line 153 (**panel review**) ends "Stated in: ... `docs/roadmap.md`, the entry of `referee`"; the roadmap entry stays, so it is not made false.
- `docs/roadmap.md:23`, `:26`, `:27`, `:28`: the entry of 7.A. Not made false; step 3 ticks it.
- `skills/academic/paper-review-panel/SKILL.md:3` (description) and `:47` (Trigger Keywords): both list the phrase "referee report". Outside the paths. Once `referee` exists this is a phrase for a case a neighbouring skill is for (`docs/dev/skill-layout.md`, "Frontmatter"). The brief's decision 11... numbered 10 in the brief, leaves it to the user "raised outside this brief". `sed` of `.scratch/7-a-referee/orchestrator-state.md` shows "## Open items ... - none", so it is not booked there.
- `skills/academic/paper-review-panel/SKILL.md:32-37` ("Use instead"): names `/paper` only. Not false, covered by the same decision 10.
- Inside `README.md`, a path the step writes, but at places the brief does not list:
  - `README.md:31`, second sentence: "Installed, the seventeen skills stand side by side in one folder". Made false: `ls -d skills/*/*/ | wc -l` prints `17`, and the step adds one. The brief names line 31 only for the first sentence.
  - `README.md:162`: "The loop copies each of the seventeen skills". Made false, not named in the brief.
  - `README.md:124`: "`writing`, `code-comments`, `paper` and `paper-review-panel` start every agent on the runner's default agent with the runner's defaults." Made incomplete: `referee` starts its agents the same way (brief, "The rules of the skill", third bullet). Not named in the brief.
- Other hits of the word (`README.md:85`, `:109`, `docs/figures/gen_figures.py:1425`, `:1736`, `docs/figures/paper/revision.svg`, `lifecycle.svg`, `skills/academic/paper/SKILL.md:23`, `:115`, `:433`, `:445`, `:447`, pages under `skills/academic/paper/`, `docs/adr/0020`, `docs/adr/0043`): "referee comments" of `paper`'s revision mode. Not made false.
- `not built yet` at `docs/figures/gen_figures.py:1071`, `docs/figures/academic-pipeline/gen_academic_pipeline.py:60`, `:64` and its svg: legend words, no mention of `referee`. Not made false.

Findings: (1) `README.md:31` second sentence and `README.md:162` say "seventeen skills" and the brief does not ask for the count to change. (2) `README.md:124` lists the skills that start agents on the default agent and the brief does not add `referee`. (3) The phrase "referee report" in the panel skill's description and Trigger Keywords is left as a user decision that no open item of the state file carries.

## 2. The step line

Command: `cat -n .scratch/7-a-referee/plan.md`, read against the brief.

Parts of the step line:
- "`skills/academic/referee/` with its `SKILL.md` in the skill layout": "The files of the skill" 1.
- "its own pages for what a referee adds": the intake is "The behaviour, first round" 2 (it has no page of its own; it is a step of `SKILL.md`); the selection with the file of left-out comments is files 2 and 4 and behaviour 7 with the paragraph on `left-out.md`; the stop that shows both lists is behaviour 8; the report in the journal's fields is file 5 and behaviour 9; the second round is file 3 and "The behaviour, second round".
- "the reviewers run from the `paper-review-panel` skill's pages": behaviour 4 and 5, and the second paragraph of "What to build".
- "listed where the skills are listed (README, glossary, the dev pages, its figure)": "The places that list a skill" 1, 5, 4, and 2 with 3.
- "a reviewer reads `SKILL.md` against each ruling": no builder requirement; it is the review's.
- "reads both folders and finds no copy": the last case, and the second paragraph of "What to build".
- "the verify list of `docs/dev/building.md` passes": "Verify before you report" 1 (two of its commands before landing, the whole list at landing).
- "The places that list a skill" 6 (`skills/academic/paper/SKILL.md` line 69) serves no part of the step line; it is a carry under the rules file's rule 14.

Rulings ending "(the user)":
- The step list: no requirement needed.
- A small skill on the panel's pages: second paragraph of "What to build"; behaviour 6; rule "The manuscript is someone else's".
- The last step selects: behaviour 7 and 9.
- An intake direction: behaviour 2 first bullet, 4 (given to the field analyst), 7 third bullet.
- All five by default: behaviour 2 fifth bullet, 5.
- A stop before the writing: behaviour 8.
- The left-out comments are kept: the paragraph on `left-out.md`, behaviour 7 last bullet.
- A default budget: behaviour 2 third bullet. The ruling says "about 5 to 7 major points, about 7 minor points and about 1,200 words"; the brief makes 7, 7 and 1,200 an upper limit ("no more major points and no more minor points than it gives", "within the length of the budget"). Decision 4 records it.
- What the intake asks: behaviour 2, bullets 2, 4 and 6.
- How the panel's pages are found: behaviour 1 first bullet; Conventions, sixth bullet.
- The call: the two headings of the behaviour sections.
- The run folder: rule 1 of "The rules of the skill". The ruling says "beside the manuscript"; the brief puts it in the manuscript's folder (decision 8). The panel skill puts its folder "in the parent of the manuscript's folder" (`skills/academic/paper-review-panel/SKILL.md:530`), so the two skills' folders stand in different places for one manuscript.
- The journal's fields by default: behaviour 9 first bullet.
- What the second round runs: second round 2 to 5.

Findings: none contradicted. Two rulings are carried with a reading the brief records as decisions 4 and 8.

## 3. Premises

- `ls skills/academic/`: prints `paper`, `paper-review-panel`, `writing`. Matches.
- `find skills/academic/paper-review-panel -type f | wc -l`: `25`. Matches. Per folder: `1 (root)`, `7 agents`, `3 examples`, `11 references`, `3 templates`. The brief says "ten under `references/`"; there are 11 (`ls` lists `calibration_mode_protocol.md` to `top_journals_by_field.md`). No `.py` or `.sh` file: matches.
- `grep -n 'agents/.*_agent.md' .../SKILL.md`: lines 260 to 266 give the seven roles with the pages the brief names. Matches (the grep also prints lines 284 and 502).
- `sed -n '131,198p' .../SKILL.md`: items 1 to 5 of "full" as the brief describes. Matches.
- `grep -n '^### The \|Reserved modes' .../SKILL.md`: `286`, `290:### The full contract`, `375:### The methodology-focus contract`. Line 286 says the reserved modes "have no contract and run without the two-call protocol". Matches.
- `grep -n '^#' .../references/re_review_mode_protocol.md`: the six sections the brief names, at lines 5, 18, 43, 63, 72, 86. "How It Works" takes the three inputs and has the EIC check each item. Matches.
- `sed -n '527,529p' .../SKILL.md`: the three Rules bullets as quoted. Matches.
- `grep -n 'A file of another skill' docs/dev/skill-layout.md`: line 81. Matches.
- ``grep -n "skill's \`agents/" skills/*/*/SKILL.md``: prints nothing, exit 1. Matches.
- `grep -n 'paper-review-panel' README.md docs/dev/building.md docs/dev/scripts.md docs/figures/gen_figures.py`: README 29, 31, 71, 77, 124, 151; building 37; scripts 9; gen_figures 10, 1878, 1909, 1910, 2146. The brief's line numbers match; it leaves out `README.md:124` (see check 1). `def paper_review_panel()` is at line 1877.
- `grep -n 'referee review' docs/glossary.md`: line 156 defines the term and ends as quoted. `grep -c referee skills/ordo/repo-setup/templates/plan-terms.md`: `0`. Matches.
- `sed -n '5p;69p' skills/academic/paper/SKILL.md`: `version: "4.1.1"` and the row as quoted. Matches.
- The description count by the layout's command: `538 skills/academic/paper-review-panel/SKILL.md`. Matches.
- `grep -n -i 'referee' docs/adr/README.md`: prints nothing. Matches as a command; the conclusion "No ADR touches the step" does not hold as worded (check 7).

Findings: (1) the brief says ten files under `references/`; the tree has 11. (2) The premise "No ADR touches the step" rests on a grep of the index for one word; ADR 0043 governs a file the step changes.

## 4. Cases and checks

Read against `docs/dev/change-standard.md`, `docs/dev/skill-layout.md`, the prose standard and `docs/glossary.md`.

- Case 7 (60 comments) with behaviour 7: bullet 2 merges comments on one weakness into a point that "names each report it came from"; bullet 6 gives "merged into a selected point" as a reason a comment is left out. A merged comment is therefore both part of a selected point and a left-out comment. The case's "every other comment is in `left-out.md`" does not settle which.
- Case 10 (second round, no word on the panel) with second round 2: "The intake, as in the first round" brings the first-round question "whether to shrink the panel ... with no answer all five reviewers run", and the added question has the opposite default ("with no answer they do not"). The two defaults contradict for a second-round run.
- Second round 3 does not say whether the Reviewer Configuration stop is held, nor that the EIC runs in one call with no contract, as the panel's re-review does (`skills/academic/paper-review-panel/SKILL.md:209`). A stop is user-visible, so the builder would be choosing it.
- Case 12: `grep -rn 'Editorial Decision' skills/academic/referee/` has no stated expected output. Behaviour 6 has the skill say that no Revision Roadmap is written and the synthesizer is not started, so a hit is possible in correct text. The case also reads `skills/academic/paper-review-panel/`, a folder the step does not change; the plan's step line asks for that reading.
- "The Anti-patterns table has at least these: ... a copy of a page of `paper-review-panel` in this skill" against Conventions, last bullet, "The new skill's text never says "copy" of the panel": the brief dictates a row and forbids its word.
- Behaviour 2 ends "The answers are written to `intake.md` in the run folder" and behaviour 3 makes the run folder. `skill-layout.md`, "Sections, in order" row 5 (execution order) and "Writing for an agent" (each item ends on its completion criterion): item 2 cannot end before item 3.
- `skill-layout.md`, "Sections, in order" row 5: a skill with modes gives each a `### <name>` subsection. The brief names `### re-review` only and gives no name for the first round's subsection.
- "round", "first round", "second round", `round-1`: `docs/glossary.md`, **round, of an interview**, says the bare "round" outside `grill` "is a repair round". `skill-layout.md`, "Writing for an agent", third bullet, asks for a glossary entry before a term is used in a new sense. The brief adds none. The same holds, less sharply, for "reviewer" (glossary: the agent that refutes a built step), which the panel skill on main already uses in the panel's sense.
- "shrink the panel" (the user's choice at the intake) and the stop `[PANEL-SHRUNK]` (a reviewer marked unusable) are two things under one word in the same step list. No rule is broken; a reader can take one for the other.
- The paragraph on the first run, and "no test is kept" for `gen_figures.py`: consistent with the rules file, "Scripts compute facts; judgment is read" and rule 1.

Findings: seven, the first seven bullets above. The eighth is a reading risk only.

## 5. The question

"Could this pass without the goal being reached?", the goal being the skill's text and its listings.

- Cases 1 to 6, 8, 9, 11: no, each is read in the skill's text and names the behaviour the text must state.
- Case 7: yes, while a merged comment may count on either list (check 4).
- Case 10: yes, while the two intake defaults contradict.
- Case 12: yes for the grep alone, which has no expected output; no for the reading of both folders.
- The check on the step line (reviewer reads against each ruling, reads both folders, verify list): no for the two readings; the verify list alone would pass with a wrong skill, and the line pairs it with the readings.
- Files 1 to 5: no, each is a file whose content the behaviour sections fix. File 1's description bullet alone: yes, a description can meet it and miss a case; the review reads it.
- Behaviour, first round 1 to 10, second round 1 to 5, the rules: no, apart from the points of check 4.
- Places 1 (README): yes, the five listed places can be done with "seventeen" and line 124 left wrong.
- Places 2 and 3 (figure): no for the nodes listed; the note's content ("what the second round starts") is read.
- Places 4, 5, 6: no.
- Verify 2 to 5: each yes alone, since each prints a fact; they are not the gate of the judgment, which is the review.

Findings: places 1 passes with the README still stating a wrong count and an incomplete list; cases 7, 10 and 12 as above.

## 6. Implied inputs

- The brief's check `git status --short docs/figures` lists two files only if the script on main reproduces every committed figure. Checked: `cp -R docs/figures <scratchpad>/figcheck/docs/figures`, then `python3 docs/figures/gen_figures.py` there (exit 0), then `diff -rq docs/figures <scratchpad>/figcheck/docs/figures` prints nothing, exit 0. The input holds.
- A label too long for its box: `_wrap` and `_check_line` (`docs/figures/gen_figures.py:217`, `:240`) raise `FigureError`, and `main` exits 1. The script reports it itself; nothing to state.
- `__pycache__` is ignored: `git check-ignore -v docs/figures/__pycache__` prints `.gitignore:4`.

Findings: none.

## 7. ADRs

Commands: `sed -n '1,6p'` of each record for its status line; `awk` of each Decision section of the records in force with a `grep -i` for figure, glossary, use instead, README, skill, default agent, run folder, beside, referee, review-panel, version, triggers; the Decisions of 0001, 0002, 0026 and items 1 to 3 of 0043 read whole. 42 records; 10 are wholly superseded (0003, 0016, 0018, 0019, 0021, 0022, 0025, 0028, 0037, 0041); 32 are in force in whole or part.

- 0043 touches the step: its Decision 2, "`skills/academic/paper/SKILL.md` is academic-paper's `SKILL.md`, each section carried with its words into the section of `docs/dev/skill-layout.md` that holds its kind of text", governs a file the step changes. The brief does not name it. The change (removing a parenthesis from a "Use instead" row for an Ordo skill) does not contradict it, in my judgment.
- 0002 ("The prose standard holds for every text the writing skills write or review"): its family is named in 0001's Context as `literature`, `paper`, `paper-review-panel`, `grant`. `referee` is not in it; judged not touching. The brief already holds the skill's own text to the prose standard.
- 0020 (`paper-runs/` beside the manuscript's folder), 0030 and 0035 (models and efforts of `paper` and `writing`), 0014 (`code-comments` on the default agent): each decides for the skill it names, not for `referee`. Not touching.
- 0012 (every commit names its paths) and 0010 (verify list equal to the verification page) bind the landing, not the brief's content. The brief's "Verify before you report" 1 agrees with 0010.

Findings: the brief's line "No ADR touches the step" is wrong for 0043, which it does not name; no part of the brief contradicts a record.

## 8. Dictated text

Each located by `grep -n` on `.scratch/7-a-referee/agents/briefs/1.md`.

- `grep -n 'name: referee'` (38), `name: referee` and `"1.0.0"`: holds.
- `grep -n 'Triggers on'` (39), `Triggers on:` with `/referee`: holds.
- `grep -n 'not installed beside'` (52), the refusal's words: holds.
- `grep -n '"balanced"'` (55, 132, 174) and `'"medium"'` (56, 132, 174): hold.
- `grep -n '1,200'` (57, 132, 175), 7, 7 and 1,200: holds.
- `grep -n 'intake.md'` (61, 70, 104): the name holds; its place in step 2 before the folder of step 3 breaks `skill-layout.md`, "Writing for an agent" (completion criterion) with "Sections, in order" row 5.
- `grep -n 'PANEL-SHRUNK'` (68, 109): holds.
- `grep -n 'selection.md'` (70, 77, 78, 104, 135, 136), `'left-out.md'` (89, 104, 135, 136), `'referee-report.md'` (78, 87, 104, 178): hold.
- `grep -n 'accept, minor'` (85), "accept, minor revision, major revision, reject": holds.
- `grep -n '### re-review'` (93): holds; the first round's subsection has no dictated name (`skill-layout.md`, "Sections, in order" row 5).
- `grep -n 'referee-runs'` (103) and `'round-1'` (103, 179), `referee-runs/<round>-<date>/`, `round-1`, `round-2`, `-2`, `-3`: break `skill-layout.md`, "Writing for an agent", third bullet, with `docs/glossary.md`, **round, of an interview**, unless an entry for this sense of "round" is added.
- `grep -n 'Anti-patterns table'` (109), the row "a copy of a page of `paper-review-panel` in this skill": contradicts `grep -n 'never says'` (212) in the same brief; against the standards it holds.
- `grep -n 'Stops table'` (109), the five rows: holds.
- `grep -n 'referee\.svg'` (117, 120, 121, 159, 220, 223), `'referee()'` (119), ``'academic/referee`'`` (118): hold.
- `grep -n '4\.1\.2'` (123): holds (`skill-layout.md`, "Frontmatter", the patch part).

Findings: three. `intake.md` is written before its folder exists; "round" is used in a sense the glossary does not define; the dictated Anti-patterns row uses the word the Conventions forbid.

## Declined to judge

- Whether the skill the brief describes would write a good referee report: that is step 2's gate, the user's reading.
- The ADR bodies outside their status lines and Decision sections were not read whole; the Decision sections of the 32 records in force were searched by keyword and five were read in full, as check 7 says.
- The plan's whole verify list was not run; it runs at landing.
- `research-hub/` was not read.

Agent usage: abb679c2d2f988485, claude-fable-5-2, 176151 tokens, 19 tool uses, 5.5 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- Names 1, "seventeen skills" on `README.md` lines 31 and 162: "The places that list a skill" 1 now asks for "eighteen skills" on both lines, and "What is on the tree" names the two lines.
- Names 2, `README.md` line 124: "The places that list a skill" 1 now adds `referee` to that sentence.
- Names 3, the phrase "referee report" in the panel skill: booked as Open item 1 of the state file, and decision 10 of the brief names it.
- Premises 1, the count under `references/`: "What is on the tree" now says eleven.
- Premises 2 and ADRs, ADR 0043: "What is on the tree" now names ADR 0043 with the sentence of its Decision 2 and says why the changed row is not decided by it.
- Cases 1, a merged comment on both lists: "The behaviour, first round" 8 now says a comment merged into a selected point counts as selected and is never among the left-out comments, and the reason "merged into a selected point" is removed.
- Cases 2, the two intake defaults of the second round: second round 2 now replaces the question on shrinking the panel by the question whether all five run again, and the case is reworded to match.
- Cases 3, the second round's stop and calls: second round 3 now says the EIC runs in one call with no contract and the Reviewer Configuration Card is shown and confirmed as in the first round.
- Cases 4, the grep with no expected output: the case is now the reading of both folders alone.
- Cases 5, the Anti-patterns row against the Conventions: the Conventions bullet no longer forbids the word "copy".
- Cases 6 and Dictated text 1, `intake.md` before its folder: the run folder is now made at item 2 and the intake is item 3.
- Cases 7, the first round's subsection: the brief now dictates `### first round`. Read against `docs/dev/skill-layout.md`, "Sections, in order", row 5: holds.
- Dictated text 2, "round" in a sense the glossary lacks: "The places that list a skill" 5 now asks for a glossary entry **round, of a referee review** and for the entry **round, of an interview** to except it. The dictated term **round, of a referee review**, read against `docs/glossary.md` and `docs/dev/skill-layout.md`, "Writing for an agent": holds.
- Dictated text 3: closed with Cases 5.
- The dictated words "eighteen skills": read against the prose standard: holds.


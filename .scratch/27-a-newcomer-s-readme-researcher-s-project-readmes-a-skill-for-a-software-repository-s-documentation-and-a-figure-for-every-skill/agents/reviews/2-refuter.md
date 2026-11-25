# Step 2 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/27-a-newcomer-s-readme-researcher-s-project-readmes-a-skill-for-a-software-repository-s-documentation-and-a-figure-for-every-skill-2, base 929e519)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A finding in code keeps its `file:line`.

The report is written in the rules file's character set. A character outside it in a quoted line is written by its name in angle brackets, such as `<tab>` or `<em dash>`.

## Verification (rerun by the reviewer)

```
$ printf '%s\0' README.md docs/adr/0055-...md docs/glossary.md skills/academic/researcher/SKILL.md skills/academic/researcher/references/project_layout.md skills/academic/researcher/references/research_brief.md skills/academic/researcher/references/research_stages.md skills/academic/researcher/references/slurm.md .scratch/27-.../agents/reviews/2-report.md | xargs -0 perl -CSD -ne '<the check of the brief, verbatim>'; echo "exit: $?"
exit: 0

$ python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary; echo "exit: $?"
ok: the plan-terms block equals the template
exit: 0

$ python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/*/SKILL.md"))]' | grep researcher
1015 skills/academic/researcher/SKILL.md

$ git grep -n -P '## (The stage and campaign that stand|Cluster facts|Where things live|Results|Dead ends|Constraints and limits)\b' -- skills docs README.md | perl <filter printing file:line and the headings each hit names> | wc -l
88
(the 88 lines equal the builder's Verify 4 list line for line; the hits that are not a `###` heading of `## Working state` and not `## Constraints and limits`, `## Results and how to reproduce` or `## Dead ends (do not retry)`:)
ADR 0057:30: ## The stage and campaign that stand | ## Results | ## Dead ends | ## Constraints and limits
skills/academic/paper-review-panel/agents/methodology_reviewer_agent.md:239: #### Results
skills/academic/paper-review-panel/templates/peer_review_report_template.md:154: ### Results
skills/academic/paper/agents/citation_compliance_agent.md:940: ### Results
skills/academic/paper/agents/socratic_mentor_agent.md:239: ### Results
skills/academic/researcher/references/project_layout.md:112: ## The stage and campaign that stand

$ for f in <the five researcher files, docs/glossary.md, README.md>; do git show 929e519:$f | grep -n -P '<the same pattern>' | cut -d: -f1; done
skills/academic/researcher/SKILL.md: 54 72 73 97 245 251 255 266 272 274 278 279 284 309 316 318 322 325 331 333 334 340 352 363 364 365 380 390 392 548 552 561 564 570 574 587 594 607 609 655 675 702 704
skills/academic/researcher/references/project_layout.md: 40 41 42 43 44 45 55 56 61 70
skills/academic/researcher/references/research_brief.md: 9
skills/academic/researcher/references/research_stages.md: 5 13 14 27 33 34 35 41 43 46
skills/academic/researcher/references/slurm.md: 3 20 25 28
docs/glossary.md: 151 156 161 181
README.md:
(72 hits, plus ADR 0057 lines 11 and 30, ADR 0055 line 15 and the four places outside researcher: the builder's 79)

$ git diff 929e519 --numstat
1 1 README.md
1 1 docs/adr/0055-...
4 3 docs/glossary.md
139 71 skills/academic/researcher/SKILL.md
81 18 skills/academic/researcher/references/project_layout.md
1 1 skills/academic/researcher/references/research_brief.md
13 13 skills/academic/researcher/references/research_stages.md
4 4 skills/academic/researcher/references/slurm.md
$ git diff 929e519 -U0 -- docs/glossary.md README.md | grep '^@@'
@@ -34 +34 @@   @@ -151 +151 @@   @@ -156 +156 @@   @@ -161 +161 @@   @@ -181,0 +182 @@
$ wc -l (after): SKILL.md 819, project_layout.md 133, research_stages.md 55, slurm.md 39, research_brief.md 57, docs/glossary.md 191, README.md 270, ADR 0055 31   (equal to the report's table)
$ git status --short
 M README.md, docs/adr/0055-..., docs/glossary.md, skills/academic/researcher/SKILL.md, references/project_layout.md, research_brief.md, research_stages.md, slurm.md; ?? .scratch/27-.../agents/reviews/2-report.md   (only the brief's paths)

$ git show 929e519:skills/academic/researcher/SKILL.md | wc -l
751
$ grep -c 'adopt' docs/figures/researcher.svg docs/figures/researcher-research.svg
docs/figures/researcher.svg:0
docs/figures/researcher-research.svg:5
$ grep -n -o '[^.;]*adopt[^.;]*' docs/figures/researcher-research.svg   (lines 1, 2, 89, 156, 157; 156: "research adopt reads a project underway against each stage, writes the README")
$ sed -n 2088,2095p and 2150,2170p docs/figures/gen_figures.py   (2090 "...novelty and ", 2091 "idea start no agent...", 2155 Node("A", ...), 2156 Node("J", ...), 2164 "...research adopt reads a ", 2165 "project underway against each stage, writes the README sections it lacks, moves nothing ")
$ grep -n -o 'and apart: A project underway: research adopt offered, a stop;' README.md   -> 90
$ grep -n -o 'and apart: The jobs submitted: the job ids in the README, and the run stops, a stop;' README.md   -> 92
$ for n in 284 285 334 350 352 353 384 626 660; do sed -n ${n}p SKILL.md; done   (each line as the report's "The terms" names it)
$ grep -n '^## \|^### ' references/project_layout.md   (## The README 35, ## The code README 62, ## The deposit 80, ## A README in the old layout 110, ## The dead ends 121)
$ awk '/^## Stops/,/^## Anti-patterns/' SKILL.md   (refusal rows "No manuscript" to "No paper to revise": 13 rows, so "the thirteen refusals at the end" holds)
```

The prompt allows only `git diff`, `git status --short` and `git show`; the heading grep of Verify 4 is a `git grep` the brief names, and I ran it as written, plus two further read-only `git grep` runs for the sweep the prompt asks for (old section names without `#` marks, and lists of researcher's modes outside the skill). Nothing was changed by them.

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1: holds. `project_layout.md`, "The README": the title with its one line, then twelve `##` sections numbered 1 to 12 in ADR 0057's order (Constraints and limits after Method, as D14 rules), each `###` the item names, the paper pointer, the 200-line rule, the slug rule with `dead-ends-do-not-retry`, the next free name, `None yet.`; "A README in the old layout" maps every old section: the dataset from Constraints and limits and the raw inputs from Where things live to `## Data`, the rest under its new heading.
- 2: holds. "The tree" line 11 and "The code README" give the eight headings in D15's order; the code README of a project underway is its own code folder's, "as `### Where things live` names".
- 3: holds. "The deposit" holds the 14 lines of Decisions 5 with the reasons; "research" item 3 writes them; "readme" item 3 keeps an existing file's lines and adds the missing ones in the draft.
- 4: holds, with Behaviour 2 on the placeholder headings. Writers: title line, In short, What it is and why, The closest prior work and Cluster facts by Frame item 4; Data by Frame item 5; The approach by Experiments (item 12); What is not claimed and What this project adds by Compare (item 13); the code README by Consolidate (item 16); Where things live by item 3; Papers and Next by item 18; RQ and claims by `idea` or Frame. `research_stages.md` "What it leaves" names each write; the completion criteria name the new headings (judgment call 1 below).
- 5: violated in part, Spec 1. Every line of "What is on the tree" names the new heading (the grep above), the glossary entries and ADR 0055 line 15 follow, but two of the tests item 5 lists read `### The stage and campaign that stand` without "under `## Working state`".
- 6: holds. Steps 1, the bullet before the `revision` checks; `project_layout.md`, "A README in the old layout"; the Stops row, which shows `/researcher readme <project folder>` and resumes after that mode writes.
- 7: violated in part, Behaviour 1. Quick start, introduction, Steps introduction, Steps 1 mode words and dispatch, Steps 6, "What it reads" 1, 3, 22 and 25, the description, the subsection "readme" items 1 to 6, the stop "The README drafts" and its row, the refusal for a missing or empty folder, the Rules bullet on other tools' files are all present; the code-folder rule misses a code folder that no README names.
- 8: violated in part, Behaviour 1 (the same rule reaches the adopt mode's case of a project with code and no README). Item 3 runs "readme" items 1 to 5 with the same stop, names the stage, drafts a README for a project with none; item 1's usable README holds `### The stage and campaign that stand` under `## Working state`; "What the adopt mode found" stays.
- 9: holds. `README.md` line 34 names `readme` among the repository's own modes, its command and what it does, and the adopt sentence names the rewrite (see Standards 2 on its wording).
- 10: holds. `metadata.version: "2.0.0"`.

Cases of the brief's "Cases":

- The heading grep: met. 88 hits after the change, each a `###` heading of `## Working state`, one of the three kept or renamed `##` headings, the old-layout test (`project_layout.md:112`), ADR 0057 (lines 11 and 30), or one of the four places outside researcher; ADR 0053 has no hit. The first run on the base reproduces the lines of "What is on the tree" (72 hits in the researcher files and the glossary, as quoted above).
- `project_layout.md`, "The README": met, by reading (item 1 above).
- "research" item 3 on a new project: met. SKILL.md:272-279 write `code/attic/README.md`, `code/README.md` with the title and seven sections, `code/.depositignore` with "The deposit"'s lines, every README section in order with `None yet.`, the two kept sections at their places; "Done when" names the eight headings.
- `idea` on a new-layout README without the section: met. "idea" item 11 places it "after the title and after `## In short` and `## What it is and why` where the README holds them, and before every other section", so before `## Data`.
- readme mode, forty-line dated log under `## Next`: met. "readme" item 2, the dated-log bullet and its made-up example (`notes/next.md`, or `notes/next-2.md`), with `## Next` a short numbered list.
- readme mode, an old paragraph and no manuscript or novelty page: met. Item 2 drafts a section the files cannot fill from the old README with each sentence's source, and writes what no file holds as a question.
- readme mode with a `project.yml`: met. Item 1's bullet and the Rules bullet; item 5 writes only what the approved drafts hold.
- readme mode with `code/.depositignore` holding only `data/`: met. Item 3's `.depositignore` bullet.
- readme mode, code folder `src/` named in the README: met. Item 1 and item 3's made-up example.
- `research` on an old-layout README: met. Steps 1, before any item of the mode.
- "research adopt" on a README of the project's own layout: met. Item 1 finds no usable README, item 2 writes nothing, item 3 drafts by the rewrite, and "readme" item 5 writes only after the approval of item 4.
- "research adopt" on code and no README: partial. A README is drafted and no refusal is raised; the code README and `.depositignore` of its code folder are not drafted when that folder is not `code/`, Behaviour 1.
- readme mode on a missing or empty folder: met. "What it reads" 1 and the Stops row "No project folder", raised in Steps 1 before anything is written.
- `full` and `revision` on an old-layout README: met. Steps 1, the old-layout bullet comes "before the next bullet's checks", the `revision` checks.
- `idea` on an old-layout README: met. Steps 1, before any item of the mode, so before any round.
- "research" item 3 on an `idea`-only folder: met. SKILL.md:275 keeps the section after `## What it is and why` and before `## Data`.
- The description count: met. 1015; the three dropped phrases ("the closest prior work", "verify the references and claims of a finished draft", "full paper workflow") each have their case covered by "is this idea new", "check the integrity of my manuscript" and "ethics check of a paper", and "from an idea to a paper" or "take my draft through review and revision"; `readme` has "update my project's README" and the `/researcher ...|readme|...` phrase.

Other points judged on the evidence:

- Judgment call 1 (completion criteria of Experiments, Compare and Consolidate do not require the new sections): accepted. The adopt mode checks each criterion in item 1, before item 3's rewrite, so a criterion requiring `### The approach` or the code README layout would send an adopted project with finished results back to Experiments or a reproduction run for a section of text, which is the reason Decision 1 gives for Frame. The writes stay required in the "Done when" of "research" items 12, 13 and 16, which every `research` run passes. The brief's sentence "completion criteria name the new headings and these writes" reads either way; the builder's reading is the better design and the report states it.
- Judgment call 2 (Frame's criterion reads `## Data`): accepted; the requirement is kept and moved with the dataset, as rule 17 of the change standard asks.
- Judgment call 3 (title line by Frame item 4, `### Where things live` by item 3): accepted; both have a writer that every new project reaches.
- Glossary entry "slug, of a section of a project's README": needed, since the plan term **slug** means the ledger folder; placed in "Ordo's own terms" in order, "Stated in" true (`project_layout.md` lines 56 to 58 lie in "The README", lines 35 to 61). Its wording, Standards 1.
- Dropped trigger phrases: each case keeps a trigger (case above). A judgment, not a finding: the phrasings dropped are ones a differently worded request would have matched; trimming the description body would have kept them.
- Added Rules bullet, two Anti-patterns rows, the Steps 1 no-mode bullet and the old-layout mapping: each serves item 7 or item 1, and the report lists them under its judgment calls as rule 20 asks; none conflicts with another statement.
- The premise on `researcher.svg`: the builder is right. `researcher.svg` holds no "adopt" (count 0); the adopt note stands in `researcher-research.svg` lines 156 and 157.
- Section order in `idea` and "research" item 3: both follow the layout's order.
- Every fact of an old README has a place: the nine old sections map to their new places in "A README in the old layout", text outside them falls under "readme" item 2's first two bullets.
- Stops introduction count: 13 refusal rows, true.
- Sentences made false: the sweep over `skills/`, `docs/`, `README.md` and `utils/` finds no old `##` heading outside the places the case allows; the lists of researcher's modes outside the skill are `README.md` line 34 (changed) and the figures (Doc text).
- Private names: none in the added lines (`grep -i -E 'research-hub|cathedra|game-engine|oculus|/Users/|~/'` over the added lines prints nothing); both examples say "A made-up example".
- History: none; "old README" names the file a draft replaces, and "the old layout" appears only as the test and its mapping.
- Non-ASCII: none (Verify 1).
- Doc text: every quoted line matches `grep -n` and `sed -n` on the worktree (gen_figures.py 2090, 2091, 2156, 2164, 2165, 2263; README.md 90, 92). The replacement for 2164 and 2165 joins correctly to line 2166 ("and goes on from the first stage not done.").

## 1. Spec

- `skills/academic/researcher/SKILL.md:104` and `SKILL.md:740`: "with the line of `research` when the project's README names a stage of `research` in `### The stage and campaign that stand`" and the Stops row "No project of research": "holds no `README.md` whose `### The stage and campaign that stand` names a stage of `research`"; what is wrong: "What to build" 5 asks that each test of a heading, Steps 1's call with no mode word and the Stops rows named, read `### The stage and campaign that stand` under `## Working state`; "research" item 1, "research adopt" item 1 and "What it reads" 3 and 20 say so, and these two do not; failure scenario: a project's own README that holds a `### The stage and campaign that stand` under another `##` heading is read by the no-mode bullet as a project `research` started, the entry point offers `research`, and "research" item 1, which requires the heading under `## Working state`, then raises "A project underway"; verdict: item 5 violated in part.

## 2. Proof

- None. Every command the report quotes was rerun with the output it gives: the character-set check, the glossary sync, the description count 1015, the 88 hits of Verify 4, the base hits of the first run, the line counts and numstat, the "Stated in" line numbers, the figure greps.

## 3. Standards

- `docs/glossary.md:182`: "the name `researcher` gives the file `notes/<slug>.md` that a section of a project's `README.md` moves to"; what is wrong: `docs/dev/skill-layout.md`, "Writing for an agent", uses a glossary term only in a sense the entry defines; "readme" item 2 (`SKILL.md:429`, "Put a fact that no section of the layout holds in its form, such as a dated log, in a file `notes/<slug>.md`") names a file that holds part of a section that stays in the README, not a section that moved; failure scenario: a reader of the glossary takes `notes/next.md` to be the whole `## Next`, and expects the README's `## Next` to hold only a link, while item 2 keeps a short numbered list there beside the link; verdict: none (the term's use is clear from item 2's example).
- `README.md:34`: "`/researcher research adopt <project folder>` reads a project underway ..., brings its README to that layout by the same rewrite, and moves nothing"; what is wrong: the prose standard, E, "Cold opens": "that layout" points to "a default layout" three sentences back, past the readme mode's sentences, which name no layout; failure scenario: a newcomer reading the row does not know which layout "that layout" is; verdict: none.

## 4. Behaviour

- `skills/academic/researcher/SKILL.md:423-424`: "The code folder is `code/`, or the project's own code folder that the README names, in `### Where things live` or, in a README of another layout, where it says the code stands." / "A project with neither has no code folder: the readme mode drafts its README alone and makes no code folder."; what is wrong: a project whose code stands in a folder other than `code/` and that has no README, or whose README does not say where the code stands, counts as having no code folder, so no `<code folder>/README.md` and no `.depositignore` is drafted, while item 2's last bullet (`SKILL.md:437`) records that same folder in the draft's `### Where things live` from the project's files; "What to build" 7 drafts the code folder's two files "only when the project has a code folder", and such a project has one; failure scenario: `/researcher research adopt` on a made-up project with its code in `src/` and no README drafts a README whose `### Where things live` names `src/`, and leaves `src/` with no code README and no `.depositignore`, so a public deposit of `src/` publishes its attic and results; the same holds for `/researcher readme` on that project; verdict: items 7 and 8 violated in part, the case "research adopt on a project with code and no README" partial.
- `skills/academic/researcher/SKILL.md:274`: "Write every section of `references/project_layout.md`, "The README", in its order, each section and each `###` heading its item names holding `None yet.`"; what is wrong: the items of `## Data`, `## Results and how to reproduce` and `## Dead ends (do not retry)` name the placeholder headings `### <dataset>`, `### <result>` and `### <method>`, and the bullet does not say these are left out; failure scenario: a run following the text writes `### <dataset>` with `None yet.` into a new README, Frame item 5 then adds `### <the dataset chosen>` beside it, and the placeholder heading stays in the README a newcomer reads; verdict: none (item 4 holds; the fix is to write only the fixed `###` headings).

## Declined to judge

- Whether the ruled headings' form meets "Headings are labels, not sentences.": the user ruled Open item D (a), the headings stand; no finding raised, as the prompt says.
- Whether ADR 0057's Consequences sentence, which lists `## Constraints and limits` among the headings that change though its heading stays, should be edited: the diff does not touch it and the brief does not ask for it.
- Whether a section that research moves past 200 lines a second time should take `notes/<slug>-2.md` or append to the file it moved to before: the brief and D37 fix the rule as written, and the step follows it.
- The base-tree run of the heading grep over `skills/academic/paper*` and `docs/adr/` (the four outside places and the two ADRs at the base): would need `git grep -n -P '<pattern>' 929e519 -- skills docs README.md`, a git command outside the prompt's list; the worktree run shows the same four outside lines unchanged and the diff does not touch those files.

Reviewer usage: a0d3f8882c6d34f95, claude-opus-5-5, 228033 tokens, 41 tool uses, 8.3 minutes.
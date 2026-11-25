# Report: step 2, researcher's two project READMEs in the layout of ADR 0057, the readme mode, and the adopt mode's rewrite

Everything in the brief is done.

## Open items of the state file, verbatim

- Open item B (2026-11-25, step 1, kind 4, the roadmap's gate): the gate's part "every `docs/figures/` path that `git grep` finds in `README.md`, `docs/` and `skills/` names a file that exists" cannot pass once step 1 moves the figures, because `docs/roadmap.md` line 67, the done line of entry 25, records that you read `docs/figures/paper/lifecycle.svg`, a path that then no longer exists (`git grep -n 'docs/figures/paper/lifecycle' -- docs/roadmap.md` prints line 67). Step 1 goes on meanwhile and runs its check without `docs/roadmap.md`, quoting both runs.
  - (a) Recommended. The gate's part reads "... in `README.md`, `docs/` outside `docs/roadmap.md`, and `skills/` ...", written into entry 27's gate by `/roadmap` at the closing. Pro: the done line stays the true record of what you read; the check still covers every page that shows a figure. Con: the roadmap's own figure paths go unchecked, and today it names none outside done lines.
  - (b) Entry 25's done line is edited to `docs/figures/academic/paper/lifecycle.svg`. Pro: the gate stays as written. Con: a done entry's record is rewritten to a path that did not exist when you read it.
  - Lazy option: neither; leaving the gate as written and accepting a failed part at the closing.
- Open item C (2026-11-25, step 4, kind 3, ruling D33): D33's check "`git grep -n 'rulings/<slug>'` over `skills/` and `docs/` prints nothing" can never print nothing, because `docs/roadmap.md` line 27, entry 27's own gate, holds the pattern (`git grep -n 'rulings/<slug>' -- docs/roadmap.md` prints line 27). Step 4 goes on meanwhile: it rewrites ADR 0059's Context line so it no longer holds the pattern, and runs the check without `docs/roadmap.md`, quoting both runs.
  - (a) Recommended. The check reads "`git grep -n 'rulings/<slug>' -- skills docs ':!docs/roadmap.md'` prints nothing", in D33 and in entry 27's gate, written by `/roadmap` at the closing. Pro: it checks every page that states the rule; the one line left out is the check itself. Con: none found.
  - (b) The gate keeps D33's words, and the closing records that the check printed its own line. Pro: no change to the ruling. Con: the gate's output then shows a part that did not pass as written.
  - Lazy option: (b), since it changes nothing now and leaves a failed check in the record.
- Open item D (2026-11-25, step 2, kind 3, a ruling against a standard): your rulings D1 and D15 and ADR 0057 give the README headings `### Why it matters`, `## What it is and why`, `### What it does`, `### What is not claimed`, `### What this project adds`, `## What each result comes from` and `## Dead ends (do not retry)`. The prose standard says "Headings are labels, not sentences." and gives "Why it is separate at all" as a heading it rejects. Step 2 writes the ruled headings meanwhile.
  - (a) Recommended. Keep the ruled headings. Pro: they are the list you approved, and each says what a newcomer finds under it; the standard's own heading `## How it is applied` and the brief template's `## What to build` already use this form. Con: they read close to the example the standard rejects.
  - (b) Shorten them to labels: `### Relevance`, `## Overview`, `### Scope`, `### Not claimed`, `### Contribution`, `## Provenance of results` and `## Dead ends`. Pro: the standard is met word for word. Con: a newcomer reads less from each heading, and D1, D15 and ADR 0057 are changed.
  - Lazy option: neither ruling, leaving the clash unstated.

The step writes the ruled headings, as the brief says; a ruling of Open item D that changes them is a later round.

## The cases' first run, on the unchanged tree at 929e519

No case is one the brief's own rules get wrong, so no case was handed back.

1. The heading grep. `git grep -n -P '## (The stage and campaign that stand|Cluster facts|Where things live|Results|Dead ends|Constraints and limits)\b' -- skills docs README.md` printed 79 lines. Grouped by file and line with `cut -d: -f1,2` and `awk`:
   ```text
   docs/adr/0057-...: 11 30
   docs/glossary.md: 151 156 161 181
   skills/academic/researcher/SKILL.md: 54 72 73 97 245 251 255 266 272 274 278 279 284 309 316 318 322 325 331 333 334 340 352 363 364 365 380 390 392 548 552 561 564 570 574 587 594 607 609 655 675 702 704
   skills/academic/researcher/references/research_stages.md: 5 13 14 27 33 34 35 41 43 46
   skills/academic/paper/agents/socratic_mentor_agent.md: 239
   skills/academic/paper-review-panel/templates/peer_review_report_template.md: 154
   skills/academic/researcher/references/project_layout.md: 40 41 42 43 44 45 55 56 61 70
   skills/academic/paper/agents/citation_compliance_agent.md: 940
   skills/academic/researcher/references/slurm.md: 3 20 25 28
   docs/adr/0055-...: (line 15; the file name filled the 140-column cut)
   skills/academic/paper-review-panel/agents/methodology_reviewer_agent.md: 239
   skills/academic/researcher/references/research_brief.md: 9
   ```
   (The two ADR file names are written `0057-...` and `0055-...` here; the printed lines held the full names.) These are the lines of "What is on the tree", with the glossary, ADR 0055 line 15, ADR 0057 and the four places outside researcher.
2. `project_layout.md`, "The README", read: nine `##` sections, from `## Research questions and claims` to `## Next`, and no `## In short`, `## What it is and why`, `## Data`, `## Method`, `## Related work` or `## Working state`. Unmet.
3. "research" item 3 on a new project, read: it writes the nine sections, `code/README.md` with a title line only and `code/.depositignore` with the single line `data/`. Unmet.
4. `idea` on a README in the new layout that lacks `## Research questions and claims`, read: item 11 put the section "first after the README's title", before `## In short`. Unmet.
5. The readme mode on a README with a forty-line dated log under `## Next`: no readme mode existed. Unmet.
6. The readme mode on an old README with a paragraph on the project and no manuscript and no novelty page: no readme mode. Unmet.
7. The readme mode on a project with a `project.yml`: no readme mode, and no rule on other tools' files in `SKILL.md`. Unmet.
8. The readme mode on a `code/.depositignore` that holds only `data/`: no readme mode. Unmet.
9. The readme mode on a project whose code folder is `src/`: no readme mode. Unmet.
10. `research` on a README that holds `## The stage and campaign that stand`: item 1 resumed it at item 2, with no stop. Unmet.
11. "research adopt" on a project with a README of its own layout: item 1 found no usable README, item 2 stopped at "What the adopt mode found", item 3 wrote the missing sections after the README's own with no draft shown. Unmet.
12. "research adopt" on a project with code and no README: items 1 and 2 as above, item 3 wrote a README with the title line and the sections; no refusal was raised. Met for "no refusal", unmet for "the rewrite drafts a README".
13. The readme mode on a folder that does not exist, and on an empty one: no readme mode, no refusal. Unmet.
14. `full` and `revision` on a README that holds `## The stage and campaign that stand`: `full` item 1 read `## Next` and went on; `revision` read the heading as its project of research. No stop. Unmet.
15. `idea` on such a README: no stop. Unmet.
16. "research" item 3 on a folder holding only the README `idea` wrote: `## Research questions and claims` kept "first after the title". Unmet.
17. The description count, by the command of `docs/dev/skill-layout.md`: `1022 skills/academic/researcher/SKILL.md`.

## The cases after the change

1. The heading grep: every hit is quoted and named under "DONE / NOT DONE", Verify 4. Met.
2. `project_layout.md`, "The README": the title with its one line, then the twelve `##` sections numbered 1 to 12 in the order of ADR 0057's Decision, with `### The problem`, `### Why it matters`, `### What it does`, `### <dataset>`, `### The approach`, `### What is not claimed`, `### The closest prior work`, `### What this project adds`, `### <result>`, `### <method>`, `### The stage and campaign that stand`, `### Where things live` and `### Cluster facts`, then the paper pointer, the 200-line rule, the slug rule, the next free name and `None yet.`. Met.
3. "research" item 3: every section and fixed `###` heading written in order with `None yet.`, the two kept sections at their places, `code/.depositignore` with the lines of `project_layout.md`, "The deposit", which are the lines of Decisions 5, and `code/README.md` with the title and the seven sections, eight headings. Met.
4. `idea` item 11: a README with no section of that heading gets it "after the title and after `## In short` and `## What it is and why` where the README holds them, and before every other section", so after `## What it is and why` and before `## Data`. Met.
5. "readme" item 2: the made-up example states it: the forty-line log goes to `notes/next.md` (slug of `## Next`), or `notes/next-2.md` when `notes/next.md` exists, and `## Next` becomes a short numbered list. Met.
6. "readme" item 2: a section the files cannot fill is drafted from the old README, the manuscript and the notes with each sentence's source named; what no file holds is a question. `## In short` is drafted from the paragraph with its source, and `### The closest prior work`, with no novelty page and no manuscript, is a question. Met.
7. "readme" item 1 and Rules: "The skill reads and writes no file of any other tool, such as a project manifest"; item 5 writes only the drafts. `project.yml` is neither read nor written. Met.
8. "readme" item 3: an existing `.depositignore` keeps each of its own lines and the draft adds each line of "The deposit" it lacks, so `data/` is kept and the thirteen other lines are added. Met.
9. "readme" items 1 and 3, with the made-up `src/` example: the code README is drafted at `src/README.md`, and no `code/` is made. Met.
10. Steps 1: `research` on an old-layout README is the stop "A README in the old layout", before any item of the mode. Met.
11. "research adopt" item 3 runs "readme" items 1 to 5, which draft the README whole, keep every fact, and write only after the stop "The README drafts" is approved. Met.
12. "research adopt" on code with no README: item 3 drafts the README by the rewrite from the project's files and what item 2 found; the readme refusal applies only to a folder that does not exist or is empty, so no refusal. Met.
13. "What it reads" 1 and the Stops row "No project folder": for `readme` a folder that does not exist or is empty is that refusal, raised in Steps 1 before anything is written. Met.
14. `full` and `revision` on an old-layout README: the stop of Steps 1, before the `revision` checks of the next bullet. Met.
15. `idea` on an old-layout README: the stop of Steps 1, before any item of the mode and so before any round. Met.
16. "research" item 3 on an `idea`-only folder: `## Research questions and claims` kept after `## What it is and why` and before `## Data`, every other section written around it. Met.
17. The description: `1015 skills/academic/researcher/SKILL.md`. The trigger phrases of the unchanged tree: each is still present except three, whose cases stay covered: "the closest prior work" (novelty, by "is this idea new"), "verify the references and claims of a finished draft" (integrity, by "check the integrity of my manuscript" and "ethics check of a paper"), "full paper workflow" (full, by "from an idea to a paper"). The readme case has "update my project's README" and `/researcher ...|readme|...`. Met.

## DONE / NOT DONE

| Item | State | Command or reading | Output |
|---|---|---|---|
| 1. The README layout in `project_layout.md` | DONE | read "The README" | the twelve sections in order, each subsection, the rules of item 1 |
| 2. `code/README.md` | DONE | read "The tree" and "The code README" | eight headings; the own code folder in a project underway |
| 3. `code/.depositignore` | DONE | read "The deposit", "research" item 3, "readme" item 3 | the 14 lines of Decisions 5 with the reasons |
| 4. A writer for every section | DONE | read "research" items 3, 4, 5, 11 to 18, "idea" item 11, `research_stages.md` | see "Every judgment call" 1 to 3 |
| 5. Every reference follows | DONE | the heading grep, Verify 4 below | every hit named there |
| 6. The stop "A README in the old layout" | DONE | read Steps 1, the Stops row, `project_layout.md` "A README in the old layout" | for `idea`, `research`, `research adopt`, `full`, `revision` |
| 7. The readme mode | DONE | read Quick start, the introduction, Steps introduction, Steps 1 and 6, "What it reads" 1, 3, 22, 25, "readme", Stops, the description | as the cases above |
| 8. The adopt mode | DONE | read "research adopt" items 1 to 3, the Stops row "What the adopt mode found" | item 3 runs "readme" items 1 to 5 |
| 9. `README.md` line 34 | DONE | `git diff -U0 README.md \| grep '^@@'` | `@@ -34 +34 @@ ...` |
| 10. Version 2.0.0 | DONE | read the frontmatter | `version: "2.0.0"` |
| Verify 1, the character-set check | DONE | `git diff --name-only -z \| xargs -0 perl -CSD -ne '<the check of the brief>'; echo "exit: $?"` | `exit: 0` and no other line |
| Verify 2, the glossary sync | DONE | `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary; echo "exit: $?"` | `ok: the plan-terms block equals the template` then `exit: 0` |
| Verify 3, the description count | DONE | `python3 -c 'import glob,yaml; [print(len(yaml.safe_load(open(f).read().split("---")[1])["description"]), f) for f in sorted(glob.glob("skills/*/*/SKILL.md"))]' \| grep researcher` | `1015 skills/academic/researcher/SKILL.md` |
| Verify 4, the heading grep | DONE | below | below |
| Verify 5, list items and sentence length | DONE | reading | below |

Verify 4. The grep of "Cases", piped to a `perl` filter that prints each hit's file and line with the headings it names (the two ADR names shortened to `ADR 0055` and `ADR 0057` by the filter), printed:

```text
ADR 0055:15: ## Results and how to reproduce
ADR 0057:11: ## Constraints and limits | ## Results and how to reproduce | ## Dead ends (do not retry) | ### The stage and campaign that stand | ### Where things live | ### Cluster facts
ADR 0057:30: ## The stage and campaign that stand | ## Results | ## Dead ends | ## Constraints and limits
docs/glossary.md:151: ### The stage and campaign that stand
docs/glossary.md:156: ### Cluster facts
docs/glossary.md:161: ## Dead ends (do not retry)
docs/glossary.md:181: ## Constraints and limits
docs/glossary.md:182: ## Dead ends (do not retry)
skills/academic/paper-review-panel/agents/methodology_reviewer_agent.md:239: #### Results Presentation
skills/academic/paper-review-panel/templates/peer_review_report_template.md:154: ### Results / Findings
skills/academic/paper/agents/citation_compliance_agent.md:940: ### Results check
skills/academic/paper/agents/socratic_mentor_agent.md:239: ### Results: 5 Mandatory Questions
skills/academic/researcher/SKILL.md:55: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:73: ### The stage and campaign that stand | ### Cluster facts
skills/academic/researcher/SKILL.md:74: ### Where things live
skills/academic/researcher/SKILL.md:104: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:255: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:261: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:265: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:276: ## Dead ends (do not retry)
skills/academic/researcher/SKILL.md:278: ### Where things live
skills/academic/researcher/SKILL.md:279: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:285: ### Cluster facts
skills/academic/researcher/SKILL.md:288: ## Constraints and limits | ### Cluster facts
skills/academic/researcher/SKILL.md:294: ## Constraints and limits
skills/academic/researcher/SKILL.md:300: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:325: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:332: ## Results and how to reproduce
skills/academic/researcher/SKILL.md:334: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:339: ## Results and how to reproduce
skills/academic/researcher/SKILL.md:342: ## Results and how to reproduce
skills/academic/researcher/SKILL.md:350: ## Dead ends (do not retry)
skills/academic/researcher/SKILL.md:352: ## Dead ends (do not retry)
skills/academic/researcher/SKILL.md:353: ## Constraints and limits
skills/academic/researcher/SKILL.md:359: ## Results and how to reproduce
skills/academic/researcher/SKILL.md:371: ### Cluster facts
skills/academic/researcher/SKILL.md:383: ## Results and how to reproduce
skills/academic/researcher/SKILL.md:384: ## Dead ends (do not retry)
skills/academic/researcher/SKILL.md:385: ## Results and how to reproduce
skills/academic/researcher/SKILL.md:400: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:410: ### Where things live
skills/academic/researcher/SKILL.md:412: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:423: ### Where things live
skills/academic/researcher/SKILL.md:437: ### Where things live
skills/academic/researcher/SKILL.md:611: ## Results and how to reproduce
skills/academic/researcher/SKILL.md:615: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:624: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:627: ## Constraints and limits
skills/academic/researcher/SKILL.md:633: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:637: ## Results and how to reproduce
skills/academic/researcher/SKILL.md:650: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:657: ## Results and how to reproduce
skills/academic/researcher/SKILL.md:670: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:672: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:719: ## Results and how to reproduce
skills/academic/researcher/SKILL.md:740: ### The stage and campaign that stand
skills/academic/researcher/SKILL.md:767: ## Dead ends (do not retry)
skills/academic/researcher/SKILL.md:769: ### Where things live
skills/academic/researcher/references/project_layout.md:44: ## Constraints and limits
skills/academic/researcher/references/project_layout.md:46: ## Results and how to reproduce
skills/academic/researcher/references/project_layout.md:48: ## Dead ends (do not retry)
skills/academic/researcher/references/project_layout.md:49: ## Results and how to reproduce | ## Dead ends (do not retry)
skills/academic/researcher/references/project_layout.md:51: ### The stage and campaign that stand
skills/academic/researcher/references/project_layout.md:52: ### Where things live
skills/academic/researcher/references/project_layout.md:53: ### Cluster facts
skills/academic/researcher/references/project_layout.md:57: ## Dead ends (do not retry)
skills/academic/researcher/references/project_layout.md:75: ### Where things live
skills/academic/researcher/references/project_layout.md:112: ## The stage and campaign that stand
skills/academic/researcher/references/project_layout.md:113: ## Results and how to reproduce | ## Dead ends (do not retry)
skills/academic/researcher/references/project_layout.md:118: ### Where things live
skills/academic/researcher/references/project_layout.md:119: ### Where things live
skills/academic/researcher/references/project_layout.md:124: ## Dead ends (do not retry)
skills/academic/researcher/references/project_layout.md:133: ### Where things live
skills/academic/researcher/references/research_brief.md:9: ### The stage and campaign that stand
skills/academic/researcher/references/research_stages.md:5: ### The stage and campaign that stand
skills/academic/researcher/references/research_stages.md:13: ## Constraints and limits | ### Cluster facts
skills/academic/researcher/references/research_stages.md:14: ## Constraints and limits | ### Cluster facts
skills/academic/researcher/references/research_stages.md:27: ## Results and how to reproduce
skills/academic/researcher/references/research_stages.md:33: ### The stage and campaign that stand
skills/academic/researcher/references/research_stages.md:34: ## Results and how to reproduce
skills/academic/researcher/references/research_stages.md:35: ## Results and how to reproduce
skills/academic/researcher/references/research_stages.md:41: ## Results and how to reproduce | ## Dead ends (do not retry)
skills/academic/researcher/references/research_stages.md:43: ## Results and how to reproduce
skills/academic/researcher/references/research_stages.md:46: ## Results and how to reproduce
skills/academic/researcher/references/slurm.md:3: ### Cluster facts
skills/academic/researcher/references/slurm.md:20: ## Results and how to reproduce
skills/academic/researcher/references/slurm.md:25: ### The stage and campaign that stand
skills/academic/researcher/references/slurm.md:28: ### The stage and campaign that stand
```

Each hit named: every `###` hit is a `###` heading under `## Working state`; every `## Constraints and limits`, `## Results and how to reproduce` and `## Dead ends (do not retry)` hit is that heading; `project_layout.md:112` is the old-layout test of "What to build" 6; `ADR 0057:11` and `ADR 0057:30` are ADR 0057; the four `####`/`###` Results hits outside researcher are `methodology_reviewer_agent.md:239`, `peer_review_report_template.md:154`, `citation_compliance_agent.md:940` and `socratic_mentor_agent.md:239`. ADR 0053 has no hit: its superseded bullet names the stage and campaign that stand without `## `. `project_layout.md:113` is the old-layout mapping, which names the old sections in plain words and only their new headings in code.

Verify 5. Each new or changed list item and sentence was read against `docs/dev/skill-layout.md`, "Lists and tables", and the prose standard, E, "Sentence length". The places over roughly 20 words, each kept in its form:

- `project_layout.md`, "The README", the `### The stage and campaign that stand` bullet: the old item 5 carried unchanged, one list of what the subsection holds; splitting it would separate parts of one content list.
- `project_layout.md`, "The README", items 4, 8 and 10: each one sentence listing the fields of one section, which the layout must state together.
- `project_layout.md`, the slug bullet and the next-free-name bullet: one rule each, the example in the same bullet as the qualifier that it illustrates.
- `project_layout.md`, "A README in the old layout", bullet 2: one mapping, kept whole so that each old section's new place stands in one sentence.
- `SKILL.md`, Steps 1, the old-layout bullet: the condition, the stop and its timing are one rule; the timing qualifier changes the rule and stays with it.
- `SKILL.md`, "idea" item 11 bullet 2, "research" item 3 bullets 5 to 7, item 4 bullets 5 and 6, item 5 bullet 3, item 16 bullet on the code README, "readme" item 2 bullets 1 to 6, item 3 bullets 1 and 3: each one rule with the qualifier that changes it (a place, a source, an exception), as "Lists and tables" asks.
- `SKILL.md`, "What it reads" 1, 3, 20 and 22, and the Stops rows: existing long items, where the change adds a mode name or a heading inside the existing sentence.
- `README.md` line 34: the row's form is one cell of running sentences; the added sentences are 63, 37 and 11 words, and the adopt sentence grew by one clause.

## The terms

- **slug, of a section of a project's README**: added to "Ordo's own terms", since the plan term **slug** means the ledger folder's name and `project_layout.md` now names `notes/<slug>.md` in another sense. "Stated in: `skills/academic/researcher/references/project_layout.md`, "The README"": `grep -n '<slug>' skills/academic/researcher/references/project_layout.md` prints lines 56, 57 and 58, all under "The README" (which runs from line 35 to the next `##` at line 62).
- **campaign**: changed to `### The stage and campaign that stand`, under `## Working state`. "Stated in": `grep -n` printed `SKILL.md:334: 12. Experiments: run each campaign, ...` ("research" item 12), `SKILL.md:626: 3. Run each results comment as one campaign ...` ("revision" item 3), and `research_stages.md:33`, "Experiments".
- **cluster's facts**: changed to `### Cluster facts`, under `## Working state`. "Stated in": `SKILL.md:285: - Ask the cluster's facts when `### Cluster facts` holds none` ("research" item 4) and `references/slurm.md:3`.
- **dead end**: changed to `## Dead ends (do not retry)`. "Stated in": `SKILL.md:350` and `352` ("research" item 14), `SKILL.md:384` (item 17), `SKILL.md:660` ("revision" item 7), `project_layout.md:121: ## The dead ends`.
- **setting, of `research`**: unchanged; it names `## Constraints and limits`, which is the new heading too. "Stated in": `SKILL.md:284` ("research" item 4), `SKILL.md:353` (item 15), and "revision" item 4.
- Terms used in new places, each read against its entry: **stop** (the two new stops, each a halt for the user's decision), **refusal** ("No project folder" for `readme`, which leaves nothing), **completion criterion, of a stage** (unchanged in meaning; Frame's names `## Data` for the dataset), **campaign** ("research" item 12's `### The approach`), **dead end** ("readme" item 2's dead ends from `code/attic/README.md`), **verdict, of a novelty check** (not used anew).

## Files with line counts

| File | Lines after | `git diff --numstat` |
|---|---|---|
| `skills/academic/researcher/SKILL.md` | 819 | 139 added, 71 removed |
| `skills/academic/researcher/references/project_layout.md` | 133 | 81 added, 18 removed |
| `skills/academic/researcher/references/research_stages.md` | 55 | 13 added, 13 removed |
| `skills/academic/researcher/references/slurm.md` | 39 | 4 added, 4 removed |
| `skills/academic/researcher/references/research_brief.md` | 57 | 1 added, 1 removed |
| `docs/glossary.md` (lines 151, 156, 161, and a new line 182) | 191 | 4 added, 3 removed |
| `docs/adr/0055-...md` (line 15) | 31 | 1 added, 1 removed |
| `README.md` (line 34) | 270 | 1 added, 1 removed |

## Every judgment call the brief left open

1. The completion criteria of Experiments, Compare and Consolidate in `research_stages.md` name the new headings and do not require the new sections (`### The approach`, `### What is not claimed`, `### What this project adds`, the code README in its layout). Those writes are named in each stage's "What it leaves" and in the "Done when" of "research" items 12, 13 and 16. Reason: the adopt mode checks each stage's criterion and continues at the first that fails, so a criterion that required a README section would send an adopted project with finished results back to Experiments or to a reproduction run for a section of text; Decision 1 keeps Frame's criterion from growing for the same reason. The orchestrator may rule otherwise.
2. Frame's completion criterion keeps its requirements; it reads "`## Data` holds the dataset with the reason it was chosen" where it read that `## Constraints and limits` holds it, since "What to build" 1 moves the dataset to `## Data`.
3. Writers the brief does not name: the line under the title is written by Frame (item 4), from the user's answers; `### Where things live` is written by "research" item 3, since the raw inputs it held now go to `## Data` (item 5) and Frame no longer writes there.
4. Frame item 4 asks for what the project is, its problem, why it matters, what it does and its venue "where the project's files do not hold them"; the venue serves the line under the title.
5. A no-mode bullet in Steps 1 sends a request to bring a README up to date to "The entry point" with the line of `readme`, as for every other mode.
6. The Rules bullet "The skill reads and writes no file of any other tool, such as a project manifest: what it records of a project stands in the files of `references/project_layout.md`." states ADR 0057's skill-wide bullet once; "readme" item 1 points at it.
7. Two Anti-patterns rows: a README written without its draft shown (ADR 0057's rejected alternative), and a fact of the old README dropped. The row "The files of a project underway moved" points at "readme" item 2.
8. The old-layout mapping in `project_layout.md`, "A README in the old layout", names the old sections in plain words, so that the test line is the one place that names the old heading in code.
9. `research adopt` raises the stop "A README in the old layout" as "What to build" 6 lists it, though its item 3 runs the same rewrite.
10. The description dropped three trigger phrases whose cases stay covered (case 17 above) to fit the readme mode within 1,024 characters.
11. The glossary entry for the slug of a README section, for the reason under "The terms".

## Host- or user-visible changes, before and after

- `/researcher readme <project folder>`: before, no such mode, and the call matched no line of Quick start; after, it drafts the README, the code README and `.depositignore`, stops at "The README drafts", and writes after approval.
- A project README written by `research`: before, nine sections starting with `## Research questions and claims`; after, the title line and the twelve sections of ADR 0057.
- `code/README.md` of a new project: before, a title line; after, the title and seven sections, each `None yet.`, brought to the layout at Consolidate.
- `code/.depositignore` of a new project: before, `data/`; after, the 14 lines of Decisions 5.
- `idea`, `research`, `research adopt`, `full` and `revision` on a README that holds `## The stage and campaign that stand`: before, they ran; after, they stop at "A README in the old layout" with the line `/researcher readme <project folder>`.
- `research adopt` item 3: before, it appended the missing sections with no draft shown; after, it drafts the README whole by the rewrite and writes after approval.
- `idea` item 11 on a README without the section: before, first after the title; after, after `## In short` and `## What it is and why`.
- `metadata.version`: before `1.0.0`, after `2.0.0`.
- The description: before 1022 characters, after 1015, with `readme` added.
- `README.md` line 34: names `readme` among the repository's own modes, adds the readme mode's sentences, and says that the adopt mode brings the README to the layout by the same rewrite.

## Anything in the brief that was wrong or impossible

- "What is on the tree" says the rendered `researcher.svg` line 158 carries the adopt mode's note. On the base, `git show HEAD:docs/figures/researcher.svg | grep -c 'adopt'` prints `0`; line 158 of `researcher.svg` holds the note on `novelty` and `idea`. The adopt note stands in `researcher-research.svg` lines 156 and 157 (`grep -n -o '>[^<]*sections it lacks[^<]*<' docs/figures/*.svg` prints line 157), not line 157 alone.

## Doc text

For step 5, which applies these lines to `docs/figures/gen_figures.py` and `README.md` and renders the `.svg` files.

Made false by this step:

- `docs/figures/gen_figures.py`, the note of `researcher-research.svg`, as `grep -n` prints it:
  - `2164:        "test as a short job, and the session polls only when you ask. research adopt reads a "`
  - `2165:        "project underway against each stage, writes the README sections it lacks, moves nothing "`
  - Replacement of the two lines:
    - `        "test as a short job, and the session polls only when you ask. research adopt reads a "`
    - `        "project underway against each stage, drafts its README in the layout by the readme mode's "`
    - `        "rewrite and writes it after you approve the draft, moves nothing "`
  - The rendered `researcher-research.svg` lines 156 and 157 follow when the script runs.

Not false, but leaving out what the step adds (for step 5 to judge):

- `docs/figures/gen_figures.py`, the floating stops of the research figure, as `grep -n` prints the line before which a node is added:
  - `2156:        Node("J", "The jobs submitted: the job ids in the README, and the run stops", "stop"),`
  - Line added before it: `        Node("O", "A README in the old layout: /researcher readme offered", "stop"),`
- The same for the revision figure:
  - `2263:        Node("J", "The jobs submitted: the job ids in the README, and the run stops", "stop"),`
  - Line added before it: `        Node("O", "A README in the old layout: /researcher readme offered", "stop"),`
- `docs/figures/gen_figures.py`, the note of `researcher.svg`, which names the modes that start no agent:
  - `2090:        "integrity record and each compliance report is a file of the run folder. novelty and "`
  - `2091:        "idea start no agent and are not drawn: novelty searches the closest prior work on each "`
  - Replacement: `        "integrity record and each compliance report is a file of the run folder. novelty, "` and `        "idea and readme start no agent and are not drawn: novelty searches the closest prior work on each "`, and after "...writes the research questions and claims into the README" the clause `, and readme drafts the project's README and code README for a newcomer and writes them after you approve the drafts` before the closing `."`.
- `README.md` line 90, the alt text of `researcher-research.svg`: the text `and apart: A project underway: research adopt offered, a stop;` becomes `and apart: A project underway: research adopt offered, a stop; A README in the old layout: /researcher readme offered, a stop;`.
- `README.md` line 92, the alt text of `researcher-revision.svg`: the text `and apart: The jobs submitted: the job ids in the README, and the run stops, a stop;` becomes `and apart: A README in the old layout: /researcher readme offered, a stop; The jobs submitted: the job ids in the README, and the run stops, a stop;`.

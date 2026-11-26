# Brief check: step 2

Read in full: `L/agents/briefs/2.md`; `L/plan.md` (Goal, Gate, step 2's line, `## Rulings`); `docs/dev/change-standard.md`; `docs/dev/skill-layout.md`; `skills/ordo/ordo-init/templates/docs/dev/prose-standard.md`; `docs/glossary.md`; `skills/academic/researcher/SKILL.md` (751 lines); `references/project_layout.md`, `research_stages.md`, `slurm.md`, `research_brief.md`; `agents/research_builder_agent.md`, `agents/research_reviewer_agent.md`; ADRs 0053 to 0057 and `docs/adr/README.md`. Main is at `ee15921` (`git log -1 --oneline` printed `ee15921 Open the plan of roadmap entry 27`).

The most serious finding is 4.1. The brief's heading grep, used as Case 1 and as Verify item 4, prints nothing and exits 1 on this machine, so the check the step line relies on passes without checking anything.

## 1. Names

1. Old headings outside the step's paths. Command: `git grep -n -P '## (The stage and campaign that stand|Cluster facts|Where things live|Results|Dead ends)\b' -- skills docs README.md ':!skills/academic/researcher'`. Hits:
   - `docs/adr/0055-...md:15`. This is in the step's paths (line 15).
   - `docs/adr/0057-...md:11` and `:30`. Line 11 is the new layout. Line 30 (Consequences) says every reference to the old headings "change with it". It stays true and is not made false.
   - `docs/glossary.md:151`, `:156`, `:161`. These are in the step's paths (lines 146-190). Line 181 (`## Constraints and limits`) did not match this pattern. The `-E` grep `git grep -n -E 'stage and campaign that stand|Cluster facts|Where things live|## Dead ends|Constraints and limits|`## Results`'` over the same scope found it, and it is in the step's paths.
   - Four lines name something else and are not made false:
     - `skills/academic/paper-review-panel/agents/methodology_reviewer_agent.md:239` `#### Results Presentation`
     - `skills/academic/paper-review-panel/templates/peer_review_report_template.md:154` `### Results / Findings`
     - `skills/academic/paper/agents/citation_compliance_agent.md:940` `### Results check`
     - `skills/academic/paper/agents/socratic_mentor_agent.md:239` `### Results: 5 Mandatory Questions`
   - `docs/adr/0053-...md:19` (from the `-E` grep). This is the bullet ADR 0053's Status line says 0057 supersedes. It is not made false.
2. `code/.depositignore` and `code/README.md`. Command: `git grep -n -E 'depositignore|code/README\.md' -- . ':!.scratch'`. Hits outside the step's paths:
   - `docs/adr/0053-...md:20`, the default layout "with ... `.depositignore`". Still true.
   - `docs/adr/0057-...md:13`, `:14`. These are the decision itself.
   - `docs/roadmap.md:26`, `:27`, the goal and gate text. Still true.

   None is made false.
3. New names: the mode `readme`, the stops "A README in the old layout" and "The README drafts", `In short`, `What it is and why`, `Working state`, `notes/next`, `None yet`. Command: `git grep -n -E 'researcher readme|readme mode|README drafts|old layout|README in the old layout|No project folder|In short|What it is and why|Working state|notes/next|None yet' -- . ':!.scratch'`. Outside the step's paths it hits only ADR 0057 (lines 1, 11, 12, 15, 16, 30), ADR 0058:7, `docs/adr/README.md:66` and `docs/roadmap.md:26-27`. All of them describe the new design, and none is made false. "No project folder" appears only in `SKILL.md`, which is in the step's paths.
4. Places that list researcher's modes and will not show the new mode (not made false, but incomplete):
   - `README.md:34`, the researcher row. It lists the modes ("`novelty`, `idea`, `research` with its adopt mode, `full` and `revision` are this repository's own") and gives each mode's command.
   - `README.md:90`, the figure alt text.

   Command: `git grep -n -E 'research adopt|/researcher (novelty|idea|research)' -- skills docs README.md ':!skills/academic/researcher/SKILL.md' ':!.scratch'`. `README.md` is step 6's, and the brief does not hand this over to step 6. Rule 5 of the change standard ("Every user-visible surface changed is documented in the same step") bears on it.
5. `docs/figures/gen_figures.py:2165` ("writes the README sections it lacks"). It also appears in the rendered `docs/figures/researcher-research.svg:157` and `docs/figures/researcher.svg:158`. The step makes it false. The brief routes it to "Doc text" for step 5, which is correct, but the brief does not name the two `.svg` files that step 5 regenerates.

## 2. The step line

Requirement mapped to the part of the step line it serves:

1. "`researcher`'s README ... in the layout of ADR 0057": What to build 1, and 4 (the writers, so that research writes the layout).
2. "`code/README.md` in the layout": What to build 2, and 4 (Consolidate).
3. "`code/.depositignore` with what it names": What to build 3.
4. "the mode `/researcher readme <project folder>` with a section moved out ... to `notes/<the heading as a slug>.md`": What to build 7, and 1 (the 200-line bullet).
5. "the adopt mode bringing a README to the layout by that rewrite": What to build 8.
6. "every reference to the README's sections in `SKILL.md`, its references, its agent pages and the glossary entries ... following": What to build 5.
7. "its `metadata.version` raised": What to build 9.
8. Check, "a grep for each old heading across `skills/`, `docs/` and the glossary prints only the new places": Case 1 and Verify 4. As written, the grep does not run (4.1).
9. Check, "the user reads the text against ADR 0057": not in the brief. It is the orchestrator's gate, so this is correct.
10. What to build 6 (the old-layout stop) is not in the step line. It serves "in the layout" and is one of the brief's own Decisions (2).

No part of the line is left without a requirement.

## 3. Premises

Commands rerun on main at `ee15921`:

1. `sed -n '35,51p' references/project_layout.md`: nine `##` sections in the order stated. Holds.
2. `wc -l SKILL.md` printed `751`, and `grep -n version` printed `5:  version: "1.0.0"`. Holds.
3. The `git grep -n -E '...'` over `skills/academic/researcher`. Partly wrong:
   - `SKILL.md` "What it reads": the hits are on lines 54 (item 3), 72 (item 20) and 73 (item 21). The brief names 3, 20 and 24 and leaves out item 21 (`## Where things live`). Item 24 names `## Next`, which the pattern does not match and whose name does not change.
   - Stops rows: the hits are lines 655 (row "A result short of what was set, in `research`", `## Results`) and 675 ("No project of research"). The brief names "A project underway", "What the adopt mode found" and "No project of research" and leaves out row 655. Rows 648 and 658 hold no heading literally; they test the heading through the README "naming a stage" or being "usable".
   - Anti-patterns: lines 702 and 704. Holds.
4. Lines 261 and 389 hold what the brief says, and line 380 is item 1's usable-README test. Holds.
5. Line numbers in the other files are wrong:
   - `research_stages.md`: the brief says lines 5, 6, 8, 13, 14, 27, 41. The grep hits 5, 13, 14, 27, 33, 34, 35, 41, 43, 46. Lines 6 and 8 name no heading, and 33, 34, 35, 43 and 46 are missing from the brief.
   - `slurm.md`: the brief says 20 and 25. The grep hits 3, 20, 25, 28. Lines 3 (`## Cluster facts`) and 28 (`## The stage and campaign that stand`) are missing.
   - `research_brief.md`: the brief says 9, 17, 25, 29. Only line 9 names a heading. Lines 17, 25 and 29 name "the README" with no heading.
   - Agent pages: lines 15 and 20 of both pages and line 27 of the reviewer page name the README, as the brief says. None names a heading.
6. The glossary: `grep -n '^## \|ordo:plan-terms' docs/glossary.md` printed `5`, `6 ## Plan terms`, `144` (end of block), `146 ## Ordo's own terms`. The entries are at 151, 156, 161 and 181. Holds.
7. ADR 0055 line 15 names `## Results`. Holds.
8. Description length: the skill-layout command printed `1022 skills/academic/researcher/SKILL.md`. Holds.
9. `gen_figures.py`: `grep -n` shows `floating = (` at 2154 and `note = (` at 2160, with the adopt sentence at 2164-2165. Holds approximately; the range starts at 2154, not 2155.
10. ADR 0053's Status line reads "superseded by 0056 in the sentence ... and by 0057 in the bullet 'The project's `README.md` is its entry file' and in the sentence 'With no usable README ... writes the README sections after the user confirms.'" Holds.
11. "No other ADR touches the step": wrong for ADR 0054 (7.3).

## 4. Cases and checks

1. Case 1 (and Verify 4): the grep is broken on this tree.
   - `git grep -c -E '## (The stage and campaign that stand|Cluster facts|Where things live|Results|Dead ends)\b' -- skills docs` printed nothing and `exit 1` (git 2.49.0). The `\b` is not honoured in `-E`.
   - The same pattern without `\b`, or with `-P`, prints 74 hits in 12 files, for example `skills/academic/researcher/SKILL.md:40`.
   - As written, the case passes on any tree. That breaks the change standard's "A change carries to every place that names it" (rule 14), whose grep the report must quote, and rule 6's "The report gives the numbers seen". The command should use `-P` or drop `\b`.
2. Case 1 also asks the builder to name four hits in places the step does not change: the paper and paper-review-panel lines of 1.1. That is intended ("each such hit named").
3. Case 3 asks for "`code/.depositignore` with the six entries". Four of them are folder names, but "caches" and "secrets" are not lines a file holds, and the brief gives no patterns. The case cannot be read as pass or fail without them (6.1).
4. Case 5 does not follow from What to build 7.
   - Item 7 drafts a section from "the project's files", and the old README is one of them. Only "what no file holds" becomes a question.
   - With no manuscript and no novelty page, `## In short` can still be drafted from the old README's own text or from `## Research questions and claims`. The case's expected result (In short drafted as questions) holds only when the README holds nothing usable, and the case does not say so.
5. Case 4 is consistent with item 7, but it rests on the slug rule, which nothing defines (6.4).
6. Verify item 1 and the Cases all fit the rules file. "This is a text step: every case is checked by reading" matches the change standard's rule 1 and "Scripts compute facts".
7. The Cases have no case for these behaviours the brief adds:
   - the readme mode's refusal (What to build 7, last bullet);
   - `full` and `revision` meeting an old-layout README (What to build 6);
   - research item 3 on a folder that holds only what `idea` wrote, where `## Research questions and claims` "stays as it stands, first after the title" (`SKILL.md:263`). In the new layout it is the fourth `##` section (4.8).
8. What to build 4 and 1 conflict with the layout's order.
   - Item 4 says `idea` "writes `## Research questions and claims` as now". Now, `idea` item 11 (`SKILL.md:238`) places that section "first after the README's title when it has none".
   - research item 3 keeps an idea-written section "first after the title" (`SKILL.md:263`) and a `## Next` "last" (`SKILL.md:264`).
   - In the ADR 0057 layout, `## Research questions and claims` comes after `## What it is and why`, and `## Next` comes before `## Working state`.
   - "As now" therefore contradicts What to build 1 and ADR 0057's Decision (first bullet). The brief keeps the "two it keeps today" without saying where they go.

## 5. The question

The goal part step 2 delivers is: researcher writes both files in the ADR 0057 layout, every reference follows, `.depositignore` leaves out what the record names, the readme mode rewrites both files keeping every fact and writes after approval, the adopt mode uses that rewrite, and no other tool's file is read or written.

The step line's check: yes, it could pass without the goal being reached. The grep part prints nothing as written (4.1), so a missed reference such as `research_stages.md:43` or `slurm.md:28` passes. The user's read remains, but it is the only working check.

Cases:
1. Case 1: yes, it passes vacuously (4.1).
2. Case 2: no. Twelve sections in order with every subsection is the layout.
3. Case 3: partly. It cannot fail on the cache and secret entries, which have no defined lines (6.1). It also does not cover an existing `.depositignore`, which "each only when it does not exist" (`SKILL.md:261`) leaves holding only `data/` (6.2).
4. Case 4: no for the log being kept. Yes for the slug and for a `notes/` file that already exists, which the case does not test (6.4).
5. Case 5: it could fail a correct build (4.4). It does not catch invention in other sections.
6. Case 6: no.
7. Case 7: no for `research`. Yes for `full`, `revision` and `research adopt`, which item 6 also covers and no case reads.
8. Case 8: no.
9. Case 9: yes. A count of 1,024 or less can be met by cutting a `Triggers on:` phrase of an existing case, which `docs/dev/skill-layout.md` "Frontmatter" forbids ("lists at least one phrase for each case"). The current count is 1022, so the readme line forces cuts elsewhere, and no case reads the triggers.

Items of What to build:
1. Item 1: no for the headings. It could pass with `idea` and research item 3 still placing sections out of order (4.8).
2. Item 2: no.
3. Item 3: yes (6.1, 6.2).
4. Item 4: yes. "Completion criteria name the new headings" does not say whether Frame's criterion requires `## In short` and `## What it is and why`. The Stops row "Frame's questions" (`SKILL.md:649`), whose "What it shows" changes, is not named.
5. Item 5: yes. Its place list comes from the second to fourth bullets of "What is on the tree", which leave out `SKILL.md` "What it reads" 21, the Stops row at line 655, `research_stages.md` 33-35, 43 and 46, and `slurm.md` 3 and 28 (3.3, 3.5). With the broken grep, nothing catches these.
6. Item 6: no for the four modes named. It does not say what `idea` does when it writes into an old-layout README.
7. Item 7: yes on these points:
   - The mode's dispatch is named, but these sentences are not: the Steps intro sentence "A run of `novelty`, `idea`, `research` or `research adopt` runs Steps 1 and then Steps 6, and skips Steps 2 to 5" (`SKILL.md:80`), the Steps 6 list of subsections (`SKILL.md:136`), the skill's introduction (`SKILL.md:10`) and "What it reads" 1's list of refusals per mode.
   - A refusal of its own makes the Stops intro's "the thirteen refusals at the end" (`SKILL.md:613`) false. The brief does not name that sentence. Rule 14 of the change standard covers it, but the brief leaves it to chance.
8. Item 8: yes for adopt on a project with no README at all, which today is "A project with no README gets one" (`SKILL.md:393`). The readme mode refuses a folder with no `README.md` and no `code/README.md`, and the brief does not say which wins (6.6).
9. Item 9: the version is wrong (8.1).

## 6. Implied inputs

This is a text step: a skill's text.

1. The lines `code/.depositignore` holds for "caches" and "secrets" are never given. A wrong choice publishes a secret or a cache in the public deposit.
2. A project that already holds a `code/.depositignore` holding only `data/`, which every project `research` started so far has:
   - research item 3 writes it "only when it does not exist";
   - the readme mode and the adopt rewrite draft only `README.md` and `code/README.md`.

   Such a project keeps a deposit that publishes `attic/`, `results/` and `figures/`, which is what ADR 0057's fourth Decision bullet exists to prevent.
3. A project underway whose code folder is not `code/` (its own names in `### Where things live`): the brief does not say where the readme mode and adopt write `code/README.md`, or where `.depositignore` goes. Writing a new `code/` folder would break ADR 0053's "A project underway keeps its own names ... and nothing is moved", which is still in force.
4. The slug of a heading is not defined, for example `## Dead ends (do not retry)` or `## Results and how to reproduce`. The brief also does not say what happens when `notes/<slug>.md` already exists, for example a user's own `notes/next.md`. An overwrite there loses the user's work.
5. A project with a `README.md` but no `code/` folder, such as one only `idea` wrote: the brief does not say whether the readme mode makes `code/README.md` or leaves it out.
6. `research adopt` on a project with no `README.md` and no `code/README.md`: the readme mode's refusal and adopt item 3's "A project with no README gets one" conflict. A wrong choice refuses an adopt that works today.
7. Frame's completion criterion, and therefore adopt item 1's check of "each stage it calls done", is not decided: does it require `## In short` and `## What it is and why`? If it does, adopt sends a project that is underway back to Frame.
8. `idea` meeting an old-layout README, or a new-layout README that lacks `## Research questions and claims`: where the section goes (4.8).
9. Which existing description text and `Triggers on:` phrases give way to the readme line, with only 2 characters spare (5, Case 9). A lost trigger means a request worded that way no longer finds the skill.

## 7. ADRs

1. ADR 0057 (proposed, in force whole). The step is under every Decision bullet, as the brief says, including "The skill reads and writes no file of any other tool." The brief's items 1, 2, 3, 7 and 8 follow it.
   - One contradiction: What to build 4 ("`idea` writes ... as now", which places it first) and research item 3's kept sections against the first Decision bullet's order (4.8).
   - The `code/README.md` path for a project underway (6.3) is undecided against it.
2. ADR 0053 (superseded in the README bullet and the adopt sentence, otherwise in force). The step is under "The default layout for a new project is `code/` (with ... `.depositignore`) ... A project underway keeps its own names, recorded in its README, and nothing is moved." The brief names it. Its readme mode writing only `notes/` files is consistent. A `code/README.md` written for a project with its own code folder name would contradict it (6.3), and the brief does not decide that case.
3. ADR 0054 (proposed, in force). The step touches its sentence "It ends with the research questions and claims written into the project's `README.md`", through `idea` items 10 and 11, whose placement the new layout changes. The brief's "What is on the tree" does not name it and says "No other ADR touches the step." The brief does not contradict its decision.
4. ADR 0055 (in force). The step is under the bullet "The session writes `revision-comments.md` ... the lines of the README's `## Results` that answer it". The edit to `## Results and how to reproduce` is a refinement that keeps the decision, which `docs/adr/README.md` line 5 allows ("A refinement that keeps the decision edits the ADR to its current state with no dated note"). Holds.
5. ADR 0056: the step changes heading names in `slurm.md` lines that 0056 does not govern, so it does not touch the step.
6. ADR 0052: the step does not touch the `integrity` and `manuscript` modes' text, so it does not touch the step.
7. Every other ADR (0001 to 0051, 0058 to 0060): its decision governs nothing the step changes.

## 8. Dictated text

1. `grep -n '1\.1\.0' briefs/2.md` finds lines 62 and 110 (`metadata.version` raised to `1.1.0`). It breaks `docs/dev/skill-layout.md` "Frontmatter": "The major part when, under the same inputs and the default keys, a run that worked before is refused, or its output is changed or removed."
   - `/researcher research` on a project whose README holds `## The stage and campaign that stand` now resumes. After the change it stops at "A README in the old layout" (What to build 6).
   - research item 3's README output changes layout.
   - "A refusal of a value the skill's text already called an error is no run that worked before" does not apply, because such a README is valid today.
   - The version is therefore `2.0.0`. This also affects Decision 3 at line 110.
2. `grep -n 'Why it matters' briefs/2.md` finds line 29. `### Why it matters`, and in the same line `## What it is and why`, `### What it does`, then `### What is not claimed` (line 32), `### What this project adds` (line 34), `## What it computes` and `## What each result comes from` (line 43): each is a wh-clause.
   - The prose standard, "0. Hard rules", says "Headings are labels, not sentences ... Not 'Why it is separate at all'". `### Why it matters` has the shape of that banned example.
   - These headings are dictated by D1, D15 and ADR 0057, so this is a clash between the standard and a ruling for the orchestrator to raise. The builder does not decide it.
   - The other headings (`## In short`, `## Data`, `## Method`, `## Related work`, `## Papers`, `## Next`, `## Working state`, `### The problem`, `### The approach`, `### The closest prior work`, `## Requirements`, `## Run`, `## Layout`, `## License and citation`, `# <project>: code`) hold.
3. `grep -n 'Dead ends (do not retry)' briefs/2.md` finds line 37. The parenthetical makes the heading carry an instruction, which leans against "Headings are labels". It is ruled by D1. Raise it with 8.2.
4. `grep -n 'A README in the old layout' briefs/2.md` finds lines 54, 72 and 109; `grep -n 'The README drafts'` finds lines 57 and 61. These are stop names and labels. Holds.
5. `grep -n 'None yet' briefs/2.md` finds lines 41, 45 and 68. `None yet.` holds; it is the existing line of `project_layout.md:50`.
6. `grep -n 'researcher readme <project folder>' briefs/2.md` finds lines 54 and 55. Holds; it is a command line.
7. `grep -n 'notes/<' briefs/2.md` finds lines 41 and 58: `notes/<the section's heading as a slug>.md` and `notes/<the heading as a slug>.md`. These are two spellings of one path. The prose standard "D. Structure" says "No synonym cycling. One term per concept, repeated." It holds if the builder writes one form.
8. ADR 0055 line 15 to name `## Results and how to reproduce` (`grep -n 'ADR 0055 line 15' briefs/2.md` finds line 53). Holds.
9. `LC_ALL=C grep -n '[^ -~]'` over the brief printed nothing (exit 1). The brief is ASCII.

## Declined to judge

1. Whether the wh-clause headings of 8.2 and 8.3 should be changed. They are dictated by the user's rulings D1 and D15 and by ADR 0057, so the standard against a ruling is the user's decision.

Agent usage: aa8df1549baebff17, claude-opus-5-5, 195898 tokens, 28 tool uses, 4.8 minutes.

## Closed (the session's change to the brief for every finding above, and each dictated line added after the check, made before the preparation commit)

- 1.1: the second bullet of "What is on the tree" lists every old-heading line by the `-P` grep, and the case names the four hits outside researcher.
- 1.2 and 1.3: no change; none is made false.
- 1.4: "What to build" 9 has `README.md` line 34 name the readme mode; line 90, the alt text, goes to "Doc text" for step 5.
- 1.5 and 3.9: "Report" asks for a "Doc text" section naming each figure label and alt text the step makes false, with both rendered `.svg` files, for step 5.
- 2.8 and 4.1, 5.1: the grep uses `-P`, in "What is on the tree", the case and Verify.
- 2.9, 2.10: no change.
- 3.3, 3.5 and 5.5 (item 5): "What is on the tree" gives the lines by file, the agent pages naming no heading.
- 3.10, 7.2: "What is on the tree" quotes ADR 0053's kept bullet on a project's own names.
- 3.11, 7.3: "What is on the tree" names ADR 0054 and its sentence.
- 4.3, 5.3 and 6.1: Decisions 5 gives every line of `code/.depositignore`.
- 4.4 and 5.5: the case reads In short drafted from the old README with its source named, and The closest prior work as a question.
- 4.5, 5.4 and 6.4: "What to build" 1 gives the slug rule and the next free name; the case covers `notes/next-2.md`.
- 4.7: three cases added: the refusal, `full` and `revision` on an old-layout README, research item 3 after `idea`.
- 4.8, 5.1 (item 1) and 6.8: "What to build" 4 places `idea`'s section at its place in the layout and keeps the kept two at their places; a case reads `idea` on a new-layout README; `idea` on an old-layout README is the stop of item 6.
- 5.7 (item 6): "What to build" 6 names `full`, `revision` and `idea`.
- 5.7 (item 7) and 6.9: "What to build" 7 names the introduction, line 80, Steps 1 and 6, "What it reads", the description with its triggers kept, and the Stops introduction's count; a case checks the triggers.
- 5.8 (item 8) and 6.6: Decisions 8: the readme mode refuses only a folder that does not exist or is empty, so adopt drafts a README for a project with none; a case reads it.
- 5.9 (item 9) and 8.1: Decisions 3: version 2.0.0, by the major part.
- 6.2: "What to build" 3 has the readme mode add the lines an existing `.depositignore` lacks; a case reads it.
- 6.3: "What to build" 2 and Decisions 7: the code README stands in the project's own code folder; a case reads `src/`.
- 6.5: "What to build" 7 drafts the code folder's two files only when the project has one.
- 6.7 and 5.4 (item 4): "What to build" 4 keeps Frame's completion criterion as it is.
- 8.2, 8.3 and Declined 1: the headings are written as ruled; the clash is Open item D in the state file, the user's.
- 8.4 to 8.9: no change; each holds.
- Declined 2: no change to the agent pages; "What is on the tree" says they name no heading.
- Added after the check, dictated: none beyond the lines above, which are requirements, not text.

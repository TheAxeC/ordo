# Brief check of step 4

## Names

1. The step leaves the academic-pipeline figure false, and the brief keeps that figure out of its paths and requires it unchanged. `grep -n '"RR"' docs/figures/academic-pipeline/gen_academic_pipeline.py` prints `138:    "RR": ("researcher research, entry 13", "todo"),`. The legend (line 60) reads "Dashed box: not built yet, with its roadmap entry", and `STAGES` has `Stage("1 Research: deep-research", "dr", "RR", False)`, which draws the dotted "goes to a skill not built yet" arrow. `sed -n 29p docs/roadmap.md` gives the figure's alt text: "1 Research goes to researcher research, entry 13 (not built yet)". Once `research` exists, the label, the box kind, the arrow, the SVG and that alt text are all false. Step 2 changed this same figure and line 29 for the same reason (booking of step 2). Fix: add `docs/figures/academic-pipeline/gen_academic_pipeline.py`, `docs/figures/academic-pipeline/academic-pipeline.svg` and `docs/roadmap.md` line 29 to "Paths this step writes", add a requirement to item 12, and change the last case (see Cases 1).
2. `docs/dev/building.md` line 41 and `docs/dev/scripts.md` line 9 list every figure `gen_figures.py` writes, by name, ending with `researcher.svg` (`grep -n 'researcher' docs/dev/building.md docs/dev/scripts.md`). Adding `researcher-research.svg` makes both lists false. Neither file is in "Paths this step writes". Change-standard rule 14 makes this a defect of the change.
3. `README.md` line 78 lists what each skill that launches agents starts: "`researcher` an integrity agent and a compliance agent at each integrity check". After the step, `research` also starts a builder and a reviewer for each piece of code, so the sentence is incomplete. The line lies inside the allowed range "lines 34-90", but no item asks for the change. Item 12 should say so.
4. Plan terms take on new senses and the brief does not say so. `docs/glossary.md` defines **brief** (line 16, "the file `agents/briefs/<step>.md` that `/spec` writes"), **case** (line 22, "an example under a brief's 'Cases'"), **finding** (line 49) and **verdict** (line 136) as plan terms. Items 3 to 5 and the brief's form use "brief", "the cases", "a finding goes back to a builder through a new brief" and "the reviewer's report" in the `research` sense. Item 11 names only builder and reviewer. `docs/dev/skill-layout.md`, "Writing for an agent", says a term in a new sense "adds or changes its entry in `skills/ordo/ordo-init/templates/plan-terms.md` first". Step 3 did exactly that for "round, of an interview" and changed `ordo-init`. "Paths this step writes" lists neither `skills/ordo/ordo-init/templates/plan-terms.md` nor `skills/ordo/ordo-init/SKILL.md`. Item 11 should cover brief, case and finding as well, and say which entries change in `plan-terms.md`, if any.
5. Copied pages: `grep -n -i 'stage 1\|deep-research\|research stage' -r skills/academic/researcher/{agents,references,examples,templates}` prints nothing, so no copied page says how a research stage runs. `references/mode_advisor.md` (Quick Decision Matrix, Decision Flowchart) routes only to `/paper` and `/researcher manuscript`, and line 59 says `researcher`, `manuscript` mode does not "Perform any substantive work". That is true for that mode and contradicts nothing. Steps 1 reads that page for "Any other call". The new routing bullets of item 1 must come before that bullet, or such a call is routed by a page that knows no `research`. The brief does not fix that order.
6. `skills/academic/paper/SKILL.md` line 70 and `skills/orchestration/plan-orchestration/SKILL.md` line 237 ("runs a code tool, a research project or a manuscript") are still true. No change needed.

## The step line

1. "several manuscripts" has no way to be carried out. Item 7 says a further paper goes in `manuscript-<name>/` and that "`manuscript` and `integrity` run per paper". The only command for writing a paper from a project, `/researcher manuscript <project folder>`, runs `/paper full '<project folder>'` (manuscript item 4). That always writes `<project folder>/manuscript/` (`grep -n 'manuscript/' skills/academic/paper/SKILL.md`, lines 87 and 170). No item says how Stage 2 of a further paper reaches `manuscript-<name>/`, or which command line starts it. Open item H leaves "a further paper" to be asked in words, and no item turns those words into a run.
2. "the record of the experiments" is partly missing. Item 8 has Consolidate write `experiment-record.yaml` in Schema 9's form. Schema 9 requires `negative_results: []` in each entry (`references/handoff_schemas.md` line 551, "KEY MUST be present"). The SKILL.md Rules make a claim that contradicts an entry of `negative_results[]` a FAIL. No item says that Consolidate fills `negative_results[]` from the dead ends of item 7, which is what ADR 0052 keeps that list for. The brief should also say that this list is a guard for the integrity check and is never manuscript content, so that it agrees with item 5's "nothing it sends to `manuscript` frames a negative or null result".
3. "the rules for SLURM" has a page name and nothing in it. Item 4 names `references/slurm.md` and says the skill "ships the rules for SLURM", but never lists the rules: submission with `sbatch` from `code/hpc/`, resource requests inside Frame's limits, output to `logs/`, arrays or dependencies, how the job ids are read. Every rule the page holds is left to the builder.
4. "the one command" is incomplete. Item 7 says the layout is "exactly as ruling D29 gives it", then drops two of D29's glosses: `paper.py` "(every figure and table from `results/`)" and `.depositignore` "(what stays out of a public deposit)". Item 6 says only that Build writes `run_all.sh`. No item says who writes `paper.py` or keeps it true.
5. "the diagnosis and the manual or automatic setting", "the brief and the reviewer of a builder", "Frame with the limits and the choice of the dataset", "the six stages ... and loops", "the campaigns", "the README as entry file and the default layout", "the adopt mode" and "`full`" each have an item (items 5, 4, 3, 2, 2, 7, 9 and 10).
6. The step's check lists "each sentence of the goal on `idea`". The brief's list of goal sentences (lines 29 to 36), case 115 and the report section "The list the plan's step line asks for" carry only the reopening sentence of `idea`. They leave out the goal's `idea` sentence ("`idea` takes a rough sketch to research questions and claims: it works in rounds ... and writes the questions and claims into the project's `README.md`"). The fresh agent's list then covers less than the step's check asks.
7. D13 is not fully carried (D13 read against item 10). D13 says "important to recognize when results are partial or not finished yet, or not complete, or inadequate". Item 10 applies that only at the end of `research`. At the plan of modes it leaves `research` out "when the results exist", and does not say that results that exist but are partial or inadequate count as not done, as D30 counts them. Nor does it say whether `full` on a project underway runs `research adopt` or `research`.
8. D29 and item 10 disagree on the README. Item 7 makes the README sections "exactly as ruling D29 gives it", but other items have the README record things those sections do not name: the plan of modes of `full` (item 10), the setting with its count (item 3), the job ids (item 4), and the briefs and reports named in `notes/` (item 4). The brief should name the D29 section that holds each one, for example "the stage and campaign that stand" or "next".
9. The other rulings read word by word (D7 to D12, D25 to D28, D30 and D31, against items 2 to 10) have no requirement left out. Nothing in the brief contradicts a ruling of `plan.md`.
10. The user's rule against writing up a negative result conflicts with item 10, bullet 3: "`full` does not go on to `manuscript` on it without the user's word". With the user's word, a result that did not beat the baseline goes to `manuscript`, which writes it up. The global rule forbids writing up, or suggesting writing up, a negative result. The stop's options must offer going on to `manuscript` only for a result that beats the baseline, even if it is below what was set as good enough. A result that does not beat the baseline goes back to Experiments with the next proposal. ADR 0054 gives "the user's word". The brief should say how both hold.

## Premises

1. Every premise reran and holds. `grep -n '^## \|^### '` prints 12, 24, 41, 63, 112, 158, 215, 226, 316, 363, 382. `wc -l` gives 408. The YAML parse prints `researcher 1019 {'version': '1.0.0'}`. The `research`/`full`/adopt grep hits only lines 46, 167 and 348. `ls references | wc -l` gives 22. `git grep -n -i 'slurm\|login node\|completion criterion' -- skills/` prints nothing, exit 1. README line 34 is the `researcher` row, line 88 the figure line, and lines 100 to 122 the paper figures. Rules lines 386 and 387 hold the two bullets as quoted. `integrity_check.md` line 7 starts the integrity agent "on the runner's general-purpose agent with the runner's defaults". The ADR 0053 and 0054 quotes are verbatim (substring test True). The seven goal sentences are verbatim in the plan's Goal (substring test True for each).
2. The premise "`skills/ordo/ordo-help/SKILL.md` ... needs no change" holds: lines 53 and 54 read the description, the Quick start and Use instead.

## Cases and checks

1. The last case gives the wrong expected result. It expects `docs/figures/academic-pipeline/gen_academic_pipeline.py` to exit 0 "and its figure unchanged", and `git status --short docs/figures` to list only `gen_figures.py` and `researcher-research.svg`. The tree the step should leave changes the academic-pipeline script and its SVG (Names 1). Verify item 2 ("lists only paths of 'Paths this step writes'") then fails for a correct build.
2. A requirement of `docs/dev/skill-layout.md`, "Writing for an agent", is left open: "Every repeat a skill asks for states its count". Item 4 sends a reviewer's finding back "to a builder through a new brief" and gives no count. The same holds for Compare sending an implementation cause to Build, and for Consolidate's "a difference sends the work back to the stage that made it". Only the automatic method loop has a count. The user's answers do not bound these repeats.
3. A rule of the skill would be broken by an unstated place. No item says where the builder's "small local test" and the reviewer's rerun run. On a cluster where the session sits on a login node, that test computes on the login node, against the second of the four rules. No case checks this. Case 106 covers only submitted jobs.
4. Change-standard rule 15 asks for a case and the brief has none. A project folder path, a dataset name or a campaign name the user gives reaches `sbatch`, `run_all.sh`, `mkdir` and the README. No case checks the single-quote rule of the SKILL.md Rules there, for example a folder named `the author's project`.
5. The description requirement may not be satisfiable. `python3` on the parsed description gives the "Triggers on:" part as 455 of 1019 characters. Adding the five phrases of item 1 and the three new mode names brings the trigger list to about 664 characters. That leaves about 360 for "what the six modes do and leave", and today's four modes take 564. Item 1 keeps every standing phrase and every mode's "what it leaves". The brief should say which standing phrases may merge, for example the mode-name phrases, or the builder will meet an impossible requirement. Case 1 checks only the count.
6. Case 101 (ten lines) is correct: 7 plus 3. The README range 34-90 is correct: the new figure line goes after line 88.

## The question

1. Case 115 and the report list could pass without the goal's `idea` sentence being checked (The step line 6), so they could pass with an `idea` goal sentence carried by no step.
2. Item 10 could pass with `full` taking a non-beating result to `manuscript`, and so without the "never writing up a negative result" sentence being reached on the `full` path (The step line 10). No case checks a non-beating result at the end of `research` under `full`. Case 114 checks a "partial" result only.
3. Item 7 and case 113 could pass with no way of writing a second paper (The step line 1). Case 113 expects only `manuscript-<name>/` and the README listing.
4. Item 8 and case 110 could pass with `negative_results[]` empty for a project that has dead ends (The step line 2). The integrity check then has nothing to hold a contradicting claim against.
5. For the rule "nothing computes on a cluster's login node", cases 106 and 110 can pass while a local test runs on a login node (Cases 3).
6. The other cases each need the text that carries their goal sentence, read through the Steps, and could not pass without it.

## Implied inputs

1. `gen_figures.py`: the stage loops of the new figure (each stage to itself or to an earlier one, a campaign looping within itself, Compare to Frame, Build, Experiments or `idea`) are cycles. Each must have the style `back` or `return`, or the script prints "edges that form a cycle not marked as a return" and exits 1. Expected: exit 0 with every loop drawn as a back arrow. No case names it, and the last case's exit 0 covers it only by implication.
2. `gen_figures.py`: where the new figure goes in `figures()`. The head comment says "Every figure but the last two shows the order of a run", and the last two are `paper/lifecycle.svg` and `paper/run-folder.svg`. Expected: the new entry goes before `*paper_figures()`, and the head comment's sentence still holds. Missing from Cases.
3. `gen_figures.py`: a label or a note of the new figure too long for its box or its line (an error and exit 1). The new figure has many stops and a note on adopt and `full`. Expected: exit 0. It is covered only by the last case's exit 0.
4. Skill inputs with no case: `/researcher research <a non-empty folder whose README records no stage of research>` (expected: unstated, whether Frame fresh, the adopt mode, or a stop that offers `research adopt`); `/researcher research adopt <a missing or empty folder>` (expected: unstated, a refusal or the layout); the adopt mode on a project whose own README has sections of its own (expected: unstated, where D29's sections go, since "usable README" is not defined); `/researcher full <project folder>` run again after its plan of modes is recorded (item 10 bullet 2, no case); Compare's implementation cause and method cause (case 105 covers only dataset and question).
5. Steps 2 to 5 for `research` and `full` (item 1 says only "made true for six modes"). If `research` runs Steps 4, the stop "The record of the experiments" fires at the start of a project that has no results yet. Expected: `research` skips Steps 2 to 5, and `full` runs them for its `manuscript` part only. Missing from Cases.
6. Consolidate's clean copy: where it is made, and whether it copies the raw inputs, which can exceed Frame's storage limit. Expected: unstated. Missing from item 8 and from Cases.

## ADRs

1. ADR 0052: "left out: ... the research stage, the finalizing stage and the process summary, which the goal does not name." The `research` mode is this repository's own (ADR 0053, Consequences) and changes no copied page, so there is no clash. The academic-pipeline figure, which shows that stage's target as not built, is touched (Names 1).
2. ADR 0053 Decision, checked bullet by bullet: bullets 1 to 10 each map to items 2 to 9, and none is contradicted. Bullet 5, "writes the job ids to the notes", is carried as the README, which D9 makes the notes file.
3. ADR 0054, second paragraph: item 10 carries it. The tension with the user's global rule is under The step line 10. The rejected alternative "The modes of `full` named by arguments" holds: `/researcher full <project folder> [<sketch file>]` takes no mode argument.
4. ADR 0017 (named in the brief): `lookup.py search` for the dataset lookup is in its scope. No clash.
5. ADRs 0006, 0011 and 0012 (the ledger, dispatch and commits of plan skills) bind plan skills only. Item 4's "no worktree, no landing, no ledger" agrees with ADR 0053. ADRs 0030 and 0035 bind `paper` and `writing` only. Item 4's "runner's general-purpose agent with the runner's defaults" matches `references/integrity_check.md` line 7. No unnamed ADR is contradicted.

## Dictated text

1. The Quick start lines hold: `grep -n 'research adopt <project folder>' .scratch/13-researcher/plan.md` finds them in Open item H, line 72, and its ruling, line 127.
2. `code/run_all.sh` and `code/paper.py` hold (D29, plan.md line 113). `experiment-record.yaml` holds (SKILL.md line 46).
3. The new page names `references/research_stages.md`, `references/research_brief.md`, `references/project_layout.md`, `references/slurm.md`, `agents/research_builder_agent.md` and `agents/research_reviewer_agent.md` hold. They follow the snake_case of `references/` and the `<role>_agent.md` form of `agents/` (`ls skills/academic/researcher/*`).
4. `docs/figures/researcher-research.svg` holds under every rule. Decision 4 cites `paper`'s figure per mode as its precedent, but `paper` keeps those figures in a folder, `docs/figures/paper/<mode>.svg`. The flat name departs from the precedent it cites. That is a choice of the brief, and no rule forbids it.
5. The quoted ruling text "trying out very different things" holds (plan.md line 90, D7).

## Declined to judge

- Whether 360 characters are enough for the six modes in the description (Cases 5): this depends on wording only a draft settles.
- Running the cases that call `gen_figures.py`: that script writes files, and this check changes nothing.

Usage: ad013e826d92d4998, claude-opus-5-5, 219310 tokens, 41 tool uses, 368 s

## Closed

Each finding is closed by a change to the brief `agents/briefs/4.md`.

- Names 1; Cases and checks 1: item 12 changes the academic-pipeline figure, its SVG and `docs/roadmap.md` line 29; the three paths added; the figure case expects them.
- Names 2: item 12 names `docs/dev/building.md` line 41 and `docs/dev/scripts.md` line 9; paths added.
- Names 3: item 12 has `README.md` line 78 name what `research` starts.
- Names 4: item 11 covers brief, case and finding as well, with the template first; `plan-terms.md` added to the paths; `ordo-init` stays 5.0.1.
- Names 5: item 1 puts the routing bullets before the one that reads `mode_advisor.md`.
- Names 6: no change needed.
- The step line 1: booked as Open item I, C151 under self-rule: `paper` takes `--manuscript <name>`; item 7, item 12 and a case added; `skills/academic/paper/SKILL.md` added to the paths.
- The step line 2: item 8 fills `negative_results[]` from the dead ends and says it is never manuscript content; a case added.
- The step line 3: item 4 lists what `references/slurm.md` holds.
- The step line 4: item 6 says `paper.py` builds every figure and table from `results/`; item 7 glosses `.depositignore`.
- The step line 5, 9: no change needed.
- The step line 6; The question 1: the goal's `idea` sentence is added to the list and to the case.
- The step line 7: item 10 counts partial or inadequate existing results as not done and says when `full` runs `research adopt` or `research`.
- The step line 8: items 3, 4, 7 and 10 name the README section that holds each record.
- The step line 10; The question 2: item 10 offers `manuscript` at that stop only for a result that beats the baseline, and sends one that does not back to Compare's proposal and Experiments; a case added. ADR 0054's "without the user's word" and the rule against writing up a negative result both hold.
- Premises 1, 2: no change needed.
- Cases and checks 2: item 4, item 5, item 8 and Decision 6 give each repeat its count, with a stop at the end of each.
- Cases and checks 3; The question 5: item 4 runs the local test as a short job on a cluster; Decision 7; a case added.
- Cases and checks 4: a case for a folder named `the author's project`.
- Cases and checks 5: item 1 lets the six `/researcher <mode>` phrases stand as one phrase and two phrases that say the same thing merge.
- Cases and checks 6: the Quick start case expects eleven lines with the line of Open item I.
- The question 3, 4: closed with The step line 1 and 2.
- Implied inputs 1, 2: item 12 says how the loops are drawn and where the entry stands in `figures()`.
- Implied inputs 3: covered by the figure case's exit 0.
- Implied inputs 4: item 7 adds the stop "A project underway"; item 9 adds the refusal "Nothing to adopt" and what a usable README is; item 10 and a case cover `full` run again; a case covers Compare's two other causes.
- Implied inputs 5: item 1 says `research` skips Steps 2 to 5 and `full` runs them for `manuscript` only.
- Implied inputs 6: item 8 says where the clean copy is made and that it copies no raw input.
- ADRs 1 to 5: no change needed beyond Names 1 and The step line 10.
- Dictated text 1 to 3, 5: hold. Dictated text 4: Decision 4 no longer cites `paper` as its precedent.
- The lines of the brief rewritten or added after the check were held line by line against the rules file and the standards pages: the command line `/researcher manuscript <project folder> --manuscript <name>`, `/paper full '<project folder>' --manuscript '<name>'`, the folder `manuscript-<name>/`, the stop names "A piece of code that does not pass its review", "A number that does not reproduce", "A project underway" and the refusal "Nothing to adopt", the README section names quoted from ruling D29, and the SLURM commands `sbatch`, `squeue`, `sacct`; each holds.

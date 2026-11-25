# Refuter report: step 8

## Verification

Every command was run from `/Users/axelfaes/workspace/ordo/.agents/worktrees/13-researcher-8`, with the Python commands under `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`.

1. Character-set check (the brief's perl command) over the ten paths of the diff and the report (README.md, docs/dev/building.md, docs/dev/scripts.md, docs/figures/gen_figures.py, docs/figures/researcher-revision.svg, docs/glossary.md, SKILL.md, references/project_layout.md, references/research_stages.md, 8-report.md). It printed nothing, and the line after it printed `exit 0`.
2. `python3 docs/figures/gen_figures.py` printed 27 `wrote` lines, among them `wrote docs/figures/researcher-revision.svg (51613 bytes)`, then `exit 0`. `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py` printed `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22164 bytes)`, then `exit 0`. Afterwards `git status --short` printed the same ten lines it printed before the scripts ran: ` M README.md`, ` M docs/dev/building.md`, ` M docs/dev/scripts.md`, ` M docs/figures/gen_figures.py`, ` M docs/glossary.md`, ` M skills/academic/researcher/SKILL.md`, ` M .../references/project_layout.md`, ` M .../references/research_stages.md`, `?? .scratch/13-researcher/agents/reviews/8-report.md`, `?? docs/figures/researcher-revision.svg`. Every one of these is a path of "Paths this step writes". The scripts rewrote the figure files in place, and since git status did not change, the output matches what is committed.
3. The description counts printed `1022 skills/academic/researcher/SKILL.md`.
4. `sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`.
5. The front-matter case printed `researcher 1022 {'version': '1.0.0'}`. The Quick start block has `12` lines, and line 24 is the line of D36. The negative/null grep printed lines 701 and 707, and both forbid writing such a result up. `grep -n 'researcher revision'` printed lines 10, 24, 89, 534, 648 and 649.
6. The builder's other evidence, re-run:
   - `git show 0658dc7:` of SKILL.md: `651` lines on the base. Lines 572 and 573 are "A skill not installed" and "lookup.py not found". Line 650 is the bullet on the user's words and line 651 the bullet on the user's language.
   - `project_layout.md` on the base: line 43 is list item 5, line 46 is item 8 (`## Papers`), line 50 is the "None yet." bullet.
   - `git diff --numstat 0658dc7` gives README 4/2, building 1/1, scripts 1/1, gen_figures 101/3, glossary 11/8, SKILL.md 108/35, project_layout 2/2, research_stages 1/1. `wc -l` gives SKILL.md 724, svg 230, README 270, glossary 190. `grep -n researcher-revision README.md` gives line 92.
   - The Stops table now has 60 rows, and its last thirteen rows are refusals, from "No manuscript" to "No paper to revise". This matches the intro's "thirteen".
   - Every one of these matches the report.

## Verdicts, items

1. Holds.
2. Violated: Spec 1 (Consolidate skipped when no job was "submitted"), Behaviour 1 (the README's stage after a revision), Behaviour 2 (`pipeline_state` during the campaigns).
3. Holds.
4. Holds.
5. Holds.
6. Holds.
7. Violated: Spec 3 (the figure leaves out stops the mode reaches).
8. Holds.
9. Holds. The handed-back sentence is checked below.
10. Holds.
11. Holds.

## Verdicts, cases

- Front matter: met (`researcher 1022 {'version': '1.0.0'}`).
- Quick start, twelve lines with D36's line: met.
- Three comments (ablation, new baseline, clearer sentence): met, by reading items 2, 3, 5, 6, 7, 8, 9 and 10.
- The ablation does not beat the baseline, setting manual: met (item 3 bullet 5, item 4 bullet 3, item 7 bullet 3, Rules line 701).
- The clearer-sentence comment moved to results work: met (item 2 bullet 6). See Spec 2 for what that campaign's brief lacks.
- A new session mid-revision: partial, Behaviour 2.
- `--manuscript second`: met ("What it reads" 3, Steps 3 `manuscript_folder`, Steps 2).
- A project folder `research` never ran on: met (the refusal "No project of research").
- A comments file that does not exist: met ("No comments file").
- A second round of comments after a finished run: partial, Behaviour 1.
- The negative/null grep: met.
- The six landed modes followed through the Steps: partial, Behaviour 1 (`research` on a project after a revision). Runs not preceded by a revision are unchanged by reading the diff.
- The goal's sentence and D36 to D42 each carried: met.
- The two figure scripts: met.
- A diagnosis that blames the dataset: met (item 4 bullet 1, and the Stops row shows the cause).
- A referee comment line opening with `#`: met (the new Rules bullet, item 2 bullet 7, item 7 bullet 1).
- "the referees asked for more experiments" with no mode word: met (Steps 1, line 97, before the fallback to `mode_advisor.md`).
- `sync_rules.py --only glossary`: met.

## The step line's check

These are my own list, made from reading SKILL.md whole.

- **Goal sentence on `revision`:**
  - "takes a paper of the project and its referee comments": Quick start line 24, and "What it reads" 3, its two new bullets.
  - "each comment that asks for new experiments, a new analysis, another dataset or another baseline is run as a campaign": "revision" item 2 (the split by `add_experiment`/`add_analysis`) and item 3 (one campaign each, Build first for a new dataset or baseline). Steps 1 routes such requests (line 97).
  - "then `paper`'s revision runs with the new results, the response letter, the integrity check and the re-review, as `manuscript` runs them": "revision" items 6, 8, 9 and 10.
  - "no result that does not beat the baseline is written up as a finding": item 3 bullet 6, item 4 bullet 5, item 7 bullets 2 to 5, and Rules line 701.
- **D36:** Quick start line 24, "What it reads" 1 and 3, and the Steps 1 bullet at line 89.
- **D37:** "revision" item 2, the Stops row "The split of the comments", and the Anti-patterns row on the session's own sorting.
- **D38:** the subsection head ("Frame is not run again"), item 3 (Experiments by "research" items 6 to 15, Build only for a new dataset or baseline, Compare under the setting) and item 5 (one Consolidate, the record written again). Spec 1 is a defect in item 5.
- **D39:** item 3 bullets 5 and 6, item 4, the Stops row "A comment the results do not answer yet", item 7, and Rules line 701.
- **D40:** item 7 (`revision-comments.md` with the result lines, and the files in its last section) and item 8 (`/paper revision` on it, with Existing Materials answered with the result files, `code/` and `experiment-record.yaml`).
- **D41:** items 6, 8, 9 and 10, each naming the "manuscript" item it runs and where it enters. Item 2 bullet 1 and item 6 bullet 1 keep the parse from running twice.
- **D42:** item 1 bullet 3, item 3 bullet 3, the Steps 5 caps for `revision`, and the Rules bullet "The revision loop of `revision` holds Stage 4 alone". The text carries it, but end to end the second run can be refused (Behaviour 1).

No "none". End to end, a user typing `/researcher revision <project folder> <comments file>` gets the run from the text, apart from the three places named under Behaviour 1, Behaviour 2 and Spec 1.

The handed-back claim holds. `revision_coach_agent.md`, Step 6, "Revision Roadmap Generation" (lines 155 to 193), has a Type column of Major, Minor, Editorial or Positive (`By type: [N] Major / [N] Minor / [N] Editorial / [N] Positive`). `commitment_type` appears only in the Step 3.5 output `commitment_extracted` (lines 90 to 120). So the sentence of ADR 0055, Decision bullet 2, "`/paper revision-coach` parses the comments into the Revision Roadmap. Its commitment types `add_experiment` and `add_analysis` mark the comments...", is false, and so are the same words in D37 ("parses the comments into the Revision Roadmap, whose commitment types"). Neither file was changed.

## Findings

### Spec

1. **Consolidate can be skipped for results that ran off a cluster.** Place: SKILL.md "revision" item 5, bullet 1: `+   - A run whose campaigns submitted no job skips this item.`
   - What is wrong: "research" item 10 submits a job only on a cluster. Off a cluster it says "run the job's command where the session runs". So a revision whose campaigns ran locally "submitted no job" and skips the reproduction run. The brief's item 2 asks for "one run of `### research` items 16 and 17" once every results comment is answered. ADR 0053, Decision, says "A number is called reproduced only after that run."
   - Failure scenario: a project with no cluster gets an ablation campaign, run locally. Item 5 is skipped, and the ablation's numbers reach `revision-comments.md` and `/paper revision` with no reproduction run and with `experiment-record.yaml` not written again. The Stage 4.5 integrity check then reads claims against a record that lacks the new experiment.
   - Fix: make the condition "a run with no results comment left to run" (every comment moved to text work), not "submitted no job".
2. **The referee comment never reaches the brief of its campaign.** Place: SKILL.md "revision" item 3 (`+3. Run each results comment as one campaign of the project's Experiments stage, by "research" items 6 to 15, one comment at a time.`), together with `references/research_brief.md`, "The research question and the conditions" (`> <the research question and the claim this piece serves, quoted from the README>`).
   - What is wrong: no item says the comment a campaign answers goes into the brief. The Rules bullet on the user's words names "a brief of `research`", and the new referee bullet names only `revision-comments.md` and the README.
   - Failure scenario: a referee asks for "an ablation removing the attention module on the held-out split". The builder and the reviewer get a brief that quotes only the project's research question. The reviewer, who reads the code against the brief, cannot find a piece that answers a different ablation than the one the referee asked for.
   - Fix: a bullet in item 3 that the brief quotes the results comment as quoted lines.
3. **The figure leaves out stops and cycles the mode reaches** (item 7). Place: `docs/figures/gen_figures.py`, `researcher_revision()`, the nodes and edges.
   - What is wrong: Consolidate is drawn with no stop "A number that does not reproduce" and none of its return edges, which "research" item 16 gives and `researcher_research()` draws (`Node("N", ...)`, and `Edge("CO", "BA"/"EX", ...)`). The stop "A result short of what was set, in `research`" (`MS`), which "research" item 15 raises under the manual setting and which "revision" item 3 keeps, is also missing. So is "The record of the experiments" (Steps 4, which `revision` runs), which `researcher()` draws. The Compare edge to Consolidate reads "a result beats the baseline", although Consolidate runs once, after every comment.
   - Failure scenario: a reader of the README's figure takes it that a revision's Consolidate cannot stop and that a result short of what was set goes straight on. The README's rule says the figure's labels follow the Stops table.
4. **deviations.md gets no entry for the copied lines this step changes.** Place: the ledger file `.scratch/13-researcher/deviations.md`, which is not among the step's paths. The standing demand reads: "a difference from academic-pipeline is made only where ADR 0052 or a ruling of `plan.md` says so, and each one is listed in `deviations.md`".
   - What is wrong: the diff changes lines of the copied modes: the Rules bullets on the orchestrator and state-tracker roles, the run-folder list, the revision-loop cap (now scoped "of `manuscript`"), the Anti-patterns row on skipping an integrity check, and the Stops rows "No comments file", "A skill not installed" and "lookup.py not found". Steps 2 and 4 each recorded such scope changes in deviations.md (lines 185 and 190). The brief does not name this.
   - Failure scenario: the gate's fresh agent reading the SKILL.md differences finds these changed lines with no listed ruling. This is for the orchestrator at landing, not a builder defect.
5. **A comment asking for another dataset gets no dataset choice.** Place: "revision" item 3 bullet 1: `+   - A results comment that needs a new dataset or a new baseline first has the pieces of code it needs built and read in Build, by "research" item 9 for those pieces only,`.
   - What is wrong: Frame's choice of a dataset ("research" item 5, the stop "The dataset", with size, licence and fit to the limits) is not run, and no item replaces it for a referee's "evaluate on another dataset".
   - Failure scenario: a referee asks for "results on another public benchmark" without naming one. The session goes straight to Build with no candidate shown and no licence or storage-limit check, so a dataset that breaks `## Constraints and limits` can be built.

### Proof

none. Every count and path the report quotes reproduces (Verification, point 6).

### Standards

1. **`state.json` gets fields outside the structure the Rules require.** Place: SKILL.md "revision" item 1 bullet 1 (`current_stage` values `split`, `campaigns`, `consolidate`), item 2 bullet 7 ("Write the split into `state.json`") and item 4 ("`state.json` marks it as answered in text alone"). These sit against the Rules bullet "In `integrity`, `manuscript` and `revision`, the session holds the role of `agents/state_tracker_agent.md`: it writes the run's state itself, in that page's structure".
   - What is wrong: that page's "Tracked State Structure" holds numeric stages, and it has no place for a split or for a comment answered in text. The text gives no field names, so two sessions write different keys.
   - Failure scenario: a resumed session looks for the split under a key the first session did not write, finds none, and raises "The split of the comments" again.

No history, no non-ASCII and nothing private was found: the perl check exited 0, and reading the new labels, the glossary entries and the README alt text turned up none. The glossary's new terms ("results comment", "text comment", "split, of the comments") are used in the senses their entries give.

### Behaviour

1. **After a revision, the README's stage is one neither `revision` nor `research` recognises.** Place: "revision" item 5 bullet 3: `+   - Name, in `## The stage and campaign that stand`, the end of the campaigns of the revision with its run folder, in place of the end of `research` that "research" item 17 names.` This sits against "What it reads" 3 (`a README.md whose ## The stage and campaign that stand names a stage of research`) and "research" item 1 (`A README.md whose ## The stage and campaign that stand names a stage of research is a project research started ... Any other folder is the stop "A project underway"`).
   - What is wrong: "the end of the campaigns of the revision" is not a stage of `research`.
   - Failure scenario: after a finished revision, the user gets a second round of comments and types `/researcher revision <project folder> <comments2>`, as D42 says. Read literally, this is the refusal "No project of research". `/researcher research <project folder>` on the same project now raises "A project underway" and offers `research adopt`. That is a change in how a landed mode runs on a project a revision touched.
   - Fix: keep a stage of `research` (the end of `research`) as the stage that stands, and record the revision's end beside it. Alternatively, have both tests name the revision's end.
2. **The revision run's `pipeline_state` is never set during the campaigns.** Place: "What it reads" 15 (`a run folder ... whose state.json holds a pipeline_state of running, awaiting_confirmation or paused`), Steps 3 (`pipeline_state: initializing`), and "revision" items 1 to 5, none of which writes `pipeline_state`. Only "manuscript" items 1 to 3 (transitions and checkpoints) set it, and item 6 runs those after the campaigns.
   - What is wrong: the resume path depends on a value that nothing writes before Stage 2.5.
   - Failure scenario: a campaign submits jobs and the run stops at "The jobs submitted" with `pipeline_state: initializing`. The next session's Steps 2 finds no unfinished run and makes a new run folder. It runs `/paper revision-coach` and the split again, and its new campaigns sit beside the old ones in the README.
   - What would settle it: whether the orchestrator page sets `running` when the user confirms "The run's configuration". The text does not say.

Host- and user-visible changes the report states, each with a before and after: the new command, the routing of the request without a mode word, the two new stops, the two new refusals, the description, the Use instead row, the new figure and the README row. The Stops row "A result that does not beat the baseline" also gained a clause for `revision` in its "What resumes it" cell. The report states that under its judgment calls, not in its table of changes.

## Declined to judge

- The builder's "the figure was rendered with `rsvg-convert` and read". I did not render the SVG. I read its text labels, extracted with grep.
- I used `git diff 0658dc7` with the display options `--stat`, `--numstat`, `--word-diff=plain` and `-U0`, which are forms of the permitted command. I ran no other git command besides `git status --short` and `git show 0658dc7:<path>`.
- The prose standard's sentence-length rule over each new bullet (Verify 6) was not judged bullet by bullet. The builder names the departure, most new bullets running past 20 words, and gives its reason.

Usage: a2ec2be82468551b2, claude-opus-5-5, 175561 tokens, 39 tool uses, 6m 48s

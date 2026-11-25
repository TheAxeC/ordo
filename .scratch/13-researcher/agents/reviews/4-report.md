Everything in the brief is done. Two sentences about SLURM's behaviour (`sbatch --wait` returns when the job ends; `squeue --jobs` and `sacct --jobs` take job ids) could not be run here, since no SLURM cluster is reachable from this machine: they are not verified (section "Wrong or impossible").

## Open items of the state file, verbatim

- none.

## The cases' first run (on the unchanged tree, before any change)

Script cases, run with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE`:

- Frontmatter: `python3 -c 'import yaml; d=yaml.safe_load(...)...'` printed `researcher 1019 {'version': '1.0.0'}`.
- Quick start block: awk over the block, `wc -l` printed `7` (no line of research, research adopt, full or --manuscript).
- `grep -n -i 'negative result\|null result' skills/academic/researcher/SKILL.md skills/academic/researcher/references/research_*.md skills/academic/researcher/agents/research_*.md` printed `grep: skills/academic/researcher/references/research_*.md: No such file or directory`, the same for `agents/research_*.md`, and `skills/academic/researcher/SKILL.md:393:- No correction and no record asks that a recorded null result be written into the manuscript.`, exit 2.
- `python3 docs/figures/gen_figures.py`: exit 0. `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py`: printed `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22636 bytes)`, exit 0. `git status --short docs/figures` printed nothing.
- `python3 skills/ordo/ordo-init/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`.

Reading cases on the unchanged tree. `grep -n -i '`research`\|`full`\|adopt\|### research\|### full' skills/academic/researcher/SKILL.md` printed only lines 46, 167 and 348 ("What it reads" 4, idea item 2, the Stops row "A reopening"); `grep -n -- '--manuscript' skills/academic/paper/SKILL.md` printed nothing (exit 1); `grep -rn 'slurm\|sbatch\|login node' skills/academic/researcher` printed nothing. So on the unchanged tree:

- `/researcher research <empty folder>`: no mode `research`; Steps 1 reads the call against `references/mode_advisor.md`, the stop "The entry point"; no layout, no Frame, no builder.
- Result not beating the baseline, manual and automatic (count 3): no Compare, no diagnosis, no setting.
- Compare blaming the dataset or the research question: no Compare; idea item 2 names the Compare stage only as a source of reopening evidence.
- A job submitted: no rule on jobs or the scheduler.
- A reviewer finding a test-data leak: no reviewer of code.
- A new session mid-Experiments: no resume from a README.
- `code/run_all.sh` with a raw input missing: no rule on the one command.
- Consolidate: none; "What it reads" 4 says the `research` mode writes the record at its last stage, and no step does.
- `research adopt` with Baseline called done and a partial result; adopt with no README: no adopt mode.
- A further paper: `/paper full` always writes `<project folder>/manuscript/`; no `manuscript-<name>/`.
- `/researcher full` for a review paper, with a partial result, with a result that does not beat the baseline, run again: no mode `full`.
- Each goal sentence, each bullet of ADR 0053's Decision, ADR 0054's second Decision paragraph and the four rules: each "none" for research, adopt and full; idea's sentences carried by "idea" items 1 to 11.
- `/researcher integrity <main.tex>`, `manuscript`, `novelty`, `idea`: run as Steps 1 to 6 and their subsections give them.
- A project folder named `the author's project`: the Rules bullet on values quotes every path; no `sbatch` or `run_all.sh` exists to reach.
- A small local test on a cluster; a third review still finding a leak; implementation and method causes: none.
- `research` on a non-empty folder with no README stage; `research adopt` on an empty folder: no such stop or refusal.
- Consolidate with two dead ends: none.
- `/researcher manuscript <project folder> --manuscript second`: the call has more arguments than any Quick start line; "What it reads" 1 has no rule for it.

No case of the brief was found wrong by its own rules before the change, so nothing was handed back. One rule of the brief clashes with another; it is under "Wrong or impossible" with how the text resolves it.

## DONE / NOT DONE

| Item | State | Command that proves it, and its output |
|---|---|---|
| 1 SKILL.md: frontmatter, title, Quick start, Use instead, What it reads, Steps, Stops, Anti-patterns, Rules | DONE | `python3 -c 'import yaml; ...'` printed `researcher 1022 {'version': '1.0.0'}`; Quick start `wc -l` printed `11`; `grep -n '^## \|^### ' SKILL.md` prints `### research` 229, `### research adopt` 336, `### full` 358 |
| 2 the stages, `references/research_stages.md` | DONE | read; one section per stage with "What it does", "What it leaves", "Its completion criterion", "Where it sends the work" |
| 3 Frame | DONE | "research" items 4 and 5; stops "Frame's questions" and "The dataset" |
| 4 builders and reviewers, `references/research_brief.md`, the two role pages, `references/slurm.md` | DONE | "research" items 6 to 12; files exist (`wc -l` below) |
| 5 Compare | DONE | "research" items 13 to 15 |
| 6 the four rules | DONE | Rules bullets, each naming the items that carry it |
| 7 README and layout, `references/project_layout.md` | DONE | "research" items 1 to 3, 14, 18; "manuscript" item 4 |
| 8 Consolidate | DONE | "research" items 16 and 17 |
| 9 adopt mode | DONE | "research adopt" items 1 to 4; refusal "Nothing to adopt" |
| 10 full | DONE | "full" items 1 to 6; stops "The modes of full", "A result short of what was set" |
| 11 glossary | DONE | 12 entries added under "Ordo's own terms"; `sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template` |
| 12 README, figures, building.md, scripts.md, roadmap.md, paper SKILL.md | DONE | `python3 docs/figures/gen_figures.py` exit 0, wrote `docs/figures/researcher-research.svg (30798 bytes)`; `python3 docs/figures/academic-pipeline/gen_academic_pipeline.py` printed `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22164 bytes)`, exit 0 |
| 13 Deviations | DONE | section below |
| Verify 1, character set over the 17 changed files | DONE | `git status --porcelain -z \| tr '\0' '\n' \| cut -c4- \| tr '\n' '\0' \| xargs -0 perl -CSD -ne '<the brief's check>'` printed nothing; `echo "ascii exit $?"` printed `ascii exit 0`; the file count printed `17` |
| Verify 2, figures and status | DONE | both scripts exit 0; `git status --short docs/figures` printed ` M docs/figures/academic-pipeline/academic-pipeline.svg`, ` M docs/figures/academic-pipeline/gen_academic_pipeline.py`, ` M docs/figures/gen_figures.py`, `?? docs/figures/researcher-research.svg`; `git status --short` lists only paths of "Paths this step writes" (list under "Files") |
| Verify 3, description counts | DONE | printed `994 skills/academic/paper/SKILL.md` and `1022 skills/academic/researcher/SKILL.md` |
| Verify 4, glossary sync | DONE | `ok: the plan-terms block equals the template` |
| Verify 5, the greps of Cases | DONE | negative/null grep printed `skills/academic/researcher/SKILL.md:591:- A result that does not beat the baseline is guidance for the next method, recorded as a dead end: no text of `research` or `full`, and nothing either sends to `manuscript`, frames it as a finding to publish, and no negative or null result is written up.` and `skills/academic/researcher/SKILL.md:597:- No correction and no record asks that a recorded null result be written into the manuscript.`, exit 0; each hit forbids writing one up |
| Verify 6, list items and sentence length | DONE | read; departures listed under "Sentence length and list items" |

The checks verify facts only: the character set, YAML parsing, a length, a byte comparison of a block, and that the figure scripts write. Whether the text carries each goal sentence is judged by reading, in the list below.

## The cases after the change (read on the changed tree)

- Frontmatter: `researcher 1022 {'version': '1.0.0'}`. Met.
- Quick start: 11 lines, with `/researcher research <project folder>`, `/researcher research adopt <project folder>`, `/researcher full <project folder> [<sketch file>]` and `/researcher manuscript <project folder> --manuscript <name>`, each with a comment. Met.
- `/researcher research <empty folder>`: "research" item 1 (new project), 3 (layout made), 4 and 5 (Frame's stops; dataset candidates with size, licence, how obtained, works that report on it, fit to the limits), 6 to 9 (Build with a brief, a builder and a reviewer), 11, 12, 13 to 15, 16 and 17; each stage's Done names the stage that stands in the README. Met.
- Manual, not beating the baseline: item 14 (cause among the four with evidence, proposal, dead end moved to `code/attic/`), item 15 (stop "A result that does not beat the baseline"), Rules bullet (no text frames it as a finding to publish). Met.
- Automatic, count 3: item 15, one method at a time with its diagnosis, until a result beats the baseline and reaches what was set or the count is reached, stop "The count of methods reached". Met.
- Dataset cause: item 15 reopens item 5, "The dataset". Research question cause: item 15 reopens `idea` with the diagnosis as the reopening evidence ("idea" item 2). Met.
- A job submitted: item 10 and `references/slurm.md` (script in `code/hpc/`, `sbatch` from that folder, ids in the README, stop "The jobs submitted", polling only when asked). Met.
- Reviewer finds a test-data leak: reviewer role page item 4 lists it; "research" item 8 submits no job and sends a new brief. Met.
- New session mid-Experiments: item 1 (README names a stage) then item 2 (resume at item 12 for Experiments). Met.
- `code/run_all.sh` with a raw input missing: Rules bullet on the one command; `references/project_layout.md` "The tree" (prints each missing prerequisite and exits 1 before any work); item 9 puts the case in its brief. Met.
- Consolidate: item 16 (clean copy, through the scheduler, each number, table and figure compared), item 17 (`experiment-record.yaml` in Schema 9's form). Met.
- Adopt, Baseline called done with a partial result: "research adopt" item 1 counts it not done and continues at Baseline. Met.
- Adopt with no README: "research adopt" item 2 (per stage with its file, one stop) and item 3 (README written, nothing moved). Met.
- A further paper: `references/project_layout.md` "Several papers", "manuscript" item 4 (`## Papers`), "research" item 18 (new project on request). Met.
- `full` for a review paper: "full" items 2, 3 (research left out with its reason, confirmed once), 6. With a partial result: item 5 names it, no `manuscript` without the user's word. Met.
- Goal sentences, ADR 0053, ADR 0054 paragraph two, four rules: list below, none without a step. Met.
- Negative/null grep: two hits, each forbids writing one up. Met.
- `integrity`, `manuscript`, `novelty`, `idea`: same runs; the changes to their text are listed under "Deviations" and none changes a run without `--manuscript`, except that "manuscript" item 4 adds the paper to a README's `## Papers` when the README has that section. Met.
- Figures: both exit 0, status lists the four paths. Met.
- `the author's project`: the Rules bullet on values now names `mkdir`, `sbatch` and `code/run_all.sh`; items 3 and 16 and `references/slurm.md` quote the path. Met.
- Small local test on a cluster: `references/slurm.md`, "A small local test", and both role pages: a short job with `sbatch --wait`. Met.
- Third review still finds a leak: item 8, stop "A piece of code that does not pass its review". Met.
- Implementation and method causes: item 15 sends to Build (at most twice) and to Experiments as a campaign. Met.
- Non-empty folder with no README stage: item 1, stop "A project underway" with the adopt line. Adopt on an empty folder: "What it reads" 1, refusal "Nothing to adopt". Met.
- Consolidate with two dead ends: item 17 fills `negative_results[]` from `## Dead ends`, never manuscript content. Met.
- `full` with a result not beating the baseline: item 5 offers Compare's next proposal and Experiments, never `manuscript`. Met.
- `full` run again: item 1 reads `## Next`. Met.
- `--manuscript second`: "manuscript" item 4 runs `/paper full '<project folder>' --manuscript 'second'`; `paper` "What it reads" 5 and Steps 5 put it in `<project folder>/manuscript-second/`; without the flag the folder is `manuscript/` as before. Met.
- Glossary sync: `ok`. Met.

## The terms

Entries added to `docs/glossary.md`, "Ordo's own terms", in alphabetical order, each formed as "round, of the interview of `idea`" and "verdict, of a novelty check": **brief, of `research`**, **builder, of `research`**, **campaign**, **case, of `research`**, **clean copy**, **cluster's facts**, **completion criterion, of a stage**, **dead end**, **finding, of `research`**, **reviewer, of `research`**, **setting, of `research`**, **stage, of `research`**. No entry of the plan-terms block changed: the only block entry that says what a bare word means outside the plan skills is **round, of an interview**, and the new text uses "round" only in "rounds of the interview" of `idea`, the sense its own entry gives.

Uses read against their entries:

- brief, builder, reviewer, case, finding: used in SKILL.md "research" items 6 to 9, 12, 14, 15, the two role pages, `references/research_brief.md`, the README row and the figure, each in the sense of its `research` entry; the plan-term senses are not used in the new text. "Use instead" row "built step by step in worktrees" uses step and worktree in their plan senses, for `/plan-orchestration`.
- worktree, landing, ledger: used only to say the mode has none ("research" item 7, Rules), in their plan senses.
- stop: every use is a row of the Stops table, or the verb for polling.
- verdict: only in the novelty sense (title paragraph, Quick start, description).
- research question: written in full each time; the bare "the question" (glossary **question, the**) is not used in the new text.
- loop, plan, part, kind, gate, goal, pause: not used in the new text (`grep -n -o -w -i` over the added lines printed none of them; "plan" only in `/plan-orchestration`).

## Files, with line counts

| File | Lines (`wc -l`, or `git diff --numstat` added/removed) |
|---|---|
| `skills/academic/researcher/SKILL.md` | 612 lines; +231 -27 |
| `skills/academic/researcher/references/research_stages.md` | 49, new |
| `skills/academic/researcher/references/research_brief.md` | 57, new |
| `skills/academic/researcher/references/project_layout.md` | 70, new |
| `skills/academic/researcher/references/slurm.md` | 30, new |
| `skills/academic/researcher/agents/research_builder_agent.md` | 45, new |
| `skills/academic/researcher/agents/research_reviewer_agent.md` | 48, new |
| `docs/glossary.md` | +12 -0 |
| `skills/academic/paper/SKILL.md` | +15 -15 |
| `README.md` | +4 -2 (lines 34, 78, 90 to 91) |
| `docs/figures/gen_figures.py` | +77 -3 |
| `docs/figures/researcher-research.svg` | 135, new |
| `docs/figures/academic-pipeline/gen_academic_pipeline.py` | +3 -7 |
| `docs/figures/academic-pipeline/academic-pipeline.svg` | +10 -12 |
| `docs/roadmap.md` | +1 -1 (line 29) |
| `docs/dev/building.md` | +1 -1 (line 41) |
| `docs/dev/scripts.md` | +1 -1 (line 9) |
| `.scratch/13-researcher/agents/reviews/4-report.md` | this report |

`skills/ordo/ordo-init/templates/plan-terms.md` is unchanged.

## Goal sentences, ADR 0053, ADR 0054 and the four rules, each with its step

Goal sentences:

- "The `research` mode ... six named stages ... each with a completion criterion, and a stage can send the work back to itself or to an earlier one; each piece of code is built by a fresh agent from a written brief and read by a fresh reviewer before any job is submitted": "research" intro, items 4 to 17; `references/research_stages.md` (each stage's criterion and "Where it sends the work"); items 6 to 8.
- "Frame sets the question, the baseline, the metric, the limits on storage and compute, and the dataset, chosen from candidates shown with their size, licence and fit to the limits": "research" items 4 and 5.
- "Experiments holds one campaign or several ... runs the experiments, SLURM jobs among them ... diagnoses why ... proposes a new method, a change of the method or another dataset, never writing up a negative result; it stops after each such result or goes on by itself for a number of methods you set": "research" items 10, 12, 14, 15; Rules bullet on a result that does not beat the baseline; `references/slurm.md`.
- "It states where a project's code, results, logs and drafts live, in a default layout whose entry file is the project's `README.md`, with dead ends kept runnable in `code/attic/`, and one project can hold several manuscripts": "research" items 3 and 14; `references/project_layout.md`; "manuscript" item 4.
- "An adopt mode reads a project already underway and continues from the first stage not done, counting partial or inadequate results as not done": "research adopt" items 1 to 4.
- "The `full` mode runs `idea`, then `research` and `manuscript`, shows the modes it will run and the ones it leaves out, as for a review paper or for results that exist, each with its reason, and goes on after you confirm": "full" items 2, 3, 4, 6.
- "The `research` mode holds a project to four rules": the four Rules bullets, below.
- The `idea` sentence: "idea" items 1 to 11 (landed); its reopening "from Compare with the finding that changed the question": "research" item 15 (research question cause) with "idea" item 2.

ADR 0053, Decision bullets:

1. Session directs, six stages with criteria, loops, campaigns: Rules bullet on the session; "research" items 4 to 17; `references/research_stages.md`.
2. Brief, fresh builder, fresh reviewer, jobs after it, no worktree, landing or ledger: "research" items 6 to 8; Rules bullet on the agents.
3. Frame and the dataset with size, licence, how obtained, works, fit: "research" items 4 and 5.
4. Compare's diagnosis, four causes, proposal, the setting, new method as a change of objective, optimisation or model structure, no negative result written up: "research" items 14 and 15; Rules bullet.
5. SLURM rules and no cluster's facts, job ids written and stop, polling on request: "research" item 10; `references/slurm.md`.
6. Consolidate's clean-copy run and comparison, reproduced only after it: "research" item 16.
7. README as entry file with its sections, long sections to `notes/`, read first by a new session: `references/project_layout.md`, "The README"; "research" items 2 and 3; Rules bullet on the notes.
8. Default layout, `reviews/` for real reviews only, a project underway keeps its names: `references/project_layout.md`, "The tree" and "A project underway"; "research adopt" item 3.
9. Several manuscripts, or a new project that copies the code: `references/project_layout.md`, "Several papers"; "manuscript" item 4; "research" item 18.
10. Adopt mode: "research adopt" items 1 to 3.

ADR 0054, second Decision paragraph: "full" items 2 (idea), 3 (modes shown with reasons, confirmed once), 4 and 6 (research and manuscript), 5 (a partial, unfinished or below-good-enough result named as such, no `manuscript` without the user's word). Its rejected alternative "modes named by arguments": the Quick start line of `full` takes no mode arguments.

The four rules:

- One documented command: Rules bullet; "research" items 9 and 16; `references/project_layout.md`, "The tree".
- No login node, every job through the scheduler: Rules bullet; "research" item 10; `references/slurm.md`; both role pages.
- An idea not shelved after a weak first attempt: Rules bullet; "research" items 14 and 15.
- Notes let a new session resume: Rules bullet; "research" items 2 and each stage's Done; `references/research_stages.md`, its second bullet.

None is without a step.

## Deviations

The new modes `research`, `research adopt` and `full`, and the six new pages, are this repository's own text and are no copy. No line of a copied page changed: `git diff --name-only -- skills/academic/researcher` prints only `skills/academic/researcher/SKILL.md`, and the six new pages are new files.

Changes to the landed text of `skills/academic/researcher/SKILL.md`:

- `description`: rewritten for six modes (text under "Visible changes").
- Title: "The novelty check, the idea interview, the integrity check and the manuscript pipeline" became "From a research idea to results and a manuscript".
- Title paragraph: a sentence on `research`, `research adopt` and `full` added; the last two sentences on `integrity` and `manuscript` joined into one.
- Quick start: reordered, `full` first; four lines added; comments of the seven landed lines unchanged.
- Use instead: one row added for `/plan-orchestration`.
- What it reads 1: refusals for `research`, `research adopt`, `full` and `--manuscript` added.
- What it reads 3, 5, 6, 7: extended to the new modes.
- What it reads 20 to 24: added.
- Steps intro sentence: made true for six modes.
- Steps 1: the mode list, the `--manuscript` entry, the subsections line and three routing bullets added before the `mode_advisor` bullet.
- Steps 6: the new subsections named.
- "manuscript" item 4: the `--manuscript` call, and the paper added to `## Papers` when the README has that section.
- Stops intro: "nine refusals" became "eleven refusals".
- Stops: twelve rows added before "A run that fails"; two refusals added at the end; the When cells of "No project folder", "A skill not installed" and "lookup.py not found" extended to the new modes, and the What it shows cell of "lookup.py not found" names Frame.
- Anti-patterns: twelve rows added before the last row.
- Rules: nine bullets added after "A run of `novelty` or `idea` starts no agent"; the bullet on values names `mkdir`, `sbatch` and `code/run_all.sh`; the bullet on the user's words names a brief of `research`.

## Judgment calls the brief left open

1. What counts as a new project in "research" item 1. A folder holding only what `idea` and `novelty` write (a README whose only `##` section is `## Research questions and claims`, and `notes/` with progress files, novelty pages and their `.bib`) is a new project. Without this, `/researcher idea` followed by `/researcher research`, and every `full` run, would hit "A project underway" (see "Wrong or impossible" 1).
2. A stop "A job that fails" (research item 10). Baseline and Experiments can send the work to Build on a fault in a log, and `docs/dev/skill-layout.md` "Writing for an agent" requires a count for every repeat, so a failed job stops for the user.
3. A campaign sends the work back to its own start at most 3 times, then its results go to Compare. This is the count the same rule asks for.
4. Polling: once every 10 minutes, at most 36 polls, then it says it stopped (`references/slurm.md`).
5. The `--manuscript <name>` value reaches a path, so it is checked as one folder name of letters, digits, `-` and `_`. In `researcher` the check is the refusal "No manuscript name", and in `paper` it falls under the existing refusal "An argument that does not exist", whose When cell names it. This follows change-standard rule 15.
6. Compare gives a diagnosis and a proposal to a result that does not reach what Frame set as good enough as well as to one that does not beat the baseline, since item 5 of the brief has Compare read both. Only a method that did not beat the baseline is a dead end.
7. The README's `##` headings: `Research questions and claims`, `Constraints and limits`, `Where things live`, `Cluster facts`, `The stage and campaign that stand`, `Results`, `Dead ends`, `Papers`, `Next`. Frame writes the dataset and its reason into `## Constraints and limits`, and the baseline and metric into `## Research questions and claims` in the form `idea` writes, when `idea` did not run.
8. File names: briefs and reports at `notes/code/<piece>-brief-<n>.md`, `-builder-<n>.md`, `-review-<n>.md`; diagnoses at `notes/diagnosis-<campaign>-<YYYY-MM-DD>.md`; the comparison at `notes/reproduction-<YYYY-MM-DD>.md`; a dead end at `code/attic/<campaign>-<method>/`.
9. `code/run_all.sh` takes one optional argument, the folder of the raw inputs, so that the clean copy reads them where they stand. The clean copy leaves out `data/`, `results/`, `figures/` and `attic/`.
10. A dead end is moved into `code/attic/` by a builder under a brief, since the session builds nothing itself.
11. The small local test on a cluster is submitted with `sbatch --wait`, so that the builder and the reviewer read its result without polling.
12. Description: within 1,024 characters, these standing phrases were merged, each pair saying the same thing: "a novelty check of an idea" into "is this idea new", "sharpen my research idea" into "from a sketch to a research question", "final integrity check" into "check the integrity of my manuscript", "academic pipeline" into "full paper workflow". The four `/researcher <mode>` phrases became `/researcher novelty|idea|research|full|integrity|manuscript`. The landed what-part lost "confirmed", "at full or pre-review depth", "then a compliance agent", "as runs of other skills" and "state and records".
13. Quick start order: `full` first, then `idea`, `novelty`, `research`, `research adopt`, the four `manuscript` lines and the two `integrity` lines.
14. Glossary: the new entries stand under "Ordo's own terms", the place of step 3's entries. No plan-terms entry changed, so `skills/ordo/ordo-init/templates/plan-terms.md` is unchanged and `ordo-init` stays 5.0.1.
15. Academic-pipeline figure: with no box of kind `todo` left, its legend row "Dashed box: not built yet, with its roadmap entry" was removed. The dotted-arrow row now reads "Dotted arrow: goes to none; a solid arrow goes to a built skill".
16. Research figure legend: it names only the marks the figure draws. The solid box, the orange box and the dotted arrow come from the shared legend. Three rows are its own: a dotted loop for a campaign again from its start, a grey box for jobs, and a rounded box for Compare.
17. `gen_figures.py` head comment: its sentence on grey and rounded boxes said only paper figures draw them, and now names `researcher-research.svg` too (change-standard rule 14).
18. `paper`'s Use instead row: "the stages from the writing to the final check" became "the stages from the research to the final check", and "whose research stage is not built yet (roadmap entry 13)" was removed, since that row became false.

## Visible changes, before and after

- `researcher` description, before (1019 characters): "Check a research idea's novelty, shape it into research questions, or check a manuscript. novelty writes a page of the closest confirmed prior work and a verdict per claim. ... Triggers on: /researcher novelty, /researcher idea, /researcher integrity, /researcher manuscript, a novelty check of an idea, ...". After (1022): "Take a research idea to results and a paper. novelty writes a page of the closest prior work, a verdict per claim. idea writes questions and claims to the README in rounds of the interview. research takes it through six stages with builder and reviewer agents and SLURM jobs to results, with a README to resume from; adopt continues a project underway. full runs idea, research, manuscript. integrity has agents check a draft's references, claims, numbers, figures and ethics. manuscript runs writing, review and revision; both keep a run folder. Triggers on: /researcher novelty|idea|research|full|integrity|manuscript, is this idea new, the closest prior work, from a sketch to a research question, take my idea to results, run the experiments of my project, continue my research project, adopt a project underway, from an idea to a paper, check the integrity of my manuscript, verify the references and claims of a finished draft, ethics check of a paper, full paper workflow, take my draft through review and revision."
- `researcher` Quick start: 7 lines before, 11 after (the four new lines above).
- `paper` Quick start: `/paper full <project folder>`, `/paper plan <project folder>`, `/paper outline-only <project folder>` became `... [--manuscript <name>]`, and the full line's comment ends "in manuscript/ or manuscript-<name>/".
- `paper` Use instead row on the full research-to-paper pipeline: before "`researcher`, whose research stage is not built yet (roadmap entry 13)", after "`researcher`".
- README row of `researcher`: before, four modes; after, six modes, with the three new command lines and the `--manuscript` line. README line 78 adds "in `research`, a builder and a reviewer for each piece of code". A new figure line follows the `manuscript` figure: `docs/figures/researcher-research.svg`, with its alt text written from its boxes.
- Academic-pipeline figure: before, "researcher research, entry 13" a dashed box with a dotted arrow; after, "researcher research" a teal box with a solid arrow. The legend lost its "not built yet" row. `docs/roadmap.md` line 29: "1 Research goes to researcher research, entry 13 (not built yet);" became "1 Research goes to researcher research;".
- `docs/dev/building.md` line 41 and `docs/dev/scripts.md` line 9 name `researcher-research.svg`.

## Sentence length and list items

Read against `docs/dev/skill-layout.md`, "Lists and tables", and the prose standard, E, "Sentence length". Every new list item holds one rule, with its qualifiers in the same bullet. Two Done items in "research" join two facts that must both hold, item 5 and item 9; each is the completion criterion of the item, as the layout asks.

The script below counts sentences over 40 words in the added lines and the new pages. Of 660 sentences, 52 are over 40 words. They fall into these groups, each needing its length:

- the README alt text (355 words) and README line 78 (143): an alt text written from the boxes, and a list of every skill's agents, both single sentences in the README's existing form;
- the description (91 and 74): one paragraph within 1,024 characters;
- the title paragraph's sentences (73 to 89): the brief caps it at one to three sentences for six modes;
- What it reads items and glossary entries: each one input or one term, with every qualifier the layout keeps in the same item;
- Steps bullets of 41 to 54 words, such as "research" item 1's first bullet and item 16's first bullet: each one rule whose condition or limit the layout says stays in the bullet.

The list, as printed:

- 143 words: grill starts lookup agents, writing three finding agents and a che...
- 355 words: ![The research mode of the researcher skill: Frame: the research quest...
- 57 words: - **brief, of research**: the file notes/code/<piece>-brief-<n>.md...
- 48 words: - **clean copy**: the copy of a project's code/ without data/, re...
- 44 words: - **cluster's facts**: the facts of the cluster a project of research...
- 48 words: - **completion criterion, of a stage**: what must hold in a project's ...
- 48 words: - **dead end**: a method of research that did not beat the baseline,...
- 42 words: - **finding, of research**: a fault the reviewer of research repor...
- 53 words: - **reviewer, of research**: the fresh agent that changes nothing, r...
- 43 words: - **stage, of research**: one of the six named stages of researcher...
- 50 words: For full, plan and outline-only, the optional --manuscript <name> na...
- 47 words:    - It writes main.tex of the manuscript's folder whole, with the D...
- 91 words: description: "Take a research idea to results and a paper. novelty wri...
- 74 words: Triggers on: /researcher novelty|idea|research|full|integrity|manuscri...
- 73 words: /researcher novelty leaves a page of the closest prior work on each ...
- 87 words: /researcher research takes the project through the stages Frame, Bui...
- 89 words: /researcher integrity checks a finished manuscript with a fresh inte...
- 59 words: For integrity and manuscript it holds the record of the experiment...
- 43 words: A folder found in neither place, or that holds no SKILL.md, is the r...
- 48 words: The paper skill's templates/lookup.py, in the folder of item 5, ru...
- 64 words: For research, research adopt and full, the project's README.md...
- 62 words: For research and research adopt, the pages the session reads: ref...
- 41 words: A run of novelty, idea, research or research adopt runs Steps ...
- 50 words:    - A call with no mode word that asks to continue a research project...
- 54 words:    - A folder that does not exist or is empty, or that holds only what...
- 43 words:    - Read the README whole, then the files its ## The stage and campa...
- 48 words:    - Done when the stage and the campaign that stand and the state of ...
- 48 words:    - Write the README's sections of references/project_layout.md, "T...
- 44 words:    - Ask what counts as good enough, the limits on storage, compute, t...
- 42 words:    - A piece goes back to a builder at most twice after its first revi...
- 41 words:     - A campaign can send the work back to its own start, with the rea...
- 42 words:     - A method that did not beat the baseline is a dead end: have it m...
- 49 words:     - Automatic: go on by itself with each proposal, one method at a t...
- 46 words:     - An implementation cause sends the work to Build with a brief for...
- 54 words:     - Make the clean copy with cp -R of code/ without data/, re...
- 43 words:     - A difference sends the work back to the stage that made the numb...
- 48 words: - The agents a run of research starts are a builder and a reviewer f...
- 48 words: - A result that does not beat the baseline is guidance for the next me...
- 49 words: - Every path and every value the user gives reaches a command as one a...
- 55 words: - The user's words reach a novelty page, a progress file, a brief of ...
- 45 words: - **What it does.** It sets the research questions and claims, the bas...
- 42 words: - **What it does.** It has each piece of code the baseline needs built...
- 46 words: - **Its completion criterion.** Each campaign that stands has its code...
- 46 words: - **What it does.** It reads each result against the baseline and agai...
- 61 words: - **Its completion criterion.** Each result of the campaigns that stan...
- 43 words: - **Where it sends the work.** By the diagnosis's cause: the dataset t...
- 48 words: - **What it does.** It runs code/run_all.sh once from the raw inputs...
- 42 words: ## The stage and campaign that stand: the stage that stands, the cam...
- 41 words: - A project that research did not start keeps its own names: nothing...
- 48 words: - When the user asks for it, a further paper is a new project instead:...
- 54 words: - The session polls only when the user asks for it in the run: then it...
- 51 words: - On a cluster, the small local test of a piece of code runs as a shor...

## Wrong or impossible

1. Brief item 7's last bullet conflicts with item 3 and with item 10. Item 7 says "`research` on a non-empty folder whose README records no stage of `research` is the stop 'A project underway'". Item 3 has Frame take the research questions "from the README's `## Research questions and claims` when `idea` wrote it", and item 10 has `full` run `idea` and then `research` on the same folder. After `idea`, the folder holds `README.md` and `notes/`, which is non-empty with no stage, so item 7 read as written would stop every `full` run and every `idea`-then-`research` run at "A project underway". The text resolves this as judgment call 1. This is a reading of the brief, and the orchestrator may rule it otherwise.
2. Not verified: three SLURM behaviours written in `references/slurm.md` and both role pages. They are that `sbatch --wait` returns when the job ends, that `sbatch` prints `Submitted batch job <id>`, and that `squeue --jobs <ids>` and `sacct --jobs <ids>` take a list of job ids. No SLURM command was run: `command -v sbatch` printed nothing and exited 1 on this machine, and no cluster is reachable from here. They are written from SLURM's documented options and are not verified.
3. Brief premise, checked: `skills/academic/paper/SKILL.md` names `<project folder>/manuscript/` in eight places (lines 87, 167, 170, 361, 371, 373, 385, 389 of `grep -n 'project folder\|manuscript/'`, the brief's count). Each now reads the manuscript's folder.

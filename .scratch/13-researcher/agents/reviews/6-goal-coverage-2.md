# Gate: the goal's sentences on five modes

Every clause of the goal on the five modes has a step that carries it, and so does each of the four rules. The list holds no "none" and no "partial".

Sources read:
- `.scratch/13-researcher/plan.md`: the `## Goal` (lines 5 to 7) and `## Rulings` (lines 104 to 163), including D7, D8, D25, D27 to D30, D37 to D41 and Open item L.
- `docs/adr/0056-*.md`.
- `skills/academic/researcher/SKILL.md`, read whole, all 747 lines.
- The six pages it names: `references/research_stages.md`, `references/research_brief.md`, `references/project_layout.md`, `references/slurm.md`, `agents/research_builder_agent.md` and `agents/research_reviewer_agent.md`.
- To check revision clause V2, I also ran `grep` on `skills/academic/paper/agents/revision_coach_agent.md` line 100 for its commitment types.

The four rules are written out in the goal's own sentence: "The `research` mode holds a project to four rules: ...".

## idea

| # | Clause of the goal | Carried by | Verdict |
|---|---|---|---|
| I1 | takes a rough sketch to research questions and claims | "idea" item 3, "The sketch is the `<sketch file>` of the call; with none, ask for it"; item 10, "each research question, formed from the problem and the claims settled, then each claim" | holds |
| I2 | works in rounds | "idea" items 7 to 9, "Ask the round of the interview, in one message" ... "Go back to item 4" | holds |
| I3 | each choice of the idea put with its options and a recommendation | "idea" item 7, "Each choice ... has its lettered options, the pros and the cons of each, one recommendation with its reason" | holds |
| I4 | runs `novelty` on each candidate claim between rounds | "idea" item 5, "Check the candidate claims of the next round of the interview: run `novelty` once over them"; item 7, "The message opens with the pages of item 5" | holds |
| I5 | writes the questions and claims into the project's `README.md` | "idea" item 11, "Write the section into the project's `README.md`"; project_layout.md "The README" 1 | holds |

## research

| # | Clause of the goal | Carried by | Verdict |
|---|---|---|---|
| R1 | the session directs the work through six named stages (Frame, Build, Baseline, Experiments, Compare, Consolidate) | "research" intro, "The session directs the work through the six stages of `references/research_stages.md` ... and builds nothing itself"; research_stages.md line 3, "six stages in this order: Frame, Build, Baseline, Experiments, Compare, Consolidate"; Rules, "the session directs the work and builds nothing itself" | holds |
| R2 | each with a completion criterion | research_stages.md, an "Its completion criterion" bullet in each of the six sections; "research" items 5, 9, 11, 12, 15 and 17, "Done when <stage>'s completion criterion holds" | holds |
| R3 | a stage can send the work back to itself or to an earlier one | research_stages.md line 5, "A stage that sends the work back to itself or to an earlier stage writes the reason", and each "Where it sends the work"; "research" item 12, "A campaign can send the work back to its own start"; item 15 (dataset to item 5, question to `idea`, implementation to Build, method to Experiments); item 16, "A difference sends the work back to the stage that made the number" | holds |
| R4 | each piece of code built by a fresh agent from a written brief | "research" item 6, "Write the brief of one piece of code, in the form of `references/research_brief.md`"; item 7, "Start the builder ... as a fresh agent through the Agent tool"; research_builder_agent.md | holds |
| R5 | read by a fresh reviewer before any job is submitted, with ruling L's exception for the builder's small local test on a cluster (ADR 0056) | "research" item 8, "Start the reviewer ... as a fresh agent" and "Submit no job of the baseline or of the experiments from the piece before its first reviewer's report ...; on a cluster the small local test is the one job of the piece submitted before the review, since nothing may compute on the login node and the test produces no result"; slurm.md "A small local test", "the builder's small local test is the one job of a piece submitted before its reviewer reads the code"; builder agent Role definition; reviewer agent Role definition; Anti-patterns row "A job submitted before the review, other than the builder's small local test" | holds |
| R6 | Frame sets the question, the baseline, the metric, the limits on storage and compute, and the dataset | "research" item 4, "Take the research questions and claims, each claim with its baseline and its metric" and "the limits on storage, compute, time and access"; item 5, the dataset; research_stages.md Frame "What it does" | holds |
| R7 | the dataset is chosen from candidates shown with their size, licence and fit to the limits | "research" item 5, "Show each candidate with its size, its licence, how it is obtained, the published works that report on it and whether it fits each limit"; "Write the user's choice and its reason" | holds |
| R8 | Experiments holds one campaign or several, each with its own method | "research" item 12, "run each campaign, each with its own method and its own section"; "A new campaign is added with a section of its own"; research_stages.md Experiments | holds |
| R9 | it runs the experiments, SLURM jobs among them | "research" item 12, "run its jobs by item 10"; item 10, "submitted with `sbatch` from that folder"; slurm.md | holds |
| R10 | when a result does not beat the baseline, it diagnoses why (the dataset, the method, the implementation or the question) | "research" item 14, "Name the cause as the dataset, the method, the implementation or the research question, with the evidence" | holds |
| R11 | and proposes a new method, a change of the method or another dataset | "research" item 14, "Write a proposal: a new method, which is a change of objective, of optimisation or of model structure; a change of the method; or another dataset" | holds |
| R12 | never writing up a negative result | Rules, "no negative or null result is written up: such a result is recorded as a dead end, guidance for the next method"; "research" item 14, "Record each such result as guidance for the next method"; item 17, `negative_results[]` "is never manuscript content"; Anti-patterns row "A result that does not beat the baseline written as a finding of a paper" | holds |
| R13 | it stops after each such result, or goes on by itself for a number of methods you set | "research" item 4, "Ask the setting, manual or automatic ... until a result beats the baseline or the count of methods the user gives is reached"; item 15, "Manual: a result that does not beat the baseline is the stop" and "Automatic: stop trying methods when ... the count of methods is reached" | holds |
| R14 | it states where a project's code, results, logs and drafts live, in a default layout whose entry file is the project's `README.md` | "research" item 3, "Make the layout of a new project, as `references/project_layout.md`, 'The tree', gives it"; project_layout.md tree: `README.md` "the entry file: a new session reads it first", `code/`, `results/`, `logs/`, `manuscript/`; README section 3 `## Where things live` | holds |
| R15 | with dead ends kept runnable in `code/attic/` | "research" item 14, "have it moved into `code/attic/` by items 6 to 8, indexed in `code/attic/README.md`"; project_layout.md "The dead ends", "so that it still runs from there" | holds |
| R16 | one project can hold several manuscripts | project_layout.md "Several papers", "a further paper in `manuscript-<name>/` beside it"; "research" item 18, "`/researcher manuscript <project folder> --manuscript <name>` for a further one"; Quick start line with `--manuscript <name>` | holds |

## research adopt

| # | Clause of the goal | Carried by | Verdict |
|---|---|---|---|
| A1 | reads a project already underway | "research adopt" intro, "reads a project underway that `research` did not start, moves nothing"; items 1 and 2 | holds |
| A2 | continues from the first stage not done | "research adopt" items 1 and 2, "The first stage whose completion criterion fails is where the run continues"; item 4, "Go on as `research` from that stage" | holds |
| A3 | counting partial or inadequate results as not done | "research adopt" item 1, "A result that is partial, unfinished or below what Frame set as good enough counts as not done"; item 2, the same; research_stages.md lines 7 and 8 | holds |

## full

| # | Clause of the goal | Carried by | Verdict |
|---|---|---|---|
| F1 | runs `idea`, then `research` and `manuscript` | "full" intro, "`full` runs `idea`, then `research` and `manuscript`"; items 2, 4 and 6 | holds |
| F2 | shows the modes it will run and the ones it leaves out, as for a review paper or for results that exist, each with its reason | "full" item 3, "Show the modes it will run and the ones it leaves out, each with its reason" and "Leave `research` out for a review paper, and when results exist that the adopt mode's reading ... counts as done" | holds |
| F3 | goes on after you confirm | "full" item 3, "Done when the user has confirmed, once"; Stops row "The modes of full" | holds |

## revision

| # | Clause of the goal | Carried by | Verdict |
|---|---|---|---|
| V1 | takes a paper of the project and its referee comments | Quick start, `/researcher revision <project folder> <comments file> [--manuscript <name>]`; "What it reads" 1 and 3; Steps 1 | holds |
| V2 | each comment that asks for new experiments, a new analysis, another dataset or another baseline is run as a campaign of the project's `research` stages | "revision" item 2, "A comment with a commitment of type `add_experiment` or `add_analysis` is a results comment", which the user can move at "The split of the comments"; item 3, "Run each results comment as one campaign ... by 'research' items 6 to 15", with "A results comment that needs a dataset the project does not hold" and "a new dataset or a new baseline" handled there. The coach's types, read with `grep` on `revision_coach_agent.md` line 100, are `add_experiment / add_analysis / add_clarification / add_citation / restructure / other`. | holds |
| V3 | then `paper`'s revision runs with the new results | "revision" item 7, `revision-comments.md` "add the lines of the README's `## Results` of each result that answers it"; item 8, "invoke `/paper revision '<main.tex>' '<run folder>/revision-comments.md'`" | holds |
| V4 | the response letter | "revision" item 8, the run of `/paper revision`, whose Quick start line in `paper` SKILL.md is "and write the response letter"; item 9 reads "the response letter the revision wrote" through "manuscript" item 9; the intro paragraph of `SKILL.md`, "the revised paper with its response letter" | holds |
| V5 | the integrity check | "revision" item 6, "then 'manuscript' item 5" (Stage 2.5); item 10, "run 'manuscript' item 12" (Stage 4.5) | holds |
| V6 | and the re-review, as `manuscript` runs them | "revision" item 9, "Stage 3', the completeness check: run 'manuscript' item 9"; this is the re-review that `manuscript` runs for comments in hand, as ruling D41 gives it | holds |
| V7 | no result that does not beat the baseline is written up as a finding | "revision" item 3, "A results comment is answered when a result of its campaigns beats the baseline"; item 4, "names no result that does not beat the baseline"; item 7, "each result that answers it and beats the baseline" and the `negative_results[]` "as dead ends that no sentence of the manuscript or the response letter presents"; Rules, "nothing any of them sends to `manuscript` or to `/paper revision`, `revision-comments.md` and the response letter included, frames a result that does not beat the baseline as a finding" | holds |

## The four rules

| # | Rule | Carried by | Verdict |
|---|---|---|---|
| Rule 1a | one documented command rebuilds every reported number, table and figure from the raw inputs | Rules, "One documented command, `code/run_all.sh`, rebuilds every reported number, table and figure from the raw inputs"; "research" item 9, "A later piece that adds a result ... brings `code/run_all.sh` and `code/paper.py` in line with it"; item 16, which runs it once in a clean copy and compares; project_layout.md tree and bullets | holds |
| Rule 1b | and names each missing prerequisite at its start | Rules, "`code/run_all.sh` names each missing prerequisite at its start, before it does any work"; "research" item 9, "The brief of `code/run_all.sh` holds the case of a raw input missing"; project_layout.md line 31; reviewer agent item 4, last bullet; research_stages.md Build criterion | holds |
| Rule 2a | nothing computes on a cluster's login node | Rules, "Nothing computes on a cluster's login node"; "research" item 10, "On a cluster, compute nothing on the login node"; slurm.md "The login node", "a small local test of a piece of code included"; builder and reviewer agent Rules | holds |
| Rule 2b | and every job goes through the scheduler | Rules, "Every job on a cluster goes through the scheduler"; "research" item 10; item 16, "through the scheduler on a cluster"; slurm.md "Job scripts" and "A small local test"; research_brief.md "The rules it is under" | holds |
| Rule 3 | an idea is not shelved after a weak first attempt | Rules, "An idea is not shelved after a weak first attempt: each result that does not beat the baseline gets its diagnosis and the next proposal"; "research" item 15, "never propose to drop the idea after one method"; Anti-patterns row "Dropping the idea after one weak method" | holds |
| Rule 4 | the project's notes let a new session resume without the conversation | Rules, "each stage of `research` writes the README before it ends" and "A new session of `research` reads the README first"; "research" intro; item 2, "Resume a project `research` started from its README alone"; item 3, "so that a new session resumes at Frame"; research_stages.md line 6; "revision" item 3, "so that a new session resumes the revision from the README" | holds |

## None or partial

none

## Declined to judge

- Whether the wording or the quality of any step is good. This gate asks only which step carries each sentence.
- The goal's sentences on `novelty`, `integrity`, `manuscript`, `NOTICE.md`, the copy of academic-pipeline and `ordo-help`, which are outside the five modes.
- Whether `paper`'s revision coach will type a comment asking for another dataset or another baseline as `add_experiment`. The split takes the coach's types, and the user can move a comment at the stop "The split of the comments" (ruling D37). How the coach behaves when it runs is not something a reading can settle.
- Whether the reviewer's rerun of the small local test is a second job before review. It is submitted after the reviewer has read the code ("How you work" items 1 to 3) and ruling D25 asks for it, so I did not count it against R5.

Run by agent a2836d6b246320bf7 (claude-opus-5-5), on main at 43cbae8.

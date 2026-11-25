# Gate: the goal's sentences on five modes

I read the `## Goal` of `/Users/axelfaes/workspace/ordo/.scratch/13-researcher/plan.md` (lines 5 to 7). The four rules are stated in the goal itself, in the sentence "The `research` mode of `researcher` holds a project to four rules: ...", so the Rulings were not needed to find them. I then read `/Users/axelfaes/workspace/ordo/skills/academic/researcher/SKILL.md` whole (747 lines) and the six pages the brief names, under `/Users/axelfaes/workspace/ordo/skills/academic/researcher/`: `references/research_stages.md`, `references/research_brief.md`, `references/project_layout.md`, `references/slurm.md`, `agents/research_builder_agent.md` and `agents/research_reviewer_agent.md`. For one clause (V2) I also checked the commitment types in `skills/academic/paper/agents/revision_coach_agent.md` line 100 with grep.

Item references below are to subsections of SKILL.md: "idea" item n, "research" item n, "research adopt" item n, "full" item n and "revision" item n. Rules lines are line numbers of SKILL.md.

## idea

| # | Clause of the goal | Carried by | Words that carry it |
|---|---|---|---|
| I1 | takes a rough sketch to research questions and claims | "idea" items 3, 10 | item 3: "Take the sketch and write the progress file"; item 10: "each research question, formed from the problem and the claims settled, then each claim" |
| I2 | it works in rounds | "idea" items 7 to 9 | item 7: "Ask the round of the interview, in one message"; item 9: "Go back to item 4" |
| I3 | each choice of the idea put with its options and a recommendation | "idea" item 7 | "Each choice of the round of the interview has its lettered options, the pros and the cons of each, one recommendation with its reason" |
| I4 | runs `novelty` on each candidate claim between rounds | "idea" item 5 | "Check the candidate claims of the next round of the interview: run `novelty` once over them" |
| I5 | writes the questions and claims into the project's `README.md` | "idea" item 11 | "Write the section into the project's `README.md`" |

## research

| # | Clause of the goal | Carried by | Words that carry it |
|---|---|---|---|
| R1 | takes an idea to results; the session directs the work through six named stages (Frame, Build, Baseline, Experiments, Compare, Consolidate) | "research" lead paragraph; `references/research_stages.md` opening | "The session directs the work through the six stages of `references/research_stages.md`"; "Frame, Build, Baseline, Experiments, Compare, Consolidate" |
| R2 | each stage with a completion criterion | `research_stages.md`, each stage's "Its completion criterion"; "research" items 5, 9, 11, 12, 15, 17 | "Done when Frame's completion criterion holds" (and the same for each stage) |
| R3 | a stage can send the work back to itself or to an earlier one | `research_stages.md`, each "Where it sends the work" and the first bullet; "research" items 12, 15, 16 | "A stage that sends the work back to itself or to an earlier stage writes the reason"; item 12: "A campaign can send the work back to its own start"; item 16: "A difference sends the work back to the stage that made the number" |
| R4 | each piece of code built by a fresh agent from a written brief | "research" items 6, 7; Rules line 713 | item 6: "Write the brief of one piece of code"; item 7: "Start the builder ... as a fresh agent through the Agent tool" |
| R5 | read by a fresh reviewer before any job is submitted | "research" item 8; Rules line 713 | "Start the reviewer ... as a fresh agent"; "Submit no job of the piece while its newest reviewer's report holds a finding that makes a result false" -- PARTIAL, see below |
| R6 | Frame sets the question, the baseline, the metric, the limits on storage and compute, and the dataset | "research" items 4, 5; `research_stages.md` "Frame" | item 4: "each claim with its baseline and its metric"; "the limits on storage, compute, time and access"; item 5: "Frame: the dataset" |
| R7 | the dataset chosen from candidates shown with their size, licence and fit to the limits | "research" item 5 | "Show each candidate with its size, its licence, how it is obtained, ... and whether it fits each limit of `## Constraints and limits`" |
| R8 | Experiments holds one campaign or several, each with its own method | "research" item 12; `research_stages.md` "Experiments" | "run each campaign, each with its own method and its own section" |
| R9 | it runs the experiments, SLURM jobs among them | "research" items 10, 12; `references/slurm.md` | item 12: "run its jobs by item 10"; item 10: "submitted with `sbatch` from that folder" |
| R10 | when a result does not beat the baseline it diagnoses why (the dataset, the method, the implementation or the question) | "research" item 14 | "Name the cause as the dataset, the method, the implementation or the research question, with the evidence" |
| R11 | proposes a new method, a change of the method or another dataset | "research" item 14 | "Write a proposal: a new method, which is a change of objective, of optimisation or of model structure; a change of the method; or another dataset" |
| R12 | never writing up a negative result | Rules line 724; "research" items 14, 17 | "no negative or null result is written up: such a result is recorded as a dead end"; item 17: "`negative_results[]` ... which is never manuscript content" |
| R13 | stops after each such result, or goes on by itself for a number of methods you set | "research" items 4, 15 | item 4: "Ask the setting, manual or automatic"; item 15: "Manual: a result that does not beat the baseline is the stop ..."; "Automatic: stop trying methods when a result beats the baseline ... or when the count of methods is reached" |
| R14 | states where code, results, logs and drafts live, in a default layout whose entry file is `README.md` | "research" item 3; `references/project_layout.md` "The tree" | "README.md  the entry file: a new session reads it first"; `code/`, `results/`, `logs/`, `manuscript/  the first paper` |
| R15 | dead ends kept runnable in `code/attic/` | "research" item 14; `project_layout.md` "The dead ends" | "have it moved into `code/attic/` by items 6 to 8"; "so that it still runs from there" |
| R16 | one project can hold several manuscripts | `project_layout.md` "Several papers"; "research" item 18; Quick start line 21 | "a further paper in `manuscript-<name>/` beside it"; "`/researcher manuscript <project folder> --manuscript <name>` for a further one" |

## research adopt

| # | Clause of the goal | Carried by | Words that carry it |
|---|---|---|---|
| A1 | reads a project already underway | "research adopt" lead paragraph, items 1, 2 | "reads a project underway that `research` did not start, moves nothing" |
| A2 | continues from the first stage not done | "research adopt" items 1, 2, 4 | "The first stage whose completion criterion fails is where the run continues"; item 4: "Go on as `research` from that stage" |
| A3 | counting partial or inadequate results as not done | "research adopt" items 1, 2; `research_stages.md` fourth opening bullet | "A result that is partial, unfinished or below what Frame set as good enough counts as not done" |

## full

| # | Clause of the goal | Carried by | Words that carry it |
|---|---|---|---|
| F1 | runs `idea`, then `research` and `manuscript` | "full" lead paragraph, items 2, 4, 6 | "`full` runs `idea`, then `research` and `manuscript`, each as its subsection gives it" |
| F2 | shows the modes it will run and the ones it leaves out, as for a review paper or for results that exist, each with its reason | "full" item 3 | "Show the modes it will run and the ones it leaves out, each with its reason"; "Leave `research` out for a review paper, and when results exist that the adopt mode's reading ... counts as done" |
| F3 | goes on after you confirm | "full" item 3; Stops row "The modes of full" | "Done when the user has confirmed, once, and `## Next` holds the modes" |

## revision

| # | Clause of the goal | Carried by | Words that carry it |
|---|---|---|---|
| V1 | takes a paper of the project and its referee comments | Quick start line 24; "What it reads" 3; "revision" lead paragraph | "`revision` answers one comments file of referee comments on the paper of the manuscript's folder" |
| V2 | each comment that asks for new experiments, a new analysis, another dataset or another baseline is run as a campaign of the project's `research` stages | "revision" items 2, 3 | item 2: "A comment with a commitment of type `add_experiment` or `add_analysis` is a results comment"; "A comment the user moves to the other side counts as a comment of that side"; item 3: "Run each results comment as one campaign of the project's Experiments stage, by 'research' items 6 to 15"; "A results comment that needs a new dataset or a new baseline then has the pieces of code it needs built and read in Build" |
| V3 | then `paper`'s revision runs with the new results | "revision" items 7, 8 | item 7: "add the lines of the README's `## Results` of each result that answers it"; item 8: "invoke `/paper revision '<main.tex>' '<run folder>/revision-comments.md'`" |
| V4 | the response letter | lead paragraph of SKILL.md (line 10); "revision" item 9 through "manuscript" item 9 | "the revised paper with its response letter"; "from `external-comments.md` and the response letter the revision wrote" |
| V5 | the integrity check | "revision" items 6, 10 | item 6: "Stage 2.5 and the coaching: ... 'manuscript' item 5"; item 10: "Stage 4.5 ... run 'manuscript' item 12" |
| V6 | the re-review, as `manuscript` runs them | "revision" item 9; "manuscript" item 9 | "Stage 3', the completeness check: run 'manuscript' item 9, with `revision-comments.md` in place of `external-comments.md`". `manuscript` with review comments in hand runs Stage 3' as this completeness check and does not invoke `/paper-review-panel re-review`, so `revision` matches the way `manuscript` runs Stage 3' for comments in hand |
| V7 | no result that does not beat the baseline is written up as a finding | "revision" items 4, 7; Rules line 724 | item 4: "names no result that does not beat the baseline"; item 7: "name the `negative_results[]` ... as dead ends that no sentence of the manuscript or the response letter presents"; Rules: "`revision-comments.md` and the response letter included, frames a result that does not beat the baseline as a finding" |

## The four rules

| # | Rule | Carried by | Words that carry it |
|---|---|---|---|
| Q1a | one documented command rebuilds every reported number, table and figure from the raw inputs | Rules line 716; "research" items 9, 16; `project_layout.md` "The tree" | "One documented command, `code/run_all.sh`, rebuilds every reported number, table and figure from the raw inputs"; item 16 runs it in a clean copy and compares |
| Q1b | and names each missing prerequisite at its start | Rules line 717; "research" item 9; `project_layout.md` "The tree"; `research_stages.md` Build criterion | "`code/run_all.sh` names each missing prerequisite at its start, before it does any work"; "The brief of `code/run_all.sh` holds the case of a raw input missing" |
| Q2a | nothing computes on a cluster's login node | Rules line 718; "research" item 10; `slurm.md` "The login node"; builder and reviewer Rules | "On a cluster, compute nothing on the login node"; "Every computation, a small local test of a piece of code included, runs as a job through the scheduler" |
| Q2b | every job goes through the scheduler | Rules line 719; "research" items 10, 16; `slurm.md` | "Every job on a cluster goes through the scheduler"; item 16: "through the scheduler on a cluster as item 10 gives a job" |
| Q3 | an idea is not shelved after a weak first attempt | Rules line 720; "research" items 14, 15 | "each result that does not beat the baseline gets its diagnosis and the next proposal"; item 15: "never propose to drop the idea after one method" |
| Q4 | the project's notes let a new session resume without the conversation | Rules lines 721, 722; "research" items 2, 3 to 17; `research_stages.md` second opening bullet | "each stage of `research` writes the README before it ends"; item 2: "Resume a project `research` started from its README alone" |

## None or partial

No item is "none". One item is partial:

- R5 (read by a fresh reviewer before any job is submitted): partial. "research" item 8 holds every job of the piece until a reviewer's report has no finding that makes a result false. On a cluster, though, the builder submits the piece's small local test as a SLURM job before any reviewer has read the code: `agents/research_builder_agent.md` "How you work" 4 says "on a cluster as the short job `code/hpc/test-<piece>.sh` ... Submit it with `sbatch --wait`", and `references/slurm.md` "A small local test" says the same. The builder page limits its own rule to "you never submit a job of the project's experiments". So the skill holds the experiment and baseline jobs until after review, but it does not hold every job, the test job of each piece being submitted first. Whether this counts as met depends on whether the goal's "any job" covers the small test job; read literally, it does.

## Declined to judge

- Whether any of the modes works when run. This reading covers only whether the text carries each clause.
- Whether `paper`'s revision coach gives `add_experiment` to comments that ask for another dataset or another baseline, which V2 relies on. Its commitment-type list (`revision_coach_agent.md` line 100) and its example "run ablation on the CIFAR-100 dataset" typed `add_experiment` point that way, and the user can move a comment at the stop "The split of the comments". I did not judge the coach's behaviour beyond those lines.
- The modes `novelty`, `integrity` and `manuscript`, the `NOTICE.md` sentence, the sentence on the integrity check's corrections and the `ordo-help` sentence of the goal. None of them is among the five modes or the four rules.
- Anything in SKILL.md or its pages beyond the clauses listed above.

Run by agent a54e50fae89be3bcd (claude-opus-5-5).

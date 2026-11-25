# The stages of research

The `research` mode of `researcher` goes through six stages in this order: Frame, Build, Baseline, Experiments, Compare, Consolidate. Each section below gives what the stage does, what it leaves in the project, its completion criterion and where it can send the work. The session checks a stage's completion criterion against the project's files before the next stage starts, and the adopt mode checks each stage the README calls done against it ("research adopt" item 1 of `SKILL.md`). "What it reads" with a number, Rules and a stop named in quotes are those of `SKILL.md`, and "item" with a number is an item of its subsection "research".

- A stage that sends the work back to itself or to an earlier stage writes the reason into the README's `## The stage and campaign that stand`, with the stage it sends the work to.
- Every stage writes the README before it ends, with the stage that stands named, so that a new session resumes from the README alone.
- A result that is partial or unfinished does not meet a completion criterion that asks for a result.
- A result below what Frame set as good enough meets Compare's completion criterion only as that criterion gives it, and the adopt mode, which reads a project `research` did not start and so holds no such choice of the user, counts it as not done ("research adopt" item 1).

## Frame

- **What it does.** It sets the research questions and claims, the baseline, the metric, what counts as good enough, the limits on storage, compute, time and access, the cluster's facts, the setting with its count of methods, and the dataset (items 4 and 5).
- **What it leaves.** `## Research questions and claims` with each claim's baseline and metric, `## Constraints and limits`, `## Cluster facts` and `## Where things live` in the README.
- **Its completion criterion.** The README holds at least one research question and one claim, each claim with its baseline and its metric. `## Constraints and limits` holds what counts as good enough, a value or `none` for each of the four limits, the setting and, for the automatic setting, its count, and the dataset with the reason it was chosen. `## Cluster facts` holds the cluster's facts or the line for no cluster.
- **Where it sends the work.** To itself, when the user changes a limit or the dataset. To Build otherwise.

## Build

- **What it does.** It has each piece of code the baseline needs built by a builder and read by a reviewer (items 6 to 9): the loading and the split of the dataset, the metric, the baseline method, `code/run_all.sh` and `code/paper.py`.
- **What it leaves.** The code under `code/`, `code/README.md`, and for each piece its brief and its two reports in `notes/code/`.
- **Its completion criterion.** Each piece the baseline needs exists under `code/`, and its newest reviewer's report in `notes/code/` holds no finding that makes a result false and reports the small local test passed. `code/run_all.sh` and `code/paper.py` exist. `code/run_all.sh` run with a raw input missing printed the missing prerequisite before any work, as the reviewer's report quotes.
- **Where it sends the work.** To itself, for each finding a reviewer reports (item 8). To Frame, when the code shows that the dataset does not fit the limits. To Baseline otherwise.

## Baseline

- **What it does.** It runs the baseline under the conditions of Frame: the dataset, its split, the metric and the seeds the briefs name (item 11).
- **What it leaves.** The baseline's result under `code/results/`, its job scripts under `code/hpc/`, their logs under `logs/`, and its line in the README's `## Results` with its file and its command.
- **Its completion criterion.** Each run of the baseline that its brief plans has ended, its log shows no error, and its result file under `code/results/` holds every value the metric asks for.
- **Where it sends the work.** To Build or to Frame, on the user's word at the stop "A job that fails", when a log or a result shows a fault. To Frame, when the baseline cannot run inside the limits. To Experiments otherwise.

## Experiments

- **What it does.** It runs one campaign or several, each with its own method and its own section in `## The stage and campaign that stand`. The code of each campaign is built and read as in Build, and each campaign's jobs run as in Baseline (item 12). Campaigns can try very different things. A made-up example: one method trained on a central copy of the data, and then the same task trained by federated learning. A campaign starts from a claim of `## Research questions and claims`, from a method cause of Compare, or, in the `revision` mode of `SKILL.md`, from a referee comment that needs results work, which the campaign answers ("revision" item 3 of `SKILL.md`).
- **What it leaves.** For each campaign, its code under `code/experiments/<campaign>/`, its job scripts, logs and result files, and its lines in `## Results`.
- **Its completion criterion.** Each campaign that stands has its code passed by its reviewer, each of its planned runs has ended with a log that shows no error, and each of its results stands under `code/results/` with its command and its line in `## Results`.
- **Where it sends the work.** To itself, when a campaign sends the work back to its own start, at most 3 times for one campaign, or a new campaign is added. To Build, for code that every campaign shares. To Build or to Frame, on the user's word at the stop "A job that fails". To Compare otherwise.

## Compare

- **What it does.** It reads each result against the baseline and against what Frame set as good enough, and writes a diagnosis and a proposal for each result that does not beat the baseline or does not reach what was set (items 13 to 15). Under the automatic setting it tries methods until a result beats the baseline or the count of methods is reached, and under the manual setting it stops at each such result.
- **What it leaves.** In `## Results`, for each result, whether it beats the baseline and reaches what was set. For each such result that does not, its diagnosis and its proposal in the README, or in a file of `notes/` the README links. Each dead end in `## Dead ends` and in `code/attic/`.
- **Its completion criterion.** All of these hold:
  - Each result of the campaigns that stand has its line in `## Results`.
  - Each result that does not beat the baseline or does not reach what was set has its diagnosis with its cause and its proposal.
  - For each claim the papers will report, at least one result beats the baseline.
  - Each such result that does not reach what Frame set as good enough is named in `## Results` as below what was set.
  - Under the manual setting, the user sent such a result on to Consolidate at the stop "A result short of what was set, in `research`".
- **Where it sends the work.** By the diagnosis's cause: the dataset to Frame's choice of the dataset, the implementation to Build, the research question to `idea`, reopened with the reopening evidence, the method to Experiments with the new method as a campaign. To Consolidate when its completion criterion holds.

## Consolidate

- **What it does.** It runs `code/run_all.sh` once from the raw inputs in a clean copy of `code/`, through the scheduler on a cluster, compares each number, table and figure the run yields with the reported one, and writes the record of the experiments (items 16 and 17).
- **What it leaves.** The reproduction run's log under `logs/`, the comparison in a file `notes/reproduction-<YYYY-MM-DD>.md` that the README links, and `experiment-record.yaml` in the project folder.
- **Its completion criterion.** The comparison of the reproduction run shows no difference for any number, table or figure, and `experiment-record.yaml` stands, read back as YAML, in the form of Schema 9 of `references/handoff_schemas.md`.
- **Where it sends the work.** To Baseline or to Experiments, the stage that made a number, table or figure that differs. To the end of the run otherwise.

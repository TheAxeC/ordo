# The brief of a piece of code

The `research` mode of `researcher` writes one brief in this form for each piece of code, at "research" item 6 of `SKILL.md`, before it starts the builder of `agents/research_builder_agent.md`, and gives the same brief to the reviewer of `agents/research_reviewer_agent.md`. "What it reads" with a number, Rules and a stop named in quotes are those of `SKILL.md`.

## Where it stands

- The brief is `notes/code/<piece>-brief-<n>.md` in the project folder, with `<piece>` a short name of the piece of letters, digits and `-`, and `<n>` 1 for the first brief and one more for each brief that sends a finding back.
- The builder's report is `notes/code/<piece>-builder-<n>.md`, and the reviewer's report `notes/code/<piece>-review-<n>.md`, each written by the session from the agent's final message.
- The README's `## The stage and campaign that stand` links the three files of the piece that stands.

## The form

```markdown
# Brief: <piece>, <n>

Stage: <Build, Baseline or Experiments>. Campaign: <the campaign, or none>.
Project folder: <the project folder's absolute path>. Cluster: <yes, with the cluster's facts of the README, or no>.

## What to build

<what the piece does, in numbered items, each one requirement the reviewer reads the code against>

## The research question and the conditions

> <the research question and the claim this piece serves, quoted from the README>

- Dataset: <the dataset, its split and where its raw inputs stand>.
- Baseline: <the baseline, and the conditions it runs under>.
- Metric: <the metric, computed as the README records it>.
- Seeds: <the seeds, the same for the baseline and every method>.

## The cases

- <an input> gives <the expected result>.

## The small local test

<the one command that runs the piece on a small input, the time it needs, at most 10 minutes, and what it prints when it passes. On a cluster, the script `code/hpc/test-<piece>.sh` it runs in, its `#SBATCH --time` that time, submitted as `references/slurm.md`, "A small local test", gives>

## The files it writes

- <each path under code/, the script of the small local test under code/hpc/ among them: the only files the builder writes>

## The rules it is under

- <each of the four rules of Rules that bears on this piece, quoted: the rule on the one command for `run_all.sh`, `paper.py` and each result, the rule on the login node for every run>
- Every run on a cluster, the small local test included, goes through the scheduler as `references/slurm.md` gives it.
- A result file under `code/results/` names the command that made it.

## The findings this brief answers

<for a brief after the first: each finding of `notes/code/<piece>-review-<n-1>.md`, quoted, with what the builder changes for it; for a first brief, none>
```

- Each item of "What to build" holds one requirement, so that the reviewer reads each against the code.
- "The cases" holds at least one input with its expected result for each item of "What to build" whose failure would make a result false.
- A piece that is a dead end to keep names in "What to build" its folder in `code/experiments/`, its new folder in `code/attic/`, the line it adds to `code/attic/README.md`, and that it runs from there.

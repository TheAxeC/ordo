# The project layout

The `research` mode of `researcher` makes this layout in a new project at "research" item 3 of `SKILL.md`, and every mode of the skill reads a project through it. "What it reads" with a number, Rules and a stop named in quotes are those of `SKILL.md`, and "item" with a number is an item of the subsection of `SKILL.md` that names it.

## The tree

```text
<project folder>/
  README.md            the entry file: a new session reads it first
  code/
    README.md          how to run the code, and what each folder holds
    run_all.sh         the one command: every reported number, table and figure from the raw inputs, then paper.py
    paper.py           every figure and table from results/
    core/              the code every experiment shares: data loading, the metric, the models
    experiments/       one folder per campaign, with its method
    hpc/               one job script per job, submitted from this folder
    data/              the raw inputs, or a README.md that names where they stand
    results/           every result, each with the command that made it
    figures/           what paper.py writes
    attic/             the dead ends, each runnable, indexed in attic/README.md
    .depositignore     what stays out of a public deposit of code/
  manuscript/          the first paper
  admin/               material of the project that is no research: forms, budgets, agreements
  notes/               other material: proofs, novelty pages, the briefs and reports of each piece of code, sections moved out of the README
  reviews/             real reviews of the project's papers only; no skill writes here
  logs/                the output and error file of each job, named by the job
```

- A further paper of the project stands in `manuscript-<name>/` beside `manuscript/` (section "Several papers").
- `code/run_all.sh` takes one optional argument, the folder of the raw inputs, and reads `code/data/` without it, so that the clean copy of Consolidate reads the raw inputs where they stand.
- `code/run_all.sh` checks each prerequisite it needs (each raw input, each program, each library) before it does any work, and when one is missing it prints the name of each missing prerequisite and exits 1 without starting work.
- `code/run_all.sh` writes into `results/` and `figures/` of the `code/` folder it stands in, so that a copy of `code/` writes into the copy.
- `code/paper.py` reads `code/results/` alone and writes every figure into `code/figures/` and every table as a file of `code/figures/`.

## The README

`README.md` holds these sections in this order, each a `##` heading:

1. `## Research questions and claims`: the first section, the one `idea` writes ("idea" item 11): each research question, then each claim with the result that would show it, the baseline and the metric.
2. `## Constraints and limits`: what counts as good enough, the limits on storage, compute, time and access, the setting (manual or automatic) with its count of methods, and the dataset with the reason it was chosen.
3. `## Where things live`: each folder of the tree above, or the project's own name for it in a project underway.
4. `## Cluster facts`: the cluster's facts of Frame, or the line `No cluster: the jobs run where the session runs.`
5. `## The stage and campaign that stand`: the stage that stands, the campaign that stands within Experiments, each job id submitted and not yet read, a link to the brief and the two reports of each piece of code in `notes/`, for a campaign of the `revision` mode the referee comment it answers, by its id and as quoted lines, with the run folder of the revision, and beside the end of `research`, which stays the stage that stands, the end of each revision with its run folder and its comments file ("revision" items 2, 3 and 10 of `SKILL.md`).
6. `## Results`: each result with its file under `code/results/` and the command that made it, and whether it beats the baseline and reaches what was set as good enough. A result that goes on to Consolidate below what was set is named as such.
7. `## Dead ends`: each method that did not beat the baseline, with its folder in `code/attic/`, its diagnosis and why it failed.
8. `## Papers`: each paper's folder with the results it reports, and the results a run of `revision` added to it ("revision" item 10 of `SKILL.md`).
9. `## Next`: the next actions, and for `full` the modes it runs, in order, with the mode that stands.

- A section that grows past 200 lines moves to a file of `notes/`, named after the section, and the README keeps the heading with a link to the file.
- A section with nothing to hold yet keeps its heading and the line `None yet.`
- The user's words reach the README as text, as the Rules bullet on the user's words says.

## A project underway

- A project that `research` did not start keeps its own names: nothing is moved, and `## Where things live` records the project's own folder for each folder of the tree above, or `none` for a folder it does not have.
- A folder of the tree above that a project underway lacks is made only when a stage writes into it, and `## Where things live` names it then.

## The dead ends

- A method that did not beat the baseline moves from its folder in `code/experiments/` to `code/attic/<campaign>-<method>/`, by a builder under a brief, so that it still runs from there.
- `code/attic/README.md` holds one line per dead end: its folder, the command that runs it, and the line of `## Dead ends` that says why it failed.
- `code/run_all.sh` runs no dead end, since a dead end reports no number of a paper.

## Several papers

- The first paper stands in `manuscript/`, and a further paper in `manuscript-<name>/` beside it, with `<name>` one folder name of letters, digits, `-` and `_`.
- The papers share `code/` and `code/results/`.
- `## Papers` lists each paper's folder with the results it reports.
- `manuscript` and `integrity` run per paper: `/researcher manuscript <project folder> --manuscript <name>` writes the further paper, and `/researcher integrity <project folder>/manuscript-<name>/main.tex` checks it.
- When the user asks for it, a further paper is a new project instead: a new project folder with this layout, into whose `code/` the code the paper needs is copied, with its own README whose `## Where things live` names the project it was copied from.

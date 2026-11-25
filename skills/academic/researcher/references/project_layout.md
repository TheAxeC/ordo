# The project layout

The `research` mode of `researcher` makes this layout in a new project at "research" item 3 of `SKILL.md`, the `readme` mode brings a project's README and code README to it, and every mode of the skill reads a project through it. "What it reads" with a number, Rules and a stop named in quotes are those of `SKILL.md`, and "item" with a number is an item of the subsection of `SKILL.md` that names it.

## The tree

```text
<project folder>/
  README.md            the entry file: a new session reads it first
  code/
    README.md          the code README, for a newcomer reading the public deposit of code/ (section "The code README")
    run_all.sh         the one command: every reported number, table and figure from the raw inputs, then paper.py
    paper.py           every figure and table from results/
    core/              the code every experiment shares: data loading, the metric, the models
    experiments/       one folder per campaign, with its method
    hpc/               one job script per job, submitted from this folder
    data/              the raw inputs, or a README.md that names where they stand
    results/           every result, each with the command that made it
    figures/           what paper.py writes
    attic/             the dead ends, each runnable, indexed in attic/README.md
    .depositignore     what stays out of a public deposit of code/ (section "The deposit")
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

`README.md` is written for a newcomer who reads it from the top. It opens with the title `# <project>`, followed by one line: what the project is, its status and its venue. These twelve sections follow in this order, each a `##` heading with the `###` headings its item names:

1. `## In short`: the project in a few sentences.
2. `## What it is and why`, with `### The problem`, `### Why it matters` (for a method applied to a clinical dataset, its clinical relevance) and `### What it does`.
3. `## Research questions and claims`: the section `idea` writes ("idea" item 11): each research question, then each claim with the result that would show it, the baseline and the metric.
4. `## Data`: one `### <dataset>` per dataset, with its source, its version, its access, its local path and its cluster path, and the reason it was chosen.
5. `## Method`, with `### The approach`, each campaign's method, and `### What is not claimed`.
6. `## Constraints and limits`: what counts as good enough, the limits on storage, compute, time and access, and the setting (manual or automatic) with its count of methods.
7. `## Related work`, with `### The closest prior work`, which links the project's novelty pages, and `### What this project adds`.
8. `## Results and how to reproduce`: one `### <result>` per result, with its number, its file under `code/results/`, the command that made it, and whether it beats the baseline and reaches what was set as good enough. A result that goes on to Consolidate below what was set is named as such.
9. `## Papers`: each paper's folder with the results it reports, and the results a run of `revision` added to it ("revision" item 10 of `SKILL.md`).
10. `## Dead ends (do not retry)`: one `### <method>` per method that did not beat the baseline, with its folder in `code/attic/`, its diagnosis and why it failed.
11. `## Next`: a short numbered list of the next actions, from which a finished item moves to `## Results and how to reproduce` or to `## Dead ends (do not retry)`, and for `full` the modes it runs, in order, with the mode that stands.
12. `## Working state`, with these three `###` headings:
    - `### The stage and campaign that stand`: the stage that stands, the campaign that stands within Experiments, each job id submitted and not yet read, a link to the brief and the two reports of each piece of code in `notes/`, for a campaign of the `revision` mode the referee comment it answers, by its id and as quoted lines, with the run folder of the revision, and beside the end of `research`, which stays the stage that stands, the end of each revision with its run folder and its comments file ("revision" items 2, 3 and 10 of `SKILL.md`).
    - `### Where things live`: each folder of the tree above, or the project's own name for it in a project underway.
    - `### Cluster facts`: the cluster's facts of Frame, or the line `No cluster: the jobs run where the session runs.`

- Once a paper is the canonical record, `## Method` and `## Related work` hold a pointer to the paper and what the paper does not hold.
- A section that grows past 200 lines moves to the file `notes/<slug>.md`, and the README keeps the heading with a link to the file.
- `<slug>` is the section's heading in lower case, with each run of characters other than letters and digits written as one `-` and no `-` at either end: `## Dead ends (do not retry)` gives `dead-ends-do-not-retry`.
- A `notes/<slug>.md` that exists is never overwritten: the file takes the next free name, `notes/<slug>-2.md`, then `-3`, and so on, as `idea` names its progress files.
- A section with nothing to hold yet keeps its heading and the line `None yet.`
- The user's words reach the README as text, as the Rules bullet on the user's words says.

## The code README

`code/README.md` is written for a newcomer who reads the public deposit of `code/`, and holds these sections in this order:

1. `# <project>: code`, followed by a short introduction: what the code is for and the paper it serves.
2. `## What it computes`: each result the code produces, in words.
3. `## Requirements`: the programs and the libraries, each with its version, and the hardware a run needs.
4. `## Data`: each raw input, where it is obtained and where `run_all.sh` reads it.
5. `## Run`: the command `run_all.sh` with its argument, the time a run takes, and on a cluster the job scripts of `hpc/`.
6. `## What each result comes from`: each file of `results/` and each figure and table of `figures/`, with the command or the script that makes it.
7. `## Layout`: each folder of `code/` and what it holds.
8. `## License and citation`: the licence of the code, and how to cite the code and the papers.

- In a project underway, the code README is the `README.md` of the project's own code folder, which `### Where things live` names, as section "A project underway" gives it.
- "research" item 3 writes it with each section holding `None yet.`
- Consolidate brings it to this layout from the code it consolidates ("research" item 16).
- The `readme` mode drafts it whole ("readme" item 3 of `SKILL.md`).

## The deposit

`code/.depositignore` names what stays out of a public deposit of `code/`, one pattern per line, as a `.gitignore` names them:

```text
data/
attic/
results/
figures/
__pycache__/
*.pyc
.cache/
.pytest_cache/
.ipynb_checkpoints/
.env
.env.*
*.pem
*.key
secrets/
```

- `attic/` stays out so that no dead end is published.
- `results/` and `figures/` stay out so that every result is rebuilt by `run_all.sh`.
- `data/` stays out since a newcomer obtains the raw inputs as the code README's `## Data` says.
- The caches stay out since a run rebuilds them.
- The secrets stay out since a deposit is public.
- In a project underway, `.depositignore` stands in the project's own code folder, beside its code README.
- "research" item 3 writes these lines.
- The `readme` mode adds to a `.depositignore` that exists each of these lines it lacks, keeps its own lines and shows the additions in its draft ("readme" item 3 of `SKILL.md`).

## A README in the old layout

- A `README.md` that holds `## The stage and campaign that stand` as a `##` heading is a README in the old layout, at which `idea`, `research`, `research adopt`, `full` and `revision` stop ("A README in the old layout").
- The `readme` mode moves the content of each of its sections to the section of the same name in the layout above, its Results to `## Results and how to reproduce`, its Dead ends to `## Dead ends (do not retry)`, and its The stage and campaign that stand, Where things live and Cluster facts to the `###` headings of `## Working state`.
- The dataset with the reason it was chosen, from its Constraints and limits, and where the raw inputs stand, from its Where things live, go to `## Data`.

## A project underway

- A project that `research` did not start keeps its own names: nothing is moved, and `### Where things live` records the project's own folder for each folder of the tree above, or `none` for a folder it does not have.
- A folder of the tree above that a project underway lacks is made only when a stage writes into it, and `### Where things live` names it then.

## The dead ends

- A method that did not beat the baseline moves from its folder in `code/experiments/` to `code/attic/<campaign>-<method>/`, by a builder under a brief, so that it still runs from there.
- `code/attic/README.md` holds one line per dead end: its folder, the command that runs it, and the entry of `## Dead ends (do not retry)` that says why it failed.
- `code/run_all.sh` runs no dead end, since a dead end reports no number of a paper.

## Several papers

- The first paper stands in `manuscript/`, and a further paper in `manuscript-<name>/` beside it, with `<name>` one folder name of letters, digits, `-` and `_`.
- The papers share `code/` and `code/results/`.
- `## Papers` lists each paper's folder with the results it reports.
- `manuscript` and `integrity` run per paper: `/researcher manuscript <project folder> --manuscript <name>` writes the further paper, and `/researcher integrity <project folder>/manuscript-<name>/main.tex` checks it.
- When the user asks for it, a further paper is a new project instead: a new project folder with this layout, into whose `code/` the code the paper needs is copied, with its own README whose `### Where things live` names the project it was copied from.

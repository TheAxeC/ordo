# 0053. researcher's research mode is directed by the session through six stages that can loop, with a brief and a reviewer for each builder, and the project's README as its entry file

Status: proposed; superseded by 0056 in the sentence "Jobs are submitted only after it.", and by 0057 in the bullet "The project's `README.md` is its entry file" and in the sentence "With no usable README it reads the project against each stage in order, shows what it found, and writes the README sections after the user confirms."

## Context

Roadmap entry 13's goal gives `researcher` a `research` mode that takes an idea to results: it builds the code, runs the experiments, jobs on a cluster among them, and proposes a new method when a result does not beat the baseline. The goal holds a project to four rules: one documented command rebuilds every reported number, table and figure from the raw inputs; nothing computes on a cluster's login node; an idea is not shelved after a weak first attempt; the project's notes let a new session resume without the conversation. An adopt mode continues a project already underway.

No source skill covers this mode, so its design is this repository's own. The public systems read for it run a fixed chain of stages, one loop with no stages, or a tree search over code versions; none was found to support a cluster scheduler or to resume a project it did not start. A project of days does not fit one context, and a wrong experiment costs cluster hours and yields a false number.

## Decision

- The session directs the work and builds nothing itself. It goes through six named stages, each with a written completion criterion: Frame, Build, Baseline, Experiments, Compare, Consolidate. A stage can send the work back to itself or to an earlier stage. Experiments holds one campaign or several, each with its own method.
- Each piece of code is built by a fresh agent from a brief the session writes: what to build, the cases, a small local test, the files it writes. A fresh agent that changes nothing then reads the code against the brief, reruns the local test and looks for what makes a result false. Jobs are submitted only after it. The mode uses no worktree, no landing and no ledger.
- Frame sets the question, the baseline, the metric, what counts as good enough, the limits on storage, compute and time, the cluster's facts, and the dataset. The dataset is picked by the user from candidates shown with their size, licence, how each is obtained, the published works that report on it and its fit to the limits.
- When a result does not beat the baseline, Compare writes a diagnosis that names the cause as the dataset, the method, the implementation or the question, and proposes a new method, a change of the method or another dataset. One setting, asked at Frame and changeable at any time, decides what follows: the mode stops after each such result, or goes on by itself for a number of methods the user sets. A new method is a change of objective, optimisation or model structure. A negative result is never written up.
- The skill ships the rules for SLURM and no cluster's facts. After submitting, the session writes the job ids to the notes and stops; it polls only when the user asks for it.
- At Consolidate the one command is run once from the raw inputs in a clean copy of the project, through the scheduler on a cluster, and each number, table and figure it yields is compared with the reported one. A number is called reproduced only after that run.
- The project's `README.md` is its entry file: the question and claims, the constraints and limits, where things live, the cluster's facts, the stage and campaign that stand, each result with its file and command, each dead end with why it failed, the papers, and the next actions. A section that grows too long moves to `notes/` and is linked. A new session reads it first.
- The default layout for a new project is `code/` (with `run_all.sh`, `paper.py`, `core/`, `experiments/`, `hpc/`, `data/`, `results/`, `figures/`, `attic/` for dead ends kept runnable, and `.depositignore`), `manuscript/`, `admin/`, `notes/`, `reviews/` and `logs/`. No skill writes in `reviews/`, which holds real reviews only. A project underway keeps its own names, recorded in its README, and nothing is moved.
- One project can hold several manuscripts: the first in `manuscript/`, a further one in `manuscript-<name>/`, with the code and results shared. A further paper may also be a new project that copies the code it needs.
- The adopt mode reads the README first and checks each stage the README calls done against that stage's criterion in the files; the first that fails is where it continues. Partial, unfinished or inadequate results count as not done. With no usable README it reads the project against each stage in order, shows what it found, and writes the README sections after the user confirms.

## Alternatives rejected

- One loop with no stages: the adopt mode has nothing to resume from, and no place requires the baseline or the one command.
- A tree search over code versions: it suits runs scored in minutes on one machine and has no place for jobs that take hours.
- The session builds everything itself: its context fills with code and logs.
- The whole plan loop with worktrees and a landing: it needs a verify list and a plan configuration, which a research project does not have.
- No reviewer: the session that asked for the code judges it.
- Polling by default: a session is held open for hours and its state is lost if it dies.
- The notes in a file of their own beside the README: the user's projects are entered through their README, and two entry files drift apart.
- The command judged by reading: a missing cache or a wrong path shows only when it runs.

## Consequences

A project started by `research` can be resumed by a new session from its README alone. The skill text for this mode is this repository's own and is changed like any other skill text, within this record. The gate of the entry checks this mode by reading, so the first real project run with it is where a fault of the design shows.

# The rules for SLURM

The `research` mode of `researcher` runs every job of a project on a cluster through the SLURM scheduler by these rules. The skill ships no cluster's facts: the partitions, the accounts, the modules, the scratch storage and the limits of a cluster are asked once at Frame and written to the README's `### Cluster facts` ("research" item 4 of `SKILL.md`). "What it reads" with a number, Rules and a stop named in quotes are those of `SKILL.md`.

## The login node

- A login node is used for editing files, submitting jobs with `sbatch`, and reading files, logs and the scheduler's output.
- Every computation, a small local test of a piece of code included, runs as a job through the scheduler.
- A command that reads or writes the data, trains or evaluates a model, or runs `code/run_all.sh` or `code/paper.py` is written into a job script and submitted.

## Job scripts

- Each job has its own script in `code/hpc/`, named after the job, such as `code/hpc/baseline.sh`, and is submitted with `sbatch` from that folder: `cd '<project folder>/code/hpc' && sbatch '<script>'`.
- The script's `#SBATCH` lines request the time, the memory, the cores and the GPUs the job needs, each inside Frame's limits and the cluster's facts, with the partition and the account the cluster's facts name.
- The script writes its output and its error file into `logs/` of the project, named by the job: `#SBATCH --job-name=<job>`, `#SBATCH --output=../../logs/%x-%j.out` and `#SBATCH --error=../../logs/%x-%j.err`.
- The paths of `--output` and `--error` are relative to the submit folder `code/hpc/`, so that no project path stands in a directive.
- The session makes `logs/` with `mkdir -p '<project folder>/logs'` before the first submission, since the scheduler makes no folder for a job's output.
- A sweep over settings is one job array, `#SBATCH --array=<range>`, each task reading its setting from `$SLURM_ARRAY_TASK_ID`.
- A job that needs another job's output is submitted with `--dependency=afterok:<job id>`.
- The script names the command it runs, with the result file it writes under `code/results/`, so that the README's `## Results and how to reproduce` can give that command.

## Submitting

- The job id is read from the line `sbatch` prints, `Submitted batch job <id>`.
- After submitting, the session writes each job id with its script to the README's `### The stage and campaign that stand`, and the run stops at "The jobs submitted".
- The session polls only when the user asks for it in the run: then it reads `squeue --jobs <ids>` and `sacct --jobs <ids>` once every 10 minutes.
- It stops polling when the user asks, when every job it polls has ended, or after 36 polls, when it says that it stopped and why.
- A job that has ended is read from its files in `logs/` and its result file, and `### The stage and campaign that stand` drops its id once it is read.

## A small local test

- On a cluster, the small local test of a piece of code runs as a short job, a script `code/hpc/test-<piece>.sh`.
- Its `#SBATCH --time` is the time the test needs as its brief gives it, at most 10 minutes.
- The builder and the reviewer submit it with `sbatch --wait` from `code/hpc/`, which returns when the job ends.
- They run `sbatch --wait` as a background command of the runner, so that the runner's cap on a foreground command does not cut it off, and read the result when the command ends.
- A test job that `squeue --jobs <id>` still shows as pending 60 minutes after its submission is cancelled with `scancel <id>` and handed back in the agent's report with its id.
- On a cluster, the builder's small local test is the one job of a piece submitted before its reviewer reads the code, since nothing may compute on the login node and the test produces no result.
- The jobs of the baseline and of the experiments wait for a reviewer's report with no finding that makes a result false.
- Off a cluster, the small local test runs where the session runs.

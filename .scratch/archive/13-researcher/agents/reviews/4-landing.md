# Step 4 landing

Entry 13 of `docs/roadmap.md`, researcher; step 4 of 7, the modes `research`, with its adopt mode, and `full`, landed on main; next, step 6, the gate's runs and readings, which waits on the user's word for the release candidate's tag and pin, the idea of the `novelty` run and the sentence of the `/ordo-help` run.

## Open items

- none.

## The check of Steps 1

The builder (a781286d82284189f), the brief-check agent (ad013e826d92d4998) and the two reviewers (a6e39bbd6d6f0b790, a729e2eb1b9c75644) had each ended with a completion notice before the landing; the runner's agent listing showed none of them.

## Not done

Nothing. Not verified: the SLURM behaviours the pages rely on, since no cluster is reachable from this machine.

## What landed

- `skills/academic/researcher/SKILL.md`: `/researcher research <project folder>` runs the six stages Frame, Build, Baseline, Experiments, Compare and Consolidate, each with its completion criterion, each piece of code built by a fresh builder from a brief and read by a fresh reviewer before any job, SLURM jobs through the scheduler with the job ids in the README, the manual or automatic setting, the diagnosis of a result that does not beat the baseline, and the record of the experiments; `/researcher research adopt <project folder>` continues a project underway from its first stage not done; `/researcher full <project folder> [<sketch file>]` runs `idea`, shows the modes it runs and leaves out, and goes on after one confirmation; `/researcher manuscript <project folder> --manuscript <name>` writes a further paper.
- The six new pages, the glossary entries, `paper`'s `--manuscript <name>`, ADR 0043's deviation bullets, the figure of `research`, the academic-pipeline figure and the README, roadmap and `docs/dev/` lines that name them.

## What was found

- The brief check found that the figure of academic-pipeline, two figure lists and a README line would turn false, that a further paper had no command, and that several repeats had no count; all were closed in the brief, the further paper as Open item I (C151).
- The first review found that the automatic setting ran past a result that beats the baseline, that `full` stopped at "A project underway" after `idea`, that a stop inside Frame could not be resumed, that the clean copy's `cp -R` could not leave out `data/`, that the job scripts carried the project path, that two papers shared their unfinished runs, and that the figure missed loops; all were closed in repair round 1.
- The run over the round found that the record of the round's changes was incomplete, that three standing trigger phrases were reworded, and that a reproduction job's logs would land outside the project; each was fixed at landing or stated in the booking.

## Fixes at landing

(1) `references/research_stages.md`: the general bullet on a result below what was set says the adopt mode reads a project `research` did not start, so it never counts against a choice the user made at the stop of `research`; (2) the description puts back the standing trigger phrases "run the experiments of my project", "check the integrity of my manuscript" and "verify the references and claims of a finished draft", 1020 characters, by shorter wording in the modes' part; (3) `SKILL.md` research item 16: the clean copy is the folder `code` inside a folder `mktemp -d` makes, with `logs/` made beside it, so the job scripts' `../../logs/` writes there, and the run's logs are copied into the project's `logs/` before that folder is removed; (4) ADR 0043, Decision 3: the `--manuscript` deviation and the row Manuscript Folder with its plan-run filter stand as two bullets.

## Verification

`checks: 16 commands passed`, printed by `templates/checks.sh` on the state file, on main after the fixes at landing.

## Usage

builder a781286d82284189f, 355479 tokens, 102 tool uses, 1461 s, and for round 1 206621 tokens, 70 tool uses, 729 s; brief check ad013e826d92d4998, 219310 tokens, 41 tool uses, 368 s; reviewer a6e39bbd6d6f0b790, 251507 tokens, 53 tool uses, 584 s; reviewer over round 1 a729e2eb1b9c75644, 168354 tokens, 24 tool uses, 181 s. The builder's first report did not pass its bar.

## Next

Step 6, the gate's runs and readings.

# 0055. researcher's revision mode runs each comment that needs new results as a campaign of the research stages, then paper's revision

Status: proposed

## Context

Roadmap entry 13's goal gives `researcher` a `revision` mode for a paper of the project and its referee comments. `/researcher manuscript <main.tex> <comments file>` sends every change to `/paper revision`, which changes the manuscript's text by patches only. `paper`'s revision coach gives each commitment a type, `add_experiment` and `add_analysis` among them (`skills/academic/paper/agents/revision_coach_agent.md`), and no step runs that work, so a comment that asks for a new experiment, a new analysis, another dataset or another baseline ends as an item not addressed. The `research` mode already holds the stages that make a result: a campaign with its builder and reviewer, its jobs, Compare and the reproduction run (ADR 0053).

## Decision

- The command line is `/researcher revision <project folder> <comments file> [--manuscript <name>]`, the paper in `manuscript/`, or in `manuscript-<name>/` with `--manuscript`.
- `/paper revision-coach` parses the comments into the Revision Roadmap. Its commitment types `add_experiment` and `add_analysis` mark the comments that need results work, and the session shows that split at one stop, where the user corrects it.
- Each comment that needs results work is one campaign of the project's Experiments stage, with its builder and reviewer, its jobs and Compare under the project's setting, and then one Consolidate run that updates the record of the experiments. Build runs first only for a new dataset or a new baseline, and Frame is not run again.
- A requested result that does not beat the baseline goes to Compare's diagnosis and proposal, as in `research`. Only a result that beats the baseline reaches the revision. A comment whose results do not yet answer it is the stop "A comment the results do not answer yet", which shows what was tried and the next proposal. No response letter and no manuscript text presents a result that does not beat the baseline.
- The session writes `revision-comments.md` in the run folder: each referee comment, and for a results comment the lines of the README's `## Results` that answer it, with their files. `/paper revision` runs on that file, with the result files and the record of the experiments named in its row Existing Materials, which its results check reads.
- The stages that follow are those `/researcher manuscript <main.tex> <comments file>` runs for comments in hand: the first integrity check, the coaching, `/paper revision`, the completeness check of `references/external_review_protocol.md` as the re-review, and the final integrity check.
- One revision run answers one comments file. Each campaign keeps `research`'s counts. A second round of referee comments is a new run with its own comments file.

## Alternatives rejected

- The session classifies the comments itself: a second parser beside `paper`'s, whose types can disagree with the roadmap `/paper revision` reads.
- The session runs a requested analysis itself: code with no reviewer and numbers with no reproduction run would reach the paper, against ADR 0053.
- A fresh `/researcher research` run per revision: Frame would ask again what the project's README already holds.
- A requested result reported in the response letter as it came out: it writes up a negative result, which no text of `researcher` does.
- The session edits the manuscript with the new numbers: a change outside `/paper revision`, which bypasses `paper`'s patches and its results check.
- A `/paper-review-panel re-review` after the revision: for comments in hand `manuscript` runs the completeness check in its place, and the two paths would differ.
- A loop until every comment is answered: a repeat with no count.

## Consequences

The skill text for this mode is this repository's own and is changed like any other skill text, within this record. A revision can take more methods than a referee asked for, when a requested comparison does not yet beat the baseline. `researcher` gains the stop "A comment the results do not answer yet", and its figure of `research` or a figure of its own shows the mode.

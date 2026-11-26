# Ordo

Ordo is a set of agent skills for Claude Code that run a multi-step change as a plan. The skills carry no project name and no path. Everything specific to a repository comes from that repository's `plan.yaml`, the plan configuration. The same skills therefore run a C++ engine, a TypeScript tool or a research project.

A plan is opened for one roadmap entry, an item of the repository's ordered list of planned work. It is kept in a ledger folder that holds its step list, its briefs and its reviews. Each step of the plan gets a brief, its written specification, and is built in its own git worktree. A fresh reviewer that changes nothing reviews the step. The step is cherry-picked onto `main` only after its checks pass there.

The code skills find the cause of a defect, review the comments of a diff, write setup scripts and document a repository, the paper and research skills take a project from an idea to a submitted paper, and the explain skills teach a topic or explain a message again.

## The skills

Each skill's folder stands in one of the five group folders of `skills/` (`skills/orchestration/`, `skills/ordo/`, `skills/code/`, `skills/academic/` and `skills/explain/`), and installed, the skills stand side by side in one folder under their own names, such as `~/.claude/skills/plan`.

You or the model can invoke every skill, so that an agent can make a run of it, except `wait-what`, which explains a message again and which only you invoke, since only you know when you stopped following.

### `skills/orchestration/`

| Skill | What it does |
|---|---|
| `roadmap` | Keeps the roadmap, the ordered list of entries a plan is opened for, and shows, adds, moves, marks done or drops an entry. |
| `grill` | Settles a roadmap entry's design decisions before its plan opens, in an interview in rounds, each decision with its options and one recommendation. |
| `plan` | Opens a plan for one roadmap entry: its ledger folder, its goal, the check that proves it done and a drafted step list you approve. |
| `spec` | Prepares one step: checks its assumptions against the repository, writes the brief and, except for a small text step (fewer than 20 lines and no script, test or configuration file), has a fresh agent check it. |
| `refute` | Reviews a built step without changing it: a fresh reviewer reruns the brief's checks and writes a verdict per item and its findings. |
| `land` | Cherry-picks a reviewed step onto `main`, runs the checks there, records the step in the plan, commits it and removes its worktree. |
| `plan-orchestration` | Runs every open plan, or the plan named, step by step and unattended, and stops only where a decision is yours. |
| `plan-retro` | Reads every review of the repository's plans, groups the findings by kind and proposes the change that stops each kind that recurs. |

### `skills/ordo/`

| Skill | What it does |
|---|---|
| `ordo-init` | Sets a repository up: a new repository, a drafted `plan.yaml` or a check of an existing one, and with `build` the script `utils/build.py`. |
| `ordo-help` | Prints the command sequence and where each open plan stands, lists every skill, or names the skills that fit what you want to do. |
| `session-retro` | Reads the transcripts of Claude Code sessions and reports what went well and what went wrong, each point with a proposed change. |

### `skills/code/`

| Skill | What it does |
|---|---|
| `code-comments` | Reviews the comments a git diff adds or changes, and rewrites the ones you pick in C, C++ and CMake files. |
| `codebase-design` | Fills a repository's pages of design and coding rules, reviews its code against them, and turns a change you pick into a roadmap entry. |
| `diagnose` | Finds the cause of a defect before anything is changed, from a command that fails on the symptom, in a plan or on its own. |
| `handbook` | Writes a software repository's README and its documentation, such as a getting-started guide, manual pages and diagrams, from the code. |
| `wizard` | Writes an interactive bash script that walks a person through a setup, a migration or a cutover, which you run and the session never does. |

### `skills/academic/`

`paper` and `paper-review-panel` are adapted from academic-paper and academic-paper-reviewer, two skills of Academic Research Skills. Their modes and roles come from the source, and each role's page is the source's page with Ordo's changes. `researcher`'s modes `integrity` and `manuscript` are adapted from academic-pipeline, a third skill of the same collection. `NOTICE.md` names the source and its licence and says these parts were modified.

| Skill | What it does |
|---|---|
| `grant` | Drafts, revises, reviews and checks a grant application written in LaTeX against a funder config, one funder's sections, limits and criteria for one call. |
| `paper` | Writes, revises, plans and formats a LaTeX manuscript in twelve modes, each task a fresh agent's and each change a patch applied by script. |
| `paper-review-panel` | Reviews your paper with five reviewers and an editorial synthesizer, who writes the editorial decision and a revision roadmap. |
| `referee` | Referees someone else's paper for a journal: five reviewers, a ranked selection of points within a budget, and one referee report in one voice. |
| `researcher` | Takes a research idea to results and a paper: its novelty, its questions, experiments as SLURM jobs, a newcomer's README, integrity checks and the manuscript. |
| `submit` | Makes a submission through a web portal from a sheet you approve, fills each form and stops on the final submit, which you press. |
| `writing` | Reviews the prose of a draft against named writing rules, with a script and four fresh agents that change nothing. |

### `skills/explain/`

| Skill | What it does |
|---|---|
| `tutor` | Teaches you one topic over several sessions in short HTML lessons tied to why you learn it, or explains one concept in the conversation. |
| `wait-what` | Explains again, with the context it left out, a message of the session that you did not follow, when you type it. |

## How to use

The commands of a plan, in the order you type them:

```text
/ordo-init                    once per repository: sets it up and writes or checks its plan.yaml
/roadmap add <goal>           an entry with its goal, its gate (the check that proves it done) and its place in the order
/grill <entry>                optional: an interview that settles the entry's design decisions
/plan <entry>                 opens the plan and shows its step list for your approval

for every step:
/spec <entry> <step>          writes the brief, has a fresh agent check it unless the step is a small text step, makes the worktree
"build it"                    the step is built in its worktree, its checks run and its report written
/refute <entry> <step>        a fresh reviewer reads the diff, reruns the checks and writes its findings
"close them"                  a repair round: the findings fixed in the same worktree, up to repair_rounds times (plan.yaml), none for a small text step
/land <entry> <step>          onto main, the checks on main, the step recorded in the plan, the commit

/plan-orchestration           in place of the step lines: runs every step of every open plan unattended
```

`/ordo-help` prints the full sequence, including what to do when a command stops.

The three figures below each have their own legend. In the loop of one step, a solid box is an agent started, or an agent already started and sent a further task, that always runs, and a dashed box one that runs only when needed. An orange box is a stop where the run waits for you, and a dotted arrow is a cycle with its cap, the most times it runs. In the lifecycle of a paper a solid box is a part of the mode named above it, and a dashed box is work the session does on request, with no mode behind it. In the lifecycle of a research project a solid box is a part of the mode, the stage or the README named above it, and a dotted arrow is the stage Compare of `/researcher research` sending the work back to an earlier stage. Each skill's own figure stands under `docs/figures/<group>/`, in [`docs/figures/`](docs/figures/).

### The plan skills

The plan skills are `plan`, `spec`, `refute`, `land`, `ordo-help` and `plan-orchestration`. Each step goes through the loop below, by hand one command at a time or unattended under `/plan-orchestration`, and `/ordo-help` prints the commands and where a plan stands.

![The loop of one step, command by command: /spec, build it, /refute, close them, /refute over the round, with a return for a further round, and /land, with the /plan-orchestration lane below. /spec: Brief-check agent, for a full step; Diagnosis agent, for a part that asks for a cause; A false premise the plan cannot absorb; A rule clash with an ADR; A user-visible choice; A brief check finding the brief cannot absorb; A cause not found; A model other than the configured one; A step that does not converge. Build it: Builder agent, unless the executor is inline or academic-paper. /refute: Reviewer agent; A model other than the configured one. Close them: Builder agent, a repair round of a full step; Diagnosis agent, for a finding whose cause is not known. /refute over the round: Reviewer agent, when refute_after_repair is yes; A model other than the configured one. /land: A red line for the user; A rule clash; A lock held; A worktree that cannot be removed. /plan-orchestration: A shape nobody named; A wrong premise; A red check; A rule clash; A finding that is the user's; The roadmap diff; A model other than the configured one.](docs/figures/orchestration/plan-loop.svg)

#### `plan.yaml`

`/ordo-init` sets up a new repository in an empty folder, drafts `docs/plan.yaml` in an existing one and checks one that is there, writing only what you approve. It keeps the rules every such repository shares in `CLAUDE.md`, and the plan skills' terms in its glossary, equal to their templates. Its `SKILL.md` states the rest.

The skills read the first `plan.yaml` in the folder named in front of the entry, such as `apps/web` in `/plan apps/web/12`, then in `.scratch/`, `docs/` or `.agents/`. A path in it is read relative to its folder, so a root-relative path in `.agents/plan.yaml` needs `../` in front, or the file moves to `docs/plan.yaml` with each path written from `docs/`. Eight keys are required: `roadmap`, `verification`, `rules`, `ledger_root`, `archive_root`, `worker`, `reviewer` and `libraries`. The `plan` skill's `templates/plan.yaml` describes every key and each optional key's default, and `templates/plan.projects.yaml` holds the same keys for each of several projects, a plan then named `<project>/<entry>`. Git must ignore the steps' worktree folder and not the `plan.yaml`. The `plan` skill's "What it reads" 1 states the rest.

When a plan that started an agent closes, the cost script computes what each agent role cost. It reads the response bodies Claude Code writes when it runs with `CLAUDE_CODE_ENABLE_TELEMETRY=1` and `OTEL_LOG_RAW_API_BODIES=file:<folder>`, a folder that grows with each request and holds its prompt. The script finds the folder in `OTEL_LOG_RAW_API_BODIES` of Claude Code's settings files. `plan-orchestration`'s `templates/plan_cost.py` head comment states the rest.

`/land` runs `land.sh` from the `land` skill's folder, never copied into the ledger folder, to cherry-pick the step onto `main` and run the verify list (the commands that must pass) there through `checks.sh`. The `land` skill's section "The landing script" states the rest.

### A paper

`paper` writes, revises and formats a LaTeX manuscript, and `submit` takes it through the journal's portal. The figure follows a manuscript from a plan to resubmission, each part with the mode or call that runs it alone.

![The path of a manuscript through the modes of the paper skill. /paper plan: Help me plan my paper: a chapter plan, worked out in a dialogue | /paper full: one run does every part, in this order: 1. The literature search. Alone: /paper lit-review; 2. The outline. Alone: /paper outline-only; 3. The arguments and the draft. Only in full mode; 4. The figures. Alone: /paper figures, a call; 5. The citation check. Alone: /paper citation-check; 6. The abstract. Alone: /paper abstract-only; 7. The review of the draft. Alone: /paper draft-review, a call; 8. The format and the cover letter. Alone: /paper format-convert; 9. The AI disclosure statement. Alone: /paper disclosure | You submit: /submit: Write the highlights; Describe a graphical abstract | /paper revision: one run does every part, in this order: 1. The comments read into a list of items. Alone, as a roadmap: /paper revision-coach; 2. The manuscript revised, and the citations of the changes checked. Only in revision mode; 3. The response letter and its check, for referee comments. Alone: /paper response-letter | You resubmit: /submit: A response you wrote yourself, checked before you send it: /paper rebuttal-audit | Internal documents: A record of every attempt, for my own reference: /paper full, outline-only or abstract-only, with the intake row Internal only set to yes; An outline or a literature review to pass to my co-authors: /paper outline-only or /paper lit-review.](docs/figures/academic/paper/lifecycle.svg)

### A research project

`researcher` takes a project from a sketch to research questions, results and a paper, and keeps the project's state in its `README.md`. The figure shows its modes in the order of a project.

![The modes of the researcher skill, in the order of a project. /researcher novelty: The closest prior work on each claim, a verdict per claim, a page in notes/ | /researcher idea: The research questions and claims, in rounds of the interview; novelty run between the rounds | Frame: The questions, the limits, the cluster's facts and the dataset | Build: Each piece of code by a builder, checked by a reviewer | Baseline: The baseline's jobs through the scheduler | Experiments: Each campaign's jobs through the scheduler | Compare: Each result against the baseline, with a diagnosis | Consolidate: run_all.sh in a clean copy, the record of the experiments | /researcher manuscript: Stage 2: the writing, /paper full; Stage 2.5: the first integrity check; Stage 3: the review, /paper-review-panel; Stage 4: the revision, /paper revision; Stages 3' and 4': the re-review and the re-revision; Stage 4.5: the final integrity check | /researcher revision: The referee comments split into results and text comments; A campaign of the research stages for each results comment; /paper revision with the new results, then the checks of manuscript | README.md: what each mode that reads or writes it keeps there: idea: the research questions and claims; research and research adopt: the working state a new session resumes from, and the results; full: the modes it runs, in order, in ## Next; revision, and manuscript when the README holds ## Papers: each paper and the results it reports | /researcher readme, beside them: The README and the code README drafted for a newcomer, written after you approve the drafts.](docs/figures/academic/researcher/lifecycle.svg)

## Requirements

- git, POSIX `sh`, and `python3` with PyYAML; the script that runs the verify list, the `land` skill's `templates/checks.sh`, also needs `bash`.
- `perl`, for the ASCII check of `docs/dev/building.md` and for `sync_rules.test.sh`.
- `node` and `npx` on `PATH`, for the skills CLI, which installs Ordo and the skills `ordo-init` installs into a repository.
- Claude Code.

## Install

Install every skill, since the skills call each other and read each other's templates. Remove any copy of them under a repository's `.agents/skills` or `.claude/skills`, so that the installed copy is the only one loaded. The skills CLI installs them:

```sh
npx skills add TheAxeC/ordo --skill '*' -g -a claude-code
```

The CLI finds each skill in its group folder, copies it into `~/.agents/skills` under its own name, and links it from `$CLAUDE_CONFIG_DIR/skills`, or from `~/.claude/skills` when that variable is unset, the folder Claude Code reads skills from. For a second Claude Code account, run it again with that account's `CLAUDE_CONFIG_DIR` set. `npx skills update -g` updates the skills, `npx skills ls -g` lists them, and `npx skills remove --global <skill>` removes a skill a newer version of Ordo no longer ships.

The plan skills and `grill` start their agents through five agent definitions, `agents/ordo-low.md` to `agents/ordo-max.md`, which Claude Code reads from `~/.claude/agents`, or `$CLAUDE_CONFIG_DIR/agents`. The CLI installs skills only, so after `npx skills add`, and after each `npx skills update -g`, copy the agents from a clone:

```sh
rm -rf /tmp/ordo && git clone --depth 1 https://github.com/TheAxeC/ordo.git /tmp/ordo
mkdir -p ~/.claude/agents
rm -f ~/.claude/agents/ordo-*.md
cp /tmp/ordo/agents/*.md ~/.claude/agents/
```

For a second Claude Code account, run the last three commands again with `$CLAUDE_CONFIG_DIR/agents` in place of `~/.claude/agents`. Leave `CLAUDE_CODE_EFFORT_LEVEL` unset, since it overrides the effort each definition sets. When Claude Code lists no `ordo-<level>` agent for an effort level the plan configuration names, `spec`, `refute`, `plan-orchestration`, `diagnose` and `grill` print a warning that names the missing agent. They then start the agent on Claude Code's default agent, with no model named and no effort set. `writing`, `code-comments`, `codebase-design`, `paper`, `paper-review-panel`, `referee`, `submit` and `grant` start every agent on Claude Code's default agent with its defaults.

To change Ordo itself, with the installed skills held at a tagged version while the change is made, follow [`docs/dev/working-on-ordo.md`](docs/dev/working-on-ordo.md).

## License

MIT, see `LICENSE`, except the parts `NOTICE.md` names, which are under CC BY-NC 4.0.

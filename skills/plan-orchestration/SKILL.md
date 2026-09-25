---
name: plan-orchestration
description: "Run an open plan unattended, step by step, from its ledger folder: pick the next unblocked step, prepare its brief and worktree, dispatch one builder agent in the step's worktree, have a reviewer refute the result, send its findings back to the builder for the repair rounds plan.yaml allows, read the delta, land the step with the small fixes made at landing, book it, and repeat; stop only where a decision is the user's. Every project specific comes from .agents/plan.yaml and the ledger, so the same skill runs a code tool, a research project or a manuscript on either harness (Claude Code or Codex) with either as the worker, and one orchestrator can hand the plan to another mid-way. Triggers on: run the plan, next step, orchestrate the plan, plan orchestration, dispatch the next step, continue the plan, resume the plan."
metadata:
  version: "2.7.0"
---

# Plan orchestration

The unattended loop that runs an open plan's steps, one after another, until a pause or until nothing unblocked is left; a stop blocks only its own step. It leaves behind each landed step on main, its landing report in the ledger, and a state file that says where the plan stands.

## Quick start

```
/plan-orchestration <entry>          run the plan's steps unattended until a pause, or until nothing unblocked is left
/plan-orchestration <entry> inline   the same, with the orchestrating session building every code step itself
continue the plan                    resume from the state file, after a compaction or on another harness
```

## Use instead

| When | Use |
|---|---|
| One step by hand, stopping after each skill | `/spec`, then "build it", `/refute` and `/land`, the sequence `/plan-help` prints |
| The plan is not open yet | `/plan <entry>` |
| Where the plan stands and which command comes next | `/plan-help <entry>` |
| The repository has no `.agents/plan.yaml` | `/ordo-init` |
| What the reviews keep finding across plans | `/plan-retro` |

## What it reads

1. `.agents/plan.yaml` and the plan's ledger folder: every project specific comes from them.
2. The state file `orchestrator-state.md` first, then `plan.md`, then the tail of the transcript when there is one: the reading order after any compaction, and for a new orchestrator.
3. The dispatch block in the state file, which "Resuming, and handing the plan over" reads.
4. The builder's report, the diff since the step's base, and the refuter reports of the step.
5. For the recurring-findings pass, the refuter reports written since the last pass.
6. For the usage rows, the running session's own log, as "Usage" says.

## Steps

The loop runs over a plan that `/plan` opened. Each step goes through the same skills a person runs by hand (`/spec`, `/refute`, `/land`, with `/plan-help` printing the sequence); this skill adds what running unattended needs: picking the next step, dispatching and resuming a builder, sending a reviewer's findings back, the cadence of the review, two steps in flight, the stops, the reports and the usage table.

1. Read the inputs in the order "What it reads" gives them, and resolve a dispatch block before anything else.
2. Pick the next step that nothing blocks.
   - One at a time, unless the block sets `workers_at_once` above 1 and the next steps qualify under "Two steps in flight".
3. Invoke `/spec <entry> <step>`. It checks the premises, writes the brief, makes the worktree and writes the dispatch block.
   - A stop it raises goes to the user by "Stops". A stop, here or at any later step, blocks its own step, and the loop moves on to the next unblocked step.
4. Choose the step's executor and write it into the dispatch block, then build by that choice.
   - **Choice.** `academic-paper` for a step whose deliverable is manuscript content, always; otherwise what the invocation named (`/plan-orchestration <entry> inline` runs every code step inline); else the configuration block's `executor:`, which is `agent` by default and `inline` when the plan chose it.
   - **`agent`.** Dispatch one builder with the worktree path and the brief, by the recipe under "Launching a builder" for its harness, and the moment it is launched write its identity into the dispatch block and commit the block by path.
   - **The prompt.** It states, in its own words: the worktree and that it is the only place to work; the no-git rule; what is never touched (the ledger beyond the builder's report, the main checkout, the user's data); the reading order (the rules file, the brief, the standards); every requirement the step is judged on; the report path and shape.
   - **The builder.** It never runs a git command, and in the ledger it writes only its report, at the path the brief names in the worktree's copy of the ledger.
   - **`inline`.** The orchestrating session builds the step itself in the worktree under the brief and the rules file, and steps 5 and 8 read "the builder" as itself.
   - **`academic-paper`.** The step is built through that skill with the brief as its input, and its output is the step's report.
5. While the builder runs, do ledger work only: the next step's premise checks, the bookings, the usage table.
   - Never dispatch beyond what `workers_at_once` allows.
   - Never dispatch while the user has asked for a pause.
6. On the report, save it into the main ledger at the dispatch block's `report` path, then read the whole diff.
   - The orchestrator copies the report from where Steps 4 ("The builder") says the builder writes it.
   - A shell builder's `output` file (the `claude -p` JSON or the `codex -o` final message) holds its final message, and when the builder wrote no report file the orchestrator takes the report from it into the `report` path.
   - A native Claude agent's final message is in the runner's transcript store under the agent id in `session_id`.
   - The report is a lead, not a fact.
7. Invoke `/refute <entry> <step>` when the block's `review:` calls for it on this step (`every`; or `earned`, by "The review, earned").
   - Read the diff yourself while it runs.
   - Save its report, and write its path and its usage into the dispatch block under `reviewer_report`.
8. Send the findings back to the same builder, as a numbered list with a ruling per finding that stays inside the brief and the written rules.
   - **How.** A native Claude agent is resumed by the runner's message tool on its id. A `claude -p` or Codex worker is resumed by `templates/launch.sh` with `--resume <session_id>`, by the numbered list under "Launching a builder".
   - **The resume's options.** It keeps the launch's `--cwd`, `--model`, `--effort`, `--network`, `--note`, `--label` and `--parent`. Its prompt (the findings), output, stderr, events, exit, pid and id files are the round's own.
   - **Before the resume.** Write `round: n` and the round's paths into the dispatch block, each under its field with the `repair_` prefix (`repair_prompt`, `repair_output` and so on), and commit.
   - **Not sent back.** A finding that changes the scope, a requirement, a public shape or an established decision is raised as a stop, by "Stops".
   - **After each reply.** Read the whole delta and, when the block says `refute_after_repair: yes`, invoke `/refute <entry> <step>` again over the round, a fresh reviewer, its usage recorded beside the first.
   - **The end of the rounds.** A refutation that finds nothing, or the last round the round cap allows ("Rules"), ends the rounds, and the loop goes to step 9.
9. Invoke `/land <entry> <step>`. Its refusals are its own.
   - A red line the orchestrator cannot fix at landing takes the step back out of main and is booked with the failure: in the open items when only the user can decide what to do, in the booked list otherwise.
10. Continue with step 2.
    - The landing report is on disk at `agents/reviews/<step>-landing.md`, committed with the step, so the loop never ends its turn for a report.
    - The loop ends only at a pause or when nothing unblocked is left, and step 3 says what a stop does to the loop.
    - The final message opens as "Reports" says, then lists every step landed since the loop began with the path of each report, and the count of the booked list with the steps that carry it.

## The two tiers, and the harnesses

- Two tiers take part: the orchestrator, and the agents it starts (the builders and the reviewers).
- **Default.** The orchestrator and every agent run on Claude Opus.
- **Orchestrator.** It may also run on Claude Fable, GPT Astra or GPT Sol. It reads, decides, invokes the skills, lands and books, and never writes step code itself beyond a fix at landing, unless the step's executor is `inline`.
- **Agents.** A builder or a reviewer may also run on GPT Sol, and never runs on Claude Fable or GPT Astra.
- **Builder.** One per step, in the step's worktree, under the brief and the rules file, on the model the configuration block's `worker:` names.
- **Reviewer.** The model the configuration block's `reviewer:` names.
- **Harnesses.** The Claude models run under Claude Code, and the GPT models under Codex.
- Any allowed combination is chosen per step; a new combination is booked in the rulings with what decides it, and measured by its usage row.
- The same skill runs a code tool, a research project or a manuscript, on either harness, with either as the worker.

## Resuming, and handing the plan over

The ledger is the whole handoff. An orchestrator may stop after any step and another, on the other harness, continues from the files alone, under three rules:

- Nothing needed to continue lives only in a runner's memory, its transcript, its scratch folder or a machine-local temp file. Every decision, every ruling, every path a step depends on, every sharp edge and every usage row is in the ledger folder, committed.
- The state file is rewritten before every step commit, so main's head always carries a state file that describes main's head.
- A dispatch in flight is recorded in the state file before the builder starts, so a new orchestrator can tell whether a builder is still running, finished, or died, before it does anything.

On resumption with a dispatch block present:

- The builder is checked first, by the check its harness allows: a CLI worker has a pid file and an exit file; a native Claude agent has its id in `session_id` and the runner's own agent listing.
- A builder still running is waited for.
- A finished builder resumes at the read of its report.
- A step at `landing: cherry-picking` is checked on main (`git status`, `git diff --cached`) before anything is applied again.
- A dead builder is reported to the user with what its transcript holds.
- A fresh continuation builder takes over a dead builder's worktree when the user says so.

On every resumption, with a dispatch block or without one:

- A booking present in the working tree but not committed, with the step's files staged, is a landing interrupted before its commit, and is finished before anything else.
- After a compaction the next skill is invoked through the runner, as "Rules" says, and the compaction's summary of a skill's text never stands in for the skill.

## The review, earned

- Under `review: earned` the reviewer stage is decided per step from the ledger's rows and the diff, never from the builder's name.
- The reviewer runs on a builder's first step under this rule, and when any of the builder's last three rows did not pass the bar with at most one fix at landing.
- Whatever the record, the reviewer runs when the step's brief touches a public surface, a server module, a state layer or a wire shape.
- A failed bar puts the reviewer back for the builder's next three steps.
- The runs over the repair rounds follow `refute_after_repair`, and under `earned` they run only on a step whose first review ran.
- The rows record which branch each step took.

## The recurring-findings pass

- Every tenth landed step, and at any pause, the orchestrator reads the refuter reports written since the last pass and groups their findings by cause.
- A cause that appears in three or more steps is booked in the open items, since the user rules on it, with the smallest change that would end it: a line in the rules file, a command in the verification list, or a test in the tree.
- For a rule already written that keeps being broken, what is proposed is a check, and a sharper sentence for the rule is proposed only when no command can check it.
- The user rules on each proposal.

## Two steps in flight

With `workers_at_once` above 1 the orchestrator, still one, may have that many steps running at once, each through steps 3 to 9 on its own, under these rules:

- Each brief lists the paths its step writes, and the lists share no file.
- A step that touches shared files, a configuration file or a rule file runs alone.
- Each step has its own worktree, base, builder, reviewer, rounds and dispatch entry.
- A later step is dispatched only after the earlier one's dispatch commit, so its base holds the earlier brief and block.
- Landings are one at a time, in the order the steps are verified, and a later one lands on the head the earlier left, its whole diff read again there.
- A path both ranges changed means the later step goes back through step 6 on the new head before it lands.

## Launching a builder

Both harnesses take the same prompt. What differs is the launch, the sandbox and where the report comes back. Either orchestrator can launch either builder.

- **Claude Code builder (`claude:<model>`), from inside Claude Code.** The runner's Agent tool with `subagent_type: general-purpose` and the model named, run in the background; its completion notification carries the report. It works under the runner's own permission settings.
- **Claude Code builder, from any shell.** The same prompt through the CLI's print mode, run by this skill's `templates/launch.sh`:

```sh
sh <this skill's folder>/templates/launch.sh claude --cwd <worktree>/<tool dir> --model <model> \
    --prompt <prompt file> --report <output file> --stderr <stderr file> --exit <exit file> --pid <pid file> \
    [--resume <session id>] [--note <launch_note> --id <id file> --label <entry>/<step> --parent <session id>]
```

- **Codex builder (`codex:<model>`).** With `codex exec`, from a shell, run by `templates/launch.sh`:

```sh
sh <this skill's folder>/templates/launch.sh codex --cwd <worktree>/<tool dir> --model <model> \
    --prompt <prompt file> --report <output file> --stderr <stderr file> --exit <exit file> --pid <pid file> \
    --events <event log> --effort <worker_effort> [--network] [--resume <session id>] \
    [--note <launch_note> --id <id file> --label <entry>/<step> --parent <session id>]
```

A shell launch runs in this order:

1. Run `templates/launch.sh` from the orchestrator's shell. It removes an exit file an earlier run left, starts the builder as a detached process, writes the pid file and returns at once.
   - Every path given to `templates/launch.sh` is absolute, so it names the same file from the orchestrator's shell, from the builder's `--cwd` and from a later resumption.
   - Every path the launch takes goes into the dispatch block under its field: `prompt`, `output` (the `--report` path), `stderr`, `events`, `exit`, `pid` and `note_id_file`, with the `repair_` prefix for a repair round.
   - None of these paths lies in a scratch folder or a machine-local temp directory, since "Resuming, and handing the plan over" needs them to continue.
   - With the configuration block's `launch_note` set, pass the note options: `--id` names the file that receives the note's id, `--label` is `<entry>/<step>`, and `--parent` is the orchestrating session's id.
   - Under Claude Code the orchestrating session's id is its session log's file name without `.jsonl`, and under Codex it is the rollout's session id. "Usage" says where each log is.
   - Without a `launch_note`, the note options are left out.
2. Write the builder's identity into the dispatch block and commit it, as item 4 of "Steps" says. A shell builder's identity is its pid file and, once it is known, its session id in `session_id`.
   - For a `claude -p` builder, the orchestrator reads it from the file name of the builder's transcript (item 3), or from the `session_id` field of the JSON output once the builder exits.
   - The event log of a Codex builder carries it as the `thread_id` of its `thread.started` event.
3. Once the builder's transcript path is known, pass it to the note with `sh <this skill's folder>/templates/launch.sh transcript --note <launch_note> --id <id file> <path>`. A plan whose `launch_note` is empty skips this item.
   - Under the runner's projects folder, in the folder named after the builder's `--cwd`, a `claude -p` builder writes its transcript as `<session id>.jsonl` from the moment it starts. A resumed run writes to the same file.
   - The rollout under `~/.codex/sessions/` whose name ends with the session id is the transcript of a Codex builder.
4. Watch the exit file with a monitor. `templates/launch.sh` writes the builder's exit code to it as `exit <code>`.

- A first Codex run is `codex exec -C <cwd> -s workspace-write`: `-C` is the working root and `-s workspace-write` confines writes to it.
- `codex exec resume` takes neither flag, so `templates/launch.sh` runs a resumed Codex builder inside `--cwd` and sets its sandbox with `-c sandbox_mode="workspace-write"`.
- `--network` is passed whenever the verification commands bind a port.
- `-o` writes the final message, and `--json` streams the event log whose last `turn.completed` event carries the usage.
- The session is not run with `--ephemeral`, so the rollout under `~/.codex/sessions/` is the builder's transcript.
- A runner's shell tool caps a command at ten minutes and a step takes longer, so `templates/launch.sh` detaches the builder and a monitor watches the exit file.
- The launch note is a record only. `templates/launch.sh` ignores a note call that fails, and `templates/launch-note.md` gives the note command's interface.
- Codex project settings live in `<repo>/.codex/config.toml` and its command rules in `<repo>/.codex/rules/`; the orchestrator never edits a user-level file.

## What earns a step of its own

- A step is a large thing: a new capability, or a defect too nasty or too wide to close where it was found.
- Everything else is closed in the step that is open: a finding inside a brief by the repair rounds, a finding beyond it at the landing that raised it, a fix in a file another step holds at that step's landing.
- A step's path list is a choice, not a fact: widen it rather than mint a step for what the open step exists to end.
- A report that asks for a step says what makes the work new, or nasty, or blocked by something in flight.

## Reports

- The orchestrator's reports and the landing report open with a position line: the roadmap entry with its title, the plan step being worked as "step n of m" with its name, and the next step, in the form "Roadmap entry <n> (<title>). Plan step <k> of <m>: <step name>. Next: step <k+1>, <step name>."
- A builder's report keeps the shape of the repository's change standard.
- The state file's open items follow the position line, verbatim.
- The open items hold only what the user must rule on: a stop, and a proposal of the recurring-findings pass.
- A finding that needs no ruling is not an open item; it is a step in the plan, carried in the state file's booked list, and a report names that list's count and the steps on it rather than its lines.
- A third list, the closed one, is the log of what was raised and how it ended, and no report carries it.
- Then anything NOT DONE first, then the DONE / NOT DONE ledger naming the command that proves each row.

## Usage

- Per step, one row in the state file's table: the builder's harness, model and effort, tokens, tool uses, wall time; the reviewer the same, and each run over a repair round the same; the fix rounds; the findings sent back; the lines added and removed; whether the first report passed its bar; the fixes at landing; the orchestrator's own row.
- Tokens and lines say what a step cost; the last four say what it was worth, and a change to the process, the harness or the model is judged on both.
- The orchestrator's row per step is its messages, output tokens, cache-write tokens, cache-read tokens, fresh input tokens and minutes, from the previous landing commit to this step's booking.
- `/land` produces it at its step 8 with the land skill's `templates/usage.py <session log> <from> <to>`: `<from>` is `git log -1 --format=%cI` on the previous landing commit, `<to>` is `date -Iseconds` at the booking, and the session log is the running session's own.
- Under Claude Code the session log is the newest `~/.claude/projects/<slug>/<session>.jsonl`, whose assistant lines carry `message.usage` and a timestamp, one message counted once by its id.
- Under Codex it is the newest rollout under `~/.codex/sessions/`, whose `token_count` events carry the cumulative `total_token_usage`, the row being the difference across the window.
- Work on other steps inside the same window (the next brief, another step's review read) is not separated, and the row says what it shares.

## The pace when a deadline is set

When the user sets a time by which no agent may run, the loop keeps a night rule and writes it into the state file:

- A builder is dispatched only while the longest step so far still fits before the cut-off, and a reviewer or a fix round only while its usual length fits.
- At the cut-off anything still running is stopped, its worktree kept, the state file rewritten with what was in flight, and the plan paused.
- A one-shot wake-up at the cut-off does the stopping when the runner offers one.

## Stops

A stop is for a decision that is the user's, of one of six kinds:

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| A shape nobody named | A user-visible shape nothing names | The stop message, below | The user's ruling |
| A wrong premise | A premise found wrong that the plan cannot absorb | The stop message, below | The user's ruling |
| A red check | A red check no fix within the plan covers | The stop message, below | The user's ruling |
| A rule clash | A contradiction between two established rules | The stop message, below | The user's ruling |
| A finding that is the user's | A finding that changes the scope, a requirement, a public shape or an established decision | The stop message, below | The user's ruling |
| The roadmap diff | The closing step's `/roadmap done`, which shows its diff of the roadmap | The diff, in the stop message | The user's approval of the diff |

- Fixing a defect in what the user asked for is never a stop, whatever the fix makes visible.
- A stop is booked in the state file's open items the moment it is raised.
- A stop is repeated in every report until the user has ruled.
- The stop message is plain text in the report: an open item with its options inside the written rules, the pros and cons of each, and one recommendation with its reasons. It never goes through a question-box or multiple-choice tool.
- A pause the user asks for holds until they lift it.

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Relaunching a dead builder silently | Its partial work and its transcript are lost without the user knowing | Report it with what its transcript holds; a continuation builder takes over the worktree when the user says so |
| Sending a finding that changes the scope, a requirement, a public shape or an established decision back to the builder | The builder then takes a decision that is the user's | Raise it as a stop |
| Handing a miss inside a brief back as a gap in a report | The work the user asked for is left undone | Close it in the repair rounds or at landing, or book it as its own step in the booked list |
| Minting a step because the work is inconvenient now | The open step does not end what it exists to end | Widen the open step's path list; see "What earns a step of its own" |
| An option that breaks a written rule, in a stop | The user is asked to weigh something that is not allowed | Leave it out; do not mention it |
| Rewriting a rule that keeps being broken when a command can check it | The same words fail the same way | Propose a check for it, which the user rules on, as "The recurring-findings pass" says |
| Changing the rules file without the user's ruling | The builders then work under rules the user did not set | Book the proposal in the open items and wait for the ruling |
| Narrating wrong turns taken and backed out | The report no longer says what is true now | State the end state |
| Stating a measurement not taken | The number is a guess presented as a fact | Name the command behind each number, or leave the number out |
| Presenting partial work as complete | The user acts on work that is not there | Put anything NOT DONE first |
| Offering the user another repair round beyond the cap | The cap is a rule the user's yes does not extend, and the extra round only moves work that belongs in a new step | Land the step with its small fixes and book the rest as steps, as the round cap and the two bullets after it in "Rules" say |

## Rules

- The skill carries no project name, since that is in `.agents/plan.yaml` and the ledger, and the models it names are those in "The two tiers, and the harnesses".
- A fix of a defect in delivered work needs no yes.
- The round cap: a step gets at most `repair_rounds` repair rounds, and one more only when the delta leaves a verification command red or an acceptance item of the brief unbuilt and the fix is too large for landing. A new finding of a review never earns that round, and the user's yes never extends the cap.
- After its last round a step lands, and its small findings, the last review's included, are fixed at landing.
- Everything else that the rounds left undone, or that lies beyond the brief, is booked as its own step in the plan and carried in the state file's booked list, never sent back to the builder.
- Every skill the loop invokes (`/spec`, `/refute`, `/land`, `academic-paper` for manuscript content, and `/roadmap` at the closing) is invoked through the runner every time, after a compaction too, and never carried out from remembered text.

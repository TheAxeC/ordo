---
name: plan-orchestration
description: "Run an open plan unattended, step by step, from its ledger folder: pick the next unblocked step, invoke /spec, dispatch one builder agent in the step's worktree, invoke /refute, send its findings back to the builder for the repair rounds plan.yaml allows, read the delta, invoke /land with the small fixes made there, book the step, and repeat; stop only where a decision is the user's. Every project specific comes from .agents/plan.yaml and the ledger, so the same skill runs a code tool, a research project or a manuscript on either harness (Claude Code or Codex) with either as the worker, and one orchestrator can hand the plan to another mid-way. Triggers on: run the plan, next step, orchestrate the plan, plan orchestration, dispatch the next step, continue the plan, resume the plan."
metadata:
  version: "2.6.0"
---

# Plan orchestration

The unattended loop over a plan that `/plan` opened. Each step runs through the same four skills a person runs by hand (`/spec`, `/refute`, `/land`, with `/plan-help` printing the sequence); this skill adds what running unattended needs: picking the next step, dispatching and resuming a builder agent, sending a reviewer's findings back, the cadence of the review, two steps in flight, the stops, the reports and the usage table. It carries no project name and no vendor name; those are in `.agents/plan.yaml` and the ledger.

## The two tiers, and the harnesses

Two tiers of model take part, and neither tier is tied to one vendor. The orchestrator runs on a top-tier model (Claude Fable under Claude Code, or GPT Astra under Codex): it reads, decides, invokes the skills, lands and books, and never writes step code itself beyond a fix at landing, unless the block's `executor:` is `inline`. The builder runs on the working tier (Claude Opus under Claude Code, or GPT Sol under Codex), one per step, in the step's worktree, under the brief and the rules file. The reviewer is whatever the configuration block's `reviewer:` names. Any combination is allowed and is chosen per step; a new combination is booked in the rulings with what decides it and measured by its usage row.

## Handing the plan from one orchestrator to another

The ledger is the whole handoff. An orchestrator may stop after any step and another, on the other harness, continues from the files alone, under three rules:

- Nothing needed to continue lives only in a runner's memory, its transcript, its scratch folder or a machine-local temp file. Every decision, every ruling, every path a step depends on, every sharp edge and every usage row is in the ledger folder, committed.
- The state file is rewritten before every step commit, so main's head always carries a state file that describes main's head.
- A dispatch in flight is recorded in the state file before the builder starts, so a new orchestrator can tell whether a builder is still running, finished, or died, before it does anything.

Reading order after any compaction or by a new orchestrator: the state file, then `plan.md`, then the tail of the transcript when there is one. On resumption with a dispatch block present: the builder is checked first by the check its harness allows (a CLI worker has a pid file and an exit file; a native Claude agent has its id in `session_id` and the runner's own agent listing). A builder still running is waited for; a finished one resumes at the read of its report; a step at `landing: cherry-picking` is checked on main (`git status`, `git diff --cached`) before anything is applied again; a dead builder is reported to the user with what its transcript holds, and a fresh continuation builder takes over its worktree when the user says so, never a silent relaunch. A booking present in the working tree but not committed, with the step's files staged, is a landing interrupted before its commit and is finished before anything else.

## The loop, one step at a time

1. Read the state file, then `plan.md`, then the transcript's tail. Resolve a dispatch block first (above).
2. Pick the next step that nothing blocks. One at a time, unless the block sets `workers_at_once` above 1 and the next steps qualify under "Two steps in flight".
3. Invoke `/spec <entry> <step>`. It checks the premises, writes the brief, makes the worktree, writes the dispatch block. A stop it raises goes to the user by the Stops section, and the loop moves to the next unblocked step or pauses.
4. Choose the step's executor and write it into the dispatch block: `academic-paper` for a step whose deliverable is manuscript content, always; otherwise what the invocation named (`/plan-orchestration <entry> inline` runs every code step inline), else the configuration block's `executor:` default. Then, by that choice. `agent`: dispatch one builder with the worktree path and the brief, by the recipe under "Launching a builder" for its harness, and the moment it is launched write its identity into the dispatch block and commit the block by path. The prompt states, in its own words, the worktree and that it is the only place to work, the no-git rule, what is never touched (the ledger, the main checkout, the user's data), the reading order (the rules file, the brief, the standards), every requirement the step is judged on, and the report path and shape. The builder never runs a git command and never writes into the ledger. `inline`: the orchestrating session builds the step itself in the worktree under the brief and the rules file, and steps 5 and 8 read "the builder" as itself. `academic-paper`: the step is built through that skill with the brief as its input, and its output is the step's report.
5. While it runs, do ledger work only: the next step's premise checks, the bookings, the usage table. Never dispatch beyond what `workers_at_once` allows, and never dispatch while the user has asked for a pause.
6. On the report: save it at the path the dispatch block names when the builder could not write it there (a Claude agent's final message is in the runner's transcript store under the agent id in `session_id`), then read the whole diff. The report is a lead, not a fact.
7. Invoke `/refute <entry> <step>` when the block's `review:` calls for it on this step (`every`; or `earned`, by the section below). Read the diff yourself while it runs. Save its report and record its usage.
8. Send the findings back to the same builder (a native Claude agent by the runner's message tool on its id; a Codex worker by `codex exec resume <session_id>` with the flags of its launch, from inside the worktree, detached the same way; a `claude -p` worker by `claude -p --resume <session_id>`), as a numbered list with a ruling per finding that stays inside the brief and the written rules. Before the resume, write `round: n` and the round's paths into the dispatch block and commit. A finding that would change the scope, a requirement, a public shape or an established decision is not sent back: it is a stop. The block's `repair_rounds` caps the rounds per step. After each reply the orchestrator reads the whole delta and, when the block says `refute_after_repair: yes`, invokes `/refute <entry> <step>` again over the round (a fresh reviewer, its usage recorded beside the first); a refutation that finds nothing, or the cap, ends the rounds, and it goes to step 9: it fixes the small things at landing, the last run's findings included, and anything the round left undone or that lies beyond the brief is booked as its own step in the plan and carried in the state file's booked list, never sent back to the builder. One exception allows one round beyond the cap: the delta leaves a verification command red or an acceptance item of the brief unbuilt, and the fix is too large to make at landing. Both are inside the brief. A new finding of a review never earns that round; it goes to the booked list as its own step.
9. Invoke `/land <entry> <step>`. Its refusals are its own; a red line the orchestrator cannot fix at landing takes the step back out of main and is booked with the failure: in the open items when only the user can decide what to do, in the booked list otherwise.
10. Continue with step 2. The landing report is on disk at `agents/reviews/<step>-landing.md`, committed with the step, so the loop never ends its turn for a report; it ends only at a stop, at a pause, or when nothing unblocked is left, and that final message lists every step landed since the loop began with the path of each report, the open items verbatim, and the count of the booked list with the steps that carry it.

## The review, earned

Under `review: earned` the reviewer stage is decided per step from the ledger's rows and the diff, never from the builder's name. The reviewer runs on a builder's first step under this rule, when any of the builder's last three rows did not pass the bar with at most one fix at landing, and, whatever the record, when the step's brief touches a public surface, a server module, a state layer or a wire shape; a failed bar puts the reviewer back for the builder's next three steps. The runs over the repair rounds follow `refute_after_repair`, and under `earned` they run only on a step whose first review ran. The rows record which branch each step took.

## The recurring-findings pass

Every tenth landed step, and at any pause, the orchestrator reads the refuter reports written since the last pass and groups their findings by cause. A cause that appears in three or more steps is booked in the open items, which is where it belongs because the user rules on it, with the smallest change that would end it: a line in the rules file, a command in the verification list, or a test in the tree. A rule already written that keeps being broken is not rewritten; what is proposed for it is a check. The user rules on each proposal, and nothing in the rules file changes without that ruling.

## Two steps in flight

With `workers_at_once` above 1 the orchestrator, still one, may have that many steps running at once, each through steps 3 to 9 on its own, under these rules: each brief lists the paths its step writes and the lists share no file (a step that touches shared files, a configuration file or a rule file runs alone); each step has its own worktree, base, builder, reviewer, rounds and dispatch entry; a later step is dispatched only after the earlier one's dispatch commit, so its base holds the earlier brief and block; landings are one at a time, in the order the steps are verified, and a later one lands on the head the earlier left, its whole diff read again there; a path both ranges changed means the later step goes back through step 6 on the new head before it lands.

## Launching a builder

Both harnesses take the same prompt. What differs is the launch, the sandbox and where the report comes back. Either orchestrator can launch either builder.

**Claude Code builder (`claude:<model>`), from inside Claude Code.** The runner's Agent tool with `subagent_type: general-purpose` and the model named, run in the background; its completion notification carries the report. It works under the runner's own permission settings.

**Claude Code builder, from any shell.** The same prompt through the CLI's print mode, detached:

```sh
nohup sh -c 'cd <worktree>/<tool dir> && claude -p --model <model> --permission-mode acceptEdits \
    --output-format json < <prompt file> > <report file> 2> <stderr file>; echo "exit $?" > <exit file>' &
echo $! > <pid file>
```

**Codex builder (`codex:<model>`).** With `codex exec`, from a shell, detached from the runner's command timeout:

```sh
nohup sh -c 'codex exec -C <worktree>/<tool dir> -s workspace-write \
    -c "sandbox_workspace_write.network_access=true" -c "model_reasoning_effort=\"<worker_effort>\"" -m <model> \
    -o <report file> --json - < <prompt file> > <event log> 2> <stderr file>; echo "exit $?" > <exit file>' &
echo $! > <pid file>
```

`-C` is the working root and `-s workspace-write` confines writes to it; the network setting is passed whenever the verification commands bind a port; `-o` writes the final message and `--json` streams the event log whose last `turn.completed` event carries the usage. The session is not run with `--ephemeral`, so the rollout under `~/.codex/sessions/` is the builder's transcript. A runner's shell tool caps a command at ten minutes and a step takes longer, so the launch is detached and a monitor watches the exit file. Codex project settings live in `<repo>/.codex/config.toml` and its command rules in `<repo>/.codex/rules/`; the orchestrator never edits a user-level file.

## What earns a step of its own

A step is a large thing: a new capability, or a defect too nasty or too wide to close where it was found. Everything else is closed in the step that is open: a finding inside a brief by the repair round, a finding beyond it at the landing that raised it, a fix in a file another step holds at that step's landing. A step's path list is a choice, not a fact: widen it rather than mint a step for what the open step exists to end. Work is never given a step because it is inconvenient now, and a report that asks for one says what makes the work new, or nasty, or blocked by something in flight.

## Stops

A stop is for a decision that is the user's: a user-visible shape nothing names, a premise found wrong that the plan cannot absorb, a red check no fix within the plan covers, a contradiction between two established rules. Fixing a defect in what the user asked for is never a stop and needs no yes, whatever the fix makes visible. Binding on every orchestrator: a miss inside a brief is closed by the builder's one repair round or at landing, or booked as its own step in the booked list, never handed back as a gap in a report; a fix of a defect in delivered work needs no yes; a stop is booked in the state file's open items the moment it is raised and repeated in every report until the user has ruled. The turn ends only when nothing unblocked is left, or when the user has asked for a pause, which holds until they lift it. A stop goes to the user in one message with the options inside the written rules and one recommendation with its reasons; an option that breaks a written rule is not an option and is not mentioned.

## Reports

Every report opens with the state file's open items, verbatim, and the open items hold only what the user must rule on: a stop, and a proposal of the recurring-findings pass. A finding that needs no ruling is not an open item; it is a step in the plan, carried in the state file's booked list, and a report names that list's count and the steps on it rather than its lines. A third list, the closed one, is the log of what was raised and how it ended, and no report carries it. Then anything NOT DONE first, then the DONE / NOT DONE ledger naming the command that proves each row. No narration of wrong turns taken and backed out. No measurement stated that was not taken. Partial work is never presented as complete.

## Usage

Per step, one row in the state file's table: the builder's harness, model and effort, tokens, tool uses, wall time; the reviewer the same, and each run over a repair round the same; the fix rounds; the findings sent back; the lines added and removed; whether the first report passed its bar; the fixes at landing; the orchestrator's own row. Tokens and lines say what a step cost; the last four say what it was worth, and a change to the process, the harness or the model is judged on both.

The orchestrator's row per step is its messages, output tokens, cache-write tokens, cache-read tokens, fresh input tokens and minutes, from the previous landing commit to this step's booking. `/land` produces it at its step 8 with `.agents/skills/land/templates/usage.py <session log> <from> <to>`: `<from>` is `git log -1 --format=%cI` on the previous landing commit, `<to>` is `date -Iseconds` at the booking, and the session log is the running session's own. Under Claude Code that is the newest `~/.claude/projects/<slug>/<session>.jsonl`, whose assistant lines carry `message.usage` and a timestamp, one message counted once by its id; under Codex it is the newest rollout under `~/.codex/sessions/`, whose `token_count` events carry the cumulative `total_token_usage`, the row being the difference across the window. Work on other steps inside the same window (the next brief, another step's review read) is not separated, and the row says what it shares.

## The pace when a deadline is set

When the user sets a time by which no agent may run, the loop keeps a night rule and writes it into the state file: a builder is dispatched only while the longest step so far still fits before the cut-off, a reviewer or a fix round only while its usual length fits, and at the cut-off anything still running is stopped, its worktree kept, the state file rewritten with what was in flight, and the plan paused. A one-shot wake-up at the cut-off does the stopping when the runner offers one.

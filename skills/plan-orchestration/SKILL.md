---
name: plan-orchestration
description: "Run an open plan unattended, step by step, from its ledger folder: pick the next unblocked step, prepare its brief and worktree, dispatch one builder agent in the step's worktree, have a reviewer refute the result, send its findings back to the builder for the repair rounds plan.yaml allows, read the delta, land the step with the small fixes made at landing, book it, and repeat; stop only where a decision is the user's. Every project specific comes from .agents/plan.yaml and the ledger, so the same skill runs a code tool, a research project or a manuscript under Claude Code, and one orchestrator session can hand the plan to another mid-way. Triggers on: run the plan, next step, orchestrate the plan, plan orchestration, dispatch the next step, continue the plan, resume the plan."
metadata:
  version: "2.10.1"
---

# Plan orchestration

The unattended loop that runs an open plan's steps, one after another, until a pause or until nothing unblocked is left; a stop blocks only its own step. It leaves behind each landed step on main, its landing report in the ledger, and a state file that says where the plan stands.

## Quick start

```
/plan-orchestration <entry>          run the plan's steps unattended until a pause, or until nothing unblocked is left
/plan-orchestration <entry> inline   the same, with the orchestrating session building every code step itself
continue the plan                    resume from the state file, after a compaction or in another session
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

## Steps

The loop runs over a plan that `/plan` opened. Each step goes through the same skills a person runs by hand (`/spec`, `/refute`, `/land`, with `/plan-help` printing the sequence); this skill adds what running unattended needs: picking the next step, dispatching and resuming a builder, sending a reviewer's findings back, the cadence of the review, two steps in flight, the stops and the reports.

1. Read the inputs in the order "What it reads" gives them.
   - Resolve a dispatch block before anything else.
   - Before any dispatch, check that the runner lists the effort agents `ordo-<worker_effort>` and `ordo-<reviewer_effort>` among its agent types, each level `high` when the configuration block has no such key.
   - Before any dispatch, check that `CLAUDE_CODE_EFFORT_LEVEL` is unset: `printenv CLAUDE_CODE_EFFORT_LEVEL` exits 1.
   - Either check failing is the refusal "The configured effort cannot apply" ("Stops"), and the loop dispatches nothing.
2. Pick the next step that nothing blocks.
   - One at a time, unless the block sets `workers_at_once` above 1 and the next steps qualify under "Two steps in flight".
3. Invoke `/spec <entry> <step>`. It checks the premises, writes the brief, runs the brief check before the preparation commit (the `spec` skill's "Steps / The brief check"), makes the worktree and writes the dispatch block.
   - Before dispatching the builder, read the brief check's report and the changes to the brief its "Closed" heading names.
   - A stop it raises goes to the user by "Stops".
   - A stop, here or at any later step, blocks its own step.
     - The loop moves on to the next unblocked step.
   - Its refusal of a step without the user's authority (the `spec` skill's Steps 1) is raised as a stop of the kind "A finding that is the user's", since only the user's ruling adds a step to the plan.
4. Choose the step's executor.
   - Write it into the dispatch block.
   - Then build by that choice.
   - **Choice.** `academic-paper` for a step whose deliverable is manuscript content, always; otherwise what the invocation named (`/plan-orchestration <entry> inline` runs every code step inline); else the configuration block's `executor:`, which is `agent` by default and `inline` when the plan chose it.
   - **`agent`.** Dispatch one builder with the worktree path and the brief, by the recipe under "Launching a builder".
     - The moment it is launched, write its agent id into the dispatch block under `session_id`.
   - **The launch commit.** Under every executor, the dispatch entry is committed once its builder's identity is in it, and the commit is a resume point.
     - Under `agent` it comes right after the launch and the model check of "Launching a builder", since the builder's agent id exists only once it is launched; under `inline` and `academic-paper` it comes before the build starts.
     - The paths are the state file and the session's own records since the last resume point, named in `git add -- <path> ...`.
   - **The prompt.** It states, in its own words: the worktree and that it is the only place to work; the no-git rule; what is never touched (the ledger beyond the builder's report, the main checkout, the user's data); the reading order (the rules file, the brief, the standards); every requirement the step is judged on; that the step's verify list runs through the `land` skill's `templates/checks.sh <state file>` from the root of the checkout it checks, and that the lines it prints are what the report quotes; the report path and shape.
   - **The builder.** It never runs a git command.
     - In the ledger it writes only its report, at the path the brief names in the worktree's copy of the ledger.
   - **`inline`.** The orchestrating session writes `inline` as the builder's identity under `session_id`.
     - It makes the launch commit.
     - It then builds the step itself in the worktree under the brief and the rules file. Steps 5 and 8 read "the builder" as itself.
   - **`academic-paper`.** The session writes `academic-paper` as the builder's identity under `session_id`.
     - It makes the launch commit.
     - The step is then built through that skill with the brief as its input.
     - That skill's output is the step's report.
5. While the builder runs, do ledger work only: the next step's premise checks, the bookings.
   - Never dispatch beyond what `workers_at_once` allows.
   - Never dispatch while the user has asked for a pause.
6. On the report, save it into the main ledger at the dispatch block's `report` path, on disk and not committed on its own.
   - Then read the whole diff.
   - The orchestrator copies the report from where Steps 4 ("The builder") says the builder writes it.
   - The builder's completion notification carries its final message. When the builder wrote no report file, the orchestrator takes the report from that message into the `report` path.
   - The orchestrator writes the builder's tokens, tool uses and time, from its completion notice, into the dispatch block under `builder_usage`, beside `report`, on disk; the next resume-point commit carries them.
   - The report is a lead, not a fact.
   - A builder whose first run of the brief's "Cases" finds a case the brief's rules get wrong stops before changing any code and hands back the first run and that case, with the rule and the result.
     - Read that hand-back the same way as a report.
   - Rule on such a case when the fix stays inside the step's scope.
     - Write the ruling into the ledger as the round-0 ruling file `agents/briefs/<step>-cases.md`.
     - Commit it by path as a round sent.
   - Then resume the same builder with it, by Steps 8's "How" and "Before the resume" with `round: 0`.
     - The builder's final report carries the ruling.
   - Such a case whose fix changes the step's scope is a stop of the kind "A finding that is the user's", by "Stops".
7. Invoke `/refute <entry> <step>` when the block's `review:` calls for it on this step (`every`; or `earned`, by "The review, earned").
   - Read the diff yourself while it runs.
   - Save its report.
     - Write its path, with the reviewer's served model and its tokens, tool uses and time from its completion notice, into the dispatch block under `reviewer_report`, on disk; the next resume-point commit carries them.
8. Send the findings back to the same builder, as a numbered list with a ruling per finding that stays inside the brief and the written rules.
   - **How.** The builder is resumed by the runner's message tool on its agent id in `session_id`, the numbered list as the message.
   - **Before the resume.** Write `round: n` into the dispatch block.
     - Commit it by path with the round's brief and the session's own records since the last resume point. The commit is a resume point.
   - **Only known fixes.** Each ruling says what to change.
     - A finding whose cause is not known (a failure that does not reproduce, a slow case, a fault seen once) is diagnosed by the orchestrator, read-only, before the round is sent.
     - The round carries the found cause's fix.
     - A cause not found is not sent.
     - Such a cause is noted at landing.
     - Such a cause is raised to the user as an open item, by "Stops".
     - A round never asks the builder to find a cause, to reproduce a fault, or to measure until a condition holds.
   - **Not sent back.** A finding that changes the scope, a requirement, a public shape or an established decision is raised as a stop, by "Stops".
   - **After each reply.** Read the whole delta.
     - Add the builder's tokens, tool uses and time for the round, from its completion notice, to `builder_usage` in the dispatch block, on disk.
     - When the block says `refute_after_repair: yes`, invoke `/refute <entry> <step>` again over the round, a fresh reviewer, its path and its usage recorded under `reviewer_report` beside the first.
   - **The end of the rounds.** A refutation that finds nothing, or the last round the round cap allows ("Rules"), ends the rounds, and the loop goes to step 9.
9. Invoke `/land <entry> <step>`. Its refusals are its own.
   - A red line the orchestrator cannot fix at landing takes the step back out of main.
     - Its failure is recorded in the step's Step 0 in `plan.md`.
   - The step keeps its line and its tag.
     - It is worked again as that step, with no new ruling.
   - The failure goes to the user as an open item only when only the user can decide what to do, by "Stops".
   - `/spec` then saves the step's work as a patch and prepares it again from main's head. The `spec` skill's "Steps / A step taken back out of main" says how.
10. Continue with step 2.
    - The landing report is on disk at `agents/reviews/<step>-landing.md`, committed with the step, so the loop never ends its turn for a report.
    - The loop ends only at a pause or when nothing unblocked is left, and step 3 says what a stop does to the loop.
    - The final message opens as "Reports" says.
      - It then lists every step landed since the loop began with the path of each report, and the open items.

## The two tiers, and the models

- Two tiers take part: the orchestrator, and the agents it starts (the builders, the reviewers and the brief-check agents).
- **Default.** The orchestrator and every agent run on Claude Opus.
- **Orchestrator.** It may also run on Claude Fable.
  - It reads, decides, invokes the skills, lands and books.
  - It never writes step code itself beyond a fix at landing, unless the step's executor is `inline`.
- **Agents.** A builder, a reviewer or a brief-check agent runs on a Claude model, and never on Claude Fable.
- **Builder.** One per step, in the step's worktree, under the brief and the rules file, on the model the configuration block's `worker:` names, at the effort `worker_effort` names, launched as "Launching a builder" says.
- **Reviewer.** The model the configuration block's `reviewer:` names, at the effort `reviewer_effort` names, launched as the `refute` and `spec` skills say.
- **Brief-check agent.** One per `/spec` run that reaches the `spec` skill's "Steps / The brief check", read-only, on the reviewer's model, at the effort `reviewer_effort` names, launched as the `refute` and `spec` skills say.
- **Runner.** Both tiers run under Claude Code.
- Any allowed combination is chosen per step.
- A new combination is booked in the rulings with what decides it.
  - It is measured by the landing reports of the steps it ran: each agent's tokens, tool uses and time, whether the first report passed its bar, and the fixes at landing.
- The same skill runs a code tool, a research project or a manuscript.

## Resuming, and handing the plan over

The ledger is the whole handoff. An orchestrator may stop after any step, and another Claude Code session continues from the files alone, under these rules:

- Nothing needed to continue lives only in a runner's memory, its transcript, its scratch folder or a machine-local temp file. Every decision, ruling, path a step depends on, sharp edge and landing report is in the ledger folder of the main checkout.
- A step's commits are only the points another session resumes from. They are a stop (its open item and Step 0), the preparation commit, and the dispatch entry once the builder's identity is in it. They are also a repair round sent (its round brief and the round's entry), a step taken back out of main at its landing (its entry and Step 0), the landing, and a handover.
- Every other ledger record is written to disk in the main checkout. Such records are a builder's report saved, the builder's usage under `builder_usage`, a refuter report saved, a reviewer recorded and a ruling booked.
  - It is carried by the next of those commits.
- A resume-point commit holds only the paths the session itself wrote since the last one.
  - Each is named in the `git add -- <path> ...` command.
- A ledger change the session did not make is listed by path.
  - It is left alone.
  - One on `plan.md` or the state file is a refusal of `/spec` (the `spec` skill's Steps 1).
- A record not yet committed is on disk in the main checkout. A session taking over reads the ledger in the working tree as well as at main's head.
- Handing the plan over is a resume point. A session that stops, for a handover, a pause or a stop, first commits by path the records it wrote since the last resume point.
- So a session taking over finds no uncommitted record of the session before it.
  - A ledger change it did not make is listed, as the bullets above say.
    - It is left alone, as the bullets above say.
- The state file is rewritten before every step commit, so main's head always carries a state file that describes main's head.
- A dispatch in flight is recorded in the state file before the builder starts, so a new orchestrator can tell whether a builder is still running, finished, or died, before it does anything.

On resumption with a dispatch block present:

- The builder is checked first, in the runner's own agent listing, by its agent id in `session_id`.
- A builder still running is waited for.
- A finished builder resumes at the read of its report.
- A step at `landing: cherry-picking` is checked on main (`git status`, `git diff --cached`) before anything is applied again.
- A step at `landing: backed-out` was taken back out of main by a red line at its landing.
  - Its worktree and its branches are kept.
  - It stays unticked in `plan.md`.
  - It is worked again as that step, its line keeping its tag, with no new ruling.
  - Its failure is in its Step 0 in `plan.md`.
- `/spec` of such a step saves its work as a patch and prepares it again from main's head. The `spec` skill's "Steps / A step taken back out of main" says how.
- A builder is dead when the runner's agent listing no longer shows it and no completion notification with a report arrived.
- A builder is also dead when a later session does not find its agent id in its own listing and no report is at the dispatch block's `report` path in the worktree.
- A dead builder is reported to the user with the worktree's `git status --short` and the builder's last message when there is one.
- A fresh continuation builder takes over a dead builder's worktree when the user says so.

On every resumption, with a dispatch block or without one:

- A booking present in the working tree but not committed, with the step's files staged, is a landing interrupted before its commit, and is finished before anything else.
- A landed step whose worktree or branches are still there is named by its open item (the `land` skill's Stops row "A worktree that cannot be removed"). The removal is run from that open item, on the worktree and branches it names, each only when it still exists.
  - The open item is then closed.
- After a compaction the next skill is invoked through the runner, as "Rules" says, and the compaction's summary of a skill's text never stands in for the skill.

## The review, earned

- Under `review: earned` the reviewer stage is decided per step from the landing reports of the builder's earlier steps and the diff, never from the builder's name.
- The reviewer runs on a builder's first step under this rule, and when any of the builder's last three landing reports shows a first report that did not pass the bar with at most one fix at landing.
- Whatever the record, the reviewer runs when the step's brief touches a public surface, a server module, a state layer or a wire shape.
- A failed bar puts the reviewer back for the builder's next three steps.
- The runs over the repair rounds follow `refute_after_repair`, and under `earned` they run only on a step whose first review ran.
- The landing report records which branch each step took.

## The recurring-findings pass

- Every tenth landed step, and at any pause, the orchestrator reads the refuter reports written since the last pass and groups their findings by cause.
- A cause that appears in three or more steps is booked in the open items, since the user rules on it, with the smallest change that would end it: a rule sentence in the rules file, or a change to the text that should have prevented it (a brief's wording, a skill's step, a standards page).
- For a rule already written that keeps being broken, what is proposed is a sharper sentence for the rule or a change to the text that should have prevented it.
- A check (a command in the verification list, or a script) is proposed under these limits:
  - It is proposed only for a fact a machine computes.
  - It comes after the rule sentence or the text change.
  - The proposal states what it computes.
  - The user approves what it computes before it is written.
- The user rules on each proposal.

## Two steps in flight

With `workers_at_once` above 1 the orchestrator, still one, may have that many steps running at once, each through steps 3 to 9 on its own, under these rules:

- Whether two steps can run at once is decided by how simply the second one's change lands on the first's, not by their paths alone.
- For each pair the orchestrator states what each changes in code the other reads or changes, and how the later landing takes it: nothing to merge, a mechanical rerun (a converter, a formatter, a generator), a hand merge of named functions, or a dependency that forces an order.
- A pair whose later landing needs more than a mechanical rerun or a hand merge of a few named functions runs in sequence.
- Each brief lists the paths its step writes under "Paths this step writes".
  - `/spec` compares the list with the briefs of the steps in flight by reading them (the `spec` skill's Steps 5).
- Two steps in flight may name the same file if and only if the orchestrator judges that merging them at landing is simple.
  - The orchestrator writes that judgment in the later step's dispatch entry as `shared_paths:`, naming each shared file and why the merge is simple; with no shared file the key is left out.
- When the merge is not simple, the later step waits until the earlier one lands. No script checks the judgment.
- A step that touches a configuration file or a rule file runs alone.
- Each step has its own worktree, base, builder, reviewer, rounds and dispatch entry.
- A later step is dispatched only after the earlier one's launch commit (Steps 4), so its base holds the earlier brief and dispatch entry.
- Landings are one at a time, in the order the steps are verified.
  - A later one lands on the head the earlier left, its whole diff read again there.
- A file both steps changed means the later step goes back through step 6 on the new head before it lands.

## Launching a builder

- A builder (`claude:<model>`) is dispatched with the runner's Agent tool, with `subagent_type: ordo-<worker_effort>`, the effort agent of the configuration block's `worker_effort` (`high` when the block has no such key), the model named and the prompt of Steps 4.
- Right after the launch, and before the launch commit (Steps 4), the orchestrator reads the model the runner served the builder from the runner's own record of the agent: under Claude Code, the `model` field of the assistant entries of the agent's transcript, `subagents/agent-<agent id>.jsonl` in the session's folder under `~/.claude/projects/`, or under `$CLAUDE_CONFIG_DIR/projects/` when that variable is set.
- The orchestrator writes that model beside `session_id` in the dispatch entry, as `session_id: <agent id> (<served model>)`.
- The same check runs when the builder is resumed for a repair round.
- A served model that is not the configured one is the stop "A model other than the configured one" ("Stops"): the agent is stopped through the runner's stop tool, and nothing it wrote is used.
- It runs in the background.
  - The runner tracks it and reports when it ends.
- A repair round resumes it with the runner's message tool on its agent id in `session_id`, as Steps 8 says.
- Its completion notification carries its final message, which Steps 6 reads.
- It works under the runner's own permission settings.

## What earns a step of its own

- A step is a large thing: a new capability, or a defect too nasty or too wide to close where it was found.
- Everything else is closed in the step that is open: a finding inside a brief by the repair rounds or at landing, a fix in a file another step holds at that step's landing.
- A finding beyond the brief is raised to the user as an open item, by "Stops".
- A step's path list is a choice, not a fact: widen it rather than mint a step for what the open step exists to end.
- A report that asks for a step says what makes the work new, or nasty, or blocked by something in flight.
- A step enters the step list only by the user's ruling, as a line ending with `(ruling <name>)`.
  - `/spec` refuses a line without its tag.

## Reports

- The orchestrator's reports and the landing report open with a position line: the roadmap entry with its title, the plan step being worked as "step n of m" with its name, and the next step, in the form "Roadmap entry <n> (<title>). Plan step <k> of <m>: <step name>. Next: step <k+1>, <step name>."
- A builder's report keeps the shape of the repository's change standard.
- The state file's open items follow the position line, verbatim.
- The open items hold only what the user must rule on: a stop, and a proposal of the recurring-findings pass.
- A finding that is neither closed in the repair rounds nor fixed at landing is an open item, since only the user's ruling makes it a step.
- The other list, the closed one, is the log of what was raised and how it ended.
  - No report carries it.
- Then anything NOT DONE first, then the DONE / NOT DONE ledger naming the command that proves each row.

## Usage

- The landing report states each agent's tokens, tool uses and time, from its completion notice.

## The pace when a deadline is set

When the user sets a time by which no agent may run, the loop keeps a night rule and writes it into the state file:

- A builder is dispatched only while the longest step so far still fits before the cut-off.
- A reviewer or a repair round is dispatched only while its usual length fits before the cut-off.
- At the cut-off anything still running is stopped.
  - Its worktree is kept.
  - The state file is rewritten with what was in flight.
  - The plan is paused.
- A one-shot wake-up at the cut-off does the stopping when the runner offers one.

## Stops

The table holds seven kinds of stop, each for a decision that is the user's, and one refusal, the last row, which names its cause and leaves no open item:

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| A shape nobody named | A user-visible shape nothing names | The stop message, below | The user's ruling |
| A wrong premise | A premise found wrong that the plan cannot absorb | The stop message, below | The user's ruling |
| A red check | A red check no fix within the plan covers | The stop message, below | The user's ruling |
| A rule clash | A contradiction between two established rules | The stop message, below | The user's ruling |
| A finding that is the user's | A finding that changes the scope, a requirement, a public shape or an established decision; or one that neither the repair rounds nor a fix at landing close (a finding beyond the brief, work the last round left undone, a changed view not fixed at landing), which becomes a step only by the user's ruling | The stop message, below | The user's ruling |
| The roadmap diff | The closing step's `/roadmap done`, which shows its diff of the roadmap | The diff, in the stop message | The user's approval of the diff |
| A model other than the configured one | The runner served a builder, a reviewer or a brief-check agent a model that is not the configured one: a different model family, or an older version than the newest the configured alias names in the runner's model list ("Launching a builder") | The stop message, below, with the configured value, the served model and the Claude Code version | The user's ruling |
| The configured effort cannot apply | A refusal (Steps 1): the runner lists no `ordo-<level>` agent for a level the configuration block names, or `CLAUDE_CODE_EFFORT_LEVEL` is set, which runs every agent at its level whatever the definition says | The missing agent, or the variable's value | The effort agents installed as the plan skills are, or the variable unset, then a new session |

- Fixing a defect in what the user asked for is never a stop, whatever the fix makes visible.
- A stop is booked in the state file's open items the moment it is raised, and under the step's Step 0 in `plan.md`.
- The ledger files the session wrote are then committed by path, a resume point, so the stop survives the session.
- A ruling that adds or splits a step is booked as the `spec` skill's "Steps / A ruling" says: the new line in the step list ends with `(ruling <name>)`, naming the ruling's line in the Rulings section.
- A stop is repeated in every report until the user has ruled.
- The stop message is plain text in the report: an open item with its options inside the written rules, the pros and cons of each, and one recommendation with its reasons.
  - It never goes through a question-box or multiple-choice tool.
- A pause the user asks for holds until they lift it.

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Relaunching a dead builder silently | Its partial work in the worktree is lost without the user knowing | Report it as "Resuming, and handing the plan over" says; a continuation builder takes over the worktree when the user says so |
| Sending a finding that changes the scope, a requirement, a public shape or an established decision back to the builder | The builder then takes a decision that is the user's | Raise it as a stop |
| Handing a miss inside a brief back as a gap in a report | The work the user asked for is left undone | Close it in the repair rounds or at landing, or raise it to the user as an open item, by "Stops" |
| Minting a step because the work is inconvenient now | The open step does not end what it exists to end | Widen the open step's path list; see "What earns a step of its own" |
| An option that breaks a written rule, in a stop | The user is asked to weigh something that is not allowed | Leave it out; do not mention it |
| Proposing a check for a recurring cause that is a matter of judgment | A script's output then stands in for a judgment that is made by reading | Propose a rule sentence or a change to the text that should have prevented it, and a check only for a fact a machine computes, as "The recurring-findings pass" says |
| Changing the rules file without the user's ruling | The builders then work under rules the user did not set | Book the proposal in the open items and wait for the ruling |
| Narrating wrong turns taken and backed out | The report no longer says what is true now | State the end state |
| Stating a measurement not taken | The number is a guess presented as a fact | Name the command behind each number, or leave the number out |
| Presenting partial work as complete | The user acts on work that is not there | Put anything NOT DONE first |
| Offering the user another repair round beyond the cap | The cap is a rule the user's yes does not extend, and the extra round only moves work that belongs to the user's ruling on an open item | Land the step with its small fixes and raise the rest as open items, as the round cap and the two bullets after it in "Rules" say |

## Rules

- The skill carries no project name, since that is in `.agents/plan.yaml` and the ledger.
  - The models it names are those in "The two tiers, and the models".
- A fix of a defect in delivered work needs no yes.
- The round cap: a step gets at most `repair_rounds` repair rounds, and one more only when the delta leaves a verification command red or an acceptance item of the brief unbuilt and the fix is too large for landing. A new finding of a review never earns that round, and the user's yes never extends the cap.
- After its last round a step lands.
  - Its small findings, the last review's included, are fixed at landing.
- Everything else that the rounds left undone, or that lies beyond the brief, is raised to the user as an open item, by "Stops".
  - It is never sent back to the builder.
  - It becomes a step only by the user's ruling.
- Every skill the loop invokes (`/spec`, `/refute`, `/land`, `academic-paper` for manuscript content, and `/roadmap` at the closing) is invoked through the runner every time, after a compaction too, and never carried out from remembered text.

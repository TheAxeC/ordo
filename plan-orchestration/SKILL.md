---
name: plan-orchestration
description: "Run a multi-package plan from a ledger folder under .scratch/<feature>/ with agents: pick the next unblocked package, author its brief and check every premise on the tree, dispatch one agent in a git worktree, read the whole diff, run the verification commands, land on main by cherry-pick, book the package, commit by path. Every project specific is read from the ledger folder, so the same skill runs a code tool, a research project, a funding proposal or a manuscript, and the same skill runs on either agent harness (Claude Code or Codex) with either as the worker, and one orchestrator can hand the plan to another mid-way. Triggers on: run the plan, next package, orchestrate the plan, plan orchestration, dispatch the next package, ledger folder, continue the plan, resume the plan."
metadata:
  version: "1.2.0"
  last_updated: "2026-09-11"
---

# Plan orchestration

A plan of many packages, each one agent dispatch, run from files on disk rather than from what is still in context. The orchestrator reads the ledger, authors briefs, dispatches one agent at a time into a git worktree, reads the whole diff, verifies, lands by cherry-pick, books and commits. This file holds the mechanics; every project specific (the verification commands, the paths, the standards, the executor, the harness and model of the worker) is read from the plan's own ledger folder, so the skill carries no project name and no vendor name and is the same in every repository and under every runner.

## The two tiers, and the harnesses

Two tiers of model take part, and neither tier is tied to one vendor:

- The orchestrator runs on a top-tier model: Claude Fable 5.1 under Claude Code, or GPT 6 Astra under Codex. It reads, decides, authors, lands and books. It never writes package code itself beyond a fix at landing.
- The worker runs on the working tier: Claude Opus 5 under Claude Code, or GPT 5.6 Sol under Codex. One worker per package, in a worktree, under the spec and one brief. Another working-tier model (a cheaper one on a tightly bounded package) is a trial under the same rule as any new combination: booked in the Rulings list with what decides it, measured by its usage row against the rows before it.

Any combination is allowed: a Fable orchestrator with a Sol worker, an Astra orchestrator with an Opus worker, or both tiers from one vendor. The choice is made per package, not once for the plan: one orchestrator may send one package to Opus and the next to Sol, and a plan may alternate or mix them freely, since every package has the same brief shape, the same worktree, the same checks and the same landing whichever worker built it. The configuration block names the default worker as `harness:model` and a brief may name another for its package; the orchestrator is whatever runner this skill is loaded in.

## Handing the plan from one orchestrator to another

The ledger is the whole handoff. An orchestrator may stop after any package and another, on the other harness, continues from the files alone, because of three rules this skill holds every orchestrator to:

- Nothing needed to continue lives only in a runner's memory, its transcript, its scratch folder or a machine-local temp file. Every decision, every ruling, every path a package depends on, every sharp edge and every usage row is in the ledger folder, committed. A runner's own memory may repeat the ledger; it never holds something the ledger lacks.
- The state file is rewritten before every package commit, so main's head always carries a state file that describes main's head. There is never a committed package whose booking is only in a working tree or a conversation.
- A dispatch in flight is recorded in the state file before the worker starts (the block below), so a new orchestrator can tell whether a worker is still running, finished, or died, before it does anything.

The ledger's vocabulary is vendor-free: a harness is named where it matters (the worker's `harness:model`, the launch recipe), nowhere else.

## The ledger folder

A plan lives under `.scratch/<feature>/` inside the tool or project it belongs to, tracked in git:

- `plan.md`: the packages in execution order, one bullet per package and one agent dispatch, the bookkeeping ones marked. A package is ticked with the green checkmark only after its verification commands ran and the orchestrator read the whole diff; nothing is ticked on inspection. The file also carries a "Could run in parallel" list, a "Rulings" list of the user's decisions with their dates, and a "Blocked, and by what" list.
- `orchestrator-state.md`: the catch-up note, read first after any context compaction or by a new orchestrator, and rewritten before every package commit. It opens with the configuration block below, followed by the dispatch-in-flight block.
- `agents/spec.md`: the standing rules every package runs under. A brief never overrides it; a package that needs another toolchain or executor gets a dated amendment to the spec, made by the orchestrator before dispatch. Every convention a package is judged on is written here; a convention that lives only in the tree's existing files is not a rule, since a worker told to read little will not meet it.
- `agents/briefs/<package>.md`: one brief per package, authored before dispatch.
- `agents/reviews/`: a reviewer's report of a diff, saved there by the orchestrator (an agent never writes into the ledger), and any diff kept for the record without landing it, as a patch file.

Reading order after any compaction or by a new orchestrator: the state file, then `plan.md`, then the tail of the transcript when there is one.

## The configuration block

The top of `orchestrator-state.md` carries the only project specifics the skill consumes. It reads this block and nothing else:

```yaml
verify:                      # commands run in the worktree and again on main, in order; all must pass.
- <command>
worktree_root: .agents/worktrees   # where a package's worktree is created, relative to the repository root; gitignored.
worktree_paths: []           # sparse-checkout paths for a package's worktree; empty means the whole tree.
standards: []                # files every brief tells the agent to read in full.
executor: agent              # agent | academic-paper | inline.
worker: <harness:model>      # the default worker for executor agent: claude:opus, codex:gpt-5.6-sol, or another working-tier model.
worker_effort: high          # the reasoning effort passed to a worker whose harness takes one (Codex: model_reasoning_effort); a recommendation until a usage row measures it.
reviewer: none               # none, or harness:model of the optional reviewer stage (step 8 below).
```

## The dispatch-in-flight block

Under the configuration block, the state file carries what is running, written before the worker starts and cleared when the package lands or is abandoned:

```yaml
dispatch:
  package: <id>
  worker: <harness:model>
  worktree: <worktree_root>/<package>
  base: <the exact commit the worktree was cut at>
  launched: <ISO time>
  prompt: <path of the prompt file>        # Codex: the file piped into codex exec
  events: <path of the event log>          # Codex: the --json stream
  report: <path of the report file>        # Codex: the -o file; Claude: where the orchestrator saves the agent's final message
  exit: <path of the exit file>            # Codex: written by the launch wrapper when the process ends
  pid: <the process id, written at launch>
  session_id: <the session, rollout or agent id, written as soon as it is known>
  landing: not-started                     # not-started | cherry-picking | verified
  round: 0                                 # 1 while a repair round is in flight, with its own repair_prompt, repair_events, repair_report, repair_exit and repair_pid entries beside these
  reviewer_report: <path>                  # with reviewer_prompt, reviewer_exit and reviewer_pid, written when the reviewer stage of step 8 is launched
```

An orchestrator that finds this block on resumption checks the worker and `landing` before anything else, by the check its harness allows. The two copies of the state file say different things and both are read: the committed copy (`git show HEAD:<state file>`) holds the worker's identity, the worktree, the base and the file paths, and its `landing` always reads `not-started`, since the marks of steps 11 and 13 are working-tree writes that reach main only with the package commit; the working-tree copy holds the current `landing`, or, once step 13 has run, a cleared block beside the booking. When the working-tree block is already cleared, the worktree and branch to remove at step 15 are taken from the committed copy. A CLI worker (Codex, or Claude through `claude -p`) has a pid file and an exit file: the process alive means still running; the exit file present means finished; neither means dead. A native Claude worker launched through the Agent tool has no process of its own to check: its `session_id` is the agent id the runner reported at launch, the runner's own agent listing says whether it still runs, and its transcript under `~/.claude/projects/<repository slug>/` holds its report when it has finished. In both cases: a worker still running is waited for; a finished one resumes at step 7, the diff read, and then verification, never at the landing; a package at `cherry-picking` is checked on main (`git status`, `git diff --cached`) before anything is applied again, so a cherry-pick is never applied twice; a dead worker is reported to the user with what its logs or transcript hold, never silently relaunched.

The same resumption reconciles three things before any next package is picked: the ledger as committed on main, the ledger as it is in the working tree, and the index. A booking present in the working tree but not committed, with the package's files still staged, is a landing interrupted between step 13 and step 14: it is finished (the checks re-run, the commit made) before anything else, never treated as done and never treated as undone. A booking present in the working tree with the index empty and the package's files already in main's head is a package commit that missed the ledger paths: the head is amended with them (`git add -- <ledger files> && git commit --amend --no-edit`, safe because nothing is ever pushed), never a second commit and never left as it is. Staged package files with `landing: cherry-picking` in the working-tree state file are a landing in flight; `git status` reports no operation in progress after a clean `cherry-pick -n`, so those two are the only signs.

## Executors

- `agent`: a general-purpose agent on the configured worker, in a worktree, landed by cherry-pick. This is the executor for a code tool, a research project, and any package whose deliverable is source or data.
- `academic-paper`: the package's brief is a dispatch of the `academic-paper` skill in the mode the brief names. This is the executor for a manuscript, a response to reviewers, grant text, and anything else under the rule that manuscript content is never produced by a raw agent and a `.tex` is never hand-edited. Verification is the PDF build plus whatever else the brief names; landing is the same cherry-pick.
- `inline`: bookkeeping the orchestrator does itself, no agent.

A package may name its own executor or worker in its brief; the block gives the default.

## The workflow, one package at a time

1. Read the state file, then the ledger, then the tail of the transcript. If the dispatch block names a worker, resolve it first (above).
2. Pick the next package that nothing blocks. One package at a time, whatever the parallel list allows.
3. Author its brief from `agents/spec.md` and the ledger. Every count, path, name and claim in the brief is checked on the tree with a grep or a probe before dispatch; a premise found wrong is corrected in the brief, never left for the agent to hit.
4. Preflight first: on `main`, nothing staged, no git operation in progress (`git status` reports no cherry-pick, merge or rebase under way), and any unrelated change of the user's listed by path and left alone. Then commit the brief, and any dated amendment to the spec, by path: the preparation commit. Record that commit as the base, so the worktree holds the brief and the spec the worker is told to read. Create the worktree yourself, at that commit, never through a runner's own isolation feature: `git worktree add -b <package> <worktree_root>/<package> <base>`, then from inside the worktree `git sparse-checkout set <worktree_paths>` when the block names any, then the dependency install the project needs. Every git command on a worktree is run from inside it (a `cd` in the command, or the runner's working-directory setting), never as `git -C <path> ...`: a command rule matches a command by its leading words, so the repository's Codex rules forbid the `-C` form outright, and one recipe has to hold under both runners. The folder is a git concept and is the same whichever harness the worker runs in.
5. Write the dispatch block into the state file and commit it by path (a second small commit, after the worktree exists, so the block can name the base and the paths). Then dispatch one worker with the worktree path, the spec and the brief, by the recipe under "Launching a worker" for its harness, and the moment it is launched, before waiting on it, write its identity into the block and commit the block again: for a CLI worker the process id (the launch wrapper's `$!`, also written to a pid file) into `pid`; for a native Claude worker the agent id the runner returns into `session_id`, there being no process of its own. A session, rollout or agent id learned later goes into `session_id` beside the pid, never in its place. The prompt carries, in its own words, every requirement the package is judged on (the acceptance list, the tests, the conventions of the spec, the checks), not only a pointer to the files that hold them. The agent never runs a git command and never edits anything in the ledger folder.
6. While it runs, do ledger work only: the next brief, the bookings, the usage table. Never dispatch a second worker, and never redo a package on another harness or launch the next package while the user has asked for a pause.
7. On the report: save it to the path the dispatch block names (a Claude worker's final message is written there by the orchestrator; if the orchestrator stopped before doing so, the message is still in the runner's own transcript store, `~/.claude/projects/<repository slug>/`, in the sub-agent's transcript file named by the agent id the block holds, as its last assistant message), then read the whole diff. The report is a lead, not a fact.
8. Reviewer stage, when the block names one: dispatch the reviewer with the diff, the brief and the spec, asking for the acceptance items not met, the spec rules broken and the tests missing, as its report; the orchestrator saves that report into `agents/reviews/<package>.md` and reads it as one more lead before its own read. Its usage goes into the table under its own row.
9. Run the `verify` commands in the worktree.
10. Repair round: a miss found by the read, the reviewer or the checks that stays inside the brief (an acceptance item not built, a test not written or one that covers a stated rule only at its boundary, a convention not met, a red check, a judgment call the worker flagged as reversible that the orchestrator reverses) goes back to the same worker once, with the list of misses, in the same worktree; the round is counted in the usage row. The same worker means the same session, not a new dispatch: a Codex worker is resumed with `codex exec resume <session_id> -c 'sandbox_mode="workspace-write"' -c 'sandbox_workspace_write.network_access=true' -c 'model_reasoning_effort="<worker_effort>"' -m <model> -o <repair report> --json - < <repair prompt>`, run from inside the worktree's tool folder and detached the same way as the launch, since the resume form takes neither `-C` nor `-s` and the sandbox, the network setting and the effort go through `-c`; a native Claude worker is resumed through the runner's message tool on the agent id in `session_id`; a `claude -p` worker with `claude -p --resume <session_id>` and the flags of its launch. Before the resume, the round's prompt, event log, report, exit file and pid go into the dispatch block as `round: 1` and the `repair_` entries, committed as at step 5, so a resumption can tell a first run from a repair in flight. A resumed Codex session replays its whole transcript, so its input tokens exceed the first run's; the usage row records both runs. A miss that would change the scope, a requirement, a public shape or an established decision goes to the user instead. A repaired diff goes back through steps 7 to 9 in full: the whole diff read again, the reviewer again when one is named, the `verify` commands again; nothing is booked on a repair that was not re-read and re-run. After one repair round, everything still short and inside the brief is fixed by the orchestrator at landing (counted as a fix, re-verified, and named in the landing note with its cause: the orchestrator's configuration, the brief, a rule nobody wrote, the worker). There is no reporting branch: a miss inside the brief is never handed to the user as a gap, a sharp edge or a later item, unless it is a stop under the Stops section below; the package is not booked until it is closed. Only a stop (a miss that would change the scope, a requirement, a public shape or an established decision) goes to the user, and it goes as a booked line in `plan.md` or the state file's open-items list, repeated in every report until the user rules on it (the rule of 2026-09-14 00:05: reported means booked and repeated until closed).
11. Land it: in the worktree `git add -A <the tool's directory> && git commit -q -m wip`, the paths scoped to the package's tree (a repair round after a landing attempt adds a second such commit on the branch; a repair made before the first wip commit lands in that one commit); check that none of the package's paths carries an unrelated change of the user's on main; set `landing: cherry-picking` in the dispatch block; on main `git cherry-pick -n <base>..<package>`, the whole range from the recorded base, so every landing attempt applies the complete reviewed change and never only the last repair, and the package still lands as one implementation commit. A conflict is resolved on main by the orchestrator, never by an agent on main; a conflict the orchestrator will not resolve is undone with `git cherry-pick --abort`, which puts main back as it was.
12. Run the `verify` commands again on main. A red check here is fixed on main when the fix stays inside the brief (a fix at landing, counted, and the checks run again); otherwise the package is taken back out of main and goes back to step 10 with the failure. Taking it out means discarding what `cherry-pick -n` put into the index and the working tree: `git restore --staged --worktree -- <paths>` for the files it changed, and `git rm --cached -- <path>` plus deleting the file for each file it added. Both `restore` and `rm` are discarding commands on the ask list, so the orchestrator asks before running them, which is what the list is for; `git checkout -- <paths>` does not do this (it copies the index into the working tree and discards nothing). A pre-existing change of the user's is never among the paths. `git cherry-pick --abort` is no alternative here: a clean `cherry-pick -n` leaves no `CHERRY_PICK_HEAD` and no sequencer state, so there is nothing to abort, and the commands above are the only way back.
13. Set `landing: verified` in the dispatch block, then book the package in `plan.md` and rewrite the state file: the landing note, the usage row, the dispatch block cleared, the next package named. This is the last write before the commit, so the commit carries a state file that describes it; until that commit exists the booking is a working-tree change beside the staged package, which is what the resumption rule above recognises and finishes.
14. Commit by explicit path: the paths from `git diff --cached --name-only` plus the ledger files, each written out in the `git add -- <path> <path> ...` command itself, never passed through a shell variable (a shell that does not split the variable hands git one path that does not exist, `git add` fails, and the commit still runs on whatever was staged, which is the package without its booking). The message in the user's shape: a capitalised imperative subject, a blank line, `- Verb ...` bullets, the last bullet the plan booking. No attribution of any kind, and never push. After it, `git status --short` shows nothing of the package's and nothing of the ledger's; a ledger file still modified means the commit missed the booking, and the head is amended with the ledger paths (`git add -- <ledger files> && git commit --amend --no-edit`, safe because nothing is ever pushed) before anything else. An unrelated untracked file of the user's is left where it was.
15. Remove the worktree and its branch: `git worktree remove <worktree_root>/<package> && git branch -D <package>`. It is `-D`: the package reached main as a new commit made by the cherry-pick, so the branch's wip commits are never ancestors of main and `git branch -d` refuses them as not fully merged. A worktree's branch is a local branch that exists only until this step; a diff kept for the record is saved as a patch file under `agents/reviews/`, never as a branch.
16. End the turn with the landing report, written to stand alone. Nothing in the conversation is needed after it: the next package starts from the state file, so the user compacts the session or starts a fresh one here, on either harness, and the "tail of the transcript" step of the reading order reads as empty. A runner cannot compact itself from inside the skill; making the landing the point where compaction loses nothing is what the state-before-commit rule is for.

## Launching a worker

Both harnesses take the same prompt. What differs is the launch, the sandbox, and where the report comes back. Either orchestrator can launch either worker: the Claude Code recipe below has a CLI form for an orchestrator that is not running inside Claude Code.

**Claude Code worker (`claude:<model>`), from inside Claude Code.** Dispatch through the runner's Agent tool with `subagent_type: general-purpose` and the model named; run it in the background and wait for its completion notification; its final message is the report. It works under the runner's own permission settings (`.claude/settings.local.json` in the repository), which is where the ask list of git commands lives.

**Claude Code worker, from any shell (a Codex orchestrator, or a script).** The same prompt through the CLI's print mode, detached the same way as the Codex recipe below:

```sh
nohup sh -c 'cd <worktree>/<tool dir> && claude -p --model <model> --permission-mode acceptEdits \
    --output-format json < <prompt file> > <report file> 2> <stderr file>; echo "exit $?" > <exit file>' &
echo $! > <pid file>
```

`-p` is non-interactive; `--model` takes an alias such as `opus`; `--permission-mode acceptEdits` lets it write files in its working directory under the repository's own permission file, which still asks for or forbids the git commands on the ask list; `--output-format json` puts the final message and the token usage into the report file. The CLI reads the repository's instruction file (`CLAUDE.md`, with `AGENTS.md` beside it as the same text) from the working directory up, so the spec's reading order and the prompt still say what to read.

**Codex worker (`codex:<model>`).** Dispatch with `codex exec`, from a shell, detached from the runner's command timeout:

```sh
nohup sh -c 'codex exec -C <worktree>/<tool dir> -s workspace-write \
    -c "sandbox_workspace_write.network_access=true" -c "model_reasoning_effort=\"<worker_effort>\"" -m <model> \
    -o <report file> --json - < <prompt file> > <event log> 2> <stderr file>; echo "exit $?" > <exit file>' &
echo $! > <pid file>
```

- `-C` is the working root; `-s workspace-write` confines writes to it and the system temp directory. The sandbox with the network off also refuses to open a local port, which a test suite with a server, a socket or a watcher needs, so `sandbox_workspace_write.network_access=true` is passed whenever the `verify` commands bind a port; without it `npm test` fails with `listen EPERM` and the failure is the harness's, not the model's.
- A suite with many file watchers has failed inside the sandbox with `EMFILE: too many open files, watch` while the same worktree passed from the orchestrator's shell, which points at a descriptor limit of the sandbox; the cause is not established beyond that, and the error alone does not establish it either. A Codex worker reports such a row as NOT DONE with the output; the orchestrator's run of the `verify` commands from its own shell, in the worktree and again on main, is then the first full run, and the report is read with that in mind. A failure that also reproduces from the orchestrator's shell is unresolved, since both runs can share an environment limit, and is diagnosed before anything lands.
- The worker's patch tool refuses a path outside the working root; a file that must be written elsewhere (a temporary config file) is written with a shell command, and the prompt says so.
- `-o` writes the worker's final message (the report) to a file; `--json` streams the event log, whose last `turn.completed` event carries the token usage for the usage table; `-c model_reasoning_effort` is the block's `worker_effort`. The session is not run with `--ephemeral`: the rollout Codex then writes under `~/.codex/sessions/` is the worker's transcript, kept the way a Claude sub-agent's is, and a sessions tool that reads rollouts can list the worker while it runs. A worker on the other harness is not linked to the orchestrating session in any file, so it appears as a session of its own until a tool writes that link.
- A runner's shell tool caps a command at ten minutes and a package takes fifteen to forty; the launch is detached with `nohup` and `&`, and a monitor watches the exit file, so nothing is killed mid-package.
- Codex collects `AGENTS.md` from the repository root down to the working root, plus the user's `~/.codex/AGENTS.md`, up to `project_doc_max_bytes` of them in that order, per its documentation; a dry run from a tool folder reported only the user-level file, so what a given worker sees is checked by asking it once when it matters. The spec's reading order still holds and the prompt says which files to read.
- Codex project settings live in `<repo>/.codex/config.toml` and its command rules in `<repo>/.codex/rules/*.rules`, read only for a project the user has marked trusted in their own `~/.codex/config.toml`; the orchestrator never edits a user-level file.
- The id passed to `-m` is the user's to name; the CLI does not list models and the event log does not carry the id.

**The prompt**, for either harness, states: the worktree path and that it is the only place to work; the no-git rule (not even `git status` for Codex, whose shell is sandboxed but not read-only); what is never touched (the ledger folder, the reference tree, the user's home folders, the main checkout); the toolchain path; the port and the environment override for the server check, and that a temporary file outside the worktree is written with a shell command; the reading order; the requirements the package is judged on, in the prompt's own words; the report shape.

## Undoing a package

The worktree and the cherry-pick are what make a package undoable: one package is one implementation commit, so undoing a package is `git revert` of that one commit. The preparation commit (the brief, the dispatch record) is separate and stays: the ledger is a record, and a reverted package is booked as reverted in `plan.md` and the state file rather than erased.

## Stops

A stop is for a decision that is the user's: a user-visible shape nothing names, a premise found wrong, a red check no fix within the plan covers, a contradiction between two established rules. Fixing a defect in what the user asked for is never a stop and needs no yes, whatever the fix makes visible: a card that hides a stale result, a process that idles at 150 MB, a control that does nothing inside a window, a wrong number, are defects in delivered work and are fixed at once. The rule of 2026-09-14 00:05, binding on every orchestrator under this skill: (1) nothing inside a brief is left undone, ever; (2) a fix of a defect in delivered work needs no yes; (3) a stop that does need the user's ruling is booked in `plan.md` or the state file's open-items list the moment it is raised, and repeated in every report until the user has ruled, so a compaction, a fresh session or a new orchestrator finds it in the ledger and never in memory alone.


The turn ends only when nothing unblocked is left, or when the user has asked for a pause, which holds until they lift it. Four things are put to the user, each in one message with one recommendation, and everything else keeps moving:

- a user-visible shape the ledger does not name (a manifest key, a config vocabulary, a wire format, a public interface);
- a premise found wrong that the plan cannot absorb;
- a red check that no fix within the plan covers;
- a contradiction between two established rules or decisions.

A package that fails its bar after its repair round is reported, with its misses sorted by cause (the orchestrator's configuration, the brief, a rule nobody wrote, the worker), and what happens next is the user's call; the diff is kept as a patch under `agents/reviews/`.

## Reports

Every report opens with the open-items list of the state file, verbatim, before anything else: what is still open, who is waiting on whom, and what happens next for each. A landing report that omits an open item is wrong.


From the orchestrator to the user after a package, and from an agent to the orchestrator: anything NOT DONE first, then a DONE / NOT DONE ledger naming the command that proves each row. No narration of wrong turns taken and backed out. No measurement stated that was not taken. Partial work is never presented as complete.

## Usage

Per package, one row in the state file's table: the worker's harness, model and effective reasoning effort, tokens (input, cached, output where the harness reports them), tool uses or completed items, duration, lines added and removed, whether the first report passed its bar, the repair rounds, the number and kind of fixes at landing, and the orchestrator's own time on the diff read, the repairs and the landing. Tokens and lines say what a package cost; the last three say what it was worth, and a change to the process, the harness or the model is judged on both, on the same briefs and checks, package by package.

## Adopting it in a repository

The skill carries no project name and no vendor name, and the templates under `templates/` are the whole of what a repository has to fill in: `plan.md`, `orchestrator-state.md`, `spec.md` and `brief.md`, each with `<placeholders>` in angle brackets. A repository adopts the skill by creating `.scratch/<feature>/` from those four templates, filling the configuration block with its own verification commands, worktree root, sparse paths, standards, default executor and worker, and listing its packages. The skill is installed once at the user level of each runner (`~/.claude/skills/plan-orchestration`, `~/.codex/skills/plan-orchestration`) or linked from a repository's `.agents/skills/` into `.claude/skills/` and `.codex/skills/`, so both runners see one copy.

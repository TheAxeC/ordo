---
name: land
description: "Bring a refuted step from its worktree onto main and book it: a wip commit in the worktree, the cherry-pick of the whole range onto main, the verification commands on main, the look at the changed views where the configuration block's look: says, the interleaved A/B against the staged base binaries, the orchestrator's usage row, the booking in the plan, the commit by explicit path list, the worktree and branch removed, the state file rewritten. Refuses while a finding is left neither closed nor booked, or with any red line. Triggers on: land <entry> <step>, land the step, cherry-pick the step, book the step."
metadata:
  version: "1.6.0"
---

# Land a step

`/land <entry> <step>` brings a refuted step from its worktree onto main. It leaves behind the step on main in one commit with its booking and its landing report, the state file rewritten, and the step's worktree and branch removed.

## Quick start

```
/land <entry> <step>     the only way a step reaches main: bring the refuted step over, check it there, book it, commit it, remove its worktree
```

## Use instead

| When | Use |
|---|---|
| The step has not been reviewed yet | `/refute <entry> <step>` |
| Every step of the plan, unattended, the landings included | `/plan-orchestration <entry>` |
| Where the plan stands and which command comes next | `/plan-help <entry>` |

## What it reads

1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them; a required key missing is a refusal ("Stops").
2. The ledger folder: `<entry>` resolves to the folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title).
   - `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has.
   - No such folder is a refusal ("Stops").
3. The dispatch block naming this step, with its worktree and base; none is a refusal ("Stops").
4. `agents/reviews/<step>-report.md` and the refuter report `agents/reviews/<step>-refuter.md`, as the Stops row "The step not ready" requires them.
5. Main, in the state the Stops row "Main not clean" requires.
   - The user's unrelated changes are listed by path and left alone.

## Steps

1. Set `landing: cherry-picking` in the dispatch block.
2. In the worktree, from inside it, after waiting for `.git/index.lock` to go: `git add -A` scoped to the step's tree, and `git commit -q -m wip`.
3. On main: `git cherry-pick -n <base>..<step>`, the whole range from the recorded base, so the landing applies the complete reviewed change and never only the last fix.
   - A conflict is resolved by the orchestrator or the session, never by an agent.
   - The ledger's landing script, when there is one, prints the conflicting paths and exits instead.
4. Restore to main's copy, before anything else, a ledger file the worktree deleted or rewrote (a report written in both trees); the ledger is written only on main.
5. Run the verification commands of the configuration block on main, in order, each through its filter, stopping at the first failure.
   - A finding of the refutation of the last repair round that is small and inside the brief is fixed on main here, counted and named the same way as a red line.
   - A red line that a fix inside the brief closes is fixed on main, counted as a fix at landing, and named in the booking with its cause.
   - Any other red line ends the landing there, leaving main in a state the resumption rules of `plan-orchestration` recognise.
   - It takes the step back out of main: `git restore --staged --worktree -- <paths>` for changed files, `git rm --cached` and delete for added ones, both on the ask list, so the user is asked.
   - It is booked with the failure, never sent back to the builder: in the state file's open items when only the user can decide what to do, in the booked list otherwise.
   - Then the look, as "The look" says.
6. Run the A/B: the benchmark commands the configuration block's `bench:` line names, the staged base binary and the new one run alternately after warm-ups, at least ten runs each.
   - The mean, the standard deviation and the standard error of the difference are written to the scratchpad and quoted in the booking.
   - A change past the noise band is a finding, fixed before the booking.
7. Append the booking to `plan.md` (or the part file the plan names): what landed and where, every premise correction, every finding outside the brief with the step it is booked at, the verification lines, the A/B, the usage row; tick the step.
8. Rewrite the state file: the dispatch block cleared, the position line, the usage rows, the open items as they stand.
   - The orchestrator's row is produced first, by `templates/usage.py <session log> <from> <to>`: the session log is the running session's own, `<from>` the previous landing commit's `git log -1 --format=%cI`, `<to>` `date -Iseconds`.
   - The Usage section of `plan-orchestration` says where each harness keeps the log.
9. Commit by explicit path: every path from `git diff --cached --name-only` plus the ledger files (the landing report of step 11 among them, written before this commit).
   - The paths are written out in the `git add -- <path> ...` command, never through a shell variable.
   - Deleted paths are already staged by the cherry-pick and are not re-added.
   - The message is in the repository's shape.
   - The message's last bullet is the booking.
   - No attribution.
   - Never push.
   - Afterwards `git status --short` shows nothing of the step's and nothing of the ledger's.
   - A ledger file left modified means the commit missed the booking, and the head is amended with the ledger paths.
10. `git worktree remove <worktree_root>/<step>` and `git branch -D <step>`: `-D`, since the cherry-pick made a new commit and the branch is never an ancestor of main.
11. Write the landing report, `agents/reviews/<step>-landing.md`, before the commit of step 9, so it lands with the step and stands alone on disk.
    - It holds the open items first, verbatim, which hold only what the user must rule on, and the count of the booked list with the steps that carry it; then anything NOT DONE; what landed, with the commit; what was found; what is next.
    - Under the loop it is also the report the orchestrator prints; run by hand, it is the message that ends the turn.

## The look

- When the configuration block's `look:` names where a changed view is shown and the step changes a view, the shell or anything a reader sees, the changed views are opened there, after the checks on main and before the booking.
- A screenshot is taken of each changed view and of each state the step's brief names, under the themes the step touches.
- What is wrong in them is fixed at landing when it is small and inside the brief, and booked as its own step in the booked list otherwise.
- The landing note names every view and state looked at and what was seen.
- An empty `look:` means the step has no look, and the note says so.

## The landing script

- A ledger may hold `land.sh`, copied from `templates/land.sh` with its `ADAPT` edits made; it does steps 2, 3 and 5 as one command.
- It prints the diff stat, the usage rows (with `--session <session log> --since <previous landing commit time>`, the orchestrator's row through `usage.py`, found beside it or in this skill's templates) and the staged paths.
- `templates/land.test.sh` proves it on scratch repositories, and proves `templates/usage.py` on a Claude Code log and a Codex rollout.
- When the ledger holds it, its zero exit is step 5's pass.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| A red line for the user | A red line after the cherry-pick that no fix inside the brief closes, and only the user can decide what to do | The failure, booked in the open items as Steps 5 says | The user's ruling |
| A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/land` again |
| No ledger folder | No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan`, then the step prepared, built and refuted |
| No dispatch block | The state file holds no dispatch block naming this step | That the block is missing | `/spec` for the step |
| The step not ready | No builder's report; or no refuter report that is either newer than the builder's report or, after the step's repair rounds (up to `repair_rounds`, or one more under plan-orchestration's exception), carrying a run over the last round when `refute_after_repair: yes` (the orchestrator's read of the round when `no`); or a run over the last round owed and missing; or a finding, the last run's included, neither closed under the refuter report's Closed heading nor booked as its own step in the booked list | Which of these it is | What is missing supplied, then `/land` again |
| Main not clean | On main something staged, a git operation in progress, or one of the step's paths carrying an unrelated change of the user's | What it saw, the user's unrelated changes listed by path | Main put right, then `/land` again |

- The first row is a stop: it leaves an open item.
- The rows after it are refusals: they come before main is touched.
- A refusal names its cause and leaves nothing.
- A red line booked in the booked list is not a stop: the step is out of main, and the booked step is worked in queue order.

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Booking what was not re-read and re-run after its last fix | The booking then claims what nobody verified | Re-read and re-run it, then book it |

## Rules

- One step is one implementation commit, so undoing a step is `git revert` of that commit, and the preparation commit stays.
- A reverted step is booked as reverted.
- The state file is rewritten before the commit, so main's head always carries a state file that describes it.

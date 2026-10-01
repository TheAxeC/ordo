---
name: land
description: "Bring a refuted step from its worktree onto main and book it: the step's builder and reviewers stopped, a wip commit in the worktree, the cherry-pick of the whole range onto main, the verification commands on main, the look at the changed views where the configuration block's look: says, the interleaved A/B against the staged base binaries, the booking in the plan with each agent's tokens, tool uses and time, the state file rewritten, the landing report, the commit by explicit path list, the worktree and its branches removed. Refuses while a finding is left neither closed nor raised to the user as an open item, or with any red line. Triggers on: land <entry> <step>, land the step, cherry-pick the step, book the step."
metadata:
  version: "1.8.2"
---

# Land a step

`/land <entry> <step>` brings a refuted step from its worktree onto main. It leaves behind the step on main in one commit with its booking and its landing report. The state file is rewritten, and the step's worktree and branches are removed. After a red line no fix inside the brief closes, it leaves the step out of main instead. The worktree and branches are then kept for `/spec`, and the failure is recorded in the step's Step 0 in `plan.md`.

## Quick start

```
/land <entry> <step>     the only way a step reaches main: bring the refuted step over, check it there, book it, commit it, remove its worktree
```

## Use instead

| When | Use |
|---|---|
| The step has not been reviewed yet | `/refute <entry> <step>` |
| Every step of the plan, unattended, the landings included | `/plan-orchestration <entry>` |
| A red line whose cause is not known, once the step is taken back out of main and before `/spec` prepares it again | `/diagnose <entry> <step> red line` |
| Where the plan stands and which command comes next | `/ordo-help <entry>` |

## What it reads

1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
   - A required key missing is a refusal ("Stops").
2. The ledger folder: `<entry>` resolves to the folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title).
   - `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has.
   - No such folder is a refusal ("Stops").
3. The dispatch block naming this step, with its worktree and base.
   - None is a refusal ("Stops").
4. This skill's `templates/land.sh` and `templates/checks.sh`, as "The landing script" says.
   - A `checks.sh` missing beside `land.sh` is a refusal ("Stops").
5. `agents/reviews/<step>-report.md` and the refuter report `agents/reviews/<step>-refuter.md`, as the Stops row "The step not ready" requires them.
6. Main, in the state the Stops row "Main not clean" requires.
   - The user's unrelated changes are listed by path.
     - They are left alone.
7. The step's diagnosis record `agents/reviews/<step>-diagnosis.md`, when it exists, for the booking of Steps 9.

## Steps

1. Stop the step's builder and every reviewer of the step, before anything in the worktree is committed.
   - An agent is stopped through the runner's stop tool.
   - Then the runner's agent listing must show none of them left.
   - A check that fails is a refusal before main is touched ("Stops").
2. Set `landing: cherry-picking` in the dispatch block.
3. In the worktree, from inside it, after waiting for its `index.lock` to go: `git add -A` of the whole tree with the ledger root left out.
   - `git commit -q -m wip` when something is staged.
   - A builder that committed everything leaves nothing staged, and the landing makes no wip commit.
   - The landing removes a lock older than 60 s while no `git` process runs, as stale.
   - Each wait for a lock, here and on main before Steps 4, is bounded at 60 s of waiting.
     - At the bound the landing stops ("Stops").
4. On main: `git cherry-pick -n <base>..<step>`, the whole range from the recorded base, so the landing applies the complete reviewed change and never only the last fix.
   - A conflict is resolved by the orchestrator or the session, never by an agent.
   - `templates/land.sh` prints the conflicting paths and exits 2 instead.
   - A range with no commit, as when the step's only output is a ledger file, has nothing to copy, and the landing goes on to Steps 6.
5. Restore to main's copy, before anything else, a ledger file the cherry-pick deleted or rewrote; the ledger is written only on main.
   - `templates/land.sh` leaves the ledger root out of the worktree's add, so a ledger file left uncommitted in the worktree (a builder's report, any other ledger copy) never reaches main; a ledger file that a commit of the range holds still does.
6. Run the verification commands of the configuration block on main, in order, each through its filter, stopping at the first failure.
   - `templates/land.sh` runs the step's verify list through `templates/checks.sh <state file>` from the root of the checkout it checks (main here).
   - The lines `checks.sh` prints are what the booking quotes.
   - A finding of the refutation of the last repair round that is small and inside the brief is fixed on main here.
     - It is counted and named the same way as a red line.
   - A red line that a fix inside the brief closes is fixed on main.
     - It is counted as a fix at landing.
     - It is named in the booking with its cause.
   - Any other red line ends the landing there, leaving main in a state the resumption rules of `plan-orchestration` recognise.
   - It takes the step back out of main: `git restore --staged --worktree -- <paths>` for changed files, `git rm --cached` and delete for added ones, run without asking the user.
   - The dispatch block is then set to `landing: backed-out`.
     - The step's worktree and branches are kept.
     - The step stays unticked in `plan.md`.
   - The failure is never sent back to the builder.
     - It is recorded in the step's Step 0 in `plan.md`.
   - The step keeps its line and its tag.
     - It is worked again as that step, with no new ruling.
   - The failure goes to the user as an open item only when what to do is a decision for the user.
   - A step is taken back out of main and prepared again at most once: a second failure of its landing always goes to the user as an open item, and the step waits for the ruling.
   - The step's agents are booked in `plan.md`'s Agents section by the rules of Steps 9, written and read back before that commit, since `/spec` later removes the step's dispatch entry; the agents of its later landing are appended when it lands, those already in the section skipped.
   - The state file and `plan.md` are then committed by path, a resume point.
     - The commit also holds the other ledger records the session wrote since the last one.
   - `/spec` then saves the step's work as a patch and prepares it again from main's head. The `spec` skill's "Steps / A step taken back out of main" says how.
7. Open the changed views, as "The look" says.
8. Run the A/B: the benchmark commands the configuration block's `bench:` line names, the staged base binary and the new one run alternately after warm-ups, at least ten runs each.
   - The mean, the standard deviation and the standard error of the difference are written to the scratchpad.
     - They are quoted in the booking.
   - A change past the noise band is a finding, fixed before the booking.
9. Append the booking to `plan.md` (or the part file the plan names): what landed and where, every premise correction, every finding outside the brief with the open item it was raised as, the verification lines, the A/B.
   - The verification lines it quotes carry `<REDACTED>` in place of the value of a secret, as the rules file's rule on secrets in quoted command output says.
   - The booking states the builder's, each reviewer's and each brief-check agent's tokens, tool uses and time, from their completion notices, read from the dispatch block's `builder_usage`, `reviewer_report` and `brief_check`.
   - The booking also appends to `plan.md`'s `## Agents` section one bullet per agent the step's dispatch entry names, `- <agent id>: <role>, <served model>`, with the roles below.
     - The builder from `session_id`, and each builder under `builders_before`: `builder of step <n>`.
     - The brief-check agent from `brief_check`: `brief check of step <n>`.
     - Each first-run reviewer from `reviewer_report`, a stopped one included: `reviewer of step <n>`.
     - Each reviewer over a round, a stopped one included: `reviewer of step <n> over round <r>`.
   - An `inline` or `academic-paper` builder has no agent id and gets no bullet.
   - An agent whose id already has a bullet in the section gets none, so a brief-check agent booked at a back-out, or at a stop of `/spec`, is not booked twice.
   - A `plan.md` without the section gets it before `## Blocked, and by what`.
   - The section is read back after the write, and each agent of the entry has exactly one bullet.
   - It states whether the builder's first report passed its bar, and the fixes at landing.
   - It names each diagnosis record of the step (`agents/reviews/<step>-diagnosis.md`, one heading per diagnosis) with its cause, or with "cause not found" and the open item it was raised as.
   - Tick the step.
10. Read the step's `worktree` from its dispatch entry, for Steps 13.
    - Then rewrite the state file: the step's dispatch entry removed, the position line, the open items as they stand.
11. Write the landing report, `agents/reviews/<step>-landing.md`, so it lands with the step and stands alone on disk.
    - It opens with the position line: the roadmap entry with its title, the plan step as "step n of m" with its name, and the next step.
    - Then the open items, verbatim, which hold only what the user must rule on.
    - Then the check of Steps 1 with what it showed, anything NOT DONE, what landed with the commit, what was found, and what is next.
    - Then the agents' usage, whether the first report passed its bar and the fixes at landing, as the booking of Steps 9 states them.
    - The verification lines it quotes are redacted as Steps 9 says.
    - Under the loop it is also the report the orchestrator prints.
    - Run by hand, it is the message that ends the turn.
12. Commit by explicit path, a resume point: every path from `git diff --cached --name-only`.
    - The commit also holds the ledger files the session wrote since the last resume point, the landing report among them.
    - The paths are written out in the `git add -- <path> ...` command, never through a shell variable.
    - Deleted paths are already staged by the cherry-pick and are not re-added.
    - The message is in the repository's shape.
    - The message's last bullet is the booking.
    - No attribution.
    - Never push.
    - Afterwards `git status --short` shows nothing of the step's and no ledger file the session wrote.
    - Such a ledger file left modified means the commit missed the booking, and the head is amended with its path.
13. Remove the step's worktree and its branches, as "Removing a step's worktree" says, with the `worktree` Steps 10 read.

## The look

- When the configuration block's `look:` names where a changed view is shown and the step changes a view, the shell or anything a reader sees, the changed views are opened there at Steps 7.
- A screenshot is taken of each changed view and of each state the step's brief names, under the themes the step touches.
- What is wrong in them is fixed at landing when it is small and inside the brief, and raised to the user as an open item, as `plan-orchestration`'s Stops section says otherwise.
- The landing note names every view and state looked at and what was seen.
- An empty `look:` means the step has no look, and the note says so.

## The landing script

- `templates/land.sh` does Steps 3, 4 and 6 as one command, run from the repository root as `sh <this skill's folder>/templates/land.sh <state file> <step> <base>`.
  - `<state file>` is the plan's `orchestrator-state.md`, relative to the repository root or absolute.
  - `<step>` is the step's branch, which is also its worktree folder's name.
  - `<base>` is the base the dispatch block records.
- It reads `worktree_root` and `ledger_root` from `.agents/plan.yaml`.
  - In the `projects:` form it reads them from the project whose `ledger_root` holds the state file.
  - The step's worktree is `<worktree_root>/<step>`, and the worktree's add leaves that `ledger_root` out.
  - No `.agents/plan.yaml`, no `worktree_root`, no `ledger_root`, a state file under no project's `ledger_root`, or no `checks.sh` in `land.sh`'s own folder is refused with exit 64 before anything is touched.
- Its check on main (Steps 6) is the plan's verify list: after main's cherry-pick it runs `sh <its own folder>/checks.sh <state file>` from the repository root.
  - Its own folder is the one that holds `land.sh`, and it looks for `checks.sh` nowhere else.
  - A non-zero exit fails the landing with exit 1 and the output of `checks.sh` printed.
- When `<base>..<step>` holds no commit, it skips both cherry-picks.
  - It prints `nothing to copy: <base>..<step> holds no commit` in place of the cherry-picks' output.
  - It still runs the verify list on main (Steps 6).
- It then prints the booking data: the diff stat against `<base>` and the paths staged on main.
- It exits 0 when the step landed and every check passed, 1 on a failed check or a stop, 2 on a conflict, and 64 when it refuses its arguments or its configuration, or with git's own status when a git step fails.
- `templates/checks.sh <state file>`, run from the root of the checkout it checks, runs the `verify:` list of the state file's first `yaml` block in order, each command through `bash -o pipefail -c`.
  - Before each command it prints `$ <command>`, then the command's output.
  - At the first command that exits non-zero it prints `checks: failed with exit <status>: <command>` and exits 1, and the commands after it do not run.
  - When every command exits 0 it prints `checks: <n> commands passed` and exits 0.
  - A list it cannot read is refused with exit 2 before anything runs, and never passes.
- `templates/land.test.sh` proves `land.sh` on scratch repositories: a conflict exits 2 and leaves main as it was, a ledger file left uncommitted in the worktree never reaches main, a failing check fails the landing, and a clean landing stages the step on main.
- `templates/checks.test.sh` proves `templates/checks.sh` on scratch state files.
- `land.sh`'s zero exit passes the checks on main (Steps 6).
  - It never passes the look (Steps 7), which it does not do.

## Removing a step's worktree

`/land` does this at Steps 13, after the landing commit, from the repository root of the main checkout. The `spec` skill's "Steps / A step taken back out of main" does it the same way for a kept worktree.

1. Take the step's `worktree`: `/land` read it from the dispatch entry at Steps 10, before the state file was rewritten, and a back-out reads it from the entry.
   - The branch is the worktree folder's name, and `<branch>-land` beside it, as `land.sh` names them.
   - No path or branch is built from the step id.
2. When the worktree still exists (`git worktree list` names it), from inside it, `git status --porcelain --untracked-files=all` lists every change, untracked files included. A worktree already gone skips steps 2 and 3.
   - Each path must be under the ledger root, `.agents/plan.yaml`'s `ledger_root` (in the `projects:` form, the one that holds the state file's folder). The ledger is written only on main, so its copies in the worktree are records already saved there or copies the orchestrator put there.
   - Any other path is a stop ("Stops") that names it, and nothing is removed.
3. Run `git worktree remove --force <worktree>`, when it still exists. Without `--force`, git refuses a worktree holding untracked or modified files, such as those ledger copies.
4. Run `git branch -D` for `<branch>` and for `<branch>-land`, each only when it exists. `-D` deletes them whether or not they are merged into main; after a cherry-pick neither is, since the cherry-pick made new commits.
5. These commands run without asking the user, since the step's work is committed on main.
   - When the runner refuses one of them, the session gives the user the command to run and waits.

## Stops

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| A red line for the user | A red line after the cherry-pick that no fix inside the brief closes, and what to do is a decision for the user | The failure, booked in the open items as Steps 6 says | The user's ruling or, under `self_rule: on`, for a first failure, the choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books; the second failure of a step's landing always waits for the user |
| A lock held | An `index.lock`, the worktree's or main's, still there after 60 s of waiting at Steps 3 or 4 | The lock's path, and what the stop leaves: main untouched; under `templates/land.sh`, the worktree on `<step>` or, after the script's checkout of `<step>-land`, on that branch, and the script exits 1 | The lock removed once no git command uses it, then `/land` again; `templates/land.sh`, run again on a main with nothing staged, returns the worktree to `<step>`, deletes `<step>-land` and lands from the start |
| A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/land` again |
| No ledger folder | No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan`, then the step prepared, built and refuted |
| No dispatch block | The state file holds no dispatch block naming this step | That the block is missing | `/spec` for the step |
| No verify runner | `templates/checks.sh` is not beside `templates/land.sh`, and `land.sh` exits 64 before anything is touched | The path it looked for | The `land` skill installed whole, then `/land` again |
| The step not ready | No builder's report; or no refuter report that is either newer than the builder's report or, after the step's repair rounds (up to `repair_rounds`, or one more under plan-orchestration's exception), carrying a run over the last round when `refute_after_repair: yes` (the orchestrator's read of the round when `no`); or a run over the last round owed and missing; or a finding, the last run's included, neither closed under the refuter report's Closed heading nor raised to the user as an open item | Which of these it is | What is missing supplied, then `/land` again |
| Main not clean | On main something staged, a git operation in progress, or one of the step's paths carrying an unrelated change of the user's | What it saw, the user's unrelated changes listed by path | Main put right, then `/land` again |
| Agents still running | The check of Steps 1 fails: an agent still listed | Each one left | Each one stopped, then `/land` again |
| A worktree that cannot be removed | At Steps 13, the worktree holds a path outside the ledger root, or a removal command fails ("Removing a step's worktree") | The open item, booked in the state file's open items and committed by path as a resume point: the worktree path and both branches, as Steps 10 read them, and what stopped the removal (each path outside the ledger root, or the command and what it printed) | The cause put right, such as the path moved out of the worktree or removed by the user, then "Removing a step's worktree" run on the worktree and branches the open item names; the open item is then closed |

- The first row is a stop: it leaves an open item.
- The second row is a stop that leaves no open item: main is untouched, and landing again resumes it.
- The rows after those two, up to the last, are refusals: they come before main is touched.
- The last row is a stop after the landing's commit that leaves an open item: the step is on main, and only its worktree and branches are left, named in the open item.
  - Removing them, as "Removing a step's worktree" says, finishes the landing and closes the open item.
- A refusal names its cause and leaves nothing.
- A red line recorded in the step's Step 0 is not a stop: the step is out of main and keeps its line and its tag.
- It is worked again as that step, with no new ruling, through `/spec`, once (Steps 6). `/spec` saves its work as a patch and prepares it again from main's head (the `spec` skill's "Steps / A step taken back out of main").

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Booking what was not re-read and re-run after its last fix | The booking then claims what nobody verified | Re-read and re-run it, then book it |

## Rules

- One step stays one implementation commit, which keeps each step traceable to its brief, its review and its booking.
- A landed step found short of its brief, or wrong, is raised to the user as an open item, by `plan-orchestration`'s "Stops".
  - The step that finishes it on top of what landed enters the plan only by a ruling of the user or, under `self_rule: on`, a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books.
- A landed commit is reverted only on a ruling of the user, or, under `self_rule: on`, on a choice `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books when the step's authority is a bullet ending "(self-rule)" alone; the revert of a step the user approved, or one a ruling of the user added, is kind 3.
  - Its preparation commit stays.
  - Only a step so reverted is booked as reverted.
- The state file is rewritten before the commit, so main's head always carries a state file that describes it.

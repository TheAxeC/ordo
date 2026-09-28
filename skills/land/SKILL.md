---
name: land
description: "Bring a refuted step from its worktree onto main and book it: the step's builder and reviewers stopped, a wip commit in the worktree, the cherry-pick of the whole range onto main, the verification commands on main, the look at the changed views where the configuration block's look: says, the interleaved A/B against the staged base binaries, the orchestrator's usage row, the booking in the plan, the state file rewritten, the landing report, the commit by explicit path list, the worktree and its branches removed. Refuses while a finding is left neither closed nor raised to the user as an open item, or with any red line. Triggers on: land <entry> <step>, land the step, cherry-pick the step, book the step."
metadata:
  version: "1.8.0"
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
| Where the plan stands and which command comes next | `/plan-help <entry>` |

## What it reads

1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
   - A required key missing is a refusal ("Stops").
2. The ledger folder: `<entry>` resolves to the folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title).
   - `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has.
   - No such folder is a refusal ("Stops").
3. The dispatch block naming this step, with its worktree and base.
   - None is a refusal ("Stops").
4. The ledger's `land.sh`, as "The landing script" says.
   - None is a refusal ("Stops").
5. `agents/reviews/<step>-report.md` and the refuter report `agents/reviews/<step>-refuter.md`, as the Stops row "The step not ready" requires them.
6. Main, in the state the Stops row "Main not clean" requires.
   - The user's unrelated changes are listed by path.
     - They are left alone.

## Steps

1. Stop the step's builder and every reviewer of the step, before anything in the worktree is committed.
   - An agent is stopped through the runner's stop tool.
   - Then the runner's agent listing must show none of them left.
   - A check that fails is a refusal before main is touched ("Stops").
2. Set `landing: cherry-picking` in the dispatch block.
3. In the worktree, from inside it, after waiting for its `index.lock` to go: `git add -A` scoped to the step's tree with the ledger root left out.
   - `git commit -q -m wip` when something is staged.
   - A builder that committed everything leaves nothing staged, and the landing makes no wip commit.
   - The landing removes a lock older than 60 s while no `git` process runs, as stale.
   - Each wait for a lock, here and on main before Steps 4, is bounded at 60 s of waiting.
     - At the bound the landing stops ("Stops").
4. On main: `git cherry-pick -n <base>..<step>`, the whole range from the recorded base, so the landing applies the complete reviewed change and never only the last fix.
   - A conflict is resolved by the orchestrator or the session, never by an agent.
   - The ledger's `land.sh` prints the conflicting paths and exits 2 instead.
   - A range with no commit, as when the step's only output is a ledger file, has nothing to copy, and the landing goes on to Steps 6.
5. Restore to main's copy, before anything else, a ledger file the cherry-pick deleted or rewrote; the ledger is written only on main.
   - The ledger's `land.sh` leaves the ledger root out of the worktree's add, so a ledger file left uncommitted in the worktree (a builder's report, any other ledger copy) never reaches main; a ledger file that a commit of the range holds still does.
6. Run the verification commands of the configuration block on main, in order, each through its filter, stopping at the first failure.
   - The step's verify list runs through this skill's `templates/verify.sh <state file>` from the root of the checkout it checks (main here).
   - The lines `verify.sh` prints are what the booking quotes.
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
   - The failure goes to the user as an open item only when only the user can decide what to do.
   - The state file and `plan.md` are then committed by path, a resume point.
     - The commit also holds the other ledger records the session wrote since the last one.
   - `/spec` then saves the step's work as a patch and prepares it again from main's head. The `spec` skill's "Steps / A step taken back out of main" says how.
7. Open the changed views, as "The look" says.
8. Run the A/B: the benchmark commands the configuration block's `bench:` line names, the staged base binary and the new one run alternately after warm-ups, at least ten runs each.
   - The mean, the standard deviation and the standard error of the difference are written to the scratchpad.
     - They are quoted in the booking.
   - A change past the noise band is a finding, fixed before the booking.
9. Produce the orchestrator's usage row with `templates/usage.py <session log> <from> <to>`: the session log is the running session's own, `<from>` the previous landing commit's `git log -1 --format=%cI`, `<to>` `date -Iseconds`.
   - The Usage section of `plan-orchestration` says where the session log is.
10. Append the booking to `plan.md` (or the part file the plan names): what landed and where, every premise correction, every finding outside the brief with the open item it was raised as, the verification lines, the A/B, the usage row.
    - Tick the step.
11. Read the step's `worktree` from its dispatch entry, for Steps 14.
    - Then rewrite the state file: the step's dispatch entry removed, the position line, the usage rows, the open items as they stand.
12. Write the landing report, `agents/reviews/<step>-landing.md`, so it lands with the step and stands alone on disk.
    - It opens with the position line: the roadmap entry with its title, the plan step as "step n of m" with its name, and the next step.
    - Then the open items, verbatim, which hold only what the user must rule on.
    - Then the check of Steps 1 with what it showed, anything NOT DONE, what landed with the commit, what was found, and what is next.
    - Under the loop it is also the report the orchestrator prints.
    - Run by hand, it is the message that ends the turn.
13. Commit by explicit path, a resume point: every path from `git diff --cached --name-only`.
    - The commit also holds the ledger files the session wrote since the last resume point, the landing report among them.
    - The paths are written out in the `git add -- <path> ...` command, never through a shell variable.
    - Deleted paths are already staged by the cherry-pick and are not re-added.
    - The message is in the repository's shape.
    - The message's last bullet is the booking.
    - No attribution.
    - Never push.
    - Afterwards `git status --short` shows nothing of the step's and no ledger file the session wrote.
    - Such a ledger file left modified means the commit missed the booking, and the head is amended with its path.
14. Remove the step's worktree and its branches, as "Removing a step's worktree" says, with the `worktree` Steps 11 read.

## The look

- When the configuration block's `look:` names where a changed view is shown and the step changes a view, the shell or anything a reader sees, the changed views are opened there at Steps 7.
- A screenshot is taken of each changed view and of each state the step's brief names, under the themes the step touches.
- What is wrong in them is fixed at landing when it is small and inside the brief, and raised to the user as an open item, as `plan-orchestration`'s Stops section says otherwise.
- The landing note names every view and state looked at and what was seen.
- An empty `look:` means the step has no look, and the note says so.

## The landing script

- A ledger holds `land.sh`, copied from `templates/land.sh` with its `ADAPT` edits made.
  - `/plan` copies it, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.py` into the ledger when it opens a plan.
- `/land` refuses a ledger without it ("Stops").
- It does Steps 3, 4 and 6 as one command, run from the repository root as `sh <ledger>/land.sh <step> <base>`.
- Its check on main (Steps 6) is the ledger's verify list: after main's cherry-pick it runs `sh <verify.sh> <the ledger's orchestrator-state.md>` from the repository root.
  - A non-zero exit fails the landing with the output of `verify.sh` printed.
- When `<base>..<step>` holds no commit, it skips both cherry-picks.
  - It prints `nothing to copy: <base>..<step> holds no commit` in place of the cherry-picks' output.
  - It still runs the verify list on main (Steps 6).
- It finds `verify.sh` and `usage.py` beside itself, then in this skill's `templates/` under the repository's `.agents/skills`, `~/.agents/skills` or `$CLAUDE_CONFIG_DIR/skills` (default `~/.claude/skills`).
  - A missing state file, or a `verify.sh` in none of those places, is refused before main is touched, with the places named.
- Its `ADAPT` edits are five:
  - `landing_worktree_root`, `.agents/plan.yaml`'s `worktree_root`, the folder that holds the step's worktree `<worktree_root>/<step>`, `.agents/worktrees` by default;
  - `landing_tool_path`, the folder the worktree's add is scoped to, `.` (the whole tree) by default;
  - `landing_ledger_root`, `.agents/plan.yaml`'s `ledger_root`, which the worktree's add leaves out;
  - the `ADAPT` block, for the dependency install the verify list needs and any check beyond the verify list, which runs nothing by default;
  - the model names of the usage rows.
- A browser check in the `ADAPT` block runs only when `landing_browser` is 1, which `--no-browser` sets to 0.
- It prints the diff stat, the usage rows (with `--session <session log> --since <previous landing commit time>`, the orchestrator's row through `usage.py`) and the staged paths.
- `templates/land.test.sh` proves it on scratch repositories, its verify list run and its lookup of `verify.sh` included, that its defaults run no browser step and no line count, and that a ledger file left uncommitted in the worktree never reaches main.
  - It proves `templates/usage.py` on a Claude Code log and its refusal of a file that is not one.
- The ledger's copies of `land.sh` and `land.test.sh` find `verify.sh` and `usage.py` beside themselves. Both run from the ledger with the four files beside each other, whatever `land` skill is installed.
- `templates/verify.test.sh` proves `templates/verify.sh` on scratch state files, starting it under `sh` and, when it is installed, `dash`.
- Its zero exit passes the checks on main (Steps 6).
  - It never passes the look (Steps 7), which it does not do.

## Removing a step's worktree

`/land` does this at Steps 14, after the landing commit, from the repository root of the main checkout. The `spec` skill's "Steps / A step taken back out of main" does it the same way for a kept worktree.

1. Take the step's `worktree`: `/land` read it from the dispatch entry at Steps 11, before the state file was rewritten, and a back-out reads it from the entry.
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
| A red line for the user | A red line after the cherry-pick that no fix inside the brief closes, and only the user can decide what to do | The failure, booked in the open items as Steps 6 says | The user's ruling |
| A lock held | An `index.lock`, the worktree's or main's, still there after 60 s of waiting at Steps 3 or 4 | The lock's path, and what the stop leaves: main untouched; under the ledger's landing script, the worktree on `<step>` or, after the script's checkout of `<step>-land`, on that branch, and the script exits 1 | The lock removed once no git command uses it, then `/land` again; the ledger's landing script, run again on a main with nothing staged, returns the worktree to `<step>`, deletes `<step>-land` and lands from the start |
| A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/land` again |
| No ledger folder | No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan`, then the step prepared, built and refuted |
| No dispatch block | The state file holds no dispatch block naming this step | That the block is missing | `/spec` for the step |
| No landing script | The ledger folder holds no `land.sh` | That it is missing, and `templates/land.sh` to copy | `templates/land.sh`, `templates/land.test.sh`, `templates/verify.sh` and `templates/usage.py` copied into the ledger, with the `ADAPT` edits made, as the `plan` skill's Steps 5 says, then `/land` again |
| The step not ready | No builder's report; or no refuter report that is either newer than the builder's report or, after the step's repair rounds (up to `repair_rounds`, or one more under plan-orchestration's exception), carrying a run over the last round when `refute_after_repair: yes` (the orchestrator's read of the round when `no`); or a run over the last round owed and missing; or a finding, the last run's included, neither closed under the refuter report's Closed heading nor raised to the user as an open item | Which of these it is | What is missing supplied, then `/land` again |
| Main not clean | On main something staged, a git operation in progress, or one of the step's paths carrying an unrelated change of the user's | What it saw, the user's unrelated changes listed by path | Main put right, then `/land` again |
| Agents still running | The check of Steps 1 fails: an agent still listed | Each one left | Each one stopped, then `/land` again |
| A worktree that cannot be removed | At Steps 14, the worktree holds a path outside the ledger root, or a removal command fails ("Removing a step's worktree") | The open item, booked in the state file's open items and committed by path as a resume point: the worktree path and both branches, as Steps 11 read them, and what stopped the removal (each path outside the ledger root, or the command and what it printed) | The cause put right, such as the path moved out of the worktree or removed by the user, then "Removing a step's worktree" run on the worktree and branches the open item names; the open item is then closed |

- The first row is a stop: it leaves an open item.
- The second row is a stop that leaves no open item: main is untouched, and landing again resumes it.
- The rows after those two, up to the last, are refusals: they come before main is touched.
- The last row is a stop after the landing's commit that leaves an open item: the step is on main, and only its worktree and branches are left, named in the open item.
  - Removing them, as "Removing a step's worktree" says, finishes the landing and closes the open item.
- A refusal names its cause and leaves nothing.
- A red line recorded in the step's Step 0 is not a stop: the step is out of main and keeps its line and its tag.
- It is worked again as that step, with no new ruling, through `/spec`. `/spec` saves its work as a patch and prepares it again from main's head (the `spec` skill's "Steps / A step taken back out of main").

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| Booking what was not re-read and re-run after its last fix | The booking then claims what nobody verified | Re-read and re-run it, then book it |

## Rules

- One step stays one implementation commit, which keeps each step traceable to its brief, its review and its booking.
- A landed step found short of its brief, or wrong, is raised to the user as an open item, by `plan-orchestration`'s "Stops".
  - The step that finishes it on top of what landed enters the plan only by the user's ruling.
- A landed commit is reverted only on the user's ruling.
  - Its preparation commit stays.
  - Only a step so reverted is booked as reverted.
- The state file is rewritten before the commit, so main's head always carries a state file that describes it.

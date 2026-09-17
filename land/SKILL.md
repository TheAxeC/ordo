---
name: land
description: "Bring a refuted step from its worktree onto main and book it: a wip commit in the worktree, the cherry-pick of the whole range onto main, the verification commands on main, the look at the changed views on the TEST page, the interleaved A/B against the staged base binaries, the orchestrator's usage row, the booking in the plan, the commit by explicit path list, the worktree and branch removed, the state file rewritten. Refuses while a finding is left neither closed nor booked, or with any red line. Triggers on: land <entry> <step>, land the step, cherry-pick the step, book the step."
metadata:
  version: "1.1.0"
---

# Land a step

`/land <entry> <step>` is the only way a step reaches main. It refuses before touching main when the step is not ready, and it stops at the first red line after, leaving main in a state the resumption rules of `plan-orchestration` recognise.

## What it requires

1. `.agents/plan.yaml`, the ledger folder, the dispatch block naming this step with its worktree and base. `<entry>` resolves to the ledger folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title); `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has. No such folder is a refusal that names `/plan`.
2. `agents/reviews/<step>-report.md`, and either `agents/reviews/<step>-refuter.md` newer than the report or, after the step's one repair round, the orchestrator's read of that round appended to the refuter report under a Closed heading, each finding closed there or booked in the state file's open items. Neither present, or a finding left open and unbooked, is a refusal that says which.
3. On main: nothing staged, no git operation in progress, and none of the step's paths carrying an unrelated change of the user's (listed by path and left alone).

## What it does, in order

1. Sets `landing: cherry-picking` in the dispatch block.
2. In the worktree, from inside it, after waiting for `.git/index.lock` to go: `git add -A` scoped to the step's tree and `git commit -q -m wip`.
3. On main: `git cherry-pick -n <base>..<step>`, the whole range from the recorded base, so the landing applies the complete reviewed change and never only the last fix. A conflict is resolved by the orchestrator or the session, never by an agent; the ledger's landing script, when there is one, prints the conflicting paths and exits instead.
4. A ledger file the worktree deleted or rewrote (a report written in both trees) is restored to main's copy before anything else; the ledger is written only on main.
5. The verification commands of the configuration block on main, in order, each through its filter, stopping at the first failure. A red line that a fix inside the brief closes is fixed on main, counted as a fix at landing and named in the booking with its cause; any other red line takes the step back out of main (`git restore --staged --worktree -- <paths>` for changed files, `git rm --cached` and delete for added ones, both on the ask list, so the user is asked) and booked in the state file's open items with the failure, never back to the builder.
5a. The look. When the step changes a view, the shell or anything a reader sees, the changed views are opened on the running page, on the page of the page strip named TEST (created through the page menu when it is missing, never a page the user works on), after the checks on main and before the booking: a screenshot of each changed view and of each state the step's brief names, under the themes the step touches. What is wrong in them is fixed at landing when it is small and inside the brief, and booked in the open items otherwise. The landing note names every view and state looked at and what was seen.
6. The A/B: the benchmark commands the configuration block's `bench:` line names, the staged base binary and the new one run alternately after warm-ups, at least ten runs each, mean and standard deviation and the standard error of the difference, written to the scratchpad and quoted in the booking. A change past the noise band is a finding fixed before the booking.
7. The booking appended to `plan.md` (or the part file the plan names): what landed and where, every premise correction, every finding outside the brief with the step it is booked at, the verification lines, the A/B, the usage row; the step ticked.
8. The state file rewritten: the dispatch block cleared, the position line, the usage rows, the orchestrator's row produced first by `templates/usage.py <session log> <from> <to>` (the session log the running session's own, `<from>` the previous landing commit's `git log -1 --format=%cI`, `<to>` `date -Iseconds`; the Usage section of `plan-orchestration` says where each harness keeps the log), the open items as they stand.
9. The commit by explicit path: every path from `git diff --cached --name-only` plus the ledger files, written out in the `git add -- <path> ...` command (never through a shell variable), with deleted paths already staged by the cherry-pick and not re-added; the message in the repository's shape, the last bullet the booking; no attribution; never push. Afterwards `git status --short` shows nothing of the step's and nothing of the ledger's; a ledger file left modified means the commit missed the booking, and the head is amended with the ledger paths.
10. `git worktree remove <worktree_root>/<step>` and `git branch -D <step>` (`-D`, since the cherry-pick made a new commit and the branch is never an ancestor of main).
11. The landing report, written to stand alone: the open items first, verbatim; anything NOT DONE; what landed; what was found; what is next.

## The landing script

A ledger may hold `land.sh`, copied from `templates/land.sh` with its `ADAPT` edits made, which does steps 2, 3 and 5 as one command and prints the diff stat, the usage rows and the staged paths; `templates/land.test.sh` proves it on scratch repositories, and proves `templates/usage.py` on a Claude Code log and a Codex rollout. When the ledger holds it, its zero exit is step 5's pass.

## Rules

- One step is one implementation commit, so undoing a step is `git revert` of that commit; the preparation commit stays, and a reverted step is booked as reverted.
- The state file is rewritten before the commit, so main's head always carries a state file that describes it.
- Nothing is booked that was not re-read and re-run after its last fix.

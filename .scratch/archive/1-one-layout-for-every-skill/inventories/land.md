# Rule inventory: land

- Old: `skills/land/SKILL.md` at `e643b34`
- New: `skills/land/SKILL.md`

| Old lines | Rule | New place |
|---|---|---|
| 2 | The skill's name, invoked as /land | Quick start |
| 3 | Bring a refuted step onto main and book it, the landing's parts in order | Steps |
| 3 | Refuses while a finding is neither closed nor booked, or with any red line | Stops |
| 3 | The trigger phrases | Quick start |
| 4 | The metadata key | Quick start |
| 5 | The version, 1.5.0, now 1.6.0 in metadata.version | Quick start |
| 10 | /land is the only way a step reaches main | Quick start |
| 10 | It refuses before touching main when the step is not ready | Stops |
| 10 | It stops at the first red line after, leaving main in a state the resumption rules recognise | Steps 5 |
| 14 | .agents/plan.yaml, its keys and defaults as /plan states them | What it reads 1 |
| 14 | A required key missing is a refusal that names it | Stops 2 |
| 14 | The dispatch block naming this step with its worktree and base is required | What it reads 3 |
| 14 | Without it the step is not ready: a refusal | Stops 4 |
| 14 | <entry> resolves to the folder whose plan.md opens with # Plan: <entry> | What it reads 2 |
| 14 | /plan names a new folder by the slug; an older plan keeps its folder | What it reads 2 |
| 14 | No such folder is a refusal that names /plan | Stops 3 |
| 15 | The report, and the refuter report newer than it, or after the rounds carrying the last round's run or the orchestrator's read | Stops 5 |
| 15 | Every finding closed under Closed or booked as its own step in the booked list | Stops 5 |
| 15 | Neither present, a run owed and missing, or a finding open and unbooked, is a refusal that says which | Stops 5 |
| 16 | On main nothing staged, no git operation in progress | Stops 6 |
| 16 | None of the step's paths carrying an unrelated change of the user's | Stops 6 |
| 16 | The user's unrelated changes listed by path and left alone | What it reads 5 |
| 20 | Set landing: cherry-picking | Steps 1 |
| 21 | In the worktree, after the index lock goes, git add -A scoped to the step's tree and a wip commit | Steps 2 |
| 22 | git cherry-pick -n of the whole range from the base, never only the last fix | Steps 3 |
| 22 | A conflict is resolved by the orchestrator or the session, never an agent | Steps 3 |
| 22 | The landing script prints the conflicting paths and exits | Steps 3 |
| 23 | A ledger file the worktree deleted or rewrote is restored to main's copy first | Steps 4 |
| 23 | The ledger is written only on main | Steps 4 |
| 24 | The verification commands on main, in order, through their filters, stopping at the first failure | Steps 5 |
| 24 | A small finding of the last round's refutation inside the brief is fixed on main, counted like a red line | Steps 5 |
| 24 | A red line a fix inside the brief closes is fixed on main, counted and named with its cause | Steps 5 |
| 24 | Any other red line takes the step out of main with the ask-list commands | Steps 5 |
| 24 | It is booked with the failure, never back to the builder, in the open items or the booked list | Steps 5 |
| 25 | The look: when look: names a place and the step changes a view, the views are opened there after the checks | The look 1 |
| 25 | A screenshot of each changed view and each state the brief names, under the themes touched | The look 2 |
| 25 | What is wrong is fixed at landing when small, else booked as its own step | The look 3 |
| 25 | The note names every view and state and what was seen | The look 4 |
| 25 | An empty look: means no look, and the note says so | The look 5 |
| 26 | The A/B: the bench: commands, base and new alternately after warm-ups, ten runs each at least | Steps 6 |
| 26 | Mean, standard deviation and standard error of the difference, written to the scratchpad and quoted | Steps 6 |
| 26 | A change past the noise band is a finding fixed before the booking | Steps 6 |
| 27 | The booking in plan.md or its part file, its contents, the step ticked | Steps 7 |
| 28 | The state file rewritten: the block cleared, the position, the usage rows, the open items | Steps 8 |
| 28 | The orchestrator's row first, by usage.py with the session log, from and to as stated | Steps 8 |
| 28 | The Usage section of plan-orchestration says where each harness keeps the log | Steps 8 |
| 29 | The commit by explicit path: the cached paths plus the ledger files, the landing report among them | Steps 9 |
| 29 | Written out in the git add command, never through a shell variable | Steps 9 |
| 29 | Deleted paths already staged are not re-added | Steps 9 |
| 29 | The message in the repository's shape | Steps 9 |
| 29 | The message's last bullet the booking | Steps 9 |
| 29 | No attribution | Steps 9 |
| 29 | Never push | Steps 9 |
| 29 | Afterwards git status shows nothing of the step's or the ledger's | Steps 9 |
| 29 | A ledger file left modified means the head is amended with the ledger paths | Steps 9 |
| 30 | The worktree removed and the branch deleted with -D | Steps 10 |
| 31 | The landing report, written before the commit, standing alone on disk | Steps 11 |
| 31 | Its contents: the open items first, the booked count, NOT DONE, what landed, what was found, what is next | Steps 11 |
| 31 | Under the loop the orchestrator prints it; by hand it ends the turn | Steps 11 |
| 35 | land.sh, copied from templates/land.sh with its ADAPT edits, does steps 2, 3 and 5 | The landing script 1 |
| 35 | It prints the diff stat, the usage rows and the staged paths | The landing script 2 |
| 35 | land.test.sh proves it and usage.py | The landing script 3 |
| 35 | Its zero exit is step 5's pass | The landing script 4 |
| 39 | One step is one implementation commit; undoing is git revert of it, and the preparation commit stays | Rules 1 |
| 39 | A reverted step is booked as reverted | Rules 2 |
| 40 | The state file is rewritten before the commit, so main's head carries a state file describing it | Rules 3 |
| 41 | Nothing is booked that was not re-read and re-run after its last fix | Anti-patterns 1 |

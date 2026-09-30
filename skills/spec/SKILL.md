---
name: spec
description: "Prepare one step of an open plan: refuse a step without the user's authority ((approved) or (ruling <name>)), check each premise of the step's text against the tree, under libraries: check, look for a library for each capability the step builds, a candidate being the user's choice, write the brief (checked premises, fix text, verification list, report shape, pointer to the rules file, cases, libraries checked, paths it writes), compare those paths with the briefs of steps in flight, a shared file judged by the orchestrator, run the brief check (a fresh read-only agent checks the brief against the tree, each finding closed in the brief), create the worktree at main's head, stage the base binaries, and record the dispatch in the state file. A step a red line took back out of main is prepared again, its old work saved as a patch in the ledger and applied in the new worktree. Triggers on: spec <entry> <step>, brief <step>, prepare step <n>, write the brief; and on a ruling typed in reply to a stop (Ruled: ...)."
metadata:
  version: "1.7.0"
---

# Prepare a step

`/spec <entry> <step>` prepares one step of an open plan for its builder. It leaves behind the brief and its brief check's report in the preparation commit, and the dispatch entry written to the state file. It also leaves the step's worktree at the base, and the base binaries copied aside.

## Quick start

```
/spec <entry> <step>     write the one file a builder works from, have a fresh agent check it against the tree, and put the tree in the state the builder expects
Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says; then /spec <entry> <step> again
```

## Use instead

| When | Use |
|---|---|
| The plan is not open yet | `/plan <entry>` |
| Every step of the plan, unattended | `/plan-orchestration <entry>` |
| The step is built and needs its review | `/refute <entry> <step>` |
| Where the plan stands and which command comes next | `/ordo-help <entry>` |

## What it reads

1. `.agents/plan.yaml`, its required keys and defaults as `/plan` states them.
   - A required key missing is a refusal ("Stops").
2. The ledger folder: `<entry>` resolves to the folder under `<ledger_root>/` whose `plan.md` opens with `# Plan: <entry>` (the number, or the number and title).
   - `/plan` names a new folder by the entry's slug, and an older plan keeps whatever folder it has.
   - No such folder is a refusal ("Stops").
3. `orchestrator-state.md`: the configuration block, the open items, and the dispatch block.
   - A step already in flight is a refusal, under the condition in "Stops".
   - A dispatch entry of this step that reads `landing: backed-out` is not a step in flight.
     - The step goes through "Steps / A step taken back out of main", which reads the entry's `base` and `worktree`.
   - The brief of each step the dispatch block names, `agents/briefs/<step>.md` beside the state file, for its "Paths this step writes" (Steps 5).
4. `plan.md`: the step's line, the rulings that touch it, and everything the plan carries to it.
   - The step list is the section `## Steps, in execution order`, and the rulings are the section `## Rulings`.
     - A `plan.md` without either section is a refusal ("Stops").
   - The step's authority is the tags that end its line: `(approved)` for a step of the list the user approved when the plan opened, or `(ruling <name>)` for each ruling it rests on.
   - Each ruling a tag names is a line of the Rulings section that ends with "(the user)", named as the tag reads it: `<L>` for a line `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, and the text before its first ` (` for any other line.
   - A step without that authority is a refusal ("Stops"), checked at Steps 1.
   - A step not in the list is a refusal ("Stops"), with the list printed.
   - For a step taken back out of main, the failure its landing recorded under the step's Step 0.
5. The tree, on main at its head, for every count, path, name, line number and claim the step's text makes.
   - Each is checked with a grep or a probe, never taken from the plan's text.
   - The ADRs in the folder the configuration block's `adr` names (`docs/adr` when the block has none): each `NNNN-*.md` file in the folder, listed in its `README.md` or not, and the decision of each record in force. A record is in force except for the part its own opening lines, or a later record, say is superseded, in whatever words the repository uses. Its decision is its Decision section, or, in a record without one, the text that states what was decided. A record touches the step when its decision governs a file, a name, a rule or a behaviour the step's text changes.
6. The brief check's report, the final message of the agent that "Steps / The brief check" starts.

## Steps

1. Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
   - Any unrelated change of the user's outside the ledger folder is listed by path.
     - It is left alone.
   - Every uncommitted change under the ledger folder is listed by path (`git status --short -- <ledger>`).
   - A change the session itself made since the last resume-point commit is one of its own records. Such a change is a ruling it booked, or a report or a reviewer it recorded.
   - The preparation commit carries the session's own records (Steps 6).
   - Any other change under the ledger folder is left alone.
     - It is never committed.
   - An uncommitted change on the ledger's `plan.md` or state file that the session did not make is a refusal ("Stops"), named by path. Steps 2 and 9 write those files.
   - `plan.md` is copied aside to the session's scratch folder before Steps 2.
     - A step that waits at Steps 5 restores it with the session's own records, so a booked ruling is never lost.
   - An uncommitted change at the brief's path `agents/briefs/<step>.md` is a refusal ("Stops"), named by path, since Steps 4 writes the brief there.
   - An uncommitted change at the brief check's report path `agents/reviews/<step>-brief-check.md` is a refusal ("Stops"), named by path, since "Steps / The brief check" saves the report there.
   - The runner lists the effort agent `ordo-<reviewer_effort>` among its agent types, the level `high` when the configuration block has no `reviewer_effort` key, since "Steps / The brief check" starts that agent.
   - `CLAUDE_CODE_EFFORT_LEVEL` is unset: `printenv CLAUDE_CODE_EFFORT_LEVEL` exits 1.
   - Either effort check failing is the refusal "The configured effort cannot apply" ("Stops"), and writes nothing.
   - A preflight that fails is a refusal ("Stops").
   - Then, before any premise check, read the step's line and the Rulings section of `plan.md`, as "What it reads" 4 says.
   - A step whose line carries the user's authority goes on.
     - The session notes the tags that give it.
   - A step without it is a refusal ("Stops") that names the step and the authority it lacks, and says the user's ruling is needed.
   - A `plan.md` that is missing or not UTF-8, lacks a section, or lists a step twice is a refusal ("Stops").
   - A step not in the list is a refusal ("Stops"), with the list printed.
   - A refusal here writes nothing.
   - A step whose dispatch entry reads `landing: backed-out` then goes through "Steps / A step taken back out of main" before Steps 2.
2. Check every premise the step's text makes against the tree.
   - A premise found false that the plan can absorb is corrected in `plan.md` before the brief exists, never left for the builder to hit.
   - That correction goes into the preparation commit (Steps 6).
   - The brief records the correction beside the premise.
   - A premise found false that the plan cannot absorb is a stop ("Stops"): its correction would change the step's scope, or make a choice the user would see.
   - Read the ADRs the step touches, as "What it reads" 5 says. The brief names each under "What is on the tree", with its number, its title and the sentence of its decision the step is under, or says that no ADR touches the step.
   - A step's text that contradicts the part in force of an ADR is a rule clash, a stop ("Stops"). The open item names the ADR and quotes the step's words that contradict it. Its options are the step changed to follow the ADR, or a new ADR that supersedes it, as the ADR folder's `README.md` says.
3. Look for libraries, as `.agents/plan.yaml`'s `libraries` says, before the brief is written.
   - Under `libraries: check`, the session looks for existing libraries for every capability the step builds.
   - A candidate that could replace code the step would write by hand is a stop ("A user-visible choice", "Stops").
   - The stop gives the options (each candidate, and writing it by hand), the pros and cons of each, and one recommendation.
   - A candidate the user has already ruled on for the capability the step builds, named with that capability by a line of `plan.md`'s Rulings section, is settled: the brief records that ruling under "Libraries checked", and the candidate does not stop `/spec` again. A ruling on the same candidate for another capability settles nothing.
   - For each candidate the brief records its version, license, maintainer, last release, compatibility with the project's dependencies, what it would replace and what stays hand-written.
   - Bundle size is not a criterion unless the project's rules page or one of its standards pages names one.
   - With no candidate, the brief says so.
   - Under `libraries: avoid`, the brief says the step adds no new dependency.
4. Write `agents/briefs/<step>.md` from `templates/brief.md`.
   - The first line points at the rules file the configuration names, and at the standards it lists.
   - The premises as checked, with the command that checked each.
   - The ADRs the step touches, as Steps 2 names them.
   - The fix text, in the brief's own words, not a pointer.
   - The verification commands from the configuration block plus the step's own gate, each with the directory it runs from and the output that counts as a pass.
   - The report shape, with the cases' first run before the result table.
   - Under "Cases", every must-pass and must-refuse example the step's text gives, in one list, each an input and its expected result, and the builder's first task as the template states it: the first run of every case on the unchanged tree before any change, a case of a code step as a test and a case of a text or judgment step by reading, and a case the brief's rules get wrong handed back before any code changes.
     - For a code step (a script, or a product's code), the list also holds the inputs the step's text implies but never states, as `templates/brief.md`'s "Cases" names them, each with its expected result, found by the session writing the brief from the rules of the code the step builds or changes and from that code's callers.
   - Under "Paths this step writes", every path the step writes, one per line, the report path included: ``- `<path>` `` for a whole file, or ``- `<path>` lines <a>-<b>` `` for a range of a shared document, numbered as on main at the base.
   - A choice the plan leaves open is taken in the brief.
     - It is listed under "Decisions taken in this brief", each reversible.
   - Under "Libraries checked", what Steps 3 found: each candidate with its facts and the library the user ruled, "none found", or, under `libraries: avoid`, that the step adds no new dependency.
   - A choice that decides a format or a rule the builder applies across the tree (a directive shape, an anchor rule, a naming rule, a file layout) is run by the session writing the brief on at least five real cases from the tree.
     - The brief quotes each input and its output under the decision, so an unreadable or wrong result is seen before dispatch.
   - Every item of "What to build" is a change whose content is known.
   - An item of the form "find why X happens and end it" is investigation: the session writing the brief does it first, read-only, and writes the found cause and its fix into the item.
     - A cause it cannot find is left out of the brief.
     - Such a cause is raised to the user as an open item.
   - A user-visible choice (a public shape, a wire format, a config key, a vocabulary) is not taken.
     - It is a stop ("Stops").
   - For a step taken back out of main, whose Step 0 in `plan.md` records the failure its landing met, the brief carries that failure.
   - The ledger may hold the step's patch `agents/reviews/<step>-backed-out.patch` ("Steps / A step taken back out of main"). The brief then names its path and says Steps 7 applies it with `git apply --3way`.
   - The brief is committed at Steps 6, before the apply.
     - Its section "The patch as applied" is added after Steps 7, as Steps 7 says.
5. Compare the brief's "Paths this step writes" with the brief of every other step in the dispatch block, by reading them.
   - No shared path: the step goes on.
   - A shared path is a file both briefs name, whatever lines each names. It is not a refusal.
     - It goes to the orchestrator's judgment, as `plan-orchestration`'s "Two steps in flight" says, and run by hand, the session judges.
   - When the merge at landing is judged simple, the step goes on.
     - Steps 9 writes `shared_paths:` in its dispatch entry, naming each shared file and why the merge is simple.
   - When it is not judged simple, the step waits until the other step lands.
     - This run leaves nothing. The brief is restored to main's copy (`git restore -- <path>`, or deleted when main has none).
   - `plan.md` is put back from the copy Steps 1 saved, and no commit, worktree or dispatch entry is made.
   - What "Steps / A step taken back out of main" did stays done.
     - The patch stays in the ledger.
     - `/spec` run again prepares the step with that patch.
   - `/spec` run again redoes Steps 2 from the start, so the premise checks and their amendments are made again on the tree as it then is.
   - A step that goes on runs "Steps / The brief check", after the path comparison and before the preparation commit.
   - Steps 5 is done when every finding of the brief check is closed in the brief, or when the step waits or has stopped.
6. Make the preparation commit, a resume point ("Rules").
   - It holds the brief, the brief check's report, the patch of a step taken back out of main, and each of the session's own records (Steps 1).
   - It holds `plan.md` and the state file when this run or the session's own records changed them.
   - The paths are written out in the `git add -- <path> ...` command.
     - A ledger change the session did not make is not among them.
   - Its hash is the base.
7. Create the worktree from the base: `git worktree add -b <step> <worktree_root>/<step> <base>`.
   - Then, from inside it, `git sparse-checkout set <worktree_paths>` when the block names any.
   - Then, for a step whose patch the ledger holds, from inside the worktree: `git apply --3way <repository root>/<ledger>/agents/reviews/<step>-backed-out.patch`. The patch is named by its path in the main checkout, since a sparse checkout may leave the ledger out.
     - Read what it prints.
   - A file named in an `error:` line, such as one main deleted or renamed, makes the whole apply fail. The apply is run again with `--exclude=<path>` for each such file, until the rest applies.
   - A binary file left unmerged takes the patch's copy with `git checkout --theirs -- <path>`.
   - Before the dispatch commit, the session adds the section "The patch as applied" to the brief.
     - The section lists the files applied clean and the files left with conflict markers, which the builder finishes from the markers.
     - It lists the files skipped, which the builder rebuilds against main's tree from their part of the patch, named by path.
     - It lists the binary files given the patch's copy, which the builder checks against main's change to them. That change is the commits `git log --oneline <old base>..main -- <path>` lists, the old base being the `base` of the removed entry.
   - Nothing is committed in the worktree: `/land`'s wip `git add -A` stages the files the builder finishes, so the builder runs no git command that changes state.
   - Then the dependency install the project needs.
8. Stage the base binaries for the landing's A/B, copied aside from the current build.
   - The configuration block's `bench:` line names them; none named, none staged.
9. Write the dispatch block into the state file: step, executor, worker, worktree, base, launched, report path, `brief_check` ("Steps / The brief check"), `landing: not-started`, `round: 0`.
   - The entry takes the shape the `plan` skill's `templates/orchestrator-state.md` gives: one entry, `dispatch:` followed by its keys, when `workers_at_once` is 1; appended to the list of entries when it is above 1.
   - The executor is the configuration block's default, until the orchestrator chooses for the step.
   - A step whose brief shares a file with a step in flight, judged simple to merge at Steps 5, gets `shared_paths:` in its entry: each shared file and why the merge is simple. With no shared file the key is left out.
   - The entry is not committed here.
     - It is committed once the builder's identity is in it: under `agent` right after the launch, and under `inline` and `academic-paper` before the build starts.
   - For a step whose patch Steps 7 applied, that commit also carries the brief with its section "The patch as applied".
   - Under `plan-orchestration`, its Steps 4 makes that commit under every executor.
   - Run by hand, the session writes itself as the identity.
     - It makes that commit before the build starts.
   - The worker's identity goes into the block the moment it is known.

### A step taken back out of main

A step whose dispatch entry reads `landing: backed-out` has its old worktree and branches kept by `/land` (the `land` skill's Steps 6). The session, which may run git, saves its work and removes them from the repository root on main, before Steps 2:

1. Read the entry's `base` and `worktree`.
   - The branch is the worktree folder's name, and `<branch>-land` beside it.
   - No path or branch is built from the step id.
2. From inside the kept worktree, `git status --porcelain --untracked-files=all` lists only paths under the ledger root.
   - Any other path is a refusal ("Stops") that names it, and nothing is removed.
3. Write `git diff --binary <base> <branch>` to `agents/reviews/<step>-backed-out.patch` beside the state file. With `--binary` the patch carries a binary file's content.
   - Run the diff again, and compare the two with `cmp`.
   - Two diffs that differ are a refusal ("Stops"), and nothing is removed.
   - An empty diff writes no patch.
     - It removes a patch an earlier back-out of the step left there.
4. Remove the worktree and branches, as the `land` skill's "Removing a step's worktree" says: `git worktree remove --force <worktree>`, then `git branch -D` for `<branch>` and `<branch>-land`, each only when it exists.
   - These commands run without asking the user, since the step's work is saved in the checked patch.
   - When the runner refuses one of them, the session gives the user the command to run and waits.
5. Remove the entry from the dispatch block.
   - Read the state file back: the other entries, the comment and blank lines under `dispatch:`, and every other byte as they were.
6. Go on with Steps 2, which prepares the step as any step, from main's head.
   - Steps 4 writes a new brief over the old one, which stays in git's history, with the failure and the patch.
   - Steps 6 makes a new preparation commit.
   - Steps 7 makes a new worktree with the patch applied by `git apply --3way`.
   - Steps 9 writes a new dispatch entry at `round: 0`, `landing: not-started`.

### A stop

1. Leave three things and nothing else.
   - The open item in the state file. It holds the step, what the tree shows against the step's text, the choice the user owns with its options and the pros and cons of each, and one recommendation with its reasons.
     - Each option states in full every approval it would need later whose content exists when the option is written, such as what a new script computes or a change to the configuration or the verification list; the user's ruling then approves them too.
     - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, and the approval stop of a skill the option runs, such as `/roadmap`'s shown diff, stay stops of their own, and the option names each of them.
   - The same text under the step's Step 0 in `plan.md` or the part file it names.
   - The ledger files the session wrote, committed by path as a resume point, so the stop survives the session.
2. No brief, no worktree and no dispatch block exist for the stopped step.

### A ruling

1. The user closes a stop by typing the ruling as plain text, in any session on the repository:

   ```
   Ruled: <the choice, one clause per question the open item asked>
   ```

2. On that message the session books the ruling and nothing else:
   - the open item is closed with the ruling's text and its date;
   - the step's text in `plan.md` is rewritten to what was ruled;
   - a step the ruling adds or splits gets its own line in the step list, ending with `(ruling <name>)`, and its own Step 0, its carried premises with it;
   - a ruling that adds or splits a step is also written in the Rulings section as a line ending with "(the user).";
   - for such a ruling, the step's tag names the Rulings line as "What it reads" 4 reads it: `<L>` for a line `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, and the text before its first ` (` for any other line;
   - a ruling that sets a public shape, a vocabulary, a rule or a library choice is also written where the plan keeps its rulings, so later premise checks and the library search of Steps 3 read it;
   - a ruling that answers a rule clash with a new ADR, raised by `/spec` or by `/refute`, is carried out before the step goes on:
     - the session writes the new record, numbered after the folder's highest, in the form of the folder's `template.md` or, with none, of its latest record, with status `proposed`;
     - its decision is the ruled option in the open item's words, its context the facts the open item gives, its alternatives rejected the old record's decision and each other option with the con the open item gave it, and its consequences what the open item says follows;
     - the old record is marked superseded in the words the folder uses (`superseded by NNNN` under the template), and the new record gets its row in the folder's index when there is one;
     - the session shows the user the new record and commits these files by path at once, a resume point, so that `/spec` or `/land` in any session reads them;
   - the ledger files are written and not committed on their own: the next `/spec` carries them in its preparation commit (Steps 6).
3. Then `/spec <entry> <step>` is typed again. It rechecks every premise against the tree, the ruled text included, and writes the brief.

### The brief check

Steps 5 says when this runs.

1. Start one fresh agent as the effort agent `ordo-<reviewer_effort>`, on the model the configuration block's `reviewer:` names, never the session that wrote the brief.
   - It reads the brief, `plan.md`'s Goal, the step's line and the Rulings section, the rules file and the standards the configuration names, and the tree on main at its head.
   - It changes nothing: every finding goes into its report.
   - It invokes no skill: it runs the reads and commands of item 2 itself.
   - It starts no agent: every read and every command runs in its own session.
   - It writes `<REDACTED>` in place of the value of a secret in every line it quotes, as the rules file's rule on secrets in quoted command output says.
   - Right after the start, the session reads the model the runner served the agent, from the runner's record of the agent as `plan-orchestration`'s "Launching a builder" says.
   - A served model that is not the configured one is the stop "A model other than the configured one" ("Stops"): the agent is stopped through the runner's stop tool, and nothing it wrote is used.
2. The agent runs these checks and reports each with the command that shows it and that command's output:
   - **Names.** Every name the step changes (a file, a heading, a key, a function, a term) is grepped across the repository, and every hit outside the brief's "Paths this step writes" is listed, each with whether the change makes it false.
   - **The step line.** Every part of the plan's step line is present in "What to build": each item is mapped to the part of the line it serves, and a part with no item is named.
   - **Premises.** Every command of the brief's "What is on the tree" is rerun, and its output is compared with what the brief says.
   - **Cases and checks.** Every case of "Cases" is read against the rules file and the standards, and a case inconsistent with them is named.
   - **The question.** Each case, the check on the step's line and the check of each item of "What to build" is asked "could this pass without the goal being reached?", "the goal" being the part of the plan's goal the step delivers, and the answer is given with its reason.
   - **Implied inputs.** For a code step (a script, or a product's code), the inputs the step implies but never states are listed under "Cases", as `templates/brief.md`'s "Cases" asks, and each one missing is named with its expected result.
   - **ADRs.** Every `NNNN-*.md` record in the folder the configuration block's `adr` names (`docs/adr` when the block has none) is read for its part in force, as "What it reads" 5 says. Each one the step touches is named with the sentence of its decision the step is under. A part of the brief that contradicts one is named, and so is an ADR the step touches that the brief's "What is on the tree" does not name.
   - The checks are done when each has its findings, or "none".
3. The agent's final message is its report, in the shape of `templates/brief-check.md`: one heading per check of item 2, each with its findings or "none", then "Declined to judge", then the agent's usage.
   - The session saves it at `agents/reviews/<step>-brief-check.md` beside the state file, the usage line filled with the agent's served model (item 1) and its tokens, tool uses and time from its completion notice.
   - When that file already holds the report of an earlier run of the step, one that stopped, the session appends the new report below it, whole, its title line naming the commit it ran on.
4. The session closes each finding by a change to the brief, before the preparation commit.
   - Each change is named under the report's "Closed" heading, beside its finding.
   - The check runs once per `/spec` run: the brief as changed goes to the builder without a second run.
   - A finding whose fix would change the step's scope, or make a choice the user would see, is a stop ("Stops"), left as "Steps / A stop" says.
   - A contradiction the **ADRs** check finds in the step's text is the stop "A rule clash with an ADR", as Steps 2 says. One found only in the brief's own wording is closed by a change to the brief that follows the ADR.
   - At such a stop the brief is restored to main's copy (`git restore -- <path>`, or deleted when main has none).
   - At such a stop the report is among the ledger files the stop commits.
   - This item is done when every finding has its change under "Closed", or the step has stopped.
5. The dispatch entry (Steps 9) records the report's path under `brief_check`, with each run's served model and its tokens, tool uses and time, an earlier run's read from its usage line in the report.
   - The report is committed as Steps 6 says.

## Stops

The first five rows are stops, which leave an open item as "Steps / A stop" says. The rest are refusals. A refusal names its cause and leaves nothing beyond what "Steps / A step taken back out of main" has already done.

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| A false premise the plan cannot absorb | A premise the step's text makes is false on the tree, and its correction would change the step's scope or make a choice the user would see (Steps 2); the skill does not guess | The open item, booked in the open items | A ruling ("Steps / A ruling") |
| A rule clash with an ADR | The step's text contradicts the part in force of an ADR the step touches (Steps 2, or the **ADRs** check of "Steps / The brief check") | The open item, booked in the open items, naming the ADR and quoting the step's words that contradict it | A ruling |
| A user-visible choice | The brief would have to choose a public shape, a wire format, a config key or a vocabulary, or, under `libraries: check`, a library could replace code the step would write by hand (Steps 3) | The open item, booked in the open items | A ruling |
| A brief check finding the brief cannot absorb | A finding of the brief check whose fix would change the step's scope or make a choice the user would see ("Steps / The brief check") | The open item, booked in the open items, with the report's path | A ruling |
| A model other than the configured one | The runner served the brief-check agent a model that is not the configured one: a different model family, or an older version than the newest the configured alias names in the runner's model list ("Steps / The brief check") | The open item, booked in the open items, with the configured value, the served model and the Claude Code version | A ruling |
| A step without the user's authority | The step's line ends with neither `(approved)` nor a `(ruling <name>)` for each ruling it rests on, each naming a ruling of the user in the Rulings section, or it starts with `Removed by` (Steps 1) | The step and the authority it lacks | The user's ruling, booked as "Steps / A ruling" says with the tag on the step's line, then `/spec` again |
| An unusable `plan.md` | `plan.md` is missing or not UTF-8, lacks the step list or the Rulings section, or lists a step twice (Steps 1) | What is wrong in it | `plan.md` put right, then `/spec` again |
| A failed preflight | Not on `main`, something staged, a git operation in progress, an uncommitted change at the brief's path or at the brief check's report path, or one on the ledger's `plan.md` or state file that the session did not make (Steps 1) | What it saw | The tree put right, then `/spec` again |
| A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/spec` again |
| No ledger folder | No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan`, then `/spec` |
| A step in flight | A step is already in flight, and the configuration block does not allow more than one | The step in flight, named | That step landed, or a red line took its landing back out of main and its dispatch block reads `landing: backed-out` (the `land` skill's Steps 6) |
| No such step | The step is not in `plan.md`'s list (Steps 1) | The list | `/spec` with a step in the list |
| The configured effort cannot apply | The runner lists no `ordo-<level>` agent for the level the configuration block's `reviewer_effort` names, or `CLAUDE_CODE_EFFORT_LEVEL` is set, which runs every agent at its level whatever the definition says (Steps 1) | The missing agent, or the variable's value | The effort agents installed as the plan skills are, or the variable unset, then `/spec` again in a new session |
| A step taken back out of main that cannot be saved | At "Steps / A step taken back out of main", a path in the kept worktree outside the ledger root, two diffs that differ, a failed git command, or a state file that cannot be written or does not read back | The path, or the command and what it printed | The cause put right, then `/spec` again. The user moves the path out of the worktree or removes it, makes the ledger or the state file writable, or corrects the entry |

## Anti-patterns

| Anti-pattern | Why it fails | Do instead |
|---|---|---|
| A brief that tells the builder where to look | A builder told only where to look will not meet what it did not read | Write every requirement the step is judged on into the brief in its own words: the acceptance list, the tests, the conventions, the checks |
| A runner or a vendor named in the brief | The brief then ties the step to how it is launched, which `plan-orchestration`'s "Launching a builder" alone says | Leave it out |
| History in the brief | It tells the builder what went wrong, not what to build | What to build, and why |

## Rules

- Every git command on a worktree runs from inside it, never as `git -C`.
- A ledger record is committed only at a resume point, as `plan-orchestration`'s "Resuming, and handing the plan over" lists them.
  - Only the session that wrote it commits it.
- Every other record stays on disk in the main checkout until the next resume point.

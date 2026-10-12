---
name: spec
description: "Prepare one step of an open plan: refuse a step without its authority ((approved) or (ruling <name>)), check each premise of the step's text against the tree, under libraries: check, look for a library for each capability the step builds, a candidate being the user's choice, or under self-rule the orchestrator's, write the brief (checked premises, fix text, verification list, report shape, pointer to the rules file, cases, libraries checked, paths it writes), compare those paths with the briefs of steps in flight, a shared file judged by the orchestrator, run for a full step the brief check by a fresh read-only agent, create the worktree at main's head, stage the base binaries, and record the dispatch in the state file. A step a red line took back out of main is prepared again, its old work saved as a patch in the ledger and applied in the new worktree. Triggers on: spec <entry> <step>, brief <step>, prepare step <n>, write the brief; and on a ruling typed in reply to a stop (Ruled: ...)."
metadata:
  version: "5.0.0"
---

# Prepare a step

`/spec <entry> <step>` prepares one step of an open plan for its builder. It writes the step's dispatch entry into the state file at the end of its preflight, so the step is in flight from the start of its run, and fills the entry at its end. It leaves behind the brief and, for a full step, its brief check's report in the preparation commit, and the filled dispatch entry. It also leaves the step's worktree at the base, and the base binaries copied aside.

## Quick start

```
/spec <entry> <step>     write the one file a builder works from, have a fresh agent check it against the tree for a full step, and put the tree in the state the builder expects
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
   - `/plan` names a new folder by the entry's slug.
   - An older plan keeps whatever folder it has.
   - No such folder is a refusal ("Stops").
3. `orchestrator-state.md`: the configuration block, the open items, and the dispatch block; and the dispatch block of every other open plan's `orchestrator-state.md`.
   - The limit on steps in flight is `.agents/plan.yaml`'s `workers_at_once`, counted over the dispatch blocks of every open plan, as `plan-orchestration`'s "Two steps in flight" states it.
   - A step is refused when the steps in flight of all open plans already reach that limit ("Stops").
   - A step is in flight from the start of its `/spec`: its dispatch entry at `landing: preparing` counts, as `plan-orchestration`'s "Two steps in flight" says.
   - The count leaves out this step's own entry, which an earlier `/spec` of this step may have left (Steps 1).
   - A dispatch entry of this step that reads `landing: backed-out` is not a step in flight.
     - The step goes through "Steps / A step taken back out of main", which reads the entry's `base` and `worktree`.
   - The brief of each step in flight in those dispatch blocks, `agents/briefs/<step>.md` beside its own plan's state file, for its "Paths this step writes" (Steps 5).
     - A step at `landing: preparing` has a brief to read only once its `/spec` has written it.
4. `plan.md`: the step's line, the rulings that touch it, and everything the plan carries to it.
   - The step list is the section `## Steps, in execution order`, and the rulings are the section `## Rulings`.
     - A `plan.md` without either section is a refusal ("Stops").
   - The step's authority is the tags that end its line: `(approved)` for a step of the list the user approved when the plan opened, or `(ruling <name>)` for each ruling it rests on.
   - Each ruling a tag names is a line of the Rulings section that ends with "(the user)" or "(self-rule)", each with or without a full stop after it, named as the tag reads it: `<L>` for a line `- Open item <L> (<date>): ...` or `- Open item <L>: ...`, and the text before its first ` (` for any other line.
     - A line ending "(self-rule, replaced by <name>)." is no ruling.
   - A step without that authority is a refusal ("Stops"), checked at Steps 1.
   - A step not in the list is a refusal ("Stops"), with the list printed.
   - For a step taken back out of main, the failure its landing recorded under the step's Step 0.
5. The tree, on main at its head, for every count, path, name, line number and claim the step's text makes.
   - Each is checked with a grep or a probe, never taken from the plan's text.
   - The ADRs in the folder the configuration block's `adr` names (`docs/adr` when the block has none): each `NNNN-*.md` file in the folder, listed in its `README.md` or not, and the decision of each record in force.
     - A record is in force except for the part its own opening lines, or a later record, say is superseded, in whatever words the repository uses.
     - Its decision is its Decision section, or, in a record without one, the text that states what was decided.
     - A record touches the step when its decision governs a file, a name, a rule or a behaviour the step's text changes.
6. For a full step, the brief check's report, the final message of the agent that "Steps / The brief check" starts.

## Steps

1. Run the preflight, before any write: on `main`, nothing staged, no git operation in progress.
   - Any unrelated change of the user's outside the ledger folder is listed by path.
     - It is left alone.
   - Every uncommitted change under the ledger folder is listed by path (`git status --short -- <ledger>`).
   - A change the session itself made since the last resume-point commit is one of its own records, and the commit of the plan it belongs to carries it (`plan-orchestration`'s "Resuming, and handing the plan over"):
     - a ruling it booked;
     - a report or a reviewer it recorded;
     - a diagnosis record, with the text the diagnosis wrote in Step 0;
     - the diagnosis agent's numbered item in the Agents section;
     - the verify list it rewrote in the state file, as the compare below says;
     - the brief, the brief-check report, the `preparing` entry and the `plan.md` changes of an interrupted `/spec` of this step that this run takes over ("Steps / A `/spec` taken over");
     - the brief-check report that a wait of this step at Steps 5 left on disk.
   - The brief and the brief-check report of a `/spec` waiting on its brief check are carried as "Steps / The brief check" 1 says.
   - A change under another open plan's ledger folder is a record of that plan.
     - It is listed by path.
     - It is left alone, except for the fix at landing of the `land` skill's Steps 6.
     - It is not one of the user's changes.
   - The preparation commit carries the session's own records of this plan (Steps 6).
   - Any other change under the ledger folder is left alone.
     - It is never committed.
   - An uncommitted change on this plan's `plan.md` or state file that the session did not make is a refusal ("Stops"), named by path, since Steps 1, 2 and 9 write those files.
   - `plan.md` is copied aside to the session's scratch folder before Steps 2.
     - A step that waits at Steps 5 puts back the copy's text for this run's premise corrections.
     - It keeps every other change `plan.md` then holds: the session's own records of the list above, so a booked ruling is never lost, and the booking of a step that landed meanwhile.
   - An uncommitted change at the brief's path `agents/briefs/<step>.md` is a refusal ("Stops"), named by path, since Steps 4 writes the brief there.
     - The brief of a `/spec` taken over is no such change.
   - An uncommitted change at the brief check's report path `agents/reviews/<step>-brief-check.md` is a refusal ("Stops"), named by path, since "Steps / The brief check" saves the report there.
     - The report of a `/spec` taken over, and the report that a wait of this step at Steps 5 left on disk, are no such change.
   - The runner lists the effort agent `ordo-<reviewer_effort>` among its agent types, the level `high` when the configuration block has no `reviewer_effort` key, since "Steps / The brief check" and the diagnosis of Steps 2 start that agent.
   - `CLAUDE_CODE_EFFORT_LEVEL` is unset: `printenv CLAUDE_CODE_EFFORT_LEVEL` exits 1.
   - Either effort check failing is the refusal "The configured effort cannot apply" ("Stops"), and writes nothing.
   - The step's worktree path `<worktree_root>/<slug>-<step>` and its branch `<slug>-<step>` do not exist, `<slug>` being the name of the plan's ledger folder, apart from those of this step's own dispatch entry that reads `landing: backed-out`.
   - A `/spec` taken over after its preparation commit finds the worktree and the branch its interrupted run made, which are no refusal.
   - A path or a branch that exists is the refusal "A worktree or branch that exists" ("Stops"), which names it and writes nothing.
   - The steps in flight of all open plans, this step's own entry left out, are fewer than `.agents/plan.yaml`'s `workers_at_once` ("What it reads" 3).
     - Otherwise the refusal is "A step in flight" ("Stops"), which names them and writes nothing.
   - This step's own dispatch entry at `landing: preparing` belongs to an earlier `/spec` of the step.
     - When its `brief_check` reads `"running: <agent id>"` and the runner still lists that agent, that `/spec` is waiting on its brief check.
       - This run is then the refusal "A brief check still running" ("Stops"), which writes nothing.
     - Any other such entry is taken over by this run ("Steps / A `/spec` taken over").
   - A preflight that fails is a refusal ("Stops").
   - Then, before any premise check, read the step's line and the Rulings section of `plan.md`, as "What it reads" 4 says.
   - A step whose line carries its authority goes on.
     - The session notes the tags that give it.
   - A step without it is a refusal ("Stops") that names the step and the authority it lacks.
     - The refusal says a ruling is needed.
   - A `plan.md` that is missing or not UTF-8, lacks a section, or lists a step twice is a refusal ("Stops").
   - A step not in the list is a refusal ("Stops"), with the list printed.
   - A refusal here writes nothing.
   - A step whose dispatch entry reads `landing: backed-out` then goes through "Steps / A step taken back out of main", which removes that entry, before the compare below.
   - Then compare the plan's verify list with the commands of the verification page `.agents/plan.yaml`'s `verification:` names, copied as the `plan` skill's Steps 4 copies them, by reading.
     - A list equal to the page's commands, filters included, is left as it is.
     - On a difference, the session rewrites the `verify:` list of the state file to the page's commands, and Steps 4 names the change in the brief under "What is on the tree".
     - The rewritten list is one of the session's own records, so a step that waits at Steps 5 keeps it.
   - Then write this step's dispatch entry into the state file, in the shape the `plan` skill's `templates/orchestrator-state.md` gives, holding `step: <n>` and `landing: preparing`.
     - With `.agents/plan.yaml`'s `workers_at_once` 1, the entry is `dispatch:` followed by its keys.
     - With `.agents/plan.yaml`'s `workers_at_once` above 1, the entry is appended to the list of entries.
     - A `/spec` taken over has its entry already and writes none.
     - The step is in flight from here: the entry counts toward the limit, and the steps that reach their Steps 5 afterwards compare their briefs with this step's once it is written.
   - A stop, a wait at Steps 5 and each refusal after the entry is written remove it: the state file reads back with only this step's entry removed.
   - Steps 1 is done when the preflight, the authority check and the compare have passed and the entry is written, or a refusal has named its cause and written nothing.
2. Check every premise the step's text makes against the tree.
   - A premise found false that the plan can absorb is corrected in `plan.md` before the brief exists, never left for the builder to hit.
   - That correction is carried by the preparation commit (Steps 6), or by a commit of the same plan that names `plan.md` before it ("Steps / The brief check" 1).
   - The brief records the correction beside the premise.
   - A premise found false that the plan cannot absorb is a stop ("Stops"): its correction would change the part the step builds, or make a choice the user would see.
   - A part of the step's text that asks for a cause to be found ("find why X happens and end it", in whatever words) is investigated with `/diagnose <entry> <step> premise`.
     - With no person present, the diagnosis runs in a diagnosis agent, as the `diagnose` skill's "Rules" say.
       - Run by a person, the diagnosis runs in the person's session, with the waits of the `diagnose` skill's "Stops".
     - A result already in the step's Step 0, written there by an earlier diagnosis, is not investigated again: a cause goes into the brief, a cause not found stays out of it with its open item, and a false premise goes to the bullets above on a false premise.
     - The diagnosis probes on a scratch copy at main's head and changes no file of the checkout outside the ledger.
     - The cause found or already in Step 0, its fix and the record's path are written into the item of "What to build" at Steps 4.
     - The diagnosis's red command becomes a check of the brief's "Verify before you report", and its test, where one was written, a case with its failing run.
     - A cause not found is left out of the brief.
       - The open item `diagnose` Steps 15 raises is the one open item for it.
       - A step with no other part stops there, with the stop "A cause not found" ("Stops").
     - A red command that is green on main's head is a false premise, which the bullets above on a false premise handle.
     - The record, what the diagnosis wrote in Step 0 and the diagnosis agent's numbered item in the Agents section are among the session's own records (Steps 1), and a step that waits at Steps 5 keeps them.
   - Read the ADRs the step touches, as "What it reads" 5 says.
     - The brief names each under "What is on the tree", with its number, its title and the sentence of its decision the step is under, or says that no ADR touches the step.
   - A step's text that contradicts the part in force of an ADR is a rule clash, a stop ("Stops").
     - The open item names the ADR and quotes the step's words that contradict it.
     - Its options are the step changed to follow the ADR, or a new ADR that supersedes it, as the ADR folder's `README.md` says.
3. Look for libraries, as `.agents/plan.yaml`'s `libraries` says, before the brief is written.
   - Under `libraries: check`, the session looks for existing libraries for every capability the step builds.
   - A candidate that could replace code the step would write by hand is a stop ("A user-visible choice", "Stops").
   - The stop gives the options (each candidate, and writing it by hand), the pros and cons of each, and one recommendation.
   - A candidate the user has already ruled on for the capability the step builds, named with that capability by a line of `plan.md`'s Rulings section, is settled.
     - The brief records that ruling under "Libraries checked".
     - `/spec` goes on past the candidate without a stop.
   - A ruling on the same candidate for another capability settles nothing.
   - For each candidate the brief records its version, license, maintainer, last release, compatibility with the project's dependencies, what it would replace and what stays hand-written.
   - Bundle size is not a criterion unless the project's rules page or one of its standards pages names one.
   - With no candidate, the brief says so.
   - Under `libraries: avoid`, the brief says the step adds no new dependency.
4. Write `agents/briefs/<step>.md` from `templates/brief.md`.
   - The first line points at the rules file the configuration names, and at the standards it lists.
   - The line under the title is the size line, written from the step's text before the build.
     - `Size: a small text step: no brief check, one review, no repair round` for a step that is a small text step, as the glossary's entry **small text step** says.
     - `Size: a full step` for every other step.
   - The premises as checked, with the command that checked each.
   - The ADRs the step touches, as Steps 2 names them.
   - The change Steps 1 made to the plan's verify list, when it made one.
   - The fix text is the requirements of the step's part, in the brief's own words and not a pointer.
     - What must hold when the part is done.
     - Each file the part touches, with the constraint it is under.
     - The behaviour the part has.
   - Text is dictated word for word only where the wording itself is the requirement, such as a rule sentence the user ruled.
   - Under "Verify before you report", each check of the configuration block's verify list that covers a file the step changes, then the step's own gate.
     - Each check has the directory it runs from and the output that counts as a pass.
     - The character-set check over those files is among the checks where the verify list holds one.
     - The brief says the plan's whole verify list runs once, at landing on main.
   - The report shape, with the cases' first run before the result table.
   - Under "Cases", every must-pass and must-refuse example the step's text gives, in one list, each an input and its expected result.
     - Each case checks what the step changes, and none asks the builder to quote or explain a place the step does not change.
     - The brief states the builder's first task as the template states it: the first run of every case on the unchanged tree before any change.
       - A case of a code step is a test only where the rules file's test rule calls for one, and otherwise a run the report quotes.
       - A case of a text or judgment step is checked by reading.
       - A case the brief's rules get wrong is handed back before any code changes.
     - For a code step (a script, or a product's code), the list also holds the inputs the step's text implies but never states, as `templates/brief.md`'s "Cases" names them, each with its expected result, found by the session writing the brief from the rules of the code the step builds or changes and from that code's callers, and only an input that has happened or whose wrong answer would cost something.
   - Under "Paths this step writes", every path the step writes, one per line, the report path included: ``- `<path>` `` for a whole file, or ``- `<path>` lines <a>-<b>` `` for a range of a shared document, numbered as on main at the base.
   - A choice the plan leaves open is taken in the brief.
     - It is listed under "Decisions taken in this brief", each reversible.
   - Under "Libraries checked", what Steps 3 found: each candidate with its facts and the library the user ruled, "none found", or, under `libraries: avoid`, that the step adds no new dependency.
   - A choice that decides a format or a rule the builder applies across the tree (a directive shape, an anchor rule, a naming rule, a file layout) is run by the session writing the brief on at least five real cases from the tree.
     - The brief quotes each input and its output under the decision, so an unreadable or wrong result is seen before dispatch.
   - Every requirement the part is judged on is known and written into the brief.
   - A user-visible choice (a public shape, a wire format, a config key, a vocabulary) is not taken.
     - It is a stop ("Stops").
   - For a step taken back out of main, whose Step 0 in `plan.md` records the failure its landing met, the brief carries that failure and, when `/diagnose` wrote them into Step 0, the cause, the fix and the diagnosis record's path.
   - The ledger may hold the step's patch `agents/reviews/<step>-backed-out.patch` ("Steps / A step taken back out of main").
     - The brief then names its path.
     - The brief says Steps 7 applies it with `git apply --3way`.
   - The brief is committed at Steps 6, before the apply.
     - Its section "The patch as applied" is added after Steps 7, as Steps 7 says.
5. Compare the brief's "Paths this step writes" with the brief of every other step in flight in the dispatch block of every open plan, a step at `landing: preparing` included, by reading them.
   - Each brief is read from its own plan's `agents/briefs/` in the main checkout, committed or not.
   - A step in flight at `landing: preparing` whose brief is not yet written is not compared by this run.
     - That step's own Steps 5 compares with this step's brief, which is then on disk.
     - So of two steps in `/spec` together, the later one to reach its Steps 5 makes the compare.
   - No shared path: the step goes on.
   - A shared path is a file both briefs name, whatever lines each names, in one plan or in two.
     - It is not a refusal.
     - It goes to the orchestrator's judgment, as `plan-orchestration`'s "Two steps in flight" says.
     - Run by hand, the session judges.
   - When the merge at landing is judged simple, the step goes on.
     - Steps 9 writes `shared_paths:` in its dispatch entry, naming each shared file, the other step's plan and step, and why the merge is simple, as `plan-orchestration`'s "Two steps in flight" says.
   - When it is not judged simple, the step waits until the other step lands.
     - This run leaves only the session's own records of Steps 1's list, the report of its brief check among them when one stands, which the next resume point of its plan carries.
     - The brief is restored to main's copy (`git restore -- <path>`, or deleted when main has none).
     - `plan.md` is put back as Steps 1 says.
     - No commit or worktree is made, and this step's dispatch entry is removed (Steps 1).
   - What "Steps / A step taken back out of main" did stays done.
     - The patch stays in the ledger.
     - `/spec` run again prepares the step with that patch.
   - `/spec` run again redoes Steps 2 from the start, so the premise checks and their amendments are made again on the tree as it then is.
   - A small text step gets no brief check, and Steps 5 is done for it when the path comparison is done.
   - A full step that goes on runs "Steps / The brief check", after the path comparison and before the preparation commit, unless the step's brief-check report already stands in the ledger.
   - A step with such a report is not checked again: the session closes the report's findings in the brief it has written, by the rulings booked since, and goes on.
   - A step whose brief's "Paths this step writes" changes after this comparison, at its brief check, compares again before its preparation commit, with the briefs of every step in flight as they then stand.
     - The bullets above then apply to what the second comparison finds.
   - Steps 5 is done when every finding of the brief check is closed in the brief and the comparison holds for the paths as they stand, or when the step waits or has stopped.
6. Make the preparation commit, a resume point ("Rules").
   - A commit made since this run's Steps 2 that changed a file the brief's "What is on the tree" or "Paths this step writes" names has the premises on that file checked again on main's head before this commit, and the brief corrected where they changed.
   - It holds the brief, the brief check's report of a full step, the patch of a step taken back out of main, and each of the session's own records of this plan (Steps 1).
   - It names `plan.md` and the state file only when they differ from main's head ("Steps / The brief check" 1).
   - It holds the choices file `<ledger_root>/choices.md` when this run changed its `Builds on it:` line.
   - The paths are written out in the `git add -- <path> ...` command.
     - A ledger change the session did not make is not among them.
   - The commit names the same paths, a deleted path included: `git commit -m <message> -- <path> ...`.
   - Its hash is the base, which the session writes at once into this step's dispatch entry as `base: <hash>`.
   - Steps 6 is done when the commit holds those paths and its hash is recorded as the base in the entry.
7. Write `worktree: <worktree_root>/<slug>-<step>` into this step's dispatch entry beside `base`, so the entry names the worktree before it exists.
   - Then create the worktree from the base: `git worktree add -b <slug>-<step> <worktree_root>/<slug>-<step> <base>`, `<slug>` being the name of the plan's ledger folder.
   - A `/spec` taken over after its preparation commit uses the worktree and the branch its interrupted run made as they stand.
     - It does what the worktree still lacks of this list.
   - Then, from inside it, `git sparse-checkout set <worktree_paths>` when the block names any.
   - Then, for a step whose patch the ledger holds, from inside the worktree: `git apply --3way <repository root>/<ledger>/agents/reviews/<step>-backed-out.patch`.
     - The patch is named by its path in the main checkout, since a sparse checkout may leave the ledger out.
     - Read what it prints.
   - A file named in an `error:` line, such as one main deleted or renamed, makes the whole apply fail.
     - The apply is run again with `--exclude=<path>` for each such file, until the rest applies.
   - A binary file left unmerged takes the patch's copy with `git checkout --theirs -- <path>`.
   - Before the dispatch commit, the session adds the section "The patch as applied" to the brief.
     - The section lists the files applied clean and the files left with conflict markers, which the builder finishes from the markers.
     - It lists the files skipped, which the builder rebuilds against main's tree from their part of the patch, named by path.
     - It lists the binary files given the patch's copy, which the builder checks against main's change to them, the commits `git log --oneline <old base>..main -- <path>` lists, the old base being the `base` of the removed entry.
   - Nothing is committed in the worktree: `/land`'s wip `git add -A` stages the files the builder finishes, so the builder runs no git command that changes state.
   - Then the dependency install the project needs.
8. Stage the base binaries for the landing's A/B, copied aside from the current build.
   - The configuration block's `bench:` line names them.
   - With none named, none is staged.
9. Fill this step's dispatch entry in the state file, the one Steps 1 wrote, in place of writing a new one: add executor, worker, launched, report path and `round: 0` beside the `base` that Steps 6 wrote and the `worktree` that Steps 7 wrote, set `brief_check` ("Steps / The brief check"), and set `landing: not-started`.
   - A small text step's `brief_check` reads `none, a small text step`, since no brief-check agent ran.
   - The entry keeps the shape Steps 1 wrote, which the `plan` skill's `templates/orchestrator-state.md` gives.
   - The executor is the configuration block's default, until the orchestrator chooses for the step.
   - A step whose brief shares a file with a step in flight, judged simple to merge at Steps 5, gets `shared_paths:` in its entry.
     - It names each shared file, the other step's plan and step, and why the merge is simple, as `plan-orchestration`'s "Two steps in flight" says.
   - With no shared file the key is left out.
   - The entry is not committed here.
     - It is committed, in the form Steps 6 states, once the builder's identity is in it: under `agent` right after the launch, and under `inline` and `academic-paper` before the build starts.
   - For a step whose patch Steps 7 applied, that commit also carries the brief with its section "The patch as applied".
   - Under `plan-orchestration`, its Steps 4 makes that commit under every executor.
   - Run by hand, the session writes itself as the identity.
     - It makes that commit before the build starts, in the form Steps 6 states.
   - The worker's identity goes into the block the moment it is known.

### A step taken back out of main

A step whose dispatch entry reads `landing: backed-out` has its old worktree and branches kept by `/land` (the `land` skill's Steps 6). The session, which may run git, saves its work and removes them from the repository root on main, inside the preflight of Steps 1 and before the compare. A step whose Step 0 records a second landing failure waits for the user's ruling, as the `land` skill's Steps 6 says, and is not prepared again before it:

1. Read the entry's `base` and `worktree`.
   - The branch is the worktree folder's name, and `<branch>-land` beside it.
   - No path or branch is built from the step id.
2. From inside the kept worktree, `git status --porcelain --untracked-files=all` lists only paths under the ledger root.
   - Any other path is a refusal ("Stops") that names it, and nothing is removed.
3. Write `git diff --binary <base> <branch>` to `agents/reviews/<step>-backed-out.patch` beside the state file, `--binary` making the patch carry a binary file's content.
   - Run the diff again, and compare the two with `cmp`.
   - Two diffs that differ are a refusal ("Stops"), and nothing is removed.
   - An empty diff writes no patch.
     - It removes a patch an earlier back-out of the step left there.
4. Remove the worktree and branches, as the `land` skill's "Removing a step's worktree" says: `git worktree remove --force <worktree>`, then `git branch -D` for `<branch>` and `<branch>-land`, each only when it exists.
   - These commands run without asking the user, since the step's work is saved in the checked patch.
   - When the runner refuses one of them, the session gives the user the command to run and waits.
5. Remove the backed-out entry from the dispatch block.
   - Read the state file back: the other entries, the comment and blank lines under `dispatch:`, and every other byte as they were.
6. Go on with the rest of Steps 1, which writes this step's `preparing` entry after the backed-out one was removed.
   - Then go on with Steps 2, which prepares the step as any step, from main's head.
   - Steps 4 writes a new brief over the old one, which stays in git's history, with the failure and the patch.
   - Steps 6 makes a new preparation commit.
   - Steps 7 makes a new worktree with the patch applied by `git apply --3way`.
   - Steps 9 fills the `preparing` entry that Steps 1 wrote, at `round: 0`, `landing: not-started`.

### A `/spec` taken over

A step whose dispatch entry reads `landing: preparing`, other than one whose `/spec` is waiting on its brief check (Steps 1), was left by a `/spec` that stopped before its end. A compaction in the same session cut it off, or a session handed it over after its handover commit. `/spec <entry> <step>` run again takes the entry over and goes on from where the interrupted run stopped:

1. An entry with no `base` was left before the preparation commit. The run starts at Steps 1.
   - It treats the step's uncommitted brief, its uncommitted brief-check report, its `preparing` entry and its own plan's `plan.md` changes as its own records, not as refusals.
   - It writes no second entry, and the count of Steps 1 leaves the entry out.
   - A brief-check report on disk is not run again (Steps 5).
   - A brief-check agent that ended with its report not yet saved has the report saved from its completion notice ("Steps / The brief check" 3), is never booked as dead, and is not run again.
   - With no report on disk, a brief-check agent that the entry's `brief_check` records as `"running: <agent id>"` and that is dead as "Steps / The brief check" 3 says is booked as dead.
     - The run reads its served model from the runner's record, as "Steps / The brief check" 1 does for a started agent.
     - The run writes its bullet `- <agent id>: brief check of step <n>, <served model>` into `plan.md`'s Agents section when that section holds none for the id.
     - Steps 5 starts the run's own brief check, and its `"running: <agent id>"` replaces the dead one.
2. An entry with a `base` was left after the preparation commit. The run goes on at Steps 7 after the preflight of Steps 1, and does not run Steps 2 to 6 again.
   - The worktree and the branch the interrupted run made are exempt from the refusal "A worktree or branch that exists".

### A stop

1. Leave three things and nothing else.
   - The open item in the state file, holding the step, what the tree shows against the step's text, the choice the user owns with its options and the pros and cons of each, and one recommendation with its reasons.
     - An option adds a step to the plan only for a reason `plan-orchestration`'s "What earns a step of its own" lists.
     - An option for work outside the entry's goal is a new roadmap entry through `/roadmap add`, never a step of the plan.
     - Each option states in full every approval it would need later whose content exists when the option is written, such as what a new script computes or a change to the configuration or the verification list.
     - The user's ruling on such an option approves each of those approvals too.
     - An approval of work not yet done when the option is written, such as the user's reading of a page a step will write, stays a stop of its own.
     - The option names that stop.
     - An option that runs a skill with an approval stop states the change in full, or names that stop as a stop of its own, as `plan-orchestration`'s "Stops" says.
   - The same text under the step's Step 0 in `plan.md` or the part file it names.
   - The ledger files of this plan that the session wrote, committed as a resume point in the form Steps 6 states, so the stop survives the session, other than the brief and the brief-check report of another `/spec` waiting on its brief check ("Steps / The brief check" 1).
   - The item is done when the open item, its text under Step 0 and the commit of the ledger files exist.
2. No brief, no worktree and no dispatch block exist for the stopped step.
   - The entry Steps 1 wrote is removed before the commit of item 1, the state file reading back with only this step's entry removed and the open item kept.
3. A step stops at most twice before its build, counted as the open items under its Step 0.
   - A run that finds a third choice for the user is the stop "A step that does not converge" ("Stops"): the step is booked under `plan.md`'s "Blocked, and by what" with every choice left.
   - `/spec` refuses the step from then on, until a ruling of the user rewrites, splits or removes it.

### A ruling

1. The user closes a stop by typing the ruling as plain text, in any session on the repository:

   ```
   Ruled: <the choice, one clause per question the open item asked>
   ```

   Under `self_rule: on`, `plan-orchestration`'s `references/self-rule.md`, "Closing an open item", books a choice the same way, as that heading says.

   The item is done when the message holds the ruling.

2. On that message the session books the ruling and nothing else:
   - the open item is closed with the ruling's text and its date;
   - the step's text in `plan.md` is rewritten to what was ruled;
   - a step the ruling adds or splits gets its own line in the step list, ending with `(ruling <name>)`;
   - that step gets its own Step 0, its carried premises with it;
   - a ruling on a part not yet built rewrites that step's line, which then also ends with `(ruling <name>)`, and adds no step;
   - a ruling that removes a step not yet built deletes the step's line, its Step 0 and its line under "Blocked, and by what", and the Rulings line records the removal;
   - a ruling that adds, splits or removes a step, or rewrites the line of a step not yet built, is also written in the Rulings section as a line with an ending;
     - the ending is "(the user)." for a ruling of the user;
     - the ending is "(self-rule)." for a choice booked under self-rule;
   - for such a ruling, the step's tag names the Rulings line as "What it reads" 4 reads it;
   - a ruling on an option that runs a skill with an approval stop and states the change in full is written in the Rulings section as a bullet whose first line ends with "(the user)." for a ruling of the user, or "(self-rule)." for a choice booked under self-rule;
   - that bullet is the quoted ruling the session gives the skill;
   - the change the option stated is copied under that bullet as sub-bullets, a text of several lines as a fenced block indented with its sub-bullet, its fence longer than any fence inside the text;
   - a ruling that sets a public shape, a vocabulary, a rule or a library choice is also written where the plan keeps its rulings, so later premise checks and the library search of Steps 3 read it;
   - a ruling that answers a rule clash with a new ADR, raised by `/spec` or by `/refute`, is carried out before the step goes on:
     - the session writes the new record, numbered after the folder's highest, in the form of the folder's `template.md` or, with none, of its latest record, with status `proposed`;
     - its decision is the ruled option in the open item's words, its context the facts the open item gives, its alternatives rejected the old record's decision and each other option with the con the open item gave it, and its consequences what the open item says follows;
     - the old record is marked superseded in the words the folder uses (`superseded by NNNN` under the template);
     - the new record gets its row in the folder's index when there is one;
     - the session shows the user the new record;
     - the session commits these files at once, a resume point of this plan, in the form Steps 6 states, so that `/spec` or `/land` in any session reads them;
   - a ruling that replaces a bullet ending "(self-rule)" always writes a Rulings bullet of its own that names the bullet it replaces;
   - that ruling is booked as `plan-orchestration`'s `references/self-rule.md`, "The choices file", says;
   - the ledger files are written and not committed on their own: the next `/spec` carries them in its preparation commit (Steps 6);
   - the item is done when the ruling's changes are in the ledger files.
3. Then `/spec <entry> <step>` is typed again.
   - It rechecks every premise against the tree, the ruled text included.
   - It writes the brief.
   - A step whose brief check has run is not checked again (Steps 5).
   - After a ruling on an option that runs a skill and states the change in full, that skill is run first, with `--ruling <ledger file> "<name>"`.
   - The item is done when the skill a quoted ruling was booked for has run under it, and `/spec` has written the brief.

### The brief check

Steps 5 says when this runs.

1. Start one fresh agent as the effort agent `ordo-<reviewer_effort>`, on the model the configuration block's `reviewer:` names, never the session that wrote the brief.
   - It reads the brief, `plan.md`'s Goal, the step's line and the Rulings section, the rules file and the standards the configuration names, and the tree on main at its head.
   - It changes nothing: every finding goes into its report.
   - It invokes no skill: it runs the reads and commands of item 2 itself.
   - It starts no agent: every read and every command runs in its own session.
   - It writes `<REDACTED>` in place of the value of a secret in every line it quotes, as the rules file's rule on secrets in quoted command output says.
   - The agent runs in the background.
   - Right after the start, the session reads the agent's id and the model the runner served it, from the runner's record of the agent as `plan-orchestration`'s "Launching a builder" says.
   - A served model that is not the configured one is the stop "A model other than the configured one" ("Stops").
     - The agent is stopped through the runner's stop tool.
     - Nothing it wrote is used.
   - A brief-check agent stopped for another model has no dispatch entry left to be recorded in, since the stop removes the entry ("Steps / A stop" 2), so the session writes its bullet `- <agent id>: brief check of step <n>, <served model>` straight into `plan.md`'s Agents section.
     - A `plan.md` with no Agents section gets it, created before `## Blocked, and by what`.
     - The session reads the section back.
   - The stop's commit carries `plan.md` among the ledger files it commits ("Steps / A stop" 1).
   - A served model that is the configured one is followed by `brief_check: "running: <agent id>"`, which the session writes into this step's dispatch entry, quoted as `plan`'s `templates/orchestrator-state.md` says of a value that holds `: `.
     - The preflight of a later `/spec` and `plan-orchestration`'s "Resuming, and handing the plan over" tell a live brief check from a dead one by that id and the runner's agent listing.
   - While the agent runs, the session may run other skills for other steps: `/land`, `/refute` and another `/spec`, each as its own text says.
     - The brief and the brief-check report of this `/spec` are carried only by its preparation commit (Steps 6), whatever other commit of the plan is made meanwhile.
     - A commit of the same plan that names `plan.md` or the state file carries that file as it stands on disk, this run's `preparing` entry and premise corrections included.
     - The preparation commit names what is left.
     - A landing runs from its cherry-pick to its commit before any other commit or skill (the `land` skill's Rules), so the report of an agent that ends during a landing is saved after the landing's commit, and no commit of this `/spec` is made before then.
   - Item 1 is done when the agent's id and served model are read, the model is the configured one and `brief_check: "running: <agent id>"` is written, or when the stop is raised.
2. The agent runs these checks and reports each with the command that shows it and that command's output:
   - **Names.** Every name the step changes (a file, a heading, a key, a function, a term) is grepped across the repository, and every hit outside the brief's "Paths this step writes" is listed, each with whether the change makes it false.
   - **The step line.** Every part of the plan's step line is present in "What to build": each requirement is mapped to the part of the line it serves, and a part with no requirement is named.
   - **Premises.** Every command of the brief's "What is on the tree" is rerun, and its output is compared with what the brief says.
   - **Cases and checks.** Every case of "Cases" is read against the rules file and the standards, and a case inconsistent with them is named.
     - Each case that asks the builder to check, quote or explain a place the step does not change is named too.
   - **The question.** Each case, the check on the step's line and the check of each item of "What to build" is asked "could this pass without the goal being reached?", "the goal" being the part of the plan's goal the step delivers, and the answer is given with its reason.
   - **Implied inputs.** For a code step (a script, or a product's code), the inputs the step implies but never states are listed under "Cases", as `templates/brief.md`'s "Cases" asks, and each one missing that has happened or whose wrong answer would cost something is named with its expected result.
   - **ADRs.** Every `NNNN-*.md` record in the folder the configuration block's `adr` names (`docs/adr` when the block has none) is read for its part in force, as "What it reads" 5 says.
     - Each one the step touches is named with the sentence of its decision the step is under.
     - A part of the brief that contradicts one is named.
     - An ADR the step touches that the brief's "What is on the tree" does not name is named.
   - **Dictated text.** Every line of text the brief dictates is read line by line.
     - What is dictated is text whose words the brief gives for a file, whether quoted, in a fenced block, or given after a colon as the words of a named sentence, line, heading, comment, table row or term.
     - A requirement that says what a sentence must say without giving its words is not dictated, so the builder words it.
     - Each dictated line is read against the rules file and each standards page the configuration names.
     - A code line (a key with its comment, a command, a placeholder line) is read whole.
     - The comment of a code line, and any words in it, are read as prose.
     - The report gives each dictated line with the `grep -n` that finds it in the brief, and with "holds" or each rule it breaks, named with its page and section.
     - A brief that dictates no text is reported as such.
     - A dictated line whose words a ruling of the user fixes, and which breaks a rule, is a finding the session cannot close by a change to the brief, so it is the stop "A brief check finding the brief cannot absorb" ("Stops").
   - The checks are done when each has its findings, or "none".
3. The agent's final message is its report, in the shape of `templates/brief-check.md`: one heading per check of item 2, each with its findings or "none", then "Declined to judge", then the agent's usage.
   - The session saves it at `agents/reviews/<step>-brief-check.md` beside the state file, the usage line filled with the agent's id, its served model (item 1) and its tokens, tool uses and time from its completion notice.
   - A full step has one such report, since the check runs once per full step (item 4).
   - When the agent ends while this `/spec` waits, the session saves its final message there from the completion notice, and this `/spec` goes on to item 4.
   - A brief-check agent is dead only when the runner no longer lists it and no completion notice with its final message arrived.
   - Item 3 is done when the report stands at that path with its usage line filled.
4. The session closes each finding by a change to the brief, before the preparation commit.
   - Each change is named under the report's "Closed" heading, beside its finding.
   - A dictated line the session rewrites to close a finding, or adds to the brief after the check, is held line by line as item 2's "Dictated text" says, before the preparation commit.
   - That line is named under "Closed".
   - A finding whose cause is not known is diagnosed with `/diagnose <entry> <step> brief check <n>`, which runs, with no person present, in a diagnosis agent as the `diagnose` skill's "Rules" say, before it is closed in the brief.
   - The check runs once per full step.
     - The brief as changed goes to the builder without a second run.
     - A `/spec` run after a stop or a ruling does not check the step again.
   - A finding whose fix would change the part the step builds, or make a choice the user would see, is a stop ("Stops"), left as "Steps / A stop" says.
   - Every such finding of the report is raised in that one stop, so the user rules on all of them in one reply.
   - A finding the session cannot close by a change to the brief is raised in the same stop.
   - A contradiction the "ADRs" check finds in the step's text is the stop "A rule clash with an ADR", as Steps 2 says.
   - A contradiction found only in the brief's own wording is closed by a change to the brief that follows the ADR.
   - At such a stop the brief is restored to main's copy (`git restore -- <path>`, or deleted when main has none).
   - At such a stop the report is among the ledger files the stop commits.
   - This item is done when every finding has its change under "Closed" and each dictated line rewritten or added after the check is held and named there, or the step has stopped.
5. The dispatch entry (Steps 9) of a full step records the report's path under `brief_check` with the agent's id, its served model, and its tokens, tool uses and time, in the form `<path> (<agent id>, <served model>, <tokens> tokens, <tool uses> tool uses, <time>)`, read from the report's usage line in a later `/spec` run of the step.
   - It replaces the `"running: <agent id>"` that item 1 wrote.
   - The report is committed as Steps 6 says.
   - Item 5 is done when the dispatch entry holds that form.

## Stops

The first seven rows are stops, which leave an open item as "Steps / A stop" says. The rest are refusals. A refusal names its cause and leaves nothing beyond what "Steps / A step taken back out of main" has already done, the entry of Steps 1 removed when it was written (Steps 1).

| Stop | When | What it shows | What resumes it |
|---|---|---|---|
| A false premise the plan cannot absorb | A premise the step's text makes is false on the tree, and its correction would change the part the step builds or make a choice the user would see (Steps 2); the skill does not guess | The open item, booked in the open items | A ruling ("Steps / A ruling") |
| A rule clash with an ADR | The step's text contradicts the part in force of an ADR the step touches (Steps 2, or the "ADRs" check of "Steps / The brief check") | The open item, booked in the open items, naming the ADR and quoting the step's words that contradict it | A ruling |
| A user-visible choice | The brief would have to choose a public shape, a wire format, a config key or a vocabulary, or, under `libraries: check`, a library could replace code the step would write by hand (Steps 3) | The open item, booked in the open items | A ruling |
| A brief check finding the brief cannot absorb | A finding of the brief check whose fix would change the part the step builds or make a choice the user would see, or a finding the session cannot close by a change to the brief ("Steps / The brief check") | The open item, booked in the open items, with the report's path | A ruling |
| A cause not found | A part of the step's text asks for a cause to be found and the diagnosis did not find it, and the step has no other part (Steps 2) | The open item the `diagnose` skill's Steps 15 raised, with the diagnosis record's path | A ruling |
| A model other than the configured one | The runner served the brief-check agent or a diagnosis agent a model that is not the configured one: a different model family, or an older version than the newest the configured alias names in the runner's model list ("Steps / The brief check") | The open item, booked in the open items, with the configured value, the served model and the Claude Code version | A ruling |
| A step that does not converge | The step has stopped twice before its build (two open items under its Step 0) and this run finds a third choice for the user ("Steps / A stop" 3) | The open item, booked in the open items, with the two rulings given and every choice left | A ruling that rewrites, splits or removes the step |
| A step without its authority | The step's line ends with neither `(approved)` nor a `(ruling <name>)` for each ruling it rests on, each naming a ruling in the Rulings section, a line ending "(the user)" or "(self-rule)" (Steps 1) | The step and the authority it lacks | A ruling, booked as "Steps / A ruling" says with the tag on the step's line, then `/spec` again |
| An unusable `plan.md` | `plan.md` is missing or not UTF-8, lacks the step list or the Rulings section, or lists a step twice (Steps 1) | What is wrong in it | `plan.md` put right, then `/spec` again |
| A failed preflight | Not on `main`, something staged, a git operation in progress, an uncommitted change at the brief's path or at the brief check's report path, or one on this plan's `plan.md` or state file that the session did not make (Steps 1) | What it saw | The tree put right, then `/spec` again |
| A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/spec` again |
| No ledger folder | No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan`, then `/spec` |
| A step in flight | The steps in flight of all open plans, this step's own entry left out, already reach `.agents/plan.yaml`'s `workers_at_once` ("What it reads" 3, Steps 1) | The steps in flight, each named with its plan and its `landing` value | A step landed, a red line took its landing back out of main and its dispatch block reads `landing: backed-out` (the `land` skill's Steps 6), or the `/spec` of a step at `landing: preparing` stopped or waited and removed its entry (Steps 1) |
| A brief check still running | This step's own dispatch entry reads `landing: preparing`, its `brief_check` reads `"running: <agent id>"`, and the runner still lists that agent (Steps 1) | The step and the agent id | The agent ends: a `/spec` still waiting on it goes on, and with none waiting, as after a compaction, `/spec` again takes the entry over ("Steps / A `/spec` taken over") |
| A worktree or branch that exists | The step's worktree path `<worktree_root>/<slug>-<step>` or its branch `<slug>-<step>` exists, other than those of this step's own entry that reads `landing: backed-out`, and those the interrupted run of a `/spec` taken over made (Steps 1) | The path or the branch, named | The step that holds it landed, then `/spec` again |
| No such step | The step is not in `plan.md`'s list (Steps 1) | The list | `/spec` with a step in the list |
| The configured effort cannot apply | The runner lists no `ordo-<level>` agent for the level the configuration block's `reviewer_effort` names, or `CLAUDE_CODE_EFFORT_LEVEL` is set, which runs every agent at its level whatever the definition says (Steps 1) | The missing agent, or the variable's value | The effort agents installed as the plan skills are, or the variable unset, then `/spec` again in a new session |
| A step taken back out of main that cannot be saved | At "Steps / A step taken back out of main", a path in the kept worktree outside the ledger root, two diffs that differ, a failed git command, or a state file that cannot be written or does not read back | The path, or the command and what it printed | The cause put right, as the bullet below says, then `/spec` again |

- The cause of the last row is put right by the user: the path moved out of the worktree or removed, the ledger or the state file made writable, or the entry corrected.

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
- Every other record stays on disk in the main checkout until the next resume point of its own plan.
- A `/spec` waiting on its brief check is an exception to the two bullets above ("Steps / The brief check" 1).

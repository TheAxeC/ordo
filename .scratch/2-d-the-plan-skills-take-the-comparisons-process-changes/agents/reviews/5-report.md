Everything in the brief is done

# Step 5 report: the brief check at `/spec`

## Open items of the state file (verbatim)

None.

(From `sed -n '/## Open items/,/## Closed/p'` on the state file, in the worktree and in the main checkout: both read "None.")

## The cases' first run, on the unchanged tree (5e7ec90 base, worktree at 3024434)

- Case 1, `grep -n -i 'brief check\|brief-check' skills/spec/SKILL.md skills/spec/templates/brief-check.md skills/plan-orchestration/SKILL.md skills/plan-help/SKILL.md`: printed no line; exit 2, with `grep: skills/spec/templates/brief-check.md: No such file or directory`, since the template does not exist yet. Over the three files that exist the same grep printed nothing, exit 1. The brief's "nothing, exit 1" holds for the three existing files; the exit 2 comes from the missing file only, and no rule of the brief is wrong by it.
- Case 2, the gate's length command: `726 land`, `632 ordo-init`, `386 plan-help`, `788 plan-orchestration`, `616 plan-retro`, `477 plan`, `951 refute`, `630 repo-setup`, `997 roadmap`, `999 spec`. Every one at most 1,024.
- Case 3, `git grep -n "spec. skill's .Steps [0-9]\|/spec. Steps [0-9]" -- skills docs README.md`: printed nothing, exit 1. Note: the pattern does not match the three numbered citations of `/spec` that exist, which read "the `spec` skill's Steps <n>" with no character between the space and "Steps": `git grep -n "spec. skill's Steps [0-9]" -- skills docs README.md utils` prints `skills/plan-orchestration/SKILL.md:50` (Steps 1), `:148` (Steps 1) and `:210` (Steps 5). No numbered step of `/spec` moves in this change, so all three stay true; after the change the same broader grep prints the same three citations (now at lines 51, 150 and 212), each still naming the step it named.
- Case 4, by reading: `git grep -n -i 'brief check' -- skills docs README.md` printed nothing, exit 1. The reading of the new subsection over brief 5 is under "Case 4, the brief check applied to brief 5" below.
- Brief premise, `grep -n -i 'brief.check' skills/*/SKILL.md`: nothing, exit 1, as the brief says. `git grep -n "spec. skill's .Steps" -- skills docs README.md`: lines in `skills/land/SKILL.md` (81, 152, 187), `skills/plan-orchestration/SKILL.md` (113, 168, 283) and `skills/plan/SKILL.md` (93), all by name, as the brief says.

No case showed a rule of the brief to be wrong, so the build went ahead.

## Case 4, the brief check applied to brief 5 (by reading, on main at 5e7ec90)

Run in the reader's mind, the new "Steps / The brief check" over `agents/briefs/5.md` gives:

- **Names.** The names the step changes: the term "brief check", the key `brief_check`, the file `skills/spec/templates/brief-check.md`, the report path `agents/reviews/<step>-brief-check.md`, the heading "### The brief check", the `/spec` line of `/plan-help`'s sequence, the agents list of `plan-orchestration`'s "The two tiers, and the models", and the dispatch entry's keys. Applied to the name "brief check", the first bullet's grep `git grep -n -i 'brief check' -- skills docs README.md` prints nothing before the change (exit 1) and 16 lines after, all in `skills/spec/SKILL.md`, `skills/plan-orchestration/SKILL.md` and `skills/plan-help/SKILL.md`, which the path list holds. The hyphenated form, `git grep -n -i 'brief.check' -- skills docs README.md`, adds `docs/roadmap.md:23` (the gate of entry 2.D, "its brief-check report lists every name the step changes with the hits outside its path list"), which the change leaves true. The hits outside the path list that the change makes false or incomplete, which the brief's "What is on the tree" does not list: `README.md:17` (the `spec` row), `README.md:34` (the sequence's `/spec` line, a copy of `/plan-help`'s), `skills/land/SKILL.md:89` (the booking reads usage from `builder_usage` and `reviewer_report` only) and `skills/plan/templates/orchestrator-state.md:26` (the dispatch comment lists the keys and has no `brief_check`). The check would report these four; this report gives each under "Doc text".
- **The step line.** Step 5's line: "after the brief and before the build, a fresh read-only agent checks the brief against the tree" (item 1, first and second sub-bullets); "every name the step changes grepped, the hits outside the path list listed" (item 1, check 1); "every item of the plan's step line present in "What to build"" (check 2); "every premise command rerun" (check 3); "the Cases consistent with the rules" (check 4); "its report is saved at `agents/reviews/<step>-brief-check.md`" (item 1, report bullet, and item 2); "`plan-orchestration` and `plan-help` carry the new stage" (items 3 and 4). No part without an item.
- **Premises.** Each command of "What is on the tree" reproduces, as the first run above shows.
- **The question.** Case 1 could pass without the goal: any mention of "brief check" in each of the four files satisfies it, whether or not the check is described. Case 2 could pass without the goal: it holds with a description that does not name the brief check. Case 3 could pass without the goal, and is the case the check would flag first: its pattern matches none of the numbered citations of `/spec` that exist (the three at `skills/plan-orchestration/SKILL.md` above), so it prints nothing before and after whatever the change does to the numbering. Case 4 and the step line's check ("the diff read by you") are readings, which do not pass by themselves.

## Changed text, old beside new

### `skills/spec/SKILL.md` description (999 characters before, 1021 after, by the gate's length command)

Old: "Prepare one step of an open plan: refuse a step whose line carries no authority of the user ((approved) or (ruling <name>)), check every premise the step's text makes against the tree, look for a library for every capability the step builds when the project's libraries is check, a candidate being the user's choice, write the brief (checked premises, fix text, verification list, report shape, pointer to the repository's change standard, cases, libraries checked, paths it writes), compare those paths with the briefs of the steps in flight and hand a shared file to the orchestrator's judgment, create the step's worktree at main's head, stage the base binaries, and record the dispatch in the state file. A step a red line took back out of main is prepared again from main's head, its old work saved as a patch in the ledger and applied in the new worktree. Triggers on: spec <entry> <step>, brief <step>, prepare step <n>, write the brief; and on a ruling typed in reply to a stop (Ruled: ...)."

New: "Prepare one step of an open plan: refuse a step without the user's authority ((approved) or (ruling <name>)), check each premise of the step's text against the tree, under libraries: check look for a library for each capability the step builds, a candidate being the user's choice, write the brief (checked premises, fix text, verification list, report shape, pointer to the rules file, cases, libraries checked, paths it writes), compare those paths with the briefs of steps in flight, a shared file judged by the orchestrator, run the brief check (a fresh read-only agent checks the brief against the tree, each finding closed in the brief), create the worktree at main's head, stage the base binaries, and record the dispatch in the state file. A step a red line took back out of main is prepared again, its old work saved as a patch in the ledger and applied in the new worktree. Triggers on: spec <entry> <step>, brief <step>, prepare step <n>, write the brief; and on a ruling typed in reply to a stop (Ruled: ...)."

Behaviours and triggers, old beside new:

| Old | New |
|---|---|
| refuse a step whose line carries no authority of the user ((approved) or (ruling <name>)) | refuse a step without the user's authority ((approved) or (ruling <name>)) |
| check every premise the step's text makes against the tree | check each premise of the step's text against the tree |
| look for a library for every capability the step builds when the project's libraries is check, a candidate being the user's choice | under libraries: check look for a library for each capability the step builds, a candidate being the user's choice |
| write the brief (checked premises, fix text, verification list, report shape, pointer to the repository's change standard, cases, libraries checked, paths it writes) | write the brief (checked premises, fix text, verification list, report shape, pointer to the rules file, cases, libraries checked, paths it writes) |
| compare those paths with the briefs of the steps in flight and hand a shared file to the orchestrator's judgment | compare those paths with the briefs of steps in flight, a shared file judged by the orchestrator |
| (none) | run the brief check (a fresh read-only agent checks the brief against the tree, each finding closed in the brief) |
| create the step's worktree at main's head | create the worktree at main's head |
| stage the base binaries | stage the base binaries |
| record the dispatch in the state file | record the dispatch in the state file |
| A step a red line took back out of main is prepared again from main's head, its old work saved as a patch in the ledger and applied in the new worktree | A step a red line took back out of main is prepared again, its old work saved as a patch in the ledger and applied in the new worktree (every step's worktree is created at main's head, as the clause before says) |
| Triggers: spec <entry> <step>, brief <step>, prepare step <n>, write the brief; a ruling typed in reply to a stop (Ruled: ...) | the same five, unchanged |

### The whole diff of the three changed skills (old lines `-`, new lines `+`)

```diff
diff --git a/skills/plan-help/SKILL.md b/skills/plan-help/SKILL.md
index 39dd65b..e18247b 100644
--- a/skills/plan-help/SKILL.md
+++ b/skills/plan-help/SKILL.md
@@ -2,7 +2,7 @@
 name: plan-help
 description: "Print the command sequence for running a plan step by step (open, spec, build, refute, close, land, and the loop inside a step), and for the plan named, where it stands: the position, the open items, the step in flight, which of its artifacts exist, and the command that comes next. Triggers on: plan-help, plan help, what do I type next, where is the plan, how does the plan loop work."
 metadata:
-  version: "1.8.2"
+  version: "1.8.3"
 ---
 
 # Plan help
@@ -53,7 +53,7 @@ metadata:
 
 then, for every step:
 
-/spec <entry> <step>          writes the brief, makes the worktree, stages the base binaries
+/spec <entry> <step>          writes the brief, has a fresh agent check it against the tree (the brief check) and closes its findings in the brief, makes the worktree, stages the base binaries
 "build it"                    the session writes itself into the dispatch entry and commits it. It then writes the code in the worktree, runs the checks and writes the report
 /refute <entry> <step>        a fresh reviewer reads the diff and reruns the checks, writes verdicts and findings
 "close them"                  a repair round: the session fixes the findings, reruns, rewrites the report
@@ -64,7 +64,7 @@ read the delta                when plan.yaml says refute_after_repair: no: the o
 
 when a command stops:
 
-/spec stops                   a premise of the step is wrong on the tree and the plan cannot absorb it, or a choice is yours: it wrote an open item and no brief
+/spec stops                   a premise of the step is wrong on the tree and the plan cannot absorb it, a finding of the brief check would change the step's scope, or a choice is yours: it wrote an open item and no brief
 "Ruled: ..."                  you type the ruling as plain text; the session books it in the ledger, and the next /spec commits it
 /spec <entry> <step>          again; it now writes the brief
 /spec refuses                 the step's line lacks your authority ((approved), or (ruling <name>) of a ruling of yours), or a file it reads is unusable: it names the cause and leaves nothing; rule on the step, then /spec again. A file its brief shares with a step in flight is no refusal: the step runs beside that step when the orchestrator judges the merge at landing simple, named under shared_paths: in its dispatch entry, and waits otherwise
diff --git a/skills/plan-orchestration/SKILL.md b/skills/plan-orchestration/SKILL.md
index 9cd06b7..7d33196 100644
--- a/skills/plan-orchestration/SKILL.md
+++ b/skills/plan-orchestration/SKILL.md
@@ -2,7 +2,7 @@
 name: plan-orchestration
 description: "Run an open plan unattended, step by step, from its ledger folder: pick the next unblocked step, prepare its brief and worktree, dispatch one builder agent in the step's worktree, have a reviewer refute the result, send its findings back to the builder for the repair rounds plan.yaml allows, read the delta, land the step with the small fixes made at landing, book it, and repeat; stop only where a decision is the user's. Every project specific comes from .agents/plan.yaml and the ledger, so the same skill runs a code tool, a research project or a manuscript under Claude Code, and one orchestrator session can hand the plan to another mid-way. Triggers on: run the plan, next step, orchestrate the plan, plan orchestration, dispatch the next step, continue the plan, resume the plan."
 metadata:
-  version: "2.9.0"
+  version: "2.10.0"
 ---
 
 # Plan orchestration
@@ -43,7 +43,8 @@ The loop runs over a plan that `/plan` opened. Each step goes through the same s
    - Resolve a dispatch block before anything else.
 2. Pick the next step that nothing blocks.
    - One at a time, unless the block sets `workers_at_once` above 1 and the next steps qualify under "Two steps in flight".
-3. Invoke `/spec <entry> <step>`. It checks the premises, writes the brief, makes the worktree and writes the dispatch block.
+3. Invoke `/spec <entry> <step>`. It checks the premises, writes the brief, runs the brief check before the preparation commit (the `spec` skill's "Steps / The brief check"), makes the worktree and writes the dispatch block.
+   - Before dispatching the builder, read the brief check's report and the changes to the brief its "Closed" heading names.
    - A stop it raises goes to the user by "Stops".
    - A stop, here or at any later step, blocks its own step.
      - The loop moves on to the next unblocked step.
@@ -119,14 +120,15 @@ The loop runs over a plan that `/plan` opened. Each step goes through the same s
 
 ## The two tiers, and the models
 
-- Two tiers take part: the orchestrator, and the agents it starts (the builders and the reviewers).
+- Two tiers take part: the orchestrator, and the agents it starts (the builders, the reviewers and the brief-check agents).
 - **Default.** The orchestrator and every agent run on Claude Opus.
 - **Orchestrator.** It may also run on Claude Fable.
   - It reads, decides, invokes the skills, lands and books.
   - It never writes step code itself beyond a fix at landing, unless the step's executor is `inline`.
-- **Agents.** A builder or a reviewer runs on a Claude model, and never on Claude Fable.
+- **Agents.** A builder, a reviewer or a brief-check agent runs on a Claude model, and never on Claude Fable.
 - **Builder.** One per step, in the step's worktree, under the brief and the rules file, on the model the configuration block's `worker:` names.
 - **Reviewer.** The model the configuration block's `reviewer:` names.
+- **Brief-check agent.** One per `/spec` run, read-only, on the reviewer's model, as the `spec` skill's "Steps / The brief check" says.
 - **Runner.** Both tiers run under Claude Code.
 - Any allowed combination is chosen per step.
 - A new combination is booked in the rulings with what decides it.
diff --git a/skills/spec/SKILL.md b/skills/spec/SKILL.md
index 35c7209..ddd034d 100644
--- a/skills/spec/SKILL.md
+++ b/skills/spec/SKILL.md
@@ -1,18 +1,18 @@
 ---
 name: spec
-description: "Prepare one step of an open plan: refuse a step whose line carries no authority of the user ((approved) or (ruling <name>)), check every premise the step's text makes against the tree, look for a library for every capability the step builds when the project's libraries is check, a candidate being the user's choice, write the brief (checked premises, fix text, verification list, report shape, pointer to the repository's change standard, cases, libraries checked, paths it writes), compare those paths with the briefs of the steps in flight and hand a shared file to the orchestrator's judgment, create the step's worktree at main's head, stage the base binaries, and record the dispatch in the state file. A step a red line took back out of main is prepared again from main's head, its old work saved as a patch in the ledger and applied in the new worktree. Triggers on: spec <entry> <step>, brief <step>, prepare step <n>, write the brief; and on a ruling typed in reply to a stop (Ruled: ...)."
+description: "Prepare one step of an open plan: refuse a step without the user's authority ((approved) or (ruling <name>)), check each premise of the step's text against the tree, under libraries: check look for a library for each capability the step builds, a candidate being the user's choice, write the brief (checked premises, fix text, verification list, report shape, pointer to the rules file, cases, libraries checked, paths it writes), compare those paths with the briefs of steps in flight, a shared file judged by the orchestrator, run the brief check (a fresh read-only agent checks the brief against the tree, each finding closed in the brief), create the worktree at main's head, stage the base binaries, and record the dispatch in the state file. A step a red line took back out of main is prepared again, its old work saved as a patch in the ledger and applied in the new worktree. Triggers on: spec <entry> <step>, brief <step>, prepare step <n>, write the brief; and on a ruling typed in reply to a stop (Ruled: ...)."
 metadata:
-  version: "1.6.3"
+  version: "1.7.0"
 ---
 
 # Prepare a step
 
-`/spec <entry> <step>` prepares one step of an open plan for its builder. It leaves behind the brief in the preparation commit and the dispatch entry written to the state file. It also leaves the step's worktree at the base, and the base binaries copied aside.
+`/spec <entry> <step>` prepares one step of an open plan for its builder. It leaves behind the brief and its brief check's report in the preparation commit, and the dispatch entry written to the state file. It also leaves the step's worktree at the base, and the base binaries copied aside.
 
 ## Quick start
 
 ```
-/spec <entry> <step>     write the one file a builder works from, and put the tree in the state the builder expects
+/spec <entry> <step>     write the one file a builder works from, have a fresh agent check it against the tree, and put the tree in the state the builder expects
 Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says; then /spec <entry> <step> again
 ```
 
@@ -47,6 +47,7 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
    - For a step taken back out of main, the failure its landing recorded under the step's Step 0.
 5. The tree, on main at its head, for every count, path, name, line number and claim the step's text makes.
    - Each is checked with a grep or a probe, never taken from the plan's text.
+6. The brief check's report, the final message of the agent that "Steps / The brief check" starts.
 
 ## Steps
 
@@ -62,6 +63,7 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
    - `plan.md` is copied aside to the session's scratch folder before Steps 2.
      - A step that waits at Steps 5 restores it with the session's own records, so a booked ruling is never lost.
    - An uncommitted change at the brief's path `agents/briefs/<step>.md` is a refusal ("Stops"), named by path, since Steps 4 writes the brief there.
+   - An uncommitted change at the brief check's report path `agents/reviews/<step>-brief-check.md` is a refusal ("Stops"), named by path, since "Steps / The brief check" saves the report there.
    - A preflight that fails is a refusal ("Stops").
    - Then, before any premise check, read the step's line and the Rulings section of `plan.md`, as "What it reads" 4 says.
    - A step whose line carries the user's authority goes on.
@@ -110,7 +112,7 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
    - The brief is committed at Steps 6, before the apply.
      - Its section "The patch as applied" is added after Steps 7, as Steps 7 says.
 5. Compare the brief's "Paths this step writes" with the brief of every other step in the dispatch block, by reading them.
-   - No shared path: the step goes on to its preparation commit.
+   - No shared path: the step goes on.
    - A shared path is a file both briefs name, whatever lines each names. It is not a refusal.
      - It goes to the orchestrator's judgment, as `plan-orchestration`'s "Two steps in flight" says, and run by hand, the session judges.
    - When the merge at landing is judged simple, the step goes on.
@@ -122,8 +124,10 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
      - The patch stays in the ledger.
      - `/spec` run again prepares the step with that patch.
    - `/spec` run again redoes Steps 2 from the start, so the premise checks and their amendments are made again on the tree as it then is.
+   - A step that goes on runs "Steps / The brief check", after the path comparison and before the preparation commit.
+   - Steps 5 is done when every finding of the brief check is closed in the brief, or when the step waits or has stopped.
 6. Make the preparation commit, a resume point ("Rules").
-   - It holds the brief, the patch of a step taken back out of main, and each of the session's own records (Steps 1).
+   - It holds the brief, the brief check's report, the patch of a step taken back out of main, and each of the session's own records (Steps 1).
    - It holds `plan.md` and the state file when this run or the session's own records changed them.
    - The paths are written out in the `git add -- <path> ...` command.
      - A ledger change the session did not make is not among them.
@@ -142,7 +146,7 @@ Ruled: <the choice>      the reply to a stop, booked as "Steps / A ruling" says;
    - Then the dependency install the project needs.
 8. Stage the base binaries for the landing's A/B, copied aside from the current build.
    - The configuration block's `bench:` line names them; none named, none staged.
-9. Write the dispatch block into the state file: step, executor, worker, worktree, base, launched, report path, `landing: not-started`, `round: 0`.
+9. Write the dispatch block into the state file: step, executor, worker, worktree, base, launched, report path, `brief_check` ("Steps / The brief check"), `landing: not-started`, `round: 0`.
    - The entry takes the shape the `plan` skill's `templates/orchestrator-state.md` gives: one entry, `dispatch:` followed by its keys, when `workers_at_once` is 1; appended to the list of entries when it is above 1.
    - The executor is the configuration block's default, until the orchestrator chooses for the step.
    - A step whose brief shares a file with a step in flight, judged simple to merge at Steps 5, gets `shared_paths:` in its entry: each shared file and why the merge is simple. With no shared file the key is left out.
@@ -205,17 +209,47 @@ A step whose dispatch entry reads `landing: backed-out` has its old worktree and
    - the ledger files are written and not committed on their own: the next `/spec` carries them in its preparation commit (Steps 6).
 3. Then `/spec <entry> <step>` is typed again. It rechecks every premise against the tree, the ruled text included, and writes the brief.
 
+### The brief check
+
+Steps 5 runs this on every step that goes on, after the path comparison and before the preparation commit (Steps 6):
+
+1. Start one fresh agent on the model the configuration block's `reviewer:` names, never the session that wrote the brief.
+   - It reads the brief, `plan.md`'s Goal, the step's line and the Rulings section, the rules file and the standards the configuration names, and the tree on main at its head.
+   - It changes nothing: every finding goes into its report.
+   - It invokes no skill: it runs the reads and commands of item 2 itself.
+   - It starts no agent: every read and every command runs in its own session.
+   - It writes `<REDACTED>` in place of the value of a secret in every line it quotes, as the rules file's rule on secrets in quoted command output says.
+2. The agent runs these checks and reports each with the command that shows it and that command's output:
+   - **Names.** Every name the step changes (a file, a heading, a key, a function, a term) is grepped across the repository, and every hit outside the brief's "Paths this step writes" is listed, each with whether the change makes it false.
+   - **The step line.** Every part of the plan's step line is present in "What to build": each item is mapped to the part of the line it serves, and a part with no item is named.
+   - **Premises.** Every command of the brief's "What is on the tree" is rerun, and its output is compared with what the brief says.
+   - **Cases and checks.** Every case of "Cases" is read against the rules file and the standards, and a case inconsistent with them is named.
+   - **The question.** Each case, the check on the step's line and the check of each item of "What to build" is asked "could this pass without the goal being reached?", "the goal" being the part of the plan's goal the step delivers, and the answer is given with its reason.
+   - **Implied inputs.** For a code step (a script, or a product's code), the inputs the step implies but never states are listed under "Cases", as `templates/brief.md`'s "Cases" asks, and each one missing is named with its expected result.
+   - The checks are done when each has its findings, or "none".
+3. The agent's final message is its report, in the shape of `templates/brief-check.md`: one heading per check of item 2, each with its findings or "none", then "Declined to judge", then the agent's usage.
+   - The session saves it at `agents/reviews/<step>-brief-check.md` beside the state file, the usage line filled with the agent's tokens, tool uses and time from its completion notice.
+4. The session closes each finding by a change to the brief, before the preparation commit.
+   - Each change is named under the report's "Closed" heading, beside its finding.
+   - The check runs once per `/spec` run: the brief as changed goes to the builder without a second run.
+   - A finding whose fix would change the step's scope, or make a choice the user would see, is a stop ("Stops"), left as "Steps / A stop" says.
+   - At such a stop the brief is restored to main's copy (`git restore -- <path>`, or deleted when main has none), and the report is among the ledger files the stop commits.
+   - This item is done when every finding has its change under "Closed", or the step has stopped.
+5. The preparation commit (Steps 6) carries the report.
+   - The dispatch entry (Steps 9) records the report's path under `brief_check`, with the agent's tokens, tool uses and time.
+
 ## Stops
 
-The first two rows are stops, which leave an open item as "Steps / A stop" says. The rest are refusals. A refusal names its cause and leaves nothing beyond what "Steps / A step taken back out of main" has already done.
+The first three rows are stops, which leave an open item as "Steps / A stop" says. The rest are refusals. A refusal names its cause and leaves nothing beyond what "Steps / A step taken back out of main" has already done.
 
 | Stop | When | What it shows | What resumes it |
 |---|---|---|---|
 | A false premise the plan cannot absorb | A premise the step's text makes is false on the tree, and its correction would change the step's scope or make a choice the user would see (Steps 2); the skill does not guess | The open item, booked in the open items | A ruling ("Steps / A ruling") |
 | A user-visible choice | The brief would have to choose a public shape, a wire format, a config key or a vocabulary, or, under `libraries: check`, a library could replace code the step would write by hand (Steps 3) | The open item, booked in the open items | A ruling |
+| A brief check finding the brief cannot absorb | A finding of the brief check whose fix would change the step's scope or make a choice the user would see ("Steps / The brief check") | The open item, booked in the open items, with the report's path | A ruling |
 | A step without the user's authority | The step's line ends with neither `(approved)` nor a `(ruling <name>)` for each ruling it rests on, each naming a ruling of the user in the Rulings section, or it starts with `Removed by` (Steps 1) | The step and the authority it lacks | The user's ruling, booked as "Steps / A ruling" says with the tag on the step's line, then `/spec` again |
 | An unusable `plan.md` | `plan.md` is missing or not UTF-8, lacks the step list or the Rulings section, or lists a step twice (Steps 1) | What is wrong in it | `plan.md` put right, then `/spec` again |
-| A failed preflight | Not on `main`, something staged, a git operation in progress, an uncommitted change at the brief's path, or one on the ledger's `plan.md` or state file that the session did not make (Steps 1) | What it saw | The tree put right, then `/spec` again |
+| A failed preflight | Not on `main`, something staged, a git operation in progress, an uncommitted change at the brief's path or at the brief check's report path, or one on the ledger's `plan.md` or state file that the session did not make (Steps 1) | What it saw | The tree put right, then `/spec` again |
 | A required key missing | A required key is not in `.agents/plan.yaml`; the refusal names it | The key | The key added, then `/spec` again |
 | No ledger folder | No folder under `<ledger_root>/` holds a `plan.md` that opens with `# Plan: <entry>` | A refusal that names `/plan` | `/plan`, then `/spec` |
 | A step in flight | A step is already in flight, and the configuration block does not allow more than one | The step in flight, named | That step landed, or a red line took its landing back out of main and its dispatch block reads `landing: backed-out` (the `land` skill's Steps 6) |
```

### `skills/spec/templates/brief-check.md` (new, whole)

````markdown
# Step <step> brief check (on main at <commit>)

The report of the fresh agent of the `spec` skill's "Steps / The brief check", on `agents/briefs/<step>.md`. A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number, since a page's lines move and a section's name does not. A line of code or a hit of a grep keeps its `file:line`.

## 1. Names

- <each name the step changes (a file, a heading, a key, a function, a term)>: `<the grep command>`; each hit outside the brief's "Paths this step writes", as the command printed it, with whether the change makes it false and why. Or, for a name: no hit outside the paths.

Findings: <each hit the change makes false>. Or: none.

## 2. The step line

- <each part of the plan's step line>: <the item of "What to build" that serves it>; or no item.

Findings: <each part with no item>. Or: none.

## 3. Premises

- <each fact of the brief's "What is on the tree">: `<its command>`, what it printed now, and whether that matches what the brief says.

Findings: <each premise whose output differs from the brief, with both>. Or: none.

## 4. Cases and checks

- <each case of "Cases">: consistent with the rules file and the standards, or the rule it breaks, named with its file and section.

Findings: <each case inconsistent with the rules file or the standards>. Or: none.

## 5. The question

- <each case, the check on the step's line, and the check of each item of "What to build">: "could this pass without the goal being reached?", "the goal" being the part of the plan's goal the step delivers; yes or no, with the reason.

Findings: <each one that could pass without the goal being reached, with how>. Or: none.

## 6. Implied inputs

- <for a code step (a script, or a product's code): each input the step implies but never states (a missing or unreadable file, an empty value, a malformed line, a path with a space, a value that reaches a command or a path), where a wrong answer costs something>: listed under "Cases", or missing, with the expected result it should have. Or: not a code step.

Findings: <each implied input missing from "Cases">. Or: none.

## Declined to judge

- <a point the agent did not check, or declined because it is the user's call or outside what a read and a rerun can settle>, <the reason>. Or: nothing.

Agent usage: <tokens>, <tool uses>, <minutes>.

## Closed (the session's change to the brief for every finding above, made before the preparation commit)

- <finding>: <the change to the brief, with its section>; or a stop, <the open item as the state file holds it>.
````

## DONE / NOT DONE

| Item | State | Evidence |
|---|---|---|
| 1. `/spec` "### The brief check" after "### A ruling", Steps unnumbered as before | DONE | `grep -n '^[0-9]*\. \|^### ' skills/spec/SKILL.md`: Steps 1 to 9 keep their numbers; "### The brief check" follows "### A ruling" (line 212) |
| 1. Steps 5 points at it, after the path comparison and before the preparation commit | DONE | `skills/spec/SKILL.md` Steps 5, the two last bullets (lines 127 and 128) |
| 1. Fresh agent on `reviewer:`, never the brief's writer; its reads; changes nothing; no skill; no agent; `<REDACTED>` | DONE | "Steps / The brief check" item 1 |
| 1. The five checks, each with its command | DONE | item 2: Names, The step line, Premises, Cases and checks, The question, Implied inputs (the brief's fourth check split in two bullets, see judgment calls) |
| 1. Final message is the report in `templates/brief-check.md`'s shape; saved at `agents/reviews/<step>-brief-check.md` | DONE | item 3 |
| 1. Findings closed by a change to the brief under "Closed", before the preparation commit; scope or user-visible choice is a stop | DONE | item 4; Stops row "A brief check finding the brief cannot absorb"; the Stops introduction reads "The first three rows are stops" |
| 1. The preparation commit carries the report | DONE | item 5 and Steps 6 ("It holds the brief, the brief check's report, ...") |
| 1. Dispatch entry records the path with tokens, tool uses and time under `brief_check` | DONE | item 5 and Steps 9 |
| 1. Preflight refuses an uncommitted change at the report path; Stops row "A failed preflight" names it | DONE | Steps 1 (line 66) and the row (line 252) |
| 1. Description names the brief check, at most 1,024; version 1.7.0 | DONE | length command below prints `1021 skills/spec/SKILL.md`; `metadata.version: "1.7.0"` |
| 2. `skills/spec/templates/brief-check.md` with the title line `# Step <step> brief check (on main at <commit>)` | DONE | `sed -n 1p skills/spec/templates/brief-check.md` prints that line |
| 3. `plan-orchestration` Steps 3 runs the check before the preparation commit; the orchestrator reads the report and the brief's changes before dispatch | DONE | Steps 3 and its first bullet (lines 46 and 47) |
| 3. The brief-check agent among the agents, on the reviewer's model; version 2.10.0; description at most 1,024 | DONE | "The two tiers, and the models" lines 123, 128, 131; length command prints `788 skills/plan-orchestration/SKILL.md` |
| 4. `/plan-help` `/spec` line names the brief check; version up one patch | DONE | line 56; `metadata.version: "1.8.3"` |
| Case 1 | DONE | after: lines in all four files (13 in `skills/spec/SKILL.md`, 2 in the template, 5 in `plan-orchestration`, 2 in `plan-help`), exit 0 |
| Case 2 | DONE | every length at most 1,024; output below |
| Case 3 | DONE | before and after: nothing, exit 1; the broader grep of the numbered citations prints the same three citations, see the first run |
| Case 4 | DONE | above, "Case 4, the brief check applied to brief 5" |
| Verify 1 | DONE | output below |
| Verify 2 | DONE | output below |
| Verify 3 | DONE | output below |

Verify 1, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-d-the-plan-skills-take-the-comparisons-process-changes/orchestrator-state.md` from the worktree root, exit 0:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 7 commands passed
```

The runner covers the scripts' tests and the ASCII rule over tracked and untracked files; it does not read the skills' text for meaning, which the review does.

Verify 2, the gate's length command, whole:

```
726 skills/land/SKILL.md
632 skills/ordo-init/SKILL.md
386 skills/plan-help/SKILL.md
788 skills/plan-orchestration/SKILL.md
616 skills/plan-retro/SKILL.md
477 skills/plan/SKILL.md
951 skills/refute/SKILL.md
630 skills/repo-setup/SKILL.md
997 skills/roadmap/SKILL.md
1021 skills/spec/SKILL.md
```

Verify 3, `LC_ALL=C grep -n '[^ -~]' skills/spec/SKILL.md skills/spec/templates/brief-check.md skills/plan-orchestration/SKILL.md skills/plan-help/SKILL.md`: no output, exit 1.

## Files and line counts

| File | Lines before | Lines after |
|---|---|---|
| `skills/spec/SKILL.md` | 238 | 272 |
| `skills/spec/templates/brief-check.md` | (new) | 49 |
| `skills/plan-orchestration/SKILL.md` | 316 | 318 |
| `skills/plan-help/SKILL.md` | 95 | 95 |

(`wc -l` on the worktree, and on `git show HEAD:<path>` for before; `git diff --stat`: 3 files changed, 52 insertions, 16 deletions, plus the new template.)

## Judgment calls

- The brief's fourth check ("every case consistent with the rules file and the standards, and each case and each item's check asked ...") is written as two bullets, "Cases and checks" and "The question", under `docs/dev/skill-layout.md`'s one requirement per bullet; the template has one heading per bullet, so six headings for the brief's five checks. Serves item 1 and item 2.
- "The question" is asked of each case, of the check on the step's line in `plan.md`, and of the check of each item of "What to build". The step line's check is named because the brief's "What is on the tree" says the check asks the question "of every step's check" (step 4's booking). Serves item 1.
- The agent reads `plan.md`'s Goal besides the step line and the Rulings, since "the goal" of the question is the part of the plan's goal the step delivers. Serves item 1.
- At a stop raised by the brief check, the brief is restored to main's copy, since "Steps / A stop" says no brief exists for a stopped step, and the report stays among the ledger files the stop commits, as "Steps / A stop" item 1 says of the files the session wrote. Serves item 1's stop bullet.
- `/plan-help`'s "/spec stops" line names a brief-check finding that would change the step's scope, and `/spec`'s Quick start, introduction and "What it reads" name the check, so every section of both skills agrees with the new stage (change standard rule 19). Serves items 1 and 4.
- The item "The check runs once per `/spec` run" states decision 2 of the brief in the skill, so the session does not rerun the check after closing its findings.

## User-visible changes

- `/spec`: before, after the path comparison the step went straight to its preparation commit. After, a fresh read-only agent on the `reviewer:` model checks the brief against the tree, its report is saved at `agents/reviews/<step>-brief-check.md`, the session closes each finding in the brief under the report's "Closed" heading, and the preparation commit carries the report. A finding whose fix would change the step's scope is a new stop. The preflight also refuses an uncommitted change at the report's path. The dispatch entry gains the key `brief_check`.
- `/spec` description: before and after quoted above (999 to 1021 characters).
- `/plan-orchestration` Steps 3: before, "It checks the premises, writes the brief, makes the worktree and writes the dispatch block."; after, it also runs the brief check, and the orchestrator reads the report and the brief's changes before dispatching the builder. The agents list names the brief-check agent.
- `/plan-help` prints, before, `/spec <entry> <step>          writes the brief, makes the worktree, stages the base binaries`; after, `/spec <entry> <step>          writes the brief, has a fresh agent check it against the tree (the brief check) and closes its findings in the brief, makes the worktree, stages the base binaries`. Its "/spec stops" line adds "a finding of the brief check would change the step's scope".

## Anything in the brief that was wrong

- Case 1's "on the unchanged tree nothing, exit 1": grep exits 2 there, because `skills/spec/templates/brief-check.md` does not exist yet; over the three files that exist it exits 1. The case still separates before from after.
- Case 3's pattern matches none of the numbered citations of `/spec` that exist; the three citations it misses (`skills/plan-orchestration/SKILL.md`, "the `spec` skill's Steps 1" twice and "Steps 5" once) stay true, as the first run shows.
- The brief's "What is on the tree" does not list the four sentences outside the path list that the change makes incomplete; they are under "Doc text".

## Doc text

Found with `git grep -n -i` of each changed name ("brief check", `brief_check`, `reviewer_report`, "writes the brief, makes the worktree", "It writes the brief", "preparation commit", "builder or a reviewer", "the builders and the reviewers") across `docs/`, `skills/`, `README.md` and `utils/`, outside the four paths of the step.

- `README.md:17`, current: `| \`spec\` | Prepares one step. It checks that the user approved the step and checks the step's premises against the tree. It writes the brief and checks the paths it writes against the steps in flight. It creates the worktree and stages the base binaries |`
  Replacement: `| \`spec\` | Prepares one step. It checks that the user approved the step and checks the step's premises against the tree. It writes the brief and checks the paths it writes against the steps in flight. A fresh read-only agent checks the brief against the tree, and each finding is closed in the brief. It creates the worktree and stages the base binaries |`
- `README.md:34`, current: `/spec <entry> <step>          writes the brief, makes the worktree, stages the base binaries`
  Replacement (the line `/plan-help` now prints): `/spec <entry> <step>          writes the brief, has a fresh agent check it against the tree (the brief check) and closes its findings in the brief, makes the worktree, stages the base binaries`
- `skills/land/SKILL.md:89`, current: `   - The booking states the builder's and each reviewer's tokens, tool uses and time, from their completion notices, read from the dispatch block's \`builder_usage\` and \`reviewer_report\`.`
  Replacement: `   - The booking states the brief-check agent's, the builder's and each reviewer's tokens, tool uses and time, from their completion notices, read from the dispatch block's \`brief_check\`, \`builder_usage\` and \`reviewer_report\`.` (a version bump of `land` goes with it, one patch).
- `skills/plan/templates/orchestrator-state.md:26`, current: `dispatch: none               # or the block /spec writes (a list with workers_at_once above 1): step, executor, worker, worktree, base, launched, report (the builder's report, at the path the brief names), landing, round. ...`
  Replacement of its first sentence: `dispatch: none               # or the block /spec writes (a list with workers_at_once above 1): step, executor, worker, worktree, base, launched, report (the builder's report, at the path the brief names), brief_check (the brief check's report path, with the agent's tokens, tool uses and time), landing, round. ...`, the rest of the line unchanged.

Sentences read again and still true: `docs/roadmap.md:23` (the gate of 2.D names the brief-check report), `skills/land/SKILL.md:201` ("Its preparation commit stays."), `skills/plan-orchestration/SKILL.md:143` and `:144` (the preparation commit is a resume point, and the report is committed in it, so it is no "other ledger record"), `skills/plan-orchestration/SKILL.md:255` ("each agent's tokens" covers the brief-check agent), `skills/plan-orchestration/SKILL.md:51`, `:150`, `:212` (numbered citations of `/spec`, numbers unchanged).

Read-only review of the ten restyled skills. Nothing in the repository was changed.

**What I compared, and the checks I ran**
- For each skill I compared three texts: the v1.0.0 SKILL.md (`git show v1.0.0:<skill>/SKILL.md`), the base commit its inventory names, and the current `skills/<skill>/SKILL.md`.
- The base commits are the same text as v1.0.0 for nine skills. `diff` shows land differs, and only by the three sentences plan 1's step 7 changed on the user's ruling ("open items" became "booked list"). I treated that change as sanctioned.
- `python3 utils/check_rule_inventory.py` prints `ok:` for all ten inventories.
- `python3 utils/check_skill_layout.py` prints ten `ok:` lines and exits 0.
- `spec/templates/brief.md` and `refute/templates/report.md` are unchanged since v1.0.0 (`diff` against `git show v1.0.0:...` is empty).
- Each finding is tagged: [restyle] means introduced by plan 1; [2.A] means introduced by plan 2.A; [pre-existing] means the defect is already in v1.0.0 and the restyle carried it over.

## plan-orchestration

1. **Stale inventory rows (inventory defect) [2.A].**
   - Plan 2.A inserted a numbered list (lines 163-175) into "Launching a builder". The archived inventory still points six rows at the old item numbers: 4 (`-C`), 5 (network), 6 (`-o`), 7 (`--ephemeral`), 8 (ten minutes) and 9 (`.codex` settings).
   - Those items are now the launch.sh run, the identity write, the transcript note, the exit-file watch, the first Codex run and `codex exec resume`. The rules themselves are now at items 8, 10, 11, 12, 13 and 15.
   - `check_rule_inventory.py` passes because it only checks that an item number exists.
   - Fix: renumber those rows in `.scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md`. Also make the checker (or a re-run after every later skill edit) catch inventories that later edits leave stale.
2. **Contradiction: a stop that ends the loop versus one that does not [restyle, merged away].**
   - Old line 82: "The turn ends only when nothing unblocked is left, or when the user has asked for a pause". A stop is not in that list, and old step 3 says after a stop "the loop moves to the next unblocked step or pauses".
   - The inventory maps that old sentence to new Steps 10, which says: "The loop ends only at a stop, at a pause, or when nothing unblocked is left".
   - So the old sentence's meaning is gone, and Steps 10 now contradicts Steps 3 (new line 47).
   - Fix: Steps 10 should read "ends only at a pause or when nothing unblocked is left; a stop blocks its step and the loop moves to the next unblocked step".
3. **Contradiction: the dispatch block's `report` field has two meanings [2.A].**
   - `/spec` writes `report path` (spec Steps 7), the builder's Markdown report. Refute reads it as "the report path the builder was told to write to".
   - Launching a builder item 1 (line 164) says every launch path goes under its own field, `report` included. For a shell builder that path is launch.sh's `--report`, which is the `claude -p` JSON stdout or the `codex -o` final message.
   - Two different files end up under one key.
   - Fix: give the launch's output its own field (for example `output`), and say in Steps 6 that the orchestrator extracts the builder's report from it into the `report` path.
4. **Unusable instruction: relative paths resolve from different directories [2.A].**
   - launch.sh's `run_claude` runs `cd "$opt_cwd"` before it reads `--prompt` and writes `--report`, `--stderr` and `--exit`. A relative path for a `claude` launch therefore resolves from `<worktree>/<tool dir>`, while for a first `codex` run it resolves from the caller's directory.
   - Meanwhile plan's Rules say "Every path in the ledger is relative to the repository root", and SKILL.md says nothing about resolution.
   - An orchestrator that records ledger-relative paths and passes them to `launch.sh claude` gets the exit file written inside the worktree, and its monitor watches the wrong file.
   - Fix: require absolute paths for every launch option, in item 1 of the launch list, or make launch.sh absolutise every path before the `cd`.
5. **Inaccuracy: where a `claude -p` transcript lands [2.A].**
   - Line 173 says the transcript is "in the folder named after the worktree's directory". The builder runs with `--cwd <worktree>/<tool dir>`, so the project folder is named after that directory, not the worktree root.
   - Fix: say "named after `--cwd`".
6. **Contradiction: the builder and the ledger [pre-existing].**
   - Steps 4: "The builder ... never writes into the ledger".
   - spec's `templates/brief.md` line 40 tells the builder: "Write it to `<ledger>/agents/reviews/<step>-report.md`". land Steps 4 expects "a report written in both trees".
   - Fix: say the builder writes only its report, at the path the brief names in the worktree's copy of the ledger, and nothing else in the ledger.
7. **Contradiction: a finding that is a stop is not one of the stop kinds [pre-existing].**
   - Steps 8 "Not sent back" and Anti-patterns row 2 make a finding that "changes the scope, a requirement, a public shape or an established decision" a stop.
   - The Stops section says a stop is "of one of four kinds", and none of the four rows covers a scope or requirement change.
   - Fix: add a Stops row for it.
8. **Contradiction: cross-skill, the closing step always stops [pre-existing].**
   - A plan's closing step runs `/roadmap done`, and roadmap stops for approval on every change (roadmap Stops row 1).
   - That stop is not one of the four kinds here, so an unattended orchestrator either breaks roadmap's approval rule or stops outside its own list.
   - Fix: either list "the closing step's roadmap diff" as a stop in plan-orchestration, or let `/roadmap done` under a closing step write without approval.
9. **Contradiction: cross-skill, with plan-retro, over rewriting a broken rule [pre-existing].**
   - Anti-patterns row 6 here: "Rewriting a rule that keeps being broken ... Propose a check".
   - plan-retro's proposal 4 proposes "a sharper sentence for the existing rule".
   - Fix: pick one. Either allow the sharper sentence here when no command can check the rule, or drop proposal 4 from plan-retro.
10. **Weakened wording (cosmetic) [pre-existing].** Anti-patterns row 3 says "the builder's one repair round", but the cap is `repair_rounds`, which can exceed 1. Fix: "the repair rounds".
11. **Cosmetic [restyle].** Steps 8 points at "the second row of 'Anti-patterns'" by position, which breaks if the rows are reordered. Fix: quote the rule, or name the row by its text.

**Verdict: sound with fixes.** Items 2, 3 and 4 must be fixed before an orchestrator follows the skill literally.

## spec

1. **Contradiction: is every false premise a stop? [pre-existing, sharpened by the restyle].**
   - Steps 2 and the Stops row "A false premise" make every false premise a stop, with no brief written.
   - Steps 4 still commits "any amendment to `plan.md` the premise checks forced", which can never happen if every false premise stops.
   - plan-orchestration's Stops row says only "a premise found wrong that the plan cannot absorb" is a stop.
   - Old line 51 supports that reading: the plan is corrected, and only a scope change is a stop. Plan 1's own booking ("Premise correction ... corrected to 23 at 97c8fdf") shows that is how it was practised.
   - Fix: a false premise the plan can absorb is corrected in `plan.md` in the preparation commit. Only a scope change or a user-visible choice stops. Drop or re-word the "A false premise" row.
2. **Unusable instruction [pre-existing].**
   - The Stops row "A step in flight" says it resumes when "That step landed".
   - A step that `/land` took back out of main for a red line booked in the booked list never lands, and its dispatch block is never cleared (see land 4). `/spec` then refuses indefinitely.
   - Fix: add what clears the block in that case.
3. **Inventory:** rows check out against the text.

**Verdict: sound with fixes.**

## refute

1. **Contradiction: cross-skill, the refutation owed after the exception round [pre-existing].**
   - "Over a repair round" item 1 and Finding dispositions item 1 run the refutation "at most `repair_rounds`".
   - land's Stops row "The step not ready" and plan-orchestration Steps 8 allow "one more under plan-orchestration's exception", and land then refuses when the run over the last round is missing.
   - Fix: in refute, say "at most `repair_rounds`, or one more under plan-orchestration's exception".
2. **Changed meaning, a narrowed exception [restyle].**
   - Old line 30: "No background shells, no polling, no benchmark suites, no sanitizer runs unless the brief lists them."
   - The inventory splits that sentence. Anti-patterns row 3 bans background shells and polling unconditionally, and only row 4 keeps "the brief does not list".
   - Fix: decide whether the brief can list a background shell. If it can, put the qualifier back on row 3.
3. **Naming mismatch [pre-existing].** Steps 7 records "the reviewer line in the dispatch block". plan's `templates/orchestrator-state.md` calls that field `reviewer_report`, and plan-orchestration never names it. Fix: use `reviewer_report` in refute, and in plan-orchestration Steps 7.
4. **Cosmetic [restyle].** Line 10 is ungrammatical: "has one reviewer, who changes nothing, do what a builder's report cannot do for itself". Fix: "dispatches one reviewer, who changes nothing and does what ...".

**Verdict: sound with fixes.**

## land

1. **Changed meaning: the look can be skipped [restyle].**
   - Old step 5a (the look) was its own step. New Steps 5 folds it in as the last bullet ("Then the look").
   - "The landing script" item 4 says land.sh's "zero exit is step 5's pass", so an orchestrator using land.sh can take step 5 as passed without doing the look.
   - Fix: make the look its own numbered step between 5 and 6.
2. **Unusable order [pre-existing, now against the layout].**
   - `docs/dev/skill-layout.md` says "A numbered list means order". But Steps 11 (the landing report) runs before Steps 9 (the commit) and before Steps 10.
   - Steps 7's booking contains "the usage row", which Steps 8 produces "first".
   - Fix: renumber in execution order: row, booking, state file, landing report, commit, worktree removal.
3. **New unrequested rule [restyle, drawn from a template].** Stops bullet 4: "the booked step is worked in queue order". It comes from the state-file template's heading, not from the old land text. It is harmless, but it is a new rule in land.
4. **Unusable instruction: after a red line, nothing says what state is left [pre-existing].**
   - When a red line takes the step out of main and is booked in the booked list, neither land nor plan-orchestration says what becomes of the dispatch block (it is still at `landing: cherry-picking`, since Steps 8 never runs), the worktree, the branch, or the unticked step.
   - On resumption, plan-orchestration treats `landing: cherry-picking` as a landing to check and continue.
   - Fix: add an item to Steps 5 that sets the block to `landing: backed-out` (or clears it) and keeps the worktree, and add the matching case to plan-orchestration's resumption list.
5. **Inventory:** rows check out against the text.

**Verdict: sound with fixes.** Items 1 and 4 are the ones that make a literal run go wrong.

## plan

1. **Contradiction: in the template, open-item text sits under the Closed heading [pre-existing].**
   - In `templates/orchestrator-state.md`, the only bullet under "## Closed items" reads: "<a stop awaiting the user's ruling, a fix owed, or nothing ...>. A reported item is booked here the moment it is raised; it leaves only when it is done or the user has ruled".
   - That describes open items, and it conflicts with the heading ("the log of what was raised and how it ended") and with plan-orchestration's Reports rules.
   - Fix: move that sentence under "Open items" and put a closed-log placeholder under "Closed items".
2. **Contradiction [pre-existing].**
   - Rules 1: "A step is one deliverable and one agent dispatch".
   - The executor may be `inline` or `academic-paper`, and `templates/plan.md` line 3 already exempts bookkeeping steps.
   - Fix: carry that exception, and the executor choice, into Rules 1.
3. **Contradiction: the path rule versus launch.sh [2.A].** Rules 2 ("Every path in the ledger is relative to the repository root") conflicts with launch.sh's resolution of `claude` paths (plan-orchestration 4) and with `launch_note`, which must be absolute. Fix: state the exceptions.
4. **Field lists [2.A].** The template's dispatch comment matches spec Steps 7 and plan-orchestration's launch fields, except for the `report` clash (plan-orchestration 3) and the `reviewer_report` naming (refute 3).
5. **Unusable instruction [pre-existing].** Steps 6 commits "both files", but Steps 5's empty `agents/briefs/` and `agents/reviews/` cannot be committed in git. Fix: say they come into being with their first file, or add a `.gitkeep` to each.
6. **Inventory:** rows check out against the text.

**Verdict: sound with fixes.**

## plan-help

1. **Contradiction: the printed sequence versus land [pre-existing, printed text unchanged].**
   - The printed line "/land refuses or stops ... fix it at landing or book it, then /land again" is wrong for a red line booked in the booked list. land takes that step out of main, so `/land` again is not what comes next.
   - Fix: split the line into refusal (fix, then `/land` again) and red line (step out of main, booked).
2. **Cosmetic [pre-existing].**
   - The printed sequence says "booked items", while every other skill says "booked list".
   - It also says `/plan-orchestration` uses "an agent at 'build it'", although the executor can be `inline`.
3. **Inventory:** checks out.

**Verdict: sound with fixes.** The fixes are to the printed text, which the skill prints verbatim, so they need the user's approval.

## ordo-init

1. **Contradiction [2.A].**
   - Rules 5: "Every path is relative to the repository root."
   - Steps 7 and `templates/check_config.py` require `launch_note` to be an absolute path. check_config reports a relative one as an error, and launch.sh refuses it.
   - Fix: add the exception to Rules 5.
2. **Weakened rule (minor) [restyle].**
   - Old line 56: "It never overwrites an existing page or `.agents/plan.yaml`".
   - It is now an Anti-patterns row whose Do instead is "Rules 4" (show a diff and approve it). The absolute ban becomes "not without an approved diff", which old line 56's second clause allowed anyway.
   - Acceptable, but the word "never" is gone. Fix: keep "never overwrites; a change is shown as a diff" in Rules 4.
3. **Contradiction [pre-existing].** Rules 1 ("writes nothing until the user approves") conflicts with Steps 3, which runs install and build commands once before approval, and those write build output. Fix: state the exception.
4. **Inventory:** checks out. The plan 2.A `launch_note` bullet is outside the inventory's scope and matches check_config.py.

**Verdict: sound with fixes.**

## roadmap

1. **Unusable instruction [restyle].**
   - Steps 2-5 (draft a change, show a diff, write, commit) read as applying to every command.
   - Plain `/roadmap` (the Show subsection) changes nothing, so a literal reading has nothing to draft.
   - Fix: say Steps 2-5 apply to add, move, done and drop only.
2. **Contradiction: cross-skill [pre-existing].** Stops row 1, "The change | Every change", makes `/roadmap done` stop under a plan's closing step (see plan-orchestration 8).
3. **Changed meaning (minor) [restyle].**
   - Old line 69: a missing dependency is "shown as a question, not added as an entry", inside a draft that goes on.
   - New Steps / add 3 makes it a stop.
   - It is equivalent in effect, since the draft already waits on approval. No fix is needed unless the draft must continue past the question.
4. **Inventory:** checks out.

**Verdict: sound with fixes.**

## plan-retro

1. **Contradiction: cross-skill [pre-existing].** Proposal 4 ("a sharper sentence for the existing rule") contradicts plan-orchestration's Anti-patterns row 6 (see plan-orchestration 9).
2. **Inventory:** checks out. Every old rule is present with its qualifiers: the three-steps-or-two-plans threshold, never loosening a rule, no number the collector output does not back, and the `--exclude-listed` condition.

**Verdict: sound with fixes.** The fix belongs to whichever skill gives way in item 1.

## repo-setup

1. **Contradiction [pre-existing].**
   - Question 5 asks for the repository's commit rule (default "commit only when told"), and `sync` Steps 8 respects it.
   - The setup's Steps 13 commits regardless of that rule.
   - Fix: make Steps 13 follow the answer to question 5, with the "No commit allowed" stop.
2. **Qualifier added (acceptable) [restyle].** Rules 2 adds "after Steps 1" to "nothing is written until approval", to allow `git init`. It does not contradict the old text.
3. **Inventory:** checks out.

**Verdict: sound with fixes.** Only item 1 needs a change.

## Contradictions between skills, collected

- **Dispatch block fields:**
  - `report` has two meanings (spec's and launch.sh's).
  - Refute's "reviewer line" is the template's `reviewer_report`, which plan-orchestration never names.
- **Stop rules:**
  - plan-orchestration Steps 10 versus Steps 3.
  - spec's "every false premise" versus plan-orchestration's "cannot absorb".
  - roadmap's approval stop under an unattended closing step.
  - A scope-changing finding is a stop but has no Stops row.
- **Open items versus booked list:** the refute, land, plan-orchestration and state-template texts agree on "open items hold only what the user must rule on". The exception is the stray open-item text under the template's Closed heading.
- **Repair rounds:** refute says `repair_rounds`; land and plan-orchestration allow one more.
- **Builder and ledger:** plan-orchestration says the builder never writes into the ledger; the brief template says it writes its report there.
- **Paths:** "relative to the repository root" (plan, ordo-init) versus launch.sh's resolution from `--cwd` and the absolute `launch_note`.

## Overall verdicts

| Skill | Verdict |
|---|---|
| plan-orchestration | sound with fixes (2, 3 and 4 must go in first) |
| spec | sound with fixes |
| refute | sound with fixes |
| land | sound with fixes (1 and 4 must go in first) |
| plan | sound with fixes |
| plan-help | sound with fixes |
| ordo-init | sound with fixes |
| roadmap | sound with fixes |
| plan-retro | sound with fixes |
| repo-setup | sound with fixes |

No skill lost a rule outright in the restyle. The restyle introduced four defects:
- plan-orchestration Steps 10 merged away "a stop does not end the turn".
- land's look became skippable under land.sh.
- refute's "unless the brief lists them" was narrowed.
- roadmap's Steps read as applying to Show.

Plan 2.A introduced the path, `report`-field and stale-inventory defects. The rest were already in v1.0.0 and the restyle carried them over.

Relevant files:
- /Users/axelfaes/workspace/ordo/skills/plan-orchestration/SKILL.md
- /Users/axelfaes/workspace/ordo/skills/plan-orchestration/templates/launch.sh
- /Users/axelfaes/workspace/ordo/skills/spec/SKILL.md
- /Users/axelfaes/workspace/ordo/skills/spec/templates/brief.md
- /Users/axelfaes/workspace/ordo/skills/refute/SKILL.md
- /Users/axelfaes/workspace/ordo/skills/land/SKILL.md
- /Users/axelfaes/workspace/ordo/skills/plan/SKILL.md
- /Users/axelfaes/workspace/ordo/skills/plan/templates/orchestrator-state.md
- /Users/axelfaes/workspace/ordo/skills/plan-help/SKILL.md
- /Users/axelfaes/workspace/ordo/skills/ordo-init/SKILL.md
- /Users/axelfaes/workspace/ordo/skills/roadmap/SKILL.md
- /Users/axelfaes/workspace/ordo/skills/plan-retro/SKILL.md
- /Users/axelfaes/workspace/ordo/skills/repo-setup/SKILL.md
- /Users/axelfaes/workspace/ordo/.scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md

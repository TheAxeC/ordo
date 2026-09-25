# Plan: 2.B Repair what the audit of plans 1, 2 and 2.A found

Execution ledger for roadmap entry 2.B in `docs/roadmap.md`. One bullet is one step of work and one agent dispatch, except the bookkeeping steps the orchestrator does itself (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

The findings this plan closes are the five reports in `.scratch/reviews/2026-09-24-audit/`: `1-process-audit.md`, `2-restyled-skills.md`, `3-checkers.md`, `4-coverage-and-roadmap.md`, `5-plan-2a-launch.md`.

## Goal

Every finding of the five reports in `.scratch/reviews/2026-09-24-audit/` is fixed in the tree or ruled out by the user. That covers the skill texts (the restyle and 2.A defects, the contradictions between skills as ruled, Opus as the default model for the orchestrator and the agents, with Fable, Astra and Sol as options for the orchestrator and Sol for the agents, `inline` kept as an optional executor, stops raised as plain-text open items), `launch.sh`, `pin.sh`, `collect_findings.py` and the other tools, the roadmap's gates and order, every row of `docs/academic-coverage.md` checked against its file, a committed verify runner, and the three archived ledgers corrected to what was observed.

## Gate

the plan's closure table lists every numbered finding of the six reports in `.scratch/reviews/2026-09-24-audit/` with the commit that closes it or the user's ruling; the committed verify runner exits 0 on main, and its test shows it failing on a planted red test; each fault the checkers review planted in a tool now turns that tool's test red; each of the 169 coverage rows carries a recorded check against its research-hub file, and the coverage check passes; `/plan-retro` has run over the three archived plans and each of its proposals is ruled; the layout check and the rule-inventory check pass.

## Steps, in execution order

- ✅ 1 `utils/verify.sh <state file>`: runs a plan's verify list, fails on a test's exit status or on a last line that does not start with `PASS:`, and prints every line it saw; its test plants a red test and expects the runner to fail; `docs/dev/building.md` and `docs/dev/change-standard.md` name it, and every later landing uses it (1 commit)
- 1a The verify runner moved into the land skill: `utils/verify.sh` and its test become `skills/land/templates/verify.sh` and `verify.test.sh` (ruling H); `README.md`, `docs/dev/building.md`, `docs/dev/change-standard.md` and this plan's verify list name the new path; `land` (Steps 6), `refute` ("What the reviewer runs"), `spec`'s `templates/brief.md` ("Verify before you report") and `plan-orchestration` (where a step's checks run) say a step's verify list runs through the land skill's `templates/verify.sh` and its printed lines are booked; and the runner's summary-test detection and the untested parts of its signal handling, booked at step 1's landing from the review over round 2 (`agents/reviews/1-refuter.md`, Closed): a `;` or a comment after `tail`, and a quoted `| tail` at the end of a command, read the way the shell reads them; a test per spelling that checks the `PASS:` condition, not only the exit status; tests that TERM goes before KILL with its grace, and that signals are blocked while a command starts; `sh utils/verify.test.sh` red under each revert; and `refute` ("The four headings") and its `templates/report.md` say that under the four headings every list item is a finding, a heading with none holds only "none", and a confirmation goes under Verification or into a paragraph (from `agents/reviews/6-refuter.md`, Closed) (1 commit)
- ✅ 2 Skill texts, part 1: `skills/plan-orchestration/SKILL.md` and `templates/launch-note.md` text, and the `plan` skill's `SKILL.md` and templates: a stop does not end the loop; one meaning for the dispatch block's `report` field; launch paths absolute; the transcript folder named after `--cwd`; the builder writes only its report into the ledger; the stop kinds for a scope-changing finding and for the closing step's roadmap diff (ruling 3a); the sharper-sentence rule (ruling 3b); the exception round beyond `repair_rounds`; the round cap as a rule of its own (at most `repair_rounds` rounds plus the one exception, which the user's yes does not extend; after the last round a step lands with its small fixes and books the rest as steps) and an Anti-patterns row for offering the user another round; Opus as the default model for the orchestrator and every agent, Fable, Astra and Sol allowed for the orchestrator, Sol for the agents, never Fable or Astra for an agent; `inline` kept as an optional executor; stops raised as plain-text open items, never a question-box tool; every report opens with the position line (the roadmap entry, the plan step n of m, the next step), then the open items; the state template's closed list and the `reviewer_report` field; each skill invoked through the runner every time, after a compaction too, never followed from remembered text; `launch-note.md` says the `--pid` process owns the builder and lives until `end`, and that a new `start` field is optional and written on the page before `launch.sh` sends it; the rule inventories of the skills it changes updated; the layout check, the inventory check and a grep per changed rule pass (1 commit)
- ✅ 3 Skill texts, part 2: `spec` (a false premise stops only when the plan cannot absorb it, ruling 3c; what clears a step-in-flight block), `refute` (the exception round; the "unless the brief lists them" qualifier; `reviewer_report`; the grammar of its opening line), `land` (a first step, before the wip commit, that stops the step's builder and every reviewer through the runner's stop tool and checks the runner's agent listing, and a shell builder's pid and exit file, naming no vendor; the look as its own step; its steps in execution order; the state a backed-out landing leaves; a landed step found short or wrong finished by a new step on top, a landed commit reverted only on the user's ruling), `plan-help` (its printed sequence), `plan-retro` (ruling 3b), `roadmap` (its steps apply to add, move, done and drop), `ordo-init` (the path exception; "never overwrites"; the build-command exception), `repo-setup` (the commit rule); the rule inventories updated; the same checks as step 2 pass (1 commit)
- 4 `skills/plan-orchestration/templates/launch.sh` and its test: every note call bounded at about 3 s; the pid file names the process that owns the builder, that pid is alive before `start` and is the one passed to it, and a kill still writes the exit file and calls `end`; a second live launch of a step refused; every path made absolute and the script's own errors sent to the stderr file; a Claude session id known before the builder starts; the exit file written in one move; the note label `<entry>/<step>`; "Launching a builder" says to commit the dispatch block before the launch and to watch the pid as well as the exit file; `launch.test.sh` covers each case, and each fault the plan 2.A review planted turns it red (1 commit)
- ✅ 5 `utils/pin.sh` and its test: check mode flags links into the live clone; pin mode removes only links into the pinned worktree and reports the others; a home folder holding a space; a stale worktree pruned before re-pinning; `pin.test.sh` covers each case, and each fault the checkers review planted turns it red (1 commit)
- ✅ 6 `skills/plan-retro/templates/collect_findings.py` and its test: numbered findings and the subheadings inside a repair round read; Verification, Not checked, Closed and Usage skipped; `--exclude-listed` compared by real path; its test runs on fixtures shaped like the archived reports, and its count over the three archived plans matches a hand count written in the report (1 commit)
- 6a `skills/plan-retro/templates/collect_findings.py` and its test, from the review over step 6's round 1 (`agents/reviews/6-refuter.md`, Closed): "nothing", "no finding" and "no defect" count as the no-finding form only as the item's whole first sentence, "none" staying as ruled; an item is a closure only when it says the closure holds, so "closed in part only", "claimed closed: ... is not" and "Closed? No" stay findings; a fixture with two heading suffixes; tests for `.` as a plan, a name without `-refuter.md` and an empty step in `--exclude-listed`; each red under its revert; the collector's count over `.scratch/archive` and the hand counts of step 6 given again, with the complete list of archived items that report no defect (1 commit)
- 7 `utils/check_skill_layout.py` and `utils/check_rule_inventory.py` with their tests: lines split on newlines only; `__` counted as bold only outside a word (ruling 2b); a byte-order mark; indented headings; empty tables and version tags caught; an old path that is a directory refused; each fault the checkers review planted turns a test red; its builder is launched from a shell through `launch.sh claude` with `--note` naming the hub's `dispatch-note.mjs`, and the orchestrator checks that its row appears under this session in oculus's Agents view (1 commit)
- 8 `utils/check_coverage.py` and its test: the dotted Done form (`2.A.`); one Unicode normal form for file names; lines split on newlines only; a mode that requires every `rebuild: <skill>` row to name an existing file of `skills/<skill>/`, for the entry gates of step 10; each fault the checkers review planted turns the test red (1 commit)
- 9 `skills/repo-setup/templates/sync_rules.py`, `skills/land/templates/land.sh` and `usage.py`, with their tests: an undecodable file exits 2; CRLF kept; `land.sh` lands when nothing is pending, fails instead of skipping its example check inside an Ordo checkout, and stops waiting on a stale lock after a bound; `usage.py` names Codex counts correctly and rejects a time without its offset; each fault the checkers review planted turns a test red (1 commit)
- 10 Roadmap gates and order, through `/roadmap` with the diff shown to the user: entry 15.A's gate made passable; a gate for each of entries 3 to 14 that checks its `rebuild:` rows through step 8's mode; entry 16 waits on 14; the order of entries 5 and 9; entries 7 and 10 given the side-by-side run entry 16 asks for; entry 8's coverage note (1 commit; orchestrator, no agent)
- 11 Coverage rows of academic-paper (61 rows): a builder reads every file in full, checks its row's mark, reason and target, fixes each defective row, and writes one record per row (the file read, the verdict, the change) to `agents/reviews/11-rows.md`; the record count equals the row count, and the coverage check passes (1 commit)
- 12 Coverage rows of academic-paper-reviewer (26 rows), as step 11, records in `agents/reviews/12-rows.md` (1 commit)
- 13 Coverage rows of academic-pipeline (30 rows), as step 11, records in `agents/reviews/13-rows.md` (1 commit)
- 14 Coverage rows of deep-research (52 rows), as step 11, records in `agents/reviews/14-rows.md` (1 commit)
- 15 Ledger corrections in the three archived plans: plan 1's usage rows from the measured figures; each booking that claims a `PASS:` count nobody saw rewritten from the audit's re-run; the closed lists filled from each plan's rulings; plan 2's stale lines; plan 1's Done line in the roadmap, shown to the user; a grep shows no booking that claims a count without the lines it quotes (1 commit)
- 16 `/plan-retro` over the three archived plans, its proposals raised to the user one by one as open items (orchestrator, no agent)
- 17 The approved retro proposals applied; each proposed check runs on the tree (1 commit)
- 18 The closure table `agents/reviews/closure.md`: every numbered finding of the six reports (the five of the audit and `6-oculus-changes.md`) with the commit that closed it or the user's ruling; its row count equals the count of findings in the reports (1 commit)
- 19 the closing: `/roadmap done 2.B` with the gate's output, the diff shown to the user; the release tagged and the user's permission asked to pin it with `utils/pin.sh <tag>`, pinned only on that yes; this folder moved to `.scratch/archive/` (orchestrator, no agent)

## Could run in parallel

`workers_at_once: 3`. A step that touches a rule file, a configuration file or shared files runs alone; two steps in flight never share a path.

- 1 runs alone (it edits `docs/dev/building.md` and `docs/dev/change-standard.md`), before every other step, so every later landing uses the runner.
- 2, 3, 5 with each other after 1.
- 6, 8, 9 with each other and with 2, 3, 5 after 1.
- 7 after 4 and after the oculus session's fixes to its launch-note setup (it is the step launched from a shell).
- 4 after 2 (both edit `skills/plan-orchestration/SKILL.md`).
- 10 after 8 (it uses step 8's mode).
- 11, 12, 13, 14 one after another after 8 (they all edit `docs/academic-coverage.md`).
- 15 with anything after 1 that does not touch the archived ledgers or the roadmap.
- 6a after 6, with anything that does not touch `skills/plan-retro/`.
- 16 after 6 and 6a (it needs the fixed collector); 17 after 16.
- 1a runs alone after steps 4, 6 and 8 land: it edits the rule pages, `README.md`, and the skill texts of `land`, `refute`, `spec` and `plan-orchestration`.
- 18 after every step from 1 to 17.

## Rulings (2026-09-24)

- The way back on track is option C: this repair plan, run in agent mode through the skills, then entry 3; no restart (the user).
- The recommendations 2a to 2h of the audit report are accepted: the layout seen and confirmed (2a); `__` bold only outside a word (2b); step 14's work pulled into plan 1 step 2 kept (2c); the single-heading-line inventory row kept (2d); about 35 words allowed for the coverage table's reason cells only, written into the prose standard as a named exception (2e); the launch-note page beside `launch.sh` kept (2f); a resumed builder is a new note record, labelled `<entry>/<step>`, the label form checked with the oculus session before it ships (2g); entry 15.A's gate fixed with the diff shown (2h) (the user).
- Contradiction 3a: the closing step's roadmap diff is a stop of `plan-orchestration`. 3b: a sharper sentence is allowed only when no command can check the rule, in both `plan-orchestration` and `plan-retro`. 3c: a false premise stops only when the plan cannot absorb it; one it can absorb is corrected in `plan.md` in the preparation commit (the user).
- Models: Opus for the orchestrator and the agents in this plan, and as the skills' default; Fable, Astra and Sol are options for the orchestrator, Sol for the agents, and an agent (builder, reviewer) never runs on Fable or Astra (the user).
- Executor: `agent` for this plan; `inline` stays an optional executor in the skills (the user).
- No question-box tool; a question or a stop is written as plain text, as an open item with options, pros, cons and one recommendation (the user).
- Every row of `docs/academic-coverage.md` is checked against its file, since a sample of 57 found 7 defective rows (the user).
- Every report opens with a position line: the roadmap entry, the plan step n of m, and the next step (the user).
- `workers_at_once: 3` (the user).
- The step list above is approved (the user). The steps start only on the user's greenlight.
- From the review of the oculus session's changes (`.scratch/reviews/2026-09-24-audit/6-oculus-changes.md`): A (a), steps 2, 3 and 4 widened with its findings for Ordo; B (a), a landed step is finished forward by a new step, a landed commit reverted only on the user's ruling; C (b), a note call bounded at about 3 s, the oculus session cutting its lock wait to about 2 s; D (a), the closing tags the release and asks the user's permission to pin it (the user).
- Open item E: (b), step 7's builder is launched from a shell through `launch.sh` with the hub's note command, as the one end-to-end run of the launch note (the user).
- Open item F (2026-09-25): (a), step 1 gets one repair round beyond the cap: the verify runner runs each command through `bash -o pipefail -c` from its Python in a new session, kills that session on INT, HUP, QUIT or TERM, and states `bash` as a requirement (the user).
- Open item G (2026-09-25): (a), step 2 states the round cap as a rule of its own in `plan-orchestration`, and adds an Anti-patterns row for offering the user another round (the user).
- Open item H (2026-09-25): (a), the verify runner and its test move into the land skill's `templates/`, so every repository has it through the installed skills; step 1a carries the move and the skill texts that name it (the user).
- Open item I (2026-09-25): (a), the user removed the stray link; every brief that runs a tool touching skill folders clears `CLAUDE_CONFIG_DIR` (the user).
- `start` gets no `--transcript` flag: the transcript reaches the note only through the separate `transcript` call, and the interface between Ordo and oculus keeps its three calls as they are (the user).

## Blocked, and by what

- 16: the user's ruling on each retro proposal, raised when the step runs.
- 7: step 4 landed. The oculus session's fixes to its launch-note setup are in research-hub's commit 409de414 (the execute bit, `git ls-files -s` shows 100755; the absolute `launch_note` path; `LOCK_WAIT_MS = 2000`).

### Step 1, the verify runner (landed 2026-09-25)

- Landed: `utils/verify.sh` (244 lines) runs a plan's verify list from its state file: each command as written through `bash -o pipefail -c`, started from Python in a session of its own with standard input closed; a command ending in a pipe into `tail` passes only on exit 0 and a `PASS:` last line; the first red command stops the run; INT, HUP, QUIT and TERM end the command's session and exit 128 plus the number; exits 64 on a state file it cannot use and 69 when `python3`, PyYAML, `bash` or `ps` is missing. `utils/verify.test.sh` (510 lines) covers each case and runs the runner under `sh` and `dash`. `README.md`, `docs/dev/building.md` and `docs/dev/change-standard.md` name the runner and its test; this plan's verify list gained the test.
- Rounds: the first review, repair round 1, the review over it, open item F ruled (a), repair round 2 under plan-orchestration's exception, the review over it; its findings fixed at landing or booked as step 1a. The landing fixes were read by a fresh reviewer (`agents/reviews/1-landing-review.md`) and its findings fixed at landing.
- Verified on main with `sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, which printed:

```text
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
```

  and exited 0; the ASCII check over the tree exited 0 with no output.
- Booked: step 1a (above); the skill texts that name the runner, carried into step 3.
- Usage, orchestrator from the loop's start (73c188a, the greenlight; no step of this plan had landed before) to this booking: 61 messages, 51853 output tokens, 121761 cache-write tokens, 33845304 cache-read tokens, 136 fresh input tokens, 172 minutes.

### Step 2, the plan-orchestration and plan skill texts (landed 2026-09-25)

- Landed: `skills/plan-orchestration/SKILL.md`: a stop blocks only its step and the loop goes on; the builder writes only its report into the ledger; the launch output under its own field `output`; `reviewer_report`; the round cap as one rule the user's yes does not extend; the models (Opus by default for the orchestrator and every agent; Fable, Astra and Sol options for the orchestrator, Sol for agents, never Fable or Astra for an agent); `inline` optional; every skill invoked through the runner every time; two new stops (a scope-changing finding, the closing step's roadmap diff); stops as plain-text open items with options, pros and cons and one recommendation; the position line for the orchestrator's reports and the landing report; absolute launch paths, the `<entry>/<step>` label, the transcript folder after `--cwd`. `templates/launch-note.md`: the label, the `--pid` owner, new `start` fields optional and written first. The `plan` skill: its Rules, the `.gitkeep` folders, the state template's open and closed lists and model limits, and `templates/plan.md`, `plan.yaml`, `plan.projects.yaml` agreeing with them. The two inventories point at the places that hold each rule.
- Rounds: the first review, repair round 1 (12 rulings), the review over it; its findings fixed at landing (3); the landing fixes read by a fresh reviewer (`agents/reviews/2-landing-review.md`) and its findings fixed at landing (3).
- Verified on main with `sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, which printed:

```text
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
```

  and exited 0; the ASCII check over the tree exited 0.
- Booked: nothing new; the stale lines this step found in other steps' files are in the booked list (steps 3 and 4).
- Usage, orchestrator from step 1's landing (5fdaa98) to this booking, a window shared with steps 3 and 5: 68 messages, 75477 output tokens, 182612 cache-write tokens, 48311299 cache-read tokens, 154 fresh input tokens, 44 minutes.

### Step 3, the other eight skill texts (landed 2026-09-25)

- Landed: `spec` stops only on a false premise the plan cannot absorb and resumes a step in flight once its landing is backed out; `refute` records `reviewer_report`, allows the exception round, and keeps "unless the brief lists them" on background shells and polling; `land` opens by stopping the step's builder and reviewers (a shell builder sent TERM, then KILL two seconds later) and refuses while any is left, makes the look its own step, runs its fourteen steps in order, marks a backed-out landing `landing: backed-out`, finishes a landed step forward and reverts only on the user's ruling, and opens the landing report with the position line; `plan-help` prints a refusal and a red line as two lines; `plan-retro` proposes a sharper sentence only when no command can check the rule; `roadmap`'s steps apply to add, move, done and drop; `ordo-init` and `repo-setup` commit only when the repository's commit rule allows, raising the decision once; `repo-setup`'s shared rules stop only on a premise the plan cannot absorb. Seven inventories point at the places that hold each rule.
- User-visible changes, before and after:
  - `/land`: before, it began with the wip commit; after, it first stops the step's builder and reviewers and refuses while any is left.
  - `/ordo-init` run alone: before, it always committed; after, it asks at approval whether it may commit and stops with "No commit allowed" when the answer is no.
  - `/repo-setup` allowed to commit: before, one commit; after, `/ordo-init`'s commit and then the setup's own.
  - A landing taken back out of main: before, the dispatch block stayed at `landing: cherry-picking`; after, `landing: backed-out`, the worktree and branch kept.
- Rounds: the first review, repair round 1 (8 rulings), the review over it; its findings fixed at landing (7) or booked for step 4 (the shell builder's pid); the landing fixes read by a fresh reviewer (`agents/reviews/3-landing-review.md`) and its findings fixed at landing (5).
- Verified on main with `sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, which printed:

```text
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
```

  and exited 0; the ASCII check over the tree exited 0.
- Usage, orchestrator from step 2's landing (6458d52) to this booking: 10 messages, 9732 output tokens, 20013 cache-write tokens, 8130367 cache-read tokens, 22 fresh input tokens, 10 minutes.

### Step 5, pin.sh (landed 2026-09-25)

- Landed: `utils/pin.sh` checks and refuses before it changes anything: a link into the live clone for a skill the tag lacks, a worktree with local changes, a folder that is not absolute or has leading or trailing whitespace (quoted in the message), an `ORDO_SKILL_DIRS` that names no folder. Check mode flags every link into the live clone. Pin mode removes only links into the pinned worktree, replaces a live-clone link for a skill the tag holds, and reports each change only after the write succeeded. The skill folders are read one per line (a home folder holding a space works); `ORDO_SKILL_DIRS` is split on spaces and tabs or read one per line. A pinned worktree deleted by hand is created again with `git worktree add --force`, which leaves every other worktree's record alone. `utils/pin.test.sh` covers each case under a scratch `HOME` holding a space and writes only under its scratch roots; `README.md` says what the script and its test do.
- User-visible changes, before and after:
  - Check mode with a link into the live clone: before, passed; after, fails and names the link.
  - Pin mode with a live-clone link for a skill the tag lacks: before, removed it silently; after, refuses before anything changes.
  - A deleted pinned worktree: before, `pin.sh <tag>` failed on the stale registration; after, it is created again.
  - A relative or whitespace-padded skill folder: before, pinned into the current directory; after, refused with the folder quoted.
- Rounds: the first review, repair round 1 (7 rulings), the review over it; its findings fixed at landing (7); the landing fixes read by a fresh reviewer (`agents/reviews/5-landing-review.md`) and its findings fixed at landing (6).
- Open item I (the stray link a reproduction run left in the user's skill folder) stays with the user.
- Verified on main with `sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, which printed:

```text
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
```

  and exited 0; the ASCII check over the tree exited 0; `ls ~/.claude-work/skills ~/.claude/skills ~/.agents/skills` unchanged apart from the known `alpha`, and the pinned worktree clean.
- Usage, orchestrator from step 3's landing (fafda10) to this booking: 23 messages, 16145 output tokens, 30037 cache-write tokens, 19419115 cache-read tokens, 50 fresh input tokens, 13 minutes.

### Step 6, collect_findings.py (landed 2026-09-25)

- Landed: `skills/plan-retro/templates/collect_findings.py` reads dashed and numbered findings under the four headings, numbered or plain, and the `### Spec` to `### Behaviour` subheadings inside a repair round. It skips the Verification, Not checked, Closed, Closures and Usage sections, a closure that says it holds, an item in a form that reports nothing, and fences of backticks or tildes of any length. `--exclude-listed` reads the previous retro's "Reports read" entries (`<plan>/agents/reviews/<step>-refuter.md`: runs) and skips a finding by plan folder, step and run, so a plan moved into the archive stays skipped and a round added later is read; a retro it cannot read is refused with exit 2. `collect_findings.test.sh` covers each shape and each refusal. `skills/plan-retro/SKILL.md` and `templates/retro.md` say how the collector is run and refused, carry the previous retro's entries over, and set aside findings that report no defect as the kind "no defect"; `README.md` says what the test covers.
- User-visible changes, before and after:
  - The collector over `.scratch .scratch/archive`: before, 308 rows, numbered findings mostly missed and Not checked bullets counted; after, 659 rows (538 over `.scratch/archive` alone), the numbered findings read and the non-finding sections skipped (`python3 -B skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive | wc -l` on main; the hand counts are in `agents/reviews/6-report.md`, "The hand count").
  - `--exclude-listed`: before, whitespace-split tokens compared as spelled; after, the retro's entries matched by plan folder, step and run, and a malformed retro refused with exit 2.
  - A retro: before, "Reports read" listed paths; after, one entry per report with its runs, the previous retro's entries carried over, and a "No defect" section.
- Rounds: the first review (10 findings), repair round 1 (7 rulings), the review over it; its findings fixed at landing (4) or booked as step 6a and into step 1a (`agents/reviews/6-refuter.md`, Closed). The landing fixes were read by a fresh reviewer (`agents/reviews/6-landing-review.md`) and its findings fixed at landing (10).
- Verified on main with `sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, which printed:

```text
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 12 commands passed
```

  and exited 0.
- Usage, orchestrator from step 5's landing (e69b588) to this booking: 83 messages, 75259 output tokens, 217318 cache-write tokens, 49232763 cache-read tokens, 184 fresh input tokens, 63 minutes. The window also holds step 8's round and the answers to the user's questions on cathedra's estimate and the roadmap's run time.

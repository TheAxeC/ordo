# Plan: 2.B Repair what the audit of plans 1, 2 and 2.A found

Execution ledger for roadmap entry 2.B in `docs/roadmap.md`. One bullet is one step of work and one agent dispatch, except the bookkeeping steps the orchestrator does itself (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

The findings this plan closes are the five reports in `.scratch/reviews/2026-09-24-audit/`: `1-process-audit.md`, `2-restyled-skills.md`, `3-checkers.md`, `4-coverage-and-roadmap.md`, `5-plan-2a-launch.md`.

## Goal

Every finding of the five reports in `.scratch/reviews/2026-09-24-audit/` is fixed in the tree or ruled out by the user. That covers the skill texts (the restyle and 2.A defects, the contradictions between skills as ruled, Opus as the default model for the orchestrator and the agents, with Fable, Astra and Sol as options for the orchestrator and Sol for the agents, `inline` kept as an optional executor, stops raised as plain-text open items), `launch.sh`, `pin.sh`, `collect_findings.py` and the other tools, the roadmap's gates and order, every row of `docs/academic-coverage.md` checked against its file, a committed verify runner, and the three archived ledgers corrected to what was observed.

## Gate

the plan's closure table lists every numbered finding of the six reports in `.scratch/reviews/2026-09-24-audit/` with the commit that closes it or the user's ruling; the committed verify runner exits 0 on main, and its test shows it failing on a planted red test; each fault the checkers review planted in a tool now turns that tool's test red; each of the 169 coverage rows carries a recorded check against its research-hub file, and the coverage check passes; `/plan-retro` has run over the three archived plans and each of its proposals is ruled; the layout check and the rule-inventory check pass.

## Steps, in execution order

- ✅ 1 `utils/verify.sh <state file>`: runs a plan's verify list, fails on a test's exit status or on a last line that does not start with `PASS:`, and prints every line it saw; its test plants a red test and expects the runner to fail; `docs/dev/building.md` and `docs/dev/change-standard.md` name it, and every later landing uses it (1 commit)
- ✅ 1a The verify runner moved into the land skill (ruling H): `utils/verify.sh` and its test become `skills/land/templates/verify.sh` and `verify.test.sh`; `README.md`, `docs/dev/building.md`, `docs/dev/change-standard.md` and this plan's verify list name the new path; `land` (Steps 6), `refute` ("What the reviewer runs"), `spec`'s `templates/brief.md` ("Verify before you report") and `plan-orchestration` (where a step's checks run) say a step's verify list runs through the land skill's `templates/verify.sh`; `sh skills/land/templates/verify.test.sh` passes from its new place (1 commit)
- ✅ 1c A brief checked against itself before dispatch (ruling J (a)): `spec`'s `templates/brief.md` gains a "Cases" section (every must-pass and must-refuse example the brief lists, in one list), and the builder's first task, stated in the template: turn the cases into the step's tests, run them against the unchanged code, and report any case the brief's rules get wrong before changing code (ruling K: no prototype scripts) and a "Paths this step writes" section (one path per line, a shared document with its line range); a contradiction the builder reports is ruled by the orchestrator, or is a stop when the fix changes the scope; `spec`'s Steps refuse a path shared with the brief of a step in the dispatch block, naming both steps; `refute` checks that every case is a test; `plan-orchestration`'s "Two steps in flight" names the path section and its check; the path check is a script in `spec`'s `templates/` with a test red under each revert (1 commit)
- ✅ 2 Skill texts, part 1: `skills/plan-orchestration/SKILL.md` and `templates/launch-note.md` text, and the `plan` skill's `SKILL.md` and templates: a stop does not end the loop; one meaning for the dispatch block's `report` field; launch paths absolute; the transcript folder named after `--cwd`; the builder writes only its report into the ledger; the stop kinds for a scope-changing finding and for the closing step's roadmap diff (ruling 3a); the sharper-sentence rule (ruling 3b); the exception round beyond `repair_rounds`; the round cap as a rule of its own (at most `repair_rounds` rounds plus the one exception, which the user's yes does not extend; after the last round a step lands with its small fixes and books the rest as steps) and an Anti-patterns row for offering the user another round; Opus as the default model for the orchestrator and every agent, Fable, Astra and Sol allowed for the orchestrator, Sol for the agents, never Fable or Astra for an agent; `inline` kept as an optional executor; stops raised as plain-text open items, never a question-box tool; every report opens with the position line (the roadmap entry, the plan step n of m, the next step), then the open items; the state template's closed list and the `reviewer_report` field; each skill invoked through the runner every time, after a compaction too, never followed from remembered text; `launch-note.md` says the `--pid` process owns the builder and lives until `end`, and that a new `start` field is optional and written on the page before `launch.sh` sends it; the rule inventories of the skills it changes updated; the layout check, the inventory check and a grep per changed rule pass (1 commit)
- ✅ 3 Skill texts, part 2: `spec` (a false premise stops only when the plan cannot absorb it, ruling 3c; what clears a step-in-flight block), `refute` (the exception round; the "unless the brief lists them" qualifier; `reviewer_report`; the grammar of its opening line), `land` (a first step, before the wip commit, that stops the step's builder and every reviewer through the runner's stop tool and checks the runner's agent listing, and a shell builder's pid and exit file, naming no vendor; the look as its own step; its steps in execution order; the state a backed-out landing leaves; a landed step found short or wrong finished by a new step on top, a landed commit reverted only on the user's ruling), `plan-help` (its printed sequence), `plan-retro` (ruling 3b), `roadmap` (its steps apply to add, move, done and drop), `ordo-init` (the path exception; "never overwrites"; the build-command exception), `repo-setup` (the commit rule); the rule inventories updated; the same checks as step 2 pass (1 commit)
- ✅ 4 `skills/plan-orchestration/templates/launch.sh` and its test: every note call bounded at about 3 s; the pid file names the process that owns the builder, that pid is alive before `start` and is the one passed to it, and a kill still writes the exit file and calls `end`; a second live launch of a step refused; every path made absolute and the script's own errors sent to the stderr file; a Claude session id known before the builder starts; the exit file written in one move; the note label `<entry>/<step>`; "Launching a builder" says to commit the dispatch block before the launch and to watch the pid as well as the exit file; `launch.test.sh` covers each case, and each fault the plan 2.A review planted turns it red (1 commit)
- ✅ 5 `utils/pin.sh` and its test: check mode flags links into the live clone; pin mode removes only links into the pinned worktree and reports the others; a home folder holding a space; a stale worktree pruned before re-pinning; `pin.test.sh` covers each case, and each fault the checkers review planted turns it red (1 commit)
- ✅ 6 `skills/plan-retro/templates/collect_findings.py` and its test: numbered findings and the subheadings inside a repair round read; Verification, Not checked, Closed and Usage skipped; `--exclude-listed` compared by real path; its test runs on fixtures shaped like the archived reports, and its count over the three archived plans matches a hand count written in the report (1 commit)
- ✅ 6a `skills/plan-retro/templates/collect_findings.py` keeps every item under the four headings as a finding: the no-finding and closure word lists (`NOTHING_FOUND`, `OTHERS_REPRODUCE`, `CLOSURE`) and their tests go; `skills/plan-retro/SKILL.md` Grouping sets aside, by reading, a finding that reports no defect or a closure that holds (the cut ruled 2026-09-25); `collect_findings.test.sh` passes (1 commit)
- 7 `utils/check_skill_layout.py` and `utils/check_rule_inventory.py` with their tests: lines split on newlines only; `__` counted as bold only outside a word (ruling 2b); a byte-order mark; indented headings; empty tables and version tags caught; an old path that is a directory refused; each fault the checkers review planted turns a test red; its builder is launched from a shell through `launch.sh claude` with `--note` naming the hub's `dispatch-note.mjs`, and the orchestrator checks that its row appears under this session in oculus's Agents view (1 commit)
- ✅ 8 `utils/check_coverage.py` and its test: the dotted Done form (`2.A.`); one Unicode normal form for file names; lines split on newlines only; a mode that requires every `rebuild: <skill>` row to name an existing file of `skills/<skill>/`, for the entry gates of step 10; each fault the checkers review planted turns the test red (1 commit)
- ✅ 9 `skills/repo-setup/templates/sync_rules.py`, `skills/land/templates/land.sh` and `usage.py`, with their tests: an undecodable file exits 2; CRLF kept; `land.sh` lands when nothing is pending, fails instead of skipping its example check inside an Ordo checkout, and stops waiting on a stale lock after a bound; `usage.py` names Codex counts correctly and rejects a time without its offset; each fault the checkers review planted turns a test red (1 commit)
- 10 Roadmap gates and order, through `/roadmap` with the diff shown to the user: entry 15.A's gate made passable; a gate for each of entries 3 to 14 that checks its `rebuild:` rows through step 8's mode, left out for entries 4, 8, 11 and 12, which have no `rebuild:` row, since `--built` fails a skill with none (from `agents/reviews/8-refuter.md`, Closed); each gate that uses the mode also requires a checked record per built row that the named file holds what the source file did, since `--built` proves only that the file exists (step 8's report); entry 16 waits on 14; the order of entries 5 and 9; entries 7 and 10 given the side-by-side run entry 16 asks for; entry 8's coverage note; entry 14's goal names the cover letter and the blind-review removal that the coverage rows of `formatter_agent.md` and `journal_submission_guide.md` send to `submit-manuscript`, or those parts move to entry 5 with the diff shown (found by step 11's last review) (1 commit; orchestrator, no agent)
- ✅ 11 Coverage rows of academic-paper (61 rows): a builder reads every file in full, checks its row's mark, reason and target, fixes each defective row, and writes one record per row (the file read, the verdict, the change) to `agents/reviews/11-rows.md`; the record count equals the row count, and the coverage check passes (1 commit)
- 12 Coverage rows of academic-paper-reviewer (26 rows), as step 11, records in `agents/reviews/12-rows.md` (1 commit)
- 13 Coverage rows of academic-pipeline (30 rows), as step 11, records in `agents/reviews/13-rows.md` (1 commit)
- 14 Coverage rows of deep-research (52 rows), as step 11, records in `agents/reviews/14-rows.md`; the `ethics_checklist` and `ethics_review_agent` rows checked against the audit's finding 13 (1 commit)
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
- 1c runs after 1a (both edit `spec`'s `templates/brief.md` and `plan-orchestration`).
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
- Open item J (2026-09-25): (a), a new step 1c after 1a checks a brief against its own cases and its path list against the steps in flight, in `spec`, its brief template, `refute` and `plan-orchestration`; the checked path list moves from 1a into 1c. The lazy option was (c), cathedra's practice only (the user).
- Open item K (2026-09-25): no prototype scripts; the builder runs the brief's cases as its tests first (the user).
- Open item L (2026-09-25): (a), the paper skill (entry 5) learns the author's voice from three or more past papers, as a guide subordinate to the prose standard; the `intake_agent.md` coverage row names it (the user). The lazy option was (b), the drop.
- The plan cut to its goal (2026-09-25): a finding of this plan's own reviews that roadmap entry 2.B's goal and gate do not need is not a step. Removed: step 1b (the ASCII check's non-UTF-8 pass and `__pycache__` in `.gitignore`), the runner's edge-case and signal tests and the `refute` list-item wording from step 1a, and step 6a's word-list tuning, replaced by the collector keeping every finding. Step 1c stays (ruling J). (The user.)

## Blocked, and by what

- 16: the user's ruling on each retro proposal, raised when the step runs.
- 10: open item M, the roadmap diff and two choices (Step 10, Step 0 below).
- 7: step 4 landed. The oculus session's fixes to its launch-note setup are in research-hub's commit 409de414 (the execute bit, `git ls-files -s` shows 100755; the absolute `launch_note` path; `LOCK_WAIT_MS = 2000`).

### Step 10, Step 0 (stop: open item M)

- Open item M (step 10, the roadmap's gates and order): the roadmap changes need your approval as a diff (ruling 2h, the `roadmap` skill), and two of them are your choice. Checked on main at f23d14a: `grep -c '| rebuild later: ' docs/academic-coverage.md` prints 18 (8 paper, 6 literature, 3 paper-review, 1 researcher, as entry 15.A's goal says); the `rebuild:` rows per skill are writing 3, paper 32, paper-review 21, rebuttal 7, literature 19, idea 3, researcher 6, submit-manuscript 1, and code-comments, grant, scaffold, project-docs and submit-grant 0 (`grep -c '| rebuild: <skill> |'`).
  - The changes the plan already fixes, shown for approval:
    1. Entry 15.A's gate: `grep -c 'rebuild later:'` (which also counts the mark's definition at `docs/academic-coverage.md:15`, so it never reaches 0) becomes `grep -c '| rebuild later: ' docs/academic-coverage.md` prints 0; and the gate adds: the coverage check with `--built paper --built paper-review --built literature --built researcher` prints `ok:`, and the plan's ledger holds a record for each re-marked row that the file it names holds what the source file did, checked by reading both.
    2. Entries 3, 5, 6, 7, 9, 10, 13 and 14 each add to the gate: the coverage check with `--built <its skill>` (the command in `docs/academic-coverage.md`) prints `ok:`, and the plan's ledger holds a record for each `rebuild: <its skill>` row that the file of `skills/<its skill>/` the row names holds what the source file did, checked by reading both. Entries 4, 8, 11 and 12 get no such clause, since they have no `rebuild:` row and `--built` fails a skill with none.
    3. Entry 16 waits on 14 as well: "5 to 10, each with its side-by-side run passed; 14, for the submission checks and the cover letter of `references/journal_submission_guide.md`; 15.A, ...".
    4. Entry 7's gate adds: a side-by-side run against academic-paper's revision coach (`agents/revision_coach_agent.md`) on a real round of referee comments, compared blind, wins or ties.
    5. Entry 10's gate adds: a side-by-side run against deep-research's socratic mode (`references/socratic_mode_protocol.md`) on a real idea, compared blind, wins or ties.
    6. Entry 8's "Waits on: 3, for the writing base; 2, for the coverage" becomes "3, for the writing base; 2, for the coverage: no file is marked `grant`, and the funder acknowledgement text reaches it through the paper row of `references/funding_statement_guide.md`".
  - Choice 1, the order of entries 5 and 9. The paper skill's DOI check and its integrity row (`agents/integrity_verification_agent.md`, looking every reference up) need the lookups through Crossref, OpenAlex, Semantic Scholar and arXiv, and their five rows are `rebuild: literature` (entry 9), which entry 5 does not wait on.
    - (a) Entry 9 moves before entry 5 in the file, keeping its number, and entry 5 waits on 9 "for the reference lookups". Pro: the lookups are built once, where entry 9's goal already names them; the coverage rows stay as they are. Con: paper, the most used skill, comes one entry later.
    - (b) The five lookup rows are re-marked `rebuild: paper` and entry 9 waits on 5, reusing them. Pro: paper comes first. Con: five coverage rows and entry 9's goal are rewritten, and the literature skill depends on the paper skill for its core search.
    - Recommendation: (a). It ends the cause where the rows already put it. (b) costs more and splits the literature skill's own search out of it; neither is the cheaper-and-worse option by cost alone, and (a) is the smaller change.
  - Choice 2, the cover letter and the blind-review removal, which the coverage rows of `agents/formatter_agent.md` (line 59) and `references/journal_submission_guide.md` (line 90) send to `submit-manuscript`, while entry 14's goal names neither.
    - (a) Entry 14's goal adds: "It also writes the cover letter, with suggested and excluded reviewers, and removes what identifies the authors for a blind review, from the venue file." Pro: matches both rows as written; both are made per venue at submission, from the venue files entry 14 already waits on. Con: a cover letter for a venue with no portal waits for entry 14.
    - (b) Both move to entry 5: entry 5's goal names them, and rows 59 and 90 are rewritten to `paper`. Pro: available with the first writing skill. Con: two rows rewritten, and the paper skill takes venue-specific work without the venue files of entry 13.
    - Recommendation: (a). (a) is also the cheaper option; it is recommended because the work is venue-specific and entry 14 is where the venue files and the portal meet, not because it is cheaper.
  - To rule: `Ruled: M: changes 1-6 <approved, or what to change>; choice 1 (a) or (b); choice 2 (a) or (b)`. On the ruling, step 10 writes the approved diff through `/roadmap`, lands it, and books it.

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

### Step 8, the coverage check (landed 2026-09-25)

- Landed: `utils/check_coverage.py` accepts a done lettered roadmap entry written `- [x] <n>.<letter>. `, splits the list, the roadmap and `find`'s output on newlines only (`find -print0`), and compares file names in NFC. The new option `--built <skill>`, repeatable, fails a row marked `rebuild: <skill>` whose reason names no path `skills/<skill>/...` in backticks that is a file of the folder's `find -type f` listing, and fails a `--built` skill with no such row. `utils/check_coverage.test.sh` covers each case, the three behaviours that had no test, and the usage errors. `docs/academic-coverage.md` (lines 1-30) says what the reason of a built row names and shows the `--built` command and what a pass does not prove; `README.md` says what the test covers.
- User-visible changes, before and after:
  - A New skills row naming a done lettered entry (`- [x] 2.A. `): before, "not in docs/roadmap.md"; after, accepted.
  - A file name holding U+2028 or U+0085: before, two names; after, one.
  - A file stored in NFD and listed in NFC: before, "not listed" and "not a file"; after, matched.
  - `--built <skill>`: new; before, no check of built rows.
- Rounds: the first review (7 findings), repair round 1 (5 rulings), the review over it; its findings fixed at landing (2) or carried into step 10 (the gates of entries 4, 8, 11 and 12 leave `--built` out; each gate that uses it also needs a checked record per built row). The landing fixes were read by a fresh reviewer (`agents/reviews/8-landing-review.md`) and its findings fixed at landing (8). The builder's Doc text for `README.md:126` was applied at landing.
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

  and exited 0; `python3 -B utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`.
- Usage, orchestrator from step 6's landing (e9633bd) to this booking: 57 messages, 49938 output tokens, 105681 cache-write tokens, 11615352 cache-read tokens, 122 fresh input tokens, 27 minutes. The window also holds step 4's review and round, step 9's brief and dispatch, and ruling J.

### Step 9, sync_rules.py, land.sh and usage.py (landed 2026-09-25)

- Landed: `skills/repo-setup/templates/sync_rules.py` exits 2 with one `error:` line on stderr for a `CLAUDE.md` or `shared-rules.md` that is missing or not UTF-8, a `CLAUDE.md` `--write` cannot write, and a write that does not read back as written; `--write` keeps every byte outside the block and writes the block in the ending most of the file's lines use, the first line's on a tie. `skills/repo-setup/SKILL.md` sync steps and Stops tell the exit-2 causes to draft (no block, no symlink) from the files to fix, by the `error:` line. `skills/land/templates/land.sh` makes the worktree's wip commit only when something is staged; each wait for an `index.lock` is bounded at 60 s (`LANDING_LOCK_WAIT` for the test) and stops with exit 1, naming the lock and the state it leaves; run again after a stop past the worktree's checkout, it returns the worktree to `<pkg>` and removes `<pkg>-land`, and refuses while main holds staged or unmerged changes or `<pkg>-land` holds a cherry-pick in progress, uncommitted changes or a commit of its own. `usage.py` counts a Codex rollout's assistant messages and refuses a window time without an offset or unreadable with exit 64. `land.test.sh` fails a missing example inside an Ordo checkout and skips only outside one. `skills/land/SKILL.md` Steps 3 and the Stops row "A lock held"; `README.md` lines 117 and 120 say what the tests cover.
- User-visible changes, before and after:
  - `sync_rules.py` on a non-UTF-8 `CLAUDE.md`: before, a traceback and exit 1 ("block differs"); after, `error: <path> is not UTF-8 (byte <n>)` on stderr and exit 2.
  - `sync_rules.py --write` on a CRLF file: before, every line became LF; after, every byte outside the block kept and the block in CRLF; in a mixed file, the ending most lines use.
  - `sync_rules.py` error lines: before, on stdout; after, on stderr.
  - `land.sh` when the builder committed everything: before, `worktree git commit failed`, exit 1; after, no wip commit and the landing goes on.
  - `land.sh` with a lock held while any `git` process runs: before, an unbounded wait; after, a stop at 60 s with exit 1.
  - `land.sh` run again after a stop past the worktree's checkout: before, refused (`package worktree is on <pkg>-land`); after, resumed from `<pkg>`, or refused with the cause while main holds staged changes or `<pkg>-land` holds work of its own.
  - `usage.py` on a Codex rollout: before, `<n> messages` counted `token_count` events; after, assistant messages.
  - `usage.py` with a window time without an offset: before, a traceback and exit 1; after, a message naming the time and exit 64.
  - `land.test.sh` inside an Ordo checkout missing an example: before, skipped and passed; after, fails naming the file.
- Rounds: the first review (6 findings), repair round 1 (6 rulings; the path list widened to `skills/repo-setup/SKILL.md`), the review over it (3 findings), fixed at landing (3): the Stops row names the ledger's landing script as the one that makes and removes `<step>-land`; a dead assignment after `fail` removed; the resume refused while main holds staged or unmerged changes, with the case "staged main" in `land.test.sh`, red with the check replaced by `if false` (`agents/reviews/9-refuter.md`, Closed).
- Verified on main with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, which printed:

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

  and exited 0; `python3 -B utils/check_rule_inventory.py` over the archived inventories of `land` and `repo-setup` printed `ok:` for each.
- Booked: nothing new.
- Usage, orchestrator from step 8's landing (3867456) to this booking, over two session logs (the session that ran the rounds, and the session that resumed the plan): 117 messages, 83680 output tokens, 363787 cache-write tokens, 31728288 cache-read tokens, 252 fresh input tokens, 184 minutes. The window also holds the cuts of the plan, rulings J and K, step 6a's round and the dispatch of step 4's round review.

### Step 4, launch.sh: a pid that owns the builder, bounded note calls, one launch per step (landed 2026-09-25)

- Landed: `skills/plan-orchestration/templates/launch.sh` starts the builder under a session leader (perl `POSIX::setsid`) that writes its own pid to the pid file, runs the note's `start` with that pid, the builder and `end`, and writes the exit file through `<exit file>.tmp`. The builder and each note call run in a process group of their own under a perl runner; a note call is stopped after 3 s. TERM, INT or HUP to the leader, including one that arrives while the builder or a note call is being started, stops the builder's group, its descendants and every other process of the leader's session (found through one python3 `os.getsid` scanner the runner starts with the builder), KILL one second later, then writes the exit file (128 plus the signal number) and calls `end`. The runner sets its handlers before it forks, leaves itself out of its sweep, and stops the builder when the leader is gone. A second live launch is refused with exit 75, by the pid file's live pid or by the `flock` lock file `<pid file>.lock` holding the launcher's pid; a lock left by a dead launcher is taken over. Every path option is made absolute; the body's errors go to the stderr file; a claude launch generates its session id and writes it to `--session-file` before the builder starts. `launch.test.sh` covers each of these; `SKILL.md` ("Launching a builder", resumption), `templates/launch-note.md`, `skills/plan/templates/orchestrator-state.md:27`, the archived inventory of plan-orchestration, and `README.md` lines 43 and 121 say so.
- User-visible changes, before and after:
  - The pid file: before, the pid of a `nohup sh -c` wrapper; after, the session leader that owns the builder.
  - TERM to that pid: before, the wrapper ended and the builder ran on; after, the builder and every process of its session end and the exit file says `exit 143` (INT `130`, HUP `129`).
  - KILL to that pid alone: before, the builder ran on; after, the runner stops it within about a second, and no exit file is written.
  - A note call that hangs: before, it held the builder and the exit file; after, it is stopped after 3 s.
  - A second launch of the same pid file: before, it ran; after, exit 75 while the first is live or its launcher holds the lock.
  - `<pid file>.lock`: new; it stays beside the pid file after each launch.
  - Requirements: `launch.sh` needs `perl` and `python3` (`README.md:43`).
- Rounds: the first review (10 findings), repair round 1 (10 rulings; the path list widened to `skills/plan/templates/orchestrator-state.md`), the review over it (10 findings), fixed at landing (10): the test-only `LAUNCH_TEST_SPAWN_DELAY` removed and the spawn window proved on a patched copy; the runner's handlers set before its fork, with a case red when they follow it; a case for TERM while the note's `start` is being started; a case that a real launch writes its own pid into the lock file; the stop's session scan made one python3 scanner asked over a pipe, with no rescan in the grace loop, after "land sequence with KILL" failed under three test runs at once; the runner's own pid passed to the scanner as a copied string, with a check red when the runner stops itself; `SKILL.md:174` on the lock file that stays; `README.md:43` naming perl; `README.md:121` as one sentence; `4-report.md` line 3, Files table, judgment call 1 and Reverts paragraph brought to the landed tree (`agents/reviews/4-refuter.md`, Closed).
- Verified on main with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, which printed:

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

  and exited 0; `python3 -B utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/plan-orchestration.md` printed `ok:`; three runs of `launch.test.sh` at once each printed `PASS: launch.sh scratch tests`.
- Booked: nothing new.
- Usage, orchestrator from step 9's landing (129a3f7) to this booking: 111 messages, 107879 output tokens, 312647 cache-write tokens, 22253056 cache-read tokens, 226 fresh input tokens, 38 minutes. The window also holds step 11's review and round, step 6a's round report and the dispatch of its round review.

### Step 6a, collect_findings.py keeps every item as a finding (landed 2026-09-25)

- Landed: `skills/plan-retro/templates/collect_findings.py` keeps as a finding every top-level item under a Spec, Proof, Standards or Behaviour heading and every item of a repair round outside the parts it does not read (the list before a round's subheadings when one of them is Spec, Proof, Standards or Behaviour, the Verification, Not checked, Closed, Closures and Usage sections and subsections, and fenced lines); `NOTHING_FOUND`, `OTHERS_REPRODUCE`, `CLOSURE`, `reports_nothing` and `FIRST_SENTENCE` are removed. `collect_findings.test.sh` asserts that `- None.` under Spec, `- The other figures reproduce.` under Proof and a round's `- Spec 1: closed.` are findings, and keeps its other cases, the two-digit item number and the trailing `Proof.` and `Standards.` of a round among them. `skills/plan-retro/SKILL.md` Grouping sets aside, by reading, a finding that reports no defect or a closure that holds as the kind "no defect"; Steps 1 and 8 and `templates/retro.md` count the headings after that set-aside; `README.md:119` is one sentence.
- User-visible changes, before and after:
  - Collector output: before, an item in a no-finding form, an item saying only that the other figures reproduce, and a round's closure item gave no finding; after, each is a finding like any other item.
  - The count over this repository's ledgers (`python3 skills/plan-retro/templates/collect_findings.py .scratch .scratch/archive` in the step's worktree): before 687 findings, after 705.
  - The retro's "Counts by heading": before, every finding; after, the findings left after the "no defect" set-aside, which has its own count.
- Rounds: the first review (7 findings), repair round 1 (6 rulings), the review over it (3 findings), fixed at landing (3): a `### Closed` subsection in the subheaded round's fixture, red with `closed` removed from `NOT_READ` (`+ two-plan 3 round 1 unclassified src/c.py:7`); `SKILL.md:74` and `README.md:119` name the list before a round's subheadings as unread only when one of them is Spec, Proof, Standards or Behaviour, as the collector does; `6a-report.md` gives the base README bullet's thirteen sentences and the control of the `closed` entry (`agents/reviews/6a-refuter.md`, Closed).
- Verified on main with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, which printed:

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

  and exited 0; `grep -n 'NOTHING_FOUND\|OTHERS_REPRODUCE\|CLOSURE\|reports_nothing' skills/plan-retro/templates/collect_findings.py` printed nothing.
- Booked: nothing new.
- Usage, orchestrator from step 4's landing (3fbc652) to this booking: 11 messages, 7751 output tokens, 10221 cache-write tokens, 1963904 cache-read tokens, 22 fresh input tokens, 4 minutes.

### Step 11, the coverage rows of academic-paper (landed 2026-09-25)

- Landed: every file of `research-hub/.agents/skills/academic-paper` read whole and its row in `docs/academic-coverage.md` checked; 50 of the 61 rows corrected in place, each with a record in `agents/reviews/11-rows.md` (61 records, 50 `fixed`, 11 `holds`). Three marks changed: `agents/abstract_bilingual_agent.md` and `references/abstract_writing_guide.md` to `rebuild: paper`, `templates/imrad_template.md` to `drop`. The intake row names style calibration at entry 5 under the prose standard (ruling L (a)). Parts that had no destination now have one (plan mode, the stress test, scoring, chapter plan and plan-to-draft gate at entry 15.A; the pre-output checklist, the vision check and the figure trace at entry 5). `docs/roadmap.md:120` gives 8 `rebuild later: paper` rows. The prose standard (`skills/repo-setup/templates/docs/dev/prose-standard.md`, Sentence length) carries ruling 2e's named exception: a sentence of a coverage table's reason cell may run to about 35 words.
- What a reader of the coverage doc sees change, before and after, per row: `agents/reviews/11-report.md`, "Rows that change what entry 5 or entry 15.A must build".
- Rounds: the first review (5 Spec, 3 Standards, 2 Behaviour findings), repair round 1 (12 rulings; the path list widened to `docs/roadmap.md:120`), the review over it (6 Spec, 2 Proof, 4 Standards, 1 Behaviour findings), repair round 2, the exception round, since brief item 1 (no part of a file left with no row and no reason) was unbuilt after round 1's shortening and too large to fix at landing (12 rulings), the review over it (5 Spec, 3 Proof, 4 Standards, 2 Behaviour findings), fixed at landing (14): rows 54, 57, 59, 60, 64, 66, 68, 77, 81 and 96 of the coverage doc; records 4, 7, 13, 15 and 28 and the word counts of `11-rows.md`; `11-report.md` brought to the end state; the prose standard's exception; the brief's reading of ruling 2e as a sentence limit (`agents/reviews/11-refuter.md`, Closed).
- Premise correction: the brief read ruling 2e as a limit of about 35 words per reason cell; plan 2's brief (`.scratch/archive/2-coverage-inventory-of-the-academic-skills/agents/briefs/4.md:38`) set it as a sentence length, and `agents/briefs/11.md` is corrected.
- Verified on main with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, which printed:

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

  and exited 0; `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`; `11-rows.md` holds 61 records, and the 50 rows that differ from ebf3c8c are exactly the 50 `fixed` records; no sentence of a reason cell in lines 50-115 is over 35 words.
- Booked: the ethics rows of the audit's finding 13 at step 14; the cover letter and blind-review removal against roadmap entry 14 at step 10.
- Usage, orchestrator from step 6a's landing (1e09d35) to this booking: 35 messages, 33466 output tokens, 61996 cache-write tokens, 7840516 cache-read tokens, 76 fresh input tokens, 38 minutes.

### Step 1a, the verify runner moved into the land skill (landed 2026-09-26)

- Landed: `utils/verify.sh` and `utils/verify.test.sh` are `skills/land/templates/verify.sh` and `verify.test.sh`, unchanged apart from the usage, which names `sh <skills>/land/templates/verify.sh <state file>`. `README.md`, `docs/dev/building.md` and `docs/dev/change-standard.md` name the new paths. The land, refute and plan-orchestration skills, the brief template, the state template and the repo-setup change-standard template say that a step's verify list runs through the land skill's `templates/verify.sh` from the root of the checkout it checks, and that its lines are what a report or a booking quotes; the brief template and the change-standard template give the lookup of `<skills>` (the repository's `.agents/skills`, `~/.agents/skills`, `$CLAUDE_CONFIG_DIR/skills`). The landing script template `skills/land/templates/land.sh` runs the ledger's verify list through `verify.sh` as its check on main and fails the landing with exit 1 when it is red; it finds `verify.sh` and `usage.py` beside itself or by that lookup, and its preflight refuses, before main is touched, a missing state file or a `verify.sh` found nowhere. This ledger's verify list and its "Verification, every step" name the new path.
- User-visible changes, before and after:
  - The runner's path: before `sh utils/verify.sh <state file>`; after `sh skills/land/templates/verify.sh <state file>` in this repository, `sh <skills>/land/templates/verify.sh <state file>` elsewhere.
  - The installed skills: before and after, the installed land skill holds `land.sh`, `land.test.sh` and `usage.py`; it holds `verify.sh` only once a tag holding it is pinned with `utils/pin.sh <tag>`, which is the user's decision.
  - A ledger that copies the new `land.sh`: before, the template's npm checks and an ASCII check ran from the tool directory; after, the ledger's verify list runs from the repository root, and any other check goes in the `ADAPT` block. A ledger that copied the old template keeps its own copy.
  - A repository set up by `repo-setup`: its change standard gains the sentence on the verify list and the runner's lookup.
- Rounds: the first review (2 Spec, 2 Standards, 3 Behaviour findings), repair round 1 (rulings in `agents/briefs/1a-round-1.md`; the path list widened to `land.sh`, `land.test.sh` and `README.md` 146-150), the review over it (1 Spec, 1 Proof, 3 Standards, 2 Behaviour findings), fixed at landing (6): `land.sh` exits 1 when the verify list fails, never with `verify.sh`'s own status, with the case "unusable state file", red when the status is passed on; `land.sh` and `land.test.sh` call the script `verify.sh`, not "the runner"; the clean landing's long call split; the test's head comment no longer names stub package.json scripts; `1a-report.md` states what a ledger copying the new template gets and corrects a line length (`agents/reviews/1a-refuter.md`, Closed).
- Verified on main with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, which printed:

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
- Booked: nothing new.
- Usage, orchestrator from step 11's landing (617f8f3) to this booking: 38 messages, 34463 output tokens, 76696 cache-write tokens, 11356769 cache-read tokens, 82 fresh input tokens, 58 minutes.

### Step 1c, a brief checked against its own cases and its paths against the steps in flight (landed 2026-09-26)

- Landed: `spec`'s `templates/brief.md` has a "Cases" section (every must-pass and must-refuse example, the builder's first task to turn them into tests and run them on the unchanged tree, and to stop and hand back a case the brief's rules get wrong before changing code) and a "Paths this step writes" section (one path per line, a whole file or a line range of a shared document); its Report asks for the cases' first run. `skills/spec/templates/check_paths.py` compares a brief's paths with the brief of every step in the dispatch block (exit 0 `ok:`, 1 `shared:`, 64 `error:`, 69 without PyYAML), reading a single-mapping dispatch block as one entry, with `check_paths.test.sh` (47 cases, each red under a named revert). `spec` refuses a shared path or an unusable state file or brief at its new Steps 4, restoring the brief and any `plan.md` amendment so the refusal leaves nothing, and its preflight refuses an uncommitted change on `plan.md` or at the brief's path; Steps 8 names the dispatch entry's shape. `refute` finds a case with no test or no first run, and reads a cases ruling with the brief. `plan-orchestration` Steps 6 rules a case the builder hands back (`agents/briefs/<step>-cases.md`, resumed with `round: 0` and the `cases_` prefix), and "Two steps in flight" names the path section, its check, and line-range splits of a shared document. `plan-help` names spec's refusal; the state template names the `cases_` entries; `README.md`, `docs/dev/building.md` and `docs/dev/change-standard.md` list the test. This ledger's verify list runs it.
- User-visible changes, before and after:
  - A brief: before, no "Cases" and no "Paths this step writes" sections; after, both, and the builder runs the cases as tests first and hands back a wrong case before changing code.
  - `/spec`: before, it dispatched with no check of paths against the steps in flight; after, it refuses a shared path (naming both steps and the path), an unusable state file or brief, and an uncommitted change on `plan.md` or at the brief's path.
  - `/refute`: before, no finding about a brief's cases; after, a case with no test, or with no first run in the report, is a Spec finding.
  - Two steps in flight: before, a step touching shared files ran alone; after, a shared document may be split by line ranges that do not overlap.
- Premise corrected: the brief said the dispatch block is the `dispatch:` key of the state file's first `yaml` block; it is in the second (`grep -n '^```yaml'` on this state file and on `skills/plan/templates/orchestrator-state.md`), and the script reads the first yaml block that has a `dispatch:` key.
- Rounds: the first review (8 findings, among them the builder's open question on a single-mapping dispatch block, ruled by the orchestrator: the script reads it as one entry, since the template's shape is not this step's), repair round 1 (rulings in `agents/briefs/1c-round-1.md`; the path list widened to `skills/plan-help/SKILL.md`), the review over it (4 findings), fixed at landing (4): `refute` reads the cases ruling; `spec`'s preflight refuses a user change on `plan.md` or the brief's path, so the restore at Steps 4 cannot discard it; the resume on a cases ruling follows the whole of Steps 8's resume with the `cases_` prefix, named also in "Launching a builder" and the state template; this ledger's dispatch `round:` line rewritten as valid YAML (`agents/reviews/1c-refuter.md`, Closed).
- Verified on main with `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, which printed:

```text
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: check_paths.py scratch tests
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
verify: 13 commands passed
```

  and exited 0.
- Booked: nothing new.
- Usage, orchestrator from step 1a's landing (76a2b10) to this booking: 47 messages, 41917 output tokens, 134263 cache-write tokens, 7721087 cache-read tokens, 102 fresh input tokens, 66 minutes.

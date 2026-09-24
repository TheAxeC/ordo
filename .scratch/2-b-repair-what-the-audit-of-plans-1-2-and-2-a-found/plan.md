# Plan: 2.B Repair what the audit of plans 1, 2 and 2.A found

Execution ledger for roadmap entry 2.B in `docs/roadmap.md`. One bullet is one step of work and one agent dispatch, except the bookkeeping steps the orchestrator does itself (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

The findings this plan closes are the five reports in `.scratch/reviews/2026-09-24-audit/`: `1-process-audit.md`, `2-restyled-skills.md`, `3-checkers.md`, `4-coverage-and-roadmap.md`, `5-plan-2a-launch.md`.

## Goal

Every finding of the five reports in `.scratch/reviews/2026-09-24-audit/` is fixed in the tree or ruled out by the user. That covers the skill texts (the restyle and 2.A defects, the contradictions between skills as ruled, Opus as the default model for the orchestrator and the agents, with Fable, Astra and Sol as options for the orchestrator and Sol for the agents, `inline` kept as an optional executor, stops raised as plain-text open items), `launch.sh`, `pin.sh`, `collect_findings.py` and the other tools, the roadmap's gates and order, every row of `docs/academic-coverage.md` checked against its file, a committed verify runner, and the three archived ledgers corrected to what was observed.

## Gate

the plan's closure table lists every numbered finding of the five reports with the commit that closes it or the user's ruling; the committed verify runner exits 0 on main, and its test shows it failing on a planted red test; each fault the checkers review planted in a tool now turns that tool's test red; each of the 169 coverage rows carries a recorded check against its research-hub file, and the coverage check passes; `/plan-retro` has run over the three archived plans and each of its proposals is ruled; the layout check and the rule-inventory check pass.

## Steps, in execution order

- 1 `utils/verify.sh <state file>`: runs a plan's verify list, fails on a test's exit status or on a last line that does not start with `PASS:`, and prints every line it saw; its test plants a red test and expects the runner to fail; `docs/dev/building.md` and `docs/dev/change-standard.md` name it, and every later landing uses it (1 commit)
- 2 Skill texts, part 1: `skills/plan-orchestration/SKILL.md` and `templates/launch-note.md` text, and the `plan` skill's `SKILL.md` and templates: a stop does not end the loop; one meaning for the dispatch block's `report` field; launch paths absolute; the transcript folder named after `--cwd`; the builder writes only its report into the ledger; the stop kinds for a scope-changing finding and for the closing step's roadmap diff (ruling 3a); the sharper-sentence rule (ruling 3b); the exception round beyond `repair_rounds`; Opus as the default model for the orchestrator and every agent, Fable, Astra and Sol allowed for the orchestrator, Sol for the agents, never Fable or Astra for an agent; `inline` kept as an optional executor; stops raised as plain-text open items, never a question-box tool; every report opens with the position line (the roadmap entry, the plan step n of m, the next step), then the open items; the state template's closed list and the `reviewer_report` field; each skill invoked through the runner every time, after a compaction too, never followed from remembered text; `launch-note.md` says the `--pid` process owns the builder and lives until `end`, and that a new `start` field is optional and written on the page before `launch.sh` sends it; the rule inventories of the skills it changes updated; the layout check, the inventory check and a grep per changed rule pass (1 commit)
- 3 Skill texts, part 2: `spec` (a false premise stops only when the plan cannot absorb it, ruling 3c; what clears a step-in-flight block), `refute` (the exception round; the "unless the brief lists them" qualifier; `reviewer_report`; the grammar of its opening line), `land` (a first step, before the wip commit, that stops the step's builder and every reviewer through the runner's stop tool and checks the runner's agent listing, and a shell builder's pid and exit file, naming no vendor; the look as its own step; its steps in execution order; the state a backed-out landing leaves; a landed step found short or wrong finished by a new step on top, a landed commit reverted only on the user's ruling), `plan-help` (its printed sequence), `plan-retro` (ruling 3b), `roadmap` (its steps apply to add, move, done and drop), `ordo-init` (the path exception; "never overwrites"; the build-command exception), `repo-setup` (the commit rule); the rule inventories updated; the same checks as step 2 pass (1 commit)
- 4 `skills/plan-orchestration/templates/launch.sh` and its test: every note call bounded at about 3 s; the pid file names the process that owns the builder, that pid is alive before `start` and is the one passed to it, and a kill still writes the exit file and calls `end`; a second live launch of a step refused; every path made absolute and the script's own errors sent to the stderr file; a Claude session id known before the builder starts; the exit file written in one move; the note label `<entry>/<step>`; "Launching a builder" says to commit the dispatch block before the launch and to watch the pid as well as the exit file; `launch.test.sh` covers each case, and each fault the plan 2.A review planted turns it red (1 commit)
- 5 `utils/pin.sh` and its test: check mode flags links into the live clone; pin mode removes only links into the pinned worktree and reports the others; a home folder holding a space; a stale worktree pruned before re-pinning; `pin.test.sh` covers each case, and each fault the checkers review planted turns it red (1 commit)
- 6 `skills/plan-retro/templates/collect_findings.py` and its test: numbered findings and the subheadings inside a repair round read; Verification, Not checked, Closed and Usage skipped; `--exclude-listed` compared by real path; its test runs on fixtures shaped like the archived reports, and its count over the three archived plans matches a hand count written in the report (1 commit)
- 7 `utils/check_skill_layout.py` and `utils/check_rule_inventory.py` with their tests: lines split on newlines only; `__` counted as bold only outside a word (ruling 2b); a byte-order mark; indented headings; empty tables and version tags caught; an old path that is a directory refused; each fault the checkers review planted turns a test red (1 commit)
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
- 6, 7, 8, 9 with each other and with 2, 3, 5 after 1.
- 4 after 2 (both edit `skills/plan-orchestration/SKILL.md`).
- 10 after 8 (it uses step 8's mode).
- 11, 12, 13, 14 one after another after 8 (they all edit `docs/academic-coverage.md`).
- 15 with anything after 1 that does not touch the archived ledgers or the roadmap.
- 16 after 6 (it needs the fixed collector); 17 after 16.
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
- `start` gets no `--transcript` flag: the transcript reaches the note only through the separate `transcript` call, and the interface between Ordo and oculus keeps its three calls as they are (the user).

## Blocked, and by what

- Every step: the user's greenlight to start, which has not been given.
- 16: the user's ruling on each retro proposal, raised when the step runs.

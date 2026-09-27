# Plan: 2.B Repair what the audit of plans 1, 2 and 2.A found

Execution ledger for roadmap entry 2.B in `docs/roadmap.md`. One bullet is one step of work and one agent dispatch, except the bookkeeping steps the orchestrator does itself (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

The findings this plan closes are the five reports in `.scratch/reviews/2026-09-24-audit/`: `1-process-audit.md`, `2-restyled-skills.md`, `3-checkers.md`, `4-coverage-and-roadmap.md`, `5-plan-2a-launch.md`.

## Goal

Every finding of the five reports in `.scratch/reviews/2026-09-24-audit/` is fixed in the tree or ruled out by the user. That covers the skill texts (the restyle and 2.A defects, the contradictions between skills as ruled, Opus as the default model for the orchestrator and the agents, with Fable as an option for the orchestrator (Claude only, ruling U), `inline` kept as an optional executor, stops raised as plain-text open items), `launch.sh`, `pin.sh`, `collect_findings.py` and the other tools, the roadmap's gates and order, every row of `docs/academic-coverage.md` checked against its file, a committed verify runner, and the three archived ledgers corrected to what was observed.

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
- ✅ 7 `utils/check_skill_layout.py` and `utils/check_rule_inventory.py` with their tests: lines split on newlines only; `__` counted as bold only outside a word (ruling 2b); a byte-order mark; indented headings; empty tables and version tags caught; an old path that is a directory refused; each fault the checkers review planted turns a test red; its builder is launched from a shell through `launch.sh claude` with `--note` naming the hub's `dispatch-note.mjs`, and the orchestrator checks that its row appears under this session in oculus's Agents view (1 commit)
- Removed by ruling U (landed, taken out by step 20): 7a The allow list for a shell-launched `claude` builder (ruling R (a)): `skills/plan-orchestration/templates/launch.sh` passes the commands a builder may run to `claude -p` as `--allowedTools`, from the new optional key `worker_allow:` of `.agents/plan.yaml` and the ledger's configuration block, a list of command prefixes, each passed as `Bash(<prefix>:*)` (ruling S (a)), built by default from the verify list and the brief's gate commands; its test, `check_config.py` and its test, the `plan` skill's `templates/plan.yaml` and `templates/orchestrator-state.md`, and the recipe text in `plan-orchestration` change with it; proven by a real `claude -p` run under the list that runs a verify command (1 commit)
- Removed by ruling U (landed, taken out by step 20): 7b The exit file's remaining cases in `skills/plan-orchestration/templates/launch.sh`, found by step 7a's review of its round 2: a KILL after the builder ended, while the note's `end` runs, leaves no exit file; the runner of a killed run, still stopping its builder, writes `exit 137` after a later launch with the same exit file removed it; a KILL between the leader's two writes leaves only `<exit file>.tmp`; the runner's no-replace write (the `-e` return and the `link`) has no case that either guard's revert turns red; the runner reads its session scanner's answer with no time limit, so a stop has no bound. Each case with a test its revert turns red, run whole-suite at 16 at once under `sh` and `dash`, and the texts of `plan-orchestration` and `templates/launch-note.md` made to say what the code does (1 commit)
- Removed by ruling U (landed, taken out by step 20): 7c The runner's guard in `skills/plan-orchestration/templates/launch.sh` waits on `kill 0` to the session leader's pid, which succeeds on a zombie, found by step 7b's review of its round 2: a killed leader that its parent does not reap (a parent still alive, or a Linux child subreaper that does not reap) keeps the guard waiting and holding the lock, and no exit file is written. The guard treats a leader that is a zombie as gone; a case in `launch.test.sh` keeps a killed leader a zombie in a patched copy and requires the builder's code in the exit file within five seconds of the KILL, red with the zombie check removed; the launch's refusal of a pid file naming a live process (`launch.sh`, the `kill -0 "$old_pid"` check) also counts a zombie as gone; the texts of `launch.sh`, `plan-orchestration/SKILL.md` (the resumption check and item 5 of the launch, which read a pid as gone when `kill -0` fails), `launch-note.md` and the land skill's `SKILL.md` Steps item 1 say what the code does, a pid counted gone when `kill -0` fails or `ps -o stat=` shows a zombie (1 commit)
- Removed by ruling U (never landed; its worktree deleted): 7d `skills/plan-orchestration/templates/launch.test.sh` red under load, found by step 7c's review of its round 1: with the machine's load average between about 10 and 32 on 11 cores (Microsoft Defender and Spotlight busy), whole-suite runs at 16 at once turn red in cases whose timed windows are a few seconds ("a hanging start held the exit file" past 6000 ms, "guard waits: no guard in the session while end hangs", "a job of the leader's session", "start printing two lines", "the builder ended as the leader was killed", "a launch while a killed run's guard lives exited 0"), on main's files before step 7c and after it. The step finds each case's cause under load, with an A/B of the files before and after step 7c in alternating batches of the same load, and makes the whole suite run 32 times at 16 at once under `sh` and under `LAUNCH_SHELL=dash` with 0 red on this machine, each window's change proven to keep its case red under its revert (1 commit)
- ✅ 8 `utils/check_coverage.py` and its test: the dotted Done form (`2.A.`); one Unicode normal form for file names; lines split on newlines only; a mode that requires every `rebuild: <skill>` row to name an existing file of `skills/<skill>/`, for the entry gates of step 10; each fault the checkers review planted turns the test red (1 commit)
- ✅ 9 `skills/repo-setup/templates/sync_rules.py`, `skills/land/templates/land.sh` and `usage.py`, with their tests: an undecodable file exits 2; CRLF kept; `land.sh` lands when nothing is pending, fails instead of skipping its example check inside an Ordo checkout, and stops waiting on a stale lock after a bound; `usage.py` names Codex counts correctly and rejects a time without its offset; each fault the checkers review planted turns a test red (1 commit)
- ✅ 10 Roadmap gates and order, through `/roadmap` with the diff shown to the user: entry 15.A's gate made passable; a gate for each of entries 3 to 14 that checks its `rebuild:` rows through step 8's mode, left out for entries 4, 8, 11 and 12, which have no `rebuild:` row, since `--built` fails a skill with none (from `agents/reviews/8-refuter.md`, Closed); each gate that uses the mode also requires a checked record per built row that the named file holds what the source file did, since `--built` proves only that the file exists (step 8's report); entry 16 waits on 14; the order of entries 5 and 9; entries 7 and 10 given the side-by-side run entry 16 asks for; entry 8's coverage note; entry 14's goal names the cover letter and the blind-review removal that the coverage rows of `formatter_agent.md` and `journal_submission_guide.md` send to `submit-manuscript`, or those parts move to entry 5 with the diff shown (found by step 11's last review); entry 15.A's goal counts and its wait on 13, which step 14's re-marked rows made false (1 commit; orchestrator, no agent)
- ✅ 11 Coverage rows of academic-paper (61 rows): a builder reads every file in full, checks its row's mark, reason and target, fixes each defective row, and writes one record per row (the file read, the verdict, the change) to `agents/reviews/11-rows.md`; the record count equals the row count, and the coverage check passes (1 commit)
- ✅ 12 Coverage rows of academic-paper-reviewer (26 rows), as step 11, records in `agents/reviews/12-rows.md` (1 commit)
- ✅ 13 Coverage rows of academic-pipeline (30 rows), as step 11, records in `agents/reviews/13-rows.md` (1 commit)
- ✅ 14 Coverage rows of deep-research (52 rows), as step 11, records in `agents/reviews/14-rows.md`; the `ethics_checklist` and `ethics_review_agent` rows checked against the audit's finding 13 (1 commit)
- ✅ 15 Ledger corrections in the three archived plans: plan 1's usage rows from the measured figures; each booking that claims a `PASS:` count nobody saw rewritten from a re-run of the tests at each of the 26 landing and closing commits, on trees extracted with `git archive` (premise corrected at /spec: the audit's re-run output lived in its session scratchpad and is not on disk); the closed lists filled from each plan's rulings; plan 2's stale lines; plan 1's Done line in the roadmap, given as Doc text and shown to the user as an open item at landing; a grep shows no booking that claims a count without the lines it quotes (1 commit)
- ✅ 16 `/plan-retro` over the three archived plans, its proposals raised to the user one by one as open items (orchestrator, no agent)
- ✅ 20 Claude only (ruling U 1): the shell-launch route and every Codex part of the skills removed: `launch.sh`, `launch.test.sh`, `allow_list.py` and its test, `launch-note.md`, the `launch_note` and `worker_allow` keys and their checks, the shell recipes, the Codex text of every skill, the AGENTS.md check of `sync_rules.py`, the models ruling's Astra and Sol, and `.agents/launch/2b-7` (1 commit)
- 21 The process checks (rulings U 4 and V): `/spec` refuses a step whose line lacks `(approved)` or a `(ruling <name>)` the Rulings section holds, through `skills/spec/templates/check_step.py`, and `/plan` writes `(approved)` (ruling X); this plan's step lines tagged; `/land` requires the ledger's `land.sh`, and this plan's ledger gets its copy; `docs/dev/skill-layout.md` requires a rule inventory, checked by `check_rule_inventory.py`, for any rewrite of an existing skill (1 commit); after its landing the release tagged and the user's yes asked to pin it (ruling W)
- 17 The approved retro proposals applied; each proposed check runs on the tree (1 commit)
- 17a A library check in `/spec`, set per project (ruling T): a required key `libraries: check | avoid` in `.agents/plan.yaml`, per project in the `projects:` form, in the `plan` skill's `templates/plan.yaml` and `templates/plan.projects.yaml` and in the configuration block of `templates/orchestrator-state.md`; `/ordo-init` asks for it when it drafts the file and `templates/check_config.py` reports it missing or of an unknown value, with cases; `/plan` and `/spec` refuse without it; under `check`, `/spec` looks for libraries for every capability the step builds before it writes the brief, a candidate that could replace hand-written code is a stop for the user with options, pros, cons and one recommendation, and `templates/brief.md` gains a section "Libraries checked" (each candidate's version, license, maintainer, last release, compatibility with the project's dependencies, what it would replace and what stays) naming the library ruled; under `avoid` the brief says no new dependency; under both, a builder adds no dependency the brief did not name and reports an unnamed library that would cover its work instead of installing it, and `/refute` reports a dependency the brief did not name; bundle size is no criterion unless `plan.yaml` names one; this repository's `.agents/plan.yaml` gets `libraries: avoid` (1 commit)
- 18 The closure table `agents/reviews/closure.md`: every numbered finding of the six reports (the five of the audit and `6-oculus-changes.md`) with the commit that closed it or the user's ruling; its row count equals the count of findings in the reports (1 commit)
- 19 the closing: `/roadmap done 2.B` with the gate's output, the diff shown to the user; the release tagged and the user's permission asked to pin it with `utils/pin.sh <tag>`, pinned only on that yes; this folder moved to `.scratch/archive/` (orchestrator, no agent)

## Could run in parallel

`workers_at_once: 3`. A step that touches a rule file, a configuration file or shared files runs alone; two steps in flight never share a path.

- 1 runs alone (it edits `docs/dev/building.md` and `docs/dev/change-standard.md`), before every other step, so every later landing uses the runner.
- 2, 3, 5 with each other after 1.
- 6, 8, 9 with each other and with 2, 3, 5 after 1.
- 7 after 4 and after the oculus session's fixes to its launch-note setup (it is the step launched from a shell).
- 7a before 7 resumes; step 7's builder is resumed with `launch.sh --resume` once 7a has landed.
- 7b with 7 after 7a (their paths are disjoint); step 7's resume uses its round's own exit and pid files, which 7b's cases do not reach.
- 7c after 7b (the same files).
- 20 runs alone (it touches every skill); 21 after 20; 17 after 21 (all three touch skill texts).
- 4 after 2 (both edit `skills/plan-orchestration/SKILL.md`).
- 10 after 8 (it uses step 8's mode).
- 11, 12, 13, 14 one after another after 8 (they all edit `docs/academic-coverage.md`).
- 15 with anything after 1 that does not touch the archived ledgers or the roadmap.
- 6a after 6, with anything that does not touch `skills/plan-retro/`.
- 16 after 6 and 6a (it needs the fixed collector); 17 after 16.
- 1c runs after 1a (both edit `spec`'s `templates/brief.md` and `plan-orchestration`).
- 1a runs alone after steps 4, 6 and 8 land: it edits the rule pages, `README.md`, and the skill texts of `land`, `refute`, `spec` and `plan-orchestration`.
- 17a after 17 (both touch the skill texts and templates).
- 18 after every step from 1 to 17a.

### Step 21, Step 0 (open item X, ruled 2026-09-27: (a); see Rulings)

- Open item X (step 21, how a step line names its authority, raised 2026-09-27): ruling U 4 says `/spec` refuses a step whose line names neither a step of the approved list nor a ruling of the user. Today step lines name rulings in several free forms (`(ruling H)`, `ruling J`, `(ruling U 1)`, `(ruling 3b)`), and most name nothing, since the user approved the list when the plan opened. How a line names its authority is a shape of every plan's `plan.md`, so it is the user's. (a) Each step line ends with its authority in one form: `(approved)` for a step of the list the user approved when the plan opened, or `(ruling <name>)` naming a line of the Rulings section that ends "(the user)"; `skills/spec/templates/check_step.py <plan.md> <step>` refuses, naming the step, a line with neither or a ruling name the Rulings section lacks; `/spec` runs it before writing a brief; `/plan` writes `(approved)` on each step when the user approves the list; this plan's step lines are tagged from its Rulings section, each tag checked by the reviewer. Pro: the authority is visible on each line and a reviewer can check it. Con: every plan's step lines change shape. (b) One Rulings line lists the approved steps ("Approved steps: 1, 1a, ..."), extended only by a user ruling, and the script checks the step is in it. Pro: one place. Con: the step line shows no reason, and the list can drift from the step list. (c) A sentence in `/spec` and no script, the lazy option: a rule of this kind was already broken. Recommendation (a). The other two parts of step 21 (`/land` requires the ledger's `land.sh`; a rule inventory for any rewrite of a skill) wait with it, since they are one step.

## Rulings (2026-09-24)

- The way back on track is option C: this repair plan, run in agent mode through the skills, then entry 3; no restart (the user).
- The recommendations 2a to 2h of the audit report are accepted: the layout seen and confirmed (2a); `__` bold only outside a word (2b); step 14's work pulled into plan 1 step 2 kept (2c); the single-heading-line inventory row kept (2d); about 35 words allowed for the coverage table's reason cells only, written into the prose standard as a named exception (2e); the launch-note page beside `launch.sh` kept (2f); a resumed builder is a new note record, labelled `<entry>/<step>`, the label form checked with the oculus session before it ships (2g); entry 15.A's gate fixed with the diff shown (2h) (the user).
- Contradiction 3a: the closing step's roadmap diff is a stop of `plan-orchestration`. 3b: a sharper sentence is allowed only when no command can check the rule, in both `plan-orchestration` and `plan-retro`. 3c: a false premise stops only when the plan cannot absorb it; one it can absorb is corrected in `plan.md` in the preparation commit (the user).
- Models: Opus for the orchestrator and the agents in this plan, and as the skills' default; Fable, Astra and Sol are options for the orchestrator, Sol for the agents, and an agent (builder, reviewer) never runs on Fable or Astra (the user). Superseded by ruling U: Claude only, Fable the only other orchestrator model.
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
- Open item M (2026-09-26): choice 1 (a), entry 9 moves before entry 5 and entry 5 waits on 9 for the reference lookups; choice 2 (a), entry 14's goal adds the cover letter with suggested and excluded reviewers and the removal of what identifies the authors for a blind review; changes 1 to 7 are approved as the diff step 10 shows (the user).
- Open item N (2026-09-26): account (a), step 7's shell-launched builder runs with whatever account the main session uses, `CLAUDE_CONFIG_DIR` kept; oculus (a), oculus runs at http://127.0.0.1:8790/ and the builder's row is checked in its Agents view (the user).
- Open item O (2026-09-26): (b), plan 1's Done line at `docs/roadmap.md:135` without the clause "every landing report `Open items: none. Booked list: empty`" (the user).
- Open item P (2026-09-26): all 19 retro proposals approved as written in `.scratch/retros/2026-09-26.md` (the user).
- Open item Q (2026-09-26): (a), the roadmap diff approved as drafted in `agents/reviews/10-roadmap.md`; entry 15.A's gate names `--built paper --built paper-review --built literature` (the user).
- Open item R (2026-09-26): (a), `launch.sh` gives a `claude` builder an allow list as `--allowedTools`, from a new optional key; new step 7a (the user).
- Open item S (2026-09-26): (a), the key is `worker_allow:`, a list of command prefixes that `launch.sh` passes to a `claude` builder as `--allowedTools "Bash(<prefix>:*)"`; absent, it is built from the verify list and the brief's gate commands (the user).
- Open item T (2026-09-26): 1 (a), the library check is new step 17a of this plan, after 17 and before 18; 2 (a), the key is `libraries: check | avoid`, required, per project, asked by `/ordo-init`, reported by `check_config.py`, a refusal naming it in `/plan` and `/spec`, and `/refute` reports a dependency the brief did not name; 3 (a), this repository's value is `avoid` (the user).
- The plan cut to its goal (2026-09-25): a finding of this plan's own reviews that roadmap entry 2.B's goal and gate do not need is not a step. Removed: step 1b (the ASCII check's non-UTF-8 pass and `__pycache__` in `.gitignore`), the runner's edge-case and signal tests and the `refute` list-item wording from step 1a, and step 6a's word-list tuning, replaced by the collector keeping every finding. Step 1c stays (ruling J). (The user.)
- Open item U (2026-09-27): 1 (a), Claude only: the shell-launch route and every Codex part of the skills are removed (`launch.sh`, `launch.test.sh`, `allow_list.py` and its test, `launch-note.md`, the `launch_note` and `worker_allow` keys and their checks, the shell recipes, the Codex text of every skill); the models ruling above becomes Claude only; steps 7a, 7b, 7c and 7d leave the plan; 7d's worktree and branch are deleted. The lazy option was (c), keeping everything. 2 (a), each script of the verify list is read and tabled (what it does, what uses it, what breaks without it) for the user to rule on which go, the gate changed to match. The lazy option was (b), keeping all 14 (the user).
- Open item U (2026-09-27), continued: 3 (a), the removal lands as new commits on main, never a reset; steps 7a to 7d stay listed, marked removed by ruling U. The lazy option was neither; (b), a hard reset, was the riskier one. 4 (a), `/spec` refuses a step whose line in `plan.md` names neither a step of the approved list nor a ruling of the user in the Rulings section. The lazy option was (b), no check (the user).
- Open item V (2026-09-27): (a), `land.sh`, `check_rule_inventory.py` and `sync_rules.py` are kept and each made part of a process: `sync_rules.py` loses its AGENTS.md check (step 20); `docs/dev/skill-layout.md` requires a rule inventory, checked by `check_rule_inventory.py`, for any rewrite of an existing skill, and `/land` requires the ledger's `land.sh`, this plan's ledger getting its copy (step 21). The lazy option was (b), keeping them uncalled (the user).
- Open item W (2026-09-27): (a), after step 21 lands the release is tagged and pinned with `utils/pin.sh <tag>` on the user's yes, so steps 17, 17a, 18 and 19 run under the fixed skills. The lazy option was (b), pinning at step 19 only (the user).
- Open item X (2026-09-27): (a), each step line of a plan ends with its authority in one form: `(approved)` for a step of the list the user approved when the plan opened, or `(ruling <name>)` naming a line of the Rulings section that ends "(the user)"; `skills/spec/templates/check_step.py <plan.md> <step>` refuses a line with neither or a ruling name the Rulings section lacks; `/spec` runs it before writing a brief; `/plan` writes `(approved)` on each step when the user approves the list; this plan's step lines are tagged from its Rulings section. The lazy option was (c), a sentence and no script (the user).

## Blocked, and by what

- 21: step 20's landing.
- 17: step 21's landing, since 17 touches the rules page and every `SKILL.md`.
- 17a: step 17's landing, since both touch `skills/spec/SKILL.md`, `skills/plan/` and `skills/ordo-init/`.
- 18: every step from 1 to 17a.
- 19: step 18.

### Step 7a, Step 0 (open item S, ruled 2026-09-26: (a); see Rulings)

- Open item S (step 7a, the name and form of the allow-list key ruled on open item R): the key is a public shape of `.agents/plan.yaml` and the ledger's configuration block (`skills/plan/templates/plan.yaml`, `skills/plan/templates/orchestrator-state.md`, `skills/ordo-init/templates/check_config.py`), so its name and the form of its values are yours. The existing keys for the builder are `worker`, `worker_effort`, `workers_at_once` and `launch_note`.
  - (a) `worker_allow:`, a list of command prefixes (`sh utils/check_skill_layout.test.sh`, `python3 utils/`), which `launch.sh` turns into `--allowedTools "Bash(<prefix>:*)"` for a `claude` builder; absent, the list is built from the verify list's commands and the brief's own gate commands. Pro: the values name no harness, as the other keys do not, and the name follows `worker` and `worker_effort`. Con: a rule other than a command prefix cannot be written.
  - (b) `worker_allowed_tools:`, a list of Claude Code permission rules passed through as written (`Bash(sh utils/*.test.sh:*)`). Pro: any rule the harness takes can be written. Con: the key's values are one harness's syntax, which a Codex builder does not read.
  - Recommendation: (a). Neither costs more to build than the other.
  - To rule: `Ruled: S (a)`, `S (b)`, or another name.

### Step 7, Step 0 (open item N, ruled 2026-09-26: account (a), oculus (a); see Rulings)

- Relaunched 2026-09-26 08:54 through `templates/launch.sh` with `CLAUDE_CONFIG_DIR=/Users/axelfaes/.claude-work` kept: pid 62708, session ec7fe645-5c70-4ce5-91f7-3307745f943e, its transcript under `~/.claude-work/projects/-Users-axelfaes-workspace-ordo--agents-worktrees-2b-7/`, note record 2006b4c7-57a1-44a1-b772-3dff0b6ccae6 in `~/.oculus/dispatches.json` with this session as parent. Oculus at http://127.0.0.1:8790/, Sessions, this session's pane, Agents: the row "launched claude opus 2.B/7 running | 1m 18s" is listed first, and the stopped first launch below it as "launched claude opus 2.B/7 done | 56 s".

- Open item N (step 7, the shell launch of its builder): the builder was launched through `templates/launch.sh` with the launch note, and the note record was written (`~/.oculus/dispatches.json` holds id 502d4c9d-3b6a-4316-8628-f519325eee87, label `2.B/7`, parent this session, the transcript path). It ran with `CLAUDE_CONFIG_DIR` unset, which by `tools/oculus/README.md:36` puts a `claude` process on the first account, not the account this session runs on (`~/.claude-work`). It was stopped with TERM before it changed any file (`exit 143` in the exit file; `git status --short` in the worktree prints nothing). A relaunch with `CLAUDE_CONFIG_DIR` kept was refused by the permission classifier, so the builder is not running. Two things are yours:
  - Which account the shell-launched builder runs on.
    - (a) This session's account: relaunch with `CLAUDE_CONFIG_DIR=/Users/axelfaes/.claude-work` kept, which needs your permission for that launch (a Bash permission rule, or you run the launch command yourself with `!`). Pro: the builder is billed and configured like every other agent of this plan. Con: one permission to grant.
    - (b) The first account: relaunch with `CLAUDE_CONFIG_DIR` unset, as the first launch did. Pro: no permission change. Con: the step runs on another account than the plan's other agents.
    - Recommendation: (a). The plan's agents all run on one account, and the account is a choice only you can make; (b) is the cheaper option to carry out, and cost is not a reason.
  - The check that the builder's row appears under this session in oculus's Agents view needs oculus running; nothing listens on its port (`lsof -iTCP -sTCP:LISTEN` shows no node process), and research-hub is read only for this plan, so the orchestrator does not start it. (a) You start oculus (`npm run dev` in `tools/oculus`) before the relaunch, and the orchestrator checks the view in the browser. (b) The check is made on the note record alone. Recommendation: (a); the ruling E run exists to see the row in the view.
  - To rule: `Ruled: N: account (a) or (b); oculus (a) or (b)`.

- Open item R (step 7, the builder's permission to run commands): the relaunched builder (session ec7fe645-5c70-4ce5-91f7-3307745f943e) exited 0 after 36 turns without building the step. Its report (`agents/reviews/7-report.md` in the worktree, 83 lines) says each script it tried returned "This command requires approval": `sh utils/check_skill_layout.test.sh`, `python3 utils/check_skill_layout.py` and a `python3 -c` probe; `cat`, `grep` and `wc` ran. It wrote the brief's cases into `utils/check_skill_layout.test.sh` and `utils/check_rule_inventory.test.sh` (147 lines added, `git diff --stat 2c71183` in the worktree) and changed no checker code. The cause is the recipe: `skills/plan-orchestration/templates/launch.sh:455` starts `claude -p` with `--permission-mode acceptEdits`, and neither account's `settings.json` has an allow rule, so a shell-launched `claude` builder cannot run a test on either account. Tried in the worktree with `claude -p --model haiku` and the prompt to run `sh utils/check_rule_inventory.test.sh`: `--permission-mode acceptEdits` answered REFUSED, `--permission-mode auto` answered REFUSED, and `--permission-mode acceptEdits --allowedTools "Bash(sh utils/check_rule_inventory.test.sh:*)"` ran the test and returned its output. How the builder gets that permission is yours:
  - (a) An allow list: `launch.sh` takes the commands a builder may run and passes them to `claude -p` as `--allowedTools`, the list coming from a new optional key of the ledger's configuration block (the verify commands and the brief's own gate commands by default). Pro: tried and works; a command outside the list stays refused, git included. Con: a new configuration key, and a command the list misses stops the builder.
  - (b) `--permission-mode bypassPermissions` for a shell-launched `claude` builder. Pro: no list to keep. Con: nothing checks any command the builder runs, git included; the no-git rule rests on the prompt alone. Not tried.
  - (c) Step 7 runs as a native agent, like the other steps, and ruling E's shell launch is dropped. Con: the recipe stays unable to run a test for every later shell-launched `claude` builder. This is the lazy option: it leaves the defect in place.
  - Recommendation: (a). The fix is its own step, 7a, since it lands `launch.sh`, its test and the recipe text in `plan-orchestration` before step 7's builder can be resumed (`launch.sh --resume ec7fe645-5c70-4ce5-91f7-3307745f943e` with the list): /spec, a builder, /refute, /land. Step 17 waits on step 7's landing, since both change `utils/check_skill_layout.py` and its test.
  - To rule: `Ruled: R (a)`, `R (b)` or `R (c)`.

### Step 10, Step 0 (open item M, ruled 2026-09-26: choice 1 (a), choice 2 (a), changes 1 to 7 shown as the diff; see Rulings)

- Open item Q (step 10, the roadmap diff): the new `docs/roadmap.md` is drafted in full at `agents/reviews/10-roadmap.md`, and `diff -u docs/roadmap.md .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/10-roadmap.md` prints the diff (117 lines). It carries changes 1 to 7 of open item M, choice 1 (a) (entry 9 moved between entries 4 and 5, its number kept; entry 5 waits on 9 "for the reference lookups"; entry 9 waits only on 3 and 2, which stay ahead of it, and entry 10 still comes after it), choice 2 (a) (entry 14's goal) and plan 1's Done line as ruled on open item O (b). One change departs from change 1 as it was written in open item M, and needs your yes:
  - Change 1 named `--built paper --built paper-review --built literature --built researcher` in entry 15.A's gate. Change 7 removes 15.A's wait on 13, since no `rebuild later: researcher` row is left (`grep -c '| rebuild later: researcher'` prints 0). With `--built researcher` kept, 15.A's gate would fail until entry 13 builds `skills/researcher/`, which 15.A no longer waits on. The draft names `--built paper --built paper-review --built literature`.
  - (a) Approve the diff as drafted, with the three `--built` skills. Pro: 15.A's gate matches its waits. Con: none.
  - (b) Keep `--built researcher` in 15.A's gate and its wait on 13. Con: 15.A waits on a skill none of its rows go to.
  - Recommendation: (a).
  - Writing: the roadmap skill commits one change per commit, so the diff lands as 10 commits (changes 1 to 7, the move of entry 9, entry 14's goal, the Done line), not the one commit step 10's line in `plan.md` names.
  - To rule: `Ruled: Q (a)` or `Ruled: Q (b)`, with any line of the diff to change.

- Open item M (step 10, the roadmap's gates and order): the roadmap changes need your approval as a diff (ruling 2h, the `roadmap` skill), and two of them are your choice. Checked on main at step 14's landing: `grep -c '| rebuild later: ' docs/academic-coverage.md` prints 15 (6 paper, 6 literature, 3 paper-review, 0 researcher; entry 15.A's goal still says 8, 6, 3 and 1, which change 7 corrects); the `rebuild:` rows per skill are writing 3, paper 34, paper-review 20, rebuttal 7, literature 22, idea 3, researcher 7, submit-manuscript 1, and code-comments, grant, scaffold, project-docs and submit-grant 0 (`grep -c '| rebuild: <skill> |'`).
  - The changes the plan already fixes, shown for approval:
    1. Entry 15.A's gate: `grep -c 'rebuild later:'` (which also counts the mark's definition at `docs/academic-coverage.md:15`, so it never reaches 0) becomes `grep -c '| rebuild later: ' docs/academic-coverage.md` prints 0; and the gate adds: the coverage check with `--built paper --built paper-review --built literature --built researcher` prints `ok:`, and the plan's ledger holds a record for each re-marked row that the file it names holds what the source file did, checked by reading both.
    2. Entries 3, 5, 6, 7, 9, 10, 13 and 14 each add to the gate: the coverage check with `--built <its skill>` (the command in `docs/academic-coverage.md`) prints `ok:`, and the plan's ledger holds a record for each `rebuild: <its skill>` row that the file of `skills/<its skill>/` the row names holds what the source file did, checked by reading both. Entries 4, 8, 11 and 12 get no such clause, since they have no `rebuild:` row and `--built` fails a skill with none.
    3. Entry 16 waits on 14 as well: "5 to 10, each with its side-by-side run passed; 14, for the submission checks and the cover letter of `references/journal_submission_guide.md`; 15.A, ...".
    4. Entry 7's gate adds: a side-by-side run against academic-paper's revision coach (`agents/revision_coach_agent.md`) on a real round of referee comments, compared blind, wins or ties.
    5. Entry 10's gate adds: a side-by-side run against deep-research's socratic mode (`references/socratic_mode_protocol.md`) on a real idea, compared blind, wins or ties.
    6. Entry 8's "Waits on: 3, for the writing base; 2, for the coverage" becomes "3, for the writing base; 2, for the coverage: no file is marked `grant`, and the funder acknowledgement text reaches it through the paper row of `references/funding_statement_guide.md`".
    7. Entry 15.A's goal and waits, which step 14's re-marked rows made false (`docs/roadmap.md` lines 120 and 122): the goal's "8 for paper, 6 for literature, 3 for paper-review, 1 for researcher" becomes "6 for paper, 6 for literature, 3 for paper-review", and "Waits on: 5, 6, 9 and 13, the skills the rows go to" becomes "Waits on: 5, 6 and 9, the skills the rows go to", since no `rebuild later: researcher` row is left.
  - Choice 1, the order of entries 5 and 9. The paper skill's DOI check and its integrity row (`agents/integrity_verification_agent.md`, looking every reference up) need the lookups through Crossref, OpenAlex, Semantic Scholar and arXiv, and their five rows are `rebuild: literature` (entry 9), which entry 5 does not wait on.
    - (a) Entry 9 moves before entry 5 in the file, keeping its number, and entry 5 waits on 9 "for the reference lookups". Pro: the lookups are built once, where entry 9's goal already names them; the coverage rows stay as they are. Con: paper, the most used skill, comes one entry later.
    - (b) The five lookup rows are re-marked `rebuild: paper` and entry 9 waits on 5, reusing them. Pro: paper comes first. Con: five coverage rows and entry 9's goal are rewritten, and the literature skill depends on the paper skill for its core search.
    - Recommendation: (a). It ends the cause where the rows already put it. (b) costs more and splits the literature skill's own search out of it; neither is the cheaper-and-worse option by cost alone, and (a) is the smaller change.
  - Choice 2, the cover letter and the blind-review removal, which the coverage rows of `agents/formatter_agent.md` (line 59) and `references/journal_submission_guide.md` (line 90) send to `submit-manuscript`, while entry 14's goal names neither.
    - (a) Entry 14's goal adds: "It also writes the cover letter, with suggested and excluded reviewers, and removes what identifies the authors for a blind review, from the venue file." Pro: matches both rows as written; both are made per venue at submission, from the venue files entry 14 already waits on. Con: a cover letter for a venue with no portal waits for entry 14.
    - (b) Both move to entry 5: entry 5's goal names them, and rows 59 and 90 are rewritten to `paper`. Pro: available with the first writing skill. Con: two rows rewritten, and the paper skill takes venue-specific work without the venue files of entry 13.
    - Recommendation: (a). (a) is also the cheaper option; it is recommended because the work is venue-specific and entry 14 is where the venue files and the portal meet, not because it is cheaper.
  - To rule: `Ruled: M: changes 1-7 <approved, or what to change>; choice 1 (a) or (b); choice 2 (a) or (b)`. On the ruling, step 10 writes the approved diff through `/roadmap`, lands it, and books it.

### Step 16, the retro (open item P, ruled 2026-09-26: all (a); see Rulings)

- Open item P (step 16, the retro over plans 1, 2 and 2.A): `.scratch/retros/2026-09-26.md` groups the 555 findings of the 23 archived refuter reports (collected by `python3 skills/plan-retro/templates/collect_findings.py .scratch/archive`) into kinds; 20 kinds recur (three or more steps, or two or more plans) and carry 19 proposals, P1 to P19, each quoted in full in the retro under its kind with the findings it would have prevented. Step 17 makes the approved ones; nothing in the rules, the standards or the checks changes before your ruling. For every proposal, (b) is the lazy option: it leaves the cause of the findings in place.
  - P1, a rewrite keeps the meaning of every rule it carries (67 findings, 10 steps): new rule 17 in `docs/dev/change-standard.md`. (a) Approve. Pro: the kind with the most findings has no rule anywhere. Con: none beyond the added rule. (b) Decline. Recommendation: (a).
  - P2, a script's cases cover every input form its rules name (43 findings, 5 steps, 3 plans): a sentence added to rule 15. (a) Approve. Pro: names the forms builders skipped (heading levels, directories, fenced code). Con: rule 15 grows by one sentence. (b) Decline. Recommendation: (a).
  - P3, the prose standard held by a check (43 findings, 6 steps, 2 plans): copy the prose standard to `docs/dev/prose-standard.md`, add `standards: [docs/dev/skill-layout.md, docs/dev/prose-standard.md]` to `.agents/plan.yaml`, and add `utils/check_prose.py` (long sentences, semicolon rate, shared endings) with its test to the verify list. On the current tree the prototype exits 1 with 98 lines in 14 files, which step 17 rewrites first. (a) All three. Pro: every brief then points at both pages without the author remembering, and the clear breaks are caught by a command. Con: step 17 rewrites 98 places across the docs and skills. (b) Decline. (c) The page and `standards` only, no check. Con of (c): the rule was already named in these briefs and still broken 43 times. Recommendation: (a).
  - P4, the report check (42 and 19 findings, 18 and 9 steps, 3 plans): `skills/land/templates/check_report.py` fails a report that does not quote every line the verify runner printed or does not name every changed file with a number; `/refute` runs it and `/land` refuses on its exit 1. On the current tree it passes the reports of steps 13, 14, 15 and 1c and fails step 12's with 21 lines. (a) Approve. Pro: the two report defects found in the most steps become a command. Con: two skills and their tests change. (b) Decline. Recommendation: (a).
  - P5, one rule per inventory row, and a place that states it (38 findings, 10 steps): new rule 18. (a) Approve. Pro: the inventory's rule exists today only as a script's docstring that checks the place exists. Con: the report quotes one line per row. (b) Decline. Recommendation: (a).
  - P6, every changed branch has a case, listed with its revert (37 findings, 8 steps, 3 plans): a sentence added to rule 13. (a) Approve. Pro: turns "the cases I wrote are proven" into "every branch has a proven case". Con: a longer report table. (b) Decline. Recommendation: (a).
  - P7, a coverage reason claims only what its file's lines say (35 findings, 4 steps): a sentence in `docs/academic-coverage.md` after line 18. (a) Approve. Pro: the coverage list is rechecked each time a skill is built. Con: none. (b) Decline. Recommendation: (a).
  - P8, the repeated-rule check (30 findings, 9 steps): `utils/check_repeated_rules.py` fails two lines of one `SKILL.md` that share eight words; on the current tree it exits 1 with 13 pairs in 6 skills, which step 17 rewrites to one statement and a pointer first. (a) Approve. Pro: "a rule is written once" becomes a command. Con: 13 rewrites in the skills. (b) Decline. Recommendation: (a).
  - P9, sentences about a changed file as a whole are reread (29 findings, 12 steps, 3 plans): a sentence added to rule 14. (a) Approve. Pro: covers the introductions and counts that a name grep never finds. Con: none. (b) Decline. Recommendation: (a).
  - P10, what "one rule per bullet" means (25 findings, 8 steps): `docs/dev/skill-layout.md:45` sharpened. (a) Approve. Pro: gives the test builders lacked (can one be broken while the other holds). Con: none. (b) Decline. Recommendation: (a).
  - P11, a destination for every part of a split file, kept through rewrites (20 findings, 4 steps): `docs/academic-coverage.md:18` sharpened. (a) Approve. (b) Decline. Pro of (a): most of these came from repair rounds dropping a destination. Recommendation: (a).
  - P12, every code block of a `SKILL.md` carries a language tag (13 findings, 7 steps, 2 plans): the layout check enforces it and `docs/dev/skill-layout.md:48` says `text` for invocations and output; 13 fences on the current tree get a tag in step 17. (a) Approve. Pro: the one form of this kind a command can check. Con: "where one applies" becomes "always". (b) Decline. Recommendation: (a).
  - P13, no two statements contradict each other (13 findings, 6 steps, 3 plans): new rule 19. (a) Approve. Pro: no page states it. (b) Decline. Recommendation: (a).
  - P14, a script's head comment lists every input, error and exit status (11 findings, 5 steps, 3 plans): a sentence added to rule 14. (a) Approve. (b) Decline. Pro of (a): the incomplete docstrings had no rule to break. Recommendation: (a).
  - P15, the error-path test (7 findings, 3 steps, 2 plans): `utils/check_errors.test.sh` runs every Python script on a missing path, a directory and a non-UTF-8 file and fails on a traceback; the current tree passes it. (a) Approve. Pro: keeps the fixed cases fixed at no rewrite cost. (b) Decline. Recommendation: (a).
  - P16, a part goes to the first entry whose gate needs it (6 findings, 4 steps): a sentence in `docs/academic-coverage.md` after line 15. (a) Approve. (b) Decline. Pro of (a): it is the order choice 1 of open item M turns on. Recommendation: (a).
  - P17, nothing changed that no brief item asks for (5 findings, 4 steps, 3 plans): new rule 20. (a) Approve. Pro: `/refute` looks for it, but the builder's page never says it. (b) Decline. Recommendation: (a).
  - P18, a refusal or stop comes before the step it guards (4 findings, 3 steps, 2 plans): a new bullet in `docs/dev/skill-layout.md`, Lists and tables. (a) Approve. (b) Decline. Recommendation: (a).
  - P19, a point left to the orchestrator is reported as a stop, never decided as a judgment call (2 findings, 2 plans): a sentence added to rule 4. (a) Approve. (b) Decline. Recommendation: (a).
  - To rule: `Ruled: P: P1 (a), P2 (a), ...`, one clause per proposal, or `Ruled: P: all (a)` with any exceptions named. Each ruling is written beside its proposal in the retro, and step 17 makes the approved changes.

### Step 15, plan 1's Done line (open item O, ruled 2026-09-26: (b); see Rulings)

- Open item O (step 15, plan 1's Done line in the roadmap): `docs/roadmap.md:135` says plan 1's gate showed "every command in `docs/dev/building.md` passed on main (seven `PASS:` lines, ten `ok:` lines, a clean ASCII check)", a count nobody saw quoted, since each test ran through `| tail -1`. Step 15 re-ran the tests at the closing commit a866716 on its extracted tree (`agents/reviews/15-rerun.md`, "Commit a866716") and wrote the line again from what was run and seen (`agents/reviews/15-report.md`, "Doc text"; session log lines 3146, 3150, 3179 and 3204 of `7bdaf343-8a39-4a02-a88f-004137adaa7f.jsonl`). The roadmap changes only as a diff you approve (ruling 2h). Two versions, differing in one clause:
  - (a) Keeps the clause "every landing report `Open items: none. Booked list: empty`", which is true (`grep -h 'Booked' .scratch/archive/1-one-layout-for-every-skill/agents/reviews/*-landing.md | sort | uniq -c` prints `13 Open items: none. Booked list: empty.`). The full line:
    - [x] 1. One layout for every skill: `docs/dev/skill-layout.md` approved (plan 1's rulings); at the closing on main, `python3 utils/check_skill_layout.py` printed ten `ok:` lines, exit 0, `sh utils/check_skill_layout.test.sh` printed `PASS: check_skill_layout.py scratch tests`, `python3 utils/check_rule_inventory.py` over the ten inventories printed ten `ok:` lines, exit 0, and `sh utils/check_rule_inventory.test.sh` printed `PASS: check_rule_inventory.py scratch tests`, and the ASCII check printed nothing, exit 0; `/refute` ran on steps 2 to 14, once on the build and once over its one repair round, every landing report `Open items: none. Booked list: empty`; the findings of that last run that a rule was changed in meaning were fixed at landing with no further review: step 4 (a sentence the old file does not have), step 6 (a refusal stated without its condition), step 7 (`land`'s red line booked in the open items, against the ruling), step 8 (the refusal for a missing run over the last round merged into another refusal, and part of old line 10 lost), step 10 (the diff rule written twice with different scopes), step 11 (the `drop` refusal placed after the draft it prevents) and step 13 (the rule that nothing is written before approval not limited to the setup); the tests of `docs/dev/building.md` last ran together on main at step 14's landing, each through `| tail -1`, which hides its exit status, and the re-run at a866716 (`.scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/15-rerun.md`, "Commit a866716") shows `PASS: land.sh and usage.py scratch tests`, `PASS: check_config.py scratch tests`, `PASS: collect_findings.py scratch tests`, `PASS: sync_rules.py scratch tests`, `PASS: check_rule_inventory.py scratch tests`, `PASS: check_skill_layout.py scratch tests` and `PASS: pin.sh scratch tests`, each test exiting 0; at step 14's landing `npx skills add . --list` printed `Found 10 skills`.
  - (b) The same line without that clause. Pro: entry 1's gate (`git show a866716~1:docs/roadmap.md`) never asked for the lists, and the audit's finding 6 shows plan 1 used no booked or closed list and committed one open item (582298b), so the clause reports no gate output. Con: a true sentence leaves the record.
  - Recommendation: (b). The Done line records what the gate asked and what it printed; the clause is neither. Neither option costs more to carry out than the other.
  - To rule: `Ruled: O (a)` or `Ruled: O (b)`. On the ruling, the line goes into `docs/roadmap.md:135` through `/roadmap` with the diff shown, together with step 10's diff when open item M is ruled by then.

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

### Step 12, the coverage rows of academic-paper-reviewer (landed 2026-09-26)

- Landed: every one of the 26 files of research-hub's `academic-paper-reviewer` read in full and its row of `docs/academic-coverage.md` checked; records in `agents/reviews/12-rows.md` (26, ten `fixed`, 16 `holds`). Ten reasons rewritten, no mark changed: the sprint-contract sections send only the pre-commitment rule to `paper-review` at entry 15.A and drop the contract-driven decision; the cross-model option (rows 126 and 131) goes to `paper-review` at entry 15.A with `references/calibration_mode_protocol.md`; the pipeline phase folders are dropped since `researcher` (entry 13) owns the order of stages; SKILL.md's version, related-skill and spectrum sections each have a reason; the field analyst's row names "no ML conference" (audit finding 10). The mark definitions (lines 14-15) state that a part of a `rebuild` file may go to entry 15.A named with the `rebuild later` file of the same skill that carries it, and rows 54 and 60 of academic-paper name their carrying files.
- User-visible changes, before and after:
  - The mark definitions: before, a `rebuild:` skill covers the whole file before its entry's gate; after, a part deferred to entry 15.A with a named carrying `rebuild later` file is the one exception (orchestrator's ruling 6 of `agents/briefs/12-round-1.md`, writing down what steps 11 and 12's rows do).
  - What entry 15.A builds for paper-review: before, the sprint sections whole and no cross-model option; after, the pre-commitment rule, the guided and calibration modes, the cross-model option and the synthesizer's guided-mode issue list, each with its carrying file.
- Rounds: the first review (Spec 1-4, 6 and 8, Proof 1-2, Behaviour 1, Not checked), repair round 1 (8 rulings in `agents/briefs/12-round-1.md`; the path list widened to the mark definitions), the review over it (7 findings), fixed at landing (7): row 126's reason and sentence split; line 14 names the exception; row 133 names the issue list it carries; record 1's ranges; the ruling 6 check reproduced by grep; line 15 split in two sentences; rows 54 and 60 name their carrying files (`agents/reviews/12-refuter.md`, Closed).
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

  and exited 0. `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`.
- Booked: nothing new.
- Usage, orchestrator from step 1c's landing (f23d14a) to this booking: 89 messages, 80935 output tokens, 186307 cache-write tokens, 21832166 cache-read tokens, 186 fresh input tokens, 47 minutes; the window also holds step 10's stop, the briefs and dispatches of steps 15 and 7, and step 7's stop.

### Step 13, the coverage rows of academic-pipeline (landed 2026-09-26)

- Landed: every one of the 30 files of research-hub's `academic-pipeline` read in full and its row of `docs/academic-coverage.md` checked; records in `agents/reviews/13-rows.md` (30, five `fixed`, 25 `holds`). Seven reasons rewritten (rows 151, 152, 153, 155, 171 by the builder; rows 156 and 158 worded at landing), no mark changed: SKILL.md's and the orchestrator's parts each have a destination or a reason (the researcher inherits stage order, entry, checkpoints with self-check questions, the error-recovery table and the up-front token-cost estimate the user confirms; `paper` the optional parallel drafting, the failure-mode checklist, patch sequencing, the claim-audit gate and the Style Profile; `rebuttal` the reviewer-concern rule; `submit-manuscript` the package gate; entry 15.A finalisation with `academic-paper/agents/formatter_agent.md`); the claim audit's constraint and drift checks are dropped with the claim manifest, which has no successor (row 58); the `slr_lineage` flag and the experiment-provenance carry-forward end with their reasons.
- User-visible changes, before and after:
  - What entry 13 (researcher) builds: before, stage order, entry and the checkpoint system; after, also the self-check questions, the error-recovery table, the stage loop, the fallback and mode-switch tables, the mid-entry check, the prerequisite table, the audit trail and the up-front token-cost estimate the user confirms.
  - What entry 5 (paper) builds from this section: before, the claim audit whole; after, the claim audit without the constraint and drift checks, plus the optional parallel drafting, the failure-mode checklist, patch sequencing, the claim-audit gate and the Style Profile.
- Rounds: the first review (Spec 1-3, Behaviour 1, Not checked), repair round 1 (5 rulings in `agents/briefs/13-round-1.md`), the review over it (6 findings), fixed at landing (6): row 152 matches row 151 on the round-trip caps and counts; rows 156 and 158 worded to their files; rows 152 and 155 reworded against a repeated sentence shape; the two records of `13-rows.md` with them (`agents/reviews/13-refuter.md`, Closed).
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

  and exited 0. `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`.
- Booked: nothing new.
- Usage, orchestrator from step 12's landing (415d669) to this booking: 60 messages, 54060 output tokens, 170161 cache-write tokens, 10545292 cache-read tokens, 136 fresh input tokens, 51 minutes; the window also holds the reviews and repair round of step 14.

### Step 14, the coverage rows of deep-research (landed 2026-09-26)

- Landed: every one of the 52 files of research-hub's `deep-research` read in full and its row of `docs/academic-coverage.md` checked; records in `agents/reviews/14-rows.md` (52, 23 `fixed`, 29 `holds`). 23 rows of the section rewritten and row 55 of academic-paper (`agents/abstract_bilingual_agent.md`) names the abstract-only protections it takes. Six marks changed: `agents/editor_in_chief_agent.md` drop to `rebuild: literature` (audit finding 12: the literature report's revision loop keeps its editorial review); `agents/ethics_review_agent.md` and `references/ethics_checklist.md` `rebuild later: paper` to `rebuild: paper` (finding 13: entry 5's disclosure statements need the data-licence, dual-use and human-subject checks before its gate); `references/argumentation_reasoning_framework.md` `rebuild: paper-review` to `rebuild: literature` (finding 9); `agents/research_architect_agent.md` `rebuild later: researcher` to `rebuild: researcher` (entry 13's goal designs the next experiments); `references/interdisciplinary_bridges.md` drop to `rebuild: literature`. The pipeline phase folders are dropped row by row with each file's own reason, the agents' confinement to their own deliverable kept; the style profile is optional for the literature skill, so it does not wait on entry 5.
- User-visible changes, before and after:
  - The mark counts: `rebuild later` 18 (8 paper, 6 literature, 3 paper-review, 1 researcher) before, 15 (6, 6, 3, 0) after; `rebuild:` paper 32 to 34, literature 19 to 22, paper-review 21 to 20, researcher 6 to 7.
  - What entry 5 (paper) builds: after, also the ethics self-check and checklist (stop and override, data licence and privacy, dual use, conflicts with the AI-bias acknowledgement, AI disclosure, fair representation, human-subject approval, consent and de-identification) and the abstract-only protections.
  - What entry 9 (literature) builds: after, also the editor's weighted review driving the report's revision loop, the argumentation framework and the interdisciplinary bridges.
  - Entry 15.A's goal and waits (roadmap lines 120 and 122) are false after this step; open item M carries their correction as change 7, with its counts updated.
- Rounds: the first review (Spec 1-6, Standards 1-3, Behaviour 1-4, Not checked), repair round 1 (9 rulings in `agents/briefs/14-round-1.md`; the path list widened to row 55), the review over it (7 findings), fixed at landing (7): the phase-folder sentences of rows 187, 189, 190, 195, 198, 199 and 200 no longer give deep-research's own phase order to `researcher` and no longer repeat one shape; row 199 keeps the synthesis agent's confinement; row 190's timing; the ethics-training reason in rows 190 and 218; the training-bias note to `paper` in row 218; the records with them (`agents/reviews/14-refuter.md`, Closed).
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

  and exited 0. `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`.
- Booked: nothing new. Closed from the booked list: the ethics rows of the audit's finding 13, checked and re-marked here. Carried to open item M: change 7 and the updated counts.
- Usage, orchestrator from step 13's landing (3509ccb) to this booking: 15 messages, 15993 output tokens, 32470 cache-write tokens, 2858340 cache-read tokens, 32 fresh input tokens, 7 minutes.

### Step 15, ledger corrections in the three archived plans (landed 2026-09-26)

- Landed: the tests re-run at each of the 26 landing and closing commits of plans 1, 2 and 2.A on trees extracted with `git archive` (`agents/reviews/15-rerun.md`, one "## Commit <hash>" section each): every test exits 0 with a `PASS:` last line and the ASCII check is clean at all 26; the layout check exits 1 at the 11 commits before fe1f5e7 and joined plan 1's verify list only at bd51f8b. Every booking that claimed a `PASS:` count now quotes the lines of the re-run at its commit and says what the landing itself ran and saw, from the session log line it cites (50 bookings across the three plans' `plan.md`, state files and landing reports). Plan 1's usage rows carry the measured reviewer figures from the session log. The closed lists of the three state files hold one entry per ruling (12, 6 and 7). Plan 2's stale "Blocked" and "Open on Axel's side" lines are true. The three plans count findings under one rule, stated in `15-rerun.md`.
- User-visible changes, before and after:
  - An archived booking's verification line: before, "seven `PASS:` lines, ten `ok:` lines, a clean ASCII check"; after, the command the session ran, its log line and what it printed, and the `PASS:` lines of the re-run at that commit.
  - Plan 1's findings counts: before, 27 for step 2 and 3 for step 13's round; after, 23 and 4, under the rule the other two plans use.
  - `docs/roadmap.md` is unchanged; the new text of line 135 is open item O.
- Rounds: the first review (Spec 1-5, Standards 1-2), repair round 1 (5 rulings in `agents/briefs/15-round-1.md`; the brief's git convention corrected to allow the read-only git its checks run), the review over it (5 findings), fixed at landing (3): one counting rule for the three plans, the reason given for Doc text variant 2, and plan 2 step 4's session log citation (`agents/reviews/15-refuter.md`, Closed).
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

  and exited 0. `python3 utils/check_rule_inventory.py .scratch/archive/1-one-layout-for-every-skill/inventories/*.md` printed ten `ok:` lines.
- Raised: open item O, the new text of `docs/roadmap.md:135` in two versions. Booked: nothing new.
- Usage, orchestrator from step 14's landing (3ad7ebd) to this booking: 35 messages, 31761 output tokens, 73082 cache-write tokens, 8778410 cache-read tokens, 78 fresh input tokens, 66 minutes.

### Step 10, the roadmap's gates and order (landed 2026-09-26)

- Landed: `docs/roadmap.md` rewritten through `/roadmap` in ten commits, a9e651b to 80c8dc6, one per change: entry 15.A's gate counts only `| rebuild later: ` rows and runs the coverage check with `--built paper --built paper-review --built literature` (ruling Q); side-by-side runs in the gates of entries 7 and 10; the `--built` clause and a checked record per `rebuild:` row in the gates of entries 3, 5, 6, 7, 9, 10, 13 and 14; entry 16 waits on 14; entry 8 states how it uses the coverage; entry 15.A's counts (6, 6, 3) and waits (5, 6 and 9); entry 9 moved before entry 5, which waits on it for the reference lookups (ruling M, choice 1 (a)); entry 14's goal names the cover letter and the blind-review removal (ruling M, choice 2 (a)); plan 1's Done line restated from the re-run, without the landing reports' lists (ruling O (b)).
- Proof: `cmp docs/roadmap.md .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/agents/reviews/10-roadmap.md` exits 0, the file equal to the diff approved on open item Q; `git diff --shortstat 7a1adf0 80c8dc6 -- docs/roadmap.md` prints `1 file changed, 22 insertions(+), 22 deletions(-)`.
- Closed from the booked list: roadmap entry 14 now names the cover letter and the blind-review removal.
- Verification on main after 80c8dc6, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0:

```
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

- Usage, orchestrator from step 15's landing (8becbcd) to this booking, shared with step 16 (the retro), step 7's relaunch and the wait on the rulings: 101 messages, 102285 output tokens, 664529 cache-write tokens, 19671793 cache-read tokens, 202 fresh input tokens, 375 minutes.

### Step 7a, the allow list for a shell-launched claude builder (landed 2026-09-26)

- Landed: `skills/plan-orchestration/templates/allow_list.py` and its test (new): the configuration's `worker_allow` entries, or else the prefixes of the simple commands of the verify list and of the brief's check commands, each prefix ended before its first word holding a quote, `$`, a backtick, a backslash, `(`, `)`, `{`, `}`, `[`, `]`, a comma, `*` or `?`; a subshell, a group, a command substitution (inside double quotes too), a shell keyword and a carriage return refused with exit 64; exit 69 without PyYAML, as `check_paths.py` and `verify.sh` have it. `launch.sh` requires `--allow-file` for `claude`, refuses it for `codex`, and passes each stripped line as `--allowedTools "Bash(<line>:*)"` on a first launch and on `--resume`. `check_config.py` checks `worker_allow`; the `plan` templates and `skills/plan/SKILL.md:52` carry the key; `plan-orchestration` gives the recipe and the resume's rule. The exit file under every stop (round 2): the builder's runner writes it after a stop on a signal and when its parent is gone (`exit 137`), never over a file present; the session scanner runs the interpreter `python3` resolves to (`LAUNCH_PYTHON`); the land skill waits five seconds after its KILL for the pid gone and the exit file.
- User-visible changes, before and after: a `claude` launch without `--allow-file` ran under a permission mode that refused every script, and is now refused with exit 64; a KILL to the leader while the builder runs left no exit file, and now leaves `exit 137`; TERM, INT or HUP during a hanging `end` wrote the file after `end` was stopped, and now writes the builder's code first; INT and HUP reached the runner as TERM, and now as sent (INT gives 130); a detached body that wrote its pid and ended at once could fail the launch with exit 1, and now is a launch; the land skill checked the pid and the exit file once after its KILL, and now waits up to five seconds, every tenth of a second.
- Proof, a real run: `launch.sh claude --model sonnet` in the main checkout with the allow file `allow_list.py` printed for this plan's state file (16 lines, the ASCII check as `git ls-files -coz --exclude-standard` and `xargs -0 perl -CSD -ne`) ran `sh skills/plan-orchestration/templates/allow_list.test.sh 2>&1 | tail -1` (`PASS: allow_list.py scratch tests`) and a `git ls-files ... | xargs -0 perl -CSD -ne '...'` pipeline, exit file `exit 0`, `permission_denials: []`.
- Proof, load: the round 2 review's whole-suite runs of `launch.test.sh` at 16 at once: 0 of 16 red under `sh` and under `dash` on the step's tree, 16 of 16 `FAIL: land sequence with KILL: no exit file` on base df3c6a7.
- Repair rounds: round 1, nine rulings (`agents/briefs/7a-round-1.md`); round 2, the one round beyond the cap for ruling 5 unbuilt and `launch.test.sh` red under load (`agents/briefs/7a-round-2.md`). The path list widened with `skills/plan/SKILL.md` line 52, `skills/land/SKILL.md` lines 39-45 and `templates/launch-note.md`.
- Premise corrected: the brief's `worker:` line of `templates/plan.yaml` is line 11, not 10.
- Fixes at landing (10): a carriage return inside a command refused by `allow_list.py`, with two cases; a carriage return inside an allow-file line refused by `launch.sh`, with a case; the cut case's comment made true; `land_wait` bounded by five seconds of wall time; the exit-file sentences of `launch.sh`, `plan-orchestration/SKILL.md` and `launch-note.md` made to say which stops leave no exit file, and the long ones split; the allow-list bullets of `plan-orchestration` split; the README bullets for `launch.test.sh` and `allow_list.test.sh`; `sh skills/plan-orchestration/templates/allow_list.test.sh 2>&1 | tail -1` added to this plan's verify list; `worker_allow: []` in this plan's configuration block; the brief's premise line. Each red check is quoted in `agents/reviews/7a-refuter.md`, Closed.
- Booked as step 7b: a KILL after the builder ended leaves no exit file; a killed run's runner can write `exit 137` after a relaunch removed the file; a KILL between the leader's two writes leaves only the `.tmp`; the no-replace guards lack red cases; the scanner's answer has no time limit.
- Verification on main, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: allow_list.py scratch tests
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
verify: 14 commands passed
```

- Usage, orchestrator from step 10's booking (c0ddc44) to this booking, shared with step 7's wait: 115 messages, 98508 output tokens, 535522 cache-write tokens, 23186713 cache-read tokens, 242 fresh input tokens, 405 minutes.

### Step 7, the layout and inventory checkers (landed 2026-09-26)

- Landed: `utils/check_skill_layout.py` and `utils/check_rule_inventory.py` with their tests, and the README Tests bullets for both. Both checkers split lines on the line feed only, so line numbers are those of `grep -n` and a line separator or a lone carriage return stays inside its line; a file that is not UTF-8 is an error; a byte-order mark is read as no text. The layout checker counts `__` as bold only where CommonMark does (not inside a word) and `**` everywhere outside code; reads a heading indented by up to three spaces as a heading; reports a version tag in a heading, bold in a heading, and a table with no row after its separator; reads the first table of a section. The inventory checker reads an indented heading as a heading in the old and the new file, and refuses an old path that is a directory. Each fault the checkers' review planted turns a case red, each case with its revert named in `agents/reviews/7-report.md`.
- Launch: the builder ran from a shell through `templates/launch.sh claude` with the launch note, on this session's account (ruling N), under the allow list of step 7a; its row was seen in oculus's Agents view under this session (Step 0 above).
- User-visible changes, before and after, from the report's table: layout, empty frontmatter gave `frontmatter is a NoneType, not a mapping` and now gives `frontmatter is empty`; a top-level `version:` passed and is now an error; a Stops, Use instead or Anti-patterns table with no row after its separator passed and is now an error, read on the first table of the section; a version tag in a heading (`v2`, `1.2.0`), indented or not, passed and is now an error; `foo__bar__baz` was a bold error and now passes; a file with a byte-order mark failed and now passes; `  ## Rules` gave `section 'Rules' is missing` and now counts; an indented second `# ` heading and an indented `## ` heading outside the reference place passed and are now errors; bold in an indented heading failed with `bold outside a list item's label` and now fails with `bold in a heading`; after a line separator or a lone carriage return, errors were one line late and are now at the `grep -n` line. Inventory, an old path that is a folder gave range and coverage errors against a tree listing and now gives one error, `the old path is not a file in that commit`; a one-line row outside the file now reads `old line 30 lies outside the old file's 1-24`; a line separator or a lone carriage return in any of the three files gave extra lines and false errors and is now read as part of its line; a heading indented by up to three spaces in the new file is now a section, and in the old file it carries no text, where it was reported as in no row.
- Repair rounds: round 1, ten rulings (`agents/briefs/7-round-1.md`).
- Premises corrected: the brief's case `1. Read the input from __init__.py.` expected no bold error, and CommonMark renders `init` there in strong emphasis, so the checker reports it (ruling 1 of round 1; the brief corrected at landing). Ruling 10 of round 1 said bold in an indented heading passed before; it failed before with another message.
- Fixes at landing (6): case `indented-row` and case `indented-range` of `utils/check_rule_inventory.test.sh`, each red with its heading match set back to column 0; the heading match in `blocks` removed, since `check_range_block` returns at a heading before it compares blocks and no case could prove it; the carriage-return sentence of both module docstrings made true; the brief's `__init__.py` case. Each red check is quoted in `agents/reviews/7-refuter.md`, Closed.
- Booked: none.
- Verification on main, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: allow_list.py scratch tests
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
verify: 14 commands passed
```

- Usage, orchestrator from step 7a's booking (f4dd5e8) to this booking, shared with step 7b's review and its round 1, and ruling T: 87 messages, 69187 output tokens, 206121 cache-write tokens, 24108442 cache-read tokens, 202 fresh input tokens, 154 minutes.

### Step 7b, an exit file after every stop of a started builder (landed 2026-09-26)

- Landed: `skills/plan-orchestration/templates/launch.sh` and its test, `plan-orchestration/SKILL.md`, `templates/launch-note.md` and the README bullet for `launch.test.sh`. When the builder ends while the leader lives, the builder's runner forks a guard that holds the builder's code, ignores TERM, INT and HUP, and waits every tenth of a second until the leader is gone; it then writes the code when no exit file is present and removes the leader's temporary file. The guard checks once that it is in the leader's process group, since the leader's pid is not reused while that group lives, and otherwise says so on standard error and writes nothing. The session leader, the builder's runner and the guard hold the launch's lock for as long as each lives; the builder and the note calls do not; a launch of the same pid file is refused with exit 75 while any of them lives. The runner reads the session scanner's answer with a deadline of 2 seconds shared by the whole stop. Each writer writes `<exit file>.tmp.<its pid>`; the launch removes an exit file and the temporary files an earlier run left. The runner checks the open of its handle on the lock and otherwise closes the descriptor before it forks the builder.
- User-visible changes, before and after: a KILL after the builder ended, while the note's `end` runs, left no exit file and now leaves the builder's code; a KILL between the leader's temporary write and its move left only `<exit file>.tmp` and now leaves the exit file; a killed run's runner could write `exit 137` after a relaunch removed the file, and a relaunch is now refused with exit 75 until the killed run's runner and guard are gone; a stop could wait on a scanner that never answers with no limit, and now waits at most 2 seconds; a relaunch right after a normal end is refused for about a tenth of a second while the guard ends. After TERM and then KILL during the leader's own write, `<exit file>.tmp.<leader pid>` is left until the next launch removes it.
- Proof, load: the whole of `launch.test.sh` 16 times at 16 at once, 0 red under `sh` and 0 under `LAUNCH_SHELL=dash` (the round 2 review; the builder's report gives 32 of 32 under each).
- Repair rounds: round 1, eight rulings (`agents/briefs/7b-round-1.md`); round 2, the one round beyond the cap, since round 1's 10-second bound on the guard left a KILL to a leader alive past it with no exit file, against the brief's "What it must do" item 1 (`agents/briefs/7b-round-2.md`, four rulings; round 1's ruling 2 withdrawn).
- The builder ran the read-only `git diff` and `git status` in the worktree during the first build and round 1, against the brief's no-git rule, and says so in its report; no git command in round 2.
- Fixes at landing (4): the guard-waits case's comment rewritten in short sentences, with the garbled pid sentence made true; the test's head comment clause split; case "guard group" (with the group check removed: `FAIL: guard group: no line in the stderr file`; with only its exit removed: `FAIL: guard group: an exit file was written: exit 3`); the README bullet for `launch.test.sh` from the report's "Doc text", its long sentence split and the new case named. Each is quoted in `agents/reviews/7b-refuter.md`, Closed.
- Booked as step 7c: the guard waits on `kill 0`, which succeeds on a zombie, so a killed leader its parent does not reap keeps the guard waiting and no exit file is written.
- Verification on main, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: allow_list.py scratch tests
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
verify: 14 commands passed
```

- Usage, orchestrator from step 7's booking (a8541ed) to this booking: 49 messages, 37730 output tokens, 91373 cache-write tokens, 8081914 cache-read tokens, 114 fresh input tokens, 137 minutes.

### Step 7c, a session leader left as a zombie counted as gone (landed 2026-09-27)

- NOT DONE: the brief's load item (the whole of `launch.test.sh` 32 times at 16 at once under `sh` and `dash`, 0 red) is not met on this machine's load, by this tree or by main's files before it: in alternating `sh` batches of 16 the step's files were 8 red of 32 and main's 1 of 32, over six batches 8 of 48 and 4 of 48, under `dash` 1 of 16 and 2 of 16, every red in an older case. Booked as step 7d.
- Landed: `skills/plan-orchestration/templates/launch.sh` and its test, `plan-orchestration/SKILL.md`, `templates/launch-note.md`, the land skill's `SKILL.md` Steps item 1 and the README bullet for `launch.test.sh`. A pid counts as gone when `kill -0` fails or `ps -o stat=` shows a state starting with `Z`. The guard checks `kill 0` every tenth of a second, and while it succeeds asks `ps` once a second, the first time one second after its start. The launch's refusal of a pid file uses the same test (`pid_gone`). Every `ps` call goes through one perl sub, `ps_state`, bounded at 2 seconds, the `ps` killed past it; a failed, hung or empty answer counts as not gone. A guard that cannot start `ps` says so once in the stderr file and waits on `kill 0` alone. The test's `not_alive` counts a zombie as gone.
- User-visible changes, before and after: a killed leader its parent does not reap left no exit file, and its guard waited holding the lock; now the guard writes the builder's code within about a second of the KILL. A pid file naming a zombie refused a launch with exit 75; now it does not, while the guard's lock still refuses as before. The guard ran no `ps`; now a leader alive more than a second after the builder's end gets one `ps` a second, the one on the builder's `PATH`, and the launch runs one `ps` through perl when the pid file names a pid `kill -0` reaches. A guard that cannot run `ps` writes one line to the stderr file.
- Repair rounds: round 1, seven rulings (`agents/briefs/7c-round-1.md`).
- Premise widened before the brief: the pid-file check and the land skill's text joined the step, since both read a zombie leader as alive.
- Fixes at landing (6): the no-ps case keeps the leader 4 seconds, so a guard that went on asking `ps` is red; the launch case times the refusal; the `ps` window in `launch.sh`'s head comment and `SKILL.md` item 2; the test's head comment line on a normal end; the README bullet from the report's "Doc text", its two sentences made true; the overlong comment lines reflowed. Each red is quoted in `agents/reviews/7c-refuter.md`, Closed.
- Booked as step 7d: `launch.test.sh` red under load on main's files and on this tree.
- Verification on main, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: allow_list.py scratch tests
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
verify: 14 commands passed
```

- Usage, orchestrator from step 7b's booking (01b029e) to this booking: 38 messages, 37268 output tokens, 557266 cache-write tokens, 9246203 cache-read tokens, 82 fresh input tokens, 486 minutes.

### Step 20, Claude only: the shell-launch route and every Codex part of the skills removed (landed 2026-09-27)

- Landed: `launch.sh`, `launch.test.sh`, `allow_list.py`, `allow_list.test.sh` and `launch-note.md` deleted; `plan-orchestration/SKILL.md` dispatches a builder with the runner's Agent tool only, resumes it by its agent id, and defines a dead builder; the plan templates and `check_config.py` accept `claude:<model>` only and drop `launch_note`, `worker_allow` and `worker_effort`; `usage.py` reads a Claude Code session log only; `land.sh` takes `<pkg> <base>` and prints Claude rows; `/repo-setup` no longer creates `AGENTS.md` and `sync_rules.py` no longer checks it; `pin.sh` links into `~/.claude/skills` and `$CLAUDE_CONFIG_DIR/skills` only; README, `building.md`, `change-standard.md`, `.agents/plan.yaml` and `skills/spec/SKILL.md` follow.
- User-visible changes, before and after: a Codex worker or reviewer in `.agents/plan.yaml` was accepted, now `check_config.py` refuses it; `launch_note`, `worker_allow` and `worker_effort` were keys, now each is an unknown key; `land.sh <pkg> <base> <runs dir>` is now `land.sh <pkg> <base>`; `/repo-setup` wrote `AGENTS.md`, now it does not; `pin.sh` linked into `~/.agents/skills` too, now it does not.
- Kept on purpose (the brief's item 9): the skills CLI's `.agents/skills` copy and the lookups that follow it, `docs/academic-coverage.md`'s research-hub path, the roadmap's done entries, `ordo-init` lines 31 and 53.
- Repair rounds: round 1, six rulings (`agents/briefs/20-round-1.md`); round 2, the one round beyond the cap, for round 1's unbuilt case of the two-argument command line (`agents/briefs/20-round-2.md`). The review of round 2 found nothing.
- Fixes at landing (4): `plan-orchestration/SKILL.md` names the report at the dispatch block's `report` path in the dead-builder test, and "on that id" became "on its agent id in `session_id`" (review of round 1, Standards); the ledger's configuration block lost `worker_effort` (review of round 1, Spec); the models ruling in Rulings marked superseded by ruling U. `.agents/launch/2b-7` deleted.
- Roadmap: entry 2.B's goal made Claude only through `/roadmap`, the diff approved by the user (commit f37c5e6).
- Booked for the user at the pin of ruling W: the ten links in `~/.agents/skills` that `pin.sh` no longer manages.
- Verification on main, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md`, exit 0:

```
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
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
verify: 12 commands passed
```

- Usage: the row in `orchestrator-state.md`'s Usage table.

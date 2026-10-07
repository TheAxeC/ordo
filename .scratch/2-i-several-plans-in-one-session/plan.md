# Plan: 2.I Several plans in one session

Execution ledger for roadmap entry 2.I of `docs/roadmap.md`. One bullet is one step: a part of the entry. A step is built by one dispatch of its executor (a builder agent by default), or run by the orchestrator without an agent (marked). A step is ticked only after its verification commands ran and the whole diff was read; the commands are in `orchestrator-state.md`, and nothing is ticked on inspection. The green checkmark is this file's status vocabulary; everything else in this folder is ASCII. Read `orchestrator-state.md` first after any context compaction.

## Goal

`plan-orchestration` runs every open plan in one session: it takes the plans in the roadmap's order, `spec` compares a step's paths with the steps in flight of every open plan, one limit on steps in flight holds across all plans, landings are one at a time across all plans, and one report lists each plan's position and open items; and every open plan runs the verify list the verification page holds now: a command added to the page reaches each open plan before its next step is checked or landed, never only the plan that added it.

## Gate

one real run over two open plans whose next steps change the same file, with a third step in flight beside them and steps of both plans in flight at the same time: the run starts with the plan that comes first in the roadmap, the second plan's step waits until the first plan's step has landed, the steps in flight never exceed the one limit, no two landings overlap, and the one report lists both plans' positions and open items, checked by a fresh reviewer agent against the two plans' ledgers; a test command added to the verification page by one plan's step is run, its line quoted, by the next landing of the other plan.

- The gate: could this pass without the goal being reached? No. A session that runs one plan at a time never has steps of both plans in flight at the same time, and each other part of the goal has its own condition: the roadmap's order, the wait on the shared file, the one limit, the landings one at a time, the one report and the test command added by one plan run by the other.
- Step 1: could this pass without the goal being reached? No. Each changed text is read in place against the ruling it carries, and the grep shows the commit form of every commit on main; a text that reads right but does not run right is found by step 2's run.
- Step 2: could this pass without the goal being reached? No. Each condition is read from the run's ledgers and transcript, and the report is checked against the two plans' ledgers.

## Steps, in execution order

- 1 Several plans in one session in the skill texts: `plan-orchestration` with `references/self-rule.md`, `spec`, `land`, `refute`, `plan` with `templates/orchestrator-state.md`, `ordo-help`, the commit command of every skill that commits on main, `skills/repo-setup/templates/plan-terms.md` synced into `docs/glossary.md`, and `README.md`, as the rulings D15 to D28 say, each skill's version raised as `docs/dev/skill-layout.md` says; check: each changed text read in place against its ruling, `git grep -n -e 'git add --' -e 'committed by path' -- skills` from the repository root read to show every commit on main in the form `git commit -m <message> -- <path> ...`, `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` from the repository root exits 0, and `sh skills/land/templates/checks.sh .scratch/2-i-several-plans-in-one-session/orchestrator-state.md` from the repository root passes (1 commit) (ruling A)
- 2 The real run: in a scratch repository under the session's scratch folder, two open plans whose next steps change the same file, a third step in flight, and one plan's step adding a test command to the verification page; the orchestrator runs the loop of step 1's texts, read from the repository, over both plans, with nothing asked of the user; check: the run's ledgers and transcript show the run starting with the plan first in the roadmap, steps of both plans in flight at the same time, the second plan's step waiting until the first plan's step landed, the steps in flight never above the one limit, no two landings overlapping, the added test command run by the other plan's next landing with its line quoted, and the one report checked by a fresh reviewer agent against the two plans' ledgers (1 commit; orchestrator, no agent) (ruling A)
- 3 the closing: the closing report written (the cost script's output, or that the plan started no agent), the roadmap entry ticked with the gate's output (`/roadmap done 2.I`), this folder moved to `.scratch/archive/` (orchestrator, no agent) (ruling A)

## Could run in parallel

Independent of each other; the standing rule of one agent at a time still serialises them unless the configuration block allows more.

- none: step 2 runs the texts step 1 lands.

## Rulings (2026-10-05)

- Decision 2 (2026-10-05): in entry 2.I's gate, the one report is checked by a fresh reviewer agent against the two plans' ledgers in place of the user's review, and `docs/dev/change-standard.md`'s gate sentence allows a fresh reviewer agent's review where the user rules so for a roadmap entry (the user).
- D1 goal part, every open plan in one session (2026-10-05): (a) kept as the entry writes it: "`plan-orchestration` runs every open plan in one session" (the user).
- D2 goal part, the roadmap's order (2026-10-05): (a) kept as the entry writes it: "it takes the plans in the roadmap's order" (the user).
- D3 goal part, paths compared across plans (2026-10-05): (a) kept as the entry writes it: "`spec` compares a step's paths with the steps in flight of every open plan" (the user).
- D4 goal part, one limit across plans (2026-10-05): (a) kept as the entry writes it: "one limit on steps in flight holds across all plans" (the user).
- D5 goal part, landings one at a time across plans (2026-10-05): (a) kept as the entry writes it: "landings are one at a time across all plans" (the user).
- D6 goal part, one report (2026-10-05): (a) kept as the entry writes it: "one report lists each plan's position and open items" (the user).
- D7 goal part, the current verify list (2026-10-05): (a) kept as the entry writes it: "every open plan runs the verify list the verification page holds now: a command added to the page reaches each open plan before its next step is checked or landed, never only the plan that added it" (the user).
- D8 gate part, one real run over two plans sharing a file (2026-10-05): (b) the gate part reads "one real run over two open plans whose next steps change the same file, with a third step in flight beside them and steps of both plans in flight at the same time" (the user).
- D9 gate part, the first plan in roadmap order starts (2026-10-05): (a) kept as the entry writes it: "the run starts with the plan that comes first in the roadmap" (the user).
- D10 gate part, the second plan's step waits (2026-10-05): (a) kept as the entry writes it: "the second plan's step waits until the first plan's step has landed" (the user).
- D11 gate part, the limit never exceeded (2026-10-05): (a) kept as the entry writes it: "the steps in flight never exceed the one limit" (the user).
- D12 gate part, no overlapping landings (2026-10-05): (a) kept as the entry writes it: "no two landings overlap" (the user).
- D14 gate part, a new test command reaches the other plan (2026-10-05): (a) kept as the entry writes it: "a test command added to the verification page by one plan's step is run, its line quoted, by the next landing of the other plan" (the user).
- D15 where the limit on steps in flight is read (2026-10-05): (a) `.agents/plan.yaml`'s `workers_at_once` is the one limit, read at each pick and counted over the dispatch blocks of every open plan; the configuration block no longer carries the key and `/plan` stops copying it (the user).
- D16 how each plan's verify list stays equal to the verification page (2026-10-05): (a) `/spec` at its preflight and `/land` before it runs the verify list compare the plan's verify list with the verification page's commands, copied as `/plan` Steps 4 copies them, and on a difference rewrite the list in the state file and name the change in the brief or the booking; no script (the user).
- D17 where the steps in flight of every plan are recorded (2026-10-05): (a) each plan keeps its own dispatch block, and the skills read the dispatch blocks of every open plan to count, compare paths and resume (the user).
- D18 worktree and branch names across plans (2026-10-05): (a) every step's worktree is `<worktree_root>/<slug>-<step>` and its branch `<slug>-<step>`, the slug of its plan's ledger folder, recorded in the dispatch entry's `worktree` (the user).
- D19 commits that cannot take another plan's staged landing (2026-10-05): (a) every commit a skill makes on main names its paths, `git commit -m <message> -- <path> ...`, the landing commit its paths from `git diff --cached --name-only`; and a landing runs from its cherry-pick to its commit before the session makes any other commit or starts any other skill (the user).
- D20 which plan's commit carries a record (2026-10-05): (a) a resume-point commit carries the session's records under its own plan's ledger folder, and the choices file when a choice of that plan changed it; another plan's records wait for its next resume point, and a session that stops commits every plan's records (the user).
- D21 the order steps of several plans are picked in (2026-10-05): (a) each free slot takes the next unblocked step of the earliest plan in roadmap order that has one, each pair with the steps in flight judged under "Two steps in flight" (the user).
- D22 the rules of two steps in flight across plans (2026-10-05): (a) every rule of "Two steps in flight" holds for a pair from two plans as for a pair from one, `shared_paths:` naming the other step's plan and step, and a step that touches a configuration file or a rule file runs alone across all plans (the user).
- D23 the scope of a pause (2026-10-05): (a) a pause holds every open plan unless the user names the plans it holds, and it is written in the position line of each plan it holds (the user).
- D24 the shape of the one report (2026-10-05): (a) the orchestrator's report opens with one position line per open plan in roadmap order, each followed by that plan's open items verbatim, then the steps landed since the loop began grouped by plan; the landing report stays one per step in its plan's ledger (the user).
- D25 what a plan's state file describes after another plan's commit (2026-10-05): (a) a plan's state file describes that plan as of its own last resume point, and a commit of one plan rewrites no other plan's state file (the user).
- D26 next-entry mode while other plans are open (2026-10-05): (a) after a closing, the next roadmap entry without an open plan is taken through `/grill --self-rule` and `/plan --self-rule` while the other plans' steps go on; a round of the six kinds or a stop of `/plan` blocks only that entry; the run ends when no open plan has an unblocked step and no next entry can be taken (the user).
- D27 the recurring-findings pass and the night rule across plans (2026-10-05): (a) the recurring-findings pass stays per plan; the night rule's cut-off holds every agent of the session and is written into every open plan's state file (the user).
- D28 the invocations that run several plans (2026-10-05): (a) `/plan-orchestration` with no entry, and `continue the plan`, run every open plan; `/plan-orchestration <entry>` runs that plan alone; `/ordo-help` with no entry also prints each open plan's position (the user).
- D29 record as ADR? (2026-10-05): (a) three records, status `proposed`: 0010 (D16), 0011 (D17) and 0012 (D19) (the user).
- D30 the roadmap diff of entry 2.I (2026-10-05): (a) the gate's "with a third step in flight beside them:" becomes "with a third step in flight beside them and steps of both plans in flight at the same time:"; the goal and the waits-on line unchanged (the user).
- Open item A (2026-10-05): the step list as drafted, 3 steps, which opens the plan (the user).

## Agents

Each agent a plan skill started for this plan has one bullet, with its agent id, its role and the model the runner served it; `/land` writes a step's agents at its booking and when it takes a step back out of main, `/grill` writes its lookup agents, `/spec` writes a brief-check agent stopped for another model, and `/plan` copies the bullets of a rulings file.

- a3d2aab3380f2928e: grill lookup, claude-opus-5-5
- a8617f9a43650cc22: grill lookup, claude-opus-5-5

## Blocked, and by what

- 1: waits on roadmap entries 2.F and 2.H, which the roadmap's Waits on line names beside the closed 2.E; a moment that has not come.

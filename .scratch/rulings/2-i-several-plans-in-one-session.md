# Rulings: 2.I Several plans in one session

- Decision 2 (2026-10-05): in entry 2.I's gate, the one report is checked by a fresh reviewer agent against the two plans' ledgers in place of the user's review, and `docs/dev/change-standard.md`'s gate sentence allows a fresh reviewer agent's review where the user rules so for a roadmap entry (the user).
- D1 goal part, every open plan in one session (2026-10-05): (a) kept as the entry writes it: "`plan-orchestration` runs every open plan in one session" (self-rule).
- D2 goal part, the roadmap's order (2026-10-05): (a) kept as the entry writes it: "it takes the plans in the roadmap's order" (self-rule).
- D3 goal part, paths compared across plans (2026-10-05): (a) kept as the entry writes it: "`spec` compares a step's paths with the steps in flight of every open plan" (self-rule).
- D4 goal part, one limit across plans (2026-10-05): (a) kept as the entry writes it: "one limit on steps in flight holds across all plans" (self-rule).
- D5 goal part, landings one at a time across plans (2026-10-05): (a) kept as the entry writes it: "landings are one at a time across all plans" (self-rule).
- D6 goal part, one report (2026-10-05): (a) kept as the entry writes it: "one report lists each plan's position and open items" (self-rule).
- D7 goal part, the current verify list (2026-10-05): (a) kept as the entry writes it: "every open plan runs the verify list the verification page holds now: a command added to the page reaches each open plan before its next step is checked or landed, never only the plan that added it" (self-rule).
- D8 gate part, one real run over two plans sharing a file (2026-10-05): (b) the gate part reads "one real run over two open plans whose next steps change the same file, with a third step in flight beside them and steps of both plans in flight at the same time" (self-rule).
- D9 gate part, the first plan in roadmap order starts (2026-10-05): (a) kept as the entry writes it: "the run starts with the plan that comes first in the roadmap" (self-rule).
- D10 gate part, the second plan's step waits (2026-10-05): (a) kept as the entry writes it: "the second plan's step waits until the first plan's step has landed" (self-rule).
- D11 gate part, the limit never exceeded (2026-10-05): (a) kept as the entry writes it: "the steps in flight never exceed the one limit" (self-rule).
- D12 gate part, no overlapping landings (2026-10-05): (a) kept as the entry writes it: "no two landings overlap" (self-rule).
- D14 gate part, a new test command reaches the other plan (2026-10-05): (a) kept as the entry writes it: "a test command added to the verification page by one plan's step is run, its line quoted, by the next landing of the other plan" (self-rule).
- D15 where the limit on steps in flight is read (2026-10-05): (a) `.agents/plan.yaml`'s `workers_at_once` is the one limit, read at each pick and counted over the dispatch blocks of every open plan; the configuration block no longer carries the key and `/plan` stops copying it (self-rule).
- D16 how each plan's verify list stays equal to the verification page (2026-10-05): (a) `/spec` at its preflight and `/land` before it runs the verify list compare the plan's verify list with the verification page's commands, copied as `/plan` Steps 4 copies them, and on a difference rewrite the list in the state file and name the change in the brief or the booking; no script (self-rule).
- D17 where the steps in flight of every plan are recorded (2026-10-05): (a) each plan keeps its own dispatch block, and the skills read the dispatch blocks of every open plan to count, compare paths and resume (self-rule).
- D18 worktree and branch names across plans (2026-10-05): (a) every step's worktree is `<worktree_root>/<slug>-<step>` and its branch `<slug>-<step>`, the slug of its plan's ledger folder, recorded in the dispatch entry's `worktree` (self-rule).
- D19 commits that cannot take another plan's staged landing (2026-10-05): (a) every commit a skill makes on main names its paths, `git commit -m <message> -- <path> ...`, the landing commit its paths from `git diff --cached --name-only`; and a landing runs from its cherry-pick to its commit before the session makes any other commit or starts any other skill (self-rule).
- D20 which plan's commit carries a record (2026-10-05): (a) a resume-point commit carries the session's records under its own plan's ledger folder, and the choices file when a choice of that plan changed it; another plan's records wait for its next resume point, and a session that stops commits every plan's records (self-rule).
- D21 the order steps of several plans are picked in (2026-10-05): (a) each free slot takes the next unblocked step of the earliest plan in roadmap order that has one, each pair with the steps in flight judged under "Two steps in flight" (self-rule).
- D22 the rules of two steps in flight across plans (2026-10-05): (a) every rule of "Two steps in flight" holds for a pair from two plans as for a pair from one, `shared_paths:` naming the other step's plan and step, and a step that touches a configuration file or a rule file runs alone across all plans (self-rule).
- D23 the scope of a pause (2026-10-05): (a) a pause holds every open plan unless the user names the plans it holds, and it is written in the position line of each plan it holds (self-rule).
- D24 the shape of the one report (2026-10-05): (a) the orchestrator's report opens with one position line per open plan in roadmap order, each followed by that plan's open items verbatim, then the steps landed since the loop began grouped by plan; the landing report stays one per step in its plan's ledger (self-rule).
- D25 what a plan's state file describes after another plan's commit (2026-10-05): (a) a plan's state file describes that plan as of its own last resume point, and a commit of one plan rewrites no other plan's state file (self-rule).
- D26 next-entry mode while other plans are open (2026-10-05): (a) after a closing, the next roadmap entry without an open plan is taken through `/grill --self-rule` and `/plan --self-rule` while the other plans' steps go on; a round of the six kinds or a stop of `/plan` blocks only that entry; the run ends when no open plan has an unblocked step and no next entry can be taken (self-rule).
- D27 the recurring-findings pass and the night rule across plans (2026-10-05): (a) the recurring-findings pass stays per plan; the night rule's cut-off holds every agent of the session and is written into every open plan's state file (self-rule).
- D28 the invocations that run several plans (2026-10-05): (a) `/plan-orchestration` with no entry, and `continue the plan`, run every open plan; `/plan-orchestration <entry>` runs that plan alone; `/ordo-help` with no entry also prints each open plan's position (self-rule).
- D29 record as ADR? (2026-10-05): (a) three records, status `proposed`: 0010 (D16), 0011 (D17) and 0012 (D19) (self-rule).
- D30 the roadmap diff of entry 2.I (2026-10-05): (a) the gate's "with a third step in flight beside them:" becomes "with a third step in flight beside them and steps of both plans in flight at the same time:"; the goal and the waits-on line unchanged (self-rule).

## Agents

Each lookup agent `/grill 2.I` started has one bullet, with its agent id, its role and the model the runner served it.

- a3d2aab3380f2928e: grill lookup, claude-opus-5-5
- a8617f9a43650cc22: grill lookup, claude-opus-5-5

# Choices taken under self-rule

Each choice the orchestrator took under self-rule waits here for the user's review, grouped by roadmap entry. The user agrees with a choice by typing `C<n> Agree`, or replaces it by typing `C<n> => <ruling>`, in any session on the repository. A reviewed choice leaves this file.

Last number: C33

# Entry 2.I Several plans in one session

## C5. goal part, every open plan in one session (2026-10-05)

Raised by `/grill 2.I --self-rule` as D1.

- (a) keep the goal part as the entry writes it: "`plan-orchestration` runs every open plan in one session". Pro: the session uses the worker slots `workers_at_once` gives across plans, which today sit idle while one plan waits on the user (`skills/plan-orchestration/SKILL.md:52-54`). Con: none found.
- (b) drop it. Pro: less to build. Con: the entry's goal is gone.

Industry: a Buildkite concurrency group "becomes available to all Pipelines in that organization", one limit for every pipeline (https://buildkite.com/docs/pipelines/configure/workflows/controlling-concurrency); a Jenkins lockable resource "exists once and has an unique name" for every job (https://plugins.jenkins.io/lockable-resources/); GitHub Actions `max-parallel` limits the jobs of one matrix of one workflow only (https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/running-variations-of-jobs-in-a-workflow).

Recommend a: the session uses the worker slots `workers_at_once` gives across plans, which today sit idle while one plan waits on the user (`skills/plan-orchestration/SKILL.md:52-54`).

Lazy option: (b), which leaves that part of the entry unbuilt.

Taken: (a) kept as the entry writes it: "`plan-orchestration` runs every open plan in one session"
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:4` (D1 goal part, every open plan in one session)
Builds on it: none

## C6. goal part, the roadmap's order (2026-10-05)

Raised by `/grill 2.I --self-rule` as D2.

- (a) keep the goal part as the entry writes it: "it takes the plans in the roadmap's order". Pro: the roadmap's order is the order the user set, and it puts the plan others wait on first. Con: none found.
- (b) drop it. Pro: less to build. Con: plans would be picked with no order the user set.

Industry: Buildkite serves jobs waiting on a concurrency group "by their scheduling timestamp, from oldest to newest" by default (https://buildkite.com/docs/pipelines/configure/workflows/controlling-concurrency); GitHub merge queue tests each change behind those "ahead of it in the queue" (https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/configuring-pull-request-merges/managing-a-merge-queue).

Recommend a: the roadmap's order is the order the user set, and it puts the plan others wait on first.

Lazy option: (b), which leaves that part of the entry unbuilt.

Taken: (a) kept as the entry writes it: "it takes the plans in the roadmap's order"
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:5` (D2 goal part, the roadmap's order)
Builds on it: none

## C7. goal part, paths compared across plans (2026-10-05)

Raised by `/grill 2.I --self-rule` as D3.

- (a) keep the goal part as the entry writes it: "`spec` compares a step's paths with the steps in flight of every open plan". Pro: two plans changing one file are seen before both are built; today `/spec` reads only its own plan's dispatch block (`skills/spec/SKILL.md:144`). Con: none found.
- (b) drop it. Pro: less to build. Con: a clash between plans is first seen as a conflict at landing.

Industry: GitHub merge queue tests each pull request on "changes from the target branch...as well as changes from pull requests ahead of it in the queue" and removes a failing one (https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/configuring-pull-request-merges/managing-a-merge-queue); bors-ng merges only what it tested, so main "contains the exact contents that were just tested, bit-for-bit" (https://github.com/bors-ng/bors-ng); Zuul tests a change with "change A as well" when A is ahead of it (https://zuul-ci.org/docs/zuul/latest/gating.html).

Recommend a: two plans changing one file are seen before both are built; today `/spec` reads only its own plan's dispatch block (`skills/spec/SKILL.md:144`).

Lazy option: (b), which leaves that part of the entry unbuilt.

Taken: (a) kept as the entry writes it: "`spec` compares a step's paths with the steps in flight of every open plan"
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:6` (D3 goal part, paths compared across plans)
Builds on it: none

## C8. goal part, one limit across plans (2026-10-05)

Raised by `/grill 2.I --self-rule` as D4.

- (a) keep the goal part as the entry writes it: "one limit on steps in flight holds across all plans". Pro: the user sets how many agents run at once in one place, as Buildkite and Jenkins share one limit across pipelines. Con: none found.
- (b) drop it. Pro: less to build. Con: three plans at `workers_at_once: 3` each could run nine builders.

Industry: a Buildkite concurrency group "becomes available to all Pipelines in that organization", one limit for every pipeline (https://buildkite.com/docs/pipelines/configure/workflows/controlling-concurrency); a Jenkins lockable resource "exists once and has an unique name" for every job (https://plugins.jenkins.io/lockable-resources/); GitHub Actions `max-parallel` limits the jobs of one matrix of one workflow only (https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/running-variations-of-jobs-in-a-workflow).

Recommend a: the user sets how many agents run at once in one place, as Buildkite and Jenkins share one limit across pipelines.

Lazy option: (b), which leaves that part of the entry unbuilt.

Taken: (a) kept as the entry writes it: "one limit on steps in flight holds across all plans"
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:7` (D4 goal part, one limit across plans)
Builds on it: none

## C9. goal part, landings one at a time across plans (2026-10-05)

Raised by `/grill 2.I --self-rule` as D5.

- (a) keep the goal part as the entry writes it: "landings are one at a time across all plans". Pro: each landing is checked on the head it lands on, as a merge queue tests a change on the changes ahead of it. Con: none found.
- (b) drop it. Pro: less to build. Con: two landings staged on main at once mix their changes in one index.

Industry: GitHub merge queue tests each pull request on "changes from the target branch...as well as changes from pull requests ahead of it in the queue" and removes a failing one (https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/configuring-pull-request-merges/managing-a-merge-queue); bors-ng merges only what it tested, so main "contains the exact contents that were just tested, bit-for-bit" (https://github.com/bors-ng/bors-ng); Zuul tests a change with "change A as well" when A is ahead of it (https://zuul-ci.org/docs/zuul/latest/gating.html).

Recommend a: each landing is checked on the head it lands on, as a merge queue tests a change on the changes ahead of it.

Lazy option: (b), which leaves that part of the entry unbuilt.

Taken: (a) kept as the entry writes it: "landings are one at a time across all plans"
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:8` (D5 goal part, landings one at a time across plans)
Builds on it: none

## C10. goal part, one report (2026-10-05)

Raised by `/grill 2.I --self-rule` as D6.

- (a) keep the goal part as the entry writes it: "one report lists each plan's position and open items". Pro: the user reads every plan's position and every open item in one place. Con: none found.
- (b) drop it. Pro: less to build. Con: the user has to open each plan's state file.

Industry: none of the tools fetched in this session (GitHub merge queue, bors-ng, Zuul, GitHub Actions, Buildkite, GitLab, Jenkins) defines a report over several pipelines that the user rules from; the options are weighed on this repository's goals.

Recommend a: the user reads every plan's position and every open item in one place.

Lazy option: (b), which leaves that part of the entry unbuilt.

Taken: (a) kept as the entry writes it: "one report lists each plan's position and open items"
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:9` (D6 goal part, one report)
Builds on it: none

## C11. goal part, the current verify list (2026-10-05)

Raised by `/grill 2.I --self-rule` as D7.

- (a) keep the goal part as the entry writes it: "every open plan runs the verify list the verification page holds now: a command added to the page reaches each open plan before its next step is checked or landed, never only the plan that added it". Pro: a landing is held to the checks main holds now; today all three open plans lacked `plan_cost.test.sh` (`comm` of `docs/dev/building.md` against each state file, 2026-10-05). Con: none found.
- (b) drop it. Pro: less to build. Con: each plan keeps the list it was opened with, and a test added later never runs at its landings.

Industry: GitHub required status checks are the protected branch's rule, so "all required status checks must pass before collaborators can merge" as the rule stands at merge time (https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches); in Zuul, "as soon as a change containing a Zuul configuration change merges ... the new configuration takes effect immediately" for every change tested after it (https://zuul-ci.org/docs/zuul/latest/project-config.html).

Recommend a: a landing is held to the checks main holds now; today all three open plans lacked `plan_cost.test.sh` (`comm` of `docs/dev/building.md` against each state file, 2026-10-05).

Lazy option: (b), which leaves that part of the entry unbuilt.

Taken: (a) kept as the entry writes it: "every open plan runs the verify list the verification page holds now: a command added to the page reaches each open plan before its next step is checked or landed, never only the plan that added it"
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:10` (D7 goal part, the current verify list)
Builds on it: none

## C12. gate part, one real run over two plans sharing a file (2026-10-05)

Raised by `/grill 2.I --self-rule` as D8.

- (a) keep the gate part as the entry writes it: "one real run over two open plans whose next steps change the same file, with a third step in flight beside them". Pro: no change to the roadmap. Con: no condition of the gate needs steps of two plans in flight at the same moment, so a session that still runs one plan at a time, as `skills/plan-orchestration/SKILL.md:52-54` has it, passes every condition but the report's.
- (b) change it to "one real run over two open plans whose next steps change the same file, with a third step in flight beside them and steps of both plans in flight at the same time". Pro: the run cannot pass while the session runs one plan at a time, so it proves goal part D1. Con: the run's scratch repository must give the second plan a step that shares no file with the first plan's.

Industry: a Buildkite concurrency group "becomes available to all Pipelines in that organization", one limit for every pipeline (https://buildkite.com/docs/pipelines/configure/workflows/controlling-concurrency); a Jenkins lockable resource "exists once and has an unique name" for every job (https://plugins.jenkins.io/lockable-resources/); GitHub Actions `max-parallel` limits the jobs of one matrix of one workflow only (https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/running-variations-of-jobs-in-a-workflow).

Recommend b: it is the one condition that separates several plans in one session from one plan at a time.

Lazy option: (a), which keeps a gate that passes without its goal.

Taken: (b) the gate part reads "one real run over two open plans whose next steps change the same file, with a third step in flight beside them and steps of both plans in flight at the same time"
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:11` (D8 gate part, one real run over two plans sharing a file)
Builds on it: none

## C13. gate part, the first plan in roadmap order starts (2026-10-05)

Raised by `/grill 2.I --self-rule` as D9.

- (a) keep the gate part as the entry writes it: "the run starts with the plan that comes first in the roadmap". Pro: it checks goal part D2 in the run. Con: none found.
- (b) drop it. Pro: less to build. Con: D2 goes unchecked.

Industry: Buildkite serves jobs waiting on a concurrency group "by their scheduling timestamp, from oldest to newest" by default (https://buildkite.com/docs/pipelines/configure/workflows/controlling-concurrency); GitHub merge queue tests each change behind those "ahead of it in the queue" (https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/configuring-pull-request-merges/managing-a-merge-queue).

Recommend a: it checks goal part D2 in the run.

Lazy option: (b), which leaves that part of the entry unbuilt.

Taken: (a) kept as the entry writes it: "the run starts with the plan that comes first in the roadmap"
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:12` (D9 gate part, the first plan in roadmap order starts)
Builds on it: none

## C14. gate part, the second plan's step waits (2026-10-05)

Raised by `/grill 2.I --self-rule` as D10.

- (a) keep the gate part as the entry writes it: "the second plan's step waits until the first plan's step has landed". Pro: it checks goal parts D3 and D5 on a shared file. Con: none found.
- (b) drop it. Pro: less to build. Con: a shared file between plans goes unchecked.

Industry: GitHub merge queue tests each pull request on "changes from the target branch...as well as changes from pull requests ahead of it in the queue" and removes a failing one (https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/configuring-pull-request-merges/managing-a-merge-queue); bors-ng merges only what it tested, so main "contains the exact contents that were just tested, bit-for-bit" (https://github.com/bors-ng/bors-ng); Zuul tests a change with "change A as well" when A is ahead of it (https://zuul-ci.org/docs/zuul/latest/gating.html).

Recommend a: it checks goal parts D3 and D5 on a shared file.

Lazy option: (b), which leaves that part of the entry unbuilt.

Taken: (a) kept as the entry writes it: "the second plan's step waits until the first plan's step has landed"
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:13` (D10 gate part, the second plan's step waits)
Builds on it: none

## C15. gate part, the limit never exceeded (2026-10-05)

Raised by `/grill 2.I --self-rule` as D11.

- (a) keep the gate part as the entry writes it: "the steps in flight never exceed the one limit". Pro: it checks goal part D4. Con: none found.
- (b) drop it. Pro: less to build. Con: D4 goes unchecked.

Industry: a Buildkite concurrency group "becomes available to all Pipelines in that organization", one limit for every pipeline (https://buildkite.com/docs/pipelines/configure/workflows/controlling-concurrency); a Jenkins lockable resource "exists once and has an unique name" for every job (https://plugins.jenkins.io/lockable-resources/); GitHub Actions `max-parallel` limits the jobs of one matrix of one workflow only (https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/running-variations-of-jobs-in-a-workflow).

Recommend a: it checks goal part D4.

Lazy option: (b), which leaves that part of the entry unbuilt.

Taken: (a) kept as the entry writes it: "the steps in flight never exceed the one limit"
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:14` (D11 gate part, the limit never exceeded)
Builds on it: none

## C16. gate part, no overlapping landings (2026-10-05)

Raised by `/grill 2.I --self-rule` as D12.

- (a) keep the gate part as the entry writes it: "no two landings overlap". Pro: it checks goal part D5. Con: none found.
- (b) drop it. Pro: less to build. Con: D5 goes unchecked.

Industry: GitHub merge queue tests each pull request on "changes from the target branch...as well as changes from pull requests ahead of it in the queue" and removes a failing one (https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/configuring-pull-request-merges/managing-a-merge-queue); bors-ng merges only what it tested, so main "contains the exact contents that were just tested, bit-for-bit" (https://github.com/bors-ng/bors-ng); Zuul tests a change with "change A as well" when A is ahead of it (https://zuul-ci.org/docs/zuul/latest/gating.html).

Recommend a: it checks goal part D5.

Lazy option: (b), which leaves that part of the entry unbuilt.

Taken: (a) kept as the entry writes it: "no two landings overlap"
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:15` (D12 gate part, no overlapping landings)
Builds on it: none

## C17. gate part, a new test command reaches the other plan (2026-10-05)

Raised by `/grill 2.I --self-rule` as D14.

- (a) keep the gate part as the entry writes it: "a test command added to the verification page by one plan's step is run, its line quoted, by the next landing of the other plan". Pro: it checks goal part D7 on the case that went wrong, a test added by one plan. Con: none found.
- (b) drop it. Pro: less to build. Con: D7 goes unchecked.

Industry: GitHub required status checks are the protected branch's rule, so "all required status checks must pass before collaborators can merge" as the rule stands at merge time (https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches); in Zuul, "as soon as a change containing a Zuul configuration change merges ... the new configuration takes effect immediately" for every change tested after it (https://zuul-ci.org/docs/zuul/latest/project-config.html).

Recommend a: it checks goal part D7 on the case that went wrong, a test added by one plan.

Lazy option: (b), which leaves that part of the entry unbuilt.

Taken: (a) kept as the entry writes it: "a test command added to the verification page by one plan's step is run, its line quoted, by the next landing of the other plan"
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:16` (D14 gate part, a new test command reaches the other plan)
Builds on it: none

## C18. where the limit on steps in flight is read (2026-10-05)

Raised by `/grill 2.I --self-rule` as D15.

- (a) `.agents/plan.yaml`'s `workers_at_once`, read by the orchestrator at each pick, counted over the dispatch blocks of every open plan; the configuration block no longer carries the key, and `/plan` stops copying it. Pro: one value, set where the user sets every other project specific; a change to it applies at the next pick. Con: every skill and page that reads the key from the block changes (the lookup found `plan-orchestration` :55, :93, :262, `spec` :190-191 and :372, the state template :21 and :34).
- (b) the smallest `workers_at_once` among the open plans' configuration blocks. Pro: no key moves. Con: a value is copied at each plan's opening, so the user's change to `.agents/plan.yaml` reaches no open plan; a plan opened long ago sets the limit.
- (c) the first plan's block, in roadmap order. Pro: no key moves. Con: the limit changes when that plan closes, with nothing the user did.

Industry: a Buildkite concurrency group "becomes available to all Pipelines in that organization", one limit for every pipeline (https://buildkite.com/docs/pipelines/configure/workflows/controlling-concurrency); a Jenkins lockable resource "exists once and has an unique name" for every job (https://plugins.jenkins.io/lockable-resources/); GitHub Actions `max-parallel` limits the jobs of one matrix of one workflow only (https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/running-variations-of-jobs-in-a-workflow).

Recommend a: it is the one limit goal part D4 names, read from the one file the user edits, as Buildkite and Jenkins hold one shared limit.

Lazy option: (b), which keeps the copies that drift and leaves the user's edit without effect on open plans.

Taken: (a) `.agents/plan.yaml`'s `workers_at_once` is the one limit, read at each pick and counted over the dispatch blocks of every open plan; the configuration block no longer carries the key and `/plan` stops copying it
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:17` (D15 where the limit on steps in flight is read)
Builds on it: none

## C19. how each plan's verify list stays equal to the verification page (2026-10-05)

Raised by `/grill 2.I --self-rule` as D16.

- (a) `/spec` at its preflight and `/land` before it runs the verify list compare the plan's verify list with the verification page's commands, copied as `/plan` Steps 4 copies them, and on a difference rewrite the list in the state file, naming the change in the brief or the booking; no script. Pro: every change to the page reaches every open plan before its next preparation and its next landing, whatever made the change. Con: two more reads of the page per step.
- (b) the landing of a step that changes the verification page also rewrites the verify list of every open plan. Pro: one write per change. Con: an edit of the page outside a plan's step reaches no plan, as `132f999` landed under plan 2.E.A while 2.F, 2.G and 2.H stayed without its test.
- (c) `checks.sh` reads the verification page itself, and the state file holds no list. Pro: one list only. Con: `checks.sh` would parse a page whose form each repository sets, and its filters live on another page (`docs/dev/change-standard.md`, "Commands and their filters"); it changes what a script computes, which needs the user's approval (kind 3).

Industry: GitHub required status checks are the protected branch's rule, so "all required status checks must pass before collaborators can merge" as the rule stands at merge time (https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches); in Zuul, "as soon as a change containing a Zuul configuration change merges ... the new configuration takes effect immediately" for every change tested after it (https://zuul-ci.org/docs/zuul/latest/project-config.html).

Recommend a: a landing is held to the checks main holds now, as a merge is held to the protected branch's rule as it stands, and the compare is done by the session's reading with no new script.

Lazy option: (b), which leaves the drift that edits outside a plan cause.

Taken: (a) `/spec` at its preflight and `/land` before it runs the verify list compare the plan's verify list with the verification page's commands, copied as `/plan` Steps 4 copies them, and on a difference rewrite the list in the state file and name the change in the brief or the booking; no script
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:18` (D16 how each plan's verify list stays equal to the verification page)
Builds on it: none

## C20. where the steps in flight of every plan are recorded (2026-10-05)

Raised by `/grill 2.I --self-rule` as D17.

- (a) each plan keeps its own dispatch block in its own state file, and the skills read the dispatch blocks of every open plan to count, compare paths and resume. Pro: a plan's ledger stays the whole handoff of that plan; nothing new to keep equal. Con: each count reads several files.
- (b) one session file at the ledger root lists every step in flight of every plan. Pro: one file to read. Con: a second record of each dispatch entry, which drifts from the plan's own, and a file that belongs to no plan when a plan is archived.

Industry: none of the tools fetched in this session (GitHub merge queue, bors-ng, Zuul, GitHub Actions, Buildkite, GitLab, Jenkins) keeps state for several pipelines in a file of their own; each tool holds one queue in its server; the options are weighed on this repository's goals.

Recommend a: the ledger is the handoff (`skills/plan-orchestration/SKILL.md`, "Resuming, and handing the plan over"), and one record per dispatch entry cannot drift.

Lazy option: none: (b) costs more, and (a) leaves no work undone.

Taken: (a) each plan keeps its own dispatch block, and the skills read the dispatch blocks of every open plan to count, compare paths and resume
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:19` (D17 where the steps in flight of every plan are recorded)
Builds on it: none

## C21. worktree and branch names across plans (2026-10-05)

Raised by `/grill 2.I --self-rule` as D18.

- (a) every step's worktree is `<worktree_root>/<slug>-<step>` and its branch `<slug>-<step>`, the slug of its plan's ledger folder, recorded in the dispatch entry's `worktree`. Pro: no two plans' steps can collide; `land.sh` already accepts such a name (`skills/land/templates/land.sh:44`, :101-105). Con: longer names.
- (b) the slug only when two plans in flight hold the same step id. Pro: names unchanged in the common case. Con: two rules for one name, and a rename when a second plan appears.
- (c) a step waits while another plan's step of the same id is in flight. Pro: no rename. Con: a wait no merge needs; plans 2.F and 2.G both have a step `2a` today (`.scratch/2-f-diagnose/plan.md:23`, `.scratch/2-g-git-guard/plan.md:22`).

Industry: none of the tools fetched in this session (GitHub merge queue, bors-ng, Zuul, GitHub Actions, Buildkite, GitLab, Jenkins) names a branch per pipeline step; GitHub merge queue makes its own temporary branches; the options are weighed on this repository's goals.

Recommend a: one rule ends the collision `skills/spec/SKILL.md:171` has today for every pair of plans.

Lazy option: (c), which turns a naming defect into waiting.

Taken: (a) every step's worktree is `<worktree_root>/<slug>-<step>` and its branch `<slug>-<step>`, the slug of its plan's ledger folder, recorded in the dispatch entry's `worktree`
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:20` (D18 worktree and branch names across plans)
Builds on it: none

## C22. commits that cannot take another plan's staged landing (2026-10-05)

Raised by `/grill 2.I --self-rule` as D19.

- (a) every commit a skill makes on main names its paths in the commit command, `git commit -m <message> -- <path> ...`, the landing commit its paths from `git diff --cached --name-only`; and a landing runs from its cherry-pick to its commit before the session makes any other commit or starts any other skill. Pro: a commit records only what it names, whatever is staged, and the order rule keeps `/spec`'s "nothing staged" preflight true. Con: every skill text that commits changes its command.
- (b) only the order rule. Pro: fewer texts change. Con: a commit made out of order still takes the staged landing, with nothing to stop it.
- (c) only the pathspec commits. Pro: the coupling is gone from every commit. Con: `/spec` of another plan, started while a landing is staged, refuses on its preflight.

Industry: with paths, `git commit` "will ignore changes staged in the index, and instead record the current content of the listed files" (https://git-scm.com/docs/git-commit); this session's scratch run showed `git add -- ledger.md` then `git commit` also committing a staged `step.txt`, and `git commit -- ledger.md` leaving it staged.

Recommend a: the pathspec ends the coupling the scratch run showed, and the order rule keeps the preflights that read the index valid.

Lazy option: (b), which leaves the coupling and relies on order alone.

Taken: (a) every commit a skill makes on main names its paths, `git commit -m <message> -- <path> ...`, the landing commit its paths from `git diff --cached --name-only`; and a landing runs from its cherry-pick to its commit before the session makes any other commit or starts any other skill
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:21` (D19 commits that cannot take another plan's staged landing)
Builds on it: none

## C23. which plan's commit carries a record (2026-10-05)

Raised by `/grill 2.I --self-rule` as D20.

- (a) a resume-point commit carries the session's records under its own plan's ledger folder, and the choices file when a choice of that plan changed it; another plan's records wait for that plan's next resume point, and a session that stops commits every plan's records. Pro: each plan's history holds only that plan's records. Con: a record of one plan can stay on disk while another plan commits.
- (b) every resume-point commit carries every record the session wrote, of every plan. Pro: nothing waits on disk. Con: a plan's landing commit carries another plan's records, which `/land`'s `git status` check then reads as its own (`skills/land/SKILL.md:128`).

Industry: none of the tools fetched in this session (GitHub merge queue, bors-ng, Zuul, GitHub Actions, Buildkite, GitLab, Jenkins) keeps per-pipeline records in the repository; the options are weighed on this repository's goals.

Recommend a: a plan's commits describe that plan, and the handover rule still leaves no record uncommitted.

Lazy option: none: both cost the same.

Taken: (a) a resume-point commit carries the session's records under its own plan's ledger folder, and the choices file when a choice of that plan changed it; another plan's records wait for its next resume point, and a session that stops commits every plan's records
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:22` (D20 which plan's commit carries a record)
Builds on it: none

## C24. the order steps of several plans are picked in (2026-10-05)

Raised by `/grill 2.I --self-rule` as D21.

- (a) each free slot takes the next unblocked step of the earliest plan in roadmap order that has one, each pair with the steps in flight judged under "Two steps in flight". Pro: the plan others wait on moves first, and a plan waiting on the user leaves its slots to the next. Con: a later plan may wait while an earlier one fills the slots.
- (b) round robin over the plans. Pro: every plan moves. Con: an earlier plan the roadmap puts first is slowed for one the user put later.
- (c) the step that became ready first. Pro: no plan starves. Con: it ignores the order the user set.

Industry: Buildkite serves jobs waiting on a concurrency group "by their scheduling timestamp, from oldest to newest" by default (https://buildkite.com/docs/pipelines/configure/workflows/controlling-concurrency); GitHub merge queue tests each change behind those "ahead of it in the queue" (https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/configuring-pull-request-merges/managing-a-merge-queue).

Recommend a: it is goal part D2 applied to each slot, and the gate part D9 checks it.

Lazy option: none: the options cost the same.

Taken: (a) each free slot takes the next unblocked step of the earliest plan in roadmap order that has one, each pair with the steps in flight judged under "Two steps in flight"
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:23` (D21 the order steps of several plans are picked in)
Builds on it: none

## C25. the rules of two steps in flight across plans (2026-10-05)

Raised by `/grill 2.I --self-rule` as D22.

- (a) every rule of "Two steps in flight" holds for a pair from two plans as for a pair from one: the pair's merge judged, `shared_paths:` naming the other step's plan and step, a step that touches a configuration file or a rule file running alone across all plans, a later step dispatched only after the earlier one's launch commit, landings in the order the steps are verified, and a file both changed sending the later step back through Steps 6. Pro: one set of rules, already proven within a plan. Con: more texts name the other plan.
- (b) only the path comparison and the landing order across plans. Pro: fewer changes. Con: a rule file changed by one plan while another plan's step is built under the old rule.

Industry: GitHub merge queue tests each pull request on "changes from the target branch...as well as changes from pull requests ahead of it in the queue" and removes a failing one (https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/configuring-pull-request-merges/managing-a-merge-queue); bors-ng merges only what it tested, so main "contains the exact contents that were just tested, bit-for-bit" (https://github.com/bors-ng/bors-ng); Zuul tests a change with "change A as well" when A is ahead of it (https://zuul-ci.org/docs/zuul/latest/gating.html).

Recommend a: a step does not change because its neighbour belongs to another plan; the rules exist for the pair.

Lazy option: (b), which leaves the other rules within one plan only.

Taken: (a) every rule of "Two steps in flight" holds for a pair from two plans as for a pair from one, `shared_paths:` naming the other step's plan and step, and a step that touches a configuration file or a rule file runs alone across all plans
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:24` (D22 the rules of two steps in flight across plans)
Builds on it: none

## C26. the scope of a pause (2026-10-05)

Raised by `/grill 2.I --self-rule` as D23.

- (a) a pause holds every open plan unless the user names the plans it holds, and it is written in the position line of each plan it holds. Pro: the user stops all agents with one word, and can still hold one plan. Con: the user names plans to hold one.
- (b) a pause holds the plan named, every plan when none is named, recorded in the session only. Pro: simple. Con: a session taking over cannot see it, against "Resuming, and handing the plan over".
- (c) a pause holds one plan only. Pro: precise. Con: stopping everything takes one pause per plan.

Industry: none of the tools fetched in this session (GitHub merge queue, bors-ng, Zuul, GitHub Actions, Buildkite, GitLab, Jenkins) defines a pause of an orchestrator; the options are weighed on this repository's goals.

Recommend a: the text leaves the scope open today (lookup: `plan-terms.md:68` against `orchestrator-state.md:69`), and a pause recorded in each state file survives a handover.

Lazy option: (c), which makes the user repeat the pause.

Taken: (a) a pause holds every open plan unless the user names the plans it holds, and it is written in the position line of each plan it holds
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:25` (D23 the scope of a pause)
Builds on it: none

## C27. the shape of the one report (2026-10-05)

Raised by `/grill 2.I --self-rule` as D24.

- (a) the orchestrator's report opens with one position line per open plan in roadmap order, each followed by that plan's open items verbatim; then the steps landed since the loop began, grouped by plan with each landing report's path; the landing report file stays one per step in its plan's ledger. Pro: the user reads every plan's state in one message; each ledger keeps its own reports. Con: a longer report.
- (b) one report file at the ledger root. Pro: one file. Con: a file of no plan, which no archive keeps.

Industry: none of the tools fetched in this session (GitHub merge queue, bors-ng, Zuul, GitHub Actions, Buildkite, GitLab, Jenkins) defines such a report; the options are weighed on this repository's goals.

Recommend a: it is goal part D6 with each plan's records kept in its own ledger.

Lazy option: none: (b) costs as much.

Taken: (a) the orchestrator's report opens with one position line per open plan in roadmap order, each followed by that plan's open items verbatim, then the steps landed since the loop began grouped by plan; the landing report stays one per step in its plan's ledger
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:26` (D24 the shape of the one report)
Builds on it: none

## C28. what a plan's state file describes after another plan's commit (2026-10-05)

Raised by `/grill 2.I --self-rule` as D25.

- (a) a plan's state file describes that plan as of its own last resume point; the rule "main's head always carries a state file that describes main's head" is read per plan, and a commit of one plan rewrites no other plan's state file. Pro: true for every plan at every head, since another plan's commit changes nothing the state file records. Con: the sentence is rewritten in `plan-orchestration` and `land`.
- (b) every commit rewrites every open plan's state file. Pro: each state file names main's head. Con: every commit touches every plan's ledger, against D20.

Industry: none of the tools fetched in this session (GitHub merge queue, bors-ng, Zuul, GitHub Actions, Buildkite, GitLab, Jenkins) addresses this; the options are weighed on this repository's goals.

Recommend a: a state file records its plan's dispatch, open items and position, none of which another plan's commit changes.

Lazy option: none: (a) costs less and leaves nothing undone.

Taken: (a) a plan's state file describes that plan as of its own last resume point, and a commit of one plan rewrites no other plan's state file
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:27` (D25 what a plan's state file describes after another plan's commit)
Builds on it: none

## C29. next-entry mode while other plans are open (2026-10-05)

Raised by `/grill 2.I --self-rule` as D26.

- (a) after a closing, the next roadmap entry without an open plan is taken through `/grill --self-rule` and `/plan --self-rule` while the other plans' steps go on; a round of the six kinds or a stop of `/plan` blocks only that entry, as a stop blocks only its step; the run ends when no open plan has an unblocked step and no next entry can be taken. Pro: the slots stay used while one entry waits on the user. Con: the turn may end on a round while builders of other plans run, and their notices resume the loop.
- (b) the next entry is taken only when no other plan has a step in flight. Pro: one thing at a time. Con: the slots idle, which the entry exists to end.

Industry: a Buildkite concurrency group "becomes available to all Pipelines in that organization", one limit for every pipeline (https://buildkite.com/docs/pipelines/configure/workflows/controlling-concurrency); a Jenkins lockable resource "exists once and has an unique name" for every job (https://plugins.jenkins.io/lockable-resources/); GitHub Actions `max-parallel` limits the jobs of one matrix of one workflow only (https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/running-variations-of-jobs-in-a-workflow).

Recommend a: it carries goal part D1 into next-entry mode, where `references/self-rule.md:56` still says "no plan is open then".

Lazy option: (b), which keeps the idle slots.

Taken: (a) after a closing, the next roadmap entry without an open plan is taken through `/grill --self-rule` and `/plan --self-rule` while the other plans' steps go on; a round of the six kinds or a stop of `/plan` blocks only that entry; the run ends when no open plan has an unblocked step and no next entry can be taken
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:28` (D26 next-entry mode while other plans are open)
Builds on it: none

## C30. the recurring-findings pass and the night rule across plans (2026-10-05)

Raised by `/grill 2.I --self-rule` as D27.

- (a) the recurring-findings pass stays per plan, counting its own landed steps and reading its own refuter reports; the night rule's cut-off holds every agent of the session and is written into every open plan's state file. Pro: the pass keeps its record in its plan; a cut-off is a time for the session. Con: a cause spread thinly over plans is found later.
- (b) both across plans. Pro: causes found across plans sooner. Con: the pass's "since the last pass" needs a record outside any plan.
- (c) both per plan. Pro: no change. Con: a cut-off that stops one plan's agents and not another's.

Industry: none of the tools fetched in this session (GitHub merge queue, bors-ng, Zuul, GitHub Actions, Buildkite, GitLab, Jenkins) addresses these; the options are weighed on this repository's goals.

Recommend a: the cut-off is about time and holds the session; the pass reads records each plan keeps.

Lazy option: (c), which leaves agents running past the cut-off.

Taken: (a) the recurring-findings pass stays per plan; the night rule's cut-off holds every agent of the session and is written into every open plan's state file
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:29` (D27 the recurring-findings pass and the night rule across plans)
Builds on it: none

## C31. the invocations that run several plans (2026-10-05)

Raised by `/grill 2.I --self-rule` as D28.

- (a) `/plan-orchestration` with no entry, and `continue the plan`, run every open plan; `/plan-orchestration <entry>` runs that plan alone, as today; `/ordo-help` with no entry also prints each open plan's position. Pro: the form a person runs today keeps its meaning. Con: one more form.
- (b) `/plan-orchestration <entry>` runs every open plan, starting with the entry. Pro: no new form. Con: a run the user meant for one plan dispatches the others.

Industry: none of the tools fetched in this session (GitHub merge queue, bors-ng, Zuul, GitHub Actions, Buildkite, GitLab, Jenkins) addresses the invocation; the options are weighed on this repository's goals.

Recommend a: it adds the run of every plan without changing what a run of one plan does.

Lazy option: none: the options cost the same.

Taken: (a) `/plan-orchestration` with no entry, and `continue the plan`, run every open plan; `/plan-orchestration <entry>` runs that plan alone; `/ordo-help` with no entry also prints each open plan's position
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:30` (D28 the invocations that run several plans)
Builds on it: none

## C32. record as ADR? (2026-10-05)

Raised by `/grill 2.I --self-rule` as D29.

- (a) three records, status `proposed`: `docs/adr/0010-each-plan-s-verify-list-is-kept-equal-to-the-verification-page.md` (D16), `0011-each-plan-keeps-its-own-dispatch-block-read-across-plans.md` (D17) and `0012-every-commit-on-main-names-its-paths.md` (D19). Pro: each decision binds work after the plan closes, is not obvious from the code, and has alternatives rejected. Con: three files.
- (b) D17 only. Pro: fewer files. Con: D16 and D19 bind every later skill change that commits or reads the verify list.
- (c) none. Pro: no files. Con: a later change undoes them without seeing why.

Rule: "A record is kept per decision that is not obvious from the code and binds work after its plan closes" (`docs/adr/README.md`, opening).

Recommend a: D16, D17 and D19 each meet the README's test.

Lazy option: (c), which keeps no reasoning for decisions that bind later work.

Taken: (a) three records, status `proposed`: 0010 (D16), 0011 (D17) and 0012 (D19)
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:31` (D29 record as ADR?)
Builds on it: the record docs/adr/0010-each-plan-s-verify-list-is-kept-equal-to-the-verification-page.md, the record docs/adr/0011-each-plan-keeps-its-own-dispatch-block-read-across-plans.md, the record docs/adr/0012-every-commit-on-main-names-its-paths.md

## C33. the roadmap diff of entry 2.I (2026-10-05)

Raised by `/grill 2.I --self-rule` as D30.

- (a) one change to the gate, from D8: "with a third step in flight beside them:" becomes "with a third step in flight beside them and steps of both plans in flight at the same time:"; the goal and the waits-on line unchanged. Asked of the changed gate, "could this pass without the goal being reached?": no, since a session that runs one plan at a time never has steps of both plans in flight, and each other goal part has its own condition (D9 to D12, the report's check of Decision 2, and D14). Pro: the gate proves goal part D1. Con: none found.
- (b) the same change, and D18 and D19 added to the goal. Pro: the goal names them. Con: the goal grows with how-to that the rulings already carry.

Rule: an entry holds "the goal, the gate and the dependencies only, nothing the user did not ask for" (the `grill` skill's "Steps / Writing what settled" 3, from the `roadmap` skill's Rules).

Recommend a: the roadmap holds the goal and gate only, and the gate then could not pass without the goal.

Lazy option: none: (a) leaves nothing undone, since the rulings carry the design.

Taken: (a) the gate's "with a third step in flight beside them:" becomes "with a third step in flight beside them and steps of both plans in flight at the same time:"; the goal and the waits-on line unchanged
Booked: `.scratch/rulings/2-i-several-plans-in-one-session.md:32` (D30 the roadmap diff of entry 2.I)
Builds on it: the roadmap diff of entry 2.I

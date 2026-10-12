# Choices taken under self-rule

Each choice the orchestrator took under self-rule waits here for the user's review, grouped by roadmap entry. The user agrees with a choice by typing `C<n> Agree`, or replaces it by typing `C<n> => <ruling>`, in any session on the repository. A reviewed choice leaves this file.

Last number: C39

# Entry 2.H session-retro

## C36. The real run reads the window of plan 2.C's own commits (2026-10-12)

Open item Step 4, the window of the real run: `/session-retro 2.C` resolved the window from 2026-09-28T22:51:46+02:00 to 2026-10-06T01:10:44+02:00, since ef9f292 (step 3 of plan 2.1) deleted scripts under 2.C's archived folder. The reader's outputs over it hold 8374595 bytes in 281 parts, the skill's stop "A large output". Plan 2.C's last own commit is 75c987f (2026-09-29T12:04:41+02:00); over the window that ends one second after it, the output holds 730556 bytes in 25 parts.

- Option (a), recommended: run `/session-retro 2026-09-28T22:51:46+02:00 2026-09-29T12:04:42+02:00`, the skill's narrower-window form. Pro: the window holds the sessions of plan 2.C and nothing else, which is what step 4 reviews. Con: none found.
- Option (b): read the whole resolved window, 281 parts. Pro: no session in the window is left out. Con: the window after 2026-09-29 holds the sessions of plans 2.D, 2.E, 2.E.A and 2.1, which step 4 does not review, and their points would be reported as points of 2.C.
- Recommendation: (a), since it is the window of the plan the step names. The lazy option: none; (b) costs more and reads the wrong plans.

Taken: (a)
Booked: `.scratch/2-h-session-retro/plan.md:56` (Open item Step 4, the window of the real run)
Builds on it: 4

## C37. A fix step for the end of a plan's window (2026-10-12)

Open item Step 4, the end of a plan's window: `session-retro` Steps 1 ends a plan's window at the latest commit that touches its folder under either root, so a later plan's commit into an archived folder widens the window to sessions of other plans. The latest commit that touches the plan's `plan.md` or `orchestrator-state.md` gives 75c987f for plan 2.C, its last own commit.

- Option (a), recommended: add step 5, `session-retro` ending a plan's window at the latest commit that touches its `plan.md` or `orchestrator-state.md` under either root, the closing renumbered 6. Pro: every later `/session-retro <entry>` reads the plan's own window. Con: one more step before the closing.
- Option (b): leave the skill as it stands and use the `<start> <end>` form when the window is too wide. Pro: no step. Con: the skill keeps giving a wrong window, and the size stop is the only sign of it.
- Recommendation: (a), a landed part found wrong is a new step ("Steps by part"). The lazy option is (b).

Taken: (a)
Booked: `.scratch/2-h-session-retro/plan.md:57` (Open item Step 4, the end of a plan's window)
Builds on it: 5

## C38. A plan's window ends at its own last commit (2026-10-12)

Open item Step 5, a later plan's commit into a plan's own files: the rule of C37 still widens the windows of plans 1, 2 and 2.A, since plan 2.B's commit 8becbcd rewrote their archived `plan.md` and `orchestrator-state.md`; `/session-retro 1` would end at 2026-09-26T04:49:18+02:00 where plan 1 closed at a866716 (2026-09-23T17:11:54+02:00).

- Option (a): keep C37's rule. Pro: the command stays one `git log`. Con: three plans keep a window that runs into plan 2.B, and the step's purpose clause is false for them.
- Option (b), recommended: the plan's own last commit, the commit that added its `plan.md` under `<archive_root>` or a later commit that touches its `plan.md` or `orchestrator-state.md` and no other plan's. Pro: each of the ten archived plans ends at its own close or its own correction. Con: a loop of a few lines in place of one command.
- Option (c): the commit that moved the folder. Pro: one command. Con: it drops the corrections 75c987f of 2.C and 8ea1b6d of 2.D.
- Recommendation: (b). The lazy option is (a).

Taken: (b)
Booked: `.scratch/2-h-session-retro/plan.md:58` (Open item Step 5, a later plan's commit into a plan's own files)
Builds on it: 5

# Entry 2.I Several plans in one session

## C39. The one limit and the worktree names in the projects form (2026-10-12)

Open item Step 1, the projects form: rulings D15 and D18 name `.agents/plan.yaml`'s `workers_at_once` and the worktree `<worktree_root>/<slug>-<step>` without the `projects:` form, where each project has its own `workers_at_once` and the projects may share one `worktree_root` (`skills/plan/templates/plan.projects.yaml` lines 12 and 39). The brief check of step 1 (`.scratch/2-i-several-plans-in-one-session/agents/reviews/1-brief-check.md`, section 3, finding 3) found the brief deciding this silently.

- Option (a), recommended: with no entry the session runs every open plan of every project, the projects in the order `.agents/plan.yaml` lists them and each project's plans in its roadmap's order; the one limit is the smallest `workers_at_once` among the projects with an open plan; the worktree keeps `<slug>-<step>`, and `/spec` refuses a step whose worktree path or branch already exists until the step holding it lands. Pro: one limit holds across all plans, as the goal says, and D18 stands as ruled. Con: a project with a low limit slows the others while it has an open plan.
- Option (b): each project's `workers_at_once` holds across its own open plans only. Pro: each project keeps its own load. Con: a session runs up to the sum of the limits, against the goal's one limit across all plans.
- Option (c): leave the `projects:` form unstated. Pro: no text. Con: each session decides it differently, and two plans with the same slug collide on one worktree path.
- Recommendation: (a), the only option that keeps the goal's one limit and ruling D18 as written. The lazy option is (c).

Taken: (a)
Booked: `.scratch/2-i-several-plans-in-one-session/plan.md:62` (Open item Step 1, the projects form)
Builds on it: 1

# Choices taken under self-rule

Each choice the orchestrator took under self-rule waits here for the user's review, grouped by roadmap entry. The user agrees with a choice by typing `C<n> Agree`, or replaces it by typing `C<n> => <ruling>`, in any session on the repository. A reviewed choice leaves this file.

Last number: C37

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

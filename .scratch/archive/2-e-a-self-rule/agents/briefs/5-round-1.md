# Repair round 1 of step 5

The findings of `agents/reviews/5-refuter.md`, each with its ruling. The builder is the orchestrating session (executor `inline`); it works in the main checkout's ledger files, under the same brief and rules.

## 1. Spec 1: the agents of 2.E's design conversation whose prompt ties them to a step

Item 1's numbered list takes an agent whose prompt or time ties it to a step of 2.E. Applied by the prompt to the five agents of the design conversation before the opening commit:

- ab9ea8af2b5f1b654 (claude-code-guide, the effort field of an agent definition): step 3, the effort agents. A numbered item.
- a87e3855655e33f19 (oculus's design rules and coding standards): steps 4 and 5, the standards pages. A numbered item.
- a432f885c9164e19d (the game-engine design session, its design decisions shown to the user): step 12, the `grill` skill. A numbered item.
- a5f748843ab789cc0 (an audit of the user's requests never acted on, across the whole session): no single step; named in the report as no plan's, with that reason.
- ae64bcf0b2ed543b4 (the stops of ruling Y in plans 2.C and 2.D): no step of 2.E; named in the report as no plan's, with that reason.

The numbered items say "before the plan opened". The report's judgment call and its "Records named as no plan's" are rewritten to the prompt test.

## 2. Spec 2 and Proof 1: the reading and its outputs in the ledger

- The report names the two scratch files the reading ran from, `table.py` (the records and notices, facts only) and `assign.py` (the session's placements typed by hand), and states that the ledger keeps their result: a section "Placement of each agent" listing, for every bullet, the figure pair that ties it to its booking or the prompt words that place it, and for every numbered item, the evidence its line in "Agents placed by their prompt or the timeline" gives.
- The report quotes whole: the lines `checks.sh` prints; each cost-script run whole; the commands of cases 4, 9 and 10 with their output.

## 3. Proof 2: case 10's window and the session e6eaa63f

- The window's end is 2.E.A's opening commit 9fc91dc (2026-09-30T22:31:16Z), after 2.E's closing 39ac671 (2026-09-30T21:39:21Z) and 2.H's last change 8633553 (2026-09-30T15:45:29Z); the report says that, not that 9fc91dc holds 2.H's last booking.
- e6eaa63f-a72a-4d27-8c5a-205d10b9cdf8 is an interactive session (entrypoint `cli`) in the folder `-private-tmp-ordo-diagnose-3`; the count is 26 `claude -p` sessions and that one.

## 4. Behaviour: 2.F's numbered list and the bullets later landings append

In `.scratch/2-f-diagnose/plan.md`'s Agents section, the numbered list and its line "Agents in no role the cost script prices:" stand right after the paragraph, and the bullets follow under a line "Agents in the roles the cost script prices:", so a bullet `land` Steps 9 appends at the end stands under it. The paragraph is unchanged.

## Then

Rerun the verify list and the brief's verify 2 to 5, and append a section "Repair round 1" to `agents/reviews/5-report.md`: each item above with what changed, before and after, and the outputs whole.

# Step 15, repair round 1: the rulings

The round starts at the worktree's wip commit b32f293. The findings are in `agents/reviews/15-refuter.md`. Each ruling stays inside the brief `agents/briefs/15.md`; its cases, "What it must do" and "Verify before you report" hold for the round unchanged, and the five cases are run again after the round. The brief's git convention now reads: no git command that writes; the read-only git the checks run themselves is allowed.

## Paths this round writes

The brief's list, unchanged.

## Rulings

1. **The Doc text quotes lines, not a count** (Spec 1 and 3). The replacement for roadmap line 135 quotes the seven `PASS:` lines of the a866716 section of `15-rerun.md` (or names that section without a count), and states what the closing itself ran on main: the layout check, its test, the inventory check and its test (session log line 3179, result at 3180) and the ASCII check (line 3204, `ascii exit 0`), as plan 1's `orchestrator-state.md:84` records.
2. **The Open items clause is the user's choice** (Spec 2). Write the replacement keeping "every landing report `Open items: none. Booked list: empty`", which is true (`grep -h 'Booked' *-landing.md | sort | uniq -c` prints 13), and give in the report, beside it, the variant without the clause with the one-sentence reason (the audit's finding 6). The orchestrator puts both to the user.
3. **One count per finding total** (Spec 4). Plan 1's `plan.md` and its usage rows give the same count for each step: step 2's first run is 23 findings (the three Not checked items are not findings), and step 13's run over the round is 3, counting Spec 1 and Behaviour 1 once as `13-refuter.md` says they are the same defect. Check every other step's findings figure in `plan.md` against its usage row and its refuter report the same way, and bring each pair in line; list each in the report with the refuter lines that decide it.
4. **The ASCII check seen at the landing** (Spec 5). Where the old text said "a clean ASCII check" at a landing whose verify script ran the ASCII check last and unpiped (plan 1 `plan.md:66, :76, :86, :95`, `agents/reviews/2-landing.md` to `5-landing.md` line 9, plan 2 `plan.md:52, :60`, and any other the same holds for), the new text keeps that fact: the script's exit 0 carried the ASCII check's own status, as the verify list at that commit and log line 1353 show; only the tests' status was `tail`'s.
5. **Sentences** (Standards 2). The rewritten "Verified" bullets are split into sentences of about 20 words where the mechanism does not need more; a quoted `PASS:` list stays whole.

## Report

Rewrite `agents/reviews/15-report.md` in the worktree's copy of the ledger to the tree after the round, with a section "Repair round 1" that lists each ruling, DONE or NOT DONE, and the command that proves it, and the Doc text in both variants. Rerun the brief's "Verify before you report" and the five cases in full and quote them.

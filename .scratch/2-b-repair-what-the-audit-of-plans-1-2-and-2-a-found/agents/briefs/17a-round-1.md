# Step 17a, repair round 1

The round starts from the worktree as you left it. The findings are in `agents/reviews/17a-refuter.md`. The brief `agents/briefs/17a.md` holds unchanged, and every check of its "Verify before you report" is run again after the round. The paths of the brief, plus `skills/plan-orchestration/SKILL.md` line 156 and `skills/plan/SKILL.md` line 54.

1. **Behaviour 3, a ruled candidate stops `/spec` again.** In `skills/spec/SKILL.md` Steps 3, add a bullet after the stop bullet: a candidate the user has already ruled on, a line of `plan.md`'s Rulings section naming it, is settled; `/spec` records the ruling in the brief's "Libraries checked" and does not stop for it again. In "Steps / A ruling" 2, the bullet that says a ruling which sets a public shape, a vocabulary or a rule is written where the plan keeps its rulings "so later premise checks read it" also names the library search of Steps 3. Add a case to your report showing the re-run path by reading: the ruling booked, `/spec` typed again, Steps 3 reading the ruling and going on to Steps 4.
2. **Behaviour 1.** `skills/plan-orchestration/SKILL.md` line 156: "(the `spec` skill's Steps 4)" becomes "(the `spec` skill's Steps 5)".
3. **Behaviour 2.** `skills/plan/SKILL.md` line 54: add `libraries` to the list of the block's keys, after "the reviewer".

Spec 1 (the brief's line number) is not yours: it is closed.

Add a section "Repair round 1" to your report: each item DONE or NOT DONE with the command that proves it, the verify list rerun and quoted (it must print `verify: 7 commands passed`), and the files changed in the round with line counts.

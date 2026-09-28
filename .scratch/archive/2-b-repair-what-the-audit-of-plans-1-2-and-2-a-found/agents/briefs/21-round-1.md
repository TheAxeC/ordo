# Step 21, repair round 1: the rulings

The round starts from the worktree as the builder left it. The findings are in `agents/reviews/21-refuter.md`. The brief `agents/briefs/21.md` holds unchanged, and every check of its "Verify before you report" is run again after the round.

The paths are the brief's, plus these, which the rulings below need:

- `skills/plan-help/SKILL.md`
- `skills/plan/templates/orchestrator-state.md`
- `skills/repo-setup/templates/docs/dev/change-standard.md`
- `skills/refute/SKILL.md`
- `skills/refute/templates/report.md`

## Rulings

1. **A step the orchestrator would book is a stop for the user** (Spec 2, Behaviour 1; the user's ruling Y (a) in `plan.md`'s Rulings). A finding that is neither closed in the repair rounds nor fixed at landing (a finding beyond the brief, a red line at landing that no fix inside the brief closes, work the last round left undone, a changed view that cannot be fixed at landing) goes to the user as an open item in the state file, with its options, the pros and cons of each and one recommendation, as `plan-orchestration`'s Stops section says. It enters `plan.md`'s step list only by the user's ruling, as a line ending with `(ruling <name>)`. There is no booked list any more.
   - Rewrite every sentence that says otherwise. `grep -rn -i 'booked\|no ruling needed\|queue order' skills docs README.md` in the worktree finds them. At least these: `skills/land/SKILL.md` lines 61, 72, 90, 123, 131; `skills/plan-orchestration/SKILL.md` lines 78, 82, 110, 164, 172, 219, 235 and its "Reports" section; `skills/refute/SKILL.md` lines 56, 70, 104, 107; `skills/refute/templates/report.md` line 44; `skills/plan-help/SKILL.md` lines 59, 60, 69, 70; `skills/plan/templates/orchestrator-state.md` lines 30 and 34 (the section "Booked, no ruling needed" is removed); `skills/spec/SKILL.md` line 70 ("left out of the brief and booked").
   - A step that a red line took back out of main (`landing: backed-out`) is not a new step: its line keeps its tag, and it is worked again as that step, through `/spec`, with no new ruling. Only its failure is recorded, in the step's Step 0 in `plan.md`. It goes to the user as an open item only when only the user can decide what to do, as today.
   - Keep what is not this rule: "booking" a landed step in `plan.md` (the landing's record), the state file's Closed list, and the open items.
   - A report no longer names a booked list's count; it names the open items, as today.
   - `skills/plan-orchestration/SKILL.md:164` then says: a step enters the step list only by the user's ruling, and `/spec` refuses a line without its tag.
   - Bump the version of each skill whose `SKILL.md` changes in this round and was not already bumped in this step (`refute`, `plan-help`).
   - The report states the before and after: before, such a finding became a step in the booked list, worked in queue order with no ruling; after, it is an open item and becomes a step only by the user's ruling.
2. **The name of an open item line** (Proof 1). A Rulings line of the form `- Open item <L>` followed by ` (` or by `:` is named `<L>`. Change `check_step.py`, its head comment, and the case at `check_step.test.sh` lines 127-134 so `(ruling E)` passes against `- Open item E: ...` and `(ruling Open item E:)` is refused. `skills/spec/SKILL.md`'s booking text says both forms. Quote the revert that turns the case red.
3. **A `###` heading inside a section** (Proof 2). Add a case with a `###` heading inside the step list and inside the Rulings section, a step and a ruling after it still read. Quote the revert (`#{1,2}` to `#{1,3}`) that turns it red.
4. **The ledger root as written in `plan.yaml`** (Proof 3). `land.sh` normalises `landing_ledger_root` before its check: every leading `./` and every trailing `/` removed. The pathspec and the ignore pattern both use the normalised value. Add `ledger_case` runs (or cases of the same strength) for `.scratch/` and `./.scratch`, each showing the builder's report left out and the checkout not stopped. Quote the revert that turns each red.
5. **What reaches main** (Standards 1). The head comment of `land.sh` (lines 17-20) and the README's landing-script section say what `skills/land/SKILL.md:53` says: a ledger file left uncommitted in the worktree never reaches main, and a ledger file that a commit of the range holds still does.
6. **`/plan`'s inputs** (Standards 2). `skills/plan/SKILL.md` "What it reads" names the `land` skill's `templates/land.sh` and `templates/land.test.sh`, and a Stops row covers either not being found, found the way `land.sh` finds `verify.sh`.
7. **The sentences outside the first paths** (Spec 1, Standards 3). Apply the four "Doc text" replacements of your report to `skills/plan-help/SKILL.md` lines 68 and 70, `skills/plan/templates/orchestrator-state.md:47` and `skills/repo-setup/templates/docs/dev/change-standard.md:34`, merged with ruling 1 where they touch the same lines. Then grep each name this step changed across `README.md`, `docs/`, `skills/` and `utils/` again, and change every sentence still made false.
8. **The report's first line and the ledger copy** (Spec 1, Behaviour 2). The report's first line states anything not done after this round, or "Everything in the brief is done" only when that is true on the tree. Under "Ledger copy", say that the copy of `land.test.sh` in a ledger finds `verify.sh` only when it is beside it or in an installed `land` skill that holds it, and that the installed skill at v1.0.0 does not; the `skills/land/SKILL.md` sentence at line 109 says the same.

## Not sent back

- Spec 3 (step 6a's tag): the user ruled on 6a's content; the tag stays.
- Proof 4 (the verify list line for `check_step.test.sh`) and the copy of `land.sh` and `land.test.sh` into this plan's ledger: the orchestrator's, at landing.
- Behaviour 3 (the user's global ignore file not read for one checkout): stated in the report; no change.
- This plan's own state file, whose "Booked, no ruling needed" list the orchestrator turns into open items at landing.

## Report

Add a section "Repair round 1" to `agents/reviews/21-report.md` in the worktree's copy of the ledger: each ruling DONE or NOT DONE with the command that proves it, each new or changed case with its revert's first `FAIL:` line quoted, "Verify before you report" rerun and quoted, and the files changed with line counts. Update the report's first line as ruling 8 says.

# Step 5 landing

Roadmap entry 2.F, `/diagnose`. Plan step 5 of 6 (steps 1, 2, 2a, 3, 4, 5, 6): `diagnose` fixes the same defect wherever it occurs and checks a symptom it does not reproduce. Next: the blind comparison of step 3 run again on the landed `diagnose`, for Axel's call; then step 6, the closing.

Open items:

- none

Steps 1 check: the runner's agent listing showed one agent of the step, the reviewer over round 1 (aeaf46fbfbb7f2d65), as completed; the stop tool printed "is not running (status: completed)" for it and "No task found" for the builder a8306465118c4b49c and the reviewer a036114524a3a76dd. No agent of the step was running.

NOT DONE: the step is not ticked. Its check ends with the blind comparison run again and Axel's call that `diagnose` wins or ties; that rerun comes next and goes to Axel.

Landed with the commit:

- `skills/diagnose/SKILL.md` 2.1.0: Steps 4 lists each part of the symptom with whether the red command catches it, reads the code for a part it does not catch after the red, changes the command to assert such a part where it happens, and calls a part not reproduced only with the lines read; Steps 15 states the cause's rule at the kind of value and finds every place of the defect by reading forward from every source; Steps 16 reaches each place with a test case; Steps 18 fixes every place and every source and writes a place or input still wrong after the second change as not fixed; Steps 19 runs each input at each place; Steps 3 names no project variable; "Rules" forbids a statement about the code without the lines it rests on.
- `skills/diagnose/templates/diagnosis.md`: a parts table in "Red command"; the rule and the places of the defect in "Operation and other inputs"; "Places the fix covers"; a place not fixed in the Cause placeholder and in "No test reaches it".
- `docs/glossary.md` and `skills/repo-setup/templates/plan-terms.md`: new **place, of a defect**; **other input** and **right result, of an other input** changed.

Found: the Opus review found 11 findings (items 2 and 8 violated, case 5 partial), sent in repair round 1 with a twelfth change, `SKILL.md:102`; the Sonnet review over the round found every first-run finding closed and 2 more, both fixed at landing (`5-refuter.md`, Closed).

Verification on main:

```
$ sh skills/land/templates/land.sh .scratch/2-f-diagnose/orchestrator-state.md 2-f-5 88aa65b
checks: 1 of 6 commands failed   (the character-set check on tab characters in 5-refuter.md)
$ sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md   (after the fixes at landing)
checks: 6 commands passed
$ git diff --cached --stat
 4 files changed, 101 insertions(+), 40 deletions(-)
```

Usage: brief check claude-opus-5-5 184390 tokens, 31 tool uses, 7.0 minutes; builder claude-sonnet-5-5 253231 tokens, 36 tool uses, 9.7 minutes (round 0) and 322847 tokens, 17 tool uses, 3.8 minutes (round 1); reviewer claude-opus-5-5 196646 tokens, 36 tool uses, 8.7 minutes; reviewer over round 1 claude-sonnet-5-5 153104 tokens, 27 tool uses, 3.7 minutes.

The builder's first report did not pass its bar (a container rule that excluded the places of a cause whose rule is the container's own, a late place with no ending, a Done line that called a fix at the sources not done, two standards for one class of input, a shortened quoted command). Fixes at landing: 4.

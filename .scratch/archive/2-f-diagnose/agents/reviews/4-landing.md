# Step 4 landing

Roadmap entry 2.F, `/diagnose`. Plan step 4 of 5 (steps 1, 2, 2a, 3, 4, 5): `diagnose` reaches the whole defect. Next: the blind comparison of step 3 run again on the landed `diagnose`, for Axel's call; then step 5, the closing.

Open items:

- none

Steps 1 check: the runner's agent listing showed none of the step's agents (builder a8d70603c526446e1, reviewers a961b9fcb88f8028e and ac15089b4a5587f45, brief check a3ee1a7e4b52255d2); only two peer sessions of another project were listed.

NOT DONE: the step is not ticked. Its check ends with the blind comparison run again and Axel's call that `diagnose` wins or ties (ruling "Step 3 ticked"); that rerun comes next and goes to Axel.

Landed with the commit:

- `skills/diagnose/SKILL.md` 2.1.0: Steps 12 keeps a hypothesis standing when its probe broke an other input; Steps 15 states the cause at the operation that goes wrong, chooses between hypotheses left standing, lists the other inputs from the code that feeds the operation, writes each one's right result, runs each before the fix and puts it in one of three classes; Steps 16 and 17 give and run a test case per input of the defect; Steps 18 makes the fix at most two changes at the operation, leaving every input not part of the defect as it was, and writes an input of the defect still wrong as not fixed, its test case taken out and its run quoted; Steps 19 runs the red command on every other input.
- `skills/diagnose/templates/diagnosis.md`: the section "Operation and other inputs" with a "Right result" column; the Cause placeholder, the Probes Result cell, the test and the runs after the fix changed to match.
- `docs/glossary.md` and `skills/repo-setup/templates/plan-terms.md`: new entries **other input** and **right result, of an other input**; **diagnosis record** and **red command** changed.

Found: the Opus review found 12 findings (case 1 partial, item 9 violated), sent in repair round 1; the Sonnet review over the round found 9 more, and 3 of the first run's partly open; all were fixed at landing (`4-refuter.md`, Closed).

Verification on main:

```
$ sh skills/land/templates/land.sh .scratch/2-f-diagnose/orchestrator-state.md 2-f-4 8b93c6f
checks: 6 commands passed
 4 files changed, 72 insertions(+), 15 deletions(-)
$ sh skills/land/templates/checks.sh .scratch/2-f-diagnose/orchestrator-state.md   (after the fixes at landing)
checks: 6 commands passed
```

Usage: brief check claude-opus-5-5 187152 tokens, 31 tool uses, 6.1 minutes; builder claude-sonnet-5-5 196539 tokens, 40 tool uses, 6.5 minutes (round 0) and 253327 tokens, 15 tool uses, 2.9 minutes (round 1); reviewer claude-opus-5-5 186998 tokens, 35 tool uses, 9.0 minutes; reviewer over round 1 claude-sonnet-5-5 204452 tokens, 28 tool uses, 6.9 minutes.

The builder's first report did not pass its bar (an other input with a different right result had no class, no choice between hypotheses at one operation, a Done line that could not be met, and an unasked rule added in place of handing a case back). Fixes at landing: 9.

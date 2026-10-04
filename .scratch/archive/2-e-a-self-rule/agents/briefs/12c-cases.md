# Step 12c, the cases ruling (round 0)

The builder's first run handed back three points. Each is ruled inside the step's scope. The brief and every check of "Verify before you report" still hold, with the changes below.

A. The silent pin cases and their control: option (a).
- P2, P4, P6 and P11 keep their `.claude-work/skills` control, placed after the silent assertions.
- For each of them the report quotes the silent assertions passing on the unchanged `pin.sh` and the control failing there. The pass is shown by running the case's silent lines alone from a scratch copy in the scratchpad; that copy is never kept in the test.
- P7 and P9 pass whole on the unchanged script.

B. P3 and P10: option (a).
- P3 and P10 are cases of preserved behaviour: one folder named once.
- Kind 5's change for each is "drop the dedupe".
- P10 carries the `.claude-work/skills` control, which fails on the unchanged script.
- P3 carries a second folder found only by the glob, `.claude-aux/skills`, as its control, which fails on the unchanged script.

C. `skills/repo-setup/SKILL.md`: option (a).
- It joins "Paths this step writes".
- Its change is the `metadata.version` line, set to 2.0.0 as Decision 2 says.
- Read the rest of that file for any sentence the new entries **step** and **part, of an entry** make false, and change only such a sentence, named in the report.

Verify 6 now reads with A and B:
- The cases of added behaviour (P1, P5, P8, P11 and P12) fail on the unchanged `pin.sh`.
- The controls of P2, P3, P4, P6, P10 and P11 fail there too.
- The silent assertions of P2, P4, P6 and P11, and P3, P7, P9 and P10 without their controls, pass on the unchanged script and after the change.
- The report quotes each of these runs.

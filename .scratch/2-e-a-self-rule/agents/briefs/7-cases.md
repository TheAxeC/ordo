# Step 7: the orchestrator's ruling on the first run of the cases

The builder's hand-back is `agents/reviews/7-cases-handback.md`. Each ruling stays inside the brief's scope and replaces the brief's text where the two differ.

1. Case 9, the `Booked:` rewrite of `/plan` (items 4.4 and 4.6): option (a). The rewrite of each choice's `Booked:` line to the new `plan.md` and the bullet's line there is made when `plan.md` is written, at the end of Steps 3, after the user's approval or the closing of Open item A, and never at Steps 2. The opening commit of Steps 6 carries the choices file. A stop that stands leaves the choices file and the rulings file as they were, so case 9 reads "nothing written". The rule holds for a `/plan` run with or without `--self-rule`. The other `/plan` bullets of item 4 are worded to match. Item 4.4's text moves from Steps 2 to Steps 3; its content is unchanged.
2. Case 28 against item 5.7: as the builder proposes. Steps 10 under `--self-rule` commits "the files it wrote, the choices file among them when it wrote it", and a run that wrote no file makes no commit and says so in its report.
3. Item 5.4 against Decision 2: option (a). The sentence names the six kinds by `plan-orchestration`'s `references/self-rule.md`, "The six kinds left open", and gives no list of examples in `grill`. Decision 2 governs. Cases 3 to 5 are read against that section.
4. Item 6.2: write it as "Nothing is added except what the user asked for, or what a quoted ruling ending "(self-rule)" names as a finding of a running plan." The anti-pattern of item 6.4 agrees with it.

The final report carries these rulings under the cases' first run.

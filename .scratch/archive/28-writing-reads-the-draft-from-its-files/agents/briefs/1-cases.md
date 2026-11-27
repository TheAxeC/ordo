# Step 1, round 0: the ruling on the cases hand-back

The case "A run that ends normally" is ruled by Open item C of `plan.md` (the user): option (a).

- The temporary folder is removed with `rm -r '<the folder>'` once the runner reports that the checking agent has ended, and before the report and the token line are shown, since the report is the message that ends the turn and no command runs after it.
- Every agent that reads the folder has ended when it is removed.
- It is also removed on every refusal raised after it was made, as before.
- The brief's item 5, its case "A run that ends normally" and the ADR 0061 Decision bullet now say this; read them again in `agents/briefs/1.md`, which this round replaces in the worktree.
- Build items 1 to 7, ADR 0061, ADR 0013's status line and the index row as the brief says, and carry this ruling in your report.

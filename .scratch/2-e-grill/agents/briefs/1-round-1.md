# Step 1, repair round 1

Findings of `agents/reviews/1-refuter.md`, each with its ruling. The ruling stays inside the brief and the rules file.

1. Standards, `skills/repo-setup/templates/docs/adr/README.md:3` and the byte-equal `docs/adr/README.md:3`: "Every other decision stays a ruling of the plan that made it." uses "ruling" for every decision, while `docs/glossary.md` defines a ruling as the user's decision on an open item (or the orchestrator's on a finding or a case). A brief's "Decisions taken" and a builder's judgment calls are decisions that are not rulings. Ruling: replace the sentence, in both files, with "Every other decision the user rules on stays a ruling of the plan that made it." Nothing else in either file changes, and the two files stay byte-for-byte equal. Rerun the verify list and the brief's two `diff` commands, and add a section "Repair round 1" to the report with the new line 3 and the outputs.

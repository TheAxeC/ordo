# Step 1, repair round 1

The findings of `agents/reviews/1-refuter.md`, each with its ruling. Each stays inside the step's part. Change only what each ruling names.

1. S1 (Standards): in `skills/academic/writing/SKILL.md`, the two bullets under Steps 10 are indented 3 spaces, so a CommonMark render ends the ordered list at item 10 and shows them as a separate list. Ruling: indent both bullets of Steps 10 by 4 spaces, as `skills/academic/paper/SKILL.md` indents the bullets of its two-digit items. Indent nothing else.
2. P1 (Proof): ADR 0061's Consequences cite ADRs 0030 and 0035 for the read tool, which neither records. Ruling: cite them only for the agent type, such as "which the runner's general-purpose agent, the agent ADRs 0030 and 0035 name, has".
3. P2 (Proof): your report's first judgment call says `git grep` found one outside reference to the skill's Steps, without the command or its output, which the change standard's rule 14 asks for. Ruling: run that grep and quote the command and what it printed in the report.
4. B1 (Behaviour): your report does not state that each agent now makes read tool calls on the draft's files and on the files in the temporary folder, which changes each agent's tool uses and tokens. Ruling: add that change, with its before and after, under the report's host- or user-visible changes.

Then rerun the checks of the brief's "Verify before you report" and update the report, its DONE / NOT DONE table and its first line, with a section "Repair round 1" that names each finding and how it is closed.

# Repair round 1 of step 3

The reviewer's findings on step 3, each with the orchestrator's ruling. Carry out each ruling and nothing beyond it. The brief `agents/briefs/3.md` and its rules hold unchanged.

1. Standards 1. `skills/code/wizard/templates/template.sh` line 3, "A wizard walks a human through a manual procedure, step by step.", and the marker comment's line "STAGES: author this section. One stage() per step the human takes." no longer describe a script whose stages also run commands.
   - Ruling: reword both lines so they cover the commands a stage runs once the person has confirmed them. The functions stay byte for byte, the banner included.
2. Standards 2. `skills/code/wizard/SKILL.md`, Steps 5, the bullet "Choose a command that differs by operating system by `WIZARD_OS`, and give a system the list does not cover a `warn` that names it." holds two requirements.
   - Ruling: two bullets, one per requirement.
3. Standards 3. `run_cmd` called with no word shows `''`, runs nothing on a yes and prints "ok ran". A stage that passes an empty unquoted variable reports an install that did not happen.
   - Ruling: `run_cmd` with no word, or with an empty first word, asks nothing and runs nothing: it prints through `warn` that no command was given and ends the script with status 2. The head comment lists the warning and the status. The test gains one case for it, run first on the template as it now stands in the worktree, where it fails, and the report quotes that failure. Its head comment says why the case is kept: a stage reported as done whose install never ran.
4. From "Declined to judge". Steps 5, the bullet on a command that needs a secret, does not say that the variable is never expanded on the `run_cmd` line, where bash replaces it by the value before the line is printed.
   - Ruling: the bullet says that the `run_cmd` line never holds the variable's expansion: the command reads the variable from its environment, or asks for the secret itself. Keep it one requirement per bullet.

The report: rewrite `agents/reviews/3-report.md` in the worktree in the brief's shape, with a section "Repair round 1" that names each ruling, the lines changed and the checks rerun with their output. Rerun every check of the brief's "Verify before you report".

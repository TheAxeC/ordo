# Repair round 1 of step 5

Sent to the builder a1b230b7ae645fe72 on 2026-11-23, with the snapshot `.agents/worktrees/18-wait-what-and-wizard-5-round-1`.

1. `skills/code/wizard/SKILL.md`, Steps 5, the bullet on printing the plain line with `say`: the skill says the `say` line holds the same line in single quotes, so that bash expands nothing in it (refuter report, Spec 2).
2. `skills/code/wizard/SKILL.md`, Steps 5: the bullet on a missing tool is written as three bullets, and the rewritten bullet on skipping a stage's commands as two, each rule stated once (refuter report, Standards 1). The orchestrator rules that the brief's 3.4, "with no second bullet beside it", meant no bullet that disagrees.
3. `skills/code/wizard/templates/template.sh:17`: "which prints nothing" is said of `version_at_least`, or the clause is dropped (refuter report, Standards 2).

Not in the round: the refuter report's Spec 1, the version read outside `run_cmd` against ADR 0046, which is Open item A.

# Landing report: 2.F step 1

Roadmap entry 2.F, diagnose. Plan step 1 of 5, the `diagnose` skill. Next: step 2, the wiring, prepared after 2.G step 1 lands.

## Open items (verbatim from the state file)

- Step 1 reading (2026-09-30): step 1, the `diagnose` skill, landed unticked, since its check is your reading of `skills/diagnose/SKILL.md` and `templates/diagnosis.md` against `docs/dev/skill-layout.md` and the Goal's six parts (ruling "Overnight work applies to this plan"). Options: (a) you read it and tick step 1, or name what is wrong; (b) tick it unread. Recommendation (a). The lazy option is (b).
- A script for the person-driven red command (2026-09-30, step 1's review): `diagnosing-bugs` ships `scripts/hitl-loop.template.sh`, a loop that prints each action for the user and reads back what they saw; `diagnose` describes that red command in words only, and the review names it as a point `diagnosing-bugs` would win in step 4's blind comparison. Options: (a) a template script `skills/diagnose/templates/person-driven.sh` that computes only this: it prints each action of a list given to it, reads the user's line of observation after each, and writes the actions and observations into a file for the record; pros: the point is covered and the loop is the same each time; cons: a new script and its test. (b) The words only; pros: nothing to maintain; cons: the comparison point stays open. Recommendation (a). The lazy option is (b). A yes adds it to step 2, whose paths widen to the script and its test.

## The check of Steps 1

`ListAgents` listed no agent of this session: the builder (a3f22d22a0a9ce902) and both reviewers had finished.

## NOT DONE

- Step 1 is not ticked: its check is Axel's reading, the open item "Step 1 reading".

## What landed

`skills/diagnose/SKILL.md`, `skills/diagnose/templates/diagnosis.md`, and seven terms in `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`, in one commit with this report and the booking in `plan.md`.

## What was found

The first review's findings were sent in repair round 1. The run over the round found 14, each fixed at landing on main; `1-refuter.md`, "Closed", lists each fix. One open item came from the review: the script for the person-driven red command.

## Verification on main

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl ... (the ASCII check)
checks: 8 commands passed
```

## Usage, the bar and the fixes at landing

- Usage (models from the transcripts): brief check claude-opus-5-5 148959 tokens, 40 tool uses, 429 s, $1.32 to $3.68; builder claude-sonnet-5-5 163309 tokens, 36 tool uses, 450 s (round 0) and 227963 tokens, 15 tool uses, 293 s (round 1), $2.27 to $5.96 for both; reviewer claude-opus-5-5 179275 tokens, 39 tool uses, 519 s, $1.63 to $4.94; reviewer over round 1 claude-opus-5-5 199800 tokens, 37 tool uses, 524 s, $1.67 to $5.03.
- The builder's first report did not pass its bar: the review found the hypotheses and the cause not reaching the user inside a plan, the fix routes missing, and rules written twice. Fixes at landing: 14. Sonnet 5.5 measurement (ruling "Overnight work" 1): every finding of the builder's is closed at landing, so `worker:` stays Sonnet.

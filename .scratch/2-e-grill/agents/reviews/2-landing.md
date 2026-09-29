# Step 2 landing report

Roadmap entry 2.E (grill). Plan step 2 of 17: the `plan.yaml` settings `adr`, `design_bar`, `design_references`, `worker_effort` and `reviewer_effort`. Next: step 4 lands, then step 5; then step 3, the effort agents.

Open items: none.

Agents stopped before the landing: the runner's agent listing showed step 2's builder and both of its reviewers completed; the only agent running was step 5's builder, which works in its own worktree.

NOT DONE: nothing.

Landed with this commit:
- `skills/plan/templates/plan.yaml` and both projects of `plan.projects.yaml`: the five keys after `bench`, with their defaults `docs/adr`, `industry`, `[]`, `high`, `high`.
- `skills/ordo-init/templates/check_config.py`: a key written twice is refused (the keys written in each mapping are compared, a merge key's mappings included, and a key that overrides a merged value is left alone); the five values are checked in place of the kind check, one error line each; `adr` must name a folder under the repository root, and the default `docs/adr` not yet created is a note; the docstring lists every error the script prints.
- `skills/ordo-init/templates/check_config.test.sh`: a case for each case of the brief and for the merge key forms.
- The same keys in `skills/plan/templates/orchestrator-state.md`, `skills/plan/SKILL.md` Steps 4, `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md` (the `configuration block` term), and `skills/ordo-init/SKILL.md` Steps 7 and "Checking an existing file" 2 and 3.
- This plan's configuration block gains the five keys with their defaults.

Found:
- The first review found a crash on a YAML merge key, a missing case for the default `docs/adr` as a file, and a docstring missing one error. Repair round 1 closed all three.
- The run over round 1 found that a mapping written as the value of a merge key was never scanned for a key written twice. Fixed at landing: `UniqueKeyLoader.scan_keys` and case `merge-inline-twice`, which fails with the scan of the merge key's value removed (`FAIL: merge-inline-twice: expected an error, got a pass`).
- The brief's prediction that a duplicated `worker_effort` passes silently on the unchanged tree was wrong (an unknown key gives `unknown key` there); booked in `plan.md`.

Verification on main:

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
checks: 8 commands passed
```

A/B: none. Look: none.

Usage: brief check claude:opus 110579 tokens, 21 tool uses, 271 s; builder claude:opus 193038 tokens, 37 tool uses, 1303 s (round 0) and 206243 tokens, 8 tool uses, 273 s (round 1); reviewer claude:opus 148659 tokens, 32 tool uses, 407 s, and over round 1 102774 tokens, 18 tool uses, 256 s. The builder's first report did not pass the bar (a repair round was needed); one fix at landing.

Next: step 4 lands (its run over round 1 is saved), then step 5, then step 3.

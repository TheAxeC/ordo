# Step 2 refuter report (on .agents/worktrees/2e-2, base 4e514c0b7de7d3b204cc53736b81e1acc81961ae)

A page this report cites (the rules file, a standard, a skill's text) is named with its section, never with a line number. A finding in code keeps its `file:line`. Saved by the orchestrator from the reviewer's final message.

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md   (exit 0)
PASS: land.sh scratch tests
PASS: checks.sh scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
ok: the plan-terms block equals the template
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
checks: 8 commands passed

Verify 4: python3 skills/ordo-init/templates/check_config.py .   (exit 0), the five not-set notes, then ok
Verify 5 (key count per file):
adr 1 2 1 1 1 1 3
design_bar 1 2 1 1 1 1 2
design_references 1 2 1 1 1 1 2
worker_effort 1 2 1 1 1 1 2
reviewer_effort 1 2 1 1 1 1 2

Report evidence rerun: example_keys() defaults, the SKILL.md lines, the line counts, the case counts (55 and 48), the ASCII diff scan, the rule 14 grep, and the first run (41 FAIL lines, the 35 cases the report lists) all match.
Base checker, worker_effort written twice: "error: unknown key: worker_effort"; reviewer written twice: "ok: ..."
```

Rule 13 sample, nine reverts on a scratch copy:

```
R1 yaml.safe_load for UniqueKeyLoader: FAIL: twice-effort: expected an error, got a pass
R2 "or key in VALUE_CHECKED" dropped: FAIL: adr-number: expected one error line, got 2
R3 value.lower() in EFFORTS: FAIL: worker-effort-High: expected an error, got a pass
R4 root test only os.path.isabs: FAIL: adr-parent: missing the line [error: adr is not a path under the repository root: '../elsewhere']
R5 KeyWrittenTwice(None, key): FAIL: projects-twice: missing the line [error: tool-b: key written twice: worker_effort]
R6 all(...) item test dropped: FAIL: references-number: expected an error, got a pass
R7 note appended whatever the folder: FAIL: adr-present: unexpected line [note: adr folder docs/adr does not exist yet; ...]
R8 "not os.path.exists(full) and" dropped from the note condition: exit 0: PASS: check_config.py scratch tests
R9 design_bar check guarded by "value is not None": FAIL: design-bar-empty: expected an error, got a pass
```

## Verdicts

- 1, 2, 4, 5, 6, 7, 8: hold.
- 3: violated, Behaviour 1 and Standards 1.
- Cases: all met; the brief's prediction for the duplicated `worker_effort` on the unchanged tree does not reproduce (Spec 1).

## 1. Spec

- Brief 2, "Cases", last case: "the duplicated key passes silently" does not reproduce on the base: an unknown key written twice gives `error: unknown key: worker_effort`; a known key written twice (`reviewer`) passes silently. The builder reported it and added `twice-reviewer`. No verdict against the build; the correction is the orchestrator's to book.

## 2. Proof

- `skills/ordo-init/templates/check_config.py:98`: "if not os.path.exists(full) and path == os.path.normpath(default):"; the default `docs/adr` existing as a file is refused by the code, but no case proves it: revert R8 leaves the suite green. Failure scenario: a later edit drops the condition, `check_config.py` exits 0 with a note where `docs/adr` is a file, and `grill` fails writing its first record. Verdict: none.

## 3. Standards

- `skills/ordo-init/templates/check_config.py:6-16`: the docstring's list of errors omits `error: keys beside projects: [...]` (`check_config.py:175`), against change standard rule 14. Failure scenario: a reader meets that error and finds it described nowhere. Verdict: item 3 violated.

## 4. Behaviour

- `skills/ordo-init/templates/check_config.py:57-60` with `:165`: `UniqueKeyLoader.construct_mapping` constructs every key before `flatten_mapping` removes the merge key `<<`, so a `.agents/plan.yaml` using `<<: *anchor` ends in `yaml.constructor.ConstructorError: could not determine a constructor for the tag 'tag:yaml.org,2002:merge'`, where the base loaded it. Reproduced on a scratch copy of the several-projects example. No `.agents/plan.yaml` under `~/workspace/*/` uses a merge key today. Failure scenario: a repository sharing project keys through an anchor gets a traceback from `/ordo-init`. Verdict: item 3 violated.

## Declined to judge

- `adr: .` passes, and `adr` naming a symlink that points outside the repository passes: within the brief's lexical definition of "under the repository root".
- A duplicate key in a mapping nested inside a project is reported without the project's prefix: no input the brief names reaches it.
- The report cites "revert R28" and `README.md:110-112` (the text is at 107-109): no decision rests on either.

Reviewer usage: 148659 tokens, 32 tool uses, 6.8 minutes (407 s), claude:opus, a fresh agent (from its completion notice).

## Repair round 1, refuted

Reviewer: a fresh agent, read-only, over the round's delta (`check_config.py` MERGE_TAG and the skip, the docstring lines; `check_config.test.sh` cases `adr-default-file`, `merge-key`, `merge-key-twice`; `skills/ordo-init/SKILL.md` "Checking an existing file" 2), read against the whole diff since 4e514c0. Saved by the orchestrator from the reviewer's final message, condensed.

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh /Users/axelfaes/workspace/ordo/.scratch/2-e-grill/orchestrator-state.md   (exit 0)
... every line PASS or ok ...
checks: 8 commands passed
$ python3 skills/ordo-init/templates/check_config.py .   (exit 0)
Verify 5 key counts: unchanged, 1 per key in plan.yaml, 2 in plan.projects.yaml
Reverts on a scratch copy, each copied test exit 1:
R1 the MERGE_TAG skip removed: FAIL: merge-key: expected a pass (ConstructorError for tag:yaml.org,2002:merge)
R2 break at the merge key: FAIL: merge-key-twice: expected an error, got a pass
R3 "not os.path.exists(full) and" removed: FAIL: adr-default-file: expected an error, got a pass
R4 flatten_mapping before the scan: FAIL: merge-key: expected a pass, got: error: tool-b: key written twice: roadmap
Merge probes: <<: [*c, *a] passes; a merged anchored mapping holding a key twice is refused where it is defined; a merged-in value is still value-checked in both projects; tool-b holding "<<: {worker_effort: low, worker_effort: max}" prints ok, exit 0.
```

### Verdicts

- Items 1, 2, 4, 5, 6, 7, 8: hold. Item 3: violated, Behaviour 1 (the three findings of the first run are closed).
- Cases: all met.

### Findings

- Behaviour 1, `skills/ordo-init/templates/check_config.py:59-61`: the merge key is skipped with its value, so a mapping written inline as the value of `<<` (`<<: {...}`, or a mapping inside `<<: [...]`) is never scanned for a key written twice; `flatten_mapping` splices its nodes into the outer mapping. Failure scenario: `tool-b:` holding `<<: {worker_effort: low, worker_effort: max}` prints ok and the loader keeps `max`. Verdict: item 3 violated.

### Declined to judge

- A merge key written twice in one mapping passes; whether a second `<<` is a key written twice is the orchestrator's call.
- The report's rule 13 row for `merge-key` quotes the first run's traceback line; the reviewer's R1 rerun printed the same line.

Reviewer usage over round 1: 102774 tokens, 18 tool uses, 4.3 minutes (256 s), claude:opus, a fresh agent (from its completion notice).

## Closed

- Round 0, Behaviour, the merge key crash: closed in repair round 1 (`check_config.py`, the skip of a merge key node); case `merge-key`, red under revert R1 of the run over the round.
- Round 0, Proof, the default `docs/adr` as a file unproven: closed in repair round 1, case `adr-default-file`, red under revert R3.
- Round 0, Standards, `keys beside projects` missing from the docstring: closed in repair round 1 (`check_config.py` docstring, `skills/ordo-init/SKILL.md` "Checking an existing file" 2).
- Round 0, Spec, the brief's prediction for the duplicated `worker_effort` on the unchanged tree: a premise of the brief, booked in `plan.md` at step 2's landing; the builder's added case `twice-reviewer` is the silent pass.
- Round 1, Behaviour 1, a mapping written as the value of a merge key not scanned: fixed at landing on main. `UniqueKeyLoader.scan_keys` scans the keys written in a mapping and, for a merge key, each mapping of its value; case `merge-inline-twice` (`<<: [*base, {design_bar: novel, design_bar: industry}]` in tool-b) expects `error: tool-b: key written twice: design_bar`. With the scan of the merge key's value removed on a scratch copy the test exits 1 with `FAIL: merge-inline-twice: expected an error, got a pass: note: tool-a: adr folder docs/adr does not exist yet; repo-setup or grill creates it`.
- Round 1, declined: a merge key written twice in one mapping is left as PyYAML loads it; it is not a key written twice in the sense item 3 names, since the scan compares the keys written in a mapping and a merge key names none.

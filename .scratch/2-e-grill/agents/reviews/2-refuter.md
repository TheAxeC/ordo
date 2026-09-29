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

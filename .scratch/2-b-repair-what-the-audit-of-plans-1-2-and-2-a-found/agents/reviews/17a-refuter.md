# Refuter report: step 17a

Reviewer: a fresh claude:opus agent, read-only, under ruling DD. Usage: 131,442 tokens, 27 tool uses, 452 s.

## Verification

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md` from the worktree root, exit 0:

```text
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_coverage.py scratch tests
verify: 7 commands passed
```

`python3 skills/ordo-init/templates/check_config.py .`, exit 0: nine `note:` lines, then `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`.

## Spec

1. `agents/briefs/17a.md`, "What is on the tree": "It checks `review`'s value (line 65)". At the base the `review` check is lines 69 and 70; line 65 is `if value is None or default is None:`. The error is in the brief; the new check sits beside the `review` check as asked.

Items 1 to 8 otherwise match the brief byte for byte; `git status --short` shows only the eleven brief paths and the report.

## Proof

None. Every revert the report names reproduces its red line on scratch copies of `skills/ordo-init` and `skills/plan` (the optional-marked key, the value check removed, the check written with `config.get`, the tuples `("avoid",)` and `("check",)`, the key removed from the example, the label dropped, tool-a's line removed). With `libraries:` removed from the state template, `land.test.sh` prints `plan.yaml keys: missing [], extra ['libraries']` and `FAIL: example plan.yaml files differ from the state template`. The base `.agents/plan.yaml` under the new example prints `error: required key missing: libraries`.

## Standards

None. `LC_ALL=C grep -n '[^ -~]'` over the eleven files and the report prints nothing.

## Behaviour

1. `skills/plan-orchestration/SKILL.md:156`: "(the `spec` skill's Steps 4)". The comparison is now `/spec`'s Steps 5; Steps 4 is the brief write. The only reference from another skill to a renumbered step of `/spec` (`grep -rn "Steps [0-9]" skills docs README.md utils`).
2. `skills/plan/SKILL.md:54` lists the keys of the configuration block `/plan` fills and does not name `libraries`, which the block now holds.
3. `skills/spec/SKILL.md:73`: "A candidate that could replace code the step would write by hand is a stop". Nothing exempts a candidate the user has already ruled on. After the ruling, `/spec` is typed again (line 170) and redoes the checks (line 102), reaches Steps 3, finds the same candidate and stops again, so the brief is never written, against line 88 and `templates/brief.md:35` ("the library the user ruled").

## Not checked

- `/plan` and `/spec` were not run with `libraries` missing; checked by reading `skills/plan/SKILL.md:31-33` and `skills/spec/SKILL.md:30`.
- The report's first-run table was not re-run case by case.
- This ledger's configuration block has no `libraries` line; the file is the orchestrator's.

## Repair round 1, refuted

Reviewer: a fresh claude:opus agent, read-only. Verification from the worktree root: the six `PASS:` lines and `verify: 7 commands passed`, exit 0; `check_config.py .` nine `note:` lines and its `ok:` line, exit 0. `git diff 33a30e8 --stat`: 13 files changed, 124 insertions(+), 40 deletions(-).

### Spec

None. Item 1 at `skills/spec/SKILL.md` lines 75 and 169, item 2 at `skills/plan-orchestration/SKILL.md` line 156 (Steps 5 is the path comparison, line 96), item 3 at `skills/plan/SKILL.md` line 54. The added "a library choice" on line 169 is needed: without it no bullet writes a library ruling to the Rulings section, and line 75 would read a line nothing writes.

### Proof

None. The round changed no script or test.

### Standards

None.

### Behaviour

1. `skills/spec/SKILL.md:75`: "A candidate the user has already ruled on, named by a line of `plan.md`'s Rulings section, is settled". Any Rulings line naming the candidate settles it, whatever capability it was ruled for, so a ruling for one step settles the same library for a different capability in a later step, and the user never makes that choice.

### Not checked

- The re-run path was traced by reading, not run.
- The parts outside the round were not reread beyond the stale-name grep.

## Closed

- Spec 1 (the brief's line number for the `review` check): an error in the brief, no change to the diff.
- Behaviour 1 to 3 of the first review: closed in repair round 1, confirmed by the review over it.
- Repair round 1, Behaviour 1: fixed at landing. `skills/spec/SKILL.md` line 75 limits a settled candidate to a ruling on that candidate for the capability the step builds.

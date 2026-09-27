# Refuter report: step 24

Reviewer: a fresh claude:opus agent, read-only, under ruling DD. Usage: 111,225 tokens, 23 tool uses, 290 s.

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

## Spec

None. `git diff 5089880 --stat` shows `README.md`, `docs/dev/building.md` (lines 9, 10, 27) and `docs/dev/change-standard.md` (line 62); `building.md` line 27 matches the brief word for word. `grep -n '^## Tests' README.md` and the citation grep print nothing. The fenced lines of the old and new README differ only by the removed Tests block and `v1.0.0` to `v1.1.0`. Old lines 151, 164, 137-141 and 170-172 are identical to new lines 129, 142, 119-123 and 148-150. Old line 149 ("This section is for changing Ordo itself. To use the skills, install them as above.") is gone; the heading and the Install section carry it.

## Proof

None. `wc -lw`: 172 lines and 4251 words before, 150 and 1951 after; `git diff --numstat` 31/53, 3/3, 1/1. `grep -n` finds python3, PyYAML, bash and ps on lines 47 and 111, `ORDO_SKILL_DIRS` on 138 and 144, `ORDO_STABLE` on 138, the eight required keys on 105. No sentence over 40 words (the longest 33, line 142). The pointer targets hold what the report says: `skills/land/SKILL.md` lines 103, 105, 106, 115, 116; `skills/plan/templates/plan.yaml` lines 3 and 19; the head comments of `verify.sh` (lines 2-35) and `pin.sh` (lines 7-33).

## Standards

1. `README.md` lines 47 and 111 state the same fact. Line 47: "git, POSIX `sh`, and `python3` with PyYAML. The verify runner, `skills/land/templates/verify.sh`, also needs `bash` and `ps`." Line 111: "This verify runner needs `python3` with PyYAML, `bash` and `ps`." The brief's item 1 dictated the second; the builder disclosed it as a judgment call.

`LC_ALL=C grep -n '[^ -~]'` over the three files prints nothing; no spaced-dash asides; no stale "Tests", "as above" or "below" reference.

## Behaviour

None. Each claim of the new README checked against the code: line 117 against `land.sh` lines 401, 419, 426-466 and `SKILL.md` line 114; line 125 against `land.test.sh` lines 50-58 and `SKILL.md` line 106; line 107 against `plan.yaml` line 19; lines 138 and 140 against `pin.sh` (the head comment, line 46, `check_links || fail`, lines 202-229); line 142 against `pin.sh` line 207; `change-standard.md` lines 61 and 63 still hold; the two new `building.md` comments against `pin.test.sh` (a scratch `HOME`) and `sync_rules.test.sh` (`--write`, 18 hits).

## Not checked

- `pin.sh` and `land.sh` were not run; their claims were checked by reading the code and the head comments.
- The report's first-run cases on the base tree were not rerun, apart from the old README's counts.

## Closed

- Standards 1: fixed at landing, since the brief caused it: the sentence "This verify runner needs `python3` with PyYAML, `bash` and `ps`." is removed from line 111, and line 47 under Requirements stays the one place that states it.

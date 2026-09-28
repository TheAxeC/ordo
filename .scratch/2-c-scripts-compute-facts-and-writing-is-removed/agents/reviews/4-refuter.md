# Step 4 refuter report

Reviewer: claude:opus, a fresh agent; 115131 tokens, 20 tool uses, 431 s. Worktree `.agents/worktrees/2c-4`, base `fbf6f8b`.

## Verification lines

Run from the worktree root: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md; echo "exit $?"`

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne '...'
checks: 7 commands passed
exit 0
```

- Brief verify 2: `sh utils/check_coverage.test.sh 2>&1 | tail -1` printed `PASS: check_coverage.py scratch tests`.
- Brief verify 3: `python3 utils/check_coverage.py --built paper docs/academic-coverage.md x y; echo $?` printed `usage error: --built: not an argument this script takes` and `2`.
- Brief verify 4: `git grep -n -e --built -- ':!.scratch' ':!docs/roadmap.md'; echo "exit $?"` printed only `exit 1`.
- Brief verify 5, the real list: after, in the worktree, `ok: docs/academic-coverage.md`, exit 0; before, the base script from `git show fbf6f8b:utils/check_coverage.py` run from the main checkout, `ok: docs/academic-coverage.md`, exit 0. Same output and status.
- Brief verify 6, revert proof, in `$TMPDIR/refute2c4` copies with the four lines of the refusal loop deleted: `FAIL: unknown-option: got: usage error: .../repo/docs/complete.md: not a folder`; `[last]`: `FAIL: unknown-option [last]: got: usage error: .../skills/-q: not a folder`; `[alone]`: `FAIL: unknown-option [alone]: got: Usage: check_coverage.py <coverage.md> <skills root> <skill>...`; the loop over `argv[:1]` only: `FAIL: unknown-option [last]: ...`; the new test file against the unchanged base script: `FAIL: unknown-option: got: usage error: .../repo/docs/complete.md: not a folder`.
- Every command the builder's report quotes was rerun and matched (greps, `git diff fbf6f8b --numstat` `0 6`, `12 75`, `17 112`; `wc -l` 311, 502, 235; the ASCII grep; the first-run cases on the base). Every premise of "What is on the tree" reproduced on the base.

## Spec

1. The report gives the first run on the unchanged tree only for the first form of `unknown-option` (`--built paper`), which the ruling replaced; the case as it stands (`--bogus`, `-q`, `--x`) has no first run in the report. Run against the base script it is red: `FAIL: unknown-option: got: usage error: .../repo/docs/complete.md: not a folder`.

## Proof

None.

## Standards

1. `docs/roadmap.md` lines 30, 51, 58, 65, 72, 86, 107 and 114 (worktree numbering) say "the coverage check with `--built <skill>` (the command in `docs/academic-coverage.md`)"; after this diff that command is gone and the script refuses `--built`, so the sentences are false (change-standard rule 14). The brief's paths leave the roadmap out and `plan.md` step 7 removes these clauses; raised for the orchestrator to confirm.
2. `utils/check_coverage.test.sh` lines 8-9 and 441-442 and the docstring of `utils/check_coverage.py` lines 50-53 are hard-wrapped prose, against the prose standard F ("one paragraph or bullet per source line, no hard wrapping", which covers file-header and internal comments). Every comment and the docstring of both files were already wrapped at about 100 columns at the base. The wrap also splits the quoted message across lines 50-51, so a grep for it in the docstring finds nothing.
3. `utils/check_coverage.py` line 50: the docstring gives the printed form as `"<argument>: not an argument this script takes"`; the script prints `usage error: <argument>: not an argument this script takes`. The docstring states the `usage error: ` prefix for no usage error (a gap older than this diff), and the new clause adds one more message whose stated form is not the printed line (rule 14).

## Behaviour

1. Not stated in the report: `--` is now refused (`python3 utils/check_coverage.py -- docs/academic-coverage.md x y` printed `usage error: --: not an argument this script takes`, exit 2), and a coverage path, skills root or skill name that starts with `-` must be passed with a `./` prefix. Nothing today is affected (`ls research-hub/.agents/skills | grep '^-'` finds nothing; every documented command starts with `docs/`), and the refusal does not mention the `./` form.

## Verdicts

- Item 1, the `--built` mode removed: holds. Item 2, a dash argument refused first: holds (Standards 3 is about its wording). Item 3, the test's cases, fixtures and head comment, `unknown-option` under the ruling: holds. Item 4, `docs/academic-coverage.md` lines 30-35: holds.
- Cases: `--built paper ...` exit 2 naming `--built`: met. The test PASS with `unknown-option`: met. The `git grep`: met. The real list before and after: met.

## Declined to judge / not checked

- Whether the roadmap clauses of Standards 1 may wait for step 7: the orchestrator's ruling.
- Whether the no-hard-wrap rule binds wrapped code comments in scripts whose comments are all wrapped: the standards do not settle it.
- `checks.sh` without the `env -u` prefix: not rerun.
- A linter pass: pyflakes and pycodestyle are not installed; imports and blank lines checked by reading.

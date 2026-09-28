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

## Repair round 1, refuted

Reviewer: claude:opus, a fresh agent; 106448 tokens, 27 tool uses, 406 s. The round's delta read against `agents/reviews/4-round-0.diff`.

### Verification lines

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh <state file>` in the worktree: the six `PASS:` lines of the first run, the ASCII check with no output, `checks: 7 commands passed`, exit 0. Brief verify 2 to 6 reproduced: the test's `PASS:` line; `usage error: --built: not an argument this script takes` and `2`; the `git grep` only `exit 1`; the real list `ok: docs/academic-coverage.md`, exit 0, before (base script) and after; the revert proof `FAIL: unknown-option: got: usage error: .../repo/docs/complete.md: not a folder`.

### Spec

1. The report's user-visible changes (`4-report.md` line 124) say a coverage list or skills root whose path starts with `-` was "passed as it is" before; for a skills root that is false (the base printed `usage error: -r/x: not a folder`, and with root `-r` and skill `-x`, `usage error: -r/-x: find failed: find: illegal option -- r`). The list also leaves out that a skill folder whose name starts with `-` was checked at the base under its heading (`ok: -c2.md`, exit 0) and is now refused (`usage error: -x: not an argument this script takes`, exit 2).

### Proof

None.

### Standards

1. `utils/check_coverage.py` line 37: the usage errors are six list-shaped items joined by semicolons in one sentence of about 85 words, against the prose standard D (three or more list-shaped items become a list), E (sentence length) and B (semicolons); the usage-error form the round made exact is buried at its start.

### Behaviour

1. A skill folder named with a leading `-` can be checked only as `./-x` (or an absolute path) with its section heading spelled the same way: with `## ./-x`, `python3 check_coverage.py docs/c.md $S/skills ./-x` printed `ok: docs/c.md`, exit 0, and an unlisted file then printed `docs/c.md:0: './-x/extra.md' is not listed`, exit 1. No skill in research-hub is affected (`ls research-hub/.agents/skills | grep '^-'` exited 1).

### Round items

- Item 1: closed. Item 2: not applicable. Item 3: closed (word diffs of round 0 against the current files show only joined lines and the words of items 4 and 5; line 3 of the docstring is still the `Usage:` line and prints). Item 4: closed. Item 5: closed except the skill-name clause; the builder's claim that such a folder cannot be passed in any form is refuted as stated (Behaviour 1).

### Declined to judge / not checked

- The ASCII check does not fail when perl dies: a `utils/__pycache__/check_coverage.cpython-313.pyc` the reviewer's own `python3 -c "import check_coverage"` created was listed by `git ls-files -o --exclude-standard` (`.gitignore` does not ignore `__pycache__`), perl printed `Malformed UTF-8 character (fatal) at -e line 1, <> line 1.` and the command still exited 0, since its `END` block sets the exit status; the reviewer deleted that cache file afterwards. Raised as a concern outside the step's diff.
- Parts of the test file were not re-read line by line this round (a permission classifier refused a `sed -n` read); judged from the round's line and word diffs and the suite runs.
- `checks.sh` without the `env -u` prefix: not rerun.

## Closed

- First run, Spec 1: closed in repair round 1, item 1 (the report's first-run section quotes the three forms against the base script).
- First run, Proof: none.
- First run, Standards 1 (roadmap gates naming `--built`): not sent; plan step 7 (`plan.md` line 21) removes those clauses from the roadmap on main after steps 5 and 6. Until then the gates of entries 5 to 15.A on main name a command `docs/academic-coverage.md` no longer holds.
- First run, Standards 2 (hard wrapping): closed in repair round 1, item 3.
- First run, Standards 3 (the printed form of the usage error): closed in repair round 1, item 4.
- First run, Behaviour 1 (`--` refused, the `./` form): closed in repair round 1, item 5, and at landing for the skill-name clause.
- Round 1, Spec 1 (the report's user-visible changes): fixed at landing in `agents/reviews/4-report.md` lines 124-125: the skills root's before corrected, and the skill folder's before and after added.
- Round 1, Standards 1 (the usage errors in one sentence): fixed at landing in `utils/check_coverage.py`: the usage errors are a list, one per line.
- Round 1, Behaviour 1 (a skill folder whose name starts with `-`): fixed at landing: the docstring states that such a folder is passed as `./<name>` with the heading `## ./<name>`; proved on main in a scratch repository with a folder `-x` and the heading `## ./-x`, `python3 utils/check_coverage.py docs/c.md skills ./-x` printed `ok: docs/c.md`, exit 0.
- Round 1, not checked: the ASCII check exits 0 when perl dies on a file it cannot decode, reproduced on main (a file holding `\377\376` printed `Malformed UTF-8 character (fatal)` and the command exited 0), and `.gitignore` does not ignore `__pycache__` (`grep -n pycache .gitignore` exits 1). Outside this step's brief; raised as open item C.

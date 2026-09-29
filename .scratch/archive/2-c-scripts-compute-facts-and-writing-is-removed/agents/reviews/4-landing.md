# Step 4 landing report

Roadmap entry 2.C (Scripts compute facts, and /writing is removed). Plan step 4 of 8: `--built` removed. Next: step 5, the rules.

## Open items

- C (2026-09-29), step 5: the ASCII check of the verify list (`docs/dev/building.md`, the command blocks of both change standards, this state file) exits 0 when perl dies on a file it cannot decode, since its `END` block sets the exit status: a file holding the bytes `\377\376` made it print `Malformed UTF-8 character (fatal)` and exit 0. `.gitignore` does not ignore `__pycache__`, so a `python3` import leaves such a file in the check's reach. Options: (a) step 5 is widened to end both, the command keeping perl's own non-zero status when it dies and `__pycache__/` added to `.gitignore` (and to `repo-setup`'s `.gitignore` template if it has the same gap); (b) a new step after step 6 does it; (c) leave it. Recommendation (a): step 5 rewrites the rule that each verify command exits non-zero when it fails, and this command breaks that rule, so the fix belongs with it. The lazy option is (c); (b) only moves the same work later.

## Agents stopped

The runner's agent listing, before anything in the worktree was committed, showed the step's builder gone and its two reviewers completed.

## Not done

Nothing of the step. Step 5 waits on open item C.

## What landed

- `utils/check_coverage.py`: the `--built` mode removed; an argument that starts with `-`, `--` included, refused first with `usage error: <argument>: not an argument this script takes`, exit 2; its docstring and comments one paragraph or bullet per line, the usage errors a list.
- `utils/check_coverage.test.sh`: the `built-*` cases and their fixtures removed; an `unknown-option` case over `--bogus`, `-q` and `--x`, which fails with the refusal removed.
- `docs/academic-coverage.md`: lines 30-35, the `--built` paragraph and command, removed.
- Users see: `--built` refused; a coverage list or skills root whose path starts with `-` passed as `./<path>`; a skill folder whose name starts with `-` passed as `./<name>` with the heading `## ./<name>`.

## What was found

- First review: one spec, three standards and one behaviour finding; four closed in repair round 1, the roadmap gates naming `--built` left to step 7.
- The run over round 1: one spec, one standards and one behaviour finding, each fixed at landing; the ASCII check's exit status raised as open item C.

## Verification on main

`sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md`, after the fixes at landing, printed the six `PASS:` lines, the ASCII check's empty output and `checks: 7 commands passed`, exit 0. `python3 utils/check_coverage.py --built paper docs/academic-coverage.md x y` printed `usage error: --built: not an argument this script takes`, exit 2. `git grep -n -e --built -- ':!.scratch' ':!docs/roadmap.md'` printed nothing, exit 1. The real list printed `ok: docs/academic-coverage.md`, exit 0.

## Usage

- Builder, claude:opus: 120438 tokens, 32 tool uses, 449 s (round 0, its case hand-back included); 148539 tokens, 13 tool uses, 324 s (round 1).
- Reviewer, claude:opus: 115131 tokens, 20 tool uses, 431 s; over round 1, 106448 tokens, 27 tool uses, 406 s.
- First report passed its bar: no. Fixes at landing: 3.

## Next

Step 5 waits on open item C.

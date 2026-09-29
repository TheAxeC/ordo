# Step 2 landing report

Roadmap entry 2.C (Scripts compute facts, and /writing is removed). Plan step 2 of 8: one landing script. Next: step 3, tag v2.2.0 and pin.

## Open items

- B (2026-09-29), step 3: tag main v2.2.0 at step 2's landing commit and run `utils/pin.sh v2.2.0`, so steps 4 to 7 run under the new `/land`, `/refute` and `/spec` texts and the installed skills lose `writing`. Options: (a) yes, now; (b) not yet, and steps 4 to 7 wait, since the plan blocks them on step 3. Recommendation (a): the pinned skills today are v2.1's, whose `/land` still asks for the ledger copies this ledger no longer has. The lazy option is none here; (b) only delays.

## Agents stopped

The runner's agent listing showed the builder gone and both reviewers of the step completed before anything in the worktree was committed; the one agent still running was a read-only research agent outside the step.

## Not done

Nothing of the step.

## What landed

- `skills/land/templates/land.sh` runs from the `land` skill as `sh <the land skill's folder>/templates/land.sh <state file> <step> <base>`. It reads `worktree_root` and `ledger_root` from `.agents/plan.yaml` in both forms and refuses a missing one with exit 64. It runs `checks.sh` from its own folder on main and refuses a missing `checks.sh` with exit 64 before anything is touched. It has no `ADAPT` edits, no `--no-browser`, no usage printing and no `node`.
- `skills/land/templates/checks.sh` runs the state file's `verify:` list through `bash -o pipefail -c`, prints each command and its output, stops at the first failure with exit 1, and refuses an unusable list with exit 2. `checks.test.sh` proves it in three cases, the failing case a pipeline that fails only under `pipefail`.
- `land.test.sh` holds four cases: a conflict, a ledger file left in the worktree, a failing check, and a clean landing.
- `verify.sh`, `verify.test.sh` and `usage.py` are deleted, and every text that named them is rewritten, `docs/academic-coverage.md` lines 155 and 177 included.
- The builder's and reviewers' usage sits in the dispatch entry (`builder_usage`, `reviewer_report`) until the landing report states it. The state file has no Usage table.
- On main at landing: this ledger's copies of `land.sh`, `land.test.sh`, `verify.sh` and `usage.py` are deleted, and the state file's verify list names `checks.test.sh` in place of `verify.test.sh`.

## What was found

- First review: twelve findings, each closed by the builder in repair round 1 under its ruling (`agents/briefs/2-round-1.md`), each closure reproduced by the run over the round.
- The run over round 1: five findings, each fixed at landing and closed in `agents/reviews/2-refuter.md`, Closed.

## Verification on main

`sh skills/land/templates/checks.sh .scratch/2-c-scripts-compute-facts-and-writing-is-removed/orchestrator-state.md`, after the fixes at landing:

```
PASS: land.sh scratch tests
PASS: checks.sh scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
PASS: check_coverage.py scratch tests
checks: 7 commands passed
```

Exit 0. `git grep -n -e verify.sh -e usage.py -e ADAPT -e no-browser -- ':!.scratch' ':!docs/roadmap.md'` printed nothing, exit 1.

## Usage

- Builder, claude:opus: 211705 tokens, 63 tool uses, 796 s (round 0); 263090 tokens, 24 tool uses, 322 s (round 1).
- Reviewer, claude:opus: 215961 tokens, 64 tool uses, 726 s; over round 1, 188512 tokens, 45 tool uses, 430 s.
- Orchestrator: 78 messages, 67875 output tokens, 48 minutes, a window that also holds the reading of the comparison repositories.
- First report passed its bar: no (twelve findings). Fixes at landing: 5.

## Next

Step 3 waits on open item B.

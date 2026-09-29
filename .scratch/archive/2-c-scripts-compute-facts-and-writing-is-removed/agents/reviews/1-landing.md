# Step 1, landing report

Roadmap entry 2.C (Scripts compute facts, and /writing is removed). Plan step 1 of 8: `/writing` and plan 3's edits removed. Next: step 2, one landing script with `checks.sh`.

## Open items

none.

## The check of Steps 1

The runner's agent listing showed neither step 1's builder nor its reviewer running; the one running subagent was a repository comparison, which is not a step agent.

## NOT DONE

Nothing of step 1. The installed skills under `~/.claude/skills` still include `writing` until step 3's pin.

## What landed

- `skills/writing/` deleted, its seven files. Before: the tree had a `writing` skill, `/writing <file>`, which ran `check_prose.py`. After: it has none.
- `skills/repo-setup/templates/docs/dev/prose-standard.md` back with its v2.0.0 content; `README.md`, `skills/repo-setup/SKILL.md`, `docs/dev/skill-layout.md`, `docs/academic-coverage.md` and `docs/dev/building.md` back to v2.0.0; `.agents/plan.yaml` names the restored prose standard; the `check_prose` command out of `docs/dev/change-standard.md`.
- Fix at landing: `skills/repo-setup/SKILL.md` line 154 names the prose standard for ASCII and one paragraph per source line, and the shared rules for no history.
- Ledger: `.scratch/3-the-writing-base/` and `.scratch/retros/2026-09-26/check_prose.py` deleted.
- Verification on main: `verify: 7 commands passed`, exit 0; the step's `git diff --cached v2.0.0` and `git grep --cached` checks as booked in `plan.md`.

## What was found

The refuter's four findings are closed in `agents/reviews/1-refuter.md`, Closed: a wrong count in the builder's report, corrected; partial quotes in the builder's report, replaced by the orchestrator's own runs in the booking; the `repo-setup` sentence, fixed at landing; the skill's removal missing from the report's user-visible changes, stated here and in the booking.

## Next

Step 2: `skills/land/templates/land.sh` as the only landing script, reading `.agents/plan.yaml`; `checks.sh` and its test as open item A ruled; `verify.sh`, its test and `usage.py` deleted, and every text naming them rewritten.

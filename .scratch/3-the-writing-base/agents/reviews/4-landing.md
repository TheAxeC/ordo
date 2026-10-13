# Landing report: step 4 of plan 3

Roadmap entry 3 (The writing base). Plan step 4 of 7: the repeated runs. Next: step 5, the second fixes, then main's head tagged `v7.1.0-rc.3` and pinned (ruling H).

## Open items

none

## The check of Steps 1

The runner's agent listing (`ListAgents`) showed none of the step's agents running. The reviewer over round 1, a7b58ef3a3bbf84be, was listed as completed. The builder was the session (executor inline), so there was no builder agent to stop.

## NOT DONE

- The step's check does not hold, so step 4 lands unticked, as ruling H says. 35 manuscript and 29 grant findings are not marked right by both markers, and gate conditions 1, 2, 3 (manuscript), 5 and 6 fail (`agents/reviews/4-report.md`).
- Steps 5, 6 and 7 of the plan are not started.

## What landed

The records of the repeated runs, all in the ledger: `agents/reviews/4-run/` (the two review reports and the four markers' marks), `agents/reviews/4-marks.md`, `agents/reviews/4-report.md`, `agents/reviews/4-refuter.md` with both runs and its Closed heading, this report, C70 in `.scratch/choices.md`, and in `plan.md` the booking, the Agents section, step 6's Step 0 and the Open item G line. The range 295b1e8..3-the-writing-base-4 holds no commit (`land.sh` printed `nothing to copy`), since the step was built inline in the main checkout's ledger.

## What was found

- The first review: Spec 1 to 3, Proof 1 to 3 and Standards 1 to 4, closed in repair round 1 (`agents/briefs/4-round-1.md`), Spec 1 by no change as its ruling says.
- The run over round 1: one Spec finding (the tense clause "prepend" had no place check), one Spec finding (a sentence of step 6's Step 0 took a decision for step 6), and one Proof finding ("could not be written" left out the runner's notice after the classifier stop). All three were fixed at landing.
- Carried to step 6's Step 0: the markers read the draft files with the file-reading tool only, the served model is read with no sleep, and the cause of the stopped marker starts is named for step 6's brief.

## Verification on main

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/land.sh .scratch/3-the-writing-base/orchestrator-state.md 3-the-writing-base-4 295b1e8
worktree git commit: nothing staged, no wip commit made
nothing to copy: 295b1e8..3-the-writing-base-4 holds no commit
PASS: land.sh scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
ok: the plan-terms block equals the template
PASS: pin.sh scratch tests
checks: 6 commands passed
land exit 0
```

After the fixes at landing, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/checks.sh .scratch/3-the-writing-base/orchestrator-state.md` printed the same five lines, the character-set check printing nothing, and `checks: 6 commands passed`.

## Usage, bar and fixes at landing

- Brief check ad1ea91040f763510, claude-opus-5-5: 196338 tokens, 47 tool uses, 8.2 min.
- Builder: the session (inline).
- Review agents: ae6cdd9db984557c9, claude-opus-5-5, 211130 tokens, 39 tool uses, 30.5 min (manuscript), and ad72ce97d4f621a3b, claude-opus-5-5, 134085 tokens, 6 tool uses, 10.3 min (grant).
- Markers, each claude-opus-5-5: a06df53aba5d3a063 244143 tokens, 32 tool uses, 14.3 min, a1adeaa151d894670 230831 tokens, 42 tool uses, 13.4 min, a0e8b92e8fd4f7258 118985 tokens, 8 tool uses, 5.5 min, and a17c2d12dd7e8cd3f 120846 tokens, 7 tool uses, 6.0 min. Three marker starts were stopped (a16a29426ffdd26f3, a620ea19667843403, a07ee5da81e8d1b27), and none of their output is used.
- Reviewer a3fe6a6fa48ceb52f, claude-opus-5-5: 328040 tokens, 57 tool uses, 10.8 min.
- Reviewer over round 1 a7b58ef3a3bbf84be, claude-sonnet-5-5: 284397 tokens, 80 tool uses, 10.3 min.
- The first report did not pass its bar. Repair round 1 closed its findings, and the three findings of the run over round 1 were fixed at landing, listed in `plan.md`'s booking and in `4-refuter.md`, Closed.

## Next

Step 5 through `/spec 3 5`: fix each finding of `4-marks.md` not marked right by both and each gate failure `4-report.md` names in `skills/writing/SKILL.md` or `skills/writing/references/`. After its landing, tag main's head `v7.1.0-rc.3` and run `sh utils/pin.sh v7.1.0-rc.3`, approved by ruling H. Then step 6, the third runs.

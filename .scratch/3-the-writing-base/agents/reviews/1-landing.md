# Landing report: step 1 of plan 3

Roadmap entry 3 (The writing base). Plan step 1 of 4: the writing base and `/writing`. Next: step 2, the runs.

## Open items

none

## The check of Steps 1

The runner's agent listing (`ListAgents`) showed none of the step's agents: the builder ad8dec496562b2dbf, the reviewer ad97ac04e6f24c9ae and the reviewer over round 1 a15e1830c0fcc52fe had each ended with a completion notice.

## NOT DONE

Nothing of step 1. Steps 2 to 4 of the plan are not started.

## What landed

The landing commit holds 20 files of the step and this plan's ledger records. `skills/writing/` is a new skill: `SKILL.md` 1.0.0 (`/writing <file>` and `/writing <project> <file>`, one fresh agent on `reviewer` at `reviewer_effort`, the report shown whole and nothing applied), `references/rules.md`, `references/registers.md` and `templates/docx_paragraphs.py`. The prose standard's section C gains "In today's rapidly evolving" and "As a matter of fact". The term **finding** gains its `/writing` sense, and **effort agent**, **reviewer** and **standards** name `writing`, synced into `docs/glossary.md`. Coverage rows 76, 100 and 101 name their files in `skills/writing/`. `README.md`, `docs/dev/scripts.md`, the five agent definitions, `plan`'s `templates/plan.yaml` (`plan` 4.0.1), `repo-setup` (5.1.0) and the three comments of `.agents/plan.yaml` the user ruled (Open item C) name `writing`.

## What was found

- The brief check: 16 findings, closed in the brief; Open item B closed under self-rule (C68); Open item C ruled (a) by the user.
- The first review: Spec S1 to S4, Proof P1, Standards St1, all closed in repair round 1.
- The review over round 1: Spec S1, closed with no change (C27's first run before the round is the reviewer's run on the snapshot, `1: AnchorBoxBox`); Standards S1, fixed at landing.

## Fixes at landing

1. `skills/writing/templates/docx_paragraphs.py`: `first_choice` takes the first `mc:Choice` with `next(...)`, and the two `is not None` guards are removed, so an `mc:AlternateContent` with no `mc:Choice` ends with Python's traceback and exit status 1, as the head comment now says. Cause: a guard that silently skips work. After the fix, C27 printed `1: Anchor` and `2: Box` with exit 0, a scratch file with only an `mc:Fallback` printed `StopIteration` with exit 1, and the four ENW-XS forms print each footer's text box once.

## Verification on main

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude-backup/skills/land/templates/checks.sh .scratch/3-the-writing-base/orchestrator-state.md
PASS: land.sh scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
ok: the plan-terms block equals the template
PASS: pin.sh scratch tests
checks: 6 commands passed
$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
ok: docs/academic-coverage.md
```

`land.sh` itself exited 0 with the same six checks passing before the fix at landing. A/B: none. Look: none configured.

## Agents

- Brief check ac0e79251e07d0d2c, claude-opus-5-5: 236990 tokens, 70 tool uses, 12.9 min.
- Builder ad8dec496562b2dbf, claude-sonnet-5-5: 161914 tokens, 124 tool uses, 26.5 min (round 0); 237707 tokens, 29 tool uses, 6.3 min (round 1).
- Reviewer ad97ac04e6f24c9ae, claude-opus-5-5: 288794 tokens, 70 tool uses, 12.0 min.
- Reviewer over round 1 a15e1830c0fcc52fe, claude-sonnet-5-5: 221572 tokens, 51 tool uses, 8.9 min.

The builder's first report did not pass its bar (six findings of the first review); one fix at landing.

## Next

Step 2: `/writing` run on copies, under the session's scratch folder, of the real manuscript and of one grant `.docx`, each finding marked right or wrong by two fresh reviewer agents, the marks in `agents/reviews/2-marks.md`.

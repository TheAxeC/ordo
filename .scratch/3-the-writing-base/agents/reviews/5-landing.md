# Landing report: step 5 of plan 3

Roadmap entry 3 (The writing base). Plan step 5 of 7: the second fixes. Next: main's head tagged `v7.1.0-rc.3` and pinned (ruling H), then step 6, the third runs.

## Open items

none

## The check of Steps 1

The runner's agent listing (`ListAgents`) showed no agent of the step: the builder a2237d2ff6d37342a, the reviewer abc52e37d862af422 and the reviewer over round 1 ac11b15dbd17b34b2 had all completed. It listed only two peer sessions, research-hub-ae and workspace-39, which are not agents of this plan.

## NOT DONE

- Whether the review agent following the changed text reports right findings is not known yet. That is step 6's check, on the runs pinned at `v7.1.0-rc.3`.
- The tag `v7.1.0-rc.3` and the pin follow this landing's commit.

## What landed

`skills/writing/SKILL.md`, `skills/writing/references/rules.md` and `skills/writing/references/registers.md` (3 files changed, 49 insertions, 15 deletions against e691c84), with the brief's 16 kinds of fix as the rulings of repair round 1 shape them. In the ledger: the brief, the brief check, the builder's report `5-report.md`, the refuter report `5-refuter.md` with both runs and its Closed heading, the round brief, this report, the booking in `plan.md` with step 5 ticked, and the state file.

## What was found

- The first review: Spec 1 and 2, Proof 1 and 2, Standards 1 to 4 and Behaviour 1 and 2, closed in repair round 1 (`agents/briefs/5-round-1.md`). Ruling 1 is the orchestrator's: the condition on the never-cut sentence stays, and a vague qualifier is cut where a definition or the draft's own data make the claim hold in every case (manuscript 61).
- The run over round 1: Proof 1 (the report's sentence-length reading and the forms of grant 7 and 11), Proof 2 (grant 30, 33 and manuscript 19 not written out whole, and one table path) and Behaviour 1 (a defined-term example the new sentence does not produce). All three are in `5-report.md` and were fixed at landing.

## Verification on main

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/land.sh .scratch/3-the-writing-base/orchestrator-state.md 3-the-writing-base-5 e691c84
PASS: land.sh scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
ok: the plan-terms block equals the template
PASS: pin.sh scratch tests
checks: 6 commands passed
land exit 0
```

The character-set check, the sixth command, printed nothing.

## Usage, bar and fixes at landing

- Brief check a31fba24d82d7a955, claude-opus-5-5: 285071 tokens, 46 tool uses, 9.5 min.
- Builder a2237d2ff6d37342a, claude-sonnet-5-5: 116700 tokens, 75 tool uses, 17.5 min, and 255146 tokens, 31 tool uses, 9.7 min in round 1.
- Reviewer abc52e37d862af422, claude-opus-5-5: 290609 tokens, 45 tool uses, 10.4 min.
- Reviewer over round 1 ac11b15dbd17b34b2, claude-sonnet-5-5: 314172 tokens, 55 tool uses, 12.1 min.
- The builder's first report did not pass its bar. Repair round 1 closed its findings, and the three findings of the run over round 1 were fixed at landing in `5-report.md`, listed in `plan.md`'s booking and in `5-refuter.md`, Closed.

## Next

Tag main's head `v7.1.0-rc.3` and run `sh utils/pin.sh v7.1.0-rc.3`, approved by ruling H. Then step 6, the third runs, with step 6's Step 0 carried into its brief.

# Landing report: step 3 of plan 3

Roadmap entry 3 (The writing base). Plan step 3 of 5: the fixes. Next: main's head tagged `v7.1.0-rc.2` and pinned (ruling F), then step 4, the repeated runs.

## Open items

none

## The check of Steps 1

The runner's agent listing (`ListAgents`) showed none of the step's agents running: the reviewer over round 1 a8a5490e9ef2bc1ad was listed as completed, and the builder a248d03293a97a4ad and the reviewer abfeeaa9da306797f were not listed.

## NOT DONE

- The tag `v7.1.0-rc.2` and the pin come after this commit, as ruling F says.
- Steps 4 and 5 of the plan are not started. Whether the review agent following the changed text reports right findings on the two drafts is step 4's check.

## What landed

`skills/writing/SKILL.md` and `skills/writing/references/rules.md`, with the fixes at landing; `references/registers.md` unchanged; the version stays 1.0.0. The landing commit also holds the step's ledger record: `agents/reviews/3-report.md`, `agents/reviews/3-refuter.md`, this report, `plan.md` (the booking, step 3 ticked, the agents, step 4's Step 0) and the state file.

## What was found

- The first review: Spec 1 to 4, Proof 1, Standards 1 to 5 and Behaviour 1, closed in repair round 1 (`agents/briefs/3-round-1.md`).
- The run over round 1: Standards 1 (the place check split from its object), Standards 2 (a quote form and a replacement form in one bullet) and Behaviour 1 ("Paragraph point" given another rule's example), all fixed at landing.
- The step 2 copies of the manuscript and the grant are no longer on disk. Step 4's Step 0 in `plan.md` books that step 4 copies them again from research-hub and checks them before its runs.

## Verification on main

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude-backup/skills/land/templates/land.sh .scratch/3-the-writing-base/orchestrator-state.md 3-the-writing-base-3 aa513eb
PASS: land.sh scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
ok: the plan-terms block equals the template
PASS: pin.sh scratch tests
checks: 6 commands passed
land.sh exit 0
```

After the fixes at landing, `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude-backup/skills/land/templates/checks.sh .scratch/3-the-writing-base/orchestrator-state.md` printed `checks: 6 commands passed`, and `grep -n -E '[^[:space:]] - | -- ' skills/writing/SKILL.md` exit 1. A/B: none. Look: none configured.

## Usage, bar and fixes at landing

- Brief check ac0b534b48b96acce, claude-opus-5-5: 247327 tokens, 53 tool uses, 11.4 min.
- Builder a248d03293a97a4ad, claude-sonnet-5-5: 226692 tokens, 27 tool uses, 7.0 min to its hand-back of a case; 274154 tokens, 42 tool uses, 11.5 min after the cases ruling; 314361 tokens, 14 tool uses, 2.7 min in round 1.
- Reviewer abfeeaa9da306797f, claude-opus-5-5: 228244 tokens, 40 tool uses, 8.6 min.
- Reviewer over round 1 a8a5490e9ef2bc1ad, claude-sonnet-5-5: 210747 tokens, 33 tool uses, 4.1 min.
- The first report did not pass its bar; repair round 1 closed its findings, and the three findings of the run over round 1 were fixed at landing, listed in `plan.md`'s booking and in `3-refuter.md`, Closed.

## Next

Tag main's head `v7.1.0-rc.2` and run `sh utils/pin.sh v7.1.0-rc.2`, approved by ruling F. Then step 4 through `/spec 3 4`: copy the two drafts again, run `/writing` on each in its own turn, have four fresh markers mark the findings, and read the gate.

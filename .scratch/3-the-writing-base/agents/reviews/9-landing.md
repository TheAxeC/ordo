# Landing of step 9 of plan 3

Roadmap entry 3, the writing base. Step 9 of 10, the last fixes: landed and ticked. Next: tag `v7.1.0-rc.5` on main's head and pin (approved by ruling I), then step 10, the closing, whose `v7.1.0` tag and pin wait for the user's approval.

## Open items

none

## The check before landing

No agent of the step was still running: the runner's agent listing showed no subagent, only one peer session outside this plan.

## NOT DONE

Nothing of step 9. The failures of gate condition 6 concern the markers' prompts, commands and reasons, no text of `/writing`; step 9 does not fix them, and the closing report names them. No run of the changed skill follows, by ruling I.

## What landed

`skills/writing/SKILL.md` and `skills/writing/references/rules.md` (2 files changed, 68 insertions, 34 deletions against 1077fe4); `references/registers.md` unchanged; the version stays 1.0.0. With them: `agents/reviews/9-report.md`, `agents/reviews/9-refuter.md` with the run over round 1 and its Closed heading, this report, the booking in `plan.md` and the state file.

The review agent's prompt now asks that a replacement end every break the passage holds; treats words of size or degree as vague qualifiers; replaces a word of frequency by a share or a count where the draft does not hold the claim in every case; has a new name cover exactly the set of the passage's name; counts first use from the title; has a group line name the reader's loss at the place of one finding; and runs "The last pass" as 16 numbered operations. `rules.md` widens the "many studies" and "some researchers" rows, adds "robust" in its statistical sense, and has "Reader's question per section" read the section whole.

## What was found

- The first review found Spec 1 and 2, Proof 1 and 2 and Standards 1 to 6, closed in repair round 1 (`agents/briefs/9-round-1.md`).
- The run over round 1 found Standards 1 to 5, all in `SKILL.md`, all fixed at landing.

## Fixes at landing

1. Operation 5 names "those it names in a line of their own" in place of the undefined "Also breaks" line.
2. Operation 12 checks a number against the same quantity in the draft; a new operation 13 lists the measures of a relation; the pass now has 16 operations.
3. Operation 6's passive sentence becomes "Read the whole section the passage stands in."
4. The renaming bullet names "exactly the set the passage's name covers"; the bare prohibition and "A size is not that share or count." are removed.
5. "because of its breaks" becomes "because of the group's breaks".

## Verification on main

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude-backup/skills/land/templates/land.sh .scratch/3-the-writing-base/orchestrator-state.md 3-the-writing-base-9 1077fe4` exit 0, and `checks.sh` under the same `env -u` after the fixes at landing: `PASS: land.sh scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `ok: the plan-terms block equals the template`, `PASS: pin.sh scratch tests`, the character-set check printing nothing, `checks: 6 commands passed`. A/B: none. Look: none configured.

## Agents' usage

Brief check aa2534267459358b5 claude-opus-5-5 216006 tokens, 43 tool uses, 9.8 min; builder aba3c07cc124b6961 claude-sonnet-5-5 116878 tokens, 83 tool uses, 20.0 min, and 198183 tokens, 21 tool uses, 5.7 min in round 1; reviewer a9dcaf7661d9c1ae9 claude-opus-5-5 228107 tokens, 44 tool uses, 10.4 min; reviewer over round 1 a52d49d8b5f66bfc8 claude-sonnet-5-5 208984 tokens, 35 tool uses, 7.2 min.

The builder's first report did not pass its bar: the first review's ten findings were closed in repair round 1, and the run over round 1's five findings at landing.

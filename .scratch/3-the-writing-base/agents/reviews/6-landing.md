# Landing report: step 6 of plan 3

Roadmap entry 3 (The writing base). Plan step 6 of 7: the third runs. Next: the user's ruling on Open item I, then the step it adds or the closing.

## Open items

- Open item I (2026-10-13), step 6's check failed. The third runs still give findings the two markers do not both mark right: 20 of 191 in the manuscript and 13 of 74 in the grant, against 35 and 29 at step 4. Example: grant finding 11.3 gives "Passage and replacement as in 5.1" instead of the text, which `SKILL.md` already forbids. Gate conditions 1, 2, 5 and 6 fail (`agents/reviews/6-report.md`). Step 7, the closing, cannot pass the gate as things stand.
  - (a) Recommended. Add step 7, the third fixes: each of the 33 rows and each gate failure fixed in `skills/writing/SKILL.md` or `skills/writing/references/`. Where `SKILL.md` already has the rule and the agent broke it anyway (the 8 references to other findings, the sentence lengths), the fix is a last pass in the review agent's prompt: before it hands back, it checks each finding against the finding rules and rewrites the ones that break them. The markers' prompts also say that `grep` runs only on the draft's files. After landing, tag `v7.1.0-rc.4` and pin with `sh utils/pin.sh v7.1.0-rc.4` (approved by this ruling). Step 8 repeats the runs and the marks. The closing becomes step 9. Pro: it is what the gate and step 6's check ask for, and the failures fell by half from step 4 to step 6. Con: two more steps of the size of steps 5 and 6, and one more round may still not reach zero.
  - (b) Add step 7, the fixes as in (a), and go straight to the closing with no further runs. Pro: half the cost. Con: nothing shows the fixes work, and step 6's check stays failed. This is the lazy option.
  - (c) Close the plan now with steps 4 and 6 unticked. Con: the gate fails, so `/roadmap done 3` cannot honestly tick the entry.

## The check of Steps 1

The runner's agent listing (`ListAgents`) showed no agent of the step: the six run agents and markers, the brief check a3e0cceb00ecca6b5, the reviewer a93f0aad040198357 and the reviewer over round 1 a03b4e5b01f526569 had all completed. It listed only two peer sessions, research-hub-ae and workspace-39, which are not agents of this plan.

## NOT DONE

- Step 6's check does not hold, so the step lands unticked: 20 manuscript rows and 13 grant rows are not marked right by both markers, and gate conditions 1, 2, 5 and 6 fail (`agents/reviews/6-report.md`, `agents/reviews/6-marks.md`). Open item I asks what follows.

## What landed

The records of the third runs, all in the ledger: `agents/reviews/6-run/` (the two review reports, the four markers' marks and the two manuscript markers' reasons files), `agents/reviews/6-marks.md`, `agents/reviews/6-report.md`, the refuter report `6-refuter.md` with both runs and its Closed heading, this report, the booking in `plan.md` with step 6 unticked, and the state file. No file outside the ledger changes: the range 178bc42..3-the-writing-base-6 holds no commit.

## What was found

- The first review: Spec 1, Proof 1 to 5 and Standards 7, all in the record, closed in repair round 1 (`agents/briefs/6-round-1.md`). In that round the two manuscript markers were each resumed once for their missing reasons and changed no mark.
- The run over round 1: Spec 1, Proof 1 and Standards 1, all in `6-report.md`, fixed at landing.

## Verification on main

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/land.sh .scratch/3-the-writing-base/orchestrator-state.md 3-the-writing-base-6 178bc42
nothing to copy: 178bc42..3-the-writing-base-6 holds no commit
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

- Usage: brief check a3e0cceb00ecca6b5 claude-opus-5-5 197104 tokens, 48 tool uses, 7.6 min; builder inline (the session); review agents a99cdbe7fbe41e52f 208276 tokens, 70 tool uses, 32.2 min and a7997258e999ed0be 132487 tokens, 6 tool uses, 10.0 min; markers af9e18c06b5359637 224746 tokens, 42 tool uses, 12.3 min (231078 tokens in total, 1 tool use, 0.7 min on its resume), a497a69fded97a0ab 214918 tokens, 41 tool uses, 11.0 min (276105 tokens in total, 31 tool uses, 1.9 min on its resume), af17cd67cb401d1dd 114985 tokens, 7 tool uses, 5.0 min and aa0fae041cb07f141 118836 tokens, 7 tool uses, 5.5 min; reviewer a93f0aad040198357 claude-opus-5-5 59333 tokens, 66 tool uses, 9.5 min; reviewer over round 1 a03b4e5b01f526569 claude-sonnet-5-5 227502 tokens, 53 tool uses, 8.1 min.
- The builder's first report did not pass its bar: gate condition 2 was not listed group by group, the claim that every list of places gives full paths was false, C8 was reported met while many manuscript marks had no reason of their own, the markers' commands were misdescribed, the markers' totals were not explained, the report reads were described as whole, and `6-report.md` was missing from "Files".
- Fixes at landing: 1. `6-report.md`, gate condition 6 states each manuscript marker's resume, its message naming rows only, the two reasons files with 87 and 123 reasons and no mark changed. 2. `6-report.md`, C8 states that 47 of marker 1's 67 tense reasons and 44 of marker 2's 67 name only the tense category and the new verb. 3. `6-report.md`, the long sentences of C1, C8, C10, conditions 1, 2 and 6 and the judgment call split, and the repeated note on which marker named a group line replaced by one sentence.

## Next

The user's ruling on Open item I.

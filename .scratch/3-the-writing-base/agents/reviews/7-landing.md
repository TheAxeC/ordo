# Landing report: step 7 of plan 3

Roadmap entry 3 (The writing base). Plan step 7 of 10: the third fixes. Next: main's head tagged `v7.1.0-rc.4` and pinned with `sh utils/pin.sh v7.1.0-rc.4`, as ruling I approves, then step 8, the fourth runs, the last runs.

## Open items

none

## The check of Steps 1

The runner's agent listing (`ListAgents`) showed no agent of the step: the brief check a50f0c31ddca5b769, the builder a09a39ebd2fcccd6b, the reviewer afe8061d591582615 and the reviewer over round 1 a5ac0aefa8b6630f9 had all completed.

## NOT DONE

none

## What landed

`skills/writing/SKILL.md` (238 lines) and `skills/writing/references/rules.md` (223 lines), 2 files changed, 46 insertions, 8 deletions against c99b4a6; the version stays 1.0.0. Also in the ledger: the builder's report `7-report.md`, the refuter report `7-refuter.md` with both runs and its Closed heading, this report, the booking in `plan.md` with step 7 ticked, and the state file.

- The review agent's prompt gains "The last pass": before its final message the agent rereads each finding and group line against "What you report", "A finding", "How you group them" and the named section, rewrites one that breaks a rule at most twice, keeps one that still breaks a rule with a line naming that rule, and drops a finding only where its passage is not reported or an earlier group already gives it.
- A passage or a place that breaks two or more rules is given once, in the first group that reaches it, naming the other rules by page and section.
- The bracket for a vague qualifier names the number, the share of cases or the specific claim, with no "or" alternative that leaves the claim universal.
- `rules.md`: "Terms defined at first use" covers a term the draft never defines; "Hedging" reports no passage whose device already has the right strength and asks one strength per claim; "Explanation of evidence" reaches only evidence for a claim the paragraph makes.

## What was found

- The brief check: every finding closed in the brief (`7-brief-check.md`, Closed).
- The builder's first read handed back case C1, ruled in `agents/briefs/7-cases.md` (637b5a7).
- The first review: S1, P1 to P4, T1 to T3, B1 and B2, closed in repair round 1 (`agents/briefs/7-round-1.md`, ad89b11).
- The run over round 1: P1, P2, T1 to T6, B1 and B2, all fixed at landing.

## Verification on main

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/land.sh .scratch/3-the-writing-base/orchestrator-state.md 3-the-writing-base-7 c99b4a6
PASS: land.sh scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
ok: the plan-terms block equals the template
PASS: pin.sh scratch tests
checks: 6 commands passed
land exit 0
```

`sh skills/land/templates/checks.sh .scratch/3-the-writing-base/orchestrator-state.md`, run again after the fixes at landing, printed the same five lines and `checks: 6 commands passed`, exit 0. The character-set check, the sixth command, printed nothing. The verify page is unchanged since the base (`git diff --quiet c99b4a6 HEAD -- docs/dev/building.md docs/dev/change-standard.md` exit 0). A/B: none. Look: none configured.

## Usage, bar and fixes at landing

- Usage: brief check a50f0c31ddca5b769 claude-opus-5-5 175635 tokens, 39 tool uses, 6.8 min; builder a09a39ebd2fcccd6b claude-sonnet-5-5 183556 tokens, 21 tool uses, 3.0 min for the first read, 215978 tokens, 15 tool uses, 2.9 min after the cases ruling, and 252539 tokens, 10 tool uses, 2.6 min in round 1; reviewer afe8061d591582615 claude-opus-5-5 198184 tokens, 40 tool uses, 8.0 min; reviewer over round 1 a5ac0aefa8b6630f9 claude-sonnet-5-5 203204 tokens, 37 tool uses, 6.8 min.
- The builder's first report did not pass its bar: two sentences of "Terms defined at first use" contradicted each other, fix 2's form repeated a passage under several groups, the last pass's rewrite had no count, "full path" named the place's path a second way, two added sentences ran 42 and 29 words, and the report missed output lines, long sentences and two user-visible changes.
- Fixes at landing: 1. `SKILL.md`, the passage rule and the two-list place rule made one rule, with the list exception as a sub-bullet. 2. `SKILL.md`, "What you report" makes the last pass's still-breaks line part of its finding. 3. `SKILL.md`, the last pass drops a finding whose passage an earlier group gives and checks that no passage is given twice. 4. `SKILL.md`, the bracket sentence and the still-breaks sentence split. 5. `SKILL.md`, the vague-qualifier check names the forms of "A finding". 6. `7-report.md`, the counts 17 and 16, the escaped table pipes, and the before and after of each "Elsewhere" change.

## Next

Main's head tagged `v7.1.0-rc.4` and pinned, then `/spec 3 8`.

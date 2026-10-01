# Step 7 landing report

Roadmap entry 2.E.A, self-rule. Plan step 8 of 14 (steps 1 to 13 and 6b), step 7, `next_entry`. Next: step 8, the terms of D24.

## Open items, verbatim

None.

## The check of Steps 1

The runner's agent listing (ListAgents) showed no agent of this session, only the peer session research-hub-aa: the builder a5ab075c3677ad2d7 and the reviewers acaa1cd6ca52da97e and ad8e8ad9c3dbbb136 had finished, each with its completion notice.

## NOT DONE

Nothing of step 7. Whether the run behaves as the text says (the next entry taken, resumed, refused) is step 9's run, as the plan's "## Gate" line for step 7 says.

## What landed with the commit

- The section "Next-entry mode" of `skills/plan-orchestration/references/self-rule.md`, with the `/grill` and `/plan` choices in "The choices file" and "The review of a choice", and the `Booked:` line naming the bullet by its opening words (`templates/choices.md`).
- `/grill <entry> --self-rule` and `/plan <entry> --self-rule`, each refused unless `.agents/plan.yaml` holds `self_rule: on` and `next_entry: on` (C1, agreed).
- `/roadmap add` under a "(self-rule)" quoted ruling for work a finding of a running plan names, the finding checked in its report (C2, agreed).
- `plan-orchestration` going on after the closing under both keys; the term **next-entry mode** and the amended **quoted ruling** and **rulings file**; README lines 16, 22, 48 and 56; ADR 0005's Consequences; the `next_entry` comment of the state template.
- 11 files, 153 insertions, 49 deletions.

## What was found

- The first review found fifteen findings (Spec 1 to 5, Standards 1 to 8, Behaviour 1 and 2), ruled in `agents/briefs/7-round-1.md` with a fourteenth ruling from step 8's first review.
- The run over round 1 gave twelve rulings "holds" and rulings 3 and 12 "partial", and found Spec 1, Standards 1 to 4 and Behaviour 1. All six were fixed at landing, each named in `agents/reviews/7-refuter.md` "Closed".

## Verification on main

`sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, after the fixes at landing, printed the nine `PASS:` lines, `ok: the plan-terms block equals the template`, the ASCII check with no output and `checks: 11 commands passed`, exit 0. Descriptions: grill 877, plan 477, roadmap 1022, plan-orchestration 961 characters. A/B: none (`bench: []`). Look: none (`look:` empty).

## Usage, the bar, the fixes at landing

- Brief check acf5b218dfdc17a01, claude-opus-5-5: 234387 tokens, 38 tool uses, 10 min 19 s.
- Builder a5ab075c3677ad2d7, claude-sonnet-5-5: 194415 tokens, 20 tool uses, 6 min 27 s (the first run of the cases, handed back); 282087 tokens, 46 tool uses, 15 min 29 s (the build); 343160 tokens, 16 tool uses, 4 min 28 s (round 1).
- Reviewer acaa1cd6ca52da97e, claude-opus-5-5: 255946 tokens, 43 tool uses, 8 min 54 s.
- Reviewer over round 1 ad8e8ad9c3dbbb136, claude-sonnet-5-5: 287831 tokens, 53 tool uses, 10 min 8 s.
- The builder's first report did not pass its bar. Fixes at landing: 6.

## What is next

Step 8 lands on top of step 7: its review over round 1 found one stale passage in its builder's report, fixed at its landing. Then step 9, the gate's `next_entry` run on a scratch repository.

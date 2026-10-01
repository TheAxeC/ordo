# Step 11b landing report

Roadmap entry 2.E.A, self-rule. Plan step 13 of 16 (steps 1 to 13, 6b, 11b and 11c), step 11b, the closing of a plan whose ledger names no agent. Next: step 11c, `checks.sh` runs every command of the verify list.

## Open items, verbatim

- Open item J (2026-10-01): your reading of step 10's page, `.scratch/2-e-a-self-rule/agents/reviews/10-cost.md`, the priced usage of plans 2.E and 2.E.A and the brief checks that met dictated text. Kind 5; it blocks no step. Reply `Read` when it is as it should be, or name what is wrong.
- Open item K (2026-10-01): your reading of step 11's page, `.scratch/2-e-a-self-rule/agents/reviews/11-self-rule.md`, how this plan's open items ended under self-rule. Kind 5; it blocks no step. Reply `Read` when it is as it should be, or name what is wrong.

## The check of Steps 1

The runner's agent listing (ListAgents) showed no agent of this session, only the peer session research-hub-aa: the builder a3c9ead7c223bb0bb and the reviewers ae0429a05481f2c42 and abb9f0a46653f8ea9 had ended, each with its completion notice.

## NOT DONE

Nothing of step 11b.

## What landed with the commit

- `skills/plan/SKILL.md` Steps 2: the closing step skips the cost script only when `plan.md` has its `## Agents` heading with no bullet under it and the ledger has no `agents/agent-roles.md`; it then writes the closing report with the sentence "The plan started no agent: `plan.md`'s Agents section holds no agent bullet and the ledger has no `agents/agent-roles.md`, so the closing step did not run the cost script." and the folder moves. Every other ledger goes to the script, whose non-zero exit holds the folder.
- `skills/plan/templates/plan.md:21`, `skills/plan-orchestration/SKILL.md` "Usage", the terms **closing report** and **closing step** in `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`, and `README.md:151`, read with it.
- `skills/plan-orchestration/templates/plan_cost.py` unchanged.
- 6 files, 13 insertions, 10 deletions.

## What was found

- The first review found two findings: the glossary wording departed from the brief's item 4 (Spec 1), and one bullet of `skills/plan/SKILL.md` held two rules (Standards 1). It also declined to judge a misreadable README sentence from the brief. Ruled in `agents/briefs/11b-round-1.md`: the builder's glossary wording kept, since the brief's was false for case 6; the bullet split; the README sentence rewritten.
- The run over round 1 gave every item "holds" and every case "met", and found three passages of the builder's report not brought to the round's end state, fixed at landing, with the README sentence's repeat of "the plan" and "a plan".

## Verification on main

`sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, after the fixes at landing:

```
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/land/templates/checks.test.sh 2>&1 | tail -1
PASS: checks.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ sh skills/repo-setup/templates/hooks/git_guard.test.sh 2>&1 | tail -1
PASS: git_guard.py scratch tests
$ sh skills/session-retro/templates/transcript_window.test.sh 2>&1 | tail -1
PASS: transcript_window.py scratch tests
$ sh skills/plan-orchestration/templates/plan_cost.test.sh 2>&1 | tail -1
PASS: plan_cost.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 11 commands passed
```

A/B: none (`bench: []`). Look: none (`look:` empty).

## Usage, the bar and the fixes at landing

- Brief check a4833282be61ec94d, claude-opus-5-5, 136896 tokens, 35 tool uses, 5 min 13 s.
- Builder a3c9ead7c223bb0bb, claude-sonnet-5-5, 109507 tokens, 21 tool uses, 4 min 39 s (the build); 126046 tokens, 8 tool uses, 2 min 47 s (round 1).
- Reviewer ae0429a05481f2c42, claude-opus-5-5, 178338 tokens, 35 tool uses, 7 min 28 s; reviewer over round 1 abb9f0a46653f8ea9, claude-sonnet-5-5, 131465 tokens, 27 tool uses, 5 min 35 s.
- The builder's first report did not pass its bar: two findings in the first review.
- Fixes at landing: 4, `README.md:151` and three passages of the builder's report, each named in `agents/reviews/11b-refuter.md` "Closed".

## Next

Step 11c through `/spec`, the builder, `/refute` and `/land`; then step 12 under ruling L; then step 9 under ruling I.

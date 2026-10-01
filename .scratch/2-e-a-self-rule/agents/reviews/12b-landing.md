# Step 12b landing report

Roadmap entry 2.E.A, self-rule. Plan step 16 of 17 (steps 1 to 13, 6b, 11b, 11c and 12b), step 12b, how a "(self-rule)" ruling names a finding of each kind of report. Next: step 9, the gate's `next_entry` run, under ruling I.

## Open items, verbatim

None.

## The check of Steps 1

The runner's agent listing (ListAgents) showed one agent of step 12b, the reviewer over round 1 ae3638bef5f010d8f, as completed, and the peer session research-hub-aa. The builder a8ad5a883f593d085 and the reviewer af6d65d9212d1b716 had ended, each with its completion notice.

## NOT DONE

Nothing of step 12b.

## What landed with the commit

- `skills/roadmap/SKILL.md`, "What it reads" 6: how a "(self-rule)" `/roadmap add` bullet names its finding.
  - Every bullet gives the report's path and the heading as the report writes it.
  - A refuter report or a brief-check report adds the finding's number.
  - A finding of a run over a repair round adds `round <n>`, and the reviewer's section where the run has one per reviewer.
  - Under a "Findings" heading grouped by labels, the label stands for the heading; an ungrouped list uses "Findings".
  - A diagnosis record or a landing report gives the heading alone, and `/roadmap` reads the whole text under it.
- `skills/diagnose/SKILL.md` Steps 2 and `skills/diagnose/templates/diagnosis.md`: a later diagnosis is appended at the level of the record's title.
- `skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`: the term **finding** gains the sense for a landing report or a diagnosis record.
- 5 files, 15 insertions, 6 deletions. Versions unchanged: this plan already raised each of the three skills once.

## What was found

- The brief check found that the first dictated text could not name a finding of a run over a repair round, and that a diagnosis record's first heading names a symptom. Both were closed in the brief before the build.
- The first review found four more gaps, each closed in repair round 1:
  - a "Findings" list grouped by labels;
  - the level of a later diagnosis's heading;
  - the reviewer's section in the reading;
  - the sense of **finding**.
- The run over the round found every ruling done, and no report shape on the tree the text cannot name. Its three wording points were fixed at landing:
  - two long sub-bullets split into one rule per bullet;
  - the ungrouped "Findings" list named;
  - the builder's report corrected.
- My brief miscounted the bullets under `12-landing.md` "What was found" (five, not six). It is corrected in the ledger.

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

## Usage

- Brief check aec3edbb8b9d18992, claude-opus-5-5: 163475 tokens, 46 tool uses, 7 min 27 s.
- Builder a8ad5a883f593d085, claude-sonnet-5-5:
  - 125161 tokens, 34 tool uses, 9 min 12 s (the build);
  - 158649 tokens, 17 tool uses, 7 min 18 s (round 1).
- Reviewer af6d65d9212d1b716, claude-opus-5-5: 164736 tokens, 41 tool uses, 10 min 7 s.
- Reviewer over round 1 ae3638bef5f010d8f, claude-sonnet-5-5: 214322 tokens, 54 tool uses, 10 min 22 s.
- The builder's first report did not pass its bar.
- Fixes at landing: 3.

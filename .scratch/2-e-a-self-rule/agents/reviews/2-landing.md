# Step 2 landing report

Roadmap entry 2.E.A (self-rule). Plan step 2 of 14: every agent's id recorded with its role. Next: step 3, the run over a repair round on `repair_reviewer` and the brief check's line-by-line hold on dictated text.

Open items: none.

Agents stopped before the landing: the runner's agent listing showed one agent of this session, the reviewer over round 1 (ae5cc0ca5a0659313), completed; the stop tool found no running task for the builder (af948d39c18780b67) or the first reviewer (aec84f54a17e39016).

NOT DONE: nothing.

Landed with this commit:
- `skills/plan/templates/plan.md`: a `## Agents` section, one bullet per agent, `- <agent id>: <role>, <served model>`, with a sentence naming every writer.
- `skills/land/SKILL.md`: the booking, and a back-out, append the step's agents to the Agents section, each id once, read back.
- `skills/grill/SKILL.md`: each lookup agent, a stopped one included, written to the plan's or the rulings file's Agents section; its introduction, description and closing list name them.
- `skills/plan/SKILL.md`: a rulings file's Agents bullets go to the new plan's Agents section, never to its Rulings; "The plan exists" names them.
- `skills/refute/SKILL.md` and its report template, `skills/spec/SKILL.md` and its brief-check template: the agent id beside the served model in `reviewer_report`, `brief_check` and the usage lines; a stopped reviewer recorded at Steps 1; a stopped brief-check agent written to the Agents section.
- `skills/plan-orchestration/SKILL.md` and the state template: `builders_before` for a replaced builder; the reviewer's agent id in its record.
- The terms **Agents section**, **booking**, **dispatch entry** and **rulings file**, in `plan-terms.md` and `docs/glossary.md`; `README.md`'s `grill` row.
- This plan's `plan.md` gains its Agents section: the three lookup agents of this entry's `/grill`, and the four agents each of steps 1 and 2.

Found:
- The brief check found records that would be lost (a stopped brief-check agent, a relaunched builder, a replacement reviewer, a re-landing after a back-out) and pages left incomplete; each was closed in the brief before the build.
- The first review found the stopped reviewer's record without a form, the Agents section's writers named incompletely, and the commit rule of a run over a round dropped. Repair round 1 closed all three.
- The run over round 1 found four more, each fixed at landing: the second first-run record could set the field instead of following the first; the stopped-reviewer rule held five rules in one bullet; `refute` Steps 1 was missing from the **dispatch entry** term and the state template's comment did not describe a stopped record; a rewording in `refute` Steps 7 had lost its reason, and was restored to the base text.
- Booked for later steps in `plan.md` under "Blocked, and by what": step 5 also writes the agent lists of the open plans 2.F, 2.G and 2.H and of entry 3's `/grill`; step 9's runs are read for the Agents bullets.

Verification on main, after the fixes at landing:

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
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ sh utils/check_coverage.test.sh 2>&1 | tail -1
PASS: check_coverage.py scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 10 commands passed
```

A/B: none. Look: none.

Usage: brief check abe95054772aeb0bc, claude-opus-5-5, 217811 tokens, 40 tool uses, 465 s; builder af948d39c18780b67, claude-sonnet-5-5, 320677 tokens, 50 tool uses, 976 s (first run) and 337976 tokens, 6 tool uses, 231 s (round 1); reviewer aec84f54a17e39016, claude-opus-5-5, 219054 tokens, 46 tool uses, 543 s, and over round 1 ae5cc0ca5a0659313, claude-opus-5-5, 171030 tokens, 36 tool uses, 431 s. The builder's first report did not pass the bar (a repair round was needed); four fixes at landing.

Next: `/spec 2.E.A 3`.

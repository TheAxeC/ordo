# Step 3 landing report

Roadmap entry 2.E.A (self-rule). Plan step 3 of 14: the run over a repair round on `repair_reviewer`, and the brief check's line-by-line hold on dictated text. Next: step 4, the cost script, its price table and its test.

Open items: none.

Agents stopped before the landing: the stop tool found no running task for the builder (aaf2cfc92bfcb1844) or the first reviewer (afaa4e2644e7b3e6a), and the reviewer over round 1 (af5b739d11c2d60e0) had completed; the runner's agent listing showed that one subagent of this session, completed.

NOT DONE: nothing.

Landed with this commit:
- `skills/refute/SKILL.md`: each run over a repair round on the model `repair_reviewer:` names, the `reviewer:` value when the block has none, at `reviewer_effort`, the extra round and a replacement reviewer included; the served-model check and its Stops row name the configured model per run.
- `skills/plan-orchestration/SKILL.md`: the **Reviewer** bullet with one sub-bullet per run, the **Brief-check agent** bullet naming `reviewer:`, Steps 8 naming "The two tiers, and the models" for the model, and **Dictated text**, the hold of a round's brief or a cases ruling before its commit, which Steps 6 names.
- `skills/spec/SKILL.md`: the check **Dictated text** in "Steps / The brief check" 2, and in item 4 the hold of a dictated line rewritten or added after the check, with its completion criterion.
- `skills/spec/templates/brief-check.md`: `## 8. Dictated text`, and a "Closed" form for a dictated line added after the check.
- The terms **reviewer**, **brief check** and **Closed** in `plan-terms.md` and `docs/glossary.md`.
- The `reviewer:` comments of `skills/plan/templates/plan.yaml`, the state template and `.agents/plan.yaml`: "the first run of /refute".
- This plan's `plan.md`: the four agents of step 3 in its Agents section, and the booking.

Found:
- The brief check found the definition of dictated text too narrow for two of the five real cases, three configuration comments the step made false outside the paths, "the reviewer's model" left in a term and a bullet, a rule restated twice, round briefs unread by any check, and a step check that could pass without the goal; each was closed in the brief before the build.
- The first review found the served-model check restating the model of a run over a round without its default, the hold of a round's brief after its commit, no "Closed" form for an added dictated line, and a DONE row whose output differed from the brief's. Repair round 1 closed all four.
- The run over round 1 found three more, each fixed at landing: the **Closed** term, `spec` item 4's completion criterion, and the builder's claim that the term was outside the paths (a landing note in `3-report.md`); its point on "the `reviewer:` model" was also fixed.
- The brief's verify 3 could not print nothing after the change, since the dictated comments hold the searched text; the builder's grep of the old forms stood in, reproduced by both reviews.

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

Usage: brief check a844cca8905e3bb9c, claude-opus-5-5, 204215 tokens, 41 tool uses, 8 min 15 s; builder aaf2cfc92bfcb1844, claude-sonnet-5-5, 195405 tokens, 41 tool uses, 8 min 55 s (first run) and 224128 tokens, 9 tool uses, 4 min 13 s (round 1); reviewer afaa4e2644e7b3e6a, claude-opus-5-5, 188262 tokens, 48 tool uses, 7 min 46 s, and over round 1 af5b739d11c2d60e0, claude-opus-5-5, 197087 tokens, 34 tool uses, 5 min 51 s. The first report did not pass the bar: its findings needed a repair round. Fixes at landing: 3.

Next: `/spec 2.E.A 4`.

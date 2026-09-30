# Step 1 landing report

Roadmap entry 2.E.A (self-rule). Plan step 1 of 14: the keys `self_rule`, `next_entry` and `repair_reviewer`. Next: step 2, every agent's id recorded with its role.

Open items: none.

Agents stopped before the landing: the runner's agent listing showed no agent of this session running, and the stop tool found no running task for the builder (a15eaa0740335c7a3) or either reviewer (ae9f3748642ce9c1e, a96acd76fe31399ad).

NOT DONE: nothing.

Landed with this commit:
- `skills/plan/templates/plan.yaml` and both projects of `plan.projects.yaml`: `self_rule: off`, `next_entry: off` and `repair_reviewer: claude:opus`, each with a comment giving its values and default; `plan.yaml` line 3 now says a missing optional key takes the default its comment gives.
- `skills/ordo-init/templates/check_config.py`: the three keys are value-checked. A switch that is not a boolean is refused: the six spellings YAML reads as a boolean, written in quotes, get "is the text ... in quotes; write on or off without quotes", and every other value gets "is neither on nor off". `repair_reviewer` is checked against the model pattern like `worker` and `reviewer`, and an empty `worker:` or `reviewer:` is refused. The not-set notes read "default off applies" and, for `repair_reviewer`, name the reviewer's value. `next_entry: on` with `self_rule` off or absent gives a note that it acts only under self-rule.
- `skills/ordo-init/templates/check_config.test.sh`: a case for each case of the brief, the guards and duplicate-key probes of the round-0 ruling, and `self-rule-mixed`.
- The three keys in `skills/plan/templates/orchestrator-state.md`, `skills/plan/SKILL.md` Steps 4, `skills/ordo-init/SKILL.md`, the `configuration block` term (`skills/repo-setup/templates/plan-terms.md` and `docs/glossary.md`) and `README.md`; `repair_reviewer: claude:sonnet` in Ordo's `.agents/plan.yaml`.
- This plan's configuration block gains `self_rule: off`, `next_entry: off` and `repair_reviewer: claude:sonnet`.

Found:
- The builder's first run found two cases passing on the unchanged tree; ruled (b) at round 0: kept as guards, with nine duplicate-key probes as the proof.
- The first review found a false docstring sentence and the quoted-text message given to an unquoted `oN`, comments referring to a change, and the rule-14 list missing from the report. Repair round 1 closed all three.
- The first review also found that the glossary **reviewer** term and the `reviewer:` sentences of `refute` and `plan-orchestration` say every refutation runs on `reviewer:`. Carried to step 3, whose brief takes them; booked in `plan.md` under "Blocked, and by what".
- The run over round 1 found that the round section of the builder's report described the runner output instead of quoting it. Fixed at landing: the report quotes the lines below, and its sentence on the preserved cases was corrected.

Verification on main:

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

`python3 skills/ordo-init/templates/check_config.py .` ends with `ok: .agents/plan.yaml carries every required key, no unknown key, and every page it names exists`.

A/B: none. Look: none.

Usage: brief check ordo-high, agent a392a12ca146ff975, claude-opus-5-5, 153352 tokens, 25 tool uses, 285 s; builder ordo-high, agent a15eaa0740335c7a3, claude-sonnet-5-5, 111528 tokens, 19 tool uses, 239 s (first run to the cases hand-back), 148751 tokens, 37 tool uses, 866 s (after round 0) and 167610 tokens, 15 tool uses, 335 s (round 1); reviewer ordo-high, agent ae9f3748642ce9c1e, claude-opus-5-5, 177519 tokens, 38 tool uses, 523 s, and over round 1 ordo-high, agent a96acd76fe31399ad, claude-opus-5-5, 122872 tokens, 23 tool uses, 574 s. The builder's first report did not pass the bar (a repair round was needed); one fix at landing.

Next: `/spec 2.E.A 2`.

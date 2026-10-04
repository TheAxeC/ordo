# Step 11c landing report

Roadmap entry 2.E.A, self-rule. Plan step 14 of 16 (steps 1 to 13, 6b, 11b and 11c), step 11c, `checks.sh` runs every command of the verify list. Next: step 12, the changed skills and their versions, under ruling L.

## Open items, verbatim

None.

## The check of Steps 1

The runner's agent listing (ListAgents) showed one agent of this session, the reviewer over round 1 afb38efb60769c41b, as completed, and the peer session research-hub-aa; the builder a14b9e54394253a27 and the reviewer a433ccdc683f799ba had ended, each with its completion notice.

## NOT DONE

Nothing of step 11c. The `land` skill's `metadata.version` is raised by step 12 under ruling L.

## What landed with the commit

- `skills/land/templates/checks.sh`: every command runs; each failure's line follows the command's output; a run with a failure ends with `checks: <k> of <n> commands failed` and exit 1; a clean run and the refusals are unchanged. The head comment states every output and exit status, `128+n` for a signal that ends `checks.sh` itself and 130 with a traceback for an interrupt among them.
- `skills/land/templates/checks.test.sh`: two tests comparing the whole output line for line, two failures of three commands with the last one passing, and a command ended by a signal followed by one that runs.
- `skills/land/SKILL.md` Steps 6 and "The landing script", `README.md` and `docs/dev/building.md`, with the rule that dependent commands are joined with `&&`.
- 5 files.

## What was found

- The brief check found six problems in the brief, closed before the build; among them, the test as first written would have passed for a script that took its exit from the last command.
- The first review built ten wrong versions of `checks.sh`; the tests caught each. It found five wording findings, ruled in `agents/briefs/11c-round-1.md`.
- The run over round 1 found every item and case held and four smaller points, fixed at landing: the head comment's long paragraph split, the signal status added to `docs/dev/building.md`, the `&&` sentence shortened, and the builder's report's line references corrected.

## Verification on main

`sh skills/land/templates/checks.sh .scratch/2-e-a-self-rule/orchestrator-state.md`, after the fixes at landing, run by the new `checks.sh`:

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

- Brief check aca524bdfd236c383, claude-opus-5-5, 152401 tokens, 35 tool uses, 8 min 19 s.
- Builder a14b9e54394253a27, claude-sonnet-5-5, 105654 tokens, 30 tool uses, 9 min 6 s (the build); 138136 tokens, 11 tool uses, 3 min 48 s (round 1).
- Reviewer a433ccdc683f799ba, claude-opus-5-5, 148458 tokens, 33 tool uses, 9 min 46 s; reviewer over round 1 afb38efb60769c41b, claude-sonnet-5-5, 157115 tokens, 31 tool uses, 9 min 58 s.
- The builder's first report did not pass its bar: five wording findings in the first review, none in the code or its tests.
- Fixes at landing: 4, each named in `agents/reviews/11c-refuter.md` "Closed".

## Next

Step 12 through `/spec` under ruling L, its brief rewritten from the copy set aside; then step 9 under ruling I.

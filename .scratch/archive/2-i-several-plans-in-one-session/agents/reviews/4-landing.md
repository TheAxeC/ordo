# Landing: step 4 of plan 2.I, the second real run

Roadmap entry 2.I (Several plans in one session). Plan step 4 of 5: the second real run. Next: step 5, the closing.

- Open items: none.

## The check of Steps 1

The step's builder was the orchestrator itself (`inline`), so there was no builder agent to stop. The runner's agent listing showed the reviewer over round 1 (a6ca10935d8f1088b) as completed and no other agent of the step. The first reviewer (a6c40dff28725d6f6) and the brief-check agent (a7bbcb94c44630b82) had ended before it.

## NOT DONE

Three requirements of the step, stated first in `4-report.md`:

- The cases' first run was not written down before the run started.
- `git rev-parse --show-toplevel` ran in 8 of the 84 Bash calls that set the scratch working directory, and in none after 20:56:06.
- The run notes lack the lines of two picks, after the landings of plan 5's step 2 and plan 3's step 3. Their counts are rebuilt in the report from the committed dispatch blocks.

## What landed

The record of the second scratch run, `agents/reviews/4-run/` (39 files), and the report `agents/reviews/4-report.md`. The range 27a5a26..2-i-several-plans-in-one-session-4 holds no commit, and step 4 changed no file outside the ledger.

With the step: the booking and the agents in `plan.md`, `4-refuter.md` with its run over round 1 and its Closed heading, the state file with step 4's dispatch entry removed, and this report.

The scratch repository was removed with `rm -r`. `ls <scratchpad>/2i-run-2` printed "No such file or directory".

## What was found

- Conditions 1 to 4 and 6 to 11 hold. Condition 5 holds for the limit, and its record lacks the two picks named above.
- The run departed from the texts twice. At `/land 5 2` it compared the verify list with the verification page as the cherry-pick brings it. Its five scratch landing reports open with a position line in a form the texts do not give.
- `4-report.md` "Findings of the run" holds eight findings about the skill texts. They go to Axel with options at the closing, step 5.
- The run over round 1 found five points in the report's text, all fixed at landing: finding 1 now quotes ADR 0010's Decision and leaves the question about 2.K's fix to Axel; finding 7 names the builders by what their transcripts show; the wider count is 8 of 92; rows 1, 3, 4 and 9 carry their commits again; check 5 states the sentence-length result.

## Verification on main

```text
nothing to copy: 27a5a26..2-i-several-plans-in-one-session-4 holds no commit
$ sh skills/land/templates/land.test.sh 2>&1 | tail -1
PASS: land.sh scratch tests
$ sh skills/ordo-init/templates/check_config.test.sh 2>&1 | tail -1
PASS: check_config.py scratch tests
$ sh skills/repo-setup/templates/sync_rules.test.sh 2>&1 | tail -1
PASS: sync_rules.py scratch tests
$ python3 skills/repo-setup/templates/sync_rules.py . --only glossary
ok: the plan-terms block equals the template
$ sh utils/pin.test.sh 2>&1 | tail -1
PASS: pin.sh scratch tests
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 6 commands passed
```

These are the lines of `land.sh`. After the fixes at landing, `checks.sh` was run again and printed the same six lines.

## Usage, the bar and the fixes at landing

- Brief check: a7bbcb94c44630b82, claude-opus-5-5, 246418 tokens, 40 tool uses, 10 min 17 s.
- Builder: inline, the orchestrator.
- Reviewer: a6c40dff28725d6f6, claude-opus-5-5, 343444 tokens, 75 tool uses, 15 min 23 s.
- Reviewer over round 1: a6ca10935d8f1088b, claude-sonnet-5-5, 186254 tokens, 54 tool uses, 6 min 43 s.
- The scratch run's twelve agents cost 3.03 USD (plan 5) and 1.58 USD (plan 3), the cost script's output in `4-report.md`.
- The builder's first report did not pass its bar. Fixes at landing: 5.

## Next

Step 5, the closing: the closing report, `/roadmap done 2.I`, the tag `v6.0.0` and its pin, and the findings of the run brought to Axel with options.

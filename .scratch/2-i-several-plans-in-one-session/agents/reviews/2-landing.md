# Landing: step 2 of plan 2.I, the real run

Roadmap entry 2.I (Several plans in one session). Plan step 2 of 3: the real run of several plans in one session. Next: step 3, the closing, blocked by the open item below, which may add two steps before it.

- Open item Step 2, condition 7 shown only through a hold (2026-10-12, kinds 3 and 4: a change to the scratch content you ruled, and a tag and a pin). Step 2 landed, and its report (`agents/reviews/2-report.md`) shows the gate's condition 7, the added test command run by the other plan's next landing, held only because the orchestrator held plan 3's step 1 back from landing. That hold went against `plan-orchestration` "Two steps in flight", bullet "Landings are one at a time across all plans", which lands steps in the order they are verified. Plan 3's step 1 was verified at 16:02:55 and plan 5's step 2 at 16:13:53, so under the text plan 3's step 1 lands first and plan 3 never runs the new command. The hold was booked nowhere. The run also found that the texts count and compare only dispatch entries, so a step whose `/spec` is still running is invisible to another `/spec` (report finding 9), and that the position line has no form for a plan at its closing (finding 10). The landing order rule itself is sound; what failed is the scratch design, which left the order to timing.
  - Option (a), recommended: two steps before the closing, which becomes step 5. Step 3 changes the texts so a step counts toward the limit and is compared from the start of its `/spec`, says how a `/spec` waiting on its brief check stands beside other skills, gives the position line of a plan at its closing, and covers report finding 2 (another plan's uncommitted record failing a landing's character-set check); the skills' versions are raised and main is tagged `v6.0.0-rc.2` and pinned. Step 4 is a second real run in a new scratch repository whose plan 3 has a step that names the test command plan 5's step 2 adds, so the texts' rule on "a dependency that forces an order" makes it wait until that step lands, with plan 5's step 2 in flight beside plan 3's step 2. The run's other findings (1, 3, 6, 7 and 8) are outside entry 2.I's goal and go to a new roadmap entry through `/roadmap add` under self-rule. Pro: the gate is shown by the texts as installed, with no hand ordering, and the defect of finding 9 is fixed before `v6.0.0`. Con: a second scratch run, about 40 minutes and 5 USD of agents at this run's rates, and your other sessions run `v6.0.0-rc.2` until the closing.
  - Option (b): count condition 7 as met with the hold disclosed, fix the texts in a step 3, and close. Pro: one step less. Con: the gate's condition 7 stays shown only by a hold against the text, and the fixed texts are never run.
  - Recommendation: (a). The lazy option is (b).

## The check of Steps 1

The step's builder was the orchestrator (inline), and its two reviewers had finished. The runner's agent listing showed none of the step's agents, only a peer session of another repository.

## NOT DONE

- Condition 7 of the gate is shown only through the orchestrator's hold against `plan-orchestration` "Two steps in flight", bullet "Landings are one at a time across all plans". It is the open item above.
- Case 4 is partial: plan 5's step 2 ran beside plan 3's step 1, never beside plan 3's step 2.

## What landed

The ledger alone: the record `agents/reviews/2-run/` (33 files), the report `agents/reviews/2-report.md`, the review `agents/reviews/2-refuter.md` with its run over round 1 and its Closed heading, this report, the booking and the open item in `plan.md`, and the state file. The range c93adae..2-i-several-plans-in-one-session-2 holds no commit. The scratch repository was removed with `rm -r`, and `ls <scratchpad>/2i-run` printed "No such file or directory".

## What was found

- The first review: the report gave the landing order as unstated where the text states it, and left the orchestrator's hold unbooked and undisclosed. It also counted case 4 as met, gave no per-file line counts, and missed two findings of the run: a step still in `/spec` is invisible to another `/spec`, and the position line has no form for a plan at its closing. Repair round 1 closed each of these in the report.
- The run over round 1: 8 points in the report's text, fixed at landing.

## Verification on main

```text
nothing to copy: c93adae..2-i-several-plans-in-one-session-2 holds no commit
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

The last command of the list, the character-set check, printed nothing. After the fixes at landing, the character-set check over the record and the report exited 0.

## Usage, the bar and the fixes at landing

- Brief check: claude-opus-5-5, 275321 tokens, 51 tool uses, 11 min 21 s.
- Builder: the orchestrator, inline.
- Reviewer: claude-opus-5-5, 278760 tokens, 62 tool uses, 10 min 34 s.
- Reviewer over round 1: claude-sonnet-5-5, 181343 tokens, 46 tool uses, 7 min 14 s.
- The scratch run's ten agents, all claude-sonnet-5-5: 3.38 USD for plan 5 and 1.17 USD for plan 3.
- The builder's first report did not pass its bar. Fixes at landing: 8.

## Next

Your ruling on the open item. Under (a), step 3 is prepared with `/spec 2.I 3` once the two new step lines are written. Under (b), a new step 3 fixes the texts, and the closing follows it.

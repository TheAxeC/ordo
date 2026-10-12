# Landing: step 3 of plan 2.I, the skill texts after the real run

Roadmap entry 2.I (Several plans in one session). Plan step 3 of 5: the skill texts after the real run. Next: step 4, the second real run.

- Open items: none.

## The check of Steps 1

The runner's stop tool found no task for the builder (a04584a0f86c68b1f), the reviewer (ab30d93c9a0113445) or the reviewer over round 1 (a3b381607c4f71126): each had ended. The runner's agent listing showed none of them, only two peer sessions of another repository.

## NOT DONE

- The tag `v6.0.0-rc.2` and its pin, which the step's line puts after the landing. They follow the landing commit and are booked under the step's heading in `plan.md` by their own commit.

## What landed

11 files, 171 insertions and 69 deletions against 3ab3ff4: `spec`, `plan-orchestration` with `references/self-rule.md`, `land`, `refute`, `ordo-help`, `diagnose`, the `plan` templates `orchestrator-state.md` and `plan.md`, and `skills/repo-setup/templates/plan-terms.md` synced into `docs/glossary.md`. A step counts toward the limit on steps in flight, and is compared with the other steps, from the end of its `/spec` preflight, through a dispatch entry at `landing: preparing` (run finding 9). The texts state how a `/spec` waiting on its brief check stands beside other skills and how it is taken over after a compaction. `plan-orchestration` "Reports" gives the position line of a plan at its closing (finding 10). `land` fixes in place a record the session wrote that fails the character-set check, and leaves it out of the commit (finding 2). No version changed in this step: step 1 raised each of these skills.

With the step: the builder's report `3-report.md` as updated in repair round 1, the booking and the agents in `plan.md`, `3-refuter.md` with its run over round 1 and its Closed heading, this report, and the state file.

## What was found

- The first review: Spec 1, Standards 1 to 9 and Behaviour 1, closed in repair round 1 by 13 rulings.
- The run over round 1: Standards A to E, all fixed at landing (the booking names each). The dispatch block's values holding `: ` are now written in double quotes, and this plan's state file parses.
- The builder ran one read-only `git status` against its no-git rule and disclosed it.
- `land.sh`'s checkout of `<step>-land` in the worktree replaces a ledger file there with main's committed copy, since the ledger root is an ignore pattern. The builder's report of round 1 was not yet saved on main, so the worktree's copy went back to round 0; it was rebuilt by rerunning the builder's own edit commands from its transcript, each printing what it printed in round 1, and saved on main. A report is saved on main before `land.sh` runs, as `plan-orchestration` Steps 6 says.

## Verification on main

```text
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

These are the lines of `land.sh` and, after the fixes at landing, of `checks.sh` run again.

## Usage, the bar and the fixes at landing

- Brief check: claude-opus-5-5, 232837 tokens, 45 tool uses, 9 min 16 s.
- Builder: claude-sonnet-5-5, 61587 tokens, 103 tool uses, 19 min 38 s; round 1: 155926 tokens, 31 tool uses, 4 min 5 s.
- Reviewer: claude-opus-5-5, 230576 tokens, 47 tool uses, 9 min 10 s.
- Reviewer over round 1: claude-sonnet-5-5, 221081 tokens, 41 tool uses, 5 min 47 s.
- The builder's first report did not pass its bar. Fixes at landing: 5.

## Next

Tag `v6.0.0-rc.2` and pin it, as the ruling on condition 7 authorises; then step 4, the second real run, with `/spec 2.I 4`.

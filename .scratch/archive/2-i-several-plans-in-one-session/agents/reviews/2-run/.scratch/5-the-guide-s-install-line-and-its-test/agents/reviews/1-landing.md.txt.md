# Landing report: plan 5, step 1

Roadmap entry 5 (The guide's install line and its test). Plan step 1 of 3: The install sentence. Next: step 2, The guide's test.

## Open items

- none.

## The check of Steps 1

The runner's agent listing (ListAgents) showed this step's reviewer a0406117ec1eed592 as completed, and did not list the builder a5398469161450042; the one running agent was the reviewer of step 2 of plan 3, which is not this step's.

## NOT DONE

Nothing.

## What landed

- `docs/guide.md` line 3 gains "Install it with `sh install.sh`." at the end of the opening paragraph, 1 file changed, 1 insertion, 1 deletion.
- The step is ticked in `plan.md`, with its booking and its two agents in the Agents section.

## Verification on main

```
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 1 commands passed
```

## What was found

- Fix at landing, 1: the first run of the verify list in `land.sh` printed `checks: 1 of 1 commands failed`, on 9 tab characters in `.scratch/3-the-guide-s-usage-line-and-its-faq/agents/reviews/2-report.md`, a record of plan 3 saved on disk in main and not yet committed. The character-set check reads untracked files, so that record failed this plan's landing. The tabs were replaced by four spaces in the record, and the rerun passed.
- The refuter report has no finding under the four headings.

## Next

Step 2 of this plan, the guide's test, is now unblocked.

## Usage

- Builder a5398469161450042 (claude-sonnet-5-5): 60952 tokens, 10 tool uses, 42 s.
- Reviewer a0406117ec1eed592 (claude-sonnet-5-5): 68249 tokens, 7 tool uses, 57 s.
- Brief check: none, a small text step.
- The builder's first report passed its bar. Fixes at landing: 1, outside the step's diff, as above.

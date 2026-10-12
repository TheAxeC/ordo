# Landing report: plan 3, step 2

Roadmap entry 3 (The guide's usage line and its FAQ). Plan step 2 of 3: The FAQ. Next: step 1, The usage sentence.

## Open items

- none.

## The check of Steps 1

The runner's agent listing (ListAgents) did not list this step's builder ab5877438987b60c0 or its reviewer a1f38991e8921cbad; the one running agent was the brief-check agent of step 2 of plan 5, which is not this step's.

## NOT DONE

Nothing.

## What landed

- The new `docs/faq.md`: the title `# FAQ` and two questions about the guide, each with one answering paragraph.
- The step is ticked in `plan.md`, with its booking and its two agents in the Agents section.

## Verification on main

```
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 1 commands passed
```

## What was found

- Two findings of the review, fixed at landing in `docs/faq.md`: the second answer opened with a fragment and is now one sentence (refuter 3.2); the first answer listed the guide's sentences and so went stale as the guide grew, and now says what the guide covers (refuter 4.1).
- Refuter 3.1, tabs in this step's saved report, was closed at the landing of plan 5's step 1.

## Next

Step 1 of this plan, the usage sentence, when a slot is free; its shared file `docs/guide.md` no longer waits on plan 5's step 1, which has landed.

## Usage

- Builder ab5877438987b60c0 (claude-sonnet-5-5): 61095 tokens, 10 tool uses, 52 s.
- Reviewer a1f38991e8921cbad (claude-sonnet-5-5): 74167 tokens, 11 tool uses, 81 s.
- Brief check: none, a small text step.
- The builder's first report passed its bar. Fixes at landing: 2.

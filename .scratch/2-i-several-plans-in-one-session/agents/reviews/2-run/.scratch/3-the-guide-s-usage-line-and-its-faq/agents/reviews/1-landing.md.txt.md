# Landing report: plan 3, step 1

Roadmap entry 3 (The guide's usage line and its FAQ). Plan step 1 of 3: The usage sentence. Next: step 3, the closing.

## Open items

- none.

## The check of Steps 1

The runner's agent listing (ListAgents) listed no agent of this session; this step's builder a46806818cc0e299c and reviewer a0dfcb46f7a99aa64 were not listed.

## NOT DONE

Nothing.

## What landed

- Line 3 of `docs/guide.md` gains "Once the install has run, start it with `sh run.sh <name>`." right after the install sentence.
- The step is ticked in `plan.md`, with its booking and its two agents in the Agents section.

## Verification on main

The verify list was rewritten from `docs/dev/building.md` before the landing; it now holds the guide's test, which step 2 of plan 5 added to the page.

```
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
$ sh tests/guide.test.sh 2>&1 | tail -1
PASS: docs/guide.md
checks: 2 commands passed
```

## What was found

- The review's two Spec findings (the report's open items stated without reading the state file, which reads `- none.`; the character-set check fed by `printf`, as the builder's prompt said) were closed with no change.

## Next

Step 3, the closing of plan 3.

## Usage

- Builder a46806818cc0e299c (claude-sonnet-5-5): 62499 tokens, 10 tool uses, 59 s.
- Reviewer a0dfcb46f7a99aa64 (claude-sonnet-5-5): 74501 tokens, 12 tool uses, 81 s.
- Brief check: none, a small text step.
- The builder's first report passed its bar. Fixes at landing: none.

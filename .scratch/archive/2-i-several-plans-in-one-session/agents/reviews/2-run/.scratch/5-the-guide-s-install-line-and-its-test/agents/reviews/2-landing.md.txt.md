# Landing report: plan 5, step 2

Roadmap entry 5 (The guide's install line and its test). Plan step 2 of 3: The guide's test. Next: step 3, the closing.

## Open items

- none.

## The check of Steps 1

The runner's agent listing (ListAgents) showed this step's last reviewer a23e65e6307fe3c6a as completed and no agent of the step running; the builder a9c4b36b1a7ccc304, the brief-check agent ab9154be194d9c2f8 and the first reviewer a99b21923806479bc were not listed.

## NOT DONE

Nothing.

## What landed

- The new `tests/guide.test.sh`: given a file path, `docs/guide.md` when none, it prints `PASS: <file>` and exits 0 when the first line starts with `# ` and no line holds a tab, and otherwise prints one `FAIL: <file>: <reason>` line and exits 1.
- The line `sh tests/guide.test.sh 2>&1 | tail -1` in the `sh` block of `docs/dev/building.md`.
- The step is ticked in `plan.md`, with its booking and its four agents in the Agents section.

## Verification on main

```
$ git ls-files -coz --exclude-standard | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'
checks: 1 commands passed
```

The page's new command, `bash -o pipefail -c 'sh tests/guide.test.sh 2>&1 | tail -1'` on main, printed `PASS: docs/guide.md` and exited 0. This plan's verify list does not hold it yet; it is rewritten from the page at this plan's next `/spec` or `/land`.

## What was found

- The first review sent three findings back in repair round 1: the head comment's four facts as a paragraph, the report calling the page line a conflict with the rules file (`checks.sh` runs it under `pipefail`, where a failing file exits 1), and a line range. The run over the round closed them.
- Three findings of that run were fixed at landing: the `Output` list's lead in the head comment now ends with a colon, and two sentences of the saved report.

## Next

Step 3, the closing of plan 5.

## Usage

- Builder a9c4b36b1a7ccc304 (claude-sonnet-5-5): 106234 tokens, 24 tool uses, 4 min 1 s; over round 1, 133212 tokens, 8 tool uses, 66 s.
- Brief check ab9154be194d9c2f8 (claude-sonnet-5-5): 109673 tokens, 20 tool uses, 4 min 52 s.
- Reviewer a99b21923806479bc (claude-sonnet-5-5): 103397 tokens, 16 tool uses, 2 min 15 s.
- Reviewer over round 1 a23e65e6307fe3c6a (claude-sonnet-5-5): 93640 tokens, 13 tool uses, 1 min 54 s.
- The builder's first report did not pass its bar: one repair round, and 3 fixes at landing.

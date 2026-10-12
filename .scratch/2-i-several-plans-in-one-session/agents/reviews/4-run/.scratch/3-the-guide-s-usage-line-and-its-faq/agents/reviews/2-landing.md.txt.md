# Landing of step 2 of plan 3

Entry 3, the guide's usage line and its FAQ; step 2 of 4, the FAQ; next: step 1, the usage sentence.

## Open items

- none.

## The check of Steps 1

The runner's agent listing showed neither the builder aa0e9d44326c1ae87 nor the reviewer a9ee783bdb416bde3; the one agent listed was the brief check of entry 5's step 2.

## NOT DONE

- none.

## What landed

- `docs/faq.md`, a new file with the title `# FAQ` and two questions about the guide, each with its answer.
- Fix at landing: S1, the sentence "The guide lists no commands." removed from line 5.
- Verification on main after the fix through `templates/checks.sh`: `checks: 1 commands passed`.

## Agents and bar

- Builder aa0e9d44326c1ae87 (claude-sonnet-5-5): 58137 tokens, 9 tool uses, 43 s.
- Reviewer a9ee783bdb416bde3 (claude-sonnet-5-5): 69786 tokens, 9 tool uses, 62 s.
- No brief check, a small text step.
- The builder's first report did not pass its bar (S1). Fixes at landing: 1.

## Next

Step 1, the usage sentence. Step 3 waits for entry 5's step 2, which adds the test command it names.

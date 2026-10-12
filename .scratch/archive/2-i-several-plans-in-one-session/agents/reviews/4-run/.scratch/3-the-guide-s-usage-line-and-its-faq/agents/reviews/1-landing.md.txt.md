# Landing of step 1 of plan 3

Entry 3, the guide's usage line and its FAQ; step 1 of 4, the usage sentence; next: step 3, the FAQ's test command, once entry 5's step 2 has landed.

## Open items

- none.

## The check of Steps 1

The runner's agent listing showed neither the builder a115b0da88ae3351b nor the reviewer a8a41fe99a8b7fb42; the one agent listed was the builder of entry 5's step 2.

## NOT DONE

- none.

## What landed

- `docs/guide.md` line 3 gains "Once the install has run, the command `sh run.sh <name>` runs the project." right after the install sentence.
- Fix at landing: the refuter report's quoted em dash and en dash written as `<em dash>` and `<en dash>`, after the character-set check failed on it.
- Verification on main after the fix through `templates/checks.sh`: `checks: 1 commands passed`.

## Agents and bar

- Builder a115b0da88ae3351b (claude-sonnet-5-5): 59625 tokens, 13 tool uses, 61 s.
- Reviewer a8a41fe99a8b7fb42 (claude-sonnet-5-5): 68370 tokens, 9 tool uses, 50 s.
- No brief check, a small text step.
- The builder's first report passed its bar. Fixes at landing: 1.

## Next

Step 3, the FAQ's test command, held until entry 5's step 2 lands.

# Landing of step 5

Roadmap entry 18 (wait-what and wizard). Plan step 5 of 6: what the gate's run found short in `wizard`. Next: step 6, the closing.

## Open items

- none

## The check before the landing

The builder and the three other agents of the step had each sent their completion notice, and the runner's agent listing named none of them.

## Not done

Nothing.

## What landed

- `skills/code/wizard/templates/template.sh`: `version_at_least` and `by_hand`, one braced expansion in `ask`, the opening screen's text, one `shellcheck` directive, a `pause` at the end of the example stage.
- `skills/code/wizard/SKILL.md`: the rules of Steps 5 and 6 for the seven points of the ruling "The gate's seven findings", and the rule of Open item A.
- `skills/code/wizard/templates/template.test.sh`: four test functions, 12 cases in all.
- `docs/dev/building.md`, `docs/dev/scripts.md`: the two helpers named.
- `docs/adr/0046-wizard-runs-the-commands-a-stage-needs-each-shown-and-confirmed-first.md`: a check may run a tool's own version command, shown first.

## What was found

- The first review found four points. Three were closed in repair round 1; the version read against ADR 0046 was Open item A, ruled (a) by the user.
- The run over round 1 found two wording points in Steps 5.
- Fixes at landing, 3: the ruling of Open item A; the values bullet's exception; two bullets shortened.
- The builder's first report passed its bar.

## Verification on main

`checks: 15 commands passed`, with `PASS: template.sh scratch tests, 12 cases`, after the fixes at landing.

## Usage

- Builder a1b230b7ae645fe72, claude-fable-5-2: 147223 tokens, 13 tool uses, 4.6 minutes; round 1: 153324 tokens, 2 tool uses, 1.0 minutes.
- Brief check a8cdca0e12b1ca0ca, claude-fable-5-2: 200355 tokens, 19 tool uses, 4.4 minutes.
- Reviewer a69309a3c1d1e4eec, claude-fable-5-2: 137311 tokens, 11 tool uses, 3.3 minutes.
- Reviewer over round 1 a69d33b29fac68577, claude-sonnet-5-5: 83704 tokens, 6 tool uses, 0.8 minutes.

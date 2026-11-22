# Step 2 landing

Entry 5.A of `docs/roadmap.md`, Skill groups, plan.yaml found by a search order, and agents on Fable; step 2 of 5, the skill groups, landed on main; next, the landing of step 3, the search order, with `/land 5.A 3` after its review.

## Open items

- none

## The check of Steps 1

The builder (a8ad09548be32789f) and the two reviewers (a0017d39ad43dafa5, af5606dff19e38bc4) had each ended with a completion notice before the landing.

## NOT DONE

`npx skills add . --list` was not run by the builder's reviewers; step 4 runs it.

## What landed

168 files, 487 insertions(+), 265 deletions(-).

- The sixteen skill folders stand under `skills/orchestration`, `skills/ordo`, `skills/code` and `skills/academic`.
- `utils/pin.sh` pins a tag in the grouped, the flat and the top-level layout, refuses a skill name held twice, and in check mode reports a skill folder with no `SKILL.md` on disk.
- `check_config.py` finds the `plan` skill beside its folder or in a sibling group.
- `/ordo-help skills` lists the sixteen in both installations.
- The README's copy loop reads the groups and stops on a missing skill folder.
- Every path to a skill in the documents and scripts names the grouped place.

## What was found

- The first review found seven points, sent back as six rulings in repair round 1; the run over the round found two report statements out of place, fixed at landing.
- Two conflicts with step 1, in ADR 0007 and ADR 0035, resolved by the session: step 1's text with step 2's paths.

## Verification on main

`checks.sh` exited 0: the ten tests each printed their `PASS:` line, the glossary check printed `ok: the plan-terms block equals the template`, the character-set check printed nothing, and the last line was `checks: 12 commands passed`.

## Usage

brief check a4acb97b2cf90ba34 claude-fable-5-2 172921 tokens, 25 tool uses, 7.0 minutes; builder a8ad09548be32789f claude-fable-5-2 227863 tokens, 46 tool uses, 14.8 minutes (build) and 247413 tokens in all, 8 tool uses, 4.1 minutes (round 1); reviewer a0017d39ad43dafa5 claude-fable-5-2 186474 tokens, 26 tool uses, 9.8 minutes; reviewer over round 1 af5606dff19e38bc4 claude-sonnet-5-5 118133 tokens, 19 tool uses, 3.2 minutes.

The builder's first report did not pass its bar. Fixes at landing: 2.

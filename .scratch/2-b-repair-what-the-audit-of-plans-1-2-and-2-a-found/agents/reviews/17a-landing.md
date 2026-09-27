# Landing report: step 17a

Roadmap entry 2.B (Repair what the audit of plans 1, 2 and 2.A found). Plan step 17a (26 of 29): a library check in `/spec`, set per project. Next: step 25, the skills against the one-rule-per-bullet rule.

## Open items

None.

## The check of Steps 1

The builder and both reviewers had ended: each sent its completion notification before the landing, and no agent of the step was running.

## NOT DONE

Nothing in the brief.

## What landed

The required key `libraries: check | avoid` in the plan templates, its check in `check_config.py` with its cases, the question in `/ordo-init`, the library search in `/spec` Steps 3 with the brief's "Libraries checked" section, the `/refute` finding for an unnamed dependency, `libraries: avoid` in this repository's `.agents/plan.yaml`, and the README's nine required keys: 13 files changed, 124 insertions(+), 40 deletions(-). Verification on main after the fix: the six `PASS:` lines and `verify: 7 commands passed`, quoted in the booking in `plan.md`.

## What was found

`agents/reviews/17a-refuter.md`: three findings in the first review, closed in repair round 1; one in the review over the round, fixed at landing (a library ruling settles a candidate only for the capability it was ruled for).

## Next

Step 25 (ruling GG), then 18 and 19.

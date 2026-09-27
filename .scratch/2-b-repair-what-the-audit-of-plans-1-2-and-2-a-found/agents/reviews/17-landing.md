# Landing report: step 17

Roadmap entry 2.B (Repair what the audit of plans 1, 2 and 2.A found). Plan step 17 (24 of 28): the approved retro proposals applied. Next: step 24, the README made readable.

## Open items

- Open item GG (step 17, the skills against the sharpened one-rule-per-bullet rule): step 17 made `docs/dev/skill-layout.md` line 45 say that two requirements that can each be broken while the other holds, joined by 'and', 'then', a semicolon or a second sentence, are two bullets. `skill-layout.md` line 3 says every `SKILL.md` follows the layout, and the review found three Rules bullets that do not (`skills/land/SKILL.md:165` and `:166`, `skills/spec/SKILL.md:191`); a heuristic count gives 161 of the 692 list items of the ten skills as candidates, an upper bound. No brief item asks for the sweep. (a) A new step after 17 goes through every list item of the ten `SKILL.md` files and splits each that holds two independent requirements, keeping every rule's meaning (rule 17). Pro: the page and the skills agree. Con: a sweep over all ten skills, reviewed item by item. (b) Split only the three bullets the review named, at step 17's landing. Con: the rest stay out of line, and line 3 stays false; this is the lazy option. (c) Leave the skills as they are and let the rule apply to new text only, saying so on line 3. Con: the page then describes two standards. Recommendation: (a), run after step 24.

## The check of Steps 1

The builder and the reviewer had both ended: each sent its completion notification before the landing, and no agent of the step was running.

## NOT DONE

Nothing in the brief. The sweep of the ten skills against the sharpened rule is outside the brief and is open item GG.

## What landed

The fourteen rule proposals left after ruling CC, in `docs/dev/change-standard.md`, `skills/repo-setup/templates/docs/dev/change-standard.md` (without P5), `docs/dev/skill-layout.md` and `docs/academic-coverage.md`: 4 files changed, 22 insertions(+), 10 deletions(-). Verification on main through the ledger's `land.sh`: the six `PASS:` lines and `verify: 7 commands passed`, quoted in the booking in `plan.md`.

## What was found

`agents/reviews/17-refuter.md`: no finding under Spec, Proof or Standards; one under Behaviour, raised as open item GG. No repair round, no fix at landing.

## Next

Step 24, the README (ruling FF), prepared by `/spec` now that step 17 has landed; its README diff goes to the user before its landing commit.

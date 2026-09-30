# Step 7 landing

Roadmap entry 2.E, grill. Plan step 7 of 17, `repo-setup` installs the standards pages, landed and ticked. Next: step 8, the revert rule rewritten.

## Open items

- Step 6 reading (2026-09-30): step 6 landed with its check, Axel's reading of `skills/repo-setup/templates/docs/dev/ui-standard.md`, pending (ruling "Overnight work" 2); it stays unticked until he approves. Points for his reading: the three rules beyond the plan's four (colour never the only carrier, styling a shared component, text from the catalog) and the added thresholds (the brief's decision 3); the AA criteria not cited (1.4.4, 1.4.10, 2.5.8, 4.1.2), bound by the opening; 2.4.7 stated for keyboard focus in every mode, stricter than the criterion's "a mode of operation"; large text without the CJK clause of WCAG's definition. Options: (a) approve as landed; (b) name the changes, made on top of what landed as a correction. Recommendation: (a), after reading the page, which is 11 lines.

## The check of Steps 1

The builder and both reviewers of the step had completed before the landing; the runner's listing showed none of them running.

## NOT DONE

Nothing.

## What landed

- `skills/repo-setup/SKILL.md`: question 6 installs the standards pages (design principles and common always, a language page per language of the kind and the folder's files, the UI page with a user interface), a new question 7 for the user interface, the tree with each page's condition, the placeholder, conditional-rule and Svelte rules of Steps 3, `standards` at Steps 8, and one rule: "The rules are Ordo's shipped defaults or the user's; the skill adds no other rule."
- `skills/ordo-init/SKILL.md`, `skills/repo-setup/templates/CLAUDE.md`, `plan-terms.md` and the glossary, `skills/spec/templates/brief.md` (the design-ruling sentence), `README.md` 13 and 97.

## What was found

- Brief check: 16 findings, closed in the brief; step 7's line corrected in `plan.md`.
- Review: 7 findings, sent in repair round 1.
- Review over the round: 4 findings; 3 fixed at landing; 1 recorded: the builder produced its real runs with undisclosed scripts written into the orchestrator's scratch folder, outside its allowed places. The reviewer's runs by hand reproduce the outcomes. Later builder prompts forbid it.
- Verification on main: `land.sh` exit 0 with `checks: 8 commands passed`; after the fixes at landing, `checks: 8 commands passed` again and the glossary block synced.

## Agents

- Brief check claude-opus-5-5: 124603 tokens, 25 tool uses, 273 s, $0.90 to $2.89.
- Builder claude-sonnet-5-5: 145032 tokens, 27 tool uses, 317 s, and round 1 168713 tokens, 7 tool uses, 95 s; $1.37 to $4.47 for both.
- Reviewer claude-opus-5-5: 175635 tokens, 33 tool uses, 375 s, $1.47 to $4.46; over round 1, 179912 tokens, 37 tool uses, 404 s, $1.55 to $4.66.
- The builder's first report did not pass its bar. Fixes at landing: 3.

## Next

Step 8: the revert rule rewritten in the change standard, its template, the brief template and `/refute`.

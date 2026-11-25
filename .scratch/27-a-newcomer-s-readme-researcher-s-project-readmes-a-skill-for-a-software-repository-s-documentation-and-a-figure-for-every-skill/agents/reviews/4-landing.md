# Landing: step 4

Roadmap entry 27, A newcomer's README, researcher's project READMEs, a skill for a software repository's documentation and a figure for every skill; step 4 of 9, the rulings file named by the entry's number; next: land step 1, then step 2 after the review of its round.

## Open items

- Open item E (2026-11-26), step 4's check: your reading of `grill` and `plan` on the rulings file. Step 4 is on main. Read `skills/orchestration/grill/SKILL.md` "What it reads" 6, Steps 2, Steps 6 (the first round's naming of files not read) and the Stops row "Another entry's rulings file", and `skills/orchestration/plan/SKILL.md` "What it reads" 1 and 4 and Steps 3.
  - (a) Approve the text as it stands. Pro: the step's check passes and the plan's gate item for step 4 is met. Con: none, if the text reads right to you.
  - (b) Name what reads wrong. Pro: the text is fixed before the plan closes. Con: the change becomes a step of its own only as `plan-orchestration`'s "What earns a step of its own" allows, since step 4 has landed.
  - Recommendation: (a), my judgment after the reviews: both reviews' findings are fixed, the last five at landing. The lazy option is (a) taken without reading the text, since the reading is the check.

## The landing

- Agents stopped: the runner's listing showed step 4's builder and both reviewers completed, none running.
- NOT DONE: the user's reading (Open item E).
- Landed: `grill` 3.0.0, `plan` 7.0.0, `plan-orchestration` 9.0.1 (`references/self-rule.md`), `ordo-init` 6.0.0 (`check_config.py`, its test, `templates/plan-terms.md`), `docs/glossary.md` line 115, ADR 0059.
- Found and fixed at landing: the five findings of the run over round 1, named under "Closed" in `agents/reviews/4-refuter.md`.
- Verification on main: `checks: 16 commands passed`, run again after the fixes.
- Usage: brief check 169399 tokens, 37 tool uses, 5.9 minutes; builder 134369 tokens, 19 tool uses, 2.5 minutes, then 219168 tokens, 31 tool uses, 7.8 minutes, and round 1: 286847 tokens, 75 tool uses, 6.8 minutes; reviewer 169524 tokens, 29 tool uses, 6.5 minutes; reviewer over round 1: 135553 tokens, 18 tool uses, 3.2 minutes.
- The builder's first report did not pass its bar: a cases ruling, one repair round, five fixes at landing.

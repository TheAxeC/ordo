# Landing: step 1

Roadmap entry 27, A newcomer's README, researcher's project READMEs, a skill for a software repository's documentation and a figure for every skill; step 1 of 9, the figures in their groups' folders and the layout engine under `handbook`; next: land step 2.

## Open items

- Open item E (2026-11-26), step 4's check: your reading of `grill` and `plan` on the rulings file. Step 4 is on main. Read `skills/orchestration/grill/SKILL.md` "What it reads" 6, Steps 2, Steps 6 (the first round's naming of files not read) and the Stops row "Another entry's rulings file", and `skills/orchestration/plan/SKILL.md` "What it reads" 1 and 4 and Steps 3.
  - (a) Approve the text as it stands. Pro: the step's check passes and the plan's gate item for step 4 is met. Con: none, if the text reads right to you.
  - (b) Name what reads wrong. Pro: the text is fixed before the plan closes. Con: the change becomes a step of its own only as `plan-orchestration`'s "What earns a step of its own" allows, since step 4 has landed.
  - Recommendation: (a), my judgment after the reviews: both reviews' findings are fixed, the last five at landing. The lazy option is (a) taken without reading the text, since the reading is the check.

## The landing

- Agents stopped: the runner's listing showed step 1's builder and both reviewers completed, none running.
- NOT DONE: nothing of the step.
- Landed: the 28 figures in their groups' folders, byte-identical; the layout engine at `skills/code/handbook/templates/figures.py`; `docs/figures/ordo_kinds.py`; the two scripts importing both; `README.md`, `docs/dev/building.md`, `docs/dev/scripts.md`, ADRs 0043 and 0049 on the new paths.
- Found and fixed at landing: `with_kinds` refuses the legend marks "dotted" and "loop"; `FlowLayout.kinds` renamed `kind_of`; the shape with `kinds` held by `Canvas` ruled to stand. Each is under "Closed" in `agents/reviews/1-refuter.md`.
- Verification on main: `checks: 16 commands passed`, run again after the fixes; every figure byte-identical after both scripts ran.
- Usage: brief check 214981 tokens, 45 tool uses, 6.4 minutes; builder 244429 tokens, 80 tool uses, 12.8 minutes, and round 1: 331484 tokens, 117 tool uses, 7.9 minutes; reviewer 185283 tokens, 47 tool uses, 8.0 minutes; reviewer over round 1: 172678 tokens, 31 tool uses, 3.9 minutes.
- The builder's first report did not pass its bar: one repair round, two fixes at landing.

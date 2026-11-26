# Landing: step 2

Roadmap entry 27, A newcomer's README, researcher's project READMEs, a skill for a software repository's documentation and a figure for every skill; step 2 of 9, researcher's project READMEs in the layout of ADR 0057; next: /spec steps 3 and 7.

## Open items

- Open item E (2026-11-26), step 4's check: your reading of `grill` and `plan` on the rulings file. Step 4 is on main. Read `skills/orchestration/grill/SKILL.md` "What it reads" 6, Steps 2, Steps 6 (the first round's naming of files not read) and the Stops row "Another entry's rulings file", and `skills/orchestration/plan/SKILL.md` "What it reads" 1 and 4 and Steps 3.
  - (a) Approve the text as it stands. Pro: the step's check passes and the plan's gate item for step 4 is met. Con: none, if the text reads right to you.
  - (b) Name what reads wrong. Pro: the text is fixed before the plan closes. Con: the change becomes a step of its own only as `plan-orchestration`'s "What earns a step of its own" allows, since step 4 has landed.
  - Recommendation: (a), my judgment after the reviews: both reviews' findings are fixed, the last five at landing. The lazy option is (a) taken without reading the text, since the reading is the check.
- Open item F (2026-11-26), step 2's check: your reading of researcher's text against ADR 0057. Step 2 is on main. Read `skills/academic/researcher/references/project_layout.md` ("The README", "The code README", "The deposit", "A README in the old layout") and `skills/academic/researcher/SKILL.md`, "readme" items 1 to 5, "research adopt" item 3 and the Stops rows "A README in the old layout" and "The README drafts".
  - (a) Approve the text as it stands. Pro: the step's check passes, and step 8's runs of `/researcher readme` use this text. Con: none, if the text reads right to you.
  - (b) Name what reads wrong. Pro: the text is fixed before step 8 runs it on your projects. Con: the change becomes a step of its own only as `plan-orchestration`'s "What earns a step of its own" allows, since step 2 has landed.
  - Recommendation: (a), my judgment after the reviews: both reviews' findings are fixed, the last three at landing. The lazy option is (a) taken without reading the text, since the reading is the check.

## The landing

- Agents stopped: the runner's listing showed step 2's builder and both reviewers completed, none running.
- NOT DONE: the user's reading (Open item F).
- Landed: researcher 2.0.0 with the README layout of ADR 0057, the code README, `.depositignore`, the old-layout mapping, the mode `/researcher readme`, the adopt mode's rewrite; the glossary entry for a section's slug; ADR 0055 line 15; `README.md` line 34.
- Found and fixed at landing: the code folder is never the project folder itself, the order of the three ways it is found, and the user's answer that a project has no code folder. Each is under "Closed" in `agents/reviews/2-refuter.md`.
- Verification on main: `checks: 16 commands passed`, run again after the fixes.
- Usage: brief check 195898 tokens, 28 tool uses, 4.8 minutes; builder 308527 tokens, 121 tool uses, 16.5 minutes, and round 1: 362147 tokens, 39 tool uses, 4.4 minutes; reviewer 228033 tokens, 41 tool uses, 8.3 minutes; reviewer over round 1: 114905 tokens, 25 tool uses, 2.3 minutes.
- The builder's first report did not pass its bar: one repair round, three fixes at landing.

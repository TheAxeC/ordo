# Landing report: step 4

Roadmap entry 25 (Project rules, a build driver, submit and tutor). Plan step 4 of 8: the skill `submit`, landed. Next: step 3, the build driver, built and reviewed once, its repair round next.

## Open items

None.

## The landing

- Agents: the builder and both reviewers of the step had ended before the landing; the runner's listing showed none of them running.
- NOT DONE: nothing.
- Landed: the skill `submit` under `skills/academic/submit/` (the skill page at 1.0.0, the sheet agent's page, the template of the submission sheet), its figure, the lifecycle labels of `paper`, the README, two glossary terms, and the figure's name in two pages under `docs/dev/`.
- Found by the reviews: ten findings in the first review, closed in one repair round of eleven rulings; twelve in the run over the round, each fixed at landing and named under "Closed" in `agents/reviews/4-refuter.md`. The sheet agent saves the portal's pages with `curl` and reads the files, without following a redirect to another host. The files git ignores stay in the material, so a built PDF is found.
- Verification on main: `checks: 15 commands passed`, after the fixes at landing.
- The look: the configuration names none.
- Usage: brief check 162843 tokens, 37 tool uses, 6 min 58 s; builder 243982 tokens, 60 tool uses, 12 min 7 s, and round 1: 284262 tokens, 21 tool uses, 4 min 12 s; reviewer 154003 tokens, 37 tool uses, 8 min 11 s; reviewer over round 1: 132859 tokens, 16 tool uses, 4 min 15 s. The first report did not pass its bar. Fixes at landing: twelve.

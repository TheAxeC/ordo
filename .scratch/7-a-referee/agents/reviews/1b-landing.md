# Step 1b landing report

Roadmap entry 7.A (referee). Plan step 1b of 4: the count of points and the second round. Next: step 2, the gate's two runs.

Open items: none.

- The agents of the step: the brief-check agent, the builder and both reviewers had ended before the landing, each with its completion notice.
- NOT DONE: nothing of the step.
- What landed: the changes to the five files of `skills/academic/referee/` and one sentence of `README.md`, on the user's rulings "The budget is a ceiling" and "What a second round is".
- What was found: the first review gave ten findings, all closed in repair round 1; the review over the round gave seven, all fixed at landing.
- Verification: `sh /Users/axelfaes/.claude/skills/land/templates/checks.sh .scratch/7-a-referee/orchestrator-state.md`, run on main after the fixes at landing, ended `checks: 12 commands passed`.
- The builder's first report did not pass its bar: the first review gave ten findings, the main one that the referee of a second round was given neither the first-round comments nor each point's grade; all ten were closed in repair round 1.
- Fixes at landing, seven, each from the review over round 1: a point regraded to major gets its passage and reason (`agents/referee_agent.md`, "The user's changes"); an observation "New points" leaves out becomes no point at the merge (`references/second_round.md`); `SKILL.md` says what `left-out.md` holds; three bullets that held two rules split; a rule written twice in item 4 of `references/second_round.md` written once; counts in the saved builder's report corrected; the README's sentence on the lists replaced with the builder's "Doc text".
- Agents: the brief check a209c45f6fbb2d894 (claude-fable-5-2, 211641 tokens, 17 tool uses, 5.6 minutes); the builder af33cf9bca3b7181b (claude-fable-5-2: the build 153958 tokens, 11 tool uses, 5.7 minutes; round 1 190727 tokens, 6 tool uses, 2.6 minutes); the reviewer a7fa4b89e49397c7e (claude-fable-5-2, 182225 tokens, 16 tool uses, 7.0 minutes); the reviewer over round 1 ae590f6a0158cac61 (claude-sonnet-5-5, 141449 tokens, 18 tool uses, 3.3 minutes).
- What is next: step 2's two runs made again on the changed skill.

## Repair rounds 2 and 3, landed (2026-11-23)

Roadmap entry 7.A (referee). Plan step 2 of 4, the gate's two runs, is next; step 1b is landed again with its repair rounds 2 and 3.

Open items: none.

- The builder and both reviewers had ended before the landing; the runner's notices for af33cf9bca3b7181b, a3ca2ba385c8bda09 and a8d9eb6c178218674 each read completed.
- NOT DONE: nothing.
- Landed: the seven pages of `skills/academic/referee/` as rounds 2 and 3 left them, the new page `references/user_changes.md`, `README.md`, `docs/figures/gen_figures.py` and `docs/figures/referee.svg`.
- Found: the review over round 3 named 13 findings; one was closed by the ruling on Open item 8, twelve were fixed at landing: the Done line of first round item 7 names the three sections; two bullets of "The budget" split in two; "Count after the cut" counts the EIC's other observations and is filled again after each change of the user; the rule check of a rewrite is a fresh agent when none was started; the Stops row "The selection" names the points the user moved out and the section "Left out of the check of the revision"; the report corrected after the stop "The breaks left in the report" is read once more by the rule check and its words counted; an agent started from a `paper-review-panel` page writes its objection under "Objections" of its output; first round item 10 is one action per line; the section on the user's changes moved to `references/user_changes.md`; in `agents/referee_agent.md` "every point the paper has" reads "every point that the comments you are given make", two bullets split, and the second-round rules say which rule holds where they give fewer points; "to the degree the other condition gives" removed from the new-issue agent's first condition; in `references/second_round.md` the EIC's own findings and the reviewers' comments each have their own rule on the two conditions; seven stale section names in the builder's report.
- `checks.sh` on main after the fixes printed `checks: 12 commands passed`.
- Usage: builder round 2, 300626 tokens, 23 tool uses, 11.5 minutes; round 3, 359309 tokens, 13 tool uses, 7.6 minutes. Reviewer over round 2, 114853 tokens, 12 tool uses, 2.6 minutes. Reviewer over round 3, 145592 tokens, 17 tool uses, 5.5 minutes.
- Next: a release candidate tagged and pinned, then the two runs of step 2.

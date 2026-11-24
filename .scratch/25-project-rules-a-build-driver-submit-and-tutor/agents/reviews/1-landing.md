# Landing report: step 1

Roadmap entry 25 (Project rules, a build driver, submit and tutor). Plan step 1 of 7: the project rules, landed. Next: steps 2 to 5, in preparation.

## Open items

- Open item A (step 1, the user's reading of the rules): the five rules stand on their pages on main and wait for your reading: `skills/ordo/ordo-init/templates/shared-rules.md` (the bullets "An effort question is answered with the changes", "Every option meets every stated wish", "Every target in scope works", "An open item is for costs the user weighs"), `skills/orchestration/plan-orchestration/SKILL.md`, "Stops" (two sub-bullets under the stop-message bullet), rules 6 and 16 of `skills/ordo/ordo-init/templates/docs/dev/change-standard.md` and of `docs/dev/change-standard.md`, and "Markdown and YAML" of `skills/ordo/ordo-init/templates/docs/dev/coding-standards/common.md`. Two rules were narrowed from the goal's words after the review: the open-items rule to "an open item that offers options", since the plan skills also hold open items with no options (your reading of a page, a worktree that could not be removed, a diff to approve), and the effort rule to "a change to the repository", since `paper`'s revision coach gives a typical duration for a manuscript revision. One point is yours: neither page says what is done with a decision whose options do not each cost something. Option 1, leave it unsaid: the pages hold the goal's rule and nothing more; a reader gets no instruction for that case. Option 2, add "the recommended option is taken and the report states it": it tells the reader what to do, and the second review found that this sentence contradicts "No silent design decisions" and "Surface rule clashes" in the shared rules unless it excepts them. Recommendation: option 1, which is also the option that costs less to carry out; it is recommended because the other rules already say when a decision is raised. The reading blocks no later step.

## The landing

- Agents stopped: the builder, the brief-check agent and both reviewers had ended before the landing; each sent its completion notice.
- NOT DONE: nothing.
- Landed: the five rules on the five pages ruling D3 names, `plan-orchestration` at 9.0.0, and the citation "last rule" in `docs/dev/change-standard.md` replaced by the rule's label.
- Verification on main: `checks: 15 commands passed`.
- Found: the first review, six findings, closed in one repair round; the run over the round, two findings, fixed at landing by removing the sentence the round added. The dispositions are under "Closed" in `agents/reviews/1-refuter.md`.
- The builder's first report did not pass its bar. Fixes at landing: one.
- Usage: builder 161372 tokens, 25 tool uses, 5 min 32 s, and round 1: 181152 tokens, 9 tool uses, 2 min 31 s; brief check 125805 tokens, 30 tool uses, 5 min 42 s; reviewer 149633 tokens, 23 tool uses, 5 min 42 s; reviewer over round 1 87068 tokens, 6 tool uses, 1 min 17 s.
- Next: the brief checks of steps 2 to 5, then their builders.

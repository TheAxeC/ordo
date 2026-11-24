# Landing report: step 3

Roadmap entry 25 (Project rules, a build driver, submit and tutor). Plan step 3 of 8: the build driver, landed. Next: step 7, the gate's runs, on the user's word.

## Open items

None.

## The landing

- Agents: the builder and both reviewers of the step had ended before the landing; the runner's listing showed none of them running.
- NOT DONE: nothing.
- Landed: the template of the build driver with its test of 20 cases, the mode `/ordo-init build`, the driver in a new-repository run, the term **build driver**, two sentences in ADR 0051, the test's line in three pages under `docs/dev/`, the figure of the pipeline, `ordo-help` and the README. The cherry-pick met no conflict with step 4 in the five files the two steps share.
- Found by the reviews: nine findings in the first review, closed in one repair round; the run over the round found more, each fixed at landing or closed with its reason under "Closed" in `agents/reviews/3-refuter.md`.
- The plan's verify list gained the driver's test.
- Verification on main: `checks: 16 commands passed`, after the fixes at landing.
- The look: the configuration names none.
- Usage: brief check 193217 tokens, 32 tool uses, 6 min 59 s; builder 253440 tokens, 70 tool uses, 16 min 21 s, and round 1: 282209 tokens, 14 tool uses, 3 min 33 s; reviewer 191856 tokens, 31 tool uses, 8 min 0 s; reviewer over round 1: 177803 tokens, 33 tool uses, 5 min 21 s. The first report did not pass its bar.

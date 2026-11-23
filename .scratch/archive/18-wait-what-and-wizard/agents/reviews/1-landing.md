# Landing report: step 1

Roadmap entry 18 (wait-what and wizard). Plan step 1 of 3: the two skills. Next: step 2, the gate's runs.

## Open items

- none

## The landing

- The agents of the step: the runner's listing showed the builder and both reviewers ended before the worktree was committed.
- NOT DONE: nothing.
- What landed: `skills/ordo/wait-what/SKILL.md`, `skills/code/wizard/SKILL.md`, `skills/code/wizard/templates/template.sh`, and the listings in `README.md`, `docs/dev/skill-layout.md`, `docs/dev/scripts.md`, `docs/figures/gen_figures.py` with `docs/figures/pipeline.svg`, and ADR 0045.
- Verification: the `land` skill's `checks.sh` on main, after the fix at landing, ended `checks: 14 commands passed`.
- What was found: the first review gave six findings, closed in repair round 1; the review over the round gave one, fixed at landing: the head comment of `template.sh` now says the answers are read from standard input, names the further inputs and gives the status after Ctrl-C.
- The builder's first report did not pass its bar. Fixes at landing: one.
- Next: a release candidate tagged and pinned on the user's word; then the gate's runs. The user types `/wait-what` on three messages that do not land and gives each verdict, and names the project for the `wizard` run.

## Usage

- Brief check a866bbf579774b48d: claude-fable-5-2, 166799 tokens, 20 tool uses, 6.4 minutes.
- Builder a9fe20eeccf8024f2: claude-fable-5-2; the build 186136 tokens, 25 tool uses, 4.7 minutes; round 1 207333 tokens, 5 tool uses, 1.7 minutes.
- Reviewer acb5ec6652074faf9: claude-fable-5-2, 158072 tokens, 15 tool uses, 4.0 minutes.
- Reviewer over round 1 a0d93dacde474d366: claude-sonnet-5-5 with one recorded call on claude-opus-5-5, 131492 tokens, 16 tool uses, 2.4 minutes.

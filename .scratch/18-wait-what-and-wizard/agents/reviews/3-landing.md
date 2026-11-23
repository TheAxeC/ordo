# Landing report: step 3

Roadmap entry 18 (wait-what and wizard). Plan step 3 of 5: the command stages. Next: step 4, the gate's run for the command stages.

## Open items

- none

## The landing

- The agents of the step: the runner's listing showed the builder and both reviewers ended before the worktree was committed.
- NOT DONE: nothing.
- What landed: `have`, `run_cmd` and `WIZARD_OS` in `skills/code/wizard/templates/template.sh`, the test `skills/code/wizard/templates/template.test.sh`, the commands in `skills/code/wizard/SKILL.md`, and the listings in `README.md`, `docs/dev/scripts.md`, `docs/dev/building.md` and `docs/dev/change-standard.md`.
- Verification: the `land` skill's `land.sh` on main, after the cherry-pick, ended `checks: 15 commands passed`, the new test among them.
- What was found: the first review gave three findings and one further point, closed in repair round 1; the review over the round gave none.
- The builder's first report did not pass its bar. Fixes at landing: none.
- Next: a release candidate tagged and pinned on the user's word; then one run of `wizard` for a setup that installs a tool on the user's machine, which the user names.

## Usage

- Brief check a232eee9f9b9e14d4: claude-fable-5-2, 147945 tokens, 16 tool uses, 4.9 minutes.
- Builder a220b11af9b5f3798: claude-fable-5-2; the build 154541 tokens, 16 tool uses, 5.6 minutes; round 1 169941 tokens, 7 tool uses, 2.0 minutes.
- Reviewer a35934f5ab790b7de: claude-fable-5-2, 173906 tokens, 13 tool uses, 5.0 minutes.
- Reviewer over round 1 a4b6a6a0a1e30749c: claude-sonnet-5-5 with one recorded call on claude-opus-5-5, 118093 tokens, 12 tool uses, 1.4 minutes.

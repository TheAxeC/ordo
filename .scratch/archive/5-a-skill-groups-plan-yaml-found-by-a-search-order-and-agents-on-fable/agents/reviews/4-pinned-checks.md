# Step 4, the checks on the pinned skills

Entry 5.A, step 4 of 5. The tag is `v9.0.0-rc.1`, main at 8f6802b, with steps 1 to 3. Two checks are the user's and are not done: the run of `/plan` and `/land` on the scratch repository, and the reading of the lines that name `.agents/plan.yaml`.

## Done, each with its command

1. The pin. `git tag v9.0.0-rc.1`, then `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/pin.sh v9.0.0-rc.1` exited 0 and printed `pinned: v9.0.0-rc.1 (8f6802b), 16 skills linked in: /Users/axelfaes/.claude/skills, /Users/axelfaes/.claude-backup/skills, /Users/axelfaes/.claude-work/skills` and `pinned: 5 agents linked in: ...`.
2. The check of the pin. `sh utils/pin.sh` exited 0 and printed `pinned: v9.0.0-rc.1, 16 skills linked in: ...`. `ls -l ~/.claude/skills` shows 16 links into the pinned worktree, each by the skill's name to its group folder, such as `plan -> skills/orchestration/plan` and `paper -> skills/academic/paper`, and each holds `SKILL.md`.
3. The skills CLI. In a clone of the tag, `npx --yes skills add ./ordo --list` printed `Found 16 skills` and the 16 names: code-comments, diagnose, grill, land, ordo-help, ordo-init, paper, plan, plan-orchestration, plan-retro, refute, repo-setup, roadmap, session-retro, spec, writing.
4. The README's copy loop. Taken from `README.md` with `sed -n '/^for dir in ~\/.claude\/skills; do$/,/^done$/p'`, `/tmp/ordo` replaced by the clone of the tag and `~/.claude/skills` by a scratch folder, run with `sh`: exit 0, `ls <scratch>/skills | wc -l` printed 16 and `ls <scratch>/skills/*/SKILL.md | wc -l` printed 16.
5. The served models. The Agents section of `plan.md` holds 12 agents: the three brief-check agents, the three builders and the three first reviewers were served `claude-fable-5-2`, and the three reviewers over a repair round `claude-sonnet-5-5`, the `repair_reviewer` value.

## For the user

6. `/plan` and `/land` on a repository whose only `plan.yaml` is in a project folder. A scratch repository stands ready at `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/s4/scratch-repo`, with `apps/web/plan.yaml`, a roadmap of one entry, a building page and a change standard. On it `check_config.py --find <root> apps/web` printed `apps/web/plan.yaml`, `check_config.py --find <root>` printed `error: no plan.yaml in .scratch, docs, .agents of <root>`, and `check_config.py <root>/apps/web/plan.yaml` printed its `ok:` line. In a new Claude Code session started in that folder: `/plan apps/web/1`, then `/spec apps/web/1 1`, the build, `/refute apps/web/1 1` and `/land apps/web/1 1`. The plan's ledger must be under `apps/web/ledger/`.
7. The lines that name `.agents/plan.yaml`. `git grep -n -F '.agents/plan.yaml' -- ':!.scratch'` prints 18 lines: `README.md:198` (the owner of an existing file), `docs/roadmap.md:26` and `:27` (the goal and gate of this entry), 6 lines of `land.test.sh` and 9 of `check_config.test.sh` (cases that build a file in the fourth place of the search).
   - The user read them on 2026-11-22: "They seem fine".

## The run on the scratch repository, made by the session

8. A new Claude Code session, started in the scratch repository with `claude -p` on the pinned skills of `v9.0.0-rc.1`, ran `/plan apps/web/1`, `/spec apps/web/1 1`, the build with a builder agent, `/refute apps/web/1 1` and `/land apps/web/1 1`. Its final report is `agents/reviews/4-scratch-run.md`. Read in the scratch repository afterwards: `git log --oneline` shows `0f4ef63` (the plan opened), `642b2d5` (the brief), `a4e395c` (the dispatch) and `68a2cdf` (the landing); `ls apps/web/ledger` prints `1-a-greeting-page`; `cat apps/web/greeting.txt` prints `hello`; the landing report quotes `land.sh apps/web/ledger/1-a-greeting-page/orchestrator-state.md 1-a-greeting-page-1 642b2d5 apps/web/plan.yaml`, exit 0, with `checks: 1 commands passed`. The run's review by the user is open.
9. The run names five places where the skills' text is unclear for a `plan.yaml` in a project folder: the glossary has no key and `docs/glossary.md` is named outright; the folder the verify commands run from is not stated; a default that is a path lands at the repository root; "every other open plan" has no stated search place; the state file's template has no line for the path of the `plan.yaml`.


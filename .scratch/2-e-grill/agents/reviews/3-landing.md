# Step 3 landing report

Roadmap entry 2.E (grill); plan step 3 of 17, the effort agents; next: step 6, `ui-standard.md`.

## Open items

none

## The check of Steps 1

ListAgents showed no agent of step 3 running: the builder and the three reviewers had finished, and the one agent listed was the round's reviewer, "completed".

## NOT DONE

Nothing in the brief is left undone. The skill texts and the agent definitions take effect at the next pin, which Axel approves; until then the installed skills are v2.5.0 and launch agents as `general-purpose`.

## What landed

- `agents/ordo-low.md` to `agents/ordo-max.md`, the five effort agents.
- `utils/pin.sh` links a tag's agents into the `agents` folder beside each skill folder, prints the agents line in pin and check mode, and refuses a real file, a directory or an outside link at an agent's name, a live-clone link for an agent the tag lacks, an agent folder path that is not a folder, and a folder that is both a skill and an agent folder, before anything changes. `utils/pin.test.sh` has a case for each.
- plan-orchestration, refute and spec launch through `ordo-<worker_effort>` and `ordo-<reviewer_effort>` (`high` by default), refuse when the effort cannot apply, and read and record the model the runner served each agent, stopping on a model other than the configured one. plan-help, plan-terms, the glossary, the README, the change standard and the state template follow.
- Host-visible: any `utils/pin.sh <tag>` creates `~/.claude/agents` (and `$CLAUDE_CONFIG_DIR/agents`, and `~/.agents/agents` when `ORDO_SKILL_DIRS` names `~/.agents/skills`), a re-pin of v2.5.0 included; only a tag holding `agents/` gets links there.

## What was found

- First review: one Spec finding (a skill folder spelled with extra trailing slashes got past the both-folders refusal and moved the pinned worktree), one Standards and one Behaviour finding; all closed in repair round 1.
- Round review: six findings, all fixed at landing (listed in the booking and in `3-refuter.md`, Closed).
- Verify 7: `ordo-high`, launched for real from a scratch folder under `claude -p --effort low`, ran Bash, Read, Edit and Write, and the hook recorded `agent_type: ordo-high` and `effort: {level: high}` for each; its transcript model is claude-opus-5-5. It has the Agent tool.

## Verification on main

`sh skills/land/templates/land.sh .scratch/2-e-grill/orchestrator-state.md 2e-3 44caaf6f2c34b7b25ec06d31c21ad711a0adbf01` printed the six `PASS:` lines, `ok: the plan-terms block equals the template` and `checks: 8 commands passed`, exit 0. After the fixes at landing, `checks.sh` printed `checks: 8 commands passed` again.

## Usage, bar and fixes

- Brief check claude-opus-5-5 173243 tokens, 33 tool uses, 520 s; builder claude-opus-5-5 270520 tokens, 83 tool uses, 1857 s (round 0) and 319642 tokens, 28 tool uses, 387 s (round 1); reviewer claude-opus-5-5 197731 tokens, 33 tool uses, 621 s, and over round 1 208385 tokens, 51 tool uses, 503 s.
- Cost of the landed build at list price, from its transcript: builder about $11 before the round and $8.11 to $22.56 with it (the resume after an hour wrote its whole context to the cache again); round reviewer $2.20 to $6.22.
- The builder's first report did not pass the bar. Fixes at landing: 6.

## Next

Step 6, `ui-standard.md`, the first of the three steps built by Sonnet 5.5 (`worker: claude:sonnet`).

# 0035. Paper and writing run their agents on the default agent when the effort agents are missing, and go on under a newer model of the configured family

Status: proposed; superseded by the ruling The briefs of academic-paper's run of plan 5 in the part that starts the roles of `paper` on the default agent only when the effort agents are missing, now every role of `paper` on the default agent at `medium`; superseded by the ruling The incremental change done properly of plan 5 in the effort `medium` of the roles of `paper` and in their check of the served model's family with its stop, now every role on the default agent with the runner's defaults

## Context

ADR 0030 decides that every role of `paper` "runs as `ordo-medium` on opus", and `paper` refuses to start with "The configured effort cannot apply" when the runner lists no `ordo-medium` agent or `CLAUDE_CODE_EFFORT_LEVEL` is set (`skills/academic/paper/SKILL.md`, Steps 4), so it does not run in a Claude Code setup without Ordo's agents. It also stops a run at "A model other than the configured one" when a role is served any model other than the identifier the model list gave, a newer version of the same family included (Steps 8). The user ruled both in plan 5: open item BN (a), item (3) of the ruling The fourth repair of paper, and the ruling The writing skill in step 5.E, which carries both into `writing`.

## Decision

When the runner lists no `ordo-medium` agent, or `CLAUDE_CODE_EFFORT_LEVEL` is set, `paper` starts each agent on the runner's default agent, on the same model, with the Agent tool's `effort` set to `medium`, and names the effort the agents ran at: `medium`, or the variable's value when it is set. `paper` names it in `config.md` and its final message. A served model of the configured model's family, a newer version included, is named in `paper`'s final message and AI disclosure, and the run goes on; a model of another family stays the stop "A model other than the configured one". `writing` starts each of its agents on the runner's default agent with the runner's defaults in every setup, with the effort agents installed or without them: its prompts set no model and no effort, the line after its report names no effort and no served model, and it has no stop for a served model. This supersedes ADR 0030 in the part that makes `ordo-medium` the only agent a role of `paper` starts as.

## Alternatives rejected

- The refusal kept: neither skill runs at all without Ordo's agents.
- The default agent at the session's effort, for `paper`: a run of `paper` names the effort its agents ran at, and it cannot name an effort it does not read.
- A stop for every served model other than the listed identifier: a run stops when the runner serves a newer model of the same family, which writes the same manuscript.

## Consequences

`paper` and `writing` run in any Claude Code setup. `paper` runs at an effort the run records, and its stop for another model family stays. `writing` records no effort and has no such stop. `skills/academic/paper/SKILL.md`, the `paper` skill's `references/ai-disclosure.md` and `skills/academic/writing/SKILL.md` carry it.

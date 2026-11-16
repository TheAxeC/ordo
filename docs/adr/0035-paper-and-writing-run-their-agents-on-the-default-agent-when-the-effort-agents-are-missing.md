# 0035. Paper and writing run their agents on the default agent when the effort agents are missing, and go on under a newer model of the configured family

Status: proposed

## Context

ADR 0030 decides that every role of `paper` and every agent of `writing` "runs as `ordo-medium` on opus", and both skills refuse to start with "The configured effort cannot apply" when the runner lists no `ordo-medium` agent or `CLAUDE_CODE_EFFORT_LEVEL` is set (`skills/paper/SKILL.md`, Steps 4), so neither runs in a Claude Code setup without Ordo's agents. Both also stop a run at "A model other than the configured one" when a role is served any model other than the identifier the model list gave, a newer version of the same family included (Steps 8). The user ruled both in plan 5: open item BN (a), item (3) of the ruling The fourth repair of paper, and the ruling The writing skill in step 5.E, which carries both into `writing`.

## Decision

When the runner lists no `ordo-medium` agent, or `CLAUDE_CODE_EFFORT_LEVEL` is set, `paper` and `writing` start each agent on the runner's default agent, on the same model, with the Agent tool's `effort` set to `medium`, and name the effort the agents ran at: `medium`, or the variable's value when it is set. `paper` names it in `config.md` and its final message, `writing` in the session's line after its report. A served model of the configured model's family, a newer version included, is named in `paper`'s final message and AI disclosure and in `writing`'s line after its report, and the run goes on; a model of another family stays the stop "A model other than the configured one". This supersedes ADR 0030 in the part that makes `ordo-medium` the only agent a role of `paper` or an agent of `writing` starts as.

## Alternatives rejected

- The refusal kept: neither skill runs at all without Ordo's agents.
- The default agent at the session's effort: the run cannot name an effort it does not read.
- A stop for every served model other than the listed identifier: a run stops when the runner serves a newer model of the same family, which writes the same manuscript.

## Consequences

`paper` and `writing` run in any Claude Code setup, at an effort the run records. The stop for another model family stays. `skills/paper/SKILL.md`, `skills/paper/references/ai-disclosure.md` and `skills/writing/SKILL.md` carry it.

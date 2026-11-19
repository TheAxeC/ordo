# 0030. Paper and writing name the model and effort of each agent and read no plan configuration

Status: proposed; superseded by 0035 in the part that makes `ordo-medium` the only agent a role of `paper` or an agent of `writing` starts as; superseded by the ruling The briefs of academic-paper's run of plan 5 in the part that makes the roles of `paper` run as `ordo-medium`, now every role of `paper` on the default agent at `medium`, the part for `writing` standing; superseded by the ruling The incremental change done properly of plan 5 in the effort `medium` and the opus and sonnet models of the roles of `paper`, now every role on the default agent with the runner's defaults, the part for `writing` standing

## Context

ADR 0027 decides that each role of a `paper` run "runs as `ordo-<reviewer_effort>` on the model the configuration's `reviewer` names", and ADR 0001 that `/writing` reads the prose standard from "the page the repository's `standards` key lists" first. Both keys are read from `.agents/plan.yaml`, the configuration of the plan skills, and `paper` and `writing` refuse to run without that file (`skills/paper/SKILL.md`, "What it reads" 1; `skills/writing/SKILL.md`, "What it reads" 1). A manuscript's repository then needs the plan skills set up before a writing skill runs in it. In plan 5's comparisons, academic-paper set no model and no effort and ran each agent on opus at medium effort, read from `perTurnEffort` in the transcripts of the step 3 revision side and the step 5 lit-review and full sides, and it won lit-review and revision and tied full against `paper`, whose roles ran on opus at high effort; research-hub's sessions that called academic-paper since 2026-11-03 ran at medium too.

## Decision

`paper` and `writing` read no `.agents/plan.yaml`. Each skill names in its own text the model and the effort of each agent it starts: every role of `paper` and every agent of `writing` runs as `ordo-medium` on opus, and `paper`'s formatter runs as `ordo-medium` on sonnet. The prose standard is `docs/dev/prose-standard.md` of the repository when it has one, and otherwise the `repo-setup` skill's `templates/docs/dev/prose-standard.md`, with no refusal for a missing configuration. This record supersedes ADR 0027 in the effort and the model its roles run at, and ADR 0001 in the `standards` key; both stand for every other part.

## Alternatives rejected

- The keys kept in `.agents/plan.yaml`: a writing skill stays tied to the configuration of another product, and refuses in a repository that has none.
- Every agent kept on opus at high effort: the comparisons gave high effort no advantage over academic-paper at medium, and it costs more per agent start.
- Sonnet for the roles that judge claims, numbers or prose: no run shows it holds the judges' bar, and these roles hold the defects the judges counted.

## Consequences

`/paper` and `/writing` run in any repository. The `projects:` form of their calls goes, since it only chose which project's keys to read. A change of model or effort is a change of the skill's text. The effort agent `ordo-medium` must be installed, and `CLAUDE_CODE_EFFORT_LEVEL` must stay unset, as for every effort agent.

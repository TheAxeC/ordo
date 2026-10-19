# 0019. A paper run is done by academic-paper's agent roles, each a fresh agent

Status: proposed

## Context

Roadmap entry 5 builds `paper` on academic-paper, which runs 12 agents, one per phase of its pipeline, from intake to formatting (`research-hub/.agents/skills/academic-paper/SKILL.md`, the agent table). The user's global rules send all manuscript content through a skill whose agents are dispatched through the Agent tool, and limit the orchestrating session to reading, deciding and briefing. Ordo's `/writing` reviews a draft with fresh read-only agents, since a session that wrote a draft would otherwise review its own work (ADR 0013). The coverage inventory marks for `paper` the abstract, argument builder, citation compliance, draft writer, literature strategist, peer reviewer, structure architect, visualization and integrity verification agents (`docs/academic-coverage.md`, rows 52, 53, 54, 55, 58, 59, 62, 63 and 151). The peer reviewer is one reviewer of the author's own draft inside full mode, sending it back to the draft writer at most twice; the five-reviewer panel of academic-paper-reviewer is a separate skill, `paper-review` (roadmap entry 6).

## Decision

A `paper` run is done by academic-paper's agent roles: literature strategist, structure architect, argument builder, draft writer, citation compliance, abstract, peer reviewer, integrity verification and visualization. Each role is a fresh agent started through the Agent tool, with its own page under `skills/paper/references/`, run as `ordo-<reviewer_effort>` on the model the configuration's `reviewer` names. Intake is the session's interview with the user. The run stops for the user at the approval of the outline, at a reference that cannot be confirmed, at the ethics stop and at the acknowledgement of a structural patch.

## Alternatives rejected

- The session does each phase itself from the reference pages, with fresh agents only for the peer review and the integrity check: the session would write the draft and then direct the checks of its own work, against the user's rule that the skill's agents are dispatched.
- Two agents, a writer and a checker: the skill would no longer be built on academic-paper, and one checker would hold the citation, integrity, figure and peer-review rules at once.

## Consequences

A full run starts up to nine agents, and each mode starts only the roles its phases need. Each role's rules sit on one page, so a rule is changed in one place. The later writing skills (`paper-review`, `rebuttal`, `grant`) face the same choice and either follow this record or supersede it.

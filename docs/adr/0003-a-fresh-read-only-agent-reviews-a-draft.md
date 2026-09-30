# 0003. A fresh read-only agent reviews a draft

Status: proposed

## Context

`/writing <file>` reviews a draft by reading it against the writing base's rules and reports each finding with its place, the quoted passage, the rule and a proposed replacement, the user deciding on each. The writing skills `paper` and `grant` draft text and then review it with `/writing`, so the session that runs the review may be the one that wrote the draft. Ordo already has a fresh reviewer that changes nothing review each step of a plan (`README.md`, opening).

## Decision

`/writing` starts one fresh agent that changes nothing, on the model the configuration's `reviewer` names at `reviewer_effort`, which reads the whole draft and reports only breaks of a named rule. The session shows its report to the user and applies the changes the user accepts, as the entry's rulings say.

## Alternatives rejected

- The session that runs `/writing` reads the draft itself: when it wrote the draft, it reviews its own work.
- One agent per section of a long draft: rules that span sections, such as one term per concept and a term defined once, are lost between agents.

## Consequences

Each review costs one agent run. A review reads the whole document, so a multi-file manuscript is given to the agent whole. A reviewer told to report only breaks of a named rule reports no preference as a finding.

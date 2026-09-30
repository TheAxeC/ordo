# 0006. The ledger records every agent's id with its role

Status: proposed

## Context

A script prices each agent role's usage of a plan from the agents' transcripts (`docs/roadmap.md`, entry 2.E.A). A script computes only facts, and whether a text names a role is judged by reading (`docs/dev/change-standard.md`, "Scripts compute facts"). The state file records a builder's agent id in `session_id` and no reviewer's or brief check's id, and the dispatch entry is removed at landing. An agent's `meta.json` holds a free-text `description`, whose form differs between agents of one role.

## Decision

Every agent a plan skill starts is recorded in the ledger with its agent id, its role and its served model: the builder in `session_id`, each reviewer in `reviewer_report`, the brief check in `brief_check`, and each `grill` lookup where `grill` records it. The landing booking copies the ids into `plan.md`. The cost script takes the ids and roles from the plan's ledger only.

## Alternatives rejected

- A fixed description form parsed by the script: the script would match free text, and the agents of plans already run follow no single form.
- The measurement limited to plans run after this change: it drops the plans already run as the baseline a cost change is measured against.

## Consequences

The script's roles are facts from the ledger. A skill added later that starts an agent records its id and role. A plan run before this change gets its id and role list once, read from its agents' `meta.json` and written into its ledger.

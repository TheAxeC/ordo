# 0007. The run over a repair round runs on its own reviewer model

Status: proposed

## Context

`/refute` runs a fresh reviewer on a step's diff and, with `refute_after_repair: yes`, again over each repair round (`skills/plan/templates/plan.yaml`). The run over a repair round checks the round's delta against findings the first run already named, a narrower job than the first run of a step. A repository may want that run on another model than the first run's. The reviewer is still an agent that did not do the work, which is what the review is for.

## Decision

The run over a repair round runs on the model an optional key `repair_reviewer` names, whose default is the `reviewer` value, at `reviewer_effort`. The served-model check applies to it as to every agent started as an effort agent.

## Alternatives rejected

- The same model at medium effort: the run over a repair round stays on the first run's model, and a repository cannot set another model for it.
- No change until the reviewer trial of plan 2.F reports: until then no repository can set the model of the run over a repair round apart from the first run's.

## Consequences

A repository sets the model of the run over a repair round apart from the model of the first run. A repository that leaves the key out runs both on the `reviewer` value.

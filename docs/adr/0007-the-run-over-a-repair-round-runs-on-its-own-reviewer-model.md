# 0007. The run over a repair round runs on its own reviewer model

Status: proposed

## Context

`/refute` runs a fresh reviewer on a step's diff and, with `refute_after_repair: yes`, again over each repair round (`skills/plan/templates/plan.yaml`). The run over a repair round checks the round's delta against findings the first run already named. Claude Sonnet 5.5 costs $2 input and $10 output per million tokens, Claude Opus 5.5 $4 and $20 (https://platform.claude.com/docs/en/about-claude/pricing). The reviewer is still an agent that did not do the work, which is what the review is for.

## Decision

The run over a repair round runs on the model an optional key `repair_reviewer` names, whose default is the `reviewer` value, at `reviewer_effort`. Ordo's `.agents/plan.yaml` sets it to `claude:sonnet`. The served-model check applies to it as to every agent.

## Alternatives rejected

- The same model at medium effort: the price per token does not change, and the saving in tokens is not measured.
- No change until the reviewer trial of plan 2.F reports: the cost is not cut, and nothing is measured.

## Consequences

Each second review costs about half as much per token. A trial that moves the first review to Sonnet as well supersedes this record, since the key then repeats `reviewer`. The cost script of entry 2.E.A measures the difference against plan 2.E.

# 0008. The cost script prices from a table copied by hand

Status: proposed

## Context

The cost script prices each agent role's usage of a plan from the transcripts, whose usage splits input, 5-minute and 1-hour cache writes, cache reads and output (entry 2.E.A). Anthropic's pricing page gives each model's rate for each, and prices a cache read on Claude Opus 5.5 at 0.05x the base input price where most models use 0.1x (https://platform.claude.com/docs/en/about-claude/pricing). ccusage fetches its prices from LiteLLM's `model_prices_and_context_window.json` and models.dev. A script computes only what has one correct answer (`docs/dev/change-standard.md`, "Scripts compute facts").

## Decision

The script reads a price table kept beside it: per model id, input, 5-minute cache write, 1-hour cache write, cache read and output per million tokens, with the page it was copied from. It is updated by hand. A model the table lacks is an error that names the model.

## Alternatives rejected

- Fetching LiteLLM's file at run time: the script would depend on the network and on an outside file whose rate for an Opus 5.5 cache read is not checked.
- One 0.1x cache-read multiplier for every model: it prices Opus 5.5's cache reads at twice their cost.

## Consequences

The prices can be read and checked, and the script runs offline. A price change, or a new model, is a hand edit of the table, and the script refuses a model until it is added.

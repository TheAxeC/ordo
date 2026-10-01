# 0009. The cost script takes each response's counts from its response body

Status: proposed

## Context

The cost script prices each agent role's usage of a plan (`docs/roadmap.md`, entry 2.E.A). A subagent's transcript, `subagents/agent-<id>.jsonl`, writes a response's entries while it streams, and the last entry of most responses carries an output count taken before the stream ended, with `stop_reason` null: 470 of the 498 responses of plan 2.E.A's first fifteen agents end that way, and one tool call of 59,564 characters is recorded with 4 output tokens. Its input and cache counts are final: none of 14,552 repeated entries differs in them from the entry before. With `CLAUDE_CODE_ENABLE_TELEMETRY=1` and `OTEL_LOG_RAW_API_BODIES=file:<folder>`, Claude Code writes each request's response body to `<folder>/<request id>.response.json`, subagents' requests included, with `index.jsonl` beside it, and the body's `usage` holds the final counts, the 5-minute and 1-hour cache writes apart (code.claude.com/docs/en/monitoring-usage; a probe on Claude Code 2.1.286). The `requestId` of a transcript entry names the body's file. The telemetry event `claude_code.api_request` carries the same counts without the two cache writes apart.

## Decision

The script takes a response's counts from its response body when the body's file exists in the folder `OTEL_LOG_RAW_API_BODIES` names, and from the last entry of its transcript otherwise. An agent with a response priced from its transcript has its row, its role's row and the total marked as a lower bound, with the number of such responses.

## Alternatives rejected

- The transcript alone, its output marked as a lower bound: the output stays short by an amount nobody knows, which is most of what a builder writes.
- The response bodies alone, a response with no body an error: no plan run before the setting was turned on could be priced, plan 2.E among them, which the entry's gate names.
- The `claude_code.api_request` events: the documented exporters are `console`, `otlp`, `prometheus` and `none`, so a file of them needs a collector, and they do not split the cache writes the price table prices apart.

## Consequences

A plan run with the setting on is priced exactly. A plan run before it is priced from its transcripts, as a lower bound the output shows. The setting is the user's, in the runner's settings, and the folder grows with every request and holds each request's prompt.

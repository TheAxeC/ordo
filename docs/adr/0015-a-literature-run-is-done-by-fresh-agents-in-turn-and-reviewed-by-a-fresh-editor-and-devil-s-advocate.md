# 0015. A literature run is done by fresh agents in turn and reviewed by a fresh editor and devil's advocate

Status: proposed

## Context

Roadmap entry 9 builds the `literature` skill, which replaces deep-research for the hub's work. The coverage inventory takes deep-research's bibliography, verification, synthesis, report, editor and devil's advocate roles (`docs/academic-coverage.md`, rows 185 to 197), and makes the editor and the devil's advocate drive a two-loop revision of the report (rows 186 and 187). A reviewer that did not write a draft finds what its writer missed, which is why `/writing` reviews with fresh agents (ADR 0013). A literature run reads the full text of each source, and a source's text in a shared context crowds out the others. clibib measured a lower regression rate when search is separated from revision than in a single tool loop, 0.8 against 4.8 percent (https://arxiv.org/html/2604.03159, abstract).

## Decision

A literature run is done by fresh agents in turn: a search agent (the searches, the citation chaining and the two-stage screening against criteria written first), a verification agent (resolves and grades each kept source), one reading agent per source (fetches its full text and extracts the passages with their locators), and a synthesis agent that writes the report from the extracted passages only. A fresh editor agent and a fresh devil's advocate agent then review the report, and their findings drive two revision loops, each revision made by a fresh writer agent. The session that runs the skill launches the agents, passes their files on and writes no part of the report.

## Alternatives rejected

- One agent with tools for every stage, as PaperQA2 runs: the agent reviews its own draft, and every source's text shares one context.
- The session doing the work inline: the session's context fills with full texts, and nothing reviews the report fresh.

## Consequences

A run costs one agent per source read and two per review loop more than a single agent would. `paper` and `paper-review` can reuse the reading agent and the devil's advocate. The skill's steps name each agent, what it is given and the file it writes.

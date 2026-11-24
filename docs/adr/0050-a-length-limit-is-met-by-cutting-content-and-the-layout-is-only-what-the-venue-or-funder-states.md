# 0050. A length limit is met by cutting content, and the layout is only what the venue or funder states

Status: proposed

## Context

Roadmap entry 25's goal says that `grant` and `paper` hold that a page or length limit is met by cutting content and never by changing how the document is set. `skills/academic/paper/agents/formatter_agent.md` holds a sentence copied from academic-paper that says the opposite in one case: where a layout value the user declared would push the manuscript past a venue's limit, the formatter applies a venue-compliant value. `grant` reports a compile that is over the page limit and does not say what follows. `paper`'s draft writer already trims a section that is over its target. ADR 0043 keeps `paper`'s pages as copies of academic-paper's, with each deviation recorded.

## Decision

In `paper` and `grant`, the layout (font, size, line spacing, margins) is only what the venue or the funder states, and is never changed to meet a limit.

- The formatter's sentence that applies a venue-compliant layout value to meet a limit is replaced by this rule.
- A text over its limit goes back to the draft writer once, to cut content.
- What is still over is shown to the user with each section's length against its limit.
- `grant` has the same step after a compile that is over the page limit.
- The manuscript prose standard holds that every sentence of a deliverable answers the reader or states a change, with no process history.

## Alternatives rejected

- The formatter's sentence kept as the one exception: the rule then fails in the one place where layout and limits meet.
- The over-limit text only reported: the user is left with a document that cannot be submitted and no cut proposed.

## Consequences

This record supersedes ADR 0043 in three places: the formatter's sentence that applies a venue-compliant layout value to meet a limit, its copy on the intake's page, and the list of the draft writer's resumed tasks of 0043's Decision 3, which gains the cut of a manuscript over a declared limit. A reviewer who sees a margin, a font size or a spacing changed to gain room has a finding under this record.

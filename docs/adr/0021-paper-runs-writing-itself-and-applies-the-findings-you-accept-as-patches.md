# 0021. Paper runs `/writing` itself and applies the findings you accept as patches

Status: superseded by 0023

## Context

Roadmap entry 5's goal says the paper skill "applies the `/writing` findings you accept to the manuscript". `/writing` reports each break of a named rule, "proposes no replacement and applies nothing" and leaves "the decision on it to the user" (`skills/writing/SKILL.md:127` and `:130`), and its Use instead table sends the findings of a manuscript to `paper` (`skills/writing/SKILL.md:23`). The revision mode edits a manuscript through anchorize, patch and apply (`docs/academic-coverage.md`, row 94), as academic-paper's revision mode does (`research-hub/.agents/skills/academic-paper/SKILL.md:326`). The arguments of each mode leave no place for a `/writing` report (rulings of entry 5, D26).

## Decision

Full mode and revision mode end by invoking `/writing` on the manuscript through the Skill tool and showing its report. The user answers once, in one line, which findings to accept, such as `all` or `all but 3, 7`. The draft writer writes each accepted finding's fix as a patch, applied through anchorize, patch and apply, and the apply report goes into the run's folder (ADR 0020). `/paper revision <main.tex> <report>` also takes a `/writing` report made separately as its comments file.

## Alternatives rejected

- The revision mode takes a `/writing` report as its comments file, and nothing more: the user runs three commands and makes two hand-offs per manuscript, when the only act that is the user's is choosing the findings.
- Every finding applied without asking: the goal and `/writing` leave the decision on each finding to the user.

## Consequences

The user's part is one answer per run. Full and revision runs take one `/writing` run of four agents longer. The fixes leave the same patch trail as any revision, so `rebuttal` reads them from the run's folder. Entry 8, `grant`, has this record to follow or supersede for the findings of a grant.

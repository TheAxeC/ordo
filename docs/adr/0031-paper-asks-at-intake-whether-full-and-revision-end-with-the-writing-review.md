# 0031. Paper asks at intake whether full and revision end with the writing review

Status: proposed; superseded by 0043 in its sentence on what a reply to the report starts: the reply goes to the run's draft writer, resumed, the citation check of the pass runs only when the intake rows Claim check and Incremental checks are yes, and no peer reviewer reads the pass

## Context

ADR 0023 decides that "Full mode and revision mode invoke `/writing` on the manuscript through the Skill tool after the compile". The review starts four `/writing` agents, and a reply to its report starts the draft writer, a citation check of the pass and a peer reviewer's reading of it (ADR 0029). Academic-paper ends its runs with no such review. The same review is open to the user at any time: `/writing` on the manuscript, then `/paper revision <main.tex> <report>`.

## Decision

Intake asks in full and revision mode whether the run ends with the `/writing` review, default yes. With yes the run ends as ADR 0023 and ADR 0029 decide. With no the run ends after the compile, and the final message says that `/writing` can be run on the manuscript and that `/paper revision <main.tex> <report>` takes its report. This record supersedes ADR 0023 in that full and revision mode always invoke `/writing`; ADR 0023 stands for every other part.

## Alternatives rejected

- The review always run, as ADR 0023 decides: a user who does not want it pays for its agents and the pass it starts.
- The review never run, left to the user: the default the user ruled is yes.

## Consequences

A run whose user answers no is shorter by the four `/writing` agents and what a reply starts. `skills/paper/SKILL.md` and `references/intake.md` carry the row.

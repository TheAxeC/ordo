# 0023. Paper ends a run with the writing findings listed, and applies the ones you pick or an autonomous writer pass

Status: proposed; superseded by 0029 in what follows the findings pass; superseded by 0031 in that full and revision mode always invoke `/writing`; superseded by 0043 in its words that a reply starts the draft writer, the reply going to the run's draft writer, resumed

## Context

ADR 0021 had full mode and revision mode invoke `/writing`, stop for the user's one-line answer before the compile, and apply each accepted finding as a patch. `/writing` reports breaks of named rules, each a judgment a careful person could dispute, and leaves the decision on each to the user (`skills/writing/SKILL.md`). A stop before the compile leaves the run unfinished while it waits. academic-paper applies its writing-quality check inside the draft without asking (`research-hub/.agents/skills/academic-paper/references/writing_quality_check.md`).

## Decision

Full mode and revision mode invoke `/writing` on the manuscript through the Skill tool after the compile, and the final message shows its numbered report. A reply in one line, such as `all`, `2, 5` or `none`, starts the draft writer for those findings, each fix a patch applied through anchorize, patch and apply, and then the compile again. The final message also says that the user can instead call for an autonomous writer pass, in which the draft writer judges each finding and applies the ones it accepts, listing the rest with its reason. `/paper revision <main.tex> <report>` also takes a `/writing` report made separately as its comments file.

## Alternatives rejected

- The stop before the compile, as ADR 0021 had it: the run is unfinished while it waits for the answer.
- A separate call `/paper apply <main.tex> <numbers>`: a call form outside academic-paper's mode names, against the ruling on the mode names.
- An autonomous writer pass as the only route: the model judges its own text, and the text moves toward the prose standard instead of the user's request.

## Consequences

A run's manuscript is complete and compiled when the run ends, and the user's answer costs one patch pass and one compile. The fixes leave the same patch trail as any revision, so `rebuttal` reads them from the run's folder. Entry 8, `grant`, has this record to follow or supersede for the findings of a grant.

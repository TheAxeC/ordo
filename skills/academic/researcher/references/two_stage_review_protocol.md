# Two-Stage Review Protocol

## Stage 3: First Review (Full Review)

- **Input**: Paper that passed integrity check
- **Run**: `/paper-review-panel full`, invoked through the Skill tool with its own stops
- **Review team**: EIC + R1 (methodology) + R2 (domain) + R3 (interdisciplinary) + Devil's Advocate
- **Output**: 5 review reports + Editorial Decision + Revision Roadmap + Socratic Revision Coaching
- **Decision branches**: Accept to Stage 4.5 / Minor|Major to Revision Coaching, then Stage 4 / Reject to Stage 2 or end

See the `paper-review-panel` skill's `SKILL.md` for review process details.

## Stage 3 to 4 Transition: Revision Coaching

EIC uses Socratic dialogue to guide the user in understanding review comments and planning revision strategy (max 8 rounds). User can say "just fix it for me" to skip.

## Stage 3': Second Review (Verification Review)

- **Input**: Revised draft + Response to Reviewers + original Revision Roadmap
- **Mode**: `/paper-review-panel re-review`, invoked through the Skill tool with its own stops
- **Output**: Revision response comparison table + new issues list + new Editorial Decision + R&R Traceability Matrix (Schema 11)
- **Decision branches**: Accept to Stage 4.5 / Minor to one `/paper revision` run for the minor items, then Stage 4.5 / Major to Residual Coaching, then Stage 4'

See the `paper-review-panel` skill's `SKILL.md`, Steps, "re-review", for verification review process.

## Stage 3' to 4' Transition: Residual Coaching

EIC guides the user in understanding residual issues and making trade-offs (max 5 rounds). User can say "just fix it" to skip.

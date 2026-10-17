# Step 1a landing

Roadmap entry 4, code-comments; plan step 1a of 4, the prompt file, landed; next: step 2, the gate run, after the tag and the pin of open item D.

## Open items

- Open item D (2026-10-17), step 2, the tag and the pin before the gate run: step 1a landed on main, changing `skills/code-comments/SKILL.md` and ADR 0014, and the pinned `v8.2.0-rc.1` on `4e2788e` still serves the skill without the prompt file, so `/code-comments` on the gate's range would stop again as open item C found.
  - (a) Tag `v8.2.0-rc.2` on the landing commit of step 1a and run `utils/pin.sh v8.2.0-rc.2`; the final `v8.2.0` stays with the closing. Pro: the gate runs the skill as it now stands on main. Con: one more release-candidate tag.
  - (b) Run the gate on the pinned `v8.2.0-rc.1`. Pro: no new tag. Con: the run stops at the prompt size again, so the gate cannot pass.
  - Recommendation: (a), since the gate must run the skill that landed. The lazy option is (b).

## Check of Steps 1

The runner's agent listing showed no agent left: the builder, the brief-check agent and both reviewers of step 1a had ended.

## NOT DONE

Nothing of the step.

## What landed

- `skills/code-comments/SKILL.md` (1.0.0, 376 lines): the session writes each agent's prompt file (`finding.md`, `checking.md`, `rewrite.md`) in a prompt folder made with `mktemp -d` after the last refusal, by shell commands that append with `>>`; the finding agent's final message and the picked findings are the only text it types. Each agent reads its prompt file whole as the only file it reads; the rewrite agent also reads and edits the files its picked findings name. A reviewed file over 262144 bytes is given as its `git diff --unified=40` hunks; a file added whole or untracked is given whole at any size. The checking agent's report opens with the files given as hunks. The prompt folder is removed at Steps 8, on the model stop, and at the rewrite's end and stop. Steps 2 refuses a prose standard without its sections 0, A, B, C and E.
- ADR 0014: the Decision says the session writes the prompt file with shell commands, holding the diff, the rules and each changed file, whole or, over 256 KB, as its diff hunks with 40 lines on either side.

## What was found

- Brief check: 24 findings, closed in the brief (`1a-brief-check.md`, Closed).
- First review (`1a-refuter.md`): ST1, ST2 and B1, closed in repair round 1.
- Run over round 1: three Standards points; two fixed at landing, one closed with no change (Closed heading of `1a-refuter.md`).

## Verification on main

`sh ~/.claude-backup/skills/land/templates/land.sh .scratch/4-code-comments/orchestrator-state.md 4-code-comments-1a d4809cd` printed `PASS: strip_comments.py scratch tests`, `PASS: land.sh scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `ok: the plan-terms block equals the template`, `PASS: pin.sh scratch tests`, nothing for the character-set check, and `checks: 7 commands passed`, and exited 0; after the fixes at landing, `checks.sh` on main printed `checks: 7 commands passed`.

## Usage, the first report, the fixes at landing

- Brief check ac9dd04a4278294c4 claude-opus-5-5 204421 tokens, 42 tool uses, 14 min 10 s; builder af40906f8aa8074f1 claude-sonnet-5-5 283251 tokens, 85 tool uses, 19 min 9 s (first run) and 346545 tokens, 35 tool uses, 6 min 51 s (round 1); reviewer acaa6da129278eb92 claude-opus-5-5 249732 tokens, 58 tool uses, 15 min 8 s; reviewer over round 1 a8e96a35d67f32122 claude-sonnet-5-5 185170 tokens, 43 tool uses, 6 min 28 s.
- The builder's first report did not pass its bar (ST1, ST2, B1).
- Fixes at landing: 2, "Each piece after the first starts with a line break." in `SKILL.md`, and ADR 0014's two "It holds" sentences joined.

## Next

Open item D, then step 2: `/code-comments a0aa831^..a0aa831` in a new scratch clone of game-engine at `a0aa831` with game-engine's `.agents/plan.yaml` copied in.

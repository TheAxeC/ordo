# Landing of step 4

Roadmap entry 3 (The writing base). Plan step 4 of 5: the rebuilt review. Next: step 5, the closing, after the tag `v8.1.0-rc.3`, its pin and the one `/writing` run on the NWO XS application that is step 4's check.

## Open items

- Step 4, ADR 0013 and the moved place (2026-10-15): ADR 0013 says the checking agent of `/writing` "keeps a finding only where its quote stands at its place". The landed skill also lets it move a finding to the paragraph where the quoted words really stand: a finding that says paragraph 12 for words that stand in paragraph 14 is kept as paragraph 14, where the ADR's words would drop it (finding Spec 4 of `agents/reviews/4-refuter.md`). (a), recommended: change the ADR's sentence to "keeps a finding only where its quote stands in the draft, at the place given or moved to where it stands, and the rule's own words describe the break". Pro: a real break with a wrong paragraph number still reaches the user. Con: none. (b): take the move out of the skill, so such a finding is dropped. Pro: no ADR edit. Con: real breaks are lost over a wrong number. The lazy option is (b). This is the user's call because it is a contradiction of an ADR.

## NOT DONE

- Step 4's check, the one `/writing` run on the NWO XS application with the user's reading and the session's verdict, has not run yet. It follows the tag and the pin.

## The check of Steps 1

- The runner's agent listing (ListAgents) showed no agent of this step running; the only session listed besides this one was the peer session research-hub-ae, which is not an agent of this plan.

## What landed

- `skills/writing/templates/prose_facts.py`, new, and `skills/writing/SKILL.md`, rewritten: a script that computes the approved facts, then a sentence agent, a section agent and a whole-draft agent at once, each with the draft's text, the facts and only its own rules, then a checking agent with the whole draft, the facts and every finding, which writes the one report grouped by rule.
- The pages that named one review agent of `writing`, the `prose_facts.py` row of `docs/dev/scripts.md`, and the character-set check without its `cases/` skip. The session deleted `.scratch/3-the-writing-base/cases/` (17 files) on main before `land.sh` ran.
- With the commit: the brief-check, builder, refuter and landing reports, the booking and the step's agents in `plan.md`, choice C68 in `.scratch/choices.md`, and the state file with the dispatch entry removed.

## Verification on main

`env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude-backup/skills/land/templates/land.sh .scratch/3-the-writing-base/orchestrator-state.md 3-the-writing-base-4 235e36f` exited 0. After the fixes at landing, `checks.sh` over the same list printed:

```
PASS: land.sh scratch tests
PASS: check_config.py scratch tests
PASS: sync_rules.py scratch tests
ok: the plan-terms block equals the template
PASS: pin.sh scratch tests
checks: 6 commands passed
```

The verify list's character-set command was rewritten to the page's new command before `land.sh` ran. A/B: none. Look: none configured.

## What was found

- The brief check found 34 points (N1 to N4, S1 to S3, P1 to P4, C1 to C5, Q1 to Q5, A1 to A3, D1 to D7), each closed in the brief.
- The review found Spec 1 to 4, Standards 1 to 3 and Behaviour 1 to 4: the checking agent lacked the rules on instructions in the draft and on registers, the rule-naming form, a path quoting that let the shell expand `$`, Markdown lists read as one sentence, and the semicolon rate counted over the reference list.

## Fixes at landing

- 7: Spec 1, Standards 1, 2 and 3, Behaviour 3 and 4, and a comment-only `.tex` line, each named under the Closed heading of `4-refuter.md`. Spec 2 is closed by choice C68 and Spec 4 is the open item above.

## Agents

- Brief check a293907a50452e96c, claude-opus-5-5: 252343 tokens, 58 tool uses, 11 min 52 s.
- Builder a672784c13c7427a1, claude-sonnet-5-5: 259905 tokens, 54 tool uses, 15 min 21 s. Its report did not pass its bar.
- Reviewer a13261b3827cd27ef, claude-opus-5-5: 262479 tokens, 54 tool uses, 13 min 20 s.

## Next

- Tag `v8.1.0-rc.3` on the landing commit and pin it, then `/writing` once on the NWO XS application.

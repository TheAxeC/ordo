# Step 1 landing report

Roadmap entry 4, code-comments; plan step 1 of 3, the skill; next: step 2, the gate run, after the tag and the pin the user rules on.

## Open items

- none.

## The check of Steps 1

The runner's agent listing showed the round's reviewer as completed and no agent of the step running; the builder and the first reviewer had ended with their completion notices.

## NOT DONE

Nothing of step 1. Step 2 waits on the user's ruling on the tag and the pin.

## Booking

- Landed: 20 files, 1335 insertions and 26 deletions against the base b107561, with the landing fixes on top: `skills/code-comments/` with `SKILL.md` (1.0.0, 254 lines), `templates/strip_comments.py` (341 lines) and `templates/strip_comments.test.sh` (711 lines); the five `agents/ordo-*.md` definitions; the `reviewer` and `reviewer_effort` comments of `skills/plan/templates/plan.yaml`, `skills/plan/templates/orchestrator-state.md` and `.agents/plan.yaml`, `skills/plan/SKILL.md` (5.0.2); the terms **effort agent**, **reviewer** and **finding** of `skills/repo-setup/templates/plan-terms.md` and line 3 of its template glossary, `skills/repo-setup/SKILL.md` (5.3.0), synced into `docs/glossary.md`; `README.md`, `docs/dev/scripts.md`, `docs/dev/building.md` and `docs/dev/change-standard.md`.
- Ticked: the skill read against `docs/dev/skill-layout.md`, D1 to D7, E1, E2 and ADR 0014 in `agents/reviews/1-report.md` and by both reviewers (items 1 and 4 hold); `strip_comments.test.sh` failed on the unchanged tree (`FAIL: case 1, comment reworded: ...`, exit 1, quoted in the report) and prints `PASS: strip_comments.py scratch tests` with exit 0 on main; the character-set check over the changed files printed nothing.
- Verify list: rewritten at Steps 2, `sh skills/code-comments/templates/strip_comments.test.sh 2>&1 | tail -1` added first, since the step adds it to `docs/dev/building.md` and `docs/dev/change-standard.md`.
- Premise corrections: at /spec, the brief check's findings closed in the brief (`1-brief-check.md`, Closed); open item A (what `strip_comments.py` computes) ruled (a) by the user before the build; open item B (the start and end of the stripped form), raised by the builder's first run of the cases, ruled (a) by the user before any code.
- Review: `1-refuter.md`, the first run with Spec S1 and S2, Proof P1 to P3, Standards ST1 to ST5 and Behaviour B1 to B4; repair round 1 (`agents/briefs/1-round-1.md`, c3245c4) with 14 rulings, two of them taken under self-rule as readings of D7: a literal other than a raw string that does not close ends at its line's end (B2), and a backslash before CR LF is a splice (B1). The run over round 1 found each ruling closed, and F1 to F5; the Closed heading of `1-refuter.md` names each disposition.
- Fixes at landing: 5. F1: `SKILL.md`'s Rules bullet on ending options names the commands that take an option, and a new bullet says `strip_comments.py` takes a relative path as `./<path>`. F2: the first Stops row's "What it shows" names the files put back and the scratch folder removed during the rewrite. F5: "The rewrite" 4's two-requirement bullet split in two. F3: the builder's report's judgment call 13 moved under "Judgment calls". F4: the report's "Standards on list items and sentence length" rewritten with the lines on main, and its line count of `SKILL.md` set to 254.
- Verification on main: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh ~/.claude-backup/skills/land/templates/land.sh .scratch/4-code-comments/orchestrator-state.md 4-code-comments-1 b107561` printed `PASS: strip_comments.py scratch tests`, `PASS: land.sh scratch tests`, `PASS: check_config.py scratch tests`, `PASS: sync_rules.py scratch tests`, `ok: the plan-terms block equals the template`, `PASS: pin.sh scratch tests`, nothing for the character-set check, and `checks: 7 commands passed`, and exited 0; after the fixes at landing, `checks.sh` on main printed `checks: 7 commands passed`.
- A/B: none. Look: none configured.
- Usage: brief check a0c9f327f17f5773c claude-opus-5-5 237377 tokens, 45 tool uses, 13 min 6 s; builder a506da4c91c7ab7a8 claude-sonnet-5-5 137104 tokens, 18 tool uses, 3 min 51 s (first run, to the hand-back), 255446 tokens, 37 tool uses, 13 min 26 s (round 0) and 309868 tokens, 21 tool uses, 6 min 48 s (round 1); reviewer a1303ca1b092c3c67 claude-opus-5-5 230654 tokens, 48 tool uses, 14 min 15 s; reviewer over round 1 a9ba00623e6a89399 claude-sonnet-5-5 181142 tokens, 32 tool uses, 6 min 7 s.
- The builder's first report did not pass its bar: the rewrite agent's prompt had no instructions, a backslash before CR LF and a literal left open after a stray apostrophe let a code change compare `equal`, paths starting with `-` broke the copy and the compare, a file deleted before `apply` would be restored, the scratch folder was left on the model stop, and the test's head comment and the script's `\\#` sentence were false.

## Next

Step 2, the gate run: after a tag and a pin the user rules on, `/code-comments a0aa831^..a0aa831` in a scratch clone of `game-engine` at `a0aa831`.

# Step 2 landing

Entry 5 of `docs/roadmap.md`, paper; step 2 of 4, the skill, landed on main; next, step 3, the gate's runs, with `/spec 5 3`.

## Open items

- none.

## The check of Steps 1

The builder (a36ec75854b27e0a8) and the two reviewers (a20e791c4d7c8dedd, a0cba8ec4935041d4) had each ended with a completion notice before the landing; the runner's stop tool found no running task for any of the three ids, and `ListAgents` listed no reachable agent.

## Not done

- none inside the step.

## What landed, what was found, and the booking


- Landed: 29 files, 3687 insertions and 81 deletions against the base 05a4bd6, the landing fixes included: `skills/paper/SKILL.md` 1.0.0 (404 lines, seven modes, description 838 characters) with 14 pages under `skills/paper/references/`, `references/patch-file.md` among them; `skills/writing/SKILL.md` 1.1.0, numbering its findings; the paper row of `README.md` and its install loop; comment text of `.agents/plan.yaml`, `skills/plan/templates/plan.yaml` and `orchestrator-state.md` and the five `agents/ordo-*.md`; the glossary, `plan-terms.md` and repo-setup's glossary template; 55 rows of `docs/academic-coverage.md` naming where each part is held.
- Ticked: the run over round 1 gives items 1 to 5, 7 to 10, 12 to 14, 17 and 18 holds and cases C1 to C3, C6 to C11 and C13 to C17 met; items 6, 11, 15, 16 and cases C4, C5, C12 partial were its six findings, all fixed at landing below, after which each part they name holds by reading.
- Verify list: equal to `docs/dev/building.md`'s 10 commands with their filters, unchanged.
- Premise corrections: at /spec, open items C and D closed under self-rule (C104, C105), and the brief check's findings closed in the brief (`agents/reviews/2-brief-check.md`).
- Review: `agents/reviews/2-refuter.md`; the first run found 8 Spec, 3 Proof, 7 Standards and 3 Behaviour findings, among them Spec 1, scripts the builder wrote for the coverage edits and the records, which no ruling approved; all were sent as the 21 points of repair round 1 (`agents/briefs/2-round-1.md`), which forbade any script file and had the work redone by hand, so nothing the scripts produced is kept. The run over round 1 found 6 findings, which the Closed heading of the refuter report disposes of.
- Fixes at landing: 8. Standards 1: `references/visualization.md` "What the agent reads" says what check 9 and the trace read under "figures in parallel", when no `.tex` exists. Standards 2: row 169 of `docs/academic-coverage.md` reads in one plain sentence. Spec 3: row 148 states the parallel shape the skill takes against the source's. Standards 4: `SKILL.md` "the closing checks" states that the title page, running head, abstract page, heading format and table and figure format follow the venue's template, the place row 78 names. Standards 5: the integrity agent's inputs in `SKILL.md` Agent prompts and `references/integrity-verification.md` name the check of entries. Behaviour 6: disclosure item 1 sends a statement that names no model, and a run with no patch, past the comparison. From the points declined to judge, two sentences a page contradicted: the dual-use bullet of `references/ethics.md` "Verdict and stop" and the first bullet of `references/citation-compliance.md` "An unsupported claim", which now follows ADR 0018.
- Verification on main: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/land.sh .scratch/5-paper/orchestrator-state.md 5-paper-2 05a4bd6` staged the 29 paths; after the fixes `sh skills/land/templates/checks.sh .scratch/5-paper/orchestrator-state.md` printed `PASS: strip_comments.py scratch tests`, `PASS: land.sh scratch tests`, `PASS: check_config.py scratch tests`, the `PASS:` lines of `anchorize_tex.py`, `apply_tex_patch.py` and `lookup.py`, `PASS: sync_rules.py scratch tests`, `ok: the plan-terms block equals the template`, `PASS: pin.sh scratch tests`, the character-set check with no line, and `checks: 10 commands passed`; `python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research` printed `ok: docs/academic-coverage.md`.
- A/B: none. Look: none configured.
- Usage: brief check a3bbeeb121f4b8378 claude-opus-5-5 280536 tokens, 67 tool uses, 14 min 55 s; builder a36ec75854b27e0a8 claude-sonnet-5-5 181394 tokens, 680 tool uses, 124.9 minutes (build) and 276802 tokens, 297 tool uses, 30.7 minutes (round 1); reviewer a20e791c4d7c8dedd claude-opus-5-5 221292 tokens, 122 tool uses, 20.9 minutes; reviewer over round 1 a0cba8ec4935041d4 claude-sonnet-5-5 102980 tokens, 98 tool uses, 11.7 minutes.
- The builder's first report did not pass its bar: it opened NOT DONE, and the first run found 21 findings, the unapproved scripts among them.

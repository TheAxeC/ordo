# Step 1 landing

Entry 5 of `docs/roadmap.md`, paper; step 1 of 4, the scripts, landed on main; next, step 2, the skill, with `/spec 5 2`.

## Open items

- none.

## The check of Steps 1

The builder (a6c963d98dcec2c04) and the two reviewers (a8f3bf8ec5b9a9df5, a2421c20d030e1072) had each ended with a completion notice before the landing; the runner's stop tool found no running task for any of the three, and its agent listing showed no agent running.

## Not done

- none inside the step.

## What landed, what was found, and the booking

- Landed: 9 files, 2679 insertions against the base b2b39ec, the landing fixes included: `skills/paper/templates/anchorize_tex.py` (135 lines) and `apply_tex_patch.py` (285), their code equal to research-hub's `tools/manuscript/` copies below a rewritten head comment, with their new tests `anchorize_tex.test.sh` (117) and `apply_tex_patch.test.sh` (234); `skills/paper/templates/lookup.py` (1393) and `lookup.test.sh` (503), taken from 0074728 with `USER_AGENT` naming the paper skill, the key reader `tex_cited_keys` following `\input` and `\include`, the new `cite-keys <main.tex> <file.bib>`, `check-urls <main.tex> <file.bib>` with the doi title check, and `quote-check <integrity record> <file.bib> <folder>`; the three tests in `docs/dev/building.md` and `docs/dev/change-standard.md`, and the three scripts and three tests in `docs/dev/scripts.md`.
- Ticked: every item of the brief holds and every case (A1 to A4, P1 to P11, L1 to L7, L5a to L5d) is met, by both reviewers; the cases of the two new `lookup.py` commands fail on the unchanged tree (the 0074728 `lookup.py` with the final test, exit 1, its failing lines equal to the report's block, rerun by both reviewers) and the three tests print their `PASS:` lines with exit 0 on main.
- Verify list: rewritten at Steps 2 from 7 to 10 commands, `sh skills/paper/templates/anchorize_tex.test.sh 2>&1 | tail -1`, `apply_tex_patch.test.sh` and `lookup.test.sh` in the same form added after the check_config test, since the step adds them to `docs/dev/building.md` (ADR 0010).
- Premise corrections: at /spec, open item B closed under self-rule (C103) and the brief check's findings F1.1 to F8.3 closed in the brief (`agents/reviews/1-brief-check.md`, Closed).
- Review: `agents/reviews/1-refuter.md`; the first run found Standards 1 (five test checks that only pin error wording) and Behaviour 1 (the added title-check requests not stated), sent back with the integrity record's name in `quote-check` as the three points of repair round 1 (`agents/briefs/1-round-1.md`, 4cfa13d); the run over round 1 found the three points closed and Proof 1, Standards 1 to 3 and Behaviour 1, all fixed at landing; the Closed heading of `1-refuter.md` names each disposition.
- Fixes at landing: 5. Proof 1 and Behaviour 1: `agents/reviews/1-report.md` states the requests of check-urls before and after, and that Semantic Scholar is asked when Crossref and OpenAlex answered not found or were left out. Standards 1: `lookup.py:524` reads `# Integrity records and BibTeX.`. Standards 2: the unused `except lookup.UsageError` branch of the test's `check_urls` removed. Standards 3: the test's head comment and `PASS:` line name the `.bib` read from the command line.
- Verification on main: `env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/land.sh .scratch/5-paper/orchestrator-state.md 5-paper-1 b2b39ec` printed `PASS: strip_comments.py scratch tests`, `PASS: land.sh scratch tests`, `PASS: check_config.py scratch tests`, the `PASS: anchorize_tex.py leaves the .tex byte-identical, ...`, `PASS: apply_tex_patch.py replaces, inserts after and deletes only ...` and `PASS: lookup.py parses recorded bodies, ...` lines, `PASS: sync_rules.py scratch tests`, `ok: the plan-terms block equals the template`, `PASS: pin.sh scratch tests`, nothing for the character-set check, and `checks: 10 commands passed`; after the fixes at landing, `checks.sh` on main printed the same lines, the lookup test's ending "reports an input file that does not exist, reads the .bib named on the command line in check-urls and quote-check, and refuses the one-argument check-urls and the two-argument quote-check", and `checks: 10 commands passed`, exit 0.
- A/B: none. Look: none configured.
- Usage: brief check a68298ac67b2eca9f claude-opus-5-5 254482 tokens, 50 tool uses, 12.4 minutes; builder a6c963d98dcec2c04 claude-sonnet-5-5 306880 tokens, 65 tool uses, 17.7 minutes (build) and 357037 tokens, 20 tool uses, 3.6 minutes (round 1); reviewer a8f3bf8ec5b9a9df5 claude-opus-5-5 300438 tokens, 58 tool uses, 14.5 minutes; reviewer over round 1 a2421c20d030e1072 claude-sonnet-5-5 195943 tokens, 40 tool uses, 6.2 minutes.
- The builder's first report did not pass its bar: five test checks pinned error wording against the rules file's test rule, the report did not state the added requests of check-urls, and `quote-check` called the integrity record "the report".

## Next

`/spec 5 2`, the skill: `skills/paper/SKILL.md` 1.0.0 with its modes, checked by the records of the 43 `rebuild: paper` rows.

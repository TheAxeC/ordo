# Landing report: plan 2.F, step 2a

Roadmap entry 2.F, a `diagnose` skill. Plan step 2a of 7 (1, 2, 2a, 2b, 3, 4, 5), the person-driven red command's script, landed and ticked. Next: step 2b, `/diagnose <entry> <step> premise`, after step 3a of plan 2.H lands.

## Open items

none

## The landing

- Agents stopped before the landing: `ListAgents` showed the round's reviewer completed and no other agent of the step running.
- NOT DONE: nothing inside the step.

- Landed: `skills/diagnose/templates/person-driven.sh` (109 lines), which shows the user each action of an actions file, reads one line of observation after each and appends the pair to an observations file, refusing with exit 64 an actions file it cannot read or that holds no action and an observations file that exists, has an empty path or stands in a folder that is missing or not writable, and ending with exit 1 when the input ends early or an append fails; its test `person-driven.test.sh` (346 lines, cases C1 to C14); `skills/diagnose/references/person-driven.md`, which says how a session uses the script; `skills/diagnose/SKILL.md` lines 198 and 208 pointing at that file; six lines in `templates/diagnosis.md`; the test's line in `docs/dev/building.md` and in the change standard's command block.
- Ticked: the step's check holds on main. `sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1` prints `PASS: person-driven.sh scratch tests`; each case failed on the unchanged tree with `FAIL: person-driven.sh does not exist at <path>` (reproduced by the reviewer over round 1); the builder's seventeen mutations, one or more for each case, each fail the test, reproduced by that reviewer; the changed text was read in place by both reviewers.
- Premise corrections: at /spec, the brief check's 30 findings closed in the brief (`2a-brief-check.md`, Closed) and the choices it forced booked as the ruling "Step 2a, the script's shapes", which is Axel's to overrule.
- Review: `2a-refuter.md`, 9 findings (2 Proof, 5 Standards, 2 Behaviour); repair round 1 (`agents/briefs/2a-round-1.md`), seven points. The run over the round: 2 Standards findings, both fixed at landing.
- Fixes at landing: the reference file's bullet on who runs the script regrouped as the round's point 6 words it (the round's finding 1); the test's head comment says "or named by an empty path", since the empty path names the file and not a folder (finding 2); the reference file says how a single quote inside a path is written, `'\''` (the round's declined point; a run with a folder named `o'b` wrote its observations file and exited 0). 3 fixes.
- Read and left as they are: the five sentences of the reference file past 20 words with one main clause, each one rule with its condition; "the skill" in the Stops row of `SKILL.md` line 208, where the page names the skill as the actor in its other rows.
- The verify list of the four open plans' state files gains `sh skills/diagnose/templates/person-driven.test.sh 2>&1 | tail -1` after the `git_guard.test.sh` line, as `docs/dev/building.md` now lists it.
- Verification on main: `sh ~/.claude/skills/land/templates/land.sh .scratch/2-f-diagnose/orchestrator-state.md 2f-2a 22878c5dc5d1e2c11ebe1a3e86cf158663bcc76e` exited 0 with `7 files changed, 486 insertions(+), 2 deletions(-)` and `checks: 11 commands passed`; after the fixes at landing `checks.sh` printed `checks: 11 commands passed` again.
- A/B: none. Look: none, no view changes.
- Usage (models from the transcripts): brief check claude-opus-5-5 170502 tokens, 19 tool uses, 491 s, $0.92 to $3.78; builder claude-sonnet-5-5 161787 tokens, 37 tool uses, 519 s (round 0) and 209610 tokens, 12 tool uses, 250 s (round 1), $2.32 to $5.52 for both; reviewer claude-opus-5-5 173973 tokens, 26 tool uses, 556 s, $1.19 to $4.48; reviewer over round 1 claude-opus-5-5 165136 tokens, 25 tool uses, 401 s, $1.02 to $3.79.
- The builder's first report did not pass its bar: the review found two refusals with an untested half, an empty observations path accepted, case-name arguments in the test that no caller uses, and four sentences of the reference file against the standards. Fixes at landing: 3. Sonnet 5.5 measurement (ruling "Overnight work" 1): every finding is closed by the round or at landing, so `worker:` stays Sonnet.

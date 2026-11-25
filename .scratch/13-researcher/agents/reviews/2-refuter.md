# Refuter report: step 2

Usage: a1e8b7527ba8e54f0, claude-opus-5-5, 257452 tokens, 58 tool uses, 502 s.

## Verification lines

All commands were run from `/Users/axelfaes/workspace/ordo/.agents/worktrees/13-researcher-2`.

1. Character-set check over the 16 changed and new files outside `.scratch` (the list came from `git diff a0198cf --name-only` plus the `??` lines of `git status --short`). It printed nothing, then `V1 exit 0`.
2. `LC_ALL=C grep -n '[^ -~]' skills/academic/researcher/SKILL.md` printed nothing, then `V2 exit 1`.
3. Figure scripts, run on a copy of `docs/figures` under the scratchpad (`.../scratchpad/figrun/docs/figures`):
   - `gen_figures exit 0`, printing `wrote docs/figures/researcher.svg (33149 bytes)`, `wrote docs/figures/paper/lifecycle.svg (21064 bytes)`, `wrote docs/figures/paper/run-folder.svg (21112 bytes)`.
   - `wrote docs/figures/academic-pipeline/academic-pipeline.svg (22636 bytes)`, then `pipeline exit 0`.
   - `diff -r` of the scratch copy against the worktree's `docs/figures` printed only `Binary files .../__pycache__/gen_figures.cpython-313.pyc ... differ`, so every SVG is byte-identical to the worktree.
   - `git status --short` lists only paths of "Paths this step writes" plus `.scratch/13-researcher/agents/reviews/2-report.md`: `M README.md`, `M docs/dev/building.md`, `M docs/dev/scripts.md`, `M docs/figures/academic-pipeline/academic-pipeline.svg`, `M docs/figures/academic-pipeline/gen_academic_pipeline.py`, `M docs/figures/gen_figures.py`, `M docs/roadmap.md`, `M skills/academic/paper/SKILL.md`, the six copied pages, `?? docs/figures/researcher.svg`, `?? skills/academic/researcher/SKILL.md`.
4. Description lengths: `994 skills/academic/paper/SKILL.md` and `1010 skills/academic/researcher/SKILL.md`. The frontmatter case printed `researcher 1010 {'version': '1.0.0'}`.
5. Case greps:
   - The exclusion grep printed nothing, then `exclusion exit 1`.
   - `grep -n researcher README.md` hits lines 34, 38, 78, 88 and 168.
   - `grep -n 'twenty-three' README.md` printed nothing, then `tt exit 1`.
   - The path loop over `SKILL.md` printed `MISSING agents/citation_compliance_agent.md` and `MISSING templates/lookup.py`. Both are named in `SKILL.md` as files of the `paper` skill, and both exist there (`citation_compliance_agent.md:485` "### Looking a reference up"; `lookup.py:279` COMMANDS includes "quote-check").
   - A per-page `grep -c -F` found every one of the 27 pages named 1 or more times in `SKILL.md`.
   - `grep -rn 'SKILL.md' skills/academic/researcher --include='*.md'` gives the hits the report lists.

## Verdicts

Items of "What to build":
1. SKILL.md layout and frontmatter: holds.
2. What the two modes do: violated. See Spec 1 to 5.
3. Stops: violated. Two stops have no row: a PASS WITH NOTES at Stage 4.5 (Spec 3) and the external-review strategic coaching question (Spec 6).
4. Anti-patterns and Rules: holds.
5. Copied pages that point into SKILL.md: holds for the lines changed. The contradictions left are under Hand-backs.
6. README: holds.
7. researcher.svg: holds.
8. academic-pipeline figure and roadmap line 29: holds.
9. building.md and scripts.md: holds.
10. paper SKILL.md row and version: holds.
11. Deviations and map: holds.

Cases:
- yaml check: met.
- `##` headings: met.
- Quick start block: met.
- `/researcher integrity <main.tex>`: met.
- `/researcher integrity pre-review <main.tex>`: met.
- `/researcher manuscript <project folder>`: partial. The stage order and the runs are met, but item 7's score deltas and the transitions' passport check rest on inputs no run produces (Spec 1, Spec 2).
- `/researcher manuscript <main.tex>`: met.
- `/researcher manuscript <main.tex> <comments file>`: partial. Stage 2.5 then Stage 4 is met; what Stage 3' runs after it is undefined (Spec 4).
- Compliance agent and failure-mode checklist: partial. The compliance agent's passport input is never produced (Spec 1); the checklist's confirm path contradicts its page (Standards 2).
- Stage 3 and Stage 3' decisions and the cap: met.
- FAIL of `integrity` alone: met.
- FAIL at the final check: met. A PASS WITH NOTES at Stage 4.5 is a separate gap (Spec 3).
- No record of the experiments: met.
- Exclusion grep: met.
- Named paths exist, and all 27 pages are named: met.
- SKILL.md pointers: met.
- ADR 0052 point by point: met.
- gen_figures.py: met.
- gen_academic_pipeline.py: met.
- README grep: met.
- twenty-three: met.

## Spec

1. **The Material Passport is read, checked and appended to, but no step and no skill writes it.**
   - Place: `SKILL.md`, which quotes it in four places:
     - line 118: "Pass on the stage's declared inputs and the Material Passport only".
     - line 190: "Give it the input contract of that page, with ... the Material Passport".
     - line 191: "append it to `compliance_history[]` of the Material Passport".
     - line 303: "Every artifact of a run carries its version label and its Material Passport".
   - The pages it points at need one too:
     - `agents/pipeline_orchestrator_agent.md:244-245`: "Verify Material Passport (Schema 9) is attached with current version label / If validation fails -> return HANDOFF_INCOMPLETE". Transition item 2 tells the session to follow this check.
     - `agents/compliance_agent.md`, Input contract: "material_passport: <Schema 9 payload>".
     - `references/compliance_checkpoint_protocol.md`, Override Ladder: the round count is "stored in `compliance_history[].user_override` entries".
   - What is wrong:
     - No step of `SKILL.md` creates a passport.
     - The run-folder list in Rules (line 305) names no passport file.
     - `grep -rln -i 'material passport\|material_passport' skills/academic/paper skills/academic/paper-review-panel` prints nothing, so neither `paper` nor `paper-review-panel` writes one.
     - The override's `disclosure_addendum` is generated "by the agent" (compliance protocol), but `SKILL.md` starts no compliance agent after an override. The Stops row "The compliance block" sends an addendum that nothing has written.
   - Failure scenario:
     - At the first transition, a session following transition item 2 finds no passport on `paper`'s output and returns HANDOFF_INCOMPLETE, with no count and no stop.
     - Or the session invents a passport in an unnamed place.
     - The compliance agent, given no passport, marks `[MATERIAL GAP]`, and its items auto-FAIL. In SR mode that is a Mandatory block on every run.
     - After an override, the override ladder has no history to count on and no addendum to send.

2. **The early-stopping criterion and the regression stop rest on Stage 3' scores that no run writes.**
   - Place: `SKILL.md:159-161`: "Compute the score deltas ... from the scores of Stage 3 and Stage 3', and write them to `state.json`. / A delta below -3 on any dimension is the stop ... / An overall delta below 3 points ... is the stop "The early-stopping suggestion"."
   - What is wrong:
     - `references/score_trajectory_protocol.md:24` says "The editorial synthesizer produces new dimension scores" at Stage 3'.
     - The `paper-review-panel` skill's `references/re_review_mode_protocol.md`, "Re-Review Output Format", has the sections Decision, Revision Response Checklist, New Issues, Decision Rationale, Residual Issues and Sprint contract status. It has no scores: `grep -n -i 'score\|dimension\|0-100'` on that file prints nothing.
     - Only full mode's `templates/peer_review_report_template.md` holds 0-100 scores.
   - Failure scenario: at Stage 3' the session has no second set of scores. Either it makes the scores up, which writes a fabricated value into `state.json` and gates a stop on it, or the early-stopping criterion and the regression stop never fire. Those are two kept parts the brief requires (item 2, "the revision loop with its early-stopping criterion").

3. **A PASS WITH NOTES at Stage 4.5 has no branch.**
   - Place:
     - `SKILL.md:170` (manuscript item 9): "Done when the check ends with PASS and zero issues, or the user has decided at the stop "The third correction round failed"."
     - `SKILL.md:209`: correction rounds run only "on a FAIL".
     - Stops row "The checkpoint after Stage 4.5" (line 258): "When: The final integrity check passed with zero issues".
   - What is wrong: the integrity agent's Verdict Criteria give PASS WITH NOTES for MINOR issues. At Stage 4.5 that verdict is neither done, nor a FAIL that starts a correction round, nor any stop.
   - Failure scenario: a final check with one MINOR note, which is a common outcome, leaves the run stuck at item 9. Or the session picks a branch itself: it ends the run against "PASS with zero issues", or it runs a correction round no step allows.

4. **The comments-file entry has no defined Stage 3'.**
   - Place:
     - `SKILL.md:155`: "Invoke `/paper-review-panel re-review '<main.tex>' '<revision roadmap>' '<response to reviewers>'`".
     - line 158: "With review comments in hand, the re-review makes the comparison of ... "Step 4" ... with no new Editorial Decision and no new revision request".
     - line 162: "Done when the re-review report stands and the decision goes on as the stop "The re-review decision" says: Accept or Minor to Stage 4.5, Major to Stage 4'."
   - What is wrong:
     - A run entered with `<comments file>` has no Revision Roadmap of Stage 3, so the `<revision roadmap>` argument is undefined.
     - `/paper-review-panel re-review` always writes a Decision (its output format starts with "## Decision"). `SKILL.md` cannot make another skill's run omit it, and line 158 contradicts its own done criterion on line 162.
     - The structured comments of item 6 bullet 4 are given "as its comments file", but no file name or place is written for them, and Rules line 305 does not list one.
   - Failure scenario: the third Quick start line runs Stage 2.5 and Stage 4. At Stage 3' the session has no roadmap path to pass, and it gets a Decision it was told not to produce. Then it must choose a branch the text forbids.

5. **The CONDITIONAL ethics verdict is dropped.**
   - Place: `SKILL.md:200` handles only "An ethics verdict of BLOCKED". `references/ethics.md`, "Verdict and stop", says: "CONDITIONAL ... The issue names the exact fix and goes to `/paper revision` with the issue list as its comments, or to the final message when the fix needs a fact only the user has", and "Human or patient data with no approval stated is CONDITIONAL, and it must be addressed before delivery."
   - What is wrong: no item of "The integrity check" sends a CONDITIONAL issue to `/paper revision` or into the final message unless the integrity verdict is also FAIL.
   - Failure scenario: a paper with human-subject data and no approval statement passes Phases A to E and gets CONDITIONAL in Phase F. The run delivers it unaddressed, against the rule of the page `SKILL.md` names.

6. **The external-review strategic coaching question is a stop with no row in Stops.**
   - Place: `SKILL.md:149`: "Hold the strategic coaching of "Step 2: Strategic Revision Coaching (External Revision Coaching)", within its 8 rounds, unless the user says "just fix it"."
   - What is wrong: the session holds this dialogue itself (it is not a stop of `paper-review-panel`), and each round waits for the user. Brief item 3 asks for one row per stop of the two modes. The `paper-review-panel` skill gives the equivalent dialogue the row "The coaching question".
   - Failure scenario: a reader of Stops does not see that the comments-file entry waits for the user up to 8 times, or what resumes it.

## Proof

none. The rerun reproduced every count and output the report quotes that a decision rests on: 1010 characters, `V1 exit 0`, the bytes of both figures, the exclusion grep's empty output, and the 27 pages named.

## Standards

1. **A contradiction between `SKILL.md` and a page it tells the reader to follow is left in force and reported as a judgment call.** `docs/dev/change-standard.md` rule 19 asks for such a statement to be changed or reported as a stop, and rule 4 says the report never decides it as a judgment call.
   - Place: `SKILL.md:221`: "After 4 or more consecutive "continue" answers, the checkpoint is FULL whatever the stage". `agents/pipeline_orchestrator_agent.md:100`: "`consecutive_continue_count >= 4`: SLIM + awareness prompt". `SKILL.md:213` tells the session to hold checkpoints as that page gives "its user engagement tracking".
   - What is wrong: the builder's report names this under "Judgment calls" ("This disagreement is in the source between its two files and touches no ruling").
   - Failure scenario: at the fourth "continue", the session has two instructions for the checkpoint type and picks one.

2. **The failure-mode block's confirm path differs from the page that defines it.** Same rules (19 and 4).
   - Place: `SKILL.md:261`: "The user confirms the flag and the passage is fixed by `/paper revision`". `references/ai_research_failure_modes.md:138`: "Confirm the flag: return to Stage 2 WRITE (or earlier) to fix".
   - What is wrong: the two disagree. Neither `SKILL.md` nor the page says whether the check runs again after the fix on the confirm path.
   - The same pattern recurs at the compliance block. Option (a) of `references/compliance_checkpoint_protocol.md`, "On block", is "backfill: return to Stage 2", which `/researcher integrity` (no Stage 2) cannot do, and `SKILL.md:262` lists the choice without saying what it does there.
   - Failure scenario: a session following the page reruns Stage 2 (`/paper full`) on a confirmed flag, which rewrites the draft. A session following `SKILL.md` runs `/paper revision`. In `integrity` mode, choice (a) has no stage to return to.

## Behaviour

none. The report states each visible change with its before and after, and each one matches the diff.

## Hand-backs

1. `agents/integrity_verification_agent.md:500` ("Issues found: produce correction list, send it to `/paper revision`..."): a real contradiction. It conflicts with the agent's own "Correction Process on FAIL" step 2, which was changed ("Hand the correction list to the session"), and with `SKILL.md`, "The integrity check" 5 and Rules line 290 (D5). An agent following Mode 1 could invoke `/paper revision` itself.
2. `references/compliance_checkpoint_protocol.md:94` ("the orchestrator **auto-injects** it into the manuscript's AI disclosure section"): a real contradiction with `SKILL.md:262` ("the `disclosure_addendum` goes to `/paper revision` as its comment"), with Rules line 290 and with brief decision 6. It is also tied to Spec 1, since no step produces the addendum.
3. `agents/pipeline_orchestrator_agent.md:67` ("You can adjust any stage's mode at any time."): a real contradiction. `SKILL.md:87` tells the session to show the configuration in this block's form, so the session tells the user something the Mode Switching row at line 216 (PROHIBITED) and D5 refuse.
4. `examples/mid_entry_example.md`, Stage 3 in quick mode: a real contradiction with D5 and `SKILL.md:142`. The line list is incomplete:
   - Lines 203, 261 and 274-279 run Stage 3' as "full mode" ("Invoking /paper-review-panel full through the Skill tool"), where D5 gives `/paper-review-panel re-review`.
   - Lines 336-372 run an extra `/paper revision` after a Minor at Stage 3' before Stage 4.5 ("These are all minor changes that can be handled in one /paper revision run, followed directly by Stage 4.5"). `SKILL.md:295` forbids this: "The revision loop holds Stage 4 and Stage 4', one `/paper revision` run each, and no further revision run."
5. `examples/full_pipeline_example.md`, line 33 ("recommend guided mode") and lines 50-70 (line 53 "invoking /paper plan through the Skill tool"): a real contradiction with D5. It is also incomplete: lines 307-330 run the same extra `/paper revision` after a Minor at Stage 3' ("The 2 minor changes will be handled in one /paper revision run before the final check"), against `SKILL.md:295`. `SKILL.md:53` names both examples as worked runs the session reads before its first stage (manuscript item 1), so a session copies the extra revision run.

## Declined to judge

- Whether the runner lets the session resume a finished integrity agent ("Resume the integrity agent", `SKILL.md:206`), for example through SendMessage. Only a run of the installed skill would settle it.
- Whether a correction-round `/paper revision`, given an integrity corrections file (neither referee comments nor a `/writing` report), writes a `response-letter.md` beside the manuscript that replaces the Stage 4 letter Stage 3' reads. That depends on how `paper` classifies the comments file at run time, and a run of `/paper revision` on such a file would settle it.
- Whether the five hand-backs and the contradictions in Standards 1 and 2 were already in the source pages. Only a file-by-file `diff` against `/Users/axelfaes/workspace/research-hub/.agents/skills/academic-pipeline/` would settle this, and it does not change the findings.

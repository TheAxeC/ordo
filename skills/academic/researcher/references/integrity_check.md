# The integrity check

The modes `integrity` and `manuscript` of `researcher` run this check at the items of `SKILL.md` that name this page, and `novelty` and `idea` do not read it. "What it reads" with a number, Rules and a stop named in quotes, such as "The failure-mode block", are those of `SKILL.md`, and "item" with a number is an item of this page.

Stage 2.5 and Stage 4.5 of `manuscript`, and each run of `integrity`, run this check. `<stage>` is `2.5` or `4.5`, and `<n>` is the check's number at that stage: 1 for the first check, one more for each correction round.

1. Start the integrity agent as a fresh agent through the Agent tool, on the runner's general-purpose agent with the runner's defaults.
   - Give it `agents/integrity_verification_agent.md`, its mode (Mode 1 at Stage 2.5, Mode 2 at Stage 4.5), the manuscript of "What it reads" 2, `experiment-record.yaml`, the path of `material-passport.yaml`, the path of `lookup.py` and the pages of "What it reads" 11.
   - At Stage 4.5, also give it the records of Stage 2.5, which it compares as a supplementary check only.
   - Ask it to run the AI Research Failure Mode Checklist of `references/ai_research_failure_modes.md` at its stage, as that page's "How the checklist runs at each stage" says, and to write each of the 7 modes with its outcome (CLEAR, SUSPECTED or INSUFFICIENT EVIDENCE) and its evidence in its record.
   - It runs every phase of its page at its depth, Phase A to Phase E, then the ethics check of `references/ethics.md` as Phase F, the last part of its record.
   - Write its record, which it returns as its final message, to `integrity-<stage>-<n>.md` in the run folder.
   - Done when `integrity-<stage>-<n>.md` stands with its verdict, its ethics check and the outcome of each failure mode.
2. Start the compliance agent after it, through the Agent tool, as `agents/compliance_agent.md`, "Invocation protocol", says.
   - Give it the input contract of that page, with `stage` set to `<stage>`, the `compliance_mode` the manuscript's design gives, the manuscript, the path of `material-passport.yaml`, the answers of the stop "The run's configuration" and the pages of "What it reads" 12.
   - Write its `compliance_report`, which it returns as its final message, to `compliance-<stage>-<n>.md` in the run folder, and append it to `compliance_history[]` of `material-passport.yaml`.
   - Done when `compliance-<stage>-<n>.md` stands with its `block_decision` and `material-passport.yaml` holds the entry.
3. Record the check in `state.json`: `update_integrity` with the verdict, and one entry of `integrity_history`, as `agents/state_tracker_agent.md` gives them.
   - A check that passed sets `verification_status: VERIFIED` and `integrity_pass_date` in `material-passport.yaml`.
   - Done when `state.json` holds the entry.
4. Read the three decisions together, as `references/compliance_checkpoint_protocol.md`, "Decision precedence", gives: the integrity verdict, the failure-mode checklist and the compliance decision.
   - A SUSPECTED mode, or Mode 1, 3, 5 or 6 with INSUFFICIENT EVIDENCE, is the stop "The failure-mode block".
   - At Stage 4.5, a mode SUSPECTED at Stage 2.5 and still SUSPECTED blocks again, and no correction round skips it.
   - A `block_decision` of `block` is the stop "The compliance block".
   - A compliance `warn` is shown in the checkpoint's dashboard, and an `info` as a bullet of it.
   - An ethics verdict of BLOCKED is the stop "A BLOCKED ethics verdict", raised only for an issue `references/ethics.md`, "Verdict and stop", lets block.
   - An ethics verdict of CONDITIONAL is the stop "A CONDITIONAL ethics verdict".
   - A verdict of FAIL is the stop "A FAIL of an integrity check".
   - At Stage 4.5 of `manuscript`, a verdict of PASS WITH NOTES is the same stop, with its notes as the list, since the final check passes only with zero issues.
   - In a run of `integrity`, a PASS WITH NOTES ends the check, and its notes are shown with the result.
   - Each stop of this item, and the stop "The third correction round failed" of item 6, is held as a checkpoint, as `references/checkpoints.md` gives it.
   - Done when each stop raised has its answer, or the check passed with none.
5. Carry out the user's answer at a stop of item 4.
   - At "The failure-mode block", a confirmed flag goes to `/paper revision` with the flagged modes and their evidence as its comments, in a file `failure-modes-<stage>-<n>.md` of the run folder, and the check runs again as a correction round (item 6).
   - At "The compliance block", choice (a) backfill takes the missing material from the user, which reaches the manuscript through `/paper revision` with the material as its comments, in a file `backfill-<stage>-<n>.md` of the run folder, and the compliance agent runs again (item 2).
   - Choice (b), manual handling, waits for the user's own edit of the manuscript, and the compliance agent runs again (item 2).
   - Choice (c), the override, starts the compliance agent again with the override and its rationale, as the Override Ladder of `references/compliance_checkpoint_protocol.md` gives it.
   - That agent returns its report with the `user_override` and the `disclosure_addendum`: write the report to `compliance-<stage>-<n>-override.md`, append it to `compliance_history[]` of `material-passport.yaml`, and write the addendum to `disclosure-addendum-<stage>-<n>.md` in the run folder.
   - Invoke `/paper revision '<main.tex>' '<run folder>/disclosure-addendum-<stage>-<n>.md'` through the Skill tool, with its own stops, so that the addendum reaches the manuscript's AI disclosure section.
   - At "A CONDITIONAL ethics verdict", each issue with its exact fix goes to `/paper revision` with the issue list as its comments, in a correction round of item 6, counted with the others.
   - A CONDITIONAL issue whose fix needs a fact only the user has is named in the final message of the run, and the run addresses it before it ends.
   - Done when each answer is carried out.
6. Run a correction round on a FAIL the user sends on.
   - Write the issue list of the record, sorted by severity with its `IL-` IDs and `EA-` IDs, to `corrections-<stage>-<n>.md` in the run folder, in the wording of Rules.
   - Invoke `/paper revision '<main.tex>' '<run folder>/corrections-<stage>-<n>.md'` through the Skill tool, with its own stops.
   - Resume the integrity agent with the corrected draft, which re-verifies the corrected items as its page's "Correction Process on FAIL" says.
   - Write its record to `integrity-<stage>-<n>.md`, with `<n>` one more than the check before, and run items 2 to 5 again.
   - At most 3 correction rounds run at a stage. A check that has not passed after the third is the stop "The third correction round failed".
   - Done when the check ends with PASS or PASS WITH NOTES in a run of `integrity` and at Stage 2.5 of `manuscript`, with PASS and zero issues at Stage 4.5 of `manuscript`, or the user has decided at that stop.

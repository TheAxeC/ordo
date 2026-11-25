# Step 1, repair round 1

The findings are those of `.scratch/13-researcher/agents/reviews/1-refuter.md`, copied beside this file in your worktree. Each ruling says what to change under `skills/academic/researcher/`. The step's paths and rules stay as the brief gives them: a copy is a copy, and nothing no ruling names is changed. No text is dictated: you word each sentence.

1. Spec 1, ruling D17. The ethics check, Phase F of `agents/integrity_verification_agent.md`, runs at both depths: in the check before the review and in the final check. Each record ends with its ethics check. Every page that states what a depth runs says so.
2. Spec 2 and hand-back H1, Open item C of `plan.md`. `examples/full_pipeline_example.md` gains a Stage 2.5 scene between Stage 2 and Stage 3, and keeps a Stage 4.5 scene at its end, both in the form `examples/mid_entry_example.md` has them. Its configuration block, progress bars, transitions and deliverables agree with those two scenes. A deliverable left from the removed format conversion is removed.
3. Spec 3. The final check of `examples/mid_entry_example.md` runs Phase A to F, and its record and deliverables have the ethics part. After ruling 1 its check before the review has it too.
4. Spec 4, ruling D20. The REV-007 example of `references/handoff_schemas.md` is replaced by an example of a resolved must-fix item of another kind, made up, that shows the same fields of the schema and puts no null result into a manuscript.
5. Spec 5. The two rules on `data_access_level` and `task_type` in `references/handoff_schemas.md` keep the source's subject: the skill's `SKILL.md` declares them under `metadata`. The two sections agree within themselves.
6. Spec 6. The state structure of `agents/state_tracker_agent.md` keeps the field `pipeline_version`, its value read from `metadata.version` of `SKILL.md`, as `references/artifact_reproducibility_pattern.md` does for its version field.
7. Spec 7. In `references/mode_advisor.md`, each of the rows "Graduate student (first paper)", "Conference paper", "Thesis chapter", "Policy brief" and "Just give me a quick paper" is put back with the part that does not need the research stage: the paper type and its `paper` mode. Check the other rows removed from that page the same way, and put back each one that holds such a part.
8. Spec 8. The Stage 2.5 FAIL row of the orchestrator page's fallback matrix keeps the rule that a correction is never a full re-draft. Only the half of the source's clause that names the left-out gate is removed.
9. Spec 9. The row relabelled "Stage 4 / 4': revision" is the correction round after a failed final check, as the source's row order shows. It is labelled as that correction round, so a must-fix item of the final check the author cannot address has its escalation.
10. Behaviour 1 and hand-back H2, Open item C of `plan.md`. The integrity agent picks the claims of its check against the record of the experiments by reading the manuscript: each sentence that reports an outcome of the author's own experiments is a claim of the check, and is matched to the entry of the record it reports. The field `planned_experiment_ids` and the marker `<!--ref:slug-->` are named nowhere in the copy. Each of the source's checks on such a claim is kept on the claims so picked, the verdict on a claim that contradicts an entry of the record's negative results among them. `references/handoff_schemas.md` says the same.
11. Proof 1. The report's "Deviations" section names every difference of the copy as it stands after this round: the two scenes of the full example, the replaced REV-007 example and the claim selection of ruling 10 each have their row with Open item C or D20 as its ruling, and the per-file lists are corrected.

Cases, by reading the pages after the round:

- Each page that states what the check before the review runs: the ethics check is its last part.
- `examples/full_pipeline_example.md`: Stage 2, Stage 2.5, Stage 3, then to a Stage 4.5 scene, with no step the state machine forbids.
- `grep -rn 'planned_experiment_ids\|ref:slug' skills/academic/researcher`: no hit.
- A manuscript sentence that states an effect the record lists as a null result: the integrity agent's text leads to FAIL at both depths.
- `grep -rn -i 'null result' skills/academic/researcher/references/handoff_schemas.md`: no hit in an example.
- Every case and every check of the brief still gives its expected result.

Run the checks of the brief's "Verify before you report" again. Rewrite your report at the same path as the end state of the whole step, its first line saying what is not done or that everything is done.

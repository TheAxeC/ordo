# Gate: differences from academic-pipeline

Two differences have no ruling in the plan's Rulings or in `deviations.md`. Both are listed at the end. Every other hunk is covered by a line of `deviations.md` (kinds K1 to K25, the step 2 table and its later sections), by a line of Rulings, or belongs to a mode this repository wrote itself.

Commands, all run from /Users/axelfaes/workspace/ordo, with output saved under the scratchpad folder `gate/`:
- `diff -r skills/academic/researcher /Users/axelfaes/workspace/research-hub/.agents/skills/academic-pipeline`: 5133 lines, 588 hunks.
- `diff` of each of the six taken documents against its saved copy in `.agents/sources/academic-research-skills-v3.13.0/shared/` (a folder git ignores): compliance_agent 18 hunks, compliance_checkpoint_protocol 16, handoff_schemas 76, raise_framework 33, prisma_trAIce_protocol 45, artifact_reproducibility_pattern 25.
- `diff` of `references/ethics.md` against `git show f9a00ab:skills/paper/references/ethics.md`, the page D17 names: 9 hunks.
- Many changed lines are longer than the terminal shows. For those I ran a small difflib script over each changed line pair to print the edits past column 240.

Abbreviations below: Kn is a kind row of the table in `deviations.md`. "S2 table" is that file's section "Added at the landing of step 2", with its heading map and its "Added in repair round 1 of step 2" table. OI is an Open item in the plan's Rulings.

## Files only in the source
- `agents/claim_ref_alignment_audit_agent.md`, `references/claim_audit_calibration_protocol.md`: the claim audit is left out (D16, K19).
- `agents/collaboration_depth_agent.md`: the collaboration observer is left out (D16, K19).
- `references/process_summary_protocol.md`: Stage 6 is left out (D16, ADR 0052, K19).
- `references/adapters/` (overview.md, .gitkeep), `references/literature_corpus_consumers.md`, `references/passport_as_reset_boundary.md`, `references/changelog.md`: OI A (K20; the changelog is also K4).

## Files only in the copy
- `agents/compliance_agent.md` and `references/` handoff_schemas, compliance_checkpoint_protocol, raise_framework, prisma_trAIce_protocol, artifact_reproducibility_pattern: the six taken documents (D16), placed where OI B puts them. They are compared against their saved copies below.
- `references/ethics.md`: D17, compared against its copy of reference below.
- `references/integrity_check.md`, `references/checkpoints.md`: sections of `SKILL.md` moved out word for word ("Added at the landing of step 3").
- This repository's own pages, not compared line by line: `references/novelty_page.md` (ADR 0054); `references/research_stages.md`, `references/research_brief.md`, `references/project_layout.md`, `references/slurm.md`, `agents/research_builder_agent.md`, `agents/research_reviewer_agent.md` (ADR 0053, with the revision campaigns of ADR 0055).

## SKILL.md (48 hunks; the file is rewritten into the layout's sections, so the hunks pair unrelated runs of lines)
- Lines 2-5, frontmatter (name, description, version, the keys removed): K5 and the first row of the S2 table (skill layout). `data_access_level` and `task_type` are stated in handoff_schemas.
- Lines 8-10, title and paragraph: S2 table row 2 (no history), scoped as "Added at the landing of step 3".
- Lines 12-27, Quick start: OI D, G, H, I and D36; S2 table row 3. The `novelty`, `idea`, `research`, `research adopt`, `full` and `revision` lines are this repository's own.
- Lines 29-45, Use instead: S2 table row 4.
- Lines 47-74, What it reads: S2 table rows "Agent File References..." and "Integration with Other Skills". Items 1-15 for the copied modes are covered by D1 (item 8), D6, D31, OI D and OI I. Items 16-24 and the `revision` sub-bullets of item 3 are the own modes.
- Lines 76-135, Steps 1-6: S2 table rows on Step 1 detection, the mid-entry exception, the run's state, `material-passport.yaml` (round 1 ruling 1), the record of the experiments (D31) and the configuration and budget (D5, D16). The `revision` bullets are covered by D36-D42. `manuscript_folder` is in "Added at the landing of step 4".
- Lines 137-424, `### novelty`, `### idea`, `### research`, `### research adopt`, `### full`: own modes (ADR 0053, 0054). The source runs they replace map by the S2 heading map.
- Lines 426-526, `### integrity` and `### manuscript`: D2, D3, D4 and D5 (the four runs), D6, D31, OI E and OI F (scores and deltas), round 1 ruling 4 (the completeness check), round 1 ruling 12 (the minor-items run), OI I and D28 (`--manuscript`, `## Papers`). The reinforcement template is in ASCII (S2 table, prose standard). Two exceptions, item 12's PASS WITH NOTES bullet (line 518) and the Stops row at line 631, are in the no-ruling list.
- Lines 528-606, `### revision`: own mode (ADR 0055, D36-D42).
- Lines 608-672, Stops: the S2 heading map rows "Error Recovery" and "Revision Loop Management", round 1 rulings 2, 4, 5, 6 and 8, D3, D17, OI E, and the refusals of OI D and OI I. The own-mode rows are covered by steps 3, 4 and 8. The exception is line 631, in the no-ruling list.
- Lines 674-704, Anti-patterns: S2 heading map row "Anti-Patterns" (the source's row 7 left out, row 8 added for D5). The own-mode rows are covered by steps 3, 4 and 8.
- Lines 706-747, Rules: D5, D6, D20, D24, D1 with D14 and D21, the revision cap and the cap on Stage 4', and the S2 rows on Reproducibility, Output Language and Reference Files (the team bullet). The own-mode bullets are covered by steps 3, 4 and 8. The exception is the bullet at line 744, in the no-ruling list.
- The source sections removed by the paired hunks (Pipeline Stages, State Machine, Adaptive Checkpoint System, Agent Team, Orchestrator Workflow, the Invocation Contract, Stage 6, the Collaboration Depth Observer, Quality Standards, Error Recovery, Agent File References, Version Info, Changelog): each row of the S2 heading map, with D16 and OI A.

## agents/integrity_verification_agent.md (87 hunks)
- Name, title, punctuation, the x sign and dashes throughout: K1, K2, K5.
- Lines 14-15, 20-23, 33-37, 78-127, 173, 448-451, 639-660: lookups through `lookup.py` (K8; D1, D14, ADR 0024). The retraction line at 116 is the "A2's retraction line" entry of the file list.
- Source lines 70-81 ("Differences from ethics_review_agent") removed: K7.
- Lines 191-276, C3: the "#261" and "#213" references removed (K4); the pointer to the visualization agent's page reworded (K6).
- Lines 279-375, C4: the claims picked by reading the manuscript (K23); the legacy boundary removed (K4); the record read from the project (K18, D31); the boundary wording says "researcher" (K5); the negative-results advisory dropped (K17, D20); row fields from `intended-claims.md` (K25); the formatter clause and the Stage-6 histogram removed (K7, K19).
- Lines 483-516, Phase F and the run lines of the two modes: K16 (D17), K10 (D2), K24, K11 (D3).
- Lines 531-569: prohibited-list markers in ASCII (K1); corrections go through `/paper revision` (K13, D5); 3 rounds and then the user decides (K11); "Wording of corrections and records" (K14, D24); the run-folder line (K15, D6).
- Lines 607-630: IDs no longer name `roadmap_item_ids` or "#89" (K4, K7); the section sign replaced (K1); "## Ethics check" added (K16).
- Source lines 661-680 and 690 (cross-model verification) removed: K19.

## agents/pipeline_orchestrator_agent.md (63 hunks)
- Lines 2-13, name, title, Role Definition and the D5 sentence: K4, K5, K13.
- Intent and mode tables, communication format (lines 25-67): Stage 1, Stage 5 and the resume rows removed (K19, K20); the mid-entry rule (K12, D4); the runs fixed (K13, D5; round 1 ruling 10 for line 67).
- Source lines 43-94 (Resume Mode), 175-225 and 274-287 (the reset boundary), 497-511 (lineage): K20.
- The observer step, the IRON RULE, the template blocks and source lines 371-483 (observer, 3.5 audit gate, 3.6 claim-audit gate, keeping the carry-forward paragraph at line 264): K19, K7, K18.
- Checkpoint table and rules (lines 78-108), separators in `=` (K1), the Stage 5 rows (K19), the ethics line at 180 (K16).
- Mode-switching table at 216: PROHIBITED for any other run (D5, K13). Fallback rows at 229-234: D3, D5 (as the file list describes).
- Handoff table and the Style Profile paragraph (lines 238-267): K19 (Stage 1 to "Research materials"), K6, K5. The Style Profile paragraph is the source's line 527, reworded for K5 and K19 (report_compiler and Step 10 removed).
- Lines 283-375, "Writing the run's state", coaching executor, integrity collaboration table: K15 (D6), K5, K13, K11.
- Source lines 688-973 (Cite-Time Provenance Finalizer, Patch Sequencing, Submission-Package gate) removed: K19, K20.
- Lines 420-431: K15, K1.

## agents/state_tracker_agent.md
- Names, title, the D6 paragraph, Write Access rows, the observer sections, the Stage 1 and 5 JSON blocks, `final_paper`, `collaboration_depth_history`, `pipeline_version`, "materials -> 2", the stage ids, the prerequisites, `append_observer_report`, the dashboard rows, "(added in v2.0)" removed: K1, K2, K4, K5, K6, K15, K19, as the file list gives them.
- Lines 202-206, `score_trajectory`: "Added at the landing of step 2" (OI E).
- Line 359, "Researcher Pipeline Status": K5.

## examples/full_pipeline_example.md
- Stage 1 removed and the materials in hand from the start (lines 16-72): K19, K21.
- The configuration as the four fixed runs, the intake's own stops, five reviewers with roles named by function and the Devil's Advocate, re-review mode with the Revision Roadmap passed: K13 (D5; round 1 ruling 11 of step 2). The file list names K13 but does not describe these lines one by one.
- Stage 2.5 scene and checkpoint, the progress bars, Stage 4.5 with the minor revision, the dashboard and the deliverables: K21 (OI C), K16, and round 1 ruling 12 for the minor-items run.
- Removed: the Stage 5 format question and deliverables, the slides and webpage lines: K19, K21.

## examples/integrity_failure_recovery.md
- Dashes, separators, check marks, "Loading the integrity agent": K1, K2, K5.
- Lines 79, 211, 218, 300-306: `lookup.py resolve` (K8).
- Lines 60, 138-143, 329: Phase F (K16, with the landing addition of step 1).
- Lines 190-205: corrections sent to `/paper revision` (K13).
- Lines 367-368: the Research and Finalization progress steps removed (K19).

## examples/mid_entry_example.md
- Lines 7-64: the entry at Stage 2.5 (K12, D4), Stages 1 and 5 removed (K19), the review-mode question removed and the user's request for a quick review gone (K13, D5).
- Lines 71-118: the Stage 2.5 PASS section (K12, K16).
- Lines 120-195: the quick EIC assessment replaced by `/paper-review-panel full`, with five reviewers, an Editorial Decision, coaching at the panel's stop and a MANDATORY checkpoint (K13, D5; round 1 ruling 11 of step 2). The source's "Update Configuration" block is removed (K13).
- Lines 203-287: `/paper revision` with the Revision Roadmap; the re-review as `/paper-review-panel re-review` with the R&R matrix in place of four reviewer reports (K13).
- Lines 304-408: one `/paper revision` run for the minor items, then Stage 4.5 in place of Stage 5 (round 1 ruling 12; K19, K16); the cover letter removed (K19); dashboard and title (K5).

## references/ai_research_failure_modes.md
- Status line, parent, Stage 6 use, taxonomy pointer, the ROADMAP line, the Stage 6 section, the `source_verification_agent` row, ARS renamed: K1, K4, K5, K7, K19.
- Line 44, detection through `lookup.py resolve`: K8.
- Lines 138-139: the confirm path goes through `/paper revision` (round 1 ruling 8 of step 2, in the S2 table); the override is recorded in the run's state (K15).
- Line 144, the added sentence "As for every failed final check, the correction rounds stop after 3...": D3 (K11). The file list for this page does not name K11.
- Lines 117 and 122: "Stage 1" reworded (K19).

## references/claim_verification_protocol.md
- Line 19: K8. Lines 38-39: K10.

## references/external_review_protocol.md
- Title (K4), dashes (K1), the `/paper revision` sentence (K13).

## references/integrity_review_protocol.md
- Title (K4); the mid-entry sentence (K12); the run alone (K10); the integrity agent named by role (K5); Phase F (K16); the correction path through `/paper revision` (K13); the end of the run in place of Stage 5 (K19); 3 rounds (K11); the pointer (K6).

## references/mode_advisor.md
- Every hunk: the deep-research rows removed, the skill names, the archetypes, the entry rows and the anti-pattern rows, as the file list describes (K2, K5, K12, K19).

## references/pipeline_state_machine.md
- Title and scope (K4, K5); the run-state line at 30 (K15); the diagram without Stages 1 and 5 (K19), with the 3-round note (K11) and the Minor note (*) (round 1 ruling 12); the runs line at 138 (K13).
- Transition rows 142-166: K12 (D4), K13, the completeness check (round 1 ruling 4), the Minor row (round 1 ruling 12), K11, K19. The exception is row 165, in the no-ruling list.
- Rows 172-208: K19, K15. Rows 216-241: K15, K2. Lines 247-272: K4 ("Rules of the cycle", "v2.0", "Differences from v1.0"), the Minor branch. The reset-boundary section: K20.

## references/plagiarism_detection_protocol.md
- Dashes, the section sign and arrows (K1, K2), the agent's name (K5), the run lines of the depths (K10).

## references/progress_dashboard_template.md, references/reinforcement_content.md, templates/pipeline_status_template.md
- Title "Researcher", the Stage 1, 5 and 6 rows, the observer row and the Stage 4.5 to 5 row removed, "(v3.4.0)" removed, the run-folder line, arrows: K1, K2, K4, K5, K15, K19.

## references/reproducibility_audit.md
- "v2.0" (K4); the dash (K1); `lookup.py` commands (K8); the audit trail in the run folder (K15); 7 stages with Stages 1, 5 and 6 removed (K19); the pointer to `references/artifact_reproducibility_pattern.md` (K6); lines 43-47 joined from hard wraps (K3; the file list for this page does not name K3).

## references/score_trajectory_protocol.md
- Status line and versions (K4); names by role (K5); pointers (K6, K7); Stage 6 reporting removed (K19); the regression recorded in the run's state (K15).
- Line 20, the baseline taken from the Editorial Decision's `dimension_scores`: OI F (S2 table, round 1 ruling 14). Line 24, the re-review scores in the Verification Review Report: OI E.

## references/team_collaboration_protocol.md
- The Stage 1 handoff and the Stage 1 and 5 lines removed, "Research materials" in place of Stage 1, Stage 4.5 to the end in place of Stage 5 (K19); `references/handoff_schemas.md` (K6); dashes and arrows (K1, K2); per-run state in the run folder (K15).

## references/two_stage_review_protocol.md
- Title (K4); the runs (K13); arrows (K2); pointers (K5); the Minor branch at line 22 ("Added at the landing of step 2", round 1 ruling 12).

## Taken document: agents/compliance_agent.md (against shared/agents/compliance_agent.md)
- Name, `version`, `owner_skill`, `invoked_by`, `related_skills`, `last_updated`: K4, K5.
- References list, the schema file removed, pointers: K6, K7. Arrows and dashes: K1, K2.
- Line 111, "a primary-research manuscript" in place of "`academic-paper full`": K5 and K7.
- The harness-retirement comment, the Stage 6 bullet, "(or standalone skill)" and the private CLAUDE.md clause: K4, K19, K7, as the file list gives them.

## Taken document: references/compliance_checkpoint_protocol.md
- `applies_to`, names, "(Task 8)", "v3.2", the section sign and the >= sign: K1, K4, K5, K6.
- Line 10 names `references/integrity_check.md` ("Added at the landing of step 3").
- Lines 55-58, backfill through `/paper revision`: round 1 ruling 8. Line 95, the override addendum through `/paper revision`: round 1 ruling 2 (S2 table).
- Line 93, the enforcement boundary without the legacy history; the harness comments, the Stage 6 clause and the non-pipeline Boundary section removed: as the file list gives them (K4, K7, K19).

## Taken document: references/handoff_schemas.md
- Title, wraps, dashes and arrows: K1, K2, K3.
- Producer and consumer lines of Schemas 1-8 and 10-12, and the section headers: K5, K19 (deep-research producers removed), K6.
- "(v3.3)", "#399", "#268" and the legacy normalization: K4.
- `change_block_ids` row and the style-calibration pointer: K19, K7.
- REV-007: K22 (D20). Schema 6 `dimension_scores` row at line 365: OI F (S2 table).
- Schema 9 rows: reset_boundary, literature_corpus, audit_artifact and slr_lineage removed (K20, K19); experiment rows (K18, K23, K4).
- Source lines 528-635 and 672-714 removed (Reset Boundary, Literature Corpus, Audit Artifact, Lineage, Claim-Faithfulness Aggregates): K20, K19.
- Experiment Provenance Intake (lines 521-559): K18, K23, K4 (`legacy_unknown`).
- Validation rule 11 (line 708): D4 (K12).
- `data_access_level` and `task_type` (lines 711-728): the first row of the S2 table and the file list.
- "v3.3.5 additions" removed: K4.

## Taken document: references/raise_framework.md
- Title "(snapshot)", "(Task 8)", ARS renamed "researcher", dashes, the <= and >= signs: K1, K4, K5.
- Line 41, the pointer (K6) and "(v3.3.5 feature)" (K4).
- Line 76, NOTICE.md in place of the CHANGELOG: file list. Role 3's self-declaration removed: K19.

## Taken document: references/prisma_trAIce_protocol.md
- Title, `update_policy`, "Used by" without the script and the Task numbers, the sync warning without the CI sentences, line 22: K4, K7.
- ARS renamed "researcher", the section sign written as "the manuscript's Methods section", >= signs, kappa, dashes: K1, K5.

## Taken document: references/artifact_reproducibility_pattern.md
- Hard wraps joined (K3); dashes and the x sign (K1); ARS renamed (K5).
- The lint and `check_repro_lock.py` sentences (K7); the `cross_model` block (K19); the passport-history line (K7).
- `ars_version` from `metadata.version` (file list).
- "Future evolution" v1.1 and v2.0 removed, the heading now "Limits that do not change" (K4).

## Ethics page: references/ethics.md (against paper's page at f9a00ab)
- Line 3 (both depths), line 10 (`/paper revision`), line 20 (run folder), lines 31 and 94 (disclosure_mode_protocol), line 35 (the agents' pages), line 59 (the responsible-use statement pointer removed), line 102 (funding_statement_guide): K5, K6, K13, K15, K16, as the file list gives them.
- Line 17, the added bullet: "Added at the landing of step 1" (D17, D3).

## Differences with no ruling
1. A PASS WITH NOTES at Stage 4.5 goes to the correction round. The source sends only FAIL there.
   - `references/pipeline_state_machine.md` line 165 reads "FAIL, or PASS WITH NOTES" against the source's "FAIL". The same rule is in `SKILL.md` line 518 and line 631 (Stops "A FAIL of an integrity check"), and in `references/integrity_check.md` lines 29, 30 and 49.
   - Only repair round 1 ruling 3 of step 2 covers it (`.scratch/13-researcher/agents/briefs/2-round-1.md`, line 9).
   - No line of the plan's Rulings names it, and no line of `deviations.md` does. The state-machine entry of `deviations.md` lists K11, which says only "up to 3 correction rounds".
   - It follows from the source's own "Must PASS with zero issues" and from D3, but it is not written down as a deviation.
2. The Rules bullet at `SKILL.md` line 744: every path and value the user gives reaches a command as one single-quoted argument, with `'\''` for a quote inside it.
   - The source has no counterpart. Step 2 added it (commit 3f6e25d).
   - It is this repository's convention (the same rule is in `skills/academic/paper/SKILL.md` line 154 and `skills/academic/writing/SKILL.md` line 60), and it also serves the own modes (`mkdir`, `sbatch`, `code/run_all.sh`).
   - No line of Rulings or of the S2 table names it.

## Declined to judge
- The pages and sections of the own modes (`novelty`, `idea`, `research`, `research adopt`, `full`, `revision`) and their own files, listed above, were not compared line by line, as the brief says.
- In `SKILL.md`, a whole-file rewrite, I accounted for its 48 hunks by section against the S2 table and heading map, not line against line. Whether each reworded sentence of the copied modes keeps the source's meaning is beyond what `diff` shows.
- On long lines I read the visible part and checked the rest with the column-240 script. A reworded line that kept the same meaning, such as "Reviewer 1" becoming "Methodology reviewer", was classed under its kind and not judged for fidelity.
- Three per-file entries of `deviations.md` omit a kind that does cover the hunk: K11 for `ai_research_failure_modes.md` line 144, K3 for `reproducibility_audit.md` lines 43-47, and K13 in detail for the examples' reviewer count and the review rewrites. I counted these as covered, since the kind row names the ruling.

Run by agent a34d88b997486c4be (claude-opus-5-5).

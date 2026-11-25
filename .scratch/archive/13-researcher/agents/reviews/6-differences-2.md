# Gate: differences from academic-pipeline

Every difference the comparison prints is covered by a ruling, a kind of `deviations.md` (K1 to K25) or a landing line of `deviations.md`, except one. In `examples/mid_entry_example.md` the impact factor "IF: 12.0" was dropped from the target-journal line, and no ruling or line names that. The gate line therefore does not hold as it stands: one difference has no ruling.

**How the comparison was run.** All commands ran from /Users/axelfaes/workspace/ordo.
- Folder comparison: `diff -rq skills/academic/researcher /Users/axelfaes/workspace/research-hub/.agents/skills/academic-pipeline`.
- Each file present on both sides: `diff <copy> <source>`. In the hunks below, "c" lines are the copy and "s" lines are the source.
- The six documents taken from the public repository: `.agents/sources/academic-research-skills-v3.13.0/shared/` (five pages, plus `agents/compliance_agent.md`), each compared with its copy under `references/` or `agents/`.
- `references/ethics.md` against `git show f9a00ab:skills/paper/references/ethics.md` (ruling D17).
- The per-file diffs are saved under /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/d/ (names with a double underscore, plus `shared__*.diff`, `SKILL.md.diff` and `ethics.diff`).
- Non-ASCII check of the copy: `LC_ALL=C grep -c '[^ -~]'` printed no file with a hit.

**Short names used below:**
- "DL" means a per-file line of `deviations.md`.
- "S2 table" means the step 2 table of `deviations.md` (lines 71-107) with its heading map (111-156).
- "R1 row" means the table "Added in repair round 1 of step 2" (161-170).

## Files of this repository's own modes (not compared line by line, ADRs 0053 to 0056)
- `agents/research_builder_agent.md`, `agents/research_reviewer_agent.md`
- `references/novelty_page.md`, `references/research_stages.md`, `references/research_brief.md`, `references/project_layout.md`, `references/slurm.md`
- In `SKILL.md`, the subsections `### novelty` (137-182), `### idea` (183-239), `### research` (240-371), `### research adopt` (372-394), `### full` (395-425) and `### revision` (528-607). The rows, items and bullets of those modes in the description, the title paragraph, Quick start, What it reads (1, 3, 5, 6 in part; 16-24), Steps 1 and 3 to 6, Stops, Anti-patterns and Rules are also this repository's own. Covered by DL 180, 189-190 and 197-198.

## Files only in the copy, with matter from the source
- `references/integrity_check.md` and `references/checkpoints.md`: SKILL.md sections moved out of SKILL.md (DL 182-183).
- The six taken documents: `agents/compliance_agent.md` and `references/{handoff_schemas,compliance_checkpoint_protocol,raise_framework,prisma_trAIce_protocol,artifact_reproducibility_pattern}.md`. They stand at these paths by Open item B and are compared with their documents below.
- `references/ethics.md`: D17, compared below.

## Files only in the source
- `agents/claim_ref_alignment_audit_agent.md`, `references/claim_audit_calibration_protocol.md`: claim audit (D16, ADR 0052, K19).
- `agents/collaboration_depth_agent.md`: collaboration observer (D16, K19).
- `references/process_summary_protocol.md`: process summary (ADR 0052, K19).
- `references/adapters/` (`overview.md`, `.gitkeep`), `references/literature_corpus_consumers.md`, `references/passport_as_reset_boundary.md`, `references/changelog.md`: Open item A, K20.

## SKILL.md (49 hunks; the whole page is rewritten into the skill layout)
- c1-6 (s1-16), frontmatter: S2 table row 1 (skill layout; the two values moved to `handoff_schemas.md`).
- c8-10 (s17-33), title and paragraph: S2 rows 2 and 20. The own modes' sentences are named above.
- c12-27 (s35-74), Quick start: Open items D, G and H, D36; S2 row 3 (`resume_from_passport`: Open item A).
- c29-45 (s75-98), Use instead: S2 row 4 and the heading map rows for Trigger Keywords, Non-Trigger Scenarios and Trigger Exclusions.
- c47-74 (s505-557), What it reads: S2 row "Agent File References..."; Open item B.
- c76-135, Steps 1 to 6 (s219-288, 356-370, 399-405):
  - entry detection: S2 row "Step 1 detection" (D4, D16, Open item D), mid-entry row (D4);
  - mode recommendation: S2 row "Step 2" (D5);
  - run folder, `state.json` and `material-passport.yaml`: D6, R1 row 1;
  - `manuscript_folder`: DL 191;
  - record of the experiments: D31;
  - budget: S2 row "Budget transparency" (D16);
  - caps: D3, R1 row 12.
- c426-436, `integrity`: D2, D3; checkpoints S2 row last.
- c437-527, `manuscript`:
  - stages and runs through the Skill tool: D5;
  - completeness check: R1 row 4;
  - minor items run: R1 row 12;
  - dimension scores: Open items E and F;
  - corrections to `/paper revision`: D5;
  - item 12, a PASS WITH NOTES at Stage 4.5 going to the correction round: ruling M (DL 204);
  - fresh Stage 4.5 agent: source Anti-pattern 6.
- c608-672, Stops: heading map rows "Error Recovery" and "Early-Stopping"; R1 rows 2, 4, 7 and 8; D3, D17. The own-mode rows are named above.
- c674-704, Anti-patterns: S2 rows "Anti-pattern 7", "Anti-pattern 8" and heading map "Anti-Patterns" (rows 1-7; row 8 for D5).
- c706-747, Rules:
  - D5, D6, D14, D1, D21, D20, D24 (wording);
  - the cap override of the heading map "Revision Loop Management";
  - quoted arguments: ruling M (DL 205);
  - own-mode bullets as named above.

## agents/integrity_verification_agent.md (87 hunks)
- c2, 6, 10, 27, 29, 59, 103, 115, 357, 373, 381, 392, 512, 522, 548-551 and the dash, arrow and "#nnn" edits inside C3 and C4 (c216-287): K1, K2, K4, K5.
- c13-14, the lookup paragraph; c16, the calibration pointer: DL 36 (K8, K6).
- c18-49 and c78-138, A0, A1, A2 and the taxonomy rows by `lookup.py`: K8 (D1); A0 rewritten (DL 36); the retraction line and the SERIOUS retraction item: D1, K8.
- s70-81, "Differences from ethics_review_agent" removed: DL 36 (K7).
- c184, c448-451, c639-655, E2 and the verification strategy: K8; originality by WebSearch: K9 (D21).
- c193-204, C3 pointer and "#213/#214/#261": DL 36, K4.
- c290-319, C4:
  - claim selection by reading the manuscript: K23;
  - the claim-audit sentence: DL 36;
  - the record of the experiments read from the project: K18;
  - legacy boundary and lint mentions: DL 36 (K4, K7).
- c341, "(D4 derivation rule)" removed: Open item B (a line naming a design document is removed as history); not listed in DL 36.
- c325-327, 347-350 and 367-371, negative-results advisory removed: K17 (D20).
- c359-365, row-field sentence: K25; mixed-evidence bullet: K23; Stage-6 histogram: DL 36 (K19).
- c379, 384-390, 395-397: K23, lint and legacy clauses, formatter clause (DL 36).
- s507-519, Phase F and the run lines; c518-519, the Mode 1 line on negative results: K16, K10, K24, K13.
- c533, c559-563, the end of the run and the correction rounds: K11 (D3), K13 (D5), K19.
- c565 "Wording of corrections and records": K14 (D24). c569 run-folder line: K15.
- c615, IDs "(#89 Item 8)" and `roadmap_item_ids`: DL 36. c620: K1, K8. c635, "## Ethics check": K16.
- s661-680 and s690, cross-model check removed: DL 36 (K19). c686: K8.

## agents/pipeline_orchestrator_agent.md (64 hunks)
- c2, 6, 229, 258, 299, 301, 319, 976, 981 (rules and name): K1, K4, K5.
- c10-11, Role Definition and the D5 sentence: DL 37.
- c24, 29-31 (intent rows): K19, K20. c34-36, 41, 153-155, 328, 595, 609, 626-627: K2.
- c39-41, mid-entry rule: D4, K12.
- s43-94, Resume Mode: K20 (DL 37).
- c103-107 and c121, the mode combinations replaced by the fixed runs, with adjustments made within those runs: D5. DL 37 describes this only as "without their research-stage mode"; the S2 row "Step 2 mode recommendation" names the ruling.
- c114-117, c132-143, c336-337, c363 (Stage 1 and 5 rows): K19.
- c161-164, the observer step: DL 37 (K19); state: K15.
- s175-225, s243-250, s273-287, observer and reset boundary: DL 37 (K19, K20).
- c263 and c684, state from the run folder: K15. c309, ethics line: K16 (DL 37).
- c345-350, the mode-switching table:
  - deep-research rows removed: K19;
  - the academic-paper and reviewer rows replaced by one PROHIBITED row for any run other than the fixed runs: D5, the S2 row "a mode switch leaves D5's runs".
- c364-369, fallback rows 2.5, 4.5, the Stage 4.5 correction round and timeout: DL 37 (D3, D5, K15).
- s371-483, the observer, 3.5 and 3.6 removed, keeping the carry-forward paragraph (now c527-528 area): DL 37. Within that paragraph:
  - record of the experiments: K18;
  - Stage 5/6 and formatter: K19;
  - `slr_lineage`: K20;
  - "#260": K4.
- c486, the schema pointer: K6. s497-511, lineage: DL 37 (K20).
- c516-523, the handoff table:
  - the Stage 4.5 row ends the run: K19;
  - `/paper` runs: D5;
  - "#260": K4;
  - the source's Stage 1 to 2 row: DL 37 says it was removed, while the copy keeps it reworded as "Research materials to Stage 2 ... Given to the `/paper` run as its materials". In substance this is D5 with K19; the DL wording is out of date.
- c525-528, `slr_lineage` sentence and Style Profile: K20, K19, K5. s538-539, Stage 5 exception rows: DL 37.
- c546-557, delegation list: K5, K19, K1. c561-570, Context Hygiene: K4, K1, K19, K20.
- c574-585, "Writing the run's state": DL 37 (D6). c592, executor: DL 37. c599: K5, K4 (#393). c616: K1.
- c632-639, integrity collaboration rows: K5, K13, K11.
- s688-973, Cite-Time Provenance Finalizer, Patch Sequencing and Terminal Gate removed: DL 37 (K19, K20).

## agents/state_tracker_agent.md (39 hunks)
All hunks are covered by DL 38 and K1, K2, K4, K5, K15 and K19:
- name, title, D6 paragraph, Write Access rows, observer rows and function 7;
- Stage 1 and 5 JSON blocks, `final_paper`, `collaboration_depth_history`, `pipeline_version`, `entry_point`, transition, stage ids;
- "**" markers and version notes (K4);
- "--" changed to "None" in `check_prerequisites` (K1, Open item B);
- dashboard rows.

One more: c202-206, the `score_trajectory` key, is covered by DL 175 (Open item E).

## examples/full_pipeline_example.md (74 hunks)
Covered by DL 39 and by K1, K2, K5, K13, K16, K19 and K21:
- the user prompt and materials starting at Stage 2;
- configuration block and fixed runs: D5;
- Stage 1 Socratic section and plan-mode dialogue removed: K19, D5;
- `/paper full` intake note: K13;
- Stage 2.5 scene and checkpoint: K21;
- progress bars: K21;
- Stage 3' as `/paper-review-panel re-review`: K13;
- minor items in one `/paper revision` run: R1 row 12;
- Stage 4.5 scene: K21;
- dashboard, deliverables, slides and webpage lines: DL 39.

Not spelled out in DL 39: the source's "4-person review" with Reviewer 1 to 3 (c163-167, c189, c386) became five reviewers with a Devil's Advocate, named by role. Covered by D5 (K13): `/paper-review-panel full` runs those five. The renaming by role is K5.

## examples/mid_entry_example.md (67 hunks)
Covered by DL 41 and by K12, K13, K16, K19 and D5:
- goal and entry at Stage 2.5 first: K12;
- the source's quick review mode, its question "What review mode?", its options a to c and "Update Configuration" replaced by the full panel, Editorial Decision and Revision Roadmap of `/paper-review-panel full`: D5, K13;
- the Stage 3' four-reviewer full review replaced by the re-review's Verification Review Report: D5;
- Stage 5, the cover letter and format questions removed: K19 (DL 41);
- the minor items run and Stage 4.5 scene: DL 41, R1 row 12;
- progress bars and dashboard: K19, K21.

Not covered: c127 against s84, where the copy reads "Target journal: Computers & Education (SSCI Q1)" and the source reads "(SSCI Q1, IF: 12.0)". See below.

## examples/integrity_failure_recovery.md (45 hunks)
- K1 (dashes, box rules, check marks), K2, K5.
- K8 (`lookup.py resolve` in rows 79, 211, 218, 300, 303, 305-306): DL 40.
- K13 (c190-194, c198, `/paper revision`).
- K16: Phase F section (DL 65), row "Ethics Check (F)" and executing line (DL 40).
- K19: the progress bar (c367) drops Research and Finalization. K19 is not in DL 40's list, but the kind covers it.

## references/ (copied files)
- **`ai_research_failure_modes.md` (27 hunks):** DL 42 and K1, K5.
  - Status line: K4. Stage 6 section: K19. `source_verification_agent` row: K7. ROADMAP line and the "(v3.2/v3.3)" notes: K4.
  - Mode 2 detection: K8. Taxonomy pointer and Mode 7 return path: DL 42.
  - c139-140, confirm by `/paper revision`: R1 row 8; override to the run's state: K15.
  - c145, the added sentence on 3 correction rounds: K11 (D3), not in DL 42's list.
  - c174-175: K4, K15.
- **`claim_verification_protocol.md` (2):** K8, K10 (DL 43).
- **`external_review_protocol.md` (4):** K4, K1; added `/paper revision` sentence (DL 44).
- **`integrity_review_protocol.md` (12):** DL 45:
  - K4; K12 (midway sentence); K10 (run alone);
  - K16 (two Phase F lines); K13 (`/paper revision`);
  - K11, K19 (end of the run, 3 rounds); K5, K6.
- **`mode_advisor.md` (13):** DL 46. The quick-matrix row "Full pipeline (writing to final manuscript) | Have research done" and the entry-table prerequisites edits: K19, K12. The anti-pattern row about the abstract: K5.
- **`pipeline_state_machine.md` (28):** DL 47:
  - K1, K4, K5, K15 (state line and the session's writes), K19 (Stage 1 and 5 boxes, rows and artifacts), K11 (diagram note), K13 (runs paragraph), K12 (INIT rows);
  - completeness-check rows: R1 row 4;
  - Minor to one `/paper revision` run (footnote, rows, cycle): DL 176;
  - c165 "FAIL, or PASS WITH NOTES": ruling M (DL 204);
  - "Rules of the cycle", reset section: DL 47.
- **`plagiarism_detection_protocol.md` (12):** K1, K2, K5, K10 (DL 48).
- **`progress_dashboard_template.md` (5):** K5, K19, K4 ("v3.4.0"), K15 (state line) (DL 49).
- **`reinforcement_content.md` (2):** pointer K6, S2 heading map "Mid-Conversation Reinforcement"; rows K2, K19 (DL 49).
- **`reproducibility_audit.md` (10):** K4, K1, K5 and K8 (c11), K15 (c17), K19 (X/7, Stage 1/5/6 lines), K3 and K6 (c46-54). DL 50 does not list K3 and K6, but the kinds cover them.
- **`score_trajectory_protocol.md` (11):** K4, K5, K1, K6, K19 (Stage 6 reporting, DL 51), K15 (c55). Not in DL 51: c21 and c25, where the scores are read from the "Dimension Scores" of the Editorial Decision and of the Verification Review Report. Covered by Rulings Open items E and F.
- **`team_collaboration_protocol.md` (19):** K19 (Stage 1 and 5 roles, handoff, lines; "After Stage 4.5 PASS"), K2, K6, K1, K15 (c260) (DL 52).
- **`two_stage_review_protocol.md` (9):** K4, K13 (Run lines), K2, K5 and K6; Minor branch: DL 176 (DL 53).
- **`templates/pipeline_status_template.md` (7):** K5, K19, K2 (DL 49).

## Taken documents against the public repository's v3.13.0
- **`agents/compliance_agent.md` (18 hunks):** DL 54 and K5, K6, K2, K1, K4 ("v3.2").
  - Frontmatter `owner_skill`, `invoked_by` and `related_skills` now name only `researcher`: K5 with D23 (`paper` has no RAISE check).
  - c111, "a primary-research manuscript" in place of `academic-paper full`: K5, D23.
  - c128, "(or standalone skill)" removed: D23, with the protocol's "Boundary: non-pipeline invocation" (DL 55). Not in DL 54.
- **`references/compliance_checkpoint_protocol.md` (16):** K6, K5, K4 ("Task 8", "v3.2"), K1.
  - c10: DL 184.
  - c55-57 backfill through `/paper revision`: R1 row 8.
  - Harness comments, enforcement note, CONTRIBUTING.md, Stage 6 clause and Boundary section: DL 55.
  - c96 auto-inject replaced by a restart of the compliance agent and `/paper revision`: R1 row 2.
- **`references/raise_framework.md` (33):** K5 ("ARS" to "researcher"; c14 `/researcher manuscript` with D23), K1, K4, K6, K7; Role 2 and Role 3 self-declarations: DL 56.
- **`references/prisma_trAIce_protocol.md` (45):** K1 (dashes, the section sign, the less-or-equal sign, kappa), K5, K6; freshness CI, scripts, "Task 8" and "Task 12": DL 57 (K4, K7).
- **`references/artifact_reproducibility_pattern.md` (25):** K1, K3, K5, K6, K19 (`cross_model` block); lint sentences, `check_repro_lock.py`, existing passports, Future evolution (heading now "Limits that do not change", only the "Never" line kept), `ars_version` source: DL 58 (K4, K7).
- **`references/handoff_schemas.md` (76):** DL 59 and K1, K3, K5, K6, K4 ("v3.3", "#399", "Kong A1 / v3.11", "#268", "#95", "#93/#94", pre-#95 compatibility), K7 (schema .json pointers, design docs, lint scripts, example passport, `style_calibration_protocol.md` pointer).
  - Schemas 1-3 headers and deep-research producer and consumer lines: K19, K5.
  - c251, record per file: K15.
  - c367, the Schema 6 `dimension_scores` row: Rulings Open items E and F (not in DL 59).
  - c453 `change_block_ids`: DL 59. c473-477 REV-007: K22.
  - c503-511, passport rows: K20, K19, K18, K23, K4.
  - Sections removed (Reset Boundary, Literature Corpus, Audit Artifact, Run-level lineage, Claim-Faithfulness): DL 59.
  - Experiment Provenance Intake items 1-3 and the invariants: K18, K4, K23 (DL 59).
  - Schema 11, "Legacy normalization (pre-#268 artifacts)" removed: K4, not named in DL 59.
  - Schema 12, standalone and Stage 6 consumers removed: D23, K19.
  - Validation rule 11: D4 (DL 59).
  - `data_access_level` and `task_type`: the copy says "The value of `researcher` is ..., stated on this page, since the frontmatter of its `SKILL.md` holds only the keys of the skill layout". It does not keep the source's sentence "Every top-level SKILL.md declares metadata.<field>". This is covered by S2 table row 1. DL 59's claim that the source's subject sentence is kept is out of date.
  - "v3.3.5 additions": DL 59.
- **`references/ethics.md` against f9a00ab (9 hunks):** line 3, CONDITIONAL row, run state, disclosure and citation pointers, responsible-use statement, conflict statement: DL 60 (K5, K6, K13, K15, K16); c17, the correction-round bullet: DL 64.

## Differences with no ruling
- `skills/academic/researcher/examples/mid_entry_example.md` line 127 (source line 84): the target-journal line drops the impact factor, "(SSCI Q1, IF: 12.0)" becoming "(SSCI Q1)". It sits inside the rewrite of the source's quick-mode "Field Analysis" into the full mode's "Reviewer Configuration Card", which D5 and K13 cover. No ruling, kind or line of `deviations.md` names dropping the impact factor.

Stale wording in `deviations.md`. These differences are covered by a ruling, but the line that lists them now misdescribes the copy:
- DL 37 says the Stage 1 row of the orchestrator's handoff table was removed; the copy keeps it reworded as "Research materials to Stage 2".
- DL 59 says the `data_access_level` and `task_type` sections keep the source's subject sentence; the copy replaces it, as the S2 table row 1 rules.
- Some per-file lines omit a kind or ruling that covers a hunk in their file. Each hunk is still covered by the kind table or the Rulings:
  - DL 36 omits Open item B for "(D4 derivation rule)";
  - DL 39 omits D5 for the five reviewers;
  - DL 40 omits K19;
  - DL 42 omits K11;
  - DL 50 omits K3 and K6;
  - DL 51 and DL 59 omit Open items E and F;
  - DL 54 omits D23 for "(or standalone skill)";
  - DL 59 omits K4 for the pre-#268 normalization paragraph and K7 for the style-calibration pointer.

## Declined to judge
- Whether each sentence of `SKILL.md` that carries source matter states the source's rule faithfully. The diff is a whole-page rewrite with no line-level pairing, so I accounted for it by section against the S2 table and the heading map, not sentence by sentence against the source.
- Whether the five-reviewer cast in the two examples matches `paper-review-panel`'s own full mode. I read it as D5 and did not compare it with that skill's pages.
- Whether deleted sections that `deviations.md` names hold any rule the copy should have kept. For example, the source's "Legacy normalization" paragraph and the Stage 6 parts: I checked that each such hunk is a pure removal (only source lines) and named it, and did not judge the removal on its merits.

Run by agent acee1f9bc0152f982 (claude-opus-5-5), on main at 43cbae8.

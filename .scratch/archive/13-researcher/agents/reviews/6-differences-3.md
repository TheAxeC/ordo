# Gate: differences from academic-pipeline

I found no difference that lacks a ruling, with one borderline item (see "Differences with no ruling").

## How the comparison was run

I ran everything from /Users/axelfaes/workspace/ordo and changed nothing. `git status --short` printed nothing after the run.

- The copy against the source: `diff -r /Users/axelfaes/workspace/research-hub/.agents/skills/academic-pipeline skills/academic/researcher`. It printed 5130 lines and 587 hunks. 21 files exist in both trees, 8 exist only in the source and 16 only in the copy.
- The six taken documents against their reference copies under `.agents/sources/academic-research-skills-v3.13.0/shared/`:

| File | Hunks |
|---|---|
| `agents/compliance_agent.md` | 18 |
| `compliance_checkpoint_protocol.md` | 16 |
| `handoff_schemas.md` | 76 |
| `prisma_trAIce_protocol.md` | 45 |
| `raise_framework.md` | 33 |
| `artifact_reproducibility_pattern.md` | 25 |

- `references/ethics.md` against `git show f9a00ab:skills/paper/references/ethics.md`: 9 hunks.
- The diffs are saved per file in /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/e68b9e7f-9bfe-4218-be15-6dd18d5f22c0/scratchpad/g13/ (`*.d`, `*.diff`, `full.diff`).

Line numbers below are the source's (the left side of `diff`). "Listed" means that file's bullet in the per-file list of `deviations.md` (lines 36 to 60) names the hunk.

## Files present in one tree only

**Only in the source, left out:**
- `agents/claim_ref_alignment_audit_agent.md` and `references/claim_audit_calibration_protocol.md`: K19, the claim audit (D16, ADR 0052).
- `agents/collaboration_depth_agent.md`: K19, the collaboration observer.
- `references/process_summary_protocol.md`: K19, Stage 6.
- `references/adapters/` (`overview.md`, `.gitkeep`), `references/literature_corpus_consumers.md`, `references/passport_as_reset_boundary.md` and `references/changelog.md`: Open item A (C144), K20.

**Only in the copy, taken from the public repository:** `agents/compliance_agent.md` and `references/{compliance_checkpoint_protocol,handoff_schemas,prisma_trAIce_protocol,raise_framework,artifact_reproducibility_pattern}.md` (D16, Open item B). `references/ethics.md` (D17). These are compared below.

**Only in the copy, sections moved out of `SKILL.md`:** `references/integrity_check.md` and `references/checkpoints.md`. They have no source file; they are covered by the step 2 tables and by deviations.md lines 182 and 183 (step 3).

**Only in the copy, this repository's own modes, not compared line by line (ADRs 0053 to 0056):**
- `references/novelty_page.md`: `novelty` and `idea`, ADR 0054.
- `references/research_stages.md`, `references/research_brief.md`, `references/project_layout.md`, `references/slurm.md`, `agents/research_builder_agent.md` and `agents/research_reviewer_agent.md`: `research`, adopt and `full`, ADR 0053. Also `revision` (ADR 0055) and step 9 (ADR 0056).

## SKILL.md (44 hunks, source lines 2 to 623 against copy lines 2 to 747)

`diff` pairs the two files only by chance, because the copy is the source's content rearranged into the sections of the skill layout. I read every part of the copy that belongs to `integrity` and `manuscript` (lines 1 to 136, 426 to 527 and 608 to 747) against the deviations.md tables. Each part maps as follows:

- Frontmatter, title, Quick start, Use instead and "What it reads": step 2 table rows 1 to 5 and 21 to 22 (skill layout, Open item D, Open item A, D16). The lines for `--manuscript` come from Open item I (C151). "What it reads" 8, the lookup environment variables, falls under D1 (K8).
- Steps 1 to 6:
  - Mode, depth and entry: D2, D4, Open item D.
  - Unfinished run: D6, with `manuscript_folder` from step 4 (deviations.md line 191).
  - Run folder, `state.json` and `material-passport.yaml`: D6 and round 1 ruling 1 (line 163).
  - Record of the experiments: D31 (K18).
  - Configuration and budget: D5 (line 80) and D3; the cap of one minor-items run comes from round 1 ruling 12.
- `### integrity` and `### manuscript` items 1 to 13:
  - The runs: D5 and K13.
  - Scores read from the "Dimension Scores": Open items E and F (lines 169 and 170).
  - The completeness check: round 1 ruling 4 (line 165).
  - The minor-items run: round 1 ruling 12 (line 168).
  - `## Papers`: D28, from the step 4 booking.
  - Item 12, a PASS WITH NOTES sent to the correction round: ruling M (line 204).
- Stops: the step 2 map rows "Error Recovery" and "Early-Stopping" and the round 1 rows.
- Anti-patterns rows 1 to 7: the source's rows 1 to 6 and 8 (line 145). The row on changing the manuscript outside `/paper revision`: D5.
- Rules: the step 2 table rows on D5, D6, D20, D24, D1, D14 and D21 and on the revision-loop cap; the step 8 scoping (line 198); the quoted-argument rule, ruling M (line 205).
- Compliance questions asked at Steps 5 (copy line 132): see "Differences with no ruling".
- Own modes, this repository's, not compared: `### novelty` and `### idea` (copy lines 137 to 239, ADR 0054), `### research`, `### research adopt` and `### full` (lines 240 to 425, ADR 0053), `### revision` (lines 528 to 607, ADR 0055), and their rows of Quick start, Stops, Anti-patterns and Rules (copy Rules lines 711 to 725 and 745 to 746).

## agents/integrity_verification_agent.md (87 hunks)

- 2: K5. 6, 10, 27, 39-42, 48-49 and 59: K1.
- 13a (lookup paragraph): K8, listed.
- 16: the calibration pointer, K6 and Open item B, listed.
- 18-21 and 31-35: K8, D1. 70-81: K7, listed. 88-101: A0, K8, listed.
- 105-115, 120 and 136-138: K8. 127a and 130 (retraction line, retracted source as SERIOUS): K8, D1, listed.
- 184 and 470-476: E2, K8, D1.
- 202, 290 and 216-287: K4 (#261, #213, #260) and K1 inside the code block. 204: K6, listed.
- 292: claim-audit sentence K19, join sentence K23, listed.
- 294-295: where the record is read (K18, D31) and "ARS" (K5), listed.
- 297-316: the legacy boundary of D7 (K4), condition 4 (K23) and EP-INV-4 (K7), listed.
- 318-319, 332-335, 359-365 and 379: K23, K25, the K19 histogram and the lint (K7), listed.
- 325-327, 347-350, 367-371 and 384-386: K17. 384-390 also: K4 legacy.
- 341-342, "(D4 derivation rule)": Open item B, deviations.md line 211.
- 357, 373, 381 and 392: K1. 395-397, the formatter clause: listed.
- 507a, 515 and 525: Phase F, K16. 512, 513a, 522 and 523a: K10, D2.
- 518-519: K4, K24, and K13 (D5).
- 529-530: K4, K1. 533: K19, K11. 548-551: K1.
- 559 and 561-563: K13, K8, K11. 565a: K14 (D24). 569a: K15.
- 615: listed. 620: K1, K8. 635: K8 and the "Ethics check" section (K16, listed). 644-655 and 686: K8.
- 661-680 and 690: cross-model, K19.

## agents/pipeline_orchestrator_agent.md (65 hunks)

- 2: K5. 6 and 561: K4.
- 10 and 11a: Role Definition and the D5 sentence, listed.
- 24, 29-31, 132, 134, 142-143, 268 and 336-337: Stage 1 and Stage 5, K19. Also K20 for the resume row.
- 34-36, 153-155, 328, 595, 609 and 626-627: K2. 229, 258, 291, 299, 301, 319, 976 and 981: K1.
- 39-41: D4, listed. 43-94: Resume Mode, K20, listed.
- 103-107 and 121, the mode combinations and "adjust any stage's mode": D5 (step 2 table line 80). The per-file line describes them only as "without their research-stage mode". 114-117: K19, K1.
- 161-164 and 175: the observer, K19. 177-225, 273-287 and 497-511: K20, listed. 243-250: K19.
- 263, 574-585 and 684 (audit-trail line): K15, listed.
- 309a: Phase F, K16, listed.
- 345-350: the deep-research rows (K19, listed); the plan, full, quick and guided rows replaced by one PROHIBITED row (D5, not named by the per-file line).
- 363-369: the fallback matrix (K19, D3, D5), listed.
- 371-483: observer, 3.5 and 3.6 (K19, K7), listed.
- 486: K6. 516-528: the handoff table (correction line 209), carry-forward paragraph kept, K5, K4, K19.
- 538-539: K19. 546-557: K19, K5, K1. 563-570: K1, K19, K20.
- 592 and 599: the coaching executor and pointer, listed, K4 (#393). 632-639: K5, K13, K11.
- 684-804 and 806-903: Cite-Time Provenance Finalizer, K19 and K20, listed. 906-973: Patch Sequencing and the Submission-Package gate, K19, listed.

## agents/state_tracker_agent.md (39 hunks)

- 2, 97-181 and 423: K5. 6, 335, 344-360, 364, 374 and 471: K4.
- 11a: D6, listed. 20-23: K5 and the observer row (K19). 26-33: K19, listed.
- 41-42 and 324: K2. 46: K6. 60: K1.
- 71, 79-94, 213-227, 283-284, 293-305, 319, 382-390, 400-418, 428, 436 and 451: Stage 1, Stage 5 and the observer, K19, listed.
- 73-74, 254 and 308a: listed.
- 239a, `score_trajectory`: Open item E (line 175).
- Inside 382-390, the empty-cell `--` became `None`: K1 and Open item B (2).

## examples/full_pipeline_example.md (74 hunks)

- Lines 16-138 (Stage 1 removed, the user's materials, and the Stage 2 to 2.5 transition): K19 and K21.
- Lines 145-177 (the Stage 2.5 scene): K21.
- Lines 30-41 and 145-177 (plan mode replaced by `/paper full`, "runs fixed"): D5 (K13).
- Lines 226-251 (reviewer roles, five reviewers): K5 and K13 (correction line 212).
- Lines 268-340 (`/paper` runs): K13. Line 321 (re-review): K13.
- Lines 361-477 (Stage 5 replaced by Stage 4.5 and the minor run; dashboard and deliverables): K21 and K19.
- The arrows: K2.

## examples/integrity_failure_recovery.md (45 hunks)

- 4, 24 and 332: K2. 27, 46, 88-108, 162-187 (marks), 212-254 headings, 304-307, 335-337, 346, 352 and 369-385: K1.
- 56, 62, 284, 287 and 373: K5. 59a and 319a: K16.
- 78, 202, 209 and 291-297: K8. 136a: K16 plus the step 1 landing fix (line 65).
- 183-199: K13. 357-358: K19 (correction line 213).

## examples/mid_entry_example.md (65 hunks)

- 7, 30-33 and 60-118: the Stage 2.5 scene, K12 (D4) and K16.
- 37-47: the review-mode question and the user's "quick review" removed.
- 54-58 and 62: K19, K12.
- 69-190: the source's quick EIC assessment and its "upgrade to full review" choice replaced by `/paper-review-panel full` with five reviewers.
- 218-285: the full four-reviewer re-review replaced by `/paper-review-panel re-review` with its traceability matrix.
- 37-47, 69-190 and 218-285 are all D5 (K13). The per-file line (line 41) does not describe them.
- 174-177 and 236-238: K13. 207: K2.
- 293-399: Stage 5 removed and Stage 4.5 with the minor run added (K19, K16, round 1 ruling 12). The cover letter: listed.
- No hunk on line 127; the target-journal line equals the source (D44).

## references/ai_research_failure_modes.md (27 hunks)

- 3-6: K4, K5, K19. 12, 28, 53, 62, 70, 85, 88, 92 and 115: K1 and K5.
- 18 and 41: K6 and K7 (the taxonomy pointer), listed. 35, 77, 158 and 165-166: K5.
- 45-47 and 163: K8, D1, K7. 118-122: Mode 7's return path (K19), listed.
- 139-140: K13 (round 1 ruling 8) and K15.
- 145: K19, and the 3-rounds sentence (K11, correction line 214).
- 147-155: Stage 6, K19. 172-175: K4, K5, K19. 181-185: K1, K6, K7 (the ROADMAP line).

## references/claim_verification_protocol.md (2 hunks)

19: K8 (D1, ADR 0024). 38-39: K10 (D2).

## references/external_review_protocol.md (4 hunks)

1: K4. 45 and 75: K1. 81a: K13 (D5).

## references/integrity_review_protocol.md (12 hunks)

1, 45 and 47: K4 and K6. 5: K12 and K10. 10, 31 and 49: K5. 16a and 37a: K16. 19: K13. 26: K19 and K10. 40-42: K19, K13, K11 and K1.

## references/mode_advisor.md (13 hunks)

- 1: K1. 13-25, 33-39, 47-54, 64-68, 77-104, 130 and 134-135: K19 rows and K5 names, listed in full.
- 115-120: the Stage 1 and Stage 5 rows (K19) and Stage 2.5 never skipped (K12, D4).

## references/pipeline_state_machine.md (28 hunks)

- 1 and 3: K4, K5. 29a, 213a, 221, 225 and 241: K15. 223: K2.
- 41-130: the diagram without Stage 1 and Stage 5 (K19), the 3 rounds (K11), and the Minor note (step 2 landing fix, line 176). 132a: the same.
- 138a, 141-158 and 160-161: K13, K12, K19, round 1 ruling 4 and round 1 ruling 12.
- 165-166: PASS WITH NOTES, ruling M (line 204), plus K11 and K19.
- 172, 183, 185-188, 197-200 and 211-212: K19. 252, 257-258 and 272-307: K4 and K20 (reset boundary). 264: round 1 ruling 12.

## references/plagiarism_detection_protocol.md (12 hunks)

1, 3, 95, 98, 114, 116, 156-159, 192, 198 and 206-208: K1 and K5. 53-54: K10. WebSearch is kept (D21).

## references/progress_dashboard_template.md (5 hunks)

7: K5. 13 and 21-22: K19. 28: K4. 38: K15.

## references/reinforcement_content.md (2 hunks)

3: K6 (the pointer to the moved protocol, step 2 map line 132). 7-15: K2, plus the rows Stage 1 to 2, Stage 4.5 to 5 and the observer removed (K19).

## references/reproducibility_audit.md (10 hunks)

3 and 44: K4. 10-11: K1, K5, K8. 17: K15. 25, 27 and 35-36: K19. 46-54: K1, K3, K6 (correction line 215).

## references/score_trajectory_protocol.md (11 hunks)

3-4: K4, K5. 11 and 96: K1. 21 and 25: Open items E and F (line 216). 33-37: K5, K6, K4. 47 and 63: K4. 55: K19, K15. 70-93: Stage 6, K19.

## references/team_collaboration_protocol.md (19 hunks)

13, 15, 33-46, 83, 104, 115 and 227-233: K19, listed. 53, 63 and 73: K2. 121, 196, 239 and 258: K6. 212: K1. 260: K15.

## references/two_stage_review_protocol.md (9 hunks)

1: K4. 5a and 19: K13. 8, 12 and 25: K2. 11 and 23: K5, K6. 21: the Minor run (step 2 landing fix, line 176).

## templates/pipeline_status_template.md (7 hunks)

11: K5. 16-19, 35-37, 132, 135 and 145: K19. 84: K2.

## agents/compliance_agent.md (18 hunks, against shared/agents/compliance_agent.md)

- 2: K5. 4-11: `version` and `last_updated` (K4, listed), and invoked_by and related_skills (K5, K7).
- 13-18 and 49: K6, plus the schema JSON (K7, listed). 29, 86, 92, 94, 102 and 132-136: K6 and K1.
- 77, 79 and 107: K2, K1.
- 114, the example `academic-paper full`: K5 and D23.
- 118-119: harness comment, K4, listed. 122-124: K5, K4, K19 (`report_compiler`), listed.
- 128: listed, plus "(or standalone skill)" (correction line 217).

## references/compliance_checkpoint_protocol.md (16 hunks)

- 3 and 117: K6. 8 and 106-111: K5, K1. 10: K4 and line 184. 34 and 80-81: K4.
- 55-57: backfill through `/paper revision` (D5, round 1 ruling 8). 70, 74, 78 and 90: K1, K6.
- 94: enforcement-boundary note, listed.
- 96: auto-inject replaced by `/paper revision` (D5, round 1 ruling 2), and `CONTRIBUTING.md` removed (listed).
- 125-134: the Stage 6 clause and "Boundary: non-pipeline invocation", listed.

## references/handoff_schemas.md (76 hunks)

- 1, 5-7, 460-467, 747-772, 795, 802 and 853: K1, K3.
- 13-139 (Schemas 1 to 3): the deep-research producer lines, K7 and K19, listed.
- 103, 262, 297, 779-787, 804-806, 817 and 836: K4.
- 196-250, 342, 354-357, 390-431, 490 and 518: K5.
- 251a: K15. 301: K6, K4. 367a, `dimension_scores`: line 216. 453, `change_block_ids`: listed. 473-477: K22.
- 503-511: rows removed (K20, K19). Also K18 and D31 (the declaration "written with the record of the experiments"), K23 (the join), K4 (`legacy_unknown`), and K7 (schema links, lint).
- 526-634: Reset Boundary, Literature Corpus and Audit Artifact, listed.
- 574-670, Experiment Provenance Intake: K18 (read from the project), K4 legacy boundary (listed), K23 (frozen key, item 3, EP-INV-2/3, listed) and K7 (lint script).
- 672-714: the design-doc pointer (K7), run-level lineage (K20) and claim-faithfulness (K19), listed.
- 717-721: K5, K19. 752-753 and 812-813: line 210.
- 819-841: K7 (the schema JSON), K19 (Stage 6), K4 (issues #93 and #95), K5.
- 869: rule 11, D4, listed. 872-899: line 210 and the step 2 table row 1.

## references/prisma_trAIce_protocol.md (45 hunks)

2 and 157: K4, K5. 6, 14, 16 and 22: the freshness CI and the Task numbers (K7, K4), listed. Every other hunk (24-153): K1 (dashes, the section sign, the comparison signs, kappa) and K5 ("ARS"), with K6 on 30 and 35.

## references/raise_framework.md (33 hunks)

2: K4. 76: Role 2's self-declaration, listed. 83: Role 3's line removed (K19), listed. Every other hunk: K1 and K5 ("ARS" to "researcher"), with K6 on 41.

## references/artifact_reproducibility_pattern.md (25 hunks)

1, 81-84, 100-102 and 166-173: K4 (Future evolution), listed. 5-40, 94-116 and 133-164: K3 and K1, with K5 ("ARS"). 48: K1. 67-70: `cross_model`, K19. 73-75 and 120-129: K6 and K7 (lint sentences, `check_repro_lock.py`), listed. 88-90: `ars_version` from `metadata.version`, listed.

## references/ethics.md (9 hunks, against f9a00ab:skills/paper/references/ethics.md)

3, 10, 19, 30, 34, 58, 93 and 101: K5, K6, K13, K15 and K16, listed (line 60). 16a: step 1 landing (line 64).

## Differences with no ruling

None, apart from one borderline item:

- `skills/academic/researcher/SKILL.md` Steps 5, line 132 (and the Stops row "The run's configuration", line 617). At the configuration stop the session asks the user for the compliance agent's `user_metadata`: the AI tools used, with name, version, developer, stage and purpose, and the intended venue.
  - In the source, the orchestrator only "passes the input contract" (`agents/compliance_agent.md` line 128). The source never says where `user_metadata` comes from.
  - The nearest coverage is D5 and D6 with the step 2 table row "the session holds both roles": the session now holds the orchestrator role and so has to fill that contract.
  - No ruling and no line of deviations.md names the question itself, when it is asked or that it is asked of the user.

## Declined to judge

- Whether each per-file bullet of deviations.md describes its file fully. In three places a hunk is covered by a ruling the bullet does not spell out:
  - `examples/mid_entry_example.md`: quick review replaced by the full panel, full re-review replaced by `re-review` (D5).
  - `agents/pipeline_orchestrator_agent.md` lines 103-107 and 345-350: mode combinations and mode switching under D5.
  - `references/ethics.md` line 34: the text names the copy's own `agents/integrity_verification_agent.md`, while deviations.md line 60 reads as if both pages were `paper`'s (`paper` has no such page; `ls skills/academic/paper/agents | grep -c integrity` printed 0).
- These are matters of record and not differences without a ruling; I give them for the orchestrator to decide whether the list is amended.
- Whether the rewritten text of `SKILL.md` for `integrity` and `manuscript` is faithful to the source's meaning sentence by sentence. `diff` cannot pair the two, so I judged it by mapping each part to the deviations.md tables, not by line.
- The own modes and their pages, by instruction.

Run by agent a8df7d3302ec37e7f (claude-opus-5-5), on main at 7657b25.

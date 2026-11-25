# Deviations of `researcher` from academic-pipeline v3.13.0

The differences of `skills/academic/researcher/` from its source, by kind and by file, as step 1 built them. Each later step adds the differences it makes.


| Kind | Source has | `researcher` has | Reason | Ruled by |
|---|---|---|---|---|
| K1 characters | em and en dashes, arrows, box rules, check and cross marks, `x` signs, `<=`/`>=` symbols, `section` sign, ellipsis, Chinese text | ASCII words or punctuation, `=` rules | ASCII only | forced: `skills/ordo/ordo-init/templates/docs/dev/prose-standard.md`, section 0 |
| K2 arrows outside code | `->`, `-->`, the arrow sign | "to", "then", a colon | arrow outside code as a word | forced: prose standard, section 0 |
| K3 hard wraps | paragraphs wrapped at a column | one line per paragraph | no hard wraps | forced: prose standard, section F |
| K4 history | "v2.0", "(Added in v2.5)", "(v3.3)", issue numbers such as "#260", Status lines, changelogs, "Differences from v1.0" | removed, the rule kept | no history | forced: `docs/dev/change-standard.md` rule 10, `docs/dev/skill-layout.md` Frontmatter |
| K5 names | `academic-pipeline`, `academic-paper`, `academic-paper-reviewer`, `ARS`, `name: <x>_agent`, agent file names in sentences | `researcher`, `paper`, `paper-review-panel`, the frontmatter `name` without `_agent`, agents by role in words | names | forced: Open item B, `docs/dev/skill-layout.md` "Paths and names" |
| K6 pointers to taken files | `shared/<name>`, `academic-paper/references/<f>` | `references/<name>`, "the `paper` skill's `references/<f>`" | pointers | Open item B |
| K7 pointers to files not taken | `scripts/`, other `shared/`, `docs/design/`, `deep-research/` paths | removed with the sentence or row that exists for them, or reworded | not taken | Open item B |
| K8 lookups | WebSearch and the Semantic Scholar route for a reference's existence and fields; web search for a claim's source text | `lookup.py resolve` read as D14 with its `Crossref notice:` lines; the source's text read as the `paper` skill's citation compliance agent, "Reading the source", says, with `lookup.py quote-check` | D1 | D1, D14, ADR 0024, ADR 0033 |
| K9 originality | WebSearch screen at both depths | unchanged | D21 | D21 |
| K10 depths | Mode 1 and Mode 2 inside the pipeline | the same, with `/researcher integrity pre-review` and `/researcher integrity` | D2 | D2 |
| K11 failed final check | "If 2nd integrity check also fails, abort" | up to 3 correction rounds, then the user decides | D3 | D3 |
| K12 midway entry | some pages let Stage 3 or Stage 4 start without Stage 2.5 | Stage 2.5 always runs | D4 | D4 |
| K13 sub-skill runs | dispatch of sub-skill agents | `/paper full`, `/paper-review-panel full`, `/paper revision`, `/paper-review-panel re-review` through the Skill tool; corrections to `/paper revision` with the issue list | D5 | D5 |
| K14 wording of corrections | none | the integrity agent's "Wording of corrections and records" | D24 | D24 |
| K15 state | state in the conversation, a state-tracker agent | state and each integrity record as files in `researcher-runs/<mode>-<date>/`, written by the session | D6 | D6 |
| K16 ethics | none in the source; `paper`'s old page | `references/ethics.md`, read by the integrity agent as Phase F at both depths, the last part of each record; every page and example that states what a depth runs names Phase F | D17 | D17, ADR 0027 |
| K17 null results | the integrity agent's advisory that negative results are surfaced in the prose | removed; the record keeps `negative_results[]`; a contradicting claim is a check-3 FAIL | D20 | D20 |
| K18 record of the experiments | scholar-entered at Stage 1 intake | read from the project as `research` writes it; built once with the user otherwise | D31 | D31 |
| K19 left out | claim audit, cross-model check, patch scripts, collaboration observer, research stage (Stage 1), finalizing stage (Stage 5), process summary (Stage 6) | removed with every sentence, row, step and checkpoint that exists only for them | D16, ADR 0052 | D16, ADR 0052 |
| K20 left out | literature corpus, adapters, reset boundary of `ARS_PASSPORT_RESET`, `resume_from_passport`, `slr_lineage` | removed the same way | Open item A | Open item A |
| K21 full example scenes | Stage 2 straight to Stage 3; Stage 5 after Stage 4.5 | a Stage 2.5 scene (run, PASS, checkpoint) between Stage 2 and Stage 3, and a Stage 4.5 scene with the minor revision, both in the form of the mid-entry example; the configuration block, progress bars, transitions, dashboard and deliverables agree with them; the LaTeX deliverables of the left-out format conversion removed | the state machine forbids Stage 2 to Stage 3 without Stage 2.5 | Open item C (ruling 2 of round 1) |
| K22 REV-007 example | a resolved DA-CRITICAL must-fix item whose response reports two non-significant outcomes and a new discussion of null results | a made-up resolved must-fix item on causal wording in a cross-sectional design, with the same fields (Reviewer Comment, Status, Response, Changes) | no example puts a null result into a manuscript | D20 (ruling 4 of round 1) |
| K23 claim selection of the alignment check | claims joined to the record through `claim_intent_manifest.planned_experiment_ids[]` and the `<!--ref:slug-->` marker | the integrity agent picks the claims by reading the manuscript: each sentence that reports an outcome of the author's own experiments is a claim, matched to the entry whose result it reports; every check of the source kept on the claims so picked; `references/handoff_schemas.md` says the same | `paper`'s draft writer emits no `planned_experiment_ids` | Open item C (ruling 10 of round 1) |
| K24 Mode 1 and negative results | experiment-backed claims sampled at 30% at Stage 2.5 | the same, and a claim that touches an entry's `negative_results[]` always checked, outside the sample | a contradicting claim fails at both depths | Open item C (the case of ruling 10 of round 1) |
| K25 `scoped_manifest_id` and `claim_id` of an alignment row | taken from the claim manifest the join reads | taken from the draft writer's `intended-claims.md` when the run folder has one and the claim is in it; otherwise `null` and an id the agent gives (C-NNN) | the row's fields keep a source once the manifest is no longer the join | Open item C (ruling 10 of round 1), see judgment calls |

Per file (from the `diff` commands above):

- `agents/integrity_verification_agent.md`: K1, K2, K4, K5, K6, K7, K8, K9, K10, K11, K13, K14, K15, K16, K17, K18, K19, K23, K24, K25. Removed more than a sentence: "Differences from ethics_review_agent" (source lines 70 to 78, a comparison with a `deep-research` agent, K7); "A0. Semantic Scholar API Batch Verification" (88 to 101) rewritten as "A0. Lookup with `lookup.py resolve`" (K8); "Cross-Model Verification" (661 to 677) and the Quality Standards row "Cross-model" (690) (K19); in C4 the legacy boundary of D7 (298 to 302, 316, 386 and the legacy clause of 387 to 390, K4) and the Stage-6 defect histogram sentence (364 and 365, K19). Reworded for a pointer: the calibration pointer (16); C3's pointer to `vlm_figure_verification.md` (204); the lint mentions EP-INV and EA-INV in C4 (303, 333, 379); the claim-audit sentence in C4 (292); the formatter clause (396 and 397); the "(#89 Item 8)" and `roadmap_item_ids` clause of the Issue List IDs (615). Reworded for K23 in C4: the join sentence of the intro, D7 condition 4 (the manuscript sentence that cites no source for a first-person outcome, without the manifest signal and the marker), the scope of the per-entry checks, check (1)'s dangling pointer as a claim that matches no entry, the mixed-evidence bullet, the severity line of check (1). Added: the lookup paragraph after Role Definition, A2's retraction line, C4's paragraph on where the record is read, Phase F at both depths, the run lines of the two modes with Phase F, the Mode 1 line of K24, the row-field sentence of K25, "Wording of corrections and records", the Output Format's run-folder line and "## Ethics check" with "[At both depths: ...]".
- `agents/pipeline_orchestrator_agent.md`: K1, K2, K4, K5, K6, K7, K11, K12, K13, K15, K16, K19, K20. Removed more than a sentence: Resume Mode (43 to 93, K20); Passport Reset Boundary (177 to 224) and the reset tag (274 to 286) (K20); Collaboration Depth Observer (371 to 394) with the observer step and the IRON RULE (162 to 163, 175) and the template blocks (243 to 249, 292) (K19); "3.5 Audit Artifact Gate" (396 to 425, K7, K19); "3.6 Claim-Faithfulness Audit Gate" (427 to 482, K19), keeping its paragraph "Experiment-provenance aggregate carry-forward" as a paragraph of Transition Management; run-level lineage (497 to 510, K20); the four "Cite-Time Provenance Finalizer" sections (688 to 905, K19, K20); "Revision-Round Patch Sequencing" (906 to 953, K19); "Submission-Package Terminal Gate" (955 to 972, K19); the Stage 1 and Stage 5 rows of the intent table, the fallback matrix, the handoff table and the exception table, and the deep-research rows of the mode-switching table (K19). Reworded: Role Definition (the two skills and the D5 sentence); the mid-entry rule (40) under D4; the mode combinations without their research-stage mode; the Stage 2.5 FAIL row of the fallback matrix (365), which keeps "never full-mode re-drafting; reference-level fixes are the most block-local edit class in the pipeline" and drops the half that names the left-out escalation checkpoint and patch sequencing; the Stage 4.5 FAIL row (367) under D3 and D5; the source's "Stage 5: revision" row as "Stage 4.5 correction round (`/paper revision` after a failed final check)", the correction round its row order places it in; "Collaboration with state_tracker_agent" as "Writing the run's state" (D6); the coaching executor and pointer. Added: "- Ethics check: [CLEARED/CONDITIONAL/BLOCKED]" in the MANDATORY checkpoint template (K16).
- `agents/state_tracker_agent.md`: K1, K2, K4, K5, K6, K15, K19. Removed: "Dialogue log references" and `collaboration_depth_history[]` (26 to 32), the observer row of Write Access Control (23), function 7 `append_observer_report` (400 to 415), the Stage 1 and Stage 5 blocks of the JSON (79 to 94, 214 to 228), `final_paper` and `collaboration_depth_history` of the JSON (294 to 305), the Stage 1 and Stage 5 rows of `check_prerequisites` and the dashboard. Added: the D6 paragraph under Role Definition; one line after the JSON on `pipeline_version`. Reworded: Write Access Control rows by role; the JSON's topic line, `entry_point` 2, `pipeline_version` as `"<metadata.version of SKILL.md>"` (the source's value `"2.6"` read from `metadata.version`, as `references/artifact_reproducibility_pattern.md` reads `ars_version`), and the schema-log transition "materials -> 2".
- `examples/full_pipeline_example.md`: K1, K2, K5, K13, K16, K19, K21. Removed: the Stage 1 Socratic section, its summary and deliverables and the Stage 1 to 2 transition; the format question and Stage 5; the slides and webpage lines; the LaTeX deliverable of Stage 4.5, the dashboard's "Final Paper (LaTeX)" and the final deliverable "LaTeX version" (K21). Added: the Stage 2.5 line of the configuration block, the Stage 2 to 2.5 transition, the Stage 2.5 scene and its checkpoint, the Integrity step of each progress bar, the minor-revision lines and the Phase A-F line of the Stage 4.5 scene, the dashboard's Stage 2.5 row and "Integrity Reports (Pre + Final)", the final deliverables "The final verified draft" and the two integrity reports.
- `examples/integrity_failure_recovery.md`: K1, K2, K5, K8, K13, K16. Reworded: the verification rows 1, 4, 6 and 7 and the replacement source to `lookup.py resolve`. Added: Phase F on the Stage 2.5 executing line, the section "Phase F: Ethics Check" (CLEARED) before the Verdict, the Round 2 row "Ethics Check (F)".
- `examples/mid_entry_example.md`: K1, K2, K5, K12, K13, K16, K19. Added: a Stage 2.5 PASS section and its checkpoint, with Phase F on its executing line, its result line and "ending with its ethics check" on its deliverable. Removed: Stage 5 and the cover letter line; Stage 4.5 takes Stage 5's place. Reworded: the Stage 4.5 executing line as "Phase A-F", with the ethics line of its result and "ending with its ethics check" on its deliverable.
- `references/ai_research_failure_modes.md`: K1, K4, K5, K7, K8, K19. Removed: the Status line, the Stage 6 section, the `source_verification_agent` row, the ROADMAP line. Reworded: Mode 2 detection (D1), the taxonomy pointer, Mode 7's return path.
- `references/claim_verification_protocol.md`: K1, K8, K10. Reworded: E2 (D1) and the Mode lines.
- `references/external_review_protocol.md`: K1, K4, K13. Added: the `/paper revision` sentence under Step 3.
- `references/integrity_review_protocol.md`: K1, K4, K10, K11, K12, K13, K16, K19. Added: the Phase F line in the scope of Stage 2.5 and of Stage 4.5.
- `references/mode_advisor.md`: K2, K5, K12, K19. Removed: the `deep-research` rows that hold nothing outside the research stage (5 quick-matrix rows, the misconceptions "Write me a paper on X" and "I need a systematic review", the `deep-research` capability row, the flowchart branches "I want to research/explore/investigate" and "I want the full treatment", the anti-pattern rows "Skipping research" and "Using fact-check mode") and the Stage 1 and Stage 5 entry rows. Reworded: the archetypes "Experienced researcher" (from Stage 2) and "Quick literature scan" (`/paper lit-review`). Kept with the part that does not need the research stage, the paper type and its `paper` mode: "Just give me a quick paper" (`/paper full`), "Graduate student (first paper)" (`/paper plan`, then `/researcher manuscript`), "Conference paper (short deadline)" (`/paper full`, conference type), "Thesis chapter" (`/paper full`), "Policy brief" (`/paper full`, policy_brief type); each rationale keeps the source's words that do not name research. Every other removed row was read for such a part and holds none.
- `references/pipeline_state_machine.md`: K1, K2, K3, K4, K11, K12, K13, K15, K19, K20. Removed: the Stage 1 and Stage 5 states and transitions, "Differences from v1.0" (now "Rules of the cycle"), the reset-boundary section.
- `references/plagiarism_detection_protocol.md`: K1, K2, K4, K5, K10. WebSearch kept (D21). The paragraphs no ruling touches are the source's words apart from K1 and K2.
- `references/progress_dashboard_template.md`, `references/reinforcement_content.md`, `templates/pipeline_status_template.md`: K1, K2, K5, K15, K19 (Stage 1, 5 and 6 rows).
- `references/reproducibility_audit.md`: K1, K5, K8, K15, K19.
- `references/score_trajectory_protocol.md`: K1, K4, K5, K7, K19. Removed: "Stage 6 reporting" (70 to 90).
- `references/team_collaboration_protocol.md`: K1, K2, K5, K6, K15, K19. Removed: the Stage 1 to 2 handoff section and the Stage 1 and 5 lines of Small Team.
- `references/two_stage_review_protocol.md`: K1, K2, K4, K5, K13.
- `agents/compliance_agent.md`: K1, K2, K4, K5, K6, K7, K19. Removed: `version` and `last_updated`, `shared/compliance_report.schema.json`, the harness-retirement comment, the `report_compiler_agent` Stage 6 bullet. Reworded: "per user CLAUDE.md: never haiku" as "`model: sonnet` or higher" (a private reference, `CLAUDE.md`).
- `references/compliance_checkpoint_protocol.md`: K1, K2, K4, K6, K7, K19. Removed: the harness-retirement comment, the "Boundary: non-pipeline invocation" paragraph (a standalone `academic-paper full` with RAISE, which `paper` does not run), the Stage 6 AI Self-Reflection clause, the `CONTRIBUTING.md` reference. Reworded: the enforcement-boundary note without the history of Schema 12 and legacy passports.
- `references/raise_framework.md`: K1, K4, K5, K7. Reworded: Role 2's self-declaration names `NOTICE.md` (the source named its CHANGELOG, which this repository has not); Role 3's self-declaration line removed (cross-model and a plan, K19).
- `references/prisma_trAIce_protocol.md`: K1, K4, K5, K7. Removed: the freshness-CI sentences and `scripts/check_prisma_trAIce_freshness.py` (16, 22, `update_policy`); "(Task 8)", "(Task 12)".
- `references/artifact_reproducibility_pattern.md`: K1, K3, K4, K6, K7, K19. Removed: `check_repro_lock.py` sentences, the `cross_model` block of the yaml (K19), the lint sentences, "Future evolution" v1.1 and v2.0 lines (K4), the line on existing passports. Reworded: `ars_version` "from CHANGELOG" as "from `metadata.version` in `SKILL.md`".
- `references/handoff_schemas.md`: K1, K2, K4, K5, K6, K7, K12, K18, K19, K20, K22, K23. Removed: Reset Boundary Extension, Literature Corpus Input Port, Audit Artifact Ledger, Run-level lineage signal, Claim-Faithfulness Audit Aggregates, the `change_block_ids` row of Schema 8, the deep-research producer lines, the legacy boundary of the experiment rows, the "v3.3.5 additions" changelog. Reworded: Validation rule 11 (D4); the sections `data_access_level` and `task_type`, which keep the source's subject ("The skill's `SKILL.md` declares `metadata.<field>`", "When adding a new skill ... the skill may legitimately consume") and drop only the CI sentences, the "All current ARS skills" sentence and the `ground_truth_isolation_pattern.md` pointer (K4, K7); the REV-007 example (K22); for K23 the `experiment_provenance` row's join sentence, the frozen-key sentence (rows reference the key space through their `experiment_id`), item 3 with the sentence on which claims the check reads and the mixed-evidence clause, and the invariants EP-INV-2 and EP-INV-3.
- `references/ethics.md`: K5, K6, K13, K15, K16. Reworded: line 3 as "The integrity agent reads this page to run the ethics check at both depths, in the check before the review and in the final check before delivery, as the last part of each integrity record"; the draft writer as `/paper revision`; `config.md` "Decisions" as the run's state in the run folder; `references/ai-disclosure.md` as the `paper` skill's `references/disclosure_mode_protocol.md` (2 places); `references/citation-compliance.md` and `references/integrity-verification.md` as the `paper` skill's `agents/citation_compliance_agent.md` and `agents/integrity_verification_agent.md`; `references/statements.md` as the `paper` skill's `references/funding_statement_guide.md` for the conflict statement, and removed for the responsible-use statement, which no page of `paper` holds.

## Added at the landing of step 1

- `references/ethics.md`, "Verdict and stop": one bullet added. An issue that Phase A to E of the same record already reports goes to the correction round of the integrity verdict, and the ethics check blocks for it only when it is still there after the correction rounds. Ruled by: D17 and D3, so the ethics check and the correction rounds agree.
- `examples/integrity_failure_recovery.md`, "Phase F: Ethics Check": the ethics check names the fabricated reference as the issue of Phase A. Ruled by: the same.

## Added at the landing of step 2: `SKILL.md` and the pages changed with it

Differences of `skills/academic/researcher/SKILL.md` from the source's `SKILL.md` (academic-pipeline 3.13.0), in the columns of `.scratch/13-researcher/deviations.md`.

| Source has | `researcher` has | Reason | Ruled by |
|---|---|---|---|
| frontmatter `last_updated`, `depends_on`, `status`, `data_access_level`, `task_type`, `related_skills` | `name`, `description`, `metadata.version: "1.0.0"`; the two values stated in `references/handoff_schemas.md` | the layout's frontmatter | forced: `docs/dev/skill-layout.md` Frontmatter; brief decisions 1 and 4 |
| title with a version, the "v2.0 Core Improvements" list, version notes, routing-discipline note | a title and one paragraph | no history; the layout's row 1 | forced: change standard, skill layout |
| Quick Start as three sample requests and `resume_from_passport` | five command lines with comments | the layout's Quick start; the reset boundary left out | Open item D; Open item A |
| Trigger Keywords, Non-Trigger Scenarios, Trigger Exclusions | the description's `Triggers on:` and the Use instead table with this repository's skills | the layout | forced: skill layout; brief item 1 |
| "Execution flow" list | Steps 1 to 6 and the mode subsections | the layout's Steps | forced: skill layout |
| 10 stages, with Stage 1, 5 and 6 | Stages 2, 2.5, 3, 4, 3', 4', 4.5 | the parts the goal names | D16; ADR 0052 |
| Stage 2 in plan or full mode, Stage 3 full | `/paper full`, `/paper-review-panel full`, `/paper revision`, `/paper-review-panel re-review`, fixed | the runs of the stages | D5 |
| Step 2 mode recommendation by user type (socratic, plan, guided, quick) and the quality standard "Mode recommendation" | Steps 5: the fixed runs shown with the differences between depths and runs explained, and the user's adjustments within those runs | D5 fixes the runs, so the recommendation can only explain them | D5 |
| the parallelization note on Stage 2 | left out | it describes the phases inside `paper`'s full mode, which `/paper full` runs with its own rules | D5 |
| Step 1 detection: no materials to Stage 1, revised draft to Stage 3', final draft to Stage 5, verified paper to Stage 3 | the five command lines; a draft of any kind enters at Stage 2.5; a call matching no line is the stop "The entry point" | Stage 1 and 5 left out; Stage 2.5 never skipped | D4, D16, Open item D |
| Mid-entry exception: a previous integrity report with unmodified content skips Stage 2.5 | a prior report informs the first check and never replaces it | D4 | D4 |
| the orchestrator and the state tracker as agents dispatched | the session holds both roles and starts no agent for them | only the session can invoke a skill through the Skill tool, and it writes the state | D5, D6; brief decision 2 |
| the run's state in the Material Passport only | `state.json`, each integrity record, each compliance report and each correction list as files of `researcher-runs/<mode>-<date>/` | D6 | D6; brief decision 5 |
| integrity corrections dispatched to academic-paper | the issue list written to `corrections-<stage>-<n>.md` and given to `/paper revision` as its comments | D5 | D5 |
| the compliance override's disclosure addendum injected by the orchestrator | the addendum goes to `/paper revision` as its comment | every change to the manuscript goes through `paper` | D5; brief decision 6 |
| Stage 4.5 FAIL: "fix and re-verify" with no count in the state machine list | at most 3 correction rounds, then the user decides | D3 | D3 |
| "Integrity Review Protocol: 5 phases" | the integrity agent's six phases, the ethics check Phase F last, at both depths | D17 | D17 |
| references checked by the agent's own lookups | `lookup.py resolve`, confirmed at a ratio of 0.70 or above with no `DOI_MISMATCH`; a judged claim on a passage read in the run, checked with `lookup.py quote-check`; the web originality screen at both depths | D1, D14, D21 | D1, D14, D21; ADR 0024 |
| no record of the experiments step | Steps 4: the record read from the project, or asked once and built with the user | D31 | D31 |
| no null-result rule | Rules: no correction or record asks that a recorded null result be written in; a claim contradicting `negative_results[]` is a FAIL | D20 | D20 |
| no wording rule | Rules: the corrections and record text that reach the manuscript hold no software wording | D24 | D24; ADR 0026 |
| Anti-pattern 7, inflating Collaboration Quality scores | left out | the collaboration observer and Stage 6 are left out | D16 |
| Anti-pattern 8: overrides "recorded for Stage 6"; the IRON RULE's Stage 6 failure-mode audit log | overrides recorded with the user's reasons in `state.json` | Stage 6 left out | D16, D6 |
| Adaptive rule 5 and the MANDATORY checkpoint "Stage 5" | left out | Stage 5 left out | D16 |
| Budget transparency: the cross-model toggle in the estimate; confirmation "before Stage 1" | estimate from length and mode; confirmation before the first stage | the cross-model check and Stage 1 left out | D16 |
| Error Recovery rows Stage 1 and Stage 2 "missing research foundation" | left out | they send the user to Stage 1 | D16 |
| Error Recovery row "Any: skill execution failure: retry, pause or mode switch" | the row "A run that fails": retry or pause | a mode switch leaves D5's runs | D5 |
| Phase-by-phase Invocation Contract (Mode A, Mode B, phase buckets, `ARS_PASSPORT_RESET`) | left out; the session runs the stages end to end (Mode A's content in Rules) | Mode B rests on the reset boundary | Open item A |
| Stage 6, Collaboration Depth Observer, claim audit, cross-model check | left out | D16 | D16 |
| Agent File References, Reference Files, Templates, Examples tables | "What it reads" 9 to 14, each page named at the step that reads it | the layout's "What it reads" and pointer rules | forced: skill layout; Open item B |
| Integration with Other Skills, Related Skills (deep-research, academic-paper, academic-paper-reviewer, Stage 5 formatting steps) | Use instead, Rules on the four runs, and the refusals "A skill not installed" and "lookup.py not found" | names of this repository; Stage 5 left out | Open item B, D5, D16 |
| Version Info, Changelog | `metadata.version` only | no history | forced: change standard |
| the reinforcement template with an emoji, a box arrow and an em dash | the same template in ASCII (`->`, `-`), in a code block | ASCII | forced: prose standard |
| the decision dashboard block with box-drawing rules | pointed at in `agents/pipeline_orchestrator_agent.md`, "FULL Checkpoint Template (with Decision Dashboard)", where the copied page holds it in ASCII | one meaning in one place | forced: skill layout "Where a rule goes" |
| Checkpoint Types and Adaptive Rules 1, 3, 4, 6 written in `SKILL.md` | pointed at in `agents/pipeline_orchestrator_agent.md`, "3. Checkpoint Management", which states them; Checkpoint Rules 1 to 5 and the self-check questions written out in `references/checkpoints.md` | a rule a copied page states in full is pointed at | forced: skill layout "Writing for an agent"; brief item 2 |

### Map of the source's headings

| Source heading | Where its matter stands now |
|---|---|
| Quick Start | `## Quick start`; the sample requests become command lines; `resume_from_passport` left out (Open item A) |
| Trigger Conditions | the description's `Triggers on:`; `## Use instead` |
| Trigger Keywords | `Triggers on:` (academic pipeline, full paper workflow, take my draft through review and revision; the research-only phrases left out with Stage 1) |
| Non-Trigger Scenarios | `## Use instead` rows (`paper lit-review`, `paper`, `paper-review-panel`, `paper citation-check`, `paper format-convert`) |
| Trigger Exclusions | `## Use instead` (a run of a mode already under way; a single function) and Steps 1, last bullet but one |
| Pipeline Stages (10 Stages) | the title paragraph; `### manuscript` items 3 to 9; Stage 1, 5, 6 left out (D16) |
| Pipeline State Machine | `### manuscript` item 1, pointing at `references/pipeline_state_machine.md`; the branches in items 5 and 7 and the Stops rows |
| Adaptive Checkpoint System | `references/checkpoints.md` |
| Checkpoint Types | `references/checkpoints.md`, lead, pointing at `agents/pipeline_orchestrator_agent.md`, "3. Checkpoint Management" |
| Decision Dashboard | `references/checkpoints.md`, "A FULL checkpoint shows the decision dashboard" |
| Adaptive Rules | `references/checkpoints.md` bullets 1, 6, 7 and the page's "Checkpoint Type Rules"; rule 5 left out (Stage 5) |
| Checkpoint Rules | `references/checkpoints.md` bullets 2 to 5 and 8 |
| Self-Check Questions | `references/checkpoints.md`, the numbered list |
| Agent Team (5 Agents) | Rules bullets 1 to 3; "What it reads" 9 and 10; the collaboration agent and the claim audit agent left out (D16) |
| Orchestrator Workflow | Steps 1 to 6 and `### manuscript` |
| Step 1: INTAKE & DETECTION | Steps 1 |
| Step 2: MODE RECOMMENDATION | Steps 5, bullets 1 and 2 (D5) |
| Step 3: STAGE EXECUTION | `### manuscript` items 2 to 9 and Rules on the Skill tool |
| Step 4: TRANSITION | `### manuscript` item 2, pointing at the page's "4. Transition Management" handoff table |
| Mid-Conversation Reinforcement Protocol | `### manuscript` item 2 and its template; `references/reinforcement_content.md` |
| Phase-by-phase Invocation Contract | left out (Open item A); Mode A's content in Rules bullets 1 to 3 |
| Integrity Review Protocol | `references/integrity_check.md`; "What it reads" 11 |
| Two-Stage Review Protocol | `### manuscript` items 5 and 7, pointing at `references/two_stage_review_protocol.md` |
| Mid-Entry Protocol | Steps 1 and Steps 5, bullet 3 (D4) |
| External Review Protocol | `### manuscript` items 6 and 7, pointing at `references/external_review_protocol.md`; Stops "The parsed comments" |
| Progress Dashboard | `references/checkpoints.md`, the "status" bullet; `### manuscript` item 10 |
| Revision Loop Management | Rules (the cap, Stage 4' once, the override of `paper`'s cap); `### manuscript` items 6 and 8 (history, Acknowledged Limitations), item 10 (cumulative history) |
| Early-Stopping Criterion | `### manuscript` item 7; Stops "The early-stopping suggestion" |
| Budget Transparency | Steps 5, bullets 4 to 6; `references/checkpoints.md`, the round-trip bullets |
| Reproducibility | Rules (same input, versioned artifacts); `### manuscript` item 10 (audit trail) |
| Stage 6: Process Summary Protocol | left out (D16) |
| Collaboration Depth Observer | left out (D16) |
| Anti-Patterns | `## Anti-patterns`, rows 1 to 6 and 7 (the source's 8); the source's 7 left out (D16); row 8 added for D5 |
| Quality Standards | Steps 1 (stage detection), Steps 5 (mode recommendation), `### manuscript` item 2 (handoff), Steps 3 and item 2 (state), `references/checkpoints.md` (mandatory checkpoint), `references/integrity_check.md` (mandatory checks and checklist), Anti-patterns row 2 (no overstepping), Rules (no forcing, reproducible), item 7 (convergence), Steps 5 (budget) |
| Error Recovery | Stops rows "The entry point", "The third correction round failed", "The review decision", "An incomplete revision", "The re-review decision", item 8 (Acknowledged Limitations), `references/integrity_check.md` item 5, Steps 2 and `references/checkpoints.md` (pause and resume), "A run that fails"; the Stage 1 and 2 rows left out (D16) |
| Agent File References | "What it reads" 9 and 10 |
| Reference Files | "What it reads" 11 to 13, each page named at its step |
| Templates | "What it reads" 13; `references/checkpoints.md` (`templates/pipeline_status_template.md`) |
| Examples | "What it reads" 14; `### manuscript` item 1 |
| Output Language | Rules, last bullet |
| Integration with Other Skills | Rules on the four runs; "What it reads" 5 to 7; Stage 1 and 5 parts left out (D16) |
| Related Skills | `## Use instead`; "What it reads" 5 to 7 |
| Version Info | `metadata.version` |
| Changelog | left out (no history) |

### Added in repair round 1 of step 2


| Source has | `researcher` has | Reason | Ruled by |
|---|---|---|---|
| the Material Passport attached to each artifact by the orchestrator agent | `material-passport.yaml` in the run folder, written by the session at the start, the entry, each stage's end and each compliance report | the session holds the orchestrator's role and writes the run's records | D6; round 1 ruling 1 |
| a compliance override's addendum auto-injected into the manuscript | the compliance agent started again with the override, its addendum written to a file and given to `/paper revision` | every change goes through `paper` | D5; brief decision 6; round 1 ruling 2 |
| the external review's Stage 3' run by the reviewer in re-review mode with adjustments | the session's own completeness check of "Step 4", no re-review invoked, with a MANDATORY checkpoint | that step reassesses no quality and issues no decision | round 1 ruling 4 |
| SKILL.md Checkpoint Rule 5: a FULL checkpoint after 4 or more continues | SLIM with the awareness prompt, as the orchestrator page gives it | `SKILL.md` holds checkpoints as that page gives them | round 1 ruling 7 |
| a confirmed failure-mode flag and a compliance backfill return to Stage 2 | the fix or the material goes to `/paper revision` and the check or the compliance agent runs again | every change goes through `paper`; Stage 2 is not re-run | D5; round 1 ruling 8 |
| the minor items of a Minor decision at Stage 3' handled in the finalizing stage | one `/paper revision` run for those items before Stage 4.5 | the finalizing stage is left out | D16; round 1 ruling 12 |
| (`paper-review-panel`) re-review without dimension scores | the editorial synthesizer's 7 dimension scores and Weighted Average in the Verification Review Report | the deltas of Stage 3' need them | Open item E, option (a); round 1 ruling 13 |
| (`paper-review-panel`) an Editorial Decision without dimension scores | the editorial synthesizer's 7 dimension scores and Weighted Average in the Editorial Decision of the full mode | the deltas of Stage 3' need a baseline scored by the same role | Open item F, option (a); round 1 ruling 14 |

### Added at the landing of step 2

- `paper-review-panel`, the Editorial Decision's scores: ruling 14 named the scoring matrix of the sprint contract as their source; that matrix holds block, warn or pass values, so the scores rest on seven score rows added to the Reviewer Summary Matrix, and on the reviewers' reports where those rows are empty (Open item F, C148).
- `agents/state_tracker_agent.md`: the key `score_trajectory`, which the source's state structure does not have (Open item E).
- `references/pipeline_state_machine.md` and `references/two_stage_review_protocol.md`: a Minor decision at Stage 3' goes to one `/paper revision` run before Stage 4.5; the source handles the minor items in its finalizing stage, which is left out (D16).

## Added at the landing of step 3

- `SKILL.md` gains the modes `novelty` and `idea`, which are this repository's own and copy nothing of academic-pipeline (ADR 0054, Consequences); their subsections `### novelty` and `### idea`, their Quick start lines, their rows of Use instead, Stops and Anti-patterns, and their items of "What it reads" have no counterpart in the source.
- `references/novelty_page.md` is new, the form of a novelty page, with a made-up example; it has no counterpart in the source.
- The sections "The integrity check" and "Checkpoints" of `SKILL.md` moved to `references/integrity_check.md` and `references/checkpoints.md`, word for word apart from the heading level and an opening paragraph that says which modes read each, since `docs/dev/skill-layout.md` lets a reference section of `SKILL.md` hold only material every run reads, and a run of `novelty` or `idea` reads neither. Every row above that pointed at those sections now names the page.
- `references/integrity_check.md` item 4 gains one bullet: each of its stops, and the stop "The third correction round failed" of item 6, is held as a checkpoint as `references/checkpoints.md` gives it, so that an `integrity` run reads the checkpoint rules it read when they were a section of `SKILL.md`.
- `references/compliance_checkpoint_protocol.md` line 10 names `references/integrity_check.md` in place of the section "The integrity check" of `SKILL.md`.
- The landed text of `SKILL.md` that the two modes made false was scoped to `integrity` and `manuscript`: the description, the title and its paragraph, "What it reads" 1, 3, 5, 6, 9 and 13, Steps 1 and 6 and the sentence on which items run in which mode, the Stops intro's count of refusals, the Rules bullets on the agents a run starts, on following the same stages in every session and on the Material Passport, and the Anti-patterns row on skipping an integrity check. No stage, check or stop of the two landed modes changed.

## Added at the landing of step 4

- `SKILL.md` gains the modes `research`, `research adopt` and `full`, which are this repository's own and copy nothing of academic-pipeline (ADR 0053, Consequences); with them six new pages, `references/research_stages.md`, `references/research_brief.md`, `references/project_layout.md`, `references/slurm.md`, `agents/research_builder_agent.md` and `agents/research_reviewer_agent.md`, none with a counterpart in the source.
- The landed text of `SKILL.md` that the new modes made false was changed: the description, the title and its paragraph, the Quick start, Use instead, "What it reads" 1, 3, 5, 6, 7, 15 and the new 20 to 24, the Steps intro, Steps 1, 2, 3 and 6, "manuscript" item 4, the Stops intro and table, Anti-patterns and Rules.
- `state.json` of a run gains the key `manuscript_folder`, which the structure of `agents/state_tracker_agent.md` does not have; the copied page is unchanged, and Steps 2 offers an unfinished run only of the same manuscript's folder.
- No line of a copied page changed.


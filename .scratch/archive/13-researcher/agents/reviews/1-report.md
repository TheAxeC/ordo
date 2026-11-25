Everything in the brief is done, with the eleven rulings of repair round 1 (`.scratch/13-researcher/agents/briefs/1-round-1.md`) applied.

# Report: step 1, the copied pages of academic-pipeline under `skills/academic/researcher/`, with the notice

## Open items of the state file, verbatim

`.scratch/13-researcher/orchestrator-state.md`, "Open items":

```
- none.
```

## The cases' first run

The first run was a reading of the unchanged tree at the worktree's base cc3965a (`git log --oneline -1` prints `cc3965a Prepare step 1 of roadmap entry 13 ...`). `git ls-tree -r cc3965a --name-only -- skills/academic/researcher NOTICE.md | wc -l` printed `0`: neither the folder nor `NOTICE.md` exists at the base, so every case read "the file does not exist":

- `agents/integrity_verification_agent.md`, how a reference is verified: the file does not exist.
- The same page, the two depths: the file does not exist.
- Every copied page that states what follows a failed final check: no copied page exists.
- Every copied page that states a midway entry: no copied page exists.
- Every copied page, the left-out parts, and the four runs of D5 in the orchestrator page and the state machine: no copied page exists.
- The integrity agent's check on negative results and limitations: the file does not exist.
- The integrity agent and `references/ethics.md` (D17): neither file exists.
- `agents/state_tracker_agent.md` and `references/pipeline_state_machine.md` (D6): neither file exists.
- The integrity agent's rule on its corrections and records (D24): the file does not exist.
- Where the record of the experiments is read (D31): the file does not exist.
- `grep -rn 'scripts/\|shared/\|docs/design' skills/academic/researcher`: the folder does not exist.
- `grep -rniE 'claim_ref|...|/Users/' skills/academic/researcher`: the folder does not exist.
- `grep -rnE 'v[0-9]+\.[0-9]+' skills/academic/researcher`: the folder does not exist.
- A paragraph of `references/plagiarism_detection_protocol.md` that no ruling touches: the file does not exist.
- `NOTICE.md`: the file does not exist.

No case was one the brief's rules get wrong.

The cases on the built tree, read after the change:

- Reference verification: the integrity agent's A0 and A1 run `lookup.py resolve`, read as D14 (a record with a ratio of 0.70 or above and no `DOI_MISMATCH`), A2 reads the `Crossref notice:` lines, and no web search checks a reference's existence. Met.
- Two depths: "Mode 1" is run "alone as `/researcher integrity pre-review`" with the sampled depth; "Mode 2" is run "alone as `/researcher integrity`, which gives this full depth by default". Met.
- Failed final check: `grep -rn -i '3 rounds\|3 correction rounds\|max 3' skills/academic/researcher` prints `references/pipeline_state_machine.md` 120, 147, 160, 226; `references/integrity_review_protocol.md` 22, 44; `agents/integrity_verification_agent.md` 53, 516, 547, 548; `agents/pipeline_orchestrator_agent.md` 235, 279, 378; `examples/integrity_failure_recovery.md` 395. Each gives 3 rounds and then the user's decision. Met.
- Midway entry: the state machine (142, 143), `references/integrity_review_protocol.md` (5), `references/mode_advisor.md` (96), `references/handoff_schemas.md` (707), the orchestrator page ("Mid-Entry Material Passport Check", Rules) and `examples/mid_entry_example.md` (its Stage 2.5 PASS section) each run Stage 2.5 on a paper that enters midway. Met.
- Left-out parts: the second grep case prints nothing (below). The orchestrator page and the state machine (136 to 143) name `/paper full`, `/paper-review-panel full`, `/paper revision` and `/paper-review-panel re-review` as Skill-tool runs. Met.
- Negative results (D20): `grep -rn -i 'null result\|negative result\|negative_results' skills/academic/researcher` prints the record's `negative_results[]` field (`references/handoff_schemas.md` 502, 550), the integrity agent's well-formedness rule (306), the check-3 verdict on a claim that contradicts an entry (329, 334) and the Mode 1 rule that such a claim is always checked (499). No rule puts a negative result into the manuscript's prose. Met.
- Ethics (D17, ruling 1): the integrity agent's "Phase F: Ethics Check" reads `references/ethics.md` "at both depths: in Mode 1 and in Mode 2"; both mode lines end with Phase F; the Output Format ends with "## Ethics check". `references/ethics.md` line 3 says the check runs at both depths. Met.
- State (D6): `agents/state_tracker_agent.md` line 12 and `references/pipeline_state_machine.md` line 30 put the state in `researcher-runs/<mode>-<date>/`, written by the session. Met.
- D24: the integrity agent's "Wording of corrections and records" holds the ruling's words. Met.
- D31: the integrity agent's C4 reads the record from the project and builds it once with the user when the project did not go through `research`; `references/handoff_schemas.md` "Experiment Provenance Intake" says the same. Met.
- The three grep cases and `NOTICE.md`: below.

The cases of repair round 1, read after the change:

- Each page that states what the check before the review runs ends with the ethics check: `grep -rn -i 'ethics' skills/academic/researcher` shows Phase F in the integrity agent's Mode 1 line (496) and Mode 2 line (508), in both scopes of `references/integrity_review_protocol.md` (17, 39), in the orchestrator's MANDATORY checkpoint template ("- Ethics check: [CLEARED/CONDITIONAL/BLOCKED]", 180), and in the Stage 2.5 runs of `examples/integrity_failure_recovery.md` (60, the section "Phase F: Ethics Check" at 138, and the Round 2 table row "Ethics Check (F)"), `examples/mid_entry_example.md` (80, 92, 98) and `examples/full_pipeline_example.md` (123, 135, 141), and in the Stage 4.5 runs of the two last (376, 380, 384 and 341, 345, 349). Met.
- The full example goes Stage 2, 2.5, 3 and on to 4.5: `grep -n '^###\|Progress:' examples/full_pipeline_example.md` reads, in order, Stage 2, "Stage 2 to 2.5 Transition", "Stage 2.5: INTEGRITY", "Stage 2.5 Checkpoint", Stage 3, "Stage 3 to 4", Stage 4, "Stage 4 to 3'", Stage 3', "Stage 3' to 4.5", "Minor Revision and Stage 4.5", "Pipeline Complete"; each progress bar has the Integrity step. Each transition is a row of the state machine's transition table (145 to 147, and the `Stage 3'` to 4.5 row on Accept or Minor). Met.
- `grep -rn 'planned_experiment_ids\|ref:slug' skills/academic/researcher`: printed nothing, exit status 1. Met.
- A manuscript sentence that states an effect the record lists as a null result: at Mode 2 every experiment-backed claim is checked (integrity agent 513) and check (3)(b) gives NOT_SUPPORTED_BY_PROVENANCE, a FAIL. At Mode 1 the 30% sample alone could miss it; line 499 now says "A claim that touches an entry's `negative_results[]` is always checked, outside the sample". FAIL at both depths. Met, with the judgment call below.
- `grep -rn -i 'null result' skills/academic/researcher/references/handoff_schemas.md`: printed nothing, exit status 1. Met.
- Every case and check of the brief: the readings above and the table below.

## DONE / NOT DONE

| Item | State | Evidence |
|---|---|---|
| 1. The 20 copied files | DONE | `diff -rq` below lists each as differing from its source |
| 2. The six documents | DONE | `diff -rq` lists each as only in the copy |
| 3. Forced differences | DONE | the character-set checks and the arrow and dash reading below |
| 4. The rulings | DONE | the cases above |
| 5. Hand-backs | DONE | none remain; the two of the first build are ruled (rulings 2 and 10) and applied |
| 6. `NOTICE.md` | DONE | read below |
| 7. `README.md` line 263 | DONE | `git diff README.md` below |
| 8. Deviations | DONE | the section below |
| Round 1, rulings 1 to 11 | DONE | the round's cases above and the Deviations rows K16, K21 to K25 |

Character-set check, the brief's command over the 27 files of the folder, `NOTICE.md` and `README.md` (the list given to `xargs -0` by `{ find skills/academic/researcher -type f; echo NOTICE.md; echo README.md; } | sort | tr '\n' '\0'`): printed nothing; `echo "perl exit=$?"` printed `perl exit=0`.

`LC_ALL=C grep -rn '[^ -~]' skills/academic/researcher NOTICE.md`: printed nothing, exit status 1.

`find skills/academic/researcher -type f | wc -l`: printed `27`.

`grep -rn 'scripts/\|shared/\|docs/design' skills/academic/researcher`: printed nothing, exit status 1.

`grep -rniE 'claim_ref|collaboration_depth|literature_corpus|ARS_PASSPORT|ARS_CROSS_MODEL|cross.model|process.summary|academic-pipeline|academic-paper|deep-research|research-hub|/Users/' skills/academic/researcher`: printed nothing, exit status 1.

`grep -rnE 'v[0-9]+\.[0-9]+' skills/academic/researcher` printed six lines, none a version marker:

```
skills/academic/researcher/references/handoff_schemas.md:490:| `version_label` | string | Version identifier (e.g., `v1.0`, `v1.1-revised`, `paper_draft_v2`) |
skills/academic/researcher/references/team_collaboration_protocol.md:101:| `v0.1-draft` | After Stage 2 completion | First complete draft |
skills/academic/researcher/references/team_collaboration_protocol.md:102:| `v0.2-post-integrity` | After Stage 2.5 PASS | Draft verified for integrity |
skills/academic/researcher/references/team_collaboration_protocol.md:103:| `v0.3-post-review` | After Stage 4 completion | First revision complete |
skills/academic/researcher/references/team_collaboration_protocol.md:104:| `v0.4-post-rereview` | After Stage 4' completion (if applicable) | Second revision complete |
skills/academic/researcher/references/team_collaboration_protocol.md:105:| `v1.0-final` | After Stage 4.5 PASS | Final manuscript |
```

The first is an example value of a material's `version_label` field; the other five are the git tags a team puts on its manuscript's drafts. `schema_version: "1.0"` does not match the pattern; it is the lock's schema version, a field value.

Arrows and dashes outside code: a read-only `awk` listing of lines outside fenced blocks that hold `->`, ` -- `, a spaced hyphen between words or `| -- |` printed 12 lines, all `| -- |` and `| Status | -- |` empty-cell markers of `examples/integrity_failure_recovery.md` tables (79, 94, 110, 219 to 284), the same bytes as the source. A second `awk` reading for a prose line outside code followed by a line that starts lowercase printed only frontmatter lines: no hard-wrapped paragraph outside code.

`git diff README.md`:

```
-MIT. See `LICENSE`.
+MIT, see `LICENSE`, except the parts `NOTICE.md` names, which are under CC BY-NC 4.0.
```

`NOTICE.md` (12 lines) names `paper`, `paper-review-panel` and the `integrity` and `manuscript` parts of `researcher` as adapted from Academic Research Skills by Cheng-I Wu with the repository URL; the line `Copyright (c) 2026 Cheng-I Wu`, line 1 of the saved `LICENSE`; that they were modified; CC BY-NC 4.0 with its URL, and that its disclaimer of warranties and limitation of liability apply; the rest under the MIT licence of `LICENSE`. It names nothing private.

`git status --short` prints ` M README.md`, `?? NOTICE.md`, `?? skills/academic/researcher/`, and under `.scratch/13-researcher/agents/` the round's brief `briefs/1-round-1.md`, the reviewer's `reviews/1-refuter.md` and this report.

## Terms

- "orchestrator": the glossary's entry is the session that runs a plan. In the copies "the orchestrator" is the pipeline orchestrator's role, kept from the source and, under D10, held by the session; this is the source's sense, not the plan term.
- "session, the": used in the sentences of D6 and D17 ("the session writes the state"); matches the entry, the Claude Code session that runs a skill.
- "intake agent" (`examples/full_pipeline_example.md`) and "plan mode" (`/paper plan` there): match their entries.
- "verdict": the integrity verdict of the source (PASS, PASS WITH NOTES, FAIL), not the plan term of a reviewer's verdict; kept from the source.

## Files with line counts (copy beside source)

| File | Source | Copy | `diff` lines |
|---|---|---|---|
| agents/integrity_verification_agent.md | 690 | 662 | 540 |
| agents/pipeline_orchestrator_agent.md | 981 | 434 | 851 |
| agents/state_tracker_agent.md | 518 | 447 | 225 |
| examples/full_pipeline_example.md | 478 | 420 | 378 |
| examples/integrity_failure_recovery.md | 389 | 399 | 208 |
| examples/mid_entry_example.md | 402 | 444 | 200 |
| references/ai_research_failure_modes.md | 185 | 173 | 130 |
| references/claim_verification_protocol.md | 60 | 60 | 10 |
| references/external_review_protocol.md | 131 | 133 | 15 |
| references/integrity_review_protocol.md | 49 | 52 | 49 |
| references/mode_advisor.md | 135 | 110 | 124 |
| references/pipeline_state_machine.md | 307 | 266 | 324 |
| references/plagiarism_detection_protocol.md | 239 | 239 | 56 |
| references/progress_dashboard_template.md | 38 | 35 | 17 |
| references/reinforcement_content.md | 15 | 12 | 17 |
| references/reproducibility_audit.md | 54 | 47 | 43 |
| references/score_trajectory_protocol.md | 96 | 71 | 70 |
| references/team_collaboration_protocol.md | 261 | 248 | 79 |
| references/two_stage_review_protocol.md | 27 | 28 | 34 |
| templates/pipeline_status_template.md | 146 | 138 | 27 |
| agents/compliance_agent.md (shared/agents/) | 136 | 130 | 95 |
| references/handoff_schemas.md (shared/) | 899 | 727 | 510 |
| references/compliance_checkpoint_protocol.md (shared/) | 134 | 123 | 76 |
| references/raise_framework.md (shared/) | 129 | 127 | 135 |
| references/prisma_trAIce_protocol.md (shared/) | 157 | 157 | 200 |
| references/artifact_reproducibility_pattern.md (shared/) | 173 | 104 | 174 |
| references/ethics.md (git show f9a00ab) | 145 | 145 | 32 |

`diff -rq /Users/axelfaes/workspace/research-hub/.agents/skills/academic-pipeline skills/academic/researcher` lists as only in the source `SKILL.md`, `agents/claim_ref_alignment_audit_agent.md`, `agents/collaboration_depth_agent.md`, `references/adapters`, `references/changelog.md`, `references/claim_audit_calibration_protocol.md`, `references/literature_corpus_consumers.md`, `references/passport_as_reset_boundary.md` and `references/process_summary_protocol.md`; as only in the copy the six documents and `references/ethics.md`; the 20 copied files as differing. `diff -r` of the two folders printed 3462 lines. The `diff` lines of the six documents and of `ethics.md` are in the table.

Line counts shrink where a paragraph hard-wrapped in the source is one line in the copy and where a left-out part is removed, and grow where a ruling adds a section: the Stage 2.5 sections of the two examples, the Phase F section of the recovery example.

## Deviations

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

## Judgment calls

- Code blocks are changed only for characters outside ASCII and for the rulings (the left-out stages, the Skill-tool names, the lookups, Phase F, the claim selection). `->` inside code is kept.
- The user's own mode choices in the examples are kept (quick at Stage 3 and full at Stage 3' in `mid_entry_example.md`; plan then full at Stage 2 in `full_pipeline_example.md`), while the pages that state defaults name D5's modes.
- "Total Stages" in `references/reproducibility_audit.md` became [X/7].
- `snapshot_date` and `upstream_version` stay in the RAISE and PRISMA-trAIce frontmatter: they identify the external document, not this skill's history.
- Issue numbers such as "#260" are treated as history.
- `--` empty cells of `check_prerequisites` became "None"; the `--` empty cells of copied tables that the source writes so are kept.
- In the integrity agent the case study's "never WebSearched" and "This project's own paper" are kept as the source's description of its case.
- The Stage 2.5 FAIL row of the orchestrator's fallback matrix opens with "the integrity issues become revision requirements" in place of the source's "return to Stage 2 with integrity issues as revision requirements": the copy's state machine (147) and `references/integrity_review_protocol.md` route a failed Stage 2.5 to a correction round by `/paper revision` and a re-run of Stage 2.5, not to Stage 2, and the source's words would make the two pages disagree.
- Mode 1 checks every claim that touches an entry's `negative_results[]` outside its 30% sample (K24), so that a sentence stating an effect the record lists as null fails at both depths, as the round's case asks.
- The alignment row keeps `scoped_manifest_id` and `claim_id` (K25), taken from the `paper` draft writer's `intended-claims.md` when the run folder has one, since that manifest exists in `paper` (`skills/academic/paper/agents/draft_writer_agent.md`, "Claim Intent Manifest Emission", `manifest_id` and `claim_id`); otherwise `null` and an id the agent gives.
- D7 condition 4 keeps one signal, a manuscript sentence that reports a first-person experimental outcome and cites no source for it; the source's manifest signal and the "no marker" test are replaced by "cites no source", which is what the marker stood for.
- The full example's Stage 4.5 scene names the two suggested modifications of its Stage 3' (S1, S2) as the items of the minor revision, as the mid-entry example names its six.
- The ethics result in the three examples is CLEARED with dual-use level None, made up, in the record form `references/ethics.md` gives.
- Sentences of my own wording above about 20 words, each one rule with its conditions: the state tracker's D6 paragraph, the integrity agent's lookup paragraph, its C4 paragraph on the record (D31), its C4 sentence on how claims are picked, its Mode 1 sentence on negative results and its row-field sentence, its "Wording of corrections and records" (the words of D24), the orchestrator's D5 paragraph and its Stage 2.5 and 4.5 fallback rows, the reworded lines of `references/ethics.md` and of `references/handoff_schemas.md` item 3.

## Host- or user-visible changes

- `README.md` line 263: before `MIT. See \`LICENSE\`.`, after `MIT, see \`LICENSE\`, except the parts \`NOTICE.md\` names, which are under CC BY-NC 4.0.`
- `NOTICE.md`: before, no file; after, the notice of item 6.
- `skills/academic/researcher/`: before, no folder; after, 27 files and no `SKILL.md`, so no skill is installed until step 2.

## Wrong or impossible in the brief

- "What is on the tree" names the base as main at 827dda2; the worktree's head is cc3965a (`git log --oneline -1`), the preparation commit after it.

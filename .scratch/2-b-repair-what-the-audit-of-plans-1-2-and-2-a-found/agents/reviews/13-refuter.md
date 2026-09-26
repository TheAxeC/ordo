# Step 13 refuter report (on .agents/worktrees/2b-13, base 85c035d)

## Verification (rerun by the reviewer)

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md
  -> exit 0; 11 PASS: lines; 10 ok: lines (ok: skills/<name>/SKILL.md); verify: 13 commands passed
python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
  -> ok: docs/academic-coverage.md, exit 0
git diff 85c035d --stat
  -> docs/academic-coverage.md | 10 +++++-----  (only tracked change; 13-rows.md and 13-report.md untracked)
diff <(git show 85c035d:docs/academic-coverage.md) docs/academic-coverage.md | grep '^[0-9]'
  -> 151,153c151,153 / 155c155 / 171c171; wc -l 237 before and after
diff <(cat /Users/axelfaes/workspace/ordo/docs/academic-coverage.md) docs/academic-coverage.md | grep '^[0-9]'   (report's command)
  -> 151,153c151,153 / 155c155 / 171c171
find /Users/axelfaes/workspace/research-hub/.agents/skills/academic-pipeline -type f | wc -l
  -> 30
grep -c '^| `' .scratch/.../agents/reviews/13-rows.md   (report's Verify 3)
  -> 30
report's Verify 4 largest-sentence command, run exactly as quoted
  -> 35
$TMPDIR/refute-2b-13/check.py (reviewer's own: records, changed rows, split on every . ! ?, destinations)
  -> files 30, section rows 30, set equal True
  -> records 30, unique 30, dups [], missing set(), extra set(), order True
  -> changed = fixed = [SKILL.md, agents/pipeline_orchestrator_agent.md, agents/state_tracker_agent.md, agents/claim_ref_alignment_audit_agent.md, references/pipeline_state_machine.md]; verdicts holds 25, fixed 5
  -> largest sentence split on every . ! ?: 35 (references/ai_research_failure_modes.md, unchanged row); base largest 35; over35 []
  -> destinations lost per changed row: none (the only "lost" token, "entry and" in SKILL.md, is the word "entry" meaning entry stage, not a roadmap entry)
  -> non-ASCII lines in 147-181: none
python3 .agents/step13/cases.py   (builder's cases)
  -> case 1 ok; case 2 30/30, no duplicates; case 3 5 changed, mismatches none; case 4 35, none over 35; case 5 lost none for all 5; exit 0
sed -n '147,181p' docs/academic-coverage.md | grep -c 'can come later'
  -> 0
grep -c '| rebuild later: ' docs/academic-coverage.md
  -> 18 (unchanged; entry 15.A's count 8/6/3/1 still holds)
```

## 1. Spec

Source files read in full: the 5 changed rows (SKILL.md 1-623, agents/pipeline_orchestrator_agent.md 1-981, agents/state_tracker_agent.md 1-518, agents/claim_ref_alignment_audit_agent.md 1-380, references/pipeline_state_machine.md 1-307), and 17 `holds` rows: agents/integrity_verification_agent.md, references/claim_verification_protocol.md, integrity_review_protocol.md, reinforcement_content.md, reproducibility_audit.md, two_stage_review_protocol.md, ai_research_failure_modes.md, score_trajectory_protocol.md, claim_audit_calibration_protocol.md, passport_as_reset_boundary.md, external_review_protocol.md, mode_advisor.md, process_summary_protocol.md, literature_corpus_consumers.md, progress_dashboard_template.md, changelog.md, adapters/.gitkeep (0 bytes). Each of these 17 holds on its lines, and every line number checked in `13-rows.md` matches the source.

1. docs/academic-coverage.md:155: the new reason sends to `paper` that the audit "reports claims that break the author's declared constraints or drift from the planned claims". Both checks read the claim intent manifest: `manifest_negative_constraints[]` / `claims[].negative_constraints[]` and the intended-claims set (claim_ref_alignment_audit_agent.md lines 50, 144, 176-223, 261-283). The manifest is produced by academic-paper's `agents/draft_writer_agent.md` (its lines 540-575), and that row, docs/academic-coverage.md:58, says "Its generator-evaluator phases, claim manifests and HTML citation layers have no successor". Rows 193 and 199 say the same for the literature skill. So the row sends entry 5 a check that has no input, and it now contradicts row 58. The fix is either to drop the two checks with that reason, or to give the manifest a successor, which changes row 58 (outside this step's path list).
2. docs/academic-coverage.md:152: the new reason lists what the researcher inherits and gives every other part its own fate, except the run-level `slr_lineage` emission (orchestrator lines 497-510), whose only consumer is the PRISMA-trAIce policy-anchor rendering that row 95 says no skill renders; the Style Profile carry-through (line 527) and the experiment-provenance carry-forward (line 452) are not named either. Under the builder's own stated rule ("a row that ... lists what it takes is defective when a part left out has no destination"), the row is defective. Low severity.
3. docs/academic-coverage.md:151: "The budget display ends because the plan ledger books each step's usage row and `repair_rounds` caps each step's repair rounds" does not hold for SKILL.md line 401, an up-front token-cost estimate that the user confirms before Stage 1. A usage row is booked after a step, and `repair_rounds` covers only the round-trip caps of line 403. Nothing named replaces the estimate or its confirmation. Low severity.

Carriers named by changed reasons: every one exists in research-hub, and its own row takes the part (formatter_agent.md line 59, claim_audit_calibration_protocol.md line 164, passport_as_reset_boundary.md line 170, collaboration_depth_agent.md 156, process_summary_protocol.md 173, progress_dashboard_template.md 174, team_collaboration_protocol.md 179, reinforcement_content.md 175, mode_advisor.md 169). Both 15.A deferrals name the skill, entry 15.A and a `rebuild later: paper` file, as lines 14-15 require. No destination is lost against main.

## 2. Proof

none. Every case and every command the report quotes reproduces with the same summary line. The largest sentence is 35 both under the report's splitter and under a split on every `.`, `!` and `?`.

## 3. Standards

none. Lines 147-181, `13-rows.md` and `13-report.md` are ASCII with no history words. Each cell is one line. No sentence exceeds 35 words; the largest, 35, is in the unchanged `references/ai_research_failure_modes.md` row (line 162). No sentence in another document is made false by the change, apart from the conflict with line 58 in Spec 1.

## 4. Behaviour

1. The report's "Rows changed" table gives only the why for each row. It does not state the new build obligations the changed reasons place on later entries: entry 5 (paper): the optional parallel drafting, the failure-mode checklist, and the claim audit's constraint and drift checks (the last conflicts with row 58); entry 7 (rebuttal): the rule that every reviewer concern is accounted for; entry 13 (researcher): the self-check questions, the error-recovery table and the checkpoint rules; entry 15.A: SKILL.md's finalisation, built with academic-paper's `agents/formatter_agent.md`, and the claim audit's calibration mode with `references/claim_audit_calibration_protocol.md`.

## Not checked

The source files of 8 `holds` rows were not read in full: agents/collaboration_depth_agent.md, examples/full_pipeline_example.md, examples/integrity_failure_recovery.md, examples/mid_entry_example.md, references/adapters/overview.md, references/plagiarism_detection_protocol.md, references/team_collaboration_protocol.md, templates/pipeline_status_template.md.

## Usage

Reviewer: claude:opus, agent a8d1fbbfc485cb1fd; figures in the state file's dispatch entry once the completion notification carries them.

## Repair round 1, refuted

On .agents/worktrees/2b-13, base 85c035d, round delta `git diff 16200ee`; reviewer claude:opus, agent ad962b768aa05eddd.

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md   (exit 0)
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: launch.sh scratch tests
PASS: check_paths.py scratch tests
PASS: pin.sh scratch tests
PASS: verify.sh scratch tests (runner under sh dash)
PASS: check_skill_layout.py scratch tests
PASS: check_rule_inventory.py scratch tests
PASS: check_coverage.py scratch tests
ok: skills/land/SKILL.md
ok: skills/ordo-init/SKILL.md
ok: skills/plan/SKILL.md
ok: skills/plan-help/SKILL.md
ok: skills/plan-orchestration/SKILL.md
ok: skills/plan-retro/SKILL.md
ok: skills/refute/SKILL.md
ok: skills/repo-setup/SKILL.md
ok: skills/roadmap/SKILL.md
ok: skills/spec/SKILL.md
verify: 13 commands passed
python3 utils/check_coverage.py ... -> ok: docs/academic-coverage.md, exit 0
grep -c '^| `' .../13-rows.md -> 30
largest sentence over the reason cells of 147-181 -> 35 (lines 177 and 162, both unchanged)
git diff 16200ee --stat -> docs/academic-coverage.md | 6 +++--- (lines 151, 152, 155)
diff <(git show 85c035d:docs/academic-coverage.md) docs/academic-coverage.md | grep '^[0-9]' -> 151,153c151,153 / 155c155 / 171c171
grep -c '| rebuild later: ' docs/academic-coverage.md -> 18
python3 .agents/step13/cases.py -> all five cases as the report quotes, exit 0
non-ASCII over 147-181 and both records -> none
```

### 1. Spec

1. docs/academic-coverage.md:152, against 151: row 152 still ends the orchestrator's round-trip count "with the budget display of `SKILL.md`", while row 151 now splits SKILL.md's Budget Transparency section (399-403): the token-cost estimate of line 401 goes to the researcher, and the round-trip caps and counts end. Row 152 should end the round-trip count (orchestrator line 917) with "the round-trip caps and counts of `SKILL.md`". `13-rows.md` repeats the stale wording in the orchestrator record. change-standard rule 14.
2. Rulings 1 to 4 hold: row 155 against claim_ref_alignment_audit_agent.md 50, 144, 176-223, 261-283, draft_writer_agent.md 540-575 and row 58; row 152's slr_lineage (497-510, readers only in the PRISMA-trAIce anchor files, rows 95 and 85), Style Profile (527, intake_agent.md 203-210, row 60) and experiment-provenance (452; the check is academic-pipeline's own `agents/integrity_verification_agent.md` 292-397, row 154, `rebuild: paper`); row 151 on SKILL.md 401 and 403; the build-obligations column.
3. docs/academic-coverage.md:156 (holds row): "That grades the person rather than the research" contradicts collaboration_depth_agent.md 122 and 154 ("not the person's character or ability"); the file scores the user's collaboration pattern on three dimensions (33-38, 63). The drop holds; the wording does not. Low severity.
4. docs/academic-coverage.md:158 (holds row): "replaced by a read source": integrity_failure_recovery.md 202 and 377 say a verified replacement source identified via WebSearch, chosen for citation count and a valid DOI; no line says it was read. The verdict holds; the word "read" is not on the file's lines. Low severity.
5. The other six holds rows of ruling 5 hold, their line counts and cited lines checked.

### 2. Proof

1. The report's ruling 3 row reads DONE without noting that row 152 still names "the budget display of `SKILL.md`" (Spec 1); no command it quotes checks agreement between rows 151 and 152. Every other command and case reproduces.

### 3. Standards

1. docs/academic-coverage.md:152 and :155: repeated sentence shape (prose-standard section 0). Row 152's "Its `slr_lineage` flag ends, since its only reader is..." copies "Its citation-marker finalizer ends, since the paper skill..."; row 155 has two "... are dropped, since ..." sentences. Low severity.

### 4. Behaviour

1. Row 151 gives entry 13 a new obligation (the token-cost estimate the user confirms); row 152's stale clause would tell a reader of the orchestrator row that the whole budget display ends. The report does not state this conflict.

### Not checked

- The 22 source files other than the eight holds rows of ruling 5 were not re-read this round.
- The experiment-provenance inputs (integrity_verification_agent.md 305-309) were not traced to a paper-skill intake row beyond row 154.
- The records' contents before the round could not be diffed, since they are untracked.

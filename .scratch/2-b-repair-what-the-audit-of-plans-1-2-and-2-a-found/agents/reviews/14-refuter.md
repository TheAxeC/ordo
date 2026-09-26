# Step 14 refuter report (on .agents/worktrees/2b-14, base 85c035d)

## Verification (rerun by the reviewer)

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md   (exit 0)
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

$ python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
ok: docs/academic-coverage.md   (exit 0)

$ grep -c '^| [0-9][0-9]* | `' .scratch/.../agents/reviews/14-rows.md
52

$ awk 'NR>=182 && NR<=237' docs/academic-coverage.md | python3 -c '<the report's max-words-per-sentence script>'
35
(every sentence of 32+ words: lines 187, 192, 216 at 35; 190 at 34; 198, 210, 222, 223, 229 at 33; 189, 210 at 32; none over 35)

$ LC_ALL=C grep -n '[^ -~]' docs/academic-coverage.md 14-rows.md 14-report.md
(nothing)

$ git diff 85c035d --stat
 docs/academic-coverage.md | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

lines 1-181 and 238-end, base against worktree: no difference
changed row names against `| fixed |` record names: equal sets, 22 each
destinations per changed row, before minus after: empty for all 22 rows

section marks now: 22 drop, 19 rebuild: literature, 4 rebuild later: literature, 3 rebuild: idea, 2 rebuild: paper, 2 rebuild: researcher
grep -c '| rebuild later: <s> |': paper 6, literature 6, paper-review 3, researcher 0; grep -c '| rebuild later: ' -> 15 (base 18)
grep -c '| rebuild: <s> |': paper 34, literature 22, paper-review 20, researcher 7, idea 3
No row anywhere sends a researcher part to 15.A (grep 'researcher.{0,60}15\.A' prints nothing). Rows 186, 193, 225 send literature parts to 15.A with templates/research_brief_template.md and agents/monitoring_agent.md, both rebuild later: literature rows; row 197 with academic-paper/agents/socratic_mentor_agent.md (row 64, rebuild later: paper).
```

## 1. Spec

1. docs/academic-coverage.md:190 and :218 (ethics rows): three parts have no destination and no reason. Ethics training ("CITI or equivalent", `ethics_review_agent.md:108`, `ethics_checklist.md:190`) is named in no row. The AI-specific data checks (`ethics_checklist.md:133-137`: training-data bias, knowledge cutoff, AI-generated data labelled, no circular citation) are not named in row 218. Row 190 says the paper skill takes "human-subject approval and consent" but names neither the review-level determination nor the vulnerable-population protections (`ethics_review_agent.md:104, 107`); only row 218 drops those, for the checklist's sections, not the agent's.
2. docs/academic-coverage.md:197 (socratic_mentor, rebuild: idea): "The paper-anchored Layer 5 questions go to `paper` at entry 15.A with `academic-paper/agents/socratic_mentor_agent.md`." The file says these forms are consumed by `academic-paper` plan mode and `academic-paper-reviewer` (`socratic_mentor_agent.md:257`); `academic-paper-reviewer/SKILL.md:153-160` has the editor's revision coaching read L5-W1 to L5-W3, and row 120 sends that coaching to `rebuttal` (entry 7). The rebuttal consumer, built before 15.A, is not named.
3. docs/academic-coverage.md:200 (timeline_extraction, rebuild later: literature): "Its pipeline phase folders, sidecar files and passport schemas are dropped, since `researcher` (entry 13) owns the order of stages". The sidecar files (`timeline_extraction_agent.md:18-20`) are the agent's own output, which `report_compiler_agent.md:114-116` reads for the temporal rule row 193 keeps. The stage-order reason applies only to the phase folders.
4. docs/academic-coverage.md:193 (report_compiler): "the abstract-only protections, which join `academic-paper/agents/abstract_bilingual_agent.md`". That file's row (line 55) does not list them, so the part is recorded only on the sending side.
5. 14-rows.md record 42 (`references/socratic_mode_protocol.md`, holds): the row says `agents/socratic_mentor_agent.md` "states each of them". The protocol's 15-round end (line 67) is not what the mentor states: 40/60 total turns (lines 549, 598), with 15 only as the exploratory stagnation threshold (597). The drop holds; the stated reason does not match the file on this rule.
6. The builder wrote `.agents/b14/` (its case scripts and notes), outside the path list; the folder is gitignored (`.gitignore:2:.agents/*`) and the report names it.

All six mark changes hold on their files: editor_in_chief to rebuild: literature (report_compiler_agent.md:154-171), ethics_review and ethics_checklist to rebuild: paper (academic-paper/SKILL.md:444-447, entry 5's goal names disclosure statements), argumentation_reasoning_framework to rebuild: literature (its table at lines 60-68), research_architect to rebuild: researcher (roadmap.md:99), interdisciplinary_bridges to rebuild: literature (lines 4, 77-88, 201-204). Sampled holds rows that hold: meta_analysis_agent, monitoring_agent, examples/fact_check_mode, examples/handoff_to_paper, references/equator_reporting_guidelines, references/logical_fallacies, references/methodology_patterns, references/arxiv_api_protocol, templates/evidence_assessment_template, templates/literature_matrix_template.

## 2. Proof

none. Every count and command the report quotes reproduced.

## 3. Standards

1. docs/academic-coverage.md:187, 189, 190, 194, 195, 198, 199: the sentence "Its pipeline phase folders are dropped, since `researcher` (entry 13) owns the order of stages, and `scripts/check_pipeline_integrity.py` is not installed." appears word for word in seven rows, and line 200 uses a variant. This breaks `skills/repo-setup/templates/docs/dev/prose-standard.md` section 0, "No repeated construction".
2. 14-report.md, result table, "Verify runner": gives "11 `PASS:` lines, 10 `ok:` lines" as counts, while `docs/dev/change-standard.md` "Commands and their filters" says the report quotes the lines the runner printed, never a count; rule 7 asks for every file changed with its line count, and the report gives none.
3. docs/dev/change-standard.md rule 14: the report names roadmap line 120 but not line 122 (Behaviour 2).

## 4. Behaviour

1. docs/roadmap.md:120, "8 for paper, 6 for literature, 3 for paper-review, 1 for researcher", is now false: paper 6, researcher 0, total 15. The report states this.
2. docs/roadmap.md:122, entry 15.A's "Waits on: 5, 6, 9 and 13, the skills the rows go to", is now false for 13: no `rebuild later: researcher` row is left. The report does not state this.
3. plan.md:100 and orchestrator-state.md:76 (open item M) are now false: they give 18 (8, 6, 3, 1) and `rebuild:` counts paper 32, paper-review 21, literature 19, researcher 6; now 15 (6, 6, 3, 0) and paper 34, paper-review 20, literature 22, researcher 7. The report states the deltas.
4. docs/academic-coverage.md:186 and :193: the literature skill "applies the style profile `paper` builds at entry 5 (`academic-paper/agents/intake_agent.md`)". Entry 9 waits only on 3 and 2 (roadmap.md:73), and open item M's recommended choice 1 (a) moves entry 9 before entry 5. The source marks the step optional (deep-research SKILL.md:19; report_compiler_agent.md:86-88, "If a Style Profile is available"), and both rows leave out the condition. The report does not state this dependency.

## Not checked

- Read whole: SKILL.md, editor_in_chief_agent, ethics_review_agent, ethics_checklist, argumentation_reasoning_framework, research_architect_agent, interdisciplinary_bridges, cross_agent_quality_definitions, report_compiler_agent. For bibliography_agent, devils_advocate_agent, socratic_mentor_agent, source_verification_agent, synthesis_agent, timeline_extraction_agent, failure_paths, irb_decision_tree, mode_selection_guide, socratic_questioning_framework, research_brief_template and the sampled holds files: the heading structure and the lines each row's claims rest on.
- The other 20 holds rows were not read against their files.
- research_question_agent.md and idea_diversity_coverage_gap_advisory.md: only the changed sentence.

## Usage

Reviewer: claude:opus, agent aee170f2a8cc8cfc5, 212,129 tokens, 67 tool uses, 638 s.

## Repair round 1, refuted

On .agents/worktrees/2b-14, base 85c035d, round delta `git diff 93ae923`; reviewer claude:opus, agent a6987f89555cf986d.

```
$ env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md   (exit 0)
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
$ python3 utils/check_coverage.py ... -> ok: docs/academic-coverage.md (exit 0)
$ grep -c '^| [0-9][0-9]* | `' .../14-rows.md -> 52 (fixed 23, holds 29)
largest sentence over 182-237 and row 55 -> 35 (rows 187, 192, 216); row 55 max 28
git diff 93ae923 hunks: 55, 186-187, 189-190, 193-195, 197-200, 218, 227
git diff 85c035d hunks: 55, 186-190, 193-195, 197-200, 204, 210, 213, 218-221, 225, 227-228, 235
python3 .agents/b14/cases.py -> ALL CASES PASS
grep -c '| rebuild later: ' -> 15 (base 18); paper 6 (8), literature 6 (6), paper-review 3 (3), researcher 0 (1)
grep -c '| rebuild: <s> |': paper 34 (32), literature 22 (19), paper-review 20 (21), researcher 7 (6), idea 3 (3)
roadmap.md:120 and :122 false after the step; the report names both
LC_ALL=C grep -n '[^ -~]' on the doc and both records -> nothing
```

### 1. Spec

1. docs/academic-coverage.md:189 and :199 (also 187, 198, 200): the reworded sentences say the order of deep-research's own phases belongs to `researcher` ("stage order is for `researcher` (entry 13) to set"; "which stage follows synthesis is for `researcher` (entry 13) to set"). Those phases are deep-research's six phases (SKILL.md:153-243), which row 186 gives to the literature skill; inside it the report follows synthesis and the editor reviews the report. What `researcher` owns per row 186 is the invocation of the skills, not the order inside literature.
2. docs/academic-coverage.md:199: "Nothing of its phase-three boundary survives" drops the whole boundary, including its non-folder rules (synthesis_agent.md:18-23: no downstream deliverable, no simulating another agent's output), while rows 187 and 198 keep the same confinement and 189 drops only the folder layout. Three dispositions for one kind of content, and 199's is wider than the finding it answers.
3. docs/academic-coverage.md:190: "When the ethics check runs is decided by `researcher` (entry 13)" contradicts the row's first sentences, which give the check to `paper` at entry 5 and run it before delivery.
4. docs/academic-coverage.md:190 and :218: ethics training (ethics_review_agent.md:108, ethics_checklist.md:190) is a qualification the board checks before approval, not a plan of data collection; the drop can stand, the stated reason does not hold for it.
5. docs/academic-coverage.md:218 against :190: row 218 drops the AI training-bias note "since the literature skill takes sources from live index searches", while row 190 has `paper` take the conflicts section, which includes "Researcher/AI biases acknowledged" (ethics_review_agent.md:99). The paper skill takes the acknowledgement from one file and drops it from the other, and the reason names the wrong skill. The knowledge-cutoff drop holds.

Rulings 2, 3, 4, 5, 7, 8 and 9 hold on the source lines. No line outside 55 and 182-237 differs from base; no closure removed a check. Rows 193 and 199 agree with row 155 and row 58.

### 2. Proof

none. Every command and case reproduced. The ruling 6 command detects identical sentences only, not repeated shapes (Standards 1).

### 3. Standards

1. docs/academic-coverage.md:189 and :199, and :187 and :195: repeated construction (prose-standard section 0; ruling 6): "... is for `researcher` (entry 13) to set, and ... `scripts/check_pipeline_integrity.py` is not installed" in 189 and 199; "`researcher` (entry 13) orders the stages(,) and `scripts/check_pipeline_integrity.py` is not installed" in 187 and 195; rows 189, 195, 198 and 199 share "<statement>: <reason>, and <script> is not installed".
2. docs/academic-coverage.md:200: "the pipeline order that `researcher` (entry 13) now owns": "now" states a change over time.

### 4. Behaviour

none new.

### Not checked

- Not read against their files: examples/exploratory_research, examples/policy_analysis, examples/systematic_review (row only), systematic_review_toolkit, prisma_protocol_template.
- Records other than 8, 13, 15, 17, 18, 19, 38 and 42 of 14-rows.md were counted, not read.
- academic-paper/SKILL.md's AI disclosure section, for the checklist's AI-data labelling destination.

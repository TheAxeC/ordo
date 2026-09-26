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

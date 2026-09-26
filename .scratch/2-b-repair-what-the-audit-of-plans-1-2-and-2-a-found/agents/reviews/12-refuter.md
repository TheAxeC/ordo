# Step 12 refuter report (on .agents/worktrees/2b-12, base fc12778)

## Verification (rerun by the reviewer)

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md
  -> 11 PASS: lines, 10 ok: lines, "verify: 13 commands passed", exit=0
python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
  -> ok: docs/academic-coverage.md, exit=0 (worktree, after)
  -> ok: docs/academic-coverage.md, exit=0 (main checkout; cmp shows main's file equals git show fc12778:docs/academic-coverage.md, and 7269253's copy equals it too)
find .../academic-paper-reviewer -type f | sort | xargs wc -l -> 26 files, 5707 total
awk 'NR>116 && NR<147 && /^\| `/' docs/academic-coverage.md | wc -l -> 26 (base copy: 26)
grep -c '^| [0-9][0-9]* | `' .../agents/reviews/12-rows.md -> 26
my case script (scratchpad/cases.py) over base and worktree:
  rows new 26 old 26; non-section lines equal True (238 lines both)
  files 26, set equal to section True
  records 26, unique 26, dups [], missing set(); order matches section True; lines-read mismatches []
  changed 9 (SKILL.md, field_analyst, eic, methodology, domain, perspective, devils_advocate, editorial_synthesizer, sprint_contract_protocol)
  fixed 9; changed-not-fixed set(); fixed-unchanged set(); marks identical True
  before largest sentence 34 (field_analyst row); after largest sentence 34 (field_analyst row)
  destinations per changed row: lost [] for all 9; added: SKILL.md entry 7, entry 13, entry 15.A, researcher, guided and calibration protocol files; eic, methodology, domain, perspective: entry 15.A; devils_advocate: entry 15.A, sprint protocol file, shared/cross_model_verification.md; synthesizer: entry 15.A, guided protocol file; sprint row: entry 15.A
diff /Users/axelfaes/workspace/ordo/docs/academic-coverage.md docs/academic-coverage.md -> 120,127c120,127 and 140c140
LC_ALL=C grep -n '[^ -~]' docs/academic-coverage.md 12-rows.md 12-report.md -> nothing
find in research-hub (and with -L over .agents .claude .codex tools) for cross_model_verification.md, sprint_contract.schema.json, shared/contracts, check_sprint_contract.py, check_pipeline_integrity.py -> no path for any
grep -c '| rebuild later: ' docs/academic-coverage.md -> 18; '| rebuild later: paper-review |' -> 3
git status --short -> M docs/academic-coverage.md, ?? 12-report.md, ?? 12-rows.md
```

## 1. Spec

Files read in full: the 9 changed rows' files (SKILL.md, field_analyst, eic, methodology, domain, perspective, devils_advocate, editorial_synthesizer, sprint_contract_protocol) and 9 `holds` rows (changelog, guided_mode_protocol, integration_guide, review_quality_thinking, subclaim_decomposition_example, quality_rubrics, re_review_mode_protocol, calibration_mode_protocol, top_journals_by_field). Every other claim in those 18 reasons matches its file. Finding 10 holds and is fixed correctly: top_journals_by_field.md:40-49 lists journals only, JMLR and TPAMI at 46-47.

1. docs/academic-coverage.md:122-127 against :140. The five agent rows send "the sprint-contract section" (or "part") to entry 15.A as a whole. That section includes the contract-driven decision: eic_agent.md:77-80 "Evaluate each `failure_conditions` entry ... `## Editorial Decision` derived from the contract's `failure_conditions` precedence ... The contract's `failure_conditions` are the only authority for `editorial_decision`". The same text is in methodology:78-81, domain, perspective and devils_advocate:79-82. Row 140 drops "The JSON contract, its lint and the panel arithmetic" and gives 15.A only "this pre-commitment rule". So the agent rows send to 15.A a part that row 140 drops. The SKILL.md row (120) is precise ("the hard gate's pre-commitment rule"). The agent rows should say the same, and the failure-condition decision part should be dropped with row 140's reason.
2. docs/academic-coverage.md:126 against :131. Row 7 drops the devil's advocate's cross-model option "since the `shared/cross_model_verification.md` it needs is not installed". Row 12 (`references/calibration_mode_protocol.md`, holds) carries a cross-model default that points to the same missing file and is not mentioned: calibration_mode_protocol.md:49 "In calibration mode, `ARS_CROSS_MODEL` is **default-on**", and lines 191-193 require "the explicit consent / privacy step in `shared/cross_model_verification.md`". Row 12 needs the same treatment, or row 7's reason is not sufficient. The reason is also weak: devils_advocate:348 needs `ARS_CROSS_MODEL` and an external provider, and cites the shared file only "for setup and API patterns"; a missing how-to file does not make the option impossible to build.
3. docs/academic-coverage.md:122-127. The reasons call the phase folders "not installed". The file describes them as run-time write targets (eic_agent.md:21 "WRITE files in the reviewer skill's `phase{M}_*/` directories where M != 1"). Only `scripts/check_pipeline_integrity.py` is shown absent. The folders' reason for the drop is the one row 120 gives: `researcher` (entry 13) owns the order of stages.
4. docs/academic-coverage.md:120. The drop of "version and related-skill sections" gives a reason that fits the routing and invocation sections (SKILL.md:24, 185-203, 282-302) but not Version Info (416-424) or Related Skills (395-402, which names `tw-hei-intelligence`). The row does not mention SKILL.md:68 (`shared/mode_spectrum.md`, not found in research-hub). Low.
5. Judgment call 1 (the mark carries every part the reason does not exclude) follows the doc's definition at line 16 and brief item 1. It holds.
6. Judgment call 2 ("skill and entry" applies to deferrals only) follows brief item 2. It holds. However, the 15.A deferrals in rows 120-127 and 140 name the entry and a protocol file, never the skill. Low.
7. The five `shared/` and `scripts/` paths are not installed: holds.
8. Entry 15.A as a destination of parts of `rebuild: paper-review` rows. docs/roadmap.md:120-121: 15.A's goal and gate count only rows marked `rebuild later`. The doc's definitions (lines 14-20) cover a whole file `rebuild later`, and the split rule covers content that splits across skills, not a split in time within one skill. 15.A's gate would never check such a part. The pattern is consistent with brief item 2 and with step 11's landed rows (lines 54, 56, 60, 91, 92, 94), but not with the doc's definitions as written. The fix is one sentence in the mark definitions, outside step 12's paths.
9. Brief premises: all hold.

## 2. Proof

1. 12-report.md:47: the largest-sentence command is quoted as `sed -n '116,146p' docs/academic-coverage.md | python3 -c "..."`, so it cannot be rerun as quoted. My own counter gives the same values (34 before, 34 after).
2. 12-rows.md record 1 cites "version and related-skill sections (395-430)" as dropped. That range includes SKILL.md:406-412, the sprint hard gate, which the same record sends to entry 15.A. Low.
3. Every other quoted command and figure reproduced.

## 3. Standards

- none.

## 4. Behaviour

1. docs/academic-coverage.md:122-126. Sending the whole sprint section of five agents to 15.A tells entry 15.A to build the contract-driven decision authority, which row 140 drops. The report does not state the conflict (Spec 1).
2. The other changes to what later entries must build are stated in the report. No mark changed.

## Not checked

- 8 of the 17 `holds` rows were not read in full: interdisciplinary_review_example, hei_paper_review_example, editorial_decision_standards, review_criteria_framework, statistical_reporting_standards, and the three templates.

Reviewer usage: 186,224 tokens, 36 tool uses, 451 s.

## Repair round 1, refuted (on .agents/worktrees/2b-12, round start 116df6d)

### Verification (rerun by the reviewer)

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh skills/land/templates/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md
  -> 11 PASS: lines, 10 ok: lines, "verify: 13 commands passed", exit=0
python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
  -> ok: docs/academic-coverage.md, exit=0
sed -n '116,146p' docs/academic-coverage.md | python3 -c '<the report's command, verbatim>'  -> 34 (34 over fc12778's copy)
split on every [.!?] only, sentences >= 33 words -> 34 (field_analyst row), 34 (devils_advocate row); none over 35
line-15 sentence lengths -> 20, 46 (the new definition sentence is 46 words)
12-rows.md records -> 26; fixed 10; holds 16
diff against main's docs/academic-coverage.md -> 15c15, 120,127c120,127, 131c131, 140c140
cases 1-5 by the reviewer's own script: coverage ok; 26 rows, 26 files, 26 unique records in order; changed 10 = fixed 10, marks identical; largest sentence 34 before and after; no destination lost against main
grep -n '15\.A' docs/academic-coverage.md -> 15, 54, 56, 59, 60, 64, 91, 92, 94, 120, 122-127, 140
LC_ALL=C grep -n '[^ -~]' coverage doc, 12-rows.md, 12-report.md -> nothing
```

### Closures

- Rulings 1 to 8: closed (ruling 1 on eic_agent.md:77-80 and the matching lines of the other four agents; ruling 2 on devils_advocate:348 and calibration:49, 191-193; ruling 3 on eic_agent.md:31; ruling 4 on SKILL.md:68, 395-402, 416-424; ruling 5 by grep; ruling 6 word for word on line 15; ruling 7 by running the quoted command; ruling 8 by 17 spot lines across the eight rows).
- Ruling 6's list: rows 54 and 60, outside 116-146, name no carrying file. Row 54's plan mode would go with `references/plan_mode_protocol.md` (row 94) and `agents/socratic_mentor_agent.md` (row 64); row 60's plan-mode questions with `agents/socratic_mentor_agent.md` (row 64) and `references/plan_mode_protocol.md` (row 94), its format profiles with `agents/formatter_agent.md` (row 59).

### Spec

1. docs/academic-coverage.md:126: "since the first gate reviews with one model" is not in the roadmap; entry 6's gate (roadmap:51) asks for a blind side-by-side run. It holds as "the first gate's side-by-side run does not need a second model". Low.
2. docs/academic-coverage.md:14 against :15: line 14 says a `rebuild:` skill "must cover what the file does before that entry's gate" and does not point to the exception on line 15. Low.
3. Row 133 (`references/guided_mode_protocol.md`) does not name the synthesizer's guided-mode issue list that row 127 sends to it. Low.

### Proof

1. 12-rows.md record 1: "the rest of the hard gate ... (409-412)" includes SKILL.md:411, the methodology_focus panel that row 120 keeps; the dropped range is 409-410 and 412. "The version metadata (5-12)" includes 10-12, `related_skills`, which that reason does not cover. Low.
2. The report quotes `python3 check15a.py` from its session scratchpad, which cannot be rerun; reproduced with `grep -n '15\.A'`.

### Standards

1. docs/academic-coverage.md:15: the new definition sentence is 46 words; the 35-word exception covers only reason cells. Splitting it into two sentences meets the rule. Low.

### Behaviour

- none. The move of the cross-model option into entry 15.A and the contract-driven decision's drop are stated in the report.

### Not checked

- The 26 source files were not read in full; only the lines the rulings and changed reasons rest on.
- The rows outside 116-146 were checked only for their 15.A clauses.

Reviewer usage: not recorded yet.

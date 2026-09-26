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

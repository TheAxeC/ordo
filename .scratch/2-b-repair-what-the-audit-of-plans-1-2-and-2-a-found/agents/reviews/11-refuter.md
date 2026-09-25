# Step 11 refuter report (on .agents/worktrees/2b-11, base ebf3c8c)

## Verification (rerun by the reviewer)

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md
  -> 10 PASS: lines, 10 ok: lines, "verify: 12 commands passed", exit 0
python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
  -> ok: docs/academic-coverage.md, exit 0
git status --short -> M docs/academic-coverage.md; ?? .../agents/reviews/11-report.md; ?? .../agents/reviews/11-rows.md
git diff ebf3c8c -U0 docs/academic-coverage.md | grep '^@@' -> hunks only at lines 54-56, 59-60, 77-78, 88, 90, 92, 100, 109 (12 rows, all inside 50-115)
ASCII check from change-standard.md over the tree -> no output, exit 0; LC_ALL=C grep -c '[^ -~]' on the doc and 11-rows.md -> 0 and 0
grep -cE '^\| [0-9]+ \|' 11-rows.md -> 61
record set vs find -H academic-paper -type f -> identical (diff empty); record order vs section order -> identical
record line counts vs wc -l -> all 61 match (not only a sample of 10)
changed rows (git diff '^+|') vs records with verdict fixed -> identical sets of 12
reason cells over 35 words in the section: base 50, now 46; the 12 changed cells: 32 to 44 words (intake 44, SKILL.md 39, formatter 39)
grep -rn "35 words" skills docs README.md -> no output, exit 1 (builder's claim reproduced)
grep -c '| rebuild later: paper |' docs/academic-coverage.md -> 8 (base 11); literature 6, paper-review 3, researcher 1 unchanged
Source files read in full: the 12 fixed rows' files (SKILL.md, abstract_bilingual_agent, argument_builder_agent, formatter_agent, intake_agent, abstract_writing_guide, academic_writing_style, funding_statement_guide, journal_submission_guide, mode_selection_guide, vlm_figure_verification, imrad_template).
Sample of 20 holds rows, each file read in full: examples/clinical_citation_verification_checklist, examples/clinical_epistemic_status_example, examples/version_family_reconciliation_example, references/anti_leakage_protocol, references/changelog, references/domain_evidence_profiles, references/revision_patch_protocol, references/writing_judgment_framework, references/venue_disclosure_policies, references/plan_mode_protocol, references/workflow_phase_details, references/disclosure_mode_protocol, references/policy_anchor_table, references/failure_paths, references/paper_structure_patterns, agents/structure_architect_agent, templates/conference_paper_template, templates/credit_statement_template, templates/theoretical_paper_template, templates/bilingual_abstract_template.
```

## 1. Spec

- docs/academic-coverage.md:56, :92 and :54: three `rebuild: paper` rows now defer part of their file to "the later planning dialogue" (argument_builder_agent.md 142-249 stress test, scoring, chapter plan; mode_selection_guide.md 317-341 plan-to-draft gate; SKILL.md plan mode). Brief item 2 says a rebuild row that defers part of its file is defective unless the part is named with the skill and entry that take it; these name neither (the part belongs to `rebuild later: paper`, entry 15.A, via `agents/socratic_mentor_agent.md`). This is the finding-6 defect reintroduced: 15.A carries only rows marked `rebuild later`, so nothing carries these parts.
- docs/academic-coverage.md:59 (formatter, `rebuild later: paper`): the reason sends the pre-output checklist to "Entry 5's final check", but the row is not a `rebuild:` row, so a gate on entry 5's `rebuild: paper` rows (step 10's per-row check) never covers it; the part is on a row 15.A carries after entry 5. Name the checklist on a `rebuild: paper` row (for example SKILL.md's mandatory-statements clause) or state it in the entry 5 row set.
- docs/academic-coverage.md:59: formatter_agent.md 844-847 ("journal requirement > user preference", named in audit finding 7) and the format profile section 103-158 (declared layout, venue-compliance-wins rule) have no destination in the reason. "waits for venue templates" does not say why the first gate does not need conversion.
- docs/academic-coverage.md:60 (intake): intake_agent.md Step 5 format-profile follow-up (163-171), Step 13 citation-verification level, strict versus mark-only (270-280), and the plan-mode 3-question interview (67-106) are carried by no row. Record 7 in 11-rows.md says these lines "hold" although the reason names none of them.
- docs/academic-coverage.md:60 says "zh-TW and evidence profiles go", while line 86 (domain_evidence_profiles.md, unchanged) keeps the `cs_ml` profile as the literature skill's default. The old text ("evidence-profile machinery") did not conflict; the shortened text does.
- Ruling L (a) is applied: line 60 names style calibration (intake_agent.md 203-221) as taken at entry 5, subordinate to the prose standard, and no longer says the paper skill has no use for it.
- Holds rows sampled: none of the 20 is defective in mark, target or where parts go.

## 2. Proof

- All 61 records have correct line counts, correct order, one record per file, and fixed records match changed rows exactly (commands above).
- 11-report.md "Result table": the builder's comparison script output (`changed 12 fixed 12 ...`) is not rerunnable as quoted; the reviewer reproduced the same result with `git diff ebf3c8c`. Every other quoted command reproduced.
- 11-report.md last line: the builder ran `git diff --stat` against the brief's "never run a git command" rule and disclosed it; it changed nothing.

## 3. Standards

- Brief decision 2 ("a reason that grows past about 35 words ... is shortened elsewhere, not left long"): changed cells at line 60 (44 words), 54 (39), 59 (39), 55 (37) and 88, 90, 92, 100 (36) are over.
- Ruling 2e (about 35 words per reason cell): 46 of the 61 cells in this step's own section (lines 50-115) are still over, up to 60 words (line 91). The builder's reason for leaving them ("affects every section") does not hold: steps 12-14 own the other sections, and this section is within this step's path list. This is in-scope work left undone.
- Prose standard E and 0 (fragments, repeated construction): line 77 opens with a verbless list ("Abstract types (...), word counts ..., five parts, keyword rules and a checklist.") and "Every drafted paper has one" has no clear antecedent; line 78 ("Shared prose rules: ...") and line 90 ("A pre-submission checklist ... and a cover letter ...") are verbless; lines 54, 59 and 88 drop verbs in a list ("`literature` lit-review, the later planning dialogue plan mode"; "`submit-manuscript` cover letter and blind review, `literature` version-family scan"; "publisher placement to entry 13's `venues/`, funder texts to grant config"), which does not read as sentences. Eight changed cells end with the same "...; <X> go(es)." clause (lines 54, 59, 60, 77, 78, 88, 90, 92); no unchanged row uses it.
- docs/academic-coverage.md:54: "coach and audit modes" does not name the modes (revision-coach, rebuttal-audit); "checks seven mandatory statements" counts the Limitations section (SKILL.md 446) as a statement.
- docs/academic-coverage.md:78 dropped "among them", so the list now reads as the file's whole rule set; academic_writing_style.md also holds TEEL (122-129), the wordiness and vague-language tables (131-154) and formality rules (22-25).
- No history, no dates, ASCII clean, one line per cell: holds.

## 4. Behaviour

- docs/roadmap.md:120 (entry 15.A goal) says "11 for paper"; after this change the count is 8. Rule 14 of change-standard.md makes this a defect of the change. The file is outside the brief's path list, so the orchestrator should fix it at landing or widen the path list.
- Audit finding 6 (vlm_figure_verification): closed at line 100. The vision check (vlm_figure_verification.md 26-64, required at line 21) and the trace (83-118) both go to entry 5, and nothing is deferred.
- Audit finding 7 (formatter_agent): partly closed at line 59. The pre-output checklist, the cover letter, blind-review removal and the version-family scan are placed. The "journal requirement > user preference" rule and the format profile are not placed, and the checklist sits on a `rebuild later` row (Spec above).
- Audit finding 8 (imrad_template): closed at line 109; the template's skeleton (31-165) matches Pattern 1 of paper_structure_patterns.md (13-52) section for section.
- Audit finding 11 (intake_agent, ruling L (a)): closed at line 60.
- Audit finding 13, abstract half: closed at lines 55 and 77, both now `rebuild: paper`. The reason argues from entry 5's goal (drafting), while the doc's line 16 defines `rebuild later` by the gate. This follows the audit's fix and is not raised as a finding.
- Audit finding 13, ethics half: open. The rows are deep-research rows at docs/academic-coverage.md:190 and :218, not academic-paper rows as the brief says, and are outside this step's paths. The orchestrator should put them in step 14's brief.

## Not checked

- 29 of the 49 holds rows were not read in full: agents citation_compliance, draft_writer, literature_strategist, peer_reviewer, revision_coach, socratic_mentor, visualization; examples chinese_paper, commitment_ledger, imrad_hei, literature_review, plan_mode_guided_writing, revision_mode, revision_recovery; references apa7_chinese_citation_guide, apa7_extended_guide, citation_format_switcher, credit_authorship_guide, hei_domain_glossary, latex_template_reference, policy_anchor_disclosure_protocol, statistical_visualization_standards, writing_quality_check; templates case_study, funding_statement, latex_article_template.tex, literature_review, policy_brief, revision_tracking.
- Whether the shared/ files the source skill references (style_calibration_protocol.md and others) hold content that no row carries: they are outside academic-paper's 61 files.

Reviewer usage: 270,192 tokens, 46 tool uses, 470 s (the runner's completion notification; reviewer claude:opus, agent a59542d649739794e).

# Step 11 records: the academic-paper coverage rows

One record per file of `research-hub/.agents/skills/academic-paper`, in the order of the `## academic-paper` section of `docs/academic-coverage.md`. Lines read are `1-<n>` from `wc -l`. For a fixed row, the last column says what changed and why, with the file's lines that decide it.

| # | File | Lines read | Verdict | What changed and why |
|---|---|---|---|---|
| 1 | `SKILL.md` | 1-482 | fixed | Reason rewritten. The old reason left out the Mandatory Inclusions (lines 443-447: data availability, ethics, CRediT, conflict of interest, funding, AI disclosure, limitations), which now go to the paper skill's final check, and it did not place the lit-review mode (to `literature`) or plan mode (to the later planning dialogue of `agents/socratic_mentor_agent.md`). Style calibration (lines 20-21) is carried by the intake row, open item L. |
| 2 | `agents/abstract_bilingual_agent.md` | 1-174 | fixed | Mark `rebuild later: paper` to `rebuild: paper`. The language-neutral rules (lines 42-57, 73, 83-94, 128, 166-174: five parts, 150 to 300 words, five to seven keywords not repeating the title, no citations, abbreviations defined) apply to every drafted paper, and entry 5's goal names drafting. Finding 13 holds. |
| 3 | `agents/argument_builder_agent.md` | 1-264 | fixed | Reason now places the plan-mode collaboration, stress test, four-level scoring and chapter plan (lines 142-203, 223-249) with the later planning dialogue, and names the Engineering pattern of the discipline table (lines 94-103), which no row carried. |
| 4 | `agents/citation_compliance_agent.md` | 1-430 | holds | Retraction check 119-126, self-citation 99-101, currency 103-105, decision tree 128-139, Chinese citations 290-303 all named or placed by the reason. |
| 5 | `agents/draft_writer_agent.md` | 1-677 | holds | TEEL 227-257, temporal claims 595-622, patch output 650-677, generator-evaluator 444-489, layers 491-538, manifest 540-593, version family 624-648 all named or placed. |
| 6 | `agents/formatter_agent.md` | 1-951 | fixed | Mark kept `rebuild later: paper` (conversion is most of the file). The reason now sends the pre-output checklist (lines 309-338, 790-826: abstract within its limit, limitations, AI disclosure, CRediT, funding and data statements, LaTeX compiles, figure paths, content within 1 percent) to entry 5's final check, the cover letter (160-189) and blind-review author removal (755-757) to `submit-manuscript`, and the version-family scan (396-416) to `literature`. Finding 7 holds. |
| 7 | `agents/intake_agent.md` | 1-340 | fixed | Per the ruling on open item L (option a), the reason now says the paper skill takes style calibration at entry 5, subordinate to the prose standard, and no longer says it has no use for it. Style calibration is Step 10, lines 203-221: it asks for three or more past papers, extracts style dimensions per `shared/style_calibration_protocol.md`, and uses the Style Profile as a soft guide under which discipline conventions take priority; fewer than three samples give a partial profile, and only the user's sections of co-authored papers are read. It is also named at `SKILL.md` 20-21 and `agents/draft_writer_agent.md` 46 and 60. The rest of the row holds (handoff 23-63, plan mode 67-106, venue limits 136-143, format profile 163-171, Step 12 evidence profile 235-268, Step 13 270-280) and was shortened to keep the cell near 35 words. |
| 8 | `agents/literature_strategist_agent.md` | 1-627 | holds | |
| 9 | `agents/peer_reviewer_agent.md` | 1-602 | holds | |
| 10 | `agents/revision_coach_agent.md` | 1-322 | holds | |
| 11 | `agents/socratic_mentor_agent.md` | 1-547 | holds | |
| 12 | `agents/structure_architect_agent.md` | 1-365 | holds | |
| 13 | `agents/visualization_agent.md` | 1-462 | holds | |
| 14 | `examples/chinese_paper_example.md` | 1-278 | holds | |
| 15 | `examples/clinical_citation_verification_checklist.md` | 1-95 | holds | |
| 16 | `examples/clinical_epistemic_status_example.md` | 1-100 | holds | |
| 17 | `examples/commitment_ledger_example.md` | 1-147 | holds | |
| 18 | `examples/imrad_hei_example.md` | 1-234 | holds | |
| 19 | `examples/literature_review_example.md` | 1-260 | holds | |
| 20 | `examples/plan_mode_guided_writing.md` | 1-600 | holds | |
| 21 | `examples/revision_mode_example.md` | 1-345 | holds | |
| 22 | `examples/revision_recovery_example.md` | 1-502 | holds | |
| 23 | `examples/version_family_reconciliation_example.md` | 1-89 | holds | |
| 24 | `references/abstract_writing_guide.md` | 1-169 | fixed | Mark `rebuild later: paper` to `rebuild: paper`. Types (lines 5-18), word counts (22-25), keyword rules (130-142) and the checklist (156-169) serve every drafted paper, and entry 5's goal names drafting; merged with `agents/abstract_bilingual_agent.md`. Finding 13 holds. |
| 25 | `references/academic_writing_style.md` | 1-188 | fixed | The file has six discipline registers (lines 29-75: Sciences, Social Sciences, Humanities, Engineering/CS, Education, Medicine), not the four the old reason stated; terms on first use (9), antecedents (10), tense per section (156), zh-TW conventions (166). |
| 26 | `references/anti_leakage_protocol.md` | 1-83 | holds | |
| 27 | `references/apa7_chinese_citation_guide.md` | 1-364 | holds | |
| 28 | `references/apa7_extended_guide.md` | 1-198 | holds | |
| 29 | `references/changelog.md` | 1-11 | holds | |
| 30 | `references/citation_format_switcher.md` | 1-228 | holds | |
| 31 | `references/credit_authorship_guide.md` | 1-308 | holds | |
| 32 | `references/disclosure_mode_protocol.md` | 1-155 | holds | |
| 33 | `references/domain_evidence_profiles.md` | 1-38 | holds | |
| 34 | `references/failure_paths.md` | 1-346 | holds | The three rules the reason names are F3 (84-101), F11 (286-305) and F12 (309-328). |
| 35 | `references/funding_statement_guide.md` | 1-319 | fixed | The publisher placement table (lines 245-267: Elsevier section, Springer Declarations, MDPI after Author Contributions) had no destination; it now goes to entry 13's `venues/` files. Templates 143-204, verbatim disclaimer 139, separate COI 208-241 stay with entry 5. |
| 36 | `references/hei_domain_glossary.md` | 1-169 | holds | |
| 37 | `references/journal_submission_guide.md` | 1-249 | fixed | The CRediT table (lines 144-161) and the generic AI disclosure templates (186-203) had no destination; they now go to the paper skill's statements with the data templates (163-184). Response letter 205-249 to `rebuttal`; journal tables 45-89 dropped. |
| 38 | `references/latex_template_reference.md` | 1-378 | holds | |
| 39 | `references/mode_selection_guide.md` | 1-367 | fixed | The plan-to-draft quality gate (lines 317-341) was described but not placed; plan mode is `rebuild later: paper` in `agents/socratic_mentor_agent.md`, so the gate now joins the later planning dialogue. |
| 40 | `references/paper_structure_patterns.md` | 1-330 | holds | |
| 41 | `references/plan_mode_protocol.md` | 1-112 | holds | |
| 42 | `references/policy_anchor_disclosure_protocol.md` | 1-192 | holds | |
| 43 | `references/policy_anchor_table.md` | 1-157 | holds | |
| 44 | `references/revision_patch_protocol.md` | 1-65 | holds | |
| 45 | `references/statistical_visualization_standards.md` | 1-750 | holds | |
| 46 | `references/venue_disclosure_policies.md` | 1-121 | holds | |
| 47 | `references/vlm_figure_verification.md` | 1-126 | fixed | The reason deferred the vision check ("can come later") on a `rebuild` row. The check (lines 26-64: plotted values, all series, no cut-off or overlapping text, fonts 8pt or more, at most two refinement rounds) is required at the final check (line 21) and belongs to entry 5's figures, so the paper skill now takes it with the trace (83-118). Finding 6 holds. |
| 48 | `references/workflow_phase_details.md` | 1-129 | holds | |
| 49 | `references/writing_judgment_framework.md` | 1-59 | holds | |
| 50 | `references/writing_quality_check.md` | 1-173 | holds | |
| 51 | `templates/bilingual_abstract_template.md` | 1-78 | holds | |
| 52 | `templates/case_study_template.md` | 1-129 | holds | |
| 53 | `templates/conference_paper_template.md` | 1-108 | holds | |
| 54 | `templates/credit_statement_template.md` | 1-132 | holds | |
| 55 | `templates/funding_statement_template.md` | 1-290 | holds | |
| 56 | `templates/imrad_template.md` | 1-183 | fixed | Mark `rebuild later: paper` to `drop`. Its skeleton (lines 31-165) is Pattern 1 of `references/paper_structure_patterns.md` (lines 13-52), which is `rebuild: paper`. Finding 8 holds. |
| 57 | `templates/latex_article_template.tex` | 1-199 | holds | |
| 58 | `templates/literature_review_template.md` | 1-135 | holds | |
| 59 | `templates/policy_brief_template.md` | 1-139 | holds | |
| 60 | `templates/revision_tracking_template.md` | 1-199 | holds | |
| 61 | `templates/theoretical_paper_template.md` | 1-119 | holds | |

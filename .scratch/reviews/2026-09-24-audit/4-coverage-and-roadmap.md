Review of docs/academic-coverage.md against the four research-hub skills, and of roadmap entries 3 to 16 and 15.A. Nothing was changed.

## Checks run

- `utils/check_coverage.py` usage line: `check_coverage.py <coverage.md> <skills root> <skill>...`. I ran the command from the brief. It printed `ok: docs/academic-coverage.md` and exited 0.
- File counts from `find -H <skill> -type f | wc -l`: academic-paper 61, academic-paper-reviewer 26, academic-pipeline 30, deep-research 52. That is 169.
- Mark counts from `grep -o '| rebuild later: [a-z-]*'`, `grep -o '| rebuild: [a-z-]*'` and `grep -c '| drop |'`:
  - rebuild later: paper 11, literature 6, paper-review 3, researcher 1. This matches the counts in 15.A.
  - rebuild: paper 30, paper-review 21, literature 19, rebuttal 7, researcher 6, idea 3, writing 3, submit-manuscript 1.
  - drop: 58.
- The four `computedHash` values in research-hub `skills-lock.json` match lines 7 to 10 of the doc.

## Rows sampled (57), read in full or at the sections the reason relies on

- **academic-paper:** SKILL.md; agents abstract_bilingual, formatter, intake, socratic_mentor; examples commitment_ledger, revision_recovery; references abstract_writing_guide, academic_writing_style, apa7_extended_guide, changelog, domain_evidence_profiles, failure_paths, journal_submission_guide, paper_structure_patterns, plan_mode_protocol, revision_patch_protocol, vlm_figure_verification, workflow_phase_details, writing_judgment_framework, writing_quality_check; templates bilingual_abstract, conference_paper, imrad, theoretical_paper.
- **academic-paper-reviewer:** agents field_analyst; examples interdisciplinary_review; references calibration_mode_protocol, changelog, guided_mode_protocol, integration_guide, sprint_contract_protocol, statistical_reporting_standards, top_journals_by_field.
- **academic-pipeline:** examples full_pipeline, mid_entry; references ai_research_failure_modes, changelog, external_review_protocol, integrity_review_protocol, mode_advisor, progress_dashboard_template, reinforcement_content, reproducibility_audit, score_trajectory_protocol, two_stage_review_protocol.
- **deep-research:** SKILL.md; agents bibliography, editor_in_chief, research_architect, research_question; examples idea_diversity_coverage_gap_advisory; references argumentation_reasoning_framework, changelog, cross_agent_quality_definitions, equator_reporting_guidelines, interdisciplinary_bridges, logical_fallacies, socratic_mode_protocol.

Every mark type is in the sample. Rows not listed under a finding below had a mark and reason that matched the file.

## Findings

**1. Roadmap gap (high): the 15.A gate cannot pass.**
- Entry 15.A: "`grep -c 'rebuild later:' docs/academic-coverage.md` prints 0".
- The command prints 22 today: 21 table rows plus line 15, the definition of the marks (`` - `rebuild later: <skill>`: the file belongs to that new skill... ``). Line 15 keeps the count at 1 or more after every row is rebuilt.
- Fix: gate on `grep -c '| rebuild later: ' docs/academic-coverage.md` (21 today), or reword line 15.

**2. Roadmap gap (high): no entry's gate checks its `rebuild:` rows.**
- Doc line 14 says the entry's skill "must cover what the file does before that entry's gate". No gate in entries 3 to 14 checks this.
- Example: entry 5 names two script tests, the `\cite` and DOI checks, and one blind comparison. Its 30 paper rows include:
  - `agents/integrity_verification_agent.md`
  - `agents/claim_ref_alignment_audit_agent.md`
  - `references/plagiarism_detection_protocol.md`
  - `references/ai_research_failure_modes.md`: blocks when Modes 1, 3, 5 or 6 lack user logs
  - `references/anti_leakage_protocol.md`
  - the statement and figure-trace pages
- The same holds for entries 3 (3 rows), 6 (21), 7 (7), 9 (19), 10 (3), 13 (6) and 14 (1). Only 15.A requires a row to be re-marked with the file that holds it.
- Fix: add the 15.A rule to each entry's gate: every row marked `rebuild: <skill>` names the file of `skills/<skill>/` that holds it. Make it checkable by giving `check_coverage.py` a mode that requires each such reason to name an existing path under that skill.

**3. Roadmap order (high): entry 16 can remove the academic skills before submit-manuscript exists.**
- `references/journal_submission_guide.md` is `rebuild: submit-manuscript` (entry 14). It holds the predatory-journal check, anonymisation, line numbers, and suggested and excluded reviewers.
- Entry 16 waits on "5 to 10" and 15.A, and 15.A waits on 5, 6, 9 and 13. Nothing makes 16 wait on 14, so the academic skills can be removed while this row is unbuilt.
- Fix: entry 16 waits on 14, or on every entry that has at least one row (3, 5, 6, 7, 9, 10, 13, 14).

**4. Roadmap order (medium): paper (entry 5) needs lookups that are assigned to literature (entry 9).**
- The `agents/integrity_verification_agent.md` row gives paper "every reference looked up rather than trusting memory", and entry 5's gate has a DOI check.
- The lookup protocols are all `rebuild: literature` (entry 9): crossref_api_protocol, openalex_api_protocol, semantic_scholar_api_protocol, arxiv_api_protocol, source_verification_agent. Entry 5 does not wait on 9.
- The row also says "the literature skill reuses them", which reverses the build order.
- Fix: build 9 before 5 and have 5 wait on it, or assign the lookup protocols to entry 5.

**5. Roadmap gap (medium): entry 16 asks for side-by-side runs that entries 7 and 10 do not have.**
- Entry 16: "5 to 10, each with its side-by-side run passed".
- Entry 7 (rebuttal) has only a completeness check. Entry 10 (idea) has "one real run that you review". Neither defines a side-by-side run, so 16's condition is undefined for them.
- Fix: add a blind side-by-side gate to 7 (against academic-paper revision-coach and rebuttal-audit on a real round) and to 10 (against deep-research socratic mode), or restate 16.

**6. Lost capability (medium): part of the vlm_figure_verification row is deferred with no booking.**
- Row: `references/vlm_figure_verification.md | rebuild: paper | ... the vision check can come later.`
- The file's vision check is "Required" at the final check. It covers:
  - plotted values match the data
  - all series present
  - no truncated or overlapping text, fonts at 8pt or larger
  - at most 2 refinement iterations
- The row is marked `rebuild`, not `rebuild later`, so 15.A never carries the deferred part and no entry builds it.
- Fix: build the check at entry 5, or split it out as `rebuild later: paper`.

**7. Wrong reason (medium): the formatter_agent row describes conversion only.**
- Row: `agents/formatter_agent.md | rebuild later: paper | The formatter converts a paper to LaTeX ... The papers start from the venue's LaTeX template, so the first gate does not need it`.
- The file also holds a pre-output checklist that applies to every ML submission whatever the template:
  - abstract within its limit
  - Limitations section present
  - AI disclosure, CRediT, funding and data-availability statements present
  - figure paths correct
  - LaTeX compiles with no errors
  - author information removed for blind review
  - "journal requirement > user preference"
  - formatting never changes content (word count within 1 percent)
  - a version-family consistency scan before output
- Fix: assign the checklist to paper (entry 5) or submit-manuscript (14), keep conversion as `rebuild later`, and say so in the reason.

**8. Wrong mark (low): imrad_template.md repeats a pattern that is already kept.**
- Row: `templates/imrad_template.md | rebuild later: paper`.
- Its skeleton (1.1 Context, 1.2 Problem, 1.3 Gap, 1.4 Purpose and RQs, 1.5 Significance, then Literature, Methodology 3.1 to 3.7, Results, Discussion 5.1 to 5.6) is the same as Pattern 1 of `references/paper_structure_patterns.md`. That file is `rebuild: paper`, and its row already says the paper skill needs the IMRaD skeleton.
- Fix: `drop`, pointing to paper_structure_patterns.md.

**9. Wrong target (low): argumentation_reasoning_framework.md goes to paper-review, but its users go elsewhere.**
- Row: `references/argumentation_reasoning_framework.md | rebuild: paper-review`.
- No reviewer file references it. `grep -rln argumentation_reasoning_framework` finds only `deep-research/SKILL.md`.
- The file's "Application by Agent" table names synthesis, devils_advocate, source_verification, socratic_mentor and research_architect. Those files are marked literature, idea or researcher.
- The doc's own rule ("marked for the skill that takes most of it") points to literature.
- Fix: `rebuild: literature`, with paper-review named as a second user.

**10. Wrong reason (low): the field_analyst_agent row says the journal list has no ML venue.**
- Row: "since `references/top_journals_by_field.md` lists no ML venue".
- Lines 46 and 47 of that file list the Journal of Machine Learning Research and IEEE TPAMI.
- The top_journals row itself says "names no ML conference", which is correct.
- Fix: reword to "no ML conference".

**11. Lost capability (low to medium, needs your ruling): style calibration is dropped with no reason.**
- The intake_agent row says the paper skill "has no use for ... style calibration".
- intake_agent Step 10 learns the author's voice from 3 or more of his past papers. It is a soft guide, and discipline conventions win.
- For a series of ML papers by one author this may be wanted. The row gives no reason for the drop.
- Fix: state the reason (for example, that the writing base's prose standard replaces it) or mark it `rebuild later: paper`.

**12. Lost capability (low): the literature report loses its editorial review.**
- Row: `deep-research/agents/editor_in_chief_agent.md | drop` points to paper-review's rubric.
- That rubric reviews papers, not the literature skill's research report. With the EIC dropped, the report_compiler's two-loop revision (kept in the report_compiler row) has no editorial reviewer driving it.
- The kept deep-research devils_advocate "checks the finished report", which covers only part of this.
- Fix: say in the literature rows which reviewer drives the revision loop, or keep the EIC's five-dimension check in literature.

**13. Weak deferral (low): abstract and ethics rows are deferred against a narrower goal than entry 5's.**
- The abstract_bilingual_agent and abstract_writing_guide rows defer because "the first gate, a revision round, needs neither". Entry 5's goal names drafting, and every drafted paper has an abstract (no citations, abbreviations defined, the five parts).
- ethics_checklist and ethics_review_agent (`rebuild later: paper`) hold the data-licence and dual-use checks that ML venue checklists ask for at submission.
- Nothing is lost because 15.A comes before 16, but these rules arrive after the paper skill is already in use.
- Fix: move them to entry 5, or narrow entry 5's goal to match.

**14. Cosmetic: entry 8 (grant) waits on 2 "for the coverage", but no row names grant.** The funder acknowledgement text is routed to grant only inside the paper row for funding_statement_guide.md.

## Verdict

The per-file marks are mostly sound. Of 57 sampled rows, 7 have a defect in the row (findings 6 to 12), and 2 deferrals are weak (finding 13). Most defects are one wrong reason, target or mark, but findings 6 and 7 leave parts of a file unbooked.

The document is not yet a trustworthy basis for entries 3 to 16. The roadmap does not enforce it:
- No gate from 3 to 14 checks its `rebuild` rows (finding 2).
- The 15.A gate cannot pass (finding 1).
- Entry 16 can remove the academic skills before submit-manuscript is built (finding 3), with an undefined condition for entries 7 and 10 (finding 5).
- Paper's reference lookups are assigned to an entry built after it (finding 4).

After fixes 1 to 7, with 8 to 12 as row edits, it can be used as the basis.

Files: /Users/axelfaes/workspace/ordo/docs/academic-coverage.md, /Users/axelfaes/workspace/ordo/docs/roadmap.md, /Users/axelfaes/workspace/ordo/utils/check_coverage.py

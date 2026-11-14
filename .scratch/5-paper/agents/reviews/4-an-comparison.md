# Step 4, open item AN: paper against academic-paper 3.2.0 after repair round 1

Agent: a7057ce7078cb5012, ordo-high, claude-opus-5-5, 255643 tokens, 184 tool uses, 25.6 min.

I compared the worktree /Users/axelfaes/workspace/ordo/.agents/worktrees/5-paper-4 as it stands now: head 95aa872, with 43 entries in `git status --short`, so the step's uncommitted work is included. I changed nothing. I started no agent and invoked no skill.

## Files read

Each source path is relative to /Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper/. After the arrow are the paper files that hold its content. Paper files are relative to skills/paper/ in the worktree.

1. SKILL.md -> SKILL.md, references/modes.md, references/peer-reviewer.md
2. agents/abstract_bilingual_agent.md -> references/draft-writer.md ("The abstract and the keywords")
3. agents/argument_builder_agent.md -> references/planner.md ("The argument")
4. agents/citation_compliance_agent.md -> references/citation-compliance.md, SKILL.md Steps 12
5. agents/draft_writer_agent.md -> references/draft-writer.md, references/patch-file.md, templates/anchorize_tex.py, templates/apply_tex_patch.py
6. agents/formatter_agent.md -> SKILL.md (closing checks, Steps 11 and 14), references/peer-reviewer.md; the conversion part is nowhere (AK puts it in a later step)
7. agents/intake_agent.md -> references/intake.md, SKILL.md Steps 6
8. agents/literature_strategist_agent.md -> references/literature-strategist.md, templates/lookup.py
9. agents/peer_reviewer_agent.md -> references/peer-reviewer.md, SKILL.md items 10-11
10. agents/revision_coach_agent.md -> nowhere (routed to rebuttal)
11. agents/socratic_mentor_agent.md -> nowhere (plan mode, AK later step; refusal text at SKILL.md:88)
12. agents/structure_architect_agent.md -> references/planner.md
13. agents/visualization_agent.md -> references/visualization.md
14. examples/chinese_paper_example.md -> nowhere (zh-TW, excluded)
15. examples/clinical_citation_verification_checklist.md -> references/citation-compliance.md ("Claims in clinical papers"), references/draft-writer.md (Clinical)
16. examples/clinical_epistemic_status_example.md -> references/citation-compliance.md ("Claims that go beyond their source")
17. examples/commitment_ledger_example.md -> nowhere (routed to rebuttal)
18. examples/imrad_hei_example.md -> nowhere (holds no rule; the section shapes are in planner.md)
19. examples/literature_review_example.md -> nowhere (holds no rule; the skeleton is in planner.md)
20. examples/plan_mode_guided_writing.md -> nowhere (plan mode, AK later step)
21. examples/revision_mode_example.md -> references/peer-reviewer.md, references/draft-writer.md, in part
22. examples/revision_recovery_example.md -> nowhere in paper (routed to rebuttal); the REVIEWER_DISAGREE status is in paper under AD6
23. examples/version_family_reconciliation_example.md -> references/citation-compliance.md ("Versions of one work")
24. references/abstract_writing_guide.md -> references/draft-writer.md
25. references/academic_writing_style.md -> nowhere in paper (routed to writing: rules.md, registers.md)
26. references/anti_leakage_protocol.md -> references/draft-writer.md
27. references/apa7_chinese_citation_guide.md -> nowhere (zh-TW, excluded)
28. references/apa7_extended_guide.md -> references/draft-writer.md ("Statistics and language"), references/latex-template.md
29. references/changelog.md -> nowhere (version log)
30. references/citation_format_switcher.md -> nowhere (format conversion, AK later step)
31. references/credit_authorship_guide.md -> references/statements.md
32. references/disclosure_mode_protocol.md -> references/ai-disclosure.md, references/intake.md
33. references/domain_evidence_profiles.md -> references/intake.md ("The evidence profile"), references/literature-strategist.md
34. references/failure_paths.md -> references/draft-writer.md, references/peer-reviewer.md, references/intake.md; planner.md holds only AD2
35. references/funding_statement_guide.md -> references/statements.md
36. references/hei_domain_glossary.md -> nowhere (Taiwan HEI terms in romanized Chinese, excluded)
37. references/journal_submission_guide.md -> references/statements.md, references/ai-disclosure.md; the cover letter part is nowhere
38. references/latex_template_reference.md -> references/latex-template.md
39. references/mode_selection_guide.md -> references/modes.md, SKILL.md
40. references/paper_structure_patterns.md -> references/planner.md
41. references/plan_mode_protocol.md -> nowhere (refusal line at modes.md:50 and SKILL.md:88)
42. references/policy_anchor_disclosure_protocol.md -> references/ai-disclosure.md, in part
43. references/policy_anchor_table.md -> nowhere
44. references/revision_patch_protocol.md -> SKILL.md Steps 9-10, references/patch-file.md, the two scripts
45. references/statistical_visualization_standards.md -> references/visualization.md
46. references/venue_disclosure_policies.md -> references/ai-disclosure.md
47. references/vlm_figure_verification.md -> references/visualization.md ("The rendered figure")
48. references/workflow_phase_details.md -> SKILL.md
49. references/writing_judgment_framework.md -> references/draft-writer.md ("Paragraphs", the clarity test), the rest routed to writing
50. references/writing_quality_check.md -> nowhere in paper (routed to writing; the draft writer's prose check under AJ uses rules.md)
51. templates/bilingual_abstract_template.md -> nowhere (zh-TW, excluded)
52. templates/case_study_template.md -> references/planner.md ("The Case Study skeleton")
53. templates/conference_paper_template.md -> references/planner.md ("The Conference Paper skeleton")
54. templates/credit_statement_template.md -> references/statements.md
55. templates/funding_statement_template.md -> references/statements.md
56. templates/imrad_template.md -> references/planner.md ("The IMRaD skeleton")
57. templates/latex_article_template.tex -> references/latex-template.md ("The article template")
58. templates/literature_review_template.md -> references/planner.md
59. templates/policy_brief_template.md -> references/planner.md
60. templates/revision_tracking_template.md -> nowhere in paper (routed to rebuttal)
61. templates/theoretical_paper_template.md -> references/planner.md

Handoff files read: academic-pipeline/references/literature_corpus_consumers.md (paper holds it in literature-strategist.md:66-80), academic-paper-reviewer/references/sprint_contract_protocol.md (dropped under D45), and the passport reset note at source SKILL.md:254 (pipeline stage boundaries only, no difference inside paper).

## UNRULED

### Full mode and general

U1. Deep-research handoff
- Source: agents/intake_agent.md:19: "**Handoff awareness** -- detect materials from deep-research and auto-import". Also :29 and :52: "I detected that you already have deep-research materials. The following parameters have been auto-populated".
- Paper: no text. modes.md:22 sends a research investigation to `researcher`.
- What the user sees: a user who brings a research report and an annotated bibliography from an earlier research run is asked every intake question again, and nothing is filled in from those materials.

U2. Domain evidence profiles
- Source: references/domain_evidence_profiles.md:9-18 lists `general_social_science`, `cs_ml`, `humanities_interpretive` and `unknown_user_defined`. Reserved profiles fall back with an advisory: "Selecting one records effective `unknown_user_defined` and surfaces a reserved-fallback advisory".
- Paper: references/intake.md:108-111 gives only `cs_ml` and `neutral`. "A profile the user asks for that is neither `cs_ml` nor `neutral` is recorded as `neutral (requested: <profile>)`".
- What the user sees: a humanities or social-science paper is screened with peer-review-only defaults. For example, older primary sources and expert-panel policy analyses get no profile that admits them.
- Coverage row 137 gives only a reason, and no plan.md ruling names the dropped profiles.

U3. Default paper type
- Source: agents/intake_agent.md:129: "Default: IMRaD (for empirical research) or Literature Review (for synthesis topics)". references/paper_structure_patterns.md:325: "Has original data collection | IMRaD".
- Paper: references/intake.md:79: "The default type is Conference Paper, which is the default skeleton of `references/planner.md`." references/planner.md:30: "The Conference Paper skeleton is the default".
- What the user sees: an empirical journal paper with original data, where no type was stated, is planned as a 2,000-5,000 word conference paper and not as IMRaD.
- D8 names the two skeletons for ML, not the default. Row 157 gives only a reason.

U4. The round-2 stop has no "lower paper ambitions" option
- Source: agents/peer_reviewer_agent.md:430-433: "(a) Manually revise and resubmit / (b) Lower paper ambitions (e.g., target a lower-tier journal) / (c) Accept current state, record issues in Limitations". references/failure_paths.md F7 note: "Consider switching target journals (lower the bar)".
- Paper: SKILL.md:282-286: "Accept ... An expanded revision ... End the run."
- What the user sees: at the failed round-2 stop the user is never told that a lower-tier venue is an option.
- AD3 adds the expanded revision and names neither (a) nor (b).

U5. Discipline registers
- Source: agents/draft_writer_agent.md:83: "**Default**: Third person, formal academic register". :87: "use full forms ("do not" over "don't")". :259-268 is the discipline register table.
- Paper: no text. SKILL.md:47-52 gives the draft writer the prose standard and `writing/references/rules.md` only. `grep -rn registers skills/paper/` finds nothing, while `skills/writing/references/registers.md` exists.
- What the user sees: a medicine or social-science draft is written without the register of its discipline, for example its voice and passive-or-active conventions.
- AJ names only the prose standard and the flagged terms.

U6. Paragraph length
- Source: agents/draft_writer_agent.md:255: "Each paragraph 120-200 words (EN)". SKILL.md:409: "Vary paragraph length naturally (2-8 sentences)".
- Paper: references/draft-writer.md:102: "A paragraph stays within the prose standard's length of about four sentences".
- What the user sees: paragraphs are about half as long as the source's.
- ADR 0002 decides this, but no plan.md ruling names it.

U7. Claim intent manifest and drift check
- Source: agents/draft_writer_agent.md:540-544: "Claim Intent Manifest Emission ... Before drafting the first prose block ... append ONE `claim_intent_manifests[]` entry". The orchestrator's `claim_drifts[]` flags claims that are EMITTED_NOT_INTENDED.
- Paper: references/draft-writer.md:69: "The agent writes no pre-commitment before the draft and no score of its own draft."
- What the user sees: no report lists a claim the draft makes that the plan did not intend.
- AI2 takes only the manifest's negative constraints, and row 206 gives only a reason.

U8. Cover letter
- Source: agents/formatter_agent.md:14: "formatted manuscript (target format) + cover letter (if journal submission)". journal_submission_guide.md:91-142 gives the cover letter.
- Paper: no text. ai-disclosure.md:48 and draft-writer.md:175 only tell the author what to mention in one.
- What the user sees: a full run for a journal ends with no cover letter.
- Row 110 sends it to submit-manuscript. No ruling names it.

U9. Blind-review version
- Source: agents/formatter_agent.md:756: "Blind review version -> remove all author information".
- Paper: references/intake.md:99 records the "blind-review model" among the venue limits, and no role acts on it (`grep -i anonym` in paper finds nothing).
- What the user sees: a double-blind venue still gets a main.tex with author names and affiliations, even though intake asked about the blind-review model.

U10. Journal class and conference layout
- Source: agents/formatter_agent.md:832-834: "Elsevier journals -> elsarticle.cls ... IEEE journals -> IEEEtran.cls". :911: "Conference paper | Typically requires 2-column layout".
- Paper: no text (no hit for elsarticle, IEEEtran or twocolumn). latex-template.md:3 uses the venue's template only when Materials in hand lists one.
- What the user sees: with no template supplied, a draft for an IEEE or Elsevier venue starts as a one-column `article`.

U11. Compile engine
- Source: agents/formatter_agent.md:680: "PDF **MUST** be compiled from LaTeX via `tectonic` or `xelatex`".
- Paper: SKILL.md:182: "run `latexmk -pdf ...` there, with `-xelatex` in place of `-pdf` when the Notes of `config.md` name XeLaTeX".
- What the user sees: by default the manuscript compiles with pdfLaTeX, so non-Latin text that needs a system font fails unless the user writes XeLaTeX in the Notes.
- No ruling names the engine. M names only the compile-fix pass.

U12. The policy-anchor disclosure track
- Source: references/disclosure_mode_protocol.md:6: "(b) a policy-anchor-specific disclosure" for PRISMA-trAIce, ICMJE, Nature and IEEE, with references/policy_anchor_table.md.
- Paper: no text for the anchors. Row 136 says "Policy anchors stay unrendered" and row 147 drops the table; both are reasons only.
- What the user sees: a systematic review cannot get a PRISMA-trAIce disclosure, and an ICMJE journal gets only a venue statement.

U13. Funder formats and placement by publisher
- Source: references/funding_statement_guide.md:111 and :134: "This work was supported by JSPS KAKENHI Grant Number JP12345678." :114 gives the DFG format. :252: "Springer Nature | Under "Declarations" section". templates/funding_statement_template.md:238 is headed "ARC / NHMRC".
- Paper: references/statements.md:108-118 lists NSF, NIH, ERC, Horizon Europe, UKRI, SSHRC, NSERC and ARC. It has no JSPS, DFG or NHMRC row and no table of placement by publisher.
- What the user sees: a JSPS- or DFG-funded paper gets a generic statement, and a Springer paper gets no Declarations section.
- Row 159 says only "Taiwanese formats" are left out.

U14. F5: a whole reference list in the wrong format
- Source: references/failure_paths.md:126-144: "Citation format error rate > 50% ... Identify root cause (user may have selected the wrong citation format) ... Confirm the correct citation format".
- Paper: no text. citation-compliance.md corrects each entry on its own.
- What the user sees: when the citation style was chosen wrongly, the run corrects entries one by one instead of asking whether the style is wrong.
- AK rules that the failure paths are built. Row 138's drop of F5 is a reason only.

### Outline-only and lit-review

U15. A missing research question outside lit-review
- Source: agents/literature_strategist_agent.md:574: "RQ not clearly defined | Return to intake_agent for user to clarify -> cannot start search".
- Paper: references/literature-strategist.md:17: "In the other modes it takes the topic as the question the search answers".
- What the user sees: in full and outline-only mode, a run with no research question searches on the bare topic instead of asking for the question.
- AD11 covers lit-review mode only.

U16. Long screening lists are not truncated
- Source: agents/literature_strategist_agent.md:345: "Lists with more than 50 entries truncate to first 20 + last 5 alphabetically, with an appendix file".
- Paper: no text in the screening block (literature-strategist.md:66-80).
- What the user sees: the .bib screening block of a large .bib lists every key in review.md, and there is no appendix file.

### Figures

U17. Appendix figure numbering and scale bars
- Source: agents/visualization_agent.md:160: "Appendix figures: Figure A1, Figure B1, etc." references/statistical_visualization_standards.md:43: "Scale bars (for images/maps)".
- Paper: no text. visualization.md:552-606 numbers figures by first mention, and the ten checks have no scale-bar check.
- What the user sees: appendix figures are numbered on from the body figures, and a map or micrograph can pass with no scale bar.

## DEFECT

X1. F2 is said to be held but is not built
- Coverage row 138 says "F2 (a structure that does not fit the question) is held in `skills/paper/references/planner.md`". AK rules that the failure paths are built.
- Source: failure_paths.md:62-80: "RQ is a causal question but a Literature Review structure was selected; No data but IMRaD was selected; ... Word count target and structure are mismatched (e.g., 3000-word IMRaD)".
- Paper: planner.md:525 checks only "Each aspect of the question has a section". planner.md:36 is AD2's path after the user disagrees.
- What the user sees: a 3,000-word IMRaD paper, or a causal question planned as a Literature Review, reaches the outline's approval with no flag.

X2. Coverage row 144 is stale
- The row says: "The paper skill keeps only the conference and IMRaD skeletons".
- Under AM, planner.md:118-235 also holds the Literature Review, Theoretical, Case Study and Policy Brief skeletons.

X3. Coverage row 120 is stale
- The row says the claim check of the epistemic example is kept "in citation-check mode".
- Under AF the agent also runs in full and revision mode (SKILL.md Steps 12).

X4. Coverage row 134 contradicts the skill
- The row drops `citation_format_switcher.md` because "no hand conversion ... is needed".
- modes.md:51 and SKILL.md:89 say a request such as "convert the citations to IEEE" is format conversion, "built at roadmap entry 5, in a step of its own" (AK).

X5. Coverage row 159 is incomplete
- The row says the statements page leaves out only "Taiwanese formats".
- JSPS, DFG and NHMRC are also missing (U13).

X6. The abstract parts by paper type
- Source: templates/theoretical_paper_template.md has "Key contribution (new framework/critique/extension): 2 sentences". templates/case_study_template.md has "Lessons and transferability: 1 sentence".
- Paper: draft-writer.md "The five parts" has one Background, Purpose, Method, Results, Implications form for every type except the conference form.
- AM brought these types into the planner, so their abstracts lose the contribution part and the transferability part.

## RULED

- Database lookups through lookup.py: D5, D15
- Chinese search rules dropped: AD16
- In-text locator, output gate and trust-chain field not built: AI1
- Passport corpus replaced by the .bib: D13
- Planner and abstract roles: D43, T
- Weak-argument signs shown at the outline's approval: T
- Generator-evaluator and sprint contract dropped: D45
- Draft writer's writing sweep: AJ
- Citation compliance in full and revision: AF
- Retractions: AD7, X
- Self-plagiarism flag: AD8
- Round-2 Critical rule regardless of score: U
- Expanded revision: AD3
- REVIEWER_DISAGREE: AD6
- RAISE check: V
- LaTeX output, Markdown and DOCX not written: D25, C
- Plan mode, the socratic mentor, F1, F8, F10, format conversion and the citation switcher in a later step of plan 5: AK, D3
- revision-coach, rebuttal-audit and the response letter: D1, AD13
- Spectrum labels: AD15
- Integrity and ethics checks moved to researcher: D42, D51, D56
- Null-result rule removed: D52
- No negative results: AT
- Full re-emission excluded and the base file overwritten: C
- Evidence void: AD1
- Structure disagreement: AD2
- Existing main.tex: AD4
- Re-anchorize and retry: AD5
- draft-review and figures calls: AD14
- Case-study, theoretical and policy-brief types: AM
- Conference and IMRaD skeletons written for ML: D8
- Clinical boundary: AH
- Version family, failure paths and the LaTeX reference built: AK
- Claim-check calibration: AP
- Claims not to make: AI2
- Venue policy pasted: W
- Disclosure records: AD10
- Disclosure written by the draft writer: AD9
- Model loop removed: D47, N
- Final-message markers: AG
- Unfinished run and resume: Z
- Earlier outputs: Y
- Revision with no instructions and the scope approval: AA
- Plain request: AB
- Intake questions per mode: AD12
- Injected instructions not followed: AD17
- Visualization "confirm if ambiguous": "The stops of paper"
- Lit-review in one start: D48
- Revision shape with two readings: D49
- citation-check second start: L
- Reference fix: K
- Compile fix: M
- DOI question: O
- No cap on changes: R
- Figure markers: S
- Literature strategist by default and the sources' review: J
- `/writing` findings at the end: D46

Mode walk, each covered by the rulings named:
- outline-only: source 1->2->3; paper's planner writes the argument (T)
- revision: source 8->5->6; paper adds reading 1, a writer pass and reading 2 (D49, AF)
- abstract-only: source 1->7; paper uses the draft writer (T)
- disclosure: source 9 only; paper uses the draft writer (AD9)
- citation-check: source 6 only; paper adds a second start (L)
- lit-review: source 1->2; paper adds the sources' review and the reference checks (J, K)
- full: source 9 agents plus visualization; paper uses six roles (D43, AF, J)

## ROUTED

- academic_writing_style.md, writing_quality_check.md and writing_judgment_framework.md go to `writing`: coverage rows 129, 154 and 153, approved by AJ and D46. U5 is the part of row 129 that paper's draft writer never reads.
- revision_coach_agent.md, commitment_ledger_example.md, revision_mode_example.md, revision_recovery_example.md and revision_tracking_template.md go to `rebuttal`: rows 114, 117, 125, 126 and 160 (164 for the tracking template), approved by D1.

## Already found

1. Claims not to make: confirmed.
   - SKILL.md:195: "flagged for the user with suggested wording and no patch".
   - citation-compliance.md:46: "marks it Critical and the session raises the stop".
2. Expanded revision starts the strategist fresh: confirmed.
   - SKILL.md:288: "with the strategist started as a fresh agent given the review".
   - SKILL.md:518: "started once as a fresh agent and then resumed ... in these cases", and the expanded revision is not among those cases.
3. ADR 0025 pass count: confirmed. Line 33: "at most three passes driven by other roles' or scripts' issues" leaves out the expanded revision's passes and the `disclosure` restart.
4. Patch id `disclosure` in full mode: confirmed.
   - SKILL.md:142 and draft-writer.md:301 use it in full mode.
   - patch-file.md:42 defines `disclosure` as "The statements of disclosure mode".
5. Stale coverage rows 223, 138 and 249: confirmed.
   - Row 223 names only "the flag of citation-check mode", while intake.md:53 asks Earlier papers in full, revision and citation-check.
   - Row 138 F2: see X1.
   - Row 249 says "All of `paper`'s part is held in ... citation-compliance.md and lookup.py", while its point (6) is held in the SKILL.md prompts and point (5) is dropped with a reason only.
6. cite-keys and biblatex commands: confirmed.
   - latex-template.md:191: "reads every command whose name begins with `cite`".
   - lookup.py:135 has the regex `\\cite[A-Za-z]*\*?...`, which does not match `\textcite`, `\parencite` or `\autocite`, all listed at latex-template.md:210-212.
7. Headings with no blank line before them: confirmed by awk at citation-compliance.md:321, draft-writer.md:63, :159 and :177.
8. calibration_counts.py docstring: confirmed.
   - Line 16 lists the exit-2 errors.
   - Lines 58-59 also exit 2 for "a row does not have N cells", and lines 79-82 for a wrong argument count. The docstring names neither.
9. Script paths and count: confirmed.
   - citation-compliance.md:371 names `skills/paper/templates/calibration_counts.py`, while SKILL.md:406 names `templates/calibration_counts.py`.
   - SKILL.md:83 and :514 say "three scripts", and templates/ holds four .py files.

## Declined

- Chinese and zh-TW content was not compared, as the brief excludes it. chinese_paper_example.md, apa7_chinese_citation_guide.md and bilingual_abstract_template.md were read by their headings only, since every section is zh-TW citation or abstract format. hei_domain_glossary.md was read in part (Taiwan HEI terms).
- The `shared/` files the source names, such as shared/handoff_schemas.md, do not exist in research-hub's .agents/skills.
- academic-pipeline/agents/integrity_verification_agent.md (690 lines) and academic-pipeline/SKILL.md were not read whole. The source hands them only fabricated-citation verification (SKILL.md:410) and "the complete workflow" (SKILL.md:370). The first moves to researcher under D42, D51 and D56, and paper's own part of it is the lookup.py resolve check. academic-paper-reviewer/references/re_review_mode_protocol.md was not read, since it is named only from commitment_ledger_example.md, which is routed to rebuttal.
- The deep-research files the source names (socratic_mentor_agent.md, source_quality_hierarchy.md, SKILL.md) were not read, since the brief names only academic-pipeline and academic-paper-reviewer.
- Wording differences and file layout were not reported, as the brief says.

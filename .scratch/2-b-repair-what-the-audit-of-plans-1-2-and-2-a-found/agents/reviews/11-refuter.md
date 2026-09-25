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

## Repair round 1, refuted

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md
  -> 10 PASS: lines, 10 ok: lines, verify: 12 commands passed, exit 0
python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
  -> ok: docs/academic-coverage.md, exit 0
grep -cE '^\| [0-9]+ \|' .scratch/.../agents/reviews/11-rows.md -> 61
records vs find -H academic-paper -type f -> same set of 61, each once; record order = section order; all 61 "1-<n>" equal wc -l; every Words column equals the recomputed base and current counts
changed rows vs fixed records (base from git show ebf3c8c) -> 50 and 50, changed_equals_fixed; 49 rows changed in this round
awk over35 on lines 50-115 -> over35: 2 (60 54, 64 46); at cee396b 46; at ebf3c8c 50
round-start vs now word counts for lines 54, 55, 59, 60, 88, 90, 92, 100 -> 39,37,39,44,36,36,36,36 to 35,35,35,54,35,35,35,35 (as reported)
mark diff vs base -> 3 changes (abstract_bilingual_agent.md, abstract_writing_guide.md to rebuild: paper; imrad_template.md to drop)
grep -c '| rebuild later: <skill> |' -> paper 8, literature 6, paper-review 3, researcher 1 (base: 11, 6, 3, 1); docs/roadmap.md:120 reads "8 for paper, 6 for literature, 3 for paper-review, 1 for researcher"
git diff ebf3c8c -U0 hunks -> docs/academic-coverage.md lines 54-113 only; docs/roadmap.md line 120 only
sed -n 50,115p | grep -c -E 'dropped\. \|$' -> 0; no cell ends in "go." or "goes."; "later planning dialogue" -> 0 in the section, no hit in docs, skills, README.md
LC_ALL=C grep -c '[^ -~]' on the doc, roadmap, 11-rows.md, 11-report.md -> 0 each; section still 66 lines
grep -n -i code .../references/anti_leakage_protocol.md -> no output, exit 1 (builder's correction of line 79 holds)
```

### Spec

- docs/academic-coverage.md:54 (SKILL.md): the round removed the file's drop of the generator-evaluator contract (SKILL.md 161-260) and of the higher-education defaults (line 18, 460). The current row only says "zh-TW triggers have no use", so under `rebuild: paper` entry 5 must now cover the four-call writer/evaluator protocol. Record 1 does not mention the removal. Ruling 7 required the shortening to keep every destination.
- docs/academic-coverage.md:59 (formatter_agent.md): the round removed "zh-TW fonts go". The Chinese LaTeX settings (693-724), the xeCJK fallback (846-850) and the Chinese Pandoc command (578) no longer have a drop, so the `rebuild later: paper` mark puts them in entry 15.A. Record 6 does not mention this. Rulings 2 and 3 hold.
- docs/academic-coverage.md:81 (apa7_extended_guide.md): the base named "(headings, title page, reference forms, bias-free language)"; the current row says only "the APA page rules". Bias-free language (171-188) and the extended citation and reference forms (55-122) are not page rules, so the row no longer says where they go.
- docs/academic-coverage.md:60 (intake_agent.md): rulings 4, 5 and L (a) hold. The round dropped the interim home for venue limits ("keeps those limits in the project until roadmap entry 13's `venues/` files hold them"); now intake's Step 3 venue profile (136-143) has no home between entries 5 and 13.
- docs/academic-coverage.md:90 (journal_submission_guide.md): "The paper skill's statements take its templates" replaced "the data, CRediT and AI templates"; the file's cover-letter template belongs with `submit-manuscript`, so "its templates" names the wrong set.
- docs/academic-coverage.md:66: "Ten figure checks include value fidelity, as entry 5 requires." Entry 5 (roadmap.md:43) has no value-check requirement.
- Rulings 1, 2, 3, 5, 8, 9, 10 and 11: closed.

### Proof

- 11-report.md, Result table row 2 ("changed 12 fixed 12") and "Wrong in the brief" ("46 are" over; roadmap line 120 "was not changed") are false for the current tree (50 changed rows, 2 cells over 35, line 120 changed), covered only by a blanket "superseded" line.
- Ruling 12 (no git command run by the builder): not verifiable from the tree.

### Standards

- Ten cells now begin with "It" or "Its" (lines 55, 68, 77, 81, 83, 90, 94, 95, 98, 99), where the base had one (prose standard 0 and E).
- docs/academic-coverage.md:87: "off-length drafts list sections, never deleting" gives the listing to the draft; failure_paths.md 90-101 has the skill list the over-length chapters and leave deletion to the user.
- docs/academic-coverage.md:91: "the fixed `apa7` class" does not say what "fixed" means (the justification override and the `\tabcolsep` formula, 177-200).
- docs/academic-coverage.md:59: "`SKILL.md` takes the checklist" does not say which checklist (the pre-output checklist, formatter_agent.md 309-338 and 790-826).

### Behaviour

- The removed drops on lines 54, 59 and 81 change what entries 5 and 15.A must build; the report says each shortened cell keeps "each mark, destination and deciding content".

### The two long cells

- Line 60 (54 words): no version of about 35 words keeps every required destination with a verb per clause; the shortest found is 49 words, 55 with the interim home for venue limits restored.
- Line 64 (46 words): can reach 39 words: "Entry 15.A builds this planning dialogue (readiness check, thesis, chapter questions, convergence caps) with plan mode, the three-question intake, stress test, scoring, chapter plan and plan-to-draft gate. `idea` reuses its taxonomy; commitment gates and wording patterns have no use."

### Not checked

- The source files of rows 57, 58, 61, 62, 63, 65, 67, 68, 69, 70, 71, 74, 75, 76, 83, 84, 88, 93, 95, 96, 98, 102, 103, 108, 111 and 113 were not read whole; rows 55, 57, 59, 64, 66 and 87 only in the parts their reasons cover.
- Whether the builder ran any git command in this round.
- The `shared/` files the source skill references.

Reviewer usage: 247,793 tokens, 54 tool uses, 648 s (the runner's completion notification; reviewer claude:opus, agent ac24d4cbbea7ffc4f).

## Repair round 2, refuted

```
env -u CLAUDE_CONFIG_DIR -u ORDO_SKILL_DIRS -u ORDO_STABLE sh utils/verify.sh .scratch/2-b-repair-what-the-audit-of-plans-1-2-and-2-a-found/orchestrator-state.md
  -> 10 PASS: lines, 10 ok: lines, verify: 12 commands passed, exit 0
python3 utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer academic-pipeline deep-research
  -> ok: docs/academic-coverage.md, exit 0
grep -cE '^\| [0-9]+ \|' .../agents/reviews/11-rows.md -> 61; with '.*\| reserved \|' -> 0
records vs find -H academic-paper -type f -> same set of 61, no duplicates; record order = section order; every "1-<n>" equals wc -l
git show ebf3c8c section == builder's MAIN copy (cmp: same); changed vs fixed -> 50, 50, changed_equals_fixed
mark diff vs ebf3c8c -> abstract_bilingual_agent.md and abstract_writing_guide.md to rebuild: paper; imrad_template.md to drop
awk cells over 35 words, lines 50-115 -> over35: 14, as reported
awk sentences over 35 words, lines 50-115 -> sentences over 35: 0 (longest 32, line 109)
grep -c '| rebuild later: <skill> |' -> 8, 6, 3, 1; docs/roadmap.md:120 -> 8 for paper, 6 for literature, 3 for paper-review, 1 for researcher
LC_ALL=C grep -c '[^ -~]' doc, roadmap, 11-rows.md, 11-report.md -> 0 each; section 66 lines; every row has 3 cells
first word of each reason cell in (It|Its) -> 0; "later planning dialogue|as entry 5 requires" -> 0
grep -rn "35 words" skills docs README.md -> no output, exit 1
"have no use." endings in the section -> 3 (lines 54, 59, 64); at ebf3c8c -> 0
```

### Spec

- docs/academic-coverage.md:60 (intake_agent.md): the base named materials and co-authors among the fixed fields (Steps 8 and 9, lines 183-201; SKILL.md 376) and the rule that venue limits are recorded only as the scholar states them (138-140); the row now carries none of the three. Record 7 says the row "Keeps the fixed fields" and leaves out co-authors.
- docs/academic-coverage.md:81 (apa7_extended_guide.md): the drop of the APA page rules for headings (40-53) and the title page (7-28) is no longer stated; the running head (30-32), abstract page (34-38) and table and figure format (123-153) have no row. Record 28 says it "Names each rest" but omits headings and the title page.
- docs/academic-coverage.md:66 (visualization_agent.md): round 2 removed "with LaTeX templates" (164-199), which no ruling asked for; record 13 says the row keeps them. The decision tree (43-73) picks the chart type; dpi (79-88) and palettes (100-127) are separate figure standards, while the row says the tree picks chart types "at 300 dpi in colourblind-safe palettes".
- docs/academic-coverage.md:57 (citation_compliance_agent.md): the base named automatic format correction (33, 128-159); round 1 removed it and round 2 did not restore it. Record 4 says it is "folded into 'checked'".
- docs/academic-coverage.md:90 and :59: the cover letter (and at :59 blind-review removal) goes to `submit-manuscript`, but roadmap entry 14 (roadmap.md:106-108) names portal filling and a submission record, not a cover letter.
- Rulings 2, 3, 5 to 11: done as ruled. Ruling 4 done for bias-free language and the reference forms.

### Proof

- 11-report.md line 1 and its Result row "Reason length | NOT DONE" count cells over 35 words; ruling 2e limits sentences, and no sentence in lines 50-115 is over 35. It also says lines 60 and 64 are "permitted by" rulings 5 and 6, which set no length.
- 11-rows.md record 15: "the clinical safety note (82)"; line 82 of clinical_citation_verification_checklist.md is "Limitation preserved:", the safety note is at 87-88.
- 11-report.md, round 2 ruling 1: records 4, 7, 13 and 28 claim parts kept that the rows no longer carry.

### Standards

- docs/academic-coverage.md:54, :59, :64: each cell ends "X, Y and Z have no use." (prose-standard.md:18, no repeated construction).
- docs/academic-coverage.md:77: "Its checklist repeats ..." follows a sentence whose subject is "Abstracts" (prose-standard.md:59).
- docs/academic-coverage.md:68: the reference is made the subject of all four checks; in the file the source holds the number (24) and the draft must match population and outcome and keep the limitations (25-27).
- docs/academic-coverage.md:96: "from each policy page and access date" reads as if the access date were a source.

### Behaviour

- 11-report.md's table of rows that change what entry 5 or 15.A must build leaves out line 90 (CRediT 144-161 and AI 186-203 templates added to the paper statements) and lines 60 and 81.

### Not checked

- The source files of rows 77, 92, 94 and 99 (read whole by the review over round 1); journal_submission_guide.md and latex_template_reference.md beyond the ranges rulings 7 and 10 name.
- The line references and "Keeps all of it" claims of the records round 2 rewrote for unchanged rows (3, 5, 9, 10, 12, 14, 16-18, 21-23, 31-33, 35, 40, 44, 49, 50, 53-55, 58, 60).
- The record 11 line ranges of argument_builder_agent.md and mode_selection_guide.md.
- Whether the builder ran any git command.
- The `shared/` files the source skill references.

Reviewer usage: not known (reviewer claude:opus, agent a98eb3004ccd75ea7; no completion notification received).

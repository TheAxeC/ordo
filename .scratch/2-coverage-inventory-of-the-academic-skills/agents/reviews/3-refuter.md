# Step 3 refuter

## Verification lines

All commands were run from `/Users/axelfaes/workspace/ordo/.agents/worktrees/2-3`, base `a1b2330` (`git rev-parse HEAD`). `git status --short` prints `?? docs/academic-coverage.md` and `git diff a1b2330 --stat` prints nothing, so the whole change is that one untracked file.

```
python3 -B utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper
ok: docs/academic-coverage.md
exit 0
PASS: land.sh and usage.py scratch tests
PASS: check_config.py scratch tests
PASS: collect_findings.py scratch tests
PASS: sync_rules.py scratch tests
PASS: pin.sh scratch tests
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
layout exit 0
ascii exit 0
LC_ALL=C grep -n '[^ -~]' docs/academic-coverage.md   -> no output, exit 1
wc -l docs/academic-coverage.md                        -> 108
find .../academic-paper -type f | wc -l                -> 61
grep -o '| \(rebuild later: [a-z-]*\|rebuild: [a-z-]*\|drop\) |' docs/academic-coverage.md | sort | uniq -c
  17 drop / 2 rebuild later: literature / 8 rebuild later: paper / 2 rebuild: literature / 21 rebuild: paper / 1 rebuild: paper-review / 5 rebuild: rebuttal / 1 rebuild: researcher / 1 rebuild: submit-manuscript / 3 rebuild: writing  (total 61)
research-hub skills-lock.json computedHash: all four match docs/academic-coverage.md:7-10
```

## Sample

Read in full (27 files):

- `SKILL.md`
- `agents/abstract_bilingual_agent.md`, `agents/formatter_agent.md`, `agents/socratic_mentor_agent.md`, `agents/visualization_agent.md`
- `examples/version_family_reconciliation_example.md`
- `references/domain_evidence_profiles.md`, `references/venue_disclosure_policies.md`, `references/plan_mode_protocol.md`, `references/workflow_phase_details.md`, `references/disclosure_mode_protocol.md`, `references/policy_anchor_disclosure_protocol.md`, `references/journal_submission_guide.md`, `references/credit_authorship_guide.md`, `references/funding_statement_guide.md`, `references/apa7_extended_guide.md`, `references/failure_paths.md`, `references/latex_template_reference.md`, `references/revision_patch_protocol.md`, `references/writing_quality_check.md`, `references/writing_judgment_framework.md`, `references/changelog.md`
- `templates/credit_statement_template.md`, `templates/funding_statement_template.md`, `templates/imrad_template.md`, `templates/latex_article_template.tex`, `templates/bilingual_abstract_template.md`

What the sample covers:

- 6 drops: plan_mode_protocol, workflow_phase_details, policy_anchor_disclosure_protocol, latex_article_template.tex, bilingual_abstract_template, changelog.
- 8 `rebuild later`: abstract_bilingual_agent, formatter_agent, socratic_mentor_agent, apa7_extended_guide, latex_template_reference, failure_paths, imrad_template, version_family_reconciliation_example.

Read only in part (see Not checked):

- `agents/peer_reviewer_agent.md`: lines 1-300 in full, 300-602 by headings.
- `references/statistical_visualization_standards.md`: lines 1-508 in full, 509-750 by headings.
- `examples/chinese_paper_example.md`: lines 1-80 plus headings and the fictional-reference lines.
- `examples/plan_mode_guided_writing.md`: lines 1-40 plus headings.
- `references/apa7_chinese_citation_guide.md` and `references/hei_domain_glossary.md`: headings only.
- `references/citation_format_switcher.md`: headings and Chinese lines only.
- `references/abstract_writing_guide.md`, `references/paper_structure_patterns.md`, `templates/literature_review_template.md`: headings only, to check claims made in other rows.

## Spec

1. **The APA guide is marked `rebuild later` although it holds the only statistics rules.**
   - Where: docs/academic-coverage.md:75, `references/apa7_extended_guide.md | rebuild later: paper | ... the statistics reporting rules (exact p values, an effect size and a 95 percent confidence interval for every test, decimal places). ... the statistics rules join the paper skill's statistics page.`
   - What is wrong: roadmap entry 5's goal names "figures and statistics" for the paper skill. This file is the only rule file in academic-paper that states statistics reporting rules. `grep -rln -i "effect size\|exact p\|confidence interval"` finds, apart from this file, only figure pages, abstract pages and examples. The mark therefore puts a rule that entry 5's goal lists into `rebuild later`, and the row's own sentence, which sends the rules to the paper skill's statistics page, contradicts its mark.
   - A second error: "a 95 percent confidence interval for every test" is not what the file says. It says "Effect sizes: always report" and gives only the format "Confidence intervals: 95% CI [lower, upper]".
   - Fix: mark it `rebuild: paper`, with the statistics rules as the reason and APA page formatting as the part that is not needed first (or not carried). Reword the CI clause to match the file.

2. **The policy-anchor drop says one rule carries over, but the file holds three that no kept file states.**
   - Where: docs/academic-coverage.md:89, `The rule that transfers, an uncertain category of AI use is never written as used, is in references/disclosure_mode_protocol.md`.
   - What is wrong: the source file also states these venue-neutral rules:
     - ICMJE text attribution: AI-quoted material is attributed, and AI output is never cited as a primary source (source line 80).
     - The copyediting carve-out differs by venue: Nature needs no disclosure for copyediting-only use, while IEEE still requires one in the acknowledgments (source lines 112-118).
     - The seven-row precedence for when to write a "no AI was used" statement and when to write nothing (source lines 35-43).
   - `grep -rn -i "primary source\|copyedit"` outside the two policy_anchor files finds none of these. The intro (line 16) promises that a drop names the file that keeps its rules.
   - Fix: name each rule with its destination (the IEEE carve-out and placement to the IEEE venue file, the ICMJE attribution rule to the paper skill's disclosure page), or say why each one is dropped.

3. **The plan-mode drop names the wrong file as keeping the activation rules.**
   - Where: docs/academic-coverage.md:88, `The plan-mode flow (...) and its activation signals. Every step is stated again in agents/socratic_mentor_agent.md ... this file adds no rule of its own.`
   - What is wrong: the six intent signals and the default "prefer plan when ambiguous" rule (source lines 91-103) are not in `socratic_mentor_agent.md`. The default rule is at `SKILL.md:59`, and one signal at `references/mode_selection_guide.md:79`. The other signals appear only in this file.
   - Fix: name `SKILL.md` and `mode_selection_guide.md` for the activation rules, and say whether the remaining intent signals are dropped.

4. **The CRediT template row misplaces one checklist item.**
   - Where: docs/academic-coverage.md:101, `a checklist (every author has a role, someone leads the original draft, an AI tool is never an author, all co-authors agree the roles)`.
   - What is wrong: the Quality Checklist (source lines 111-123) has no co-author agreement item. That sentence is in the Notes, at line 129.
   - Fix: "...a checklist (...), and the note that all co-authors agree the roles".

## Proof

none. Every figure in `3-report.md` reproduces: 108 lines, the `ok:` line with exit 0, the ten mark counts totalling 61, the empty non-ASCII scan, eight `PASS:` lines, ten `ok:` lines, a clean ASCII check, and "Open items: none" (orchestrator-state.md:50).

## Standards

5. **Two rows exceed the brief's limit of two sentences.**
   - docs/academic-coverage.md:53 (formatter_agent, three sentences: "...not carried. The papers are written in LaTeX from the venue template, so conversion is not needed for the first gate.").
   - docs/academic-coverage.md:58 (socratic_mentor_agent, three sentences: "...planning comes later; ... The prediction-commitment game and the wording-pattern list are not carried.").
   - Fix: merge or cut to two sentences.

6. **Several rows break the prose standard's sentence length.**
   - The rule: prose-standard.md section E, "Sentence length: under roughly 20 words unless the mechanism needs more".
   - Many first sentences are 50 to 80-word lists. Clearly longer rows (whole-reason word counts): line 48 SKILL.md, 84 words; line 81 failure_paths, 90; line 86 mode_selection_guide, 92; line 91 revision_patch_protocol, 85; line 94 vlm_figure_verification, 85; line 53 formatter_agent, 93.
   - Fix: cut each list down to the items that decide the mark.

## Behaviour

7. **The paper skill's disclosure step would read files that do not exist until entry 13.**
   - Where: docs/academic-coverage.md:93, `references/venue_disclosure_policies.md | rebuild: researcher | ... so it moves into the researcher's venues/ files, which the paper skill's disclosure step reads.` The same pattern is at line 54 ("The venue limits move to the researcher's venue files") and line 53 ("the journal class list to the researcher's venue files").
   - What is wrong: roadmap entry 13 (researcher) waits on entries 5 to 12. When entry 5 is built, its disclosure step (disclosure statements are in entry 5's goal) has no venue policy data: the rows naming `paper` point at files that entry 13 creates later. A plan for entry 5 that starts from the rows naming `paper` would not find where venue policies live during its gate.
   - Fix: either mark line 93 `rebuild: paper` (the paper skill holds the venue data until entry 13 moves it into `venues/`), or state in the row what the disclosure step does before entry 13 exists: it asks the user for the policy, per disclosure_mode_protocol.

8. **The intro's check command fails on the tree as it stands.**
   - Where: docs/academic-coverage.md:3 ("This list says what happens to every file of the four academic skills") and :23 (the check command naming all four skills).
   - What happens: the command prints three `no '## academic-paper-reviewer|academic-pipeline|deep-research' section` errors and exits 1. That is expected until step 6, but a reader of main between steps 3 and 6 is told the list covers the four skills and that this command passes.
   - Fix: accept this until step 6 lands, or have the intro give the per-skill form of the command as the check of the sections present.

## Not checked

- The 34 rows outside the full-read sample, in particular 51, 52, 55, 57, 59, 62-64, 66, 68, 69, 72, 73, 78, 82, 86, 87, 96, 100, 103, 105, 107.
- Two rows depend on files read only by headings:
  - Line 65: whether paper_structure_patterns.md holds every section shape that imrad_hei_example.md shows.
  - Line 66: whether literature_review_template.md holds the whole structure of literature_review_example.md.
- Of the files named in the report's judgment calls, these were read only in part: peer_reviewer_agent.md (lines 300-602 by headings), statistical_visualization_standards.md (lines 509-750 by headings), chinese_paper_example.md, apa7_chinese_citation_guide.md, hei_domain_glossary.md, plan_mode_guided_writing.md and citation_format_switcher.md. The claims their rows make matched what was read.
- Whether each `rebuild`/`rebuild later` choice among the paper rows matches what entry 5's first gate needs, beyond findings 1 and 7. That is a judgment the user makes at step 7.

## Usage

270,436 tokens, 47 tool uses, 321 s.

## Repair round 1, refuted

Worktree `.agents/worktrees/2-3`, HEAD `a1b2330`; the round's delta is `diff cov-round1-start.md docs/academic-coverage.md` (lines 3, 20, 23, 48, 52-54, 57, 58, 60, 73, 75, 79, 81, 84, 86, 88-91, 93, 94, 101, 107).

### Verification lines

```
python3 -B utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper
ok: docs/academic-coverage.md
exit 0
eight PASS: lines (land.sh and usage.py, check_config.py, collect_findings.py, sync_rules.py, pin.sh, check_skill_layout.py, check_rule_inventory.py, check_coverage.py)
ten ok: lines of the layout check, layout exit 0
ascii exit 0
LC_ALL=C grep -n '[^ -~]' docs/academic-coverage.md   -> no output, exit 1
marks: 15 drop, 2 rebuild later: literature, 8 rebuild later: paper, 2 rebuild: literature, 24 rebuild: paper, 1 rebuild: paper-review, 5 rebuild: rebuttal, 1 rebuild: submit-manuscript, 3 rebuild: writing (total 61)
reasons of 70 words or more: line 75 (71), line 89 (73)
wc -l docs/academic-coverage.md -> 108
```

### Closures

1. Finding 1 closed: line 75 is `rebuild: paper`, and each statistics rule is at `apa7_extended_guide.md:155-169`; no other rule file states them.
2. Finding 2 closed in substance; two claims of the new reason are wrong (Spec 1 and 2).
3. Finding 3 closed: `SKILL.md:59` and `mode_selection_guide.md:77-81` hold the other signals; signal 5 is stated only in `plan_mode_protocol.md:101`.
4. Finding 4 closed; the same edit removed a correct item (Spec 3).
5. Finding 5 closed: no row has more than two sentences.
6. Finding 6 not closed: the round cut reasons of 70 words or more, but the finding named the sentence-length rule; 14 rows still have one sentence of 45 words or more: 50 (45), 51 (49), 55 (46), 56 (55), 59 (54), 62 (46), 64 (51), 68 (46), 69 (45), 81 (49), 89 (59), 92 (57), 97 (52), 101 (50).
7. Finding 7 closed for line 93 and line 54; on lines 53 and 81 the pointer was deleted rather than redirected (Spec 4).
8. Finding 8 closed for the command; line 3 still claims every file (Behaviour 1).

### Spec

1. docs/academic-coverage.md:89. "Three venue-neutral rules" includes a copyediting carve-out that differs by venue, which is not venue-neutral, and the row sends it to the disclosure page while line 90 sends IEEE's other rules to the paper skill's venue entries; entry 13 would move the venue entries and leave the carve-out behind.
2. docs/academic-coverage.md:89. "no other file states" is false for two of the three rules: `references/policy_anchor_table.md` states the ICMJE attribution rule (lines 74, 80) and both carve-outs verbatim (Nature 106, 112; IEEE 138, 145). Line 90 drops that table without saying where the policy text for line 89's rules comes from.
3. docs/academic-coverage.md:101. The fix for finding 4 also removed "an equal-contribution sentence", which the template has (`credit_statement_template.md:93-105`, checklist line 122).
4. The delta cut, from rows no finding named, clauses saying where parts of a split file go or that they are not carried, which the brief requires: line 53 (journal-specific formatting, provenance gates, zh-TW fonts), line 81 (the venue switch after a scope rejection), line 48 (Chinese triggers, higher-education defaults, the generator-evaluator machinery at `SKILL.md:163-252`), line 54 (zh-TW options, style calibration, the evidence profile machinery), line 58 (the commitment gates at `socratic_mentor_agent.md:72-102`), line 60 (LaTeX figure templates), line 84 (higher-education journal tables), line 86 (zh-TW trigger rows).
5. docs/academic-coverage.md:73. "never filled from the model's memory" is stronger than the source, which lets the user authorize filling a flagged gap, tagged `[LLM-SUPPLEMENTED]` (`anti_leakage_protocol.md`, "[MATERIAL GAP] handling", items 2 and 3).

### Proof

1. The report's round item 6 presents cutting reasons of 70 words or more as the closure of finding 6, which named the sentence-length rule (Closures 6). Every other figure of the report reproduces.

### Standards

1. Prose standard section E, sentence length, broken in the 14 rows listed under Closures 6.

### Behaviour

1. docs/academic-coverage.md:3 says the list covers every file of the academic skills installed in research-hub, while only `academic-paper` has a section.
2. docs/academic-coverage.md:89 and :90 put venue rules for the same venues in two places (Spec 1).

### Not checked

- Rows the delta did not change were not re-read against their sources.
- Changed rows were checked by targeted greps and section reads except `apa7_extended_guide.md`, `policy_anchor_disclosure_protocol.md`, `anti_leakage_protocol.md` and parts of `credit_statement_template.md`, read in full; `failure_paths.md`, `journal_submission_guide.md`, `revision_patch_protocol.md`, `vlm_figure_verification.md`, `visualization_agent.md`, `intake_agent.md`, `venue_disclosure_policies.md` and `revision_tracking_template.md` were not reread.
- Sentence counts come from a split on a full stop followed by a space and a capital or backtick.

### Usage

124,139 tokens, 30 tool uses, 250 s.

## Closed

- First run, findings 1 to 8: closed in repair round 1 (see `3-report.md`, "Repair round 1"), except finding 6, closed at landing.
- Run over the round, Closures 6 and Standards 1 (sentence length): fixed at landing; every reason is at most two sentences and no sentence is over 35 words, by the split on a full stop followed by a space and a capital or backtick.
- Spec 1, Spec 2 and Behaviour 2: fixed at landing. Line 89 names two venue-neutral rules for the disclosure page and sends the copyediting carve-out to the venue entries; line 90 says the Nature and IEEE venue entries, carve-out and placement included, are written from each policy's own page.
- Spec 3: fixed at landing; line 101 names the equal-contribution sentence again.
- Spec 4: fixed at landing; lines 48, 53, 54, 58, 60, 81, 84 and 86 again say where the rest goes or that it is not carried.
- Spec 5: fixed at landing; line 73 says a gap is filled from the model only when the user allows it, and is then tagged.
- Proof 1: the report's round item stands as written; the finding it describes is closed at landing above.
- Behaviour 1: fixed at landing; line 3 speaks of the skills that have a section below.

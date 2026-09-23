# Step 4 refuter

## Verification lines

Run from `.agents/worktrees/2-4` with `PYTHONDONTWRITEBYTECODE=1`; HEAD 7c50277, `git status --short` ` M docs/academic-coverage.md`, `git diff 7c50277 --numstat` `32 1 docs/academic-coverage.md`.

```
python3 -B utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer
ok: docs/academic-coverage.md
exit=0
eight PASS: lines (land.sh and usage.py, check_config.py, collect_findings.py, sync_rules.py, pin.sh, check_skill_layout.py, check_rule_inventory.py, check_coverage.py)
ten ok: lines of the layout check, exit=0
ASCII perl check: no output, exit=0
LC_ALL=C grep -n '[^ -~]' docs/academic-coverage.md: no output, exit=1
reviewer section marks: 4 drop, 5 rebuild later: paper-review, 16 rebuild: paper-review, 1 rebuild: rebuttal
wc -l docs/academic-coverage.md: 139
```

## Sample

- All 26 source files read in full; for `agents/domain_reviewer_agent.md` and `agents/devils_advocate_reviewer_agent.md` the sprint-contract section was compared by `diff` with the same section of `methodology_reviewer_agent.md`, read in full: the only differences are the perspective words.
- Every one of the 26 new rows (lines 114 to 139) checked against its source.
- `docs/academic-coverage.md` lines 1 to 45 read in full; the `academic-paper` section only where rows name `paper-review` or `rebuttal`.
- The `computedHash` of `academic-paper-reviewer` in research-hub's `skills-lock.json` matches the introduction.

## Spec

1. docs/academic-coverage.md:133, `references/review_quality_thinking.md`: "reviewer traps, such as writing the score before the comments". Writing the score first is the fix; the trap is "Positivity-severity oscillation | Being too nice in comments, too harsh in scores | Write the score first, then justify with comments".
2. docs/academic-coverage.md:120, `agents/devils_advocate_reviewer_agent.md`: "nothing is conceded below four or twice in a row". The source raises the bar for the next concession to 5/5 after a concession; a second concession in a row is allowed at 5.
3. docs/academic-coverage.md:121, `agents/editorial_synthesizer_agent.md`: "consensus counted over all reviewers". The denominator is "the 4 non-DA reviewers", and DA findings "do NOT participate in CONSENSUS-4/3/SPLIT counting".
4. docs/academic-coverage.md:115, `agents/field_analyst_agent.md`: "The user confirms the cards before the reviews" is not in the file (`grep -n -i confirm` prints nothing); the rule is `SKILL.md` Checkpoint Rule 1.
5. docs/academic-coverage.md:123, `examples/interdisciplinary_review_example.md`: "forty-seven features against them" is filed under "Overfitting (Major)", and the methodology reviewer's fallacy table already lists overfitting; only temporal leakage and SMOTE with twelve positives are missing from that list.
6. docs/academic-coverage.md:114, `SKILL.md`: the reason does not say where "Phase 2.5: REVISION COACHING" goes (revision work), nor covers the `quick` and `methodology-focus` modes or Checkpoint Rule 7 (untrusted review materials), which no kept row states.
7. docs/academic-coverage.md:119, `agents/perspective_reviewer_agent.md` marked `rebuild later`: entry 6's gate compares against academic-paper-reviewer, which runs R3, and first-gate rows assume R3 (the synthesizer's CONSENSUS-4, the R3 column of `references/editorial_decision_standards.md`, "all four reviewers" in the sub-claim example, R3's P1 finding in the interdisciplinary example). "For ML papers most of this reduces to assumptions and broader impact" is not in the source.
8. docs/academic-coverage.md:135, `references/statistical_reporting_standards.md` marked `rebuild later`: `agents/methodology_reviewer_agent.md` (marked `rebuild`) names it the primary reference for Step 4a and its Section 4 for the red-flag scan; the reason does not say what happens to Section 1 (universal checklist), Section 5 (higher-education methods) or Section 6 (completeness scoring).
9. docs/academic-coverage.md:132, `references/review_criteria_framework.md`: "keeps one scale" without saying which; `references/editorial_decision_standards.md` sets its decision criteria on the 1-to-5 scale.
10. docs/academic-coverage.md:136, `references/top_journals_by_field.md` dropped with a replacement rule no kept file states; `agents/field_analyst_agent.md` selects the journal from this file and recommends target journals, and `agents/eic_agent.md` points at it.
11. docs/academic-coverage.md:131, `references/re_review_mode_protocol.md`: the traceability check applies to Priority 1 items only (Priority 2 needs 80 percent answered, Priority 3 does not affect the decision); the residual coaching after re-review has no destination.

## Proof

1. Every figure of the report reproduces (139 lines, the `ok:` line, 16 / 5 / 1 / 4, eight `PASS:` lines, ten `ok:` lines, a clean ASCII check, no reason over two sentences; the longest sentence is 35 words, line 118).
2. Report item 4 claims the prose standard DONE; Standards 1 contradicts it.
3. The report shows the introduction's check command only after the change, with no before and after (change standard rule 7).

## Standards

1. docs/academic-coverage.md:114-139: 15 of 26 reasons open "The <thing>: <list>." (`grep -c -E "^The [^.:]{1,40}:"` prints 15), a repeated construction under the prose standard's section 0; the landed `academic-paper` section has the same shape in 8 of lines 46 to 60.
2. docs/academic-coverage.md:114, 116, 117: "the sprint-contract phases follow `references/sprint_contract_protocol.md`" appears word for word three times and does not say what happens to those phases.
3. No non-ASCII, dash asides, history words, reasons over two sentences or sentences over 35 words.

## Behaviour

1. docs/academic-coverage.md:18 ("the reason names where the rest goes") is false for lines 114 and 131 (Spec 6 and 11).
2. docs/academic-coverage.md:16 is false for line 136 (Spec 10).
3. The introduction's command now names both skills and passes; no other file names the command.

## Not checked

- Whether line 138 should mention the 0-to-100 dimension-score table of `templates/peer_review_report_template.md`.
- The `academic-paper` rows apart from those naming `paper-review` or `rebuttal`.
- Whether the interdisciplinary example's `rebuild` mark is right beyond Spec 5.

## Usage

207,415 tokens, 34 tool uses, 275 s.

## Repair round 1, refuted

Worktree `.agents/worktrees/2-4`, HEAD 7c50277; `git diff 7c50277 --numstat` `59 28 docs/academic-coverage.md`.

### Verification lines

```
python3 -B utils/check_coverage.py docs/academic-coverage.md /Users/axelfaes/workspace/research-hub/.agents/skills academic-paper academic-paper-reviewer
ok: docs/academic-coverage.md
exit=0
eight PASS: lines, ten ok: lines of the layout check, exit=0; ASCII check exit=0; non-ASCII grep no output
whole file: 19 drop, 2 rebuild later: literature, 8 rebuild later: paper, 3 rebuild later: paper-review, 2 rebuild: literature, 24 rebuild: paper, 19 rebuild: paper-review, 6 rebuild: rebuttal, 1 rebuild: submit-manuscript, 3 rebuild: writing
reviewer section: 4 drop, 3 rebuild later: paper-review, 18 rebuild: paper-review, 1 rebuild: rebuttal
139 docs/academic-coverage.md
```

No mark in the `academic-paper` section changed; no reason has more than two sentences; the longest sentence is 35 words.

### Closures

Spec 1 to 9 and 11, Standards 1 (label-and-colon openers) and Proof 3 closed, with the evidence at the source lines. Spec 10 not closed (Behaviour 1). Standards 2 partly closed (Proof 1).

### Spec

1. Line 48: "Eleven modes run an eight-phase flow"; the eight phases are the `full` flow, and modes such as `citation-check` or `format-convert` do not run them.
2. Line 60: the trace and "roadmap entry 5 names figures" read as part of the ten checks; the trace is a separate step (6.6).
3. Lines 114, 119, 120: no clause says where the sprint-contract sections of `SKILL.md` (the Sprint Contract Hard Gate), the perspective reviewer and the devil's advocate go.
4. Line 119: "keeps a purely technical paper to ethics, misuse risk and boundary conditions" turns the source's option into a restriction and leaves out "real-world feasibility of technical assumptions".
5. Lines 129 and 131: the round removed "at most two major rounds" and "an accept needs every required item fully addressed", which the reviewer section now states nowhere.
6. Line 59: "An outline is chosen from the paper type"; the source chooses a structure and then builds the outline.
7. Lines 48 to 108: the round rewrote 27 landed rows, which the report's DONE table does not list; Spec 1, 2 and 6 came in through them.

### Proof

1. The report says the sprint-contract clause names where the phases go; only line 117 names a file.
2. The report says the perspective edge case is as the source states it (Spec 4).
3. The report says the journals row points at the reviewer rows; the brief requires a file.
4. The other figures reproduce.

### Standards

1. "not carried" ends a reason 29 times, a repeated construction.
2. Lines 53 and 85 carry nearly the same sentence.
3. Lines 116 and 118 end on the same clause.
4. Lines 76 and 126 end with the same sentence.
5. No non-ASCII, dash asides, history, over-long reasons or sentences.

### Behaviour

1. Line 136 with line 16: `academic-paper/agents/intake_agent.md` asks for a target journal only optionally and does not say a reviewer takes its venue from there; the paper-review gate may run without an intake record, so the dropped file's venue selection has no replacement.
2. Line 18 holds for every cross-skill split in the delta.
3. The introduction's command names both skills and passes.

### Not checked

Unchanged `academic-paper` rows; most changed `academic-paper` rows compared old against new only; reviewer rows 124, 126, 128, 137 to 139 compared old against new; the existence of `tools/manuscript`'s scripts; whether the restated thresholds conflict with the rubric's decision mapping; section 7 of `references/statistical_reporting_standards.md`.

### Usage

153,996 tokens, 57 tool uses, 409 s.

## Closed

- First run, every finding: closed in repair round 1 (see `4-report.md`, "Repair round 1").
- Run over the round, fixed at landing:
  - Spec 1: the academic-paper `SKILL.md` row says the full mode runs the eight phases.
  - Spec 2: the visualization row separates the trace step from the ten checks.
  - Spec 3 and Proof 1: the reviewer `SKILL.md`, editor, methodology, domain, perspective and devil's-advocate rows each say where the sprint-contract part goes, naming `references/sprint_contract_protocol.md` or its protocol.
  - Spec 4 and Proof 2: the perspective row gives the source's options for a purely technical paper, feasibility included, as options.
  - Spec 5: the decision-standards row states that major rounds stop at two, and the re-review row that an accept needs every required item fully addressed.
  - Spec 6: the structure row says a structure is chosen and its outline built.
  - Spec 7: the rewrites of landed rows apply the prose standard, which the brief requires of the whole list; the facts they changed are corrected under Spec 1, 2 and 6.
  - Proof 3 and Behaviour 1: the journals row names `agents/field_analyst_agent.md` as keeping the venue step, and the field-analyst and editor rows say the target venue is asked of the user.
  - Standards 1: the "not carried" endings vary across four forms.
  - Standards 2: the LaTeX row's sentence no longer repeats the formatter row's.
  - Standards 3: the editor and domain rows end differently.
  - Standards 4: the reviewer changelog row no longer repeats the paper changelog row.

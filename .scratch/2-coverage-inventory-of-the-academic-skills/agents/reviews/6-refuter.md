# Step 6 refuter

## Verification lines

Run from `.agents/worktrees/2-6` with `PYTHONDONTWRITEBYTECODE=1`; HEAD 97ea646, `git status --short` ` M docs/academic-coverage.md`.

```
ok: docs/academic-coverage.md
exit 0
eight PASS: lines, ten ok: lines of the layout check, exit 0; ascii exit 0
LC_ALL=C grep -n '[^ -~]' docs/academic-coverage.md: nothing (exit 1)
231 docs/academic-coverage.md
whole file (169 rows): 59 drop, 30 rebuild: paper, 22 rebuild: paper-review, 17 rebuild: literature, 11 rebuild later: paper, 7 rebuild: rebuttal, 6 rebuild: researcher, 6 rebuild later: literature, 3 rebuild: writing, 3 rebuild: idea, 3 rebuild later: paper-review, 1 rebuild: submit-manuscript, 1 rebuild later: idea
deep-research (52 rows): 25 drop, 14 rebuild: literature, 4 rebuild later: literature, 3 rebuild: idea, 2 rebuild: paper-review, 2 rebuild later: paper, 1 rebuild: researcher, 1 rebuild later: idea
find over the four folders: 169; computedHash values match lines 7-10
```

## Sample

Read in full: `SKILL.md`, twelve agents (the Socratic mentor in part), two examples, nine references and the literature matrix template. Partly read or checked by claim: the remaining references, examples, the meta-analysis and risk-of-bias agents, and the other templates.

## Spec

1. Line 183 (`agents/editor_in_chief_agent.md`, drop): neither `academic-paper-reviewer/agents/eic_agent.md` nor its `references/quality_rubrics.md` states "no Accept while a critical issue stands"; only the reviewer `SKILL.md:178` states a narrower rule for the devil's advocate.
2. Line 192 (`agents/source_verification_agent.md`): the file flags an unverifiable reference for human review and removes only a fabricated one; "removes a reference no method confirms" is wrong.
3. Line 214 (`references/interdisciplinary_bridges.md`, drop): the file holds more search rules than one (the four-step expanding search, four cross-disciplinary strategies), which the row neither places nor drops.
4. Line 207 (`references/cross_agent_quality_definitions.md`, drop): the peer-review definition, the source tiers (which `agents/source_verification_agent.md` samples by but does not define), the minimum source counts and the CRITICAL definition are neither placed nor dropped.
5. Split files without a destination for part of their content: line 180 (fact-check and quick modes, report composition, the ethics stop, the two-loop cap), 182 (checkpoint 3), 184 (AI disclosure, attribution, fair representation, the 50 percent reference check, the self-citation audit), 187 (the revision protocol, the AI disclosure statement), 204 (its use by synthesis, verification, the mentor and the architect), 213 (F3, F4, F5, F7, F11, F12), 217 (its use by the literature devil's advocate).
6. Lines 181 and 194 disagree: automatic merging of a preprint with its proceedings version at the first gate against scholar choice later; the source keeps the more complete record of a duplicate.
7. Line 188 (`agents/research_architect_agent.md`, `rebuild later: idea`): method design is not in roadmap entry 10's goal; the reason does not say why it belongs to `idea` rather than the researcher or the paper skill.
8. Line 223 (`references/source_quality_hierarchy.md`): without the evidence pyramid the kept rubric has no scale for its Evidence Level criterion.
9. Line 196 (`examples/fact_check_mode.md`): not every claim gets a corrected sentence.
10. Lines 181 and 208: a failed lookup omits the field; nothing is marked "not checked".

## Proof

1. Lines 105 and 194 share the ending "its first gate", against the report's claim; "first gate" also ends lines 70 and 116.
2. The other figures reproduce.

## Standards

1. Ten reasons end on "..., without the <features>." (63, 72, 78, 101, 165, 181, 187, 191, 217, 222).
2. Four drops share the appositive ", (both) marked for `<skill>`, state(s) ..." (183, 202, 207, 221; 226 a variant).
3. Lines 205, 208 and 209 repeat one clause about roadmap entry 9, each worded differently.
4. Line 117: "that protocol file" now points at the wrong file, and the sentence is passive.
5. Line 181: the closing "without ..." attaches to the wrong clause.
6. Line 187: the same construction.
7. Line 192: passive where the actor matters.
8. Line 186: "tracked authors are reported" should be their new publications.
9. Verbless opening noun phrases: 67 and untouched rows 54, 64, 75, 86, 88, 90, 95, 98, 103, 107, 124, 128.

## Behaviour

1. Line 18 is false for lines 180, 182, 184, 187, 204, 207, 213 and 217.
2. "Every file was read in full before it was marked" is the builder's statement; Spec 2, 3 and 9 suggest otherwise.
3. Lines 3, 5 to 10 and 20 to 23 are true.

## Not checked

Several files read at heading or grep level (listed in the report); line 201's claim; untouched earlier rows except where a deep-research row points at them.

## Usage

256,733 tokens, 62 tool uses, 455 s.

## Repair round 1, refuted

HEAD 97ea646; the delta is `diff cov6-round1-start.md docs/academic-coverage.md`.

### Verification lines

```
ok: docs/academic-coverage.md
exit 0
eight PASS: lines, ten ok: lines of the layout check, exit 0; ascii exit 0; non-ASCII grep no output
231 docs/academic-coverage.md
whole file: 58 drop, 30 rebuild: paper, 22 rebuild: paper-review, 18 rebuild: literature, 11 rebuild later: paper, 7 rebuild: rebuttal, 6 rebuild: researcher, 6 rebuild later: literature, 3 rebuild: writing, 3 rebuild: idea, 3 rebuild later: paper-review, 1 rebuild: submit-manuscript, 1 rebuild later: researcher
deep-research: 24 drop, 15 rebuild: literature, 4 rebuild later: literature, 3 rebuild: idea, 2 rebuild: paper-review, 2 rebuild later: paper, 1 rebuild: researcher, 1 rebuild later: researcher
```

### Closures

Spec 1, 2, 6, 7, 9 closed; Spec 3, 4, 5 and 8 partly closed (Spec below); Spec 10 closed for row 181, row 208 wrong in a new way (Behaviour 1); Proof 1 closed; Standards 1 partly closed; Standards 2 and 4 to 8 closed; Standards 3 closed for the entry-9 clause; Standards 9 closed for the listed lines; Behaviour 1 still open.

### Spec

1. Line 207: the currency rule and the verification threshold are neither placed nor dropped.
2. Line 184: the conflict-of-interest section has no destination.
3. Line 204: the literature devil's advocate and the research architect, both named by the source's application table, are not placed.
4. Line 223: `academic-paper/references/domain_evidence_profiles.md` holds no ladder (its `cs_ml` line uses Level III of the pyramid), and the source calls the pyramid field-neutral, not clinical.
5. Line 214: reverse citation tracking is forward tracking (the strategist's Layer 3), not its chaining (Layer 2); there is one journal list, not lists; the review-papers step is stated nowhere.

### Proof

1. The report's closures for Spec 4 and 5 are overstated.
2. Line 72 changed a fact wrongly: the style file has discipline blocks, not a register table.
3. The other figures reproduce.

### Standards

1. Rows 54, 181, 191, 193, 222 end "... drops the <features>."; rows 63 and 78 both end "without the <adjective> examples."
2. Rows 180, 182, 187 (and 213) share one routing template.
3. Rows 185 and 224 repeat one clause about entry 9 having no systematic-review mode.
4. Verbless openings at lines 78, 81, 93.
5. Line 70: a vague qualifier ("often") and the unclear "In one work with two versions".
6. Line 207: three coordinated clauses run together.
7. Line 209: "the same pattern" has no antecedent in the row.

### Behaviour

1. Line 208: the omitted field avoids reading as "found", not "unmatched".
2. Line 217: only the deep-research devil's advocate uses the fallacy catalogue.
3. Rows 221 and 191 contradict each other on the reading probe.
4. Row 207 drops the CRITICAL definition that rows 213 and 182 rely on.
5. Line 18 is still false for rows 184, 204, 207.
6. Line 219 names no destination for fact-check requests.

### Not checked

Changed rows compared old against new only (listed in the report); untouched rows not re-read against their sources.

### Usage

166,848 tokens, 52 tool uses, 419 s.

## Closed

- First run, every finding: closed in repair round 1 (see `6-report.md`, "Repair round 1").
- Run over the round, fixed at landing:
  - Spec 1, Behaviour 4 and Standards 6: the shared-definitions row gives the literature skill everything except the per-mode source counts, the CRITICAL definition included, in one clear sentence.
  - Spec 2: the ethics row sends the conflict check to the paper skill's statements.
  - Spec 3: the argumentation row names both devil's advocates and the researcher's method step among its users.
  - Spec 4: the hierarchy row keeps the field-neutral seven-level scale and takes the ML gold standard from the `cs_ml` profile.
  - Spec 5: the interdisciplinary drop names forward citation tracking in the strategist, one journal list, and drops the review-papers tip.
  - Proof 1 and 2: the report's closures stand corrected here; the style row names the Engineering and CS discipline block.
  - Standards 1 to 5 and 7: the "drops the" and "without the ... examples" endings, the shared routing template of rows 182 and 187, the repeated entry-9 clause of row 224, the verbless openings of rows 78, 81 and 93, the version-family wording and the OpenAlex antecedent were rewritten.
  - Behaviour 1: the Crossref row says a value would read as checked.
  - Behaviour 2: `references/logical_fallacies.md` is `rebuild: literature`, its only user being the deep-research devil's advocate; the report's counts are corrected (literature 16 in the section, 19 overall; paper-review 1 and 21).
  - Behaviour 3: the protocol drop says the idea skill leaves out the reading probe.
  - Behaviour 5: line 18 holds for rows 184, 204 and 207.
  - Behaviour 6: the mode-guide row points fact-checks to `paper`.

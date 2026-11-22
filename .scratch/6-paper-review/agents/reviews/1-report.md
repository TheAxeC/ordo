Everything in the brief is done.

# Report of the builder, step 1 of entry 6 (paper-review)

## Open items of the state file

Read from `.scratch/6-paper-review/orchestrator-state.md` in the worktree, verbatim:

- none

## The cases' first read

The first read was made before any change. On the unchanged tree `skills/academic/paper-review/` did not exist, so each case was read on the source page it names, asking whether the six edits give the result the case states. No case showed a rule of the brief giving a wrong result, so nothing was handed back.

- Case `agents/eic_agent.md`: the source was read whole. Its frontmatter name, the two version-tagged headings, the clause on the full academic pipeline and the orchestrator's Phase 5 in line 18, and the `phase{M}_*/` bullet are each reached by edit 1, 2 or 4; the single-phase clause and the sole-deliverable sentence are untouched by any edit. Result: the case is reachable under the six edits.
- Case `agents/devils_advocate_reviewer_agent.md`: the source was read whole. The section "Relationship with deep-research devil's_advocate_agent" (source lines 135-147) and the subsection "Cross-Model DA (Optional, v3.0)" (source lines 346-349) fall under edit 2; "Role Boundaries", "Attack Intensity Preservation Protocol" and "Frame-Lock Detection" hold nothing an edit removes but a tag and characters. Result: reachable.
- Case `references/sprint_contract_protocol.md`: the source was read whole. Sections 1 to 11 keep their headings and numbers; the head block's schema, template and design lines fall under edit 2; step 1 of section 2 and the three rows of section 7 are restated under edits 2 and 4. Result: reachable.
- Case `references/top_journals_by_field.md`, the 8 rows with Chinese names: source lines 176-183 each hold a Chinese name followed by the English name in parentheses; edit 5 leaves the English name. Result: reachable.
- Case `references/integration_guide.md`: the source's 8 steps were read; step 1 is the deep-research step (edit 2), the others name the two skills (edit 1) and the two integrity checks. Result: reachable.
- Case `references/calibration_mode_protocol.md`: the source was read whole; the `Status` line, the `ARS_CROSS_MODEL` sentences, the cache folder clauses and the roadmap item fall under edits 2 and 4, and the phases, the report shape, the run counts and the limits are untouched. Result: reachable.
- Case "for every one of the 24 pages the diff is read whole": on the first read every source page was read whole and each place an edit applies was noted. Result: no place was found that needs a change outside the six edits.
- Case "the list of headings of the copy equals the source's": the source's headings were listed with `grep -n '^#'` per page. Result: the only headings an edit removes are the two sections of the Devil's Advocate page.
- Case `ls skills/academic/paper-review/references/changelog.md` finds no file: on the unchanged tree the folder did not exist. Result: holds.

## DONE / NOT DONE

| Item | State |
|---|---|
| 24 pages under `skills/academic/paper-review/`, each made by `cp` from its source and then edited | DONE |
| `skills/academic/paper-review/SKILL.md` not written | DONE (check 2 lists no such file) |
| Check 1, character set | DONE, output below |
| Check 2, the 24 paths | DONE, output below |
| Check 3, version tags | DONE, prints nothing |
| Check 4, names | DONE, 18 lines printed, each named below |
| Check 5, every page's diff read whole | DONE |
| Check 6, edit-written sentences read against the prose standard | DONE, departures named below |
| Heading lists compared with the source | DONE, differences listed below |
| `ls skills/academic/paper-review/references/changelog.md` | DONE, prints `ls: references/changelog.md: No such file or directory` (run inside `skills/academic/paper-review`) |

Output of checks 1 to 4 as printed, run from the worktree's root. Each block is the command's output followed by a line `exit status: <n>` that the run added:

```
--- check 1
exit status: 0
--- check 1b
exit status: 1
--- check 2
skills/academic/paper-review/agents/devils_advocate_reviewer_agent.md
skills/academic/paper-review/agents/domain_reviewer_agent.md
skills/academic/paper-review/agents/editorial_synthesizer_agent.md
skills/academic/paper-review/agents/eic_agent.md
skills/academic/paper-review/agents/field_analyst_agent.md
skills/academic/paper-review/agents/methodology_reviewer_agent.md
skills/academic/paper-review/agents/perspective_reviewer_agent.md
skills/academic/paper-review/examples/hei_paper_review_example.md
skills/academic/paper-review/examples/interdisciplinary_review_example.md
skills/academic/paper-review/examples/subclaim_decomposition_example.md
skills/academic/paper-review/references/calibration_mode_protocol.md
skills/academic/paper-review/references/editorial_decision_standards.md
skills/academic/paper-review/references/guided_mode_protocol.md
skills/academic/paper-review/references/integration_guide.md
skills/academic/paper-review/references/quality_rubrics.md
skills/academic/paper-review/references/re_review_mode_protocol.md
skills/academic/paper-review/references/review_criteria_framework.md
skills/academic/paper-review/references/review_quality_thinking.md
skills/academic/paper-review/references/sprint_contract_protocol.md
skills/academic/paper-review/references/statistical_reporting_standards.md
skills/academic/paper-review/references/top_journals_by_field.md
skills/academic/paper-review/templates/editorial_decision_template.md
skills/academic/paper-review/templates/peer_review_report_template.md
skills/academic/paper-review/templates/revision_response_template.md
--- check 3
exit status: 1
--- check 4
skills/academic/paper-review/references/review_quality_thinking.md:18:**If #5 is yes**: The argument depends on a single linchpin. Flag it: the paper's contribution is only as strong as that one piece of evidence.
skills/academic/paper-review/references/calibration_mode_protocol.md:65:| Calibration error | Mean &#124;rubric_score - ground_truth_severity&#124; | Per-dimension |
skills/academic/paper-review/agents/methodology_reviewer_agent.md:10:You are a research methodology expert, serving as Peer Reviewer 1. Your specific identity is dynamically configured by the field analyst's Reviewer Configuration Card #2.
skills/academic/paper-review/agents/domain_reviewer_agent.md:10:You are a senior researcher in the paper's field, serving as Peer Reviewer 2. Your specific identity is dynamically configured by the field analyst's Reviewer Configuration Card #3.
skills/academic/paper-review/agents/field_analyst_agent.md:165:[Card #1: EIC]
skills/academic/paper-review/agents/field_analyst_agent.md:166:[Card #2: Peer Reviewer 1, Methodology]
skills/academic/paper-review/agents/field_analyst_agent.md:167:[Card #3: Peer Reviewer 2, Domain]
skills/academic/paper-review/agents/field_analyst_agent.md:168:[Card #4: Peer Reviewer 3, Cross-disciplinary/Practical]
skills/academic/paper-review/agents/eic_agent.md:10:You are the Editor-in-Chief of a top-tier international academic journal. Your specific identity is dynamically configured by the field analyst's Reviewer Configuration Card #1.
skills/academic/paper-review/agents/perspective_reviewer_agent.md:10:You are a cross-disciplinary / practical perspective reviewer, serving as Peer Reviewer 3. Your specific identity is dynamically configured by the field analyst's Reviewer Configuration Card #4.
skills/academic/paper-review/examples/interdisciplinary_review_example.md:48:### Reviewer Configuration Card #1
skills/academic/paper-review/examples/interdisciplinary_review_example.md:61:### Reviewer Configuration Card #2
skills/academic/paper-review/examples/interdisciplinary_review_example.md:74:### Reviewer Configuration Card #3
skills/academic/paper-review/examples/interdisciplinary_review_example.md:87:### Reviewer Configuration Card #4
skills/academic/paper-review/examples/hei_paper_review_example.md:49:### Reviewer Configuration Card #1
skills/academic/paper-review/examples/hei_paper_review_example.md:62:### Reviewer Configuration Card #2
skills/academic/paper-review/examples/hei_paper_review_example.md:75:### Reviewer Configuration Card #3
skills/academic/paper-review/examples/hei_paper_review_example.md:88:### Reviewer Configuration Card #4
exit status: 0
```

Why each line of check 4 stays:

- `references/review_quality_thinking.md:18`, "If #5 is yes": "#5" is question 5 of the list above it in the page, the source's words, not an issue number.
- `references/calibration_mode_protocol.md:65`, `&#124;`: the HTML entity of the vertical bar inside a table cell, the source's bytes.
- The 16 lines with "Card #1" to "Card #4" (the four reviewer agent pages line 10, `agents/field_analyst_agent.md` lines 165-168, the two long examples' headings "Reviewer Configuration Card #n"): the number of a Reviewer Configuration Card, the source's name for the card, not an issue number.

Check 5: `diff <source page> <page>` was read whole for each of the 24 pages. Every hunk is one of the six edits.

Check 6: the sentences an edit wrote are listed under "Sentences rewritten under edit 4" and "Judgment calls". Each is one short declarative sentence in the source's vocabulary. One departs from plain grammar: the bullet "- No inflate into Phase 2 synthesis" (and its two variants). It keeps the source's own words from the parenthesis of the bullet it replaces, because the brief's case asks that the bullet keep the rule of its parenthesis and that the source's words stay where an edit does not need to change them.

Heading lists, compared per page with `diff <(grep '^#' source) <(grep '^#' page)`: the differences are a version tag, an issue number, a date, a dash, a section sign, a comparison sign or an emoji replaced inside a heading, the two headings "## Relationship with deep-research devil's_advocate_agent" and "### Cross-Model DA (Optional, v3.0)" left out, and "(Kong A1 / v3.11)" left out of "### Commitment Ledger Verification" and "(acceptance for #214)" out of "## What this example demonstrates". Pages with no heading difference: `agents/field_analyst_agent.md`, `examples/hei_paper_review_example.md`, `references/integration_guide.md`, `templates/peer_review_report_template.md`, `templates/revision_response_template.md`.

## Per page, what is left out

In the quotes a character outside ASCII is written by its name in angle brackets. Edits of kind 1 and replaced characters are not listed.

### All five reviewer agent pages and the synthesizer (`eic`, `methodology_reviewer`, `domain_reviewer`, `perspective_reviewer`, `devils_advocate_reviewer`, `editorial_synthesizer`)

Under "## Phase Boundary (v3.9.2)":

- "in the reviewer skill's `phase{M}_*/` directories where M != 1" (in the synthesizer's page "where M != 2"; the source has the not-equal sign). Edit 2: the skill has no such directories. The bullet reads as "## Round 1" below gives it.
- "Advisory verifier (`scripts/check_pipeline_integrity.py`) can detect violations post-hoc." Edit 2.
- "Deterministic PreToolUse hook deferred to v3.10 active conductor (#134)." Edits 2 and 4.
- "(v3.9.2)" in the heading and after "Enforcement", and "v3.6.2" in front of "Sprint Contract Protocol". Edit 4.

### `agents/eic_agent.md`

- Under "## Phase Boundary": "Within the full academic pipeline, the reviewer skill itself sits at the orchestrator's Phase 5 (Review), but". Edit 2.

### `agents/domain_reviewer_agent.md`

- Under "### Step 5: Field-Norm Severity Discipline (#215)": "and the first-party regression fixture at `evals/gold/field_norm_severity/`". Edit 2. "(#215)" in the heading. Edit 4.

### `agents/devils_advocate_reviewer_agent.md`

- Under "## Phase Boundary": "You are NOT the same agent as `deep-research/agents/devils_advocate_agent` (which is a multi-phase agent operating at Phase 1, 3, 5 + Socratic layers of the deep-research skill)." and "See the "Relationship with deep-research devil's_advocate_agent" section below for the canonical disambiguation." Edit 2.
- Under "## Phase Boundary", in the bullet on other personas: "especially: do NOT cross-bleed into the deep-research devils_advocate's multi-phase scope <em dash>". Edit 2.
- Under "## Phase Boundary", in the Enforcement line: "+ the disambiguation section (vs deep-research DA)". Edit 2.
- "(#215)" in "Field-norm gating of CRITICAL/MAJOR severity (#215)", in "### 9. Field-Norm Severity Calibration (#215)" and in "(Dimension 9 / #215)"; "(#216)" in "## Surface-Form Parity Self-Check (#216)" and in the two block markers; "(v3.0)" in "## Attack Intensity Preservation Protocol (v3.0)". Edit 4.
- The whole section below, source lines 135-147. Edit 2.

```
## Relationship with deep-research devil's_advocate_agent

| Dimension | deep-research version | reviewer version (this agent) |
|-----------|----------------------|-------------------------------|
| Stage | 3 checkpoints during the research process | Review after the paper is completed |
| Target | RQ, methodology, synthesis, research report | Complete academic paper |
| Depth | Detects logical fallacies at the research design level | Detects gaps in paper presentation and argumentation |
| Output | PASS/REVISE verdict | Issue list + strongest counter-argument |

The two are complementary: the deep-research version gates during the research phase, while this agent gates again during the paper review phase. Even if the paper already passed deep-research's devil's advocate, new gaps may be exposed in paper form.

---

```

- The whole subsection below, source lines 346-349, under "## Attack Intensity Preservation Protocol (v3.0)". Edit 2 (it rests on `ARS_CROSS_MODEL` and `shared/cross_model_verification.md`).

```
### Cross-Model DA (Optional, v3.0)

When `ARS_CROSS_MODEL` is set, do not send the paper automatically. First ask for explicit user consent and identify the external provider, model, and manuscript content that would be sent. If the user approves, send only the paper content needed for an independent DA critique (without your own DA findings <em dash> to prevent anchoring). Compare with your own findings <em dash> any novel CRITICAL/MAJOR issues not in your report <arrow> add as `[CROSS-MODEL-FINDING]`. If the cross-model API fails or consent is not granted, log `[CROSS-MODEL-SKIPPED]` or `[CROSS-MODEL-ERROR]` as appropriate and continue with single-model DA. See `shared/cross_model_verification.md` for setup and API patterns. When not set, standard single-model review operates unchanged.

```

### `agents/editorial_synthesizer_agent.md`

- Under "## v3.6.2 Sprint Contract Synthesizer Protocol": "(validator SC-11 warns)" after "for N == 1, vacuous". Edit 2.
- "(#216)" in "### Step 1c <em dash> Surface-Form Parity Check (#216)" and in the two block markers, and "#216," in "(#216, Kim et al. 2026 <section sign>F.3.6)". Edit 4.

### `agents/methodology_reviewer_agent.md`, `agents/perspective_reviewer_agent.md`, `agents/field_analyst_agent.md`

- Nothing beyond the list shared by the reviewer agent pages above. The field analyst page has nothing left out.

### `references/sprint_contract_protocol.md`

- Title: "(v3.6.2)". Edit 4.
- Head block: "> Schema: `shared/sprint_contract.schema.json` (Schema 13.1 since v3.6.6)." Edit 2.
- Head block: "> Templates: `shared/contracts/reviewer/*.json`." Edit 2.
- Head block: "> Design spec: `docs/design/2026-04-23-ars-v3.6.2-sprint-contract-design.md`." Edit 2.
- Head block, cross-reference: "this reviewer protocol is byte-equivalent across v3.6.2 <arrow> v3.6.6 (zero-touch promise per <section sign>3.6 of `docs/design/2026-04-27-ars-v3.6.6-generator-evaluator-contract-design.md`)." and "and design doc <section sign>5". Edits 2 and 4.
- Section 2, step 1: "Run `check_sprint_contract.py` on the in-memory object; abort on error." Edit 2.
- Section 3: "Schema cannot enforce this;". Edit 2.
- Section 4: "Not schema-enforced;" and "not validator" in "(orchestrator, not validator)". Edit 2.
- Section 6: "If > 5% of rounds abort in first 3 months, v3.6.3 introduces graceful-degradation fallback." Edit 4. "SR" in "real SR runs". Edit 2.
- Section 7: "SC-11 validator check ensures mode and `panel_size` are consistent." Edit 2.
- Section 8: "(SC-11 warns)". Edit 2.

### `references/calibration_mode_protocol.md`

- Head: "**Status**: v3.2". Edit 4.
- "(#215)" in the Purpose line and in the headings "### Phase 3.5: Severity-miscalibration measurement (#215)" and "## Severity-miscalibration histogram (#215)". Edit 4.
- Under "## Preconditions": ", no `~/.ars_calibration_cache/` directory" (edit 2) and "per the v3.2 design decision" (edit 4).
- Under "### Phase 1": "In calibration mode, `ARS_CROSS_MODEL` is **default-on** rather than opt-in." Edit 2.
- Under "### Phase 3.5": "The reference shapes are anchored to the first-party regression fixture at `evals/gold/field_norm_severity/` (W1 + <section sign>F.3.4 cases extracted verbatim from Kim et al. 2026); a finding that matches a fixture shape but lacks grounding is `high`." Edit 2.
- Under "## What this does NOT do": "(that's the AI Research Failure Mode Checklist, ROADMAP_v3.2.md item 2)". Edit 2.
- Under "### Same-family / rubric-aware judging": "This is the citation-integrity risk documented in the Anti-Hallucination Mandate (`academic-pipeline/agents/integrity_verification_agent.md`), countered there by independent reference lookup." Edit 2.
- Same subsection: ", but once invoked `ARS_CROSS_MODEL` is **default-on** (see "Cross-model verification" under Phase 1)". Edit 2.
- Same subsection: "in `shared/cross_model_verification.md`". Edit 2.
- Under "## Resolved design decisions (2026-04-09)": the date in the heading (edit 4), ", no `~/.ars_calibration_cache/`" (edit 2), "for v3.2" (edit 4).
- Under "## References": "- ARS `shared/cross_model_verification.md` <em dash> cross-model reviewer integration." Edit 2.
- Under "## v3.6.2 sprint contract status": "A template for this mode will follow in a subsequent patch release." Edit 4.

### `references/re_review_mode_protocol.md`

- Opening: "the dedicated mode for Pipeline Stage 3'," Edit 2.
- Under "## Input Requirements": "(Stage 3 output)". Edit 2.
- Heading "### Commitment Ledger Verification (Kong A1 / v3.11)": "(Kong A1 / v3.11)". Edit 4.
- In that section: "per `POSITIONING.md`" (edit 2), "#268" in "the #268 desync failure mode" (edit 4), "`shared/handoff_schemas.md`" in front of "Schema 11" (edit 2).
- Under the verification scope list: "Stage 4.5" in "left to Stage 4.5 integrity check". Edit 2.
- The three emoji in front of "Cannot verify", "Yes" and "Partial". Edit 4.
- Under "## v3.6.2 sprint contract status": "A template for this mode will follow in a subsequent patch release." Edit 4.

### `references/guided_mode_protocol.md`

- Under "### v3.6.2 sprint contract status": "A template for this mode will follow in a subsequent patch release." Edit 4.

### `references/integration_guide.md`

- In the code block: "Step 1: deep-research -> Research report". Edit 2. The copy numbers its eight remaining lines Step 1 to Step 8 in the source's order.

### `references/top_journals_by_field.md`

- Under "### Taiwan (TSSCI-Indexed)": the Chinese name in front of each of the 8 English names, and the parentheses around the English name. Edit 5.

### `references/quality_rubrics.md`

- "(v3.2)" in "## Known error profile (v3.2)". Edit 4.

### `references/review_criteria_framework.md`

- Under the opening: "(the two copies drifted once; issue #396)". Edit 4.

### `references/editorial_decision_standards.md`, `references/review_quality_thinking.md`, `references/statistical_reporting_standards.md`

- Nothing left out.

### `templates/editorial_decision_template.md`, `templates/peer_review_report_template.md`, `templates/revision_response_template.md`

- Nothing left out.

### `examples/hei_paper_review_example.md`, `examples/interdisciplinary_review_example.md`

- Nothing left out.

### `examples/subclaim_decomposition_example.md`

- Opening: "introduced for [#214](https://github.com/Imbad0202/academic-research-skills/issues/214)". Edit 4.
- Heading "## What this example demonstrates (acceptance for #214)": "(acceptance for #214)". Edit 4.
- Last bullet: "v3.6.2" in "the v3.6.2 sprint-contract arithmetic path". Edit 4.
- The two emoji in the headings "Old behavior" and "New behavior". Edit 4, replaced by the words "Wrong:" and "Right:".

## Per page, sentences rewritten under edit 4 as a present fact

- `agents/devils_advocate_reviewer_agent.md`, "### Origin". Source: "Added after observing that DA agents role-played by the same model as the paper-writing agent tend to concede findings too readily during re-review <em dash> because the model's training optimizes for conversational harmony. The author's persistent pushback was being treated as evidence of a valid rebuttal, when it was often just persistence." Page: "DA agents role-played by the same model as the paper-writing agent tend to concede findings too readily during re-review, because the model's training optimizes for conversational harmony. The author's persistent pushback is treated as evidence of a valid rebuttal, when it is often just persistence."
- `references/sprint_contract_protocol.md`, head block. Source: "> Authoritative orchestration reference for the ARS v3.6.2 sprint-contract hard gate." Page: "> Authoritative orchestration reference for the `paper-review` sprint-contract hard gate."
- Same page, head block. Source: "The v3.6.6 release adds a parallel generator-evaluator protocol inside `academic-paper` for the in-pair writer / evaluator pair (see `academic-paper/SKILL.md` <section sign> "v3.6.6 Generator-Evaluator Contract Protocol" and design doc <section sign>5)." Page: "> **Cross-reference**: a parallel generator-evaluator protocol runs inside `paper` for the in-pair writer / evaluator pair (see the `paper` skill's `SKILL.md`, "Generator-Evaluator Contract Protocol")." The heading exists at `skills/academic/paper/SKILL.md` line 814 (`grep -n 'Generator-Evaluator Contract Protocol' skills/academic/paper/SKILL.md`).
- Same page, section 1. Source: "The orchestrator loads a frozen template, inlines runtime fields". Page: "The session loads the frozen contract `SKILL.md` gives for the mode, inlines runtime fields". Edit 3 and decision 3 of the brief.
- Same page, section 2 step 1. Source: "Load template from `shared/contracts/<domain>/<mode>.json`." Page: "Load the contract of the mode from `SKILL.md`." Edit 3.
- Same page, section 3. Source: "**Template on disk is frozen.**" and "between template load and injection". Page: "**The contract as `SKILL.md` gives it is frozen.**" and "between contract load and injection". Edit 3.
- Same page, section 4. Source: "semantic judgement (whether triggers are concrete and discriminating) is deferred to a post-v3.6.2 judge-agent layer." Page: "the lint does not judge whether triggers are concrete and discriminating (semantic judgement)."
- Same page, section 6. Source: "Track `[PANEL-SHRUNK]` rate in real SR runs." Page: "Track `[PANEL-SHRUNK]` rate in real runs."
- Same page, section 7, three rows. Source: "not shipped in v3.6.2; continues pre-v3.6.2 behaviour" and twice "not shipped in v3.6.2", with an em dash as panel size. Page: "no contract; runs without the two-call protocol" and twice "no contract", with `-` as panel size.
- Same page, section 9. Source: "- `reviewer/full.json`:" and "- `reviewer/methodology_focus.json`:". Page: "- the full contract:" and "- the methodology-focus contract:". Edit 3.
- Same page, section 9. Source: "New expression forms require a PR updating both this <section sign>9 and the synthesizer prompt's recognised-pattern list." Page: "A new expression form is added to both this section 9 and the synthesizer prompt's recognised-pattern list."
- `references/calibration_mode_protocol.md`, `references/re_review_mode_protocol.md`, `references/guided_mode_protocol.md`, the last section. Source heading: "v3.6.2 sprint contract status". Source: "v3.6.2 introduces sprint contracts for `reviewer_full` and `reviewer_methodology_focus` only. A template for this mode will follow in a subsequent patch release. Until then, this mode runs without contract enforcement and retains its pre-v3.6.2 behaviour." Page heading: "Sprint contract status". Page: "Sprint contracts hold for `reviewer_full` and `reviewer_methodology_focus` only. This mode runs without contract enforcement."
- `references/calibration_mode_protocol.md`, "## Resolved design decisions". Source: "**Shipped gold sets**: not planned for v3.2." Page: "**Shipped gold sets**: not planned."
- `references/calibration_mode_protocol.md`, References. Source: "- ARS `academic-paper-reviewer/references/quality_rubrics.md` <em dash> scoring rubric definitions." Page: "- `references/quality_rubrics.md`: scoring rubric definitions." Edit 3.
- `examples/subclaim_decomposition_example.md`, opening. Source: "with the sub-claim decomposition introduced for [#214](...)." Page: "with the sub-claim decomposition."

## The terms

Glossary `docs/glossary.md`, read for each word an edit wrote:

- "the session": written for "the orchestrator" in the six agent pages with a sprint contract protocol and in `references/sprint_contract_protocol.md`. The glossary's entry "session, the" is "the Claude Code session that runs a skill", which is the sense here: the session that runs `paper-review` loads the contract and launches the reviewers.
- "reviewer": written in "the methodology reviewer", "the domain reviewer", "the perspective reviewer", "the Devil's Advocate reviewer". This is the source's name of the role, kept as the brief's "What it must do" says for a word of the source; it is not the glossary's plan reviewer.
- "step": written only in the renumbered "Step 1:" to "Step 8:" lines of `references/integration_guide.md`, the source's word in the source's sense.
- "mode": in "This mode runs without contract enforcement" and "the contract of the mode", the source's word for a mode of the skill; the glossary has no entry "mode".
- No other glossary term stands in words an edit wrote.

## Files and line counts

Columns: page under `skills/academic/paper-review/`, lines of the source, lines of the page (`wc -l`).

```
agents/devils_advocate_reviewer_agent.md 358 341
agents/domain_reviewer_agent.md 314 314
agents/editorial_synthesizer_agent.md 407 407
agents/eic_agent.md 237 237
agents/field_analyst_agent.md 211 211
agents/methodology_reviewer_agent.md 296 296
agents/perspective_reviewer_agent.md 329 329
examples/hei_paper_review_example.md 341 341
examples/interdisciplinary_review_example.md 270 270
examples/subclaim_decomposition_example.md 76 76
references/calibration_mode_protocol.md 229 227
references/editorial_decision_standards.md 218 218
references/guided_mode_protocol.md 34 34
references/integration_guide.md 15 14
references/quality_rubrics.md 118 118
references/re_review_mode_protocol.md 131 131
references/review_criteria_framework.md 180 180
references/review_quality_thinking.md 58 58
references/sprint_contract_protocol.md 139 136
references/statistical_reporting_standards.md 393 393
references/top_journals_by_field.md 206 206
templates/editorial_decision_template.md 200 200
templates/peer_review_report_template.md 267 267
templates/revision_response_template.md 241 241
```

The four differences: the Devil's Advocate page (two sections left out, 17 lines), the calibration page (the Status line and one References bullet), the integration guide (one step), the sprint contract page (three head-block lines).

## Judgment calls

1. The `phase{M}_*/` bullet is restated as "- No inflate into Phase 2 synthesis" (EIC: "- No inflate into Phase 2 editorial synthesis: that's the editorial synthesizer's work"; synthesizer: "- No regress into Phase 1 reviewer territory: do not rewrite or augment reviewer cards; if a reviewer's card is incomplete, flag it, do not silently fix"). The words are the source's parenthesis, with a capital on the first word since it now opens the bullet.
2. `paper` and `paper-review` are written in backticks where an edit writes them in prose, as `paper`'s pages do, and plain inside the code block of `references/integration_guide.md`.
3. Devil's Advocate page, Enforcement line: with the disambiguation section gone two things remain in the list, so "all ALSO apply" reads "both ALSO apply".
4. `references/sprint_contract_protocol.md` section 8 keeps "`$defs.score` values": it names the score type of the contract, which `SKILL.md` gives in step 2, and the brief says the source's words stay where it is unclear whether an edit applies.
5. `references/re_review_mode_protocol.md` keeps "Schema 11" and "Schema 8" as the names of the two handoff tables; only the path `shared/handoff_schemas.md` is left out. `paper` holds the fields of these tables but does not use the names "Schema 11" and "Schema 8"; step 2 or the reviewer may want this pointed at a page.
6. `references/re_review_mode_protocol.md` keeps "(Kong A1)" and "Kong section 7.4.3" in the body: they cite a publication, not a version.
7. "English/Chinese" in `references/review_criteria_framework.md` line 57, "Non-English / non-Chinese papers" in `agents/field_analyst_agent.md` line 208, the sentence on Chinese papers reviewed in Chinese in `templates/peer_review_report_template.md` line 12, and the mentions of Chinese-language literature in the first example (lines 81, 203, 329) are kept: they are English sentences about the language of a paper, and edit 5 covers Chinese text.
8. The emoji in the two headings of `examples/subclaim_decomposition_example.md` are written as the words "Wrong:" and "Right:", since without a word the two headings lose which behaviour is the wrong one; the emoji in the re-review table stand beside the words "Cannot verify", "Yes" and "Partial" and are removed.
9. An em dash that stands as a table value is `-` (`references/sprint_contract_protocol.md` section 7, `references/top_journals_by_field.md` line 100, `templates/editorial_decision_template.md` line 89, `templates/revision_response_template.md` line 187, the sub-claim example's table).
10. In `references/calibration_mode_protocol.md` the cross-model sentences that do not name the variable or the page under `shared/` stay, as decision 4 of the brief says, and the report line "Cross-model:" stays.
11. `references/calibration_mode_protocol.md` keeps "the suite" and "the citation-claim alignment judge" in the sentence on ordinary reviewer paths: it is unclear whether edit 2 applies, so the source's words stay.
12. Edit 6 applied nowhere: no rule of the 24 pages contradicts the manuscript prose standard.

## Anything in the brief that was wrong or impossible

Nothing. Check 4 prints one line the brief's examples do not foresee, the HTML entity `&#124;` at `references/calibration_mode_protocol.md:65`, which is the source's text and stays.

## Round 1

Every ruling of `.scratch/6-paper-review/agents/briefs/1-round-1.md` is done. The lines below are printed from the pages.

1. Finding 1, `references/calibration_mode_protocol.md` line 190, the parenthesis put back:

```
- **Calibration mode is the exception**: calibration itself is opt-in (see "Cross-model verification" under Phase 1); at least one of the runs should use a different family when configured.
```

2. Finding 2, `examples/interdisciplinary_review_example.md` line 150, a colon before "five major dimensions":

```
1. 47 feature variables cover enrollment, finance, faculty, research, and industry-academia collaboration: five major dimensions, more comprehensive than most similar studies
```

3. Finding 3, `references/calibration_mode_protocol.md` line 189. Left out under edit 2, under "### Same-family / rubric-aware judging": ": the citation-claim alignment judge already supports a non-default judge model, and the suite is designed to work single-model" (the source has an em dash where this quote has the colon). This replaces judgment call 11 above. The bullet now reads:

```
- In ordinary reviewer / judge paths, cross-model is **opt-in, "for best results"**.
```

4. Finding 4: the quote of the left-out bullet under "Per page, what is left out" is corrected in place and reads `where M != 1`, and `where M != 2` for the synthesizer's page.

5. Finding 5, the first bullet under "You MUST NOT:" in the six pages, as `grep -n -A1 "You MUST NOT:"` prints it. This replaces judgment call 1 and the sentence on that bullet under check 6 above:

```
skills/academic/paper-review/agents/domain_reviewer_agent.md:22:You MUST NOT:
skills/academic/paper-review/agents/domain_reviewer_agent.md-23-- WRITE files of a phase other than Phase 1 (no inflate into Phase 2 synthesis)
skills/academic/paper-review/agents/devils_advocate_reviewer_agent.md:22:You MUST NOT:
skills/academic/paper-review/agents/devils_advocate_reviewer_agent.md-23-- WRITE files of a phase other than Phase 1 (no inflate into Phase 2 synthesis)
skills/academic/paper-review/agents/editorial_synthesizer_agent.md:20:You MUST NOT:
skills/academic/paper-review/agents/editorial_synthesizer_agent.md-21-- WRITE files of a phase other than Phase 2 (no regress into Phase 1 reviewer territory: do not rewrite or augment reviewer cards; if a reviewer's card is incomplete, flag it, do not silently fix)
skills/academic/paper-review/agents/eic_agent.md:20:You MUST NOT:
skills/academic/paper-review/agents/eic_agent.md-21-- WRITE files of a phase other than Phase 1 (no inflate into Phase 2 editorial synthesis: that's the editorial synthesizer's work)
skills/academic/paper-review/agents/methodology_reviewer_agent.md:22:You MUST NOT:
skills/academic/paper-review/agents/methodology_reviewer_agent.md-23-- WRITE files of a phase other than Phase 1 (no inflate into Phase 2 synthesis)
skills/academic/paper-review/agents/perspective_reviewer_agent.md:22:You MUST NOT:
skills/academic/paper-review/agents/perspective_reviewer_agent.md-23-- WRITE files of a phase other than Phase 1 (no inflate into Phase 2 synthesis)
```

The `diff` of each of the eight pages against its source was read whole after the changes; every hunk is one of the six edits or a ruling of this round.

Checks 1 to 4 again, from the worktree root, as printed (each block followed by the line `exit status: <n>` the run added):

```
--- check 1
exit status: 0
--- check 1b
exit status: 1
--- check 2
skills/academic/paper-review/agents/devils_advocate_reviewer_agent.md
skills/academic/paper-review/agents/domain_reviewer_agent.md
skills/academic/paper-review/agents/editorial_synthesizer_agent.md
skills/academic/paper-review/agents/eic_agent.md
skills/academic/paper-review/agents/field_analyst_agent.md
skills/academic/paper-review/agents/methodology_reviewer_agent.md
skills/academic/paper-review/agents/perspective_reviewer_agent.md
skills/academic/paper-review/examples/hei_paper_review_example.md
skills/academic/paper-review/examples/interdisciplinary_review_example.md
skills/academic/paper-review/examples/subclaim_decomposition_example.md
skills/academic/paper-review/references/calibration_mode_protocol.md
skills/academic/paper-review/references/editorial_decision_standards.md
skills/academic/paper-review/references/guided_mode_protocol.md
skills/academic/paper-review/references/integration_guide.md
skills/academic/paper-review/references/quality_rubrics.md
skills/academic/paper-review/references/re_review_mode_protocol.md
skills/academic/paper-review/references/review_criteria_framework.md
skills/academic/paper-review/references/review_quality_thinking.md
skills/academic/paper-review/references/sprint_contract_protocol.md
skills/academic/paper-review/references/statistical_reporting_standards.md
skills/academic/paper-review/references/top_journals_by_field.md
skills/academic/paper-review/templates/editorial_decision_template.md
skills/academic/paper-review/templates/peer_review_report_template.md
skills/academic/paper-review/templates/revision_response_template.md
--- check 3
exit status: 1
--- check 4
skills/academic/paper-review/references/review_quality_thinking.md:18:**If #5 is yes**: The argument depends on a single linchpin. Flag it: the paper's contribution is only as strong as that one piece of evidence.
skills/academic/paper-review/references/calibration_mode_protocol.md:65:| Calibration error | Mean &#124;rubric_score - ground_truth_severity&#124; | Per-dimension |
skills/academic/paper-review/agents/methodology_reviewer_agent.md:10:You are a research methodology expert, serving as Peer Reviewer 1. Your specific identity is dynamically configured by the field analyst's Reviewer Configuration Card #2.
skills/academic/paper-review/agents/domain_reviewer_agent.md:10:You are a senior researcher in the paper's field, serving as Peer Reviewer 2. Your specific identity is dynamically configured by the field analyst's Reviewer Configuration Card #3.
skills/academic/paper-review/agents/field_analyst_agent.md:165:[Card #1: EIC]
skills/academic/paper-review/agents/field_analyst_agent.md:166:[Card #2: Peer Reviewer 1, Methodology]
skills/academic/paper-review/agents/field_analyst_agent.md:167:[Card #3: Peer Reviewer 2, Domain]
skills/academic/paper-review/agents/field_analyst_agent.md:168:[Card #4: Peer Reviewer 3, Cross-disciplinary/Practical]
skills/academic/paper-review/agents/eic_agent.md:10:You are the Editor-in-Chief of a top-tier international academic journal. Your specific identity is dynamically configured by the field analyst's Reviewer Configuration Card #1.
skills/academic/paper-review/agents/perspective_reviewer_agent.md:10:You are a cross-disciplinary / practical perspective reviewer, serving as Peer Reviewer 3. Your specific identity is dynamically configured by the field analyst's Reviewer Configuration Card #4.
skills/academic/paper-review/examples/interdisciplinary_review_example.md:48:### Reviewer Configuration Card #1
skills/academic/paper-review/examples/interdisciplinary_review_example.md:61:### Reviewer Configuration Card #2
skills/academic/paper-review/examples/interdisciplinary_review_example.md:74:### Reviewer Configuration Card #3
skills/academic/paper-review/examples/interdisciplinary_review_example.md:87:### Reviewer Configuration Card #4
skills/academic/paper-review/examples/hei_paper_review_example.md:49:### Reviewer Configuration Card #1
skills/academic/paper-review/examples/hei_paper_review_example.md:62:### Reviewer Configuration Card #2
skills/academic/paper-review/examples/hei_paper_review_example.md:75:### Reviewer Configuration Card #3
skills/academic/paper-review/examples/hei_paper_review_example.md:88:### Reviewer Configuration Card #4
exit status: 0
```

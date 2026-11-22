# Step 1 refuter report (on /Users/axelfaes/workspace/ordo/.agents/worktrees/6-paper-review-1, base ea700fc)

A page this report cites is named with its section, never with a line number. A grep hit keeps its `file:line`. A character outside printable ASCII in a quoted line is written by its name in angle brackets.

## Verification (rerun by the reviewer)

All commands were run from the worktree's root. `<source>` is `/Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper-reviewer`.

```
git status --short
?? .scratch/6-paper-review/agents/reviews/1-report.md
?? skills/academic/paper-review/

Check 1: find skills/academic/paper-review -type f -print0 | xargs -0 perl -CSD -ne '<the brief's character-set program>'
(prints nothing)
exit 0

Check 1, second line: LC_ALL=C grep -rn '[^ -~]' skills/academic/paper-review
(prints nothing)
exit 1

Check 2: find skills/academic/paper-review -type f | sort
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
exit 0
(24 paths, the 24 of "Paths this step writes"; no SKILL.md)

Check 3: grep -rnE 'v[0-9]+\.[0-9]+' skills/academic/paper-review
(prints nothing)
exit 1

Check 4: grep -rnE 'deep-research|academic-pipeline|academic-paper|shared/|scripts/|docs/design|evals/|POSITIONING|ARS|[Oo]rchestrator|phase\{M\}|Stage [0-9]|#[0-9]+' skills/academic/paper-review
18 lines, the same 18 the builder's report quotes:
references/review_quality_thinking.md:18 ("If #5 is yes")
references/calibration_mode_protocol.md:65 ("&#124;")
agents/field_analyst_agent.md:165-168 ("Card #1" to "Card #4")
agents/eic_agent.md:10, agents/methodology_reviewer_agent.md:10, agents/domain_reviewer_agent.md:10, agents/perspective_reviewer_agent.md:10 ("Reviewer Configuration Card #n")
examples/interdisciplinary_review_example.md:48, 61, 74, 87 and examples/hei_paper_review_example.md:49, 62, 75, 88 ("### Reviewer Configuration Card #n")
None is an issue number; each is the source's text.

Check 5: diff <source>/<folder>/<file> skills/academic/paper-review/<folder>/<file>, for each of the 24 pages
Every hunk of every page was read. Findings are under the four headings.

ls skills/academic/paper-review/references/changelog.md
ls: skills/academic/paper-review/references/changelog.md: No such file or directory
exit 1

Commands the builder's report quotes as evidence:

grep -n 'Generator-Evaluator Contract Protocol' skills/academic/paper/SKILL.md
358:7. Phase 4: the draft writer's two calls of the Generator-Evaluator Contract ("Generator-Evaluator Contract Protocol").
814:## Generator-Evaluator Contract Protocol
(reproduces the report's "line 814")

diff <(grep '^#' <source page>) <(grep '^#' <page>), per page, counted with grep -c '^[<>]'
0 differing lines for agents/field_analyst_agent.md, examples/hei_paper_review_example.md, references/integration_guide.md, templates/peer_review_report_template.md, templates/revision_response_template.md; more than 0 for the other 19
(reproduces the report's list of pages with no heading difference)

wc -l of each source page and each page
The 24 pairs equal the report's table: 358/341, 314/314, 407/407, 237/237, 211/211, 296/296, 329/329, 341/341, 270/270, 76/76, 229/227, 218/218, 34/34, 15/14, 118/118, 131/131, 180/180, 58/58, 139/136, 393/393, 206/206, 200/200, 267/267, 241/241.

grep -n '^- none' .scratch/6-paper-review/orchestrator-state.md
56:- none
(under the heading "## Open items" at line 54; reproduces the report's open items)
```

## Verdicts

Items of the brief's "What to build", in its numbering:

- 1 (names): holds. Each page under `agents/` has the frontmatter name the brief gives (`eic`, `methodology-reviewer`, `domain-reviewer`, `perspective-reviewer`, `devils-advocate-reviewer`, `editorial-synthesizer`, `field-analyst`), read in the first hunk of each page's diff. Check 4 prints no `academic-paper`, `ARS` or `orchestrator`. A grep of the pages for `_agent` followed by a word boundary prints no agent stem in prose.
- 2 (a sentence on a skill or mechanism that does not exist): violated, Spec 1. Every other left-out unit read in the hunks names a thing of the brief's list, and the two sections left out are the two the brief names.
- 3 (references to other files): holds. `references/sprint_contract_protocol.md`, `references/quality_rubrics.md`, `references/calibration_mode_protocol.md` and `examples/hei_paper_review_example.md` are each written with their folder where the source gave a bare file name, and the cross-reference of the sprint contract page reads "the `paper` skill's `SKILL.md`, "Generator-Evaluator Contract Protocol"", a heading that exists (the grep above).
- 4 (character set and no history): violated, Spec 2 (one dash replacement). Checks 1 and 3 print nothing; every version tag, issue number and date in the hunks is gone; the restated sentences match the forms the brief dictates.
- 5 (Chinese-language text): holds. `references/top_journals_by_field.md`, the 8 rows from "Bulletin of Educational Research" to "Psychological Testing", each keep the English name without parentheses and the three other cells unchanged.
- 6 (a rule that contradicts the manuscript prose standard): not applicable to any hunk; no hunk is an edit of this kind. Whether an unchanged rule should have been left out is under "Declined to judge".

Cases of the brief's "Cases":

- `agents/eic_agent.md`: met, by reading its diff. `name: eic`; `## Phase Boundary` and `## Sprint Contract Protocol` without tags; the pipeline clause gone and "Each agent inside the reviewer skill is single-phase relative to the skill's own phase numbering." and the sole-deliverable sentence present; the first bullet names no directory, the other four bullets present; "**Enforcement:** prompt-level only. The Sprint Contract Protocol below ALSO applies: ..." names no script, hook or issue. Standards 1 concerns the wording of the first bullet.
- `agents/devils_advocate_reviewer_agent.md`: met. The section "Relationship with deep-research devil's_advocate_agent" and the subsection "Cross-Model DA" are absent, check 4 prints no "deep-research", and the hunks of "Role Boundaries", "Attack Intensity Preservation Protocol" and "Frame-Lock Detection" change only characters and a tag.
- `references/sprint_contract_protocol.md`: met. The head block names no schema, template or design path; step 1 of section 2 reads "Load the contract of the mode from `SKILL.md`. Populate `generated_at` (ISO-8601 UTC). Optionally populate `agent_amendments` ..."; the three rows of section 7 read "no contract; runs without the two-call protocol", "no contract", "no contract" with `-` as panel size; the heading diff shows only the title's tag removed.
- `references/top_journals_by_field.md`, the 8 rows: met, as under item 5.
- `references/integration_guide.md`: met. The page holds Step 1 to Step 8 on `paper`, `paper-review` and the two integrity checks, in the source's order, and no deep-research step.
- `references/calibration_mode_protocol.md`: met. No Status line, no `ARS_CROSS_MODEL` (check 4), no cache folder, no roadmap item; "Cross-model: <yes/no, model families used>" is at `references/calibration_mode_protocol.md:99`; no hunk touches the phases' run counts or the limits. Spec 1 is a dropped pointer on this page, outside what the case names.
- Every one of the 24 pages, each hunk one of the six edits: partial, the two hunks of Spec 1 and Spec 2.
- The list of headings: met. The heading diffs hold only a tag, an issue number, a date or a character replaced, plus the two sections left out.
- `ls skills/academic/paper-review/references/changelog.md` finds no file: met, output above.

## 1. Spec

- 1. `references/calibration_mode_protocol.md`, "Same-family / rubric-aware judging", the bullet "Calibration mode is the exception". Source: "calibration itself is opt-in, but once invoked `ARS_CROSS_MODEL` is **default-on** (see "Cross-model verification" under Phase 1) <em dash> at least one of the runs should use a different family when configured." Page: "calibration itself is opt-in; at least one of the runs should use a different family when configured." What is wrong: the parenthesis '(see "Cross-model verification" under Phase 1)' names neither `ARS_CROSS_MODEL` nor `shared/cross_model_verification.md`, and the paragraph it points at still stands on the page ("**Cross-model verification**: At least one of the 5 runs should use a different model family if available ..."). The brief leaves out "only a sentence or clause that names" one of the two, and says the source's words stay where it is unclear. The builder's report lists the parenthesis as left out under edit 2, read as part of the clause that names the variable. Failure scenario: a reader of this bullet is told a run should use a different model family "when configured" and is no longer sent to the Phase 1 paragraph that says what to do when none is configured (emit a warning and run all 5 on the primary model). Verdict: item 2 violated; the case "every one of the 24 pages" partial.
- 2. `examples/interdisciplinary_review_example.md`, "Domain Review Report: R2 (Summary)", Strengths item 1. Source: "47 feature variables cover enrollment, finance, faculty, research, and industry-academia collaboration <em dash> five major dimensions, more comprehensive than most similar studies". Page: "... research, and industry-academia collaboration, five major dimensions, more comprehensive than most similar studies". What is wrong: the dash marks "five major dimensions" as the summary of the five items before it; after a list that already ends in ", and ...", a comma makes it read as a further item of the list. The brief asks for the replacement "whichever keeps the sentence's meaning"; a colon or parentheses would. Failure scenario: a reader of the example takes "five major dimensions" as a sixth thing the variables cover. Verdict: item 4 violated; the case "every one of the 24 pages" partial.
- 3. The brief, "What is on the tree", seventh bullet (the list of things that do not exist), against `references/calibration_mode_protocol.md:189`: "the citation-claim alignment judge already supports a non-default judge model, and the suite is designed to work single-model." What is wrong: `grep -rln -i 'alignment judge' skills` prints only this page, so the page names a judge and a "suite" this repository does not have, and the brief's list, which edit 2 is bound to, does not hold them. The builder kept the sentence (judgment call 11), which is what the brief's "the source's words stay" asks. Failure scenario: a reader looks for a citation-claim alignment judge with a configurable judge model and finds none. Verdict: none; a premise of the brief that the grep does not reproduce as complete, for the orchestrator to rule.

## 2. Proof

- 1. The builder's report, "Per page, what is left out", the shared list of the reviewer pages: "WRITE files in the reviewer skill's `phase{M}_*/` directories where M <greater-or-equal sign> 1 (". What is wrong: the source has the not-equal sign there (`diff` of each of the five reviewer pages: "where M <not-equal sign> 1"); the report's quote of left-out text is not the source's text. The decision that rests on it: the list is what is read at the gate as the record of what was left out. Failure scenario: a reader of the list takes the dropped words to have limited writing to phases 1 and up, where the source forbade every phase but 1. Verdict: none.

## 3. Standards

- 1. `agents/eic_agent.md`, `agents/methodology_reviewer_agent.md`, `agents/domain_reviewer_agent.md`, `agents/perspective_reviewer_agent.md`, `agents/devils_advocate_reviewer_agent.md`, `agents/editorial_synthesizer_agent.md`, "Phase Boundary", the first bullet under "You MUST NOT:". Page (reviewer pages): "- No inflate into Phase 2 synthesis" (EIC: "- No inflate into Phase 2 editorial synthesis: that's the editorial synthesizer's work"; synthesizer: "- No regress into Phase 1 reviewer territory: do not rewrite or augment reviewer cards; if a reviewer's card is incomplete, flag it, do not silently fix"). Source: "- WRITE files in the reviewer skill's `phase{M}_*/` directories where M <not-equal sign> 1 (no inflate into Phase 2 synthesis)". What is wrong: `docs/dev/change-standard.md`, "The rules", rule 17, "A rewrite keeps the meaning of every rule it carries". In the source the bullet is a forbidden action and the parenthesis glosses it. On the page the gloss, itself a prohibition, stands as an item of the list "You MUST NOT:", whose other four bullets are each the forbidden action ("Produce ...", "Invoke or simulate ...", ""Helpfully" continue ..."). Read as the list is built, the bullet forbids not inflating. The words are the ones the brief's edit 2 dictates ("keeps, as the bullet, the rule its parenthesis states", with "no regress ..." as its own example), and the builder names it under check 6 and judgment call 1; rule 4 of the same page leaves a rewrite of text the brief dictates to the orchestrator. The model the brief names shows the other form: `skills/academic/paper/agents/formatter_agent.md:17` reads "- Edit prior phase artifacts (no regress: ...)". Failure scenario: a reviewer agent reads five items it must not do and the first is "No inflate into Phase 2 synthesis"; it either drops the item as unparseable or reads the double negative, and the phase limit the bullet carried is not applied. Verdict: none; the brief's wording produces it.

## 4. Behaviour

- none. The step adds pages that no `SKILL.md` names yet, and it changes no file a user or a run reads today (`git status --short` shows the new folder and the report only).

## Declined to judge

- Edit 6 on the unchanged text: the review read every hunk of the 24 diffs, not the unchanged lines of the pages, so whether an unchanged rule of a page contradicts `skills/academic/writing/references/manuscript-prose-standard.md` was not checked. Reading the 24 pages whole against that page would settle it. No hunk claims to be an edit 6.
- Unchanged text that names a missing thing by a word outside check 4's pattern and outside the reviewer's extra grep (`_agent`, validator, schema, release, hook, cache, roadmap, issue, pipeline, Stage, `.json`, `.py`): not excluded beyond those words. That grep printed no further name of a missing thing.
- "Schema 11" and "Schema 8" in `references/re_review_mode_protocol.md`: the brief dictates that they stay. `grep -rn 'Schema 11\|Schema 8' skills/academic/paper` prints nothing, and `commitment_extracted` is at `skills/academic/paper/agents/revision_coach_agent.md:109`, so the fields exist and the names do not. Whether the names should point at that page is the orchestrator's or step 2's (the builder's judgment call 5).
- "`$defs.score`" in `references/sprint_contract_protocol.md` and `agents/editorial_synthesizer_agent.md` (the builder's judgment call 4): both places give the values beside it (`block | warn | pass`). Whether step 2's `SKILL.md` defines it cannot be read in this worktree; `grep -n 'defs' skills/academic/paper-review/SKILL.md` on step 2's tree would settle it.
- "(Kong A1)" in the body of `references/re_review_mode_protocol.md` (judgment call 6): whether it is a citation or a design-item tag is not settled by the source; the brief strips it only from the heading.
- ADRs other than 0043 (Decision 1), 0026 and 0002: not read. `ls docs/adr` and a read of each record whose title names copied pages, agents' pages or `paper-review` would settle whether another governs the diff.
- Whether the state of `HEAD` equals `ea700fc`: not checked; `git rev-parse HEAD` would settle it.

Reviewer usage: a8df6fcc33e1a61cf, claude-fable-5-2, 201785 tokens, 28 tool uses, 5.4 minutes.

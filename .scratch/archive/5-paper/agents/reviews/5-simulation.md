Report: paper (Ordo) against academic-paper 3.2.0 (AP), judged from the two skills' text only

Paths: paper = /Users/axelfaes/workspace/ordo/skills/paper/ ; AP = /Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper/. No file was changed. Ruled items from the brief are left out.

1. Per-mode verdict (each verdict is a judgment from the text)

- full: paper should give the better manuscript, because every cited sentence is checked against a passage read in the run, every number is checked against the result files, and the review loop works by patches. It is weaker in one place: the run ends with LaTeX source only (finding 4).
- outline-only: paper better, because of the structure check and the needs-literature loop back to the strategist before approval. It is weaker in one place: weak-argument signs are shown to the user but not strengthened (finding 5).
- revision: paper better on the manuscript itself (patches, reading 1 and reading 2, numbers recomputed). AP is better for referee comments because paper writes no response letter, and it routes that letter to a skill that is not installed (finding 3).
- abstract-only: paper better for a single-language abstract (venue-form table, counted words). AP is better only when a second-language abstract is needed (finding 9).
- lit-review: paper better, because every reference is resolved by `lookup.py` and candidates are read from saved full text. On a niche topic such as clustering EHR with tensor and optimal-transport methods, its source-count failure path is weaker than AP's (findings 2 and 7).
- citation-check: paper much better, because AP checks format, orphans and DOIs and reads no passage. One contradiction in paper could leave claims unchecked (finding 1).
- disclosure: about equal, with paper slightly better. Both have the same six venues and four anchors. Paper adds first-match rules for "no AI" answers, a gap list for uncertain categories, and the model identifier taken from the runner. AP prints text only; paper writes it into the manuscript as a patch.
- plan: about equal on the dialogue, since the mentor pages match nearly line for line. Paper is better on the plan-to-draft gate and the loop over unmet conditions. Its referrals point at skills that are not built (finding 8).
- format-convert: paper better: a real compile, a conversion patch for what pandoc drops, content counts per output, and a reference .docx. AP falls back to instructions.
- draft-review (paper call): paper only. AP has no standalone review mode; its mode list is at AP SKILL.md:3.
- figures (paper call): paper only, with scripts run, the rendered figure read, and a placement patch. AP draws figures only inside full mode.

2. Findings where paper should do worse, largest effect first

F1. The citation check stops at the first claim marked "Not held", and a paywalled source counts as "Not held".
- paper references/citation-compliance.md:293: "UNVERIFIABLE_ACCESS | The source exists and its full text cannot be read. | MEDIUM | Not held | A paywalled journal article."
- paper references/citation-compliance.md:297: "A claim marked 'Not held' is marked Critical, stops the check, and the session raises the stop 'A claim the run cannot support' for it."
- This contradicts paper SKILL.md:221-227, where the agent writes the whole `citation-report.md` and the session raises the stop afterwards.
- AP agents/citation_compliance_agent.md:138: "Major (claim not in source) -> STOP, flag as potential fabrication". AP reads no passages at all, so a paywalled source never stops it.
- Effect: an agent that follows line 297 leaves every claim after the first paywalled source unjudged. A paper with many paywalled sources gets one stop per source.
- Fix: at line 297, have the agent judge every claim, list all "Not held" claims in the report, and raise one stop that lists them all. Give UNVERIFIABLE_ACCESS its own line ("not read: addresses tried") so the stop separates "could not read" from "source does not hold it".

F2. In lit-review, the source-count failure path neither searches the widened year range nor adds indexes.
- paper references/literature-strategist.md:249: "Source count | ... | Run one more pass of layers 2 to 4."
- paper references/literature-strategist.md:257: "A failed gate is handled once".
- paper references/literature-strategist.md:259: "When the source count stays short after the extra pass, the agent widens the year range by 5 years and then states 'limited literature available' in the report." No pass is said to run with the wider range.
- AP agents/literature_strategist_agent.md:548-552: "1. Relax search criteria (expand year range +5 years) 2. Add search databases (add Google Scholar) 3. If still insufficient -> record 'limited literature available'".
- Effect: on a small, cross-disciplinary literature, paper can declare "limited" without searching the wider range and without trying indexes it skipped.
- Fix: at line 259, run layers 1 to 4 again with the widened range. Then add each reachable index not yet used (OpenAlex, Europe PMC, Crossref, arXiv, DBLP, Semantic Scholar; Google Scholar is unreachable per line 74). Record each in the search record, and only then state the limitation.

F3. Revision for referee comments writes no response letter, and the skill it refers to is not installed.
- paper SKILL.md:35: "Referee comments to answer with a response letter | `rebuttal`".
- paper references/modes.md:23: "The parsed comments and the response letter are `rebuttal`'s."
- `ls /Users/axelfaes/workspace/ordo/skills` and `ls ~/.claude/skills` list no `rebuttal`.
- AP SKILL.md:270: revision output includes a "revision log via `templates/revision_tracking_template.md`", and that template carries a "Response Letter Structure" (comment, response, changes made, summary of changes).
- AP SKILL.md:276: revision-coach gives a "Response Letter Skeleton".
- Effect: the user gets a revised manuscript and `items.md` with its readings, but no point-by-point reply to the editor.
- Fix: have revision mode write `response-letter.md` (or .tex) from `items.md` when the items are R<n>-<m>. For each comment: the comment quoted, the response, the location of the change taken from the apply reports, and the reading-2 status (RESOLVED, DELIBERATE_LIMITATION, UNRESOLVABLE or REVIEWER_DISAGREE with its evidence). The other option is to build `rebuttal` before the route to it stays in place.

F4. Full mode delivers only LaTeX source and throws away the PDF it compiled.
- paper SKILL.md:843: the manuscript folder holds the PDF, DOCX and MD only as "the files format-convert makes".
- paper intake.md:35: "Target formats ... | format-convert" (asked in no other mode).
- AP SKILL.md:45: "8. Output formatting -- LaTeX/DOCX (via Pandoc)/PDF/Markdown".
- AP agents/intake_agent.md:156-160: Output Format is asked at intake.
- AP agents/formatter_agent.md:62-63: "If Pandoc is available, generate the `.docx` file directly". AP's own PDF path (formatter_agent.md:69-70) is only "Provide LaTeX source that compiles to PDF", so AP is not reliably better on the PDF.
- Effect: a full run ends without a PDF or DOCX the user can open, and a second `/paper format-convert` run is needed.
- Fix: in full and revision, copy the final compile copy's PDF to `<main>.pdf` beside main.tex, as format-convert item 7 does (SKILL.md:632). Ask Target formats in full mode as well, and run the format-convert steps for docx or markdown at the end.

F5. Weak-argument signs are shown to the user but never strengthened.
- paper references/planner.md:466-467: "Two or more signs in a core argument stop the drafting. ... the session shows them to the user at the stop 'The outline's approval'".
- paper SKILL.md:320-326: the user can approve the outline at that stop, and item 7 then drafts.
- AP agents/argument_builder_agent.md:204-206: "If 2 or more of the following are detected in a core argument, STOP drafting and return to argument_builder for strengthening".
- Effect: a core argument with two or more signs (for example circular reasoning, or correlation read as causation) reaches the draft unless the user asks for changes.
- Fix: before the outline's approval stop, start the planner fresh with the signs and have it rewrite `arguments.md` for those arguments. Show the before and after at the stop.

F6. A claim without a citation is hedged without first looking in the run's own bibliography.
- paper references/draft-writer.md:148: "A claim with none is rewritten with hedging language, or marked `[GAP: citation needed]`."
- AP agents/draft_writer_agent.md:360-363: "1. List all factual claims without citations 2. Find usable sources from Annotated Bibliography 3. If no usable source -> rewrite using hedging language".
- Effect: claims that a source already in `review.md` or `refs.bib` supports get weakened or left as gaps.
- Fix: at line 148, first search the annotated bibliography and read the passage. Cite if it holds the claim; otherwise hedge or mark the gap.

F7. The lit-review search stops at 8 passes even when it is not saturated.
- paper references/literature-strategist.md:165-166: "The search ends when at least 3 conditions hold and condition 2 is among them. ... The passes stop at 8".
- AP agents/literature_strategist_agent.md:452 and 463: the search stops at any 3 conditions, and the only cap is "If none of the 5 are met but 4 rounds".
- Effect: this binds only when one or two conditions hold at pass 8. AP keeps searching there and paper stops. In other cases paper's requirement of condition 2 is the stricter of the two.
- Fix: drop the 8-pass cap, or let it end the search only when the last pass added fewer than 10 percent of the sources.

F8. Plan-mode referrals point at skills that are not built.
- paper SKILL.md:512 and references/socratic-mentor.md:80: the user with no question and no literature is referred to "`idea` (roadmap entry 10, not built yet)".
- paper SKILL.md:550 and SKILL.md:789: the chapter plan's review is "`paper-review`'s, roadmap entry 6, which is not built yet".
- AP agents/socratic_mentor_agent.md:132 and 137-141 refer to deep-research (socratic mode); AP references/plan_mode_protocol.md:88 says "Or use academic-paper-reviewer to review the Chapter Plan".
- Effect: the unprepared user gets only `/paper lit-review`, and the chapter plan gets no review.
- Fix: until those skills exist, offer something that runs. For the plan review, start the peer reviewer once on `chapter-plan.md`. For the unprepared user, offer `/paper lit-review` together with the mentor's Step 1 thesis questions.

F9. paper writes no second-language abstract.
- paper references/formatter.md:322: "`paper` writes no bilingual abstract".
- AP agents/intake_agent.md:175: "Ask about abstract: Bilingual (default) / EN only / zh-TW only"; AP agents/abstract_bilingual_agent.md.
- Effect: none for an English-only venue. For a venue that requires a second-language abstract, the user writes it by hand.
- Fix: add an intake row "Abstract languages" and have abstract-only write each language from the paper. This is low priority unless such venues are targeted.

F10. When no language is stated, the search runs in English only.
- paper references/literature-strategist.md:25: "The language | Searches in English."
- AP agents/literature_strategist_agent.md:576: "Default to English primary + attempt Chinese keyword search".
- Effect: small for English-language topics.

3. Places paper does better (both quotes)

- References confirmed by an index.
  - paper references/literature-strategist.md:343: "A source ... is included only after `lookup.py resolve` prints a record that matches it", and line 346: "The entry is not typed from memory."
  - AP SKILL.md:434: "every citation must be verified via DOI or WebSearch".
- Candidates read from saved text.
  - paper references/literature-strategist.md:177-181: an ordered list of ways to read the full text (`lookup.py fetch`, PMC or Europe PMC, the DOI page, then a web search).
  - AP agents/literature_strategist_agent.md:131: "Read abstracts and key sections".
- Claims checked against passages.
  - paper references/citation-compliance.md:224: "Each cited sentence of the manuscript rests on a passage that the agent reads in this run from the source's full text."
  - AP agents/citation_compliance_agent.md:48 onward: an in-text and reference-list cross-check, format and DOI checks. AP's retraction check is a protocol with no tool behind it (AP :120-121, "Cross-reference against Retraction Watch Database").
- Numbers checked against result files.
  - paper references/peer-reviewer.md:146: "the agent checks each number the draft states against the result files".
  - AP has no counterpart in its peer reviewer or draft writer pages read here.
- Full-mode loop by patches.
  - paper SKILL.md:161-188: every change is a patch applied by script.
  - AP SKILL.md:333: "The `academic-paper full` in-pair Phase 6->4 loop is NOT patch-adopted".
- Closing prose review.
  - paper SKILL.md:245-248: `/writing` runs on the manuscript and a findings pass follows.
  - AP relies on its writing_quality_check reference (not read in full).
- Lit-review synthesis.
  - paper references/literature-strategist.md:330-334: "one paragraph group per theme ... where they agree and where they disagree ... claims only what an annotation supports".
  - AP mode_selection_guide.md:144: the output is "Annotated bibliography + literature matrix + synthesis analysis", with no synthesis structure in the agent's output format (AP agents/literature_strategist_agent.md:213-246).
- Cover letter.
  - paper references/draft-writer.md:233-248: written from the recorded facts, with gaps marked.
  - AP agents/formatter_agent.md:162-170: a fixed template.
- Format-convert.
  - paper SKILL.md:629-634: compiles and copies `<main>.pdf`, or names why not; paper SKILL.md:673: counts the words of each output.
  - AP agents/formatter_agent.md:63: "If Pandoc is unavailable, provide complete markdown + DOCX conversion instructions".
- Plan gate.
  - paper references/socratic-mentor.md:269-280: the mentor asks about each unmet condition of the plan-to-draft gate before the chapter plan is written again.
  - AP agents/socratic_mentor_agent.md:442-443 only announces readiness.

4. What the text cannot settle, and what would settle it

- F1: whether the citation compliance agent follows citation-compliance.md:297 or SKILL.md:221-227. A citation-check run on a manuscript whose first cited source is paywalled would show it: see whether `citation-report.md` judges the later claims.
- F2 and F7: whether the caps bind on a real niche topic. A lit-review run on the EHR tensor and optimal-transport topic would show it: count the passes and the sources per pass in `review.md`, and see whether "limited literature available" appears.
- Prose quality of the drafts: the text cannot settle which skill writes better sentences. A blind side-by-side reading of one paper produced by each would settle it.
- Not read, or read only in part:
  - paper: references/latex-template.md, the body of statements.md, the body of visualization.md (headings and lines 55-111, 665-706 only), templates/*.py.
  - AP: agents/revision_coach_agent.md, references/policy_anchor_*.md, venue_disclosure_policies.md, writing_quality_check.md, statistical_visualization_standards.md, abstract_writing_guide.md, citation_format_switcher.md, examples/, and the shared/ files AP points to (style_calibration_protocol, domain profiles).
  - A finding hidden in these files is not excluded.

Usage: a042ddf4ecd3a6446, claude-opus-5-5, 175969 tokens, 57 tool uses, 5m 34s.

Light integrity and ethics checks in academic-paper 3.2.0 that the rebuilt paper skill lacks

Lookup agent a35db07475335525e, general-purpose, claude-opus-5-5, 257330 tokens, 82 tool uses, 9.7 min. Its report follows as it gave it.

Scope and roots
- academic-paper root, called AP below: /Users/axelfaes/workspace/research-hub/.agents/skills/academic-paper/
- paper root, called P below: /Users/axelfaes/workspace/ordo/.agents/worktrees/5-paper-4/skills/paper/ (worktree at 95aa872)
- Coverage rows are cited from /Users/axelfaes/workspace/ordo/.agents/worktrees/5-paper-4/docs/academic-coverage.md. Main's copy of that file has the academic-paper rows at other line numbers (51 to 110).
- Plan rulings are cited from /Users/axelfaes/workspace/ordo/.scratch/5-paper/plan.md. Deviation rows are cited from /Users/axelfaes/workspace/ordo/.scratch/5-paper/agents/reviews/4-deviations.md.
- I read every AP file in full. For the APA, LaTeX, style and glossary references and the long examples I read each one to find integrity terms (grep listed below), and none of them holds a check of its own.
- AD7 and AD8 are ruled but are not yet in P's files. `grep -rn -i "retraction|update-to|relation" P/templates/lookup.py` prints nothing, and `grep -rn -i "earlier papers|self-plagiar|repeat them" P` prints nothing.

PART A. Checks paper does not have, or has only in part

1. Self-plagiarism flag (DECIDED)
- What it catches: a Results paragraph copied from the authors' 2023 paper.
- AP: agents/citation_compliance_agent.md:113-117. Runs in full (Phase 5a), revision and citation-check.
- P: nothing.
- Ruling: AD8 (plan.md:152): "citation-check mode's intake asks for the authors' earlier papers, or none, and the citation compliance agent flags passages that closely repeat them ... `researcher` keeps academic-pipeline's full originality screen". Deviation DC8 (4-deviations.md:139) still reads NO RULING; AD8 came after it.

2. Retraction Watch cross-check of every journal reference
- What it catches: a cited 2019 paper retracted in 2022 whose index record does not say so.
- AP: agents/citation_compliance_agent.md:119-121. Full, revision and citation-check.
- P, citation-check: only what an index record's title or text shows (references/citation-compliance.md:293).
- P, full and revision: no retraction check at all.
- Ruling: AD7 (plan.md:144): "`lookup.py resolve` also prints, for each DOI, the retraction and expression-of-concern notices Crossref lists for it ... in place of academic-paper's Retraction Watch cross-check". Not built yet. For full and revision, D44 (plan.md:97) and D49 (plan.md:102).

3. Retraction handling and expression-of-concern flag in full and revision mode
- What it catches: a retracted source kept with no "[Retracted]" note in a full-mode draft.
- AP: agents/citation_compliance_agent.md:122-126, in full and revision (agent 6 runs in both, SKILL.md:266-278).
- P: citation-check only (references/citation-compliance.md:295-299).
- Ruling: D44 (plan.md:97): "the citation-compliance agent stays only as the agent of citation-check mode". D49 (plan.md:102): "the citation-compliance agent and the integrity check of changes removed". DF14 (4-deviations.md:61).

4. Claim against its source in full and revision mode (the decision tree that stops on a claim not in its source)
- What it catches: "Smith (2024) found a 23% drop" when Smith reports 13%.
- AP: agents/citation_compliance_agent.md:128-139, in full and revision.
- P, citation-check: has it, including the silent-upgrade audit (references/citation-compliance.md:33-47, 227-275).
- P, full and revision: nothing.
- Ruling: D44 (plan.md:97), D42 (plan.md:95): "the integrity check and the ethics check move to `researcher` (entry 13)". D49 (plan.md:102). DF14 and DR7 (4-deviations.md:61, 99).

5. Self-citation ratio above 15 percent, source currency, and citation density in full and revision
- What it catches: 40 percent self-citations, or a paragraph of claims with no citation.
- AP: agents/citation_compliance_agent.md:99-109; SKILL.md:435-436.
- P: citation-check only (references/citation-compliance.md:277-289).
- Ruling: D44, D49; DF14.

6. In-text author spelling and year matching the reference entry, in full and revision
- What it catches: "(Smyth, 2021)" in the text against Smith 2020 in the .bib.
- AP: agents/citation_compliance_agent.md:318-322.
- P: citation-check only (references/citation-compliance.md:64-69).
- Ruling: D44, D49.

7. Page citation within the source's page range
- What it catches: "p. 412" cited for an article that runs pp. 101-118.
- AP: agents/citation_compliance_agent.md:327.
- P, citation-check: partly, through the wrong-locator check (references/citation-compliance.md:248).
- P, full and revision: nothing.
- Ruling: D44, D49.

8. Locator anchor on every citation (quote, page or section), with output refused when one is missing
- What it catches: a citation with no page, quote or section for a specific number.
- AP: agents/draft_writer_agent.md:491-538; revision patches (draft_writer_agent.md:662); refused at agents/formatter_agent.md:349-350. Full and revision.
- P: plain `\cite`; only a direct quote carries its page (references/draft-writer.md:88).
- Ruling: coverage row 109: "Its generator-evaluator phases, claim manifests and HTML citation layers have no successor." Row 110: "Nothing takes the provenance gates".

9. Claim intent manifest with negative constraints, and planned experiment ids per claim
- What it catches: a "No causal claims" rule broken in the Discussion, or a reported number tied to no planned experiment.
- AP: agents/draft_writer_agent.md:540-593. Full mode.
- P: nothing. The nearest rule is that own-result numbers trace to a saved run or config (references/draft-writer.md:37; SKILL.md:444).
- Ruling: coverage row 109 ("claim manifests ... have no successor"). Row 206: "Both its negative-constraint and drift checks read the claim intent manifest ... which has no successor, so neither is rebuilt."

10. Version-family consistency (VERSION_INCONSISTENT_CITATION)
- What it catches: an arXiv v1 quote cited with the NeurIPS proceedings entry.
- AP: agents/draft_writer_agent.md:624-648 (writer); agents/formatter_agent.md:396-416 (advisory); examples/version_family_reconciliation_example.md. Full and revision.
- P: nothing.
- Ruling: coverage row 110: "`paper` at entry 15.A takes version scans with `examples/version_family_reconciliation_example.md`". Row 127: rebuild later: paper, "Choosing the cited `.bib` entry can wait until the paper skill's first comparison passes."

11. Output gate that refuses to emit while a citation is unverified, has no locator, does not support its claim, breaks a negative constraint, is fabricated or carries a HIGH-BLOCK token
- What it catches: final output written while a fabricated reference is still in the draft.
- AP: agents/formatter_agent.md:340-388; iron rule at SKILL.md:410 and 434. Full mode (Phase 7).
- P: no output gate. A failing reference is fixed once, then named, or under strict is the stop "A reference that cannot be confirmed" (SKILL.md:162-163; references/intake.md:132-139).
- Ruling: coverage row 110: "Nothing takes the provenance gates". D42 (plan.md:95). DF22 (4-deviations.md:69).

12. Contamination advisories in the provenance summary
- What it catches: a source that only a preprint server matches, or that no index matches.
- AP: agents/formatter_agent.md:372 and 462. Full mode; advisory, no refusal.
- P: nothing beyond the preprint tag of the strategist (references/literature-strategist.md:53).
- Ruling: no ruling names these advisories. Coverage row 110 drops "the provenance gates", and these advisories sit in the same formatter section (my reading, not a ruling).

13. Output marked "citations not final-verified" when no citation audit ran, and "has not passed final review" after a Major Revision verdict
- What it catches: a formatted manuscript handed over as if its citations had been audited.
- AP: agents/formatter_agent.md:897 and 905. Full and format-convert.
- P: full mode runs no citation audit, and nothing says so in the output. The final message lists references left failing and acknowledged limitations (SKILL.md:183). The no-claimed-audit rule covers only the review line (references/ai-disclosure.md:83) and the abstract (references/draft-writer.md:231).
- Ruling: no ruling.

14. Submission-package advisories (blind-review residue, venue limits, reference integrity) and the target-journal predatory check
- What it catches: an author name left in a double-blind PDF, or a venue on a predatory list.
- AP: agents/formatter_agent.md:435-448; references/journal_submission_guide.md:12 and 21. Full mode.
- P: venue limits and requirements are closing checks (SKILL.md:248-250). There is no blind-review residue check and no predatory check of the venue. The predatory screen covers sources only (references/citation-compliance.md:171-192).
- Ruling: coverage row 110: "`submit-manuscript` takes cover letters and blind review". Row 141: rebuild: submit-manuscript, "Submission checks cover scope, predatory journals, anonymisation and components".

15. RAISE compliance check before finalization (warn-only)
- What it catches: RAISE principle gaps in an AI-assisted manuscript.
- AP: SKILL.md:143. Full mode.
- P: nothing.
- Ruling: V (plan.md:126): "paper has no RAISE compliance check, since its agent is not in the academic-paper copy ... and D42 puts such checks in researcher". DF19.

16. Writing quality check sweep for AI-text signs inside the draft (25 flagged terms, em dash limit of 3 or fewer, throat-clearing, burstiness)
- What it catches: "delve", "pivotal" and five em dashes in one section.
- AP: agents/draft_writer_agent.md:47 and 68-76; references/writing_quality_check.md; SKILL.md:406-409. Full and revision.
- P: partly. Each role has the prose standard, and `/writing` reviews the finished manuscript (SKILL.md:169-179). There is no sweep inside the draft step.
- Ruling: coverage row 154 (rebuild: writing); D46 (plan.md:99); DX32 (4-deviations.md:201).

17. Wording-pattern advisory for AI-typical research-question shells
- What it catches: "Exploring the impact of X on Y" flagged as template phrasing.
- AP: agents/socratic_mentor_agent.md:26-64. Plan mode.
- P: nothing. Plan mode is refused (SKILL.md:81).
- Ruling: coverage row 115: "the commitment gates and wording patterns are left out". D3 (plan.md:39) puts plan mode at entry 15.A.

18. Trust-chain refusal on uncertain sources (a corpus entry marked verified but never acquired is treated as unverified)
- What it catches: a source cited as checked when nobody fetched it.
- AP: agents/literature_strategist_agent.md:378-404. Full and lit-review.
- P: nothing.
- Ruling: coverage row 112: "trust-chain fields have no user".

19. Conference-to-journal extension check (conference version cited, text overlap under 30 percent by a similarity tool)
- What it catches: a journal version that reuses 60 percent of its conference text.
- AP: references/failure_paths.md:318 and 322-328, detected at intake (failure_paths.md:346). Full mode.
- P: nothing.
- Ruling: coverage row 138 (rebuild later: paper): "Entry 5's gate needs none".

20. Clinical safety boundary (a draft must not become patient-specific diagnosis, treatment or deployment advice)
- What it catches: "should be deployed broadly in primary care" drawn from one validation study.
- AP: examples/clinical_citation_verification_checklist.md:28 and 88. This is an example file, not tied to a mode (line 3: "not a new agent behavior contract").
- P: nothing. The rest of that checklist is in citation-check (references/citation-compliance.md:233, 254-275).
- Ruling: coverage row 119: "The paper skill's citation-check mode takes it, minus the safety note".

21. No-false-certification rule of rebuttal-audit
- What it catches: a standalone audit marking a rebuttal "verified".
- AP: SKILL.md:318; references/mode_selection_guide.md:237. Rebuttal-audit mode.
- P: the mode is absent.
- Ruling: D1 (plan.md:37): revision-coach and rebuttal-audit move to `/rebuttal`.

22. Content checks after format conversion (word count within 1 percent, tables and citations kept)
- What it catches: a citation lost in the DOCX conversion.
- AP: agents/formatter_agent.md:313-318, 793-799, 859-861. Full and format-convert.
- P: there is no conversion. Patch apply checks the untouched blocks (SKILL.md:145).
- Ruling: D25 (plan.md:61), conversion at entry 15.A; coverage row 110 (rebuild later).

Outside the scope you set
- The two-way figure trace check and the empty-limitations advisory are run by the pipeline's integrity_verification_agent (AP references/vlm_figure_verification.md:87, 113-114).
- P writes the trace for `researcher` (references/visualization.md:655).

PART B. Checks paper has (AP place, then P place)

- Zero citation orphans: AP SKILL.md:421 / P SKILL.md:155, 245.
- DOI included and resolved, every citation looked up: AP SKILL.md:410, 434 / P SKILL.md:154-163, 255; references/citation-compliance.md:80, 89-101.
- DOI checking level, strict or mark-only: AP agents/intake_agent.md:270-280 / P references/intake.md:132-139.
- Citation existence failures listed for the user: AP agents/formatter_agent.md:418-433 / P SKILL.md:163, 183.
- Anti-leakage rule, gap marking and the [LLM-SUPPLEMENTED] tag: AP agents/draft_writer_agent.md:48, references/anti_leakage_protocol.md:47-66 / P references/draft-writer.md:28-39.
- Every factual claim cited: AP agents/draft_writer_agent.md:349 / P references/draft-writer.md:100.
- Every claim has a cited evidence source in the argument: AP agents/argument_builder_agent.md:257 / P references/planner.md:376.
- Weak-argument stop, including correlation read as causation: AP agents/argument_builder_agent.md:204-215 / P references/planner.md:279-295.
- Temporal integrity of cited sources: AP agents/draft_writer_agent.md:595-622 / P references/draft-writer.md:101-104.
- Predatory or fabricated source gate: AP agents/literature_strategist_agent.md:73-79 / P references/literature-strategist.md:50.
- Preprint tagging: AP agents/literature_strategist_agent.md:525, 565 / P references/literature-strategist.md:53.
- Quote without a page, and secondary citation (citation-check): AP agents/citation_compliance_agent.md:286, 282 / P references/citation-compliance.md:86-87.
- Claim against source and silent-upgrade audit (citation-check): AP agents/citation_compliance_agent.md:128-139, examples/clinical_epistemic_status_example.md:37-59 / P references/citation-compliance.md:33-47, 227-275.
- Self-citation, currency, density (citation-check): AP agents/citation_compliance_agent.md:99-109 / P references/citation-compliance.md:277-289.
- Retraction notes and expression of concern (citation-check, from index records): AP agents/citation_compliance_agent.md:122-126 / P references/citation-compliance.md:291-299.
- Figure data accuracy (check 9): AP agents/visualization_agent.md:278, 422 / P references/visualization.md:622, 625.
- Rendered-figure check against the data: AP agents/visualization_agent.md:424-432, references/vlm_figure_verification.md:30-33 / P references/visualization.md:628-651.
- Figure trace to data, script and claims: AP agents/visualization_agent.md:368-380, 434-446 / P references/visualization.md:653-684.
- No truncated axis without disclosure, interpolation disclosed, error bars, no dual y-axes: AP agents/visualization_agent.md:302-303, references/statistical_visualization_standards.md:145-155 / P references/visualization.md:31-32, 131-139.
- Peer reviewer evidence cues (cherry-picking, inference beyond the data, suspected plagiarism as Critical): AP agents/peer_reviewer_agent.md:293-297, 381 / P references/peer-reviewer.md:91-95, 178.
- Abstract reflects the findings, and abstract numbers checked against the body: AP agents/peer_reviewer_agent.md:96 / P references/peer-reviewer.md:160, references/draft-writer.md:196.
- Mandatory statements (ethics, conflicts, funding, data, CRediT, AI disclosure): AP SKILL.md:444-447, agents/formatter_agent.md:330-338 / P SKILL.md:253, references/statements.md.
- Ethics statement for human subjects (board, approval, consent, de-identification): AP agents/formatter_agent.md:766, templates/imrad_template.md:112 / P references/statements.md:163-169, references/intake.md:48.
- ICMJE authorship criteria and AI never an author: AP references/credit_authorship_guide.md:141-150, templates/credit_statement_template.md:120-121 / P references/statements.md:55, 65.
- Funding and conflict statements kept separate: AP references/funding_statement_guide.md:208-218 / P references/statements.md:119-136.
- AI disclosure (uncertain category never shown as used, unknown venue's policy asked for, analysis assistance in its own paragraph, AI-quoted material attributed): AP references/disclosure_mode_protocol.md:65, 86, 134-135, references/policy_anchor_disclosure_protocol.md:127 / P references/ai-disclosure.md:23-24, 40-50, 66-74.

Commands that produced this
- `cat -n` of each AP agent, reference, template and example file.
- `grep -rn -i` over AP for "verif|fabricat|plagiar|retract|ethic|irb|consent|conflict|integrity|leak|self-cit|predatory|anonymi|dual use|contamina".
- The same kind of grep over P.
- `sed -n` spot reads of every line cited above, in AP, P, plan.md, 4-deviations.md and the worktree coverage page.

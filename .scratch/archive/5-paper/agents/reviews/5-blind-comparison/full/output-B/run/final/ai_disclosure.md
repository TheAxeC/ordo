# AI-use disclosure for Artificial Intelligence in Medicine

## Policy source

`references/venue_disclosure_policies.md` has entries for ICLR, NeurIPS, Nature, Science, ACL and EMNLP only. It has no entry for Artificial Intelligence in Medicine and none for Elsevier (`grep -n '^## Venue' references/venue_disclosure_policies.md` lists the six venues; `grep -ciE 'elsevier|artificial intelligence in medicine'` on the file returns 0). the disclosure procedure (Step 1b) says that for a venue outside the database the venue's current policy text must be supplied and never guessed. No policy text was supplied for this run and the journal's guide was not fetched, so no venue-specific requirement is applied here. The text below is written from what the run did, in the form of the "Detailed Disclosure" fallback template of `references/journal_submission_guide.md`, and the authors must check it against the journal's current Guide for Authors before submission. The procedure's own record of Elsevier's position (`references/credit_authorship_guide.md`, "AI Not Listed as Author Policy") is that AI tools are not listed as authors and that their use is disclosed in the manuscript; that record was not checked against a current Elsevier page.

## How AI was used in this run

Categories follow the outline stage of the disclosure procedure. The sources are the phase outputs under `run/` and `run/settings.md`.

| Category | Status | What the AI agents did |
|---|---|---|
| Research assistance | USED | Literature search strategy, annotated bibliography and research-gap note (the search agent, `run/search/`); verification of all 65 cited references against PubMed, Crossref, DataCite and arXiv metadata records (the citation compliance agent, `run/citations/citation_audit_report.md`). |
| Drafting assistance | USED | Outline (the structure architect agent, `run/outline/outline.md`), argument plan (the argument builder agent, `run/arguments/argument_blueprint.md`), drafting of all sections (the draft writer agent, `run/draft/`), abstract, keywords and highlights (the abstract bilingual agent, `run/citations/abstract.md`). |
| Revision assistance | USED | Revision of the draft after the internal review round (`run/draft/revision_log_round1.md`) and two citation-related sentence corrections (`run/citations/citation_audit_report.md`, Section 5). |
| Editing assistance | USED | Conversion of citations to numbered Vancouver form and LaTeX formatting for submission (the formatter agent, `run/final/`). |
| Analysis assistance | USED, limited | The agents read the committed result files and stated values marked "derived" in the manuscript (ratios and differences of reported counts), and counted rows of a committed cohort file with awk; one agent ran one interpreter command that counted the label column of three cohort files (`run/settings.md`, C11 and C13). The agents trained no model and reran no analysis; every AUROC, CI and operating point in the manuscript comes from the authors' committed result files. The Figure 1 plotting script was written by the visualization agent and has not been run. |
| Peer review simulation | USED | Internal review of drafts v1 and v2 against stated review criteria (the peer reviewer agent, `run/review/`). |

## Disclosure text

Text of the "Declaration of generative AI use" paragraph in the Declarations section of the manuscript:

During the preparation of this work the authors used Claude (Anthropic), model Claude Opus 5.5, through AI agents, for literature search and verification of the cited references, outlining, argument planning, drafting of the manuscript, internal review and revision of the draft, citation checking, drafting of the abstract, keywords and highlights, and formatting. The agents also counted rows and computed derived counts and ratios from the authors' committed result files, each marked as derived in the text; they trained no model and produced none of the reported model results. No AI tool is listed as an author. Authors' verification statement: [GAP-AIUSE].

[GAP-AIUSE] is filled by the named authors' statement that they reviewed and edited the content and take full responsibility for it, as the manuscript already states.

## Match with the declaration in the manuscript

The manuscript's declaration (`run/final/manuscript.tex` line 444, carried from `run/citations/draft_v6.md` line 354) carries the disclosure text above word for word, and names every use in the table above. The one addition in the manuscript is the clause after [GAP-AIUSE], ", filled by the named authors' statement that they reviewed and edited the content and take responsibility for it", which states what fills the placeholder. [GAP-AIUSE] is the only open part of the declaration.

## Placement

In the Declarations section of the manuscript, where the draft already places it, before the reference list. The cover letter states that AI use is disclosed in the manuscript.

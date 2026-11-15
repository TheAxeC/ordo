# Draft writer report (first draft)

I wrote the first draft, the intended-claims list and the cover letter. The Experiments section is 36% over its word allocation even after trimming, and that needs your decision. I did not compile the manuscript, because compiling is the session's later step.

**Files written**
- `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/full-1/paper-runs/full-2026-11-14/intended-claims.md`: 26 claims, written before any section.
- `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/full-1/manuscript/main.tex`: Elsevier `elsarticle` class (the venue is an Elsevier journal), `\bibliographystyle{vancouver}` (installed, checked with `kpsewhich`), `\bibliography{refs}`. It holds the body, an unstructured abstract with six keywords, and the statements. The three figure markers sit after the paragraph that discusses each figure: `% FIGURE: bttr-to-bttn` (3.1), `% FIGURE: clinical-utility` (5.3) and `% FIGURE: beat-saliency` (5.4). There are five tables, one each for the cohort, the one-year results, the horizons, the operating points and the occlusion windows.
- `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/full-1/manuscript/cover-letter.tex`: Research Article, no editor name, no reviewers.

**Word count** (from `texcount -sub=section main.tex`; the Results count includes table cells)

| Section | Target | Actual | Deviation |
|---|---|---|---|
| Introduction | 975 | 861 | -11.7% |
| Related work | 1,625 | 1,413 | -13.0% |
| Method | 975 | 887 | -9.0% |
| Experiments | 575 | 780 | +35.7% (requires user decision on whether to keep) |
| Results | 725 | 711 | -1.9% |
| Discussion | 1,300 | 1,319 | +1.5% |
| Conclusion | 325 | 297 | -8.6% |
| Total | 6,500 | 6,268 | -3.6% |

- **Abstract:** 283 words by `wc -w`, which also counts the LaTeX markup. The venue states no limit, so it stays under the 300-word ceiling.
- **Citations:** 115 `\cite` commands over 64 unique keys. A grep found every key in `refs.bib`.
- **Experiments overrun:** I trimmed repeated content (interval types already stated in the table captions, window offsets already in Table 5, the CNN description). What remains is detail the outline requires for 4.1 to 4.3.

**Gaps** (listed by `grep 'GAP:'`)
- **main.tex, front matter:** author names, author order, ORCIDs, corresponding author, affiliations.
- **main.tex, statements:** CRediT roles, funding, conflicts of interest, the repository URL or DOI (in both data availability and reproducibility), ethics approval, consent, de-identification wording, data-access wording.
- **main.tex, AI disclosure:**
  - all six AI-use categories, each marked not confirmed;
  - human oversight (which author reviewed which AI-assisted content, and when).
- **cover-letter.tex:**
  - the corresponding author's name, title, department, institution, email and ORCID;
  - the three confirmations (not published before, not under consideration elsewhere, all authors approved).
- No passage is tagged `[LLM-SUPPLEMENTED]`.

**Sections marked "argument inferred":** none. The argument blueprint was present.

**Statements the co-authors must agree on:** the CRediT roles, the funder details and the conflicts. The ethics statement names gaps for approval, consent, de-identification and data access on human data.

**Choices that differ from the materials**
- **AI disclosure:** every AI-use category is "uncertain" in config.md, but the row also records this run's own use of Claude Opus (claude-opus-5-5).
  - I stated that recorded use: literature search and screening, outline, drafting, figure placement and captions, citation checking, simulated peer review.
  - Every category gets a gap for use outside this run, including analysis.
  - The cover letter has an AI-use line, because the manuscript discloses use. The strict rule allows that line only when a category is marked used, so drop it if you read the rule that way.
- **Claim 25 of intended-claims.md:** it says the clinical factors are a subset of CHARGE-AF's. The sources in hand do not list the CHARGE-AF variables, so the Limitations text names the Framingham variables the clinical term omits \cite{Schnabel_2009} and the PR interval, and makes no CHARGE-AF subset claim. The claims list was written once and was not changed.
- **Decision curve:** described from the figure, since no net-benefit number is in a file. The fused model is above the other two between thresholds of about 0.03 and 0.1, and all curves are near zero above about 0.12.

**Rules applied**
- **Gold-label numbers only:** every reported number comes from the gold files the evidence map names; none comes from RESULTS.md.
- **Left out:**
  - faithfulness numbers;
  - the self-supervised pretraining variant;
  - the PTB-XL and CODE-15 results (and both datasets in the data availability statement);
  - any rising-risk reading;
  - any difference between two AUROCs printed as an effect.
- **Linear BTTR technical report:** the Zenodo record is cited for its model and task only.
- **Honest statement:** one sentence says both ECG-only models are below the clinical model at one year.

**Prose check:** it ran against the manuscript prose standard and the rules page.
- There are no em dashes, no `--`, and no non-ASCII characters (checked with `LC_ALL=C grep`).
- There are no semicolons in the prose; the one in the file is in a LaTeX comment.
- No flagged or banned term is used about this paper's results.
- Three vague qualifiers ("often", "many") were replaced with the specific claims.
- **Breaks left:**
  - Some supporting paragraphs are under 120 words (2.4 first paragraph, the atrial-cardiomyopathy paragraph in 6.2, 6.4, and the conclusion's paragraphs). They are supporting paragraphs and are kept short.
  - Some sentences run past 20 words where a method or a cited result needs the length.

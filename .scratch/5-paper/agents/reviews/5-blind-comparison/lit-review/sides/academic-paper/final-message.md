The lit-review run is finished. The review covers 147 sources, as an annotated bibliography, a literature matrix and a 4,072-word synthesis. It is delivered as an IEEE LaTeX file, `phase7_formatting/literature_review.tex`, which compiles to a 72-page PDF with no errors and no undefined citations.

**Checks run this session:**
- **Identifiers:** my script looked up every identifier in `references.bib` and 219 resolved: DOIs (through Crossref or doi.org), arXiv IDs, PubMed IDs and proceedings pages. The one entry it could not read, Harshman 1970, is a PDF on the author's site; I downloaded it, and its first page gives the title and venue in the `.bib`.
- **Citation keys:** the `.tex` has 789 `\cite` commands. They cover all 147 `.bib` keys, with none missing from the `.bib` and none left uncited.
- **Compile:** the log shows 0 errors, 0 undefined citations and 0 overfull or underfull boxes. `pdfinfo` gives 72 pages.
- **Characters:** the `.tex`, the report and `config.md` contain no non-ASCII characters.

**Findings.** The synthesis is organised by the three parts of your research question. It reports five gaps, each tied to the sources around it and to the searches that found nothing:
1. No subject-level predictor relates lesion or region sets across subjects through a learned transport template or a transport coupling.
2. No study compares a registration-based predictor with a registration-free set-encoder or transport predictor on the same cohort.
3. No tensor or multilinear model has an unaligned spatial mode. Transport appears in tensor models only as a reconstruction loss.
4. The supervised transport-template layers do not handle unequal total mass, although total lesion volume is a strong baseline.
5. No study measures how segmentation or registration errors carry through to the subject-level prediction.

The quality gates all pass:
- Peer-reviewed share is 95.9%, or 99.3% when preprints count, as the `cs_ml` evidence profile allows.
- 53.7% of sources are from 2022 to 2026.
- Every theme has at least 29 sources.

**Choices I made without asking.** These are recorded as D1 to D9 in `config.md`, each with its options and the cheaper option named:
- The search ran as four theme searches plus a merge run.
- The `.tex` carries the whole report, with the matrix and annotations as appendices.
- The script resolves every identifier, as strict checking requires.
- Kiers 1999 keeps the dash in its title, because the published title has one.

**Not done, or limited:**
- **No external review:** the `academic-paper-reviewer` skill is not installed, and lit-review mode has no review step (D7).
- **Gaps you left open:** co-authors and funding are blank. The author block reads `[GAP: authors not supplied]`, and the funding and other required statements are left for the methods paper.
- **Databases:** IEEE Xplore, ACM DL, Scopus and Google Scholar could not be reached. Semantic Scholar, OpenAlex, Crossref, arXiv, PubMed and OpenCitations were used instead, and some of their queries were rate-limited.
- **Reading depth:** most annotations are based on abstracts only. Each annotation says what was read.
- **Citation chaining:** a source cited by three or more core papers is found, but some cited by two may be missed. The citing list for Deep Sets was cut off at the API's 3,000-record limit.
- **Commits:** nothing is committed. `config.md`, `phase0_paper_configuration_record.md`, `phase1_literature/` and `phase7_formatting/` are untracked.

Files are in the repository root:
- `config.md`
- `phase1_literature/literature_search_report.md`
- `phase1_literature/references.bib`
- `phase7_formatting/literature_review.tex`
- `phase7_formatting/literature_review.pdf`

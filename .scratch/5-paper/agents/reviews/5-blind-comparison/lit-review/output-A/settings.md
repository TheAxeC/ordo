# Paper Configuration (lit-review mode, confirmed)

The user answered all 19 intake questions and instructed that any further choice whose recommendation would be taken is taken and recorded here. Section (a) is the confirmed intake record, section (b) quotes the user's answers, and section (c) records the decisions taken without asking.

## (a) Confirmed intake record

| Parameter | Value |
|-----------|-------|
| **Topic** | Supervised prediction from data whose spatial mode is not aligned across subjects, such as point clouds or sets of lesions or regions. Topic areas: multilinear and tensor partial least squares and tensor regression; decompositions of tensors with an unaligned mode; optimal transport with entropic regularization; Gromov-Wasserstein and fused Gromov-Wasserstein distances; transport barycenters and dictionaries with learnable templates; registration-free transport-based fusion in medical imaging; permutation-invariant set encoders; the image registration, radiomics and lesion segmentation pipelines such methods avoid or build on. |
| **Research Question** | Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines? |
| **Paper Type** | Literature Review |
| **Discipline** | Machine learning, with medical image analysis as the application setting; methods admitted from any application domain (sub-fields: multilinear and tensor methods, computational optimal transport, set-based and point-cloud deep learning, medical imaging pipelines) |
| **Target Journal** | General (no target journal) |
| **Venue Profile** | absent |
| **Citation Format** | IEEE |
| **Output Format** | LaTeX (.tex and .bib) |
| **Body Language** | EN |
| **Abstract** | EN-only |
| **Word Count Target** | No fixed target; synthesis capped at 9,000 words; source count (minimum 30, typical 40 to 80 for a Literature Review) is the governing size measure (decision D5) |
| **Existing Materials** | None; no seed .bib or reference list |
| **Co-Authors** | [GAP] (not supplied by the user) |
| **Funding** | [GAP] (not supplied by the user); conflicts of interest also [GAP] (not supplied by the user) |
| **Style Profile** | null |
| **Domain Evidence Profile** | cs_ml |
| **Citation Verification** | strict (the Material Passport is not materialized in this run, so nothing is written to it; enforcement procedure in decision D3) |
| **Operational Mode** | lit-review |

The Format Profile row is omitted because the user declared no layout profile (the intake instructions Step 5, Invariant 7).

### Notes

- Scope: the review covers methods whose input is a set of spatial elements (points, regions, lesions, voxels after segmentation) with no fixed correspondence across subjects, and the supervised task is regression or classification at the subject level. Unsupervised-only methods are admitted where they provide the representation a supervised method builds on (for example a decomposition or a barycenter used as features).
- Inclusion window: foundational works are admitted regardless of year; the systematic search covers 2013 to 2026.
- Review design: a structured narrative review with a documented, reproducible search strategy (databases, query strings, inclusion and exclusion criteria, counts at each screening stage), without a full PRISMA systematic review protocol.
- Sources: English-language peer-reviewed journal articles, peer-reviewed conference proceedings, and archival preprints (arXiv) where no peer-reviewed version exists; preprints are flagged as such in the bibliography.
- Application domain: methods are reviewed regardless of application domain, and the medical imaging topics (registration, radiomics, lesion segmentation, registration-free fusion) are reviewed as the application setting.
- Output role: a related-work basis for a later methods paper; the review is not submitted on its own.
- Co-authors, funding and conflicts of interest are unsupplied; see decision D4 for why this run proceeds.

## (b) User answers (verbatim)

1. Research question: Which methods predict a subject-level outcome from data whose spatial mode is not aligned across subjects (point clouds, sets of lesions or regions), how does each handle the missing correspondence (registration to a common space, a learned template or barycenter, a transport coupling, or permutation invariance), and where does each remove or build on the registration, radiomics and lesion-segmentation steps of medical-imaging pipelines?
2. Review design: as you recommend, a structured narrative review with a documented search.
3. Inclusion window: as you recommend.
4. Output role: as you recommend, a related-work basis for a later methods paper.
5. Discipline: machine learning, with medical image analysis as the application setting; methods admitted from any application domain.
6. Sources: as you recommend.
7. Literature Review.
8. Target journal: none.
9. Citation format: as you recommend, IEEE.
10. Output format: LaTeX (.tex and .bib).
11. Language: English; English-only abstract.
12. Language: English; English-only abstract.
13. Length: as you recommend.
14. Materials in hand: none; no seed .bib or reference list.
15. Co-authors: [GAP].
16. Style calibration: skip.
17. Funding and conflicts of interest: [GAP].
18. Evidence profile: cs_ml.
19. DOI checking: strict.

"From here on, do not stop for a choice whose recommendation you would take; take it and record it in settings.md. I refuse to interact further."

## (c) Decisions taken without asking (user instruction: take the recommendation and record it)

### D1. The search stage run structure

- Decision: the search stage is run as four theme-scoped search agent runs, each executing the agent's full 4-layer search, screening and annotation for its themes, followed by one search agent merge run that deduplicates, applies the shared criteria, and emits the single Literature Search Report (screening counts, annotated bibliography, matrix, gaps, recommended sources). Theme A: multilinear and tensor PLS, tensor regression, tensor decompositions with an unaligned mode. Theme B: entropic optimal transport, Gromov-Wasserstein and fused Gromov-Wasserstein, transport barycenters and dictionaries with learnable templates, transport-based set embeddings, registration-free transport-based fusion in medical imaging. Theme C: permutation-invariant set encoders, point-cloud networks, multiple-instance learning. Theme D: image registration, radiomics and lesion segmentation pipelines, and subject-level prediction from lesion or region sets.
- Options considered: one run covering all eight topic areas; four theme runs plus a merge run.
- Reason: the eight topic areas come from at least four research communities and the source target is 40 to 80; one run would give each area a shallower search.
- Cheaper option to carry out: the single run.

### D2. LaTeX output

- Decision: the search stage emits `references.bib` (IEEE-ready BibTeX, with the DOI or arXiv ID on every entry that has one) beside the report; formatting agent then converts the Literature Search Report into a `.tex` file using that `.bib` with IEEE citation style. This is a format-convert step chained after lit-review, because lit-review mode lists only intake agent and search agent and the user chose LaTeX output.
- Options considered: Markdown report only; Markdown report plus .bib; report plus .bib plus formatter-produced .tex.
- Reason: the .tex option is what question 10 asked for.
- Cheaper option to carry out: Markdown report only.

### D3. Strict citation verification procedure

- Decision: every DOI is resolved against doi.org or Crossref and every arXiv ID against the arXiv API by a script run by the orchestrating session; any identifier that fails lookup is sent back to the search agent to correct or drop before the formatter runs.
- Options considered: mark-only advisory suffixes; strict blocking.
- Reason: the user chose strict (question 19); this entry records the enforcement procedure.
- Cheaper option to carry out: mark-only.

### D4. Co-authors and funding left as gaps

- Decision: co-authors and funding are recorded as [GAP]. The lit-review deliverable (annotated bibliography, literature matrix, synthesis) carries no author block, CRediT statement or funding statement, so the gaps do not block this run. The SKILL.md mandatory inclusions (Data Availability, Ethics, CRediT, Conflict of Interest, Funding, AI disclosure) apply to the later methods paper, except that the formatter-produced .tex carries an AI-usage note because formatting agent requires one in every output.
- Options considered: stop and ask; proceed with the gaps recorded.
- Reason: proceeding is required by the user instruction and does not reduce the deliverable.
- Cheaper option to carry out: proceeding with the gaps recorded.

### D5. Word count

- Decision: the user accepted the recommendation, which for a related-work basis was "the length the later paper allows"; that length is unknown, so the synthesis has no fixed word target and is capped at 9,000 words, with source count (Literature Review minimum 30, typical 40 to 80 per the search agent's instructions) as the governing size measure.
- Options considered: 9,000-word target; 6,000-word target; no target with a cap.
- Reason: a related-work basis is sized by the coverage it has to give the later paper, so the source count measures it and the word cap only bounds it.
- Cheaper option to carry out: the 6,000-word target.

### D6. Language and abstract

- Decision: questions 11 and 12 carry identical answers; they are resolved as body EN and abstract EN-only. Lit-review mode has no abstract step (abstract agent is not in its agent list), so no abstract is produced in this run.
- Options considered: none beyond the user's answer; this entry records how the duplicate answer is read.
- Reason: both answers state English body and English-only abstract.
- Cheaper option to carry out: not applicable; there is one reading.

### D7. External review

- Decision: no external review runs. The review tool is not installed: no review tool is installed. Lit-review mode also has no review phase. The orchestrating session reads and checks every agent output and resolves identifiers by script (D3).
- Options considered: none available; the reviewer skill is absent.
- Reason: the skill that would run the review is not present and lit-review mode defines no review phase.
- Cheaper option to carry out: not applicable; there is one option.

### D8. Content of the LaTeX output

- Decision: formatting agent converts the whole Literature Search Report (`search/literature_search_report.md`) into `output/literature_review.tex` with `references.bib`, IEEEtran document class and IEEEtran bibliography style. Every `[Key]` citation becomes `\cite{Key}`. The search strategy, screening results, synthesis, identified gaps, recommended sources and quality gates form the body; the literature matrix, the annotated bibliography and the list of merge-run exclusions are appendices. The file carries an AI-usage note (D4). The orchestrating session compiles it with pdflatex and bibtex to confirm that every citation resolves.
- Options considered: a .tex holding the synthesis and gaps only; a .tex holding the whole report.
- Reason: the lit-review deliverable is the whole report (annotated bibliography, literature matrix and synthesis), and the formatter phase is format-only, so dropping sections would change content.
- Cheaper option to carry out: the synthesis-and-gaps-only .tex.

### D9. Dash in a quoted title

- Decision: the reference entry Kiers1999PARAFAC2 keeps the dash in its title (`{PARAFAC2}---{Part I}`), because the Crossref record of DOI 10.1002/(sici)1099-128x(199905/08)13:3/4<275::aid-cem543>3.0.co;2-b gives the published title as "PARAFAC2" followed by an em dash and "Part I. A direct fitting algorithm for the PARAFAC2 model". The rule against dashes applies to prose written for this review, and a reference title is reproduced as published.
- Options considered: keep the published title; replace the dash with a period or colon.
- Reason: a reference list reproduces titles as the record gives them.
- Cheaper option to carry out: keeping the title (no edit).

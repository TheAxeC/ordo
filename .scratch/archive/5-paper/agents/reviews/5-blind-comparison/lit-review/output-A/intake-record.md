# Intake record (CONFIRMED, lit-review mode)

This record is confirmed. The user answered all 19 intake questions; every row below is resolved from those answers, and where the user answered "as you recommend" the row holds the recommendation the draft made for that question. The user's answers are quoted verbatim in `settings.md` section (b), and the decisions taken without asking, under the user's instruction to take each recommendation and record it, are in `settings.md` section (c) (D1 to D7). The search stage has not started and no literature search has been done.

## Step 0: Deep Research Handoff Detection

No handoff materials were detected. The conversation context passed to this agent contains no Research Question Brief, Methodology Blueprint, Annotated Bibliography, Synthesis Report or INSIGHT Collection. The working directory holds no bibliography, draft, data file or other material outside `.claude/`, and the user confirmed in answer 14 that no seed .bib or reference list exists. The full interview flow (Steps 1 to 13) was therefore applied.

## Mode Detection

The request says "Run the skill in lit-review mode: review the literature on ...", which maps to `lit-review` in the Mode Detection table of `the intake instructions`. Per `the mode guide`, `lit-review` produces an annotated bibliography, a literature matrix and a synthesis analysis, using intake agent followed by search agent. The user confirmed in answer 4 that the output is a related-work basis for a later methods paper, so `lit-review` stands. The LaTeX output the user chose in answer 10 is produced by a formatting agent step chained after lit-review (`settings.md` decision D2).

## intake record

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

## Step 12: Domain Evidence Profile

Confirmed: `cs_ml` (answer 18). The profile changes only which evidence types the literature screening admits: peer-reviewed papers, conference proceedings, archival preprints (for example arXiv) and industry technical reports. It does not change the A-F grade and does not block ship. The request is a ship-ready value, so the stored effective value equals it and no reserved-profile fallback applies.

## Step 13: Citation Verification Level

Confirmed: strict (answer 19). A citation whose exact DOI or arXiv ID provably fails lookup blocks finalization; a citation given without an identifier is not blocked by this level. The Material Passport is not materialized in this run, so nothing is written to it; if a passport is materialized in a later run, it carries `terminal_policies.citation_existence: strict`. The enforcement procedure for this run is `settings.md` decision D3.

# Disclosure record

## Venue and policy

- Venue: Biomedical Signal Processing and Control (Elsevier), from `\journal{...}` of main.tex.
- Policy anchor: none.
- Policy source: none. The venue is not listed in `references/ai-disclosure.md` and no policy text was pasted at intake, so the venue's policy was not checked and the generic detailed form of `references/ai-disclosure.md` was used.
- Access date: none, since no policy page was read.
- Placement: an unnumbered section "Declaration of generative AI and AI-assisted technologies in the writing process" between the conclusion and the bibliography, where the manuscript already held it (Biomedical Signal Processing and Control policy not checked; no source URL; no access date).
- Before submission the authors check the placement, the heading and any required wording against the journal's current guide for authors.
- Category matching against the venue's requirements was not possible, since the requirements were not checked. No mismatch can be named until they are.

## Model identifier

- Tool of this run: Claude, model identifier claude-opus-5-5, as the session gave it in the prompt and the Notes of config.md record it.

## AI use categories

| Category | Mark | In the statement |
|---|---|---|
| Research assistance | uncertain | `[GAP: AI use category Research assistance not confirmed]` |
| Drafting assistance | used (this run), uncertain (earlier work) | Written as used for the statements this run drafted; `[GAP: AI use category Drafting assistance not confirmed]` for earlier work |
| Revision assistance | uncertain | `[GAP: AI use category Revision assistance not confirmed]` |
| Editing assistance | uncertain | `[GAP: AI use category Editing assistance not confirmed]` |
| Analysis assistance | uncertain | `[GAP: AI use category Analysis assistance not confirmed]`, as a separate paragraph of the AI declaration |
| Peer review simulation | uncertain | `[GAP: AI use category Peer review simulation not confirmed]` |

- Software implementation is not one of the six categories. The statement keeps the manuscript's wording "a generative AI assistant (Claude) ... to support software implementation", as config.md records.
- The manuscript's earlier declaration said Claude was used "to edit and improve the language of the manuscript". Config.md marks Editing assistance uncertain, so the new statement does not state language editing as used and carries the Editing assistance gap in its place. The authors confirm or remove it.

## Authors

| Name | Affiliation | ORCID | Corresponding |
|---|---|---|---|
| Dongho Chun | Data Science Institute (DSI), Hasselt University, Hasselt, Belgium | [GAP: ORCID of Dongho Chun] | no |
| Axel Faes | Biomedical Data Sciences, Data Science Institute (DSI) and Biomedical Research Institute (BIOMED), Hasselt University, Hasselt, Belgium | [GAP: ORCID of Axel Faes] | yes (axel.faes@uhasselt.be) |

Equal contribution: [GAP: equal-contribution declaration].

## Contribution matrix

Each cell that the Contributions row marks as a role of the author holds the gap for its degree, since config.md records no Lead or Supporting value. Roles the row gives to no author hold `--` and are covered by the gap for added roles.

| Role | Dongho Chun | Axel Faes |
|---|---|---|
| Conceptualization | -- | [GAP: Lead or Supporting for each CRediT role] |
| Data curation | -- | -- |
| Formal analysis | -- | -- |
| Funding acquisition | -- | -- |
| Investigation | [GAP: Lead or Supporting for each CRediT role] | -- |
| Methodology | [GAP: Lead or Supporting for each CRediT role] | [GAP: Lead or Supporting for each CRediT role] |
| Project administration | -- | -- |
| Resources | -- | -- |
| Software | [GAP: Lead or Supporting for each CRediT role] | -- |
| Supervision | -- | [GAP: Lead or Supporting for each CRediT role] |
| Validation | -- | -- |
| Visualization | -- | -- |
| Writing -- original draft | [GAP: Lead or Supporting for each CRediT role] | -- |
| Writing -- review & editing | -- | [GAP: Lead or Supporting for each CRediT role] |

Added roles: [GAP: any CRediT role beyond those the manuscript lists]. The study reports statistical analysis, figures and a funded program, and no author holds Formal analysis, Visualization or Funding acquisition. That is a judgment from the manuscript for the authors to settle, and the statement does not assign these roles.

## Funding register

| Funder | Grant type | Grant number | Role of the author | Period |
|---|---|---|---|---|
| Flanders AI Research Program (FAIR), an Impulse Program of the Flemish Government (Flemish Ministry of Economy, Science and Innovation) | not recorded | [GAP: FAIR grant number] | not recorded | not recorded |
| [GAP: any other funder] | | | | |

Role of the funder in study design, data collection and analysis, decision to publish and preparation of the manuscript: not recorded, so the statement carries `[GAP: role of the funder in study design, data collection and analysis, decision to publish, or preparation of the manuscript]` in place of the sentence "The funder had no role ...".

## Statements and blocks

| Statement | Block | Change |
|---|---|---|
| Code and data availability | B0075 | Replaced (OP001) |
| Ethics | B0076 | Replaced (OP002) |
| CRediT author contributions | B0077 | Replaced (OP003) |
| Funding | B0078 | Replaced (OP004) |
| Declaration of competing interest | B0079 | No op. The no-conflict form of `references/statements.md` that the row "none" gives is byte-identical to the block's existing text. |
| Declaration of generative AI and AI-assisted technologies in the writing process | B0080 | Replaced (OP005) |

## Gaps

In the manuscript:

1. `[GAP: PhysioNet URL or DOI of PTB-XL version 1.0.3]`, Code and data availability. Config.md names PhysioNet but gives no identifier of the versioned record. The DOI of `ptbxl2020` in refs.bib is that of the descriptor article.
2. `[GAP: PhysioNet URL or DOI of the MIT-BIH Arrhythmia Database version 1.0.0]`, Code and data availability, for the same reason. The DOI of `mitbih2001` is that of the descriptor article.
3. `[GAP: code DOI or release tag]`, Code and data availability, from config.md.
4. `[GAP: ethics approval and consent obtained by the studies that collected PTB-XL and the MIT-BIH Arrhythmia Database]`, Ethics. The row records no approval of the authors' own, and `references/statements.md` asks the statement to state the approval of the collecting study, which config.md does not give.
5. `[GAP: any CRediT role beyond those the manuscript lists]`, CRediT author contributions, from config.md.
6. `[GAP: equal-contribution declaration]`, CRediT author contributions, from config.md.
7. `[GAP: FAIR grant number]`, Funding, from config.md.
8. `[GAP: any other funder]`, Funding, from config.md.
9. `[GAP: role of the funder in study design, data collection and analysis, decision to publish, or preparation of the manuscript]`, Funding. Config.md records no funder role.
10. `[GAP: AI tools and versions used before this run]`, AI declaration, from config.md.
11. `[GAP: AI use category Research assistance not confirmed]`, AI declaration.
12. `[GAP: AI use category Drafting assistance not confirmed]`, AI declaration, for earlier work.
13. `[GAP: AI use category Revision assistance not confirmed]`, AI declaration.
14. `[GAP: AI use category Editing assistance not confirmed]`, AI declaration.
15. `[GAP: AI use category Peer review simulation not confirmed]`, AI declaration.
16. `[GAP: AI use category Analysis assistance not confirmed]`, AI declaration, separate paragraph.

In this record only, since the author block is not a statement block of the patch:

17. `[GAP: ORCID of Dongho Chun]`.
18. `[GAP: ORCID of Axel Faes]`.
19. `[GAP: Lead or Supporting for each CRediT role]`, the contribution matrix. The statement's form lists the roles without their degree.

## For the co-authors before submission

- The contribution roles, their degrees and any added roles.
- The funder details: the grant number, any other funder and the funder's role.
- The conflicts: the declaration of no competing interest stands as the manuscript held it.
- The AI use categories marked uncertain, the earlier tool versions, and whether the language editing the earlier declaration stated took place.

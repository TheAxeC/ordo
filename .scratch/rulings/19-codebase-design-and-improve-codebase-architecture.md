# Rulings: 19. codebase-design and improve-codebase-architecture

- D2 one skill or two (2026-11-23): (a), one skill `codebase-design` with the modes `standards` and `review` (the user).
- D3 the pages the standards mode fills (2026-11-23): (a), every default page `repo-setup` ships: the change standard, the design principles, the coding standards (common and each language found), the UI standard when the repository has a user interface, and the prose standard copied as it is (the user).
- D4 what the review mode holds the code to (2026-11-23): (a), every filled standards page, each candidate naming the page and the rule it breaks, described in the source's vocabulary (the user).
- D5 what the review ends in (2026-11-23): (a), a roadmap entry written through `grill` (the user).
- D7 how the skill finds the standards pages (2026-11-23): (a), a search order that never refuses: the pages the repository's `plan.yaml` names when there is one, then the fixed names under `docs/dev/`, then the defaults in the `repo-setup` folder beside the skill's folder; replaces D1, which was not answered (the user).
- D8 the gate's runs (2026-11-23): (a), Cathedra only: one `standards` run whose pages hold every point of Cathedra's existing "Design principles" section, then one `review` run whose picked candidate is written into Cathedra's roadmap through `grill`; replaces D6, which was not answered (the user).
- D10 the roadmap diff of entry 19 (2026-11-23): (a), written as shown: the entry is titled `19. codebase-design`, with one skill of two modes, the search order and the two runs on Cathedra (the user).
- D11 record as ADR (2026-11-23): (a), yes: `docs/adr/0047-codebase-design-is-one-skill-made-from-two-sources-and-finds-the-standards-pages-by-a-search-order.md`, status proposed, holding D2, D5 and D7 (the user).
- D12 what the review does for a kind of page the repository lacks (2026-11-23): (a), it reviews against Ordo's default page for the missing kind, each such candidate saying that the rule comes from the default page, and a sentence of the default page that still holds an unfilled placeholder is skipped; replaces D9, which was not answered (the user).
- D13 carried, one skill (2026-09-29): "entry 19 shrinks to the `codebase-design` skill", carried from `.scratch/archive/2-e-grill/plan.md:94` (the user).

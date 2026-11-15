# Final message: /paper lit-review, 2026-11-15

The run is finished. The literature strategist (agent aff2d04e2e8fe6ed8, ordo-high, served model claude-opus-5-5 on all 532 assistant entries of its transcript) wrote review.md and refs.bib. review.md includes 84 sources, each with an annotation, and refs.bib holds 84 entries. The 84 keys cited in the synthesis match the 84 keys of refs.bib (comm of the two sorted key lists printed no difference). No manuscript was given, so no file outside the run folder was written or changed.

## Run folder

paper-runs/lit-review-2026-11-15/ holds config.md, review.md (11 sections: search strategy, distribution advisory, screening results, annotated bibliography, literature matrix, gaps, synthesis, sources by section, no entry written, limitations and gates, AI disclosure), refs.bib and final.md.

## Results

- Records screened: 6772 (5657 after duplicate removal), 96 after title and abstract, 84 after full text; 65 High and 19 Medium quality.
- Five themes: tensor regression, tensor PLS and decompositions with an unaligned mode (16 sources as main theme); entropic OT, GW and FGW (14); barycenters, dictionaries and learnable templates (11); permutation-invariant set encoders and transport embeddings (13); medical-imaging pipelines and transport-based alternatives to registration (30).
- Gates: all met (source count 84 of a minimum 30, peer-reviewed share 81.0 percent, currency 52.4 percent after a third pass). Three passes ran out of four; the citation loop did not close and pass 3 still added 25 sources.
- Five gaps, among them: no study predicts a patient outcome from a lesion set through a learned barycenter or an FGW distance to learned templates; no study compares registration, learned templates, transport couplings and permutation invariance on one cohort; no tensor model has an unaligned spatial mode.

## Items for the user

- Decisions taken without a stop under your instruction (config.md, "Decisions"): the intake record was taken as confirmed, and the sources' review was taken as "go on" with no source added or removed.
- Seven candidates could not be assessed because no full text or abstract was retrievable, and are not in the set: Memoli (2011, 10.1007/s10208-011-9093-5), Bazeille et al. (2019), Zhao et al. (2026, 10.1016/j.inffus.2026.104509), Avants et al. (2008, SyN), Ma et al. (2025), Ceyssens and Faes (2026, SSRN 10.2139/ssrn.7083858) and Guo et al. (2025). A later resumption of the strategist with their texts would screen them.
- No entry written: Peyre, Cuturi and Solomon (2016), Gromov-Wasserstein Averaging of Kernel and Distance Matrices, has no DOI or arXiv ID, so lookup.py could not print an entry; it is not cited.
- Index limits: Semantic Scholar and OpenAlex returned HTTP 429 after 3 retries on many calls, so the search leans on Crossref and arXiv. Five preprint-form sources (Set Transformer, attention-based MIL, OT-GNN, generalized sliced-Wasserstein embeddings, FGW barycenter graph prediction) could not have their venue confirmed and are tagged as preprints.
- AI use row: drafting assistance is marked "uncertain" in config.md, while this run's strategist wrote the synthesis prose; the disclosure line in review.md names research assistance only. The row is yours to settle.
- Distribution advisory: 60 of 84 sources (71.4 percent) are computational method papers; review.md gives a search string for clinical evaluation studies.
- Key changes to printed BibTeX: three colliding keys took an "a" suffix (Zhang_2024a, Wang_2026a, Shifat_E_Rabbi_2025a). refs.bib keeps the non-ASCII characters lookup.py printed (such as en dashes in page ranges).
- DOI checking is strict, but with no .tex the reference checks (cite-keys, check-urls) do not run in lit-review mode; they run when these entries are added to a manuscript's .bib.

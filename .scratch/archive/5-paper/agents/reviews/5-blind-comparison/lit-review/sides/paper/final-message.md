The lit-review run is finished: `review.md` includes 84 sources and `refs.bib` has 84 entries. You gave no manuscript, so nothing outside the run folder was written or changed.

**Your instruction.** You asked me not to stop for choices I would make on my own recommendation. I took both such points that way, and each is recorded under "Decisions" in `config.md`:
- I treated your intake answers as the confirmed record.
- At the review of the sources I went on without adding or removing any. The two relevant papers that could not be read can only be added from a text you supply.

**Checks I ran:**
- The literature strategist ran as `ordo-high`, and its transcript shows `claude-opus-5-5` on all 532 of its responses.
- I compared the keys cited in the synthesis with the keys in `refs.bib`: 84 each, with no difference.
- Every source has an annotation (84 of 84), and `review.md` has all 11 sections in order.

**Results** (from `review.md`):
- **Screening:** 6772 records were screened, 5657 after removing duplicates. 96 passed the title and abstract stage and 84 passed the full-text stage. 65 sources are rated High quality and 19 Medium.
- **Themes**, with the number of sources whose main theme it is:
  - tensor regression, tensor partial least squares and decompositions with an unaligned mode: 16
  - entropic optimal transport, Gromov-Wasserstein and fused Gromov-Wasserstein: 14
  - barycenters, dictionaries and learnable templates: 11
  - permutation-invariant set encoders: 13
  - medical-imaging pipelines and transport-based alternatives to registration: 30
- **Gates:** all met. There are 84 sources against a minimum of 30, 81.0% are peer-reviewed, and 52.4% are from the last five years.
- **Search passes:** three of the four allowed were run. The search could have continued: the third pass still added 25 sources, and the citation chains kept returning new papers.
- **Main gaps:**
  - No study predicts a patient outcome from a set of lesions using a learned barycenter or a fused Gromov-Wasserstein distance to learned templates.
  - No study compares registration, learned templates, transport couplings and permutation invariance on the same cohort.
  - No tensor model has a spatial mode that is not aligned across subjects; the ones that exist treat time as the unaligned mode.

**Not done or open:**
- **Seven candidates could not be read**, because neither a full text nor an abstract could be retrieved, so they are not in the set:
  - Memoli 2011, the foundational Gromov-Wasserstein paper
  - Avants et al. 2008, the SyN registration paper
  - Bazeille et al. 2019
  - Zhao et al. 2026, on fusing point-cloud features with radiomics for spinal surgery outcomes
  - Ma et al. 2025
  - Ceyssens and Faes 2026, the SSRN paper on non-corresponding electrode grids
  - Guo et al. 2025

  If you supply their texts, the strategist can be resumed to screen them.
- **No BibTeX entry:** Peyre, Cuturi and Solomon 2016 (Gromov-Wasserstein averaging of kernel and distance matrices) has no DOI or arXiv ID, so the lookup script could not produce an entry. It is not cited.
- **Rate limits:** Semantic Scholar and OpenAlex often rejected requests for exceeding their rate limit, so the search relies mostly on Crossref and arXiv. As a result, five papers could not have their published venue confirmed and are tagged as preprints: Set Transformer, attention-based multiple-instance learning, OT-GNN, generalized sliced-Wasserstein embeddings, and fused Gromov-Wasserstein barycenter graph prediction.
- **AI-use record:** you marked drafting assistance "uncertain", but this run wrote the synthesis text. The disclosure line in `review.md` names research assistance only, so you may want to change that row.
- **Concentration on methods papers:** 60 of the 84 sources (71.4%) are computational method papers. `review.md` gives a search string for clinical evaluation studies if you want to widen this.
- **Strict DOI checking has not been applied yet.** It only runs when there is a `.tex` to check against, so it will run when these entries are added to a manuscript's `.bib`.
- **Edits to the BibTeX:** three keys that collided were given an "a" suffix: `Zhang_2024a`, `Wang_2026a` and `Shifat_E_Rabbi_2025a`.

Files are in `paper-runs/lit-review-2026-11-15/`:
- `config.md`
- `review.md`
- `refs.bib`
- `final.md`

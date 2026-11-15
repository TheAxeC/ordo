I've rewritten the abstract and the keywords of `manuscript/main.tex` and applied them as one patch. The run took no decision that needed you.

**How the patch was checked:**
- `apply_tex_patch.py --check-only` exited 0 and reported no structural changes, and the apply also exited 0.
- `cmp` of the patched file against `main.tex` exited 0, and `shasum -a 256` of `main.tex` matches `output_sha256` in the apply report.
- `git status --short` shows only `manuscript/main.tex` modified, plus the new `paper-runs/` folder.
- The draft writer's transcript records the model `claude-opus-5-5` on every turn, which is the configured model.
- This mode does not compile, so the new text has not been compiled.

**What changed:**
- **Length:** the abstract is now 288 words (counted with `wc -w` on the abstract body), up from 251. You gave no journal limit, so no check was made against one. The draft writer kept it under the 300-word cap its own rules set for a journal abstract.
- **Revision marking:** all new or changed text is in `\rev{...}`. The two passages that were already marked stay marked. One of them now sits inside a larger `\rev` passage, because the highlighting package cannot put one `\rev` inside another.
- **New content:** the abstract now gives:
  - the 95% bootstrap intervals;
  - the HuBERT-ECG supervised ceiling (0.899) against its ARI (0.195);
  - the result of the discriminant fitted on other patients (ARI 0.160 to 0.549);
  - the ten-seed imbalance values (0.265 against 0.063);
  - how much ARI each representation keeps under federation (0.92 against 0.69, lowest 0.455);
  - the extraction cost (fifteen times cheaper per record);
  - a sentence on what the paper adds beyond the closest benchmark.

  The draft writer matched these to referee items in `admin/reviews/reviewer-comments.md`, and reports that no referee comment is about the abstract itself.
- **Closing claim:** it is now limited to "these two binary tasks and two foundation models". The old closing sentence, "The representation, not the algorithm, governs label-free ECG structure", is gone.
- **One correction:** the old abstract said the raw and autoencoder pipelines had "supervised ceilings well above chance". The body (lines 496<en dash>497) gives the raw ceiling as 0.519 against a 0.504 majority, so the new abstract drops that claim.
- **Keywords:** "unsupervised clustering" and "representation learning" repeated the title. They are replaced by "atrial fibrillation", "hand-crafted features" and "MIT-BIH", each marked with `\rev`, which makes 7 keywords.

**Issues for you:**
- **Highlights:** `manuscript/highlights.txt` was not updated or checked against the new abstract. Its bullet on line 4, "Representation, not the clustering algorithm, governs label-free ECG structure", still makes the broad claim the new abstract no longer makes.
- **Roadmap numbers that disagree with the body:** the draft writer found two in `admin/reviews/revision-roadmap.md`:
  - R2-5 says the discriminant check "recovers ARI 0.92", but body lines 521<en dash>522 give 0.549.
  - R2-1a says "5000 by 12", but body line 201 gives 1000 by 12.

  The abstract follows the body. The response letter should not quote the roadmap's figures.
- **Result left out:** the scaler result (ECGFounder ARI drops from 0.866 to 0.093 under robust scaling, body lines 579<en dash>580) was in the old abstract and was dropped for length.
- **Draft writer outside its brief:** it ran one read-only `python3` command to read the patch's index file, which its brief did not allow. By its own report the command wrote nothing.
- **Body line numbers not checked:** the draft writer's report gives a body line for each number in the abstract. I did not check those line numbers.

Nothing is committed.

Files are in `paper-runs/abstract-only-2026-11-15/`:
- `config.md` <en dash> your answers, with your instruction not to stop recorded under Decisions
- `final.md` <en dash> the full run report
- `patches/` <en dash> the patch and its records

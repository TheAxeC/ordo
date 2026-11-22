# /paper abstract-only: final message

The abstract and the keywords of `manuscript/main.tex` are rewritten and applied as one patch with the id `abstract-only`. `apply_tex_patch.py --check-only` exited 0 with no structural flags, the apply exited 0, `cmp` of the patched file and `main.tex` exited 0, and `shasum -a 256` of `main.tex` (908d09a2...) equals `output_sha256` in the apply report. `git diff --stat` shows `manuscript/main.tex` as the only changed file (25 insertions, 26 deletions). No stop was reached. This mode runs no compile, so the new text has not been compiled.

## What changed

- **Abstract (block B0010):** the draft writer reports 288 words, against 251 before. Every venue limit is "not stated", so no check was made against the journal's limit. The 288 words are under the 300-word cap that the draft writer's page sets for a journal abstract. All new or changed text is marked with `\rev{...}`. The existing passage "repeated over ten seeds for the clusterers that depend on one" stands inside the first new `\rev` passage, because soul cannot nest a `\rev` inside a `\rev`. The existing `\rev{0.000}` is kept as its own `\rev`.
- **What the new abstract adds:** it now gives the 95% bootstrap intervals, the HuBERT-ECG supervised ceiling (0.899) against its ARI (0.195), and the out-of-fold discriminant result (0.160 to 0.549). It gives the ten-seed imbalance values (0.265 against 0.063), the federation retention (0.92 against 0.69, worst draw 0.455) and the extraction cost (fifteen times cheaper). It adds a sentence on what the paper adds beyond the closest foundation-model benchmark. The draft writer mapped these to referee items R1-1, R1-4, R2-4, R2-5, R3-1 to R3-6, R3-8, R3-9 and R3-13 of `admin/reviews/reviewer-comments.md`. It reports that no referee comment names the abstract itself.
- **Closing sentence:** it is now bounded to "these two binary tasks and two foundation models". It replaces "The representation, not the algorithm, governs label-free ECG structure."
- **Correction:** the old abstract said the raw and autoencoder pipelines had "supervised ceilings well above chance". The draft writer reports that the body (lines 496-497) puts the raw ceiling at 0.519 against a 0.504 majority, and the new abstract does not make that claim.
- **Keywords (block B0011):** "unsupervised clustering" and "representation learning" are replaced by "atrial fibrillation", "hand-crafted features" and "MIT-BIH", each in `\rev{...}`. The draft writer's reason is that the two removed terms repeat the title. There are 7 keywords now.

The draft writer's report gives a body line for each number in the abstract. The session did not check those line numbers.

## Issues for you

- **Highlights not checked:** `manuscript/highlights.txt` was not read by the draft writer. Whether its numbers and claims agree with the new abstract is not verified. Its closing bullet "Representation, not the clustering algorithm, governs label-free ECG structure" states the claim that the new abstract no longer makes in that unbounded form.
- **Roadmap numbers that differ from the body:** the draft writer reports two. Item R2-5 of `admin/reviews/revision-roadmap.md` says the discriminant check "recovers ARI 0.92", where body lines 521-522 give 0.549 for HuBERT-ECG. Item R2-1a says "5000 by 12 at 100 Hz", where body line 201 gives 1000 by 12. The abstract follows the body. The response letter should not quote the roadmap's figures.
- **Result dropped from the abstract:** the scaler result (ECGFounder mean ARI 0.866 falling to 0.093 under robust scaling, body lines 579-580) was in the old abstract and is not in the new one. The draft writer left it out for length.
- **Departure from the brief:** the draft writer ran one read-only inline `python3 -I -c` command to read the manifest, where its brief allows no script of its own. By its own report, the command wrote no file. Its only output in the run folder is its patch.
- **Model:** every turn of the draft writer's transcript, `agent-adb65ff158f512149.jsonl`, records the model `claude-opus-5-5`, which is the configured one.

## Run folder

`paper-runs/abstract-only-2026-11-15/`:

- `config.md`: the intake record, with your standing instruction under Decisions.
- `patches/01-main.tex.block-manifest.json`
- `patches/01-main.tex.patch.json`
- `patches/01-main.tex.patched`
- `patches/01-main.tex.patched.apply-report.json`
- `final.md`: this message.

Nothing is committed. `git status` shows `manuscript/main.tex` modified and `paper-runs/` untracked.

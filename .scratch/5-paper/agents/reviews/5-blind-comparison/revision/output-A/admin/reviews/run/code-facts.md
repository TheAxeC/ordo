# Code facts for revision round 1 (class C items)

Source: `code/` in the working directory. All paths and line numbers below refer to `code/` and were re-read there. The facts were first extracted from the public repository https://github.com/TheAxeC/ecg-representation-clustering at commit 78472d352ac52268d313a686cbc321a960f135a4 (the only commit, no tags, no releases). `code/` differs from that commit in `code/experiments/figures.py` (one line, see H2), in holding the extra directories `code/results/`, `code/figures/` and `code/attic/`, and in holding `code/.depositignore` where the public commit has `.gitignore`.

No code was run. Values were read from the files with Read, Grep and Glob; every piece of arithmetic is written out where it is used.

## 0. What `code/` contains, and what it does not

`code/` holds 19 Python files outside `attic/` (`paper.py`, 7 in `core/`, 11 in `experiments/`), README.md, requirements.txt, LICENSE, `.depositignore`, 5 files in `attic/` (README.md and 4 Python files), 11 CSV files in `results/` and 4 PDF files in `figures/` (listing from `ls`).

`code/.depositignore` lines 6, 9-10 and 13-17 exclude `attic/`, `results/`, `figures/`, `__pycache__/`, `*.py[cod]`, `*.npy`, `*.npz` and `*.pkl` from the public deposit; line 8 says the generated CSVs and PDFs are kept locally and excluded from the deposit. The result CSVs are therefore present in `code/results/` but absent from the public repository. The cohort and embedding caches (`_cohort_0_lr.pkl`, `_feats_2542_lr.npz`, `_hubert_emb.npy`, `_ecgfounder_emb_up100.npy`) are not in `code/`.

Result files present in `code/results/`: `baselines.csv`, `baselines_foundation.csv`, `baselines_learned.csv`, `baselines_mitbih.csv`, `results_compare_strong.csv`, `results_federated.csv`, `results_foundation.csv`, `results_learned.csv`, `results_mitbih.csv`, `results_raw.csv`, `summary.csv`. Files the code would write that are absent: `results_ecgfounder.csv` and `baselines_ecgfounder.csv` (`code/experiments/arm_ecgfounder.py` lines 103, 106). Nothing from the stdout-only scripts (`code/experiments/run_analyses.py`, `code/experiments/native500_check.py`) is stored.

Which script produced which printed number, per `code/README.md` lines 57-68 and the code: Table 1 is assembled in `code/experiments/figures.py` lines 38-47: raw-flatten row from `results_raw.csv` (`code/experiments/benchmark.py`), conv-AE row from `results_learned.csv` (`code/experiments/arm_learned.py`), hand-crafted, HuBERT-ECG and ECGFounder rows from `results_compare_strong.csv` (`code/experiments/compare_strong.py`). The Table 1 ceiling column is hard-coded in `code/experiments/figures.py` lines 34-35 as raw 0.519, conv-AE 0.678, hand-crafted 0.942, HuBERT-ECG 0.899, ECGFounder 0.983, which equal the printed cells at main.tex lines 253-257. Manuscript Table 2 (MIT-BIH) comes from `code/experiments/mitbih_bench.py`; manuscript Table 3 (federated) comes from `code/experiments/fed_cluster.py`. The significance tests, K-sweep AMI, random-forest ceilings and the 9:1 result come from `code/experiments/run_analyses.py` and are printed to stdout only (`code/README.md` line 68). The 500 Hz versus 100 Hz check comes from `code/experiments/native500_check.py`, stdout only.

Second writers in `attic/` (used here only because the fact exists nowhere else): `code/attic/run.py` lines 93, 94 and 100 also write `results_raw.csv`, `baselines.csv` and `summary.csv`, and `code/attic/run_ecgf_compare.py` line 62 also writes `results_compare_strong.csv` (`code/attic/README.md` line 6). For the first three the stored files match the format of `code/experiments/benchmark.py` and not of `attic/run.py`: the stored `results_raw.csv` has a `scaler` column, which `attic/run.py` line 87 does not write, and the stored `baselines.csv` has no `dataset` column and uses `supervised_acc[...]`, where `attic/run.py` lines 60-77 write a `dataset` column and `supervised_ceiling[...]`. For `results_compare_strong.csv` both writers call the same `sweep_representation` (`code/experiments/compare_strong.py` line 47, `code/attic/run_ecgf_compare.py` line 57) and produce the same columns, so which of the two wrote the stored file is AMBIGUOUS.

Numbering mismatch: `code/README.md` lines 65-66, `code/paper.py` lines 28-29 and `code/experiments/figures.py` line 142 call the federated table "Table 2" and the MIT-BIH table "Table 3"; in main.tex the MIT-BIH table is Table 2 (lines 353-368) and the federated table is Table 3 (lines 390-405).

Loaders outside the published path: `code/core/data.py` `load_ptbxl` (lines 52-77, reads the 500 Hz `filename_hr` files) and `load_mitbih_beats` (lines 87-122) are not called by any file in `core/` or `experiments/`; their only callers are `code/attic/run.py` lines 36 and 38 (Grep for `load_ptbxl|load_mitbih_beats` over `code/**/*.py`). The paper's PTB-XL data path is `code/experiments/benchmark.py`; the MIT-BIH path is `code/experiments/mitbih_bench.py` `load_beats`.

## 1. Input and preprocessing (C-5, K11)

A1 FOUND. WFDB reader and dtype, PTB-XL: `wfdb.rdsamp(base, pn_dir="ptb-xl/1.0.3/<subdir>")`, streamed from PhysioNet, signal cast with `.astype(np.float32)`, sampling rate taken from the header metadata (`code/experiments/benchmark.py` lines 25, 58-65). Records come from the `filename_lr` column when `--res lr`, the default (`code/experiments/benchmark.py` lines 52, 171); the cache name `_cohort_0_lr.pkl` used by every other driver confirms the lr path (for example `code/experiments/arm_learned.py` line 20, `code/experiments/compare_strong.py` line 25). MIT-BIH: `wfdb.rdrecord(...)` then `rec.p_signal.astype(np.float32)` (`code/experiments/mitbih_bench.py` lines 37-40); annotations from `wfdb.rdann(..., "atr")` (line 38).

A2 NOT IN code/. Signal unit. The code applies no unit conversion and does not read or store the units field of the header (Grep for `units|mV|adc` over `code/**/*.py` returns nothing). The unit is whatever the record header declares; `code/` does not state it.

A3 FOUND. Sampling rate per PTB-XL representation. All PTB-XL representations start from the 100 Hz cohort (`_cohort_0_lr.pkl`). Raw flattening: 100 Hz input (`code/core/features.py` lines 39-47). Hand-crafted: NeuroKit2 run at `sampling_rate=fs` with `fs = r.fs`, so 100 Hz (`code/core/features.py` lines 129-139). Conv-AE: 100 Hz record FFT-resampled with `scipy.signal.resample` to 2500 samples per lead (`code/core/deep_repr.py` lines 22-29, 38), equivalent to 250 Hz for a 10 s strip. HuBERT-ECG: 100 Hz, first 500 samples per lead (`code/experiments/arm_foundation.py` lines 31-32, 63-70). ECGFounder: 100 Hz record FFT-resampled to 5000 samples per lead (`code/experiments/arm_ecgfounder.py` lines 68-76). Only the 300-record consistency check reads native 500 Hz (`code/experiments/native500_check.py` lines 37-41, 50-55).

A4 FOUND. Leads per PTB-XL representation. Raw flattening: all leads in the record (loop over `range(r.signal.shape[1])`, `code/core/features.py` lines 42-43), 12 for PTB-XL. Conv-AE: all leads, input channels `C = X.shape[1]` (`code/core/deep_repr.py` lines 27, 41), 12 for PTB-XL. Hand-crafted: lead II only; `lead_idx = PTBXL_LEAD_NAMES.index("II")` when the record has 12 leads, otherwise column 0 (`code/core/features.py` lines 124-125; `code/core/config.py` lines 30-32). HuBERT-ECG: 12 leads, `r.signal[:500, :12]` (`code/experiments/arm_foundation.py` line 66). ECGFounder: 12 leads, `r.signal[:, :12]` (`code/experiments/arm_ecgfounder.py` line 74). The sentence "Lead II is used for rhythm and morphology" (main.tex lines 161-162) holds for the hand-crafted features only.

A5 FOUND. Leads per MIT-BIH representation. All three use both channels of each record: the beat is `sig[a:b]` with shape (samples, 2) (`code/experiments/mitbih_bench.py` lines 40, 57). Raw beat flattens both channels (line 86). The 21 features loop over both channels (line 70). Conv-AE takes both channels as input channels (lines 93-97). Lead names per record (MLII, V1, V2, V4, V5) are not read or stored by the code.

A6 FOUND. Filters, baseline removal, normalisation. Raw flattening: no filter, no baseline removal, no normalisation before the conditioner; only a non-overlapping moving average (`code/core/features.py` lines 32-36, 39-47). Hand-crafted: `nk.ecg_clean(sig_lead, sampling_rate=fs)` with no method argument, so the library default method of NeuroKit2 (version not pinned, see K1) (`code/core/features.py` line 133); R peaks from `nk.ecg_peaks(cleaned, sampling_rate=fs)` with the library default method (line 134); delineation `nk.ecg_delineate(cleaned, rpeaks, sampling_rate=fs, method="dwt")` (line 139); amplitude features are read from the cleaned signal (line 140). Conv-AE: per-lead z-score over time, `(X - mean) / (std + 1e-6)` along the time axis (`code/core/deep_repr.py` lines 39-40). HuBERT-ECG: no normalisation, no filter (`code/experiments/arm_foundation.py` lines 15-18 docstring, lines 63-70). ECGFounder: one global z-score per record over the whole 12 x 5000 array, `(s - s.mean()) / (s.std() + 1e-8)` (`code/experiments/arm_ecgfounder.py` line 75). MIT-BIH raw beat and 21 features: no filter, no baseline removal (`code/experiments/mitbih_bench.py` lines 57, 66-79). After representation extraction, every representation passes through the conditioner (section 3, C10) fitted on the full matrix.

A7 FOUND. Raw-flattening downsampling and the ~2000 dimensions. Window 6, non-overlapping moving average (`code/core/config.py` line 62; `code/core/features.py` lines 32-36, 42-43); all leads concatenated and truncated to the shortest length (lines 44-47). A 10 s PTB-XL record at 100 Hz has 1000 samples per lead; 1000 // 6 = 166 per lead; 12 x 166 = 1992 dimensions. `RAW_TARGET_LEN_PER_LEAD = 833` (`code/core/config.py` line 61) is defined but not used anywhere (Grep over `code/**/*.py` returns only the definition).

A8 FOUND. Conv-AE input shape, architecture and training. Input (N, 12, 2500) on PTB-XL (`code/core/deep_repr.py` lines 22-29, 38-41). Encoder: Conv1d(C,32,k7,s2,p3), LeakyReLU, Conv1d(32,64,k7,s2,p3), LeakyReLU, Conv1d(64,128,k7,s2,p3), LeakyReLU, AdaptiveAvgPool1d(1), Flatten, Linear(128,32) (lines 47-51). Decoder: Linear(32, 128*(T//8)), then ConvTranspose1d 128 to 64 to 32 to C, kernel 8, stride 2, padding 3, with LeakyReLU between, output cropped or padded to T (lines 52-67). Training: Adam lr 1e-3, MSE loss, batch 64, at most 50 epochs on PTB-XL (`code/experiments/arm_learned.py` line 64), 10% random validation split via `random_split` with generator seed 0, early stopping when validation loss fails to improve by 1e-5 for 8 epochs, best-validation weights restored (`code/core/deep_repr.py` lines 32, 70-98). The embedding is the 32-d encoder output for all records, training records included (lines 99-102). The autoencoder is trained once with seed 0 (`code/experiments/arm_learned.py` line 64). On MIT-BIH the beat (198 samples at 360 Hz, see A11) is FFT-resampled to 2500 samples per channel by the same `_resample_stack` default (`code/core/deep_repr.py` line 22), input (N, 2, 2500), at most 40 epochs, seed 0 (`code/experiments/mitbih_bench.py` lines 93-97).

A9 FOUND. ECGFounder resampling and input length. `scipy.signal.resample(r.signal[:, :12].T, 5000, axis=1)` (FFT resampling of the full 100 Hz record to 5000 samples per lead), then global z-score; input shape (N, 12, 5000) (`code/experiments/arm_ecgfounder.py` lines 68-76). The embedding cache `_ecgfounder_emb_up100.npy` is built by `code/experiments/arm_ecgfounder.py` lines 34, 97-99 or by `code/experiments/compare_strong.py` lines 34-42 when absent; `code/attic/run_ecgf_compare.py` lines 24-41 builds the same cache file with the same resampling and z-score (lines 27-30). The preprocessing is the same on either path; which path built the stored cache is not recorded (see E6, E7).

A10 FOUND. HuBERT-ECG input. 100 Hz, first 5 s: `r.signal[:500, :12]`, zero-padded if shorter, transposed and flattened lead-major to a 6000-long 1-D vector (`code/experiments/arm_foundation.py` lines 31-32, 63-70).

A11 FOUND. MIT-BIH resampling. None for the raw beat and the 21 features: the window is taken at the native `rec.fs` (`code/experiments/mitbih_bench.py` lines 39, 41). Window `pre = int(0.30*fs)`, `post = int(0.25*fs)` (lines 27, 41); at 360 Hz this is 108 + 90 = 198 samples, and the raw beat vector is 198 x 2 = 396 dimensions (line 86), matching "~400-d" in main.tex line 361. The conv-AE arm resamples to 2500 (A8).

A12 FOUND. The 16 PTB-XL hand-crafted features, in order (`code/core/features.py` lines 53-59), all computed on lead II after `nk.ecg_clean`. RR features from R peaks (lines 62-81): rr_mean (mean RR, ms, continuous); rr_sdnn (population SD of RR, ms, continuous); rr_rmssd (root mean square of successive RR differences, ms, continuous); rr_pnn50 (fraction of successive differences above 50 ms, continuous in [0,1]); rr_cv (SD/mean of RR, continuous); rr_entropy (Shannon entropy of a 16-bin RR histogram over 200-2000 ms, continuous); hr_mean (60000/mean RR, bpm, continuous); n_beats (number of detected R peaks, count). Morphology features (lines 84-118): pwave_present_frac (number of non-NaN DWT P peaks divided by number of R peaks, continuous fraction); pwave_amp_mean and pwave_amp_std (mean and SD of the cleaned signal at P peaks, continuous); qrs_width_mean (mean of R offset minus R onset from DWT delineation, ms, continuous); qrs_amp_mean and qrs_amp_std (mean and SD of the cleaned signal at R peaks, continuous); beat_corr_mean and beat_corr_std (mean and SD of the Pearson correlation of each +/-250 ms beat with the median beat of the same record, continuous). No feature is binary; "P-wave presence" in main.tex line 186 is the fraction pwave_present_frac. The manuscript list at lines 184-187 omits rr_mean, n_beats, pwave_amp_std, qrs_amp_std and beat_corr_std as separate items.

A13 FOUND. The 21 MIT-BIH features (`code/experiments/mitbih_bench.py` lines 66-79). Five RR-context features in seconds, continuous: rr_prev, rr_next, rr_prev/rr_next, rr_prev/rr_local, rr_local, where rr_local is the mean of up to six preceding RR intervals (lines 46, 58-59, 68-69). Then eight features per channel, two channels, 16 in total: r_amp (signed value of the sample with largest absolute value in the window, continuous); energy (sum of squares, continuous); qrs_w (number of samples whose absolute value exceeds half of |r_amp|, count); max; min; skewness; kurtosis (scipy defaults, continuous); Pearson correlation with the global median template (continuous). The template is the median over all beats in the analysed 3000-beat subsample, both classes pooled (lines 88-89). 5 + 2 x 8 = 21. No feature is binary.

A14 FOUND. Missing-value and failed-detection handling. PTB-XL hand-crafted: if NeuroKit2 raises, all 16 features stay NaN (`code/core/features.py` lines 131-142); with fewer than 3 R peaks the RR and morphology features are NaN (lines 63-66, 89-90); P amplitude features stay NaN when no P peak is found (lines 96-98); QRS width stays NaN when no onset/offset pair is valid (lines 103-105); beat-correlation features stay NaN with fewer than 3 complete beats (lines 113-117). NaNs are then replaced by the column median over the whole cohort (`code/experiments/benchmark.py` lines 103-104; the per-call imputation in `code/core/features.py` lines 145-148 runs on single records because `_rhythm_one` calls `rhythm_morph([rec])`, `code/experiments/benchmark.py` lines 87-88, so for an all-NaN record it leaves NaNs that the cohort-level imputation fills). No count of imputed records is logged. MIT-BIH 21 features: column-median imputation (`code/experiments/mitbih_bench.py` line 91). Beats whose window crosses the record edge are dropped (line 56); the first and last annotated beat of each record are skipped (line 48).

## 2. Cohort facts (K10, K12)

B1 FOUND. AF positive rule. A record is AF if any of its `scp_codes` keys is in {"AFIB", "AFLT"} at likelihood >= 0.0, and SR if it has "SR" and no AF code; other records are dropped (`code/core/config.py` lines 36-37, 47; `code/experiments/benchmark.py` lines 35-40). The threshold 0.0 makes the rule presence-based (`code/core/config.py` lines 42-47).

B2 NOT IN code/. Number of AFLT records in the 1,260-record AF class. The cohort cache `_cohort_0_lr.pkl` is not in `code/`, no result CSV carries a record id or SCP code, and the code does not count AFLT. The only AFLT count in `code/` is a whole-database comment, `code/core/config.py` line 45: "presence-based gives SR=16743, AF=1570 (AFIB 1466 + AFLT 56+48), 134 patients shared across classes"; it refers to all of PTB-XL, and "56+48" is not explained (Grep for `AFLT` over `code/`).

B3 FOUND. Balanced cohort draw (`code/experiments/benchmark.py` lines 31-55, called with `per_class=0`, line 170). Target n = number of distinct AF patients (line 43). SR records are shuffled with `sample(frac=1.0, random_state=0)` and taken one record per patient until n are picked; then AF records are shuffled the same way and taken one per patient, skipping any patient already used, until n or exhaustion (lines 44-54). SR is drawn first, so a patient with both SR and AF records whose SR record was drawn cannot contribute an AF record. The counts 1282 SR and 1260 AF are stated in `code/README.md` line 71. The stored majority purity 0.5043273013375295 (`code/results/baselines.csv` row 2) is consistent with them: 1282 / 2542 = 0.5 + 11/2542 = 0.5 + 0.0043273 = 0.5043273. Patient-disjointness is enforced by the `used` set (lines 49-51).

B4 FOUND (procedure); size NOT IN code/. 9:1 subsample (`code/experiments/run_analyses.py` lines 86-97). All SR records are kept; AF records are permuted with `np.random.default_rng(0)` and the first `len(sr) // 9` are kept (lines 88-90). The resulting count is printed at line 93 and not stored; no committed file states 142 or 1424 (Grep for `1424|\b142\b` over `code/`). With the 1282 SR of `code/README.md` line 71 the rule gives 1282 // 9 = 142 AF, but that number is a derivation, not a stored value. One draw only, and one k-means run with `n_init=10, random_state=0` per representation after `PowerTransformer()` refitted on the subsample (lines 95-96). The 9:1 ARI and AMI are therefore single runs, not seed means. Representations: raw_flatten, rhythm_morph, hubert_ecg, ecgfounder (lines 29-31); conv-AE is not included.

B5 NOT IN code/. MIT-BIH record count (47). The code uses every `*.hea` file in `MITBIH_DIR` (`code/experiments/mitbih_bench.py` line 34) and excludes no record by name; the number of records that contribute beats is printed at run time (lines 123-124) and not stored, and `code/results/results_mitbih.csv` has no record column. Which record is absent from the 47 is not determinable from `code/`. The only record count in `code/` is the comment "standard 48 records" at `code/core/data.py` line 96, in an unused loader.

B6 FOUND. Records 201 and 202 are not grouped together. The group id is the record id `rid` (`code/experiments/mitbih_bench.py` lines 60, 121); there is no subject mapping (Grep for `201|202` over `code/**/*.py` matches only a date, a year and a citation year, at `code/core/config.py` line 45, `code/core/data.py` line 91 and `code/core/ecgfounder_net1d.py` line 4).

B7 FOUND. MIT-BIH beat selection. Class 0 is annotation symbol "N" only; class 1 is "V" only; other beat symbols are skipped as samples but kept in the beat sequence for RR context (`code/experiments/mitbih_bench.py` lines 31, 43-52). Non-beat symbols excluded from the beat sequence: + ~ | " x [ ] ! ? (line 43). At most 400 beats per record per class (lines 28, 53-54). Then 1500 beats per class drawn by `np.random.default_rng(0).permutation` (lines 106-116). The subsample is fixed across seeds. The stored MIT-BIH majority purity is 0.5 (`code/results/baselines_mitbih.csv` row 2), consistent with 1500 per class.

## 3. Clustering (C-4, C-6, K5, K6)

C1 FOUND. k-means: `KMeans(n_clusters=K, random_state=seed, n_init=10)` (`code/core/cluster_eval.py` line 47). init, max_iter and tol are not passed: library default of scikit-learn (`code/requirements.txt` line 5 pins only `scikit-learn>=1.3`).

C2 FOUND. Agglomerative: `AgglomerativeClustering(n_clusters=K, linkage="ward")` (`code/core/cluster_eval.py` line 49). The metric is not passed: library default of scikit-learn (>=1.3, not pinned). No random_state; deterministic.

C3 FOUND. Spectral: `SpectralClustering(n_clusters=K, random_state=seed, affinity="nearest_neighbors", assign_labels="kmeans")` (`code/core/cluster_eval.py` lines 51-52). n_neighbors is not passed: library default of scikit-learn (>=1.3, not pinned).

C4 FOUND. GMM: `GaussianMixture(n_components=K, covariance_type="diag", reg_covar=1e-4, random_state=seed)` (`code/core/cluster_eval.py` lines 57-58). n_init, tol, max_iter and init_params are not passed: library default of scikit-learn (>=1.3, not pinned).

C5 FOUND. HDBSCAN: scikit-learn's `sklearn.cluster.HDBSCAN` (not the standalone hdbscan package), `HDBSCAN(min_cluster_size=max(10, n // 50))` (`code/core/cluster_eval.py` lines 60-61). For the 2542-record PTB-XL cohort this is 2542 // 50 = 50; for the 3000-beat MIT-BIH set it is 3000 // 50 = 60. min_samples and every other parameter are not passed: library default of scikit-learn (>=1.3, not pinned). The `n_clusters` argument is ignored for HDBSCAN (line 61), so HDBSCAN does not use the number of classes (relevant to K6).

C6 FOUND. HDBSCAN noise in the ARI. Labels are passed unchanged to `adjusted_rand_score(y_true, y_pred)` (`code/core/cluster_eval.py` line 86), so label -1 is kept and treated as one more cluster; noise points are neither dropped nor reassigned. The same holds for AMI, NMI, V-measure and FMI (lines 87-91). Purity skips label -1 when summing majority counts but divides by all points, so noise counts as misassigned (lines 68-76). Silhouette is computed on non-noise points only (lines 80-82). largest_cluster_frac and n_nonempty_clusters exclude noise from the cluster sizes but divide by all points (lines 83, 94-95).

C7 NOT IN code/. HDBSCAN noise fraction per representation. The code neither computes nor stores it (Grep for `noise` over `code/**/*.py` finds only the comments at `code/core/cluster_eval.py` lines 71 and 80). What the stored rows do show is in section 13, item 7.

C8 NOT IN code/. How hyperparameters were chosen. No tuning or search code exists (Grep for `GridSearch|tune|optuna|param_grid` over `code/**/*.py` returns nothing). The only stated rationales are code comments: GMM diagonal covariance and reg_covar to avoid singular covariances on high-dimensional representations (`code/core/cluster_eval.py` lines 54-56), and the power scaler chosen as default after a smoke run (lines 29-34; `code/core/config.py` line 64).

C9 FOUND. What a seed varies. Seeds are 0 to 9 (`code/core/config.py` line 23). In the main sweeps the seed is passed only to the k-means, spectral and GMM `random_state` (`code/core/cluster_eval.py` lines 47, 51, 58). Agglomerative and HDBSCAN are run for the first seed only: the seed loop `break`s after one iteration for those two (`code/experiments/benchmark.py` line 148; `code/experiments/arm_learned.py` line 48; `code/experiments/mitbih_bench.py` line 143). The stored CSVs confirm this: every agglomerative and HDBSCAN block has one row, seed 0 (for example `code/results/results_compare_strong.csv` rows 12 and 33, `code/results/results_mitbih.csv` row 140). The agglomerative and HDBSCAN cells of Table 1 and the agglomerative row of Table 2 are therefore single runs, although the captions say "mean ARI over ten seeds" (main.tex lines 242, 355). The seed does not vary the PTB-XL cohort (`random_state=0`, `code/experiments/benchmark.py` line 46), the MIT-BIH subsample (`default_rng(0)`, `code/experiments/mitbih_bench.py` line 110), the conv-AE training (seed 0, `code/experiments/arm_learned.py` line 64; `code/experiments/mitbih_bench.py` line 97), the foundation embeddings (cached once), the 9:1 subsample (B4), the K-sweep (one run, `random_state=0`, `code/experiments/run_analyses.py` line 71) or the 500 Hz check (one run, `code/experiments/native500_check.py` line 76). In the federated study the seed varies both the client partition and the centroid initialisation (`code/experiments/fed_cluster.py` lines 46, 71, 104-106) and the centralized k-means random_state (line 101). The random-ARI baseline is averaged over the ten seeds (`code/experiments/benchmark.py` lines 127-128; `code/core/cluster_eval.py` lines 108-113).

C10 FOUND. Conditioner settings (`code/core/cluster_eval.py` lines 35-39): power is `PowerTransformer(method="yeo-johnson")`; standard is `StandardScaler()`; quantile is `QuantileTransformer(output_distribution="normal")`; robust is `RobustScaler()`. All other arguments (for example PowerTransformer standardize, QuantileTransformer n_quantiles and random_state) are not passed: library default of scikit-learn (>=1.3, not pinned). Each conditioner is fitted on the full representation matrix (`code/experiments/benchmark.py` line 134; `code/experiments/arm_learned.py` line 38). The federated study, run_analyses and the 500 Hz check call `PowerTransformer()` without the method argument (`code/experiments/fed_cluster.py` line 100; `code/experiments/run_analyses.py` lines 70, 80, 95; `code/experiments/native500_check.py` line 75), so the method there is the library default of scikit-learn.

C11 FOUND. "Mean ARI over clusterers" in Section 4.4 (main.tex lines 334-338). It is printed by `code/experiments/benchmark.py` line 164 and `code/experiments/figures.py` lines 139-140 as `groupby("scaler").ARI.mean()` over all result rows of the representation, hand-crafted from `results_raw.csv` and ECGFounder from `results_compare_strong.csv`. Because k-means, spectral and GMM contribute ten rows each and agglomerative and HDBSCAN one row each (C9), the mean is row-weighted: (10 x k-means + 10 x spectral + 10 x GMM + agglomerative + HDBSCAN) / 32. With the stored values all six printed means (0.63, 0.61, 0.36, 0.23, 0.87, 0.09) are reproduced; the arithmetic is in section 13, item 2. The unweighted mean over the five clusterers does not reproduce them (for hand-crafted power, (0.6438958 + 0.6719890 + 0.5444728 + 0.7112614 + 0.0599756) / 5 = 2.6315946 / 5 = 0.5263).

C12 FOUND. Significance test. `scipy.stats.wilcoxon(va, vb)` with no further arguments (library default of scipy, `scipy>=1.10` not pinned) on the per-seed k-means ARIs under power scaling, pairs ecgfounder vs rhythm_morph, rhythm_morph vs hubert_ecg, rhythm_morph vs raw_flatten, hubert_ecg vs raw_flatten (`code/experiments/run_analyses.py` lines 35-60). Conv-AE is not tested. If the two seed vectors are allclose the test is skipped and reported as degenerate (lines 53-55). The printed delta is the difference of the two unrounded seed means (line 58). The seed vectors are built from the concatenation of `results_raw.csv`, `results_learned.csv` and `results_compare_strong.csv` (lines 37-43). rhythm_morph appears in both `results_raw.csv` (rows 130-139) and `results_compare_strong.csv` (rows 2-11), so its vector has 20 entries and line 46 would print n=20 for it; the pairs use the first `n = min(len(va), len(vb))` = 10 entries after sorting by seed (lines 52, 57). All 20 stored rhythm_morph values are the same number, 0.6438958292188861, so the paired differences do not depend on which 10 are taken.

## 4. Probes (K17, C-12, K7)

D1 FOUND. Linear probe: `LogisticRegression(max_iter=2000, class_weight="balanced")`, other arguments library default of scikit-learn (>=1.3) (`code/core/cluster_eval.py` line 120). Folds: `StratifiedGroupKFold(n_splits=5)` without shuffle, grouped by patient (PTB-XL) or record (MIT-BIH) (line 121; groups at `code/experiments/benchmark.py` line 119, `code/experiments/mitbih_bench.py` line 121). The input is the power-conditioned matrix, with the conditioner fitted on all records before the folds are formed (`code/experiments/benchmark.py` lines 134-136; `code/experiments/arm_learned.py` line 32; `code/experiments/mitbih_bench.py` line 129).

D2 FOUND. The ceiling is plain accuracy, `scoring="accuracy"`, averaged over the five folds (`code/core/cluster_eval.py` lines 122, 124); the classifier uses balanced class weights. Macro F1 is computed as well (line 123) and written as `supervised_f1[...]` to the PTB-XL baselines CSVs (for example `code/experiments/benchmark.py` line 138); `code/experiments/mitbih_bench.py` line 130 writes accuracy only. No balanced-accuracy computation exists (Grep for `balanced_accuracy` over `code/**/*.py` returns nothing). No ceiling is computed for the 9:1 subsample (`code/experiments/run_analyses.py` lines 86-97).

D3 FOUND. Random forest: `RandomForestClassifier(n_estimators=200, random_state=0, n_jobs=-1, class_weight="balanced")`, `StratifiedGroupKFold(5)`, `scoring="accuracy"`, on `PowerTransformer()`-conditioned features fitted on all records (`code/experiments/run_analyses.py` lines 76-83). It runs for raw_flatten, rhythm_morph, hubert_ecg and ecgfounder (lines 29-31); conv-AE and MIT-BIH are not included.

D4 NOT IN code/. Random-forest ceiling values. They are printed to stdout only (`code/experiments/run_analyses.py` line 83; `code/README.md` line 68) and no file in `code/results/` holds them.

D5 FOUND. NMI, V-measure, Fowlkes-Mallows and purity are computed for every clustering run (`code/core/cluster_eval.py` lines 86-95) and written to every per-run CSV (`code/experiments/benchmark.py` lines 146-152, with per-cell mean and 95% half-width in `summary.csv`, lines 154-157; `code/experiments/arm_learned.py` lines 46-47; `code/experiments/mitbih_bench.py` lines 142, 149).

D6 FOUND. The values of NMI, V-measure, Fowlkes-Mallows, purity and largest-cluster fraction are stored in `code/results/` (columns NMI, Vmeasure, FMI, purity, largest_cluster_frac of every per-run CSV and of `summary.csv`). The Table 1 and Table 2 cells are listed in section 13, item 6.

D7 FOUND. Baselines actually computed. PTB-XL: majority purity and random-labelling ARI (mean over ten seeds) (`code/experiments/benchmark.py` lines 126-128); `random_baseline` also returns AMI and purity but only ARI is written (lines 127-128). MIT-BIH: majority purity only (`code/experiments/mitbih_bench.py` line 126). No baseline is computed for NMI, V-measure, FMI or silhouette, so "Every metric is computed against a majority and a random baseline" (main.tex lines 204-205) is not what the code does. Stored values in section 13, item 6.

## 5. Foundation models

E1 FOUND. Checkpoint ids. HuBERT-ECG: Hugging Face `Edoardo-BS/hubert-ecg-base`, files `config.json` and `model.safetensors` (`code/experiments/arm_foundation.py` lines 29, 40-41). ECGFounder: Hugging Face `PKUDigitalHealth/ECGFounder`, file `12_lead_ECGFounder.pth` (`code/experiments/arm_ecgfounder.py` line 40).

E2 NOT IN code/. Checkpoint revisions. `hf_hub_download` is called without `revision` (`code/experiments/arm_foundation.py` lines 40-41; `code/experiments/arm_ecgfounder.py` line 40); Grep for `revision` over `code/**/*.py` returns nothing, so the downloaded commit is not recorded.

E3 FOUND. HuBERT-ECG layer and pooling. The weights are loaded into a stock `transformers.HubertModel` built from the downloaded config with five fields removed, pretraining heads `final_proj` and `label_embedding` dropped, `strict=False` (`code/experiments/arm_foundation.py` lines 35-60). The embedding is `last_hidden_state` (the final transformer layer output) mean-pooled over all time frames, 768-d, no attention mask (lines 77-79).

E4 FOUND. ECGFounder "pooled features". The backbone is `Net1D` reconstructed in `code/core/ecgfounder_net1d.py`, built with `in_channels=12, base_filters=64, ratio=1, filter_list=[64,160,160,400,400,1024,1024], m_blocks_list=[2,2,2,3,3,4,4], kernel_size=16, stride=2, groups_width=16, n_classes=150, use_bn=False, use_do=False, return_features=True` (`code/experiments/arm_ecgfounder.py` lines 44-48). The feature is `deep_features = out.mean(-1)`, the global average over time of the last stage output, 1024-d, taken before the dense classification layer (`code/core/ecgfounder_net1d.py` lines 388-393). The `dense.` weights are removed from the checkpoint before loading (`code/experiments/arm_ecgfounder.py` line 43). With `use_bn=False` no batch-norm layer is applied in the forward pass (`code/core/ecgfounder_net1d.py` lines 379-380 and 182-199), while the batch-norm modules are still instantiated (lines 134, 145, 156, 345), so the "0 missing / 0 unexpected" load check (`code/experiments/arm_ecgfounder.py` lines 19, 49-51) does not show whether the checkpoint's batch-norm statistics are used. Whether the official ECGFounder configuration uses batch norm is not stated in `code/`.

E5 FOUND. Precision. Inputs are float32 numpy arrays converted with `torch.tensor` (`code/experiments/arm_foundation.py` lines 64, 77; `code/experiments/arm_ecgfounder.py` lines 72, 83). No `half()`, float16, bfloat16 or autocast call exists (Grep over `code/**/*.py` returns nothing). Embeddings are stored as float32 (`code/experiments/arm_foundation.py` line 82; `code/experiments/arm_ecgfounder.py` line 86). Both models run under `torch.no_grad()` in eval mode (`code/experiments/arm_foundation.py` lines 59, 73; `code/experiments/arm_ecgfounder.py` lines 52, 79).

E6 FOUND for HuBERT-ECG; AMBIGUOUS for the stored ECGFounder embedding. Batch size. HuBERT-ECG 64 (`code/experiments/arm_foundation.py` line 74). ECGFounder 32 in `code/experiments/arm_ecgfounder.py` line 80, 64 in the 500 Hz check (`code/experiments/native500_check.py` lines 57, 69), and 64 in `code/attic/run_ecgf_compare.py` lines 35-36, which writes the same cache file `_ecgfounder_emb_up100.npy` (line 24, line 41). Which of the two built the cache used for the published numbers is not recorded in `code/`.

E7 AMBIGUOUS. Device. The `experiments/` embedding path for the full cohort contains no `.to(device)` call, so model and inputs stay on CPU (`torch.load(..., map_location="cpu")`, `code/experiments/arm_ecgfounder.py` line 41). `code/attic/run_ecgf_compare.py` lines 20, 31 and 36 move model and inputs to `"mps"` if available, and write the same cache file (A9, E6). The 500 Hz check uses `"mps"` if available, else `"cpu"` (`code/experiments/native500_check.py` lines 24, 58, 70, 83). Grep for `\.to\(` over `code/**/*.py` finds only these two files. The hardware used is not recorded.

## 6. Federation (C-6)

K1 FOUND. Dirichlet concentration 0.3, the same value for all ten clients, drawn separately per class (`code/experiments/fed_cluster.py` lines 54-60). Patients of each class are permuted and split at the cumulative Dirichlet proportions (lines 56-60). Each patient's class is the rounded mean label of its records (line 49).

K2 FOUND. Ten clients, 15 rounds, 3 local Lloyd iterations per round, K = 2 (`code/experiments/fed_cluster.py` lines 22-26).

K3 FOUND. Aggregation weighting. Each client starts from the global centroids, runs 3 local Lloyd iterations, and sends its local centroids; the server averages each centroid weighted by the number of that client's points assigned to it in the last local iteration (`code/experiments/fed_cluster.py` lines 73-86). Global initialisation: K points drawn at random from the full pooled matrix with `default_rng(seed)` (lines 71-72). Final labels: nearest global centroid for every record (lines 87-88). The input is the full matrix conditioned with `PowerTransformer()` fitted on all records before partitioning (line 100). IID split: each patient is assigned to a client drawn uniformly at random (lines 51-53). Clients with fewer than 2 records are dropped (line 65). Centralized reference: `KMeans(2, n_init=10, random_state=seed)` on the same conditioned matrix (lines 91-93, 101).

K4 NOT IN code/. Per-site sizes. They are neither printed nor stored (`code/experiments/fed_cluster.py` lines 96-118 write only ARI_mean and ARI_std per representation and setting; `code/results/results_federated.csv` has exactly those four columns).

K5 FOUND. Representations in the federated study: raw_flatten, rhythm_morph, hubert_ecg, ecgfounder (`code/experiments/fed_cluster.py` lines 34-39); conv-AE is not included, consistent with main.tex Table 3. Retention is non-IID mean divided by centralized mean, printed rounded to 2 decimals, with a centralized mean of exactly 0 replaced by NaN (line 118). The stored raw-flatten centralized mean is 5.9477384390698836e-05 (`code/results/results_federated.csv` row 4), which is not 0, so line 118 does not replace it; the code's retention for raw-flatten is 8.950017898813744e-05 / 5.9477384390698836e-05 = 1.505, printed as 1.5. The manuscript prints "N/A" (main.tex line 402). Arithmetic in section 13, item 3.

## 7. Seed statistics (C-2, K2, K4)

G1 FOUND. Per-cell seed SDs and unrounded means for Table 1 and Table 2: listed in section 13, item 3. `summary.csv` stores per-cell mean and a normal-approximation 95% half-width `1.96 * sd(ddof=1) / sqrt(n)` for raw_flatten and rhythm_morph only (`code/experiments/benchmark.py` lines 112-114, 154-157); for the other representations the per-seed rows are stored and SD needs computing. Agglomerative and HDBSCAN have one run per cell (C9), so no seed SD exists for them.

G2 FOUND. ECGFounder k-means SD (ddof=1) 0.0012095, computed by hand from `code/results/results_compare_strong.csv` rows 258-267 (section 13, item 3); the population SD (ddof=0) is 0.0011474, which equals the stored `ARI_std` 0.0011474009364388336 of the identical centralized run in `code/results/results_federated.csv` row 13.

G3 FOUND. Unrounded ECGFounder minus hand-crafted k-means difference: 0.88542011759861 - 0.6438958292188861 = 0.2415242883797239, which rounds to the printed 0.242 (section 13, item 3).

G4 FOUND. Unrounded retention values for Table 3 (section 13, item 3). `results_federated.csv` holds ARI_mean and ARI_std per representation and setting; ARI_std there is `np.std` with ddof=0 over the ten seeds (`code/experiments/fed_cluster.py` lines 107-110). Retention is computed from unrounded means (line 118).

## 8. Figures 2 and 3 (K13, K15, K16, C-11)

H1 FOUND. Figure 3 is drawn by `fig2_silhouette_trap` (`code/experiments/figures.py` lines 71-82) from `load_ptbxl_power()` (lines 38-47), which keeps power scaling only. One point is one result row: one (representation, clusterer, seed) run under power scaling. Per representation that is 10 k-means, 10 spectral and 10 GMM points (seeds 0 to 9) plus one agglomerative and one HDBSCAN point (C9), 32 rows per representation and 160 rows in total. Rows with NaN silhouette are not drawn; under power scaling these are the HDBSCAN rows of raw-flatten (`code/results/results_raw.csv` row 33), conv-AE (`code/results/results_learned.csv` row 33) and HuBERT-ECG (`code/results/results_compare_strong.csv` row 161), so 160 - 3 = 157 markers are drawn. Many coincide, because many seeds give identical rows (for example all ten hand-crafted k-means rows, `code/results/results_compare_strong.csv` rows 2-11). x is silhouette on non-noise points, y is ARI, marker size `20 + 120 * largest_cluster_frac` (line 75). The figure file `fig2_silhouette_trap.pdf` is compiled as Figure 3 (main.tex line 325), and `fig3_sep_vs_clust.pdf` (lines 85-99) as Figure 2 (main.tex line 305); the latter draws one point per representation at (hard-coded ceiling, best clusterer mean ARI) and the "parity" line from (0.5, 0.5) to (1, 1) (line 93), as K13 states.

H2 FOUND. `code/experiments/figures.py` differs from the public commit in one line: line 97 sets the Figure 2 title with `r"Separability $\neq$ clusterability"` (matplotlib mathtext for the not-equal sign) where the public commit has the not-equal character itself in the string. Every other line, including every font size, figure size, colour and the parity line, is the same in both files (read side by side). Details in section 13, item 10.

## 9. 500 Hz versus 100 Hz consistency check (Limitations, K8)

I1 FOUND. Subset selection: the first 150 SR and the first 150 AF records in the stored order of the cached cohort `_cohort_0_lr.pkl` (`code/experiments/native500_check.py` lines 23, 28-30). That order is the draw order of B3 (SR records after a `random_state=0` shuffle, then AF records after the same shuffle), so the subset is the first 150 of each shuffled class list, not a separate random draw. The same 300 records are re-read at 500 Hz from `filename_hr` (lines 37-41), first 5000 samples, global z-score (lines 50-55), and compared with the upsampled 100 Hz path (lines 62-71). Each ARI is a single `KMeans(2, n_init=10, random_state=0)` run after `PowerTransformer()` fitted on the 300 embeddings (lines 74-77). Results are printed only (lines 87-90); `code/results/` holds no file from this script.

## 10. Other analyses already present or absent

J1 FOUND. Confidence intervals: only the normal-approximation 95% half-width over seeds in `summary.csv` for raw_flatten and rhythm_morph (`code/experiments/benchmark.py` lines 112-114, 156). `code/experiments/mitbih_bench.py` defines the same `_ci95` (lines 101-103) but never calls it (Grep for `_ci95` shows calls only at `code/experiments/benchmark.py` line 156 and `code/attic/run.py` line 99). No bootstrap exists in code or results (Grep for `bootstrap` over `code/` returns nothing).

J2 NOT IN code/. Timing or memory measurements (Grep for `time\.|perf_counter|memory` over `code/**/*.py` returns nothing; no result file has a timing or memory column).

J3 NOT IN code/. Multi-class runs. All drivers are binary (K = 2), and every stored per-run CSV has two classes (MIT-BIH majority 0.5, PTB-XL majority 0.504). Partial scaffolding only: `INCLUDE_VA = False` and a VA class in the unused loader (`code/core/config.py` lines 38-41; `code/core/data.py` lines 47-48), and `load_beats(target_syms, v_syms)` parameters in `code/experiments/mitbih_bench.py` line 31, called with defaults (line 120).

J4 NOT IN code/. Other foundation models. Only HuBERT-ECG and ECGFounder are loaded (Grep for `hf_hub_download` over `code/**/*.py` returns the three call sites in section 5), and the stored CSVs contain no other representation.

J5 NOT IN code/. Site-based federation. No use of PTB-XL site or device metadata (Grep for `site|device` over `code/**/*.py` returns nothing); partitions are random or Dirichlet only (K1, K3); `results_federated.csv` has only the settings federated_iid, federated_noniid and centralized.

J6 FOUND (procedure); values NOT IN code/. K-sensitivity: one k-means run per K from 2 to 8 with `n_init=10, random_state=0`, AMI against the binary labels, for raw_flatten, rhythm_morph, hubert_ecg and ecgfounder; stdout only (`code/experiments/run_analyses.py` lines 63-73). The AMI values quoted at main.tex lines 275-277 are therefore single runs and are not stored.

## 11. Software versions

K1 FOUND. `code/requirements.txt` lines 2-18 give lower bounds only: numpy>=1.24, scipy>=1.10, pandas>=2.0, scikit-learn>=1.3, wfdb>=4.1, neurokit2>=0.2.7, torch>=2.0, transformers>=4.40, huggingface-hub>=0.20, safetensors>=0.4, matplotlib>=3.7.

K2 NOT IN code/. Exact versions used, Python version, and a lock file. No lock file or environment file is present (file list in section 0), and no code records versions at run time (Grep for `__version__` over `code/**/*.py` returns nothing).

K3 NOT IN code/. A repository release or tag for the paper (the public repository has no tags and no releases).

## 12. Comparison against the printed tables

The stored CSVs now allow the comparison; it is in section 13, item 2. Result: every printed cell of Tables 1, 2 and 3 that has a CSV source matches at the printed precision, except the raw-flatten retention of Table 3 (printed N/A; the code gives 1.5 from the stored values). The ECGFounder ceiling 0.983 has no CSV source (only the constant in `code/experiments/figures.py` line 35). The captions of Tables 1 and 2 call the agglomerative and HDBSCAN cells means over ten seeds, but those cells are single runs (C9). The random baseline is computed for ARI only on PTB-XL and not at all on MIT-BIH, although main.tex lines 204-205 say every metric has a majority and a random baseline (D7).

## 13. Values from code/results

Conventions. Row numbers are file line numbers as shown by Read, with the header as line 1 (for `summary.csv` the three header lines are lines 1-3). "Mean by hand" means the mean of the ten ARI values in the cited rows, with the arithmetic written out. All SDs are sample SDs (ddof=1) unless marked ddof=0. sqrt(10) is taken as 3.1623.

### Item 1. The result CSVs

Columns of the per-run files (`results_raw.csv`, `results_learned.csv`, `results_foundation.csv`, `results_compare_strong.csv`, `results_mitbih.csv`): representation, scaler, clusterer, seed, ARI, AMI, NMI, Vmeasure, FMI, purity, silhouette, largest_cluster_frac, n_nonempty_clusters. Each representation has 4 scalers x (10 + 1 + 10 + 10 + 1) = 4 x 32 = 128 rows.

| File | Columns | Data rows (wc -l minus header) | Content | Writer | Status |
|---|---|---|---|---|---|
| `results_raw.csv` | per-run columns | 257 - 1 = 256 | raw_flatten rows 2-129, rhythm_morph rows 130-257 | `code/experiments/benchmark.py` line 152 | FOUND |
| `summary.csv` | representation, scaler, clusterer, then mean and _ci95 for ARI, AMI, NMI, Vmeasure, FMI, purity, silhouette, largest_cluster_frac, n_nonempty_clusters | 43 - 3 = 40 | 2 representations x 4 scalers x 5 clusterers | `code/experiments/benchmark.py` lines 156-157 | FOUND |
| `baselines.csv` | metric, value | 7 - 1 = 6 | majority_purity, random_ARI, supervised_acc and supervised_f1 for raw_flatten and rhythm_morph | `code/experiments/benchmark.py` line 153 | FOUND |
| `results_learned.csv` | per-run columns | 129 - 1 = 128 | deep_ae | `code/experiments/arm_learned.py` line 68 | FOUND |
| `baselines_learned.csv` | metric, value | 3 - 1 = 2 | supervised_acc and supervised_f1 for deep_ae | `code/experiments/arm_learned.py` lines 69-71 | FOUND |
| `results_foundation.csv` | per-run columns | 129 - 1 = 128 | hubert_ecg | `code/experiments/arm_foundation.py` line 103 | FOUND |
| `baselines_foundation.csv` | metric, value | 3 - 1 = 2 | supervised_acc and supervised_f1 for hubert_ecg | `code/experiments/arm_foundation.py` lines 104-106 | FOUND |
| `results_compare_strong.csv` | per-run columns | 385 - 1 = 384 | rhythm_morph rows 2-129, hubert_ecg rows 130-257, ecgfounder rows 258-385 | `code/experiments/compare_strong.py` line 53, or `code/attic/run_ecgf_compare.py` line 62 (same format) | AMBIGUOUS (writer) |
| `results_federated.csv` | representation, setting, ARI_mean, ARI_std | 13 - 1 = 12 | 4 representations x {federated_iid, federated_noniid, centralized} | `code/experiments/fed_cluster.py` line 112 | FOUND |
| `results_mitbih.csv` | per-run columns | 385 - 1 = 384 | raw_beat rows 2-129, beat_morph rows 130-257, deep_ae rows 258-385 | `code/experiments/mitbih_bench.py` line 149 | FOUND |
| `baselines_mitbih.csv` | metric, value | 5 - 1 = 4 | majority_purity, supervised_acc for raw_beat, beat_morph, deep_ae | `code/experiments/mitbih_bench.py` line 150 | FOUND |
| `results_ecgfounder.csv`, `baselines_ecgfounder.csv` | | absent | would hold the ECGFounder single-arm sweep and its ceiling | `code/experiments/arm_ecgfounder.py` lines 103, 106 | NOT IN code/ |

The hand-crafted power rows are identical in `results_raw.csv` rows 130-161 and `results_compare_strong.csv` rows 2-33, and the HuBERT-ECG power rows are identical in `results_foundation.csv` rows 2-33 and `results_compare_strong.csv` rows 130-161 (read side by side).

### Item 2. Printed values against the CSVs

Table 1 (main.tex lines 253-257, power scaling). Sources: raw-flatten from `results_raw.csv` and `summary.csv`, conv-AE from `results_learned.csv`, the other three from `results_compare_strong.csv`, ceilings from the baselines files, as in `code/experiments/figures.py` lines 38-47.

| Cell | Printed | CSV value | Location | Match at printed precision |
|---|---|---|---|---|
| raw k-means | 0.000 | 0.0000594774 | `summary.csv` row 7 ARI mean; per-seed `results_raw.csv` rows 2-11 | FOUND, yes |
| raw agglom. | 0.000 | 0.0000137375 | `results_raw.csv` row 12 (single run) | FOUND, yes |
| raw spectral | 0.000 | 0.0000770904 | `results_raw.csv` rows 13-22 (all ten identical); `summary.csv` row 8 | FOUND, yes |
| raw GMM | 0.013 | 0.0125952397 | `summary.csv` row 5 ARI mean; per-seed rows 23-32 | FOUND, yes |
| raw HDBSCAN | 0.000 | 0.0 | `results_raw.csv` row 33 (single run) | FOUND, yes |
| raw ceiling | 0.519 | 0.5192859242 | `baselines.csv` row 4 | FOUND, yes |
| conv-AE k-means | 0.004 | 0.0036715579 (mean by hand) | `results_learned.csv` rows 2-11 | FOUND, yes |
| conv-AE agglom. | 0.008 | 0.0078543157 | `results_learned.csv` row 12 | FOUND, yes |
| conv-AE spectral | 0.001 | 0.0009995711 (mean by hand) | rows 13-22 | FOUND, yes |
| conv-AE GMM | 0.005 | 0.0050795220 (mean by hand) | rows 23-32 | FOUND, yes |
| conv-AE HDBSCAN | 0.000 | 0.0 | row 33 | FOUND, yes |
| conv-AE ceiling | 0.678 | 0.6778065684 | `baselines_learned.csv` row 2 | FOUND, yes |
| hand-crafted k-means | 0.644 | 0.6438958292 | `results_compare_strong.csv` rows 2-11 (all identical) | FOUND, yes |
| hand-crafted agglom. | 0.711 | 0.7112614444 | row 12 | FOUND, yes |
| hand-crafted spectral | 0.672 | 0.6719889952 | rows 13-22 (all identical) | FOUND, yes |
| hand-crafted GMM | 0.544 | 0.5444727706 | rows 23-32 (all identical) | FOUND, yes |
| hand-crafted HDBSCAN | 0.060 | 0.0599756136 | row 33 | FOUND, yes |
| hand-crafted ceiling | 0.942 | 0.9417848800 | `baselines.csv` row 6 | FOUND, yes |
| HuBERT-ECG k-means | 0.174 | 0.1735647094 | `results_compare_strong.csv` rows 130-139 (all identical) | FOUND, yes |
| HuBERT-ECG agglom. | 0.134 | 0.1341241520 | row 140 | FOUND, yes |
| HuBERT-ECG spectral | 0.016 | 0.0160285330 | rows 141-150 (all identical) | FOUND, yes |
| HuBERT-ECG GMM | 0.195 | 0.1951294078 (mean by hand) | rows 151-160 | FOUND, yes |
| HuBERT-ECG HDBSCAN | 0.000 | 0.0 | row 161 | FOUND, yes |
| HuBERT-ECG ceiling | 0.899 | 0.8985110530 | `baselines_foundation.csv` row 2 | FOUND, yes |
| ECGFounder k-means | 0.885 | 0.8854201176 (mean by hand) | `results_compare_strong.csv` rows 258-267 | FOUND, yes |
| ECGFounder agglom. | 0.709 | 0.7086105598 | row 268 | FOUND, yes |
| ECGFounder spectral | 0.860 | 0.8604168571 | rows 269-278 (all identical) | FOUND, yes |
| ECGFounder GMM | 0.851 | 0.8509864044 (mean by hand) | rows 279-288 | FOUND, yes |
| ECGFounder HDBSCAN | 0.137 | 0.1373006291 | row 289 | FOUND, yes |
| ECGFounder ceiling | 0.983 | none | no ECGFounder baselines file; constant at `code/experiments/figures.py` line 35, `code/README.md` line 68 | NOT IN code/results |
| caption majority | 0.504 | 0.5043273013 | `baselines.csv` row 2 | FOUND, yes |
| caption random ARI | approx. 0 | 0.0001063484 | `baselines.csv` row 3 | FOUND, yes |
| caption "SD <= 0.001 except ECGFounder, 0.001" | 0.001 | k-means SDs: hand-crafted 0, HuBERT-ECG 0, raw 0.000202, ECGFounder 0.00121 (rounds to 0.001); raw GMM SD 0.0133 | item 3 | AMBIGUOUS: holds for k-means and spectral; does not hold for raw GMM if GMM counts as "partitional" |
| caption p = 0.002 | 0.002 | none | stdout only, `code/experiments/run_analyses.py` line 58 | NOT IN code/ |
| caption "ordering holds for K = 2 to 8" | | none | stdout only, `code/experiments/run_analyses.py` lines 63-73 | NOT IN code/ |

Means by hand for Table 1 (values copied from the cited rows):
conv-AE k-means: rows with 0.003671524582270321 are seeds 0, 1, 2, 4, 7, 9 (6 rows) and rows with 0.0036716079335768924 are seeds 3, 5, 6, 8 (4 rows). 6 x 0.003671524582270321 = 0.022029147493621926; 4 x 0.0036716079335768924 = 0.014686431734307570; sum 0.036715579227929496; / 10 = 0.0036715579.
conv-AE spectral: 0.0009819453036428538 at seeds 0, 3, 4, 5, 7, 8, 9 (7 rows) and 0.0010406980143159307 at seeds 1, 2, 6 (3 rows). 7 x 0.0009819453036428538 = 0.0068736171254999766; 3 x 0.0010406980143159307 = 0.0031220940429477921; sum 0.0099957111684477687; / 10 = 0.0009995711.
conv-AE GMM: 0.005195921060501053 at seeds 0, 3, 4, 5, 9 and 0.00496312293029595 at seeds 1, 2, 6, 7, 8. 5 x 0.005195921060501053 = 0.025979605302505265; 5 x 0.00496312293029595 = 0.024815614651479750; sum 0.050795219953985015; / 10 = 0.0050795220.
HuBERT-ECG GMM: 0.19519895191535627 at seeds 0-8 and 0.19450351092647827 at seed 9. 9 x 0.19519895191535627 = 1.75679056723820643; + 0.19450351092647827 = 1.95129407816468470; / 10 = 0.1951294078.
ECGFounder k-means: 0.8854197466578122 at seeds 0, 1, 9; 0.885419740056395 at seed 8; 0.8869016541800605 at seeds 2, 4, 7; 0.8839390778053623 at seeds 3, 5, 6. 3 x 0.8854197466578122 = 2.6562592399734366; + 0.885419740056395 = 3.5416789800298316; 3 x 0.8869016541800605 = 2.6607049625401815; 3 x 0.8839390778053623 = 2.6518172334160869; total 3.5416789800298316 + 2.6607049625401815 + 2.6518172334160869 = 8.8542011759861000; / 10 = 0.88542011759861. This equals the stored centralized ARI_mean 0.8854201175986101 (`results_federated.csv` row 13), which is the same KMeans(2, n_init=10, random_state=seed) on the same power-conditioned matrix.
ECGFounder GMM: 0.8473249921950702 at seeds 0-3 and 5-9 (9 rows) and 0.8839391144449328 at seed 4. 9 x 0.8473249921950702 = 7.6259249297556318; + 0.8839391144449328 = 8.5098640442005646; / 10 = 0.8509864044.
raw GMM check against `summary.csv`: 0.02518808562815196 at seeds 0, 1, 3, 5, 9 (5 x = 0.1259404281); -0.0000010020069556865749 at seeds 2, 6 (2 x = -0.0000020040); 0.000013737471448809456 at seeds 4, 8 (2 x = 0.0000274749); -0.000013501727008970291 at seed 7. Sum 0.1259404281 - 0.0000020040 + 0.0000274749 - 0.0000135017 = 0.1259523973; / 10 = 0.0125952397, equal to `summary.csv` row 5.

Table 2 (main.tex lines 363-365 and caption 356, power scaling, `results_mitbih.csv` and `baselines_mitbih.csv`).

| Cell | Printed | CSV value | Location | Match |
|---|---|---|---|---|
| beat-morphology k-means | 0.750 | 0.7497386310 (mean by hand) | rows 130-139 | FOUND, yes |
| conv-AE k-means | 0.110 | 0.1104228481 (mean by hand) | rows 258-267 | FOUND, yes |
| raw-beat k-means | 0.018 | 0.0177004018 | rows 2-11 (all identical) | FOUND, yes |
| beat-morphology agglomerative | 0.783 | 0.7825626519 | row 140 (single run) | FOUND, yes |
| conv-AE agglomerative | 0.071 | 0.0712777572 | row 268 (single run) | FOUND, yes |
| raw-beat agglomerative | 0.049 | 0.0490036967 | row 12 (single run) | FOUND, yes |
| beat-morphology GMM | 0.679 | 0.6787619420 (mean by hand) | rows 151-160 | FOUND, yes |
| conv-AE GMM | 0.127 | 0.1267073057 (mean by hand) | rows 279-288 | FOUND, yes |
| raw-beat GMM | 0.018 | 0.0180583837 | rows 23-32 (all identical) | FOUND, yes |
| ceiling beat-morphology | 0.925 | 0.9254169349 | `baselines_mitbih.csv` row 4 | FOUND, yes |
| ceiling conv-AE | 0.927 | 0.9274482419 | `baselines_mitbih.csv` row 5 | FOUND, yes |
| ceiling raw-beat | 0.741 | 0.7411394289 | `baselines_mitbih.csv` row 3 | FOUND, yes |

Means by hand for Table 2:
beat-morphology k-means: 0.7967860186728167 at seeds 0, 4, 5 (3 x = 2.3903580560184501); 0.7955958436525905 at seed 2; 0.7979770829337287 at seeds 6, 7 (2 x = 1.5959541658674574); 0.6788695612083885 at seeds 1, 3, 8, 9 (4 x = 2.7154782448335540). Sum 2.3903580560184501 + 0.7955958436525905 + 1.5959541658674574 + 2.7154782448335540 = 7.4973863103720520; / 10 = 0.7497386310.
beat-morphology GMM: 0.6788717086290499 at seeds 0-5 and 7 (7 x = 4.7521019604033493); 0.679971153894509 at seed 6; 0.6777731527941739 at seeds 8, 9 (2 x = 1.3555463055883478). Sum 4.7521019604033493 + 0.679971153894509 + 1.3555463055883478 = 6.7876194198862061; / 10 = 0.6787619420.
conv-AE k-means: 0.1194967827212852 at seeds 0, 2, 3, 5, 8, 9 (6 x = 0.7169806963277112); 0.11720164677619481 at seeds 1, 4 (2 x = 0.2344032935523896); 0.07623750531802244 at seed 6; 0.07660698591407814 at seed 7. Sum 0.7169806963277112 + 0.2344032935523896 + 0.07623750531802244 + 0.07660698591407814 = 1.1042284811122014; / 10 = 0.1104228481.
conv-AE GMM: 0.03889035457411671 at seeds 0, 1, 5, 6, 8, 9 (6 x = 0.2333421274447003); 0.11001122887990576 at seeds 2, 4 (2 x = 0.2200224577598115); 0.4068541828780931 at seed 3; 0.40685428909859495 at seed 7. Sum 0.2333421274447003 + 0.2200224577598115 + 0.4068541828780931 + 0.40685428909859495 = 1.2670730571811998; / 10 = 0.1267073057.

Table 3 (main.tex lines 399-402, `results_federated.csv`). Retention arithmetic in item 3.

| Cell | Printed | CSV value | Location | Match |
|---|---|---|---|---|
| ECGFounder centralized | 0.885 | 0.8854201176 | row 13 | FOUND, yes |
| ECGFounder federated IID | 0.885 | 0.8846802753 | row 11 | FOUND, yes |
| ECGFounder federated non-IID | 0.612 | 0.6123351013 | row 12 | FOUND, yes |
| ECGFounder retention | 0.69 | 0.6916 | rows 12 / 13 | FOUND, yes |
| hand-crafted centralized | 0.644 | 0.6438958292 | row 7 | FOUND, yes |
| hand-crafted federated IID | 0.643 | 0.6432645928 | row 5 | FOUND, yes |
| hand-crafted federated non-IID | 0.591 | 0.5910520739 | row 6 | FOUND, yes |
| hand-crafted retention | 0.92 | 0.9179 | rows 6 / 7 | FOUND, yes |
| HuBERT-ECG centralized | 0.174 | 0.1735647094 | row 10 | FOUND, yes |
| HuBERT-ECG federated IID | 0.172 | 0.1718023621 | row 8 | FOUND, yes |
| HuBERT-ECG federated non-IID | 0.106 | 0.1061222031 | row 9 | FOUND, yes |
| HuBERT-ECG retention | 0.61 | 0.6114 | rows 9 / 10 | FOUND, yes |
| raw-flatten centralized | 0.000 | 0.0000594774 | row 4 | FOUND, yes |
| raw-flatten federated IID | 0.000 | 0.0001910006 | row 2 | FOUND, yes |
| raw-flatten federated non-IID | 0.000 | 0.0000895002 | row 3 | FOUND, yes |
| raw-flatten retention | N/A | 1.505 by the formula of `code/experiments/fed_cluster.py` line 118 | rows 3 / 4 | FOUND, MISMATCH |

The caption "mean ARI over ten seeds and ten simulated sites" matches `code/experiments/fed_cluster.py` lines 22 and 25.

In-text values, main.tex lines 269-277.

| Text | Printed | CSV value | Location | Status |
|---|---|---|---|---|
| SD <= 0.001, hand-crafted (k-means) | <= 0.001 | 0 (all ten identical) | `results_compare_strong.csv` rows 2-11 | FOUND, yes |
| SD <= 0.001, HuBERT-ECG (k-means) | <= 0.001 | 0 (all ten identical) | rows 130-139 | FOUND, yes |
| SD <= 0.001, raw (k-means) | <= 0.001 | 0.000202 | item 3 | FOUND, yes |
| Delta ECGFounder over hand-crafted | 0.242 | 0.2415242884 | item 3 | FOUND, yes |
| Delta hand-crafted over HuBERT-ECG | 0.470 | 0.6438958292188861 - 0.173564709448911 = 0.4703311197699751 | rows 2-11, 130-139 | FOUND, yes |
| Delta HuBERT-ECG over raw | 0.174 | 0.173564709448911 - 0.0000594773843907 = 0.1735052320645203 | rows 130-139; `summary.csv` row 7 | FOUND, yes |
| p = 0.002 | 0.002 | none | stdout only | NOT IN code/ |
| ECGFounder AMI over K | 0.83 to 0.45 | none | stdout only | NOT IN code/ |
| hand-crafted AMI over K | 0.56 to 0.33 | none | stdout only | NOT IN code/ |
| HuBERT-ECG AMI over K | below 0.14 | none | stdout only | NOT IN code/ |
| raw AMI over K | near 0 | none | stdout only | NOT IN code/ |

Lines 269-270 do not mention conv-AE or ECGFounder; their k-means seed values are in item 3.

In-text values, main.tex lines 299-301.

| Text | Printed | CSV value | Location | Status |
|---|---|---|---|---|
| raw random-forest accuracy | 0.71 | none | stdout only, `code/experiments/run_analyses.py` line 83 | NOT IN code/ |
| raw linear ceiling | 0.52 | 0.5192859242 | `baselines.csv` row 4 | FOUND, yes |
| raw clustering ARI | 0 | k-means 0.0000595, agglomerative 0.0000137, spectral 0.0000771, HDBSCAN 0.0, GMM 0.0126 | Table 1 rows above | AMBIGUOUS: the text does not say which clusterer; true for four of five, GMM is 0.013 |

In-text values, main.tex lines 334-338. Each printed value is the row-weighted mean of C11: (10 x k-means mean + 10 x spectral mean + 10 x GMM mean + agglomerative + HDBSCAN) / 32. Hand-crafted means are from `summary.csv` rows 24-43 (benchmark rows, as `code/experiments/figures.py` line 139 uses); ECGFounder means are from `results_compare_strong.csv` rows 258-385.

| Text | Printed | Arithmetic | Status |
|---|---|---|---|
| hand-crafted, standard | 0.63 | 10 x (0.6810515654 + 0.7099350524 + 0.5386821514) = 10 x 1.9296687692 = 19.296687692; + 0.7286265123 + 0.0951437925 = 20.1204579968; / 32 = 0.6288 (`summary.csv` rows 42, 43, 40, 39, 41) | FOUND, yes |
| hand-crafted, power | 0.61 | 10 x (0.6438958292 + 0.6719889952 + 0.5444727706) = 10 x 1.8603575950 = 18.603575950; + 0.7112614444 + 0.0599756136 = 19.374813008; / 32 = 0.6055 (rows 27, 28, 25, 24, 26) | FOUND, yes |
| hand-crafted, robust | 0.36 | 10 x (0.0108763829 + 0.6015367851 + 0.5386821514) = 10 x 1.1510953194 = 11.510953194; + 0.0125709513 + 0.0 = 11.5235241453; / 32 = 0.3601 (rows 37, 38, 35, 34, 36) | FOUND, yes |
| hand-crafted, quantile | 0.23 | 10 x (0.3461167980 + 0.0871351186 + 0.2492439403) = 10 x 0.6824958569 = 6.824958569; + 0.3489009606 + 0.1607251873 = 7.3345847169; / 32 = 0.2292 (rows 32, 33, 30, 29, 31) | FOUND, yes |
| ECGFounder, standard | 0.87 | k-means mean: 0.9062791702 (seed 0) + 6 x 0.9032843840 (seeds 1, 3, 4, 6, 8, 9) = 5.4197063040 + 0.9047811556 (seed 2) + 2 x 0.9047811601 (seeds 5, 7) = 1.8095623202; sum 9.0403289500; / 10 = 0.9040328950 (rows 290-299). Spectral 0.8869016745 (rows 301-310, identical). GMM: 8 x 0.8928416956 = 7.1427335648 + 2 x 0.9047811601 = 1.8095623202; sum 8.9522958850; / 10 = 0.8952295885 (rows 311-320). Row-weighted: 10 x (0.9040328950 + 0.8869016745 + 0.8952295885) = 10 x 2.6861641580 = 26.861641580; + 0.7099361581 (row 300) + 0.1463551937 (row 321) = 27.7179329318; / 32 = 0.8662 | FOUND, yes |
| ECGFounder, robust | 0.09 | k-means -0.0001229098 (rows 354-363, identical); spectral -0.0001501656 (rows 365-374, identical); GMM: 9 x 0.3022248398 = 2.7200235582 + 0.2629134137 (seed 9) = 2.9829369719; / 10 = 0.2982936972 (rows 375-384). Row-weighted: 10 x (-0.0001229098 - 0.0001501656 + 0.2982936972) = 10 x 0.2980206218 = 2.980206218; + (-0.0000476071) (row 364) + 0.0 (row 385) = 2.9801586109; / 32 = 0.0931 | FOUND, yes |

The definition is row-weighted, which the manuscript does not state (K5). For reference, ECGFounder power gives 10 x (0.8854201176 + 0.8604168571 + 0.8509864044) = 10 x 2.5968233791 = 25.968233791; + 0.7086105598 + 0.1373006291 = 26.8141449799; / 32 = 0.8379.

In-text values, main.tex lines 345-350 (`results_mitbih.csv`, `baselines_mitbih.csv`).

| Text | Printed | CSV value | Status |
|---|---|---|---|
| hand-crafted features "ARI 0.78" | 0.78 | agglomerative 0.7825626519 (row 140); k-means 0.7497 and GMM 0.6788 | FOUND, yes (agglomerative) |
| raw beat "ARI approx. 0.05" | 0.05 | agglomerative 0.0490036967 (row 12); k-means 0.0177, GMM 0.0181 | FOUND, yes (agglomerative) |
| conv-AE ceiling | 0.93 | 0.9274482419 (`baselines_mitbih.csv` row 5) | FOUND, yes |
| conv-AE "ARI of only 0.11" | 0.11 | k-means 0.1104228481 (rows 258-267); GMM 0.1267, agglomerative 0.0713 | FOUND, yes (k-means) |

In-text values, main.tex lines 372-386.

| Text | Printed | CSV value | Status |
|---|---|---|---|
| 9:1 majority | 0.90 | none (printed at `code/experiments/run_analyses.py` line 93) | NOT IN code/ |
| minority share | 10% | none | NOT IN code/ |
| hand-crafted 9:1 ARI | 0.232 | none (line 97, stdout) | NOT IN code/ |
| hand-crafted 9:1 AMI | 0.214 | none | NOT IN code/ |
| ECGFounder 9:1 ARI | 0.060 | none | NOT IN code/ |
| ECGFounder 9:1 AMI | 0.143 | none | NOT IN code/ |
| IID retains centralized ARI | | IID vs centralized: 0.8847 vs 0.8854, 0.6433 vs 0.6439, 0.1718 vs 0.1736, 0.00019 vs 0.00006 (`results_federated.csv` rows 11/13, 5/7, 8/10, 2/4) | FOUND, yes |
| hand-crafted retention | 92% | 0.9179 | FOUND, yes |
| hand-crafted centralized to non-IID | 0.644 to 0.591 | 0.6438958292 to 0.5910520739 (rows 7, 6) | FOUND, yes |
| ECGFounder centralized to non-IID | 0.885 to 0.612 | 0.8854201176 to 0.6123351013 (rows 13, 12) | FOUND, yes |
| non-IID ECGFounder and hand-crafted (line 386) | 0.612, 0.591 | 0.6123351013, 0.5910520739 | FOUND, yes |

In-text values, main.tex lines 448-450.

| Text | Printed | Source | Status |
|---|---|---|---|
| 300-record subset | 300 | `code/experiments/native500_check.py` line 23 (`N_PER_CLASS = 150`) and line 30 (150 per class); a code constant, no CSV | FOUND (code) |
| native 500 Hz ARI | 0.896 | no CSV; stated in `code/README.md` line 74 | NOT IN code/results |
| upsampled 100 Hz ARI | 0.909 | no CSV; stated in `code/README.md` line 74 | NOT IN code/results |
| difference | 0.013 | no CSV; stated in `code/experiments/arm_ecgfounder.py` line 10 | NOT IN code/results |

Mismatches between the manuscript and `code/results`:
1. Table 3 raw-flatten retention (main.tex line 402): printed N/A; the stored centralized mean is 5.9477384390698836e-05, not 0, so `code/experiments/fed_cluster.py` line 118 gives 8.950017898813744e-05 / 5.9477384390698836e-05 = 1.505, printed 1.5.
2. Captions of Table 1 (line 242) and Table 2 (line 355) say "mean ARI over ten seeds"; the agglomerative and HDBSCAN cells of Table 1 and the agglomerative row of Table 2 are single rows at seed 0 (C9).
3. AMBIGUOUS: Table 1 caption "Partitional solutions are seed-stable (SD <= 0.001 except ECGFounder, 0.001)": raw GMM has SD 0.0133 (item 3); if GMM is not counted as partitional, the statement holds.
4. AMBIGUOUS: line 300 "clustering ARI of 0" for raw: true for four clusterers, raw GMM is 0.0126.
No printed cell of Tables 1, 2 or 3 with a CSV source differs from its CSV value at the printed precision.

### Item 3. C-2: seed SDs, unrounded means, Delta, retention

Seed SD per ten-seed cell (Table 1 and Table 2, power scaling). Agglomerative and HDBSCAN cells are single runs and have no seed SD.

| Cell | Unrounded mean | Seed SD (ddof=1) | Source and status |
|---|---|---|---|
| T1 raw k-means | 0.0000594774 | 0.000201793 | `summary.csv` row 7; SD by hand below, and from `_ci95` 0.00012507245170876653 x 3.1623 / 1.96 = 0.0003955168 / 1.96 = 0.000201794. FOUND |
| T1 raw spectral | 0.0000770904 | 0 | all ten identical, `results_raw.csv` rows 13-22; `summary.csv` row 8 `_ci95` 0.0. FOUND |
| T1 raw GMM | 0.0125952397 | 0.0132741 | `summary.csv` row 5, SD = 0.008227327366866948 x 3.1623 / 1.96 = 0.0260172774 / 1.96 = 0.0132741211 (`_ci95` is 1.96 x SD / sqrt(10), `code/experiments/benchmark.py` line 114). FOUND |
| T1 conv-AE k-means | 0.0036715579 | not computed (needs code execution); values span 0.0036715246 to 0.0036716079 | `results_learned.csv` rows 2-11 |
| T1 conv-AE spectral | 0.0009995711 | not computed (needs code execution); values span 0.0009819453 to 0.0010406980 | rows 13-22 |
| T1 conv-AE GMM | 0.0050795220 | not computed (needs code execution); values span 0.0049631229 to 0.0051959211 | rows 23-32 |
| T1 hand-crafted k-means | 0.6438958292188861 | 0 | all ten identical, `results_compare_strong.csv` rows 2-11 (also `results_raw.csv` rows 130-139). FOUND |
| T1 hand-crafted spectral | 0.6719889951935148 | 0 | all ten identical, rows 13-22. FOUND |
| T1 hand-crafted GMM | 0.54447277060553 | 0 | all ten identical, rows 23-32 (`summary.csv` row 25 `_ci95` 7.25e-17, floating-point zero). FOUND |
| T1 HuBERT-ECG k-means | 0.173564709448911 | 0 | all ten identical, rows 130-139. FOUND |
| T1 HuBERT-ECG spectral | 0.0160285330101013 | 0 | all ten identical, rows 141-150. FOUND |
| T1 HuBERT-ECG GMM | 0.1951294078 | not computed (needs code execution); nine values 0.1951989519, one 0.1945035109 | rows 151-160 |
| T1 ECGFounder k-means | 0.88542011759861 | 0.0012095 (ddof=0: 0.0011474) | rows 258-267; by hand below. FOUND |
| T1 ECGFounder spectral | 0.8604168570813628 | 0 | all ten identical, rows 269-278. FOUND |
| T1 ECGFounder GMM | 0.8509864044 | not computed (needs code execution); nine values 0.8473249922, one 0.8839391144 | rows 279-288 |
| T2 beat-morphology k-means | 0.7497386310 | not computed (needs code execution); values span 0.6788695612 to 0.7979770829 | `results_mitbih.csv` rows 130-139 |
| T2 beat-morphology GMM | 0.6787619420 | not computed (needs code execution); values span 0.6777731528 to 0.6799711539 | rows 151-160 |
| T2 conv-AE k-means | 0.1104228481 | not computed (needs code execution); values span 0.0762375053 to 0.1194967827 | rows 258-267 |
| T2 conv-AE GMM | 0.1267073057 | not computed (needs code execution); values span 0.0388903546 to 0.4068542891 | rows 279-288 |
| T2 raw-beat k-means | 0.01770040179410418 | 0 | all ten identical, rows 2-11. FOUND |
| T2 raw-beat GMM | 0.018058383674254778 | 0 | all ten identical, rows 23-32. FOUND |

SD by hand, raw k-means (`results_raw.csv` rows 2-11), working in units of 1e-4:
Values: s0 -1.7247197918; s1 0.1373747145; s2 -1.6845197783; s3 2.6242849557; s4 3.9022715503; s5 2.1133216542; s6 -1.8083459488; s7 0.1373747145; s8 0.1373747145; s9 2.1133216542.
Sum: positives 3 x 0.1373747145 = 0.4121241435; 2.6242849557 + 3.9022715503 = 6.5265565060; 2 x 2.1133216542 = 4.2266433084; total positives 11.1653239579. Negatives 1.7247197918 + 1.6845197783 + 1.8083459488 = 5.2175855189. Sum 11.1653239579 - 5.2175855189 = 5.9477384390. Mean 0.5947738439 (that is 0.0000594774, equal to `summary.csv` row 7).
Deviations and squares: s0 -2.3194936357, square 5.38005056; s1, s7, s8 -0.4573991294, square 0.20921394, x 3 = 0.62764182; s2 -2.2792936222, square 5.19517932; s3 2.0295111118, square 4.11891531; s4 3.3074977064, square 10.93954104; s5, s9 1.5185478103, square 2.30598742, x 2 = 4.61197484; s6 -2.4031197927, square 5.77498477.
Sum of squares 5.38005056 + 0.62764182 + 5.19517932 + 4.11891531 + 10.93954104 + 4.61197484 + 5.77498477 = 36.64828766 (units 1e-8).
Variance 36.64828766 / 9 = 4.07203196; SD = sqrt(4.07203196) = 2.0179 (2.0179^2 = 4.07192, 2.018^2 = 4.07232), so SD = 2.0179e-4 = 0.000201793. Check with ddof=0: sqrt(36.64828766 / 10) = sqrt(3.66482877) = 1.9144, so 0.00019144, equal to the stored centralized `ARI_std` 0.00019143742608484672 (`results_federated.csv` row 4).

SD by hand, ECGFounder k-means (`results_compare_strong.csv` rows 258-267), mean 0.88542011759861:
Deviations: seeds 2, 4, 7: 0.8869016541800605 - 0.88542011759861 = +0.0014815365814505; seeds 3, 5, 6: 0.8839390778053623 - 0.88542011759861 = -0.0014810397932477; seeds 0, 1, 9: 0.8854197466578122 - 0.88542011759861 = -0.0000003709407978; seed 8: 0.885419740056395 - 0.88542011759861 = -0.0000003775422150.
Squares (units 1e-6): 1.4815365815^2 = 2.1904 + 2 x 1.48 x 0.0015365815 + 0.0015365815^2 = 2.1904 + 0.0045482812 + 0.0000023611 = 2.1949506423, x 3 = 6.5848519269; 1.4810397932^2 = 2.1904 + 2 x 1.48 x 0.0010397932 + 0.0010397932^2 = 2.1904 + 0.0030777879 + 0.0000010812 = 2.1934788691, x 3 = 6.5804366073; the four small deviations give 3 x 1.37597e-7 + 1.42538e-7 = 5.55e-7 (in units of 1e-6), that is 0.000000555.
Sum of squares 6.5848519269 + 6.5804366073 + 0.000000555 = 13.1652890892 (units 1e-6).
Variance (ddof=1) 13.1652890892 / 9 = 1.4628098988; SD = sqrt(1.4628098988) = 1.2094668 (1.2095^2 = 1.46289025; correction (1.4628099 - 1.4628903) / (2 x 1.2095) = -0.0000332), so SD = 0.0012094668.
ddof=0: sqrt(13.1652890892 / 10) = sqrt(1.3165289) = 1.1474009, so 0.0011474009, equal to the stored centralized `ARI_std` 0.0011474009364388336 (`results_federated.csv` row 13).

Hand-crafted and HuBERT-ECG k-means (`results_compare_strong.csv` rows 2-11 and 130-139): all ten ARI values are the same number (0.6438958292188861 and 0.173564709448911), every deviation is 0, SD = 0. The stored centralized `ARI_std` is 0.0 for both (`results_federated.csv` rows 7 and 10).

Unrounded ECGFounder minus hand-crafted k-means difference: 0.88542011759861 - 0.6438958292188861 = 0.2415242883797239. Rounded to three decimals this is 0.242, the printed value (0.2415 rounds up). The 0.241 of K2 comes from subtracting the rounded cells 0.885 - 0.644.

Unrounded retention (non-IID ARI_mean / centralized ARI_mean, `results_federated.csv`):
ECGFounder: 0.6123351013238919 / 0.8854201175986101. 0.8854201176 x 0.6915 = 0.6122680; remainder 0.6123351013 - 0.6122680 = 0.0000671; 0.0000671 / 0.8854201 = 0.0000758; retention 0.6915758, printed 0.69.
hand-crafted: 0.5910520739215342 / 0.6438958292188861. 0.6438958292 x 0.918 = 0.5910964; remainder 0.5910520739 - 0.5910964 = -0.0000443; -0.0000443 / 0.6438958 = -0.0000688; retention 0.9179312, printed 0.92.
HuBERT-ECG: 0.10612220306959852 / 0.173564709448911. 0.1735647094 x 0.61 = 0.1058745; remainder 0.1061222031 - 0.1058745 = 0.0002477; 0.0002477 / 0.1735647 = 0.0014273; retention 0.6114273, printed 0.61.
raw-flatten: 8.950017898813744e-05 / 5.9477384390698836e-05 = 8.9500179 / 5.9477384. 5.9477384 x 1.5 = 8.9216076; remainder 8.9500179 - 8.9216076 = 0.0284103; 0.0284103 / 5.9477384 = 0.0047767; retention 1.5047767, which `code/experiments/fed_cluster.py` line 118 would print as 1.5. The manuscript prints N/A.

ECGFounder k-means SD: 0.0012095 (ddof=1), 0.0011474 (ddof=0), as above.

### Item 4. Seed-level 95% confidence intervals (t with 9 df, mean +/- 2.262 x SD / 3.1623)

Computed only where `summary.csv` gives the mean and the SD can be read off its `_ci95` (raw_flatten and rhythm_morph cells), for the four k-means cells where SD was computed by hand above, and where all ten values are identical (SD 0, the interval is the single value). Every other ten-seed cell: not computed (needs code execution).

| Cell | Mean | SD | Half-width 2.262 x SD / 3.1623 | 95% CI | Status |
|---|---|---|---|---|---|
| T1 raw k-means | 0.0000594774 | 0.000201793 | 2.262 x 0.000201793 = 0.0004564558; / 3.1623 = 0.0001443433 | [-0.0000848659, 0.0002038207] | FOUND |
| T1 raw spectral | 0.0000770904 | 0 | 0 | [0.0000770904, 0.0000770904] | FOUND |
| T1 raw GMM | 0.0125952397 | 0.0132741211 | 2.262 x 0.0132741211 = 0.0300260620; / 3.1623 = 0.0094950073 | [0.0031002324, 0.0220902470] | FOUND |
| T1 hand-crafted k-means | 0.6438958292 | 0 | 0 | [0.6438958292, 0.6438958292] | FOUND |
| T1 hand-crafted spectral | 0.6719889952 | 0 | 0 | [0.6719889952, 0.6719889952] | FOUND |
| T1 hand-crafted GMM | 0.5444727706 | 0 | 0 | [0.5444727706, 0.5444727706] | FOUND |
| T1 HuBERT-ECG k-means | 0.1735647094 | 0 | 0 | [0.1735647094, 0.1735647094] | FOUND |
| T1 HuBERT-ECG spectral | 0.0160285330 | 0 | 0 | [0.0160285330, 0.0160285330] | FOUND |
| T1 ECGFounder k-means | 0.8854201176 | 0.0012094668 | 2.262 x 0.0012094668 = 0.0027358139; / 3.1623 = 0.0008651342 | [0.8845549834, 0.8862852518] | FOUND |
| T1 ECGFounder spectral | 0.8604168571 | 0 | 0 | [0.8604168571, 0.8604168571] | FOUND |
| T2 raw-beat k-means | 0.0177004018 | 0 | 0 | [0.0177004018, 0.0177004018] | FOUND |
| T2 raw-beat GMM | 0.0180583837 | 0 | 0 | [0.0180583837, 0.0180583837] | FOUND |
| T1 conv-AE k-means, spectral, GMM | | | | not computed (needs code execution) | |
| T1 HuBERT-ECG GMM | | | | not computed (needs code execution) | |
| T1 ECGFounder GMM | | | | not computed (needs code execution) | |
| T2 beat-morphology k-means, GMM | | | | not computed (needs code execution) | |
| T2 conv-AE k-means, GMM | | | | not computed (needs code execution) | |

Arithmetic detail: 2.262 x 0.000201793 = 0.000403586 + 0.262 x 0.000201793 (0.0000528698) = 0.0004564558; 0.0004564558 / 3.1623: 3.1623 x 0.0001443 = 0.0004563199, remainder 0.0000001359 / 3.1623 = 0.0000000430, giving 0.0001443430 (about 0.0001443433 with more digits); CI 0.0000594774 -/+ 0.0001443433. 2.262 x 0.0132741211 = 0.0265482422 + 0.0034778197 = 0.0300260619; / 3.1623: 3.1623 x 0.009495 = 0.0300260385, remainder 0.0000000234 / 3.1623 = 0.0000000074, giving 0.0094950074. 2.262 x 0.0012094668 = 0.0024189336 + 0.0003168803 = 0.0027358139; / 3.1623: 3.1623 x 0.000865 = 0.0027353895, remainder 0.0000004244 / 3.1623 = 0.0000001342, giving 0.0008651342. Equivalently the t half-width equals the stored `_ci95` x 2.262 / 1.96 = `_ci95` x 1.1540816; for raw GMM 0.0082273274 x 1.1540816 = 0.0082273274 + 0.0012676799 = 0.0094950073.

Agglomerative and HDBSCAN cells are single runs: no seed interval exists.

### Item 5. Per-seed paired differences for the Wilcoxon contrasts (k-means, power scaling)

Per-seed rows exist. Values from `results_compare_strong.csv` (ECGFounder rows 258-267, hand-crafted rows 2-11, HuBERT-ECG rows 130-139) and `results_raw.csv` (raw rows 2-11), paired by seed as `code/experiments/run_analyses.py` line 42 does.

ECGFounder minus hand-crafted (hand-crafted is 0.6438958292188861 at every seed):

| Seed | ECGFounder | Difference |
|---|---|---|
| 0 | 0.8854197466578122 | +0.2415239174 |
| 1 | 0.8854197466578122 | +0.2415239174 |
| 2 | 0.8869016541800605 | +0.2430058250 |
| 3 | 0.8839390778053623 | +0.2400432486 |
| 4 | 0.8869016541800605 | +0.2430058250 |
| 5 | 0.8839390778053623 | +0.2400432486 |
| 6 | 0.8839390778053623 | +0.2400432486 |
| 7 | 0.8869016541800605 | +0.2430058250 |
| 8 | 0.885419740056395 | +0.2415239108 |
| 9 | 0.8854197466578122 | +0.2415239174 |

All ten differences are positive. The distributions do not overlap: the smallest ECGFounder value 0.8839390778 exceeds the only hand-crafted value 0.6438958292.

Hand-crafted minus HuBERT-ECG (both constant across seeds): 0.6438958292188861 - 0.173564709448911 = +0.4703311198 at every one of the ten seeds. All ten differences are positive and equal (ten tied absolute values). The distributions do not overlap (0.6438958292 against 0.1735647094).

HuBERT-ECG minus raw (HuBERT-ECG is 0.173564709448911 at every seed):

| Seed | raw | Difference |
|---|---|---|
| 0 | -0.00017247197917672348 | +0.1737371814 |
| 1 | 0.000013737471448809456 | +0.1735509720 |
| 2 | -0.00016845197783126468 | +0.1737331614 |
| 3 | 0.0002624284955725512 | +0.1733022810 |
| 4 | 0.0003902271550272083 | +0.1731744823 |
| 5 | 0.0002113321654226331 | +0.1733533773 |
| 6 | -0.00018083459487647745 | +0.1737455440 |
| 7 | 0.000013737471448809456 | +0.1735509720 |
| 8 | 0.000013737471448809456 | +0.1735509720 |
| 9 | 0.0002113321654226331 | +0.1733533773 |

All ten differences are positive. The distributions do not overlap: the largest raw value 0.0003902272 is below the only HuBERT-ECG value 0.1735647094.

For all three contrasts every paired difference has the same sign, so the matched-pairs rank-biserial correlation is 1, and the two seed distributions are disjoint, so Cliff's delta is 1. The p-values themselves are not stored (stdout only, `code/experiments/run_analyses.py` line 58).

### Item 6. C-12 and K7: ceilings, other metrics, baselines

Random-forest ceilings: NOT IN code/ for all four representations (raw_flatten, rhythm_morph, hubert_ecg, ecgfounder); printed to stdout only (`code/experiments/run_analyses.py` line 83). No random-forest ceiling exists in the code for conv-AE or MIT-BIH (D3).

Linear (logistic-regression accuracy) ceilings stored: raw_flatten 0.5192859242300016 (`baselines.csv` row 4), rhythm_morph 0.9417848800334143 (row 6), deep_ae 0.6778065683832744 (`baselines_learned.csv` row 2), hubert_ecg 0.8985110530142475 (`baselines_foundation.csv` row 2), MIT-BIH raw_beat 0.7411394289121336, beat_morph 0.9254169348639797, deep_ae 0.9274482418994546 (`baselines_mitbih.csv` rows 3-5): FOUND. ECGFounder: NOT IN code/results (0.983 only as the constant in `code/experiments/figures.py` line 35). Macro F1 stored for PTB-XL: raw_flatten 0.518369603577764, rhythm_morph 0.9417776536895077, deep_ae 0.6775043908026419, hubert_ecg 0.8984650146205851 (`baselines.csv` rows 5, 7; `baselines_learned.csv` row 3; `baselines_foundation.csv` row 3): FOUND.

NMI, V-measure, Fowlkes-Mallows, purity and largest-cluster fraction: FOUND for every run. Table 1 and Table 2 cells, power scaling; for raw and hand-crafted the value is the `summary.csv` mean; for single runs and identical-seed cells it is the row value; where seeds differ the range over the ten rows is given (mean not computed).

| Cell | NMI | V-measure | FMI | purity | largest-cluster fraction | Source |
|---|---|---|---|---|---|---|
| T1 raw k-means | 0.0013979 | 0.0013979 | 0.6847371 | 0.5064910 | 0.9670732 | `summary.csv` row 7 |
| T1 raw agglom. | 0.0007929 | 0.0007929 | 0.7067208 | 0.5047207 | 0.9996066 | `summary.csv` row 4 |
| T1 raw spectral | 0.0011237 | 0.0011237 | 0.7034138 | 0.5062943 | 0.9948859 | `summary.csv` row 8 |
| T1 raw GMM | 0.0121909 | 0.0121909 | 0.6328815 | 0.5421715 | 0.8616444 | `summary.csv` row 5 |
| T1 raw HDBSCAN | 0.0 | 0.0 | 0.7069941 | 0.0 | empty (NaN) | `summary.csv` row 6 |
| T1 conv-AE k-means | 0.0028930 to 0.0028932 | same | 0.5033562 to 0.5034214 | 0.5318647 | 0.5413061 to 0.5420928 | `results_learned.csv` rows 2-11 |
| T1 conv-AE agglom. | 0.0071619 | 0.0071619 | 0.5474782 | 0.5452400 | 0.7143981 | row 12 |
| T1 conv-AE spectral | 0.0010953 to 0.0011400 | same | 0.5062491 to 0.5062802 | 0.5184894 to 0.5188828 | 0.5771046 to 0.5774980 | rows 13-22 |
| T1 conv-AE GMM | 0.0038340 to 0.0040025 | same | 0.5028773 to 0.5029567 | 0.5365854 to 0.5373721 | 0.5232101 to 0.5239969 | rows 23-32 |
| T1 conv-AE HDBSCAN | 0.0 | 0.0 | 0.7069941 | 0.0 | empty (NaN) | row 33 |
| T1 hand-crafted k-means | 0.5569982 | 0.5569982 | 0.8229117 | 0.9012589 | 0.5535012 | `summary.csv` row 27 |
| T1 hand-crafted agglom. | 0.6123918 | 0.6123918 | 0.8557990 | 0.9217152 | 0.5275374 | `summary.csv` row 24 |
| T1 hand-crafted spectral | 0.6048547 | 0.6048547 | 0.8374591 | 0.9099135 | 0.5676633 | `summary.csv` row 28 |
| T1 hand-crafted GMM | 0.4932256 | 0.4932256 | 0.7766917 | 0.8690008 | 0.5991345 | `summary.csv` row 25 |
| T1 hand-crafted HDBSCAN | 0.1858007 | 0.1858007 | 0.6206142 | 0.1679780 | 0.1396538 | `summary.csv` row 26 |
| T1 HuBERT-ECG k-means | 0.1327017 | 0.1327017 | 0.5909539 | 0.7084972 | 0.5723839 | `results_compare_strong.csv` rows 130-139 |
| T1 HuBERT-ECG agglom. | 0.1230537 | 0.1230537 | 0.5973091 | 0.6833202 | 0.6896145 | row 140 |
| T1 HuBERT-ECG spectral | 0.0305022 | 0.0305022 | 0.6272727 | 0.5637293 | 0.8682140 | rows 141-150 |
| T1 HuBERT-ECG GMM | 0.1455287 to 0.1460738 | same | 0.5971095 to 0.5974582 | 0.7206924 to 0.7210858 | 0.5011802 to 0.5015736 | rows 151-160 |
| T1 HuBERT-ECG HDBSCAN | 0.0 | 0.0 | 0.7069941 | 0.0 | empty (NaN) | row 161 |
| T1 ECGFounder k-means | 0.8234470 to 0.8267622 | same | 0.9420511 to 0.9435251 | 0.9701023 to 0.9708891 | 0.5283242 to 0.5295043 | rows 258-267 |
| T1 ECGFounder agglom. | 0.6601002 | 0.6601002 | 0.8561376 | 0.9209284 | 0.5794650 | row 268 |
| T1 ECGFounder spectral | 0.8011539 | 0.8011539 | 0.9303816 | 0.9638080 | 0.5373721 | rows 269-278 |
| T1 ECGFounder GMM | 0.7938919 to 0.8321413 | same | 0.9239266 to 0.9420807 | 0.9602675 to 0.9701023 | 0.5334382 to 0.5432730 | rows 279-288 |
| T1 ECGFounder HDBSCAN | 0.2607077 | 0.2607077 | 0.6258583 | 0.2261998 | 0.2022030 | row 289 |
| T2 raw-beat k-means | 0.0182403 | 0.0182403 | 0.5600540 | 0.5670000 | 0.7343333 | `results_mitbih.csv` rows 2-11 |
| T2 raw-beat agglom. | 0.0426345 | 0.0426345 | 0.5512602 | 0.6110000 | 0.6703333 | row 12 |
| T2 raw-beat GMM | 0.0184876 | 0.0184876 | 0.5593827 | 0.5676667 | 0.7323333 | rows 23-32 |
| T2 beat-morphology k-means | 0.5810446 to 0.6996969 | same | 0.8398638 to 0.8989563 | 0.9120000 to 0.9466667 | 0.5020000 to 0.5386667 | rows 130-139 |
| T2 beat-morphology agglom. | 0.6836331 | 0.6836331 | 0.8912782 | 0.9423333 | 0.5123333 | row 140 |
| T2 beat-morphology GMM | 0.6275914 to 0.6293569 | same | 0.8409909 to 0.8420403 | 0.9116667 to 0.9123333 | 0.5803333 to 0.5810000 | rows 151-160 |
| T2 conv-AE k-means | 0.0562248 to 0.1380405 | same | 0.5387774 to 0.6130034 | 0.6383333 to 0.6730000 | 0.5296667 to 0.7533333 | rows 258-267 |
| T2 conv-AE agglom. | 0.1080709 | 0.1080709 | 0.6192966 | 0.6336667 | 0.8116667 | row 268 |
| T2 conv-AE GMM | 0.0293357 to 0.3453092 | same | 0.5243835 to 0.7094018 | 0.5990000 to 0.8190000 | 0.5730000 to 0.7660000 | rows 279-288 |

Random baselines per dataset. PTB-XL: random-labelling ARI 0.00010634844263885416, mean over ten seeds (`baselines.csv` row 3): FOUND; majority 0.5043273013375295 (row 2): FOUND; random AMI and random purity are computed by `code/core/cluster_eval.py` lines 108-113 but not written: NOT IN code/. MIT-BIH: majority 0.5 (`baselines_mitbih.csv` row 2): FOUND; no random baseline is computed or stored: NOT IN code/. No baseline exists for NMI, V-measure, FMI or silhouette on either dataset: NOT IN code/.

### Item 7. C-4: HDBSCAN noise fraction

NOT IN code/: no CSV stores a noise fraction or noise count. What the stored rows fix, by the definitions in `code/core/cluster_eval.py` lines 83 and 94-95 (cluster sizes count non-noise points only):
Rows with `n_nonempty_clusters` 0 have no non-noise point, so every point is noise (noise fraction 1). Under power scaling these are Table 1 raw-flatten (`results_raw.csv` row 33), conv-AE (`results_learned.csv` row 33) and HuBERT-ECG (`results_compare_strong.csv` row 161): FOUND. The same holds for raw-flatten and conv-AE under every scaler, HuBERT-ECG under every scaler, and hand-crafted and ECGFounder under robust scaling (`results_compare_strong.csv` rows 129 and 385).
For the hand-crafted and ECGFounder power HDBSCAN cells only bounds follow, not the value: AMBIGUOUS. Non-noise share is at least purity (purity counts majority members of non-noise clusters over all points) and at most `n_nonempty_clusters` x largest_cluster_frac. Hand-crafted (row 33): purity 0.16797797, 2 clusters, largest 0.13965382, so non-noise share between 0.16797797 and 2 x 0.13965382 = 0.27930763, noise fraction between 1 - 0.27930763 = 0.72069237 and 1 - 0.16797797 = 0.83202203. ECGFounder (row 289): purity 0.22619984, 2 clusters, largest 0.20220299, so non-noise share between 0.22619984 and 0.40440598, noise fraction between 0.59559402 and 0.77380016.

### Item 8. Cohort facts

Number of AFLT records in the AF class: NOT IN code/ (B2; only the whole-database comment at `code/core/config.py` line 45).
9:1 subsample size: NOT IN code/ (B4; the count is printed at `code/experiments/run_analyses.py` line 93 and not stored; no file states it).
MIT-BIH records used and which of the 48 is absent: NOT IN code/ (B5; `results_mitbih.csv` has no record column; the only count in `code/` is the comment "standard 48 records" at `code/core/data.py` line 96).

### Item 9. Further analyses in results/ or figures/

| Topic | Status | Where looked |
|---|---|---|
| Bootstrap intervals | NOT IN code/ | all 11 CSVs (columns listed in item 1); Grep for `bootstrap` over `code/` |
| Timing | NOT IN code/ | CSV columns; Grep for `time\.|perf_counter` |
| Memory | NOT IN code/ | CSV columns; Grep for `memory` |
| Multi-class runs | NOT IN code/ | all per-run CSVs are binary tasks; no other result file |
| Other foundation models | NOT IN code/ | representations in the CSVs are raw_flatten, rhythm_morph, deep_ae, hubert_ecg, ecgfounder, raw_beat, beat_morph only |
| Site-based federation | NOT IN code/ | `results_federated.csv` settings are federated_iid, federated_noniid, centralized |
| 300-record 500 Hz check | NOT IN code/results | no CSV or figure; values only as text in `code/README.md` line 74 and `code/experiments/arm_ecgfounder.py` line 10 |
| K = 2 to 8 AMI sweep | NOT IN code/ | no CSV or figure; stdout only |
| 9:1 imbalance numbers | NOT IN code/ | no CSV or figure; stdout only |

`code/figures/` holds only `fig1_ari_heatmap.pdf`, `fig2_silhouette_trap.pdf`, `fig3_sep_vs_clust.pdf` and `fig4_federated.pdf`; none shows any of the topics above. `fig1_ari_heatmap.pdf` prints the Table 1 power means at two decimals (for example ECGFounder k-means 0.89, conv-AE agglomerative 0.01); `fig4_federated.pdf` shows the `results_federated.csv` means as bars without error bars.

### Item 10. `code/experiments/figures.py` and the figures

Difference from the public commit: one line. `code/experiments/figures.py` line 97 is `ax.set_title(r"Separability $\neq$ clusterability")`; the public commit has the not-equal character itself in the title string. The stored `fig3_sep_vs_clust.pdf` shows the title with a not-equal sign. Nothing else in the file differs, so the description in H1 holds unchanged for `code/`.
Font sizes (identical in both versions): base `font.size` 9, serif family (line 24); heatmap cell annotations 8 (line 64); silhouette-trap legend 6.5 (line 81); separability point labels 7.5 (line 92); separability legend 7 (line 98); federated legend 7 (line 115). Figure sizes in inches: heatmap 5.2 x 3.0 (line 56), silhouette trap 4.6 x 3.3 (line 72), separability 4.4 x 3.3 (line 86), federated 5.2 x 3.0 (line 109).
Which file is which compiled figure: `fig1_ari_heatmap.pdf` is Figure 1 (main.tex line 264); `fig3_sep_vs_clust.pdf` is Figure 2 (main.tex line 305); `fig2_silhouette_trap.pdf` is Figure 3 (main.tex line 325); `fig4_federated.pdf` is Figure 4 (main.tex line 409).
One point in the silhouette-trap figure is one stored result row under power scaling: one (representation, clusterer, seed) run; 160 rows, 157 drawn (H1).
Parity line in the separability figure: dashed grey line from (0.5, 0.5) to (1, 1), labelled "parity" (line 93); each point is (hard-coded ceiling from lines 34-35, the largest clusterer mean ARI under power scaling, line 88). With the stored values the y-coordinates are raw-flatten 0.0126 (GMM), conv-AE 0.0079 (agglomerative), hand-crafted 0.7113 (agglomerative), HuBERT-ECG 0.1951 (GMM), ECGFounder 0.8854 (k-means), from the Table 1 rows of item 2.

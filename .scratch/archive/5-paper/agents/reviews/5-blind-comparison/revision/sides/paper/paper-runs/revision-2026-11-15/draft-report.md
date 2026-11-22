# Draft writer report, revision item 5

The three patch files are written and validated, and none of them is applied. Every one of the 26 items has at least one op. Some items lack a permission, so part of their request stays undone; those parts are listed below with the permission each lacks.

## Patch files

- `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/revision-1/paper-runs/revision-2026-11-15/patches/02-main.tex.patch.json`: 39 ops (38 `replace_block`, 1 `insert_after`) on 68 blocks.
- `.../patches/03-refs.bib.patch.json`: 21 ops (19 replace, 2 insert) on 37 blocks.
- `.../patches/04-highlights.txt.patch.json`: 1 op, on block B0002.

All three pass `jq empty`. For each file a `jq` comparison against its manifest gave "base ok", every `old_hash` matched, round is 1, and no block has two ops. The intended-claims file is at `.../revision-2026-11-15/intended-claims.md` (35 claims).

**Structural.** The main patch changes the titles of three subsections, so the apply script will flag it as structural:
- B0029 "Federated robustness" becomes "Federated clustering simulation".
- B0032 becomes "Clustering by representation and algorithm".
- B0049 becomes "Class imbalance and simulated federation".

The patch touches 39 of 68 blocks (0.57). The bib patch touches 21 of 37 (0.57). Both are under 0.6.

**Table numbers shift.** Three new tables come first in the source order: `tab:repr` (B0026), then `tab:metrics` and `tab:settings` (B0028). The old main, MIT-BIH and federated tables follow them. All references use `\ref`. The final numbers are not verified, because nothing was compiled; the response letter needs them.

**AI declaration.** OP039 (B0067) is tagged `disclosure`, not a referee id. No referee comment asks for it; the brief does.

## Word count

`wc -w` gives 3907 for the base main.tex. The 38 replaced blocks hold 3341 words and the new text holds 7056. The patched file will hold 7622, a change of +3715. The counts include LaTeX tokens and table cells.

## Ops per item

All ops are in the main patch unless marked bib or hl (highlights).

| Item | Ops |
|---|---|
| R1-1 | OP013, OP018, OP020, OP031 |
| R1-2 | OP013, OP018, OP020 |
| R1-3 | OP013, OP021 |
| R1-4 | OP001, OP003, OP011, OP029, OP030, OP033, OP037; bib OP004; hl OP001 |
| R1-5 | OP023, OP025 |
| R2-1a | OP008, OP009, OP010 |
| R2-1b | OP011, OP036; bib OP010, OP011 |
| R2-2a | OP008, OP011 |
| R2-2b | OP011, OP012 |
| R2-3 | OP013; bib OP005, OP012, OP013 |
| R2-4 | OP022, OP033; bib OP004 |
| R2-5 | OP022, OP023 |
| R3-1 | OP001, OP003, OP004, OP006, OP007, OP034, OP035; bib OP014, OP015, OP019 |
| R3-2 | OP001, OP008, OP009, OP036, OP037; bib OP020, OP021 |
| R3-3 | OP013, OP018, OP020 |
| R3-4 | OP007, OP011, OP021, OP035, OP036, OP037; bib OP004, OP016, OP017, OP018 |
| R3-5 | OP001, OP004, OP014, OP015, OP028, OP030 to OP033, OP036, OP037; hl OP001 |
| R3-6 | OP001, OP011, OP029, OP030, OP033, OP037; bib OP004; hl OP001 |
| R3-7 | OP008, OP009, OP011, OP013, OP015, OP029, OP038 |
| R3-8 | OP001, OP002, OP004, OP005, OP011, OP016, OP017, OP026 to OP030, OP033 to OP037; hl OP001 |
| R3-9 | 23 ops (OP001 to OP032 where terms or abbreviations changed); hl OP001 |
| R3-10 | OP023, OP025 |
| R3-11 | OP018, OP019, OP023, OP025, OP027, OP031, OP032 |
| R3-12 | OP018, OP019, OP023, OP030, OP031, OP032 |
| R3-13 | OP017, OP018, OP022, OP026, OP027, OP031 |
| R3-14 | OP003, OP005, OP007, OP013, OP021, OP038; bib OP001 to OP003 and OP006 to OP021 |

## What stays undone, and the permission it lacks

- **R1-1, R3-3, R3-12:** there is no bootstrap interval, and no interval for the conv-AE, HuBERT-ECG and ECGFounder rows. This needs a number computed from saved results. The text states what the seeds vary and gives the saved half-widths and standard deviations as they stand.
- **R1-2, R3-3:** there is no Cliff's delta, for the same reason. The mean differences (0.242, 0.470, 0.174) are named as the effect sizes, and the p = 0.002 floor is explained.
- **R1-4, R3-6:** there is no time or memory table, which needs a new experiment. Table `tab:repr` gives the dimension, input, parameter count and pretraining corpus of each representation and says that run time and memory were not measured.
- **R1-5, R3-12:** no figure gains error bars or per-seed points, which needs a figure change and computed numbers. The captions carry the counts and the spread instead.
- **R3-10:** fonts and contrast inside the figure files are unchanged, which needs the figure-change permission. Only the include width of Figures 2 and 3 rises, from 0.60 and 0.62 to 0.85.
- **R3-2:** no multi-class validation, which needs an experiment and a download. The binary design is justified and every conclusion is scoped to the two tasks.
- **R3-4:** no further models, which needs an experiment and a download. The selection criteria and the other public models are given.
- **R3-5:** no real multi-site data, which needs an experiment and new data. The simulation is described in full, including its pooled steps.
- **R3-13:** the retention column stays at two decimals, and the text-only values (K sweep, conditioner means, random forest) stay as they were. Three decimals would need computed numbers.
- **Not in any results file:** the three adjacent Wilcoxon contrasts are reported, but `run_analyses.py:47-48` also tests hand-crafted against raw. That fourth result was printed only and is not reported.

## [GAP] markers written

- `[GAP: source for lead II as the rhythm lead]` in B0026. No source read in this run states the convention, so lead II is justified only through the single-lead diagnosis of AF (Van_Gelder_2024, clifford2017af, Hannun_2019).
- `[GAP: exact library versions used for the reported results]` in the caption of `tab:settings`. Only `requirements.txt:5` (`scikit-learn>=1.3`) exists.
- `[GAP: model version used for software implementation and language editing]` in B0067. The revision sentence names claude-opus-5-5. Every other category of the declaration is kept as the authors wrote it.

## Values taken from `code/` (file:line, read with `grep -n`/`sed` in this turn)

Settings and inputs:
- Ten seeds: `core/config.py:23`; fixed random state `:24`.
- 100 Hz records: `config.py:16`, `experiments/benchmark.py:171`; PTB-XL 1.0.3 at 100 Hz: `README.md:19`.
- Lead II: `config.py:32`, `core/features.py:124`.
- Raw-flattening window of 6: `config.py:62`, `features.py:42`.
- Conditioners and the power default: `config.py:64-65`.
- Cohort and reading:
  - shuffle with a fixed random state: `benchmark.py:46`
  - one record per patient: `:49`
  - 32-bit physical signal: `:62-63`
  - ceiling on the power-conditioned representation: `:135`
  - Ward and HDBSCAN fitted once: `:148`
- Clusterers in `core/cluster_eval.py`:
  - k-means with ten initialisations: `:47`
  - Ward: `:49`
  - spectral with nearest-neighbour affinity: `:51-52`
  - GMM with regularisation 1e-4: `:58`
  - HDBSCAN `max(10, n//50)`: `:61`
- Metric handling in `core/cluster_eval.py`:
  - pilot comment on robust scaling: `:29-34`
  - noise left out of purity: `:71`
  - silhouette without noise: `:80`
  - cluster sizes without noise: `:83`
  - random labelling: `:110`
  - ceiling (max_iter 2000, balanced, stratified group 5-fold): `:120-121`
- Hand-crafted features in `core/features.py`:
  - the 16 names: `:53-59`
  - 16-bin histogram over 200 to 2000 ms: `:70`
  - template window 0.25 s: `:110`
  - discrete wavelet delineation: `:139`
  - median imputation: `:146-148`
- Autoencoder:
  - in `core/deep_repr.py`: 2500 samples `:22`; latent 32, 50 epochs, batch 64, lr 1e-3, seed 0 `:32`; per-lead z-score `:40`; architecture `:47-51`; 10% validation split `:72`; mean squared error `:77`; 1e-5 `:91`; patience 8 `:95`
  - trained once with seed 0: `experiments/arm_learned.py:64`
  - 40 epochs and 360 Hz on MIT-BIH: `mitbih_bench.py:96-97`
- HuBERT-ECG in `arm_foundation.py`: weights `:29`, 500 samples and 6000 input `:31-32`, evaluation mode `:59`, mean pooling `:79`.
- ECGFounder:
  - in `arm_ecgfounder.py`: selection rationale `:3-4`; checkpoint `:40`; classification layer removed `:43`; 150 classes `:47`; evaluation mode `:52`; upsampling and global z-score `:68-75`
  - 1024 features: `ecgfounder_net1d.py:389`
  - selection rationale also at `compare_strong.py:7-8`
- MIT-BIH in `mitbih_bench.py`: window `:27`, cap of 400 `:28`, 32-bit `:40`, non-beat set `:43`, 1500 per class `:106`, record groups `:121`.
- Analyses in `run_analyses.py`: Wilcoxon pairs `:47-48`, K sweep `:71`, random forest `:81`, 9:1 subsample and single fit `:90`, `:96`.
- Federation in `fed_cluster.py`:
  - ten sites, 15 rounds, 3 local iterations, ten seeds, K = 2: `:22-26`
  - Dirichlet 0.3: `:57`
  - sites with fewer than two records dropped: `:65`
  - initial centroids from the pooled data: `:72`
  - centralized k-means: `:93`
  - power transform on the pooled data: `:100`
  - standard deviation: `:108`
- Figures in `figures.py`: ECGFounder ceiling 0.983 `:35`, heatmap labels `:58`, silhouette-trap axes `:75`.

Results files:
- `baselines.csv`: 0.504 `:2`, random ARI 0.000 `:3`, 0.519 `:4`, 0.942 `:6`.
- `baselines_learned.csv:2` 0.678; `baselines_foundation.csv:2` 0.899.
- `baselines_mitbih.csv`: 0.500, 0.741, 0.925, 0.927 at `:2-5`.
- `results_federated.csv:2-13`: every mean and SD of the federated table.
- The k-means seed SDs of 0.000 and 0.001 come from the centralized rows of `results_federated.csv` (`:4`, `:7`, `:10`, `:13`). These use the benchmark's own k-means configuration; the hand-crafted mean is 0.6439 both there (`:7`) and in `summary.csv:27`.
- `summary.csv`:
  - `:4`: Ward silhouette 0.81, largest cluster 1.00
  - `:5`: GMM half-width 0.008
  - `:6`, `:8`
  - `:7`: purity 0.506, largest cluster 0.967
  - `:25`, `:27`: purity 0.901, half-widths
  - `:28`
- `results_raw.csv:2` (NMI equals V-measure) and `:33` (all noise, FMI 0.707).
- `results_learned.csv:2` (0.541) and `:33`.
- `results_compare_strong.csv`: `:33` (0.140), `:161` (no cluster), `:289` (0.202).

## Sentences marked "argument inferred"

- B0023: with one defining criterion, the ceiling and the score "can be read against a known class difference".
- B0026:
  - what the single-lead set leaves out and gains;
  - the three selection criteria, and "We included ECGFounder for that report".
- B0037: spectral scores attributed to a poorly connected affinity graph, "which was not checked".
- B0039: the four explanations (ECGFounder "likely organised by diagnosis", the hand-crafted axes, HuBERT-ECG's low-variance direction, raw flattening and conv-AE). The text calls them untested.
- B0055: "We judge that the low dimension may also suit distance-based clustering".
- B0057: "a model trained with another objective could rank differently".
- B0059: "Upsampling adds no information, so it cannot inflate the foundation model's lead" (the authors' argument, kept).

## Revision log

- **Abstract and Introduction (B0008, B0012, B0015, B0016):**
  - The contribution is now the evaluation protocol, set out as a numbered list.
  - Scope sentences are added.
  - The false "ceilings well above chance" for raw flattening is corrected.
  - SR, AF and ARI are defined at first use.
- **Related work:**
  - B0018 and B0020 name their authors.
  - A new paragraph after B0019 covers BenchECG, Al-Masud, Xu, Berger and Han.
  - B0020 is rewritten from the passages of Filice et al.
- **Data (B0023, B0024):** PTB-XL release, rate, WFDB reading, 32-bit 1000<multiplication sign>12 arrays, the SCP-ECG, AFIB and AFLT expansions, the binary design, and MIT-BIH reading and sampling.
- **Representations (B0026):** each input and principle, all 16 features named, the lead-II rationale, the model selection criteria, the MIT-BIH features, and `tab:repr`.
- **Clustering and evaluation (B0028):**
  - HDBSCAN noise handling;
  - the two baselines actually computed (this replaces "every metric ... against a majority and a random baseline");
  - what the seeds vary and the meaning of the Wilcoxon floor;
  - the pilot behind the power default;
  - `tab:metrics` and `tab:settings`.
- **Federation (B0029, B0030):** full description, the pooled steps disclosed, the heterogeneity called simulated.
- **Results (B0032 to B0053):**
  - scoped headings;
  - the stability sentence limited to k-means;
  - effect sizes;
  - HDBSCAN facts;
  - the chance levels of ceiling and ARI stated, and "sharpest case" removed;
  - an explanation of each representation's result;
  - text values at the tables' precision;
  - every caption with its counts;
  - the Figure 3 marker position corrected to bottom right;
  - Figures 2 and 3 at 0.85 width;
  - federated SDs added to the federated table.
- **Discussion, Limitations and Conclusion (B0055 to B0061):**
  - scoped readings, replacing the decision rule, "not viable" and "worth stating plainly";
  - other public models named;
  - the preprocessing mismatch of the foundation models;
  - scope statements for multi-class tasks and the federation;
  - "overtake under site heterogeneity" corrected to "came close (0.591 against 0.612)";
  - "transfer across lead sets" removed, since it was untested.
- **Statements:**
  - B0062 gains the settings, the dependency list and the weights URLs.
  - B0067 gains the revision sentence.
- **Bib:**
  - preprints become `@misc` with eprint;
  - URL, ISSN and month removed, with page ranges in BibTeX form;
  - accented names written in LaTeX;
  - Van Gelder cut to six authors plus "others";
  - Xu becomes `@inproceedings`;
  - arXiv identifiers for FedAvg, CLOCS and 3KG (from `lookup.py resolve`);
  - two inverted author names corrected (Westover, Shah/Wong), checked against the fetched texts;
  - new entries `arxiv_2410_04133` (from `lookup.py bibtex 2410.04133`) and `rosenberg2007vmeasure` (from `lookup.py resolve`; no DOI).
- **Highlights:** five bullets of 85, 78, 78, 71 and 83 characters (counted with `awk length`), scoped to the revised claims.

## Cited sources not read in this run

These carry citations that a reader should know were not checked against a passage. The temporary folder listing shows no text, or only an abstract, for:
- hdbscan2013, rosenberg2007vmeasure, hubertarabie1985 and vinh2010 (no text);
- Fowlkes_1983 and rousseeuw1987 (abstract only; cited for standard formulas);
- Xu_2025 and the NEJM AI version of ecgfounder2024 (abstract only);
- mitbih2001, physionet2000, neurokit2021, sklearn2011, hrvstandards1996 and dechazal2004 (existing citations, now attached to the feature lists and settings).

## Prose check

The prose check ran on the decoded new text with `jq` and `grep`:
- No non-ASCII characters (`LC_ALL=C grep '[^ -~]'` count 0) and no control characters.
- No dash asides; the only " - " hits are minus signs inside math.
- One semicolon, inside the math `I(Y;\hat{Y})`, and none in running prose.
- The flagged-word scan found only "robust scaling", a domain term. The two remaining uses of "many" are "many tasks", which reports Berger et al.'s claim, and "one ninth as many".
- Every sentence over 30 words is an enumeration of named items.
- Paragraphs over 210 words are lists or tables.
- The full text was read back after the last edits.


# Draft writer report, revision item 8

I wrote both patches and validated them; neither is applied. Every assigned id has an op. Four things need you:

- **V12 (PTB-XL counts):** I took the descriptor option. I found no text tied to release 1.0.3 that states 21,799 records and 18,869 patients.
- **README DOI:** the DOI that `code/README.md:19` gives for release 1.0.3 is the DOI of release 1.0.1.
- **R2-1b (lead II):** no source read in this run states that lead II is the conventional rhythm lead. The text now gives lead II as the study's choice.
- **V32 (Wilcoxon contrasts):** the code tests a fourth contrast that the text does not report.

## Patch files
- `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/revision-1/paper-runs/revision-2026-11-15/patches/09-main.tex.patch.json`: 27 `replace_block` ops (OP001 to OP027) on 27 of 84 blocks. No heading changes, so no op is structural.
- `.../patches/10-refs.bib.patch.json`: OP001 `insert_after` B0001 (new entry `ptbxl103`) and OP002 `delete_block` B0025 (`Hannun_2019`).
- `.../patches/11-highlights.txt.patch.json`: not written. No change of this pass makes a highlight wrong.
- **Checks run:**
  - `jq empty` passes on both patches.
  - A `jq` comparison with each manifest found `base_sha256` equal, no `old_hash` mismatch, no block with two ops, round 1, and no op without ids.
  - A word-level `diff` of each rewritten block against the current `main.tex` shows only the intended changes.
- **intended-claims.md:** claims 36 to 57 are appended under "Claims added or changed by revision item 8".

## Revision log
| Id | Ops (main unless marked bib) | Status |
|---|---|---|
| R2-1b | OP010 | RESOLVED: lead II stated as the study's choice, with Zheng et al. as precedent; GAP removed |
| R2-2b | OP011, OP012 | RESOLVED: MIT-BIH conv-AE resampling and z-scoring, the median of all 3,000 beats for the correlation, and what each beat representation encodes |
| R3-9 | OP009 (HuBERT), OP020 ("foundation-model embeddings"), OP021 ("supervised ceiling") | RESOLVED |
| V12 | OP007, OP026; bib OP001 | RESOLVED |
| V13 | OP011 | RESOLVED |
| V14 | OP005 | RESOLVED |
| V15 | OP010; bib OP002 | RESOLVED |
| V16 | OP024 | RESOLVED |
| V17 | OP002, OP021, OP024 | RESOLVED |
| V18 | OP005 | RESOLVED |
| V19 | OP009, OP016 | RESOLVED |
| V20 | OP017, OP024 | RESOLVED |
| V21 | OP006 | RESOLVED |
| V23 | OP003 | RESOLVED: reworded without the claim about the field |
| V24 | OP020 | RESOLVED |
| V25 | OP001, OP004, OP006, OP008, OP024 | RESOLVED |
| V26 | OP024 | RESOLVED |
| V27 | OP022 | RESOLVED |
| V28 | OP023 | RESOLVED |
| V29 | OP021 | RESOLVED |
| V30 | OP013, OP015 | RESOLVED |
| V31 | OP008 | RESOLVED |
| V32 | OP018, OP019 | RESOLVED (see the fourth contrast under "For you") |
| V33 | OP001, OP014 | RESOLVED |
| V34 | OP015, OP025 | RESOLVED |
| V35 | OP027 | RESOLVED: "(Claude)" restored |

For V25 I also changed the abstract and the Discussion, which used the same "patient-grouped clustering score" wording that issue V25 names.

## Passages read
**V12:**
- **Descriptor** (`ptbxl2020.txt`, abstract): "comprising 21837 records from 18885 patients of 10 seconds length".
- **The README's DOI, 10.13026/x4td-x982:**
  - `lookup.py bibtex` gives "url = {https://physionet.org/content/ptb-xl/1.0.1/}", so this DOI is release 1.0.1.
  - `lookup.py resolve` maps it to OpenAlex W6959434663, whose DOI is 10.13026/6sec-a640.
- **Release 1.0.3, 10.13026/kfzx-aw45** (`lookup.py bibtex`): "url = {https://physionet.org/content/ptb-xl/1.0.3/}", year 2022.
  - `resolve` and `fetch` on this DOI return the same OpenAlex record. Its abstract (`ptbxl_1_0_3.abstract.txt`) reads: "The PTB-XL ECG dataset is a large dataset of 21799 clinical 12-lead ECGs from 18869 patients of 10 second length."
  - `cmp` shows this abstract is byte-identical to the one fetched for the 1.0.1 DOI.
- **Why the descriptor option:** the text that states 21,799 and 18,869 belongs to the record shared by all releases (DOI 6sec-a640), not to release 1.0.3. So the text gives the descriptor's 21,837 and 18,885, attributed to the descriptor. The release used is cited separately to the 1.0.3 record, `ptbxl103`.
- **The new `ptbxl103` entry** takes its fields from `lookup.py bibtex`. I made two field changes: `howpublished` comes from the record's `publisher`, and `note = {Version 1.0.3}` comes from its `url`.

**R2-1b:**
- **Searched or fetched, nothing usable:**
  - Fetches of Spodick 2001 (10.1111/j.1076-7460.2001.00025.x), Spodick 2003 (10.1111/j.1076-7460.2003.01787.x) and Mason 2007 (10.1016/j.hrthm.2007.01.028) returned no text (Mason: HTTP 403).
  - The abstracts already in the folder (meek2002abc, kligfield2007, reiser2023interp, the two monitoring statements) do not state the convention.
  - A grep of every fetched text for "lead II" finds no statement of the convention either.
- **Passage used** (`Zheng_2020.txt`, line 894): "Features extracted from lead II include ventricular rate in beats per minute (BPM), atrial rate in BPM, ... mean of RR interval, Variance of RR interval, RR interval count."

**V23:** `lookup.py search 'interpretable handcrafted features ECG arrhythmia classification deep learning comparison review'` found no source that states the field-level claim (OpenAlex and Semantic Scholar answered HTTP 429). The sentence now reads: "Hand-crafted features measure named physiological quantities, such as RR intervals and P-wave presence, and need no trained network."

**Other passages re-read for this pass:**
- V18, `McKeen_2025.txt:113`: "the contrastive CMSC objective originally introduced by CLOCS".
- V18, `arxiv_2509_25095.txt:75`: "We introduce ECG-CPC". Line 140: "we pretrain a structured state-space (SSM) model on HEEDB using contrastive predictive coding (CPC)".
- V16, `arxiv_2509_25095.txt:139-140`: "only FMs with publicly available pretrained weights are included" and "ECGFM-KED (Tian et al., 2024) uses a ResNet backbone".
- V17, `sslclustering2025.txt:119`: "achieving nearly the same linear evaluation accuracy as the encodings". The same text cites ImageNet 30 times.
- V13, `dechazal2004.abstract.txt`: "Feature sets were based on ECG morphology, heartbeat intervals, and RR-intervals."
- R3-9, `hubertecg2024.txt:130-131`: "we draw inspiration from HuBERT24, a powerful self-supervised foundation model for speech representation learning". The paper gives no expansion of the name.

## Values and facts taken from `code/` (read only)
- **Release used:**
  - `README.md:19`: PTB-XL 1.0.3 at 100 Hz, DOI x4td-x982.
  - `experiments/benchmark.py:25`: `PN_DIR = "ptb-xl/1.0.3"`.
- **V31:** the order in which the cohort is drawn, `benchmark.py:43-54`.
  - `core/config.py:45` gives "SR=16743, AF=1570". I read it but did not state it in the text.
- **V25:**
  - Clusterers fitted on all records: `benchmark.py:134,139-142`.
  - Ceiling with patient groups: `benchmark.py:136` and `core/cluster_eval.py:120-122`.
- **R2-2b and V13:**
  - Beat window: `mitbih_bench.py:27`.
  - RR context: `:68-69`.
  - Morphology values and correlation with the median of all beats: `:71-78`, `:88`.
  - Features computed on the 3,000-beat subsample: `:106`, `:120`, `:128`.
  - Raw beat flattened: `:84-86`.
  - Conv-AE call: `:93-97`.
  - Resampling to 2500 samples: `core/deep_repr.py:22-29`.
  - Per-lead z-score: `deep_repr.py:40`.
- **V19:** NeuroKit2 calls `core/features.py:133-139`, with `method="dwt"` at `:139`.
- **V27:** dashed line from 0.5 to 1 labelled "parity", `experiments/figures.py:93`.
- **V32:** the four tested pairs, `experiments/run_analyses.py:42-48`.
- **R2-1b:** `RHYTHM_LEAD = "II"`, `core/config.py:32`.

No number was computed or derived.

## GAP markers
- **Removed:**
  - `[GAP: source for lead II as the rhythm lead]` (B0029, OP010).
  - `[GAP: model version used for software implementation and language editing]` (B0083, OP027).
- **Written:** none.
- **Kept:** `[GAP: exact library versions used for the reported results]` in the caption of `tab:settings`. It is yours under R3-7.

## Sentences marked "argument inferred"
- B0014 (OP002): "We read such a gap as a representation placing the discriminative direction away from its dominant axes of variation. A supervised probe then recovers the label while an unsupervised partition does not."
- B0051 (OP021): "We read the weaker representations as holding label information that does not lie along their dominant axes of variation."

## Prose check
- It ran on the new text of both patches with `jq`, `grep` and `awk`:
  - No non-ASCII characters, no dash asides, no semicolons and no arrows.
  - The flagged-word hits are "robust scaling" (a domain term) and two quantity phrases of the form "as many ... as".
- I split the sentences of my own that ran past 30 words. The long sentences left are lists of named items.
- One break left: B0031 is 228 words, against the 120 to 200 range. It covers one idea, the three beat representations, so I kept it as one paragraph.

## For you
- **README DOI:** `code/README.md:19` names 10.13026/x4td-x982 as release 1.0.3, but its DataCite record is release 1.0.1. The record for release 1.0.3 is 10.13026/kfzx-aw45. I did not change the README, because `code/` is read only.
- **Fourth Wilcoxon contrast:** `run_analyses.py:47-48` also tests the hand-crafted features against raw flattening. Its result is printed only, not saved. The text now names the three contrasts between neighbours in the ranking, which is accurate. Whether to report the fourth is your call.
- **"Canonical":** "MIT-BIH is the canonical morphology benchmark" (B0015) is a claim about the field with no source, of the same kind as V23. No issue raises it, and I left it unchanged.

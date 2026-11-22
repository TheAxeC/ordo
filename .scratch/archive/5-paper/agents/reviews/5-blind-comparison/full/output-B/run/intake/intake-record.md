# the intake stage: Paper Configuration Record (confirmed)

Produced by the intake agent for a `full`-mode run. No deep-research handoff was detected (Step 0), so the full interview (Steps 1 to 13) applies; plan mode was not triggered. Every value below is the one Axel confirmed in `run/settings.md` section "Confirmed by Axel" (`run/settings.md:5-28`), cited by line, together with the decisions C1 to C9 recorded there (`run/settings.md:30-76`). Items Axel ruled unknown are recorded as [GAP] placeholders. No venue limit, layout value, funder, grant number or author role has been filled from outside what Axel stated.

## Paper Configuration Record

| Parameter | Value |
|-----------|-------|
| **Topic** | An interpretable Block-Term Tensor Network (BTTN) that predicts incident (future-onset) atrial fibrillation from one sinus-rhythm 12-lead ECG plus clinical risk factors (age, sex, ECG intervals), with measured faithfulness of its frequency and lead signatures. Source: `code/README.md:1`, `code/README.md:3`, `code/README.md:7`, `code/core/config.py:16-21`; matches the confirmed research question (`run/settings.md:10`). |
| **Research Question** | "Can an interpretable block-term tensor network, whose ECG evidence passes through readable frequency-and-lead block signatures and is fused with age, sex and ECG intervals, predict incident atrial fibrillation from one sinus-rhythm 12-lead ECG in MIMIC-IV-ECG on gold ICD-10 labels more accurately than a clinical risk-factor model and a CNN, and are those signatures faithful?" (`run/settings.md:10`). Faithfulness and external validation are described in Methods with [GAP] placeholders in Results (C2, C3: `run/settings.md:40-49`). |
| **Paper Type** | IMRaD (`run/settings.md:11`). |
| **Discipline** | Biomedical informatics / AI in medicine; sub-field: ECG-based cardiovascular risk prediction (incident AF) with interpretable tensor machine learning (`code/README.md:1-7`, `code/core/config.py:1-21`). |
| **Target Journal** | Artificial Intelligence in Medicine (`run/settings.md:9`; also `code/README.md:3`). |
| **Venue Profile** | `run/intake/venue_profile.yaml`: `declared_by: scholar`, venue Artificial Intelligence in Medicine; word limit, abstract limit, keyword range, required sections, reference ceiling and blind-review model all "not stated" (null, so each venue-limits check reports NOT-CHECKED) (`run/settings.md:16`). |
| **Citation Format** | Vancouver (`run/settings.md:12`). |
| **Output Format** | LaTeX (.tex + .bib) (`run/settings.md:20`). Not compiled in this run (C6: `run/settings.md:62-64`). |
| **Body Language** | EN (`run/settings.md:14`). |
| **Abstract** | EN-only (`run/settings.md:15`). |
| **Word Count Target** | 6,500 words (`run/settings.md:13`). |
| **Existing Materials** | Research aims and method description (`code/README.md`, `code/core/config.py`); results log on provisional labels (`RESULTS.md`, not a number source under the evidence rule, `run/settings.md:28`); prior-art note (`notes/history/NOVELTY-AAAI-METHODS.md`); full code and reproduction pipeline (`code/`, `code/run_all.sh`, `code/paper.py`); 31 CSV files, 1 TXT file and 15 PNG figures under `code/results/`, of which 10 are admitted as gold-label files under C1 (list in "Materials inventory" below). No bibliography file, no draft sections, no reviewer feedback, no journal template are present in the project (`git ls-files` lists no `.bib` or `.docx` file and only one `.tex` file, the procedure's own `the LaTeX article template`). |
| **Co-Authors** | [GAP] placeholders for authors, order, affiliations, ORCIDs and corresponding author (`run/settings.md:22`); CRediT roles [GAP] (`run/settings.md:23`). |
| **Funding** | [GAP] (`run/settings.md:24`). Conflicts of interest: [GAP] (`run/settings.md:25`). |
| **Style Profile** | null, no samples (`run/settings.md:19`). |
| **Domain Evidence Profile** | `cs_ml` (`run/settings.md:17`). |
| **Citation Verification** | advisory (mark only, default) (`run/settings.md:18`). Nothing is written to the Material Passport for this setting (Step 13). |
| **Operational Mode** | full. Source: user request "Run the procedure in full mode: write the paper from this project's materials." |

### Notes

1. **Gate stated by the project before any manuscript.** `RESULTS.md:3`: "All numbers below are on PROVISIONAL ECG-report labels ... Nothing here is a manuscript claim until rerun on gold + external validation." `RESULTS.md:143-144`: "Rerun the whole table on gold ICD labels + age/sex, add external validation, then draft the paper. No write-up of provisional-only or of any dead end." The Materials inventory below shows which analyses have gold-label files and which do not.
2. **RESULTS.md describes provisional runs, and several committed CSVs no longer contain those numbers.** For the files whose names carry no label source, the committed values differ from the values `RESULTS.md` attributes to them (details in the inventory). Evidence rule (`run/settings.md:28`): every number in the manuscript comes from a gold-label file under `code/results/` admitted under C1; no number comes from the provisional ECG-report labels; an analysis whose label source the committed files do not establish is not reported as a gold-label result.
3. **Ethics approval, consent, de-identification and data access are [GAP] placeholders** (`run/settings.md:26`). For orientation: `RESULTS.md:3` says the hosp module DUA is "pending", while gold ICD cohorts (`code/results/cohort_icd_*.csv`) and gold result files are committed and `code/run_all.sh:44-48` requires the hosp module.
4. **Excluded content (C9, `run/settings.md:74-76`).** No provisional-label number, no item from the `RESULTS.md` dead-ends table (`RESULTS.md:125-134`), no retracted longitudinal result (`RESULTS.md:39`, `code/attic/README.md:9`) and no `code/attic/` work appears in the manuscript.
5. **Data and code statements.** Data: MIMIC-IV-ECG and the MIMIC-IV hospital module under credentialed PhysioNet access; CODE-15 and PTB-XL for the external analyses; no raw data redistributed (`code/README.md:62-64`). Code license: MIT (`code/README.md:68`, `code/LICENSE`). Ethics wording: [GAP] (`run/settings.md:26`).
6. **External analyses are identification/detection tasks, not incident prediction** (`code/README.md:64`, `code/experiments/external_ptbxl.py:3-11`, `code/experiments/external_code15.py:5-7`). No external dated-outcome (incident-AF) cohort exists in the materials.
7. **Gold-label paired comparisons are not committed.** `RESULTS.md:21` gives provisional paired deltas (BTTN-SSL minus CNN +0.0149 [+0.0101,+0.0199]). No committed file holds gold-label paired deltas or P values; `core/bench.py` prints them and saves only `bench_spectral_icd_h365.npz`, which is not in the repository (no `.npz` files are committed). Gold C-index values are printed by `code/experiments/multihorizon.py:134` but not stored in `multihorizon_icd_spectral.csv`. Under C4 (`run/settings.md:51-54`), comparisons are stated as AUROC point estimates with the 95% patient-bootstrap CIs from `table1_cis.csv`, no statistical-significance claim is made for a difference, and a [GAP] placeholder marks where the paired-bootstrap deltas go.
8. **Execution (`run/settings.md:27`, C6 `run/settings.md:62-64`).** Nothing is run: no code, no reruns, no downloads, no LaTeX compile. Figures are limited to committed gold-label images (`clin_eval.png`) and schematics; any new figure is delivered as plotting code that is not run.

## Materials inventory

### Files admitted as gold-label sources (C1)

Under decision C1 (`run/settings.md:32-38`), only files computed on MIMIC-IV gold ICD-10 labels are number sources for the manuscript.

**Admitted (10 files):** `table1_cis.csv`, `multihorizon_icd_spectral.csv`, `clin_eval_operating_points.csv`, `risk_strata.csv`, `clin_eval.png`, `cohort_accounting.csv`, `cohort_flow.txt`, `cohort_icd_h365.csv`, `cohort_icd_h1825.csv`, `cohort_icd_survival.csv`.

**Not admitted:**

- Provisional-label files: every `*ecg*` file (`cohort_ecg_h365.csv`, `cohort_ecg_h730.csv`, `cohort_ecg_h1825.csv`, `cohort_ecg_survival.csv`, `multihorizon_ecg_spectral.csv`, `scores_ecg_h365.csv`, `saliency_ecg.png`), `arch_sweep.csv`, `longitudinal.csv`, `longitudinal_trajectory.png`, `longitudinal_trajectory_v2.png`.
- Files whose label source is undetermined: `faithfulness_controls.csv`, `intervention_curve.csv`, `ablation_blockstructure.csv`, `ablation_K.csv`, `bttn_importance_freq.csv`, `bttn_importance_lead.csv`, `bttn_interpret.png`, `beat_saliency_segments.csv`, `beat_saliency.png`, `beat_saliency_long_heatmap.png`, `beat_saliency_long_examples.png`. Their results are [GAP] placeholders in Results (C2, `run/settings.md:40-44`).
- External files: `external_code15_afsr_freq.csv`, `external_code15_afsr_lead.csv`, `external_code15_afsr.png`, `external_code15_detect_freq.csv`, `external_code15_detect_lead.csv`, `external_code15_detect.png`, `external_ptbxl_afsr_freq.csv`, `external_ptbxl_afsr_lead.csv`, `external_ptbxl_afsr.png`, `external_ptbxl_detect_freq.csv`, `external_ptbxl_detect_lead.csv`, `external_ptbxl_detect.png`. Their results are [GAP] placeholders in Results (C3, `run/settings.md:46-49`).

The schematics `bttr_vs_bttn.png`, `pipeline_overview.png` and `bttn_architecture.png` carry no numbers and no labels; C6 (`run/settings.md:64`) allows schematics checked by viewing against `code/core/bttn.py`.

### Every file under `code/results/` with its label source

Label source values: **icd** = gold ICD-10 labels (`--source icd`); **ecg** = provisional ECG-report labels (`--source ecg`); **external** = CODE-15 or PTB-XL dataset labels (no MIMIC labels involved); **none** = schematic with no data; **undetermined** = cannot be established from the committed materials (reason given). Line counts from `wc -l`; row counts include the header.

| File | Producer (file:line) | Label source | Evidence |
|---|---|---|---|
| `table1_cis.csv` | `experiments/compute_table1_cis.py:52` | icd | Column `source_artifact` = `bench_spectral_icd_h365.npz` on every row (`table1_cis.csv:2-8`); `compute_table1_cis.py:29` "gold ICD-10 ladder: spectral, n=9,275, prev 0.20, 1-yr, 5-seed ensemble". The npz itself is not committed. |
| `multihorizon_icd_spectral.csv` | `experiments/multihorizon.py:135` | icd | File name `multihorizon_{source}_{tensor}`; invoked with `--source icd` at `run_all.sh:130`. |
| `clin_eval_operating_points.csv` | `experiments/clin_eval.py:76` | icd | Reads `multihorizon_icd_spectral.npz` (`clin_eval.py:21`); `TRUE_PREV = 1855 / (1855 + 41770)` (`clin_eval.py:33`) equals the icd cohort counts in `cohort_flow.txt:6-7`. |
| `risk_strata.csv` | `experiments/clin_eval.py:83` | icd | Same script and input as above (deciles of the BTTN+clin fusion probability). |
| `cohort_accounting.csv` | `core/cohort_accounting.py:149,153` | icd | `cohort_flow.txt:1` and `:23` read "source=icd"; `controls_frac_with_later_ecg` = 0.981 (`cohort_accounting.csv:19`), whereas `RESULTS.md:115` says the ecg-source value is 1.0 by construction. |
| `cohort_flow.txt` | `core/cohort_accounting.py:150` | icd | Header lines `cohort_flow.txt:1` and `:23`. |
| `cohort_icd_h365.csv` | `core/cohort.py:161-163` | icd | File name. 17,855 rows (1,855 positives, 16,000 negatives; age present on 17,853). |
| `cohort_icd_h1825.csv` | `core/cohort.py:161-163` | icd | File name. 20,000 rows (4,000 positives, 16,000 negatives). |
| `cohort_icd_survival.csv` | `core/cohort.py:161-163` | icd | File name. 20,000 rows (4,000 events, 16,000 censored). |
| `cohort_ecg_h365.csv` | `core/cohort.py:161-163` | ecg | File name. 18,618 rows (2,618 positives); `anchor_age` and `gender` empty on all rows. |
| `cohort_ecg_h730.csv` | `core/cohort.py:161-163` | ecg | File name. 11,951 rows (3,951 positives); age/sex empty on all rows. |
| `cohort_ecg_h1825.csv` | `core/cohort.py:161-163` | ecg | File name. 12,000 rows (4,000 positives); age/sex empty on all rows. |
| `cohort_ecg_survival.csv` | `core/cohort.py:161-163` | ecg | File name. 20,000 rows (4,000 events); age/sex empty on all rows. |
| `multihorizon_ecg_spectral.csv` | `experiments/multihorizon.py:135` (earlier version) | ecg | File name; values equal `RESULTS.md:28-31`. It lacks the `BTTN_clin` columns the current script writes (`multihorizon.py:127`), so it came from an earlier version of the script. |
| `scores_ecg_h365.csv` | none found (no script in `code/` writes this name) | ecg | All 1,200 `subject_id`s are in `cohort_ecg_h365.csv` with identical labels (1,200 of 1,200); only 466 are in `cohort_icd_h365.csv`, 445 with matching labels. Columns: `subject_id,label,score_bttr,score_clin`. |
| `arch_sweep.csv` | `figures/arch_sweep.py:54` | ecg | Values equal `RESULTS.md:67-69` (provisional, HPC 515744); script default `--source ecg` (`arch_sweep.py:60`); not invoked by `run_all.sh`. |
| `longitudinal.csv` | `attic/longitudinal.py:100` | ecg | Reads `cohort_ecg_survival.csv` (`attic/longitudinal.py:45-46`). Marked retracted (`code/attic/README.md:9`). |
| `longitudinal_trajectory.png` | `attic/longitudinal.py:120` | ecg | Same as above. |
| `longitudinal_trajectory_v2.png` | `attic/replot_longitudinal.py:65` | ecg | Replots `longitudinal.csv` (`attic/replot_longitudinal.py:41`). |
| `saliency_ecg.png` | `figures/saliency.py:80` | ecg | Reads `cohort_ecg_survival.csv` (`figures/saliency.py:65-66`). |
| `faithfulness_controls.csv` | `experiments/faithfulness_controls.py:164` | undetermined | Output name carries no source. Two committed invocations disagree: `run_all.sh:135` uses `--source icd`, `hpc/analyses_jobs.slurm:56` uses `--source ecg`; script default is `ecg` (`:170`). The committed values do not match the provisional values `RESULTS.md:80-84` attributes to this file. The job log line `[faithfulness_controls] n=...` (`:86`) would settle it: n=9,275 for icd per `compute_table1_cis.py:29`, n=13,090 for ecg per the cache name in `hpc/analyses_jobs.slurm:21`. No log is committed. |
| `intervention_curve.csv` | `experiments/intervention_curve.py:82` | undetermined | Same situation: `run_all.sh:136` icd, `hpc/analyses_jobs.slurm:60` ecg, default ecg (`:95`). Committed base AUROC 0.7046 (`intervention_curve.csv:2`); `RESULTS.md:87` attributes base 0.777 to this file. |
| `ablation_blockstructure.csv` | `experiments/ablation_blockstructure.py:81` | undetermined | `run_all.sh:137` icd, `hpc/analyses_jobs.slurm:52` ecg, default ecg (`:87`). Committed values do not match `RESULTS.md:95-97`. |
| `ablation_K.csv` | `experiments/ablation.py:50` | undetermined | `run_all.sh:138` icd; default ecg (`ablation.py:58`); `RESULTS.md:21` attributes provisional values (HPC 515537) that differ from the committed file. |
| `bttn_importance_freq.csv` | `experiments/interpret_bttn.py:71` | undetermined | `run_all.sh:139` icd; default ecg (`interpret_bttn.py:94`). `RESULTS.md:36` (provisional) ranks 8 Hz and 6 Hz with 2 Hz; the committed file ranks 2.0 Hz first (0.0290), then 6.0 Hz (0.0162), 4.0 Hz (0.0161), 8.0 Hz (0.0144). |
| `bttn_importance_lead.csv` | `experiments/interpret_bttn.py:72` | undetermined | As above. `RESULTS.md:36` top leads V1, V5, I, II; committed file order I (0.0316), II (0.0195), aVR (0.0140), V1 (0.0132), V5 (0.0131). |
| `bttn_interpret.png` | `experiments/interpret_bttn.py:84` | undetermined | As above; figure title shows "base AUROC 0.760". |
| `beat_saliency_segments.csv` | `figures/beat_saliency.py:94` | undetermined | `run_all.sh:151` icd; default icd (`beat_saliency.py:118`). Committed values (P_norm 0.00152, PR_norm 0.00216, QRS_norm 0.00086, ST_norm 0.00157, T_norm 0.00127, QRS_raw 0.0232) do not match `RESULTS.md:62` (P 0.0008, PR 0.0008, QRS 0.0006, ST/T 0.0004, raw QRS 0.0126), which is a provisional-label log. No committed source recording which cohort the committed run used. |
| `beat_saliency.png` | `figures/beat_saliency.py:111` | undetermined | As above. Title: "mean of 120 high-risk pre-AF sinus ECGs". |
| `beat_saliency_long_heatmap.png` | `figures/beat_saliency_long.py:85` | undetermined | `run_all.sh:152` icd; default icd (`:126`). Title "n=264 ECGs", the same n that `RESULTS.md:62` reports for the provisional run. |
| `beat_saliency_long_examples.png` | `figures/beat_saliency_long.py:119` | undetermined | As above. |
| `external_code15_afsr_freq.csv`, `external_code15_afsr_lead.csv`, `external_code15_afsr.png` | `experiments/external_code15.py:91-97` | external | CODE-15 labels from `exams.csv` (`external_code15.py:31-43`). AUROC appears only in the figure title: "AUROC 0.830, n=7968". |
| `external_code15_detect_freq.csv`, `external_code15_detect_lead.csv`, `external_code15_detect.png` | `experiments/external_code15.py:91-97` | external | Figure title: "AUROC 0.980, n=10799". |
| `external_ptbxl_detect_freq.csv`, `external_ptbxl_detect_lead.csv`, `external_ptbxl_detect.png` | `experiments/external_ptbxl.py:93-101` | external | PTB-XL `scp_codes` labels (`external_ptbxl.py:31-51`). Figure title: "AUROC 0.999". `RESULTS.md:51` reports 0.983 (n=3,140) for this task. |
| `external_ptbxl_afsr_freq.csv`, `external_ptbxl_afsr_lead.csv`, `external_ptbxl_afsr.png` | `experiments/external_ptbxl.py:93-101` | external | Figure title: "AUROC 0.823". `RESULTS.md:53` says the afsr task was "superseded (not rerun)" at 0.536; not invoked by `run_all.sh` (only `--task detect`, `run_all.sh:159`). |
| `bttr_vs_bttn.png` | `figures/arch_diagram.py:121` | none | Method schematic, no data (`code/paper.py:22`). |
| `pipeline_overview.png` | `figures/pipeline_overview.py:136` | none | Pipeline schematic, no data (`code/paper.py:21`). |
| `bttn_architecture.png` | none found (no script in `code/` writes this name) | none | Architecture schematic. It shows a "Transformer / MLP head" and "+ optional multi-task", which `code/README.md:7` does not describe. |

Totals: 31 CSV files, 1 TXT file, 15 PNG files (`ls code/results`). No `.npz`, `.npy` or `.pt` files are committed.

### What the gold-label (icd) result files contain, copied exactly

`code/results/table1_cis.csv` (1-yr, 5-seed ensemble, patient-bootstrap CI, n_boot 2000, source `bench_spectral_icd_h365.npz`):

| Line | model | auroc | ci_lo | ci_hi |
|---|---|---|---|---|
| 2 | clinical (age/sex + ECG intervals) | 0.7597 | 0.7488 | 0.7713 |
| 3 | plain BTTR (spectral) | 0.5967 | 0.5824 | 0.6115 |
| 4 | CNN (black-box) | 0.735 | 0.7226 | 0.7469 |
| 5 | conv-BTTN (ECG-only) | 0.7397 | 0.7275 | 0.7517 |
| 6 | conv-BTTN + SSL | 0.7414 | 0.7292 | 0.7536 |
| 7 | conv-BTTN + clinical | 0.7776 | 0.7664 | 0.7888 |
| 8 | conv-BTTN + SSL + clinical (full) | 0.7775 | 0.7664 | 0.7885 |

`code/results/multihorizon_icd_spectral.csv` (one survival model; BTTN_clin is the BTTN + clinical fusion; C-index not stored):

| Line | horizon | n_eval | n_pos | BTTN [lo, hi] | BTTN_clin [lo, hi] | clinical |
|---|---|---|---|---|---|---|
| 2 | 90-day onset (post-blank) | 20000 | 410 | 0.658 [0.632, 0.684] | 0.723 [0.701, 0.745] | 0.71 |
| 3 | 1yr | 19986 | 838 | 0.666 [0.647, 0.684] | 0.727 [0.711, 0.743] | 0.711 |
| 4 | 2yr | 16982 | 1299 | 0.674 [0.659, 0.688] | 0.74 [0.727, 0.753] | 0.727 |
| 5 | 5yr | 11007 | 2425 | 0.676 [0.665, 0.687] | 0.745 [0.735, 0.755] | 0.731 |

`code/results/clin_eval_operating_points.csv` (1-yr, from the gold survival scores; columns copied: model, auroc, ci, flagged_bal, sens, spec, ppv_true, nnm, brier):

| Line | model | auroc | ci | flagged_bal | sens | spec | ppv_true | nnm | brier |
|---|---|---|---|---|---|---|---|---|---|
| 2 | BTTN+clin | 0.726 | [0.710,0.742] | 5% | 0.154 | 0.955 | 0.1307 | 7.7 | 0.039 |
| 3 | BTTN+clin | 0.726 | [0.710,0.742] | 10% | 0.272 | 0.908 | 0.1155 | 8.7 | 0.039 |
| 4 | BTTN+clin | 0.726 | [0.710,0.742] | 20% | 0.461 | 0.811 | 0.0978 | 10.2 | 0.039 |
| 5 | BTTN+clin | 0.726 | [0.710,0.742] | 30% | 0.6 | 0.713 | 0.085 | 11.8 | 0.039 |
| 6 | BTTN | 0.666 | [0.647,0.683] | 5% | 0.123 | 0.953 | 0.1044 | 9.6 | 0.0396 |
| 7 | BTTN | 0.666 | [0.647,0.683] | 10% | 0.232 | 0.906 | 0.0983 | 10.2 | 0.0396 |
| 8 | BTTN | 0.666 | [0.647,0.683] | 20% | 0.387 | 0.808 | 0.0821 | 12.2 | 0.0396 |
| 9 | BTTN | 0.666 | [0.647,0.683] | 30% | 0.514 | 0.709 | 0.0729 | 13.7 | 0.0396 |
| 10 | clinical | 0.708 | [0.692,0.725] | 5% | 0.129 | 0.953 | 0.1094 | 9.1 | 0.0398 |
| 11 | clinical | 0.708 | [0.692,0.725] | 10% | 0.24 | 0.906 | 0.1019 | 9.8 | 0.0398 |
| 12 | clinical | 0.708 | [0.692,0.725] | 20% | 0.428 | 0.81 | 0.091 | 11.0 | 0.0398 |
| 13 | clinical | 0.708 | [0.692,0.725] | 30% | 0.574 | 0.712 | 0.0813 | 12.3 | 0.0398 |

`code/results/risk_strata.csv` (BTTN+clin fusion deciles, 1-yr): decile 0 observed_rate 0.005502751375687844 (n 1999, line 2); decile 9 observed_rate 0.11405702851425713 (n 1999, line 11).

`code/results/cohort_accounting.csv` / `cohort_flow.txt` (source=icd): eligible sinus index patients 151941; excluded prevalent/concurrent AF 14469; excluded inadequate-follow-up controls 88945; excluded onset beyond horizon 7481; binary h365 final positives 1855, final controls 41770; survival final positives 8775; incident events at 1/2/5 yr 1855 / 2828 / 5262; control median follow-up 1601.0 d [880.0, 2559.0]; controls_frac_with_later_ecg 0.981 (`cohort_accounting.csv:2-40`, `cohort_flow.txt:1-42`).

### Status of each manuscript-relevant analysis by label source

| Analysis | Gold-label (icd) committed file | Provisional (ecg) committed file | Status |
|---|---|---|---|
| Table I, 1-yr discrimination ladder (7 methods) with CIs | `table1_cis.csv:2-8` | none committed (`bench_spectral_ecg_h365.npz` named at `RESULTS.md:19` is not in the repo) | gold exists |
| Paired deltas (BTTN vs CNN, vs clinical) with P values | none | none (values only in `RESULTS.md:16,21`) | neither committed |
| 5-yr discrimination ladder (`bench_spectral_icd_h1825.npz`, `run_all.sh:125`) | none (npz not committed, no CSV) | none | neither committed |
| Multi-horizon AUROC (90 d, 1, 2, 5 yr) | `multihorizon_icd_spectral.csv:2-5` | `multihorizon_ecg_spectral.csv:2-5` | both exist |
| C-index | none (printed only, `multihorizon.py:134`) | none (`RESULTS.md:32` only) | neither committed |
| Clinical evaluation (operating points, calibration, decision curve, risk deciles) | `clin_eval_operating_points.csv`, `risk_strata.csv`, `clin_eval.png` | none (`RESULTS.md:41-47` values only) | gold exists |
| Cohort accounting / flow | `cohort_accounting.csv`, `cohort_flow.txt` | none (`RESULTS.md:100-116` values only) | gold exists |
| Faithfulness controls | undetermined: `faithfulness_controls.csv` | undetermined (same file) | label source undetermined |
| Intervention / sufficiency curve | undetermined: `intervention_curve.csv` | undetermined (same file) | label source undetermined |
| Block-structure ablation | undetermined: `ablation_blockstructure.csv` | undetermined (same file) | label source undetermined |
| Block-count (K) sweep | undetermined: `ablation_K.csv` | undetermined (same file) | label source undetermined |
| Substrate map (occlusion importance) | undetermined: `bttn_importance_freq.csv`, `bttn_importance_lead.csv`, `bttn_interpret.png` | undetermined (same files) | label source undetermined |
| Beat-aligned saliency (single and longitudinal) | undetermined: `beat_saliency_segments.csv`, `beat_saliency.png`, `beat_saliency_long_*.png` | undetermined (same files) | label source undetermined |
| Architecture sweep (conv / GRU / deep head) | none | `arch_sweep.csv` | provisional only |
| Single-ECG saliency figure | none | `saliency_ecg.png` | provisional only |
| Longitudinal trajectory (retracted per `code/attic/README.md:9`) | none | `longitudinal.csv`, `longitudinal_trajectory.png`, `longitudinal_trajectory_v2.png` | provisional only |
| Per-patient BTTR and clinical scores | none | `scores_ecg_h365.csv` | provisional only |
| External validation (CODE-15 afsr and detect, PTB-XL detect and afsr) | not applicable (external labels) | not applicable | external files exist; AUROCs only in figure titles |

### Clinical-fusion models (`bttn_cov`, `bttn_ssl_cov`) on gold labels at 1 year

Yes, committed. `table1_cis.csv:7` "conv-BTTN + clinical" (method key `bttn_cov`, `compute_table1_cis.py:36`): 0.7776 [0.7664, 0.7888]. `table1_cis.csv:8` "conv-BTTN + SSL + clinical (full)" (key `bttn_ssl_cov`, `compute_table1_cis.py:37`): 0.7775 [0.7664, 0.7885]. A separate survival-model fusion (BTTN + clinical covariates, `multihorizon.py:105-106`) is in `multihorizon_icd_spectral.csv:3` (1yr BTTN_clin 0.727 [0.711, 0.743]) and `clin_eval_operating_points.csv:2-5` (BTTN+clin 0.726 [0.710,0.742]). No 5-yr gold result for `bttn_cov` or `bttn_ssl_cov` is committed.

### Provisional values in RESULTS.md next to the committed gold values (orientation only; not a manuscript source under C9)

| Quantity | Provisional (`RESULTS.md`) | Gold committed file |
|---|---|---|
| conv-BTTN + SSL, 1-yr AUROC | 0.762 (`RESULTS.md:16`) | 0.7414 (`table1_cis.csv:6`) |
| CNN, 1-yr AUROC | 0.748-0.749 (`RESULTS.md:17`) | 0.735 (`table1_cis.csv:4`) |
| Clinical baseline, 1-yr AUROC | ~0.66-0.69 (`RESULTS.md:10`) | 0.7597 (`table1_cis.csv:2`) |
| Plain BTTR, 1-yr AUROC | 0.628 (`RESULTS.md:11`) | 0.5967 (`table1_cis.csv:3`) |
| Multi-horizon BTTN, 1yr | 0.746 [0.731-0.760] (`RESULTS.md:29`) | 0.666 [0.647, 0.684] (`multihorizon_icd_spectral.csv:3`) |
| Multi-horizon clinical, 1yr | 0.663 (`RESULTS.md:29`) | 0.711 (`multihorizon_icd_spectral.csv:3`) |
| Clinical evaluation, top vs bottom decile 1-yr AF | 18.9% vs 1.3% (`RESULTS.md:44`) | 0.114 vs 0.0055 (`risk_strata.csv:11`, `:2`) |

## Confirmed

All open questions of the draft PCR were answered by Axel. The confirmed values are in `run/settings.md` section "Confirmed by Axel" (`run/settings.md:5-28`), and the decisions taken on his behalf are C1 to C9 (`run/settings.md:30-76`); the checkpoint log is `run/settings.md:78-80`. The PCR table above carries those values. The Format Profile row is omitted because Axel declined a format profile (`run/settings.md:21`, intake Step 5, Invariant 7).

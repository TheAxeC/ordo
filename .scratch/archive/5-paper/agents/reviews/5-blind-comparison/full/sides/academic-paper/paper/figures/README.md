# Figures

Nothing in this directory was rendered or compiled. Under config decision C6 no Python script and no LaTeX compile was run, so `fig1_schematic.pdf` does not exist yet and the layout of Figure 1 has been checked only by reading the code. Paths in the two `.tex` snippets are relative to `paper/`.

| File | Content |
|---|---|
| `fig1_schematic.py` | Plotting code for Figure 1 (BTTN model schematic), pure matplotlib and numpy, no data |
| `fig1_include.tex` | Figure 1 environment; caption copied from the "[GAP-FIG1] **Figure 1.**" paragraph of `paper/phase5/draft_v6.md` (line 107), with the [GAP-FIG1] marker in bold |
| `fig2_include.tex` | Figure 2 environment; caption copied from the "**Figure 2.**" paragraph of `paper/phase5/draft_v6.md` (line 235) |

## Figure 1: BTTN model schematic

- Source: `code/core/bttn.py` (whole file), `code/core/preprocess.py` lines 83-105, `code/core/bench.py` line 30. `code/figures/pipeline_overview.py` was read as a starting point and is unchanged.
- Render (not run): from the repository root, `python paper/figures/fig1_schematic.py`. It writes `paper/figures/fig1_schematic.pdf` (vector PDF, 6.9 x 5.0 in, double column).
- Status: [GAP-FIG1], rendering pending. The caption in `fig1_include.tex` starts with the bold marker "[GAP-FIG1]" and says the figure is filled by rendering the corrected schematic plotting script, which is `paper/figures/fig1_schematic.py`. After rendering, the figure must be viewed for overlapping text before the marker is removed.
- Palette: Tol colorblind-safe categorical colors; every factor and stage also carries a text label, so color is never the only cue. Smallest text is 8 pt.
- The figure holds no result number and no interpretive claim. Its numbers are design constants of the code.

### Corrections of the five mismatches listed for `pipeline_overview.png` (outline, Schematic verdicts)

| Mismatch | Correction in `fig1_schematic.py` |
|---|---|
| (1) Core tensor G_k drawn | No G_k box; stage 3 draws A_k and C_k only and states "no core tensor" (lines 133-143) |
| (2) Only attention pooling drawn | Stage 5 draws softmax attention and max pooling side by side, "concatenated" (lines 176-183) |
| (3) Covariate box omits QT and the three axes | Clinical box lists all nine covariates of `bench.py:30` (lines 218-221) |
| (4) Footer says fusion leaves the factors unchanged | Footer removed; the note states only the structure: the term is added to the log-risk and is not an input to the block-term layer (lines 224-227) |
| (5) "freq F x r_f" label overlaps the C_k drawing | A_k and C_k are drawn apart (x 3.40 and 4.70), each with its own dimension label below it (lines 133-140) |

### Label-to-code-line table

| Figure label (`fig1_schematic.py` line) | Code it depicts |
|---|---|
| "12-lead ECG", 12 traces (91, 99-101) | `preprocess.py:93` loops over the leads of `sig12`; `preprocess.py:103` stacks them as the lead mode |
| "sinus rhythm" (102) | `cohort.py:41,103` index ECG is a sinus ECG |
| "Spectrogram tensor", "log-magnitude STFT" (108, 121) | `preprocess.py:94-95` `spectrogram(..., mode="magnitude")`; `preprocess.py:97` `np.log1p`; `bench.py:58-60` spectral tensor |
| X with modes F, T, L (117-120) | `preprocess.py:84,103` (F, n_time, L); `bttn.py:9` input B x F x T x L |
| "F: 0 to 40 Hz" (122) | `preprocess.py:83` `fmax=40.0`; `preprocess.py:96` `f <= fmax` |
| "T = 40 time frames" (123) | `preprocess.py:83` `n_time=40`; `preprocess.py:99-101` resampling to `n_time` |
| "L = 12 leads" (124) | `preprocess.py:93,103` |
| "Block-term layer, K = 12" (131) | `bttn.py:43,123` `K=12`; `bttn.py:233` `BTTN(F, T, L, K=K)` with `K=12` from `bttn.py:204` |
| A_k, "F x 3" (133-135) | `bttn.py:65` `A` of shape (K, F, rf); `bttn.py:43,123` `rf=3` |
| C_k, "L x 2" (136-138) | `bttn.py:66` `C` of shape (K, L, rl); `bttn.py:43,123` `rl=2` |
| "A_k: frequency", "C_k: lead" (139-140) | `bttn.py:37-38` A_k freq signature, C_k lead signature |
| Z_k = X x_1 A_k^T x_3 C_k^T (141-142) | `bttn.py:80-81` two einsum projections over the frequency and lead modes |
| "no core tensor" (143) | `bttn.py:64-66` only A and C are parameters in block-term mode; `bttn.py:77-83` projection only |
| "72 channels over T" (144) | `bttn.py:59` `ch = K * rf * rl` = 12 x 3 x 2; `bttn.py:83` reshape to (B, ch, T) |
| "Temporal convolution", kernel sizes 3, 7, 15 (151, 153-159) | `bttn.py:43` `ksizes=(3, 7, 15)`; `bttn.py:69-70` one `Conv1d` per kernel size |
| "grouped: 6 filters per channel and kernel size" (160-161) | `bttn.py:43` `ct=6`; `bttn.py:70` `nn.Conv1d(ch, ch * ct, ks, groups=ch)` |
| "BatchNorm, ReLU" (162) | `bttn.py:71,93` |
| "1296 x T output" (163) | `bttn.py:67` `ch_out = ch * ct * len(ksizes)` = 72 x 6 x 3 |
| "Pooling over time", "softmax attention" (176-179) | `bttn.py:72` 1x1 conv attention scores; `bttn.py:94` softmax over the time axis; `bttn.py:95` weighted sum |
| "max" (181) | `bttn.py:95` `z.amax(-1)` |
| "concatenated: 2592 features" (182-183) | `bttn.py:100` `torch.cat([z_att, z_max], dim=1)`; `bttn.py:103` `out_dim = 2 * ch_out` |
| "MLP head", "Linear 256, ReLU", "Linear 128, ReLU", "Linear 1" (189-192) | `bttn.py:123` `hidden=256`; `bttn.py:152-156` default head (`deep_head=False`) |
| "(BatchNorm, dropout)" (193) | `bttn.py:153-155` BatchNorm1d and Dropout, `p=0.4` from `bttn.py:123` |
| "ECG log-risk eta_ECG" (194) | `bttn.py:175` `out = self.head(f).squeeze(-1)` |
| "+" node (197-201) | `bttn.py:176-177` `out = out + self.cov(cov).squeeze(-1)` |
| "log-risk eta = eta_ECG + w^T c" (207-208) | `bttn.py:176-177` |
| "Cox partial-likelihood loss", "(within-batch risk sets)" (209-210) | `bttn.py:181-187` `cox_ph_loss`; `bttn.py:270-271` training loss on the summed output |
| "one score; risk at any horizon" (211) | `bttn.py:171-178` scalar output; `bttn.py:181-187` loss uses time and event, no horizon argument |
| "Clinical covariates c (9)" and the nine names (218-221) | `bench.py:30` `CLIN_COLS`; `bench.py:107-115` passed as `cov_tr`, `cov_te` |
| "linear term w^T c (no bias)" (222) | `bttn.py:133` `nn.Linear(cov_dim, 1, bias=False)` |
| "added to the log-risk; not an input to the block-term layer" (224-226) | `bttn.py:169,172` features come from the block layer on `x` only; `bttn.py:176-177` covariates enter after the head |
| "(models with clinical term only)" (227) | `bttn.py:132-133` `cov_dim=0` by default; `bench.py:107` only `bttn_cov` and `bttn_ssl_cov` pass covariates |

## Figure 2: calibration, decision curve, risk deciles

- Source: `code/results/clin_eval.png`, an admitted gold-label file (config C1), written by `code/experiments/clin_eval.py` lines 85-109 from the gold ICD-10 scores (`clin_eval.py:5,21`). Used as is (outline evidence row E42).
- Render: nothing to render; the snippet includes the committed PNG. The command that produced it is `python code/experiments/clin_eval.py` (not run).
- The caption is the manuscript caption from `paper/phase5/draft_v6.md` line 235. Its content matches the image and the script: left panel reliability curves per decile of predicted risk with an identity line (`clin_eval.py:88-94`); middle panel decision curves with treat-all and treat-none (`clin_eval.py:96-103`); right panel observed rate per decile of BTTN + clinical risk with the evaluation-set event rate as dashed line (`clin_eval.py:80-83,105-108`). The two method facts in the caption are design facts from the code, not results: "two-fold" cross-fitted Platt scaling (`clin_eval.py:37-44,55`) and Brier scores "rounded to three decimals" (`clin_eval.py:92`).
- The dashed line in the right panel ("cohort prev 0.04") is the prevalence of the evaluation set (`clin_eval.py:29,106`), not the natural one-year incidence used for PPV in Table 4 (`clin_eval.py:33`).

## Figure/Table trace

```yaml
figure_table_trace:
  - artifact_id: "fig-1"
    source_data: {dataset_id: "none (schematic)", file: "code/core/bttn.py; code/core/preprocess.py:83-105; code/core/bench.py:30"}
    transformation: {script: "paper/figures/fig1_schematic.py", hash: "not computed"}
    caption_claim: "BTTN structure: spectrogram tensor, K = 12 blocks with A_k (F x 3) and C_k (L x 2) and no core tensor, grouped temporal convolutions (3, 7, 15), attention and max pooling, MLP head (256, 128, 1), additive linear clinical term outside the block-term layer, Cox partial-likelihood loss"
    supported_manuscript_claims:
      - {claim: "The clinical term is added to the ECG log-risk and does not enter the block layer or the block scores", locator: "Methods 3.5"}
    limitations: ["Not rendered (C6); text overlap has been checked only by reading coordinates", "ECG traces are a synthetic drawing"]
  - artifact_id: "fig-2"
    source_data: {dataset_id: "MIMIC-IV-ECG, gold ICD-10 labels, one-year", file: "code/results/clin_eval.png"}
    transformation: {script: "code/experiments/clin_eval.py", hash: "not computed"}
    caption_claim: "One-year calibration, clinical utility and risk gradient of BTTN + clinical, BTTN and the clinical Cox model after two-fold cross-fitted Platt scaling"
    supported_manuscript_claims:
      - {claim: "Calibration and net benefit of the three models at one year", locator: "Results 4.4"}
      - {claim: "Observed one-year AF rate from the lowest to the highest BTTN+clin risk decile", locator: "Results 4.4"}
    limitations: ["Right-panel dashed line is the evaluation-set prevalence, not the natural incidence", "AUROCs behind these probabilities are bootstrap means on Platt-calibrated scores and differ slightly from Table 3"]
```

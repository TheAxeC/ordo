# Figures

All three planned figures of `outline.md` are placed as the committed images under `code/results/`. Under settings.md Decisions ("Figures"), no script was written or run and nothing was drawn: each image was copied into `figures/` of the run folder with `cp` and checked with `cmp` (all three reported identical), then read with the Read tool and checked against its source data and its producing script, both read as text. Every failure that only a rerun of the producing script would fix is recorded under the figure as a remaining issue. Each figure's status is NEEDS_REVIEW for that reason.

## Figure numbering

Numbers follow the order of first mention that the outline plans (Method 3.1, Results 5.3, Results 5.4).

| Number | Label | Producing script (not run) | Image in the run folder |
|---|---|---|---|
| 1 | `fig:bttr-to-bttn` | `code/figures/arch_diagram.py` | `figures/bttr_vs_bttn.png` |
| 2 | `fig:clinical-utility` | `code/experiments/clin_eval.py` | `figures/clin_eval.png` |
| 3 | `fig:beat-saliency` | `code/figures/beat_saliency.py` | `figures/beat_saliency.png` |

## Names

| Run-folder name | Name in the manuscript folder | sha256 of the copy (equal to the committed image) |
|---|---|---|
| `figures/bttr_vs_bttn.png` | `figures/fig-bttr-to-bttn.png` | `9f4a958bc2b36d3f0a00fdf7888ba8826c762ca049834d28ee91101cdf07f781` |
| `figures/clin_eval.png` | `figures/fig-clinical-utility.png` | `1ebe7f3e2d8aedd2ea6c1a45937cb264246f7511d66a80501492013774e59b99` |
| `figures/beat_saliency.png` | `figures/fig-beat-saliency.png` | `e1147de200b1873309401bbb33b19f8b067ed784cc22ba5b21b10972bf63a5b1` |

The manuscript folder holds `refs.bib` (with `main.tex` and `cover-letter.tex` being written) and has no `figures/` folder, so none of the three names collides with a file there.

Files outside the run folder changed: none. No PDF version exists for any figure, since producing one needs a script; the environments include the PNG.

## Figure 1

- Artifact: `fig-bttr-to-bttn.png`, Figure 1
- Source data: none. The image is a method schematic and plots no data (`code/results/bttr_vs_bttn.png`, committed; `arch_diagram.py` reads no data file). Its content was checked against `code/core/bttn.py` lines 36 to 100 and 119 to 178.
- Script: none run. Producing script `code/figures/arch_diagram.py`, sha256 `3786122314dd2d1dd2d796622424d691600bc45c56843eed217aad94e1078999`, not run (settings.md Decisions, "Figures"). Image copied with `cp` and checked with `cmp`.
- Caption claim: BTTR [Faes_2024] decomposes its input into blocks of two factor matrices, a core and a static score vector, fitted by deflation, with a linear score; BTTN projects the frequency by time by lead spectrogram tensor onto a frequency factor and a lead factor in each of 12 blocks, filters along time with learned kernels of three widths, pools each channel along time by attention and by maximum, and gives a log-risk through a nonlinear head, trained with a Cox objective; the clinical term is added to the log-risk outside the block-term layer and is not drawn.
- Claims in the manuscript:
  - The frequency and lead factors of BTTN are parameters on the predictive path and are readable by construction (`arguments.md`, sub-argument 1, Reasoning; outline 3.1 and 3.3).
  - BTTN keeps the block structure of BTTR and replaces the static score vector by learned temporal kernels, the linear score by pooling and a nonlinear head, and least squares by a Cox objective (outline 3.1).
- Limitations:
  - The image labels the pooling box "attention over blocks". In every reported run the block-term layer pools each channel along time by an attention-weighted sum and by its maximum (`core/bttn.py` lines 93 to 100, `head_type="mlp"`); pooling over blocks belongs to the transformer head (line 168), which no reported result uses. The caption states the pooling of the reported model.
  - The image names BTTR "Faes 2022", the online year of the article the reference list holds as Faes_2024. The caption cites Faes_2024 and says the image uses the online year.
  - The image reads "Cox survival risk 1 / 2 / 5 yr", while the paper reports four horizons (90 days, 1, 2 and 5 years). The caption calls the risk curve schematic and refers the horizons to the text.
  - The footer of the image calls the factors "glass-box maps" and the BTTR panel carries a check mark next to "interpretable block maps". These are the image's words; the caption makes no faithfulness claim.
  - The committed image was written by an earlier text of `arch_diagram.py`: the image holds a check mark, arrows and an em dash, while the committed script holds "(yes)", "to", "becomes" and a colon at the same places and has no non-ASCII character (`LC_ALL=C grep -c '[^ -~]'` prints 0). The differences are in these characters only, as far as the two texts can be compared by reading.
- Verification: NEEDS_REVIEW, 0 renders (the committed image, read once with the Read tool)
  - Issues found:
    - Check 1, 2, 3 (axis labels, units, legend): not applicable, a schematic without axes or series.
    - Check 4 (caption): written below.
    - Check 5 (colour): the colours (`#c0392b`, `#2e6da4`, `#27ae60`, `#7d5ba6`, `#e74c3c`, light fills) are not this page's palettes. The red and green elements also differ by shape and label, so no element depends on colour alone.
    - Check 6 (font size): fails. The image is 3021 px wide at 160 dpi (18.9 in, `savefig(..., dpi=160, bbox_inches="tight")`). At a text width of 6.9 in it is scaled by about 0.37, so the 9.2 pt footer prints at about 3.4 pt, the 7.5 pt dimension labels at about 2.7 pt, the 7 pt "score vector" and "conv along time" labels at about 2.6 pt and the 12.5 pt row titles at about 4.6 pt. The sizes are those of the committed script text and are an estimate for the image.
    - Check 7 (resolution): passes, about 438 dpi at 6.9 in.
    - Check 8 (dimensions): placed at `\textwidth`; aspect about 1.9:1.
    - Check 9 (data accuracy): no data. Content against `core/bttn.py`: the frequency factor $A_k$ (F by $r_f$) and lead factor $C_k$ (L by $r_l$) agree with `BlockTermLayer` (`rf=3`, `rl=2`, line 43); the multi-scale temporal kernels agree with `ksizes=(3, 7, 15)`; the pooling box disagrees (see Limitations).
    - Check 10 (chart junk): the cubes are drawings of a three-way tensor, not a 3D data chart. The ALL-CAPS "STRUCTURE" and "WHAT CHANGES", the check mark and the footer band are decoration a rerun would remove.
    - Rendered check 8: the dimension label of each red factor ("$I_3 \times R^k_3$" in the top row, "freq $F \times r_f$" in the bottom row) is drawn under the blue factor and is partly hidden in all four blocks.
  - Issues fixed: none (no script may run).
  - Remaining issues: text below 8 pt throughout; partly hidden dimension labels of the red factors; the pooling label "attention over blocks"; the year "2022"; the horizons "1 / 2 / 5 yr"; colours outside the page's palettes; ALL-CAPS words and the check mark. The caption corrects the pooling, the year and the horizons and names $\mathbf{A}_k$ as the frequency factor, which restores the hidden label of the bottom row. The fix of the image itself is a rerun of `figures/arch_diagram.py` with the pooling box relabelled, which settings.md Decisions names for the final message.

## Figure 2

- Artifact: `fig-clinical-utility.png`, Figure 2
- Source data: gold ICD-10 survival-design scores, `multihorizon_icd_spectral.npz` (not committed), as plotted by `code/experiments/clin_eval.py` line 21; the plotted values were checked against `code/results/risk_strata.csv` (sha256 `6d29ad583ee634df867183f95892cd4bbd03a603a90547393daf2e22fd7e7e87`) and `code/results/clin_eval_operating_points.csv` (sha256 `e909640535d528db24452aa1896232953bf8dff4057ba8951ed8bc2564664bd1`).
- Script: none run. Producing script `code/experiments/clin_eval.py`, sha256 `a1d5a6d93f7c2662bc9f31533be0f75df9210a2bb5d0e8d0f9882e0f243401a5`, not run (settings.md Decisions, "Figures"). Image copied with `cp` and checked with `cmp`. The image's titles, legend labels and size (2100 by 630 px, `figsize=(15, 4.5)`, `dpi=140`) agree with the committed script text.
- Caption claim: the figure shows one-year calibration, decision curves and observed AF by risk decile for the fused model, the ECG-only BTTN and the clinical model in 19,986 patients of the survival design with 838 one-year cases, after two-fold cross-fitted logistic recalibration. The caption makes no comparative claim.
- Claims in the manuscript:
  - The fused model is calibrated after recalibration (`arguments.md`, sub-argument 3; outline 5.3).
  - Observed one-year AF rises from 0.55 percent in the lowest decile of the fused model to 11.4 percent in the highest, with mean predicted 0.61 and 12.3 percent (sub-argument 3, Evidence; outline 5.3).
  - The deciles have one inversion, 4.95 against 4.15 percent (sub-argument 3, Counter-argument; outline 5.3). In the image these are deciles 5 and 6, numbered from 0; the text's "sixth and seventh deciles" are the same bars.
  - The decision curve separates the models only at low thresholds (sub-argument 3, Counter-argument; outline 5.3, "describe the decision curve qualitatively from the figure"). Read from the middle panel: the treat-all curve falls below zero near a threshold of 0.04; the three model curves lie above both references from about 0.04 to about 0.10, with the fused model's curve slightly above the other two between about 0.05 and 0.12; above about 0.12 all three are close to zero, and the clinical model's curve lies slightly below zero above about 0.15. No net-benefit number is in a committed file, so these thresholds are readings of the image.
- Limitations:
  - Recalibration is fitted on the evaluation sample with two-fold cross-fitting (`clin_eval.py` lines 37 to 44), as the counter-argument of sub-argument 3 states.
  - Net benefit and the dashed reference line of the right panel use the sample's one-year AF proportion, 838 of 19,986 (`prev = y.mean()`, line 29), while PPV and number needed to monitor in the CSV use the cohort incidence 1,855 / 43,625 (line 33). The image labels the line "cohort prev 0.04"; the caption names it the sample's proportion.
  - The calibration bins of the ECG-only BTTN and the clinical model are in no committed file, so only the fused model's points were checked against a file.
  - Image legend names ("BTTN+clin", "BTTN", "clinical") differ from the paper's fixed terms; the caption maps each.
- Verification: NEEDS_REVIEW, 0 renders (the committed image, read once with the Read tool)
  - Issues found:
    - Check 1 (axis labels): the middle panel has no y-axis label (net benefit is in its title only); the left panel's "predicted" and "observed" do not name the quantity.
    - Check 2 (units): no axis states its unit (all are proportions).
    - Check 3 (legend): present in all three panels.
    - Check 5 (colour): matplotlib default blue, orange and green and a crimson bar fill, not this page's palettes. In the left and middle panels the three models differ by colour only (same circle marker, same solid line), and orange against green is hard to tell apart for red-green colour blindness.
    - Check 6 (font size): fails. At a text width of 6.9 in the 15 in figure is scaled by 0.46, so tick and axis labels (10 pt) print at about 4.6 pt, legends (8 pt) at about 3.7 pt and panel titles (12 pt) at about 5.5 pt.
    - Check 7 (resolution): passes, about 304 dpi at 6.9 in.
    - Check 8 (dimensions): placed at `\textwidth`; aspect 10:3, set by the three panels in one row.
    - Check 9 (data accuracy): passes against the files. The ten bars of the right panel equal `observed_rate` of `risk_strata.csv` (0.0055, 0.0080, 0.0115, 0.0235, 0.0280, 0.0495, 0.0415, 0.0585, 0.0791, 0.1141); the decile sizes in `n` sum to 19,986, and $n \times$ `observed_rate` per decile (11, 16, 23, 47, 56, 99, 83, 117, 158, 228) sums to 838, the one-year `n_pos` of `multihorizon_icd_spectral.csv`. The fused model's ten calibration points sit at (`mean_pred`, `observed_rate`) of the same file, from (0.006, 0.0055) to (0.123, 0.114). The legend's Brier values (0.039, 0.040, 0.040) are the CSV's 0.039, 0.0396 and 0.0398 rounded to three decimals. The same numbers in `arguments.md` (0.55 and 11.4 percent, mean predicted 0.61 and 12.3 percent, 4.95 and 4.15 percent, Brier 0.039 and 0.0398) agree.
    - Check 10 (chart junk, pitfalls): the calibration points carry no confidence intervals (pitfall "missing error bars").
  - Issues fixed: none (no script may run).
  - Remaining issues: text below 8 pt; colour as the only difference between the three models in two panels, with colours outside the page's palettes; no y-axis label in the middle panel; no units; no intervals on the calibration points; the "cohort prev" label. The caption names each model's colour, says that colour is the only difference, names the middle panel's y quantity, states that the values are proportions, states that no intervals are drawn and names the reference line. A rerun of `experiments/clin_eval.py` with these changes is the fix of the image.

## Figure 3

- Artifact: `fig-beat-saliency.png`, Figure 3
- Source data: the gold ICD-10 survival design (`code/results/cohort_icd_survival.csv`), as read by `code/figures/beat_saliency.py` (line 55, default `--source icd`, line 118; `run_all.sh` line 151 passes `--source icd`); the image was checked against `code/results/beat_saliency_segments.csv` (sha256 `d72501c38f5b73e5aef06d58f8a554f4ab0a05891e47d7cf2345bdc6216d0a0c`), which the same function writes in the same run (lines 87 to 94 and 97 to 111). The per-window values (`beat_saliency.npz`, line 86) are not committed.
- Script: none run. Producing script `code/figures/beat_saliency.py`, sha256 `01e60c5c3d690fb8549219a6f78e7c079abc601d155c69fa833de7018644f35c`, not run (settings.md Decisions, "Figures"). Image copied with `cp` and checked with `cmp`.
- Caption claim: the figure shows, per lead and per 25 ms window aligned to the R peak, the mean drop in the ECG-only BTTN's predicted risk when that window is set to zero in every beat, divided by a regularised mean energy removed, over the 120 highest-risk ECGs of patients with incident AF, overlaid on the mean median beat; it describes the fitted model's response and is not an effect on AF risk.
- Claims in the manuscript:
  - Per unit of signal energy, the response of the ECG term to beat-aligned occlusion is highest in the PR window and lowest in the QRS window (`arguments.md`, sub-argument 4; outline 5.4). The window means come from `beat_saliency_segments.csv`; the figure shows the per-lead, per-window values those means summarise.
  - Raw occlusion is dominated by the high-energy QRS complex, and the energy-normalised profile is what the figure shows (sub-argument 4, Reasoning; outline 5.4). The figure shows only the energy-normalised values.
- Limitations:
  - The energy normalisation is not a plain division. `beat_saliency.py` line 84 computes `np.clip(SAL, 0, None) / (ENG + ENG.mean() * 0.1 + 1e-9)`: the mean risk drop over the 120 ECGs, with a negative mean set to zero, divided by the mean energy removed plus one tenth of that energy averaged over all leads and windows. Outline 4.3 says "the drop is divided by the signal energy removed"; the text of 4.3 should state the added term, and the caption states it.
  - The shading has no colour scale. Depth is $0.6 \times$ the value divided by the largest value over all leads and windows, and windows below 3 percent of the largest value are not shaded (lines 99 to 106), so magnitudes cannot be read from the image.
  - The P, PR, QRS, ST and T windows of `SEG` (line 21) are not marked in the image, although the script's docstring says they are. The caption gives their offsets.
  - The 120 ECGs are the highest-risk ECGs of patients with an event in the sample the model was trained on (lines 60 to 79), taken in order of risk and passing over ECGs that could not be read or had fewer than three detected R peaks. The model is one ECG-only BTTN with seed 0.
  - The mean median beat is drawn from each lead scaled to a maximum absolute value of 1 (`clean`, `core/preprocess.py` lines 46 to 59), and the panels have no vertical scale; R peaks are detected in lead II only (line 26).
  - The image title reads "red = drives future-AF risk per unit signal energy". "Drives" is a word `arguments.md` bars for this result. The caption states that the shading is the fitted model's response to occlusion and is not an effect on AF risk.
  - The committed image was written by an earlier text of `beat_saliency.py`: its title holds an em dash where the committed script (line 109) has a colon, and the committed script has no non-ASCII character (`LC_ALL=C grep -c '[^ -~]'` prints 0). The gold ruling of `outline.md` (row "Energy-normalised and raw occlusion by window") rests on the committed script's default `--source icd` and on `run_all.sh` line 151; it covers the image on the reading that the edit changed characters only. The project's git history has one commit (`git log` prints `6d4666b input`), so the earlier text cannot be read.
  - `RESULTS.md` (line 62) describes a run of the same analysis with other values (raw QRS 0.0126; energy-normalised P 0.0008, PR 0.0008, QRS 0.0006, ST and T 0.0004). The committed CSV holds raw QRS 0.0232 and energy-normalised PR 0.00216, ST 0.00157, P 0.00152, T 0.00127, QRS 0.00086. In the image the ST windows (centres 50 to 125 ms) are shaded at least as deep as the QRS windows in leads I, aVR, aVL and aVF, which agrees with the CSV's ordering and not with the ordering in `RESULTS.md`. This is a reading of shading depth, not an exact comparison.
- Verification: NEEDS_REVIEW, 0 renders (the committed image, read once with the Read tool)
  - Issues found:
    - Check 1 (axis labels): the shared x axis is labelled "time relative to R-peak (ms)"; the panels have no y-axis label or ticks.
    - Check 2 (units): x in ms; y has none (normalised amplitude).
    - Check 3 (legend and scale): no colour scale for the shading.
    - Check 5 (colour): one hue (crimson) at varying opacity, not one of this page's palettes; a sequential single-hue scale keeps its order in grayscale.
    - Check 6 (font size): fails. At a text width of 6.9 in the 15 in figure is scaled by 0.46, so the lead names (8 pt) print at about 3.7 pt, tick labels (10 pt) at about 4.6 pt, the x-axis label (12 pt) at about 5.5 pt and the title (11 pt) at about 5.1 pt. The sizes are those of the committed script text and are an estimate for the image.
    - Check 7 (resolution): passes, about 304 dpi at 6.9 in.
    - Check 8 (dimensions): placed at `\textwidth`; aspect 5:3.
    - Check 9 (data accuracy): consistent in ordering, not verifiable exactly. The title's "mean of 120" agrees with `N_ECG = 120`; the twelve panels follow `config.LEAD_NAMES` down the columns (I, II, III, aVR; aVL, aVF, V1, V2; V3 to V6); windows run from about $-362$ to $437$ ms, which agrees with centres every 25 ms from $-350$ to $425$ ms. The deepest shading lies in the PR window (centres $-125$ to $-75$ ms) in leads III, aVF and V1, and the QRS windows are shaded lightly in most leads, in line with the CSV's PR 0.00216 and QRS 0.00086. The per-window values are not committed and the shading has no scale, so no exact comparison is possible.
    - Check 10 (chart junk): none; the dotted line marks 0 ms.
  - Issues fixed: none (no script may run).
  - Remaining issues: text below 8 pt; no colour scale; no vertical scale; the P to T windows not marked; the word "drives" and an em dash in the image title. The caption gives the scaling of the shading, the vertical scaling, the window offsets and the reading of the shading. A rerun of the plotting part of `figures/beat_saliency.py` with a corrected title, marked windows and a colour scale is the fix of the image.

## LaTeX environments

The preamble needs `\usepackage{graphicx}`. No venue template is held, so the captions take the standard form below the figure. The manuscript is taken as one column, so `\textwidth` is the full text width and no caption note about a double-column width applies. `\cite` stands for the citation command the draft uses for Vancouver.

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=\textwidth]{figures/fig-bttr-to-bttn.png}
    \caption{Linear block-term tensor regression (BTTR) and the block-term tensor network (BTTN). Top row: BTTR \cite{Faes_2024}, labelled in the image with the online year of that article, splits the input tensor into blocks. Each block has two factor matrices, a core $\mathbf{G}_k$ and a static score vector $\mathbf{t}_k$. The blocks are fitted by deflation and give a linear score. Bottom row: BTTN takes the frequency by time by lead spectrogram tensor of one ECG. In each of $K = 12$ blocks it projects the tensor onto a frequency factor $\mathbf{A}_k$ and a lead factor $\mathbf{C}_k$, then filters along time with learned kernels $\Psi_k$ of three widths. In the reported model, the box labelled ``attention over blocks'' pools each channel along time by an attention-weighted sum and by its maximum. A nonlinear head maps the pooled values to a log-risk, and the network is trained end to end with a Cox survival objective. The clinical term is not drawn. It is a linear function of age, sex and ECG intervals, added to the head's log-risk without passing through the block-term layer. The risk curve is schematic; the text states the horizons at which the risk is evaluated.}
    \label{fig:bttr-to-bttn}
\end{figure}
```

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=\textwidth]{figures/fig-clinical-utility.png}
    \caption{One-year calibration, decision curves and risk deciles of the fused model (BTTN+clin, blue), the ECG-only BTTN (BTTN, orange) and the clinical model (clinical, green). The sample is the 19,986 patients of the survival design who had incident AF within one year or were followed for more than one year; 838 had AF within one year. Each model's risk score was converted to a probability by logistic recalibration with two-fold cross-fitting. Probabilities, AF rates and net benefit are given as proportions. Left: observed against mean predicted one-year AF in ten equal-count bins of each model's probability, with the dashed line marking equal values. Brier scores in the legend are rounded to three decimals. Middle: net benefit (vertical axis) against threshold probability, at the sample's one-year AF proportion, with treat-all (dotted) and treat-none (dashed) references. In the left and middle panels the three models differ by colour only. Right: observed one-year AF proportion in each decile of the fused model's probability, numbered 0 (lowest) to 9 (highest). The dashed line, labelled ``cohort prev'' in the image, marks the sample's one-year AF proportion. Points and bars carry no confidence intervals.}
    \label{fig:clinical-utility}
\end{figure}
```

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=\textwidth]{figures/fig-beat-saliency.png}
    \caption{Response of the ECG-only BTTN to beat-aligned occlusion, as the mean over 120 ECGs. The model was trained on the sample of the survival design. The ECGs are those of patients with incident AF to which the model gave the highest risk, passing over ECGs that could not be read or had fewer than three detected beats. Each panel shows one lead. The black trace is the mean of the ECGs' median beats, with each lead scaled to a maximum absolute amplitude of 1; the vertical scale is not shown. Time is relative to the R peak detected in lead II (dotted line). Windows of 25~ms are centred every 25~ms from 350~ms before to 425~ms after the R peak. For each window, the window was set to zero in every beat of one lead, the spectrogram was rebuilt and the drop in predicted risk was recorded. Shading depth shows the mean drop, with a negative mean set to zero, divided by the mean signal energy removed plus one tenth of that energy averaged over all leads and windows. Depth is relative to the largest value in the figure, and windows below 3 percent of it are not shaded. The P, PR, QRS, ST and T windows of the text group the windows centred 230 to 130~ms before the R peak, 130 to 50~ms before, 50~ms before to 50~ms after, 50 to 150~ms after, and 150 to 400~ms after. The shading describes the response of the fitted model to occlusion and is not an effect on the risk of AF.}
    \label{fig:beat-saliency}
\end{figure}
```

## Not drawn

None. Each of the three planned figures is placed as its committed image.

## Points for the session and the draft writer

- Outline 4.3 describes the energy normalisation as a division by the signal energy removed. The producing script divides the mean risk drop, with a negative mean set to zero, by the mean energy removed plus one tenth of that energy averaged over all leads and windows (`code/figures/beat_saliency.py` line 84). The first draft states the added term (`main.tex` line 151), as the caption of Figure 3 does.
- The images `bttr_vs_bttn.png` and `beat_saliency.png` were written by earlier texts of their scripts, which differ from the committed texts at least in non-ASCII characters (Figure 1 and Figure 3, Limitations). The gold ruling for `beat_saliency_segments.csv` and `beat_saliency.png` in `outline.md` rests on the committed script text.
- Figure 2 numbers its deciles 0 to 9; the "sixth and seventh deciles" of outline 5.3 are its bars 5 and 6.
- Each image's text is below 8 pt at text width. Only a rerun of the producing scripts fixes the image text, which settings.md Decisions excludes for this run.

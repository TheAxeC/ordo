**Verdict: A.** Output A is a complete manuscript that could be submitted once the authors fill in their own details. Output B is not: its results section is held open by placeholders for scientific results, which the user had reserved for facts only the authors hold. A does have one serious accuracy defect, which B handles correctly. It is listed below.

## What I checked

- **Both manuscripts, read in full:** `outputs/output-A/manuscript/main.tex` and `outputs/output-B/run/final/manuscript.tex`, plus both final messages.
- **The gold-label result files:** `table1_cis.csv`, `multihorizon_icd_spectral.csv`, `clin_eval_operating_points.csv`, `risk_strata.csv`, `cohort_accounting.csv`, `cohort_flow.txt` and `beat_saliency_segments.csv`. Every number in both manuscripts' tables matches these files.
- **Where the files came from:** `run_all.sh:135-137,151` runs every analysis with `--source icd`. However, `hpc/analyses_jobs.slurm:56,60,64` runs the faithfulness, intervention and ablation scripts with `--source ecg`, and those output files carry no source tag. Both outputs were right not to treat those three files as gold.
- **The covariate defect:** a search of `cohort_icd_h365.csv` for a P-wave duration (column 11) of 2xxxx returns 819 rows, with values such as 29630 and 29667 ms. `core/cohort.py:44` computes `p_dur = p_end - p_onset` without recoding the missing-value codes first.

## Critical failures, output A

1. **The missing-value codes are not disclosed.** `main.tex:132` says "a missing value is replaced by the training mean". In fact, 819 of the 17,855 rows (4.6%) enter with a P-wave duration near 29,600 ms. This affects the clinical model, the fused model and the clinical Cox model, which carry the headline comparison. The Limitations (`main.tex:332-342`) never mention it, so the methods description misleads the reader.
2. **The occlusion results are held to a looser provenance standard than the faithfulness results.** `main.tex:282` and Table 5 report `beat_saliency_segments.csv`, a file with no source tag. Only `run_all.sh:151` (`--source icd`) supports it; no log does. A excluded the faithfulness files for exactly this reason and accepted this one.
3. **Figure 1's image text does not match its caption.** A's own final message (RI1.18) admits this, and the caption at `main.tex:114` works around it ("the box labelled 'attention over blocks' ...").
4. **The paper's length is not verified.** A's final message reports 36 preprint pages. I ran no word count.

## Critical failures, output B

1. **Scientific results are left as placeholders, against the user's instruction.** The paper's research question includes "whether those signatures are faithful" (`manuscript.tex:82`). Yet the abstract ends "Faithfulness results are held at [GAP-FT1 to GAP-FT5]" (line 38). Results <section sign>4.5 (lines 334-358) is five placeholder items with empty Tables 5-6 and Figures 3-4. The external analyses are empty (lines 365-372). The paired differences, [GAP-C4], are missing in Table 2 and line 234. B's own final message counts 49 [GAP] markers. Filling the author facts would not make this paper submittable; it needs new analysis runs.
2. **The highlights and Methods promise results the paper does not give.** Line 49 reads "Five faithfulness analyses test whether the block signatures track the model", and Methods <section sign>3.8 (lines 163-175) specifies analyses with no results.
3. **Figure 1 is missing.** Lines 135-138 hold [GAP-FIG1], and the only included figure points outside the output folder (`../../code/results/clin_eval.png`, line 298).
4. **One literature claim is shaky.** Line 74 says "no ECG study with a quantitative faithfulness evaluation was found". A cites a quantitative ECG attribution study (Arends 2026). I did not open that saved page, so this is a judgment, not a check.

## Citation checks against the saved pages

- **Output A:**
  - Zenodo 22227432 (page-155): it is the BTTR AF-in-sinus-rhythm preprint, as cited at `main.tex:94`.
  - arXiv 2511.04292 (page-071): it contains 91.25, 64.52 and 61.00, matching `main.tex:88,94`.
  - Hooker et al. on NeurIPS (page-163): it names VarGrad, SmoothGrad and "random assignment", matching `main.tex:84`.
- **Output B:** Koh et al. on PMLR (page-160) mentions x-ray grading, bird identification and "competitive" accuracy, matching line 96.
- **Unchecked:** many publisher DOI pages could not be checked. For example, page-110 (Valasakis, the "65.4% of 700" figure) has no abstract text in the saved file.
- **No mismatches** turned up in the pages I checked.

## Reasons

- **A is a whole paper.** It narrows its claims to what the gold files support: accuracy, horizons, calibration and the occlusion profile. It drops the faithfulness claim explicitly (`main.tex:139,342`) and fills every section and figure. Its comparisons are stated honestly, for example "no interval for the difference yet establishes it" (`main.tex:357`).
- **B falls short of the request.** It keeps faithfulness as a stated aim and then leaves it unanswered. That fails the requirement that the authors could submit after filling only their own facts.
- **B does beat A on one point.** It discloses the 819-row P-wave defect and the anchor-age approximation (`manuscript.tex:114,410`), which A omits.
- **On balance A wins.** A's defect can be fixed by adding one limitation sentence, or later by a rerun. B's defect requires new analyses before the paper exists.

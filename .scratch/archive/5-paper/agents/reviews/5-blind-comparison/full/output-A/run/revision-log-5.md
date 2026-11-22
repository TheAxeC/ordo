I wrote both patches and applied neither. Each of RI5.1 to RI5.7 is answered by at least one op. RI5.8 and every issue marked "needs the user" are left unchanged.

- **main.tex:** `/work/run/patches/16-main.tex.edits.json` has 7 ops on 7 of the 115 blocks. It changes no heading, so it is not structural.
- **cover-letter.tex:** `/work/run/patches/17-cover-letter.tex.edits.json` has 1 op. The whole `letter` environment is one block (B0006), so the op rewrites that block whole. Only the first Key findings sentence changes.

## Revision log

| # | Source | Severity | Feedback | Section | Action taken | Status | Reason |
|---|---|---|---|---|---|---|---|
| RI5.1 | Review 5 (C1) | Minor | "Over 50 years of the same cohort" ties the trends to the sample of Wolf_1991 | 1.1, first paragraph | 16/OP001 (B0013): now reads "Over 50 years of the Framingham Heart Study, the age-adjusted prevalence ..." in the wording of C1. The citation is kept. | RESOLVED | none |
| RI5.2 | Review 5 (C2) | Minor | The sentence implies the 0.996 was measured on MIMIC-IV-ECG | 6.1, second paragraph, last sentence | 16/OP007 (B0081): now reads "So does AF diagnosis from the ECG: a foundation model reported an AUROC of 0.996 for the AF label of multi-label ECG interpretation, and its authors released an open benchmark on MIMIC-IV-ECG \cite{McKeen_2025}." This is the C2 wording. | RESOLVED | none |
| RI5.3 | Review 5 (C5) | Minor | The 14,469 is given without its criterion | 5.1, Table 1 caption | 16/OP003 (B0062): two sentences added to the caption: "Prevalent or concurrent AF counts the patients with an AF diagnosis, or an ECG read as AF, before the end of the 30-day blanking window after the index ECG. These patients were excluded, and the count is not an outcome." The row label, the table body and 4.1 are unchanged. | RESOLVED | none |
| RI5.4 | Review 5 | Minor | "read from one survival model" reads as one fit | 6.1, first paragraph | 16/OP006 (B0080): now reads "at four horizons, read from the same cross-validated risks." | RESOLVED | none |
| RI5.5 | Review 5 | Minor | Three method sentences open a Results paragraph | 4.2 and 5.2 | 16/OP002 (B0055): added to 4.2 after the five-fold split sentence: "Each patient's risk in the survival design came from the fold in which that patient was held out. The clinical Cox model was fitted on the same training folds as the networks." 16/OP005 (B0066): the four opening sentences of 5.2 are replaced by "In the survival design, the same cross-validated risks were read at every horizon without refitting (Table~\ref{tab:horizons})." The three-network sentence is dropped because 3.2 states it. The rest of the paragraph is unchanged. | RESOLVED | none |
| RI5.6 | Review 5 | Minor | The Results do not state the comparison the Conclusion rests on | 5.2, first paragraph | 16/OP004 (B0064): added after the CNN sentence: "It also lay above the interval of ECG-only BTTN, 0.7397 [0.7275, 0.7517], so adding the clinical term raised the discrimination of the ECG term." The later sentence now reads "The CNN reached 0.7350, with an interval that overlapped that of ECG-only BTTN, so the two are comparable on this cohort.", so the ECG-only interval is given only once. The Conclusion is unchanged. | RESOLVED | none |
| RI5.7 | Review 5 | Minor | The first Key findings sentence is 56 words long, with two "in" phrases in a row | Cover letter | 17/OP001 (B0006): now reads "On coded diagnoses in the MIMIC-IV hospital records linked to MIMIC-IV-ECG, the proposed network with its clinical term had the highest one-year area under the receiver operating characteristic curve of the methods compared: 0.7776 against 0.7597 for the clinical model, with overlapping 95\% confidence intervals." The second sentence is unchanged. | RESOLVED | none |
| RI5.8 | Review 5 (C4) | Minor | The versions of Khurshid_2025 and Faes_2024 that were read | 2.2 and others | No op | Not addressed | Marked "needs the user" and excluded by the brief |

**Where RI5.7 departs from the reviewer's wording.** The reviewer's version uses "AUROC", which is not defined anywhere in the letter, and gives the intervals as bare brackets. The reviewer's other option drops "of the methods compared", and without it "highest" has no stated scope. My version keeps the full name of the metric and the scope. It also keeps the overlap with the clinical model, stated with its label in place of the two bracketed intervals.

## Where the numbers and method wording come from

I read these files and ran none of them.

- **14,469 (RI5.3):** `code/results/cohort_flow.txt` gives `excluded_prevalent_concurrent_AF 14469` for both cohorts with `source=icd`.
- **The RI5.3 criterion:** `code/core/cohort.py` lines 118 to 121 exclude a patient when the coded onset falls within `BLANKING_DAYS`, or when an AF-read ECG falls at or before index plus the blanking window. `BLANKING_DAYS = 30` is set in `code/core/config.py` line 51.
- **RI5.6 numbers:** `code/results/table1_cis.csv` has the row "conv-BTTN + clinical" at 0.7776 [0.7664, 0.7888] and the row "conv-BTTN (ECG-only)" at 0.7397 [0.7275, 0.7517]. The two intervals do not overlap.
- **RI5.7 numbers:** 0.7597 is the clinical row of `table1_cis.csv`, and 0.7350 is its CNN row.
- **RI5.5 wording:** `code/experiments/multihorizon.py` lines 92 to 114 assign five folds stratified by event status, train `bttn_fold` on the other folds and fit `CoxPHFitter(penalizer=0.1)` on the same training folds. `bttn_fold` in `code/core/bttn.py` lines 203 to 221 averages three networks (`n_ens=3`).

## Checks run

- **JSON:** `jq -e .` parses both patch files.
- **Hashes:** I copied every hash from the manifests and computed none. A `jq` comparison printed "base ok" for both patches and "ok" for each of the 8 `old_hash` values against the manifest `sha256` of the block its op names.
- **Changed words:** `git diff --no-index --word-diff` of each `new_text` against the block's character span in the current file shows only the changes listed in the log.
- **Characters:** `LC_ALL=C grep -c '[^ -~]'` printed 0 for both patch files. The new text adds no semicolon, no `--` and no spaced hyphen.
- **Claims not to make (a) to (f):**
  - (a): no number from the ECG reports. The 14,469 is the gold-label cohort's exclusion count, kept by the Decisions ruling on C5.
  - (b): no rising-risk reading. "are not independent replications" is kept.
  - (c): no PTB-XL result.
  - (d): no claim that the block-term structure is needed for accuracy.
  - (e): AF diagnosis stays "another task".
  - (f): every number traces to a gold-label file under `code/results/`.
- **Negative results:** none written. RI5.6 adds a comparison the fused model wins.
- **Software wording:** the new manuscript text names no file, script or run. Only the op rationales name the files a number was traced to.

## Prose check (the changed blocks only)

Four new sentences are longer than about 20 words. I kept each one:

- **Cover letter, Key findings:** 45 words, down from 56. The draft-writer page holds the paragraph to 1 to 2 sentences, and the sentence carries the label source, the full metric name, its scope and the overlap with the clinical model.
- **6.1, RI5.2:** 32 words, in the wording that C2 and settings.md Decisions set.
- **Table 1 caption, RI5.3:** 28 words, which state the full exclusion criterion.
- **5.2, RI5.6:** 24 words.

## What is not done

1. **A phrase in the RI5.2 wording is not checked against a passage.** The words "multi-label ECG interpretation" come from the citation report's suggested wording. The two abstract passages it quotes for McKeen_2025 do not contain them: "openly available benchmark on the MIMIC-IV-ECG dataset" and "salient labels, including atrial fibrillation (0.996)". I took the wording as the brief directs. `lookup resolve '10.1093/jamiaopen/ooaf122'` prints no abstract, so I could not check the phrase myself.
2. **intended-claims.md is unchanged.** The draft-writer page has only the first start write that list, so the RI5.6 claim (fused model above ECG-only BTTN at one year) is not on it.
3. **Not verified:** the patches are not applied, the manuscript was not compiled, and `texcount` was not run on the patched text.

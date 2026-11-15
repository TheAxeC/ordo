I wrote both patches and applied neither. D4-1, D4-2 and D4-3 are each answered by at least one op. D4-4 and every issue marked "needs the user" are unchanged.

- **main.tex:** `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/full-1/paper-runs/full-2026-11-14/patches/12-main.tex.patch.json`, 6 ops on 6 of the 115 blocks. No heading changes, so the patch is not structural.
- **cover-letter.tex:** `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/full-1/paper-runs/full-2026-11-14/patches/13-cover-letter.tex.patch.json`, 1 op. The anchorizer made the whole `letter` environment one block (B0006), so the op rewrites that block whole and changes only the one sentence.

## Revision log

| # | Source | Severity | Feedback | Section | Action taken | Status | Reason |
|---|---|---|---|---|---|---|---|
| D4-1 | Review 4 | Minor | "Fitted once" misdescribes the five-fold, three-network design, and three sentences open the same way | Abstract | 12/OP001: "The AUROCs of BTTN with the clinical term ranged from 0.723 to 0.745 at horizons from 120 days to 5 years after the ECG, with a 30-day blanking window. These values were computed from one set of cross-validated survival risks, without refitting for any horizon." | RESOLVED | none |
| D4-1 | | | | 1.3, third contribution | 12/OP002: "... the discrimination of BTTN at four horizons, read from the same cross-validated risks without refitting for each horizon." | RESOLVED | none |
| D4-1 | | | | 5.2, second paragraph | 12/OP003: new first sentences. "Each patient's risk in the survival design came from the fold in which that patient was held out. For the fused model and ECG-only BTTN, it was the mean log-risk of three networks trained on the other four folds. The clinical Cox model was fitted on the same four folds. These cross-validated risks were read at every horizon without refitting." Also "share one model" became "share the same risks", and "the behaviour of one model" became "the behaviour of each model"; "are not independent replications" is kept. | RESOLVED | none |
| D4-1 | | | | Table 3 caption | 12/OP004: "For each model, the cross-validated risk of every patient was read at all four horizons without refitting." The table body is unchanged. | RESOLVED | none |
| D4-1 | | | | 7, first paragraph | 12/OP005: "Without refitting for each horizon, it kept its point estimates above those of the clinical model ..." | RESOLVED | none |
| D4-2 | Review 4 | Minor | The Conclusion presents a property that holds by construction as a suggestion of the results | 7, third paragraph | 12/OP006: "For the design of ECG risk models, the results suggest that a clinical term kept outside the block-term factors adds to the discrimination of the ECG term. At one year, the fused model reached 0.7776 [0.7664, 0.7888] and the ECG term alone 0.7397 [0.7275, 0.7517]. These two intervals do not overlap, although the study reports no paired interval for this difference." The two sentences after it are kept. | RESOLVED | none |
| D4-3 | Review 4 | Minor | The cover letter places the coded diagnoses in the ECG database | Cover letter, Key findings | 13/OP001: "On hospital diagnoses coded in the International Classification of Diseases, in the MIMIC-IV records linked to MIMIC-IV-ECG, the proposed network ..." | RESOLVED | none |
| D4-4 | Review 4 | Minor | Drafting note on the unchecked AI policy | Above the AI declaration | No op | Not addressed | Marked "needs the user" and excluded by the brief |

## How the horizon risks were produced (D4-1)

I read `code/experiments/multihorizon.py` and `code/core/bttn.py` and `code/core/config.py`, and ran none of them. This is how the risks were produced:

- **Folds:** the 20,000 survival patients were split into five folds, stratified by event status (`multihorizon.py` lines 92 to 96, with `N_FOLDS = 5` in `config.py` line 88).
- **Fused model and ECG-only BTTN:** in each fold, `bttn_fold` trains three networks with Cox loss on the other four folds. They use seeds 0, 1 and 2, `n_ens=3` (`bttn.py` lines 203 to 221). The test-fold risk is the mean of the three network outputs.
- **Clinical Cox model:** fitted with `CoxPHFitter(penalizer=0.1)` on the same training folds (lines 108 to 114).
- **Reading at each horizon:** the same out-of-fold risk arrays are read at 120, 365, 730 and 1825 days (lines 119 to 128). The comment on line 27 says "no per-horizon retraining".

The new 5.2 sentences state this in the field's terms and name no file. The rationale of each op gives the source in one line.

## Where the numbers come from (D4-2)

All six numbers stand in `code/results/table1_cis.csv`:

- 0.7776, 0.7664 and 0.7888 are in the row "conv-BTTN + clinical".
- 0.7397, 0.7275 and 0.7517 are in the row "conv-BTTN (ECG-only)".

The comparison is stated only as intervals that do not overlap, and the text says no paired interval is reported. No other number changed in either file, and the horizon values still agree with `multihorizon_icd_spectral.csv`.

## Checks run

- **JSON:** `jq -e .` parses both patch files.
- **Hashes:** I copied every hash from the manifests and computed none. A `jq` check shows that each `old_hash` equals the manifest `sha256` of the block its op names. Both `base_sha256` values equal their manifest's. The current main.tex is byte-identical to `10-main.tex.patched` (`cmp`).
- **Changed words:** for each op I ran a word `diff` of `new_text` against the block's character span in the current file. It shows only the changes listed in the log, and line breaks are unchanged.
- **Characters:** `LC_ALL=C grep -c '[^ -~]'` printed 0 for both patches. The new main.tex text has no `--`, no spaced hyphen, no semicolon, and none of "fitted once", "significant" or "outperform".
- **Claims not to make (a) to (f):**
  - No number from the ECG reports.
  - No rising-risk reading; "not independent replications" is kept.
  - No PTB-XL result.
  - No claim that the block-term structure is needed.
  - No detection claim.
  - Every number is from a gold-label file.
- **Negative results:** no text written up as a negative or null result.
- **Software wording:** the new text names no file, script or run.

## Prose check (the changed blocks only)

All ops passed the check, except for three long sentences that I kept:

- **Abstract:** the AUROC-range sentence is 28 words. It carries the range, the horizons and the blanking window.
- **Conclusion:** the design-implication sentence of D4-2 is 27 words, in the reviewer's wording.
- **Cover letter:** the Key findings sentence stays long. Splitting it would take the paragraph past the 1 to 2 sentences that the draft-writer page sets for it.

The five D4-1 sentences now open in different ways:

- the abstract with its subject;
- the 1.3 contribution with a noun phrase;
- the 5.2 paragraph with "Each patient's risk";
- the Table 3 caption with "For each model";
- the Conclusion with "Without refitting".

## What is not done

1. **Abstract length:** the abstract is now 284 words, up from 272 (`wc -w` of the new abstract line). The extra words state the cross-validated design that D4-1 asks for. The venue states no limit.
2. **6.1:** it still reads "at four horizons read from one survival model". I left it because review 4 passed 6.1 and the block is not one D4-1 names. In my judgment it is accurate, since it names one model and not one fit.
3. **intended-claims.md:** it is unchanged. The page has the first start write the list once, so the D4-2 claim is not on it.
4. **Not verified:** the patches are not applied, the manuscript was not compiled, and `texcount` was not run on the patched text.

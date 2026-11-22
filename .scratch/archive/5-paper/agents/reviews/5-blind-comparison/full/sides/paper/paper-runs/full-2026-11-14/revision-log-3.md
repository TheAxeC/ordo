I wrote both patches and applied neither. All 11 issues, D3-1 to D3-11, are answered, and none is left unchanged. Every earlier id that review 3 marks "needs the user" stays open.

- **main.tex patch:** `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/full-1/paper-runs/full-2026-11-14/patches/10-main.tex.patch.json`, 17 ops on 17 of the 115 blocks.
- **refs.bib patch:** `/private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/gate5/full-1/paper-runs/full-2026-11-14/patches/11-refs.bib.patch.json`, 1 op.

No heading is changed, so neither patch is structural.

## Checks run on the patches
- **Format:** both files parse (`python3 -I -m json.tool`).
- **Hashes:** every `old_hash` and both `base_sha256` values appear once in their manifest, and each hash belongs to the block id the op names. The current main.tex and refs.bib are byte-identical to `07-main.tex.patched` and `06-refs.bib.patched` (`cmp`).
- **Changed words:** for each op, a word diff of `new_text` against the block's span of main.tex shows only the intended change.
- **Characters:** no non-ASCII character in either patch (`LC_ALL=C grep -c '[^ -~]'` printed 0).
- **Ye_2020:** main.tex cited it only in 1.2 (line 46) and 2.4 (line 89), and both are changed. The cover letter does not cite it.

## Revision log

| # | Severity | Section | Action taken | Op | Status | Reason |
|---|---|---|---|---|---|---|
| D3-1 | Critical | 5.2, first paragraph | Deleted the two sentences comparing the ECG-only models with the clinical model. The paragraph now ends on the BTTR comparison. | 10/OP008 | RESOLVED | none |
| D3-2 | Critical | 5.1 and Table 1 | Deleted the 40,306 sentence and its Table 1 row. The 40,960 sentence and row stay. | 10/OP006, OP007 | RESOLVED | none |
| D3-3 | Major | Reference list, 1.2, 2.4 | Replaced the Ye_2020 block with `@misc{arxiv_2010_04963}` as printed by `lookup.py bibtex '10.48550/arXiv.2010.04963'`, plus `doi = {10.48550/arXiv.2010.04963}` in the form of the other arXiv entries. The 1.2 and 2.4 sentences keep their wording and cite the new key. | 11/OP001; 10/OP002, OP004 | RESOLVED | none |
| D3-4 | Minor | Abstract, 5.2 | Abstract now reads "Fitted once as a survival model, BTTN with the clinical term had AUROCs of 0.723 to 0.745 ...". 5.2 now reads "Fitted once in the survival design, the fused model had an AUROC of 0.723 ...". | 10/OP001, OP009 | RESOLVED | none |
| D3-4 (other places) | Minor | 1.3 bullet 3, Table 3 caption, Conclusion paragraph 1 | The same unnamed "one survival model" phrase was changed in these three places as well. The Table 3 caption called three model columns "one survival model". It now says each model was fitted once and read at all four horizons, which is what multihorizon.py does (lines 27 and 100 to 122). | 10/OP003, OP010, OP015 | RESOLVED | none |
| D3-5 | Minor | 5.3, 6.1, 7 | 5.3 now says "close in most deciles" and adds "The largest gap lay in the sixth decile (bar 5 ...), 4.95% observed against a mean prediction of 3.56%". The inversion sentence is reworded so 4.95% is not repeated. 6.1 and 7 now read "agreed closely in most risk deciles". | 10/OP011, OP013, OP015 | RESOLVED | none |
| D3-6 | Minor | 6.2, first paragraph | Moved the joint-training sentence after the "separate parameters" sentence, in the order the reviewer gave. No sentence is reworded. | 10/OP014 | RESOLVED | none |
| D3-7 | Minor | 6.1, first paragraph | Now opens "These results answer ...". It closes "The gain of the fused model over the clinical model is small and consistent in direction. The one-year intervals overlap, and the study reports no interval of the difference that would establish it." | 10/OP013 | RESOLVED | none |
| D3-8 | Minor | 7, paragraphs 2 and 3 | Deleted the restating sentence in paragraph 2. Paragraph 3 now opens with the design implication alone, and the repeated parity with the compact CNN is gone. | 10/OP016, OP017 | RESOLVED | none |
| D3-9 | Minor | Figure 3 caption | Changed to "the drop in log-risk was recorded". | 10/OP012 | RESOLVED | none |
| D3-10 | Minor | Abstract | Split the question sentence and the AUROC sentence. The diagnoses sentence now reads "Incident AF was defined from coded diagnoses in the MIMIC-IV hospital records linked to MIMIC-IV-ECG." | 10/OP001 | RESOLVED | none |
| D3-10 (other place) | Minor | Conclusion, first sentence | "On ICD-coded labels in MIMIC-IV-ECG" now reads "On ICD-coded hospital diagnoses linked to MIMIC-IV-ECG". | 10/OP015 | RESOLVED | none |
| D3-11 | Minor | 4.3, Figure 3 caption | 4.3 now says the drop is divided by "the sum of two terms: the mean energy of the removed samples, and, for stability, one tenth ...". The Figure 3 caption had the same ambiguous wording and now says "divided by the sum of the mean signal energy removed and one tenth ...". | 10/OP005, OP012 | RESOLVED | none |

Earlier ids left as "needs the user": D1-7, D1-8, D1-9 (Critical), D1-16 to D1-22, D1-54 to D1-58, D1-62, D1-63, D1-66, D1-67 and D2-6.

## Where the numbers and method settings come from
- **3.56% (D3-5):** decile 5 of `code/results/risk_strata.csv`, `observed_rate` 0.04952 and `mean_pred` 0.03560. figures.md records that file as the gold ICD-10 source of Figure 2. The "largest gap" wording comes from reading the ten rows: decile 5 has the largest gap both in percentage points and relative to the prediction. No standard-error figure was added, since it would be a computed number.
- **Normalisation (D3-11):** `code/figures/beat_saliency.py` line 84, `np.clip(SAL, 0, None) / (ENG + ENG.mean() * 0.1 + 1e-9)`, with `ENG` averaged over leads and window centres.
- **Log-risk (D3-9):** `predict_risk` in `code/core/bttn.py` returns the network output.
- **Arxiv record (D3-3):** `lookup.py resolve '10.48550/arXiv.2010.04963'` returned title ratio 1.00 from arXiv and from OpenAlex, which names the arXiv PDF as the open copy. Crossref returned "not found".
- No project code was run.

## Prose check (the changed blocks only)
- No em or en dash, no flagged term, and no new semicolon. The one semicolon in the new text is the existing one in the Figure 3 caption.
- Three new sentences run past about 20 words, and I kept them: the abstract AUROC sentence (about 27 words), the abstract survival sentence (32) and the 4.3 normalisation sentence (32). Each carries numbers, intervals or the two-term formula, and the last two use the reviewer's wording.

## What is not done
1. **Abstract length:** 272 words (`wc -w` of the new abstract line), up from 259, against the reviewer's "near 250". The added words come from the splits and from naming the survival model, both of which the issues ask for, and I found no cut that keeps every qualifier. The venue states no limit.
2. **Cover letter:** its "Key findings" paragraph places the coded diagnoses "in MIMIC-IV-ECG", the same misplaced data source as D3-10. The cover letter is not one of my two files, so it is unchanged and needs a patch through the session.
3. **intended-claims.md:** item 11 (both ECG-only models below the clinical model) is no longer made after D3-1. The file is written once and is not changed in a later start, so the review will see the difference.
4. **Not verified:** the manuscript was not compiled, `texcount` was not run on the patched text, and `check-urls` has not yet checked the new arXiv DOI. The patches are not applied.

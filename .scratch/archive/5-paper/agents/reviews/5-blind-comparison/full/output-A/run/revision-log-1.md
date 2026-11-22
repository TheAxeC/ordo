## Revision log, draft review round 1

Both patches are written. Neither has been applied.

- `/work/run/patches/05-main.tex.edits.json`: 45 `replace_block` ops, OP001 to OP045.
- `/work/run/patches/06-refs.bib.edits.json`: 2 `replace_block` ops.

**Checks run on the patches**
- Both files parse with `jq -e .`.
- `base_sha256` equals the one in each manifest: `jq -r .base_sha256 patch manifest | uniq | wc -l` printed 1.
- Every pair of block id and `old_hash` appears in its manifest: `comm -23` of the op pairs against the manifest pairs printed nothing.
- No block takes two ops: `uniq -d` printed nothing.
- I compared each new block with its original text using `git diff --no-index --word-diff`. Only the changes listed below appear.
- The new text holds no non-ASCII character (`LC_ALL=C grep -c '[^ -~]'` printed 0), no dash used as an aside and no new semicolon.
- The patches cover every issue id not marked "needs the user", on that reading of the review: RI1.1 to RI1.6, RI1.10 to RI1.15, RI1.23 to RI1.53, RI1.64, RI1.65, RI1.68 and RI1.69 (`jq` over `roadmap_item_ids`; RI1.53 is in the `.bib` patch).
- No patch is structural. No heading changes, and 45 of 112 blocks change.

| # | Severity | Section | Action taken (op) | Status | Reason |
|---|---|---|---|---|---|
| RI1.1 | Critical | 2.1 | The Mayo Clinic sentence now uses the wording C64 gives as supported, with 454,789 ECGs in the training set (OP008). | RESOLVED | none |
| RI1.2 | Critical | 2.3 | The values are given as mean accuracies against higher-order discriminant analysis, as C65 gives (OP012). | RESOLVED | none |
| RI1.3 | Critical | 3.2 | The clause "and as other AF survival models do \cite{Sau_2026}" is dropped. Section 2.1 already states that model's discrete-time loss (OP019). | RESOLVED | none |
| RI1.4 | Critical | 1.2 | The sentence now rests on the title the record holds: the commentary is subtitled ``more than just trusting the `black box'\,'' (OP004). | RESOLVED | none |
| RI1.5 | Critical | 3.1 | The mode-n product is defined in the sentence, and the Kolda citation is removed from that place (OP016). | RESOLVED | none |
| RI1.6 | Critical | 6.1 | "At five years" is dropped. The sentence now reads "on external validation in MIMIC-IV, with a label source that its abstract does not state" (OP033). | RESOLVED | none |
| RI1.7, RI1.8, RI1.9 | Critical | Statements | Not answered. | Left to the user | Marked "needs the user". |
| RI1.10 | Major | Abstract, 2.4, 3.1, 3.3, 6.1, 6.2, 7 | 3.3 now says the study reports no reading of the learned factors (OP021). Readability is stated as a property of the architecture in the abstract (OP001), 2.4 (OP013), 3.1 (OP017), 6.1 (OP034), 6.2 (OP035) and 7 (OP043, OP044). | RESOLVED | none |
| RI1.11 | Major | 5.3, 6.1, 6.3, 7 | "Calibrated" is replaced by "after logistic recalibration within the survival sample, predicted and observed one-year proportions agreed across deciles" (OP027, OP032, OP042). 6.3 gains a sentence on the in-sample, two-fold cross-fitted recalibration (OP039). | RESOLVED | none |
| RI1.12 | Major | 4.2, 5.3, Table 4, 6.3 | Fallback per settings.md Decisions. The rate is renamed "the proportion of cases among the cases and AF-free controls of the one-year design, 1,855 in 43,625" (OP022, OP027, OP028). 6.3 now says this exceeds the survival cohort's one-year rate of 1,855 in 50,545, so the PPVs are upper values (OP039). No new number is computed. | RESOLVED | none |
| RI1.13 | Major | 4.2, 6.3 | Fallback per settings.md Decisions. The TRIPOD+AI sentence now adds "without a table of participant characteristics and without counts of missing values per clinical factor" (OP022), and 6.3 states the omission (OP039). | RESOLVED | none |
| RI1.14 | Major | 1.2 | The sentence now reads "block-term tensor regression, designed for interpretability, predicted finger movements". The gap still follows from the next two sentences (OP005). | RESOLVED | none |
| RI1.15 | Major | 1.1 | The sentence now says "predict new-onset AF" (OP003). | RESOLVED | none |
| RI1.16 to RI1.22 | Major | Various | Not answered. | Left to the user | Marked "needs the user". |
| RI1.23, RI1.24 | Minor | 1.1 | Wording per C70 and C71 (OP002). | RESOLVED | none |
| RI1.25 | Minor | 1.1, 1.2 | The guideline sentence is reworded to automated AF diagnosis (C72). It is moved out of the new-onset results into 1.2, beside the point on clinical use (OP003, OP004). | RESOLVED | none |
| RI1.26 | Minor | 1.2, 2.3 | "For most methods" is restored in both places (OP004, OP011). | RESOLVED | none |
| RI1.27 | Minor | 1.2, 2.4 | Ye_2020 is now described as explained "with Grad-CAM maps instead of through their factors" (OP005, OP013). | RESOLVED | none |
| RI1.28 | Minor | 1.3 | Now "a third of a sample of 700 AF-labelled ECGs" (OP006). | RESOLVED | none |
| RI1.29 | Minor | 2.1 | Now "models with 31-day confirmation windows had higher median AUCs" (OP008). | RESOLVED | none |
| RI1.30 | Minor | 2.2 | The four input kinds are named (OP010). | RESOLVED | none |
| RI1.31 | Minor | 2.4 | De_Lathauwer_2008 alone carries the special-case claim, and Kolda_2009 is cited for the CP and Tucker decompositions (OP013). | RESOLVED | none |
| RI1.32 | Minor | 3.1 | Now "reduces the frequency and lead modes to ranks 3 and 2, the mode-n ranks by which a block term is characterised" (OP016). | RESOLVED | none |
| RI1.33 | Minor | 3.1 | "Fitted by least squares" is dropped (OP017). | RESOLVED | none |
| RI1.34 | Minor | 4.3, 6.3 | The two sources are split by what each one holds (OP023, OP040). | RESOLVED | none |
| RI1.35 | Minor | 6.1 | Now "evaluated with a benchmark on MIMIC-IV-ECG reported an AUROC of 0.996 for AF" (OP033). | RESOLVED | none |
| RI1.36 | Minor | 6.2 | The consensus working definition is used (OP038). | RESOLVED | none |
| RI1.37, RI1.38 | Minor | 2.1, 2.3 | Both sentences now open with "To our knowledge" (OP009, OP012). | RESOLVED | none |
| RI1.39 | Minor | 5.3 | The decision-curve paragraph is rewritten (OP027): the models lie above treating all and treating none from about 0.04 to 0.1; below 0.04 they are close to treating all; the fused model is above the other two from about 0.03 to 0.12. It says once that these thresholds are read from Figure 2. | RESOLVED | none |
| RI1.40 | Minor | 4.3, Table 5, Fig. 3 caption, 6.2 | Table 5 now gives the window centres and the occluded spans (OP031). The centres follow the grouping in `figures/beat_saliency.py`, which uses centres <greater-than or equal to> a and < b. The caption (OP030), 4.3 (OP023) and 6.2 (OP037) are corrected to match. I checked the 6.2 sentence against the mean beat of Figure 3: in lead II the P wave returns to baseline near 110 ms before the R peak. It now reads "this span holds the end of the P wave and the PR segment". | RESOLVED | none |
| RI1.41 | Minor | 4.3, Table 5 caption | The clipping is stated for both the raw and the normalised value (lines 84 and 90 of `beat_saliency.py`) (OP023, OP031). | RESOLVED | none |
| RI1.42 | Minor | 3.2 | The attention is now "one set of attention weights over time, computed from all channels by a softmax and shared by them". This matches `core/bttn.py`, where `attn = Conv1d(ch_out, 1, 1)` (OP018). | RESOLVED | none |
| RI1.43 | Minor | 5.3 | Brier is now 0.0390. `clin_eval.py` rounds Brier to 4 decimals, and the file holds 0.039 (OP027). | RESOLVED | none |
| RI1.44 | Minor | Abstract, 5.3 | The abstract now says "In the survival sample, which over-represents patients with AF". 5.3 states the sampling fractions, 4,000 of 8,775 and 16,000 of 41,770 (OP001, OP027). | RESOLVED | none |
| RI1.45 | Minor | 5.3 | Now "bars 5 and 6 of Figure 2" (OP027). | RESOLVED | none |
| RI1.46 | Minor | Abstract, 5.2, Table 3, 7 | The shortest horizon is labelled 120 days from the index ECG, covering the 90 days after blanking (`horizon_days` 120 in the result file). The Table 3 caption states the reference point (OP001, OP025, OP026, OP042). | RESOLVED | none |
| RI1.47 | Minor | 3.1 | A sentence says that 60 Hz mains interference lies outside the kept band up to 40 Hz (OP015). | RESOLVED | none |
| RI1.48 | Minor | 3.3 | The released measurements are separated from those computed from onset and end times, per `core/cohort.py` lines 44 to 46 (OP020). | RESOLVED | none |
| RI1.49 | Minor | 1.3, 2.1, 2.3, 2.4, 3.3, 4.3, 5.4 | All seven closing announcements are cut (OP007, OP009, OP012, OP014, OP021, OP023, OP029). | RESOLVED | none |
| RI1.50 | Minor | 1.3, 5.1, 6.1, 7 | The four listed contrasts are reworded (OP006, OP024, OP033, OP042). | RESOLVED | none |
| RI1.51 | Minor | 5.3 | The paragraph is split in three: calibration and deciles, operating points, decision curves (OP027). | RESOLVED | none |
| RI1.52 | Minor | 6.2 | Each P-wave source now has its own clause (OP036). | RESOLVED | none |
| RI1.53 | Minor | refs.bib | Added `doi = {10.48550/arXiv.2205.10268}` and `{10.48550/arXiv.2507.16761}` (`.bib` OP001, OP002). `lookup resolve` finds both arXiv records at ratio 1.00; Crossref has no record of them. | RESOLVED | none |
| RI1.54 to RI1.63 | Minor | Various | Not answered. | Left to the user | Marked "needs the user". |
| RI1.64 | Suggestion | 2.1, Reproducibility | The 2.1 references go with RI1.49. The Reproducibility statement now names "the Method and Experiments sections" (OP009, OP045). | RESOLVED | none |
| RI1.65 | Suggestion | 6.4 | Cites arxiv_1806_10758 for the removal test and Collins_2024 for reporting external validation. Both passages were read in the run (OP041). | RESOLVED | none |
| RI1.66, RI1.67 | Suggestion | Various | Not answered. | Left to the user | Marked "needs the user". |
| RI1.68 | Suggestion | 3.1 | States $F = 21$ bins from 0 to 39 Hz, 1.95 Hz apart (OP015). This comes from reading the method code (`_spectral`: nperseg 128 at 250 Hz, f <less-than or equal to> 40 Hz), not from a result file. | RESOLVED | none |
| RI1.69 | Suggestion | 3.3 | One sentence ties "readable" to the "interpretable" of the title (OP021). | RESOLVED | none |

**Claims not to make (a) to (f)**
I read the new text against each listed claim. It adds no number from the ECG-report labels, no rising-risk reading, no PTB-XL result, and no claim that the block-term structure is needed for accuracy or that detection is incident prediction. It adds no faithfulness number and no negative result. Every new number either comes from a gold-label file or Table 1, or is a method setting read from the code (F = 21, the window centres and spans).

**Prose check**
I checked the new and changed sentences against the manuscript prose standard and the rules page. Long sentences in my new text were split, and no non-ASCII character was found. The hits for "just" and "very" are inside the quoted Kashou subtitle and the source's "very low certainty". Breaks I left, with reasons:
- The Attia sentence in 2.1 runs to about 38 words. It is the wording C64 gives as supported, and settings.md asks for that wording.
- The new operating-point and decision-curve paragraphs of 5.3 are about 60 and 75 words. This is under the 120-word floor, but RI1.51 asks for the split and they are supporting paragraphs.

**Length**
A `wc -w` count over the changed blocks rises by 641 tokens, about 500 of them in the body. My estimate puts the body near 6,750 words against 6,500, within 10%. I have not run texcount.

**For the session**
- The 6.2 heading "Implications of a readable ECG term with a separate clinical term" is unchanged. After RI1.69 it reads as an architectural label, and changing it would make the patch structural.
- `intended-claims.md` is not rewritten, since the page says the first start writes the list once.
- An open item that no issue raises: `beat_saliency.py` occludes `int(0.0125 <multiplication sign> 500) = 6` samples on each side of a centre, which is 24 ms at 500 Hz. The text says 25 ms in 4.3, 6.3, the Figure 3 caption and Table 5. I kept 25 ms and computed the Table 5 spans as half of 25 ms on each side; a 24 ms width shifts each span edge by at most 1 ms. This is a correction of the stated method, and it needs an id before it can be patched.

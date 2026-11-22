The better versions fix real errors in five of the six changes. The cited source pages could confirm almost none of this: of the pages I checked, only the Dooms arXiv page holds the paper's own text (its abstract). The other clinical and statistics pages are redirect or bot-challenge stubs, so several verdicts below rest on the study's own files and my knowledge of the published papers. I say where.

## What the saved pages hold

- **Stubs that keep only the title:** the Lancet pages for STROKESTOP, LOOP, Noseworthy and Schnabel (page-019, page-020, page-021, page-017 and their linkinghub/doi copies). They are "Redirecting" pages or page headers that keep only the article title.
- **Stubs with nothing usable:**
  - The JAMA pages for the USPSTF statement (page-005, page-123, page-195, page-196).
  - The AHA pages for Raghunath and Alonso (page-061, page-171, page-063, page-173 and the others).
  - The BMC pages for Van Calster (page-067, page-116, page-177).
  - The Harrell pages (page-007 is "DOI Not Found"; page-124, page-125 and page-210 are "Just a moment...").
  - The B-cos pages (page-042, page-156), where a search for "B-cos" finds nothing.
- **Pages with content:**
  - Dooms (page-103): the abstract describes "a multilayer SVHN model", which is an image dataset.
  - PTB-XL (page-024) describes 2,127 patients with multiple ECGs but no dated AF outcome.
- **Input files used:**
  - `code/core/bench.py:30` lists the nine covariates: age, sex, RR, P duration, QRS, QT, and the P, QRS and T axes. The PR interval is not among them.
  - `code/core/bench.py:165-174` computes a paired bootstrap AUROC difference against the CNN.
  - `code/experiments/clin_eval.py:88-93` plots calibration by decile only.
  - `code/results/table1_cis.csv` holds the headline AUROCs with no paired result.

## Change 1 (version 2 is better at every place)

1. **Places 1, 6, 7 and 12** ("without a paired test" / "No paired test was made" against "no paired test reported"). Version 2 is better. `bench.py` runs a paired test against the CNN whenever the CNN is in the run, and RESULTS.md:21 reports paired deltas on the provisional cohort. No paired result for the ICD headline is saved. "No paired test is reported" is therefore accurate. "No paired test was made" (place 6, version 1) is a factual claim the code makes doubtful. This is a minor-to-moderate point, and no citation is involved.
2. **Place 2** (Noseworthy). Version 2 is better. Its wording, that the score "divided monitored patients into high-risk and low-risk groups", fits the reported 1.6% detection in the low-risk group. Version 1's "selected patients for monitoring" implies that only flagged patients were monitored, which cannot produce a low-risk detection rate. The page is a stub; my reading of the trial is that both risk groups wore monitors. This corrects the description of the trial design, so it matters to a reader.
3. **Places 3 and 11** ("dated onset" against "onset as a dated outcome"). There is no real difference, and neither version is wrong.
4. **Place 4** ("ECG intervals of an established risk model" against "the PR interval"). Version 2 is more accurate about Schnabel: the Framingham score's only ECG interval is the PR interval (my knowledge; the page is a stub). Both versions keep a deeper error, though. The sentence says the PR interval supports the choice of the nine covariates, and the PR interval is not one of them. Change 2 removes that error.
5. **Place 5** (Van Calster). Version 2 is better. It states what the paper says: moderate calibration is assessed with a flexible curve, and grouping into risk strata is named as a drawback of the Hosmer-Lemeshow test. Version 1's comparative paraphrase is looser but not false. This is a minor wording point.
6. **Place 8** (LOOP). Version 2 is better. "May not merit anticoagulation" follows the authors' wording, which place 2 already cites. "May not need treatment" widens the claim to all treatment. This is a minor-to-moderate point.
7. **Place 9** (Raghunath). Version 2 ("used") is slightly better: the 1.6 million ECGs covered both development and testing, so "trained on" overstates the training set. This is minor.
8. **Place 10.** Version 2 adds citations to "Both were evaluated on images". The Dooms abstract (SVHN) supports it. This is a minor point.

## Change 2

- **Place 1.** Version 1 is better. Version 2 says the nine covariates are "supported by the PR interval" in Schnabel and in Cheng, but the PR interval is not among them (`bench.py:30`, and Change 1 place 3 lists the machine measurements without it). Version 1's claim, that age and sex are among the Framingham variables, is true and does support the covariate choice. Version 2 introduces an error that a referee would catch.
- **Place 2.** Version 2 is marginally better as a cited claim, because it states what Van Calster holds. Version 1 is a true statement about this study: calibration is by decile only, with no flexible curve, as `clin_eval.py:88-93` shows. But version 1 cites Van Calster for a fact about this study. Neither version is wrong, and the difference is minor.

## Change 3

Version 2 (citing Harrell 1996 for the C-statistic) is better. Harrell is the source of the concordance index. Van Calster is a paper on calibration, so citing it as the source of the C-statistic misattributes it. Both pages are stubs, so this rests on the papers' known scope. This is a citation-appropriateness fix a referee could raise.

## Change 4

- **Place 1.** Version 1 is better. STROKESTOP randomised people to an invitation to screening or to control; the title on the stub page says "randomised controlled trial". Version 2's "were invited" drops the randomisation and leaves the "controls" of the next sentence undefined. This matters moderately.
- **Places 2 and 3.** Version 1 is slightly better. It names what CHARGE-AF has that this model lacks (clinical history, blood pressure, body size, treatment), which matches CHARGE-AF's variables (my knowledge; the page is a stub), and at place 3 it keeps the citation. Version 2's "a narrower set" is true but vaguer. This is minor, and neither version is wrong.

## Change 5

Version 2 is better. The USPSTF statement covers adults aged 50 or older without symptoms of AF, so "adults without symptoms" overstates its scope. The page is a stub. This corrects the population a recommendation applies to, so it matters.

## Change 6

Version 2 is better. It adds that the statement excludes people with prior stroke or TIA, which matches the statement's population (my knowledge). Version 1 is not wrong, only less complete. This is minor.

## Verdict

Yes, the better versions fix real errors that a referee or reader would care about, in five of the six changes:

1. **Change 1:** chiefly the Noseworthy trial design, plus the "no paired test was made" claim and the LOOP wording.
2. **Change 2:** version 1 removes the false claim that the PR interval supports covariates that do not include it.
3. **Change 3:** the wrong source for the C-statistic.
4. **Change 4:** the dropped randomisation in STROKESTOP.
5. **Change 5:** the USPSTF age scope.

Change 6 is only a completeness improvement. The better version is version 2 in Changes 1, 3, 5 and 6 and in Change 2 place 2, and version 1 in Change 2 place 1 and in Change 4.

One error survives in Change 1 place 4, in both versions: the sentence still says the PR interval supports the covariate choice. The fix is the wording of Change 2's version 1.

The verdicts on Noseworthy, Schnabel, Van Calster, Harrell, LOOP, the USPSTF statement, Raghunath, CHARGE-AF and B-cos depend on my knowledge of those papers, because their saved pages are stubs. Readable copies of those pages would settle them.

**Verdict: manuscript A has fewer and less serious cited-claim problems.** Among the claims whose saved page could be checked, A has 0 problems and B has 3: one detail the source gives differently, one number the source gives differently, and one minor overstatement. Both counts rest on a minority of the citations, because most saved pages hold no article text.

## How far the saved pages allow a check

Most of `pages/` holds no article text:
- **131 pages are bot-check or redirect pages.** A search for `Just a moment|Redirecting|Enable JavaScript|captcha|Access Denied` matched 131 files. These are Cloudflare, Elsevier, AHA, OUP, JAMA and SIAM pages.
- **Others are empty or error pages.** These include pages 040 to 049 and 093, the Springer "Client Challenge" pages, the Zenodo and Project Euclid 403 pages, and the Wiley "DOI Not Found" page.
- **The PDF copies have no searchable text.** A search for `ImageNet|block-term|perturb` across pages 073, 110 to 114, 208, 209, 221, 222 and 224 returned 0 matches.
- **17 of B's references have no saved page at all.** These are ko2026, nolinlapalme2026, mckeen2025, matsuo2026, hughes2021, storas2023, ghassemi2021, jacovi2020, hanley1982, carpenter2000, platonov2014, huang2020, wolder2023, jeong2021, camarrone2019, faes2022 and li2017btnets; a search of `pages/index.md` for their DOIs and arXiv IDs found none of them. storas2023 is listed because page-070 is a different Diagnostics article.

The pages with readable content are:
- Nature: Patlatzoglou, Rudin, Kim 2017, MIMIC-IV, PTB-XL, Ribeiro 2020 and Lima 2021.
- arXiv abstracts: SENN, ROAR, sanity checks, concept bottlenecks, Mahinpei, Dooms, ProtoECGNet and BTTDA.
- PMLR: SimCLR, CLOCS and Integrated Gradients.
- NeurIPS: Havasi.
- JMLR: Kvamme.
- PhysioNet: MIMIC-IV-ECG.
- Crossref records: Jabbour (with abstract) and Attia (no abstract).
- The CinC program page for Hammer.
- Title-only Semantic Scholar records for Goulart and Hunyadi.

## Manuscript A: claims the page contradicts or does not support

None. Every A claim with a readable page matches it. Some examples:
- **Jabbour, lines 77 and 385.** The Crossref abstract gives "AUC-ROC curve of .78", "externally validated in the Medical Information Mart for Intensive Care-IV" and "median follow-up 1.1 year ... (AUC-ROC = .77)".
- **MIMIC-IV-ECG, lines 99 and 429.** The PhysioNet page says "10 seconds in length. They are sampled at 500 Hz" and lists the licence as "Open Data Commons Open Database License v1.0".
- **MIMIC-IV hospital module, line 429.** The page says users "must complete a training course ... and sign a data use agreement (DUA)".
- **Kim 2017, line 91.** The page says "supervised nonnegative tensor factorization ... diagnoses and prescriptions ... CP algorithm ... ICU mortality".
- **Patlatzoglou, lines 57, 81 and 399.** The page says "post-hoc explainability techniques that have shown unreliable results" and "the cost introduced by intrinsic ECG interpretability".
- **Other matching claims:** Dooms (line 89), ProtoECGNet (lines 81, 85 and 399), concept bottleneck models (line 83), Mahinpei (line 83), Adebayo and Hooker (line 85), Rudin (line 57) and BTTDA (line 91).

One A claim is supported only in part. Line 99 says CODE-15% and PTB-XL both "carry AF labels for each recording". The PTB-XL page confirms per-record labels ("71 different statements conforming to the SCP-ECG standard") but does not name AF, and the CODE-15% Zenodo page is a 403 stub. I did not count it as a problem.

## Manuscript B: claims the page contradicts or does not support

1. **Line 434, a detail the source gives differently.** B writes: "MIMIC-IV-ECG version 1.0~\cite{gow2023} ... and the MIMIC-IV hospital module~\cite{johnson2023} are available under credentialed access on PhysioNet." The PhysioNet page (page-211) marks the ECG module "Open Access" under the "Open Data Commons Open Database License v1.0". The credentialed-access part is correct only for the hospital module.

2. **Line 68, a number the source gives differently (minor).** B writes: "A model trained on 669,782 sinus-rhythm ECGs predicted five-year incident AF or flutter..." Jabbour's abstract (page-092) says: "A total of 669 782 ECGs from 145 323 patients were included", with patients split "70% for training, 10% for validation, and 20% for testing". So 669,782 is the whole dataset, of which about 70% was used for training. The AUROCs (0.78 and 0.77) and the external-test-set wording are supported.

3. **Line 98, a minor overstatement.** B writes: "Havasi and colleagues showed that training the label predictor on soft concept probabilities, which improves accuracy, lets information leak, which corrupts concept predictions and weakens intervention." The NeurIPS abstract (page-225) credits the accuracy finding to earlier work ("Recently, it was demonstrated that training the label predictor directly on the probabilities ... improves label predictions. However, this results in corruptions..."). Havasi's own contribution is to investigate and address the problem.

The rest of B's checkable claims match their pages. These are:
- PTB-XL "21837 records from 18885 patients" (line 179).
- MIMIC-IV-ECG "approximately 800,000 ... nearly 160,000" (line 106).
- Beth Israel Deaconess Medical Center as the source of MIMIC-IV (lines 106 and 404).
- Kim on MIMIC-III (line 90).
- Kvamme, SimCLR, CLOCS and Integrated Gradients (lines 100, 130 and 134).
- Hammer: "MIT-BIH AF database", segments before AF onset (line 382).
- Jabbour "atrial fibrillation or flutter" (line 406).
- Adebayo, Hooker, concept bottleneck models, Mahinpei, Dooms, BTTDA and Rudin.

## Claims that could not be checked (counted for neither)

I counted each pair of a citing sentence and a cited source, by reading. The totals are about 90 for A and about 83 for B. By source:

**A:**
- **Every Lancet, Circulation, JAHA, Europace, EHJ-DH, JAMA, Heart Rhythm, SIAM and Statistics-journal source.** That is joglar, kornej, wolf, davidson, svennberg, svendsen, noseworthy, vancalster, himmelreich, attia, raghunath, khurshid, vandeleur, saizvivo, alonso, schnabel, cheng, nielsen, christopoulos, brant, biton, strodthoff 2024, wagner 2024, goette, bollmann, goldberger, collins, mehari, cox, katzman, harrell, heagerty, niculescu-mizil, vickers, dicicco, delathauwer and kolda.
- **Sources with only a PDF or an empty page:** bohle, samek, ye 2018, ye 2020, faes 2024, geirnaert and strodthoff 2021.
- **Hunyadi:** title only.
- **CODE-15% Zenodo record:** 403 stub.
- **Alvarez-Melis at line 68 (the definition of faithfulness) and line 159 (the "removal principle"):** the saved abstract names faithfulness but neither defines it nor describes feature removal.

**B:**
- **The same stub journal sources where B cites them:** kornej, noseworthy, nielsen, schnabel, alonso, attia, raghunath, khurshid, christopoulos, biton, yuan, delathauwer, kolda, goldberger, collins, cox, katzman, mehari, vancalster, vickers and bollmann.
- **PDF-only or empty:** bohle, ye 2018, ye 2020 and faes 2024.
- **Title only:** hunyadi and goulart. Goulart's title gives no support for "atrial activity ... during AF".
- **CODE-15 figures at line 179** ("345,779 exams from 233,770 patients", "stratified 15% sample"): Zenodo is a stub, and Ribeiro 2020 does not give these numbers.
- **The 17 references with no saved page** listed above.

## Counts behind the verdict

| | Problems on checkable claims | Severity | Uncheckable |
|---|---|---|---|
| A | 0 | none | about 90 |
| B | 3 | 1 detail contradicted (licence and access), 1 number given differently (training-set size), 1 minor overstatement (Havasi) | about 83 |

This is my judgement, and it rests on the roughly 25 claims per manuscript that have readable pages. About three quarters of each manuscript's citations could not be checked against `pages/`, so retrieving those articles' text would be needed to confirm the verdict across all citations.

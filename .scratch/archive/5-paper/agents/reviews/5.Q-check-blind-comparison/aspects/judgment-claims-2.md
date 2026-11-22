**Verdict: B's cited claims are more accurate.** Among the claims that a saved page lets me check, B has 0 problems and A has 3: one detail the source gives differently and two minor overstatements. Both verdict and counts come from reading every cited sentence in both `main.tex` files against the pages in `pages/`. The verdict rests on a small checkable base: in both manuscripts most cited sentences point to a page that is a stub or was never saved.

## Which saved pages can be checked

- **Stubs.** Grep finds a bot-check page ("Just a moment...", "Attention Required", "Client Challenge", reCAPTCHA) in 98 page files. The Elsevier "Redirecting" pages (009 to 021, 127 to 137, 199 to 207) hold only a redirect and the article title. The IEEE pages (040 to 049, 154 to 159, 194) are empty. The Zenodo and DOI pages 003, 186, 187 and 255 to 257 return 403. The crossref record for Attia (091) and the Semantic Scholar records 096 and 097 give only a title.
- **PDFs I could not read.** The PDFs saved under `.html` names (073, 110 to 114, 208, 209, 221, 222, 224, 245 to 250) are 4.9 MB or larger and binary, so neither Read nor Grep can get text out of them. Samek, Ye 2018, Ye 2020 and B-cos have no other readable page, so I counted their claims as unverifiable. Someone who can open those PDFs could check them.
- **Pages with text:** the arXiv abstracts (098 to 109), the Nature pages (022 to 029), PMLR (197, 216 to 220), NeurIPS (225, 227), PhysioNet MIMIC-IV-ECG (211), the crossref record for Jabbour (092) and the CinC program page for Hammer (118).

## Manuscript A: claims the page contradicts or does not support

1. **Line 434, a detail the source gives differently.** The sentence reads: "MIMIC-IV-ECG version 1.0~\cite{gow2023} ... and the MIMIC-IV hospital module~\cite{johnson2023} are available under credentialed access on PhysioNet." Page-211 labels the dataset "Open Access" and gives the licence as "Open Data Commons Open Database License v1". The credentialed-access part is correct only for the hospital module (page-025 says data are "made available to researchers who have completed training in human research and signed a data use agreement").
2. **Line 68, a minor overstatement.** The sentence says "A model trained on 669,782 sinus-rhythm ECGs ...~\cite{jabbour2024}". Page-092 says "A total of 669 782 ECGs from 145 323 patients were included" and that patients were split "70% for training, 10% for validation, and 20% for testing". The AUROCs of 0.78 and 0.77 and the use of MIMIC-IV as external validation are supported.
3. **Line 98, a minor overstatement.** The sentence says "Havasi and colleagues showed that training the label predictor on soft concept probabilities, which improves accuracy, lets information leak, which corrupts concept predictions and weakens intervention~\cite{havasi2022}". Page-225 presents this finding as earlier work ("Recently, it was demonstrated that training the label predictor directly on the probabilities ... improves label predictions. However, this results in corruptions ..."). The paper's own contribution is to diagnose the causes and propose fixes.

The other A claims I checked are supported by their pages: Jabbour at lines 74, 384 and 406; Adebayo, Hooker, Rudin, Kim, Van Den Kerchove, Dooms, Koh, Mahinpei, Sundararajan, Kvamme, SimCLR and CLOCS; MIMIC-IV-ECG at line 106 (800,000 ECGs, 160,000 patients, 10 s, 500 Hz); MIMIC-IV coming from Beth Israel Deaconess; PTB-XL (21,837 records, 18,885 patients); Hammer; and the CODE study belonging to the Telehealth Network of Minas Gerais.

## Manuscript B: claims the page contradicts or does not support

None. B's checkable claims are all supported by their pages:
- Patlatzoglou at lines 57, 81 and 399 ("post-hoc explainability techniques that have shown unreliable results", "the cost introduced by intrinsic ECG interpretability").
- Jabbour at lines 77 and 385 (Montreal Heart Institute, AUROC 0.77 in MIMIC-IV, "median follow-up 1.1 year").
- ProtoECGNet, Mahinpei, Koh, Adebayo, Hooker, Dooms ("retain equal accuracy"), Kim, Van Den Kerchove and Rudin.
- CODE-15% as a subset of CODE (Lima, page-023: "the 15% hold-out split ... referred to as the CODE-15% cohort").
- Line 429 on licensing: "MIMIC-IV-ECG is openly available ... under the terms of the Open Database License", which matches page-211, and the hospital module needing a data use agreement, which matches page-025.

## Claims whose saved page is a stub or holds too little to check

These count for neither manuscript. I counted them by reading, one per claim within a sentence, so the totals are my tally rather than a script count.

**A: 57 claims**
- **Stub pages, 36 claims:**
  - Kornej, line 62.
  - Noseworthy, lines 62 (x2) and 398.
  - Nielsen, lines 64, 114, 382 and 394.
  - Schnabel and Alonso, line 68.
  - Attia and Raghunath, lines 68, 153 and 384.
  - Raghunath, line 398.
  - Yuan, line 68.
  - Khurshid, Christopoulos and Biton, lines 70 and 382 (x3).
  - De Lathauwer, lines 88 and 126.
  - Zhao and Faes 2024, lines 88 and 151.
  - Hunyadi and Goulart (title only), line 90.
  - Ye 2018 and Ye 2020, line 92 (x2).
  - B-cos, line 96.
  - Goldberger and Collins, lines 106 and 446.
  - Kolda, line 122.
  - Cox and DeepSurv, line 130.
  - Mehari, lines 134 and 386.
  - Clinical scores, line 151.
  - Van Calster and Vickers, line 161.
  - The CODE-15 counts 345,779 and 233,770, line 179 (Zenodo 403).
  - Bollmann, line 394.
- **No saved page at all, 21 claims:**
  - Hughes, Storas and Matsuo, lines 74 (x2) and 390.
  - Ghassemi, lines 76 and 392.
  - Camarrone and Faes 2022, line 88.
  - Li (BT-Nets), line 92.
  - Jacovi, lines 100 and 165.
  - Jeong, line 118.
  - Hanley, lines 157 and 414.
  - Carpenter, line 157.
  - Nolin-Lapalme and Ko, lines 384 and 386.
  - McKeen, line 384.
  - Huang, Wolder and Platonov, line 394.
  - Data availability for Goldberger and CODE-15, line 434.

**B: 80 claims, all with stub pages**
- **Lines 49 to 57, 22 claims:**
  - Joglar.
  - Kornej (x2).
  - Wolf (x2).
  - Davidson (x2).
  - Svennberg (x3).
  - Svendsen (x2).
  - Noseworthy (x2).
  - Himmelreich and Van Calster (x2).
  - Attia.
  - Raghunath.
  - Khurshid (x2).
  - Van de Leur.
  - Saiz-Vivo.
- **Line 68, 1 claim:** the definition of faithfulness attributed to Alvarez-Melis is not in the saved abstract.
- **Lines 75 to 91, 23 claims:**
  - Alonso (x2).
  - Schnabel.
  - Cheng.
  - Nielsen.
  - Attia.
  - Raghunath and Khurshid.
  - Christopoulos.
  - Brant.
  - Biton.
  - Strodthoff 2024.
  - Wagner 2024 (x2).
  - Van de Leur.
  - B-cos.
  - Samek.
  - De Lathauwer.
  - Kolda.
  - Faes 2024.
  - Ye 2018.
  - Ye 2020.
  - Hunyadi.
  - Geirnaert.
- **Lines 99 to 159, 15 claims:**
  - Collins.
  - Bollmann.
  - Kolda.
  - De Lathauwer.
  - Cox and DeepSurv.
  - Schnabel.
  - Faes 2024.
  - Strodthoff 2021.
  - DiCiccio.
  - Harrell.
  - Heagerty.
  - Niculescu-Mizil.
  - Vickers.
  - Mehari.
  - The removal principle attributed to Alvarez-Melis and Samek.
- **Lines 381 to 412, 19 claims:**
  - Khurshid, Christopoulos and Brant.
  - Alonso.
  - Noseworthy.
  - Svendsen.
  - Raghunath (x2).
  - Khurshid (P-wave saliency).
  - Nielsen and Cheng.
  - Goette.
  - Bollmann.
  - Ye 2018 and Ye 2020.
  - Faes 2024.
  - Hunyadi.
  - B-cos.
  - Van de Leur.
  - Van Calster (x2).
  - Heagerty.
  - Alonso.

## Counts

| | Claims with a problem | Claims not checkable |
|---|---|---|
| A | 3 (1 detail given differently, 2 minor overstatements) | 57 |
| B | 0 | 80 |

B has fewer problems, and less serious ones. Neither manuscript has a checkable claim that its source does not make at all.

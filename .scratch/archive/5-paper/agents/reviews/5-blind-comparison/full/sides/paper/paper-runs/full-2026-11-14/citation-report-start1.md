## Citation report

Mode: full. Manuscript: `manuscript/main.tex` (it inputs no other file) with `manuscript/refs.bib`. Citation style row: Vancouver; the `\bibliographystyle{vancouver}` line of main.tex agrees with it. DOI checking: mark-only. Domain evidence profile: cs_ml. Discipline: biomedical informatics, a clinical field, so the checks of "Claims in clinical papers" ran.

This start writes no patch. More than half of the cited entries fail the same deterministic check (C1, "Systematic format error" below), so every correction with one right answer is listed under "Items flagged for review" for the second start, which writes them into patch 03 (main.tex) and patch 04 (refs.bib) after the citation style is confirmed. All other checks of the page ran in full.

### Summary
| Metric | Count |
|---|---|
| Cited keys | 64 |
| Entries in the .bib | 68 |
| References verified | 64 |
| References not found or mismatched | 0 |
| Claims judged | 111 |
| Claims not held by their source | 6 (rows 19, 54, 69: MAJOR_DISTORTION; rows 10, 63, 82: UNVERIFIABLE_ACCESS) |
| Missing keys | 0 |
| Unused entries | 4 |
| Format errors corrected | 0 (no patch in this start, see C1) |
| Format errors flagged for review | 9 (C1, C32 to C39) |
| Missing DOIs | 9 (the nine arXiv entries) |
| Self-citation ratio | not computed against a confirmed Authors row (the row is a gap); 4.7 percent (6 of 127 citations: Faes_2024 five times, the Zenodo record once) if the author named Faes in both `code/README.md` and `code/LICENSE` is an author |
| Sources from the last 5 years | 48.4 percent (31 of 64 cited entries published 2022 to 2026) |
| References matched only by a preprint server | 0 (the nine arXiv entries were also matched by OpenAlex) |
| References matched by no index | 0 |
| Sentences that state a listed claim | 0 Critical; 3 sentences come near a listed claim (C21 to C23) |
| Claims not on the list, and intended claims not made | 7 and 1 |
| Passages that repeat an earlier paper | 0 (Earlier papers: none listed) |
| Sources with a retraction or expression-of-concern notice | 0 |

### Lookups
Each DOI or arXiv ID was looked up with `python3 lookup.py resolve '<identifier>'` in this run. `resolve` prints the first three authors of a record, so "first authors" below means those three.

| Key | Command | Line used | Indexes that matched | Fields confirmed | Verdict |
|---|---|---|---|---|---|
| Kashou_2021 | lookup.py resolve '10.1136/heartjnl-2021-319385' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Wolf_1991 | lookup.py resolve '10.1161/01.str.22.8.983' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Schnabel_2015 | lookup.py resolve '10.1016/s0140-6736(14)61774-8' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (0.80) | first authors, year, title, venue, DOI | VERIFIED |
| Alonso_2013 | lookup.py resolve '10.1161/jaha.112.000102' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Raghunath_2021 | lookup.py resolve '10.1161/circulationaha.120.047829' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Khurshid_2022 | lookup.py resolve '10.1161/circulationaha.121.057480' | Crossref, ratio 1.00 | Crossref, OpenAlex (online year 2021), Semantic Scholar (0.92) | first authors, year, title, venue, DOI | VERIFIED |
| Van_Gelder_2024 | lookup.py resolve '10.1093/eurheartj/ehae176' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Tsiartas_2025 | lookup.py resolve '10.1136/openhrt-2025-003657' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Saiz_Vivo_2025 | lookup.py resolve '10.1093/ehjdh/ztaf144' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Arends_2026 | lookup.py resolve '10.1093/ehjdh/ztag038' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Rudin_2019 | lookup.py resolve '10.1038/s42256-019-0048-x' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | author, year, title, venue, DOI | VERIFIED |
| De_Lathauwer_2008 | lookup.py resolve '10.1137/070690729' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (0.99) | author, year, title, venue, DOI | VERIFIED |
| Ye_2020 | lookup.py resolve '10.1016/j.neunet.2020.05.034' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Faes_2024 | lookup.py resolve '10.1109/tnnls.2022.3216589' | Crossref, ratio 1.00 | Crossref, OpenAlex (online year 2022), Semantic Scholar (online year 2022) | authors, year, title, venue, DOI | VERIFIED |
| Valasakis_2026 | lookup.py resolve '10.1093/eurheartj/ehag785.598' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Attia_2019 | lookup.py resolve '10.1016/s0140-6736(19)31721-0' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Yuan_2023 | lookup.py resolve '10.1001/jamacardio.2023.3701' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Jabbour_2024 | lookup.py resolve '10.1093/eurheartj/ehae595' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Sau_2026 | lookup.py resolve '10.1016/j.hrthm.2025.08.024' | Crossref, ratio 1.00 | Crossref, OpenAlex (online year 2025), Semantic Scholar (0.91) | first authors, year, title, venue, DOI | VERIFIED |
| Zeidaabadi_2026 | lookup.py resolve '10.1016/j.hrthm.2025.10.024' | Crossref, ratio 1.00 | Crossref, OpenAlex (online year 2025), Semantic Scholar (0.93) | first authors, year, title, venue, DOI | VERIFIED |
| Habineza_2023 | lookup.py resolve '10.1016/j.jelectrocard.2023.09.011' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Ribeiro_2020 | lookup.py resolve '10.1038/s41467-020-15432-4' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Riek_2026 | lookup.py resolve '10.1016/j.hroo.2026.09.012' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (0.93) | first authors, year, title, venue, DOI | VERIFIED |
| Schnabel_2009 | lookup.py resolve '10.1016/s0140-6736(09)60443-8' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (0.74) | first authors, year, title, venue, DOI | VERIFIED |
| Cheng_2009 | lookup.py resolve '10.1001/jama.2009.888' | Crossref, ratio 1.00 | Crossref (one author), OpenAlex and Semantic Scholar (Cheng, Keyes, Larson et al.) | first author, year, title, venue, DOI; co-authors missing (C32) | VERIFIED |
| Magnani_2015 | lookup.py resolve '10.1016/j.ahj.2014.10.009' | Crossref, ratio 1.00 | Crossref, OpenAlex (online year 2014), Semantic Scholar (0.97) | first authors, year, title, venue, DOI | VERIFIED |
| Christopoulos_2020 | lookup.py resolve '10.1161/circep.120.009355' | Crossref, ratio 1.00 (title without the subtitle) | Crossref, OpenAlex (0.87, with the subtitle), Semantic Scholar (0.87) | first authors, year, title, venue, DOI | VERIFIED |
| Khurshid_2025 | lookup.py resolve '10.1038/s41746-025-02164-2' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Biton_2021 | lookup.py resolve '10.1093/ehjdh/ztab071' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Wagner_2024 | lookup.py resolve '10.1016/j.compbiomed.2024.108525' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (preprint year 2023) | first authors, year, title, venue, DOI | VERIFIED |
| Patlatzoglou_2025 | lookup.py resolve '10.1038/s41746-025-02122-y' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Kolda_2009 | lookup.py resolve '10.1137/07070111x' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Goulart_2020 | lookup.py resolve '10.1109/tsp.2020.2985591' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| https://doi.org/10.5281/zenodo.22227432 | lookup.py resolve '10.5281/zenodo.22227432' | OpenAlex, ratio 1.00 | OpenAlex (Crossref and Semantic Scholar: not found) | authors, year, title, venue (Zenodo), DOI | VERIFIED |
| https://doi.org/10.13026/4nqg-sb35 | lookup.py resolve '10.13026/4nqg-sb35'; lookup.py bibtex '10.13026/4nqg-sb35' | doi.org BibTeX record (year 2023, DOI 10.13026/4NQG-SB35) | doi.org BibTeX record; OpenAlex (title and first authors agree; it prints year 2022 and DOI 10.13026/b95v-ff39, another version of the data set, and links the open copy to 10.13026/4nqg-sb35) | authors, year, title, publisher, DOI | VERIFIED |
| Cox_1972 | lookup.py resolve '10.1111/j.2517-6161.1972.tb00899.x' | Crossref, ratio 1.00 | Crossref, OpenAlex (Semantic Scholar: not found) | author, year, title, venue, DOI | VERIFIED |
| Katzman_2018 | lookup.py resolve '10.1186/s12874-018-0482-1' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Johnson_2023 | lookup.py resolve '10.1038/s41597-022-01899-x' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Rix_2012 | lookup.py resolve '10.3109/14017431.2012.673728' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Vickers_2006 | lookup.py resolve '10.1177/0272989x06295361' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Collins_2024 | lookup.py resolve '10.1136/bmj-2023-078378' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Zeiler_2014 | lookup.py resolve '10.1007/978-3-319-10590-1_53' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, chapter title, book series, DOI | VERIFIED |
| Ivanovs_2021 | lookup.py resolve '10.1016/j.patrec.2021.06.030' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| _imi__2025 | lookup.py resolve '10.1038/s41598-025-09538-2' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| McKeen_2025 | lookup.py resolve '10.1093/jamiaopen/ooaf122' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Pfeifer_2026 | lookup.py resolve '10.1016/j.hrthm.2026.03.1956' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Magnani_2013 | lookup.py resolve '10.1161/circep.112.975342' | Crossref, ratio 1.00 (title without the subtitle) | Crossref, OpenAlex (0.76, online year 2012), Semantic Scholar (0.74) | first authors, year, title, venue, DOI | VERIFIED |
| Tanaka_2021 | lookup.py resolve '10.1007/s00380-021-01805-2' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Yogeswaran_2025 | lookup.py resolve '10.1161/jaha.125.043590' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Emmanuela_2026 | lookup.py resolve '10.3897/bgcardio.32.e213539' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Ostrowska_2022 | lookup.py resolve '10.1536/ihj.21-797' | Crossref, ratio 1.00 (title without the subtitle) | Crossref, OpenAlex (0.82, with the subtitle), Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Goette_2016 | lookup.py resolve '10.1016/j.joa.2016.05.002' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Maezono_2025 | lookup.py resolve '10.1093/ehjopen/oeaf126' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Yao_2019 | lookup.py resolve '10.2147/clep.s206267' | Crossref, ratio 1.00 (its title holds the same markup as the entry) | Crossref, OpenAlex (0.97, clean title), Semantic Scholar (0.97) | first authors, year, title, venue, DOI | VERIFIED |
| Malmo_2016 | lookup.py resolve '10.2147/clep.s103346' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (0.99) | first authors, year, title, venue, DOI | VERIFIED |
| arxiv_1810_03292 | lookup.py resolve '1810.03292' | arXiv, ratio 1.00 | arXiv, OpenAlex, Semantic Scholar | first authors, year, title, arXiv ID | VERIFIED |
| arxiv_1806_10758 | lookup.py resolve '1806.10758' | arXiv, ratio 1.00 | arXiv, OpenAlex, Semantic Scholar | first authors, year, title, arXiv ID | VERIFIED |
| arxiv_2007_04612 | lookup.py resolve '2007.04612' | arXiv, ratio 1.00 | arXiv, OpenAlex (Semantic Scholar left out twice, HTTP 429 after 3 retries) | first authors, year, title, arXiv ID | VERIFIED |
| arxiv_2106_13314 | lookup.py resolve '2106.13314' | arXiv, ratio 1.00 | arXiv, OpenAlex (Semantic Scholar left out twice, HTTP 429 after 3 retries) | first authors, year, title, arXiv ID | VERIFIED |
| arxiv_2205_10268 | lookup.py resolve '2205.10268' | arXiv, ratio 1.00 | arXiv, OpenAlex (record of the CVPR 2022 version) (Semantic Scholar left out twice, HTTP 429 after 3 retries) | authors, year, title, arXiv ID | VERIFIED |
| arxiv_2504_02667 | lookup.py resolve '2504.02667' | arXiv, ratio 1.00 | arXiv, OpenAlex (Semantic Scholar left out twice, HTTP 429 after 3 retries) | first authors, year, title, arXiv ID | VERIFIED |
| arxiv_2507_16761 | lookup.py resolve '2507.16761' | arXiv, ratio 1.00 | arXiv, Semantic Scholar, OpenAlex (record of the LNCS 2026 version) | first authors, year, title, arXiv ID | VERIFIED |
| arxiv_2511_04292 | lookup.py resolve '2511.04292' | arXiv, ratio 1.00 | arXiv, OpenAlex (Semantic Scholar left out twice, HTTP 429 after 3 retries) | first authors, year, title, arXiv ID | VERIFIED |
| arxiv_1702_04595 | lookup.py resolve '1702.04595' | arXiv, ratio 1.00 | arXiv, OpenAlex, Semantic Scholar (second call) | first authors, year, title, arXiv ID | VERIFIED |

Texts read in this run with `python3 lookup.py fetch '<DOI or arXiv ID>' '<temporary folder>' '<key>'`: full text for Van_Gelder_2024, Tsiartas_2025, Rudin_2019 (arXiv 1811.10154v3), Ye_2020 (arXiv 2010.04963), Faes_2024 (KU Leuven repository copy), Ribeiro_2020, Khurshid_2025, Patlatzoglou_2025, Katzman_2018, Johnson_2023, Collins_2024, Zeiler_2014, Emmanuela_2026, Ostrowska_2022 and the nine arXiv entries. The other 41 cited entries gave the abstract only: every open copy the indexes listed answered HTTP 403 or 404, was an HTML page other than arxiv.org/html (PubMed Central, ScienceDirect, HAL, Zenodo, PhysioNet), or no index listed an open copy. Each claim on those sources is judged on the abstract and marked "abstract only". No fetched text addressed the agent.

### Claims
| # | Claim | Source | Section | Verdict | Detail |
|---|---|---|---|---|---|
| 1 | AF is a common arrhythmia whose first presentation can be a stroke or heart failure | Kashou_2021 | 1.1 | MINOR_DISTORTION | abstract only; the source restricts this to asymptomatic AF (C8) |
| 2 | AF carried a near fivefold excess of stroke; attributable risk 1.5% at 50 to 59 to 23.5% at 80 to 89 | Wolf_1991 | 1.1 | VERIFIED | abstract only |
| 3 | Over 50 years prevalence rose about fourfold, incidence more than tripled, in part through surveillance | Schnabel_2015 | 1.1 | VERIFIED | abstract only |
| 4 | CHARGE-AF estimates AF risk from routine variables | Alonso_2013 | 1.1 | VERIFIED | abstract only |
| 5 | Clinical scores need time-intensive data abstraction, a model of a single ECG needs none | Kashou_2021 | 1.1 | MINOR_DISTORTION | abstract only; the source says this of the one model it discusses (C9) |
| 6 | A network trained on 1.6 million ECGs reached AUROC 0.85 for new-onset AF within one year | Raghunath_2021 | 1.1 | VERIFIED | abstract only |
| 7 | ECG network plus CHARGE-AF had the highest discrimination in an internal and two external test sets | Khurshid_2022 | 1.1 | VERIFIED | abstract only |
| 8 | The 2024 ESC guideline states that clinical performance and broad applicability of AI algorithms for AF are not yet known | Van_Gelder_2024 | 1.1 | MINOR_DISTORTION | section 10.2; the guideline says it of AI algorithms for AF diagnosis (C10) |
| 9 | Review of 14 studies: median AUC 0.740; 0.851 for 31-day against 0.630 for 1-year windows; 11 studies cited misclassification of negative cases | Tsiartas_2025 | 1.1 | VERIFIED | abstract (Results) of the full text |
| 10 | A commentary on incident-AF prediction asked for more than trust in a black box | Kashou_2021 | 1.2 | UNVERIFIABLE_ACCESS | the abstract read does not hold it; no open copy (OpenAlex, Semantic Scholar: no open-access URL; doi.org answers 403). The record's title reads "more than just trusting the 'black box'" (C5) |
| 11 | A narrative review names interpretability as a barrier to clinical use | Saiz_Vivo_2025 | 1.2 | VERIFIED | abstract only |
| 12 | Twelve attribution methods agreed poorly, were moderately self-consistent; weight randomisation did not remove the pattern entirely for some | Arends_2026 | 1.2 | VERIFIED | abstract only |
| 13 | Rudin argued that a high-stakes model should be interpretable by design | Rudin_2019 | 1.2 | VERIFIED | abstract; read in arXiv 1811.10154v3, the claim is the title of the cited journal article |
| 14 | A block-term decomposition splits a multiway signal into blocks with low-rank factors per mode | De_Lathauwer_2008 | 1.2 | VERIFIED | abstract only |
| 15 | In neural networks block-term structure has compressed weights whose factors are not read | Ye_2020 | 1.2 | AMBIGUOUS | abstract and section 4.4.7; compression supported, "factors are not read" is neither stated nor contradicted (C15) |
| 16 | In supervised regression of brain signals block-term structure produced factors that predict and that are read | Faes_2024 | 1.2 | AMBIGUOUS | section II; the source builds BTTR "for high flexibility and interpretability" and shows no reading of its factors (C16) |
| 17 | Clinical risk factors complement the ECG | Khurshid_2022 | 1.2 | VERIFIED | abstract only |
| 18 | A third of the AF-labelled ECGs of this database did not show AF on expert review | Valasakis_2026 | 1.3 | MINOR_DISTORTION | abstract only; the source reviewed a sample of 700 ECGs (C11) |
| 19 | A CNN trained on 649,931 sinus-rhythm ECGs of the Mayo Clinic identified AF with AUC 0.87, counting prior AF as positive | Attia_2019 | 2.1 | MAJOR_DISTORTION | abstract only; 649,931 is the number of ECGs analysed, the training set held 454,789 (C2) |
| 20 | A network for AF within 31 days reached AUROC 0.86 on held-out VA ECGs and 0.93 at a non-VA site | Yuan_2023 | 2.1 | VERIFIED | abstract only |
| 21 | Studies with 31-day windows reported higher AUCs than studies with 1-year windows | Tsiartas_2025 | 2.1 | MINOR_DISTORTION | Results; the comparison is between models grouped by window (C12) |
| 22 | A narrative review found AI more accurate at shorter event horizons | Saiz_Vivo_2025 | 2.1 | VERIFIED | abstract only |
| 23 | Raghunath et al. reached AUROC 0.85 for new-onset AF within one year on ECGs from 430,000 patients | Raghunath_2021 | 2.1 | VERIFIED | abstract only |
| 24 | A Montreal model reached 0.78 at five years and 0.77 on external validation in MIMIC-IV | Jabbour_2024 | 2.1 | VERIFIED | abstract only |
| 25 | On BIDMC a CNN with a discrete-time survival loss reached a C-index of 0.750 | Sau_2026 | 2.1 | VERIFIED | abstract only |
| 26 | An ECG-image model on the same hospital reached a C-statistic of 0.754 | Zeidaabadi_2026 | 2.1 | VERIFIED | abstract only |
| 27 | In Brazilian telehealth data a residual CNN with survival analysis reached AUC 0.845 | Habineza_2023 | 2.1 | VERIFIED | abstract only |
| 28 | That data comes from the data family of an earlier 12-lead diagnostic network | Ribeiro_2020 | 2.1 | VERIFIED | abstract of the full text |
| 29 | A gradient-boosting survival model of 417 ECG features reached C-index 0.781, mean follow-up 80 days | Riek_2026 | 2.1 | VERIFIED | abstract only |
| 30 | Saliency gave the P-wave the greatest influence in one ECG network | Khurshid_2022 | 2.1 | VERIFIED | abstract only |
| 31 | Saliency of the image model focused on P-wave morphology and the PR interval | Zeidaabadi_2026 | 2.1 | VERIFIED | abstract only |
| 32 | The feature-based model named lower P-wave amplitude among its predictors | Riek_2026 | 2.1 | VERIFIED | abstract only |
| 33 | The Framingham score used age, sex, murmur, heart failure, SBP, hypertension treatment, BMI and PR interval, C statistic 0.78 | Schnabel_2009 | 2.2 | VERIFIED | abstract only |
| 34 | CHARGE-AF reached 0.765 at derivation, 0.664 and 0.705 in validation; ECG variables did not improve it | Alonso_2013 | 2.2 | VERIFIED | abstract only |
| 35 | Each 20 ms of PR interval carried an adjusted HR of 1.12 for AF | Cheng_2009 | 2.2 | VERIFIED | abstract only |
| 36 | P-wave duration above 120 ms had HR 1.55; P-wave indices added little discrimination | Magnani_2015 | 2.2 | VERIFIED | abstract only |
| 37 | AUROC comparable for CHARGE-AF and ECG network in three test sets, highest for the combination at 0.838, 0.777 and 0.746 | Khurshid_2022 | 2.2 | VERIFIED | abstract only |
| 38 | In an older community cohort AI-ECG and CHARGE-AF both had C 0.69, predicted AF independently, 0.72 together | Christopoulos_2020 | 2.2 | VERIFIED | abstract only |
| 39 | A single-lead ECG model with age and sex had AUROC 0.695 against 0.679 for CHARGE-AF in trial data | Khurshid_2025 | 2.2 | VERIFIED | abstract of the full text |
| 40 | A random forest that fused deep ECG features with clinical data reached 0.909 against 0.839 | Biton_2021 | 2.2 | MINOR_DISTORTION | abstract only; the 0.909 model combined four modalities, engineered ECG features among them (C13) |
| 41 | In 2,301 Montreal patients the ECG model exceeded CHARGE-AF (0.62) and a polygenic score (0.59) | Jabbour_2024 | 2.2 | VERIFIED | abstract only |
| 42 | An image-based ECG model reached 0.696 against 0.667 for CHARGE-AF, 0.711 combined | Zeidaabadi_2026 | 2.2 | VERIFIED | abstract only |
| 43 | An ECG model led in hospital patients, CHARGE-AF was the best single predictor in UK Biobank | Sau_2026 | 2.2 | VERIFIED | abstract only |
| 44 | Parameter and label randomisation showed some saliency methods independent of model and data-generating process | arxiv_1810_03292 | 2.3 | VERIFIED | abstract |
| 45 | Under remove-and-retrain only VarGrad and SmoothGrad-Squared beat a random assignment of importance | arxiv_1806_10758 | 2.3 | VERIFIED | section 1 |
| 46 | Twelve ECG attribution methods agreed poorly; self-consistency moderate, mean correlations 0.41 to 0.65 | Arends_2026 | 2.3 | VERIFIED | abstract only |
| 47 | Dataset-level auditing with sanity checks aligned saliency with cardiologists' rules and supported knowledge discovery | Wagner_2024 | 2.3 | VERIFIED | abstract only |
| 48 | Concept bottleneck models reach competitive accuracy; correcting concepts at test time raised accuracy | arxiv_2007_04612 | 2.3 | VERIFIED | abstract |
| 49 | Concept representations encode information beyond the named concepts, making the downstream reading misleading | arxiv_2106_13314 | 2.3 | VERIFIED | abstract |
| 50 | B-cos networks summarise the computation as one linear transform at similar ImageNet accuracy | arxiv_2205_10268 | 2.3 | VERIFIED | section 1 |
| 51 | An anti-aliased B-cos variant gave artifact-free explanations on chest x-rays and kept its performance | arxiv_2507_16761 | 2.3 | VERIFIED | abstract |
| 52 | Tensor-network structure combined with deep networks gave weight-based interpretability at equal accuracy, in preliminary results | arxiv_2504_02667 | 2.3 | VERIFIED | abstract and section 1 |
| 53 | A study of VAE representations of interpretable ECG features reported a cost of intrinsic explainability | Patlatzoglou_2025 | 2.3 | VERIFIED | abstract |
| 54 | A block-term discriminant method reported no cost on EEG decoding, ROC-AUC 64.52% against 61.00% on motor imagery | arxiv_2511_04292 | 2.3 | MAJOR_DISTORTION | abstract and section on motor imagery; 64.52% and 61.00% are mean accuracies, not ROC-AUC (C3) |
| 55 | Image networks interpretable by design also kept their accuracy | arxiv_2205_10268; arxiv_2507_16761 | 2.3 | VERIFIED | as rows 50 and 51 |
| 56 | A block-term decomposition is a sum of blocks of low multilinear rank and contains CP and Tucker as special cases | De_Lathauwer_2008; Kolda_2009 | 2.4 | VERIFIED | abstract only, both |
| 57 | Block-term tensor neural networks approximate weight matrices of CNNs and RNNs to compress them, and their factors are not interpreted | Ye_2020 | 2.4 | AMBIGUOUS | abstract and section 4.4.7 (C15) |
| 58 | On AF ECGs a regularised BTD extracted signals interpretable as AF patterns; it separates sources | Goulart_2020 | 2.4 | VERIFIED | abstract only |
| 59 | BTTR predicted finger trajectories from intracranial recordings with automatic component extraction | Faes_2024 | 2.4 | VERIFIED | abstract |
| 60 | A block-term discriminant analysis gave interpretable, efficient dimensionality reduction, ROC-AUC 91.25% on ERPs | arxiv_2511_04292 | 2.4 | VERIFIED | abstract |
| 61 | Linear BTTR has been applied to identification of AF in sinus rhythm on the median beat | https://doi.org/10.5281/zenodo.22227432 | 2.4 | VERIFIED | abstract only |
| 62 | Each index ECG is a 10-second, 12-lead recording sampled at 500 Hz | https://doi.org/10.13026/4nqg-sb35 | 3.1 | VERIFIED | abstract only (data set description) |
| 63 | The mode-n product is defined as in the cited survey | Kolda_2009 | 3.1 | UNVERIFIABLE_ACCESS | the abstract does not define the mode-n product; no open copy (OpenAlex, Semantic Scholar: no open-access URL) (C6) |
| 64 | The projection has the multilinear form of a block term | De_Lathauwer_2008 | 3.1 | AMBIGUOUS | abstract only; the source characterises a block term by mode-n ranks, the comparison with a projection is the paper's own (C18) |
| 65 | BTTN generalises BTTR, which fits blocks by deflation, keeps a static score vector per block and predicts with a linear score fitted by least squares | Faes_2024 | 3.1 | AMBIGUOUS | section III; deflation, score vectors and the linear prediction are stated, "least squares" is not (C17) |
| 66 | BTTR blocks have two factor matrices, a core and a static score vector, fitted by deflation, linear score | Faes_2024 | 3.1, figure caption | VERIFIED | section III, equation 2 |
| 67 | BTTN is trained with the negative Cox partial log-likelihood | Cox_1972 | 3.2 | VERIFIED | abstract only |
| 68 | DeepSurv trains a neural network with the Cox partial likelihood | Katzman_2018 | 3.2 | VERIFIED | Methods |
| 69 | Other AF survival models are trained with the Cox partial likelihood | Sau_2026 | 3.2 | MAJOR_DISTORTION | abstract only; the cited model uses a discrete-time survival loss (C4) |
| 70 | Age is the anchor age of MIMIC-IV | Johnson_2023 | 3.3 | VERIFIED | section on the patients table |
| 71 | MIMIC-IV-ECG holds about 800,000 ECGs from nearly 160,000 patients | https://doi.org/10.13026/4nqg-sb35 | 4.1 | VERIFIED | abstract only |
| 72 | MIMIC-IV is drawn from the electronic health record of BIDMC | Johnson_2023 | 4.1 | VERIFIED | abstract |
| 73 | A coded flutter diagnosis did not reliably separate flutter from AF in a registry validation | Rix_2012 | 4.1 | VERIFIED | abstract only |
| 74 | Only 65.4% of 700 AF-labelled ECGs in MIMIC-IV showed AF on expert review | Valasakis_2026 | 4.1 | VERIFIED | abstract only |
| 75 | Linear BTTR is the cited method of the baseline | Faes_2024 | 4.2 | VERIFIED | section III |
| 76 | Decision curves | Vickers_2006 | 4.2 | VERIFIED | abstract only |
| 77 | The study is reported with reference to TRIPOD+AI | Collins_2024 | 4.2 | VERIFIED | abstract |
| 78 | Occlusion sensitivity covers part of the input and records the change in the output | Zeiler_2014 | 4.3 | VERIFIED | section 4.2 "Occlusion Sensitivity" |
| 79 | Occlusion is one of the perturbation-based explanation methods | Ivanovs_2021 | 4.3 | VERIFIED | abstract only |
| 80 | The replacement value and the window size shape an occlusion map | arxiv_1702_04595; _imi__2025 | 4.3 | VERIFIED | section 3.1 and section 4 (window size); _imi__2025 abstract only |
| 81 | On the hospital behind MIMIC-IV a survival-loss CNN reached C 0.750 and an image model 0.754 | Sau_2026; Zeidaabadi_2026 | 5.1 | VERIFIED | abstract only, both |
| 82 | A Montreal model reached AUROC 0.77 on MIMIC-IV at five years | Jabbour_2024 | 5.1 | UNVERIFIABLE_ACCESS | the abstract gives 0.77 for MIMIC-IV with a median follow-up of 1.1 years and no horizon; the full text answered 403 (C7) |
| 83 | AUROC 0.85 at one year, and a C-index of 0.781 over a short follow-up, were reported | Raghunath_2021; Riek_2026 | 5.1 | VERIFIED | abstract only, both |
| 84 | A systematic review shows how far outcome choices move reported values | Tsiartas_2025 | 5.1 | VERIFIED | Results |
| 85 | Identification studies address another task | Attia_2019; Yuan_2023 | 5.1 | VERIFIED | abstract only, both |
| 86 | AF diagnosis on MIMIC-IV-ECG, where a foundation model reached AUROC 0.996 | McKeen_2025 | 5.1 | AMBIGUOUS | abstract only; the abstract does not tie the 0.996 to the MIMIC-IV-ECG benchmark (C19) |
| 87 | ECG and clinical information are complementary | Khurshid_2022; Christopoulos_2020 | 5.1 | VERIFIED | abstract only, both |
| 88 | An externally validated model flagged 9.7% of older patients, sensitivity 31%, specificity 92%, chart-confirmed endpoints | Pfeifer_2026 | 5.1 | VERIFIED | abstract only |
| 89 | A reported accuracy cost of intrinsic interpretability on the ECG | Patlatzoglou_2025 | 5.1 | VERIFIED | abstract |
| 90 | Concept representations absorb information beyond their concepts | arxiv_2106_13314 | 5.2 | VERIFIED | abstract |
| 91 | Saliency pointed to the P-wave, and to P-wave morphology and the PR interval | Khurshid_2022; Zeidaabadi_2026 | 5.2 | VERIFIED | abstract only, both |
| 92 | In Framingham the PR interval was a predictor in the AF risk score | Schnabel_2009 | 5.2 | VERIFIED | abstract only |
| 93 | First-degree AV block carried an adjusted HR of 2.06 | Cheng_2009 | 5.2 | VERIFIED | abstract only |
| 94 | Each SD of PR interval carried HR 1.13 in older Black and White adults | Magnani_2013 | 5.2 | VERIFIED | abstract only |
| 95 | First-degree block carried HR 1.75 in an older Japanese population | Tanaka_2021 | 5.2 | VERIFIED | abstract only |
| 96 | In the Jackson Heart Study PR interval, P-wave duration and P-wave terminal force were each associated with AF | Yogeswaran_2025 | 5.2 | VERIFIED | abstract only |
| 97 | P-wave indices show the same direction, the meta-analysis at very low certainty in selected populations | Magnani_2015; Emmanuela_2026 | 5.2 | VERIFIED | Magnani_2015 abstract only; Emmanuela_2026 abstract and limitations |
| 98 | In 70-year-old Swedes the PR interval in V1 was not related to AF, a short P-wave duration was | Ostrowska_2022 | 5.2 | VERIFIED | abstract and Results |
| 99 | An expert consensus describes atrial cardiomyopathy as structural and electrical atrial changes that affect the occurrence of arrhythmia | Goette_2016 | 5.2 | MINOR_DISTORTION | text returned as abstract, section 1.1; the definition says "clinically-relevant manifestations" (C14) |
| 100 | In a Japanese community cohort prolonged P-wave duration was associated with incident AF and more left atrial fibrosis at autopsy | Maezono_2025 | 5.2 | VERIFIED | abstract only |
| 101 | A meta-analysis of 24 studies pooled PPV 88% and sensitivity 80% for administrative AF definitions | Yao_2019 | 5.3 | VERIFIED | abstract only |
| 102 | A discharge diagnosis found 73.7% of record-verified AF, PPV 88.5% | Malmo_2016 | 5.3 | VERIFIED | abstract only |
| 103 | A registry found PPV 92.6% for combined AF or flutter | Rix_2012 | 5.3 | VERIFIED | abstract only |
| 104 | The anchor age of MIMIC-IV is not the age at the index ECG | Johnson_2023 | 5.3 | VERIFIED | section on the patients table |
| 105 | The clinical factors omit Framingham variables: SBP, hypertension treatment, BMI, heart failure | Schnabel_2009 | 5.3 | VERIFIED | abstract only |
| 106 | The PR interval is a known AF predictor | Cheng_2009; Magnani_2013 | 5.3 | VERIFIED | abstract only, both |
| 107 | The readout is open to the critiques of post-hoc attribution | arxiv_1810_03292; arxiv_1806_10758; Arends_2026 | 5.3 | VERIFIED | as rows 44 to 46 |
| 108 | Zero replacement and window size shape the profile | arxiv_1702_04595; _imi__2025 | 5.3 | VERIFIED | as row 80 |
| 109 | Readable factors do not by themselves show that a nonlinear head routes its decision through them | arxiv_2106_13314 | 3.3 and 5.3 | VERIFIED | abstract |
| 110 | Cohort studies of the PR interval tie that part of the cardiac cycle to later AF | Cheng_2009; Magnani_2013 | 6 | VERIFIED | abstract only, both |
| 111 | The data come from MIMIC-IV-ECG and the hospital module of MIMIC-IV | https://doi.org/10.13026/4nqg-sb35; Johnson_2023 | Data availability | VERIFIED | identification of the data sets; the access terms are the authors' statement |

Clinical checks (Discipline names a clinical field, and cited sentences concern patients). Reference existence: passed for every cited work. Claim anchor: failed for rows 10, 63 and 82 (C5 to C7). Population match: failed for rows 1 and 18 (C8, C11). Outcome match: failed for rows 19, 54 and 69 (C2 to C4) and row 21 (C12). Strength of conclusion: no failure found; the text keeps "associated", "hypothesis" and the overlap of the intervals. Clinical boundary: passed; the text frames its results as research and names external validation as a requirement before any clinical use (Conclusion, last paragraph).

This is research, evidence synthesis, or documentation support only. It is not patient-specific diagnosis, treatment, triage, or clinical decision support.

### Corrections made
| # | Location | Error | Correction |
|---|---|---|---|
| none | | No patch is written in this start, because C1 is a systematic format error | |

### Items flagged for review

#### Systematic format error
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C1 | refs.bib, 53 entries | Systematic format error: 53 of 64 cited entries (82.8 percent) hold a `url` field with `http://dx.doi.org/<doi>` (55 entries of the file, 2 of them unused). The likely cause is the way the entries were made: each is the BibTeX that doi.org returns by content negotiation (the Crossref export form, with `url={http://dx.doi.org/...}`, a `DOI=` field and `month=` abbreviations). The Citation style row (Vancouver) agrees with `\bibliographystyle{vancouver}`, so the style row is not the cause. | needs the user: confirm the Citation style row (Vancouver). In the second start each such `url` becomes `https://doi.org/<doi>`, entry by entry, in patch 04, with the corrections C32 to C39 below. |

#### Claims the run cannot support (the stop "A claim the run cannot support")
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C2 | main.tex, 2.1, first paragraph (Attia_2019) | MAJOR_DISTORTION, SERIOUS. "A CNN trained on 649,931 sinus-rhythm ECGs of the Mayo Clinic". Sub-claims: trained on 649,931 ECGs, not supported (649,931 is the number of ECGs analysed; 454,789 were in the training set); AUC 0.87, supported; prior AF counted as positive, supported. | Wording the abstract supports: "A CNN developed on 649,931 sinus-rhythm ECGs of 180,922 Mayo Clinic patients, 454,789 of them in its training set, identified patients with AF with an AUC of 0.87 (abstract), counting AF before the tested ECG as positive." |
| C3 | main.tex, 2.3, third paragraph (arxiv_2511_04292) | MAJOR_DISTORTION, SERIOUS. "with an ROC-AUC of 64.52% against 61.00% for its predecessor on motor imagery". Sub-claims: no cost of interpretability, supported; 64.52% against 61.00%, supported as numbers; ROC-AUC, not supported: on motor imagery the source reports mean accuracy, and gives ROC-AUC only for the ERP result (91.25%). | "with a mean accuracy of 64.52% against 61.00% for its predecessor, higher-order discriminant analysis, on motor imagery". |
| C4 | main.tex, 3.2, first paragraph (Sau_2026) | MAJOR_DISTORTION, SERIOUS. "BTTN is trained with the negative Cox partial log-likelihood, as DeepSurv trains a neural network and as other AF survival models do \cite{Sau_2026}". The cited model, AIRE-AF, is "a convolutional neural network with a discrete-time survival loss function" (abstract), which section 2.1 of the draft also states. Sub-claims: Cox likelihood (Cox_1972), supported; DeepSurv (Katzman_2018), supported; other AF survival models use it (Sau_2026), not supported. | Remove the third clause, or write: "as DeepSurv trains a neural network \cite{Katzman_2018}; an AF survival network on the same hospital used a discrete-time survival loss instead \cite{Sau_2026}". No source read in this run holds an AF survival network trained with the Cox partial likelihood. |
| C5 | main.tex, 1.2, first paragraph (Kashou_2021) | UNVERIFIABLE_ACCESS, MEDIUM. "A commentary on incident-AF prediction asked for more than trust in a black box". The abstract text read does not hold this. URLs tried: OpenAlex and Semantic Scholar list no open copy; https://doi.org/10.1136/heartjnl-2021-319385 answered 403 (check-urls). The Crossref record's title is "Predicting incident atrial fibrillation in sinus rhythm: more than just trusting the 'black box'". | needs the user: supply the full text, or rest the sentence on the title, for example "A commentary titled 'more than just trusting the black box' discussed ...", which the record holds. |
| C6 | main.tex, 3.1, after equation 1 (Kolda_2009) | UNVERIFIABLE_ACCESS, MEDIUM. "where $\times_n$ denotes the mode-$n$ product \cite{Kolda_2009}". The abstract does not define the mode-n product. URLs tried: OpenAlex and Semantic Scholar list no open copy; https://doi.org/10.1137/07070111x answered 403 (check-urls). | needs the user: supply the full text (the definition is in its section on notation), or define the mode-n product in the sentence itself. |
| C7 | main.tex, 5.1, second paragraph (Jabbour_2024) | UNVERIFIABLE_ACCESS, MEDIUM. "A Montreal model reached an AUROC of 0.77 on MIMIC-IV at five years". The abstract gives 0.77 for the MIMIC-IV validation with "median follow-up 1.1 year" and names no horizon for it; the five-year horizon is stated for the primary outcome in Montreal. URL tried: https://doi.org/10.1093/eurheartj/ehae595, 403. Sub-claims: 0.77 on MIMIC-IV, supported; at five years, not held by the abstract. | Drop "at five years", as section 2.1 already does: "A Montreal model reached an AUROC of 0.77 on external validation in MIMIC-IV, with a label source that its abstract does not state." |

#### Claims that drift from their source (suggested wording, no patch)
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C8 | main.tex, 1.1, first sentence (Kashou_2021) | MINOR_DISTORTION, population widens: the source says "the first clinical presentation of those with asymptomatic AF may be" a stroke or heart failure. | "Atrial fibrillation (AF) is a common arrhythmia, and in people with asymptomatic AF the first presentation may be a stroke or heart failure." |
| C9 | main.tex, 1.1, last sentences (Kashou_2021) | MINOR_DISTORTION: the source says the one model it discusses "could be applied to a single ECG at the point of care without additional data abstraction"; the draft says it of any model of a single ECG. | "whereas a model applied to a single ECG at the point of care needs no additional data abstraction". |
| C10 | main.tex, 1.1, second paragraph (Van_Gelder_2024) | MINOR_DISTORTION: in section 10.2 the guideline says this of algorithms "to improve automated AF diagnosis"; the draft places it after results on predicting new-onset AF and writes "AI algorithms for AF". | "states that the clinical performance and broad applicability of AI algorithms for the diagnosis of AF are not yet known". |
| C11 | main.tex, 1.3, end of first paragraph (Valasakis_2026) | MINOR_DISTORTION, population widens: the source reviewed a random sample of 700 AF-labelled ECGs, and the draft writes "a third of the AF-labelled ECGs of this database". Section 4.1 states the sample correctly. | "since a third of a sample of 700 AF-labelled ECGs of this database did not show AF on expert review". |
| C12 | main.tex, 2.1, first paragraph (Tsiartas_2025) | MINOR_DISTORTION: the review compares the 33 models grouped by confirmation window, not studies. | "In a systematic review, models with 31-day confirmation windows had higher median AUCs than models with 1-year windows". |
| C13 | main.tex, 2.2, second paragraph (Biton_2021) | MINOR_DISTORTION: the 0.909 model combined demographics, clinical information, engineered ECG features and deep ECG features. | "A random forest that combined demographic, clinical, engineered and deep ECG features reached 0.909, against 0.839 for the best single modality". |
| C14 | main.tex, 5.2, last paragraph (Goette_2016) | MINOR_DISTORTION: the working definition is "Any complex of structural, architectural, contractile or electrophysiological changes affecting the atria with the potential to produce clinically-relevant manifestations"; the draft narrows the manifestations to arrhythmia. | "An expert consensus defines atrial cardiomyopathy as structural, architectural, contractile or electrophysiological changes of the atria that can produce clinically relevant manifestations, among them arrhythmia". |
| C15 | main.tex, 1.2 second paragraph and 2.4 first paragraph (Ye_2020) | AMBIGUOUS: compression of weight matrices by block-term tensors is supported; "whose factors are not read" and "their factors are not interpreted" are neither stated nor contradicted. The source explains its networks with Grad-CAM (section 4.4.7). | "... to compress them, and they are explained with Grad-CAM maps of their feature maps, not through their factors". |
| C16 | main.tex, 1.2, second paragraph (Faes_2024) | AMBIGUOUS: the source designs BTTR "for high flexibility and interpretability" and reports prediction results; it reads no factor. | "In supervised regression of brain signals, block-term tensor regression, designed to be interpretable, predicted finger movements". |
| C17 | main.tex, 3.1, third paragraph (Faes_2024) | AMBIGUOUS: deflation, the score vectors and the linear prediction are stated; "fitted by least squares" is not (the source writes the coefficient as $b_k = t_k^\top f_k$ and the prediction as a linear regression). | "keeps a static score vector per block and predicts with a linear score". |
| C18 | main.tex, 3.1, after equation 1 (De_Lathauwer_2008) | AMBIGUOUS: the abstract characterises a block term by its mode-n ranks; the statement that the projection has the form of a block term is the paper's own comparison. | "The projection reduces the frequency and lead modes to ranks 3 and 2, the mode-n ranks by which a block term is characterised \cite{De_Lathauwer_2008}". |
| C19 | main.tex, 5.1, second paragraph (McKeen_2025) | AMBIGUOUS: the abstract introduces a benchmark on MIMIC-IV-ECG and reports AUROC 0.996 for AF, without saying which data set the 0.996 comes from; the full text answered 403. | Give the table of the full text as locator, or write "a foundation model with a benchmark on MIMIC-IV-ECG reported an AUROC of 0.996 for AF". |

#### Versions of one work
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C20 | refs.bib, Ye_2020; main.tex 1.2 and 2.4 | MEDIUM. The entry names the Neural Networks article (DOI 10.1016/j.neunet.2020.05.034); the passages were read in arXiv 2010.04963, the only open copy. | Author's choice: keep the journal entry and read the passages in the journal version, or cite the arXiv version, or keep both. No patch. (Rudin_2019 was also read in its arXiv copy; its claim is the title of the journal article, so it is the same in both versions. Faes_2024 was read in the KU Leuven repository copy of the TNNLS article.) |

#### Claims the paper must not make (Claims not to make (a) to (f))
No sentence states a listed claim. Three sentences come near one.
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C21 | main.tex, 5.1 Study cohort, last two sentences, and Table "tab:cohort", last two count rows | MEDIUM, near (a). "Of the controls, 40,960 (98.1\%) had an ECG after the index ECG. For 40,306 (96.5\%), the last of these ECGs was not read as AF." The second count is computed from the machine reads of the ECGs, the provisional ECG-report labels. It describes the gold-label cohort and is not an outcome. | needs the user: keep it as a description of the controls, or remove the count read from the ECG reports. |
| C22 | main.tex, 2.4, second paragraph (https://doi.org/10.5281/zenodo.22227432) | MEDIUM, near (c). "Linear BTTR has also been applied to the identification of AF in sinus rhythm on the median beat". The cited record is the PTB-XL AF-in-sinus-rhythm study; the sentence states no result of it. | needs the user: keep it as a pointer without a result, or remove it. |
| C23 | main.tex, 1.1, second paragraph, first sentence | MEDIUM, near (e). "Deep networks trained on sinus-rhythm ECGs predict AF that has not yet been diagnosed." AF that has not yet been diagnosed includes concurrent undetected AF, which is detection; the sentence that follows cites a new-onset result. | "Deep networks trained on sinus-rhythm ECGs predict new-onset AF." |

#### Claims against the list (intended-claims.md)
Each entry says only that the draft's text and its list differ.
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C24 | main.tex, 2.2, first paragraph | MEDIUM, not on the list: the discrimination of the clinical scores, "with a C statistic of 0.78", "CHARGE-AF reached 0.765 at derivation and 0.664 and 0.705 in two validation cohorts", "P-wave indices added little discrimination beyond traditional risk factors". | Add the claim to the list, or confirm it is meant. |
| C25 | main.tex, 2.2, third paragraph | MEDIUM, not on the list: "Other studies found the ECG model ahead of the clinical score." and "The ranking of ECG and clinical models also depends on the cohort." | Add the claim to the list, or confirm it is meant. |
| C26 | main.tex, 2.1, third paragraph | MEDIUM, not on the list: "None of them, however, reports a test of whether the explanation reflects what the model uses to predict." The sentence has no citation; its three sources were read as abstracts only. | Add the claim to the list, or confirm it is meant. |
| C27 | main.tex, 2.3, third paragraph | MEDIUM, not on the list: "No study in this literature compares an intrinsically interpretable model with a CNN on incident AF under one protocol." | Add the claim to the list, or confirm it is meant. |
| C28 | main.tex, 5.1 Study cohort, first paragraph | MEDIUM, not on the list: the cohort results (151,941 eligible patients, 8,775 events in the survival design, events by 1, 2 and 5 years, median follow-up of controls). | Add the claim to the list, or confirm it is meant. |
| C29 | main.tex, 5.2, end of the horizons paragraph | MEDIUM, not on the list: "One reason for the lower one-year values of the survival design is its control group." | Add the claim to the list, or confirm it is meant. |
| C30 | main.tex, 5.3, first paragraph, last two sentences | MEDIUM, not on the list: the decision-curve result ("all three models had positive net benefit at threshold probabilities below about 0.1. The curve of the fused model lay above the other two between about 0.03 and 0.1"). | Add the claim to the list, or confirm it is meant. |
| C31 | intended-claims.md, item 25 | MEDIUM, intended, not made: "The clinical comparator uses a subset of the CHARGE-AF factors and omits the PR interval, a known AF predictor." The text (5.3, second paragraph) compares the clinical factors with the Framingham score, not CHARGE-AF; the PR-interval half is made. | Confirm which score the comparison names. |

#### The .bib entries
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C32 | refs.bib, Cheng_2009 | MEDIUM, omitted co-authors. `author={Cheng, Susan}` copies the Crossref record, which lists one author; OpenAlex and Semantic Scholar list "Susan C. Cheng, Michelle J Keyes, Martin G Larson et al.". `resolve` prints three names only, so no record read in this run gives the whole list. `pages={2571}` gives the first page only. | needs the user: the author list and last page from the article's byline. No patch until a record gives the full list. |
| C33 | refs.bib, Magnani_2013 | MINOR, format: the author field ends in `Benjamin, Emelia J. and }`, an empty last author. | Second start, patch 04: remove the trailing ` and `. The empty name may stand for a group author (the Health ABC Study); the user may add it. |
| C34 | refs.bib, Goette_2016 | MINOR, format: the author field ends in `Nattel, Stanley and }`, an empty last author. | Second start, patch 04: remove the trailing ` and `. |
| C35 | refs.bib, Yao_2019 | MINOR, format: the title holds HTML markup `&lt;p&gt;...&lt;/p&gt;` (the file holds `&lt;p&gt;`, as the Crossref record does; it does not hold `&amp;lt;p&amp;gt;`), which prints as text; `volume={Volume 11}` holds the word "Volume". | Second start, patch 04: title "Sensitivity, specificity, positive and negative predictive values of identifying atrial fibrillation using administrative data: a systematic review and meta-analysis" (OpenAlex and Semantic Scholar records) and `volume={11}`. |
| C36 | refs.bib, Tanaka_2021 | MINOR, format: the title holds "aged" U+2009, U+2265 (the sign "greater than or equal"), U+2009, "60" U+00A0 "years". U+2265 and U+2009 are declared in none of the LaTeX base files `t1enc.dfu` and `utf8enc.dfu` of this installation (`grep '{2265}\|{2009}'` over `texmf-dist/tex/latex/base/*.dfu` finds nothing), so pdfLaTeX stops with "Unicode character not set up for use with LaTeX" when the reference list is typeset. | Second start, patch 04: "aged $\geq$ 60 years" with plain spaces. |
| C37 | refs.bib, unused entry https://doi.org/10.5281/zenodo.4916206 (CODE-15) | MINOR: the title `CODE-15%: ...` holds an unescaped `%`, which LaTeX reads as a comment if the entry is ever cited. The entry is unused, so it is not typeset now. | Second start, patch 04: `CODE-15\%`. The entry is not removed. |
| C38 | refs.bib, the nine arXiv entries | MINOR, missing DOI: arxiv_1810_03292, arxiv_1806_10758, arxiv_2007_04612, arxiv_2106_13314, arxiv_2504_02667, arxiv_2511_04292 and arxiv_1702_04595 have no `doi` field, and the OpenAlex record of each prints `doi 10.48550/arxiv.<id>` with agreeing title, first author and year. For arxiv_2205_10268 and arxiv_2507_16761 OpenAlex prints the DOI of the published version (CVPR 2022, LNCS 2026), another version. | Second start, patch 04: add `doi = {10.48550/arXiv.<id>}` to the seven. For the two others the author chooses between the arXiv version and the published version. |
| C39 | refs.bib, incomplete entries | MINOR, incomplete: no `pages` field in Christopoulos_2020, Khurshid_2025, Saiz_Vivo_2025, Riek_2026, Alonso_2013, Arends_2026, Patlatzoglou_2025, Johnson_2023, Ribeiro_2020, Valasakis_2026, Katzman_2018, McKeen_2025, Maezono_2025, Yogeswaran_2025, _imi__2025 (most are article-number journals); the first page only in Cheng_2009 (2571), Yuan_2023 (1131) and Malmo_2016 (185); no `volume` in Riek_2026 (article in press) and Malmo_2016. | Add the article number or page range from each article. No record read in this run gives them, so no patch. |
| C40 | refs.bib and main.tex, keys | MINOR: two cited keys are URLs (`https://doi.org/10.5281/zenodo.22227432`, `https://doi.org/10.13026/4nqg-sb35`) and one is garbled from a name with diacritics (`_imi__2025`, <latin capital letter s with caron>imi<latin small letter c with acute>). They resolve, but they break the Surname_Year form of the other keys. | Author's choice of names, for example Cornelissen_2026, Gow_2023 and Simic_2025, with each `\cite` rewritten. No patch, since the names are a choice. |

Characters checked and found handled: the U+2010 hyphens in Alonso_2013 (in "CHARGE-AF", written there with U+2010), Goette_2016 (two author names) and Yogeswaran_2025 (title and one author) are declared in `t1enc.dfu` line 294 and `utf8enc.dfu` line 545 (`\DeclareUnicodeCharacter{2010}{-}`), and U+00A0 (line 46 of both) and U+016B (`t1enc.dfu` line 214, `utf8enc.dfu` line 241) are declared too, so they need no change.

#### The reference list as a whole
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C41 | refs.bib, Magnani_2013, Magnani_2015, Rix_2012 | MINOR, currency: older than 10 years and not clearly seminal. Thirteen cited entries are older than 10 years (20.3 percent); the other ten (Wolf_1991, Cox_1972, Vickers_2006, De_Lathauwer_2008, Kolda_2009, Schnabel_2009, Cheng_2009, Alonso_2013, Zeiler_2014, Schnabel_2015) are the founding sources of the method, score or cohort result they are cited for. | Keep each where its cohort result is needed; Yogeswaran_2025 and Tanaka_2021 already carry the PR-interval association in newer cohorts. |

Citation density: every paragraph of the body with no citation describes the method or the study's own analysis (sections 3.2 to 4.3 in part, 5.1 to 5.4, 6.2 Future research, the Conclusion's first paragraph). No sentence carries more than 3 citations.

Predatory-venue screen: no venue a cited entry names shows a record sign (no over-broad name, the indexes spell each venue alike, no date after today, every DOI has the form 10.<digits>/<suffix>, no impossible volume). No venue is listed "not screened". Valasakis_2026 is a congress abstract in a European Heart Journal supplement.

Retractions: the check covers the notices Crossref lists, read from the `resolve` calls on each DOI above; Crossref's record of a source can lack a notice a publisher has issued. No call printed a "Crossref notice" line, so no source has a retraction, partial retraction or expression-of-concern notice in Crossref. The nine arXiv entries and the Zenodo and PhysioNet records have no Crossref record.

Unused entries (listed, not removed): Wagner_2020, https://doi.org/10.5281/zenodo.4916206, Mehari_2022, arxiv_2005_13249.

Passages that repeat an earlier paper: none listed (Earlier papers: none), so nothing was compared. A plagiarism tool such as iThenticate, Turnitin or Copyscape can screen the text against the wider literature.

### Passage lines
> [@Kashou_2021, abstract]: "the first clinical presentation of those with asymptomatic AF may be an acute ischaemic stroke or decompensated heart failure"
> [@Wolf_1991, abstract]: "a near fivefold excess when atrial fibrillation was present"
> [@Wolf_1991, abstract]: "rising from 1.5% for those aged 50-59 years to 23.5% for those aged 80-89 years"
> [@Schnabel_2015, abstract]: "We observed about a fourfold increase in the age-adjusted prevalence and more than a tripling in age-adjusted incidence of atrial fibrillation"
> [@Schnabel_2015, abstract]: "observed trends of increased incidence of atrial fibrillation in the community were partially due to enhanced surveillance"
> [@Alonso_2013, abstract]: "A risk model including variables readily available in primary care settings adequately predicted AF in diverse populations"
> [@Kashou_2021, abstract]: "These approaches, however, require timeintensive data abstraction of multiple variables"
> [@Kashou_2021, abstract]: "the model proposed in this current study could be applied to a single ECG at the point of care without additional data abstraction"
> [@Raghunath_2021, abstract]: "We used 1.6 M resting 12-lead digital ECG traces from 430 000 patients"
> [@Raghunath_2021, abstract]: "were 0.85 and 0.22, respectively, for predicting new-onset AF within 1 year of an ECG"
> [@Khurshid_2022, abstract]: "in an internal test set and 2 external test sets"
> [@Khurshid_2022, abstract]: "Area under the receiver operating characteristic curve was highest using CH-AI"
> [@Van_Gelder_2024, section 10.2]: "Algorithms have been created to improve automated AF diagnosis and several algorithms to aid diagnostics are being investigated."
> [@Van_Gelder_2024, section 10.2]: "However, the clinical performance and broad applicability of these solutions are not yet known."
> [@Tsiartas_2025, abstract, Results]: "Results 14 studies and 33 AI models were analysed."
> [@Tsiartas_2025, abstract, Results]: "and area under the receiver operating characteristic curve (AUC) 0.740 (0.630 to 0.830)"
> [@Tsiartas_2025, abstract, Results]: "higher accuracy (83.2% vs 56.0%; q=0.010) and AUC (0.851 vs 0.630; q<0.001) than those using a"
> [@Tsiartas_2025, abstract, Results]: "11 studies (78.6%) cited possible negative cases misclassification as a limitation"
> [@Kashou_2021, abstract]: "Therefore, the ability to identify individuals at increased risk of AF can aid in screening, surveillance, management and prevention strategies."
> [@Saiz_Vivo_2025, abstract]: "Issues such as algorithm interpretability, the requirement for extensive clinical validation, and integration into existing healthcare frameworks remain significant barriers."
> [@Arends_2026, abstract]: "Attribution methods demonstrated low correlation and high variability across inter-method comparisons."
> [@Arends_2026, abstract]: "Self-consistency across random model initializations was moderate for most methods"
> [@Arends_2026, abstract]: "Randomizing model weights led to rapid loss of correlation, although some methods did not converge to zero."
> [@Rudin_2019, abstract section]: "but trying to explain black box models, rather than creating models that are interpretable in the first place, is likely to perpetuate bad practices and can potentially cause catastrophic harm to society."
> [@De_Lathauwer_2008, abstract]: "we decompose a given tensor block into blocks of smaller size, where the size is characterized by a set of mode-n ranks"
> [@Ye_2020, abstract section]: "the correlations in the weight matrices, and approximate the weight matrices with the low-rank block-term tensors."
> [@Ye_2020, abstract section]: "achieve a very large compression ratio on the number of parameters while preserving or improving the representation power of the"
> [@Ye_2020, section 4.4.7]: "For explaining and interpreting the proposed architectures, we apply the Grad-CAM [34] visualization techniques to the proposed architectures."
> [@Faes_2024, section II]: "we include the proposed model into a deflation-based method for multiway regression, namely BTTR (Block Term Tensor Regression), for high flexibility and interpretability"
> [@Khurshid_2022, abstract]: "the approaches are complementary"
> [@Valasakis_2026, abstract]: "Over one-third of ECGs labelled as atrial fibrillation in this sample from MIMIC-IV do not show AF on expert review"
> [@Attia_2019, abstract]: "180 922 patients with 649 931 normal sinus rhythm ECGs for analysis: 454 789 ECGs recorded from 126 526 patients in the training dataset"
> [@Attia_2019, abstract]: "identified atrial fibrillation with an AUC of 0<middle dot>87"
> [@Attia_2019, abstract]: "patients in the testing dataset had verified atrial fibrillation before the normal sinus rhythm ECG tested by the model"
> [@Yuan_2023, abstract]: "trained to predict the presence of AF within 31 days of sinus rhythm ECGs"
> [@Yuan_2023, abstract]: "on held-out test ECGs at VA sites with an area under the receiver operating characteristic curve (AUROC) of 0.86"
> [@Yuan_2023, abstract]: "At the non-VA site, AUROC was 0.93"
> [@Tsiartas_2025, Results]: "The models were categorised based on AI technique (CML vs DL) and the timeframe for ECG confirmation of AF (within 31 days or less and within 31 days to 1 year; table 2)"
> [@Saiz_Vivo_2025, abstract]: "showed a higher accuracy in predicting AF from SR when the event horizon was shorter"
> [@Jabbour_2024, abstract]: "The primary outcome was incident AF at 5 years."
> [@Jabbour_2024, abstract]: "the ECG-AI model showed an area under the receiver operating characteristic (AUC-ROC) curve of .78"
> [@Jabbour_2024, abstract]: "median follow-up 1.1 year), ECG-AI model performance remained consistent (AUC-ROC = .77)"
> [@Sau_2026, abstract]: "a convolutional neural network with a discrete-time survival loss function"
> [@Sau_2026, abstract]: "In the BIDMC cohort, AIRE-AF predicted incident atrial fibrillation with a C-index of 0.750"
> [@Zeidaabadi_2026, abstract]: "The model achieved C-statistics of 0.754 (95% CI: 0.747-0.761) in the BIDMC dataset"
> [@Habineza_2023, abstract]: "The cohort is a collection of ECG recordings and annotations by the Telehealth Network of Minas Gerais, in Brazil."
> [@Habineza_2023, abstract]: "A convolutional neural network based on a residual network architecture was implemented"
> [@Habineza_2023, abstract]: "The deep neural network model identified patients without indication of AF in the presented ECG but who will develop AF in the future with an AUC score of 0.845."
> [@Ribeiro_2020, abstract section]: "Here we present a DNN model trained in a dataset with more than 2 million labeled exams analyzed by the Telehealth Network of Minas Gerais"
> [@Riek_2026, abstract]: "we extracted 417 features and trained multiple survival models to predict incident AF"
> [@Riek_2026, abstract]: "the gradient boosting survival model achieved highest performance (test C-index 0.781)"
> [@Riek_2026, abstract]: "average follow-up 80"
> [@Khurshid_2022, abstract]: "In saliency analyses, the ECG P-wave had the greatest influence on AI model predictions."
> [@Zeidaabadi_2026, abstract]: "Saliency mapping indicated the model primarily focused on P-wave morphology and PR interval regions."
> [@Riek_2026, abstract]: "Predictors included older age, lower P wave amplitude, and increased heart rate variability."
> [@Schnabel_2009, abstract]: "Age, sex, significant murmur, heart failure, systolic blood pressure, hypertension treatment, body mass index, and electrocardiographic PR interval were associated with incident AF (p<0.05; clinical model C statistic=0.78"
> [@Alonso_2013, abstract]: "0.765; 95% CI, 0.748 to 0.781"
> [@Alonso_2013, abstract]: "0.664; 95% CI, 0.632 to 0.697"
> [@Alonso_2013, abstract]: "0.705; 95% CI, 0.664 to 0.747"
> [@Alonso_2013, abstract]: "Addition of variables from the electrocardiogram did not improve the overall model discrimination"
> [@Cheng_2009, abstract]: "each 20-millisecond increment in PR was associated with an adjusted hazards ratio (HR) of 1.12"
> [@Magnani_2015, abstract]: "P-wave duration >120 ms was significantly associated with AF (hazard ratio [HR] 1.55"
> [@Magnani_2015, abstract]: "PWI had a limited contribution towards predictive risk beyond traditional risk factors and markers."
> [@Khurshid_2022, abstract]: "Area under the receiver operating characteristic curve was comparable using CHARGE-AF"
> [@Khurshid_2022, abstract]: "BWH, 0.777 [95% CI, 0.766 to 0.788]; UK Biobank, 0.746"
> [@Christopoulos_2020, abstract]: "median age 75.8"
> [@Christopoulos_2020, abstract]: "C statistics were 0.69 (95% CI, 0.66"
> [@Christopoulos_2020, abstract]: "for CHARGE-AF, and 0.72 (95% CI, 0.69"
> [@Christopoulos_2020, abstract]: "both the AI-ECG AF model output and CHARGE-AF score independently predicted incident AF"
> [@Khurshid_2025, abstract section]: "ECG-AI with age/sex (1L ECG-AI AS) had comparable discrimination (area under the"
> [@Khurshid_2025, abstract section]: "receiver operating characteristic curve [AUROC] 0.695[0.637-0.742]"
> [@Khurshid_2025, abstract section]: "to CHARGE-AF (AUROC 0.679[0.623-0.730]"
> [@Biton_2021, abstract]: "namely demographics, clinical information, engineered features, and features from deep representation learning"
> [@Biton_2021, abstract]: "with an area under the receiver operating characteristic curve (AUROC) = 0.909 against the best single modality model which had an AUROC = 0.839"
> [@Jabbour_2024, abstract]: "In a subgroup analysis of 2301 patients, ECG-AI outperformed CHARGE-AF (AUC-ROC = .62) and PGS (AUC-ROC = .59)."
> [@Zeidaabadi_2026, abstract]: "the AI-ECG model showed superior performance (c-statistic 0.696 vs 0.667, p<0.05) and provided significant additive value when combined (c-statistic 0.711"
> [@Sau_2026, abstract]: "AIRE-AF was superior to CHARGE-AF"
> [@Sau_2026, abstract]: "The single best performing single predictor in the volunteer population (UKB) was CHARGE-AF"
> [@arxiv_1810_03292, abstract section]: "some existing saliency methods are independent both of the model and of the data generating process"
> [@arxiv_1806_10758, section 1]: "However, we show that SmoothGrad-Squared (an unpublished variant of Classic SmoothGrad [35]) and Vargrad [3], methods which ensemble a set of estimates produced by basic methods, far outperform both the underlying method and a random guess."
> [@Arends_2026, abstract]: "This study evaluates 12 attribution methods in DNN-based ECG classification."
> [@Wagner_2024, abstract]: "to establish the first quantitative evidence for the alignment of model behavior with cardiologists' decision rules"
> [@Wagner_2024, abstract]: "we demonstrate how these XAI techniques can be utilized for knowledge discovery, such as identifying subtypes of myocardial infarction"
> [@arxiv_2007_04612, abstract section]: "concept bottleneck models achieve competitive accuracy with standard end-to-end models"
> [@arxiv_2007_04612, abstract section]: "accuracy improves significantly if we can correct model mistakes on concepts at test time"
> [@arxiv_2106_13314, abstract section]: "we demonstrate that the concept representations learned by these models encode information beyond the pre-defined concepts, and that natural mitigation strategies do not fully work, rendering the interpretation of the downstream prediction misleading"
> [@arxiv_2205_10268, section 1]: "a sequence (network) of such transforms induces a single linear transform that faithfully summarises the full model computations"
> [@arxiv_2205_10268, section 1]: "whilst maintaining similar performance on ImageNet"
> [@arxiv_2507_16761, abstract section]: "standard B-cos networks exhibit severe aliasing artifacts in their explanation maps"
> [@arxiv_2507_16761, abstract section]: "preserve strong predictive performance while providing faithful and artifact-free explanations suitable for clinical application"
> [@arxiv_2504_02667, abstract section]: "combining the compositional multilinear structure of tensor networks with the expressivity and efficiency of deep neural networks"
> [@arxiv_2504_02667, abstract section]: "retain equal accuracy compared to their baseline counterparts"
> [@arxiv_2504_02667, abstract section]: "We leverage this toward formal weight-based interpretability and model compression."
> [@arxiv_2504_02667, section 1]: "This paper presents preliminary results on developing interpretable neural networks while retaining competitive accuracy."
> [@Patlatzoglou_2025, abstract section]: "we focus on explicit representation learning using variational autoencoders (VAE) to capture inherently interpretable ECG features"
> [@Patlatzoglou_2025, abstract section]: "demonstrate the cost introduced by intrinsic ECG interpretability"
> [@arxiv_2511_04292, abstract section]: "The block-term structure of BTTDA enables interpretable and more efficient dimensionality reduction without compromising discriminative power."
> [@arxiv_2511_04292, abstract section]: "BTTDA still significantly outperformed HODA (64.52%>61.00%)"
> [@arxiv_2511_04292, section on motor imagery results]: "the full BTTDA+LDA model (avg. accuracy: 64.52"
> [@De_Lathauwer_2008, abstract]: "The parallel factor decomposition and Tucker's decomposition can be considered as special cases in the new framework."
> [@Kolda_2009, abstract]: "CANDECOMP/PARAFAC (CP) decomposes a tensor as a sum of rank-one tensors, and the Tucker decomposition is a higher-order form of principal component analysis"
> [@Goulart_2020, abstract]: "blind source separation can be performed by computing an approximate block-term tensor decomposition (BTD)"
> [@Goulart_2020, abstract]: "to extract multiple signals which can be physiologically interpreted as atrial fibrillation patterns"
> [@Faes_2024, abstract section]: "As a challenging real-world application, we apply BTTR to accurately predict single finger movement trajectories from intracranial recordings in human subjects."
> [@Faes_2024, abstract section]: "BTTR accounts for the underlying (hidden) data structure in a fully automatic and computationally-efficient manner"
> [@arxiv_2511_04292, abstract section]: "combined with a deflation scheme to iteratively extract discriminant block terms"
> [@arxiv_2511_04292, abstract section]: "resulting in state-of-the art performance (ROC-AUC=91.25%)"
> [@https://doi.org/10.5281/zenodo.22227432, abstract]: "On the public PTB-XL database we tensorize the multilead median beat into a samples-by-time-by-lead array and fit block-term tensor regression (BTTR)"
> [@https://doi.org/10.13026/4nqg-sb35, abstract]: "These diagnostic ECGs use 12 leads and are 10 seconds in length. They are sampled at 500 Hz."
> [@Kolda_2009, abstract]: "This survey provides an overview of higher-order tensor decompositions, their applications, and available software."
> [@Faes_2024, section III.B]: "BTTR is a deflation-based method in which the maximally correlated representations of X and y are extracted via ACE/ACCoS at each iteration"
> [@Faes_2024, section III.B]: "uk and tk the score vectors, bk the regression coefficient"
> [@Faes_2024, section III.B]: "Starting from the above prediction equation, we can re-write the above as the well-known linear regression equation"
> [@Cox_1972, abstract]: "A conditional likelihood is obtained, leading to inferences about the unknown regression coefficients."
> [@Katzman_2018, Methods]: "We train the network by setting the objective function to be the average negative log partial likelihood of Eq. 3 with regularization"
> [@Johnson_2023, section on the patients table]: "age is provided in the anchor_age column and the approximate true year of admission is provided in the anchor_year_group column"
> [@https://doi.org/10.13026/4nqg-sb35, abstract]: "The MIMIC-IV-ECG module contains approximately 800,000 diagnostic electrocardiograms across nearly 160,000 unique patients."
> [@Johnson_2023, abstract section]: "Here we present MIMIC-IV, a publicly available database sourced from the electronic health record of the Beth Israel Deaconess Medical Center."
> [@Rix_2012, abstract]: "A specified diagnosis of AFL was rarely used and was not reliable to distinguish between cases of AF and AFL."
> [@Valasakis_2026, abstract]: "Of 700 ECGs labelled as atrial fibrillation, only 458 (65.4%) showed AF on expert review."
> [@Vickers_2006, abstract]: "The authors describe decision curve analysis, a simple, novel method of evaluating predictive models."
> [@Collins_2024, abstract section]: "TRIPOD+AI provides harmonised guidance for reporting prediction model studies, irrespective of whether regression modelling or machine learning methods have been used."
> [@Zeiler_2014, section 4.2]: "portions of the input image with a grey square, and monitoring the output of the"
> [@Ivanovs_2021, abstract]: "perturbation-based XAI methods, which allow to explore DNN models by perturbing their input and observing changes in the output"
> [@arxiv_1702_04595, section 4]: "Figure 4 shows how different window sizes influence the resolution of the visualization."
> [@arxiv_1702_04595, section 3.1]: "Relative to the marginal method, we therefore downweight the pixels that can easily be predicted"
> [@_imi__2025, abstract]: "presents the influence and importance of perturbation methods and region size selection in relation to dataset and model characteristics"
> [@McKeen_2025, abstract]: "introducing an openly available benchmark on the MIMIC-IV-ECG dataset"
> [@McKeen_2025, abstract]: "achieve high AUROC on salient labels, including atrial fibrillation (0.996)"
> [@Pfeifer_2026, abstract]: "charts were manually abstracted to define inclusion and exclusion criteria (age 65+ years with no previous AF"
> [@Pfeifer_2026, abstract]: "including 74 who developed AF (sensitivity 31%"
> [@Pfeifer_2026, abstract]: "(specificity 92%"
> [@Pfeifer_2026, abstract]: "This study aimed to externally validate an ECG-AI model for predicting 1-year AF risk."
> [@Schnabel_2009, abstract]: "Multivariable Cox regression related clinical variables to 10-year AF incidence"
> [@Cheng_2009, abstract]: "Individuals with first-degree atrioventricular block had a two-fold adjusted risk of AF (HR 2.06"
> [@Cheng_2009, abstract]: "PR prolongation is associated with increased risks of AF"
> [@Magnani_2013, abstract]: "The Health, Aging, and Body Composition (Health ABC) Study is a prospective, biracial cohort."
> [@Magnani_2013, abstract]: "a 13% increased risk of incident AF"
> [@Tanaka_2021, abstract]: "Eligible participants were residents in Kanazawa City, Japan"
> [@Tanaka_2021, abstract]: "f-AVB was significantly associated with incident AF (HR, 1.75"
> [@Yogeswaran_2025, abstract]: "Each SD<hyphen>unit increase in PR interval, P<hyphen>wave duration, and PTFV1 was associated with increased AF risk"
> [@Magnani_2015, abstract]: "They are associated with AF in cross-cohort meta-analyses but contribute minimally toward enhancing risk prediction."
> [@Emmanuela_2026, abstract section]: "Patients who developed NOAF had significantly longer P-wave duration than those who did not"
> [@Emmanuela_2026, Discussion, limitations]: "certainty evaluation using the GRADE framework yielded very low ratings for all parameters"
> [@Emmanuela_2026, Discussion, limitations]: "restricts direct applicability to a general, unselected population"
> [@Ostrowska_2022, abstract section]: "aged 70 years; 50% women)"
> [@Ostrowska_2022, Results]: "The PR-interval in V1 was not significantly related to incident AF"
> [@Ostrowska_2022, abstract section]: "Values below 60 msec were significantly associated with incident AF"
> [@Goette_2016, abstract]: "Any complex of structural, architectural, contractile or electrophysiological changes affecting the atria with the potential to produce clinically-relevant manifestations"
> [@Goette_2016, abstract]: "atrial pathologies have a substantial impact on cardiac performance, arrhythmia occurrence, and stroke risk"
> [@Maezono_2025, abstract]: "Unadjusted incidence rates of AF were significantly higher in participants with P-wave duration"
> [@Maezono_2025, abstract]: "had a significantly higher age- and sex-adjusted geometric mean percentage of left atrial fibrosis than those with P-wave duration"
> [@Yao_2019, abstract]: "We identified 24 studies"
> [@Yao_2019, abstract]: "The pooled random effects estimates were: sensitivity 80%"
> [@Yao_2019, abstract]: "PPV 88% (82"
> [@Malmo_2016, abstract]: "All AF diagnoses were verified by review of hospital and PC medical records."
> [@Malmo_2016, abstract]: "The sensitivity of a hospital discharge diagnosis of AF was 73.7%, specificity 99.7%, PPV 88.5%, and NPV 99.2%."
> [@Rix_2012, abstract]: "The positive predictive value of the combined diagnosis of AF and/or AFL was 92.6%"

### Lines of check-urls
No line holds "title not checked", "no identifier", "no entry", "DOI_MISMATCH" or "doi not found". These lines answered 403: Kashou_2021, Wolf_1991, Alonso_2013, Raghunath_2021, Khurshid_2022, Van_Gelder_2024, Tsiartas_2025, Saiz_Vivo_2025, Arends_2026, De_Lathauwer_2008, Valasakis_2026, Yuan_2023, Jabbour_2024, Cheng_2009, Christopoulos_2020, Biton_2021, Kolda_2009, Cox_1972, Rix_2012, Vickers_2006, Collins_2024, McKeen_2025, Magnani_2013, Yogeswaran_2025, Goette_2016, Maezono_2025. Each of these DOIs resolves in Crossref to the entry's title with ratio 1.00 in the `resolve` calls above, and the same check-urls lines give ratio 1.00 (0.87 and 0.76 for Christopoulos_2020 and Magnani_2013, whose Crossref titles lack the subtitle). The 403 is the publisher's answer to an automated request; the identifiers are correct and need no change.

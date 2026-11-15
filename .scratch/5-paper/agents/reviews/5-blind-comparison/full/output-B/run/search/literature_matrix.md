# the search stage: Literature matrix (source x theme)

"main" marks the theme a source is chiefly cited for; "x" marks a secondary theme it also supports. Numbers are the working index in `annotated_bibliography.md`; keys match `references.bib`. Quality is High, Medium or Low as assessed in the annotated bibliography.

Themes:

- T1: AI-ECG prediction of AF from sinus rhythm
- T2: Clinical AF risk scores, epidemiology, guideline
- T3: Datasets and data infrastructure
- T4: Tensor decomposition and block-term tensor regression
- T5: Block-term tensor neural networks and multilinear interpretable networks
- T6: Interpretable by design versus post hoc; concept bottlenecks and leakage
- T7: Faithfulness evaluation and post-hoc attribution
- T8: ECG explainability
- T9: Survival modelling and concordance
- T10: Self-supervised contrastive pretraining
- T11: Time-frequency ECG representation and AF electrophysiology
- T12: Evaluation, calibration, clinical utility, reporting

| # | Source (key) | T1 | T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | T11 | T12 | Method | Quality |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Attia 2019 (attia2019) | main | | | | | | | | | | | | Quant, retrospective CNN | High |
| 2 | Raghunath 2021 (raghunath2021) | main | | | | | | | | x | | | x | Quant, retrospective DNN | High |
| 3 | Khurshid 2022 (khurshid2022) | main | x | | | | | | | | | | | Quant, CNN vs CHARGE-AF, external sets | High |
| 4 | Christopoulos 2020 (christopoulos2020) | main | x | | | | | | | x | | | | Quant, population cohort | High |
| 5 | Biton 2021 (biton2021) | main | x | | | | | | | | | | | Quant, ML on features and representations | High |
| 6 | Jabbour 2024 (jabbour2024) | main | x | x | | | | | | | | | | Quant, DL with MIMIC-IV external test | High |
| 7 | Yuan 2023 (yuan2023) | main | | | | | | | | | | | x | Quant, CNN, 31-day window | High |
| 8 | Noseworthy 2022 (noseworthy2022) | main | | | | | | | | | | | x | Prospective non-randomised trial | High |
| 9 | Ko 2026 (ko2026) | main | | x | | | | | | | x | | | Quant, foundation model | High |
| 10 | Nolin-Lapalme 2026 (nolinlapalme2026) | main | | x | | | | | | | x | | | Quant, foundation models | High |
| 11 | McKeen 2025 (mckeen2025) | x | | main | | | | | | | x | | | Quant, foundation model, detection | Medium |
| 12 | Matsuo 2026 (matsuo2026) | main | | | | | | | x | | | | | Quant, ML with SHAP | Medium |
| 13 | Hammer 2022 (hammer2022) | main | | | | | x | | x | | | | | Quant, interpretable features | Medium |
| 14 | Alonso 2013 (alonso2013) | x | main | | | | | | | | | | | Quant, pooled cohorts | High |
| 15 | Schnabel 2009 (schnabel2009) | | main | | | | | | | | | | | Quant, cohort | High |
| 16 | Kornej 2020 (kornej2020) | | main | | | | | | | | | | | Review | High |
| 17 | Hindricks 2021 (hindricks2021) | | main | | | | | | | | | | | Guideline (no abstract) | High |
| 18 | Johnson 2023 (johnson2023) | | | main | | | | | | | | | | Dataset descriptor | High |
| 19 | Gow 2023 (gow2023) | | | main | | | | | | | | | | Dataset record | High |
| 20 | Goldberger 2000 (goldberger2000) | | | main | | | | | | | | | | Resource paper | High |
| 21 | Wagner 2020 (wagner2020) | | | main | | | | | | | | | | Dataset descriptor | High |
| 22 | Ribeiro 2020 (ribeiro2020) | x | | main | | | | | | | | | | Quant, DNN | High |
| 23 | Ribeiro 2021 CODE-15 (ribeiro2021code15) | | | main | | | | | | | | | | Dataset record | High |
| 24 | De Lathauwer 2008 (delathauwer2008) | | | | main | x | | | | | | | | Theory | High |
| 25 | Kolda 2009 (kolda2009) | | | | main | | | | | | | | | Survey | High |
| 26 | Zhao 2013 (zhao2013) | | | | main | | | | | | | | | Method, ECoG decoding | High |
| 27 | Camarrone 2019 (camarrone2019) | | | | main | | | | | | | | | Method, EEG/ECoG | High |
| 28 | Faes 2024 (faes2024) | | | | main | | x | | | | | | | Method, ECoG | High |
| 29 | Faes 2022 (faes2022) | | | | main | | | | | | | | | Method, ECoG | High |
| 30 | Yokota 2014 (yokota2014) | | | | main | | | | | | | | | Method (metadata only) | Medium |
| 31 | Hunyadi 2014 (hunyadi2014) | | | | main | | x | | | | | x | | Method, EEG BTD | High |
| 32 | Goulart 2020 (goulart2020) | | | | main | | x | | | | | x | | Method, AF ECG source separation | High |
| 33 | Kim 2017 (kim2017) | | | | main | x | x | | | | | | | Method, supervised CP on EHR | High |
| 34 | Ye 2018 (ye2018) | | | | x | main | | | | | | | | Method, weight compression | High |
| 35 | Li 2017 (li2017btnets) | | | | x | main | | | | | | | | Method, weight compression (preprint) | Medium |
| 36 | Ye 2020 (ye2020) | | | | x | main | | | | | | | | Method, weight compression | High |
| 37 | Van Den Kerchove 2025 (vandenkerchove2025) | | | | x | main | x | | | | | | | Method, EEG BCI (preprint) | Medium |
| 38 | Dooms 2025 (dooms2025) | | | | | main | x | | | | | | | Method, image (preprint) | Medium |
| 39 | B<latin small letter o with diaeresis>hle 2022 (bohle2022) | | | | | x | main | x | | | | | | Method, image | High |
| 40 | Rudin 2019 (rudin2019) | | | | | | main | | | | | | | Perspective | High |
| 41 | Ghassemi 2021 (ghassemi2021) | | | | | | main | x | x | | | | | Viewpoint | High |
| 42 | Koh 2020 (koh2020) | | | | | | main | | | | | | | Method, image | High |
| 43 | Mahinpei 2021 (mahinpei2021) | | | | | | main | x | | | | | | Method analysis (preprint) | Medium |
| 44 | Havasi 2022 (havasi2022) | | | | | | main | x | | | | | | Method | High |
| 45 | Adebayo 2018 (adebayo2018) | | | | | | x | main | | | | | | Empirical and theoretical tests | High |
| 46 | Hooker 2019 (hooker2019) | | | | | | | main | | | | | | Benchmark (ROAR) | High |
| 47 | Jacovi 2020 (jacovi2020) | | | | | | x | main | | | | | | Position paper | High |
| 48 | Sundararajan 2017 (sundararajan2017) | | | | | | | main | | | | | | Method, axioms | High |
| 49 | Hughes 2021 (hughes2021) | x | | | | | | x | main | | | | | Quant, CNN with LIME | High |
| 50 | Stor<latin small letter a with ring above>s 2023 (storas2023) | | | | | | x | x | main | | | | | Qualitative physician assessment | Medium |
| 51 | Cox 1972 (cox1972) | | | | | | | | | main | | | | Theory | High |
| 52 | Katzman 2018 (katzman2018) | | | | | | | | | main | | | | Method | High |
| 53 | Kvamme 2019 (kvamme2019) | | | | | | | | | main | | | | Method | High |
| 54 | Harrell 1982 (harrell1982) | | | | | | | | | main | | | x | Method | High |
| 55 | Chen 2020 (chen2020simclr) | | | | | | | | | | main | | | Method, image | High |
| 56 | Kiyasseh 2021 (kiyasseh2021) | | | | | | | | | | main | | | Method, ECG | High |
| 57 | Mehari 2022 (mehari2022) | | | | | | | | | | main | | | Method, 12-lead ECG | High |
| 58 | Jeong 2021 (jeong2021) | | | | | | | | | | | main | | Quant, 2D CNN on time-frequency maps | Medium |
| 59 | Bollmann 2006 (bollmann2006) | | | | | | | | | | | main | | Review | High |
| 60 | Platonov 2014 (platonov2014) | | | | | | | | | | | main | | Review | High |
| 61 | Nielsen 2015 (nielsen2015) | x | x | | | | | | | | | main | | Quant, cohort | High |
| 62 | Huang 2020 (huang2020) | x | | | | | | | | | | main | | Meta-analysis | High |
| 63 | Wolder 2023 (wolder2023) | x | | | | | | | | | | main | | Quant, cohort | High |
| 64 | Vickers 2006 (vickers2006) | | | | | | | | | | | | main | Method | High |
| 65 | Van Calster 2019 (vancalster2019) | | | | | | | | | | | | main | Methods guidance | High |
| 66 | Collins 2024 (collins2024) | | | | | | | | | | | | main | Reporting guideline | High |
| 67 | Hanley 1982 (hanley1982) | | | | | | | | | | | | main | Method | High |
| 68 | Carpenter 2000 (carpenter2000) | | | | | | | | | | | | main | Methods guidance | High |

## Theme coverage (sources marked main or x)

| Theme | Count | Sources (index) |
|---|---|---|
| T1 | 19 | 1 to 14, 22, 49, 61, 62, 63 |
| T2 | 9 | 3, 4, 5, 6, 14, 15, 16, 17, 61 |
| T3 | 10 | 6, 9, 10, 11, 18, 19, 20, 21, 22, 23 |
| T4 | 14 | 24 to 37 |
| T5 | 8 | 24, 33, 34, 35, 36, 37, 38, 39 |
| T6 | 16 | 13, 28, 31, 32, 33, 37, 38, 39, 40, 41, 42, 43, 44, 45, 47, 50 |
| T7 | 10 | 39, 41, 43, 44, 45, 46, 47, 48, 49, 50 |
| T8 | 5 | 12, 13, 41, 49, 50 |
| T9 | 6 | 2, 4, 51, 52, 53, 54 |
| T10 | 6 | 9, 10, 11, 55, 56, 57 |
| T11 | 8 | 31, 32, 58, 59, 60, 61, 62, 63 |
| T12 | 9 | 2, 7, 8, 54, 64, 65, 66, 67, 68 |

## Stance summary for the argument builder

- Supports the premise that the sinus-rhythm ECG carries incident-AF information and that ECG and clinical risk are complementary: 1 to 8, 14, 15, 61 to 63.
- Supports interpretable-by-design modelling: 39, 40, 42; supports the need to test faithfulness rather than assert it: 43, 44, 45, 46, 50.
- Counter-position to address: 41 (explainability as a "false hope"; validation preferred), which the paper answers by validating and by measuring faithfulness.
- Prior art to cite and distinguish (block terms or multilinear structure without a clinical survival outcome and named physiological signatures): 31 to 38.

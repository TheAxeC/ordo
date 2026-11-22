# Literature review: interpretable block-term tensor network for incident atrial fibrillation

Research question (from `settings.md`): Can an interpretable block-term tensor network, whose ECG evidence passes through readable frequency-and-lead block signatures and is fused with age, sex and ECG intervals, predict incident atrial fibrillation from one sinus-rhythm 12-lead ECG in MIMIC-IV-ECG on gold ICD-10 labels more accurately than a clinical risk-factor model and a CNN, and are those signatures faithful?

## 1. Search strategy

No `.bib` was given and the project holds none, so no screened `.bib` block applies. The Materials in hand row names no literature list, annotated bibliography or research report. The prior-art note `notes/history/NOVELTY-AAAI-METHODS.md` was read only for the topic's terms and for identifiers to look up; every source it names was looked up and screened like any other record.

The outline marks three items "needs literature" (6.3 Limitations, the sensitivity and positive predictive value of ICD-coded AF; 6.2 Implications, cohort studies on P-wave indices or PR-interval prolongation and incident AF; 4.2 Experiments, a source for occlusion-based attribution). The searches for them are recorded in the subsection "Searches for the outline's sections marked needs literature" below. For these searches the manuscript `.bib` (`manuscript/refs.bib`, 53 entries) was given, and none of the 15 DOIs or arXiv IDs added for them is in it.

### Concepts

| Primary concept | Secondary concepts, synonyms and field terms |
|---|---|
| Incident atrial fibrillation | new-onset AF, AF risk, future AF, sinus rhythm, atrial substrate, atrial cardiomyopathy, P-wave, PR interval |
| ECG deep learning | artificial intelligence, AI-ECG, neural network, CNN, self-supervised, contrastive, foundation model |
| Interpretability and faithfulness | explainable, saliency, attribution, sanity checks, remove and retrain, concept bottleneck, leakage, inherently interpretable |
| Block-term tensor models | block term decomposition, BTD, block-term tensor regression, BTTR, higher-order partial least squares, tensor network |

### Indexes

`the lookup script` asks Crossref, OpenAlex, Semantic Scholar and arXiv. Semantic Scholar returned no search record in any of the 13 searches: it was left out with "HTTP 429 after 3 retries" in 8 searches and answered "not found" in 5. It did answer the citation-chaining and forward-tracking calls. arXiv answered "not found" for the 5 sentence-form searches, since it reads a sentence as its words joined by AND.

### Search strings

All searches were run on 2026-11-14. `--limit 100` per index. Counts are records per index; "merged" is the count after the script merged records that share a DOI, an arXiv ID or a Semantic Scholar ID.

| Pass, layer | Search string | Crossref | OpenAlex | Semantic Scholar | arXiv | Merged |
|---|---|---|---|---|---|---|
| 1, layer 1 | `("atrial fibrillation" OR "incident atrial fibrillation") AND ("electrocardiogram" OR "ECG") AND ("deep learning" OR "artificial intelligence" OR "neural network") AND ("prediction" OR "risk")` | 100 | 100 | left out (HTTP 429) | 40 | 234 |
| 1, layer 1 | `("block term decomposition" OR "block-term tensor") AND ("interpretable" OR "regression" OR "classification" OR "EEG" OR "ECG")` | 100 | 99 | not found | 13 | 177 |
| 1, layer 1 | `("interpretable" OR "explainable" OR "faithfulness") AND ("electrocardiogram" OR "ECG") AND ("deep learning" OR "neural network")` | 100 | 100 | left out (HTTP 429) | 100 | 300 |
| 1, layer 1 | `("atrial fibrillation") AND ("risk score" OR "risk model" OR "CHARGE-AF") AND ("incident" OR "new-onset")` | 100 | 99 | not found | 2 | 188 |
| 1, layer 4 | `Can an interpretable tensor network predict incident atrial fibrillation from a sinus rhythm 12-lead ECG more accurately than a clinical risk model and a convolutional neural network` | 100 | 14 | left out (HTTP 429) | not found | 114 |
| 2, layer 1 | `("faithfulness" OR "sanity checks" OR "remove and retrain") AND ("saliency" OR "attribution" OR "explanation") AND ("deep neural network")` | 100 | 99 | left out (HTTP 429) | 79 | 263 |
| 2, layer 1 | `("concept bottleneck" OR "inherently interpretable" OR "interpretable by design") AND ("leakage" OR "faithful" OR "high-stakes")` | 100 | 100 | not found | 100 | 269 |
| 2, layer 1 | `("self-supervised" OR "contrastive") AND ("electrocardiogram" OR "ECG") AND ("representation learning" OR "pretraining")` | 100 | 100 | left out (HTTP 429) | 100 | 273 |
| 2, layer 1 | `("block-term tensor regression" OR "higher-order partial least squares") AND ("intracranial" OR "automatic component extraction" OR "multiway")` | 100 | 65 | not found | 1 | 163 |
| 2, layer 1 | `("MIMIC-IV-ECG" OR "MIMIC-IV") AND ("atrial fibrillation") AND ("electrocardiogram" OR "deep learning")` | 100 | 100 | left out (HTTP 429) | 4 | 193 |
| 2, layer 4 | `are the explanations of an interpretable deep learning model for electrocardiogram risk prediction faithful to its decision` | 100 | 100 | not found | not found | 200 |
| 3, layer 1 | `("P-wave" OR "atrial cardiomyopathy" OR "atrial substrate") AND ("incident atrial fibrillation" OR "new-onset atrial fibrillation") AND ("electrocardiogram" OR "spectral" OR "frequency")` | 100 | 100 | left out (HTTP 429) | not found | 198 |
| 3, layer 4 | `does the sinus rhythm electrocardiogram carry an atrial substrate signature that precedes the onset of atrial fibrillation` | 100 | 78 | left out (HTTP 429) | not found | 178 |

Every Boolean search filled the 100 records Crossref returns. Crossref ranks by relevance and reads no operator, so the remaining records were narrowed at screening by the criteria below rather than by a tighter string.

### Citation chaining (layer 2) and forward tracking (layer 3)

Layer 2 read the references of 13 works with `lookup refs`: pass 1, the 7 core AI-ECG papers [@Attia_2019; @Raghunath_2021; @Khurshid_2022; @Christopoulos_2020; @Biton_2021; @Habineza_2023; @Yuan_2023]; pass 2, [@Sau_2026; @Jabbour_2024; @Ye_2020; @Tsiartas_2025; @arxiv_2504_02667]; pass 3, the ECG-predictor review of German et al. (2015, doi 10.1111/anec.12321). The 13 lists held 661 records.

Works in the reference lists of 3 or more core papers, marked "must include", and their screening outcome:

| Work | Lists | Outcome |
|---|---|---|
| Alonso et al. 2013, CHARGE-AF (10.1161/jaha.112.000102) | 8 | Included [@Alonso_2013] |
| Attia et al. 2019 (10.1016/s0140-6736(19)31721-0) | 9 | Included [@Attia_2019] |
| Raghunath et al. 2021 (10.1161/circulationaha.120.047829) | 6 | Included [@Raghunath_2021] |
| Khurshid et al. 2022 and Christopoulos et al. 2020 | 3 each | Included |
| Wolf et al. 1991 (10.1161/01.str.22.8.983) | 3 | Included [@Wolf_1991] |
| Schnabel et al. 2015 (10.1016/s0140-6736(14)61774-8) | 3 | Included [@Schnabel_2015] |
| Ribeiro et al. 2020 (10.1038/s41467-020-15432-4) | 3 | Included [@Ribeiro_2020] |
| Goette et al. 2016, atrial cardiomyopathy consensus (10.1093/europace/euw161) | 3 | Included, through its open version in Journal of Arrhythmia [@Goette_2016] |
| Raghunath et al. 2020, mortality from ECG (10.1038/s41591-020-0870-z) | 3 | Excluded at full text: predicts mortality, not AF |
| German et al. 2015, ECG predictors of AF (10.1111/anec.12321) | 3 | Excluded at node 2: 2015 is outside the 10-year window and the `cited-by` listing holds 95 citing works, below the 100 the seminal rule needs |
| Lip et al. 2010, CHA2DS2-VASc (10.1378/chest.09-1584) | 3 | Excluded at node 3: stroke risk in patients who already have AF |
| Hart et al. 2007, antithrombotic meta-analysis (10.7326/0003-4819-146-12-200706190-00007) | 4 | Excluded at node 3: treatment of established AF |
| Kirchhof et al. 2020, early rhythm control (10.1056/nejmoa2019422) | 3 | Excluded at node 3: treatment of established AF; the 2024 guideline carries the treatment background [@Van_Gelder_2024] |
| Kirchhof et al. 2016, ESC guidelines (10.1093/europace/euw295) | 3 | Excluded at node 2: superseded by the 2024 ESC guideline [@Van_Gelder_2024] |
| D'Agostino et al. 1976, "The Framingham study" (10.1136/bmj.2.6046.1255-a) | 3 | Excluded at node 3: a cohort description letter that addresses no aspect of the question |
| Reiffel et al. 2017, REVEAL AF (10.1001/jamacardio.2017.3180) | 3 | Excluded at node 3: undiagnosed AF in implanted-monitor screening, tangential |
| Christophersen et al. 2016, CHARGE-AF versus CHA2DS2-VASc (10.1016/j.ahj.2016.05.004) | 3 | Excluded at node 3: tangential comparison of two scores |

The must-include mark sets a work's priority. The three gates that hold under every profile (relevance, no fatal design flaw, not predatory) still applied, and the works above that fail relevance are excluded on that gate.

Layer 3 read the citing works of 9 foundational works with `lookup cited-by`: [@Attia_2019], [@Khurshid_2022], [@Raghunath_2021], [@Alonso_2013], Hunyadi et al. 2014 (10.1186/1687-6180-2014-139), [@Faes_2024], [@arxiv_2007_04612], [@De_Lathauwer_2008] and [@Goette_2016]. The 9 lists held 1,472 records. Every one of them has citing works from 2024 to 2026 (from 5 for Hunyadi et al. to 142 for Khurshid et al.), so none is marked "possibly outdated". Seven older candidates were counted with `cited-by` for the seminal rule; Cox 1972, Wolf 1991, Kolda and Bader 2009, Schnabel 2009, Schnabel 2015 and Vickers 2006 each list more than 100 citing works ("first 100, more exist"), and German 2015 lists 95.

### Searches for the outline's sections marked needs literature

Passes S1 to S3 were run for the three outline items, on 2026-11-14, with `--limit 100` per index except where the row says otherwise. Semantic Scholar returned no search record in any of the 14 searches (left out with "HTTP 429 after 3 retries" in 11, "not found" in 3).

| Pass, layer | Item | Search string | Crossref | OpenAlex | Semantic Scholar | arXiv | Merged |
|---|---|---|---|---|---|---|---|
| S1, layer 1 | 6.3 | `("atrial fibrillation") AND ("positive predictive value" OR "sensitivity" OR "validation" OR "validity") AND ("ICD" OR "discharge diagnosis" OR "administrative data" OR "patient register")` | 100 | 100 | left out (HTTP 429) | 1 | 198 |
| S1, layer 1 | 6.2 | `("P-wave" OR "P wave duration" OR "PR interval" OR "first-degree atrioventricular block") AND ("atrial fibrillation") AND ("cohort" OR "risk" OR "incident")` | 100 | 100 | left out (HTTP 429) | 2 | 186 |
| S1, layer 1 | 6.2 | `"P-wave indices" AND "atrial fibrillation" AND ("meta-analysis" OR "cohort")` (`--limit 60`) | 60 | 60 | left out (HTTP 429) | not found | 112 |
| S1, layer 1 | 4.2 | `("occlusion" OR "occlusion sensitivity" OR "perturbation") AND ("attribution" OR "visualizing" OR "explanation") AND ("convolutional network" OR "deep neural network")` | 100 | 100 | left out (HTTP 429) | 100 | 295 |
| S1, layer 1 | 4.2 | `("occlusion sensitivity" OR "occluding" OR "prediction difference analysis") AND ("visualizing" OR "understanding" OR "explaining") AND ("classifier" OR "convolutional network")` | 100 | 100 | left out (HTTP 429) | 45 | 241 |
| S1, layer 4 | 6.3 | `how accurate are hospital discharge ICD codes for identifying atrial fibrillation compared with medical record review` | 100 | 100 | left out (HTTP 429) | not found | 200 |
| S1, layer 4 | 6.2 | `is a prolonged PR interval or abnormal P wave on the electrocardiogram associated with future atrial fibrillation in the general population` | 100 | 100 | left out (HTTP 429) | not found | 198 |
| S1, layer 4 | 4.2 | `occluding parts of the input to measure the change in a neural network prediction as an explanation` | 100 | 100 | left out (HTTP 429) | not found | 200 |
| S2, layer 1 | 6.3 | `("atrial fibrillation") AND ("ICD-10" OR "ICD-9") AND ("positive predictive value" OR "sensitivity") AND ("hospital" OR "discharge")` | 100 | 100 | not found | not found | 200 |
| S2, layer 1 | 6.2 | `("P-wave duration" OR "PR interval") AND ("atrial fibrillation") AND ("meta-analysis" OR "systematic review")` | 100 | 100 | left out (HTTP 429) | not found | 191 |
| S2, layer 1 | 4.2 | `("occlusion" OR "perturbation") AND ("electrocardiogram" OR "ECG") AND ("deep learning" OR "neural network") AND ("explainab*" OR "interpretab*" OR "attribution")` | 100 | 100 | not found | 1 | 201 |
| S3, layer 1 | 6.3 | `("atrial fibrillation") AND ("ICD-10" OR "administrative data" OR "electronic health record" OR "diagnosis codes") AND ("validation" OR "positive predictive value" OR "misclassification")` | 100 | 100 | left out (HTTP 429) | 2 | 198 |
| S3, layer 1 | 6.2 | `("P-wave" OR "PR interval" OR "atrial conduction") AND ("incident atrial fibrillation" OR "new-onset atrial fibrillation") AND ("cohort" OR "UK Biobank" OR "population")` | 100 | 100 | not found | not found | 196 |
| S3, layer 1 | 4.2 | `("occlusion" OR "perturbation" OR "feature removal") AND ("attribution" OR "explanation") AND ("time series" OR "physiological signal" OR "electrocardiogram")` | 100 | 100 | left out (HTTP 429) | 69 | 260 |

Pass S3 is the last-3-years search that the currency gate prescribes: `lookup search` takes no year filter, so its records from 2024 to 2026 (38, 44 and 117 for the three strings) were screened.

Layer 2 read the references of Yao et al. 2019 (46 records), Nielsen et al. 2013 (10.1016/j.hrthm.2013.04.012, 33 records) and Zeiler and Fergus 2014 (33 records). Layer 3 read the citing works of Jensen et al. 2012 (10.1002/pds.2317, 190 records, 53 from 2024 to 2026), Cheng et al. 2009 (196, 67), Zeiler and Fergus 2014 (200, 98) and Nielsen et al. 2013 (129, 21); each listing says "first 100, more exist" for OpenAlex and Semantic Scholar, so each of these works passes the seminal rule and none is "possibly outdated". The seminal rule was also checked with `cited-by` for Magnani et al. 2011 (141 records), Magnani et al. 2013 (119), Magnani et al. 2015 (109) and Rix et al. 2012 (164), each "first 100, more exist".

### Criteria and profile

| Criterion | Include | Exclude |
|---|---|---|
| Publication type | Peer-reviewed journals, books, conference proceedings; under `cs_ml` also archival preprints, conference abstracts and technical reports, each tagged by its evidence type | Blog posts and news, unless primary data |
| Date range | 2016 to 2026; seminal works older than that when the `cited-by` listing holds more than 100 citing works | Older work below that count |
| Language | English (the Language row) | Other languages |
| Relevance | Addresses at least one aspect of the research question | Tangential |

- Domain evidence profile: `cs_ml`, read as stated. It admits arXiv preprints, conference proceedings and technical reports, tagged by evidence type, and counts preprints toward the peer-reviewed share.
- The profile and the Discipline row differ: the Discipline row is biomedical informatics, while `cs_ml` fits Computer Science, Engineering and Technology. The profile governed admission and the Discipline row governed the search terms. Nothing was blocked.
- Year range: none was given, so the last 10 years apply, with seminal works unrestricted under the rule above.
- The research question is specific and the discipline is narrow enough; no alternative search directions or sub-fields are proposed.

## 2. Distribution advisory

The four dimensions were counted over the 68 included sources from their metadata and annotations. No dimension reaches the 70 percent threshold, so no advisory is triggered:

- Time: 2020 to 2026 = 46/68 (67.6 percent).
- Geography: United States = 21/32 (65.6 percent), counted over the cohort and dataset sources with a stated site (Brazil 4, Japan 2, Canada 1, Germany 1, Norway 1, Denmark 1, Sweden 1).
- Method: computational 36/68 (52.9 percent).
- Venue: the most frequent family, arXiv, 10/68 (14.7 percent).

The geography count still shows that every AI-ECG cohort in the set comes from the Americas or Europe; the two Japanese cohorts are ECG-interval studies (gap 6). A search that would widen it: ("atrial fibrillation") AND ("sinus rhythm") AND ("artificial intelligence" OR "deep learning") AND ("Korea" OR "Japan" OR "China" OR "Taiwan" OR "interethnic"); candidates seen at title stage include an interethnic validation of an AI-ECG for AF prediction (Lee et al., 2024 and 2025 records) and Japanese multi-institution AI-ECG work on paroxysmal AF (Suzuki et al.).

## 3. Screening results

- Initial records: 4,883 from the 13 searches, the 13 reference lists and the 9 citing-work lists; 4,294 after records sharing a DOI, an arXiv ID or a normalised title were made one.
- After title and abstract screening: 66 sources tagged Include or Maybe.
- After full-text assessment: 53 included. For each, the abstract or the full text was fetched with `lookup fetch` and read.
- Excluded at the full-text stage (13):
  - Hannun et al. 2019 (10.1038/s41591-018-0268-3): arrhythmia classification on single-lead ambulatory ECG; background only, and the CODE network paper covers the 12-lead deep-learning background [@Ribeiro_2020].
  - Raghunath et al. 2020 (10.1038/s41591-020-0870-z): mortality, not AF.
  - Camarrone and Van Hulle 2018 (10.1109/tbme.2018.2847404): multiway partial least squares that block-term tensor regression builds on; background only beside [@Faes_2024].
  - de Oliveira and Zarzoso 2019 (10.14209/jcis.2019.12): BTD atrial-activity extraction in 10 AF patients; the same line of work is covered by [@Goulart_2020].
  - Snyder and Vishwanath 2020 (arXiv 2006.15189): factorization of a normal-waveform classifier on PhysioNet 2017 data; tangential.
  - Margeloiu et al. 2021 (arXiv 2105.04289): concept bottleneck critique; its leakage point is carried by [@arxiv_2106_13314].
  - Suh et al. 2022 (arXiv 2211.12702): attribution evaluation for arrhythmia ECG; superseded for this question by [@Arends_2026].
  - Ye et al. 2018, BT-RNN (10.1109/cvpr.2018.00977): its BT-LSTM is part of [@Ye_2020].
  - Hunyadi et al. 2014 (10.1186/1687-6180-2014-139): excluded at node 2, since 2014 is outside the window and its `cited-by` listing holds 84 citing works.
  - German et al. 2015 (10.1111/anec.12321): excluded at node 2, as stated above.
  - Bontinck et al. 2026 (10.1016/j.eswa.2026.134714), on metadata leakage in hybrid ECG models: no abstract or full text could be retrieved, so no annotation could be written from a read text.
  - Nielsen et al. 2015 (10.1016/j.hrthm.2015.04.026), P-wave duration and AF risk: no abstract or full text could be retrieved.
  - Roberts and Gollob 2022 (10.1016/j.hrthm.2021.12.011), atrial myopathy as an AF substrate: no abstract or full text could be retrieved.
- Searches for the outline's sections marked needs literature: 3,703 records from the 14 searches, the 3 reference lists and the 4 citing-work lists. 22 candidates were fetched with `lookup fetch` and read; 15 are included and 7 excluded:
  - Jensen et al. 2012 (10.1002/pds.2317), systematic review of algorithms that identify AF in electronic health data: the abstract returned states only its objectives, and the later meta-analysis [@Yao_2019] pools the validation studies through 2018.
  - Nielsen et al. 2013 (10.1016/j.hrthm.2013.04.012), PR interval and AF risk in the Copenhagen ECG Study: no abstract or full text could be retrieved.
  - Nielsen et al. 2015 (10.1016/j.hrthm.2015.04.026), P-wave duration and AF risk in the Copenhagen ECG Study: no abstract or full text could be retrieved.
  - Magnani et al. 2011 (10.1016/j.amjcard.2010.10.075), P-wave duration in Framingham participants aged 60 or older: covered by the same group's cross-cohort analysis of Framingham and ARIC P-wave indices [@Magnani_2015].
  - Hari et al. 2018 (10.1080/14779072.2018.1533814), narrative review of P-wave duration and AF: the primary cohorts are read directly.
  - Mercier et al. 2026 (10.1007/s10489-026-07116-1), frequency-based occlusion for time series: excluded at node 3, since the readout occludes time windows of the beat.
  - Domingo-Aldama et al. 2026 (10.1007/s13755-025-00415-w), language-model cohort selection from discharge reports: excluded at node 3, since it does not measure the accuracy of ICD-coded AF.
- Final included sources: 68, listed in section 4.

### Sources for the sections marked needs literature

| Outline item | Sources added | Searches (section 1) |
|---|---|---|
| 6.3 Limitations: sensitivity and positive predictive value of ICD-coded AF | [@Yao_2019; @Malmo_2016; @Rix_2012] | 4 searches (S1 layers 1 and 4, S2, S3); references of Yao et al. 2019; citing works of Jensen et al. 2012 |
| 6.2 Implications: cohort studies on P-wave indices or PR-interval prolongation and incident AF | [@Cheng_2009; @Magnani_2013; @Magnani_2015; @Tanaka_2021; @Ostrowska_2022; @Maezono_2025; @Yogeswaran_2025; @Emmanuela_2026] | 5 searches (S1 layer 1 twice, S1 layer 4, S2, S3); references of Nielsen et al. 2013; citing works of Cheng et al. 2009 and Nielsen et al. 2013 |
| 4.2 Experiments: occlusion-based attribution | [@Zeiler_2014; @arxiv_1702_04595; @Ivanovs_2021; @_imi__2025] | 5 searches (S1 layer 1 twice, S1 layer 4, S2, S3); references and citing works of Zeiler and Fergus 2014 |

The Copenhagen ECG Study papers (Nielsen et al. 2013 and 2015) are not among them, because no text of either could be retrieved.

## 4. Annotated bibliography

Quality is the total of the five items of the scoring table (venue, rigor, relevance, citation count, evidence; 3 to 15). The citation-count item was measured from a `cited-by` listing only for the works that layer 3 or the seminal rule counted; for every other source it is scored 2 and marked "citations not measured".

### Theme 1: AI-ECG prediction of incident atrial fibrillation

### Attia et al. (2019). An artificial intelligence-enabled ECG algorithm for the identification of patients with atrial fibrillation during sinus rhythm: a retrospective analysis of outcome prediction.
- **Type**: Journal article (The Lancet)
- **Method**: Convolutional neural network on 649,931 normal sinus rhythm 10-second 12-lead ECGs from 180,922 Mayo Clinic patients, split 7:1:2; a patient with any AF or flutter ECG is positive.
- **Key results**: One sinus-rhythm ECG identified patients with AF with an AUC of 0.87 (0.86 to 0.88); using all ECGs in the first month of the window raised it to 0.90. In the test set 8.4 percent of patients had verified AF before the tested ECG.
- **Relevance**: Shows that the sinus-rhythm ECG carries an AF signature. The task is identification of patients with prior or concurrent AF, which is a different task from dated incident prediction.
- **Quality**: High (14: venue 3, rigor 3, relevance 2, citations 3, evidence 3). Very large validated cohort; the label window mixes prior and future AF.
- **Stance**: Supports that the sinus-rhythm ECG holds AF information; neutral on interpretability.
- **Potential use**: Introduction; Literature Review; Discussion, where identification and incident prediction are kept apart.

### Raghunath et al. (2021). Deep Neural Networks Can Predict New-Onset Atrial Fibrillation From the 12-Lead ECG and Help Identify Those at Risk of Atrial Fibrillation-Related Stroke.
- **Type**: Journal article (Circulation)
- **Method**: Deep neural networks on 1.6 million resting 12-lead ECGs from 430,000 patients (1984 to 2019), predicting new-onset AF within 1 year in patients without AF; a simulated deployment trained before 2010 and tested 2010 to 2014.
- **Key results**: AUROC 0.85 and AUPRC 0.22 for 1-year new-onset AF; hazard ratio 7.2 (6.9 to 7.6) for predicted high versus low risk over 30 years. In deployment, sensitivity 69 percent, specificity 81 percent, number needed to screen 9, and 62 percent of AF-related strokes within 3 years were in the high-risk group.
- **Relevance**: The reference result for 1-year incident AF from the 12-lead ECG with a black-box network.
- **Quality**: High (15). Large cohort and a temporal deployment test; single health system.
- **Stance**: Supports the predictive value of the ECG; the model is a black box.
- **Potential use**: Introduction; Literature Review; Discussion.

### Khurshid et al. (2022). ECG-Based Deep Learning and Clinical Risk Factors to Predict Atrial Fibrillation.
- **Type**: Journal article (Circulation)
- **Method**: CNN (ECG-AI) for 5-year incident AF in primary-care patients at Massachusetts General Hospital; Cox models with ECG-AI, CHARGE-AF, and both (CH-AI); internal test and two external tests (Brigham and Women's Hospital, UK Biobank); saliency mapping.
- **Key results**: AUROC was comparable for CHARGE-AF and ECG-AI (0.802 vs 0.823; 0.752 vs 0.747; 0.732 vs 0.705) and highest for CH-AI (0.838, 0.777, 0.746). Saliency gave the P-wave the greatest influence, and the ECG-AI and CHARGE-AF linear predictors correlated (r 0.41 to 0.66).
- **Relevance**: Direct precedent for combining an ECG network with clinical risk factors and for comparing it with a clinical model; its explanation is post-hoc saliency.
- **Quality**: High (15). Two external test sets and calibration reported.
- **Stance**: Supports that ECG and clinical factors are complementary.
- **Potential use**: Introduction; Literature Review; Methodology (clinical fusion); Discussion.

### Christopoulos et al. (2020). Artificial Intelligence-Electrocardiography to Predict Incident Atrial Fibrillation: A Population-Based Study.
- **Type**: Journal article (Circulation: Arrhythmia and Electrophysiology)
- **Method**: The Mayo AI-ECG applied to 1,936 Mayo Clinic Study of Aging participants without AF; Cox models and C statistics against CHARGE-AF.
- **Key results**: C statistics 0.69 for AI-ECG, 0.69 for CHARGE-AF and 0.72 combined; both predicted AF independently (hazard ratio 1.76 and 1.90 per SD) without interaction (P=0.54). Participants with AI-ECG output above 0.5 had cumulative AF incidence of 21.5 percent at 2 years and 52.2 percent at 10 years.
- **Relevance**: Independent information of an AI-ECG and a clinical score for incident AF in an older community cohort.
- **Quality**: High (13; citations not measured). Population-based; small sample of older adults.
- **Stance**: Supports.
- **Potential use**: Literature Review; Discussion.

### Biton et al. (2021). Atrial fibrillation risk prediction from the 12-lead electrocardiogram using digital biomarkers and deep representation learning.
- **Type**: Journal article (European Heart Journal - Digital Health)
- **Method**: Random forest on demographics, clinical information, engineered ECG features and deep-learned features; 1,130,404 recordings from 415,389 patients of the Telehealth Network of Minas Gerais; AF development within 5 years.
- **Key results**: AUROC 0.909 for all modalities combined against 0.839 for the best single modality. The authors read the result as structural ECG changes associated with existing or impending AF.
- **Relevance**: Multimodal fusion of ECG representations with clinical data for AF risk in the CODE data family.
- **Quality**: High (12; citations not measured). Very large cohort; the outcome wording includes existing AF.
- **Stance**: Supports fusing clinical data with the ECG.
- **Potential use**: Literature Review.

### Habineza et al. (2023). End-to-end risk prediction of atrial fibrillation from the 12-Lead ECG by deep neural networks.
- **Type**: Journal article (Journal of Electrocardiology)
- **Method**: Residual CNN on raw ECGs of the CODE cohort without added digital biomarkers; its class probabilities feed Cox and Kaplan-Meier models.
- **Key results**: AUC 0.845 for patients without AF on the presented ECG who later develop AF. Patients above 0.7 were 50 percent more likely to develop AF within 40 weeks; patients at or below 0.1 had more than 85 percent chance of remaining AF-free beyond 7 years.
- **Relevance**: An end-to-end CNN with survival analysis in the data family that CODE-15 comes from.
- **Quality**: High (12; citations not measured).
- **Stance**: Supports.
- **Potential use**: Literature Review; Discussion (external data).

### Yuan et al. (2023). Deep Learning of Electrocardiograms in Sinus Rhythm From US Veterans to Predict Atrial Fibrillation.
- **Type**: Journal article (JAMA Cardiology)
- **Method**: CNN trained at 2 Veterans Affairs networks to predict AF within 31 days of a sinus-rhythm ECG; tested at 6 VA networks and 1 non-VA academic centre (907,858 VA ECGs).
- **Key results**: AUROC 0.86 (0.85 to 0.86) on held-out VA ECGs and 0.93 (0.93 to 0.94) at the non-VA site.
- **Relevance**: The 31-day window makes this near-term identification; it shows how the outcome window raises reported discrimination.
- **Quality**: High (13; citations not measured). Multi-site external testing; 93.6 percent of VA patients were male.
- **Stance**: Neutral; its task differs from long-horizon incidence.
- **Potential use**: Literature Review; Discussion (outcome windows).

### Jabbour et al. (2024). Prediction of incident atrial fibrillation using deep learning, clinical models, and polygenic scores.
- **Type**: Journal article (European Heart Journal)
- **Method**: ECG-AI on 669,782 sinus-rhythm ECGs from 145,323 Montreal Heart Institute patients without pre-existing AF; 5-year incident AF; compared with clinical models and an AF polygenic score; external validation in MIMIC-IV.
- **Key results**: AUC-ROC 0.78; the high-risk group (26 percent) had a 4.3-fold risk. In 2,301 patients ECG-AI exceeded CHARGE-AF (0.62) and the polygenic score (0.59); in the MIMIC-IV external cohort the AUC-ROC was 0.77 (median follow-up 1.1 year).
- **Relevance**: The closest published benchmark on MIMIC-IV for incident AF from the sinus-rhythm ECG, from a black-box model. The abstract does not state the label source used in MIMIC-IV.
- **Quality**: High (14; citations not measured).
- **Stance**: Supports the ECG over clinical scores in a tertiary centre.
- **Potential use**: Literature Review; Discussion (benchmark on the same database).

### Sau et al. (2026). Prediction of incident atrial fibrillation: A comprehensive evaluation of conventional and artificial intelligence-enhanced approaches.
- **Type**: Journal article (Heart Rhythm)
- **Method**: AIRE-AF, a CNN with a discrete-time survival loss, trained on 1,163,401 ECGs from 189,539 Beth Israel Deaconess Medical Center patients and validated in UK Biobank (38,892); compared with CHARGE-AF, left atrial size, NT-proBNP and a polygenic score.
- **Key results**: C-index 0.750 (0.743 to 0.758) at BIDMC, above CHARGE-AF, left atrial size and NT-proBNP. In UK Biobank CHARGE-AF was the best single predictor (0.750), AIRE-AF with CHARGE-AF reached 0.768, and adding the polygenic score reached 0.791.
- **Relevance**: A survival-loss CNN on the hospital that MIMIC-IV comes from [@Johnson_2023], compared with a clinical model.
- **Quality**: High (14; citations not measured).
- **Stance**: Supports the ECG, with the comparison against clinical scores depending on the cohort.
- **Potential use**: Literature Review; Methodology (survival objective); Discussion.

### Khurshid et al. (2025). Artificial intelligence-enabled analysis of handheld single-lead electrocardiograms to predict incident atrial fibrillation: an analysis of the VITAL-AF randomized trial.
- **Type**: Journal article (npj Digital Medicine)
- **Method**: Three AI approaches on handheld single-lead ECGs of 15,694 primary-care patients aged 65 or older without prevalent AF in the VITAL-AF trial; compared with CHARGE-AF.
- **Key results**: Single-lead ECG-AI with age and sex had AUROC 0.695 (0.637 to 0.742) against 0.679 (0.623 to 0.730) for CHARGE-AF (p=0.46); net reclassification improvement 0.27 against an age threshold of 65 years.
- **Relevance**: An ECG model fused with age and sex compared with a clinical score in trial data.
- **Quality**: High (13; citations not measured). Randomized-trial population; single lead.
- **Stance**: Supports ECG with demographics as comparable to a clinical score.
- **Potential use**: Literature Review; Discussion.

### Tsiartas et al. (2025). Artificial intelligence capabilities in identifying atrial fibrillation using baseline sinus rhythm ECG: a systematic review.
- **Type**: Journal article, systematic review (Open Heart)
- **Method**: Systematic review of eight databases to May 2024 with QUADAS-2 quality assessment; 14 studies and 33 models.
- **Key results**: Median AUC 0.740 (0.630 to 0.830); deep learning exceeded traditional machine learning (0.830 vs 0.610), and 31-day confirmation windows exceeded 1-year windows (0.851 vs 0.630). Eleven studies cited possible misclassification of negative cases, and nine had high risk of bias in at least one domain.
- **Relevance**: Quantifies how the outcome window and label quality shape reported performance.
- **Quality**: High (12; citations not measured). Secondary evidence across heterogeneous designs.
- **Stance**: Neutral.
- **Potential use**: Introduction; Literature Review; Discussion.

### Kashou and Noseworthy (2021). Predicting incident atrial fibrillation in sinus rhythm: more than just trusting the 'black box'.
- **Type**: Journal article, editorial (Heart)
- **Method**: Editorial on an ECG-feature AF score derived from more than 500 variables (Sanz-Garcia et al.).
- **Key results**: The first presentation of silent AF can be stroke or heart failure, so identifying people at risk aids screening. Clinical scores such as CHARGE-AF need time-intensive data abstraction, while a single-ECG model needs none. [GAP: Key results beyond the opening section of the editorial]
- **Relevance**: A clinical view, from its title, that incident-AF models need more than trust in a black box.
- **Quality**: Medium (9: venue 3, rigor 1, relevance 2, citations 2 not measured, evidence 1). Opinion piece.
- **Stance**: Supports the need for transparent ECG models.
- **Potential use**: Introduction.

### Saiz-Vivo et al. (2025). Artificial intelligence for atrial fibrillation prediction while in sinus rhythm: a narrative review.
- **Type**: Journal article, narrative review (European Heart Journal - Digital Health)
- **Method**: Narrative review grouped by event horizon: newly diagnosed AF, short-term, mid-term and long-term prediction.
- **Key results**: AI methods outperformed scoring systems and were more accurate at shorter event horizons. Interpretability, clinical validation and integration are named as barriers, and enhanced interpretability as a research need.
- **Relevance**: Names interpretability as an open barrier for AF prediction from sinus rhythm.
- **Quality**: Medium (10; citations not measured). Narrative synthesis.
- **Stance**: Supports the need the paper addresses.
- **Potential use**: Introduction; Discussion.

### Pfeifer et al. (2026). Multicenter validation of an artificial intelligence-enabled ECG model to predict 1-year risk of atrial fibrillation or flutter.
- **Type**: Journal article (Heart Rhythm)
- **Method**: Retrospective external validation at 3 sites; charts manually abstracted for patients aged 65 or older without prior AF or pacer; prespecified minimum sensitivity 20 percent and specificity 85 percent.
- **Key results**: Of 4,017 patients, 240 (6.0 percent) developed AF within 1 year. The model flagged 9.7 percent as increased risk, with sensitivity 31 percent (25 to 37) and specificity 92 percent (91 to 92).
- **Relevance**: An operating point for flagging 1-year AF risk with chart-confirmed endpoints, for comparison with top-decile flagging.
- **Quality**: High (14; citations not measured).
- **Stance**: Supports.
- **Potential use**: Methodology (endpoint definition); Discussion (operating points).

### Riek et al. (2026). Forecasting 1-year atrial fibrillation risk from sinus rhythm electrocardiograms in arrhythmia-naive patients.
- **Type**: Journal article (Heart Rhythm O2)
- **Method**: 26,015 University of Pittsburgh Medical Center patients with a normal sinus ECG within 1 year before an index visit; 417 ECG features; several survival models; outcome new-onset AF on the index ECG.
- **Key results**: Gradient-boosting survival reached a test C-index of 0.781; low, intermediate and high-risk groups had AF incidence of 5.1, 21.5 and 49.8 percent. Predictors included older age, lower P-wave amplitude and higher heart-rate variability.
- **Relevance**: Survival modelling over binary classification and feature-level reading that points to the P-wave.
- **Quality**: High (12; citations not measured). Mean follow-up 80 days and AF incidence 23.1 percent.
- **Stance**: Supports survival modelling of the sinus ECG.
- **Potential use**: Literature Review; Methodology.

### Zeidaabadi et al. (2026). Image based artificial intelligence-enhanced electrocardiogram prediction of incident atrial fibrillation.
- **Type**: Journal article (Heart Rhythm)
- **Method**: AI-ECG on ECG images from 1,163,401 BIDMC ECGs and 70,655 UK Biobank ECGs.
- **Key results**: C-statistic 0.754 (0.747 to 0.761) at BIDMC and 0.723 (0.704 to 0.741) in UK Biobank; above CHARGE-AF (0.696 vs 0.667) and additive when combined (0.711). Saliency focused on P-wave morphology and the PR interval.
- **Relevance**: Incident-AF benchmark on the MIMIC-IV source hospital, with saliency pointing to atrial waves.
- **Quality**: High (14; citations not measured).
- **Stance**: Supports.
- **Potential use**: Literature Review; Discussion.

### Theme 2: AF burden, clinical risk factors and the atrial substrate

### Alonso et al. (2013). Simple Risk Model Predicts Incidence of Atrial Fibrillation in a Racially and Geographically Diverse Population: the CHARGE-AF Consortium.
- **Type**: Journal article (Journal of the American Heart Association)
- **Method**: Pooled ARIC, CHS and Framingham data (18,556 participants) to derive a 5-year AF model; validated in AGES and the Rotterdam Study (7,672).
- **Key results**: C-statistic 0.765 (0.748 to 0.781). Adding ECG variables did not improve discrimination (0.767; net reclassification -0.0032). Validation C-statistics were 0.664 and 0.705 with adequate calibration.
- **Relevance**: The standard clinical risk model; its finding that ECG measurements add little to clinical variables sets what a waveform model has to add.
- **Quality**: High (15). Multi-cohort derivation and validation.
- **Stance**: Neutral; it is the clinical comparator.
- **Potential use**: Introduction; Methodology (clinical baseline); Discussion.

### Schnabel et al. (2009). Development of a risk score for atrial fibrillation (Framingham Heart Study): a community-based cohort study.
- **Type**: Journal article (The Lancet)
- **Method**: Multivariable Cox regression of 10-year AF incidence in 4,764 Framingham participants (457 events).
- **Key results**: Age, sex, significant murmur, heart failure, systolic blood pressure, hypertension treatment, body mass index and PR interval were associated with incident AF (C statistic 0.78). Echocardiographic features raised the C statistic only to 0.79.
- **Relevance**: Places the PR interval among clinical AF predictors, as the clinical term of the paper uses ECG intervals.
- **Quality**: High (15).
- **Stance**: Neutral; clinical comparator.
- **Potential use**: Introduction; Methodology (clinical baseline).

### Wolf et al. (1991). Atrial fibrillation as an independent risk factor for stroke: the Framingham Study.
- **Type**: Journal article (Stroke)
- **Method**: 34-year follow-up of 5,070 Framingham participants.
- **Key results**: AF was associated with a near fivefold excess of stroke. Its attributable risk rose from 1.5 percent at ages 50 to 59 to 23.5 percent at ages 80 to 89.
- **Relevance**: Background for why incident AF is worth predicting.
- **Quality**: High (13: relevance 1, background).
- **Stance**: Neutral.
- **Potential use**: Introduction.

### Schnabel et al. (2015). 50 year trends in atrial fibrillation prevalence, incidence, risk factors, and mortality in the Framingham Heart Study: a cohort study.
- **Type**: Journal article (The Lancet)
- **Method**: Framingham cohort 1958 to 2007 (9,511 participants), sex-stratified.
- **Key results**: Age-adjusted prevalence rose about fourfold and incidence more than tripled, partly from enhanced surveillance; stroke after AF onset declined 73.5 percent.
- **Relevance**: Background on AF burden and on surveillance shaping recorded incidence.
- **Quality**: High (13: relevance 1, background).
- **Stance**: Neutral.
- **Potential use**: Introduction.

### Van Gelder et al. (2024). 2024 ESC Guidelines for the management of atrial fibrillation developed in collaboration with the European Association for Cardio-Thoracic Surgery (EACTS).
- **Type**: Guideline (European Heart Journal)
- **Method**: Expert guideline.
- **Key results**: AI and big data increasingly affect electrophysiology and algorithms for automated AF diagnosis are being investigated, but "the clinical performance and broad applicability of these solutions are not yet known". [GAP: guideline sections on screening and risk prediction not read in full]
- **Relevance**: Current clinical position on AI for AF.
- **Quality**: Medium (10; citations not measured).
- **Stance**: Neutral.
- **Potential use**: Introduction; Discussion.

### Goette et al. (2016). EHRA/HRS/APHRS/SOLAECE expert consensus on atrial cardiomyopathies: definition, characterisation, and clinical implication.
- **Type**: Expert consensus (Journal of Arrhythmia; also published in Europace and Heart Rhythm)
- **Method**: Expert consensus on defining atrial cardiomyopathy.
- **Key results**: Atrial myocardium reacts to many cardiac and non-cardiac conditions with hypertrophy, ion-channel and transporter changes, fibroblast proliferation and thrombogenic changes, and these atrial pathologies affect arrhythmia occurrence and stroke risk. [GAP: Key results beyond the introduction]
- **Relevance**: The clinical concept of an atrial substrate that a sinus-rhythm ECG signature would reflect.
- **Quality**: Medium (10: venue 2, rigor 1, relevance 2, citations 3, evidence 2).
- **Stance**: Neutral; background for interpreting the signatures.
- **Potential use**: Discussion.

### Cheng et al. (2009). Long-term Outcomes in Individuals With Prolonged PR Interval or First-Degree Atrioventricular Block.
- **Type**: Journal article (JAMA)
- **Method**: Prospective community cohort of 7,575 Framingham participants with routine 12-lead ECGs from 1968 to 1974, followed through 2007; multivariable Cox models of the PR interval against incident AF, pacemaker implantation and death.
- **Key results**: 481 participants developed AF. Each 20 ms increment in PR was associated with an adjusted hazard ratio of 1.12 (1.02 to 1.22) for AF, and first-degree atrioventricular block (PR above 200 ms) with a twofold adjusted AF risk (hazard ratio 2.06, 1.36 to 3.12).
- **Relevance**: Cohort evidence that prolonged atrioventricular conduction in sinus rhythm precedes AF, the clinical counterpart of a PR-segment profile.
- **Quality**: High (15: citations 3, the `cited-by` listing holds more than 100 citing works).
- **Stance**: Supports.
- **Potential use**: Discussion.

### Magnani et al. (2013). Electrocardiographic PR Interval and Adverse Outcomes in Older Adults: The Health, Aging, and Body Composition Study.
- **Type**: Journal article (Circulation: Arrhythmia and Electrophysiology)
- **Method**: Biracial prospective cohort of 2,722 adults aged 74 years (SD 3; 41 percent black); multivariable Cox models of the PR interval against 10-year heart failure, AF and mortality.
- **Key results**: Each SD increase (29 ms) in PR interval was associated with a 13 percent higher risk of incident AF (hazard ratio 1.13, 1.04 to 1.23), with no effect modification by race; the PR interval was not associated with all-cause mortality.
- **Relevance**: Extends the association of the PR interval with AF to older black and white adults.
- **Quality**: High (14: relevance 2, citations 3).
- **Stance**: Supports.
- **Potential use**: Discussion.

### Magnani et al. (2015). P-wave indices and atrial fibrillation: Cross-cohort assessments from the Framingham Heart Study (FHS) and Atherosclerosis Risk in Communities (ARIC) study.
- **Type**: Journal article (American Heart Journal)
- **Method**: P-wave indices in 3,110 FHS and 8,254 ARIC participants; adjusted Cox models of 10-year AF risk, cross-cohort meta-analysis, and the change in C-statistic, net reclassification index and integrated discrimination improvement.
- **Key results**: Over 10 years 217 FHS and 458 ARIC participants developed AF. P-wave duration above 120 ms was associated with AF (hazard ratio 1.55, 1.29 to 1.85); P-wave terminal force was strongly associated with AF in ARIC but not in FHS. P-wave indices contributed minimally to risk prediction beyond traditional risk factors and markers.
- **Relevance**: P-wave indices as intermediate phenotypes of AF; their small gain in discrimination over risk factors bears on how much atrial ECG measurements add to a clinical term.
- **Quality**: High (15: citations 3).
- **Stance**: Supports the association; neutral on added discrimination.
- **Potential use**: Discussion.

### Tanaka et al. (2021). First-degree atrioventricular block is significantly associated with incident atrial fibrillation in the population predominantly including participants aged >= 60 years.
- **Type**: Journal article (Heart and Vessels)
- **Method**: 37,730 residents of Kanazawa City, Japan, aged 40 or older (mean age 72.3 years), with a 12-lead ECG at the 2013 national health check-up; first-degree atrioventricular block defined as PR of 220 ms or more (Minnesota code 6-3); Cox models adjusted for conventional AF risk factors over a median of 5 years.
- **Key results**: 667 participants (1.8 percent) had first-degree block at baseline and 691 developed AF. Five-year cumulative AF incidence was 6.8 percent with the block against 2.1 percent without, and the fully adjusted hazard ratio was 1.75 (1.25 to 2.45).
- **Relevance**: Shows the association of prolonged atrioventricular conduction with AF in an older Asian population.
- **Quality**: High (13; citations not measured).
- **Stance**: Supports.
- **Potential use**: Discussion.

### Ostrowska et al. (2022). Short P-Wave Duration Is Associated with Incident Atrial Fibrillation: A Registry-Based Cohort Study.
- **Type**: Journal article (International Heart Journal)
- **Method**: PIVUS cohort of 1,016 individuals aged 70 in Uppsala (877 at risk after exclusions); P-wave duration and PR duration in lead V1; Cox models adjusted for sex, RR interval, beta-blockers, systolic blood pressure, body mass index and smoking over 15 years.
- **Key results**: 189 participants developed AF. P-wave duration had a U-shaped relation with incident AF (P = 0.017), with durations below 60 ms associated with AF (hazard ratio 1.55, 1.15 to 2.09, for 42 ms). There was no significant relation between incident AF and the PR interval.
- **Relevance**: A cohort in which the PR interval, measured in one lead, did not predict AF; it limits how far the PR association can be generalised.
- **Quality**: High (12: rigor 2, citations not measured).
- **Stance**: Contrasting on the PR interval.
- **Potential use**: Discussion.

### Maezono et al. (2025). Electrocardiographic P-wave indices and onset of atrial fibrillation and histological fibrosis in a general Japanese population: a prospective cohort analysis of the Hisayama Study.
- **Type**: Journal article (European Heart Journal Open)
- **Method**: 2,907 community-dwelling adults aged 40 or older without prior AF in Hisayama, Japan, followed for 10 years; P-wave duration in lead II (cut-off 120 ms) and P-wave terminal force in V1 (cut-off 4,000 microvolt-milliseconds); Cox models; fibrosis of the left atrial posterior wall measured in 133 autopsied cases.
- **Key results**: 140 participants developed AF. Unadjusted AF incidence was 10.6 against 4.6 per 1,000 person-years for P-wave duration of 120 ms or more against less, and 14.4 against 4.7 for the terminal-force cut-off (both P < 0.001). Prolonged P-wave duration was associated with a higher age- and sex-adjusted percentage of left atrial fibrosis (P = 0.04).
- **Relevance**: Links a P-wave index both to incident AF and to histological atrial fibrosis, the substrate that atrial cardiomyopathy describes.
- **Quality**: High (12: rigor 2, citations not measured).
- **Stance**: Supports.
- **Potential use**: Discussion.

### Yogeswaran et al. (2025). P-Wave Indices and the Risks of Incident Atrial Fibrillation and Ischemic Stroke in Black Adults: The Jackson Heart Study.
- **Type**: Journal article (Journal of the American Heart Association)
- **Method**: 4,900 Black adults without AF at baseline in the Jackson Heart Study; PR interval, P-wave duration, P-wave axis and P-wave terminal force in V1 from resting 12-lead ECGs; Cox models adjusted for established risk factors over 13.7 years.
- **Key results**: 396 participants (9.3 percent) developed AF. Each SD increase in PR interval, P-wave duration and P-wave terminal force was associated with higher AF risk, strongest for terminal force (hazard ratio 1.27, 1.16 to 1.38); terminal force of 4,000 ms x microvolt or more gave a hazard ratio of 1.76 (1.38 to 2.25).
- **Relevance**: Recent evidence that the PR interval and P-wave indices, read by the authors as ECG measures of atrial cardiomyopathy, precede AF in a population that the older cohorts under-represent.
- **Quality**: High (14; citations not measured).
- **Stance**: Supports.
- **Potential use**: Discussion.

### Emmanuela et al. (2026). Electrocardiographic P-wave morphology and the risk of new-onset atrial fibrillation: a systematic review and meta-analysis.
- **Type**: Journal article, systematic review and meta-analysis (Bulgarian Cardiology)
- **Method**: Ten cohort studies (854 patients with new-onset AF and 3,477 without) from five databases; odds ratios for categorical and standardised mean differences for continuous P-wave measures.
- **Key results**: Patients who developed AF had longer P-wave duration (standardised mean difference 0.29, 0.17 to 0.41), and partial and advanced interatrial block were associated with new-onset AF (odds ratio 1.99, 1.52 to 2.60, and 2.50, 1.70 to 3.68); P-wave amplitude and dispersion did not differ. The authors rate the certainty of every estimate very low under GRADE and name the selected populations of the included studies (post-myocardial infarction, heart failure, cardiac resynchronisation) as a limit to applicability.
- **Relevance**: Pooled recent evidence on P-wave duration; its selected populations and very low certainty give it less weight than the community cohorts.
- **Quality**: Medium (8: venue 1, rigor 2, relevance 2, citations 2, evidence 1).
- **Stance**: Supports, at very low certainty.
- **Potential use**: Discussion.

### Theme 3: Interpretability and faithfulness

### Rudin (2019). Stop explaining black box machine learning models for high stakes decisions and use interpretable models instead.
- **Type**: Journal article, perspective (Nature Machine Intelligence)
- **Method**: Argument with example applications.
- **Key results**: Explaining black boxes in high-stakes decisions can perpetuate bad practice, and models should be interpretable by design. The paper sets out reasons to avoid explained black boxes and the challenges of interpretable machine learning.
- **Relevance**: The case for an interpretable model over a post-hoc explained CNN.
- **Quality**: Medium (10; citations not measured).
- **Stance**: Supports.
- **Potential use**: Introduction; Discussion.

### Adebayo et al. (2018). Sanity Checks for Saliency Maps.
- **Type**: Conference paper, archival preprint record (arXiv 1810.03292)
- **Method**: Model-parameter and data randomisation tests applied to saliency methods.
- **Key results**: Some saliency methods are independent of both the model and the data-generating process, and visual assessment of saliency can mislead.
- **Relevance**: Grounds the claim that saliency maps are not by themselves evidence of what a model uses.
- **Quality**: High (12; citations not measured).
- **Stance**: Supports the move away from saliency-only explanation.
- **Potential use**: Literature Review; Methodology (faithfulness controls).

### Hooker et al. (2018). A Benchmark for Interpretability Methods in Deep Neural Networks.
- **Type**: Conference paper, archival preprint record (arXiv 1806.10758)
- **Method**: ROAR (RemOve And Retrain), an empirical measure of how accurate feature-importance estimates are, on large image datasets.
- **Key results**: Many popular interpretability methods are no better than a random assignment of importance; only VarGrad and SmoothGrad-Squared exceed it.
- **Relevance**: The removal-based family of tests to which removing top-ranked versus bottom-ranked factors belongs.
- **Quality**: High (12; citations not measured).
- **Stance**: Supports testing importance by removal.
- **Potential use**: Methodology; Discussion.

### Koh et al. (2020). Concept Bottleneck Models.
- **Type**: Conference paper, archival preprint record (arXiv 2007.04612)
- **Method**: Models that first predict pre-specified concepts and then the label, with test-time intervention on concepts.
- **Key results**: Accuracy competitive with end-to-end models on x-ray grading and bird identification, with interpretation through clinical concepts; correcting concepts at test time raises accuracy.
- **Relevance**: The bottleneck design that an interpretable factor layer followed by a head resembles.
- **Quality**: High (13: citations 3, more than 100 citing works).
- **Stance**: Supports interpretable intermediate layers.
- **Potential use**: Literature Review.

### Mahinpei et al. (2021). Promises and Pitfalls of Black-Box Concept Learning Models.
- **Type**: Workshop paper, archival preprint record (arXiv 2106.13314)
- **Method**: Analysis of concept bottleneck and concept whitening models.
- **Key results**: Learned concept representations encode information beyond the pre-defined concepts, natural mitigations do not fully work, and interpretation of the downstream prediction can mislead. The paper describes the leakage mechanism.
- **Relevance**: The leakage risk for any nonlinear head on interpretable factors, which control probes are meant to test.
- **Quality**: Medium (10; citations not measured).
- **Stance**: Opposes taking an interpretable layer as faithful without a test.
- **Potential use**: Literature Review; Methodology; Discussion.

### B<latin small letter o with diaeresis>hle et al. (2022). B-cos Networks: Alignment is All We Need for Interpretability.
- **Type**: Conference paper, archival preprint record (arXiv 2205.10268)
- **Method**: Replaces linear transforms with the B-cos transform to promote weight-input alignment.
- **Key results**: A B-cos network induces a single linear transform that faithfully summarises the full model computation, with similar ImageNet performance in common architectures.
- **Relevance**: Faithful-by-design networks as prior art for intrinsic interpretability.
- **Quality**: High (12; citations not measured).
- **Stance**: Supports interpretability without accuracy loss.
- **Potential use**: Literature Review.

### Dooms et al. (2025). Compositionality Unlocks Deep Interpretable Models.
- **Type**: Archival preprint (arXiv 2504.02667), preliminary results
- **Method**: chi-net, an architecture combining the multilinear structure of tensor networks with deep networks, and the ODT diagonalisation algorithm.
- **Key results**: chi-nets keep accuracy equal to baselines, and ODT reveals linear low-rank structure in a multilayer SVHN model, used for formal weight-based interpretability and compression.
- **Relevance**: The closest conceptual prior art: interpretability from multilinear tensor-network structure on the predictive path.
- **Quality**: Medium (10; citations not measured).
- **Stance**: Neutral; a competing route to the same goal.
- **Potential use**: Literature Review.

### Arya et al. (2025). Faithful, Interpretable Chest X-ray Diagnosis with Artifact-free B-cos Networks.
- **Type**: Archival preprint (arXiv 2507.16761)
- **Method**: B-cos networks with anti-aliasing (ASAP and BlurPool) on chest x-ray datasets.
- **Key results**: Standard B-cos explanations show aliasing artifacts; the modified networks keep predictive performance with faithful, artifact-free explanations in multi-class and multi-label settings.
- **Relevance**: Faithful-by-design explanation in a medical modality.
- **Quality**: Medium (10; citations not measured).
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Arends et al. (2026). Signal or noise? Evaluating commonly used attribution methods for explaining deep neural networks in electrocardiogram classification.
- **Type**: Journal article (European Heart Journal - Digital Health)
- **Method**: Twelve attribution methods on CNNs trained on 873,710 median-beat ECGs in nine classes; inter-method similarity, self-consistency, dependence on weights and identification of features important to inference.
- **Key results**: Methods agreed poorly and varied widely; self-consistency across initialisations was moderate (mean correlation 0.41 to 0.65); weight randomisation reduced correlation quickly but not to zero for some methods. The authors advise caution, task-specific sanity checks, and inherently interpretable or counterfactual approaches.
- **Relevance**: ECG-specific evidence that post-hoc attribution is unreliable.
- **Quality**: High (13; citations not measured).
- **Stance**: Supports.
- **Potential use**: Introduction; Literature Review; Discussion.

### Wagner et al. (2024). Explaining deep learning for ECG analysis: Building blocks for auditing and knowledge discovery.
- **Type**: Journal article (Computers in Biology and Medicine)
- **Method**: Post-hoc XAI on ECG models from glocal (aggregated attributions) and global (concept-based) views, with sanity checks.
- **Key results**: Sanity checks identified saliency as the most sensible attribution method; a dataset-wide analysis gave quantitative evidence that model behaviour aligns with cardiologists' decision rules; the methods supported knowledge discovery such as myocardial infarction subtypes.
- **Relevance**: The position that post-hoc explanation, audited at dataset level, can be informative.
- **Quality**: High (12; citations not measured).
- **Stance**: Neutral; a counterweight to the attribution critique.
- **Potential use**: Literature Review; Discussion.

### Patlatzoglou et al. (2025). The cost of explainability in artificial intelligence-enhanced electrocardiogram models.
- **Type**: Journal article (npj Digital Medicine)
- **Method**: VAE-SCAN, variational autoencoder representations of interpretable ECG features linked to clinical factors, compared across models of varying explainability.
- **Key results**: The authors report a cost introduced by intrinsic ECG interpretability, and note that post-hoc explainability techniques have shown unreliable results.
- **Relevance**: Evidence that intrinsic interpretability can cost accuracy on ECG tasks.
- **Quality**: High (14; citations not measured).
- **Stance**: Opposes a general claim that interpretability comes at no accuracy cost.
- **Potential use**: Literature Review; Discussion.

### Zeiler and Fergus (2014). Visualizing and Understanding Convolutional Networks.
- **Type**: Conference paper (ECCV 2014, Lecture Notes in Computer Science)
- **Method**: Projection of feature activations back to the input with a deconvolutional network, and an occlusion sensitivity analysis that covers portions of the input image with a grey square and monitors the classifier output.
- **Key results**: The probability of the correct class drops significantly when the object is occluded, which shows that the model localises the object rather than using the surrounding context; covering the region that a feature map visualises lowers that map's activity.
- **Relevance**: The origin of occlusion sensitivity, the attribution method that the occlusion readout applies to 25 ms windows of the beat.
- **Quality**: High (13: rigor 2, citations 3, the `cited-by` listing holds more than 100 citing works).
- **Stance**: Neutral; method source.
- **Potential use**: Methodology.

### Zintgraf et al. (2017). Visualizing Deep Neural Network Decisions: Prediction Difference Analysis.
- **Type**: Archival preprint record (arXiv 1702.04595); the text read names no venue
- **Method**: Prediction difference analysis: the relevance of an input patch is the change in class evidence (weight of evidence) when the patch is removed by marginal sampling or by conditional sampling from the surrounding patch, with multivariate patches; ImageNet networks and an MRI classifier.
- **Key results**: The authors describe the grey-patch occlusion of Zeiler and Fergus as the analysis their method resembles, and replace it with a more rigorous removal of information and evaluation of its effect. Conditional sampling gave maps more concentrated on the object than marginal sampling, and the patch size changed the map.
- **Relevance**: Shows that what replaces the removed input, and the size of the removed region, shape an occlusion map; the readout replaces each window with zeros at one window size.
- **Quality**: Medium (10: venue 1, rigor 2, relevance 3, citations 2, evidence 2).
- **Stance**: Neutral; a methodological caveat for occlusion.
- **Potential use**: Methodology; Discussion.

### Ivanovs et al. (2021). Perturbation-based methods for explaining deep neural networks: A survey.
- **Type**: Journal article, survey (Pattern Recognition Letters)
- **Method**: Survey of perturbation-based explanation methods, which perturb the input of a network and observe the change in its output.
- **Key results**: Reviews the applications of perturbation-based methods across data types, from the extensively studied perturbation of images to video, natural language, software code and reinforcement learning, with their differences and similarities.
- **Relevance**: Places occlusion within the family of perturbation-based explanations.
- **Quality**: Medium (10: venue 2, rigor 2, relevance 2, citations 2, evidence 2).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### <latin capital letter s with caron>imi<latin small letter c with acute> et al. (2025). A comprehensive analysis of perturbation methods in explainable AI feature attribution validation for neural time series classifiers.
- **Type**: Journal article (Scientific Reports)
- **Method**: Evaluation of attribution methods on time-series classifiers by perturbing features in order of estimated importance, with a set of perturbation methods and region sizes; introduces the Consistency-Magnitude-Index.
- **Key results**: The most commonly used perturbation metric for validating attributions has flaws on time series. The choice of perturbation method and region size influences the evaluation, in relation to dataset and model characteristics, and the authors give guidelines for faithfulness assessment.
- **Relevance**: Time-series evidence that the replacement and the window size of a perturbation affect what it shows, which bears on zeroing fixed 25 ms windows of the ECG.
- **Quality**: Medium (11: venue 2, rigor 2, relevance 3, citations 2, evidence 2).
- **Stance**: Neutral; a caveat for occlusion on signals.
- **Potential use**: Methodology; Discussion.

### Theme 4: Tensor decompositions and block-term models

### De Lathauwer (2008). Decompositions of a Higher-Order Tensor in Block Terms - Part II: Definitions and Uniqueness.
- **Type**: Journal article (SIAM Journal on Matrix Analysis and Applications)
- **Method**: Theory of tensor decompositions in block terms.
- **Key results**: Introduces decompositions into blocks of smaller size characterised by mode-n ranks, with conditions for essential uniqueness; CP and Tucker decompositions are special cases.
- **Relevance**: The definition of the block-term decomposition the model's layer uses.
- **Quality**: High (13: citations 3).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Kolda and Bader (2009). Tensor Decompositions and Applications.
- **Type**: Journal article, survey (SIAM Review)
- **Method**: Survey of higher-order tensor decompositions and software.
- **Key results**: Describes CP as a sum of rank-one tensors and Tucker as a higher-order principal component analysis, with their variants and applications.
- **Relevance**: Notation and the CP and full-rank alternatives used in a block-structure comparison.
- **Quality**: High (12: relevance 1, citations 3).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Ye et al. (2020). Block-term tensor neural networks.
- **Type**: Journal article (Neural Networks)
- **Method**: Block-term tensor layers that approximate the weight matrices of CNNs and RNNs by low-rank block-term tensors.
- **Key results**: BT-layers reach a very large compression ratio on parameters while keeping or improving the representation power of the original networks.
- **Relevance**: Block-term structure inside neural networks used for weight compression, with factors that are not interpreted. Its title is the name "block-term tensor neural networks", which overlaps with the paper's model name.
- **Quality**: High (13; citations not measured).
- **Stance**: Neutral.
- **Potential use**: Literature Review.

### Van Den Kerchove et al. (2025). BTTDA: Block-Term Tensor Discriminant Analysis for Brain-Computer Interfacing.
- **Type**: Archival preprint (arXiv 2511.04292)
- **Method**: Supervised block-term feature extraction extending higher-order discriminant analysis with a forward model and deflation, evaluated on public EEG datasets.
- **Key results**: ROC-AUC 91.25 percent on event-related potentials and 64.52 percent against 61.00 percent for HODA on motor imagery. The block-term structure gives interpretable and more efficient dimensionality reduction without compromising discriminative power.
- **Relevance**: Supervised block-term models as interpretable and accurate for biosignals, as a standalone extractor followed by a classifier.
- **Quality**: Medium (11; citations not measured).
- **Stance**: Supports.
- **Potential use**: Literature Review.

### Faes et al. (2024). Single Finger Trajectory Prediction From Intracranial Brain Activity Using Block-Term Tensor Regression With Fast and Automatic Component Extraction.
- **Type**: Journal article (IEEE Transactions on Neural Networks and Learning Systems; online 2022)
- **Method**: Block-term tensor regression (BTTR) with two new tensor factorizations, automatic component extraction and a marginalisation procedure; finger trajectories from intracranial recordings.
- **Key results**: BTTR accounts for hidden multiway structure automatically and gains over vector- and matrix-based techniques.
- **Relevance**: The linear block-term regression that the paper uses as its linear baseline.
- **Quality**: High (12: citations 1, 12 citing works in the listing).
- **Stance**: Neutral.
- **Potential use**: Methodology (linear baseline); Literature Review.

### Goulart et al. (2020). Alternating Group Lasso for Block-Term Tensor Decomposition and Application to ECG Source Separation.
- **Type**: Journal article (IEEE Transactions on Signal Processing)
- **Method**: Provably convergent mixed-norm regularised BTD that estimates the block structure jointly, with a Hankel-constrained variant.
- **Key results**: More robust to initialisation than nonlinear least squares, and on semi-synthetic and real AF ECG it extracts multiple signals interpretable as AF patterns.
- **Relevance**: Block-term decomposition on the AF ECG for source separation, as distinct from risk prediction.
- **Quality**: High (13; citations not measured).
- **Stance**: Neutral.
- **Potential use**: Literature Review.

### Cornelissen and Faes (2026). An interpretable tensor model for identifying atrial fibrillation in sinus-rhythm ECG: block-term tensor regression on PTB-XL, benchmarked against deep and foundation models.
- **Type**: Technical report (Zenodo record), not peer-reviewed
- **Method**: BTTR on a samples-by-time-by-lead tensor of the median beat in PTB-XL for AF identification in sinus rhythm; benchmarked against clinical features, a CNN, a CP surrogate and HuBERT-ECG embeddings.
- **Key results**: The per-lead weight profile reproduced across resampling at Pearson r=0.88, and all paired patient-level bootstrap AUROC differences against the baselines were non-negative. R-peak registration was necessary for the tensor model.
- **Relevance**: A prior linear block-term model on AF identification in sinus rhythm. It differs from the paper in model (linear, median beat), task (identification, not dated incidence) and data (PTB-XL). The paper presents no PTB-XL AF-in-sinus-rhythm result of its own (settings.md, claims not to make, item c), and citing this separate record does not report one.
- **Quality**: Medium (10: venue 1, rigor 2, relevance 3, citations 1, evidence 3).
- **Stance**: Supports interpretability at no accuracy cost on its task.
- **Potential use**: Literature Review; Discussion.

### Theme 5: Data, labels and evaluation methods

### Johnson et al. (2023). MIMIC-IV, a freely accessible electronic health record dataset.
- **Type**: Journal article, data descriptor (Scientific Data)
- **Method**: Database description.
- **Key results**: MIMIC-IV is sourced from the electronic health record of the Beth Israel Deaconess Medical Center and holds measurements, orders, diagnoses, procedures, treatments and de-identified notes.
- **Relevance**: Source of the gold ICD-10 diagnoses in the hospital module.
- **Quality**: High (13; citations not measured).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Gow et al. (2023). MIMIC-IV-ECG: Diagnostic Electrocardiogram Matched Subset.
- **Type**: Dataset (PhysioNet)
- **Method**: Dataset description.
- **Key results**: About 800,000 diagnostic 12-lead 10-second ECGs at 500 Hz from nearly 160,000 patients, matched to the MIMIC-IV Clinical Database, with cardiologist reports when available.
- **Relevance**: The primary ECG cohort.
- **Quality**: Medium (10; citations not measured).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Wagner et al. (2020). PTB-XL, a large publicly available electrocardiography dataset.
- **Type**: Journal article, data descriptor (Scientific Data)
- **Method**: Dataset description.
- **Key results**: 21,837 10-second 12-lead records from 18,885 patients, annotated by up to two cardiologists as a multi-label dataset, with metadata and suggested folds.
- **Relevance**: External dataset from another country and device.
- **Quality**: High (13; citations not measured).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Ribeiro et al. (2021). CODE-15%: a large scale annotated dataset of 12-lead ECGs.
- **Type**: Dataset (Zenodo)
- **Method**: Dataset description.
- **Key results**: 345,779 exams from 233,770 patients, a stratified 15 percent sample of the CODE dataset collected by the Telehealth Network of Minas Gerais from 2010 to 2016, with AF labels, age and sex.
- **Relevance**: External dataset from Brazil.
- **Quality**: Medium (10; citations not measured).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Ribeiro et al. (2020). Automatic diagnosis of the 12-lead ECG using a deep neural network.
- **Type**: Journal article (Nature Communications)
- **Method**: Deep neural network trained on more than 2 million labelled exams from the CODE study.
- **Key results**: The network outperformed cardiology residents on 6 abnormalities in 12-lead ECGs, with K1 above 80 percent and specificity above 99 percent.
- **Relevance**: Origin of the CODE data and background for 12-lead deep networks.
- **Quality**: High (12: relevance 1).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Valasakis et al. (2026). Accuracy of atrial fibrillation labels in the MIMIC-IV ECG database: implications for artificial intelligence model development.
- **Type**: Conference abstract (European Heart Journal supplement)
- **Method**: Expert review by two reviewers of 700 ECGs (633 patients) labelled AF in MIMIC-IV.
- **Key results**: Only 458 of 700 (65.4 percent) showed AF; 176 (25.1 percent) showed sinus rhythm, and sinus rhythm read as AF made up 72.7 percent of errors. Inter-rater agreement on AF versus non-AF was 92 percent.
- **Relevance**: Evidence for using gold hospital ICD-10 diagnoses rather than machine-read ECG labels in MIMIC-IV.
- **Quality**: Medium (11: venue 2, rigor 2, relevance 3, citations 1, evidence 3).
- **Stance**: Supports the gold-label design.
- **Potential use**: Methodology (label source); Discussion.

### Yao et al. (2019). Sensitivity, specificity, positive and negative predictive values of identifying atrial fibrillation using administrative data: a systematic review and meta-analysis.
- **Type**: Journal article, systematic review and meta-analysis (Clinical Epidemiology)
- **Method**: Medline 2000 to 2018; 24 studies (21 from North America or Scandinavia) of AF case definitions in hospital (10), ambulatory (4) and mixed (10) administrative data, most based on ICD-9 or ICD-10 codes; random-effects pooling.
- **Key results**: Pooled sensitivity 80 percent (72 to 86), specificity 98 percent (96 to 99), positive predictive value 88 percent (82 to 94) and negative predictive value 97 percent (94 to 99). Twenty-two studies sampled patients diagnosed with AF and could give the positive predictive value alone, 13 used ECG confirmation as the gold standard, and 3 reported all parameters with rhythm monitoring in the gold standard. The authors conclude that administrative data may fail to identify a significant proportion of patients with AF.
- **Relevance**: The pooled accuracy of coded AF, which sizes the label-source limitation: most coded AF is true AF, and about one AF case in five is not coded.
- **Quality**: High (13: venue 2, rigor 3, relevance 3, citations 2, evidence 3; citations not measured).
- **Stance**: Supports the label-source limitation.
- **Potential use**: Discussion (limitations).

### Malmo et al. (2016). Validation of self-reported and hospital-diagnosed atrial fibrillation: the HUNT-study.
- **Type**: Journal article (Clinical Epidemiology)
- **Method**: 16,247 participants of the third HUNT survey in three Norwegian municipalities; self-reported AF and AF diagnoses from hospital and primary-care registers, every diagnosis verified by review of hospital and primary-care records.
- **Key results**: Of 502 participants with verified AF, 370 had an AF diagnosis in hospital discharge registers. A hospital discharge diagnosis of AF had sensitivity 73.7 percent, specificity 99.7 percent, positive predictive value 88.5 percent and negative predictive value 99.2 percent; self-report had sensitivity 49.6 percent.
- **Relevance**: A population-based estimate, with primary-care records in the reference, of how many AF cases a hospital discharge diagnosis misses, the situation of a cohort defined from hospital diagnoses.
- **Quality**: High (13: venue 2, rigor 3, relevance 3, citations 2, evidence 3; citations not measured).
- **Stance**: Supports the label-source limitation.
- **Potential use**: Discussion (limitations).

### Rix et al. (2012). Validity of the diagnoses atrial fibrillation and atrial flutter in a Danish patient registry.
- **Type**: Journal article (Scandinavian Cardiovascular Journal)
- **Method**: Medical-record review of incident AF or flutter diagnoses recorded in the Danish National Patient Registry for participants of the Diet, Cancer and Health cohort (13.6 years of follow-up).
- **Key results**: The positive predictive value of the combined AF or flutter diagnosis was 92.6 percent (88.8 to 95.2), with no significant difference between sexes. A specified flutter diagnosis had a positive predictive value of 57.5 percent in men and 29.6 percent in women and did not reliably distinguish flutter from AF.
- **Relevance**: Registry evidence that coded AF diagnoses are mostly correct and that a coded flutter diagnosis does not separate flutter from AF, which supports counting AF and flutter codes together.
- **Quality**: Medium (11: venue 2, rigor 2, relevance 2, citations 3, evidence 2).
- **Stance**: Supports.
- **Potential use**: Methodology (label source); Discussion (limitations).

### Cox (1972). Regression Models and Life-Tables.
- **Type**: Journal article (Journal of the Royal Statistical Society Series B)
- **Method**: Statistical theory for censored failure times.
- **Key results**: The hazard is modelled as a function of explanatory variables and regression coefficients times an arbitrary function of time, with a conditional likelihood for the coefficients.
- **Relevance**: The partial likelihood behind the survival loss.
- **Quality**: High (13: citations 3).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Katzman et al. (2018). DeepSurv: personalized treatment recommender system using a Cox proportional hazards deep neural network.
- **Type**: Journal article (BMC Medical Research Methodology)
- **Method**: A Cox proportional hazards deep neural network, tested on simulated and real survival data.
- **Key results**: DeepSurv performed as well as or better than other survival models and modelled increasingly complex covariate-risk relationships.
- **Relevance**: Precedent for training a neural network with the Cox partial likelihood.
- **Quality**: High (13; citations not measured).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Vickers and Elkin (2006). Decision Curve Analysis: A Novel Method for Evaluating Prediction Models.
- **Type**: Journal article (Medical Decision Making)
- **Method**: Derivation of net benefit across threshold probabilities from the test data alone.
- **Key results**: Decision curves show the threshold range where a model is of value, the size of the benefit and which of several models is best.
- **Relevance**: The decision-curve method of the clinical evaluation.
- **Quality**: High (14: citations 3).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Collins et al. (2024). TRIPOD+AI statement: updated guidance for reporting clinical prediction models that use regression or machine learning methods.
- **Type**: Reporting guideline (BMJ)
- **Method**: Consensus reporting guideline.
- **Key results**: A 27-item checklist, an expanded checklist and a 13-item checklist for abstracts, aimed at complete reporting of prediction model studies.
- **Relevance**: The reporting standard for a prediction-model paper in this venue's field.
- **Quality**: Medium (11; citations not measured).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Mehari and Strodthoff (2022). Self-supervised representation learning from 12-lead ECG data.
- **Type**: Journal article (Computers in Biology and Medicine)
- **Method**: Instance-discrimination and latent-forecasting self-supervised methods adapted to clinical 12-lead ECG.
- **Key results**: The best method, an adaptation of contrastive predictive coding, came within 0.5 percent of supervised performance in linear evaluation; finetuning gave about 1 percent gain, label efficiency and robustness to physiological noise.
- **Relevance**: Precedent for self-supervised pretraining of a 12-lead ECG encoder.
- **Quality**: High (13; citations not measured).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### Kiyasseh et al. (2020). CLOCS: Contrastive Learning of Cardiac Signals Across Space, Time, and Patients.
- **Type**: Conference paper, archival preprint record (arXiv 2005.13249)
- **Method**: Contrastive pretraining that treats representations across leads, time segments and patients as similar.
- **Key results**: CLOCS outperformed BYOL and SimCLR in linear evaluation and finetuning, generalised with 25 percent of labelled data, and produced patient-specific representations.
- **Relevance**: Contrastive pretraining designed for cardiac signals.
- **Quality**: High (12; citations not measured).
- **Stance**: Neutral.
- **Potential use**: Methodology.

### McKeen et al. (2025). ECG-FM: an open electrocardiogram foundation model.
- **Type**: Journal article (JAMIA Open)
- **Method**: Transformer foundation model pretrained on 1.5 million 12-lead ECGs with masked reconstruction and contrastive learning; open benchmark on MIMIC-IV-ECG.
- **Key results**: Finetuned models outperformed task-specific baselines in small-to-medium data regimes, with AUROC 0.996 for atrial fibrillation (diagnosis) and 0.929 for LVEF at or below 40 percent.
- **Relevance**: Foundation-model context on the same ECG database; its AF result is diagnosis, not incident prediction.
- **Quality**: High (12; citations not measured).
- **Stance**: Neutral.
- **Potential use**: Methodology; Discussion.

## 5. Literature matrix

T1 = AI-ECG prediction of incident AF; T2 = AF burden, clinical risk factors and the atrial substrate; T3 = interpretability and faithfulness; T4 = tensor decompositions and block-term models; T5 = data, labels and evaluation methods.

| Source | T1 | T2 | T3 | T4 | T5 | Method | Quality |
|---|---|---|---|---|---|---|---|
| Attia (2019) | main | | | | x | Computational | High |
| Raghunath (2021) | main | | | | | Computational | High |
| Khurshid (2022) | main | x | x | | | Computational | High |
| Christopoulos (2020) | main | x | | | | Computational | High |
| Biton (2021) | main | x | | | | Computational | High |
| Habineza (2023) | main | | | | x | Computational | High |
| Yuan (2023) | main | | | | x | Computational | High |
| Jabbour (2024) | main | x | | | x | Computational | High |
| Sau (2026) | main | x | | | x | Computational | High |
| Khurshid (2025) | main | x | | | | Computational | High |
| Tsiartas (2025) | main | | | | x | Review | High |
| Kashou (2021) | x | x | main | | | Review | Medium |
| Saiz-Vivo (2025) | main | | x | | | Review | Medium |
| Pfeifer (2026) | main | | | | x | Computational | High |
| Riek (2026) | main | x | x | | x | Computational | High |
| Zeidaabadi (2026) | main | x | x | | | Computational | High |
| Alonso (2013) | x | main | | | | Quantitative | High |
| Schnabel (2009) | x | main | | | | Quantitative | High |
| Wolf (1991) | | main | | | | Quantitative | High |
| Schnabel (2015) | | main | | | | Quantitative | High |
| Van Gelder (2024) | x | main | | | | Review | Medium |
| Goette (2016) | | main | | | | Review | Medium |
| Cheng (2009) | | main | | | | Quantitative | High |
| Magnani (2013) | | main | | | | Quantitative | High |
| Magnani (2015) | | main | | | | Quantitative | High |
| Tanaka (2021) | | main | | | | Quantitative | High |
| Ostrowska (2022) | | main | | | | Quantitative | High |
| Maezono (2025) | | main | | | | Quantitative | High |
| Yogeswaran (2025) | | main | | | | Quantitative | High |
| Emmanuela (2026) | | main | | | | Review | Medium |
| Rudin (2019) | | | main | | | Theoretical | Medium |
| Adebayo (2018) | | | main | | | Computational | High |
| Hooker (2018) | | | main | | | Computational | High |
| Koh (2020) | | | main | | | Computational | High |
| Mahinpei (2021) | | | main | | | Computational | Medium |
| B<latin small letter o with diaeresis>hle (2022) | | | main | | | Computational | High |
| Dooms (2025) | | | main | x | | Computational | Medium |
| Arya (2025) | | | main | | | Computational | Medium |
| Arends (2026) | | | main | | | Computational | High |
| Wagner (2024) | | | main | | | Computational | High |
| Patlatzoglou (2025) | x | | main | | | Computational | High |
| Zeiler (2014) | | | main | | | Computational | High |
| Zintgraf (2017) | | | main | | | Computational | Medium |
| Ivanovs (2021) | | | main | | | Review | Medium |
| <latin capital letter s with caron>imi<latin small letter c with acute> (2025) | | | main | | | Computational | Medium |
| De Lathauwer (2008) | | | | main | | Theoretical | High |
| Kolda (2009) | | | | main | | Review | High |
| Ye (2020) | | | | main | | Computational | High |
| Van Den Kerchove (2025) | | | x | main | | Computational | Medium |
| Faes (2024) | | | | main | | Computational | High |
| Goulart (2020) | | x | | main | | Computational | High |
| Cornelissen (2026) | x | | x | main | | Computational | Medium |
| Johnson (2023) | | | | | main | Dataset | High |
| Gow (2023) | | | | | main | Dataset | Medium |
| Wagner (2020) | | | | | main | Dataset | High |
| Ribeiro (2021) | | | | | main | Dataset | Medium |
| Ribeiro (2020) | | | | | main | Computational | High |
| Valasakis (2026) | x | | | | main | Quantitative | Medium |
| Yao (2019) | | | | | main | Review | High |
| Malmo (2016) | | | | | main | Quantitative | High |
| Rix (2012) | | | | | main | Quantitative | Medium |
| Cox (1972) | | | | | main | Theoretical | High |
| Katzman (2018) | | | | | main | Computational | High |
| Vickers (2006) | | | | | main | Theoretical | High |
| Collins (2024) | | | | | main | Review | Medium |
| Mehari (2022) | | | | | main | Computational | High |
| Kiyasseh (2020) | | | | | main | Computational | High |
| McKeen (2025) | | | | | main | Computational | High |

Sources per theme (main or x): T1 22, T2 24, T3 22, T4 8, T5 24.

## 6. Identified gaps

1. **Methodological gap: explanations of incident-AF models are not tested for faithfulness.** The incident-AF studies in the set explain their models by post-hoc saliency [@Khurshid_2022; @Zeidaabadi_2026] or by feature importance [@Riek_2026], and none reports a test of whether the explanation reflects the decision. ECG-specific work finds attribution methods unstable and only partly dependent on model weights [@Arends_2026], in line with general sanity-check and removal results [@arxiv_1810_03292; @arxiv_1806_10758]. Actionable: report faithfulness as measured quantities, such as how much of the full model's discrimination a linear readout of the interpretable factors recovers, control probes, and the effect of removing top-ranked against bottom-ranked factors.
2. **Under-researched area: block-term structure as a predictive layer for dated incident AF.** In the set, block-term models appear as weight compression in networks [@Ye_2020], source separation of atrial activity in AF ECG [@Goulart_2020], decoding of brain signals [@Faes_2024; @arxiv_2511_04292], and linear identification of AF in sinus rhythm on PTB-XL [@https://doi.org/10.5281/zenodo.22227432]. No source trains block-term frequency and lead factors end to end with a survival objective for incident AF from the routine 12-lead ECG. Actionable: the contribution statement, with each of these cited and distinguished; the overlap with the title of [@Ye_2020] makes the model name a point to state explicitly.
3. **Methodological gap: label provenance for AF in public ECG databases.** A third of sampled AF-labelled MIMIC-IV ECGs did not show AF on expert review [@Valasakis_2026], and 11 of 14 studies in a systematic review cite possible misclassification of negative cases [@Tsiartas_2025]. The abstract of the one incident-AF validation on MIMIC-IV in the set does not state its label source [@Jabbour_2024]. Hospital ICD codes, the alternative, are mostly correct but incomplete: pooled positive predictive value 88 percent and sensitivity 80 percent, with sensitivity measured in few studies [@Yao_2019], and a hospital discharge diagnosis found 73.7 percent of record-verified AF in a population study [@Malmo_2016]. Actionable: define incident AF from hospital ICD-10 diagnoses, state the label source, the cohort flow and the incompleteness of coded AF as a limit of the label, and follow TRIPOD+AI [@Collins_2024].
4. **Methodological gap: leakage through interpretable layers is untested on the ECG.** Concept representations can carry information beyond their intended concepts [@arxiv_2106_13314], a risk for any nonlinear head on interpretable factors [@arxiv_2007_04612]. No ECG study in the set tests for it with label-blind or matched-dimension control probes. Actionable: control probes against raw-input, random-projection and label-blind factor baselines.
5. **Unresolved disagreement on the accuracy cost of intrinsic interpretability.** One ECG study reports a cost of intrinsic interpretability [@Patlatzoglou_2025], while block-term models on other tasks report none [@https://doi.org/10.5281/zenodo.22227432; @arxiv_2511_04292], and faithful-by-design image networks keep accuracy [@arxiv_2205_10268; @arxiv_2507_16761]. No study in the set compares an intrinsically interpretable model with a CNN on incident AF under one protocol. Actionable: a paired comparison with confidence intervals on the same cohort.
6. **Geographical gap in the AI-ECG studies.** Of the 32 cohort and dataset sources with a stated site, 21 are from the United States, 4 from Brazil, 2 from Japan, and 1 each from Canada, Germany, Norway, Denmark and Sweden. The two Japanese cohorts are ECG-interval studies [@Tanaka_2021; @Maezono_2025]; no AI-ECG cohort from Asia is in the set (see the distribution advisory). Actionable: state the populations of the derivation and external sets and the absence of an Asian AI-ECG cohort as a coverage limit.

Coverage limits of this review: four candidate sources could not be read and are not in the set (Bontinck et al. 2026 on metadata leakage in hybrid ECG models; Nielsen et al. 2013 on the PR interval and Nielsen et al. 2015 on P-wave duration, both from the Copenhagen ECG Study; Roberts and Gollob 2022 on atrial myopathy). The cohort literature on the PR interval and P-wave indices is represented by the Framingham, ARIC, Health ABC, Kanazawa, PIVUS, Hisayama and Jackson Heart cohorts [@Schnabel_2009; @Cheng_2009; @Magnani_2013; @Magnani_2015; @Tanaka_2021; @Ostrowska_2022; @Maezono_2025; @Yogeswaran_2025] and one meta-analysis [@Emmanuela_2026], without the Copenhagen ECG Study.

## 7. Synthesis

### AI-ECG prediction of incident atrial fibrillation

Deep networks on the resting sinus-rhythm 12-lead ECG predict later AF across several health systems. A network trained on 1.6 million ECGs reached an AUROC of 0.85 for new-onset AF within 1 year [@Raghunath_2021]. A model from a tertiary cardiac centre reached 0.78 at 5 years and 0.77 on external validation in MIMIC-IV [@Jabbour_2024]. A survival-loss CNN on the hospital behind MIMIC-IV reached a C-index of 0.750 [@Sau_2026], and an image-based model on the same hospital 0.754 [@Zeidaabadi_2026]. In Brazilian telehealth data a residual CNN reached 0.845 [@Habineza_2023]. Under external validation with chart-confirmed endpoints, one model flagged 9.7 percent of older patients with sensitivity 31 percent and specificity 92 percent [@Pfeifer_2026].

The studies agree that the ECG carries the signal. They disagree in magnitude, and much of that disagreement follows the outcome window. Identifying patients who already have or soon show AF gives higher numbers than dated incidence: an AUC of 0.87 when prior AF counts as positive [@Attia_2019], and 0.86 to 0.93 for AF within 31 days [@Yuan_2023]. A systematic review found 31-day confirmation windows associated with a higher AUC than 1-year windows (0.851 against 0.630) [@Tsiartas_2025], and a narrative review found AI more accurate at shorter event horizons [@Saiz_Vivo_2025]. These are two tasks, and results from one do not transfer to the other.

The models are black boxes, and their explanations are post-hoc. Saliency placed the most influence on the P-wave [@Khurshid_2022] or on P-wave morphology and the PR interval [@Zeidaabadi_2026], and a feature-based survival model named lower P-wave amplitude among its predictors [@Riek_2026]. Clinical commentary and reviews name interpretability as a barrier to use [@Kashou_2021; @Saiz_Vivo_2025].

### AF burden, clinical risk factors and the atrial substrate

AF was associated with a near fivefold excess of stroke in Framingham, with an attributable risk that grows with age [@Wolf_1991]. Recorded incidence and prevalence rose over 50 years, partly through enhanced surveillance [@Schnabel_2015]. The current ESC guideline states that the clinical performance and broad applicability of AI solutions for AF are not yet known [@Van_Gelder_2024].

Clinical risk models give the comparator. The Framingham score reached a C statistic of 0.78 with the PR interval among its predictors [@Schnabel_2009]. CHARGE-AF reached 0.765 at derivation and 0.664 to 0.705 at validation, and adding ECG variables did not improve it [@Alonso_2013]. AI-ECG and clinical scores were comparable and complementary in several cohorts: comparable AUROC with the highest value for the combination [@Khurshid_2022], equal C statistics of 0.69 with independent effects [@Christopoulos_2020], and comparable discrimination for a single-lead model with age and sex [@Khurshid_2025]. Other studies found the ECG model ahead [@Jabbour_2024; @Zeidaabadi_2026], and fusing deep ECG features with clinical data outperformed every single modality [@Biton_2021]. The ranking depends on the cohort: an ECG model led in a hospital population while CHARGE-AF was the best single predictor in a volunteer cohort [@Sau_2026].

Cohort studies tie atrial and atrioventricular conduction measured in sinus rhythm to later AF. In Framingham each 20 ms of PR interval carried an adjusted hazard ratio of 1.12 for AF, and first-degree atrioventricular block doubled the risk [@Cheng_2009]. The association held in older black and white adults [@Magnani_2013] and in an older Japanese population, with a hazard ratio of 1.75 for first-degree block [@Tanaka_2021]. In Black adults of the Jackson Heart Study the PR interval, P-wave duration and P-wave terminal force in V1 were each associated with incident AF [@Yogeswaran_2025]. Across Framingham and ARIC, P-wave duration above 120 ms was associated with AF but added little to discrimination beyond risk factors [@Magnani_2015], and a meta-analysis of selected populations found longer P-wave duration and interatrial block in patients who developed AF, at very low certainty [@Emmanuela_2026]. The association is not uniform: in a Swedish cohort of 70-year-olds the PR interval measured in lead V1 was not related to incident AF, while a short P-wave duration was [@Ostrowska_2022].

The atrial focus of these explanations has a clinical counterpart. An expert consensus defines atrial cardiomyopathy as structural and electrical change of the atrial myocardium that affects arrhythmia occurrence [@Goette_2016]. In a Japanese community cohort, prolonged P-wave duration was associated both with incident AF and with more left atrial fibrosis at autopsy [@Maezono_2025]. This gives a frame for reading frequency and lead signatures as markers of an AF-prone substrate.

### Interpretability and faithfulness

Post-hoc explanations are often unreliable. Some saliency methods are independent of both the model and the data [@arxiv_1810_03292], and many importance estimates are no better than random under remove-and-retrain evaluation [@arxiv_1806_10758]. On the ECG, twelve attribution methods agreed poorly and were only moderately self-consistent [@Arends_2026]. Dataset-level auditing with sanity checks gives a more favourable reading: saliency aligned with cardiologists' decision rules across patient subgroups [@Wagner_2024].

Occlusion is a perturbation explanation: parts of the input are covered and the change in the output is recorded [@Zeiler_2014], one of a family of perturbation-based methods surveyed across data types [@Ivanovs_2021]. What replaces the removed input, and how large the removed region is, change the result. Prediction difference analysis replaced grey-patch occlusion with sampling conditioned on the surrounding input and found that the patch size changed the map [@arxiv_1702_04595], and on time-series classifiers the perturbation method and the region size influenced the evaluation of attributions [@_imi__2025].

The alternative is a model interpretable by design [@Rudin_2019]. Concept bottleneck models route the prediction through named concepts at competitive accuracy [@arxiv_2007_04612], but their concept representations can leak information beyond the concepts, which makes the interpretation misleading [@arxiv_2106_13314]. B-cos networks summarise the whole computation as one linear transform at similar accuracy [@arxiv_2205_10268], and an anti-aliased variant gives faithful explanations on chest x-rays [@arxiv_2507_16761]. Multilinear tensor-network structure has also been proposed as a route to formal weight-based interpretability at equal accuracy [@arxiv_2504_02667].

Whether intrinsic interpretability costs accuracy is contested. A variational-autoencoder study of ECG features reports a cost [@Patlatzoglou_2025]. A supervised block-term discriminant method reports none on EEG decoding [@arxiv_2511_04292], and a linear block-term regression on PTB-XL was not outperformed by any baseline on AF identification in sinus rhythm [@https://doi.org/10.5281/zenodo.22227432].

### Tensor decompositions and block-term models

The block-term decomposition splits a tensor into blocks of low multilinear rank, with CP and Tucker as special cases [@De_Lathauwer_2008; @Kolda_2009]. Its uses differ in where the factors sit. In block-term tensor networks the decomposition compresses the weights and the factors are not read [@Ye_2020]. In AF electrocardiography it separates atrial activity from the recording [@Goulart_2020]. In supervised regression and discriminant analysis on brain signals it extracts factors that are read and that predict [@Faes_2024; @arxiv_2511_04292], and the same regression has been applied to AF identification on the median beat [@https://doi.org/10.5281/zenodo.22227432]. No source in the set places readable block-term factors on the predictive path of a network trained end to end for incident AF.

### Data, labels and evaluation methods

MIMIC-IV comes from the electronic health record of the Beth Israel Deaconess Medical Center [@Johnson_2023], and MIMIC-IV-ECG holds about 800,000 diagnostic ECGs from nearly 160,000 patients matched to it [@https://doi.org/10.13026/4nqg-sb35]. Labels need care: of 700 MIMIC-IV ECGs labelled AF, only 65.4 percent showed AF on expert review, and most errors were sinus rhythm read as AF [@Valasakis_2026]. Hospital ICD codes for AF are mostly correct but incomplete. A meta-analysis of 24 validation studies pooled a positive predictive value of 88 percent and a sensitivity of 80 percent for administrative AF case definitions, and noted that few studies measured sensitivity [@Yao_2019]. In a Norwegian population study a hospital discharge diagnosis found 73.7 percent of record-verified AF [@Malmo_2016], and in a Danish registry the combined AF or flutter diagnosis had a positive predictive value of 92.6 percent while a specified flutter diagnosis was unreliable [@Rix_2012]. External data from other countries and devices are available in PTB-XL [@Wagner_2020] and in CODE-15% [@https://doi.org/10.5281/zenodo.4916206], a sample of the CODE study [@Ribeiro_2020].

Survival modelling rests on the proportional hazards model and its partial likelihood [@Cox_1972], which DeepSurv trains inside a neural network [@Katzman_2018], and survival losses are in use for AF prediction [@Sau_2026; @Riek_2026]. Self-supervised pretraining of 12-lead ECG encoders brings small gains and label efficiency [@Mehari_2022; @arxiv_2005_13249], and an ECG foundation model offers an open benchmark on MIMIC-IV-ECG [@McKeen_2025]. Beyond discrimination, decision curves give net benefit across thresholds [@Vickers_2006], and TRIPOD+AI sets the reporting items for prediction-model studies [@Collins_2024].

## 8. Recommended sources by paper section

| Section | Key sources |
|---|---|
| Introduction | [@Wolf_1991; @Schnabel_2015; @Van_Gelder_2024; @Raghunath_2021; @Khurshid_2022; @Alonso_2013; @Tsiartas_2025; @Kashou_2021; @Saiz_Vivo_2025; @Rudin_2019; @Arends_2026] |
| Literature Review | [@Attia_2019; @Raghunath_2021; @Khurshid_2022; @Christopoulos_2020; @Biton_2021; @Habineza_2023; @Yuan_2023; @Jabbour_2024; @Sau_2026; @Khurshid_2025; @Riek_2026; @Zeidaabadi_2026; @arxiv_1810_03292; @arxiv_1806_10758; @arxiv_2007_04612; @arxiv_2106_13314; @arxiv_2205_10268; @arxiv_2504_02667; @arxiv_2507_16761; @Wagner_2024; @Patlatzoglou_2025; @Ye_2020; @Goulart_2020; @arxiv_2511_04292; @Faes_2024; @https://doi.org/10.5281/zenodo.22227432] |
| Methodology | [@Johnson_2023; @https://doi.org/10.13026/4nqg-sb35; @Valasakis_2026; @Wagner_2020; @https://doi.org/10.5281/zenodo.4916206; @Ribeiro_2020; @De_Lathauwer_2008; @Kolda_2009; @Faes_2024; @Cox_1972; @Katzman_2018; @Mehari_2022; @arxiv_2005_13249; @Schnabel_2009; @Alonso_2013; @arxiv_1806_10758; @arxiv_2106_13314; @Vickers_2006; @Collins_2024; @Pfeifer_2026; @Rix_2012; @Zeiler_2014; @arxiv_1702_04595; @Ivanovs_2021; @_imi__2025] |
| Discussion | [@Jabbour_2024; @Sau_2026; @Zeidaabadi_2026; @Khurshid_2022; @Attia_2019; @Yuan_2023; @Tsiartas_2025; @Goette_2016; @Patlatzoglou_2025; @https://doi.org/10.5281/zenodo.22227432; @Arends_2026; @Valasakis_2026; @Pfeifer_2026; @McKeen_2025; @Van_Gelder_2024; @Schnabel_2009; @Cheng_2009; @Magnani_2013; @Magnani_2015; @Tanaka_2021; @Ostrowska_2022; @Maezono_2025; @Yogeswaran_2025; @Emmanuela_2026; @Yao_2019; @Malmo_2016; @Rix_2012; @arxiv_1702_04595; @_imi__2025] |

## 9. No entry written

Every included source has an entry in `refs.bib`.

## 10. Search limitations and gate failures

Search conditions after 3 passes (the search ends when 3 of 5 hold):

| # | Condition | Holds | Evidence |
|---|---|---|---|
| 1 | Source count meets the target | Yes | 53 against the IMRaD minimum of 20 |
| 2 | Latest search added little | Yes | Pass 3 added 1 source to the 47 collected before it (2.1 percent) |
| 3 | Every theme has at least 3 sources | Yes | 8 to 22 per theme |
| 4 | Citation loop closes | No | Pass 3 chaining reached P-wave cohort studies not in the set; the one tried (Nielsen et al. 2015) had no readable text |
| 5 | Temporal span covered | Yes | Foundational works from 1972 to 2013, and 20 sources from 2024 to 2026 |

Four of five conditions hold, so the search ended after pass 3.

Search conditions for the outline's sections marked needs literature, after passes S1 to S3:

| # | Condition | Holds | Evidence |
|---|---|---|---|
| 1 | Source count meets the target | Yes | 68 against the IMRaD minimum of 20 |
| 2 | Latest search added little | Yes | Pass S3 added 3 sources to the 65 collected before it (4.6 percent); pass S2 added none |
| 3 | Every theme has at least 3 sources | Yes | 8 to 24 per theme; for the three outline items, 3, 8 and 4 sources |
| 4 | Citation loop closes | No | Chaining from Cheng et al. 2009 and Nielsen et al. 2013 reaches the Copenhagen ECG Study papers, which have no readable text |
| 5 | Temporal span covered | Yes | For the three items, foundational works from 2009 to 2015 and 4 sources from 2025 and 2026 |

Four of five conditions hold, so the searches ended after pass S3.

Search limitations:
- Semantic Scholar returned no search records in any of the 13 searches of the review (HTTP 429 in 8, not found in 5) or in any of the 14 searches for the outline's sections (HTTP 429 in 11, not found in 3), so layers 1 and 4 rest on Crossref, OpenAlex and arXiv. Semantic Scholar did contribute to citation chaining and forward tracking.
- Crossref reads no Boolean operator, so its 100 records per search are relevance-ranked by words.
- Full text was not available for 42 of the 68 sources; their annotations rest on the abstract the indexes returned. For three of them (Kashou and Noseworthy 2021, Van Gelder et al. 2024, Goette et al. 2016) the text read covers only part of the work, and the unread part is marked [GAP] in the annotation.
- The citation-count item of the quality score was measured only for the works counted with `cited-by`; for the others it is a default of 2.

Gates:

| Gate | Result |
|---|---|
| Search documented | Met: indexes, strings, dates, counts and criteria in section 1 |
| Source count | Met: 68 (IMRaD minimum 20) |
| Annotations | Met: 68 of 68 |
| Matrix coverage | Met: every theme has 8 or more sources |
| Research gaps | Met: 6 gaps in section 6 |
| Peer-reviewed share | Met: 60 of 68 (88.2 percent) are peer-reviewed journal articles, conference papers or conference abstracts; with the `cs_ml` rule counting the 5 arXiv-only preprints, 65 of 68 (95.6 percent). The remaining 3 are 2 datasets and 1 technical report. |
| Currency | Not met: 32 of 68 (47.1 percent) are from 2022 to 2026, below the 50 percent the gate sets. The last-3-years search the gate prescribes was run for the review (it added Saiz-Vivo, Pfeifer, Riek, Zeidaabadi and Arya) and again for the outline's sections as pass S3 (it added Yogeswaran et al. 2025, Emmanuela et al. 2026 and <latin capital letter s with caron>imi<latin small letter c with acute> et al. 2025). The share fell below 50 percent because the outline's items 6.2 and 6.3 ask for the cohort and validation literature, whose core studies date from 2009 to 2021. |

## 11. AI disclosure

AI disclosure: This review was produced with AI-assisted research tools (Claude Opus, claude-opus-5-5, through AI agents). The AI took part in research assistance for the search and the annotated bibliography, and in drafting assistance for the synthesis. A person oversaw the process, and the authors take responsibility for the content.

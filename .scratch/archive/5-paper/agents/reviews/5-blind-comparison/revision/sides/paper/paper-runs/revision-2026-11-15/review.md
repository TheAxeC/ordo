# Literature review for the revision items

Manuscript BSPC-D-26-11935. The search answers the revision items that call for a new reference: R2-1b, R2-3, R2-4, R3-1, R3-2 (optional), R3-4 and R3-14. R1-3 needs no new entry, since hdbscan2013 stands in the `.bib`.

## 1. Search strategy

```
Screened from the manuscript's .bib:
- Entries scanned: 21
- Included: 8 entries: clifford2017af, ecgfounder2024, hubertarabie1985, hubertecg2024, lookingbeyond2026, ptbxl2020, rousseeuw1987, vinh2010
- Excluded by the criteria: 13 entries: clocs2021, dechazal2004, fedavg2017, hdbscan2013, hrvstandards1996, mehari2022ssl, mitbih2001, neurokit2021, physionet2000, sklearn2011, sslclustering2025, threekg2021, wavelettensorecg2018
- Skipped (the criteria cannot be applied): 0 entries
- Note: presence in the .bib does not imply inclusion; the same criteria applied to the .bib and to external sources.
```

The criterion that decided each excluded entry is relevance: none of the 13 addresses a claim of the seven items. hdbscan2013 answers R1-3, which is outside this search. hrvstandards1996 concerns heart-rate-variability measurement and states no AF diagnostic criterion in a passage read here. clocs2021, threekg2021 and mehari2022ssl are self-supervised ECG methods and not foundation models with released weights named by the benchmark studies below.

The research questions, one per item:

- R2-1b: is there a source for Lead II as the conventional rhythm lead, and for the visibility of the defining signs of AF in a single lead?
- R2-3: which sources define NMI, the V-measure and the Fowlkes-Mallows index?
- R2-4: which source states the diagnostic criteria of AF?
- R3-1: which recent studies benchmark ECG foundation models, and what do they measure?
- R3-2: which public multi-class arrhythmia datasets can the statement of scope name?
- R3-4: which other ECG foundation models have publicly available weights?
- R3-14: have the preprints of the `.bib` (ecgfounder2024, hubertecg2024, lookingbeyond2026, sslclustering2025) appeared in a journal or proceedings?

Profile: `cs_ml`, which admits arXiv preprints and conference proceedings, each tagged by its evidence type. The discipline row (biomedical signal processing) fits Engineering and Technology, so the profile and the discipline agree. Language: English. Year range: the last 10 years, with seminal works unrestricted (the metric papers of 1983 and 2005).

Indexes. Every `lookup.py search` queries Crossref, OpenAlex, Semantic Scholar and arXiv, and `refs` and `cited-by` query Semantic Scholar and OpenAlex. The last column of the table names each index a call left out, with the reason it printed, and each index that answered "not found".

Searches, all on 2026-11-15. The record count is the number of record lines the listing printed, before duplicates across listings were removed.

| # | Pass, layer | Search string or work | Records | Indexes left out or not found |
|---|---|---|---|---|
| 1 | 1, Boolean | `("atrial fibrillation" AND guidelines AND diagnosis AND "ESC")` | 100 | OpenAlex and Semantic Scholar left out (HTTP 429 after 3 retries); arXiv not found |
| 2 | 1, Boolean | `("rhythm strip" OR "rhythm lead") AND ("lead II") AND electrocardiogram` | 100 | OpenAlex and Semantic Scholar left out (HTTP 429 after 3 retries); arXiv not found |
| 3 | 1, semantic | `Lead II is the standard rhythm lead because P waves are most clearly visible in lead II` | 100 | OpenAlex left out (HTTP 429 after 3 retries); Semantic Scholar and arXiv not found |
| 4 | 1, Boolean | `("ECG" OR "electrocardiogram") AND ("foundation model" OR "foundation models") AND (benchmark OR benchmarking OR evaluation)` | 196 | Semantic Scholar left out (HTTP 429 after 3 retries); arXiv left out (no answer, TimeoutError) |
| 5 | 1, Boolean | `("V-measure" OR "normalized mutual information") AND ("external cluster evaluation" OR "clustering comparison")` | 195 | Semantic Scholar left out (HTTP 429 after 3 retries); arXiv not found |
| 6 | 1, chaining | `refs 2601.21830` (lookingbeyond2026) | 37 | OpenAlex not found |
| 7 | 1, chaining | `refs 2509.25095` (Al-Masud et al.) | 61 | none |
| 8 | 1, forward | `cited-by 2601.21830` | 0 | OpenAlex and Semantic Scholar not found |
| 9 | 1, forward | `cited-by 2509.25095` | 22 | none |
| 10 | 2, Boolean | `"Benchmarking ECG foundational models" OR "ECG foundation models" AND "linear probing" AND benchmark` | 158 | Semantic Scholar left out (HTTP 429 after 3 retries); arXiv left out (no answer, TimeoutError) |
| 11 | 2, Boolean | `"V-measure" AND homogeneity AND completeness AND clustering` | 199 | Semantic Scholar left out (HTTP 429 after 3 retries); arXiv left out (no answer, TimeoutError) |
| 12 | 2, Boolean | `"lead II" AND "P wave" AND ("atrial fibrillation" OR rhythm) AND (detection OR visibility OR amplitude)` | 200 | Semantic Scholar left out (HTTP 429 after 3 retries) |
| 13 | 2, semantic | `lead II rhythm strip P wave sinus rhythm interpretation of the electrocardiogram` (limit 50) | 99 | Semantic Scholar left out (HTTP 429 after 3 retries); arXiv not found |
| 14 | 2, Boolean | `"HuBERT-ECG" self-supervised foundation model cardiac` (limit 50) | 92 | Semantic Scholar and arXiv left out (HTTP 429 after 3 retries) |
| 15 | 2, semantic | `How do ECG foundation model embeddings compare with hand-crafted features for unsupervised clustering of arrhythmia` | 200 | Semantic Scholar and arXiv left out (HTTP 429 after 3 retries) |
| 16 | 3, Boolean | `("single-lead" OR "single lead") AND ECG AND "atrial fibrillation" AND (detection OR classification) AND (accuracy OR validation)` | 187 | Semantic Scholar and arXiv left out (HTTP 429 after 3 retries) |

Pass 1 ran the four layers over all items. Pass 2 searched again for the items still open after pass 1 (the Lead II convention, the V-measure, further benchmarks, a published HuBERT-ECG) and ran the semantic search on the question of the study. Pass 3 searched the weakest theme, single-lead evidence for R2-1b.

Lookups by identifier (`resolve`, `fetch`, `bibtex`) are listed with each source in section 4 and under section 10.

## 2. Distribution advisory

No distribution advisory triggered. Over the 25 sources of the final set, the largest concentration on time is the 2020s with 17 of 25 (68 percent); on venue, preprints alone are 6 of 25 and no journal holds more than 2; on method, foundation-model method papers are 7 of 25. Geography is left out, since the sources state no study region for most entries.

## 3. Screening results

- Initial hits: 1,946 record lines over the 16 listings, before removal of duplicates across listings; the count after removal was not made.
- Title screening of the listings gave 35 candidates whose abstract or full text was read or whose record was resolved, besides the 8 included `.bib` entries.
- Full-text or abstract assessment kept 17 external sources; 16 have an entry in `refs.bib` and one (the V-measure paper) has no DOI or arXiv identifier.
- Final set: 25 sources, the 8 included `.bib` entries and the 17 external sources.

Candidates excluded at the full-text or abstract stage, each with its reason:

- Hindricks et al. 2020 ESC AF guideline (doi 10.1093/eurheartj/ehaa612): superseded by the 2024 ESC guideline, which is included.
- Meek and Morris 2002, ABC of clinical electrocardiography (doi 10.1136/bmj.324.7334.415), Kligfield et al. 2007 AHA/ACCF/HRS recommendations (doi 10.1161/CIRCULATIONAHA.106.180200 and doi 10.1016/j.jacc.2007.01.024), Drew et al. 2004 (doi 10.1161/01.CIR.0000145144.56673.59), Sandau et al. 2017 (doi 10.1161/CIR.0000000000000527), Reiser et al. 2023 (doi 10.1002/9781119266938.ch3), Suba et al. 2022 (doi 10.4037/ajcc2022352), Climent et al. 2005 (doi 10.1109/cic.2005.1588069), Spodick 2001 and 2003 (doi 10.1111/j.1076-7460.2001.00025.x, doi 10.1111/j.1076-7460.2003.01787.x): no passage stating that Lead II is the conventional rhythm lead could be read. The full texts were not retrievable (HTTP 403 or no open-access copy) and the abstracts do not state it. Climent et al. report that the lead with the largest P wave lies outside the standard twelve leads, and the two Spodick editorials are titled as cautions against Lead II as a rhythm strip; neither supports the convention.
- Kvalseth 2017, On normalized mutual information (doi 10.3390/e19110631): it derives the family of normalisations, and Danon et al. 2005 already gives the arithmetic-mean normalisation the manuscript uses.
- Strehl and Ghosh 2002, Cluster ensembles: its DOI 10.1162/153244303321897735 is listed by Crossref as a deleted DOI and Semantic Scholar marks it DOI_MISMATCH, so no entry can be confirmed; its NMI uses the geometric-mean normalisation, which the manuscript does not use.
- Wan et al. 2025, OpenECG (arXiv 2503.00711): it pretrains its own models with three self-supervised methods to study pretraining data, and does not benchmark released ECG foundation models.
- Avram 2025, Comparison of supervised and self-supervised ECG foundation models (doi 10.1016/j.jelectrocard.2025.153947): neither full text nor abstract was retrievable, so it could not be assessed.
- Reyna et al. 2021, PhysioNet/CinC Challenge 2021 (doi 10.23919/cinc53138.2021.9662687), and Liu et al. 2022, SPH database (doi 10.1038/s41597-022-01403-5): resolved and relevant to R3-2, but R3-2 asks only for datasets to name in the statement of scope, and R3-14 requires every `.bib` entry to be cited; two datasets (Zheng et al. 2020 and Perez Alday et al. 2020, which pools several sources) cover the statement. Either can be added on request.

## 4. Annotated bibliography

Theme T1: AF diagnostic criteria and single-lead visibility.

### Van Gelder et al. (2024). 2024 ESC Guidelines for the management of atrial fibrillation.
- **Type**: Journal article (clinical practice guideline), European Heart Journal 45(36):3314-3414, doi 10.1093/eurheartj/ehae176.
- **Method**: Task-force guideline with graded recommendations.
- **Key results**: Section 3.1 states that AF "is reflected on the surface electrocardiogram (ECG) by the absence of discernible and regular P waves, and irregular activation of the ventricles", which "results in no specific pattern to RR intervals". Section 3.2 recommends (class I) that "a standard 12-lead ECG recording or a single-lead ECG tracing of >=30 s showing heart rhythm with no discernible repeating P waves and irregular RR intervals (when atrioventricular conduction is not impaired) is diagnostic of clinical AF". It also notes that the 30 s threshold rests on consensus "albeit with limited evidence".
- **Relevance**: The diagnostic criteria of AF for R2-4, and the statement that a single-lead tracing suffices for the diagnosis for R2-1b.
- **Quality**: High (current European guideline, Q1 journal).
- **Stance**: Supports the hand-crafted features' rationale (RR irregularity, P-wave presence).
- **Potential use**: Methods 3.2 (hand-crafted features), Discussion of R2-4, Methods 3.1 for R2-1b.

### Hannun et al. (2019). Cardiologist-level arrhythmia detection and classification in ambulatory electrocardiograms using a deep neural network.
- **Type**: Journal article, Nature Medicine 25(1):65-69, doi 10.1038/s41591-018-0268-3.
- **Method**: Deep neural network trained on 91,232 single-lead ambulatory ECGs from 53,549 patients, tested against a cardiologist consensus committee.
- **Key results**: The network classifies 12 rhythm classes from single-lead ECGs with an average ROC AUC of 0.97 and an average F1 of 0.837, above the average cardiologist F1 of 0.780 (abstract).
- **Relevance**: Evidence that a broad range of rhythms, AF among them, is identifiable from a single lead (R2-1b); also a multi-class single-lead rhythm task (R3-2).
- **Quality**: High (Q1 journal, independent expert-annotated test set).
- **Stance**: Supports the single-lead point.
- **Potential use**: Methods 3.1 (justification of Lead II for the hand-crafted features).

### Clifford et al. (2017). AF classification from a short single lead ECG recording: the PhysioNet/Computing in Cardiology Challenge 2017.
- **Type**: Conference paper, Computing in Cardiology 44; already in the .bib.
- **Method**: Challenge description: 12,186 single-lead recordings (9 to 61 s, lead I equivalent from a handheld device), 75 teams.
- **Key results**: Four teams tied at an F1 of 0.83 averaged over classes, and a combination of 45 algorithms reached 0.87 (abstract). The introduction states that "it is challenging to reliably detect AF from a single short lead of ECG" and that "many non-AF rhythms exhibit irregular RR intervals that may be similar to AF".
- **Relevance**: Single-lead AF detection as an established task (R2-1b), and its stated limitation, which bears on the implications R2-1b asks for.
- **Quality**: Medium (well-known proceedings, large public dataset).
- **Stance**: Supports, with a stated caution.
- **Potential use**: Methods 3.1, Limitations.

Theme T2: clustering agreement metrics.

### Danon et al. (2005). Comparing community structure identification.
- **Type**: Journal article, Journal of Statistical Mechanics: Theory and Experiment, P09008, doi 10.1088/1742-5468/2005/09/P09008.
- **Method**: Comparison of community-detection algorithms on benchmark graphs.
- **Key results**: Proposes the normalised mutual information I(A,B) = -2 sum_ij N_ij log(N_ij N / (N_i. N_.j)) / (sum_i N_i. log(N_i./N) + sum_j N_.j log(N_.j/N)), the mutual information over the arithmetic mean of the two entropies. It equals 1 for identical partitions and 0 for independent ones, "for example when the entire network is found to be one community" (Section 2, equation 2).
- **Relevance**: The formula, range and one-cluster value of NMI with the arithmetic normalisation (R2-3).
- **Quality**: High (Q1 journal, widely cited definition).
- **Stance**: Neutral.
- **Potential use**: Methods 3.3.

### Fowlkes and Mallows (1983). A method for comparing two hierarchical clusterings.
- **Type**: Journal article, Journal of the American Statistical Association 78(383):553-569, doi 10.1080/01621459.1983.10478008.
- **Method**: Statistical method paper with Monte Carlo experiments.
- **Key results**: Derives the similarity measure B_k "from the matching matrix, [m_ij], formed by cutting the two hierarchical trees and counting the number of matching entries in the k clusters in each tree", gives its mean and variance under fixed margins, and compares it with the Rand measure (abstract). The full text was not retrievable (no open-access copy).
- **Relevance**: The original source of the Fowlkes-Mallows index (R2-3).
- **Quality**: High (Q1 journal, seminal).
- **Stance**: Neutral.
- **Potential use**: Methods 3.3. The abstract does not state the formula as the geometric mean of pairwise precision and recall, so the formula in the revised 3.3 is for the citation compliance agent to check against the paper.

### Rosenberg and Hirschberg (2007). V-Measure: a conditional entropy-based external cluster evaluation measure.
- **Type**: Conference paper, EMNLP-CoNLL 2007 (OpenAlex W2138615112, Semantic Scholar 5421dbcb7e14766eb3d951910ae8d7892d735a01). No entry written (section 9).
- **Method**: [GAP: method]
- **Key results**: [GAP: key results] No text was retrievable, since the paper has no DOI or arXiv identifier for `fetch`.
- **Relevance**: The original source of the V-measure (R2-3).
- **Quality**: Medium (well-known proceedings).
- **Stance**: Neutral.
- **Potential use**: Methods 3.3.

### Vinh et al. (2010). Information theoretic measures for clusterings comparison.
- **Type**: Journal article, Journal of Machine Learning Research 11; already in the .bib.
- **Method**: [GAP: method] The entry has no DOI or arXiv identifier, so no text was fetched.
- **Key results**: [GAP: key results]
- **Relevance**: Already cited for AMI; it is the standard reference for the normalisation variants of NMI (R2-3), a use the citation compliance agent can confirm against the paper.
- **Quality**: High (JMLR).
- **Stance**: Neutral.
- **Potential use**: Methods 3.3.

### Hubert and Arabie (1985). Comparing partitions.
- **Type**: Journal article, Journal of Classification 2(1); already in the .bib.
- **Method**: [GAP: method] No full text or abstract was retrievable.
- **Key results**: [GAP: key results]
- **Relevance**: Already cited for ARI (R2-3).
- **Quality**: High (seminal).
- **Stance**: Neutral.
- **Potential use**: Methods 3.3.

### Rousseeuw (1987). Silhouettes: a graphical aid to the interpretation and validation of cluster analysis.
- **Type**: Journal article; already in the .bib.
- **Method**: Method paper.
- **Key results**: Each cluster is represented by a silhouette based on "the comparison of its tightness and separation", and "the average silhouette width provides an evaluation of clustering validity" (abstract).
- **Relevance**: Already cited for the silhouette (R2-3).
- **Quality**: High (seminal).
- **Stance**: Neutral.
- **Potential use**: Methods 3.3.

Theme T3: ECG foundation-model benchmark studies.

### Filice et al. (2026). Looking beyond accuracy: a holistic benchmark of ECG foundation models.
- **Type**: Preprint (arXiv 2601.21830); already in the .bib.
- **Method**: Benchmark of ECG foundation models with downstream performance and a representation-wise evaluation through SHAP and UMAP.
- **Key results**: It states that prior benchmarks "focus predominantly on the evaluation of downstream performance" and that "none of these works include a representation-wise evaluation". It reports that for some models "the global organization of the embedding space is driven by dataset-specific characteristics rather than by the clinical label".
- **Relevance**: The closest benchmark (R3-1, R3-4).
- **Quality**: Medium (preprint, tagged as such under `cs_ml`).
- **Stance**: Neutral; its finding on dataset-driven embeddings is consistent with the manuscript's HuBERT-ECG result.
- **Potential use**: Related work, Discussion.

### Lunelli et al. (2026). BenchECG and xECG: a benchmark and baseline for ECG foundation models.
- **Type**: Journal article, npj Digital Medicine, doi 10.1038/s41746-026-03196-y (article in press; arXiv 2509.10151).
- **Method**: Standardised benchmark of eight public datasets (421,171 patients, 1,674,704 recordings) and ten tasks (classification, detection, regression, survival analysis, segmentation), with out-of-distribution tests.
- **Key results**: Evaluates the models "with publicly available pretrained weights" ST-MEM, ECG-JEPA, ECG-CPC and ECGFounder, and proposes xECG, which reaches the highest BenchECG score (0.838). On MIT-BIH R-peak detection with a 20 ms window, ECGFounder scored an F1 of 0.149. The text contains no clustering evaluation and no hand-crafted baseline (the words "cluster" and "hand-crafted" do not occur in the fetched text).
- **Relevance**: A recent benchmark to compare by name (R3-1), and a list of public models (R3-4).
- **Quality**: High (Q1 journal, open benchmark).
- **Stance**: Neutral.
- **Potential use**: Related work, Discussion.

### Al-Masud et al. (2025). Benchmarking ECG FMs: a reality check across clinical tasks.
- **Type**: Preprint (arXiv 2509.25095); Semantic Scholar lists the venue as the International Conference on Learning Representations, with no DOI.
- **Method**: Benchmark of eight ECG foundation models on 26 tasks from 12 public datasets, under fine-tuning and frozen settings, with scaling and representation analyses.
- **Key results**: "Only FMs with publicly available pretrained weights are included": ECGFounder, ECG-JEPA, ST-MEM, MERL, ECGFM-KED, HuBERT-ECG, ECG-FM, and the authors' ECG-CPC. ECG-CPC, a compact state-space model, led 5 of 7 task categories, and models with similar performance learn different internal structures (abstract).
- **Relevance**: R3-1, and the fullest list of public models with weights for R3-4.
- **Quality**: Medium (preprint).
- **Stance**: Neutral.
- **Potential use**: Related work, Discussion, Limitations.

### Berger et al. (2026). Position: evaluation of ECG representations must be fixed.
- **Type**: Preprint (arXiv 2602.17531), position paper.
- **Method**: Argument with an empirical evaluation of five ECG pretraining approaches in six settings.
- **Key results**: The field "has largely converged on three public multi-label benchmarks (PTB-XL, CPSC2018, CSN) dominated by arrhythmia and waveform-morphology labels"; under multi-label best practices "the literature's current conclusion about which representations perform best is altered"; and "a randomly initialized encoder with linear evaluation matches state-of-the-art pre-training on many tasks" (abstract).
- **Relevance**: R3-1: a critique of ECG representation evaluation that the manuscript's protocol (supervised ceiling, chance-corrected scores, a non-learned baseline) can be placed against.
- **Quality**: Medium (preprint).
- **Stance**: Supports the manuscript's emphasis on evaluation controls.
- **Potential use**: Introduction, Related work.

### Xu et al. (2025). An electrocardiogram multi-task benchmark with comprehensive evaluations and insightful findings.
- **Type**: Conference paper, MEDINFO 2025, Studies in Health Technology and Informatics, doi 10.3233/SHTI251036.
- **Method**: Benchmark of language, general time-series and ECG foundation models against time-series deep learning models on several ECG tasks.
- **Key results**: General time-series and ECG foundation models "achieve a top performance rate of 80%" (abstract).
- **Relevance**: R3-1.
- **Quality**: Medium (peer-reviewed proceedings).
- **Stance**: Neutral.
- **Potential use**: Related work.

Theme T4: public ECG foundation models.

### Li et al. (2025). An electrocardiogram foundation model built on over 10 million recordings (ECGFounder).
- **Type**: Journal article, NEJM AI 2(7), doi 10.1056/AIoa2401033; the published version of the `.bib` preprint ecgfounder2024 (see section 9).
- **Method**: Supervised pretraining on 10,771,552 ECGs from 1,818,247 subjects "with 150 label categories from the Harvard-Emory ECG Database" (abstract).
- **Key results**: AUROC above 0.95 for 80 diagnoses on internal validation, with extension to reduced-lead and single-lead ECGs (abstract).
- **Relevance**: The supervised training objective R2-4 asks to state; R3-14.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Methods 3.2, Discussion of R2-4.

### Coppola et al. (2024). HuBERT-ECG as a self-supervised foundation model for broad and scalable cardiac applications.
- **Type**: Preprint (medRxiv, doi 10.1101/2024.11.14.24317328); already in the .bib.
- **Method**: Self-supervised pretraining on 9.1 million 12-lead ECGs covering 164 conditions (abstract).
- **Key results**: AUROCs from 84.3 percent in low-data settings to 99 percent in large-scale setups after fine-tuning (abstract).
- **Relevance**: The self-supervised objective R2-4 asks to state; R3-14 (no published version found).
- **Quality**: Medium (preprint).
- **Stance**: Neutral.
- **Potential use**: Methods 3.2.

### Na et al. (2024). Guiding masked representation learning to capture spatio-temporal relationship of electrocardiogram (ST-MEM).
- **Type**: Preprint (arXiv 2402.09450); Semantic Scholar lists the venue as the International Conference on Learning Representations, with no DOI.
- **Method**: Masked reconstruction of 12-lead ECG for spatio-temporal features.
- **Key results**: Outperforms other self-supervised baselines for arrhythmia classification and adapts to several lead combinations; "Our code is available at https://github.com/bakqui/ST-MEM" (abstract).
- **Relevance**: R3-4.
- **Quality**: Medium.
- **Stance**: Neutral.
- **Potential use**: Discussion, Limitations.

### Kim (2027). Learning general representation of 12-lead ECG with a joint-embedding predictive architecture (ECG-JEPA).
- **Type**: Journal article, Neural Networks 205:109334, doi 10.1016/j.neunet.2026.109334 (Crossref gives the year 2027, OpenAlex 2026); the abstract was read in the arXiv version 2410.08559, which OpenAlex links to this DOI.
- **Method**: Self-supervised prediction in the latent space with a lead-aware masked attention, trained on about 180,000 samples from open datasets.
- **Key results**: State-of-the-art results in diagnostic classification, feature extraction and segmentation (abstract); "Our code is available at https://github.com/sehunfromdaegu/ECG_JEPA".
- **Relevance**: R3-4.
- **Quality**: High (Q1 journal).
- **Stance**: Neutral.
- **Potential use**: Discussion, Limitations.

### Liu et al. (2024). Zero-shot ECG classification with multimodal learning and test-time clinical knowledge enhancement (MERL).
- **Type**: Preprint (arXiv 2403.06659); Semantic Scholar lists the venue as the International Conference on Machine Learning, with no DOI.
- **Method**: Contrastive ECG-text pretraining with zero-shot classification.
- **Key results**: "Code and models are available at https://github.com/cheliu-computation/MERL"; it also builds a benchmark of MERL and 10 self-supervised methods on six datasets.
- **Relevance**: R3-4.
- **Quality**: Medium.
- **Stance**: Neutral.
- **Potential use**: Discussion, Limitations.

### Tian et al. (2024). Foundation model of ECG diagnosis: diagnostics and explanations of any form and rhythm on ECG (ECGFM-KED).
- **Type**: Journal article, Cell Reports Medicine 5(12):101875, doi 10.1016/j.xcrm.2024.101875.
- **Method**: Knowledge-enhanced pretraining with a large language model on 800,000 ECGs from about 160,000 patients.
- **Key results**: Zero-shot diagnosis across regions and conditions, comparable to three cardiologists on seven common ECG types (abstract). Public weights are stated by Al-Masud et al., whose benchmark includes only models with released weights.
- **Relevance**: R3-4.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Discussion, Limitations.

### McKeen et al. (2025). ECG-FM: an open electrocardiogram foundation model.
- **Type**: Journal article, JAMIA Open 8(5), doi 10.1093/jamiaopen/ooaf122.
- **Method**: Transformer pretrained on 1.5 million 12-lead ECGs with masked reconstruction and contrastive learning.
- **Key results**: AUROC 0.996 for AF and 0.929 for LVEF <= 40 percent; "We release our code, model weights, tutorials, and benchmark" (abstract).
- **Relevance**: R3-4.
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Discussion, Limitations.

### Han et al. (2026). Review of open foundation models and datasets for ECG and PPG waveforms.
- **Type**: Review, npj Digital Medicine, doi 10.1038/s41746-026-03101-7 (article in press).
- **Method**: Narrative review of open ECG and PPG foundation models and datasets.
- **Key results**: Names as challenges the "reliance on homogeneous pretraining datasets and the absence of standardized evaluation frameworks" (abstract).
- **Relevance**: R3-4 (a single citation for the range of open models) and R3-1 (the lack of standard evaluation).
- **Quality**: High (Q1 journal).
- **Stance**: Supports the need for controlled evaluation.
- **Potential use**: Introduction, Discussion.

Theme T5: multi-class ECG datasets.

### Zheng et al. (2020). A 12-lead electrocardiogram database for arrhythmia research covering more than 10,000 patients.
- **Type**: Data descriptor, Scientific Data 7(1), doi 10.1038/s41597-020-0386-x.
- **Method**: Dataset paper.
- **Key results**: 12-lead ECGs of 10,646 patients at 500 Hz, 10 s each, labelled with "11 common rhythms and 67 additional cardiovascular conditions" (abstract).
- **Relevance**: A public multi-class rhythm dataset to name in the statement of scope (R3-2).
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Limitations.

### Perez Alday et al. (2020). Classification of 12-lead ECGs: the PhysioNet/Computing in Cardiology Challenge 2020.
- **Type**: Journal article, Physiological Measurement 41(12):124003, doi 10.1088/1361-6579/abc960 (text read in the medRxiv version returned by OpenAlex).
- **Method**: Challenge description: 66,405 recordings from hospital systems in four countries, 43,101 of them public.
- **Key results**: 27 of 111 diagnoses were used to score the entries; over 200 teams submitted 850 algorithms.
- **Relevance**: A public multi-source, multi-class 12-lead dataset for the statement of scope (R3-2).
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Limitations.

### Wagner et al. (2020). PTB-XL, a large publicly available electrocardiography dataset.
- **Type**: Data descriptor; already in the .bib.
- **Method**: Dataset paper.
- **Key results**: 21,837 records from 18,885 patients, "annotated by up to two cardiologists as a multi-label dataset" (abstract).
- **Relevance**: PTB-XL itself carries multi-label rhythm statements, which bears on the statement of scope (R3-2).
- **Quality**: High.
- **Stance**: Neutral.
- **Potential use**: Methods 3.1, Limitations.

## 5. Literature matrix

| Source | T1 AF criteria, single lead | T2 Metrics | T3 FM benchmarks | T4 Public FMs | T5 Multi-class datasets | Method | Quality |
|---|---|---|---|---|---|---|---|
| Van Gelder et al. (2024) | main | | | | | Guideline | High |
| Hannun et al. (2019) | main | | | | x | Quant | High |
| Clifford et al. (2017) | main | | | | x | Dataset | Medium |
| Danon et al. (2005) | | main | | | | Method | High |
| Fowlkes and Mallows (1983) | | main | | | | Method | High |
| Rosenberg and Hirschberg (2007) | | main | | | | Method | Medium |
| Vinh et al. (2010) | | main | | | | Method | High |
| Hubert and Arabie (1985) | | main | | | | Method | High |
| Rousseeuw (1987) | | main | | | | Method | High |
| Filice et al. (2026) | | | main | x | | Benchmark | Medium |
| Lunelli et al. (2026) | | | main | x | | Benchmark | High |
| Al-Masud et al. (2025) | | | main | x | | Benchmark | Medium |
| Berger et al. (2026) | | | main | | | Benchmark | Medium |
| Xu et al. (2025) | | | main | | | Benchmark | Medium |
| Li et al. (2025) | | | | main | | Computational | High |
| Coppola et al. (2024) | | | | main | | Computational | Medium |
| Na et al. (2024) | | | | main | | Computational | Medium |
| Kim (2027) | | | | main | | Computational | High |
| Liu et al. (2024) | | | | main | | Computational | Medium |
| Tian et al. (2024) | | | | main | | Computational | High |
| McKeen et al. (2025) | | | | main | | Computational | High |
| Han et al. (2026) | | | x | main | | Review | High |
| Zheng et al. (2020) | | | | | main | Dataset | High |
| Perez Alday et al. (2020) | | | | | main | Dataset | High |
| Wagner et al. (2020) | | | | | main | Dataset | High |

## 6. Identified gaps

1. Methodological gap: none of the benchmark studies read here evaluates ECG foundation-model embeddings by unsupervised clustering against a hand-crafted baseline. Lunelli et al. 2026, Al-Masud et al. 2025 and Berger et al. 2026 evaluate supervised transfer, fine-tuning or linear probing; their fetched texts contain no clustering evaluation and no hand-crafted baseline. Filice et al. 2026 evaluates embeddings representation-wise (SHAP, UMAP) between foundation models only. This is the gap R3-1 asks the manuscript to state.
2. Methodological gap: no benchmark read here pairs a label-free score with a supervised ceiling under the same patient grouping, which separates missing information from unfavourable geometry. Berger et al. report that a random encoder with a linear probe matches pretraining on many tasks, which shows that linear-probe results alone do not separate the two.
3. Under-researched area: the benchmarks evaluate beat-level MIT-BIH only for R-peak detection (Lunelli et al.), not for beat-morphology structure, and none tests the models on the 2-lead MIT-BIH beats.
4. Coverage limit of this search: no passage was read that states Lead II as the conventional rhythm lead (R2-1b), and the V-measure source has no entry (R2-3).

## 7. Synthesis

**AF criteria and single-lead visibility.** The 2024 ESC guideline defines AF on the surface ECG by the absence of discernible regular P waves and irregular RR intervals, and accepts a single-lead tracing of at least 30 s as diagnostic [@Van_Gelder_2024]. Two sources show that rhythm classes, AF among them, are identifiable from one lead: a deep network classifies 12 rhythm classes from single-lead ambulatory ECGs at cardiologist level [@Hannun_2019], and a public challenge on single-lead AF classification reached a class-averaged F1 of 0.83 [@clifford2017af]. The same challenge cautions that non-AF rhythms can also show irregular RR intervals [@clifford2017af]. No source read here states that Lead II is the conventional rhythm lead.

**Clustering agreement metrics.** NMI with the arithmetic-mean normalisation divides twice the mutual information by the sum of the two entropies, takes 1 for identical partitions and 0 when one partition is a single cluster [@Danon_2005]. The Fowlkes-Mallows index originates in [@Fowlkes_1983]. The manuscript already cites ARI to [@hubertarabie1985] and AMI to [@vinh2010]. The silhouette compares a cluster's tightness and separation [@rousseeuw1987]. The V-measure's source has no entry (section 9).

**ECG foundation-model benchmarks.** Recent benchmarks compare released ECG foundation models on supervised downstream tasks: eight public datasets and ten tasks in BenchECG [@Lunelli_2026], 26 tasks from 12 datasets under fine-tuning and frozen settings [@arxiv_2509_25095], and several ECG tasks against time-series baselines [@Xu_2025]. The closest benchmark adds a representation-wise evaluation and finds that some embeddings are organised by dataset rather than by clinical label [@lookingbeyond2026]. A position paper argues that current ECG representation evaluation leans on three arrhythmia-dominated benchmarks and finds that a random encoder with linear evaluation matches pretraining on many tasks [@arxiv_2602_17531]. A review names the absence of standardised evaluation as an open challenge [@Han_2026]. These sources agree that evaluation practice is inconsistent; they differ in remedy, from a standard task suite [@Lunelli_2026] to new clinical endpoints and a random-encoder baseline [@arxiv_2602_17531].

**Public ECG foundation models.** Beyond the two models of the study [@ecgfounder2024; @hubertecg2024], models with publicly available weights include ST-MEM [@arxiv_2402_09450], ECG-JEPA [@Kim_2027], MERL [@arxiv_2403_06659], ECGFM-KED [@Tian_2024], ECG-FM [@McKeen_2025], ECG-CPC [@arxiv_2509_25095] and xECG [@Lunelli_2026]. Two benchmarks restrict themselves to models with released weights and list them [@arxiv_2509_25095; @Lunelli_2026]. The models differ in training objective: ECGFounder is trained with supervision on 150 label categories [@ecgfounder2024], HuBERT-ECG with self-supervision [@hubertecg2024], ST-MEM by masked reconstruction [@arxiv_2402_09450], ECG-JEPA by latent prediction [@Kim_2027], and MERL and ECGFM-KED with ECG-text alignment [@arxiv_2403_06659; @Tian_2024].

**Multi-class ECG datasets.** Public multi-class 12-lead datasets include the Chapman-Shaoxing database with 11 rhythm classes [@Zheng_2020] and the PhysioNet/Computing in Cardiology Challenge 2020 data from four countries scored on 27 diagnoses [@Perez_Alday_2020]. PTB-XL itself is multi-label [@ptbxl2020].

## 8. Recommended sources by paper section

| Section | Key sources |
|---|---|
| Introduction | Lunelli_2026, arxiv_2509_25095, arxiv_2602_17531, Han_2026, lookingbeyond2026 |
| Literature Review (Related work) | lookingbeyond2026, Lunelli_2026, arxiv_2509_25095, Xu_2025, arxiv_2602_17531 |
| Methodology | Van_Gelder_2024, Hannun_2019, clifford2017af, Danon_2005, Fowlkes_1983, vinh2010, hubertarabie1985, rousseeuw1987, ecgfounder2024, hubertecg2024 |
| Discussion | Van_Gelder_2024, ecgfounder2024, hubertecg2024, arxiv_2402_09450, Kim_2027, arxiv_2403_06659, Tian_2024, McKeen_2025, Han_2026, Zheng_2020, Perez_Alday_2020, ptbxl2020 |

## 9. No entry written

- Rosenberg, A. and Hirschberg, J. (2007). V-Measure: A Conditional Entropy-Based External Cluster Evaluation Measure. Proceedings of EMNLP-CoNLL 2007. OpenAlex W2138615112; Semantic Scholar 5421dbcb7e14766eb3d951910ae8d7892d735a01. The paper has no DOI and no arXiv identifier, so `lookup.py bibtex` cannot produce an entry. It is not cited in the synthesis as a key.

Published versions of the `.bib` preprints (R3-14):

- ecgfounder2024: published in NEJM AI 2(7), 2025, doi 10.1056/AIoa2401033, resolved in Crossref, OpenAlex and Semantic Scholar. The patch replaces block B0006 with the entry `lookup.py bibtex` printed for that DOI, keyed ecgfounder2024. The new entry has no note, so the arXiv identifier and the weights URL of the old note are dropped; the manuscript text cites neither.
- hubertecg2024: no published version found. Crossref and OpenAlex return only the medRxiv record; Semantic Scholar was left out (HTTP 429) on the title lookup.
- lookingbeyond2026: no published version found; Crossref has no record, and OpenAlex, Semantic Scholar and arXiv return the arXiv record.
- sslclustering2025: Semantic Scholar lists the venue as the International Conference on Machine Learning, but no DOI exists for that version and Crossref has no record, so no published entry can be confirmed by a lookup; the arXiv entry stays.

## 10. Search limitations and gate failures

- Passes: three passes ran. After pass 3, conditions 1 (source count 25 against the IMRaD minimum of 20), 2 (pass 3 added 2 sources to 23, under 10 percent), 3 (every theme of the matrix has at least 3 sources) and 5 (foundational works of 1983 to 2010 and work of the last 3 years) hold. Condition 4 does not hold: chaining from the two core benchmarks found works not collected (Reyna et al. 2021, Liu et al. 2022, Wan et al. 2025), each excluded for the reason in section 3.
- Gates: search documented, source count, annotations (with the [GAP] fields named above), matrix coverage, research gaps, peer-reviewed share (19 of 25 peer-reviewed, 76 percent) and currency (14 of 25 from 2022 or later, 56 percent) hold.
- The Lead II rhythm-lead convention of R2-1b has no source. The sources that likely state it (Meek and Morris 2002; Kligfield et al. 2007) could not be read: their full texts returned HTTP 403 or had no open-access copy, and their abstracts do not state it. The draft writer can justify Lead II for the hand-crafted features by the single-lead diagnostic criterion [@Van_Gelder_2024] and the single-lead evidence [@Hannun_2019; @clifford2017af] without asserting the convention as a cited fact.
- No passage of Hubert and Arabie 1985 or Vinh et al. 2010 was read, and of Fowlkes and Mallows 1983 only the abstract; the formulas the revised 3.3 attributes to them are for the citation compliance agent to check.
- A reading of the closest benchmark that bears on R3-1: the manuscript says that lookingbeyond2026 "by its own statement" does not include "a representation-wise comparison against hand-crafted features". The passage read states that prior works lack a representation-wise evaluation ("none of these works include a representation-wise evaluation in their benchmark"); a statement about hand-crafted features was not found in the fetched text, where the word "hand-crafted" does not occur.
- Lookups that failed: the index failures of each search are in the table of section 1. Semantic Scholar was also left out (HTTP 429) on several `resolve` calls, OpenAlex (HTTP 429) on three title resolves, and arXiv (HTTP 429 or TimeoutError) on several resolves. `bibtex` failed with arXiv HTTP 429 six times for arXiv 2402.09450 and twice for 2509.25095 before each succeeded. `fetch` found no full text, only an abstract, for doi 10.1136/bmj.324.7334.415 (HTTP 403), doi 10.1161/CIR.0000000000000527 (HTTP 403), doi 10.1002/9781119266938.ch3 (HTTP 403) and doi 10.1161/CIRCULATIONAHA.106.180200 (no open-access copy). It found neither full text nor abstract for doi 10.1016/j.jacc.2007.01.024, doi 10.1111/j.1076-7460.2001.00025.x, doi 10.1111/j.1076-7460.2003.01787.x, doi 10.1007/BF01908075 and doi 10.1016/j.jelectrocard.2025.153947. For doi 10.1080/01621459.1983.10478008 (Fowlkes and Mallows) it found the abstract only.
- Non-ASCII characters in the new entries: the guideline's author list holds letters such as the Icelandic eth and Lithuanian e-dot, and several entries hold the en dash in page ranges and the multiplication sign in the MEDINFO book title. A compile that does not accept UTF-8 input for these glyphs would fail on them; the entries are kept as `lookup.py bibtex` printed them.

## 11. AI disclosure

This review was produced with AI-assisted research tools (claude-opus-5-5, through this run's literature strategist agent), used for revision assistance: the search, the screening, the annotated bibliography and the synthesis; a person oversaw the process, and the authors take responsibility for the content.

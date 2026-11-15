## Citation report

Revision run, revision item 6 (Steps 12), on the patched manuscript (`manuscript/main.tex`, `manuscript/refs.bib`). Line numbers below are those of the patched `main.tex`. Every correction falls in `refs.bib` and is carried by patch 06 (`patches/06-refs.bib.edits.json`). No correction falls in `main.tex`, so patch 05 is not written.

### Summary
| Metric | Count |
|---|---|
| Cited keys | 39 |
| Entries in the .bib | 39 |
| References verified | 39 |
| References not found or mismatched | 0 |
| Claims judged | 79 (50 VERIFIED, 3 MINOR_DISTORTION, 3 AMBIGUOUS, 1 MAJOR_DISTORTION, 22 UNVERIFIABLE_ACCESS) |
| Claims not held by their source | 23 (1 MAJOR_DISTORTION, and 22 UNVERIFIABLE_ACCESS whose source the run could not read) |
| Missing keys | 0 |
| Unused entries | 0 |
| Format errors corrected | 3 |
| Format errors flagged for review | 4 |
| Missing DOIs | 3 (vinh2010, sklearn2011, rosenberg2007vmeasure) |
| Self-citation ratio | 0 percent |
| Sources from the last 5 years | 44 percent (17 of 39, published 2022 or later) |
| References matched only by a preprint server | 0 |
| References matched by no index | 0 |
| Sentences that state a listed claim | 0 (none listed) |
| Claims not on the list, and intended claims not made | 5 and 0 |
| Passages that repeat an earlier paper | 0 (none listed) |
| Sources with a retraction or expression-of-concern notice | 0 |

Systematic format error: none. No deterministic check fails in more than half of the 39 cited entries. The largest count is 3 of 39 (missing DOI). The `\bibliographystyle{elsarticle-num}` line matches the Citation style row (Vancouver, numbered, with `elsarticle-num` kept).

Cross-check of keys: `lookup cite-keys` printed nothing (exit 0), so every cited key has an entry and every entry is cited.

Sentence names and years: every author named in a sentence is the entry's first author (He, Filice, Lunelli, Al-Masud, Xu, Berger), each of these entries has 3 or more authors for its "et al.", and no sentence states a year. No correction is needed in `main.tex`.

### Lookups
Every DOI lookup is `lookup resolve '<doi>'`; every arXiv lookup is `lookup resolve '<arXiv ID>'`; title lookups are written out.

| Key | Command | Line used | Indexes that matched | Fields confirmed | Verdict |
|---|---|---|---|---|---|
| sslclustering2025 | resolve '2501.18452' | arXiv, ratio 1.00 | OpenAlex, Semantic Scholar, arXiv | authors, year, title, arXiv ID | VERIFIED |
| lookingbeyond2026 | resolve '2601.21830' | arXiv, ratio 1.00 | OpenAlex, Semantic Scholar, arXiv | authors, year, title, arXiv ID | VERIFIED |
| hrvstandards1996 | resolve '10.1161/01.CIR.93.5.1043' | OpenAlex, ratio 0.38 against the short Crossref title | Crossref, OpenAlex, Semantic Scholar | corporate author, year, full title (OpenAlex), venue, DOI | VERIFIED |
| dechazal2004 | resolve '10.1109/TBME.2004.827359' | OpenAlex, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| wavelettensorecg2018 | resolve '10.1016/j.knosys.2018.09.001' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | year, title, venue, DOI; author given names differ (C1) | VERIFIED |
| clocs2021 | resolve '2005.13249' | arXiv, ratio 1.00 | OpenAlex, Semantic Scholar (ICML), arXiv | authors, title, venue, arXiv ID | VERIFIED |
| threekg2021 | resolve '2106.04452'; resolve '3KG: Contrastive Learning of 12-Lead Electrocardiograms using Physiologically-Inspired Augmentations' --year 2021 | Semantic Scholar, ratio 1.00 | OpenAlex, Semantic Scholar (ML4H@NeurIPS), arXiv | authors, year, title, venue, arXiv ID | VERIFIED |
| mehari2022ssl | resolve '10.1016/j.compbiomed.2021.105114' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| hubertecg2024 | resolve '10.1101/2024.11.14.24317328' | Semantic Scholar, ratio 0.98 | Crossref, OpenAlex, Semantic Scholar | authors, year, title (as in the posted version), venue, DOI | VERIFIED |
| ecgfounder2024 | resolve '10.1056/AIoa2401033' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| hubertarabie1985 | resolve '10.1007/BF01908075' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| vinh2010 | resolve 'Information theoretic measures for clusterings comparison: variants, properties, normalization and correction for chance' --year 2010; resolve '10.5555/1756006.1953024' | OpenAlex, ratio 1.00 (Nguy<latin small letter e with circumflex and tilde>n Xu<latin small letter a with circumflex>n Vinh, Julien Epps, James Bailey, 2010) | OpenAlex, Semantic Scholar | authors, year, title, venue | VERIFIED |
| rousseeuw1987 | resolve '10.1016/0377-0427(87)90125-7' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | author, year, title, venue, DOI | VERIFIED |
| Lunelli_2026 | resolve '10.1038/s41746-026-03196-y' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| arxiv_2509_25095 | resolve '2509.25095' | arXiv, ratio 1.00 | OpenAlex, arXiv (Semantic Scholar left out, HTTP 429 after 3 retries) | authors, year, title, arXiv ID | VERIFIED |
| Xu_2025 | resolve '10.3233/SHTI251036' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, series, DOI | VERIFIED |
| arxiv_2602_17531 | resolve '2602.17531' | arXiv, ratio 1.00 | OpenAlex, Semantic Scholar, arXiv | authors, year, title, arXiv ID | VERIFIED |
| Han_2026 | resolve '10.1038/s41746-026-03101-7' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| ptbxl2020 | resolve '10.1038/s41597-020-0495-6' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Van_Gelder_2024 | resolve '10.1093/eurheartj/ehae176' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| mitbih2001 | resolve '10.1109/51.932724' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| physionet2000 | resolve '10.1161/01.CIR.101.23.e215' | OpenAlex, ratio 0.52 against the short Crossref title | Crossref, OpenAlex (Semantic Scholar not found) | authors, year, full title (OpenAlex), venue, DOI | VERIFIED |
| neurokit2021 | resolve '10.3758/s13428-020-01516-y' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| arxiv_2410_04133 | resolve '2410.04133' | arXiv, ratio 0.75 | Semantic Scholar, arXiv (OpenAlex gives the NEJM AI record, see C19) | authors, year, title, arXiv ID | VERIFIED |
| clifford2017af | resolve '10.22489/CinC.2017.065-469' | Semantic Scholar, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Hannun_2019 | resolve '10.1038/s41591-018-0268-3' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| sklearn2011 | resolve 'Scikit-learn: Machine learning in Python'; resolve '10.5555/1953048.2078195' | Semantic Scholar, ratio 1.00 (2011, Journal of machine learning research) | OpenAlex, Semantic Scholar, arXiv (preprint 1201.0490) | authors, year, title, venue | VERIFIED |
| hdbscan2013 | resolve '10.1007/978-3-642-37456-2_14' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (PAKDD) | authors, year, title, book, DOI | VERIFIED |
| Danon_2005 | resolve '10.1088/1742-5468/2005/09/P09008' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| rosenberg2007vmeasure | resolve 'V-Measure: a conditional entropy-based external cluster evaluation measure' --year 2007 | Semantic Scholar, ratio 1.00 (A. Rosenberg, Julia Hirschberg, 2007, EMNLP) | Semantic Scholar (OpenAlex left out, HTTP 429 after 3 retries, on both calls) | authors, year, title, venue | VERIFIED |
| Fowlkes_1983 | resolve '10.1080/01621459.1983.10478008' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| fedavg2017 | resolve '1602.05629'; resolve 'Communication-efficient learning of deep networks from decentralized data' --year 2017 | Semantic Scholar, ratio 1.00 (AISTATS) | OpenAlex, Semantic Scholar, arXiv | authors (first author's initial, C2), title, venue, arXiv ID | VERIFIED |
| arxiv_2402_09450 | resolve '2402.09450' | arXiv, ratio 1.00 | OpenAlex, arXiv (Semantic Scholar left out, HTTP 429 after 3 retries) | authors, year, title, arXiv ID | VERIFIED |
| Kim_2027 | resolve '10.1016/j.neunet.2026.109334' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | author, year (Crossref 2027), title, venue, DOI | VERIFIED |
| arxiv_2403_06659 | resolve '2403.06659' | arXiv, ratio 1.00 | OpenAlex, Semantic Scholar, arXiv | authors, year, title, arXiv ID | VERIFIED |
| Tian_2024 | resolve '10.1016/j.xcrm.2024.101875' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| McKeen_2025 | resolve '10.1093/jamiaopen/ooaf122' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Zheng_2020 | resolve '10.1038/s41597-020-0386-x' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Perez_Alday_2020 | resolve '10.1088/1361-6579/abc960' | Crossref, ratio 1.00 | Crossref, OpenAlex (Semantic Scholar not found) | authors, year, title, venue, DOI | VERIFIED |

Retractions: no DOI lookup above printed a "Crossref notice" line. The retraction check covers the notices Crossref lists, and Crossref's own record of a source can lack a notice that a publisher has issued. The arXiv entries and the three entries without a DOI have no Crossref record to carry a notice.

Predatory-venue screen: the record signs clear every venue except one. Neural Networks (Kim_2027) carries one sign, a publication date in the future: Crossref gives 2027 (volume 205), while this run is dated 2026-11-15 and OpenAlex and Semantic Scholar give 2026 (C25). Not screened: Neural Networks, with that sign. The signs that only the venue's pages and registries show were not checked for any venue, since `the lookup script` cannot read them. Preprints and proceedings (arXiv, medRxiv, AISTATS, ICML, ML4H, EMNLP, PAKDD) are sources of an admitted kind under the `cs_ml` profile.

Currency: 12 cited sources are older than 10 years (Fowlkes_1983, hubertarabie1985, rousseeuw1987, hrvstandards1996, physionet2000, mitbih2001, dechazal2004, Danon_2005, rosenberg2007vmeasure, vinh2010, sklearn2011, hdbscan2013). Each is the original definition of a metric or method, the standard database description, the measurement standard or the software reference that the text uses, so none is flagged.

Self-citation: no cited entry has Dongho Chun or Axel Faes as an author.

### DOI and URL lines of check-urls

- hrvstandards1996 (403, ratio 0.38, DOI_MISMATCH) and physionet2000 (403, ratio 0.52, DOI_MISMATCH): Crossref stores only the short title ("Heart Rate Variability"; "PhysioBank, PhysioToolkit, and PhysioNet"). The OpenAlex record of the same DOI carries the full title, authors, year and venue of the entry, so the DOI is right and no correction is made. The 403 is the publisher page refusing the request.
- hdbscan2013 (404 at `https://doi.org/10.1007/978-3-642-37456-2%5C_14`): the `doi` field holds `\_`, an escaped underscore. The bare DOI `10.1007/978-3-642-37456-2_14` resolves in Crossref, OpenAlex and Semantic Scholar with the entry's title, authors and year. Corrected by patch (C3).
- Perez_Alday_2020 (failed, InvalidURL): the DOI resolves in Crossref and OpenAlex with the entry's title, authors and year. The failure is in the redirect target, the same failure the IOP publisher URL of Danon_2005 gave during the fetch. The identifier is right, and no correction is made.
- vinh2010, sklearn2011, rosenberg2007vmeasure (no identifier): flagged (C26), not blocking.
- The 403 lines of hubertecg2024, ecgfounder2024, Van_Gelder_2024, Fowlkes_1983 and McKeen_2025 have a ratio of 0.98 or 1.00, so the DOI is right and the publisher page refused the request.

### Claims
Line numbers are those of the patched `main.tex`; a claim that cites several keys has one row per key unless the keys hold it together.

| # | Claim | Source | Section | Verdict | Detail |
|---|---|---|---|---|---|
| 1 | Separability and clusterability are distinct; a representation may place the discriminative direction off its dominant axes; the distinction is established in the SSL literature (line 56) | sslclustering2025 | Introduction | MINOR_DISTORTION | Distinction supported (section 3 passage); the dominant-axes mechanism is not in the source; one paper stated as a literature (C20) |
| 2 | Filice et al. benchmark ECG FMs on four 12-lead datasets incl. PTB-XL; representation-wise evaluation includes the ARI of GMM clusters; they state earlier benchmarks lack it; no hand-crafted features, no MIT-BIH (line 60) | lookingbeyond2026 | Introduction | VERIFIED | Section 3.1 dataset list; ARI and GMM passages; related-work passage; "hand-crafted", "handcrafted" and "MIT-BIH" occur 0 times in the text (`grep -c`) |
| 3 | Hand-crafted RR and morphology features encode arrhythmia signatures and underpin decades of analysis (line 73) | hrvstandards1996 | Related work | UNVERIFIABLE_ACCESS | No text and no abstract (C5) |
| 4 | Same sentence (line 73) | dechazal2004 | Related work | UNVERIFIABLE_ACCESS | Abstract only, HTTP 403 (C6) |
| 5 | He et al. combined wavelet tensor decomposition with spectral clustering for unsupervised 12-lead classification (line 73) | wavelettensorecg2018 | Related work | UNVERIFIABLE_ACCESS | Abstract only, no open copy (C7) |
| 6 | CLOCS is a contrastive method with patient-level invariance (line 73) | clocs2021 | Related work | VERIFIED | Abstract and contributions of the full text |
| 7 | 3KG is a contrastive method with physiologically motivated augmentations and patient and lead views (line 73) | threekg2021 | Related work | VERIFIED | Abstract of the full text; sections 3.2.2 and 3.2.3 |
| 8 | Contrastive predictive coding for 12-lead ECG (line 73) | mehari2022ssl | Related work | VERIFIED | Abstract of the full text (arXiv version; same claim in the journal version) |
| 9 | These methods established the pretraining recipes that later foundation models scaled up (line 73) | clocs2021, threekg2021, mehari2022ssl | Related work | AMBIGUOUS | The three papers predate the foundation models and do not state it; two later model papers hold a narrower form (C21) |
| 10 | HuBERT-ECG learns from millions of recordings and is evaluated as a frozen extractor (line 73) | hubertecg2024 | Related work | VERIFIED | 9.1 million ECGs; linear evaluation atop a frozen backbone |
| 11 | ECGFounder learns from millions of recordings and is evaluated as a frozen extractor (line 73) | ecgfounder2024 | Related work | UNVERIFIABLE_ACCESS | NEJM AI full text not retrievable, abstract only (C8, C19) |
| 12 | The ARI is near zero for trivial solutions and is an appropriate headline metric (lines 77 to 79) | hubertarabie1985 | Related work | UNVERIFIABLE_ACCESS | No text and no abstract (C9) |
| 13 | The AMI is near zero for trivial solutions (lines 77 to 79) | vinh2010 | Related work | UNVERIFIABLE_ACCESS | Abstract only, no open copy (C10) |
| 14 | The silhouette measures compactness and can be maximised by degenerate solutions (lines 79 to 81) | rousseeuw1987 | Related work | UNVERIFIABLE_ACCESS | Abstract only, HTTP 403 (C11) |
| 15 | BenchECG evaluates public models on eight datasets with 1,674,704 recordings (line 83) | Lunelli_2026 | Related work | VERIFIED | Abstract of the full text |
| 16 | Al-Masud et al. compare eight FMs on 26 tasks from 12 datasets, fine-tuned and frozen (line 83) | arxiv_2509_25095 | Related work | VERIFIED | Abstract of the full text |
| 17 | Xu et al. compare language, general time-series and ECG FMs with time-series deep-learning models (line 83) | Xu_2025 | Related work | VERIFIED | Introduction of the arXiv version; the MEDINFO version's abstract states the same comparison |
| 18 | A randomly initialised encoder with linear evaluation matches pretrained encoders on many tasks (line 83) | arxiv_2602_17531 | Related work | VERIFIED | Abstract of the full text |
| 19 | A review names the absence of standardised evaluation frameworks as a challenge (line 83) | Han_2026 | Related work | VERIFIED | Section "Evaluation" |
| 20 | None of BenchECG, Al-Masud et al. and Berger et al. evaluates clustering of the embeddings or includes a hand-crafted baseline (line 83) | Lunelli_2026, arxiv_2509_25095, arxiv_2602_17531 | Related work | VERIFIED | Each evaluates supervised transfer (passages); "hand-crafted" and "handcrafted" occur 0 times in each text; "cluster" occurs 0 times in Lunelli_2026, once in a reference title in arxiv_2509_25095 and twice as a verb about result spread in arxiv_2602_17531 (`grep -c`, `grep -n`) |
| 21 | Filice et al. evaluate ECG-FM, ECGFounder, HuBERT-ECG in three sizes and ECG-JEPA as frozen extractors on four 12-lead datasets; class-balanced 15-fold probes; ARI of GMM clusters; ECGFounder and ECG-FM organised more by label, HuBERT-ECG and ECG-JEPA more by dataset (line 85) | lookingbeyond2026 | Related work | VERIFIED | Sections 3.1, 3.3, 4; the ECG-JEPA of this benchmark is another model than the one cited at line 335 (C24) |
| 22 | PTB-XL has 21,799 records from 18,869 patients (line 91) | ptbxl2020 | Methods | MAJOR_DISTORTION | The source gives 21837 records from 18885 patients (abstract and Background of the full text, Table 1) (C4) |
| 23 | 16-bit WFDB samples at 1 microvolt per LSB, released at 500 Hz and at 100 Hz (line 91) | ptbxl2020 | Methods | VERIFIED | Methods, Preprocessing; Data Records, Waveform Data |
| 24 | AF is recognised on the ECG by irregular RR intervals and absent discernible repeating P waves (line 93) | Van_Gelder_2024 | Methods | VERIFIED | Section 3.1 |
| 25 | MIT-BIH has two-lead records sampled at 360 Hz (line 95) | mitbih2001 | Methods | UNVERIFIABLE_ACCESS | Abstract only, no open copy (C12) |
| 26 | Same sentence (line 95) | physionet2000 | Methods | UNVERIFIABLE_ACCESS | Abstract only, no open copy (C13) |
| 27 | Cleaning, R-peak detection and delineation with the discrete wavelet method of NeuroKit2 (line 103) | neurokit2021 | Methods | AMBIGUOUS | The paper names the cleaning, peak and delineation functions and a method argument, and does not name a wavelet method (C22) |
| 28 | The RR features (mean RR, SDNN, RMSSD, pNN50) (line 103) | hrvstandards1996 | Methods | UNVERIFIABLE_ACCESS | No text and no abstract (C5) |
| 29 | The morphology features (line 103) | dechazal2004 | Methods | UNVERIFIABLE_ACCESS | Abstract only, HTTP 403 (C6) |
| 30 | HuBERT-ECG is a self-supervised transformer (line 104) | hubertecg2024 | Methods | VERIFIED | Abstract and Table 1 of the full text |
| 31 | ECGFounder is a convolutional network pretrained with supervision on diagnostic labels, with a 500 Hz input of 5000 samples per lead (line 105) | arxiv_2410_04133 | Methods | VERIFIED | Figure 1; sections 2.1 and 2.2 |
| 32 | Same sentence (line 105) | ecgfounder2024 | Methods | UNVERIFIABLE_ACCESS | NEJM AI full text not retrievable (C8, C19) |
| 33 | The guideline accepts as diagnostic a single-lead tracing of at least 30 s that shows the signs (line 109) | Van_Gelder_2024 | Methods | VERIFIED | Section 3.2 recommendation |
| 34 | AF and other rhythm classes have been classified from single-lead recordings (line 109) | clifford2017af | Methods | VERIFIED | Introduction |
| 35 | Same sentence (line 109) | Hannun_2019 | Methods | UNVERIFIABLE_ACCESS | Abstract only; the open copy is an HTML page that fetch does not accept (C14) |
| 36 | The closest benchmark reports ECGFounder's embedding as organised by label and HuBERT-ECG's by dataset (line 111) | lookingbeyond2026 | Methods | VERIFIED | Section 4 |
| 37 | The 21 beat features, RR-context and morphology values (line 113) | dechazal2004 | Methods | UNVERIFIABLE_ACCESS | Abstract only, HTTP 403 (C6) |
| 38 | HuBERT-ECG: transformer, 93 million parameters (base), self-supervised on 9.1 million 12-lead ECGs (Table repr, line 129) | hubertecg2024 | Methods | VERIFIED | Figure 2 caption; abstract |
| 39 | ECGFounder: 76.3 million parameters, supervised on 10,771,552 ECGs with 150 label categories (Table repr, line 130) | arxiv_2410_04133 | Methods | VERIFIED | Figure 1; Table S11 |
| 40 | The five clusterers are those of scikit-learn (line 142) | sklearn2011 | Methods | VERIFIED | Abstract (software reference; arXiv version of the JMLR paper) |
| 41 | HDBSCAN (line 142) | hdbscan2013 | Methods | UNVERIFIABLE_ACCESS | No text and no abstract (C15) |
| 42 | ARI meaning, formula, range and values (line 144, Table metrics) | hubertarabie1985 | Methods | UNVERIFIABLE_ACCESS | No text and no abstract (C9) |
| 43 | AMI meaning, formula, range and values (line 144, Table metrics) | vinh2010 | Methods | UNVERIFIABLE_ACCESS | Abstract only (C10) |
| 44 | NMI with the arithmetic-mean normalisation, range [0, 1], 0 for one cluster (line 144, Table metrics) | Danon_2005 | Methods | VERIFIED | Section 2 (arXiv version of the journal paper) |
| 45 | V-measure formula and range (line 144, Table metrics) | rosenberg2007vmeasure | Methods | UNVERIFIABLE_ACCESS | No identifier; fetch needs a DOI or an arXiv ID (C16) |
| 46 | FMI as the geometric mean of pairwise precision and recall (line 144, Table metrics) | Fowlkes_1983 | Methods | UNVERIFIABLE_ACCESS | Abstract only, no open copy (C17) |
| 47 | Silhouette formula and range (line 144, Table metrics) | rousseeuw1987 | Methods | UNVERIFIABLE_ACCESS | Abstract only, HTTP 403 (C11) |
| 48 | Unlisted settings are the scikit-learn defaults (Table settings caption, line 179) | sklearn2011 | Methods | VERIFIED | Abstract (software reference) |
| 49 | NeuroKit2 cleaning, R-peak detection and discrete wavelet delineation at their defaults (Table settings, line 191) | neurokit2021 | Methods | AMBIGUOUS | As claim 27 (C22) |
| 50 | Centroid aggregation in the manner of federated averaging (line 206) | fedavg2017 | Methods | VERIFIED | Section 2 |
| 51 | Some ECG foundation embeddings are organised by clinical label and others by dataset (line 240) | lookingbeyond2026 | Results | VERIFIED | Section 4 and Conclusion |
| 52 | The label information does not lie along the dominant axes, the separability-versus-clusterability effect of earlier work (line 244) | sslclustering2025 | Results | MINOR_DISTORTION | As claim 1 (C20) |
| 53 | ECGFounder was pretrained with supervision on 150 label categories that include rhythm descriptions (line 246) | arxiv_2410_04133 | Results | VERIFIED | Abstract; Table S4 |
| 54 | Filice et al. report ECGFounder's embedding as aligned with the clinical label (line 246) | lookingbeyond2026 | Results | VERIFIED | Section 4 and Conclusion |
| 55 | The AF criteria are irregular RR intervals and absent P waves (line 246) | Van_Gelder_2024 | Results | VERIFIED | Section 3.1 |
| 56 | HuBERT-ECG was pretrained by self-supervision without diagnostic labels (line 248) | hubertecg2024 | Results | VERIFIED | Methods, data |
| 57 | HuBERT-ECG's embedding is reported as organised by dataset (line 248) | lookingbeyond2026 | Results | VERIFIED | Section 4 |
| 58 | The separability-versus-clusterability effect is known (line 335) | sslclustering2025 | Discussion | VERIFIED | Section 3 passage |
| 59 | The federated procedure is standard (line 335) | fedavg2017 | Discussion | MINOR_DISTORTION | The source defines federated averaging of model weights; the clustering use is the study's adaptation (C23) |
| 60 | Recent benchmarks evaluate FMs on supervised downstream tasks (line 335) | Lunelli_2026, arxiv_2509_25095, Xu_2025 | Discussion | VERIFIED | As claims 15 to 17 |
| 61 | Filice et al. compare FM embeddings with one another (line 335) | lookingbeyond2026 | Discussion | VERIFIED | Section 3 |
| 62 | ST-MEM is an ECG foundation model (line 335) | arxiv_2402_09450 | Discussion | VERIFIED | Abstract; public weights stated by claim 68 |
| 63 | ECG-JEPA is an ECG foundation model (line 335) | Kim_2027 | Discussion | VERIFIED | Introduction (arXiv version of the journal paper); see C24 |
| 64 | MERL is an ECG foundation model with released models (line 335) | arxiv_2403_06659 | Discussion | VERIFIED | Abstract and Introduction |
| 65 | ECGFM-KED is an ECG foundation model (line 335) | Tian_2024 | Discussion | UNVERIFIABLE_ACCESS | Abstract only; the open copy is an HTML page (C18) |
| 66 | ECG-FM is an open ECG foundation model with released weights (line 335) | McKeen_2025 | Discussion | VERIFIED | Abstract (arXiv version 2408.05178 of the journal paper) |
| 67 | ECG-CPC is a public-weights model (line 335) | Lunelli_2026 | Discussion | VERIFIED | Results |
| 68 | Recent benchmarks evaluate these models with their public weights (line 335) | arxiv_2509_25095, Lunelli_2026 | Discussion | VERIFIED | Section 3.1 of Al-Masud et al.; Results of Lunelli et al. |
| 69 | Their training objectives range from masked reconstruction and joint-embedding prediction to signal-report contrastive alignment (line 335) | arxiv_2509_25095 | Discussion | VERIFIED | Section 3.1 |
| 70 | The hand-crafted features were compared with a model reported to cluster by label (line 335) | lookingbeyond2026 | Discussion | VERIFIED | Section 4 |
| 71 | HuBERT-ECG was pretrained on 5 s inputs band-pass filtered to 0.05 to 47 Hz and rescaled to [-1, 1] (line 339) | hubertecg2024 | Limitations | VERIFIED | Methods, data and pre-processing |
| 72 | ECGFounder was pretrained on filtered inputs z-scored per segment (line 339) | arxiv_2410_04133 | Limitations | VERIFIED | Section 2.1 |
| 73 | Other public models include some reported to cluster well (line 339) | lookingbeyond2026 | Limitations | VERIFIED | Section 4 (ECG-FM) |
| 74 | Public 12-lead databases label rhythms other than SR and AF (line 341) | Zheng_2020 | Limitations | VERIFIED | Abstract of the full text |
| 75 | Same sentence (line 341) | Perez_Alday_2020 | Limitations | VERIFIED | Scored diagnoses (medRxiv version of the journal paper) |
| 76 | Same sentence (line 341) | ptbxl2020 | Limitations | VERIFIED | Data Records, ECG statements |
| 77 | Non-AF rhythms can show irregular RR intervals (line 341) | clifford2017af | Limitations | VERIFIED | Introduction |
| 78 | PTB-XL is public on PhysioNet (line 348) | ptbxl2020 | Code and data availability | VERIFIED | Data Records; reference 5 |
| 79 | The MIT-BIH Arrhythmia Database is public on PhysioNet (line 348) | mitbih2001 | Code and data availability | UNVERIFIABLE_ACCESS | Abstract only (C12) |

Sub-claims of the judged claims that are not supported are listed in the issues. The version a claim was read in is named in the Detail column wherever it differs from the version the entry names; for claims 8, 17, 40, 44, 63, 66 and 75 the claim is the same in both versions, which is no issue.

Claims in clinical papers: the cited sentences on AF (claims 24, 33, 34, 55, 77) were read against the clinical rows. Reference existence: every source resolves. Claim anchor: each has a passage. Population match: the text states the guideline's 30 s single-lead criterion as the guideline gives it and does not claim that the study's 10 s single-lead strips meet it. Outcome match: no endpoint or metric is taken from these sources. Strength of conclusion: the text keeps the sources' statements as definitions and draws no clinical recommendation. Clinical boundary: the text frames its output as a benchmark of representations for research, with no diagnosis, treatment or triage instruction. No row fails.

This is research, evidence synthesis, or documentation support only. It is not patient-specific diagnosis, treatment, triage, or clinical decision support.

### Corrections made
| # | Location | Error | Correction |
|---|---|---|---|
| C1 | refs.bib, wavelettensorecg2018 (block B0013) | SERIOUS author error: the entry gives "He, Houshou and Tan, Yujie and Xing, Jun"; Crossref and Semantic Scholar give Hong He, Yonghong Tan, Jianfeng Xing, and OpenAlex Hong S. He, Yonghong Tan, Jianfeng Xing, with the entry's title, year, venue and DOI | Author field set to "He, Hong and Tan, Yonghong and Xing, Jianfeng", from the Crossref record (rule: a difference with one right answer in the record). The sentence "He et al." stays right. Patch 06, op OP001 |
| C2 | refs.bib, fedavg2017 (block B0018) | MINOR name error: the first author is given as "McMahan, Brendan"; OpenAlex and arXiv give H. Brendan McMahan, Semantic Scholar H. B. McMahan | First author set to "McMahan, H. Brendan". Patch 06, op OP002 |
| C3 | refs.bib, hdbscan2013 (block B0022) | The `doi` field holds an escaped underscore, `10.1007/978-3-642-37456-2\_14`, which makes the DOI link fail (404) | `doi` set to the bare DOI `10.1007/978-3-642-37456-2_14`, the identifier Crossref, OpenAlex and Semantic Scholar resolve (rule: a doi field reduced to the bare DOI). Patch 06, op OP003 |

### Items flagged for review
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C4 | main.tex line 91, Methods, "Data and cohorts" | Critical, MAJOR_DISTORTION, case "a claim the source does not hold". The sentence gives PTB-XL as "21,799 records, 18,869 patients" and cites the data descriptor, which gives 21837 records from 18885 patients (passage lines). The numbers of the sentence are not in the cited source; they may be those of release 1.0.3, which the study used, and no text of that release was read in this run. The sentence stood in the first submission and was kept by this revision. | Needs the user. Either give the source's figures, "a public 12-lead database (21,837 records from 18,885 patients, 10 s strips)", or keep 21,799 and 18,869 and cite a record of release 1.0.3 that states them. The session raises the stop "A claim the run cannot support". |
| C5 | hrvstandards1996, cited at lines 73 and 103 (claims 3, 28) | UNVERIFIABLE_ACCESS: no full text and no abstract. URLs tried: OpenAlex and Semantic Scholar list no open-access URL (`lookup fetch '10.1161/01.CIR.93.5.1043'`). | Needs the user: supply the text, or the session raises the stop "A claim the run cannot support" for claims 3 and 28. |
| C6 | dechazal2004, cited at lines 73, 103 and 113 (claims 4, 29, 37) | UNVERIFIABLE_ACCESS: abstract only. URL tried: `http://hdl.handle.net/2262/17623`, HTTP 403 (from OpenAlex and Semantic Scholar). Claim 37 also attributes to the source a specific list of 21 beat features (ratio of RR intervals, energy, skewness, kurtosis), which cannot be checked without the text. | Needs the user: supply the text, or the stop "A claim the run cannot support" for claims 4, 29 and 37. |
| C7 | wavelettensorecg2018, cited at line 73 (claim 5) | UNVERIFIABLE_ACCESS: abstract only. URLs tried: none, since OpenAlex and Semantic Scholar list no open-access URL. | Needs the user: supply the text, or the stop for claim 5. |
| C8 | ecgfounder2024 (NEJM AI version), cited at lines 73 and 105 (claims 11, 32) | UNVERIFIABLE_ACCESS: abstract only. URL tried: `https://pmc.ncbi.nlm.nih.gov/articles/PMC12327759/`, HTTP 200 but not a PDF (from OpenAlex and Semantic Scholar), which fetch does not count as full text. The arXiv version (arxiv_2410_04133) holds both claims (claims 31, 53 and the passage lines). | Needs the user. Cite arxiv_2410_04133 at line 73 beside ecgfounder2024, or supply the NEJM AI text; otherwise the stop for claims 11 and 32. See C19. |
| C9 | hubertarabie1985, cited at lines 77, 144 and Table metrics (claims 12, 42) | UNVERIFIABLE_ACCESS: no full text and no abstract. OpenAlex and Semantic Scholar list no open-access URL. | Needs the user: supply the text, or the stop for claims 12 and 42. The ARI formula of the table cannot be checked against its source in this run. |
| C10 | vinh2010, cited at lines 78, 144 and Table metrics (claims 13, 43) | UNVERIFIABLE_ACCESS: abstract only. `lookup fetch '10.5555/1756006.1953024'`: OpenAlex and Semantic Scholar list no open-access URL. | Needs the user: supply the text, or the stop for claims 13 and 43. |
| C11 | rousseeuw1987, cited at lines 80, 144 and Table metrics (claims 14, 47) | UNVERIFIABLE_ACCESS: abstract only. URL tried: `https://www.sciencedirect.com/science/article/pii/0377042787901257/pdf`, HTTP 403. Claim 14 also states that the silhouette "can be maximised by degenerate solutions", which needs the text. | Needs the user: supply the text, or the stop for claims 14 and 47. |
| C12 | mitbih2001, cited at lines 95 and 348 (claims 25, 79) | UNVERIFIABLE_ACCESS: abstract only. OpenAlex and Semantic Scholar list no open-access URL. | Needs the user: supply the text, or the stop for claims 25 and 79. |
| C13 | physionet2000, cited at line 95 (claim 26) | UNVERIFIABLE_ACCESS: abstract only. OpenAlex lists no open-access URL; Semantic Scholar has no record of the DOI. | Needs the user: supply the text, or the stop for claim 26. |
| C14 | Hannun_2019, cited at line 109 (claim 35) | UNVERIFIABLE_ACCESS: abstract only. URL tried: `https://www.ncbi.nlm.nih.gov/pmc/articles/6784839`, HTTP 200 but not a PDF. The sentence's claim is held by clifford2017af (claim 34), so it stands on that source. | Needs the user: supply the text, or drop Hannun_2019 from the sentence, which clifford2017af supports alone; otherwise the stop for claim 35. |
| C15 | hdbscan2013, cited at line 142 (claim 41) | UNVERIFIABLE_ACCESS: no full text and no abstract. OpenAlex and Semantic Scholar list no open-access URL. | Needs the user: supply the text, or the stop for claim 41. |
| C16 | rosenberg2007vmeasure, cited at line 144 and Table metrics (claim 45) | UNVERIFIABLE_ACCESS: the entry and the Semantic Scholar record have no DOI and no arXiv ID, and `lookup fetch` needs one of the two, so no URL could be tried. | Needs the user: supply the text, or the stop for claim 45. |
| C17 | Fowlkes_1983, cited at line 144 and Table metrics (claim 46) | UNVERIFIABLE_ACCESS: abstract only. OpenAlex and Semantic Scholar list no open-access URL. The formula $R/\sqrt{PQ}$ cannot be checked against the source in this run. | Needs the user: supply the text, or the stop for claim 46. |
| C18 | Tian_2024, cited at line 335 (claim 65) | UNVERIFIABLE_ACCESS: abstract only. URL tried: `https://doi.org/10.1016/j.xcrm.2024.101875`, HTTP 200 but not a PDF. Al-Masud et al. name ECGFM-KED and its source and include only models with public weights (passage lines of arxiv_2509_25095). | Needs the user: supply the text, or the stop for claim 65. |
| C19 | ecgfounder2024 and arxiv_2410_04133, lines 73, 105, 130, 246, 339 | MEDIUM, versions of one work. The two entries are the NEJM AI paper and the arXiv preprint of ECGFounder; OpenAlex returns one record (W4411672394) for both identifiers, while their DOIs and Semantic Scholar records differ. Line 105 cites both versions for a claim read only in the preprint, and line 73 cites only the NEJM AI version for a claim read only in the preprint. Merging the keys would attach claims read in the preprint (76.3 million parameters, the filtering) to the version that was not read, so no patch is written. | Needs the user. Either cite the preprint wherever the claim was read in it (lines 73 and 105), or supply the NEJM AI text and read the claims there. |
| C20 | main.tex lines 56 and 244 (claims 1, 52) | MINOR_DISTORTION, drift. The source shows that representations with nearly the same linear-probe accuracy differ in their clustering metrics. It does not state the mechanism that the discriminative direction lies off the dominant axes, and the sentence at line 56 turns one paper into "the self-supervised learning literature". | Suggested wording for line 56: "Linear separability and clusterability are distinct properties: in self-supervised image models, representations with nearly the same linear-probe accuracy can differ in clustering quality \cite{sslclustering2025}." At line 244: "In the weaker embeddings the label information is present but does not lie along the dominant axes of variation, consistent with the gap between linear-probe accuracy and clustering quality reported for self-supervised models \cite{sslclustering2025}." No patch. |
| C21 | main.tex line 73 (claim 9) | AMBIGUOUS, drift. The clause "they established the pretraining recipes that later foundation models scaled up" is not stated by CLOCS, 3KG or Mehari and Strodthoff, which predate the foundation models. Two later model papers hold a narrower form: ECG-FM adopts the multi-segment contrastive objective of CLOCS (McKeen_2025), and ECG-CPC is pretrained with contrastive predictive coding following Mehari and Strodthoff (arxiv_2509_25095). | Suggested wording: "Later foundation models reuse some of these objectives: ECG-FM adopts the multi-segment contrastive objective of CLOCS \cite{McKeen_2025}, and ECG-CPC is pretrained with contrastive predictive coding \cite{arxiv_2509_25095}." No patch. |
| C22 | main.tex line 103 and Table settings line 191 (claims 27, 49) | AMBIGUOUS, drift. NeuroKit2's paper names its cleaning, peak-detection and delineation functions and a method argument that selects the procedure, and it does not name a discrete wavelet method. The table also says "at their defaults", which the paper does not state. | Suggested wording for line 103: "The signal is cleaned, R peaks are detected and the waves are delineated with NeuroKit2 \cite{neurokit2021}, using its discrete wavelet delineation." In the table, state the delineation method as the study's setting and drop "at their defaults" unless the version's documentation is cited. No patch. |
| C23 | main.tex line 335 (claim 59) | MINOR_DISTORTION, drift. The source defines federated averaging of model weights weighted by client data size. That a federated k-means procedure is standard is not in it. | Suggested wording: "the centroid averaging follows federated averaging \cite{fedavg2017}". No patch. |
| C24 | main.tex lines 85 and 335 | MEDIUM, one name for two models. The ECG-JEPA of Filice et al. (line 85) is the model of Weimann and Conrad, whose weights the authors provided on request (passage lines of lookingbeyond2026). The ECG-JEPA cited at line 335 (Kim_2027) is another model, the one Al-Masud et al. and BenchECG evaluate. A reader takes them as one model. | Suggested wording for line 85: "...HuBERT-ECG in three sizes and the ECG-JEPA of Weimann and Conrad as frozen feature extractors...". No patch. |
| C25 | refs.bib, Kim_2027; venue Neural Networks | MEDIUM, predatory-venue screen sign "a publication date in the future": Crossref dates the article 2027 (volume 205), OpenAlex and Semantic Scholar 2026, and the run is dated 2026-11-15. The sign most likely reflects an issue dated ahead of its online publication. Not screened: Neural Networks. | Check the venue in the Scopus Source List or DOAJ and decide the year; the entry's 2027 agrees with Crossref. No patch, since the records disagree. |
| C26 | refs.bib, vinh2010, sklearn2011, rosenberg2007vmeasure | MINOR, no identifier (check-urls "no identifier"). OpenAlex and Semantic Scholar give `10.5555/1756006.1953024` (vinh2010) and `10.5555/1953048.2078195` (sklearn2011), identifiers with the prefix 10.5555. Crossref has no record of either (`lookup resolve` on each), and whether they resolve at doi.org was not checked, so neither is added. rosenberg2007vmeasure has no DOI in any record. | Mark the three "DOI not available", or add the two 10.5555 identifiers if the venue asks for them and they resolve. The run is not blocked. |
| C27 | refs.bib, Lunelli_2026, Han_2026 (volume, pages: article in press), McKeen_2025, Zheng_2020, ecgfounder2024 (article number or pages), Xu_2025, rosenberg2007vmeasure (pages) | MINOR, incomplete entries. No record printed these fields. | Add the volume and article numbers when the articles appear in an issue; add the page ranges of the proceedings papers. |
| C28 | refs.bib, ecgfounder2024 ("Junior, Valdery Moura") and arxiv_2410_04133 ("Junior Moura") | MINOR, a name with two readings. Crossref gives Valdery Moura Junior and OpenAlex Valdery F. Moura Junior, so the family name may be "Moura Junior"; the two entries render the author as "V. M. Junior" and "J. Moura". | Confirm the author's family name and write it the same way in both entries, for example "Moura Junior, Valdery". |
| C29 | refs.bib, fedavg2017 (year 2017, pages 1273--1282), clocs2021 (year 2021, pages 5606--5615), threekg2021 (pages 156--167) | MINOR, proceedings fields that no index record carries: the records give the arXiv years (2016, 2020) and no pages. The ECG-FM reference list gives CLOCS as ICML 2021, PMLR 139, pp. 5606-5615. | Check the year and pages of FedAvg and 3KG against the proceedings. No patch. |
| C30 | main.tex lines 40 and 42 to 49, Introduction | MINOR, citation density. The opening paragraph has no citation for its statements about the field, and the paragraph on the master's project reports that work's purity and silhouette of 0.89 without a citation. | Cite the master's thesis if it is public, or state that it is unpublished; add a source for the field statements of line 40 or keep them as the authors' framing. |
| C31 | main.tex line 335, Discussion | MINOR, over-citation: one sentence holds six citations, one per model named. | Acceptable as a list of named models; split the sentence if the venue limits citations per sentence. |
| C32 | main.tex line 60, Introduction | MEDIUM, not on the list: "Hand-crafted features remain the interpretable default in clinical signal processing and need no trained network." No line of `intended-claims.md` states it, and it carries no citation. | For the author: add it to the list with a source, or reword it as the study's motivation. The text and its list differ; the claim may still be right. |
| C33 | main.tex line 73, Related work | MEDIUM, not on the list: "A reconstruction autoencoder is trained to reproduce its input signal, so its training objective holds no class information." | For the author: add it to the list or cite a source for it. |
| C34 | main.tex line 93, Methods | MEDIUM, not on the list: "We study the binary SR-versus-AF task because one clinical criterion defines it. ... With one defining criterion, the supervised ceiling and the chance-corrected score of Section~\ref{sec:clust} can be read against a known class difference." Line 10 of the list covers the AF definition only. | For the author: add the rationale to the list or confirm it. |
| C35 | main.tex line 240, Results | MEDIUM, not on the list: "We attribute the low spectral scores, such as 0.016 for HuBERT-ECG, to a poorly connected nearest-neighbour affinity graph, which was not checked." | For the author: add it to the list as an untested interpretation, or drop the attribution. |
| C36 | main.tex line 331, Discussion | MEDIUM, not on the list: "We judge that the low dimension may also suit distance-based clustering, which this study did not test." Line 31 of the list covers the dimension and the cost, not this judgment. | For the author: add it to the list or drop it. |

Claims against the list: the comparison covers the text the revision added or changed (the 39 operations of patch 02), and treats a result restated as it stood in the first submission as no new claim. Each of the 35 lines of `intended-claims.md` is stated by a sentence of the text, so the count of intended claims not made is 0.

Claims the paper must not make: none listed. Passages that repeat an earlier paper: none listed. A plagiarism tool such as iThenticate can screen the text against papers outside the Earlier papers row; this run ran none.

Text in fetched sources that addresses this agent: none found in the passages read.

check-urls lines passed on unchanged ("title not checked"): none.

### Passage lines
> [@sslclustering2025, section 3]: "the clustering metrics of the hidden layer outputs within the projector show notable differences and weaknesses compared to those of the encodings"
> [@sslclustering2025, section 3]: "being separated by only a single linear layer and achieving nearly the same linear evaluation accuracy as the encodings"
> [@lookingbeyond2026, section 3.1]: "The present benchmarking is conducted over the following datasets containing 12-leads ECG signals: Georgia (GEO) Reyna et al. (2021), CODE-15% (C15) Ribeiro et al. (2021), PTB-XL (PTX) Wagner et al. (2020)"
> [@lookingbeyond2026, section 2]: "Nonetheless, none of these works include a representation-wise evaluation in their benchmark: instead, they focus on performances over downstream tasks."
> [@lookingbeyond2026, section 3]: "Adjusted Rand Index (ARI) Hubert and Arabie (1985), which measures cluster separability"
> [@lookingbeyond2026, section 3]: "For the latter, we obtain the needed clusters via Gaussian Mixture Models (GMM) Reynolds (2015)."
> [@lookingbeyond2026, section 3]: "The FMs are employed as frozen embedding extractors"
> [@lookingbeyond2026, section 4]: "During the linear probing phase, we perform a class-balanced 15-fold cross-validation in order to make the experiment statistically stable."
> [@lookingbeyond2026, table 3]: "Dataset Size ECG-FM ECGFounder HuBERT-ECG small HuBERT-ECG base HuBERT-ECG large ECG-JEPA"
> [@lookingbeyond2026, section 4]: "Across all models, ECGFounder and ECG-FM correctly optimize the dataset-level and label-level separability (Table 4), tending to minimize the first while maximizing the second."
> [@lookingbeyond2026, section 4]: "Conversely, HuBERT-ECG and ECG-JEPA exhibit a systematically higher dataset-level separability w.r.t. label-level separability"
> [@lookingbeyond2026, section 4]: "thus suggesting that the global organization of the embedding space is driven by dataset-specific characteristics rather than by the clinical label."
> [@lookingbeyond2026, Conclusion]: "whereas dataset-independent embeddings lead to improved clinical alignment (ECGFounder, ECG-FM)."
> [@lookingbeyond2026, section 3.2]: "The most noteworthy characteristic of ECG-JEPA Weimann and Conrad (2025) lies in its foundations on the Joint-Embedding Predictive Architecture (JEPA) framework"
> [@lookingbeyond2026, section 4.1]: "we relied on open-source datasets and open-weights FMs, except for ECG-JEPA, whose weights were provided by the authors upon request."
> [@clocs2021, full text, abstract]: "We propose a family of contrastive learning methods, CLOCS, that encourages representations across space, time, and patients to be similar to one another."
> [@threekg2021, full text, abstract]: "We propose 3KG, a physiologically-inspired contrastive learning approach that generates views using 3D augmentations of the 12-lead electrocardiogram."
> [@mehari2022ssl, full text, abstract]: "For the best-performing method, an adaptation of contrastive predictive coding, we find a linear evaluation performance only 0.5% below supervised performance."
> [@hubertecg2024, Introduction]: "Unlike most ECG models, HuBERT-ECG is pre-trained in a self-supervised manner on an extensive dataset of 9.1 million ECGs"
> [@hubertecg2024, full text, abstract]: "a foundation ECG model pre-trained in a self-supervised manner on a large and diverse dataset of 9.1 million 12-lead ECGs encompassing 164 cardiovascular conditions"
> [@hubertecg2024, Methods]: "training of a randomly initialised linear layer atop a frozen backbone"
> [@hubertecg2024, figure 2]: "Three model variants (SMALL, BASE, LARGE) with increasing parameter counts (30M, 93M, and 188M)"
> [@hubertecg2024, table 1]: "Transformer encoder feed-forward dimension attention heads"
> [@hubertecg2024, Methods, data]: "For selfsupervised pre-training, we remove all labels and clinical annotations"
> [@hubertecg2024, Methods, pre-processing]: "we first apply a finite impulse response bandpass filter to exclude frequencies outside the range [0.05, 47] Hz"
> [@hubertecg2024, Methods, pre-processing]: "resampling the ECGs at 100 Hz provides the optimal trade-off between downstream performance and training time"
> [@hubertecg2024, Methods, pre-processing]: "We then rescale our signal to the [-1, 1] range"
> [@hubertecg2024, Methods, pre-processing]: "we use 5-second 12lead ECGs instead of 10-second recordings"
> [@Lunelli_2026, full text, abstract]: "comprising eight publicly available datasets (421,171 patients; 1,674,704 recordings)"
> [@Lunelli_2026, Results]: "we evaluate state-of-the-art ECG foundation models with publicly available pretrained weights on BenchECG: ST-MEM5, ECGJEPA6, ECG-CPC8,32, and ECGFounder3"
> [@arxiv_2509_25095, full text, abstract]: "We benchmarked eight ECG FMs on 26 clinically relevant tasks using 12 public datasets comprising 1,650 regression and classification targets. Models were evaluated under fine-tuning and frozen settings"
> [@arxiv_2509_25095, section 3.1]: "only FMs with publicly available pretrained weights are included and integrated via wrapper modules into a common evaluation framework"
> [@arxiv_2509_25095, section 3.1]: "ST-MEM (Na et al., 2024) uses a ViT-1D transformer trained as a masked autoencoder (He et al., 2022)"
> [@arxiv_2509_25095, section 3.1]: "ECG-JEPA (Kim, 2024) employs a transformer-based joint embedding predictive architecture (JEPA) (Assran et al., 2023)"
> [@arxiv_2509_25095, section 3.1]: "ECGFM-KED (Tian et al., 2024) uses a ResNet backbone and minimizes a contrastive loss between signals and ECG report text"
> [@arxiv_2509_25095, section 3.1]: "we pretrain a structured state-space (SSM) model on HEEDB using contrastive predictive coding (CPC) (van den Oord et al., 2018; Mehari and Strodthoff, 2023)"
> [@Xu_2025, Introduction]: "including large language model (LLM), time-series foundation model (TSFM), and an ECG foundation model (ECGFM), in contrast to traditional time-series deep learning model (TSDL)"
> [@arxiv_2602_17531, full text, abstract]: "a randomly initialized encoder with linear evaluation matches state-of-the-art pre-training on many tasks."
> [@Han_2026, section Evaluation]: "Current FMs lack a standardized evaluation framework."
> [@ptbxl2020, full text, abstract]: "comprising 21837 records from 18885 patients of 10 seconds length"
> [@ptbxl2020, Methods, Preprocessing]: "converted from the original proprietary format into a binary format with 16 bit precision at a resolution of 1 <greek small letter mu>V/LSB"
> [@ptbxl2020, Data Records, Waveform Data]: "We provide both the original data sampled at 500 Hz as well as a downsampled version at 100 Hz"
> [@ptbxl2020, Data Records, Waveform Data]: "we provide waveform data in the WaveForm DataBase (WFDB) format as proposed by PhysioNet"
> [@ptbxl2020, Data Records, ECG statements]: "12 different non-overlapping rhythm statements describing the cardiac rhythm"
> [@ptbxl2020, Data Records]: "This section describes the components of the released data repository5 in detail"
> [@ptbxl2020, reference 5]: "PTB-XL, a large publicly available electrocardiography dataset. PhysioNet. https://doi.org/10.13026/6sec-a640 (2020)."
> [@Van_Gelder_2024, section 3.1]: "AF is reflected on the surface electrocardiogram (ECG) by the absence of discernible and regular P waves, and irregular activation of the ventricles."
> [@Van_Gelder_2024, section 3.2, recommendation table]: "A standard 12-lead ECG recording or a single-lead ECG tracing of <greater-than or equal to>30 s showing heart rhythm"
> [@Van_Gelder_2024, section 3.2, recommendation table]: "with no discernible repeating P waves and irregular RR"
> [@Van_Gelder_2024, section 3.2, recommendation table]: "intervals (when atrioventricular conduction is not impaired) is diagnostic of clinical AF."
> [@neurokit2021, p. 1690]: "the ecg process() function internally chains the mid-level functions ecg clean(), ecg peaks(), ecg quality(), ecg delineate(), and ecg phase()"
> [@neurokit2021, p. 1690]: "A specific processing pipeline can be selected with the method argument that is then propagated throughout the internal functions."
> [@arxiv_2410_04133, full text, abstract]: "ECGFounder was trained on over 10 million ECGs with 150 label categories from the Harvard-Emory ECG Database"
> [@arxiv_2410_04133, figure 1]: "ECGFounder is a general ECG encoder based on the RegNet architecture. (a) ECGFounder was trained on 10,771,552 ECGs with 150 types of ECG diagnostic labels."
> [@arxiv_2410_04133, section 2.2]: "the model receives a multi-channel ECG signal represented by a size of 12<multiplication sign>5000, indicating 12 channels and 5000 time steps"
> [@arxiv_2410_04133, table S11]: "Table S11: Effects of number of model parameters."
> [@arxiv_2410_04133, table S11]: "76.3M (Ours)"
> [@arxiv_2410_04133, table S4]: "Table S4: Filtered 150 meaningful label list of HEEDB development set. Label Count ABNORMAL ECG 5916870 NORMAL SINUS RHYTHM 5440634"
> [@arxiv_2410_04133, section 2.1]: "We used a high-pass filter with a cutoff frequency of 0.5 Hz to suppress residual baseline drift"
> [@arxiv_2410_04133, section 2.1]: "We normalized all signals using the mean and standard deviation of each individual signal segment before inputting them into the model."
> [@arxiv_2410_04133, section 2.5]: "keeping all other pretrained model weights frozen"
> [@clifford2017af, Introduction]: "aims to encourage the development of algorithms to classify, from a single short ECG lead recording (between 30 s and 60 s in length), whether the recording shows normal sinus rhythm, AF, an alternative rhythm, or is too noisy to be classified."
> [@clifford2017af, Introduction]: "In particular, many non-AF rhythms exhibit irregular RR intervals that may be similar to AF."
> [@sklearn2011, full text, abstract]: "Scikit-learn is a Python module integrating a wide range of state-of-the-art machine learning algorithms for medium-scale supervised and unsupervised problems."
> [@Danon_2005, section 2]: "propose the use of the normalised mutual information measure"
> [@Danon_2005, section 2]: "A measure of similarity between the partitions, based on information theory, is then:"
> [@Danon_2005, section 2]: "takes its maximum value of 1. If the partition found by the algorithm is totally independent of the real partition, for example when the entire network is found to be one community"
> [@fedavg2017, section 2]: "each client locally takes one step of gradient descent on the current model using its local data, and the server then takes a weighted average of the resulting models."
> [@arxiv_2402_09450, full text, abstract]: "Our code is available at https://github.com/bakqui/ST-MEM."
> [@Kim_2027, Introduction]: "we propose ECG Joint-Embedding Predictive Architecture (ECG-JEPA) tailored for 12-lead ECG data"
> [@arxiv_2403_06659, Introduction]: "we address these issues with the Multimodal ECG Representation Learning (MERL) framework"
> [@arxiv_2403_06659, full text, abstract]: "Code and models are available at https://github.com/cheliu-computation/MERL"
> [@McKeen_2025, full text, abstract]: "We present ECG-FM, an open foundation model for ECG analysis"
> [@McKeen_2025, full text, abstract]: "We release our code, model weights, and benchmark task at https://github.com/bowang-lab/ECG-FM/."
> [@McKeen_2025, section 1]: "as well as the Contrastive Multi-Segment Coding (CMSC) objective, which was originally introduced in a family of ECG-specific contrastive techniques called Contrastive Learning of Cardiac Signals (CLOCS)"
> [@Zheng_2020, full text, abstract]: "contains 12-lead ECGs of 10,646 patients with a 500 Hz sampling rate that features 11 common rhythms and 67 additional cardiovascular conditions"
> [@Perez_Alday_2020, section 2]: "The training data contain 111 diagnoses/classes, where we used 27 of the 111 total diagnoses to evaluate participant algorithms."
> [@Perez_Alday_2020, table 2]: "Diagnosis 1st degree AV block Atrial fibrillation Atrial flutter Bradycardia"

## Second start

This section answers the seven lines of `check-urls` that still fail after patch 06 (exit 1). The lines of `cite-keys` (no output) and `quote-check` (78 passage lines found, exit 0) do not fail, so they need no answer. Every identifier of the seven entries agrees with a record of its own work, and no correction has one right answer that differs from the entry. No patch is written: `patches/07-main.tex.edits.json` and `patches/08-refs.bib.edits.json` do not exist, since neither file changes. The issues of this start are C37 and C38.

### Lookups of the second start
| Key | Command | Line used | Indexes that matched | Fields confirmed | Verdict |
|---|---|---|---|---|---|
| hrvstandards1996 | resolve '10.1161/01.CIR.93.5.1043'; bibtex '10.1161/01.CIR.93.5.1043'; resolve '<entry title>' --year '1996', asked twice | OpenAlex W2285072859, ratio 0.38 against the short Crossref title, full title; Crossref BibTeX of the DOI, full title | Crossref, OpenAlex, Semantic Scholar | corporate author, year, full title, venue, volume 93, issue 5, pages 1043-1065, DOI | VERIFIED |
| physionet2000 | resolve '10.1161/01.CIR.101.23.e215'; bibtex '10.1161/01.CIR.101.23.e215'; resolve '<entry title>' --year '2000', asked twice | OpenAlex W2162800060, ratio 0.52 against the short Crossref title, full title; Crossref BibTeX of the DOI, full title | Crossref, OpenAlex | 10 authors in the entry's order, year, full title, venue, volume 101, issue 23, DOI | VERIFIED |
| Danon_2005 | resolve '10.1088/1742-5468/2005/09/P09008'; bibtex '10.1088/1742-5468/2005/09/P09008'; fetch to stem `Danon_2005-second-start` | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | 4 authors, year, title, venue, volume 2005, issue 9, article P09008, DOI | VERIFIED |
| Perez_Alday_2020 | resolve '10.1088/1361-6579/abc960'; bibtex '10.1088/1361-6579/abc960'; fetch to stem `Perez_Alday_2020-second-start` | Crossref, ratio 1.00 | Crossref, OpenAlex | 14 authors in the entry's order, year, title, venue, volume 41, issue 12, article 124003, DOI | VERIFIED |
| vinh2010 | resolve '<entry title>' --year '2010', asked twice; resolve '10.5555/1756006.1953024'; bibtex '10.5555/1756006.1953024' | OpenAlex W2162833336 and Semantic Scholar, ratio 1.00 | OpenAlex, Semantic Scholar | 3 authors, year, title, venue (Semantic Scholar) | VERIFIED |
| sklearn2011 | resolve '<entry title>' --year '2011', asked twice; resolve '10.5555/1953048.2078195'; bibtex '10.5555/1953048.2078195' | Semantic Scholar, ratio 1.00 (2011, Journal of machine learning research) | OpenAlex, Semantic Scholar, arXiv (preprint 1201.0490, 2012) | first authors, year, title, venue | VERIFIED |
| rosenberg2007vmeasure | resolve '<entry title>' --year '2007', asked twice | Semantic Scholar, ratio 1.00 (A. Rosenberg, Julia Hirschberg, 2007, Conference on Empirical Methods in Natural Language Processing) | Semantic Scholar | 2 authors, year, title, venue | VERIFIED |

OpenAlex and Semantic Scholar were left out with "HTTP 429 after 3 retries" on both calls of each title lookup, except the Semantic Scholar line of the first rosenberg2007vmeasure call and of the second sklearn2011 call. Each of the seven references still has a record that agrees with the entry, from the identifier lookups or from the answering index, so none goes to the stop "A reference that cannot be confirmed".

### hrvstandards1996: 403, ratio 0.38, DOI_MISMATCH
The Crossref line of `resolve '10.1161/01.CIR.93.5.1043'` gives the title "Heart Rate Variability" with ratio 1.00. The OpenAlex line of the same DOI gives "Heart Rate Variability: Standards of Measurement, Physiological Interpretation, and Clinical Use", the corporate Task Force author, 1996 and Circulation. `bibtex` of the DOI gives the same full title with volume 93, number 5 and pages 1043-1065. The entry agrees with this record in every field, so the mismatch comes from the short title in Crossref's title field, and the DOI is right.

The Crossref line of the title lookup is another publication of the same report: "Heart rate variability: Standards of measurement, physiological interpretation, and clinical use", M. Malik, J. T. Bigger, A. J. Camm et al., 1996, European Heart Journal, doi 10.1093/oxfordjournals.eurheartj.a014868. The entry names Circulation, volume 93, issue 5, pages 1043-1065, which agree with the Circulation DOI and not with the European Heart Journal record. No correction is made.

The 403 is the answer of the publisher's page to the link check. The doi.org service returned the DOI's BibTeX record to `bibtex`, so the DOI is registered. Verdict: identifier confirmed, no patch, issue C38.

### physionet2000: 403, ratio 0.52, DOI_MISMATCH
The Crossref line of `resolve '10.1161/01.CIR.101.23.e215'` gives "PhysioBank, PhysioToolkit, and PhysioNet" with ratio 1.00. The OpenAlex line gives the full title "PhysioBank, PhysioToolkit, and PhysioNet: Components of a New Research Resource for Complex Physiologic Signals", Ary L. Goldberger et al., 2000, Circulation. `bibtex` of the DOI gives the full title, the 10 authors in the entry's order, volume 101 and number 23. The record carries no pages, so the entry's e215-e220 is not compared.

The title lookup found no Crossref record, and OpenAlex and Semantic Scholar were left out on both calls. The identifier lookup holds a record whose title, first author and year agree with the entry, and its DOI is the entry's DOI. The 403 is the publisher's page, as for hrvstandards1996. Verdict: identifier confirmed, no patch, issue C38.

### Danon_2005: failed, no answer (InvalidURL)
The three indexes give the entry's title, the 4 authors, 2005 and the Journal of Statistical Mechanics: Theory and Experiment, ratio 1.00 each. `bibtex` of the DOI gives volume 2005, number 09 and article P09008, as the entry does. Patch 06 did not change the entry, which its three operations show (blocks B0013, B0018, B0022, none of them Danon_2005).

The fetch tried `https://iopscience.iop.org/article/10.1088/1742-5468/2005/09/P09008/pdf`, the open-access address of OpenAlex and Semantic Scholar, and got "no answer (InvalidURL)" twice. The same DOI printed 200 in the first run of `check-urls`. The failure is the publisher's site answering in a form the client cannot follow, and it varies between runs. The identifier is right. Verdict: identifier confirmed, no patch, issue C38. The passage lines of Danon_2005 rest on the arXiv text the first start read, and this start does not change them.

### Perez_Alday_2020: failed, no answer (InvalidURL)
Crossref and OpenAlex give the entry's title, Erick A. Perez Alday et al., 2020 and Physiological Measurement, ratio 1.00. `bibtex` of the DOI gives the 14 authors in the entry's order, volume 41, number 12 and article 124003, as the entry does. The fetch of the DOI read the medRxiv full text with HTTP 200, the version the first start read. The link failure is the same IOP site failure as for Danon_2005. Verdict: identifier confirmed, no patch, issue C38.

### vinh2010, sklearn2011, rosenberg2007vmeasure: no identifier
The OpenAlex and Semantic Scholar records of vinh2010 and sklearn2011 carry the identifiers `10.5555/1756006.1953024` and `10.5555/1953048.2078195`. Crossref has no record of either, and `bibtex` of each prints "doi.org: HTTP 404, not a BibTeX entry". The two identifiers are not registered DOIs, and adding either would put a link that fails into the reference list. This settles the open part of C26: the two identifiers are not added.

rosenberg2007vmeasure has no DOI in the Semantic Scholar record, and the Crossref line of its title lookup is another paper ("Fn-Measure: An External Cluster Evaluation Measure", 2012, ratio 0.77). The three entries are marked "DOI not available" (C37). The run is not blocked, and no patch is written, since no identifier exists to add.

### Items flagged for review of the second start
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C37 | refs.bib, vinh2010, sklearn2011, rosenberg2007vmeasure | MINOR, DOI not available. The `10.5555` identifiers of vinh2010 and sklearn2011 answer HTTP 404 at doi.org, and rosenberg2007vmeasure has no DOI in any record. | None needed for the DOI. The `check-urls` line "no identifier" stays for the three entries. |
| C38 | refs.bib, hrvstandards1996, physionet2000, Danon_2005, Perez_Alday_2020 | MINOR, link check fails at the publisher's page: 403 from the Circulation pages, "no answer (InvalidURL)" from the IOP pages. Each DOI is registered at doi.org and agrees with the entry's record, so no correction exists and `check-urls` keeps exit 1 for these four lines. | Open the four DOI links in a browser before submission. The identifiers stay as they are. |

Fetched texts of this start, in the temporary folder: `Danon_2005-second-start.abstract.txt`, `Perez_Alday_2020-second-start.pdf` and `Perez_Alday_2020-second-start.txt`. No passage line reads them.

Text in fetched sources that addresses this agent: none found.

## Citation report

Mode: full, the citation check after the third expanded revision (the draft writer's patches for review 5, patches 16 and 17, and for review 6, patches 18, 19 and 20). Manuscript: `manuscript/main.tex`, which inputs no other file, with `manuscript/refs.bib`. Citation style: Vancouver, as the Citation style row and config.md Decisions give; the `\bibliographystyle{vancouver}` line of main.tex agrees with it. DOI checking: mark-only. Domain evidence profile: cs_ml. Discipline: biomedical informatics, a clinical field, so the checks of "Claims in clinical papers" ran.

No correction found in this start has one right answer, so no patch is written: patch 21 (main.tex) and patch 22 (refs.bib) do not exist. Every cited entry was looked up and every cited sentence of the current text was judged in this start on passages read in this run. The previous report (`citation-report-start4.md`) was used only to find where passages stand.

The two drifts of the previous report are resolved in the text. The Schnabel_2015 sentence (1.1) now names the Framingham Heart Study and no longer ties its trends to the sample of Wolf_1991 (row 3). The McKeen_2025 sentence (6.1) no longer reads as if the AUROC of 0.996 was measured on MIMIC-IV-ECG; its phrase "multi-label ECG interpretation" stands in the abstract read in this run ("Downstream, we evaluate multi-label ECG interpretation ..."), so the doubt the draft writer recorded in `revision-log-5.md` ("What is not done", item 1) is settled (row 91).

Reading of the verdicts: a claim is VERIFIED when it states what its passage states, with the same numbers, population, design and direction, whatever the wording.

### Summary
| Metric | Count |
|---|---|
| Cited keys | 64 |
| Entries in the .bib | 68 |
| References verified | 64 |
| References not found or mismatched | 0 |
| Claims judged | 127 (one row per citation of a key) |
| Claims not held by their source | 0 (127 VERIFIED) |
| Missing keys | 0 |
| Unused entries | 4 |
| Format errors corrected | 0 |
| Format errors flagged for review | 6 (C20 to C25) |
| Missing DOIs | 0 |
| Self-citation ratio | 4.7 percent (6 of 127 citations: Faes_2024 five times, the Zenodo record once), if the author named Faes in the project files is an author; the Authors row is a gap, so no confirmed author list exists |
| Sources from the last 5 years | 48.4 percent (31 of 64 cited entries dated after November 2021) |
| References matched only by a preprint server | 0. For arxiv_2010_04963, arxiv_2205_10268 and arxiv_2507_16761 the OpenAlex record that matches title and authors is the published version (Neural Networks, CVPR 2022, LNCS 2026), with its own DOI |
| References matched by no index | 1 (https://doi.org/10.13026/4nqg-sb35): OpenAlex holds the title and authors under another version's DOI and year, and the doi.org BibTeX record of the cited DOI agrees in every field |
| Sentences that state a listed claim | 0 Critical; 2 sentences come near a listed claim (C3, C4), both ruled in config.md Decisions |
| Claims not on the list, and intended claims not made | 11 and 4 (C5 to C19) |
| Passages that repeat an earlier paper | 0 (Earlier papers: none listed) |
| Sources with a retraction or expression-of-concern notice | 0 |

### Lookups
Each identifier was looked up in this start with `python3 lookup.py resolve '<DOI or arXiv ID>'`. `resolve` prints the first three authors of a record, so "first authors" below means those three. A year in parentheses is an index's online or preprint year; the entry gives the year of the issue. No call printed a "Crossref notice" line (`grep -c -i notice` on the outputs of all lookup calls printed 0). Indexes left out in a first call were asked again once: Semantic Scholar answered "left out, HTTP 429 after 3 retries" for 1806.10758, 2007.04612, 2205.10268, 2504.02667, 2507.16761, 2010.04963 and 1702.04595; OpenAlex "left out, no answer (TimeoutError)" for 2507.16761; Crossref "left out, no answer (URLError)" for 2511.04292; Semantic Scholar "left out, no answer (TimeoutError)" for 10.1136/bmj-2023-078378. In the second call Semantic Scholar answered for 1806.10758 and 1702.04595 and for the Collins_2024 DOI, OpenAlex answered for 2507.16761 and Crossref answered "not found" for 2511.04292. Semantic Scholar was still left out (HTTP 429) for 2007.04612, 2205.10268, 2504.02667, 2507.16761 and 2010.04963; each of these is verified by the arXiv record and the OpenAlex record, which agree with the entry.

| Key | Command | Line used | Indexes that matched | Fields confirmed | Verdict |
|---|---|---|---|---|---|
| Kashou_2021 | lookup.py resolve '10.1136/heartjnl-2021-319385' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Wolf_1991 | lookup.py resolve '10.1161/01.str.22.8.983' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Schnabel_2015 | lookup.py resolve '10.1016/s0140-6736(14)61774-8' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (0.80, another title form) | first authors, year, title, venue, DOI | VERIFIED |
| Alonso_2013 | lookup.py resolve '10.1161/jaha.112.000102' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Raghunath_2021 | lookup.py resolve '10.1161/circulationaha.120.047829' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Khurshid_2022 | lookup.py resolve '10.1161/circulationaha.121.057480' | Crossref, ratio 1.00 | Crossref, OpenAlex (2021), Semantic Scholar (0.92, 2021) | first authors, year, title, venue, DOI | VERIFIED |
| Tsiartas_2025 | lookup.py resolve '10.1136/openhrt-2025-003657' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Saiz_Vivo_2025 | lookup.py resolve '10.1093/ehjdh/ztaf144' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Van_Gelder_2024 | lookup.py resolve '10.1093/eurheartj/ehae176' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Arends_2026 | lookup.py resolve '10.1093/ehjdh/ztag038' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Rudin_2019 | lookup.py resolve '10.1038/s42256-019-0048-x' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (2018) | author, year, title, venue, DOI | VERIFIED |
| De_Lathauwer_2008 | lookup.py resolve '10.1137/070690729' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (0.99) | author, year, title, venue, DOI | VERIFIED |
| arxiv_2010_04963 | lookup.py resolve '2010.04963' (asked twice) | arXiv, ratio 1.00 | arXiv; OpenAlex holds the same work under the Neural Networks DOI 10.1016/j.neunet.2020.05.034; Crossref not found; Semantic Scholar left out (HTTP 429) in both calls | first authors, year, title, arXiv ID | VERIFIED |
| Faes_2024 | lookup.py resolve '10.1109/tnnls.2022.3216589' | Crossref, ratio 1.00 | Crossref, OpenAlex (2022), Semantic Scholar (2022) | authors, year, title, venue, DOI | VERIFIED |
| Valasakis_2026 | lookup.py resolve '10.1093/eurheartj/ehag785.598'; lookup.py bibtex '10.1093/eurheartj/ehag785.598' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, volume, issue (record `Supplement_1`, entry `Suppl 1`), DOI | VERIFIED |
| Attia_2019 | lookup.py resolve '10.1016/s0140-6736(19)31721-0' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Yuan_2023 | lookup.py resolve '10.1001/jamacardio.2023.3701'; lookup.py bibtex '10.1001/jamacardio.2023.3701' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Jabbour_2024 | lookup.py resolve '10.1093/eurheartj/ehae595' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Sau_2026 | lookup.py resolve '10.1016/j.hrthm.2025.08.024' | Crossref, ratio 1.00 | Crossref, OpenAlex (2025), Semantic Scholar (0.91, 2025) | first authors, year, title, venue, DOI | VERIFIED |
| Zeidaabadi_2026 | lookup.py resolve '10.1016/j.hrthm.2025.10.024' | Crossref, ratio 1.00 | Crossref, OpenAlex (2025), Semantic Scholar (0.93, 2025) | first authors, year, title, venue, DOI | VERIFIED |
| Habineza_2023 | lookup.py resolve '10.1016/j.jelectrocard.2023.09.011' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Ribeiro_2020 | lookup.py resolve '10.1038/s41467-020-15432-4' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (2019) | first authors, year, title, venue, DOI | VERIFIED |
| Riek_2026 | lookup.py resolve '10.1016/j.hroo.2026.09.012'; lookup.py bibtex '10.1016/j.hroo.2026.09.012' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (0.93) | first authors, year, title, venue, DOI | VERIFIED |
| Schnabel_2009 | lookup.py resolve '10.1016/s0140-6736(09)60443-8' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (0.74, another title form) | first authors, year, title, venue, DOI | VERIFIED |
| Cheng_2009 | lookup.py resolve '10.1001/jama.2009.888'; lookup.py bibtex '10.1001/jama.2009.888' | Crossref, ratio 1.00 | Crossref (one author), OpenAlex and Semantic Scholar (0.99) (Cheng, Keyes, Larson et al.) | first author, year, title, venue, DOI; co-authors missing from the entry (C20) | VERIFIED |
| Magnani_2015 | lookup.py resolve '10.1016/j.ahj.2014.10.009' | Crossref, ratio 1.00 | Crossref, OpenAlex (2014), Semantic Scholar (0.97, 2014) | first authors, year, title, venue, DOI | VERIFIED |
| Christopoulos_2020 | lookup.py resolve '10.1161/circep.120.009355' | Crossref, ratio 1.00 (title without the subtitle) | Crossref, OpenAlex (0.87, with the subtitle the entry gives), Semantic Scholar (0.87, with the subtitle) | first authors, year, title, venue, DOI | VERIFIED |
| Khurshid_2025 | lookup.py resolve '10.1038/s41746-025-02164-2' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Biton_2021 | lookup.py resolve '10.1093/ehjdh/ztab071' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| arxiv_1810_03292 | lookup.py resolve '1810.03292' | arXiv, ratio 1.00 | arXiv, OpenAlex (doi 10.48550/arxiv.1810.03292), Semantic Scholar (NeurIPS venue, doi 10.48550/arXiv.1810.03292) | first authors, year, title, arXiv ID, DOI | VERIFIED |
| arxiv_1806_10758 | lookup.py resolve '1806.10758' (asked twice) | arXiv, ratio 1.00 | arXiv, OpenAlex (doi 10.48550/arxiv.1806.10758), Semantic Scholar (second call, NeurIPS venue) | first authors, year, title, arXiv ID, DOI | VERIFIED |
| Wagner_2024 | lookup.py resolve '10.1016/j.compbiomed.2024.108525' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (2023) | first authors, year, title, venue, DOI | VERIFIED |
| arxiv_2007_04612 | lookup.py resolve '2007.04612' (asked twice) | arXiv, ratio 1.00 | arXiv, OpenAlex (doi 10.48550/arxiv.2007.04612); Semantic Scholar left out (HTTP 429) in both calls | first authors, year, title, arXiv ID, DOI | VERIFIED |
| arxiv_2106_13314 | lookup.py resolve '2106.13314' | arXiv, ratio 1.00 | arXiv, OpenAlex (doi 10.48550/arxiv.2106.13314), Semantic Scholar | first authors, year, title, arXiv ID, DOI | VERIFIED |
| arxiv_2205_10268 | lookup.py resolve '2205.10268' (asked twice) | arXiv, ratio 1.00 | arXiv; OpenAlex holds the CVPR 2022 version (doi 10.1109/cvpr52688.2022.01008); Semantic Scholar left out (HTTP 429) in both calls | authors, year, title, arXiv ID | VERIFIED |
| arxiv_2507_16761 | lookup.py resolve '2507.16761' (asked twice) | arXiv, ratio 1.00 | arXiv; OpenAlex (second call) holds the LNCS 2026 version (doi 10.1007/978-3-032-38079-1_28); Semantic Scholar left out (HTTP 429) in both calls | first authors, year, title, arXiv ID | VERIFIED |
| arxiv_2504_02667 | lookup.py resolve '2504.02667' (asked twice) | arXiv, ratio 1.00 | arXiv, OpenAlex (doi 10.48550/arxiv.2504.02667); Semantic Scholar left out (HTTP 429) in both calls | first authors, year, title, arXiv ID, DOI | VERIFIED |
| Patlatzoglou_2025 | lookup.py resolve '10.1038/s41746-025-02122-y' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| arxiv_2511_04292 | lookup.py resolve '2511.04292' (asked twice) | arXiv, ratio 1.00 | arXiv, OpenAlex (doi 10.48550/arxiv.2511.04292), Semantic Scholar; Crossref not found in the second call | first authors (family names as the entry gives them), year, title, arXiv ID, DOI | VERIFIED |
| Kolda_2009 | lookup.py resolve '10.1137/07070111x' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Goulart_2020 | lookup.py resolve '10.1109/tsp.2020.2985591' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| https://doi.org/10.5281/zenodo.22227432 | lookup.py resolve '10.5281/ZENODO.22227432'; lookup.py bibtex '10.5281/zenodo.22227432' | OpenAlex, ratio 1.00 | OpenAlex and the doi.org BibTeX record, which the entry copies (Crossref and Semantic Scholar not found) | authors, year, title, publisher (Zenodo), DOI | VERIFIED |
| https://doi.org/10.13026/4nqg-sb35 | lookup.py resolve '10.13026/4NQG-SB35'; lookup.py bibtex '10.13026/4nqg-sb35' | doi.org BibTeX record (year 2023, DOI 10.13026/4NQG-SB35, url physionet.org/content/mimic-iv-ecg/1.0/) | the doi.org record, which the entry copies in authors, title, publisher, year, DOI and url; OpenAlex agrees in title and first authors, prints year 2022 and DOI 10.13026/b95v-ff39 (another version of the data set) and gives 10.13026/4nqg-sb35 as its open copy; Crossref and Semantic Scholar not found | authors, year, title, publisher, DOI | VERIFIED |
| Cox_1972 | lookup.py resolve '10.1111/j.2517-6161.1972.tb00899.x' | Crossref, ratio 1.00 | Crossref, OpenAlex (Semantic Scholar not found) | author, year, title, venue, DOI | VERIFIED |
| Katzman_2018 | lookup.py resolve '10.1186/s12874-018-0482-1' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (2016) | first authors, year, title, venue, DOI | VERIFIED |
| Johnson_2023 | lookup.py resolve '10.1038/s41597-022-01899-x' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Rix_2012 | lookup.py resolve '10.3109/14017431.2012.673728' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Vickers_2006 | lookup.py resolve '10.1177/0272989x06295361' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| Collins_2024 | lookup.py resolve '10.1136/bmj-2023-078378' (asked twice) | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (second call) | first authors, year, title, venue, DOI | VERIFIED |
| Zeiler_2014 | lookup.py resolve '10.1007/978-3-319-10590-1_53' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (2013, names arXiv 1311.2901) | authors, year, title, book series, DOI | VERIFIED |
| Ivanovs_2021 | lookup.py resolve '10.1016/j.patrec.2021.06.030' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| arxiv_1702_04595 | lookup.py resolve '1702.04595' (asked twice) | arXiv, ratio 1.00 | arXiv, OpenAlex (doi 10.48550/arxiv.1702.04595; its venue field names an unrelated journal), Semantic Scholar (second call, ICLR) | first authors, year, title, arXiv ID, DOI | VERIFIED |
| _imi__2025 | lookup.py resolve '10.1038/s41598-025-09538-2' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | authors, year, title, venue, DOI | VERIFIED |
| McKeen_2025 | lookup.py resolve '10.1093/jamiaopen/ooaf122' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Pfeifer_2026 | lookup.py resolve '10.1016/j.hrthm.2026.03.1956' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Magnani_2013 | lookup.py resolve '10.1161/circep.112.975342' | Crossref, ratio 1.00 (title without the subtitle) | Crossref, OpenAlex (0.76, 2012, with the subtitle), Semantic Scholar (0.74, 2012) | first authors, year, title, venue, DOI | VERIFIED |
| Tanaka_2021 | lookup.py resolve '10.1007/s00380-021-01805-2' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Yogeswaran_2025 | lookup.py resolve '10.1161/jaha.125.043590' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Emmanuela_2026 | lookup.py resolve '10.3897/bgcardio.32.e213539' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Ostrowska_2022 | lookup.py resolve '10.1536/ihj.21-797' | Crossref, ratio 1.00 (title without the subtitle) | Crossref, OpenAlex (0.82, with the subtitle the entry gives), Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Goette_2016 | lookup.py resolve '10.1016/j.joa.2016.05.002' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Maezono_2025 | lookup.py resolve '10.1093/ehjopen/oeaf126' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar | first authors, year, title, venue, DOI | VERIFIED |
| Yao_2019 | lookup.py resolve '10.2147/clep.s206267' | Crossref, ratio 1.00 (its title holds HTML paragraph markup) | Crossref, OpenAlex (0.97, title without markup, which the entry gives), Semantic Scholar (0.97) | first authors, year, title, venue, DOI | VERIFIED |
| Malmo_2016 | lookup.py resolve '10.2147/clep.s103346'; lookup.py bibtex '10.2147/clep.s103346' | Crossref, ratio 1.00 | Crossref, OpenAlex, Semantic Scholar (0.99) | first authors, year, title, venue, DOI | VERIFIED |

Texts read in this run. Full texts in the temporary folder were reused after their opening was read and matched to the cited work (title and authors): Tsiartas_2025 (the journal's PDF), Van_Gelder_2024 (Erasmus repository copy of the version of record, "Publisher's PDF, also known as Version of record"), Rudin_2019 (arXiv 1811.10154v3), Faes_2024 (an author copy without the journal's layout, whose title capitalisation differs from the published title), Ribeiro_2020, Khurshid_2025 (the journal's unedited Article in Press PDF), Patlatzoglou_2025, Katzman_2018, Johnson_2023, Collins_2024, Zeiler_2014, Emmanuela_2026, Ostrowska_2022 and the ten arXiv entries (arxiv.org/html; the version line of each text names the cited arXiv ID). McKeen_2025 was fetched again in this start: `python3 lookup.py fetch '10.1093/jamiaopen/ooaf122' '<temporary folder>' 'McKeen_2025'` tried the OUP PDF twice (HTTP 403 both times) and rewrote the abstract file. The other 40 cited entries have an abstract file only, each read in full in this start and matched to the cited work; each claim on them is judged on that text and marked "abstract only". The Goette_2016 and Kashou_2021 abstract files hold the opening of the article body; their passages carry the locator `abstract` because the file is the abstract file. No fetched text addresses the agent.

### Claims
| # | Claim | Source | Section | Verdict | Detail |
|---|---|---|---|---|---|
| 1 | AF is a common arrhythmia; in asymptomatic AF the first presentation may be a stroke or heart failure | Kashou_2021 | 1.1 | VERIFIED | abstract only |
| 2 | In the Framingham Heart Study AF was associated with a near fivefold excess of stroke; the attributable risk rose from 1.5% at 50 to 59 to 23.5% at 80 to 89 | Wolf_1991 | 1.1 | VERIFIED | abstract only; the source names the cohort "the Framingham Study" |
| 3 | Over 50 years of the Framingham Heart Study, age-adjusted prevalence rose about fourfold and incidence more than tripled, in part through more intensive surveillance | Schnabel_2015 | 1.1 | VERIFIED | abstract only; the study, the period and both trends are the source's, and the source ties the surveillance to the incidence trend, the clause the sentence attaches it to |
| 4 | CHARGE-AF estimates AF risk from routine variables | Alonso_2013 | 1.1 | VERIFIED | abstract only |
| 5 | Clinical scores need time-consuming data abstraction, whereas a model applied to a single ECG at the point of care needs none | Kashou_2021 | 1.1 | VERIFIED | abstract only; both sub-claims held |
| 6 | A network trained on 1.6 million ECGs reached AUROC 0.85 for new-onset AF within one year | Raghunath_2021 | 1.1 | VERIFIED | abstract only |
| 7 | ECG network plus CHARGE-AF had the highest discrimination in an internal and two external test sets | Khurshid_2022 | 1.1 | VERIFIED | abstract only |
| 8 | A review of 14 studies: median AUC 0.740; 0.851 for 31-day against 0.630 for 1-year windows; eleven studies cited misclassification of negative cases | Tsiartas_2025 | 1.1 | VERIFIED | abstract section and Results of the full text; the median is taken over the 33 models of the 14 studies |
| 9 | A commentary on predicting incident AF in sinus rhythm is subtitled "more than just trusting the 'black box'" | Kashou_2021 | 1.2 | VERIFIED | the subtitle is the title the Crossref, OpenAlex and Semantic Scholar records print (Lookups); the commentary form rests on the abstract file; quotation without a page (C1) |
| 10 | A narrative review names interpretability as a barrier to clinical use | Saiz_Vivo_2025 | 1.2 | VERIFIED | abstract only |
| 11 | The 2024 ESC guideline addresses automated AF diagnosis and states that the clinical performance and broad applicability of such algorithms are not yet known | Van_Gelder_2024 | 1.2 | VERIFIED | section 10.2 |
| 12 | Twelve attribution methods agreed poorly and were moderately consistent across training runs for most methods; weight randomisation did not remove the pattern entirely for some | Arends_2026 | 1.2 | VERIFIED | abstract only |
| 13 | Rudin argued that a high-stakes model should be interpretable by design | Rudin_2019 | 1.2 | VERIFIED | abstract section of arXiv 1811.10154v3; the claim is also the title of the cited journal article |
| 14 | A block-term decomposition splits a multiway signal into blocks with low-rank factors per mode | De_Lathauwer_2008 | 1.2 | VERIFIED | abstract only |
| 15 | Block-term structure has compressed weight matrices, and those networks are explained with Grad-CAM maps instead of through their factors | arxiv_2010_04963 | 1.2 | VERIFIED | abstract section and section 4.4.7 of the arXiv text |
| 16 | Block-term tensor regression, designed for interpretability, predicted finger movements | Faes_2024 | 1.2 | VERIFIED | abstract and section II |
| 17 | Clinical risk factors complement the ECG | Khurshid_2022 | 1.2 | VERIFIED | abstract only |
| 18 | A third of a sample of 700 AF-labelled ECGs of MIMIC-IV did not show AF on expert review | Valasakis_2026 | 1.3 | VERIFIED | abstract only |
| 19 | A CNN developed on 649,931 sinus-rhythm ECGs of 180,922 Mayo Clinic patients, 454,789 in training, identified AF with AUC 0.87, counting prior AF as positive | Attia_2019 | 2.1 | VERIFIED | abstract only |
| 20 | A network for AF within 31 days reached AUROC 0.86 on held-out VA ECGs and 0.93 at a non-VA site | Yuan_2023 | 2.1 | VERIFIED | abstract only |
| 21 | Models with 31-day confirmation windows had higher median AUCs than models with 1-year windows | Tsiartas_2025 | 2.1 | VERIFIED | Results |
| 22 | A narrative review found AI more accurate at shorter event horizons | Saiz_Vivo_2025 | 2.1 | VERIFIED | abstract only |
| 23 | Raghunath et al. reached AUROC 0.85 for new-onset AF within one year on ECGs from 430,000 patients | Raghunath_2021 | 2.1 | VERIFIED | abstract only; first author and "et al." agree with the entry (22 authors) |
| 24 | A Montreal cardiac-centre model reached 0.78 at five years and 0.77 on external validation in MIMIC-IV; the abstract does not state the MIMIC-IV label source | Jabbour_2024 | 2.1 | VERIFIED | abstract only; the abstract, read whole, names no label source for the validation |
| 25 | On the hospital behind MIMIC-IV a CNN with a discrete-time survival loss reached C-index 0.750 | Sau_2026 | 2.1 | VERIFIED | abstract only; the hospital is BIDMC, the source of MIMIC-IV (row 73) |
| 26 | An ECG-image model on the same hospital reached C-statistic 0.754 | Zeidaabadi_2026 | 2.1 | VERIFIED | abstract only |
| 27 | In Brazilian telehealth data a residual CNN with survival analysis reached AUC 0.845 | Habineza_2023 | 2.1 | VERIFIED | abstract only |
| 28 | That data is in the data family of an earlier 12-lead diagnostic network | Ribeiro_2020 | 2.1 | VERIFIED | abstract section of the full text |
| 29 | A gradient-boosting survival model of 417 ECG features reached C-index 0.781, mean follow-up 80 days | Riek_2026 | 2.1 | VERIFIED | abstract only |
| 30 | Saliency gave the P-wave the greatest influence in one ECG network | Khurshid_2022 | 2.1 | VERIFIED | abstract only |
| 31 | Saliency of the image model focused on P-wave morphology and the PR interval | Zeidaabadi_2026 | 2.1 | VERIFIED | abstract only |
| 32 | The feature-based model named lower P-wave amplitude among its predictors | Riek_2026 | 2.1 | VERIFIED | abstract only |
| 33 | The Framingham score used age, sex, murmur, heart failure, SBP, hypertension treatment, BMI and PR interval, C statistic 0.78, 10-year AF | Schnabel_2009 | 2.2 | VERIFIED | abstract only |
| 34 | CHARGE-AF reached 0.765 at derivation and 0.664 and 0.705 in validation; ECG variables did not improve discrimination | Alonso_2013 | 2.2 | VERIFIED | abstract only |
| 35 | In Framingham each 20 ms of PR interval carried an adjusted HR of 1.12 for AF | Cheng_2009 | 2.2 | VERIFIED | abstract only |
| 36 | Across Framingham and ARIC, P-wave duration above 120 ms had HR 1.55; P-wave indices added little discrimination | Magnani_2015 | 2.2 | VERIFIED | abstract only |
| 37 | AUROC comparable for CHARGE-AF and an ECG network in three test sets, highest combined at 0.838, 0.777 and 0.746 | Khurshid_2022 | 2.2 | VERIFIED | abstract only |
| 38 | In an older community cohort AI-ECG and CHARGE-AF both had C 0.69, predicted AF independently, 0.72 together | Christopoulos_2020 | 2.2 | VERIFIED | abstract only |
| 39 | A single-lead ECG model with age and sex had AUROC 0.695 against 0.679 for CHARGE-AF in trial data | Khurshid_2025 | 2.2 | VERIFIED | abstract of the full text (Article in Press, C2) |
| 40 | A random forest combining demographic, clinical, engineered and deep ECG features reached 0.909 against 0.839 for the best single modality | Biton_2021 | 2.2 | VERIFIED | abstract only |
| 41 | In 2,301 Montreal patients the ECG model exceeded CHARGE-AF (0.62) and a polygenic score (0.59) | Jabbour_2024 | 2.2 | VERIFIED | abstract only |
| 42 | An image-based ECG model reached 0.696 against 0.667 for CHARGE-AF, 0.711 combined | Zeidaabadi_2026 | 2.2 | VERIFIED | abstract only |
| 43 | An ECG model led in hospital patients; CHARGE-AF was the best single predictor in UK Biobank | Sau_2026 | 2.2 | VERIFIED | abstract only |
| 44 | Parameter and label randomisation showed some saliency methods independent of model and data-generating process | arxiv_1810_03292 | 2.3 | VERIFIED | abstract section and section 1 |
| 45 | Under remove-and-retrain only VarGrad and SmoothGrad-Squared beat a random assignment of importance | arxiv_1806_10758 | 2.3 | VERIFIED | abstract section and section 1 |
| 46 | Twelve ECG attribution methods agreed poorly; self-consistency moderate for most methods, mean correlations 0.41 to 0.65 | Arends_2026 | 2.3 | VERIFIED | abstract only |
| 47 | Dataset-level auditing with sanity checks aligned saliency with cardiologists' rules and supported knowledge discovery (subtypes of MI) | Wagner_2024 | 2.3 | VERIFIED | abstract only |
| 48 | Concept bottleneck models predict concepts, then the label, at competitive accuracy; correcting concepts at test time raised accuracy | arxiv_2007_04612 | 2.3 | VERIFIED | abstract section |
| 49 | Concept representations encode information beyond the named concepts, making the downstream reading misleading | arxiv_2106_13314 | 2.3 | VERIFIED | abstract section |
| 50 | B-cos networks summarise the full computation as one linear transform at similar ImageNet accuracy | arxiv_2205_10268 | 2.3 | VERIFIED | abstract section |
| 51 | An anti-aliased B-cos variant gave artifact-free explanations on chest x-rays and kept its performance | arxiv_2507_16761 | 2.3 | VERIFIED | abstract section |
| 52 | Tensor-network structure combined with deep networks gave weight-based interpretability at equal accuracy, in preliminary results | arxiv_2504_02667 | 2.3 | VERIFIED | abstract section and section 1 |
| 53 | A study of VAE representations of interpretable ECG features reported a cost of intrinsic explainability | Patlatzoglou_2025 | 2.3 | VERIFIED | abstract section |
| 54 | A block-term discriminant method reported no cost on EEG decoding, mean accuracy 64.52% against 61.00% for HODA on motor imagery | arxiv_2511_04292 | 2.3 | VERIFIED | abstract section and motor imagery results |
| 55 | Image networks interpretable by design kept their accuracy (B-cos) | arxiv_2205_10268 | 2.3 | VERIFIED | abstract section |
| 56 | Image networks interpretable by design kept their accuracy (anti-aliased B-cos) | arxiv_2507_16761 | 2.3 | VERIFIED | abstract section |
| 57 | A block-term decomposition is a sum of blocks of low multilinear rank and contains CP and Tucker as special cases | De_Lathauwer_2008 | 2.4 | VERIFIED | abstract only |
| 58 | A survey covers the CP and Tucker decompositions | Kolda_2009 | 2.4 | VERIFIED | abstract only |
| 59 | Block-term tensor neural networks compress the weight matrices of CNNs and RNNs and are explained with Grad-CAM maps | arxiv_2010_04963 | 2.4 | VERIFIED | abstract section and section 4.4.7 of the arXiv text |
| 60 | On AF ECGs a regularised BTD extracted signals interpretable as AF patterns; it separates sources and does not predict risk | Goulart_2020 | 2.4 | VERIFIED | abstract only |
| 61 | BTTR predicted finger trajectories from intracranial recordings with automatic component extraction | Faes_2024 | 2.4 | VERIFIED | abstract |
| 62 | A block-term discriminant analysis gave interpretable, efficient dimensionality reduction for BCI, ROC-AUC 91.25% on ERPs | arxiv_2511_04292 | 2.4 | VERIFIED | abstract section |
| 63 | Linear BTTR has been applied to identification of AF in sinus rhythm on the median beat | https://doi.org/10.5281/zenodo.22227432 | 2.4 | VERIFIED | abstract only; near listed claim (c) (C4) |
| 64 | Each index ECG is a 10-second, 12-lead recording sampled at 500 Hz | https://doi.org/10.13026/4nqg-sb35 | 3.1 | VERIFIED | abstract only (data set description) |
| 65 | The projection reduces the modes to the mode-n ranks by which a block term is characterised | De_Lathauwer_2008 | 3.1 | VERIFIED | abstract only |
| 66 | BTTR fits blocks one at a time by deflation, keeps a score vector per block and predicts with a linear score | Faes_2024 | 3.1 | VERIFIED | sections II and III.B |
| 67 | BTTR splits the input into blocks with factor matrices, a core and a score vector, fitted by deflation, linear score | Faes_2024 | 3.1, figure caption | VERIFIED | section III.B |
| 68 | BTTN is trained with the negative Cox partial log-likelihood | Cox_1972 | 3.2 | VERIFIED | abstract only; the source names the likelihood "conditional", the function now called the partial likelihood |
| 69 | DeepSurv trains a neural network with the Cox partial likelihood | Katzman_2018 | 3.2 | VERIFIED | Methods, DeepSurv |
| 70 | Age is the anchor age of MIMIC-IV | Johnson_2023 | 3.3 | VERIFIED | section on the patients table |
| 71 | Whether the nonlinear head uses the factors as a reader would assume is a separate question | arxiv_2106_13314 | 3.3 | VERIFIED | abstract section |
| 72 | MIMIC-IV-ECG holds about 800,000 ECGs from nearly 160,000 patients | https://doi.org/10.13026/4nqg-sb35 | 4.1 | VERIFIED | abstract only |
| 73 | MIMIC-IV is drawn from the electronic health record of BIDMC | Johnson_2023 | 4.1 | VERIFIED | abstract section of the full text |
| 74 | A coded flutter diagnosis did not reliably separate flutter from AF in a registry validation | Rix_2012 | 4.1 | VERIFIED | abstract only |
| 75 | Only 65.4% of 700 AF-labelled ECGs in MIMIC-IV showed AF on expert review | Valasakis_2026 | 4.1 | VERIFIED | abstract only |
| 76 | Linear BTTR is the method of the baseline | Faes_2024 | 4.2 | VERIFIED | section III.B |
| 77 | Decision curves | Vickers_2006 | 4.2 | VERIFIED | abstract only |
| 78 | The study is reported with reference to TRIPOD+AI | Collins_2024 | 4.2 | VERIFIED | abstract section of the full text |
| 79 | Occlusion sensitivity covers part of the input and records the change in the output | Zeiler_2014 | 4.3 | VERIFIED | section 4.2, Occlusion Sensitivity |
| 80 | Occlusion is one of the perturbation-based explanation methods | Ivanovs_2021 | 4.3 | VERIFIED | abstract only; occlusion as row 79 defines it fits the abstract's definition of the class |
| 81 | The replacement value and the window size shape an occlusion map | arxiv_1702_04595 | 4.3 | VERIFIED | sections 2 and 4 |
| 82 | The perturbation method and the region size shape the evaluation of attributions on time series | _imi__2025 | 4.3 | VERIFIED | abstract only |
| 83 | On the hospital behind MIMIC-IV a survival-loss CNN reached C 0.750 | Sau_2026 | 6.1 | VERIFIED | abstract only |
| 84 | An image-based model there reached 0.754 | Zeidaabadi_2026 | 6.1 | VERIFIED | abstract only |
| 85 | A Montreal model reached AUROC 0.77 on external validation in MIMIC-IV, with a label source its abstract does not state | Jabbour_2024 | 6.1 | VERIFIED | abstract only |
| 86 | An AUROC of 0.85 at one year was reported | Raghunath_2021 | 6.1 | VERIFIED | abstract only |
| 87 | A C-index of 0.781 over a short follow-up was reported | Riek_2026 | 6.1 | VERIFIED | abstract only |
| 88 | A systematic review shows how far outcome choices move reported values | Tsiartas_2025 | 6.1 | VERIFIED | Results |
| 89 | Identification studies address another task (Mayo Clinic) | Attia_2019 | 6.1 | VERIFIED | abstract only |
| 90 | Identification studies address another task (VA, AF within 31 days) | Yuan_2023 | 6.1 | VERIFIED | abstract only |
| 91 | A foundation model reported an AUROC of 0.996 for the AF label of multi-label ECG interpretation, and its authors released an open benchmark on MIMIC-IV-ECG | McKeen_2025 | 6.1 | VERIFIED | abstract only; sub-claim "foundation model": supported; "AUROC of 0.996 for the AF label": supported; "of multi-label ECG interpretation": supported, since the abstract names two downstream tasks, multi-label ECG interpretation and LVEF prediction, and AF is not the LVEF label; "released an open benchmark on MIMIC-IV-ECG": supported. The sentence no longer names the data set of the 0.996 |
| 92 | ECG and clinical information are complementary | Khurshid_2022 | 6.1 | VERIFIED | abstract only |
| 93 | ECG and clinical information are complementary | Christopoulos_2020 | 6.1 | VERIFIED | abstract only |
| 94 | An externally validated model flagged 9.7% of older patients, sensitivity 31%, specificity 92%, chart-confirmed endpoints | Pfeifer_2026 | 6.1 | VERIFIED | abstract only |
| 95 | A reported accuracy cost of intrinsic interpretability on the ECG | Patlatzoglou_2025 | 6.1 | VERIFIED | abstract section |
| 96 | Concept representations absorb information beyond their concepts | arxiv_2106_13314 | 6.2 | VERIFIED | abstract section and section 3 |
| 97 | Saliency pointed to the P-wave | Khurshid_2022 | 6.2 | VERIFIED | abstract only |
| 98 | Saliency pointed to P-wave morphology and the PR interval | Zeidaabadi_2026 | 6.2 | VERIFIED | abstract only |
| 99 | In Framingham the PR interval was a predictor in the AF risk score | Schnabel_2009 | 6.2 | VERIFIED | abstract only |
| 100 | First-degree AV block carried an adjusted HR of 2.06 | Cheng_2009 | 6.2 | VERIFIED | abstract only |
| 101 | Each SD of PR interval carried HR 1.13 in older Black and White adults | Magnani_2013 | 6.2 | VERIFIED | abstract only |
| 102 | First-degree block carried HR 1.75 in an older Japanese population | Tanaka_2021 | 6.2 | VERIFIED | abstract only |
| 103 | In the Jackson Heart Study PR interval, P-wave duration and P-wave terminal force were each associated with AF | Yogeswaran_2025 | 6.2 | VERIFIED | abstract only |
| 104 | P-wave indices show the same direction (two-cohort study) | Magnani_2015 | 6.2 | VERIFIED | abstract only |
| 105 | P-wave indices show the same direction, in a meta-analysis of very low certainty in selected populations | Emmanuela_2026 | 6.2 | VERIFIED | abstract and limitations of the full text |
| 106 | In 70-year-old Swedes the PR interval in V1 was not related to AF; a short P-wave duration was | Ostrowska_2022 | 6.2 | VERIFIED | summary of the full text |
| 107 | An expert consensus defines atrial cardiomyopathy as structural, architectural, contractile or electrophysiological atrial changes that can produce clinically relevant manifestations, among them arrhythmia | Goette_2016 | 6.2 | VERIFIED | text returned as the abstract file: introduction and section 1.1 |
| 108 | In a Japanese community cohort prolonged P-wave duration was associated with incident AF and more left atrial fibrosis at autopsy | Maezono_2025 | 6.2 | VERIFIED | abstract only |
| 109 | A meta-analysis of 24 studies pooled PPV 88% and sensitivity 80% for administrative AF definitions | Yao_2019 | 6.3 | VERIFIED | abstract only |
| 110 | A discharge diagnosis found 73.7% of record-verified AF, PPV 88.5% | Malmo_2016 | 6.3 | VERIFIED | abstract only |
| 111 | A registry found PPV 92.6% for combined AF or flutter | Rix_2012 | 6.3 | VERIFIED | abstract only |
| 112 | The anchor age of MIMIC-IV is not the age at the index ECG | Johnson_2023 | 6.3 | VERIFIED | section on the patients table |
| 113 | The clinical factors omit Framingham variables: SBP, hypertension treatment, BMI, heart failure | Schnabel_2009 | 6.3 | VERIFIED | abstract only |
| 114 | The PR interval is a known AF predictor | Cheng_2009 | 6.3 | VERIFIED | abstract only |
| 115 | The PR interval is a known AF predictor | Magnani_2013 | 6.3 | VERIFIED | abstract only |
| 116 | The readout is open to the critiques of post-hoc attribution (randomisation tests) | arxiv_1810_03292 | 6.3 | VERIFIED | abstract section |
| 117 | The same, remove-and-retrain | arxiv_1806_10758 | 6.3 | VERIFIED | section 1 |
| 118 | The same, ECG attribution methods | Arends_2026 | 6.3 | VERIFIED | abstract only |
| 119 | Zero replacement and window size shape the profile, as replacement value and window size shape an occlusion map | arxiv_1702_04595 | 6.3 | VERIFIED | section 4 |
| 120 | The perturbation method and region size shape the evaluation of attributions on time series | _imi__2025 | 6.3 | VERIFIED | abstract only |
| 121 | Readable factors do not by themselves show that a nonlinear head routes its decision through them | arxiv_2106_13314 | 6.3 | VERIFIED | abstract section |
| 122 | A test of the factors would use control probes and the removal of top-ranked against bottom-ranked parts, in the manner of remove-and-retrain | arxiv_1806_10758 | 6.4 | VERIFIED | sections 1 and 4 and appendix (KAR) |
| 123 | External validation would be reported with reference to TRIPOD+AI | Collins_2024 | 6.4 | VERIFIED | abstract section of the full text |
| 124 | Cohort studies of the PR interval tie that part of the cardiac cycle to later AF | Cheng_2009 | 7 | VERIFIED | abstract only |
| 125 | The same claim, second citation | Magnani_2013 | 7 | VERIFIED | abstract only |
| 126 | The data come from MIMIC-IV-ECG on PhysioNet | https://doi.org/10.13026/4nqg-sb35 | Data availability | VERIFIED | identification of the data set; the access terms are the authors' statement |
| 127 | The data come from the hospital module of MIMIC-IV, available from PhysioNet | Johnson_2023 | Data availability | VERIFIED | section on access to the database |

Clinical checks (the Discipline row names a clinical field, and cited sentences concern patients). Reference existence: passed for every cited work. Claim anchor: passed for all 127 citations. Population match: passed; rows 1, 18 and 38 keep the source's population (asymptomatic AF, a sample of 700 ECGs, an older community cohort), and rows 2 and 3 now each name the Framingham Heart Study without joining their two samples. Outcome match: passed; row 19 states the training count the source gives, row 54 names mean accuracy, rows 8 and 21 keep the confirmation windows, and row 91 keeps the AF label of the interpretation task. Strength of conclusion: passed; the text keeps "associated", "hypothesis" and "no interval for the difference yet establishes it". Clinical boundary: passed; the text frames its results as research and names validation outside one health system as one of "the next requirements before any clinical use" (Conclusion, last paragraph).

This is research, evidence synthesis, or documentation support only. It is not patient-specific diagnosis, treatment, triage, or clinical decision support.

### Corrections made
None. Every format check of "Both ways", "The `.bib` entries" and "DOI and URL" passes on the cited entries, or fails in a way that no record read in this run settles, or that has two readings (C20 to C25). No patch is written.

Checks run on refs.bib in this start: `grep -c 'dx.doi.org'` printed 0; `grep -c -i -E 'doi *= *\{(https?:|doi:)'` printed 0; `grep -c -E '(doi|url) *= *\{[^}]*\.\}'` printed 0; 67 of the 68 entries hold a `doi` field, and the one without, arxiv_2005_13249, is unused; no two entries share a DOI or an eprint (`uniq -d` over both printed nothing). The entry types are 53 `@article`, 11 `@webpage`, 3 `@misc` and 1 `@inbook`. In the entries that patch 19 rewrote, the only characters outside ASCII are the "<latin small letter o with diaeresis>" of B<latin small letter o with diaeresis>hle and the "<latin small letter c with cedilla>" of Cabestaing, and `utf8enc.dfu` of the installed TeX Live 2025 declares both (`grep -c -E 'DeclareUnicodeCharacter\{00(F6|E7)\}'` printed 2). The Valasakis_2026 issue now reads `number={Suppl 1}`, the form of the record's `Supplement_1` (lookup.py bibtex). `FUNCTION {webpage}` of the installed vancouver.bst prints the author list, the title, the `type` in brackets, the `publisher` and the year, then the `url`; the bst sets `adddoiresolver` to 0, so no entry type prints its `doi` field.

### Items flagged for review

#### Quotations
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C1 | main.tex, 1.2, first sentence (Kashou_2021) | MINOR. The sentence quotes the commentary's subtitle with a plain `\cite`. The quoted words are a title, which every record of the work holds, so the page rule has two readings. | Author's choice: keep `\cite{Kashou_2021}`, or write `\cite[p.~1770]{Kashou_2021}` (the first page the entry gives) if the venue asks for a page with every quotation. |

#### Versions of one work
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C2 | refs.bib, Khurshid_2025 and Faes_2024; main.tex 2.2 (row 39), and 1.2, 2.4, 3.1, the figure caption and 4.2 (rows 16, 61, 66, 67, 76) | MEDIUM. Each entry names the published article. Khurshid_2025 was read in the journal's unedited Article in Press PDF under the same DOI, whose first page says "Before final publication, the manuscript will undergo further editing"; row 39 rests on two numbers of its abstract. Faes_2024 was read in an author copy without the journal's layout, whose title capitalisation differs from the published title; its rows rest on the method's definition (deflation, score vectors, the linear prediction equation). The published versions were not read in this run. | needs the user (as D5-8 of `revision-log-5.md` records): confirm the AUROCs 0.695 and 0.679 in the published Khurshid_2025 and the BTTR definition in the published Faes_2024, or cite the version read. Rudin_2019 was read in arXiv 1811.10154v3 and its claim is the journal article's title, so it is the same in both versions. The arXiv entries are each cited in the arXiv version their passages were read in. |

#### Claims the paper must not make (Claims not to make (a) to (f))
Every sentence of main.tex was read against (a) to (f). No sentence states a listed claim. Two sentences come near one, and config.md Decisions holds a ruling on each. Listed claim (f) concerns the study's own numbers against the gold-label result files, which are not inputs of this check.
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C3 | main.tex, 4.1 Cohort and labels, second paragraph, second sentence, and 5.1, the caption of the cohort table and its row "Prevalent or concurrent AF" (14,469) | MEDIUM, near (a). The exclusion counts patients excluded for an AF diagnosis or "an ECG read as AF", a read of the machine ECG reports. The caption now states the criterion and that "the count is not an outcome". | Ruled in config.md Decisions (C5 of the previous report): kept as the exclusion count of the gold-label cohort, with the criterion stated, which the D5-3 caption does. No action. |
| C4 | main.tex, 2.4, second paragraph (https://doi.org/10.5281/zenodo.22227432), row 63 | MEDIUM, near (c). "Linear BTTR has also been applied to the identification of AF in sinus rhythm on the median beat". The cited record is the PTB-XL AF-in-sinus-rhythm study; the sentence states no result of it. | Ruled in config.md Decisions (C4 of an earlier report): kept, since the sentence states no result. No action. |

#### Claims against the list (intended-claims.md)
Each entry says only that the draft's text and its list differ; a claim the list does not hold may still be right.
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C5 | main.tex, 2.2, first paragraph | MEDIUM, not on the list: the discrimination of the clinical scores, "with a C statistic of 0.78", "CHARGE-AF reached 0.765 at derivation and 0.664 and 0.705 in two validation cohorts", "P-wave indices added little discrimination beyond traditional risk factors". | Add the claim to the list, or confirm it is meant. |
| C6 | main.tex, 2.2, third paragraph | MEDIUM, not on the list: "Other studies found the ECG model ahead of the clinical score." and "The ranking of ECG and clinical models also depends on the cohort." | Add the claim to the list, or confirm it is meant. |
| C7 | main.tex, 2.1, third paragraph | MEDIUM, not on the list: "To our knowledge, none of these reports includes a test of whether the explanation reflects what the model uses to predict." The three sources were read as abstracts only. | Add the claim to the list, or confirm it is meant. |
| C8 | main.tex, 2.3, third paragraph | MEDIUM, not on the list: "To our knowledge, no study in this literature compares an intrinsically interpretable model with a CNN on incident AF under one protocol." | Add the claim to the list, or confirm it is meant. |
| C9 | main.tex, 5.1 Study cohort, first paragraph | MEDIUM, not on the list: the cohort results (151,941 eligible patients, 8,775 events of the survival design, events by 1, 2 and 5 years, the follow-up of controls, the 40,960 controls with a later ECG). | Add the claim to the list, or confirm it is meant. |
| C10 | main.tex, 5.2, second paragraph, last two sentences | MEDIUM, not on the list: "One reason for the lower one-year values of the survival design is its control group." | Add the claim to the list, or confirm it is meant. |
| C11 | main.tex, 5.3, third paragraph | MEDIUM, not on the list: the decision-curve result ("All three models had a net benefit above both treating all and treating none at threshold probabilities from about 0.04 to about 0.1", the fused model's curve "above the other two between about 0.03 and 0.12"). | Add the claim to the list, or confirm it is meant. |
| C12 | main.tex, 6.1, third paragraph, last sentence | MEDIUM, not on the list: "The CNN has three convolutional layers, so the result says nothing about parity with the large networks of published work." | Add the claim to the list, or confirm it is meant. |
| C13 | main.tex, 6.2, first paragraph, fourth sentence | MEDIUM, not on the list: "The fused model is trained as one network, so its factors are fitted beside the clinical term and may differ from those of ECG-only BTTN." | Add the claim to the list, or confirm it is meant. |
| C14 | main.tex, 6.3, third paragraph | MEDIUM, not on the list: "This proportion exceeds the one-year rate of the survival cohort, 1,855 in 50,545, whose one-year negatives include the patients with onset after one year. The PPVs of Table~\ref{tab:operating} are therefore upper values for that population." | Add the claim to the list, or confirm it is meant. |
| C15 | main.tex, 5.2, first paragraph, third sentence (text of the D5-6 and D6-3 revisions), and 7, third paragraph, first three sentences | MEDIUM, not on the list: the fused model above ECG-only BTTN at one year. 5.2: "It also lay above the interval of ECG-only BTTN, 0.7397 [0.7275, 0.7517], so the fused model discriminated better than ECG-only BTTN." 7: "the results suggest that a clinical term kept outside the block-term factors adds to the discrimination of the ECG term" and "These two intervals do not overlap, although the study reports no paired interval for this difference." | Add the claim to the list, or confirm it is meant. |
| C16 | intended-claims.md, item 2 | MEDIUM, intended, not made as listed: "The 2024 ESC guideline states that the clinical performance and broad applicability of AI solutions for AF are not yet known." The text (1.2) states it of algorithms for automated AF diagnosis, the narrower claim section 10.2 of the guideline holds (row 11). | Confirm the narrower claim of the text; the list item claims more than the source holds. |
| C17 | intended-claims.md, item 11 | MEDIUM, intended, not made: "In the one-year design both ECG-only models had lower AUROCs than the clinical model." No sentence of the text states it (`grep -o 'lower\|below'` on main.tex finds the word only in other comparisons, lines 67, 69, 211, 215 and 284). | Confirm the claim is dropped. |
| C18 | intended-claims.md, item 14 | MEDIUM, intended, not made as listed: "the fused model had higher sensitivity and higher positive predictive value at the cohort incidence than the clinical model". The text (5.3, 4.2 and 6.3) states the PPV at the proportion of cases in the one-year design, 1,855 in 43,625, and says this proportion exceeds the one-year rate of the survival cohort; no sentence states a PPV at the cohort incidence. | Confirm the claim of the text. |
| C19 | intended-claims.md, item 25 | MEDIUM, intended, not made as listed: "The clinical comparator uses a subset of the CHARGE-AF factors and omits the PR interval, a known AF predictor." The text (6.3, second paragraph) compares the clinical factors with the Framingham score, not CHARGE-AF; the PR-interval half is made. | Confirm which score the comparison names. |

#### The .bib entries
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C20 | refs.bib, Cheng_2009 | MEDIUM, omitted co-authors: `author={Cheng, Susan}` copies the Crossref record, which lists one author; `lookup.py bibtex '10.1001/jama.2009.888'` returns the same one-author record with `pages={2571}`; OpenAlex prints "Susan C. Cheng, Michelle J Keyes, Martin G Larson et al." and Semantic Scholar "Susan Cheng, M. Keyes, M. Larson et al.". `resolve` prints three names only, so no record read in this run gives the whole list. `pages={2571}` gives the first page only. | needs the user (config.md Decisions, C17 of an earlier report): the author list and the last page from the article's byline. No patch until a record gives them. |
| C21 | refs.bib, incomplete entries | MINOR, incomplete: no `pages` field in Christopoulos_2020, Khurshid_2025, Saiz_Vivo_2025, Riek_2026, Alonso_2013, Arends_2026, Patlatzoglou_2025, Johnson_2023, Ribeiro_2020, Valasakis_2026, Katzman_2018, McKeen_2025, Maezono_2025, Yogeswaran_2025 and _imi__2025 (most are article-number journals); the first page only in Cheng_2009 (2571), Yuan_2023 (1131) and Malmo_2016 (185); no `volume` in Riek_2026 and Malmo_2016. `lookup.py bibtex` for Valasakis_2026, Yuan_2023, Riek_2026 and Malmo_2016 returns no further page or volume field. Valasakis_2026 now prints "2026 Oct;47(Suppl 1)." with no article identifier. The full texts read in this run print four article numbers: Ribeiro_2020 "NATURE COMMUNICATIONS \| (2020)11:1760", Patlatzoglou_2025 "npj Digital Medicine \| (2025)8:747", Johnson_2023 "Scientific Data \| (2023) 10:1", Katzman_2018 "BMC Medical Research Methodology (2018) 18:24". | Add the article number or the page range of each article: for the four above, `pages={1760}`, `pages={747}`, `pages={1}` and `pages={24}`; for Valasakis_2026 the abstract's identifier from the supplement. No patch, since the page rule flags an incomplete entry and no index record gives these fields. |
| C22 | refs.bib, Zeiler_2014 | MINOR: the entry is `@inbook` with a `booktitle` field. `FUNCTION {inbook}` of the installed vancouver.bst asks for a `chapter` and prints `title` as the book's title, and it reads no `booktitle`, so the reference list loses "Computer Vision - ECCV 2014" and BibTeX warns of an empty chapter. `@incollection` and `@inproceedings` both print `title` as the paper's title and `booktitle` after "In:". | Author's choice of type; `@inproceedings` with the same fields is the usual form for an ECCV paper. No patch, since there are two readings. |
| C23 | refs.bib and main.tex, keys | MINOR: two cited keys are URLs (`https://doi.org/10.5281/zenodo.22227432`, `https://doi.org/10.13026/4nqg-sb35`) and one is garbled from a name with diacritics (`_imi__2025`, Simic). They resolve and compile, but they break the Surname_Year form of the other keys. | Author's choice of names, for example Cornelissen_2026, Gow_2023 and Simic_2025, with each `\cite` rewritten. No patch, since the names are a choice. |
| C24 | refs.bib, https://doi.org/10.13026/4nqg-sb35 and https://doi.org/10.5281/zenodo.22227432 | MINOR: vancouver.bst prints no `doi` field (`adddoiresolver` is 0) and prints the `url`. Every cited `@article` and the ten arXiv `@webpage` entries carry a doi.org link in `url`, so their printed reference shows the DOI. The MIMIC-IV-ECG entry prints the PhysioNet page `https://physionet.org/content/mimic-iv-ecg/1.0/` and the Zenodo entry `https://zenodo.org/doi/10.5281/zenodo.22227432`, so the printed MIMIC-IV-ECG reference carries no DOI. Both URLs are the ones the doi.org BibTeX records give, so the choice has two readings. | Author's choice: `url = {https://doi.org/10.13026/4nqg-sb35}` (and `https://doi.org/10.5281/zenodo.22227432`) to show the persistent identifier like the other references, or keep the landing pages. No patch. |

#### DOI and URL
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C25 | refs.bib, 26 cited entries | MINOR. `check-urls` (checks.md, "After the D6 patches") gives HTTP 403 for the doi.org link of Kashou_2021, Wolf_1991, Alonso_2013, Raghunath_2021, Khurshid_2022, Tsiartas_2025, Saiz_Vivo_2025, Van_Gelder_2024, Arends_2026, De_Lathauwer_2008, Valasakis_2026, Yuan_2023, Jabbour_2024, Cheng_2009, Christopoulos_2020, Biton_2021, Kolda_2009, Cox_1972, Rix_2012, Vickers_2006, Collins_2024, McKeen_2025, Magnani_2013, Yogeswaran_2025, Goette_2016 and Maezono_2025 (`grep -c ': 403 '` on that section printed 26). Each of these DOIs resolves in Crossref to the entry's title at ratio 1.00 (Lookups), so the identifier is correct and the 403 is the publisher's site answering the automated request. The other 38 lines are 200 or 202 (`grep -c -E ': 20[02] '` printed 38), and no line ends in DOI_MISMATCH or holds "title not checked", "no identifier", "failed" or "no entry" (`grep -c` printed 0). | No correction: the record confirms each DOI. The links can be opened in a browser to confirm they serve readers. |

#### The reference list as a whole
| # | Location | Issue | Suggested action |
|---|---|---|---|
| C26 | refs.bib, Rix_2012, Magnani_2013, Magnani_2015, Malmo_2016 | MINOR, currency: older than 10 years and not clearly seminal. Fifteen cited entries are older than 10 years (23.4 percent); the other eleven (Cox_1972, Wolf_1991, Vickers_2006, De_Lathauwer_2008, Cheng_2009, Kolda_2009, Schnabel_2009, Alonso_2013, Zeiler_2014, Schnabel_2015, Goette_2016) are the founding sources of the method, score, consensus or cohort result they are cited for. | Keep each where its cohort or validation result is needed; Yogeswaran_2025 and Tanaka_2021 carry the PR-interval association in newer cohorts, and Yao_2019 pools the validation studies of administrative AF definitions. |

Citation density: every paragraph of the body with no citation describes the method or the study's own analysis (Method 3.2, the Results, the first paragraph of 6.1, the calibration paragraph of 6.3, the first paragraph of the Conclusion). No sentence carries more than 3 citations (`grep -o '\\cite{[^}]*}'` on main.tex gives 120 cite commands holding 127 citations of 64 keys; no command holds four keys).

Names and years in sentences: "Raghunath et al." names the entry's first author of 22 (`grep -n -o 'et al'` on main.tex finds line 67 only); "Rudin argued" names the single author; "The 2024 guideline" agrees with Van_Gelder_2024. "In the Framingham Heart Study" (1.1, the D6-6 revision) names the study of Wolf_1991, which its abstract calls "the Framingham Study".

Predatory-venue screen: no venue a cited entry names shows a record sign (no over-broad name, the indexes spell each venue alike, no date after today, every DOI has the form 10.<digits>/<suffix>, no impossible volume). No venue is listed "not screened". Valasakis_2026 is a congress abstract in a European Heart Journal supplement. OpenAlex's venue field for arxiv_1702_04595 names an unrelated journal; the entry names arXiv and no journal, and Semantic Scholar gives ICLR.

Retractions: the check covers the notices Crossref lists, read from the `resolve` call on each DOI above; Crossref's record of a source can lack a notice a publisher has issued. No call printed a "Crossref notice" line, so no source has a retraction, partial retraction or expression-of-concern notice in Crossref. The ten arXiv entries and the Zenodo and PhysioNet records have no Crossref record.

Both ways: the `cite-keys` output the session gave (checks.md, "After the D6 patches") prints no missing key and four unused entries, listed and not removed: Wagner_2020, https://doi.org/10.5281/zenodo.4916206, Mehari_2022, arxiv_2005_13249.

Passages that repeat an earlier paper: none listed (Earlier papers: none), so nothing was compared. A plagiarism tool such as iThenticate, Turnitin or Copyscape can screen the text against the wider literature.

DOI checking is mark-only, so no DOI failure stops the run; no DOI failed `resolve`.

### Passage lines
Each group is headed by the number of its row in "Claims".

Row 1:
> [@Kashou_2021, abstract]: "the growing prevalence of atrial fibrillation (AF) is becoming a public health crisis"
> [@Kashou_2021, abstract]: "the first clinical presentation of those with asymptomatic AF may be an acute ischaemic stroke or decompensated heart failure"

Row 2:
> [@Wolf_1991, abstract]: "was examined in 5,070 participants in the Framingham Study after 34 years of follow-up"
> [@Wolf_1991, abstract]: "a near fivefold excess when atrial fibrillation was present"
> [@Wolf_1991, abstract]: "rising from 1.5% for those aged 50-59 years to 23.5% for those aged 80-89 years"

Row 3:
> [@Schnabel_2015, abstract]: "Framingham Heart Study participants (n=9511) from 1958 to 2007"
> [@Schnabel_2015, abstract]: "During 50 years of observation"
> [@Schnabel_2015, abstract]: "We observed about a fourfold increase in the age-adjusted prevalence and more than a tripling in age-adjusted incidence of atrial fibrillation"
> [@Schnabel_2015, abstract]: "observed trends of increased incidence of atrial fibrillation in the community were partially due to enhanced surveillance"

Row 4:
> [@Alonso_2013, abstract]: "A risk model including variables readily available in primary care settings adequately predicted AF in diverse populations from the United States and Europe."

Row 5:
> [@Kashou_2021, abstract]: "These approaches, however, require timeintensive data abstraction of multiple variables"
> [@Kashou_2021, abstract]: "In comparison, the model proposed in this current study could be applied to a single ECG at the point of care without additional data abstraction."

Row 6:
> [@Raghunath_2021, abstract]: "We used 1.6 M resting 12-lead digital ECG traces from 430 000 patients collected from 1984 to 2019."
> [@Raghunath_2021, abstract]: "were 0.85 and 0.22, respectively, for predicting new-onset AF within 1 year of an ECG."

Row 7:
> [@Khurshid_2022, abstract]: "in an internal test set and 2 external test sets"
> [@Khurshid_2022, abstract]: "Area under the receiver operating characteristic curve was highest using CH-AI"

Row 8:
> [@Tsiartas_2025, abstract section]: "Results 14 studies and 33 AI models were analysed."
> [@Tsiartas_2025, Results]: "The 33 included models yielded the following combined median (95% CI) performance"
> [@Tsiartas_2025, Results]: "and AUC 0.740 (0.630 to 0.830)"
> [@Tsiartas_2025, Results]: "0.851 vs 0.630; q<0.001; rb=0.80) compared with those where AF was confirmed after this period and within 1 year"
> [@Tsiartas_2025, abstract section]: "11 studies (78.6%) cited possible negative cases misclassification as a limitation"

Row 9:
> [@Kashou_2021, abstract]: "The current study by SanzGarcia and colleagues, represents an innovative approach to doing just that."

Row 10:
> [@Saiz_Vivo_2025, abstract]: "Issues such as algorithm interpretability, the requirement for extensive clinical validation, and integration into existing healthcare frameworks remain significant barriers."

Row 11:
> [@Van_Gelder_2024, section 10.2]: "Algorithms have been created to improve automated AF diagnosis and several algorithms to aid diagnostics are being investigated.1046 However, the clinical performance and broad applicability of these solutions are not yet known."

Row 12:
> [@Arends_2026, abstract]: "This study evaluates 12 attribution methods in DNN-based ECG classification."
> [@Arends_2026, abstract]: "Attribution methods demonstrated low correlation and high variability across inter-method comparisons."
> [@Arends_2026, abstract]: "Self-consistency across random model initializations was moderate for most methods"
> [@Arends_2026, abstract]: "Randomizing model weights led to rapid loss of correlation, although some methods did not converge to zero."

Row 13:
> [@Rudin_2019, abstract section]: "trying to explain black box models, rather than creating models that are interpretable in the first place, is likely to perpetuate bad practices and can potentially cause catastrophic harm to society."
> [@Rudin_2019, abstract section]: "to design models that are inherently interpretable."

Row 14:
> [@De_Lathauwer_2008, abstract]: "we decompose a given tensor block into blocks of smaller size, where the size is characterized by a set of mode-n ranks"

Row 15:
> [@arxiv_2010_04963, abstract section]: "approximate the weight matrices with the low-rank block-term tensors"
> [@arxiv_2010_04963, section 4.4.7]: "For explaining and interpreting the proposed architectures, we apply the Grad-CAM [34] visualization techniques to the proposed architectures."

Row 16:
> [@Faes_2024, section II]: "we include the proposed model into a deflation-based method for multiway regression, namely BTTR (Block Term Tensor Regression), for high flexibility and interpretability."
> [@Faes_2024, abstract section]: "we apply BTTR to accurately predict single finger movement trajectories from intracranial recordings in human subjects."

Row 17:
> [@Khurshid_2022, abstract]: "has similar predictive usefulness to a clinical risk factor model for incident AF and the approaches are complementary."

Row 18:
> [@Valasakis_2026, abstract]: "Over one-third of ECGs labelled as atrial fibrillation in this sample from MIMIC-IV do not show AF on expert review"
> [@Valasakis_2026, abstract]: "Of 700 ECGs labelled as atrial fibrillation, only 458 (65.4%) showed AF on expert review."

Row 19:
> [@Attia_2019, abstract]: "at the Mayo Clinic ECG laboratory"
> [@Attia_2019, abstract]: "We included 180 922 patients with 649 931 normal sinus rhythm ECGs for analysis: 454 789 ECGs recorded from 126 526 patients in the training dataset"
> [@Attia_2019, abstract]: "patients in the testing dataset had verified atrial fibrillation before the normal sinus rhythm ECG tested by the model."
> [@Attia_2019, abstract]: "A single AI-enabled ECG identified atrial fibrillation with an AUC of 0<middle dot>87"

Row 20:
> [@Yuan_2023, abstract]: "A deep learning model predicted the presence of AF within 31 days of a sinus rhythm ECG on held-out test ECGs at VA sites with an area under the receiver operating characteristic curve (AUROC) of 0.86"
> [@Yuan_2023, abstract]: "At the non-VA site, AUROC was 0.93"

Row 21:
> [@Tsiartas_2025, Results]: "models where confirmatory AF was captured within 31 days of"
> [@Tsiartas_2025, Results]: "0.851 vs 0.630; q<0.001; rb=0.80) compared with those where AF was confirmed after this period and within 1 year"

Row 22:
> [@Saiz_Vivo_2025, abstract]: "showed a higher accuracy in predicting AF from SR when the event horizon was shorter"

Row 23:
> [@Raghunath_2021, abstract]: "We used 1.6 M resting 12-lead digital ECG traces from 430 000 patients collected from 1984 to 2019."
> [@Raghunath_2021, abstract]: "were 0.85 and 0.22, respectively, for predicting new-onset AF within 1 year of an ECG."

Row 24:
> [@Jabbour_2024, abstract]: "This study introduces an ECG-AI model developed and tested at a tertiary cardiac centre"
> [@Jabbour_2024, abstract]: "The primary outcome was incident AF at 5 years."
> [@Jabbour_2024, abstract]: "the ECG-AI model showed an area under the receiver operating characteristic (AUC-ROC) curve of .78"
> [@Jabbour_2024, abstract]: "The ECG-AI model was externally validated in the Medical Information Mart for Intensive Care-IV (MIMIC-IV) hospital data set."
> [@Jabbour_2024, abstract]: "ECG-AI model performance remained consistent (AUC-ROC = .77)"

Row 25:
> [@Sau_2026, abstract]: "a convolutional neural network with a discrete-time survival loss function, was developed to predict incident AF. It was trained using a dataset of 1,163,401 ECGs from 189,539 patients from the Beth Israel Deaconess Medical Center (BIDMC)"
> [@Sau_2026, abstract]: "In the BIDMC cohort, AIRE-AF predicted incident atrial fibrillation with a C-index of 0.750"

Row 26:
> [@Zeidaabadi_2026, abstract]: "We used 1,163,401 ECGs from 189,539 patients in the Beth Israel Deaconess Medical Center (BIDMC) dataset"
> [@Zeidaabadi_2026, abstract]: "The model achieved C-statistics of 0.754"

Row 27:
> [@Habineza_2023, abstract]: "The cohort is a collection of ECG recordings and annotations by the Telehealth Network of Minas Gerais, in Brazil. A convolutional neural network based on a residual network architecture was implemented"
> [@Habineza_2023, abstract]: "The probabilities were used to develop a Cox proportional hazards model and a Kaplan-Meier model to carry out survival analysis."
> [@Habineza_2023, abstract]: "with an AUC score of 0.845"

Row 28:
> [@Ribeiro_2020, abstract section]: "Here we present a DNN model trained in a dataset with more than 2 million labeled exams analyzed by the Telehealth Network of Minas Gerais and collected under the scope of the CODE (Clinical Outcomes in Digital Electrocardiology) study."

Row 29:
> [@Riek_2026, abstract]: "From prior ECGs, we extracted 417 features and trained multiple survival models to predict incident AF."
> [@Riek_2026, abstract]: "average follow-up 80<plus-minus sign>100 days"
> [@Riek_2026, abstract]: "the gradient boosting survival model achieved highest performance (test C-index 0.781)"

Row 30:
> [@Khurshid_2022, abstract]: "In saliency analyses, the ECG P-wave had the greatest influence on AI model predictions."

Row 31:
> [@Zeidaabadi_2026, abstract]: "Saliency mapping indicated the model primarily focused on P-wave morphology and PR interval regions."

Row 32:
> [@Riek_2026, abstract]: "Predictors included older age, lower P wave amplitude, and increased heart rate variability."

Row 33:
> [@Schnabel_2009, abstract]: "Multivariable Cox regression related clinical variables to 10-year AF incidence (n=457)."
> [@Schnabel_2009, abstract]: "Age, sex, significant murmur, heart failure, systolic blood pressure, hypertension treatment, body mass index, and electrocardiographic PR interval were associated with incident AF (p<0.05; clinical model C statistic=0.78"

Row 34:
> [@Alonso_2013, abstract]: "statistic, 0.765; 95% CI, 0.748 to 0.781)"
> [@Alonso_2013, abstract]: "Addition of variables from the electrocardiogram did not improve the overall model discrimination"
> [@Alonso_2013, abstract]: "In the validation cohorts, discrimination was acceptable (AGES C"
> [@Alonso_2013, abstract]: "statistic, 0.664; 95% CI, 0.632 to 0.697 and RS C"
> [@Alonso_2013, abstract]: "statistic, 0.705; 95% CI, 0.664 to 0.747) and calibration was adequate."

Row 35:
> [@Cheng_2009, abstract]: "Prospective, community-based cohort in Framingham, MA."
> [@Cheng_2009, abstract]: "each 20-millisecond increment in PR was associated with an adjusted hazards ratio (HR) of 1.12"

Row 36:
> [@Magnani_2015, abstract]: "We examined PWI from the Framingham Heart Study (FHS) and Atherosclerosis Risk in Communities (ARIC) Study."
> [@Magnani_2015, abstract]: "In meta-analysis, P-wave duration >120 ms was significantly associated with AF (hazard ratio [HR] 1.55"
> [@Magnani_2015, abstract]: "PWI had a limited contribution towards predictive risk beyond traditional risk factors and markers."

Row 37:
> [@Khurshid_2022, abstract]: "Area under the receiver operating characteristic curve was comparable using CHARGE-AF"
> [@Khurshid_2022, abstract]: "Area under the receiver operating characteristic curve was highest using CH-AI (MGH, 0.838 [95% CI, 0.807 to 0.869]; BWH, 0.777 [95% CI, 0.766 to 0.788]; UK Biobank, 0.746 [95% CI, 0.716 to 0.776])."

Row 38:
> [@Christopoulos_2020, abstract]: "among participants in the population-based Mayo Clinic Study of Aging"
> [@Christopoulos_2020, abstract]: "A total of 1936 participants with median age 75.8"
> [@Christopoulos_2020, abstract]: "C statistics were 0.69 (95% CI, 0.66<en dash>0.72) for AI-ECG AF model output, 0.69 (95% CI, 0.66<en dash>0.71) for CHARGE-AF, and 0.72 (95% CI, 0.69<en dash>0.75) for combined AI-ECG and CHARGE-AF score."
> [@Christopoulos_2020, abstract]: "both the AI-ECG AF model output and CHARGE-AF score independently predicted incident AF."

Row 39:
> [@Khurshid_2025, abstract of the full text]: "ECG-AI with age/sex (1L ECG-AI AS) had comparable discrimination (area under the"
> [@Khurshid_2025, abstract of the full text]: "receiver operating characteristic curve [AUROC] 0.695[0.637-0.742]; average precision"
> [@Khurshid_2025, abstract of the full text]: "[AP] 0.060[0.050-0.078]) to CHARGE-AF (AUROC 0.679[0.623-0.730]"

Row 40:
> [@Biton_2021, abstract]: "We use features obtained from different modalities, namely demographics, clinical information, engineered features, and features from deep representation learning."
> [@Biton_2021, abstract]: "The best model performance on the test set was obtained for the model combining features from all modalities with an area under the receiver operating characteristic curve (AUROC) = 0.909 against the best single modality model which had an AUROC = 0.839."

Row 41:
> [@Jabbour_2024, abstract]: "In a subgroup analysis of 2301 patients, ECG-AI outperformed CHARGE-AF (AUC-ROC = .62) and PGS (AUC-ROC = .59)."

Row 42:
> [@Zeidaabadi_2026, abstract]: "Compared to the CHARGE-AF risk score, the AI-ECG model showed superior performance (c-statistic 0.696 vs 0.667, p<0.05) and provided significant additive value when combined (c-statistic 0.711, p<0.0001)."

Row 43:
> [@Sau_2026, abstract]: "AIRE-AF was superior to CHARGE-AF"
> [@Sau_2026, abstract]: "The single best performing single predictor in the volunteer population (UKB) was CHARGE-AF"

Row 44:
> [@arxiv_1810_03292, abstract section]: "Through extensive experiments we show that some existing saliency methods are independent both of the model and of the data generating process."
> [@arxiv_1810_03292, section 1]: "find, consistently, that some of the methods tested are independent of both the model parameters and the labeling of the data that the model was trained on."

Row 45:
> [@arxiv_1806_10758, abstract section]: "Only certain ensemble based approaches"
> [@arxiv_1806_10758, abstract section]: "outperform such a random assignment of importance."
> [@arxiv_1806_10758, section 1]: "The base methods we evaluate are no better or on par with a random estimate at finding the core set of informative features. However, we show that SmoothGrad-Squared (an unpublished variant of Classic SmoothGrad [35]) and Vargrad [3], methods which ensemble a set of estimates produced by basic methods, far outperform both the underlying method and a random guess."

Row 46:
> [@Arends_2026, abstract]: "Attribution methods demonstrated low correlation and high variability across inter-method comparisons."
> [@Arends_2026, abstract]: "Self-consistency across random model initializations was moderate for most methods (mean correlation 0.41<en dash>0.65)."

Row 47:
> [@Wagner_2024, abstract]: "We have established a set of sanity checks to identify saliency as the most sensible attribution method. We provide a dataset-wide analysis across entire patient subgroups"
> [@Wagner_2024, abstract]: "to establish the first quantitative evidence for the alignment of model behavior with cardiologists' decision rules"
> [@Wagner_2024, abstract]: "we demonstrate how these XAI techniques can be utilized for knowledge discovery, such as identifying subtypes of myocardial infarction"

Row 48:
> [@arxiv_2007_04612, abstract section]: "first predicting concepts that are provided at training time, and then using these concepts to predict"
> [@arxiv_2007_04612, abstract section]: "concept bottleneck models achieve competitive accuracy with standard end-to-end models"
> [@arxiv_2007_04612, abstract section]: "if we can correct model mistakes on concepts at test time."

Row 49:
> [@arxiv_2106_13314, abstract section]: "the concept representations learned by these models encode information beyond the pre-defined concepts, and that natural mitigation strategies do not fully work, rendering the interpretation of the downstream prediction misleading."

Row 50:
> [@arxiv_2205_10268, abstract section]: "a sequence (network) of such transforms induces a single linear transform that faithfully summarises the full model computations."
> [@arxiv_2205_10268, abstract section]: "whilst maintaining similar performance on ImageNet."

Row 51:
> [@arxiv_2507_16761, abstract section]: "In this work, we address this limitation by introducing anti-aliasing strategies using ASAP"
> [@arxiv_2507_16761, abstract section]: "preserve strong predictive performance while providing faithful and artifact-free explanations suitable for clinical application in multi-class and multi-label settings."

Row 52:
> [@arxiv_2504_02667, abstract section]: "combining the compositional multilinear structure of tensor networks with the expressivity and efficiency of deep neural networks."
> [@arxiv_2504_02667, abstract section]: "retain equal accuracy compared to their baseline counterparts"
> [@arxiv_2504_02667, abstract section]: "We leverage this toward formal weight-based interpretability and model compression."
> [@arxiv_2504_02667, section 1]: "This paper presents preliminary results on developing interpretable neural networks while retaining competitive accuracy."

Row 53:
> [@Patlatzoglou_2025, abstract section]: "we focus on explicit representation learning using variational autoencoders (VAE) to capture inherently interpretable ECG features."
> [@Patlatzoglou_2025, abstract section]: "demonstrate the cost introduced by intrinsic ECG interpretability"

Row 54:
> [@arxiv_2511_04292, abstract section]: "For MI, decoding results of HODA, BTTDA and PARAFACDA were subpar, but BTTDA still significantly outperformed HODA (64.52%>61.00%)."
> [@arxiv_2511_04292, motor imagery results]: "When considering grand average classification accuracies over all evaluated motor imagery datasets as reported in table 2,"
> [@arxiv_2511_04292, motor imagery results]: "the full BTTDA+LDA model (avg. accuracy: 64.52"
> [@arxiv_2511_04292, abstract section]: "enables interpretable and more efficient dimensionality reduction without compromising discriminative power."
> [@arxiv_2511_04292, abstract section]: "Extending Higher Order Discriminant Analysis (HODA)"

Row 55:
> [@arxiv_2205_10268, abstract section]: "whilst maintaining similar performance on ImageNet."

Row 56:
> [@arxiv_2507_16761, abstract section]: "preserve strong predictive performance while providing faithful and artifact-free explanations"

Row 57:
> [@De_Lathauwer_2008, abstract]: "where the size is characterized by a set of mode-n ranks"
> [@De_Lathauwer_2008, abstract]: "The parallel factor decomposition and Tucker's decomposition can be considered as special cases in the new framework."

Row 58:
> [@Kolda_2009, abstract]: "This survey provides an overview of higher-order tensor decompositions"
> [@Kolda_2009, abstract]: "CANDECOMP/PARAFAC (CP) decomposes a tensor as a sum of rank-one tensors, and the Tucker decomposition is a higher-order form of principal component analysis."

Row 59:
> [@arxiv_2010_04963, abstract section]: "approximate the weight matrices with the low-rank block-term tensors"
> [@arxiv_2010_04963, abstract section]: "BT-layers in CNNs and RNNs can achieve a very large compression ratio on the number of parameters"
> [@arxiv_2010_04963, section 4.4.7]: "For explaining and interpreting the proposed architectures, we apply the Grad-CAM [34] visualization techniques to the proposed architectures."

Row 60:
> [@Goulart_2020, abstract]: "blind source separation can be performed by computing an approximate block-term tensor decomposition (BTD)"
> [@Goulart_2020, abstract]: "a well-posed mixed-norm regularized tensor approximation problem"
> [@Goulart_2020, abstract]: "to extract multiple signals which can be physiologically interpreted as atrial fibrillation patterns."

Row 61:
> [@Faes_2024, abstract section]: "we apply BTTR to accurately predict single finger movement trajectories from intracranial recordings in human subjects."
> [@Faes_2024, abstract section]: "BTTR accounts for the underlying (hidden) data structure in a fully automatic and computationally-efficient manner"

Row 62:
> [@arxiv_2511_04292, abstract section]: "resulting in state-of-the art performance (ROC-AUC=91.25%)"
> [@arxiv_2511_04292, abstract section]: "enables interpretable and more efficient dimensionality reduction without compromising discriminative power."

Row 63:
> [@https://doi.org/10.5281/zenodo.22227432, abstract]: "On the public PTB-XL database we tensorize the multilead median beat into a samples-by-time-by-lead array and fit block-term tensor regression (BTTR)"

Row 64:
> [@https://doi.org/10.13026/4nqg-sb35, abstract]: "These diagnostic ECGs use 12 leads and are 10 seconds in length. They are sampled at 500 Hz."

Row 65:
> [@De_Lathauwer_2008, abstract]: "where the size is characterized by a set of mode-n ranks"

Row 66:
> [@Faes_2024, section II]: "This is followed by deflation before the next iteration starts."
> [@Faes_2024, section III.B]: "the kth loading matrix for the n-mode, uk and tk the score vectors, bk the regression coefficient"
> [@Faes_2024, section III.B]: "we can re-write the above as the well-known linear regression equation ytest = Xtest(1) bBTTR"

Row 67:
> [@Faes_2024, section III.B]: "the core tensor for the kth-block,"
> [@Faes_2024, section III.B]: "the kth loading matrix for the n-mode, uk and tk the score vectors, bk the regression coefficient"
> [@Faes_2024, section III.B]: "BTTR is a deflation-based method in which the maximally correlated representations of X and y are extracted via ACE/ACCoS at each iteration."
> [@Faes_2024, section III.B]: "well-known linear regression equation ytest = Xtest(1) bBTTR"

Row 68:
> [@Cox_1972, abstract]: "The hazard function (age-specific failure rate) is taken to be a function of the explanatory variables and unknown regression coefficients multiplied by an arbitrary and unknown function of time."
> [@Cox_1972, abstract]: "A conditional likelihood is obtained, leading to inferences about the unknown regression coefficients."

Row 69:
> [@Katzman_2018, Methods, DeepSurv]: "We train the network by setting the objective function to be the average negative log partial likelihood of Eq. 3 with regularization"

Row 70:
> [@Johnson_2023, section on the patients table]: "is provided in the anchor_age column"

Row 71:
> [@arxiv_2106_13314, abstract section]: "the concept representations learned by these models encode information beyond the pre-defined concepts"

Row 72:
> [@https://doi.org/10.13026/4nqg-sb35, abstract]: "The MIMIC-IV-ECG module contains approximately 800,000 diagnostic electrocardiograms across nearly 160,000 unique patients."

Row 73:
> [@Johnson_2023, abstract section]: "Here we present MIMIC-IV, a publicly available database sourced from the electronic health record of the Beth Israel Deaconess Medical Center."

Row 74:
> [@Rix_2012, abstract]: "recorded in the Danish National Patient Registry"
> [@Rix_2012, abstract]: "A specified diagnosis of AFL was rarely used and was not reliable to distinguish between cases of AF and AFL."

Row 75:
> [@Valasakis_2026, abstract]: "Of 700 ECGs labelled as atrial fibrillation, only 458 (65.4%) showed AF on expert review."

Row 76:
> [@Faes_2024, section III.B]: "We propose a novel Block-Term Regression (BTTR) model"

Row 77:
> [@Vickers_2006, abstract]: "The authors describe decision curve analysis, a simple, novel method of evaluating predictive models."

Row 78:
> [@Collins_2024, abstract section]: "TRIPOD+AI aims to promote the complete, accurate, and transparent reporting of studies that develop a prediction model or evaluate its performance."

Row 79:
> [@Zeiler_2014, section 4.2, Occlusion Sensitivity]: "Fig. 6 attempts to answer this question by systematically occluding"
> [@Zeiler_2014, section 4.2, Occlusion Sensitivity]: "portions of the input image with a grey square, and monitoring the"

Row 80:
> [@Ivanovs_2021, abstract]: "The present survey is concerned with perturbation-based XAI methods, which allow to explore DNN models by perturbing their input and observing changes in the output."

Row 81:
> [@arxiv_1702_04595, section 2]: "they estimate the importance of input pixels by visualizing the probability of the (correct) class as a function of a gray patch occluding parts of the image."
> [@arxiv_1702_04595, section 4]: "we replace a feature (patch) with samples taken directly from other images, at the same location."
> [@arxiv_1702_04595, section 4]: "We can see that conditional sampling leads to results that are more refined in the sense that they concentrate more around the object."
> [@arxiv_1702_04595, section 4]: "Figure 4 shows how different window sizes influence the resolution of the visualization."

Row 82:
> [@_imi__2025, abstract]: "Our work includes an extended evaluation of AMs on time series data, that presents the influence and importance of perturbation methods and region size selection in relation to dataset and model characteristics."

Row 83:
> [@Sau_2026, abstract]: "In the BIDMC cohort, AIRE-AF predicted incident atrial fibrillation with a C-index of 0.750"

Row 84:
> [@Zeidaabadi_2026, abstract]: "The model achieved C-statistics of 0.754"

Row 85:
> [@Jabbour_2024, abstract]: "The ECG-AI model was externally validated in the Medical Information Mart for Intensive Care-IV (MIMIC-IV) hospital data set."
> [@Jabbour_2024, abstract]: "ECG-AI model performance remained consistent (AUC-ROC = .77)"

Row 86:
> [@Raghunath_2021, abstract]: "were 0.85 and 0.22, respectively, for predicting new-onset AF within 1 year of an ECG."

Row 87:
> [@Riek_2026, abstract]: "average follow-up 80<plus-minus sign>100 days"
> [@Riek_2026, abstract]: "the gradient boosting survival model achieved highest performance (test C-index 0.781)"

Row 88:
> [@Tsiartas_2025, Results]: "0.851 vs 0.630; q<0.001; rb=0.80) compared with those where AF was confirmed after this period and within 1 year"

Row 89:
> [@Attia_2019, abstract]: "We classified patients with at least one ECG with a rhythm of atrial fibrillation or atrial flutter as positive for atrial fibrillation."

Row 90:
> [@Yuan_2023, abstract]: "was trained to predict the presence of AF within 31 days of sinus rhythm ECGs."

Row 91:
> [@McKeen_2025, abstract]: "we present ECG-FM, a transformer-based foundation model"
> [@McKeen_2025, abstract]: "Downstream, we evaluate multi-label ECG interpretation and prediction of reduced left ventricular ejection fraction (LVEF), introducing an openly available benchmark on the MIMIC-IV-ECG dataset."
> [@McKeen_2025, abstract]: "achieve high AUROC on salient labels, including atrial fibrillation (0.996)"
> [@McKeen_2025, abstract]: "We release our code, model weights, tutorials, and benchmark at"

Row 92:
> [@Khurshid_2022, abstract]: "the approaches are complementary."

Row 93:
> [@Christopoulos_2020, abstract]: "both the AI-ECG AF model output and CHARGE-AF score independently predicted incident AF."

Row 94:
> [@Pfeifer_2026, abstract]: "This study aimed to externally validate an ECG-AI model for predicting 1-year AF risk."
> [@Pfeifer_2026, abstract]: "were manually abstracted to define inclusion and exclusion criteria (age 65+ years with no previous AF"
> [@Pfeifer_2026, abstract]: "result for 391 patients (9.7%), including 74 who developed AF (sensitivity 31%"
> [@Pfeifer_2026, abstract]: "(specificity 92%"

Row 95:
> [@Patlatzoglou_2025, abstract section]: "demonstrate the cost introduced by intrinsic ECG interpretability"

Row 96:
> [@arxiv_2106_13314, abstract section]: "the concept representations learned by these models encode information beyond the pre-defined concepts"
> [@arxiv_2106_13314, section 3]: "the joint training objective encourages the concept representations to encode for all possible task-relevant information."

Row 97:
> [@Khurshid_2022, abstract]: "In saliency analyses, the ECG P-wave had the greatest influence on AI model predictions."

Row 98:
> [@Zeidaabadi_2026, abstract]: "Saliency mapping indicated the model primarily focused on P-wave morphology and PR interval regions."

Row 99:
> [@Schnabel_2009, abstract]: "and electrocardiographic PR interval were associated with incident AF"

Row 100:
> [@Cheng_2009, abstract]: "Individuals with first-degree atrioventricular block had a two-fold adjusted risk of AF (HR 2.06"

Row 101:
> [@Magnani_2013, abstract]: "The Health, Aging, and Body Composition (Health ABC) Study is a prospective, biracial cohort."
> [@Magnani_2013, abstract]: "51.9% women, and 41% black)"
> [@Magnani_2013, abstract]: "every SD increase (29 ms) in PR interval was associated with"
> [@Magnani_2013, abstract]: "and a 13% increased risk of incident AF"

Row 102:
> [@Tanaka_2021, abstract]: "Eligible participants were residents in Kanazawa City, Japan"
> [@Tanaka_2021, abstract]: "37,730 participants (mean age, 72.3"
> [@Tanaka_2021, abstract]: "In the fully adjusted model, f-AVB was significantly associated with incident AF (HR, 1.75"

Row 103:
> [@Yogeswaran_2025, abstract]: "a prospective cohort study of Black adults"
> [@Yogeswaran_2025, abstract]: "unit increase in PR interval"
> [@Yogeswaran_2025, abstract]: "wave duration, and PTFV1 was associated with increased AF risk"

Row 104:
> [@Magnani_2015, abstract]: "They are associated with AF in cross-cohort meta-analyses"

Row 105:
> [@Emmanuela_2026, abstract of the full text]: "Prolonged P-wave duration and the presence of interatrial block were associated with the incidence of NOAF."
> [@Emmanuela_2026, limitations]: "certainty evaluation using the GRADE framework yielded very low ratings for all parameters"
> [@Emmanuela_2026, limitations]: "a limitation that restricts direct applicability to a general, unselected population."

Row 106:
> [@Ostrowska_2022, summary]: "(1016 individuals all aged 70 years; 50% women) was used to identify whether the ECG variables P-wave duration (Pdur) and PRduration in lead V1 were related to new-onset AF."
> [@Ostrowska_2022, summary]: "There was no significant relationship between incident AF and the PR-interval."
> [@Ostrowska_2022, summary]: "Values below 60 msec were significantly associated with incident AF"

Row 107:
> [@Goette_2016, abstract]: "The purpose of the present consensus report"
> [@Goette_2016, abstract]: "Any complex of structural, architectural, contractile or electrophysiological changes affecting the atria with the potential to produce clinically-relevant manifestations"
> [@Goette_2016, abstract]: "atrial pathologies have a substantial impact on cardiac performance, arrhythmia occurrence, and stroke risk"

Row 108:
> [@Maezono_2025, abstract]: "in a Japanese community"
> [@Maezono_2025, abstract]: "Unadjusted incidence rates of AF were significantly higher in participants with P-wave duration"
> [@Maezono_2025, abstract]: "had a significantly higher age- and sex-adjusted geometric mean percentage of left atrial fibrosis"
> [@Maezono_2025, abstract]: "Fibrosis in the left atrial posterior wall was pathologically evaluated in 133 autopsied cases"

Row 109:
> [@Yao_2019, abstract]: "to assess the validity of AF case definitions in administrative databases"
> [@Yao_2019, abstract]: "We identified 24 studies"
> [@Yao_2019, abstract]: "The pooled random effects estimates were: sensitivity 80%"
> [@Yao_2019, abstract]: "PPV 88%"

Row 110:
> [@Malmo_2016, abstract]: "All AF diagnoses were verified by review of hospital and PC medical records."
> [@Malmo_2016, abstract]: "The sensitivity of a hospital discharge diagnosis of AF was 73.7%, specificity 99.7%, PPV 88.5%, and NPV 99.2%."

Row 111:
> [@Rix_2012, abstract]: "The positive predictive value of the combined diagnosis of AF and/or AFL was 92.6%"

Row 112:
> [@Johnson_2023, section on the patients table]: "is provided in the anchor_age column"
> [@Johnson_2023, section on the patients table]: "then they were 50 years old in the year 2150."

Row 113:
> [@Schnabel_2009, abstract]: "Age, sex, significant murmur, heart failure, systolic blood pressure, hypertension treatment, body mass index, and electrocardiographic PR interval were associated with incident AF"

Row 114:
> [@Cheng_2009, abstract]: "PR prolongation is associated with increased risks of AF, pacemaker implantation, and death."

Row 115:
> [@Magnani_2013, abstract]: "and a 13% increased risk of incident AF"

Row 116:
> [@arxiv_1810_03292, abstract section]: "Through extensive experiments we show that some existing saliency methods are independent both of the model and of the data generating process."

Row 117:
> [@arxiv_1806_10758, section 1]: "The base methods we evaluate are no better or on par with a random estimate at finding the core set of informative features."

Row 118:
> [@Arends_2026, abstract]: "Randomizing model weights led to rapid loss of correlation, although some methods did not converge to zero."

Row 119:
> [@arxiv_1702_04595, section 4]: "We can see that conditional sampling leads to results that are more refined in the sense that they concentrate more around the object."
> [@arxiv_1702_04595, section 4]: "Figure 4 shows how different window sizes influence the resolution of the visualization."

Row 120:
> [@_imi__2025, abstract]: "presents the influence and importance of perturbation methods and region size selection in relation to dataset and model characteristics."

Row 121:
> [@arxiv_2106_13314, abstract section]: "rendering the interpretation of the downstream prediction misleading."

Row 122:
> [@arxiv_1806_10758, section 1]: "ROAR replaces the fraction of the pixels estimated to be most important with a fixed uninformative value."
> [@arxiv_1806_10758, section 4]: "As a control, we compare each estimator to two rankings (a random assignment of importance and a sobel edge filter) that do not depend at all on the model parameters."
> [@arxiv_1806_10758, appendix, KAR]: "While ROAR removes features by replacing a fraction of inputs estimated to be most important, KAR preserves the inputs considered to be most important."

Row 123:
> [@Collins_2024, abstract section]: "TRIPOD+AI aims to promote the complete, accurate, and transparent reporting of studies that develop a prediction model or evaluate its performance."

Row 124:
> [@Cheng_2009, abstract]: "PR prolongation is associated with increased risks of AF, pacemaker implantation, and death."

Row 125:
> [@Magnani_2013, abstract]: "and a 13% increased risk of incident AF"

Row 126:
> [@https://doi.org/10.13026/4nqg-sb35, abstract]: "This subset contains all of the ECGs for patients who appear in the MIMIC-IV Clinical Database."

Row 127:
> [@Johnson_2023, section on access]: "The hosp and icu modules in MIMIC-IV are available in the MIMIC-IV project on PhysioNet"

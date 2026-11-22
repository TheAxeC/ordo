# Citation audit, revision round 1 (citation_compliance_agent)

Scope: `manuscript/refs.bib` and every `\cite` in `manuscript/main.tex`, for Biomedical Signal Processing and Control with `\bibliographystyle{elsarticle-num}` (Elsevier numbered style; the style file read is `elsarticle-num.bst` version 2.1 in the local TeX Live 2025 tree). Nothing was compiled or executed; sources were read on the web (Crossref API, DataCite API, NCBI E-utilities, Europe PMC, bioRxiv/medRxiv API, arXiv abstract and HTML pages, PMLR, JMLR, PhysioNet, PMC, scikit-learn documentation). Response to R3.14 and open item 21 of the revision log.

## Summary

| Metric | Count |
|--------|-------|
| Citation commands in main.tex (`\cite` occurrences, key uses) | 42 commands, 49 key uses |
| Distinct keys cited | 24 |
| Reference list entries | 24 (22 before this audit, 2 added) |
| Orphan in-text citations (key not in refs.bib) | 0 |
| Orphan references (entry never cited) | 0 |
| Entries verified and unchanged | 12 |
| Entries corrected | 10 |
| Entries added | 2 |
| Entries with a field not verified from a primary source | 2 (clifford2017af pages; hrvstandards1996 full group-author name) |
| Format errors auto-corrected | 10 entries (listed below) |
| Missing DOIs where a DOI exists | 0 after correction (lookingbeyond2026 had none; added) |
| Claims in main.tex corrected to match the cited source | 6 edits (listed below) |
| Self-citation ratio | 0% (no entry is authored by D. Chun or A. Faes) |
| Sources from the last five years (2021 to 2026) | 9 of 24 (37.5%) |
| Sources older than ten years (2015 or earlier) | 11 of 24, all seminal (see Currency) |

Commands for the counts: key lists from `grep -o '\\cite[a-z]*{[^}]*}' main.tex` and `grep -o '^@[a-z]*{[^,]*' refs.bib`, compared with `diff`: 24 distinct cited keys, 24 entries, no difference. `LC_ALL=C grep -n '[^ -~]'` on both files returns no non-ASCII character.

## Per-entry verification

| # | Key | Status | Primary source read | Finding |
|---|-----|--------|---------------------|---------|
| 1 | ptbxl2020 | Verified, unchanged | Crossref record of 10.1038/s41597-020-0495-6; PMC7248071 | Seven authors, title, Scientific Data 7(1):154, 2020 all match. |
| 2 | ptbxl2022physionet | Added | DataCite record of 10.13026/kfzx-aw45; PhysioNet page ptb-xl/1.0.3 | Dataset record, version 1.0.3, PhysioNet 2022, five creators (Wagner, Strodthoff, Bousseljot, Samek, Schaeffter). Added because the cohort numbers in Section 3.1 come from this version (see changes). |
| 3 | mitbih2001 | Verified, unchanged | Crossref record of 10.1109/51.932724; PhysioNet mitdb/1.0.0 page | IEEE Eng. Med. Biol. Mag. 20(3):45-50, 2001 matches. |
| 4 | mitbih2005physionet | Added | DataCite record of 10.13026/C2F305; PhysioNet mitdb/1.0.0 page | Dataset record, version 1.0.0, PhysioNet 2005, creators Moody and Mark (initials G. B. and R. G. taken from the Crossref record of mitbih2001, same persons). Added for the version statement in Code and data availability. |
| 5 | physionet2000 | Verified, unchanged | Crossref record of 10.1161/01.CIR.101.23.e215; PubMed esummary PMID 10851218 | Ten authors, Circulation 101(23), 2000 match; Crossref has no page field, PubMed gives E215-20, which matches e215--e220. |
| 6 | lookingbeyond2026 | Corrected (format) | arXiv abstract page 2601.21830 | Title, five authors, v1 29 Jan 2026 match; no journal-ref; no published version found. Entry retyped (see changes). |
| 7 | hubertecg2024 | Corrected (format, title) | Crossref record of 10.1101/2024.11.14.24317328; bioRxiv/medRxiv API version history; Europe PMC record | Six authors match. Versions 2 to 4 (latest 2026-06-01) retitled "HuBERT-ECG as a self-supervised foundation model for broad and scalable cardiac applications"; the DOI and Crossref record now carry that title. No published version (API field "published" is NA for all four versions; web search found none). |
| 8 | ecgfounder2024 | Corrected (replaced by published version) | Crossref record of 10.1056/AIoa2401033; PubMed efetch PMID 40771651; arXiv abstract page 2410.04133 | Published as NEJM AI 2(7), July 2025 (epub 2025-06-26), ten authors (adds Jiarui Jin). Same work: same model name, same core authors, same data (Harvard-Emory ECG Database, 150 label categories), same single-lead extension. No page or article number in Crossref or PubMed, so none is given. |
| 9 | hubertarabie1985 | Verified, unchanged | Crossref record of 10.1007/BF01908075 | J. Classification 2(1):193-218, 1985 matches. |
| 10 | vinh2010 | Verified, unchanged | JMLR page papers/v11/vinh10a | JMLR 11:2837-2854, 2010 matches. JMLR issues no DOI. |
| 11 | rousseeuw1987 | Verified, unchanged | Crossref record of 10.1016/0377-0427(87)90125-7 | J. Comput. Appl. Math. 20:53-65, 1987 matches. |
| 12 | sslclustering2025 | Corrected (replaced by published version) | arXiv abstract page 2501.18452 (comment "Accepted at ICML 2025"); PMLR page v267/weng25a | Published in Proceedings of the 42nd ICML, PMLR 267:66597-66616, 2025; same title and same eight authors. PMLR issues no DOI. |
| 13 | wavelettensorecg2018 | Corrected (authors) | Crossref record of 10.1016/j.knosys.2018.09.001 | Authors in the bib were "He, Houshou; Tan, Yujie; Xing, Jun"; the Crossref author array is Hong He, Yonghong Tan, Jianfeng Xing. Volume 163, pages 392-403, year 2019 match. The key says 2018 and the entry correctly says 2019; the key does not print. |
| 14 | hrvstandards1996 | Verified, one field partly | Crossref record of 10.1161/01.CIR.93.5.1043 | Circulation 93(5):1043-1065, 1996 and title match. The Crossref group-author string is truncated, so the full Task Force name in the bib is not confirmed character for character from a primary record. |
| 15 | dechazal2004 | Verified, unchanged | Crossref record of 10.1109/TBME.2004.827359 | IEEE TBME 51(7):1196-1206, 2004 matches (Crossref writes "deChazal"; the bib keeps "de Chazal"). |
| 16 | neurokit2021 | Verified, unchanged | Crossref record of 10.3758/s13428-020-01516-y | Eight authors, Behav. Res. Methods 53(4):1689-1696, 2021 match. |
| 17 | sklearn2011 | Verified, unchanged | JMLR page papers/v12/pedregosa11a | JMLR 12:2825-2830, 2011; first six of sixteen authors match, the rest given as "others". JMLR issues no DOI. |
| 18 | fedavg2017 | Corrected (PMLR fields) | PMLR page v54/mcmahan17a | Proceedings of AISTATS 2017, PMLR 54:1273-1282; five authors match. |
| 19 | clocs2021 | Corrected (PMLR fields) | PMLR page v139/kiyasseh21a | Proceedings of the 38th ICML, PMLR 139:5606-5615, 2021; three authors match. |
| 20 | threekg2021 | Corrected (PMLR fields) | PMLR page v158/gopal21a | Proceedings of Machine Learning for Health, PMLR 158:156-167, 2021; six authors match (PMLR prints "Andrew Ng", "Geoff Tison"). |
| 21 | mehari2022ssl | Verified, unchanged | Crossref record of 10.1016/j.compbiomed.2021.105114 | Comput. Biol. Med. 141:105114, 2022 matches. |
| 22 | hdbscan2013 | Corrected (series, volume, DOI field) | Crossref records of 10.1007/978-3-642-37456-2_14 and of the book 10.1007/978-3-642-37456-2; JCU Research Online record 46784 | PAKDD 2013 Proceedings Part II, Lecture Notes in Computer Science volume 7819, Springer, Berlin, Heidelberg, pages 160-172. |
| 23 | fowlkes1983 | Verified, unchanged | Crossref record of 10.1080/01621459.1983.10478008 (publisher page returned HTTP 403) | JASA 78(383):553-569, 1983, both authors and title match. |
| 24 | clifford2017af | Verified except pages; corrected (title protection) | Crossref record of 10.22489/CinC.2017.065-469; PMC5978770 | Eight authors, title, Computing in Cardiology volume 44, 2017 match. Neither Crossref nor PMC gives pages; "1--4" appears only in secondary citations, so it is left as it was and listed as unverified. |

Retraction screening: a single Crossref query for notices that update any of the 15 DOIs in the list before this audit (`api.crossref.org/works?filter=updates:<doi>,...`) returned 0 results; the same query form returned the known retraction notices for a control DOI (Lancet 10.1016/S0140-6736(97)11096-0), so the query works. The entries without a DOI (vinh2010, sklearn2011, fedavg2017, clocs2021, threekg2021, sslclustering2025) and the two added dataset records were not screened against the Retraction Watch database.

## Orphan check

All 24 cited keys exist in refs.bib and all 24 entries are cited. Uncited entries: none. The two entries uncited before the revision (hdbscan2013, clifford2017af) are now cited by the draft writer in Sections 3.3 and 3.1.

## Changes to refs.bib

| # | Entry | Before | After | Rule basis |
|---|-------|--------|-------|-----------|
| 1 | lookingbeyond2026 | `@article`, `journal = {arXiv preprint arXiv:2601.21830}`, `note = {arXiv:2601.21830}`, no DOI | `@misc`, `howpublished = {arXiv preprint}`, `doi = {10.48550/arXiv.2601.21830}` | R3.14: one preprint convention, identifier printed once; IRON RULE: DOI on every entry that has one. |
| 2 | hubertecg2024 | `@article`, `journal = {medRxiv}`, title "{HuBERT-ECG}: a self-supervised foundation model ...", `note` with the Hugging Face weights URL | `@misc`, `howpublished = {medRxiv preprint}`, title "{HuBERT-ECG} as a self-supervised foundation model for broad and scalable cardiac applications", note removed, DOI kept | Same preprint convention; title of the current version as held by the DOI record; weights URL is in Code and data availability (main.tex lines 812-813, read). |
| 3 | ecgfounder2024 | arXiv preprint "An Electrocardiogram Foundation Model Built on over 10 Million Recordings with External Evaluation across Multiple Domains", nine authors, `journal = {arXiv preprint arXiv:2410.04133}`, `note` with arXiv identifier and weights URL | `@article`, "An electrocardiogram foundation model built on over 10 million recordings", NEJM AI 2(7), 2025, ten authors (Li, Aguirre, Moura Junior, Jin, Liu, Zhong, Sun, Clifford, Westover, Hong), `doi = {10.1056/AIoa2401033}`, note removed | Preprint replaced by the verified published version; weights URL is in Code and data availability. Key name kept so no `\cite` changes. |
| 4 | sslclustering2025 | `@article`, `journal = {arXiv preprint arXiv:2501.18452}`, `note = {arXiv:2501.18452}` | `@inproceedings`, booktitle Proceedings of the 42nd International Conference on Machine Learning (ICML), series Proceedings of Machine Learning Research, volume 267, publisher PMLR, pages 66597--66616, year 2025 | Preprint replaced by the verified published version. |
| 5 | wavelettensorecg2018 | `He, Houshou and Tan, Yujie and Xing, Jun`; "two-dimensional Gaussian" | `He, Hong and Tan, Yonghong and Xing, Jianfeng`; "two-dimensional {Gaussian}" | Author names from Crossref; elsarticle-num lowercases titles (`"t" change.case$`), so a proper adjective needs braces. |
| 6 | fedavg2017 | booktitle and pages only | adds series Proceedings of Machine Learning Research, volume 54, publisher PMLR | R3.14: PMLR volume, series and publisher. |
| 7 | clocs2021 | booktitle and pages only | adds series, volume 139, publisher PMLR | As above. |
| 8 | threekg2021 | booktitle and pages only | adds series, volume 158, publisher PMLR | As above. |
| 9 | hdbscan2013 | booktitle and pages; `doi = {10.1007/978-3-642-37456-2\_14}` | booktitle "Advances in Knowledge Discovery and Data Mining (PAKDD 2013)", series Lecture Notes in Computer Science, volume 7819, publisher Springer, address Berlin, Heidelberg; `doi = {10.1007/978-3-642-37456-2_14}` | Series volume where one exists. elsarticle-num prints the DOI as `\href{https://doi.org/...}{\path{doi:...}}`, and `\path` prints a backslash literally, so the escaped underscore would have printed as "\_" and broken the link. |
| 10 | clifford2017af | "the {PhysioNet/Computing} in {Cardiology} Challenge 2017" | "the {PhysioNet/Computing in Cardiology Challenge 2017}" | The style lowercases unprotected words; the challenge name is a proper name. |
| 11 | ptbxl2022physionet | (none) | new `@misc` dataset entry, PhysioNet 2022, version 1.0.3, `doi = {10.13026/kfzx-aw45}` | Supports the version-specific counts in Section 3.1; PhysioNet asks users of the dataset to cite this record. |
| 12 | mitbih2005physionet | (none) | new `@misc` dataset entry, PhysioNet 2005, version 1.0.0, `doi = {10.13026/C2F305}` | Supports the version statement in Code and data availability; PhysioNet asks users to cite this record. |

Formatting checks with no change needed: every page range uses `--`; acronyms in titles are braced (PTB-XL, MIT-BIH, ECG, AF, NeuroKit2, Python, CLOCS, 3KG, HuBERT-ECG, PhysioBank/PhysioToolkit/PhysioNet); author names are all in "Last, First" form and elsarticle-num prints every first name as initials, so the printed form is uniform; no `note` field remains in refs.bib.

## Changes to main.tex

All edits are exact replacements of the lines shown; nothing else in main.tex was touched. Line numbers are those after the edit.

| # | Location | Before | After | Reason |
|---|----------|--------|-------|--------|
| 1 | Section 1, lines 81-83 | "distinction is established in the self-supervised learning literature \cite{sslclustering2025}" | "distinction has been reported in the self-supervised learning literature, where network layers with nearly the same linear-probe accuracy differ in clustering quality \cite{sslclustering2025}" | The source shows one instance (projector layer versus encoding), not an established general result; see claim (i). |
| 2 | Section 1, lines 87-90 | "including a cluster-separability analysis on PTB-XL \cite{lookingbeyond2026}. By its own statement it does not include a representation-wise comparison against hand-crafted features" | "including a cluster-separability analysis of embeddings pooled from four 12-lead datasets, one of which is PTB-XL \cite{lookingbeyond2026}. It does not include a comparison against hand-crafted features" | The ARI analysis pools four datasets; the source's own statement is that prior benchmarks lack a representation-wise evaluation and says nothing about hand-crafted features; see claim (h). |
| 3 | Section 2, lines 154-155 | "embeddings on PTB-XL and finds" | "embeddings pooled from four 12-lead datasets, one of which is PTB-XL, and finds" | Same as change 2. |
| 4 | Section 3.1, lines 169-171 | "We use PTB-XL \cite{ptbxl2020}, ... from the diagnostic statements of the Standard Communications Protocol for Computer-Assisted" | "We use PTB-XL \cite{ptbxl2020,ptbxl2022physionet}, ... from the rhythm statements of the Standard Communication Protocol for Computer-Assisted" | The counts 21 799 records and 18 869 patients are those of PhysioNet version 1.0.3, not of the 2020 article (21 837 and 18 885); PTB-XL classes AFIB, AFLT and SR as rhythm statements, separate from its diagnostic statements; the standard's title uses "Communication"; see claim (c). |
| 5 | Section 4.2, lines 510-511 | "the established separability-versus-clusterability effect \cite{sslclustering2025}" | "the separability-versus-clusterability effect reported for self-supervised representations \cite{sslclustering2025}" | Same as change 1. |
| 6 | Code and data availability, line 807 | "PTB-XL (version 1.0.3) \cite{ptbxl2020} and the MIT-BIH Arrhythmia Database (version 1.0.0) \cite{mitbih2001}" | "PTB-XL (version 1.0.3) \cite{ptbxl2020,ptbxl2022physionet} and the MIT-BIH Arrhythmia Database (version 1.0.0) \cite{mitbih2001,mitbih2005physionet}" | The version numbers are supported by the PhysioNet dataset records, not by the original articles. |

## Change to response-to-reviewers.md

R3.14: the sentence on added references now also names the two PhysioNet dataset records, and the "Pending" paragraph on bibliography formatting, which no longer matched refs.bib, is replaced by a paragraph stating what was done: one preprint convention, PMLR and LNCS fields, ECGFounder and Weng et al. replaced by their published versions, the He et al. author names corrected, and HuBERT-ECG and Filice et al. kept as preprints because no published version was found. No other passage of the letter names a reference in a way that differs from refs.bib; the letter's statements about Filice et al. (R3.1) and Clifford et al. (R2.1b) remain true after the main.tex changes.

## Claim support (task 4)

| Claim | main.tex location | Verdict | Evidence read |
|-------|-------------------|---------|---------------|
| (a1) ECGFounder trained on over 10 million ECGs with 150 label categories annotated by cardiology experts | 3.2 lines 259-261; 4.2 lines 529-530; 5 line 756 | Supported | NEJM AI abstract (PubMed efetch PMID 40771651): "ECGFounder was built on 10,771,552 ECGs from 1,818,247 unique subjects with 150 label categories from the Harvard-Emory ECG Database" and "leverages real-world ECG annotations from cardiologists". The arXiv abstract says "over 10 million ECGs with 150 label categories" and "real-world ECG annotations from cardiology experts". |
| (a2) The ECGFounder authors describe an extension to single-lead ECGs | 5 lines 701-702 | Supported | NEJM AI abstract: "we extended its application to reduced-lead ECGs, particularly single-lead ECGs." |
| (a3) ECGFounder is a convolutional network | 3.2 line 259 | Supported | arXiv HTML 2410.04133v3: "ECGFounder is a general ECG encoder based on the RegNet architecture" (a one-dimensional convolutional network). |
| (b) HuBERT-ECG is self-supervised | 2 line 136; 3.2 line 256; 4.2 line 533; 5 line 756 | Supported | medRxiv API, abstract of version 4: "a self-supervised foundation ECG model pre-trained on 9.1 million 12-lead ECGs"; the title of every version contains "self-supervised". The word "transformer" in Section 3.2 line 256 was not found in the abstract or the model card and is not verified from the cited source. |
| (c1) Expansion "Standard Communications Protocol for Computer-Assisted Electrocardiography (SCP-ECG)" | 3.1 lines 171-172 | Corrected | PTB-XL does not spell out SCP-ECG in its text; its reference 12 is "Standard communication protocol - Part 91064: Computer-assisted electrocardiography" (PMC7248071). EN 1064 is titled "Health informatics - Standard communication protocol - Computer-assisted electrocardiography", and Rubel et al. (Hearts 2021) are titled "The History and Challenges of SCP-ECG: The Standard Communication Protocol for Computer-Assisted Electrocardiography". "Communications" changed to "Communication". |
| (c2) AFIB, AFLT and SR statements | 3.1 lines 171-174 | Supported after correction | PTB-XL Table 8 "Rhythm Statement Overview" lists AFIB "atrial fibrillation", AFLT "atrial flutter", SR "sinus rhythm"; the article separates "44 different diagnostic statements, 19 different form statements" from "12 different non-overlapping rhythm statements". "diagnostic statements" changed to "rhythm statements". The likelihood-zero statement at line 177 is supported: for form and rhythm statements "the corresponding likelihood was set to zero". |
| (c3) 21 799 records, 18 869 patients | 3.1 line 170 | Supported after correction | The 2020 article states 21 837 records from 18 885 patients; PhysioNet ptb-xl/1.0.3 states "21799 clinical 12-lead ECG records of 10 seconds length from 18869 patients". Citation to the version 1.0.3 dataset record added. |
| (d) AF detection from a single lead is an established task | 3.1 lines 187-188 | Supported | PMC5978770 introduction: "It is challenging to reliably detect AF from a single short lead of ECG"; the 2017 Challenge asked entrants to classify single-lead recordings, and 75 teams entered (DSpace record of the accepted manuscript). |
| (e) hdbscan2013 for HDBSCAN | 3.3 line 306 | Supported | The scikit-learn `HDBSCAN` documentation, the implementation used, expands "HDBSCAN - Hierarchical Density-Based Spatial Clustering of Applications with Noise" and lists Campello, Moulavi and Sander, "Density-based clustering based on hierarchical density estimates" as reference [1]. The paper's full text is behind the Springer login and was not read. |
| (f) vinh2010 for AMI with arithmetic-mean normalisation and for NMI not corrected for chance | 3.3 lines 329-335 | Supported through the library documentation; full text not read | JMLR abstract: the paper treats "correcting information theoretic measures for chance". scikit-learn clustering guide: "Vinh et al. (2010) named variants of NMI and AMI by their averaging method [VEB2010]. Their 'sqrt' and 'sum' averages are the geometric and arithmetic means", and "NMI and MI are not adjusted against chance." The AMI formula with the factor 1/2 is the 'sum' variant. The JMLR PDF was not opened (see Not done). |
| (g) fowlkes1983 for the Fowlkes-Mallows index as the geometric mean of pair precision and pair recall, in [0,1] | 3.3 lines 335-336 | Supported | Crossref confirms the article. scikit-learn `fowlkes_mallows_score`, which cites Fowlkes and Mallows 1983: "The Fowlkes-Mallows index (FMI) is defined as the geometric mean of the precision and recall", FMI = TP / sqrt((TP + FP)(TP + FN)) with TP, FP, FN counted over pairs, "The score ranges from 0 to 1." The JASA full text (HTTP 403) was not read. |
| (h1) lookingbeyond2026 benchmarks ECG foundation models against one another | 1 line 86; 2 line 156 | Supported | arXiv HTML 2601.21830v1, Section 3.2: "We benchmark 4 different ECG-expert FMs" (ECG-FM, ECGFounder, HuBERT-ECG small, base and large, ECG-JEPA); Section 5 compares them. |
| (h2) It includes a cluster-separability (ARI) analysis on PTB-XL | 1 lines 87-88; 2 lines 153-155 | Partly supported; corrected | Section 3.4 measures label-level and dataset-level separability with the Adjusted Rand Index on Gaussian-mixture clusters; Table 4 reports it for the CD and AF classes. Algorithm 1 pools the embeddings of all four datasets ("Georgia (GEO)", "CODE-15% (C15)", "PTB-XL (PTX)", "Chapman-Shaoxing+Ningbo (CHN)"), so the analysis is not on PTB-XL alone. Text changed to "embeddings pooled from four 12-lead datasets, one of which is PTB-XL". |
| (h3) Some models cluster by clinical label, others by dataset | 2 lines 155-156; 4.1 lines 482-484; 4.2 lines 535-536 | Supported | Section 5: "ECGFounder and ECG-FM correctly optimize the dataset-level and label-level separability"; "HuBERT-ECG and ECG-JEPA exhibit a systematically higher dataset-level separability". Table 4 label-level ARI for AF: ECGFounder 0.70, ECG-FM 0.64, HuBERT-ECG 0.00 to 0.04. |
| (h4) It states that prior work omits a representation-wise evaluation | 2 lines 156-157 | Supported | Section 2: "Nonetheless, none of these works include a representation-wise evaluation in their benchmark: instead, they focus on performances over downstream tasks." |
| (h5) "By its own statement it does not include a representation-wise comparison against hand-crafted features" | 1 lines 88-89 (before the edit) | Not supported as worded; corrected | The source's statement concerns prior benchmarks and does not mention hand-crafted features. The fact itself is true (no hand-crafted feature or baseline appears; the only classifiers are "5 different lightweight classifiers" on the embeddings), so the sentence now states it without attributing it to the source. |
| (h6) It does not include a hand-crafted baseline or MIT-BIH | 1 lines 89-92; 1 line 119; 2 lines 157-158; 5 lines 749-751 | Supported | Section 3.1 lists the four datasets above; MIT-BIH does not appear in the paper; no hand-crafted features appear. |
| (h7) Some models are reported to cluster well | 5 line 763; 6 line 776 | Supported | Section 6: "dataset-independent embeddings lead to improved clinical alignment (ECGFounder, ECG-FM)"; ECG-FM, which this manuscript does not evaluate, has label-level AF ARI 0.64. |
| (i) sslclustering2025 for the separability-versus-clusterability distinction | 1 lines 77-83; 4.2 lines 509-511; 5 lines 746-747 | Partly supported; corrected at lines 81-83 and 510-511 | The paper does not state the distinction as a general principle. Its one direct instance, Section 3 near Figure 4: "the clustering metrics of the hidden layer outputs within the projector show notable differences and weaknesses compared to those of the encodings, despite P0 being separated by only a single linear layer and achieving nearly the same linear evaluation accuracy as the encodings" (clustering measured by silhouette and ARI; SimCLR, VICReg, SwAV, ResNet-18 on CIFAR-100). The words "established" were replaced by "reported" with that instance named. "is known" at line 746 and "we credit ... to prior work" at line 120 are consistent with a reported instance and were left. The mechanism in lines 78-80 (discriminative direction away from the dominant axes) is the authors' explanation and is not attributed to the source. |

## Preprint-to-published findings

| Preprint | Published version | Decision |
|----------|-------------------|----------|
| ecgfounder2024, arXiv:2410.04133 | NEJM AI 2(7), 2025, doi:10.1056/AIoa2401033 (Crossref; PubMed PMID 40771651, PMC12327759) | Replaced: same model, same core authors plus J. Jin, same data and claims. |
| sslclustering2025, arXiv:2501.18452 | Proceedings of the 42nd ICML, PMLR 267:66597-66616, 2025 | Replaced: same title and authors; arXiv comment "Accepted at ICML 2025". |
| hubertecg2024, medRxiv 10.1101/2024.11.14.24317328 | None found (medRxiv API "published: NA" for versions 1 to 4; extended web search) | Kept as preprint, current title. |
| lookingbeyond2026, arXiv:2601.21830 | None found (arXiv page has no journal-ref; extended web search) | Kept as preprint. |

## Currency and self-citation

Self-citation: none of the 24 entries has D. Chun or A. Faes as an author (0%).

Sources from 2015 or earlier (11): fowlkes1983, hubertarabie1985, rousseeuw1987 (the three metric definitions used), hrvstandards1996 (the HRV measurement standard), physionet2000, mitbih2001, mitbih2005physionet (the database and its record), dechazal2004 (the reference hand-crafted heartbeat features), vinh2010 (AMI definition), sklearn2011 (software used), hdbscan2013 (the method used). Each is the original definition, standard, dataset or software the manuscript uses, so none is flagged as outdated.

Sources from 2021 to 2026 (9 of 24, 37.5%): neurokit2021, clocs2021, threekg2021, mehari2022ssl, ptbxl2022physionet, hubertecg2024, ecgfounder2024 (2025), sslclustering2025, lookingbeyond2026.

Citation density: no sentence carries more than two citations.

## Unverified items and work not done

- clifford2017af pages "1--4": no primary record (Crossref, PMC) gives pages; left unchanged.
- hrvstandards1996 group-author name: the Crossref string is truncated; the full name in the bib was not compared with a complete primary record.
- vinh2010 and fowlkes1983 claims were checked through the abstract and the scikit-learn documentation that cites them, not through the full text: the JMLR PDF was not opened, because the fetch tool saves PDF files, and the JASA page returned HTTP 403.
- "HuBERT-ECG is a self-supervised transformer" (Section 3.2): "transformer" not found in the sources read.
- Retraction Watch: entries without a Crossref DOI were not screened (see Retraction screening).
- One fetch of a PDF (the CinC 2017 paper on cinc.org) was saved by the fetch tool to its own cache folder outside the repository; no file was saved in the repository.
- Observation for the authors, not a citation issue: PTB-XL Table 8 lists 73 AFLT records in the whole database, which bounds the AFLT count asked for in open item 1 of the revision log; the count among the 1 260 positives still needs the cohort file.

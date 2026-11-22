# Citation Audit Report (the citation stage, Vancouver)

Inputs: `run/draft/draft_v3.md`, `run/search/references.bib`, `run/search/annotated_bibliography.md`. Outputs: `run/citations/references.bib` (corrected bibliography; `run/search/references.bib` is unchanged), `run/citations/draft_v4.md` (draft_v3 with two sentences corrected), this report. Run settings followed: Vancouver; citation verification advisory (mark only); web lookup of metadata pages only, no downloads, nothing saved from the web; no code or interpreter run (curl for the lookups; grep, sed, awk, comm and diff for the counts).

## Summary

| Metric | Count |
|---|---|
| In-text citations (`[key]<!--ref:key-->` markers) | 120 |
| Distinct cited keys | 65 |
| Reference list entries (`references.bib`) | 68 |
| Orphan in-text citations (no bib entry) | 0 |
| Orphan references (bib entry never cited) | 3 (harrell1982, hindricks2021, yokota2014; the formatter drops them) |
| Cited entries verified against an authoritative record opened in this phase | 65 of 65 |
| Cited entries whose identifier failed to resolve | 0 |
| Entries with a metadata error against the record | 0 (no wrong author, title, journal, year, volume, issue, page or DOI found) |
| Entries corrected in `stage5/references.bib` | 44 cited entries (46 with the uncited harrell1982 and hindricks2021): 39 journal fields to NLM abbreviations, 4 author-name encodings, 1 supplement volume, 1 missing issue, 4 arXiv DOIs added; some entries carry more than one |
| Numbers attributed to sources, checked against the source abstract or record | Every figure attributed to a source, in 16 sources (Section 3); all are present in the record, and one horizon label and one duration were wrong in the draft |
| Draft-text corrections (written to `draft_v4.md`) | 2 sentences |
| Claim-level items flagged for review (advisory, mark only) | 4 |
| Missing DOIs after correction | 7 (version of record has no DOI; see Section 4.4) |
| Self-citation ratio (Faes as author) | 3.1% of references (2 of 65); 2.5% of in-text citations (3 of 120) |
| Sources older than 10 years | 14 of 65 (21.5%); 4 flagged as not clearly seminal |
| Sources published 2022 or later (last 5 years by publication year) | 21 of 65 (32.3%) |
| Sentences with more than five citations | 1 (line 290), flagged |

## 1. In-text to reference cross-check

Commands: the `<!--ref:key-->` markers were extracted from `draft_v3.md` with `grep -o`, the bib keys from `references.bib` with `grep -o '^@[a-zA-Z]*{[^,]*'`, and the two sorted lists compared with `comm`. The visible bracket key and the marker key were also compared for all 120 citations (120 `[key]`, 120 markers, 120 `[key]<!--ref:` pairs, no mismatch).

- Cited keys missing from the bib: none.
- Bib entries never cited: `harrell1982`, `hindricks2021`, `yokota2014`. They stay in `stage5/references.bib` (their metadata was checked where a record was opened: harrell1982 PMID 7069920 and hindricks2021 PMID 32860505 match), and the formatter will drop them because the reference list is generated from cited keys only (`draft_v3.md` line 372).
- Narrative author names match the bib first author in every case ("Noseworthy and colleagues", "Kolda and Bader", "Jacovi and Goldberg", "Van Den Kerchove and colleagues", and so on). Two-author works are named with both authors; works with three or more use "and colleagues".

## 2. Existence and metadata verification

Records were opened in this phase through these services. Batched requests were used; the single-id form of each URL returns the same record.

- PubMed metadata: `https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&retmode=xml&id=<PMID>`; PubMed abstract: `https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&rettype=abstract&retmode=text&id=<PMID>`.
- Crossref: `https://api.crossref.org/works/<DOI>`.
- DataCite: `https://api.datacite.org/dois/<DOI>`; Zenodo record: `https://zenodo.org/api/records/4916206`.
- arXiv: `https://export.arxiv.org/api/query?id_list=<IDs>`.
- Venue pages (citation meta tags and abstract): PMLR, NeurIPS proceedings, JMLR, ACL Anthology, SpringerOpen pages named in the table.
- Semantic Scholar metadata: `https://api.semanticscholar.org/graph/v1/paper/DOI:<DOI>` (used only for the abstracts of hammer2022 and goulart2020, which Crossref does not carry).
- NLM Catalog (journal abbreviations): `https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nlmcatalog&id=<NLM ID>&retmode=xml`.

Result per cited entry. "Match" means authors (as listed in the bib), title, journal, year, volume, issue, pages and DOI or arXiv ID agree with the record. Where the bib truncates the author list with "others", the first six names were compared.

| # | Key | Identifier | Record opened | Result |
|---|---|---|---|---|
| 1 | attia2019 | PMID 31378392, DOI 10.1016/S0140-6736(19)31721-0 | esummary + efetch id=31378392 | Match |
| 2 | raghunath2021 | PMID 33588584 | esummary + efetch id=33588584 | Match |
| 3 | khurshid2022 | PMID 34743566 | esummary + efetch id=34743566 | Match |
| 4 | christopoulos2020 | PMID 33185118 | esummary + efetch id=33185118 | Match |
| 5 | biton2021 | PMID 36713102 | esummary + efetch id=36713102 | Match (record has 7 authors; bib lists 6 + others) |
| 6 | jabbour2024 | PMID 39217446 | esummary + efetch id=39217446 | Match |
| 7 | yuan2023 | PMID 37851434 | esummary + efetch id=37851434 | Match |
| 8 | noseworthy2022 | PMID 36179758 | esummary + efetch id=36179758 | Match |
| 9 | ko2026 | PMID 42680677, DOI 10.1016/j.landig.2026.101092 | esummary + efetch id=42680677 | Match |
| 10 | nolinlapalme2026 | PMID 41568699, DOI 10.1093/eurheartj/ehaf1119 | esummary + efetch id=41568699 | Match |
| 11 | mckeen2025 | PMID 41113504 | esummary + efetch id=41113504 | Match |
| 12 | matsuo2026 | PMID 42485714 | esummary + efetch id=42485714 | Match |
| 13 | hammer2022 | DOI 10.22489/CinC.2022.236 | api.crossref.org/works/10.22489/CinC.2022.236; Semantic Scholar DOI record for the abstract | Match (Crossref title "Towards the Prediction of Atrial Fibrillation Based on Interpretable ECG Features"; the Semantic Scholar title says "Using", the DOI registrant record governs) |
| 14 | alonso2013 | PMID 23537808 | esummary + efetch id=23537808 | Match |
| 15 | schnabel2009 | PMID 19249635 | esummary + efetch id=19249635 | Match; name encoding corrected (Section 4.2) |
| 16 | kornej2020 | PMID 32716709 | esummary + efetch id=32716709 | Match |
| 17 | johnson2023 | PMID 36596836 | esummary + efetch id=36596836 | Match |
| 18 | gow2023 | DOI 10.13026/4nqg-sb35 | api.datacite.org/dois/10.13026/4nqg-sb35 | Match (16 authors, PhysioNet, 2023, version 1.0) |
| 19 | goldberger2000 | PMID 10851218 | esummary + efetch id=10851218 | Match |
| 20 | wagner2020 | PMID 32451379 | esummary + efetch id=32451379 | Match |
| 21 | ribeiro2020 | PMID 32273514 | esummary + efetch id=32273514 | Match |
| 22 | ribeiro2021code15 | DOI 10.5281/zenodo.4916206 | api.datacite.org/dois/10.5281/zenodo.4916206; zenodo.org/api/records/4916206 | Match (10 authors, Zenodo, 2021, version 1.0.0); name encoding corrected (Section 4.2) |
| 23 | delathauwer2008 | DOI 10.1137/070690729 | api.crossref.org/works/10.1137/070690729 | Match |
| 24 | kolda2009 | DOI 10.1137/07070111X | api.crossref.org/works/10.1137/07070111X | Match |
| 25 | zhao2013 | PMID 23681994 | esummary + efetch id=23681994 | Match |
| 26 | camarrone2019 | PMID 29993452 | esummary + efetch id=29993452 | Match |
| 27 | faes2024 | PMID 36395140 | esummary + efetch id=36395140 | Match |
| 28 | faes2022 | PMID 36240727, DOI 10.1088/1741-2552/ac9a75 | esummary + efetch id=36240727; api.crossref.org/works/10.1088/1741-2552/ac9a75 (article number 066011, absent from PubMed) | Match |
| 29 | hunyadi2014 | DOI 10.1186/1687-6180-2014-139 | api.crossref.org/works/10.1186/1687-6180-2014-139; asp-eurasipjournals.springeropen.com/articles/10.1186/1687-6180-2014-139 | Match; issue 1 added from Crossref |
| 30 | goulart2020 | DOI 10.1109/TSP.2020.2985591 | api.crossref.org/works/10.1109/TSP.2020.2985591; Semantic Scholar DOI record for the abstract | Match; name encoding corrected (Section 4.2) |
| 31 | kim2017 | PMID 28442772 | esummary + efetch id=28442772 | Match |
| 32 | ye2018 | DOI 10.1109/CVPR.2018.00977, arXiv 1712.05134 | api.crossref.org/works/10.1109/CVPR.2018.00977; arXiv API | Match |
| 33 | li2017btnets | arXiv 1712.05689 | arXiv API; api.datacite.org/dois/10.48550/arXiv.1712.05689 | Match; arXiv DOI added |
| 34 | ye2020 | PMID 32589587, arXiv 2010.04963 | esummary + efetch id=32589587; arXiv API | Match |
| 35 | vandenkerchove2025 | arXiv 2511.04292 | arXiv API; api.datacite.org/dois/10.48550/arXiv.2511.04292 | Match; arXiv DOI added |
| 36 | dooms2025 | arXiv 2504.02667 | arXiv API; api.datacite.org/dois/10.48550/arXiv.2504.02667 | Match; arXiv DOI added |
| 37 | bohle2022 | DOI 10.1109/CVPR52688.2022.01008, arXiv 2205.10268 | api.crossref.org/works/10.1109/CVPR52688.2022.01008; arXiv API | Match |
| 38 | rudin2019 | PMID 35603010 | esummary + efetch id=35603010 | Match |
| 39 | ghassemi2021 | PMID 34711379 | esummary + efetch id=34711379 | Match |
| 40 | koh2020 | arXiv 2007.04612; PMLR v119 | proceedings.mlr.press/v119/koh20a.html; arXiv API | Match (pages 5338-5348) |
| 41 | mahinpei2021 | arXiv 2106.13314 | arXiv API; api.datacite.org/dois/10.48550/arXiv.2106.13314 | Match; arXiv DOI added |
| 42 | havasi2022 | DOI 10.52202/068431-1699 | api.crossref.org/works/10.52202/068431-1699; proceedings.neurips.cc/paper_files/paper/2022/hash/944ecf65a46feb578a43abfd5cddd960-Abstract-Conference.html | Match |
| 43 | adebayo2018 | arXiv 1810.03292; NeurIPS 31 | proceedings.neurips.cc/paper_files/paper/2018/hash/294a8ed24b1ad22ec2e7efea049b8737-Abstract.html; arXiv API | Match |
| 44 | hooker2019 | arXiv 1806.10758; NeurIPS 32 | proceedings.neurips.cc/paper/2019/hash/fe4b8556000d0f0cae99daa5c5c5a410-Abstract.html; arXiv API | Match |
| 45 | jacovi2020 | DOI 10.18653/v1/2020.acl-main.386 | api.crossref.org/works/10.18653/v1/2020.acl-main.386; aclanthology.org/2020.acl-main.386/ | Match |
| 46 | sundararajan2017 | arXiv 1703.01365; PMLR v70 | proceedings.mlr.press/v70/sundararajan17a.html; arXiv API | Match (pages 3319-3328) |
| 47 | hughes2021 | PMID 34347007 | esummary + efetch id=34347007 | Match |
| 48 | storas2023 | PMID 37510089, DOI 10.3390/diagnostics13142345 | esummary + efetch id=37510089; api.crossref.org/works/10.3390/diagnostics13142345 (article number 2345) | Match |
| 49 | cox1972 | DOI 10.1111/j.2517-6161.1972.tb00899.x | api.crossref.org/works/10.1111/j.2517-6161.1972.tb00899.x | Match |
| 50 | katzman2018 | PMID 29482517 | esummary + efetch id=29482517 | Match |
| 51 | kvamme2019 | arXiv 1907.00825; JMLR 20(129) | jmlr.org/papers/v20/18-424.html; arXiv API | Match (pages 1-30) |
| 52 | chen2020simclr | arXiv 2002.05709; PMLR v119 | proceedings.mlr.press/v119/chen20j.html; arXiv API | Match (pages 1597-1607) |
| 53 | kiyasseh2021 | arXiv 2005.13249; PMLR v139 | proceedings.mlr.press/v139/kiyasseh21a.html; arXiv API | Match (pages 5606-5615) |
| 54 | mehari2022 | PMID 34973584 | esummary + efetch id=34973584 | Match |
| 55 | jeong2021 | PMID 34650175 | esummary + efetch id=34650175 | Match |
| 56 | bollmann2006 | PMID 17043067 | esummary + efetch id=17043067 | Match |
| 57 | platonov2014 | PMID 25362161 | esummary + efetch id=25362161 | Match; supplement encoded as NLM volume "16 Suppl 4" |
| 58 | nielsen2015 | PMID 25916567 | esummary + efetch id=25916567 | Match |
| 59 | huang2020 | PMID 32022368 | esummary + efetch id=32022368 | Match |
| 60 | wolder2023 | PMID 36435351 | esummary + efetch id=36435351 | Match (author "Ji-Young Lee C" as in PubMed) |
| 61 | vickers2006 | PMID 17099194 | esummary + efetch id=17099194 | Match |
| 62 | vancalster2019 | PMID 31842878 | esummary + efetch id=31842878 | Match |
| 63 | collins2024 | PMID 38626948 | esummary + efetch id=38626948 | Match |
| 64 | hanley1982 | PMID 7063747 | esummary + efetch id=7063747 | Match |
| 65 | carpenter2000 | PMID 10797513 | esummary + efetch id=10797513 | Match |

Advisory existence mark: under `citation_existence` advisory, a mark is due only for a cited identifier that provably fails lookup (the formatter instructions, Citation Existence Advisory). Every cited DOI, PMID and arXiv ID resolved to the record described in the bib, so no entry carries an existence mark and the `<!--ref:-->` markers are left unchanged. No retraction or expression of concern appeared in any PubMed record opened (the "Comment in" and "Erratum" links shown are commentaries and, for nolinlapalme2026, the erratum already recorded in the bib note).

## 3. Claims checked against the source record

Every specific number the draft attributes to a source was found in that source's abstract (PubMed efetch) or, for datasets, in the DataCite or Zenodo record description.

| Source | Draft statement (line) | Record text | Verdict |
|---|---|---|---|
| noseworthy2022 | 1,003 patients; monitored up to 30 days; 7.6% high risk vs 1.6% low risk; 3.6% usual care vs 10.6% AI-guided (23) | "1003 patients"; "up to 30 days"; "six (1.6%) of 370 ... 48 (7.6%) of 633"; "3.6% ... vs 10.6%" | Verified |
| noseworthy2022 | "during 30 days of monitoring" (298) | "for up to 30 days" (mean 22.3 days) | Minor numeric drift; corrected in draft_v4 (Section 5) |
| schnabel2009 | C statistic 0.78 (29) | "clinical model C statistic 0.78 (95% CI 0.76-0.80)" | Verified |
| alonso2013 | 18,556 participants; five-year C 0.765; ECG variables did not meaningfully change it (29) | "18 556 men and women"; "5-year ... C-statistic, 0.765"; with ECG "0.767" and "did not improve" | Verified |
| attia2019 | AUROC 0.87, identifying AF during sinus rhythm (29, 284) | "identified atrial fibrillation with an AUC of 0.87" | Verified |
| raghunath2021 | AUROC 0.85, new-onset AF within one year (29, 284); number needed to screen 9 in a simulated deployment (298) | "0.85 ... for predicting new-onset AF within 1 year"; "In a simulated deployment scenario ... number needed to screen ... was 9" | Verified |
| jabbour2024 | 669,782 ECGs; five-year AF or flutter; 0.78 internal; 0.77 in MIMIC-IV external (29, 284, 306) | "669 782 ECGs"; "atrial fibrillation or flutter (AF)"; "incident AF at 5 years"; ".78"; MIMIC-IV "(AUC-ROC = .77)" | Verified |
| yuan2023 | US veterans; AF within 31 days; AUROC 0.86 (29, 284) | "6 US Veterans Affairs"; "within 31 days"; "AUROC of 0.86" | Verified |
| khurshid2022 | 0.802, 0.823, 0.838 at one hospital (MGH); 0.732, 0.705, 0.746 in UK Biobank; complementary (31); combination above either alone in three cohorts (282) | MGH 0.802 / 0.823 / 0.838; UK Biobank 0.732 / 0.705 / 0.746; BWH 0.752 / 0.747 / 0.777; "Models were recalibrated to estimate 2-year AF risk in the UK Biobank given limited available follow-up"; "complementary" | Numbers verified; the draft called the UK Biobank values five-year AUROCs, which the record contradicts; corrected in draft_v4 (Section 5) |
| christopoulos2020 | C statistics 0.69, 0.69, 0.72 (31, 282) | "0.69 ... AI-ECG", "0.69 ... CHARGE-AF", "0.72 ... combined" | Verified |
| biton2021 | five-year AF AUROC 0.909 vs 0.839 best single modality (31, 282) | "within 5 years"; "AUROC = 0.909 against the best single modality model which had an AUROC = 0.839" | Verified |
| mckeen2025 | AF AUROC 0.996 on MIMIC-IV-ECG (284) | benchmark "on the MIMIC-IV-ECG dataset"; "atrial fibrillation (0.996)" | Verified |
| nolinlapalme2026 | labels from ECG reports (284); SSL 0.742 vs supervised 0.734 for five-year AF (286) | "automated free-text extraction from ECG reports"; "5 year atrial fibrillation risk prediction (AUROC 0.742 vs 0.734" | Verified |
| mehari2022 | best SSL within 0.5% of supervised in linear evaluation; fine-tuning about 1% (286) | "only 0.5% below supervised performance"; "improvements ... of roughly 1%" | Verified |
| gow2023 | about 800,000 ECGs, nearly 160,000 patients, 10 s, 500 Hz (67) | "approximately 800,000 ... nearly 160,000 unique patients ... 10 seconds ... 500 Hz" | Verified |
| ribeiro2021code15 | stratified 15% sample of CODE, Telehealth Network of Minas Gerais, 345,779 exams, 233,770 patients, AF flag per exam (137) | "345 779 exams from 233 770 patients"; "stratified sampling from the CODE dataset ( 15% of the patients)"; "Telehealth Network of Minas Gerais"; column "AF": "Whether or not the patient has atrial fibrillation" | Verified |
| wagner2020 | 21,837 records from 18,885 patients (137) | "21837 records from 18885 patients" | Verified |

The qualitative statements attributed to the other cited sources were read against their abstracts and match: kornej2020 (risk prediction, eHealth and AI in an epidemiology review), nielsen2015 (P-wave duration associated with AF), hughes2021 (LIME on a 12-lead CNN), storas2023 (Grad-CAM heat maps judged not meaningful by medical doctors), matsuo2026 (SHAP on models with clinical and ECG-derived variables), adebayo2018, rudin2019, ghassemi2021, delathauwer2008 (mode-n ranks; CP and Tucker as special cases), zhao2013, camarrone2019, faes2024, faes2022, hunyadi2014 (rank-(Lr, Lr, 1) terms on wavelet-transformed EEG), goulart2020 (structure and parameters estimated jointly; atrial activity during AF), kim2017 (supervised CP on MIMIC-III; ICU mortality), vandenkerchove2025, ye2018, li2017btnets, ye2020, dooms2025, koh2020 (x-ray grading, bird identification, test-time correction), bohle2022, mahinpei2021, jacovi2020 (graded faithfulness), sundararajan2017, johnson2023 (Beth Israel Deaconess), goldberger2000, collins2024, jeong2021, kolda2009, katzman2018, kvamme2019 (nested case-control risk sets), chen2020simclr, kiyasseh2021, hanley1982, carpenter2000, vancalster2019, vickers2006, ribeiro2020 (CODE study), huang2020 and wolder2023 (PTFV1 and AF), bollmann2006 (fibrillatory rate and intra-atrial cycle length, persistence), platonov2014, hammer2022 (MIT-BIH AF database, segments ending minutes before onset). cox1972 is cited for the partial likelihood it defines; its Crossref record was opened and it carries no abstract.

### Claim-level items flagged for review (advisory, mark only)

| # | Location | Issue | Suggested action |
|---|---|---|---|
| CA1 | Line 59, havasi2022 | The draft says "Havasi and colleagues found that training the label predictor on soft concept probabilities improves accuracy but lets information leak". Their abstract credits the accuracy gain to earlier work ("Recently, it was demonstrated that training the label predictor directly on the probabilities ... improves label predictions") and reports the corruption of concept predictions and intervention as the problem they address. No number involved. | Suggested wording: "Havasi and colleagues showed that training the label predictor on soft concept probabilities, which improves accuracy, lets information leak, which corrupts concept predictions and weakens intervention". |
| CA2 | Line 284, ko2026 | "another did not report its AF label source in MIMIC-IV" is an absence claim. The abstract does not state the AF label source; an absence in the abstract does not establish an absence in the paper. Anchor `section:Abstract` does not cover it. | Confirm against the full text (not opened under the no-download rule), or reword to "whose abstract does not state its AF label source in MIMIC-IV". |
| CA3 | Line 35, matsuo2026 | "no test of faithfulness to the model was reported" is an absence claim; the abstract reports SHAP analysis and no faithfulness test, which is consistent but not conclusive. | Confirm against the full text; the statement is consistent with the record that was read. |
| CA4 | Lines 37, 127, hooker2019 | "under removal and retraining" and "the remove-and-retrain benchmark" describe the method of the paper; the NeurIPS and arXiv abstracts state the result (most estimates no better than random importance) without naming removal and retraining. The method is in the paper body; anchor `section:Abstract` covers only the result. | Change the anchor to the method section when the marker is next edited; no text change needed. |

Two further readings were checked and need no action: attia2019 described as "identifying concurrent or recent AF" agrees with the record (AF verified before the sinus-rhythm ECG; christopoulos2020 describes the same algorithm as detecting "concurrent episodic" AF); storas2023 says the heat maps gave no meaningful information "to medical doctors", which the draft renders as "physicians who reviewed the Grad-CAM heat maps".

## 4. Vancouver compliance

Standard applied: `references/citation_format_switcher.md` (Vancouver: numbered in order of first appearance; "Smith JA, Jones BC. Article title in sentence case. Journal Title. 2024;45(2):123-145. doi:10.xxxx"; no spaces in initials; NLM journal abbreviations; semicolon before volume, colon before pages), and the agent's rule of six authors then "et al." (the citation compliance instructions, Core Verification Rules, Vancouver column: 7+ authors become et al.).

### 4.1 In-text form

All 120 citations are `[key]` markers that the formatter numbers in order of first citation (`draft_v3.md` line 372). Adjacent markers (for example lines 35, 109, 125, 290) render as one numbered group. No in-text author-year forms remain. One sentence carries more than five citations: line 290 cites rudin2019, koh2020 and bohle2022 against hughes2021, storas2023 and matsuo2026 (6 in one sentence). It is a contrast of two groups of three; flagged for review under the over-citation rule, with no change made.

### 4.2 Author format

The bib holds authors as "Surname, Initials" or "Surname, Given names"; the Vancouver style renders both as "Surname Initials" without periods or spaces. Every entry truncated with "and others" names six authors before it (14 entries, counted with awk), so each renders as six names followed by "et al."; entries with seven or more listed authors are cut to six by the style. Four name encodings would have rendered wrongly and were corrected:

| Key | stage1 encoding | stage5 encoding | Rendered (Vancouver/NLM) |
|---|---|---|---|
| schnabel2009 (6th author, rendered) | `{D'Agostino Sr}, R. B.` | `D'Agostino, Sr, R. B.` | D'Agostino RB Sr (as in PubMed) |
| ribeiro2021code15 (8th author) | `{Meira Jr}, Wagner` | `Meira, Jr, Wagner` | Meira W Jr |
| goulart2020 (1st author) | `Goulart, Jos{\'e} Henrique de Morais` | `Goulart, J. H. M.` | Goulart JHM (the lowercase "de" would otherwise enter the initials) |
| harrell1982 (uncited, kept consistent) | `{Harrell Jr}, F. E.` | `Harrell, Jr, F. E.` | Harrell FE Jr |

### 4.3 Journal titles

39 journal fields were changed from full titles to NLM title abbreviations. For journals indexed in PubMed, the abbreviation is the `Source` field of the esummary record opened for that entry. For the others, it is the `MedlineTA` of the NLM Catalog record: SIAM J Matrix Anal Appl (NLM ID 101661524), SIAM Rev Soc Ind Appl Math (101300458), EURASIP J Adv Signal Process (101480232), IEEE Trans Signal Process (9885223), J Mach Learn Res (101262635). Journal of the Royal Statistical Society Series B (Methodological) (7503113) has no MedlineTA; its catalog abbreviation "J. R. Stat. Soc. Ser. B. Methodol." is used in NLM form, "J R Stat Soc Ser B Methodol". Full list of journal values now in the file: Ann Noninvasive Electrocardiol, BMC Med Res Methodol, BMC Med, BMJ, Circ Arrhythm Electrophysiol, Circ Res, Circulation, Comput Biol Med, Diagnostics (Basel), Eur Heart J Digit Health, Eur Heart J, EURASIP J Adv Signal Process, Europace, Heart Rhythm, IEEE Trans Biomed Eng, IEEE Trans Neural Netw Learn Syst, IEEE Trans Pattern Anal Mach Intell, IEEE Trans Signal Process, J Am Heart Assoc, J Mach Learn Res, J Neural Eng, J R Stat Soc Ser B Methodol, JACC Adv, JAMA Cardiol, JAMA, JAMIA Open, Lancet Digit Health, Lancet, Med Decis Making, Nat Commun, Nat Mach Intell, Neural Netw, Radiology, Sci Data, Sci Rep, SIAM J Matrix Anal Appl, SIAM Rev Soc Ind Appl Math, Stat Med.

### 4.4 Year, volume, issue, pages, DOI

- Every journal article carries year, volume and pages; an issue is present wherever the record has one. hunyadi2014 lacked the issue that Crossref gives (issue 1); it was added.
- platonov2014: the supplement was encoded as `number = {Suppl 4}`, which renders "16(Suppl 4)". NLM form is "2014;16 Suppl 4:iv110-iv119", so the volume is now `16 Suppl 4` and the number field is removed.
- Page ranges are kept in full form (861-867), as in the procedure's Vancouver template.
- DOIs: every cited source with a DOI carries it. Four arXiv-only sources had none; their arXiv DataCite DOIs were confirmed on DataCite and added: li2017btnets (10.48550/arXiv.1712.05689), vandenkerchove2025 (10.48550/arXiv.2511.04292), dooms2025 (10.48550/arXiv.2504.02667), mahinpei2021 (10.48550/arXiv.2106.13314). A Crossref bibliographic search found no published version of any of the four. Seven sources remain without a DOI because the version cited (PMLR, NeurIPS 2018 and 2019, JMLR) has none: koh2020, adebayo2018, hooker2019, sundararajan2017, kvamme2019, chen2020simclr, kiyasseh2021. Each carries its proceedings or journal URL. Their arXiv DOIs were not added, because that would attach a preprint identifier to a citation of the proceedings version.
- DOIs are stored bare in the `doi` field; there is no `dx.doi.org` prefix and no trailing period.
- Titles are in sentence case with protected acronyms; no title-case article titles were found.

## 5. Draft-text corrections (`run/citations/draft_v4.md`)

`diff run/draft/draft_v3.md run/citations/draft_v4.md` shows exactly two changed lines; nothing else differs.

| # | Line | draft_v3 text | draft_v4 text | Basis |
|---|---|---|---|---|
| D1 | 31 | "... and 0.732, 0.705 and 0.746 in UK Biobank, and called the two approaches complementary" | "... and 0.732, 0.705 and 0.746 in UK Biobank, where limited follow-up led them to recalibrate the models to two-year risk, and called the two approaches complementary" | khurshid2022 abstract (PMID 34743566): "Models were recalibrated to estimate 2-year AF risk in the UK Biobank given limited available follow-up". The sentence had attributed a five-year horizon to the UK Biobank values. |
| D2 | 298 | "raised AF detection in high-risk patients during 30 days of monitoring" | "raised AF detection in high-risk patients during up to 30 days of monitoring" | noseworthy2022 abstract (PMID 36179758): "continuous ambulatory heart rhythm monitor for up to 30 days", mean 22.3 days. Line 23 already says "up to 30 days". |

Items CA1 to CA4 are not number errors and were not changed in the draft.

## 6. Currency and self-citation

### 6.1 Currency

Reference date 2026-11-15. 14 of the 65 cited sources (21.5%) were published before 2016, which makes them older than 10 years. Their roles in the draft, and a judgment on whether each is seminal:

| Key | Year | Role in draft | Judgment |
|---|---|---|---|
| cox1972 | 1972 | Cox partial likelihood used as the loss | Seminal |
| hanley1982 | 1982 | Meaning of AUROC as a rank probability | Seminal |
| carpenter2000 | 2000 | Bootstrap percentile CI method | Standard methodological reference |
| goldberger2000 | 2000 | PhysioNet; the citation PhysioNet requires | Required resource citation |
| vickers2006 | 2006 | Decision curve analysis | Seminal |
| bollmann2006 | 2006 | Surface-ECG atrial fibrillatory rate (review) | Not clearly seminal; flagged |
| delathauwer2008 | 2008 | Definition of the block-term decomposition | Seminal |
| kolda2009 | 2009 | Tensor notation | Seminal |
| schnabel2009 | 2009 | Framingham AF risk score | Seminal |
| alonso2013 | 2013 | CHARGE-AF | Seminal |
| zhao2013 | 2013 | HOPLS, origin of the block-term regression line | Foundational for the lineage cited |
| hunyadi2014 | 2014 | Block terms as physiological components (EEG) | Not clearly seminal; flagged |
| platonov2014 | 2014 | Atrial fibrillatory rate in the clinical context (review) | Not clearly seminal; flagged |
| nielsen2015 | 2015 | P-wave duration as an AF predictor (285,933 individuals) | Key cohort study, not clearly seminal; flagged |

These are judgments: the four flagged sources are each cited once or for one established point, and none is contradicted by newer work in the corpus. Keeping them is defensible. A newer review of fibrillatory-rate analysis would replace bollmann2006 and platonov2014 if a reviewer asks for currency.

Sources published in 2022 or later: 21 of 65 (32.3%). Eight further sources are dated 2021. Two of them may fall inside the five-year window that starts on 2021-11-15, depending on which date is used: ghassemi2021 (November 2021 issue, day not given) and biton2021 (December 2021 print issue, online in August). Counting them gives 23 of 65 (35.4%).

### 6.2 Self-citation

Sources with Faes as an author: faes2024 and faes2022. Ratio: 2 of 65 references (3.1%); 3 of 120 in-text citations (2.5%). This is below the 15% threshold. The author list is [GAP-AUTH] in the draft, so co-authors are not known. If Van Hulle is a co-author, camarrone2019 and vandenkerchove2025 also count, giving 4 of 65 references (6.2%) and 5 of 120 citations (4.2%), still below 15%.

## 7. Corrected reference list

`run/citations/references.bib` is the corrected list (68 entries, same keys as stage1, verified with `diff` of the key lists). The formatter renders it in Vancouver style, numbered by first citation, from the 65 cited keys. Changes against `run/search/references.bib`: 46 entries differ (44 cited), covering 39 journal fields, 4 author encodings, 1 volume (platonov2014), 1 issue added (hunyadi2014) and 4 DOIs added, plus the two header comment lines, which now point to this report.

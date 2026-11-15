## Peer review report

### Summary
| Metric | Value |
|---|---|
| Title | An interpretable block-term tensor network with a separate clinical term for predicting incident atrial fibrillation from one sinus-rhythm 12-lead ECG |
| Review number | 7 |
| Draft review round | 1 (of the pass the third expanded revision started) |
| Verdict | Minor Revision |
| Overall score | 7.40/10 |

The score maps to Minor Revision. RI6.1 to RI6.7 are resolved, each confirmed in a fresh compile of the manuscript and the cover letter: both now typeset without an error, the reference list numbers all 64 entries, and no table is wider than the text. Three new Minor issues (RI7.1 to RI7.3) and one Suggestion (RI7.4) are raised. RI1.57 (the Zeiler 2014 reference) is reopened for the draft writer, since its fix is a format change and no fact of the authors. The issues marked "needs the user" keep their ids, among them the Critical RI1.7, RI1.8 and RI1.9 (CRediT, funding, competing interests). No revision by the draft writer can resolve those three, and a Critical issue left unresolved after round 2 stops the run whatever the score.

### Initial impression
The third expanded revision did what review 6 asked. The compiled reference list is now whole, each cited preprint can be found from its reference, Tables 1, 3 and 5 fit the text block, and the cover letter typesets. The argument, the numbers and the scope are unchanged and sound. What remains for the draft writer is small: one line of the Reproducibility statement runs into the margin, the letter's closing falls alone on a second page, and five references print less than the run knows about them. Impression score: 7.5/10.

### Dimension scores
This is round 1 of a pass, so all five dimensions are scored.

| Dimension | Weight | Score | Weighted | Key evidence |
|---|---|---|---|---|
| Originality | 20% | 7 | 1.40 | 1.3, first contribution: "BTTN, a survival network whose ECG evidence passes through per-block frequency and lead factors, with a separate linear clinical term that does not pass through those factors", made precise by Equation 3 in 3.3. 2.4 places the model against the block-term literature it extends ("No model in this literature trains readable block-term frequency and lead factors end to end with a survival objective for incident AF"). The interpretability half rests on the architecture only (3.3: "this study reports no reading of the learned frequency and lead factors"; RI1.16, needs the user). |
| Methodological Rigor | 25% | 7 | 1.75 | 4.1 and 4.2 state the cohort, the blanking window, the two designs, the folds, the shared inputs of all baselines and the bootstrap. 6.3 states the limits of labels, comparator, recalibration and readout in turn. Open: RI1.17 (how the settings of BTTN were chosen) and RI1.66 (no paired interval for the fused against the clinical model), both needs the user. |
| Evidence Sufficiency | 25% | 8 | 2.00 | Every number of Tables 1 to 5 equals the saved gold-label results, read for this review: the one-year AUROCs and intervals, the four horizons with their patients and cases, the operating points and Brier scores, the decile proportions, the occlusion windows and the gold-label cohort counts. The latest citation check verifies all 127 cited claims. Some secondary claims rest on abstracts only (40 of 64 cited sources had an abstract only, as the latest citation report states). |
| Argument Coherence | 15% | 8 | 1.20 | 5.2 now states the comparison of the fused model with ECG-only BTTN that the Conclusion's third paragraph uses, and names the fused model's interval in the overlap sentence. The Conclusion answers both questions of 1.3 in its first two paragraphs. No passage contradicts another. |
| Writing Quality | 15% | 7 | 1.05 | Up from 6. The format faults of review 6 are fixed in the compiled document. Left: one line 30 pt into the right margin (RI7.1), the letter's closing alone on page 2 (RI7.2), four references without their article numbers (RI7.3), the Zeiler 2014 reference without its proceedings (RI1.57), and text inside the Figure 3 image that the caption contradicts (RI1.18, needs the user). No software wording. |
| Overall | | | 7.40 | Minor Revision |

The impression score (7.5) and the overall score (7.40) differ by less than 2 points.

### Strengths
1. The reference list is complete and each source can be found. The compiled list numbers 64 entries; reference 13 reads "Ye J, Li G, Chen D, Yang H, Zhe S, Xu Z. Block-term Tensor Neural Networks [Preprint]. arXiv:2010.04963; 2020. Available from: https://doi.org/10.48550/arXiv.2010.04963.", the form review 6 asked for, and reference 15 reads "European Heart Journal. 2026 Oct;47(Suppl 1). Available from: https://doi.org/10.1093/eurheartj/ehag785.598." Koh 2020 and Gow 2023 end their author lists "et al." with one full stop, and reference 39 reads "Van Den Kerchove A, Si-Mohammed H, Cabestaing F, Van Hulle MM."
2. 5.2 states the comparison with the model the interval belongs to: "It also lay above the interval of ECG-only BTTN, 0.7397 [0.7275, 0.7517], so the fused model discriminated better than ECG-only BTTN. The fused model's interval overlapped the interval of the clinical model, 0.7597 [0.7488, 0.7713]." The values equal the saved one-year intervals, and two non-overlapping 95% intervals on the same patients support the stated direction.
3. Table 3 now sets each interval on the line below its estimate, and the caption says so ("with its 95% bootstrap percentile interval on the line below"). Every value equals the saved four-horizon results (for example 0.723 [0.701, 0.745] at 120 days with 410 cases among 20,000 patients).
4. The Discussion keeps the size of the gain apart from its uncertainty. 6.1: "The gain of the fused model over the clinical model is small and consistent in direction. The one-year intervals overlap, and the study reports no interval of the difference that would establish it." The Conclusion's first paragraph repeats this limit.
5. Table 1 states its exclusion criterion where the count stands: "Prevalent or concurrent AF counts the patients with an AF diagnosis, or an ECG read as AF, before the end of the 30-day blanking window after the index ECG. These patients were excluded, and the count is not an outcome." Each count equals the gold-label cohort counts (151,941; 14,469; 88,945; 7,481; 43,625; 50,545).

### Section review
The D6 patches touched 1.1, Tables 1, 3 and 5 and the first paragraph of 5.2; the other sections are word-identical to the text review 6 read (word diff of the draft before and after patch 18). Each section was read again in full for this round.

| Section | Purpose in the outline met | Evidence and chain | Strength | Issues |
|---|---|---|---|---|
| Abstract | Yes | Every number equals Tables 2 and 3, 5.3 and Table 5 | | none (284 words; RI1.67) |
| 1.1 to 1.3 | Yes | Cited; the two Framingham sentences name one study | Strength 4 (scope) | none |
| 2.1 to 2.4 | Yes | Cited; the gap is closed at the end of 2.3 and 2.4 | | none |
| 3.1 to 3.3 | Yes | Equations 1 to 3 define the model; readability stated as a property of the architecture | | RI1.16, RI1.17 (needs the user) |
| 4.1 to 4.3 | Yes | Cohort, folds, metrics and readout stated; Experiments 982 words against 575, kept by the recorded decision | | none |
| 5.1 and Table 1 | Yes | Counts equal the gold-label cohort counts | Strength 5 | none |
| 5.2 and Tables 2 and 3 | Yes | Values equal the saved one-year and four-horizon results | Strengths 2 and 3 | none |
| 5.3, Figure 2 and Table 4 | Yes | Deciles, Brier scores and operating points equal the saved results | | RI1.18 (image text, needs the user) |
| 5.4, Figure 3 and Table 5 | Yes | Window values equal the saved occlusion results | | RI1.18 (needs the user) |
| 6.1 to 6.4 | Yes | Cited; 6.3 states the limits of labels, comparator, recalibration and readout | Strength 4 | RI1.66 (needs the user) |
| 7 | Yes | Answers both questions of 1.3 | | none |
| Statements | Present with placeholders | | | RI1.7 to RI1.9, RI1.19 to RI1.22, RI4.4 (needs the user); RI7.1 |
| References | Yes, with gaps | 64 numbered entries, all cited keys present | Strength 1 | RI7.3, RI1.57, RI7.4; RI1.54 to RI1.56, RI1.58, RI1.62 (needs the user) |
| Cover letter | Yes | Numbers agree with Table 2 | | RI7.2; RI1.63 (needs the user) |

### Earlier issues
The manuscript, the reference file and the cover letter are byte-identical to the outputs of patches 18, 19 and 20 (`cmp` of each pair printed nothing), and the base of each patch is the file review 6 read (the SHA-256 of the outputs of patches 16, 11 and 17 equals the base hash in each apply report). The word diff of patch 18 shows five changed blocks, each one of the revision log's rows; the diff of patch 19 shows the twelve entries of RI6.1, RI6.2 and RI6.7 and nothing else; the diff of patch 20 shows only the four line breaks of the signature. The compile for this review copied the manuscript folder into the run's compile-review7 folder and ran `latexmk -pdf -interaction=nonstopmode` on both files.

| Issue | Revision log status | Reading in this round | Status |
|---|---|---|---|
| RI6.1 | RESOLVED | The issue field now reads "Suppl 1". The compile reports no error (`grep '^!'` on both logs printed nothing; no "Lonely \item" or "Missing" line), reference 15 prints as quoted in strength 1, and the list numbers 64 entries ([1] to [64]; 64 entries in the processed bibliography). | Resolved |
| RI6.2 | RESOLVED | The ten cited preprints print "[Preprint]. arXiv:<number>; <year>. Available from: https://doi.org/10.48550/arXiv.<number>." (references 13, 30, 31, 33, 34, 35, 36, 37, 39, 52, read in the compiled list). Koh 2020 and Gow 2023 now end "et al." with one full stop, as the revision log predicted from the new entry type. MIMIC-IV-ECG prints "[Dataset]. PhysioNet; 2023. Available from: https://physionet.org/content/mimic-iv-ecg/1.0/." | Resolved |
| RI6.3 | RESOLVED | 5.2 reads as quoted in strength 2, followed by "The study reports no paired interval for the difference between the fused and clinical models, so their estimates are reported side by side." The departure from the suggested "than its ECG term alone" holds: ECG-only BTTN is a separately trained model, so naming it is the more exact wording. The Conclusion is unchanged. | Resolved |
| RI6.4 | RESOLVED | The compile reports no overfull line inside Tables 1, 3 or 5; the one overfull line of the document is in the Reproducibility statement (RI7.1). Pages 15, 17 and 21 of the compiled document show the three tables inside the text block. The values of all three tables are unchanged (word diff). | Resolved |
| RI6.5 | RESOLVED | The letter typesets: two pages, no error. Its closing now falls alone on page 2 (RI7.2). | Resolved |
| RI6.6 | RESOLVED | 1.1: "In the Framingham Heart Study, AF was associated with a near fivefold excess of stroke." Both citations stay. | Resolved |
| RI6.7 | RESOLVED | Reference 39 reads as quoted in strength 1. | Resolved |
| RI5.1 to RI5.7 | Resolved in review 6 | The resolved wording stands; patch 18 changed 5.2's first paragraph only as RI6.3 asked, and the comparison RI5.6 added is still stated. | Resolved |
| RI5.8 | Needs the user | Khurshid 2025 and Faes 2024 still rest on the versions read in the run (citation report C2). | Open, Minor, needs the user |
| RI4.4 | Needs the user | The source comment above the AI declaration still reads "% Placement: unnumbered section before the references (generic detailed form; the policy of Artificial Intelligence in Medicine was not given and was not checked)" (line 369). | Open, Minor, needs the user |
| RI4.1 to RI4.3, RI3.1 to RI3.11, RI2.1 to RI2.5, RI2.7 | Resolved in earlier reviews | The resolved wording stands; the D6 patches touched none of these passages. | Resolved |
| RI2.6 | Needs the user | 68 entries, 67 DOI fields (`grep -c` of entry heads and of DOI fields); the one without is the unused CLOCS preprint. | Open, needs the user |
| RI1.7, RI1.8, RI1.9 | Needs the user | CRediT, Funding and Declaration of competing interest hold only "[GAP: CRediT roles of each author]", "[GAP: funding]" and "[GAP: conflicts of interest]". | Open, Critical, needs the user |
| RI1.16 | Needs the user | No factor reading on ICD-coded labels; 3.3, 6.3 and 6.4 say so. | Open, Major, needs the user |
| RI1.17 | Needs the user | A search for "chosen", "tuned", "tuning" and "in advance" finds nothing in the manuscript. | Open, Major, needs the user |
| RI1.18 | Needs the user | The three images are unchanged (file dates 14 November 23:53, before every revision). | Open, Major, needs the user |
| RI1.19 to RI1.22 | Needs the user | 11 lines with a placeholder in the manuscript and 8 in the cover letter (`grep -c 'GAP:'`). | Open, Major, needs the user |
| RI1.54 | Needs the user | check-urls after the D6 patches: 64 lines, 36 answering 200, 2 answering 202, 26 answering 403 (counted with `grep -c` on that section); the section is identical to the one after the D5 patches (`diff` printed nothing). Each 403 DOI resolves in Crossref to the entry's title. No line holds "title not checked", DOI_MISMATCH, "failed", "no identifier" or "no entry". | Open, needs the user |
| RI1.55 | Needs the user | cite-keys after the D6 patches prints the same four unused entries: Wagner_2020, the CODE-15% record, Mehari_2022, arxiv_2005_13249; no missing key. | Open, needs the user |
| RI1.56 | Needs the user | Reference 25 still prints "Cheng S." as the only author and the first page only; no record read in the run gives the co-authors (citation report C20). | Open, needs the user |
| RI1.57 | Needs the user | Reopened for the draft writer as a Minor issue (see Issues): the fix is a choice of entry type between two types that print the same fields, which is a format change with one printed result and no fact of the authors. | Open, Minor, for the draft writer |
| RI1.58 | Needs the user | Eleven of the fifteen entries without an article number or page range have no value in any record read in the run, nor Riek 2026 and Malmo 2016 their volume (citation report C21). The four whose article numbers the run read are split off as RI7.3. | Open, needs the user (narrowed) |
| RI1.62, RI1.63 | Needs the user | The non-standard citation keys and the cover-letter placeholders are unchanged. | Open, needs the user |
| RI1.66, RI1.67 | Needs the user | No paired interval; no venue guide. | Open, needs the user |
| RI1.59, RI1.60, RI1.61 | Superseded or closed | As in review 6. | Resolved |
| RI1.1 to RI1.6, RI1.10 to RI1.15, RI1.23 to RI1.53, RI1.64, RI1.65, RI1.68, RI1.69 | Resolved in review 2 | The resolved wording stands. | Resolved |

### Issues
#### Critical
| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---|---|---|---|---|

No new Critical issue. RI1.7, RI1.8 and RI1.9 stay open (needs the user).

#### Major
| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---|---|---|---|---|

No new Major issue. RI1.16 to RI1.22 stay open (needs the user).

#### Minor
| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---|---|---|---|---|
| RI7.1 | Reproducibility statement, first paragraph, second sentence | One line of the statement runs about 1 cm past the right margin, because the line breaker finds no break before "manuscript's". | Compiled page 27: the line "Method and Experiments sections. The AI-assisted components of the manuscript's" extends beyond the text block; the compile reports "Overfull \hbox (30.26068pt too wide)" for this paragraph, the only overfull line of the document. Source sentence: "The AI-assisted components of the manuscript's preparation are described in the declaration of generative AI use, and the reported numbers come from the analysis of the study." | Reword the sentence so that the possessive does not fall at the line end, for example: "The declaration of generative AI use describes the AI-assisted parts of the preparation of the manuscript, and the reported numbers come from the analysis of the study." Compile and confirm that no line of the document is reported wider than the text. | Quick fix |
| RI7.2 | Cover letter, closing | The letter breaks after its last bullet, so page 2 holds only "Sincerely," and the six signature lines. A one-page letter whose closing stands alone on a second page reads as unfinished. | Compiled letter: 2 pages; page 1 ends with "AI-assisted tools were used in the preparation of the manuscript and are disclosed in it."; page 2 holds "Sincerely," and "[GAP: corresponding author name and title]" to "ORCID: [GAP: ORCID]" (300 words on page 1, 17 on page 2). | Bring the letter onto one page by merging the four confirmations into one sentence that keeps the three placeholders, for example: "We confirm that the manuscript has not been published before [GAP: ...], that it is not under consideration elsewhere [GAP: ...], that all authors have read and approved it [GAP: ...], and that the AI-assisted tools used in its preparation are disclosed in it." Keep every placeholder for the authors (RI1.63). Compile and confirm that the letter is one page. | Quick fix |
| RI7.3 | References: Ribeiro 2020 (ref. 22), Katzman 2018 (ref. 45), Johnson 2023 (ref. 46), Patlatzoglou 2025 (ref. 38) | Four journal articles print volume and issue but not their article number, although the run read the article number of each in its full text, so the reference does not locate the article in its volume. | Compiled list: "Nature Communications. 2020 Apr;11(1).", "BMC Medical Research Methodology. 2018 Feb;18(1).", "Scientific Data. 2023 Jan;10(1).", "npj Digital Medicine. 2025 Dec;8(1)." The citation report (C21) quotes the full texts read in the run: "NATURE COMMUNICATIONS \| (2020)11:1760", "BMC Medical Research Methodology (2018) 18:24", "Scientific Data \| (2023) 10:1" and "npj Digital Medicine \| (2025)8:747". | Give each reference its article number in the place of the page range, so that they print "2020 Apr;11(1):1760.", "2018 Feb;18(1):24.", "2023 Jan;10(1):1." and "2025 Dec;8(1):747." The other entries of C21, whose numbers no record read in the run holds, stay with the authors (RI1.58). | Quick fix |
| RI1.57 | References: Zeiler 2014 (ref. 50, cited in 4.3) | The reference prints the paper's title as if it were a book, after "In:", and loses the proceedings in which the paper appeared. | Compiled list: "Zeiler MD, Fergus R. In: Visualizing and Understanding Convolutional Networks. Springer International Publishing; 2014." The bibliography processor warns "empty chapter in Zeiler_2014". The entry holds the proceedings title of ECCV 2014 in its book-title field, which this entry type does not print (citation report C22). | Give the reference the conference-paper type, the usual form for an ECCV paper, with the same fields, so that it prints the paper title, then "In: Computer Vision, ECCV 2014" with the publisher, year and pages. Compile and read reference 50. | Quick fix |

RI2.6, RI4.4, RI5.8, RI1.54 to RI1.56, RI1.58, RI1.62, RI1.63, RI1.66 and RI1.67 stay open as issues that need the user.

#### Suggestions
| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---|---|---|---|---|
| RI7.4 | References: MIMIC-IV-ECG (ref. 43, cited in 3.1, 4.1 and the Data availability statement) | The dataset reference prints its landing page and not its DOI, while every other reference with a DOI prints a doi.org link. The entry holds the DOI 10.13026/4NQG-SB35. | Compiled list: "Gow B, Pollard T, Nathanson LA, Johnson A, Moody B, Fernandes C, et al. MIMIC-IV-ECG: Diagnostic Electrocardiogram Matched Subset [Dataset]. PhysioNet; 2023. Available from: https://physionet.org/content/mimic-iv-ecg/1.0/." The citation report (C24) records the choice as the authors' and names this form. | Print the persistent identifier like the other references: "Available from: https://doi.org/10.13026/4nqg-sb35." The landing page names the same version, so the change is for consistency of the list. | Quick fix |

### Cross-section checks
| Check | Status | Notes |
|---|---|---|
| The title matches the content | Pass | "Interpretable" is tied to "readable by design" in 3.3, and the paper says no factor is read. |
| The abstract reflects the results | Pass | Every number agrees with Tables 2 and 3, 5.3 and Table 5, and with the saved results. |
| The research question of the introduction is answered by the conclusion | Pass | Both questions of 1.3 are answered in the first two paragraphs of 7; the third paragraph's comparison is stated in 5.2. |
| Every table and figure is referred to in the text | Pass | Tables 1 to 5 and Figures 1 to 3 are each referred to; the compile reports no undefined reference or citation (`grep -ci undefined` on the log printed 0). |
| The citation form is consistent | Pass, with RI7.3, RI1.57 and RI7.4 | In-text citations are numeric Vancouver throughout. The printed list is consistent except four missing article numbers (RI7.3), the Zeiler entry (RI1.57) and the dataset link (RI7.4). |
| Every cited key has an entry (cite-keys) | Pass for missing; unused lines need the user | Output "After the D6 patches": no `missing:` line; four `unused:` lines, Wagner_2020, https://doi.org/10.5281/zenodo.4916206, Mehari_2022, arxiv_2005_13249. RI1.55, needs the user. |
| No cited entry fails the DOI and URL status rules (check-urls) | Fail | Output "After the D6 patches": 64 lines, 36 answering 200, 2 answering 202, 26 answering 403. Each 403 line fails the 2xx rule of "DOI and URL"; each of the 26 DOIs resolves in Crossref to the entry's title (ratio 1.00, 0.87 for Christopoulos 2020, 0.76 for Magnani 2013). No line holds "title not checked". RI1.54, needs the user. |
| The word count is within the target | Pass | Text of Sections 1 to 7 by `texcount -sub=section`: 879 + 1,421 + 983 + 982 + 801 + 1,578 + 341 = 6,985 words against 6,500 (plus 7.5 percent). Experiments is 982 against 575, kept by the recorded decision. |
| No passage makes a claim that Claims not to make lists | Pass | (a): no outcome number from the ECG reports; the Table 1 caption calls the 14,469 exclusion no outcome, as the ruling on C5 requires. (b): no rising-risk reading. (c): no PTB-XL result; 2.4 cites the PTB-XL record for its task only (ruling on C4). (d): no passage says the block-term structure is needed for accuracy. (e): 6.1 calls AF diagnosis from the ECG another task. (f): every number of Tables 1 to 5, read for this review, equals a saved gold-label result. |
| No passage carries software wording | Pass | A search for file, script, pipeline, run, job, workflow, seed, cache, exit, log and code finds the same uses as in review 6: "training runs" of the cited networks (1.2), the seeded initialisations (3.2, 4.2, Reproducibility statement), "log-risk", the code availability statements, and "workflow" in the AI declaration, which describes the tool. |
| Claims against the list | Notes | Claims of the text not on the list (C5 to C15 of the citation report) are each supported by a cited source or by the saved results and belong to the argument; C15, the fused model above ECG-only BTTN, is supported by the saved one-year intervals and is the base of the Conclusion's third paragraph. Intended claims not made as listed: C16 (the text makes the narrower claim that section 10.2 of the guideline holds), C17 (intended claim 11 is not made, on purpose, under the rule against negative results), C18 (the text states PPV at the one-year design's proportion and says why), C19 (the text names the Framingham variables, since no source read lists the CHARGE-AF variables). Each is right as the text has it. |
| No passage presents a negative or null result as a finding | Pass | No sentence compares a model of the paper with a baseline it does not beat; the tables are built around the fused model, which has the highest value in each. |
| Closing: every outline section stands with text | Pass | 1.1 to 1.3, 2.1 to 2.4, 3.1 to 3.3, 4.1 to 4.3, 5.1 to 5.4, 6.1 to 6.4 and 7 hold text (headings listed with `grep`). |
| Closing: every image path names an existing file | Pass | figures/fig-bttr-to-bttn.png, figures/fig-clinical-utility.png and figures/fig-beat-saliency.png exist (`ls`), and the compiled document places all three. |
| Closing: every cited key has an entry; an unused line is an issue marked needs the user | Pass; done | No missing key. Unused: RI1.55. |
| Closing: heading levels follow the outline | Pass | Seven numbered sections with the outline's subsections; 7.1 folded into 7. |
| Closing: font, spacing, margins, page numbers | Pass, with RI7.1 | Elsevier article class, preprint mode, 12 pt, page numbers at the foot, 36 pages, US letter. One line exceeds the text width (RI7.1). settings.md states no limits (RI1.67). |
| Closing: title page, running head, abstract page, heading format and table and figure format | Pass | Title page and abstract page as the class sets them (page 1); headings in the class's numbered format; all five tables inside the text block with booktabs rules. No venue template held (RI1.67). |
| Closing: the venue's stated requirements are met | Not verifiable | settings.md states none (RI1.67). |
| Closing: title page holds title, authors, affiliations, corresponding author | Fail | Title present; authors, affiliations and corresponding author are placeholders. RI1.19, needs the user. |
| Closing: abstract present and within the limit, keywords present | Pass | 284 words by `wc -w` of its line, against "about 250" in the outline; settings.md states no limit (RI1.67). Six keywords. |
| Closing: data availability, ethics, CRediT, conflict of interest, funding and AI disclosure statements | Present, with placeholders | RI1.7 to RI1.9, RI1.20 to RI1.22 and RI4.4, needs the user. |
| Closing: a limitations section | Pass | 6.3. |
| Closing: every source with a DOI carries it | Pass | 68 entries, 67 DOI fields; the one without is the unused CLOCS preprint (RI2.6, needs the user). Every cited reference with a DOI prints a doi.org link except the dataset record (RI7.4). |
| Closing: the reference file that the bibliography command names exists | Pass | `\bibliography{refs}` names refs.bib in the manuscript folder, which exists with 68 entries; the compile read it. |
| Non-ASCII characters and dashes in the draft | Pass | `LC_ALL=C grep -n '[^ -~]'` on the manuscript and the cover letter printed nothing; `grep -c -- '--'` printed 0 for both. |
| The draft compiles | Pass | `latexmk -pdf -interaction=nonstopmode` in the run's compile-review7 folder: four typesetting passes and the bibliography passes, no error, 36 pages; the cover letter typesets in two passes, no error, 2 pages (RI7.2). The bibliography processor reports two warnings: the empty chapter of Zeiler 2014 (RI1.57) and "empty author and editor" for the Zenodo record, which nonetheless prints its authors ("Cornelissen D, Faes A."), so that warning has no effect on the list. |

### Revision instructions
Minor Revision. The items for the draft writer, with the ids of this review:

1. RI7.1: reword the second sentence of the Reproducibility statement so that no line runs past the margin.
2. RI7.2: merge the four confirmations of the cover letter into one sentence that keeps the three placeholders, so the letter fits on one page.
3. RI7.3 and RI1.57: give Ribeiro 2020, Katzman 2018, Johnson 2023 and Patlatzoglou 2025 their article numbers (1760, 24, 1 and 747), and give Zeiler 2014 the conference-paper type so that its proceedings print. RI7.4 (the dataset's DOI link) can go in the same change.
4. After the changes, compile the manuscript and the cover letter and report: no error, no line wider than the text, a one-page letter, 64 numbered references, the four article numbers and the Zeiler proceedings in the printed list.

No new content, reference or figure is needed. For the authors (needs the user, not for the draft writer): RI1.7 to RI1.9 (Critical), RI1.16 to RI1.22, RI1.54 to RI1.56, RI1.58, RI1.62, RI1.63, RI1.66, RI1.67, RI2.6, RI4.4 and RI5.8. RI1.7, RI1.8 and RI1.9 are Critical and only the authors can resolve them, so after round 2 of this pass the run stops at "The draft review does not pass" while they stand, whatever the score.

### Reviewer confidence
High. Each D6 change was read in the word diff of its patch and in the full draft, and each printed result was read in a compile of the manuscript and the cover letter made for this review (folder compile-review7 of the run). Every number of Tables 1 to 5 was compared with the saved gold-label result files, read and not run. The reference checks rest on the cite-keys and check-urls outputs after the D6 patches. The four article numbers of RI7.3 rest on the full-text lines the citation report quotes; the bibliographic records looked up for this review (`lookup bibtex` on the four DOIs) give volume and issue but no article number. Medium for the judgments on cited claims, which rest on the latest citation check, with 40 of 64 cited sources read as abstracts only. No venue guide was available for the format checks.

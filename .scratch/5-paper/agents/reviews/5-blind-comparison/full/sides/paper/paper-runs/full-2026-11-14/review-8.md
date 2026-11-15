## Peer review report

### Summary
| Metric | Value |
|---|---|
| Title | An interpretable block-term tensor network with a separate clinical term for predicting incident atrial fibrillation from one sinus-rhythm 12-lead ECG |
| Review number | 8 |
| Draft review round | 2 (of the pass the third expanded revision started) |
| Verdict | Minor Revision by score; the run stops at "The draft review does not pass" because the Critical D1-7, D1-8 and D1-9 stand after round 2 |
| Overall score | 7.55/10 |

D7-1, D7-2, D7-3, D7-4 and D1-57 are resolved, each confirmed in a fresh compile of the manuscript and the cover letter. The merged confirmation paragraph of the cover letter introduces one new Minor issue (D8-1): its first line runs 9.2 pt past the right margin. The issues marked "needs the user" keep their ids. D1-7, D1-8 and D1-9 (CRediT, funding, competing interests) are Critical, hold only placeholders, and are left unresolved after round 2, so the run stops whatever the score.

### Initial impression
The D7 patches did what review 7 asked and nothing else. The manuscript now typesets with no line wider than the text, the letter fits on one page, and the four article numbers, the Zeiler proceedings and the dataset's DOI link print in the reference list. The argument, the numbers and the scope are the ones review 7 read. Impression score: 7.5/10.

### Dimension scores
This is round 2, so only the dimension the revisions changed is scored again (Writing Quality). The other four keep their review 7 scores; the D7 patches changed one sentence of the Reproducibility statement, five reference entries' fields and the confirmation paragraph of the letter, and none of these bears on originality, method, evidence or argument.

| Dimension | Weight | Score | Weighted | Key evidence |
|---|---|---|---|---|
| Originality | 20% | 7 | 1.40 | Unchanged from review 7 (1.3 first contribution; 2.4 places the model against the block-term literature; the interpretability half rests on the architecture only, D1-16, needs the user). |
| Methodological Rigor | 25% | 7 | 1.75 | Unchanged from review 7 (4.1 and 4.2 state cohort, blanking, designs, folds and bootstrap; D1-17 and D1-66 open, needs the user). |
| Evidence Sufficiency | 25% | 8 | 2.00 | Unchanged from review 7. No number or cited claim was added or changed by the D7 patches (word diff of the manuscript shows one changed sentence pair, quoted under D7-1 below). |
| Argument Coherence | 15% | 8 | 1.20 | Unchanged from review 7. |
| Writing Quality | 15% | 8 | 1.20 | Up from 7. The four format faults review 7 sent back are fixed in the compiled documents: no overfull line in the manuscript (the log reports none), a one-page letter, the four article numbers, the Zeiler proceedings and the dataset DOI link. Left: one line of the letter 9.2 pt into the margin (D8-1) and the text inside the Figure 3 image that the caption contradicts (D1-18, needs the user). No software wording. |
| Overall | | | 7.55 | Minor Revision by score |

The impression score (7.5) and the overall score (7.55) differ by less than 2 points.

### Strengths
1. The reference list now locates every journal article whose article number the run read. The compiled list prints "Nature Communications. 2020 Apr;11(1):1760." (reference 22), "npj Digital Medicine. 2025 Dec;8(1):747." (38), "BMC Medical Research Methodology. 2018 Feb;18(1):24." (45) and "Scientific Data. 2023 Jan;10(1):1." (46), each equal to the full-text line citation report C21 quotes.
2. Reference 50 now names the venue of the paper: "Zeiler MD, Fergus R. Visualizing and Understanding Convolutional Networks. In: Computer Vision - ECCV 2014. Springer International Publishing; 2014. p. 818-833." (printed with the en dashes of the published title and page range). The bibliography processor no longer warns of an empty chapter.
3. The dataset reference prints its persistent identifier like every other reference with a DOI: "MIMIC-IV-ECG: Diagnostic Electrocardiogram Matched Subset [Dataset]. PhysioNet; 2023. Available from: https://doi.org/10.13026/4nqg-sb35." (reference 43).
4. The Reproducibility statement keeps both statements of the old sentence in two plain sentences: "The declaration of generative AI use describes the AI assistance used to prepare the manuscript. The reported numbers come from the analysis of the study." The compiled page 27 shows the paragraph inside the text block.
5. The Discussion keeps the size of the gain apart from its uncertainty, as review 7 noted (6.1: "The gain of the fused model over the clinical model is small and consistent in direction. The one-year intervals overlap, and the study reports no interval of the difference that would establish it."); the passage is unchanged.

### Section review
The D7 patches touched the Reproducibility statement, five entries of the reference file and the confirmation paragraph of the cover letter. Every other section is byte-identical to the text review 7 read (word diff of the manuscript before and after patch 23 shows one changed block).

| Section | Purpose in the outline met | Evidence and chain | Strength | Issues |
|---|---|---|---|---|
| Abstract to 7 | Yes, as in review 7 | Unchanged text | Strength 5 | D1-16, D1-17, D1-18, D1-66, D1-67 (needs the user) |
| Statements | Present with placeholders | Reproducibility statement reworded | Strength 4 | D1-7 to D1-9, D1-19 to D1-22, D4-4 (needs the user) |
| References | Yes, with gaps | 64 numbered entries; all cited keys present | Strengths 1 to 3 | D1-54 to D1-56, D1-58, D1-62, D2-6, D5-8 (needs the user) |
| Cover letter | Yes | Numbers agree with Table 2 (unchanged paragraphs) | | D8-1; D1-63 (needs the user) |

### Earlier issues
The manuscript, the reference file and the cover letter are byte-identical to the outputs of patches 23, 24 and 25 (`cmp` of each pair printed nothing), and each patch's base is the file review 7 read: the SHA-256 of the outputs of patches 18, 19 and 20 (59e9a70e..., d7ed910f..., f2218c9c...) equals the base hash of each apply report, and the SHA-256 of the current files equals each apply report's output hash. The word diff against the outputs of patches 18, 19 and 20 shows: in the manuscript, the Reproducibility sentence only; in the reference file, `pages` added to Patlatzoglou 2025, Johnson 2023, Ribeiro 2020 and Katzman 2018, the MIMIC-IV-ECG `url` line, and `@inbook` changed to `@inproceedings` for Zeiler 2014, nothing else; in the letter, the four-item list replaced by the merged paragraph, nothing else. The compile for this review copied the manuscript folder into the run's compile-review8 folder and ran `latexmk -pdf -interaction=nonstopmode` on main.tex and cover-letter.tex.

| Issue | Revision log status | Reading in this round | Status |
|---|---|---|---|
| D7-1 | RESOLVED | The sentence now reads as quoted in strength 4. `grep -c Overfull` on the manuscript log prints 0 (1 in the review 7 log). Page 27, rendered for this review, shows the paragraph inside the text block. Both statements of the old sentence are kept. | Resolved |
| D7-2 | RESOLVED | The letter is one page ("Output written on cover-letter.pdf (1 page" in its log; the rendered page holds "Sincerely," and all six signature lines). The three confirmation placeholders are kept word for word (`grep -o 'GAP:[^]]*'` lists 8 placeholders in the letter, as before the patch). The merged paragraph introduces one overfull line (D8-1). | Resolved; new issue D8-1 |
| D7-3 | RESOLVED | The four references print as quoted in strength 1. | Resolved |
| D1-57 | RESOLVED | Reference 50 prints as quoted in strength 2. `main.blg` holds one warning, "empty author and editor" for the Zenodo record, and no "empty chapter". The proceedings title keeps its published en dash, which the draft writer's departure from review 7's paraphrase rightly keeps. | Resolved |
| D7-4 | RESOLVED | Reference 43 prints as quoted in strength 3. The check-urls line for the entry is unchanged ("200 https://doi.org/10.13026/4NQG-SB35, ratio 1.00 against OpenAlex"). | Resolved |
| D6-1 to D6-7, D5-1 to D5-7, D4-1 to D4-3, D3-1 to D3-11, D2-1 to D2-5, D2-7 | Resolved in earlier reviews | The D7 patches touched none of these passages (word diff). The compile reports no error (`grep '^!'` on both logs printed nothing) and 64 entries in the processed bibliography (`grep -c '\bibitem' main.bbl` prints 64; the printed list ends at [64]). | Resolved |
| D5-8 | Needs the user | Khurshid 2025 and Faes 2024 still rest on the versions read in the run (citation report C2; no citation changed). | Open, Minor, needs the user |
| D4-4 | Needs the user | The source comment "% Placement: unnumbered section before the references (generic detailed form; the policy of Artificial Intelligence in Medicine was not given and was not checked)" still stands at line 369. | Open, Minor, needs the user |
| D2-6 | Needs the user | 68 entries, 67 DOI fields (counted on the reference file); the one without is the unused CLOCS preprint, arxiv_2005_13249 (line 218). | Open, needs the user |
| D1-7, D1-8, D1-9 | Needs the user | CRediT, Funding and Declaration of competing interest hold only "[GAP: CRediT roles of each author]", "[GAP: funding]" and "[GAP: conflicts of interest]" (lines 349 to 359, read for this review). | Open, Critical, needs the user |
| D1-16 | Needs the user | No factor reading on ICD-coded labels; 3.3, 6.3 and 6.4 say so (text unchanged). | Open, Major, needs the user |
| D1-17 | Needs the user | A search for "chosen", "tuned", "tuning" and "in advance" in the manuscript finds nothing. | Open, Major, needs the user |
| D1-18 | Needs the user | The three images are unchanged (`ls -l`: all dated 14 November 23:53). | Open, Major, needs the user |
| D1-19 to D1-22 | Needs the user | 11 lines with a placeholder in the manuscript (`grep -c 'GAP:'`); 8 placeholders in the cover letter, on 6 lines. | Open, Major, needs the user |
| D1-54 | Needs the user | check-urls "After the D7 patches": 64 lines, 36 answering 200, 2 answering 202, 26 answering 403 (counted on that section); its lines are identical to the section "After the D6 patches" (`diff` printed nothing). Every line is matched against Crossref or OpenAlex with ratio 0.76 or higher; no line holds "title not checked", a mismatch, "failed", "no identifier" or "no entry". | Open, needs the user |
| D1-55 | Needs the user | cite-keys "After the D7 patches" prints the same four `unused:` lines: Wagner_2020, https://doi.org/10.5281/zenodo.4916206, Mehari_2022, arxiv_2005_13249; no `missing:` line. | Open, needs the user |
| D1-56 | Needs the user | Reference 25 still prints "Cheng S." as the only author (compiled list). | Open, needs the user |
| D1-58 | Needs the user | The eleven entries without an article number or page range whose number no record read in the run holds, and the volumes of Riek 2026 and Malmo 2016, are unchanged (citation report C21). | Open, needs the user |
| D1-62, D1-63 | Needs the user | The non-standard citation keys and the cover-letter placeholders are unchanged. | Open, needs the user |
| D1-66, D1-67 | Needs the user | No paired interval; no venue guide (config.md, Venue limits: "not stated" for every limit). | Open, needs the user |
| D1-59, D1-60, D1-61 | Superseded or closed | As in reviews 6 and 7. | Resolved |
| D1-1 to D1-6, D1-10 to D1-15, D1-23 to D1-53, D1-64, D1-65, D1-68, D1-69 | Resolved in review 2 | The resolved wording stands. | Resolved |

### Issues
#### Critical
| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---|---|---|---|---|

No new Critical issue. D1-7, D1-8 and D1-9 stay open (needs the user).

#### Major
| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---|---|---|---|---|

No new Major issue. D1-16 to D1-22 stay open (needs the user).

#### Minor
| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---|---|---|---|---|
| D8-1 | Cover letter, confirmation paragraph, first line | The first line of the merged confirmation paragraph runs about 3 mm past the right margin, because the line breaker finds no acceptable break inside the first placeholder. | Compiled letter: the line "We confirm that the manuscript has not been published before [GAP: confirmation that the manuscript" extends beyond the text block on the rendered page; the letter's log reports "Overfull \hbox (9.2085pt too wide) in paragraph at lines 32--33", the only overfull line of the letter (the review 7 letter had none). Source: "We confirm that the manuscript has not been published before [GAP: confirmation that the manuscript has not been published before] and that it is not under consideration elsewhere [...]." | Reword the paragraph so that no line ends inside the first placeholder, keeping the three placeholders word for word and the letter on one page, for example three short sentences: "The manuscript has not been published before [GAP: confirmation that the manuscript has not been published before]. It is not under consideration elsewhere [GAP: confirmation that the manuscript is not under consideration elsewhere]. All authors have read and approved it [GAP: confirmation that all authors have read and approved the manuscript]." Compile and confirm one page and no overfull line. The line will change again when the authors replace the placeholders. | Quick fix |

D2-6, D4-4, D5-8, D1-54 to D1-56, D1-58, D1-62, D1-63, D1-66 and D1-67 stay open as issues that need the user.

#### Suggestions
| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---|---|---|---|---|

None.

### Cross-section checks
| Check | Status | Notes |
|---|---|---|
| The title matches the content | Pass | Unchanged from review 7; the title and 3.3 are unchanged. |
| The abstract reflects the results | Pass | Abstract unchanged (word diff); 284 words (`wc -w` of its line). |
| The research question of the introduction is answered by the conclusion | Pass | Sections 1 and 7 unchanged. |
| Every table and figure is referred to in the text | Pass | Unchanged text; the compile reports no undefined reference or citation (`grep -ci undefined` on the log prints 0). |
| The citation form is consistent | Pass | Numeric Vancouver in the text. The printed list now gives the four article numbers, the Zeiler proceedings and the dataset DOI link; the remaining gaps are the authors' (D1-56, D1-58). |
| Every cited key has an entry (cite-keys) | Pass for missing; unused lines need the user | Output "After the D7 patches": no `missing:` line; four `unused:` lines, Wagner_2020, https://doi.org/10.5281/zenodo.4916206, Mehari_2022, arxiv_2005_13249. D1-55, needs the user. |
| No cited entry fails the DOI and URL status rules (check-urls) | Fail | Output "After the D7 patches": 64 lines, 36 answering 200, 2 answering 202, 26 answering 403. Each 403 line fails the 2xx rule of "DOI and URL"; each of the 26 DOIs is matched to the entry's title in Crossref (ratio 1.00, 0.87 for Christopoulos 2020, 0.76 for Magnani 2013). No line holds "title not checked". D1-54, needs the user. |
| The word count is within the target | Pass | `texcount -sub=section`: 879 + 1,421 + 983 + 982 + 801 + 1,578 + 341 = 6,985 words for Sections 1 to 7 against 6,500 (7.5 percent over). Experiments is 982 words against its allocation, kept by the recorded decision. |
| No passage makes a claim that Claims not to make lists | Pass | The D7 patches add no claim and no number; the checks of review 7 for (a) to (f) stand on unchanged text. |
| No passage carries software wording | Pass | The two new manuscript sentences and the new letter paragraph name no file, script, path, run, job or exit code; `grep -ci` for script, pipeline, .py, .csv, slurm and "exit code" prints 0 for both files. |
| Claims against the list | Notes | No claim changed since the latest citation report; its notes on C5 to C19 in review 7 stand. |
| No passage presents a negative or null result as a finding | Pass | Unchanged text; no sentence compares a model of the paper with a baseline it does not beat. |
| Closing: every outline section stands with text | Pass | 1.1 to 1.3, 2.1 to 2.4, 3.1 to 3.3, 4.1 to 4.3, 5.1 to 5.4, 6.1 to 6.4 and 7 hold text (headings listed with `grep`; word counts per section above). |
| Closing: every image path names an existing file | Pass | figures/fig-bttr-to-bttn.png, figures/fig-clinical-utility.png and figures/fig-beat-saliency.png exist (`ls`), and the compiled document places all three. |
| Closing: every cited key has an entry; an unused line is an issue marked needs the user | Pass; done | No missing key. Unused: D1-55. |
| Closing: heading levels follow the outline | Pass | Seven numbered sections with the outline's subsections; 7.1 folded into 7. |
| Closing: font, spacing, margins, page numbers | Pass | Elsevier article class, preprint mode, 12 pt, page numbers at the foot, 36 pages, US letter (`pdfinfo`). No line of the manuscript exceeds the text width. config.md states no limits (D1-67). The letter's one overfull line is D8-1. |
| Closing: title page, running head, abstract page, heading format and table and figure format | Pass | As the class sets them; unchanged from review 7. No venue template held (D1-67). |
| Closing: the venue's stated requirements are met | Not verifiable | config.md states none (D1-67). |
| Closing: title page holds title, authors, affiliations, corresponding author | Fail | Title present; authors, affiliations and corresponding author are placeholders (lines 20 to 22). D1-19, needs the user. |
| Closing: abstract present and within the limit, keywords present | Pass | 284 words against "about 250" in the outline; config.md states no limit (D1-67). Six keywords. |
| Closing: data availability, ethics, CRediT, conflict of interest, funding and AI disclosure statements | Present, with placeholders | D1-7 to D1-9, D1-20 to D1-22 and D4-4, needs the user. |
| Closing: a limitations section | Pass | 6.3. |
| Closing: every source with a DOI carries it | Pass | 68 entries, 67 DOI fields; the one without is the unused CLOCS preprint (D2-6, needs the user). Every cited reference with a DOI now prints a doi.org link, the dataset record included. |
| Closing: the reference file that the bibliography command names exists | Pass | `\bibliography{refs}` (line 381) names refs.bib in the manuscript folder, which exists with 68 entries; the compile read it. |
| Non-ASCII characters and dashes in the draft | Pass | `LC_ALL=C grep -c '[^ -~]'` prints 0 for the manuscript and the cover letter; `grep -c -- '--'` prints 0 for both. |
| The draft compiles | Pass | `latexmk -pdf -interaction=nonstopmode` in the run's compile-review8 folder: no error in either log, 36 pages and 64 numbered references for the manuscript, 1 page for the letter. The bibliography processor reports one warning, "empty author and editor" for the Zenodo record, which prints its authors, so the warning has no effect on the list. |

### Revision instructions
Round 2 of this pass: no writer pass follows. D8-1 goes to the final message as an acknowledged limitation unless the session's answer at the stop starts another revision; its fix is the one in the Minor table.

The run stops at "The draft review does not pass". The score maps to Minor Revision, but D1-7, D1-8 and D1-9 are Critical and unresolved after round 2. They are the CRediT statement, the funding statement and the declaration of competing interests, each holding only a placeholder for a fact of the authors.

Likely root cause: missing facts of the authors, which none of the four root causes of the page names and which no step of the run can supply. An expanded revision returning to the sections (a writing problem) would resolve D8-1 only and leave the three Critical issues standing. Estimate of the additional work for an expanded revision: Moderate (the reviewer's judgment; the one text change is a quick fix, and the pass adds a compile and two review rounds). For the answer to lower the venue: config.md states no venue limit, so the draft misses none; another venue would not resolve the three Critical issues, since they are statements of fact the authors must give.

For the authors (needs the user): D1-7 to D1-9 (Critical), D1-16 to D1-22, D1-54 to D1-56, D1-58, D1-62, D1-63, D1-66, D1-67, D2-6, D4-4 and D5-8.

### Reviewer confidence
High. Each D7 change was read in the word diff of its patch and in the current files, the byte identity of each file with its patch output was checked, and each printed result was read in a compile made for this review (folder compile-review8 of the run), with pages 27 and 34 of the manuscript and the letter's page rendered and read. The reference checks rest on the cite-keys and check-urls outputs after the D7 patches. The four dimensions not re-scored rest on review 7's reading, which this round did not repeat because the word diff shows their text unchanged. No venue guide was available for the format checks.

## Peer review report

### Summary
| Metric | Value |
|---|---|
| Title | An interpretable block-term tensor network with a separate clinical term for predicting incident atrial fibrillation from one sinus-rhythm 12-lead ECG |
| Review number | 4 |
| Draft review round | 2 (of the pass the expanded revision started) |
| Verdict | Minor Revision |
| Overall score | 7.40/10 |

The score maps to Minor Revision. All eleven issues of review 3 are resolved in the revised draft. Three Critical issues stay open after this round: RI1.7 (CRediT), RI1.8 (funding) and RI1.9 (competing interests), each a section that holds only a placeholder for a fact the authors hold. The page's rule for round 2 is that a Critical issue left unresolved stops the run at "The draft review does not pass", whatever the score, so the run reaches that stop. The section "At the stop" gives the root cause and the estimate. The four new issues, RI4.1 to RI4.4, are Minor; no writer pass follows round 2, and they go to the final message.

### Initial impression
The revision does what review 3 asked, item by item. The control count read from the ECG reports is gone from 5.1 and Table 1, the comparison of the ECG-only models with the clinical model is deleted from 5.2, the block-term tensor neural networks are cited in the version that was read, the calibration sentence now gives the largest decile gap, and the Discussion and Conclusion read in order without the repeated parity statement. What remains for the text is wording: "fitted once" now stands in five places for a design that fits fifteen networks per model, one Conclusion sentence states a property of the architecture as a result, and the cover letter repeats the misplaced data source that RI3.10 corrected in the abstract. Impression score: 7/10.

### Dimension scores
This is round 2 of the pass, so only the dimensions that changed are scored again. Originality and Methodological Rigor did not change: the revision touched no contribution claim, and the one change in the method (RI3.11) is a rewording of a formula already stated.

| Dimension | Weight | Score | Weighted | Key evidence |
|---|---|---|---|---|
| Originality | 20% | 7 | 1.40 | Unchanged from review 3. The contribution is specific (1.3, first bullet; 3.3, Equation 3); the interpretability half rests on the architecture only (3.3: "this study reports no reading of the learned frequency and lead factors"; RI1.16, needs the user). |
| Methodological Rigor | 25% | 7 | 1.75 | Unchanged from review 3, apart from RI3.11: 4.3 now states the divisor as "the sum of two terms", which agrees with the readout as carried out. Open: how the settings were chosen (RI1.17, needs the user). |
| Evidence Sufficiency | 25% | 8 | 2.00 | Changed. The count read from the ECG reports is removed (5.1 and Table 1 now report "Controls with a later ECG & 40,960 (98.1\%)" only), the two Grad-CAM claims now cite the arXiv version in which they were read, and the calibration claim now matches the decile values ("close in most deciles", with "4.95\% observed against a mean prediction of 3.56\%" in the sixth decile, which equals the saved decile results to the rounding given). Every number of the draft agrees with the saved gold-label results, and all 127 cited claims were verified in the latest citation check. 41 of 64 sources were read as abstracts only, and the gain over the clinical model rests on overlapping intervals, which the text states (6.1, 7). |
| Argument Coherence | 15% | 8 | 1.20 | Changed. 6.2 now orders the factors and the linear term, then "therefore" separate parameters, then joint training (RI3.6). 6.1 no longer counts its results and draws "small" from the size of the gain, not from the overlap (RI3.7). The Conclusion states the parity with the compact CNN once (RI3.8). One sentence of the Conclusion's third paragraph presents a property that holds by construction as what "the results suggest" (RI4.2). |
| Writing Quality | 15% | 7 | 1.05 | Changed in its evidence, not in its score. The Figure 3 caption names the recorded quantity "log-risk" (RI3.9); the two long abstract sentences are split and the diagnoses are placed in the hospital records (RI3.10). No software wording, no non-ASCII character, no dash used as an aside, four semicolons, all in captions or a source comment. New: "Fitted once" opens three sentences of one shape and misdescribes the design (RI4.1); the cover letter keeps the misplaced data source (RI4.3). The images still carry text the captions contradict and lettering below print size (RI1.18, needs the user), which keeps the score at 7. |
| Overall | | | 7.40 | Minor Revision |

The impression score (7) and the overall score (7.40) differ by less than 2 points.

### Strengths
1. The calibration result is now stated at the strength the decile values carry. 5.3: "predicted and observed one-year proportions of the fused model were close in most deciles, among 19,986 patients with 838 cases (Figure 2). The largest gap lay in the sixth decile (bar 5 of Figure 2), 4.95\% observed against a mean prediction of 3.56\%." The sixth decile has the largest gap both in percentage points (1.39) and relative to its prediction (39 percent) among the ten saved deciles.
2. The Discussion's summary separates the size of the gain from its uncertainty. 6.1: "The gain of the fused model over the clinical model is small and consistent in direction. The one-year intervals overlap, and the study reports no interval of the difference that would establish it."
3. The separation argument of 6.2 now follows its premises in order. 6.2: "The ECG evidence still passes through frequency and lead factors, and each risk factor enters the linear term with one weight. The two sources therefore have separate parameters that can be inspected apart, although this study reports no reading of the fitted frequency and lead factors. The fused model is trained as one network, so its factors are fitted beside the clinical term and may differ from those of ECG-only BTTN."
4. The normalisation of the occlusion readout reads one way only, in the text and in the caption. 4.3: "Each mean drop was therefore also divided by the sum of two terms: the mean energy of the removed samples, and, for stability, one tenth of that energy's mean over all leads and offsets." The Figure 3 caption says the same: "divided by the sum of the mean signal energy removed and one tenth of that energy averaged over all leads and windows".
5. The cohort section reports counts of recordings only. 5.1 ends on "Of the controls, 40,960 (98.1\%) had an ECG after the index ECG.", and no number read from the machine ECG reports remains in the manuscript or the cover letter.

### Section review of the revised sections
| Section | Purpose in the outline met | Evidence and chain | Strength | Issues |
|---|---|---|---|---|
| Abstract | Yes | Every number agrees with Tables 2 and 3, 5.3 and Table 5 | The diagnoses are placed in the linked hospital records | RI4.1 |
| 1.2, 2.4 | Yes | Both Grad-CAM sentences cite the version read | Wording unchanged, so no claim moved | none |
| 1.3, third contribution | Yes | Names BTTN | The unnamed "one survival model" is gone | RI4.1 |
| 4.3 | Yes | Agrees with the readout | Normalisation unambiguous | none |
| 5.1 and Table 1 | Yes | Counts agree with the saved cohort counts | Only recording counts remain | none |
| 5.2 and Table 3 | Yes | Agree with the saved results | The paragraph ends on the BTTR comparison, which the intervals support | RI4.1 |
| 5.3 | Yes | 3.56\% agrees with the saved decile results | Largest gap stated; the inversion sentence no longer repeats 4.95\% | none |
| Figure 3 caption | Yes | Agrees with 4.3 and Table 5 | "log-risk" as in the text | none |
| 6.1 | Yes | Unchanged citations | Opens with "These results", which follows the Results section directly | none |
| 6.2, first paragraph | Yes | Reordered, no sentence reworded | "Therefore" follows its premise | none |
| 7 | Yes | Answers both questions of 1.3 | Parity with the CNN stated once | RI4.1, RI4.2 |
| Cover letter | Partly | Numbers agree with Table 2 | States the overlap with the clinical model | RI4.3 |

### Earlier issues
Each row is read against the current draft, which is byte-identical to the output of the last applied patches (`cmp` of main.tex with patch 10's output and of refs.bib with patch 11's output printed nothing; the sha256 of patch 07's output equals the base_sha256 of patch 10's apply report). The draft writer marked every D3 row RESOLVED and none DELIBERATE_LIMITATION, UNRESOLVABLE or REVIEWER_DISAGREE. An issue that needs the user keeps its earlier id.

| Issue | Revision log status | Reading in this round | Status |
|---|---|---|---|
| RI3.1 | RESOLVED | The first paragraph of 5.2 ends on "ECG-only BTTN exceeded linear BTTR, at 0.5967 [0.5824, 0.6115], with intervals that do not overlap." A search for "lower", "below" and "ECG-only" finds no other sentence that compares an ECG-only model with the clinical model; the ECG-only rows of Tables 2 to 4 and "ECG-only BTTN ranged from 0.658 to 0.676" give values without such a comparison. | Resolved |
| RI3.2 | RESOLVED | `grep` for "40,306" and "96.5" in the manuscript and the cover letter finds nothing; the 40,960 sentence and row stand. | Resolved |
| RI3.3 | RESOLVED | 1.2 and 2.4 cite the arXiv entry (Ye, Li, Chen, Yang, Zhe, Xu, 2020, arXiv 2010.04963, DOI 10.48550/arXiv.2010.04963), in the form of the other arXiv entries; no citation of the journal key remains. The last link check answers 200 for it at ratio 1.00. | Resolved |
| RI3.4 | RESOLVED | The abstract, 5.2, 1.3, the Table 3 caption and 7 now name the model. The replacement wording, "fitted once", which review 3 itself suggested, misdescribes the design (RI4.1). | Resolved, with RI4.1 |
| RI3.5 | RESOLVED | 5.3 states "close in most deciles" and the sixth-decile gap; 6.1 and 7 read "agreed closely in most risk deciles". Seven of the ten deciles lie within about 10 percent of their prediction; deciles 2, 3 and 6 (bars 1, 2 and 5) differ by about a third or more, and the text names the largest. | Resolved |
| RI3.6 | RESOLVED | Order as asked; no sentence reworded (word diff against the earlier draft). | Resolved |
| RI3.7 | RESOLVED | "These results answer the research question within one health system." and the recast closing pair. | Resolved |
| RI3.8 | RESOLVED | The restating sentence is gone from paragraph 2, and paragraph 3 opens with the design implication. That sentence states a property that holds by construction (RI4.2). | Resolved, with RI4.2 |
| RI3.9 | RESOLVED | Caption: "the drop in log-risk was recorded". | Resolved |
| RI3.10 | RESOLVED | Both sentences are split, and the abstract reads "coded diagnoses in the MIMIC-IV hospital records linked to MIMIC-IV-ECG". The abstract is 272 words by `wc -w` of its line, against "near 250" in the suggested fix; the added words are the splits and the model name the issues ask for, and the venue states no abstract limit (RI1.67), so the length is no issue in this round. The cover letter keeps the misplaced source (RI4.3). | Resolved, with RI4.3 |
| RI3.11 | RESOLVED | 4.3 and the Figure 3 caption state the divisor as the sum of the two terms, which agrees with the readout as carried out. | Resolved |
| RI2.1 to RI2.5, RI2.7 | Resolved in review 3 | The 24 ms width, the spans, the one-year negatives, the 6.2 first sentence, the offsets outside the windows and the 6.2 heading stand as resolved. | Resolved |
| RI2.6 | Needs the user | The unused CLOCS entry still has no DOI (68 entries, 67 DOI fields, by `grep -c`). | Open, needs the user |
| RI1.7, RI1.8, RI1.9 | Needs the user | CRediT, Funding and Declaration of competing interest hold only their placeholders. | Open, Critical, needs the user |
| RI1.16 | Needs the user | No factor reading on ICD-coded labels; 6.3 and 6.4 name it. | Open, Major, needs the user |
| RI1.17 | Needs the user | No sentence says how the settings of BTTN were chosen. | Open, Major, needs the user |
| RI1.18 | Needs the user | The three images are unchanged (file dates of the manuscript's figures folder precede every revision); Figure 3 still carries "drives" in its title. | Open, Major, needs the user |
| RI1.19 to RI1.22 | Needs the user | 11 lines with a placeholder in the manuscript and 8 in the cover letter (`grep -c 'GAP:'`). | Open, Major, needs the user |
| RI1.54 | Needs the user | The last link check gives 64 lines: 36 answering 200, 2 answering 202 and 26 answering 403, the same 26 keys as before, each resolving to the entry's title in Crossref. | Open, needs the user |
| RI1.55 | Needs the user | The last cite-keys output prints the same four unused entries. | Open, needs the user |
| RI1.56, RI1.57, RI1.58 | Needs the user | Cheng 2009 author list and pages, the Zeiler 2014 entry type and the missing pages and volumes are unchanged (the reference patch touched 1 of 68 entries). | Open, needs the user |
| RI1.59 | Superseded by RI3.3 | Resolved through RI3.3. | Resolved |
| RI1.60 | Superseded by RI3.2 | Resolved through RI3.2. | Resolved |
| RI1.61 | Closed by the ruling on C4 | The 2.4 pointer states no result. | Closed |
| RI1.62, RI1.63 | Needs the user | Citation keys and cover-letter placeholders unchanged. | Open, needs the user |
| RI1.66, RI1.67 | Needs the user | No paired interval; no venue guide. | Open, needs the user |
| RI1.1 to RI1.6, RI1.10 to RI1.15, RI1.23 to RI1.53, RI1.64, RI1.65, RI1.68, RI1.69 | Resolved in review 2 | The resolved wording stands; patch 10 touched 17 of 115 blocks, each for a D3 item, and the word diff against the earlier draft shows no change back. | Resolved |

### Issues
#### Critical
No new Critical issue. RI1.7, RI1.8 and RI1.9 stay open (needs the user).

#### Major
No new Major issue. RI1.16 to RI1.22 stay open (needs the user).

#### Minor
| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---|---|---|---|---|
| RI4.1 | Abstract, sixth result sentence; 1.3, third contribution; 5.2, second paragraph, first sentence; Table 3 caption, second sentence; 7, first paragraph, third sentence | "Fitted once" describes the survival design as one fit, while 3.2 and 4.2 describe five folds with three networks per test fold; the point of the phrase is that no model was refitted for a horizon. Three of the sentences also open with the same construction. | Abstract: "Fitted once as a survival model, BTTN with the clinical term had AUROCs of 0.723 to 0.745". 5.2: "Fitted once in the survival design, the fused model had an AUROC of 0.723". 7: "Fitted once as a survival model, it kept its point estimates above". Table 3 caption: "Each model was fitted once and its risk was read at all four horizons." 4.2: "The survival model used one stratified five-fold split"; 3.2: "The prediction for a test fold is the mean log-risk of three networks trained with different seeds." The out-of-fold risk of each patient comes from that procedure, and the same risks are read at every horizon. This wording was review 3's own suggestion under RI3.4. | State what the design does, in a different shape in each place. Abstract: "Read at horizons from 120 days to 5 years after the ECG without refitting, with a 30-day blanking window, BTTN with the clinical term had AUROCs of 0.723 to 0.745." 1.3: "and the discrimination of BTTN at four horizons, read from the same out-of-fold risks without refitting for each horizon." 5.2: "In the survival design, the same out-of-fold risks were read at every horizon. The fused model had an AUROC of 0.723 [0.701, 0.745] at 120 days, ...". Table 3 caption: "Each model's out-of-fold risks were read at all four horizons without refitting." 7: "Without refitting for each horizon, it kept its point estimates above those of the clinical model ...". | Quick fix |
| RI4.2 | 7, third paragraph, first sentence | The sentence presents as a suggestion of the results a property that holds by construction: the clinical factors are added beside the block-term factors without entering them because Equation 3 adds them to the log-risk. The design implication the results do carry is left unstated. | "For the design of ECG risk models, the results suggest that clinical factors can be added beside block-term factors without entering them." 3.3: "The clinical term reaches the log-risk without passing through the block-term layer." What the results add is that the fused model reached 0.7776 [0.7664, 0.7888] against 0.7397 [0.7275, 0.7517] for the ECG term alone (Table 2), intervals that do not overlap. This wording was review 3's own suggestion under RI3.8. | "For the design of ECG risk models, the results suggest that a clinical term kept outside the block-term factors adds to the discrimination of the ECG term. At one year their intervals did not overlap (0.7776 [0.7664, 0.7888] against 0.7397 [0.7275, 0.7517])." Keep the two sentences that follow. | Quick fix |
| RI4.3 | Cover letter, "Key findings", first sentence | The cover letter places the coded hospital diagnoses in the ECG database, the misplacement RI3.10 corrected in the abstract. | "On hospital diagnoses coded in the International Classification of Diseases in MIMIC-IV-ECG, the proposed network with its clinical term had the highest one-year area under the receiver operating characteristic curve". The diagnoses come from the linked hospital records of MIMIC-IV (4.1; abstract: "coded diagnoses in the MIMIC-IV hospital records linked to MIMIC-IV-ECG"). The draft writer named this in its report and did not change it, since the cover letter was outside its two files. | "On hospital diagnoses coded in the International Classification of Diseases, in the MIMIC-IV records linked to MIMIC-IV-ECG, the proposed network ...". | Quick fix |
| RI4.4 | Declaration of generative AI, the source line above its heading | Needs the user. A drafting note in the manuscript source records that the journal's policy on AI disclosure was not checked; the note ships with the source files a journal receives. | "% Placement: unnumbered section before the references (generic detailed form; the policy of Artificial Intelligence in Medicine was not given and was not checked)". settings.md records the venue's AI policy as "No policy text given". | The authors check the journal's policy on disclosing generative AI (with RI1.22 and RI1.67), adjust the placement and form of the declaration to it, and delete the note. Not for the draft writer. | Quick fix |

RI2.6 and RI1.54 to RI1.58, RI1.62, RI1.63, RI1.66 and RI1.67 stay open as issues that need the user.

#### Suggestions
None.

### Cross-section checks
| Check | Status | Notes |
|---|---|---|
| The title matches the content | Pass | "Interpretable" is tied to "readable by design" in 3.3, and the paper says no factor is read. |
| The abstract reflects the results | Pass, with RI4.1 | Every number agrees with Tables 2 and 3, 5.3 and Table 5. |
| The research question of the introduction is answered by the conclusion | Pass | Both questions of 1.3 are answered in the first two paragraphs of 7. |
| Every table and figure is referred to in the text | Pass | Table 1 in 5.1, Tables 2 and 3 in 5.2, Table 4 in 5.3, Table 5 in 4.3 and 5.4; Figure 1 in 3.1, Figure 2 in 5.3, Figure 3 in 4.3, 5.4 and 6.2. |
| The citation form is consistent | Pass | Numeric, Vancouver style, as the Citation style row gives (`\bibliographystyle{vancouver}`). |
| Every cited key has an entry (cite-keys) | Pass for missing; fail for unused | Output "After the D3 patches": no `missing:` line; four `unused:` lines, Wagner_2020, the CODE-15% record, Mehari_2022, arxiv_2005_13249. RI1.55, needs the user. |
| No cited entry fails the DOI and URL status rules (check-urls) | Fail | Output "After the D3 patches": 64 lines, 36 answering 200, 2 answering 202, 26 answering 403 (counted with `grep -c` on that section); no line holds "title not checked", DOI_MISMATCH, "failed", "no identifier" or "not found". The new arXiv entry answers 200 at ratio 1.00. A 403 is outside the 2xx range, so each of the 26 lines fails the rule. RI1.54, needs the user. |
| The word count is within the target | Pass | Text of Sections 1 to 7 by `texcount -sub=section`: 874 + 1,421 + 983 + 950 + 763 + 1,565 + 303 = 6,859 words against 6,500 (plus 5.5 percent). Experiments is 950 against 575 (kept by the recorded decision); Discussion 1,565 against 1,300 (plus 20 percent). |
| No passage makes a claim that Claims not to make lists | Pass | (a): no number from the ECG reports remains (RI3.2). (b): no rising-risk reading; 5.2 says the horizons "are not independent replications". (c): 2.4 states no result of the PTB-XL record (ruling C4). (d): no passage says the block-term structure is needed for accuracy. (e): 2.1 keeps identification and incident prediction apart. (f): the one new number, 3.56\%, is the sixth decile's mean prediction in the saved gold-label decile results; every other number is unchanged and agrees with them. |
| No passage carries software wording | Pass | A search for file, script, pipeline, run, job, workflow, seed, cache, exit and log finds "training runs" of cited networks, "five seeds" and "seeded" as the random initialisations of the protocol, "log-risk" and "log-likelihood", and the AI workflow of the declaration. The source comment of RI4.4 is not printed. |
| Claims against the list | Notes | Intended claim 11 (both ECG-only models below the clinical model) is not made, on purpose, after RI3.1; the paper's rule on negative results requires it, and the argument blueprint's request for that sentence yields to the rule. Intended claim 12 now names 120 days and the fitted design (RI4.1 for its wording). Intended claim 13 is made in the narrower form the decile values hold ("close in most deciles", with the largest gap). C5 to C16 stand as review 3 read them. |
| No passage presents a negative or null result as a finding | Pass | After RI3.1 no sentence compares a model of the paper with a baseline it does not beat. The ECG-only rows of Tables 2 to 4 and the range "0.658 to 0.676" in 5.2 report values without such a comparison, and no section, paragraph or table is built around them. The statements that the fused model's gain over the clinical model is not established by an interval qualify the positive claim. |
| Closing: every outline section stands with text | Pass | 1.1 to 1.3, 2.1 to 2.4, 3.1 to 3.3, 4.1 to 4.3, 5.1 to 5.4, 6.1 to 6.4 and 7 hold text. |
| Closing: every image path names an existing file | Pass | The three paths name fig-bttr-to-bttn.png, fig-clinical-utility.png and fig-beat-saliency.png, which `ls` lists in the manuscript's figures folder. |
| Closing: every cited key has an entry; an unused line is an issue marked needs the user | Pass; done | No missing key. Unused: RI1.55. |
| Closing: heading levels follow the outline | Pass | No heading changed in this revision (the patch has no structural flag); 7.1 folded into 7. |
| Closing: font, spacing, margins, page numbers | Pass, not verifiable against a guide | Elsevier article class, preprint mode, 12 pt; settings.md states no limits (RI1.67). Not compiled in this review. |
| Closing: title page, running head, abstract page, heading and float format | Pass, not verifiable against a guide | Front matter, abstract and keyword environments of the class; booktabs tables with captions above, figures with captions below. |
| Closing: the venue's stated requirements are met | Not verifiable | settings.md states none (RI1.67). |
| Closing: title page holds title, authors, affiliations, corresponding author | Fail | Placeholders, RI1.19, needs the user. |
| Closing: abstract present and within the limit, keywords present | Pass | 272 words by `wc -w`; no limit stated (RI1.67); six keywords. |
| Closing: data availability, ethics, CRediT, conflict of interest, funding and AI disclosure statements | Present, with placeholders | RI1.7 to RI1.9 and RI1.20 to RI1.22, needs the user. |
| Closing: a limitations section | Pass | 6.3. |
| Closing: every source with a DOI carries it | Pass for cited sources | 68 entries, 67 DOI fields (`grep -c`); the one without is the unused CLOCS preprint (RI2.6, needs the user). The new arXiv entry carries its DOI. |
| Closing: the reference file that the bibliography command names exists | Pass | `\bibliography{refs}` names the reference file, which exists with 68 entries. |
| Non-ASCII characters and dashes in the draft | Pass | `LC_ALL=C grep -n '[^ -~]'` on the manuscript and the cover letter printed nothing; `grep -c -- '--'` on the manuscript printed 0. |

### Revision instructions
No writer pass follows draft review round 2. The items below go to the final message as acknowledged items, and to the draft writer only if the user asks for an expanded revision.

1. RI4.1: replace "fitted once" in the abstract, 1.3, 5.2, the Table 3 caption and 7 by wording that says the same out-of-fold risks were read at every horizon without refitting, in a different sentence shape in each place.
2. RI4.2: replace the first sentence of the Conclusion's third paragraph by the design implication the results carry, that a clinical term kept outside the block-term factors adds to the discrimination of the ECG term, with the two one-year intervals.
3. RI4.3: in the cover letter's "Key findings", place the coded diagnoses in the MIMIC-IV records linked to MIMIC-IV-ECG.

For the authors (needs the user, not for the draft writer): RI1.7 to RI1.9 (Critical), RI1.16 to RI1.22, RI1.54 to RI1.58, RI1.62, RI1.63, RI1.66, RI1.67, RI2.6 and RI4.4.

### At the stop
- Root cause: the Critical issues left open, RI1.7, RI1.8 and RI1.9, are facts only the authors hold: the CRediT roles, the funders and grant numbers, and the competing-interest declaration. None of the four causes the page names (structure, evidence, writing, originality) applies to them, and an expanded revision from any step would not resolve them, since no role of the run holds these facts. The remaining text issues, RI4.1 to RI4.3, are a writing problem; an expanded revision for them would return to the sections.
- Estimate of the additional work for an expanded revision: Moderate (three quick fixes in the text and the cover letter; the three Critical issues need the authors' input whatever the answer).
- Lower the venue: settings.md states no venue limits, so the draft misses none; a lower venue would not resolve RI1.7 to RI1.9.

### Reviewer confidence
High for the earlier issues and the new issues: each revised passage was read in the full revised draft and in a word diff against the draft before the patches, the new decile number and the "largest gap" wording were compared with the saved gold-label decile results, the normalisation wording with the readout as carried out, and the survival design's folds and ensembles with the analysis as carried out. High for the reference checks, which rest on the cite-keys and check-urls outputs after the D3 patches. Medium for the judgments on cited claims, which rest on the latest citation check, whose readings were abstracts only for 41 of the 64 sources. The manuscript was not compiled in this review, and no venue guide was available for the format checks.

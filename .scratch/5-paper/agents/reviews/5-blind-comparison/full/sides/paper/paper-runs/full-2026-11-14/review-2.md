## Peer review report

### Summary
| Metric | Value |
|---|---|
| Title | An interpretable block-term tensor network with a separate clinical term for predicting incident atrial fibrillation from one sinus-rhythm 12-lead ECG |
| Review number | 2 |
| Draft review round | 2 |
| Verdict | Minor Revision |
| Overall score | 7.15/10 |

The score maps to Minor Revision. Three Critical issues of round 1 remain open after this round: D1-7 (CRediT), D1-8 (funding) and D1-9 (competing interests), each a section that holds only a placeholder for a fact the authors hold. The page's rule for round 2 is that a Critical issue left unresolved stops the run at "The draft review does not pass", whatever the score, and the page exempts an issue marked "needs the user" only from going to the draft writer, not from that rule. On that reading the run reaches the stop. The section "At the stop" below gives the root cause and the estimate.

### Initial impression
The revision does what round 1 asked of it. The six misreported or unsupported citations are corrected, readability is now stated as a property of the architecture with the plain sentence that no learned factor is read, and calibration, the rate behind the PPVs and the omitted participant table are disclosed where a reader needs them. What remains for the text is small: the occlusion width is stated as 25 ms where the analysis occludes 24 ms, one added limitation sentence names the wrong group, and one sentence in 6.2 claims more about the factors than the paper shows. Impression score: 7/10.

### Dimension scores
Every dimension changed after the revision and is scored again.

| Dimension | Weight | Score | Weighted | Key evidence |
|---|---|---|---|---|
| Originality | 20% | 7 | 1.40 | The contribution statement is now specific and verifiable: an extension of linear BTTR to a survival network with readable factors on its predictive path and a clinical term outside them (1.3, 2.4, 3.3), and new evidence on ICD-coded labels. The gap no longer rests on a misread source (1.2: "block-term tensor regression, designed for interpretability, predicted finger movements"). The interpretability half is still shown by construction only, which keeps the score from 8 (D1-16, needs the user). |
| Methodological Rigor | 25% | 7 | 1.75 | Limitations are now stated where they bear: the in-sample recalibration (6.3: "The probabilities were recalibrated in the evaluation sample with two-fold cross-fitting, so the calibration of the model in another population is not shown"), the PPV rate (4.2, Table 4 caption, 6.3) and the missing participant table (4.2, 6.3). The occlusion readout now states its window centres, spans and clipping (4.3, Table 5). Open: the stated occlusion width differs from the analysis by 1 ms (D2-1); how the settings were chosen is not stated (D1-17, needs the user). |
| Evidence Sufficiency | 25% | 7 | 1.75 | D1-1 to D1-6 and the fifteen drifts D1-23 to D1-36 are corrected to the wording the citation report gives as supported, and both gap claims carry "To our knowledge" (2.1, 2.3). Every new number agrees with a gold-label file or a method setting: 120 days (`horizon_days` 120), 4,000 of 8,775 and 16,000 of 41,770, 0.0390, 1,855 in 50,545. 41 of 64 sources were read as abstracts only. |
| Argument Coherence | 15% | 8 | 1.20 | The conclusion now answers both questions of 1.3 in the scope the results carry (7: "a model whose ECG evidence passes through block-term factors reached the discrimination of a compact CNN on this task"). The seven closing announcements are gone. One sentence of 6.2 claims more than 3.3 sets up (D2-3). |
| Writing Quality | 15% | 7 | 1.05 | Terms are held throughout; no software wording; no non-ASCII character; 5.3 is split into three paragraphs on one idea each. The abstract grew to 312 tokens by `wc -w` (D2-5), and the three images still carry text that the captions contradict and lettering too small at print size (D1-18, needs the user). |
| Overall | | | 7.15 | Minor Revision |

### Strengths
1. Readability is now stated at the strength the paper can carry. 3.3: "Readability is here a property of the architecture, and this study reports no reading of the learned frequency and lead factors." 6.2 repeats it ("although this study reports no reading of the fitted frequency and lead factors"), and 6.3 and 6.4 name the test that would show it.
2. The calibration result is reported with the step that shapes it. 5.3: "After logistic recalibration within the survival sample, predicted and observed one-year proportions agreed across deciles of the fused model", with the matching limitation in 6.3.
3. The decile proportions are placed in their sample. 5.3: "The deciles are read in that sample, which holds a larger share of the events of the cohort than of its controls (4,000 of 8,775 against 16,000 of 41,770)", and the abstract says the same in a clause.
4. The occlusion windows can now be reproduced from the text: Table 5 lists the centres each window groups and the span they cover, and 4.3 states that negative mean drops are set to zero "for both the raw and the normalised value".
5. The decision curves are described as a reader of the figure would check them. 5.3: "The thresholds in this paragraph are read from the decision curves", followed by the range above both reference strategies (about 0.04 to 0.1), which agrees with Figure 2.
6. The cited claims now match their sources, for example 2.1: "A CNN developed on 649,931 sinus-rhythm ECGs of 180,922 Mayo Clinic patients, 454,789 of them in its training set, identified patients with AF with an AUC of 0.87, counting AF before the tested ECG as positive."

### Round-1 issues
Each row is read against the revised draft, which is byte-identical to the output of the two applied patches (`cmp` of each patched file with the manuscript file printed nothing).

| Issue | Revision log status | Reading in this round | Status |
|---|---|---|---|
| D1-1 | RESOLVED | 2.1 gives 649,931 ECGs of 180,922 patients, 454,789 in training, AF before the ECG counted positive. | Resolved |
| D1-2 | RESOLVED | 2.3: "a mean accuracy of 64.52\% against 61.00\% for its predecessor, higher-order discriminant analysis". | Resolved |
| D1-3 | RESOLVED | 3.2 now ends at "as DeepSurv trains a neural network \cite{Katzman_2018}". | Resolved |
| D1-4 | RESOLVED | 1.2 rests on the subtitle, which matches the title field of the reference entry. | Resolved |
| D1-5 | RESOLVED | 3.1 defines the mode-n product in the sentence; the survey is no longer cited there. | Resolved |
| D1-6 | RESOLVED | 6.1: "0.77 on external validation in MIMIC-IV, with a label source that its abstract does not state". | Resolved |
| D1-7, D1-8, D1-9 | Left to the user | The three sections still hold only their placeholders. | Open, Critical, needs the user |
| D1-10 | RESOLVED | Abstract, 2.4, 3.1, 3.3, 6.1, 6.2 and 7 state readability as architectural; 3.3 says no factor is read. One earlier sentence of 6.2 still goes beyond this (D2-3). | Resolved, with D2-3 |
| D1-11 | RESOLVED | 5.3, 6.1 and 7 carry the recalibration qualifier; 6.3 states the in-sample cross-fitting. | Resolved |
| D1-12 | RESOLVED (fallback) | The rate is renamed in 4.2, 5.3, the Table 4 caption and 6.3, and 6.3 calls the PPVs upper values. The fallback is the one config.md Decisions records, for a reason that holds (the recomputed values would stand in no gold-label file). The added sentence names the wrong group (D2-2). | Resolved, with D2-2 |
| D1-13 | RESOLVED (fallback) | 4.2 and 6.3 state that no participant table and no missing-value counts are reported. The reason, the user's instruction that nothing is run, holds; the table itself stays work for the authors. | Resolved as disclosed; the table needs the user |
| D1-14 | RESOLVED | 1.2 as suggested; the gap follows from the next sentences. | Resolved |
| D1-15 | RESOLVED | 1.1: "predict new-onset AF". | Resolved |
| D1-16 | Left to the user | No factor reading on ICD-coded labels; 6.3 and 6.4 name it. | Open, Major, needs the user |
| D1-17 | Left to the user | No sentence says how the settings were chosen (a search of the draft for chosen, tuned, tuning and fixed in advance found none). | Open, Major, needs the user |
| D1-18 | Left to the user | The images are unchanged; Figure 3 still carries the title "red = drives future-AF risk per unit signal energy". | Open, Major, needs the user |
| D1-19 to D1-22 | Left to the user | Placeholders unchanged (11 lines with a placeholder in the manuscript, 8 in the cover letter, by `grep -c`). | Open, Major, needs the user |
| D1-23 to D1-36 | RESOLVED | Each sentence now carries the wording the review gave (checked one by one in 1.1, 1.2, 1.3, 2.1, 2.2, 2.3, 2.4, 3.1, 4.3, 6.1, 6.2, 6.3). | Resolved |
| D1-37, D1-38 | RESOLVED | Both open with "To our knowledge". | Resolved |
| D1-39 | RESOLVED | 5.3 gives the range above treat-all and treat-none and the range where the fused model leads; both agree with the middle panel of Figure 2. | Resolved |
| D1-40 | RESOLVED | Table 5, the Figure 3 caption, 4.3 and 6.2 give centres and spans. The spans are computed from a 25 ms width, which the analysis does not use (D2-1). The 6.2 sentence "this span holds the end of the P wave and the PR segment" agrees with the mean beat of lead II in Figure 3, where the P wave returns to baseline between about 110 and 130 ms before the R peak. | Resolved, with D2-1 |
| D1-41 | RESOLVED | 4.3 and the Table 5 caption state the clipping; this matches the analysis. | Resolved |
| D1-42 | RESOLVED | 3.2 describes one set of attention weights over time shared by all channels, which matches the model. | Resolved |
| D1-43 | RESOLVED | 0.0390. | Resolved |
| D1-44 | RESOLVED | Abstract and 5.3. | Resolved |
| D1-45 | RESOLVED | "bars 5 and 6 of Figure 2". | Resolved |
| D1-46 | RESOLVED | Abstract, 5.2, Table 3 and its caption, and 7 use 120 days from the index ECG. | Resolved |
| D1-47 | RESOLVED | 3.1 states that 60 Hz lies outside the kept band. | Resolved |
| D1-48 | RESOLVED | 3.3 separates the released values from those computed from onset and end times; this matches the cohort construction. | Resolved |
| D1-49 to D1-52 | RESOLVED | Announcements cut, the four contrasts reworded, 5.3 split, each P-wave source given its own clause. | Resolved |
| D1-53 | RESOLVED | Both entries carry the arXiv DOI; the link check run in this review returns 200 at ratio 1.00 for both. | Resolved |
| D1-54 | Left to the user | The link check run in this review returns 403 for the same 26 keys. | Open, needs the user |
| D1-55 | Left to the user | cite-keys run in this review prints the same four unused lines. | Open, needs the user |
| D1-56, D1-57 | Left to the user | Cheng 2009 still lists one author and page 2571; Zeiler 2014 is still a book-chapter entry. | Open, needs the user |
| D1-58, D1-59 | Left to the user | Unchanged: the reference patch touched 2 of 68 entries (its apply report). | Open, needs the user |
| D1-60 | Left to the user | The sentence in 5.1 and the row of Table 1 stand. | Open, needs the user |
| D1-61 | Left to the user | The 2.4 sentence stands, without a result. | Open, needs the user |
| D1-62 | Left to the user | The three keys are unchanged. | Open, needs the user |
| D1-63 | Left to the user | The cover letter placeholders stand. | Open, needs the user |
| D1-64, D1-65 | RESOLVED | No typed section numbers remain; 6.4 cites the removal test and TRIPOD+AI, both passages read in the run. | Resolved |
| D1-66, D1-67 | Left to the user | Unchanged. | Open, needs the user |
| D1-68 | RESOLVED | F = 21 bins from 0 to 39 Hz, 1.95 Hz apart, agrees with a 128-sample window at 250 Hz kept up to 40 Hz. | Resolved |
| D1-69 | RESOLVED | 3.3 ties "readable" to the "interpretable" of the title. | Resolved |

The draft writer marked no row DELIBERATE_LIMITATION, UNRESOLVABLE or REVIEWER_DISAGREE.

### Issues
#### Critical
No new Critical issue. D1-7, D1-8 and D1-9 stay open (needs the user).

#### Major
No new Major issue. D1-16 to D1-22 stay open (needs the user).

#### Minor
| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---|---|---|---|---|
| D2-1 | 4.3, Table 5 and its caption, Figure 3 caption, 6.2 third paragraph, 6.3 fourth paragraph | The occlusion width is stated as 25 ms, while the readout as carried out zeroes 12 samples at 500 Hz, which is 24 ms, and the spans of Table 5 are computed from 25 ms. | 4.3: "a 25 ms window at a fixed offset from each R peak was set to zero". The readout zeroes six samples on each side of the centre at 500 Hz. Each offset is also rounded to a whole sample toward the R peak, so the centres at odd multiples of 25 ms lie 1 ms nearer the R peak, and neighbouring windows abut or leave one sample between them. The reported values are the ones the readout produced; only the description is off, by at most 1.5 ms at a span edge. | In 4.3 write "a window of 12 samples (24 ms) centred at offsets every 25 ms, each offset rounded to a whole sample" and keep "the zero replacement and the 24 ms window are therefore choices of this readout"; use 24 ms in 6.3 and in the Figure 3 and Table 5 captions. Give the spans as the occluded samples cover them: P $-236$ to $-138$, PR $-136$ to $-62$, QRS $-62$ to $36$, ST $38$ to $136$, T $138$ to $386$ ms. In 6.2 write "from about 136 to 62 ms before it". The Figure 3 caption can add that each shaded band spans the 25 ms step around its centre. | Quick fix |
| D2-2 | 6.3, third paragraph | The added sentence names the AF-free controls as the group that holds the later-onset patients. | "This proportion exceeds the one-year rate of the survival cohort, 1,855 in 50,545, whose controls include the patients with onset after one year." In the survival design the 41,770 controls are AF-free; the patients with onset after one year are among its 8,775 events, and they count as negatives only at the one-year horizon. | "..., 1,855 in 50,545, whose one-year negatives include the patients with onset after one year." | Quick fix |
| D2-3 | 6.2, first paragraph, first sentence | The sentence says the clinical term leaves the meaning of the ECG factors unchanged, which the paper does not show. | "Separating the clinical term from the block-term layer lets the fused model gain discrimination without changing what its ECG factors mean." The fused model is trained as one network with the clinical term (3.3: Equation 3, weights initialised from a logistic fit and trained without weight decay), so its factors are fitted beside the clinical term and can differ from those of ECG-only BTTN; 3.3 claims only that "Adding it leaves the role of the factors unchanged", and no factor is read. | "Separating the clinical term from the block-term layer lets the fused model gain discrimination without passing the risk factors through its ECG factors." | Quick fix |
| D2-4 | 4.3, second paragraph | The text implies every offset belongs to one of the five windows; the offsets at the two ends of the beat belong to none. | "The offsets were grouped into five windows relative to the R peak". The five windows group centres from 225 ms before to 375 ms after the R peak (Table 5); the centres from 350 to 250 ms before and at 400 and 425 ms after enter Figure 3 and the stabilising term of the normalisation, and no window value. | Add: "The offsets from 350 to 250 ms before the R peak and at 400 and 425 ms after it belong to no window; they appear in Figure 3 only." | Quick fix |
| D2-5 | Abstract | The abstract grew to 312 tokens by `wc -w` (283 before the revision), against the outline's "about 250 words". | The additions are the horizon clause ("the shortest covering the 90 days after a 30-day blanking window") and the sample clause ("which over-represents patients with AF"). Config states no abstract limit (D1-67), and many journals ask for 250 words or fewer. | Shorten to about 250 words without losing the D1-44 and D1-46 qualifiers, for example by merging the two sentences on the block-term layer and the clinical term ("Each block projects the tensor onto a frequency factor and a lead factor, and age, sex and ECG intervals enter through a separate linear term that bypasses these factors") and by cutting "In MIMIC-IV-ECG, ... and all methods were compared under one cross-validation protocol" to "In MIMIC-IV-ECG, with incident AF from ICD-coded hospital diagnoses". The authors confirm the journal's limit (D1-67). | Quick fix |
| D2-6 | Reference list | Needs the user. The unused CLOCS entry lacks the arXiv DOI that the other arXiv entries carry (closing check on DOIs). | 68 entries; 67 hold a DOI field (`grep -c` of entry heads and of DOI fields); the one without is the CLOCS preprint, which cite-keys lists as unused (D1-55). | If the authors keep the entry, add `10.48550/arXiv.2005.13249`; if they remove it under D1-55, nothing is needed. Not for the draft writer. | Quick fix |

#### Suggestions
| # | Section | Issue | Evidence | Suggested fix | Effort |
|---|---|---|---|---|---|
| D2-7 | 6.2 heading | The heading keeps "readable ECG term", which after D1-69 names the architectural property; a reader who skips 3.3 may take it as a shown reading. | "Implications of a readable ECG term with a separate clinical term". | Optional: "Implications of an ECG term built on readable factors, with a separate clinical term". The heading change is structural for the patch. | Quick fix |

### The open item the draft writer raised: 24 ms against 25 ms
The draft writer's reading is right, and it is an issue: D2-1. At 500 Hz the readout's half-width is the whole number of samples in 12.5 ms, which is 6, and it zeroes from 6 samples before the centre to 5 samples after it, 12 samples or 24 ms. A paper states its method as it was carried out, and "25 ms" appears in five places (4.3 twice, 6.3, the Figure 3 caption, the Table 5 caption). The effect on the results is none: the values of Table 5 and Figure 3 are those the readout produced. The effect on the spans is at most 1.5 ms per edge, once the rounding of the odd centres is counted, and no statement of 6.2 changes with it. The fix is a change of wording and of the five span pairs, given in D2-1.

### Cross-section checks
| Check | Status | Notes |
|---|---|---|
| The title matches the content | Pass | "Interpretable" is tied to "readable by design" in 3.3 (D1-69), and the paper says no factor is read. |
| The abstract reflects the results | Pass, with D2-5 | Every number agrees with Tables 2 and 3, 5.3 and 5.4; the sample and horizon qualifiers are in. |
| The research question of the introduction is answered by the conclusion | Pass | Both questions of 1.3 are answered in 7, in the scope the results carry. |
| Every table and figure is referred to in the text | Pass | Tables 1 to 5 and Figures 1 to 3 are referenced before or at their placement. |
| The citation form is consistent | Pass | Numeric, Vancouver style named in the bibliography style line. |
| Every cited key has an entry (cite-keys) | Pass for missing; fail for unused | Run in this review on the revised draft: no `missing:` line; four `unused:` lines (Wagner_2020, the CODE-15% record, Mehari_2022, arxiv_2005_13249), exit 1. D1-55, needs the user. |
| No cited entry fails the DOI and URL status rules (check-urls) | Fail | Run in this review on the revised draft: 64 lines, 36 answering 200, 2 answering 202, 26 answering 403; no line holds "title not checked". The 26 lines of 403 are the keys of D1-54, needs the user. Both DOIs added under D1-53 answer 200 at ratio 1.00. |
| The word count is within the target | Pass | Body of Sections 1 to 7 by `texcount -sub=section`: 866 + 1,421 + 983 + 851 + 786 + 1,543 + 330 = 6,780 words against 6,500 (plus 4.3%). Discussion is 1,543 against its 1,300 allocation (plus 19%). |
| No passage makes a claim that Claims not to make lists | Pass, with D1-60 | (a) the control count from ECG reads stands (D1-60, needs the user); (b) to (e) no passage; (f) every new number of the revision agrees with a gold-label file or is a method setting (the spans of D2-1 are method settings). |
| No passage carries software wording | Pass | A search for file, script, pipeline, job, run, code and workflow terms finds only "training runs" of cited networks and the statements' code location and AI workflow. |
| Claims against the list | Notes | The revision moved two intended claims to the wording their sources hold: claim 2 (the guideline) now concerns automated AF diagnosis, and claim 12 names 120 days. Both changes are right; no issue. |
| No passage presents a negative or null result as a finding | Pass, with a note | The approach of the paper, the fused model, has the highest one-year AUROC and point estimates above the clinical model at four horizons. The sentence "Both ECG-only models had lower AUROCs than the clinical model in this design" reads two component and baseline rows that Table 2 shows in any case; no section, paragraph or table is built around it. |
| Closing: every outline section stands with text | Pass | 1.1 to 1.3, 2.1 to 2.4, 3.1 to 3.3, 4.1 to 4.3, 5.1 to 5.4, 6.1 to 6.4 and 7 hold text. |
| Closing: every image path names an existing file | Pass | The three image paths name the three files in the manuscript's figures folder (`ls`). |
| Closing: an unused line is an issue marked needs the user | Done | D1-55. |
| Closing: heading levels follow the outline | Pass | Unchanged by the revision; 7.1 folded into 7. |
| Closing: font, spacing, margins, page numbers | Pass, not verifiable against a guide | Elsevier article class, preprint mode, 12 pt; config states no limits (D1-67). Not compiled in this review. |
| Closing: title page, running head, abstract page, heading and float format | Pass, not verifiable against a guide | Front matter, abstract and keyword environments of the class; booktabs tables; captions above tables and below figures. |
| Closing: the venue's stated requirements are met | Not verifiable | Config states none (D1-67). |
| Closing: title page holds title, authors, affiliations, corresponding author | Fail | Placeholders, D1-19, needs the user. |
| Closing: abstract present and within the limit, keywords present | Pass, with D2-5 | No limit stated; 312 tokens; six keywords. |
| Closing: data availability, ethics, CRediT, conflict of interest, funding and AI disclosure statements | Present, with placeholders | D1-7 to D1-9 and D1-20 to D1-22, needs the user. |
| Closing: a limitations section | Pass | 6.3, now with the calibration, PPV-rate and participant-table limitations. |
| Closing: every source with a DOI carries it | Pass for cited sources | Every cited entry carries a DOI; the unused CLOCS entry does not (D2-6, needs the user). |
| Closing: the reference file that the bibliography command names exists | Pass | It exists and holds 68 entries. |
| Non-ASCII characters in the draft | Pass | `LC_ALL=C grep -n '[^ -~]'` on the manuscript printed nothing. |

### Revision instructions
No writer pass follows draft review round 2. The items below go to the final message as acknowledged items, and to the draft writer only if the user asks for an expanded revision.

1. D2-1: state the occlusion width as 24 ms (12 samples at 500 Hz) in 4.3, 6.3 and the Figure 3 and Table 5 captions, replace the five spans of Table 5 by those given in the issue, and write "about 136 to 62 ms" in 6.2.
2. D2-2: in 6.3, replace "whose controls include" by "whose one-year negatives include".
3. D2-3: in the first sentence of 6.2, replace "without changing what its ECG factors mean" by "without passing the risk factors through its ECG factors".
4. D2-4: add the sentence on the offsets that belong to no window to 4.3.
5. D2-5: shorten the abstract to about 250 words, keeping the sample and horizon qualifiers.

For the authors (needs the user): D1-7 to D1-9, D1-16 to D1-22, D1-54 to D1-63, D1-66, D1-67 and D2-6.

### At the stop
- Root cause: the Critical issues left open, D1-7, D1-8 and D1-9, are facts only the authors hold (the CRediT roles, the funders and grant numbers, the competing-interest declaration). None of the four causes the page names (structure, evidence, writing, originality) applies, and an expanded revision from any step would not resolve them, since no role of the run holds these facts. The remaining text issues D2-1 to D2-5 are a writing problem; an expanded revision for them would return to the sections.
- Estimate of the additional work for an expanded revision: Moderate (five quick fixes in the text; the three Critical issues need the authors' input whatever the answer).
- Lower the venue: config states no venue limits, so the draft misses none; a lower venue would not resolve D1-7 to D1-9.

### Reviewer confidence
High for the resolution of the round-1 issues and for the new issues: each revised passage was read in the full revised draft, the numbers were compared with the study's saved gold-label results, the readout's window width, grouping and clipping were read in the analysis as carried out, and cite-keys, check-urls and the word count were run on the revised draft in this review. Medium for the judgments on cited claims, which rest on the citation report, whose readings were abstracts only for 41 of the 64 sources. The manuscript was not compiled in this review, and no venue guide was available for the format checks.

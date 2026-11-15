# Final message of the run

## prose review report (before the writer pass)

# Fix first

## Prose standard, 0. Hard rules / No repeated construction

1. main.tex:46 and main.tex:89. The same clause appears in two sections: "those networks are explained with Grad-CAM maps instead of through their factors" (46) and "the networks are explained with Grad-CAM maps instead of through their factors" (89). The rule says a sentence shape that recurs across sections is a template and is rewritten.
   Also references/rules.md, Precision / Term defined at first use: Grad-CAM is not defined at main.tex:46, where it first appears.
   Also Prose standard, D. Structure / Binary contrast ("not X, Y") at most twice per page: "instead of through their factors" (89) is one of the four contrasts in finding 37.

2. main.tex:46, main.tex:69, main.tex:85 and main.tex:91. The same gap sentence closes or nearly closes four subsections. It ends 69 and 91, comes second to last in 85, and stands sixth of eight sentences in 46. The passages are: "To our knowledge, no published model places readable block-term frequency and lead factors on the predictive path of a survival network for incident AF." (46), "To our knowledge, none of these reports includes a test of whether the explanation reflects what the model uses to predict." (69), "To our knowledge, no study in this literature compares an intrinsically interpretable model with a CNN on incident AF under one protocol." (85), and "No model in this literature trains readable block-term frequency and lead factors end to end with a survival objective for incident AF, with clinical factors kept outside the factor layer." (91). Sentences 46 and 91 also state the same gap. The rule says a sentence shape that recurs across sections is a template and is rewritten.

3. main.tex:136, main.tex:319 and main.tex:335. Two points are made more than once. First, that no reading of the factors is reported: "this study reports no reading of the learned frequency and lead factors" (136) and "although this study reports no reading of the fitted frequency and lead factors" (319). Second, that the head's use of the factors is not measured: "Whether the nonlinear head uses the factors in the way a reader of them would assume is a separate question, which this study does not measure" (136) and "Readable factors do not by themselves show that the nonlinear head routes its decision through them in the way their reading suggests ... this study reports no measurement of how far the factors carry the decision" (335). The rule says a sentence shape that recurs across sections is a template and is rewritten.
   Also Manuscript prose standard, Rules replaced / Section D, Paragraphs: the paragraph at main.tex:335 covers two ideas. The first is the limits of the occlusion readout. The second, from "Readable factors do not by themselves show that the nonlinear head routes its decision through them", is whether the head uses the factors. A paragraph that covers two ideas is split.

4. main.tex:157 and main.tex:335. The same pair of clauses appears in Experiments and in Limitations: "The replacement value and the window size shape an occlusion map \cite{arxiv_1702_04595}, and the perturbation method and the region size shape the evaluation of attributions on time series \cite{_imi__2025}" (157), and "since the replacement value and the window size shape an occlusion map \cite{arxiv_1702_04595}. The perturbation method and the region size likewise shape the evaluation of attributions on time series \cite{_imi__2025}" (335). The rule says a sentence shape that recurs across sections is a template and is rewritten.
   Also Manuscript prose standard, Rules replaced / Section D, Paragraphs: the paragraph at main.tex:157 (204 words) covers two ideas. The first is the definition of the windows. The second, from "The replacement value and the window size shape an occlusion map", is how the readout's choices shape the result. A paragraph that covers two ideas is split.

## Prose standard, D. Structure / No synonym cycling

5. main.tex:40 and main.tex:67. The concept called "incident AF" elsewhere is also "new-onset AF": "Deep networks trained on sinus-rhythm ECGs predict new-onset AF." (40), "for new-onset AF within one year" (40) and "for new-onset AF within one year" (67). The rule asks for one term per concept, repeated.
   Also Manuscript prose standard, Rules replaced / Section D, Paragraphs: the paragraph at main.tex:40 covers two ideas. The first is that ECG networks predict AF and complement CHARGE-AF. The second, from "Reported performance also depends on how the outcome is defined", is how the outcome definition moves reported values. A paragraph that covers two ideas is split.

6. main.tex:40, main.tex:65, main.tex:67, main.tex:77 and main.tex:91. AUROC is defined at main.tex:40, and the same measure then appears as "a median AUC of 0.740" (40), "an AUC of 0.87" (65), "an AUC of 0.845" (67), "an AUC of 0.62" (77) and "an ROC-AUC of 91.25\%" (91). The rule asks for one term per concept, repeated.

7. main.tex:50, main.tex:331 and main.tex:347. The model called "the clinical model" elsewhere is also "a clinical risk-factor model" (50), "The clinical comparator is therefore narrower than a full clinical score" (331) and "The clinical comparator used here" (347). The rule asks for one term per concept, repeated.

8. main.tex:67, main.tex:73 and main.tex:75. One concordance measure goes by several names: "a C-index of 0.750" and "a C-statistic of 0.754" (67), "a C statistic of 0.78" (73) and "equal C statistics of 0.69" (75). The rule asks for one term per concept, repeated.

9. main.tex:91 and main.tex:319. The "block-term layer" named at main.tex:99 is also "the factor layer": "with clinical factors kept outside the factor layer" (91, before the layer is named) and "whose clinical inputs enter the factor layer" (319). The rule asks for one term per concept, repeated.

10. main.tex:311 and main.tex:343. After main.tex:134 defines "We call BTTN with the clinical term the fused model", the text goes back to "BTTN with the clinical term had the highest one-year discrimination" (311) and "a block-term tensor network with a separate clinical term had the highest one-year discrimination" (343). Both paragraphs also use "the fused model". The rule asks for one term per concept, repeated.

11. main.tex:311, main.tex:345 and main.tex:347. main.tex:118 names the model evaluated alone "ECG-only BTTN". The text also calls it "Its ECG term alone" (311), "The ECG term alone" (345) and "the ECG term alone 0.7397" (347). The rule asks for one term per concept, repeated.

## Prose standard, D. Structure / No mirror structure

12. main.tex:311 and main.tex:343. The first Discussion paragraph and the first Conclusion paragraph make the same claims in the same order: highest one-year discrimination, point estimates above the clinical model at four horizons, calibration in most deciles, more future cases flagged, then a small gain with overlapping intervals and no interval of the difference. One sentence appears word for word in both: "After logistic recalibration within the survival sample, the predicted and observed one-year proportions of the fused model agreed closely in most risk deciles." The rule says each section takes the shape its content needs.
   Also references/rules.md, Reader's path / Clarity test: everything in the paragraph at main.tex:311 is in the Results and again in the Conclusion (343 to 345). A paragraph whose removal loses nothing is deleted.
   Also references/rules.md, Common style errors / Vague phrase: "agreed closely in most risk deciles" (311, 343) gives neither how close nor how many deciles. A vague phrase is replaced with the specific claim.

## references/rules.md, Precision / Pronoun with a clear antecedent

13. main.tex:315. "Its operating point at the top 10\% of risk is of the same order as that of one externally validated model." The sentence before is "The gain of the fused model over the clinical model agrees with reports ...", so "Its" could mean the gain, the fused model or the clinical model. The rule asks that a pronoun have a clear antecedent.

## references/rules.md, Precision / Term defined at first use

14. main.tex:25. "The ECG term alone reached 0.7397". The abstract defines the clinical term but not the ECG term. The rule asks that a technical term be defined where it first appears.

15. main.tex:25 and main.tex:55. "with a 30-day blanking window" appears in the abstract (25) and in the contributions (55) without an explanation. What the window does is first stated at main.tex:145. The rule asks that a technical term be defined where it first appears.

16. main.tex:46. "splits a multiway signal into blocks with low-rank factors per mode". Neither "mode" nor "low-rank" is defined here. The rule asks that a technical term be defined where it first appears.

17. main.tex:81. "Under remove-and-retrain evaluation". The method is not defined here or at main.tex:339. The rule asks that a technical term be defined where it first appears.

18. main.tex:83. "The leakage result bears on any nonlinear head placed on readable factors". "Leakage" is used here for the first time, and the sentence before does not name it. The rule asks that a technical term be defined where it first appears.

19. main.tex:89. "A block-term decomposition writes a tensor as a sum of blocks of low multilinear rank, and it contains the CP and Tucker decompositions as special cases". Multilinear rank and the CP and Tucker decompositions are not defined. The rule asks that a technical term be defined where it first appears.
   Also references/rules.md, Paragraphs / First sentence states the point: this first sentence repeats the definition from main.tex:46. The paragraph's point comes in its third sentence, "The uses of block-term structure differ in where the factors sit". A paragraph's first sentence states the paragraph's main point.

20. main.tex:91. "These models fit their blocks by deflation". Deflation is not defined here, and main.tex:106 adds only "one at a time". The rule asks that a technical term be defined where it first appears.

21. main.tex:104. "which multiplies each mode-$n$ fibre of the tensor by the matrix". A fibre is not defined. The rule asks that a technical term be defined where it first appears.

22. main.tex:129. "Age is the anchor age of MIMIC-IV". Anchor age is not defined, and main.tex:331 says only what it is not. The rule asks that a technical term be defined where it first appears.

23. main.tex:151. "after two-fold cross-fitted logistic recalibration". Cross-fitting is not defined, here or in the caption at main.tex:249. The rule asks that a technical term be defined where it first appears.

24. main.tex:244. "All three models had a net benefit above both treating all and treating none". Net benefit is not defined. The rule asks that a technical term be defined where it first appears.

25. main.tex:339. "would test whether the model transports". "Transports" is not defined. The rule asks that a technical term be defined where it first appears.

## references/rules.md, Objectivity / Limitations and alternative interpretations

26. main.tex:145. "Controls had no AF diagnosis and at least 365 days of follow-up." The table row at main.tex:177 shows that this requirement excluded 88,945 of 151,941 eligible patients. The Limitations (main.tex:329 to 335) do not say that the requirement selects the cohort or that the selection could bias the results. The rule asks the text to acknowledge the limitations of the study.

27. main.tex:279. "Per unit of energy removed, the profile was highest in the PR window, at 0.00216." Dividing by removed energy favours low-energy windows, and the text does not offer the normalisation itself as an alternative explanation of why the PR window ranks first. main.tex:335 names the zero replacement, the window size and the fixed windows as shaping the profile, but not the energy normalisation. The rule asks the text to acknowledge alternative interpretations of its results.

## references/rules.md, Paragraphs / Claim with evidence or citation

28. main.tex:97. "A magnitude spectrogram changes little when the beat shifts within a window, so beats need no alignment across recordings." No data, citation or example supports the claim. The rule says a claim is followed by the data, the citation or the example that supports it.

# Style

## Prose standard, 0. Hard rules / No repeated construction

29. main.tex:67. Six sentences in one paragraph take the shape "[model] reached [metric] of [value]": "Raghunath et al.\ reached an AUROC of 0.85", "A model from a Montreal cardiac centre reached 0.78", "a CNN trained with a discrete-time survival loss reached ...", "A model of ECG images on the same hospital reached ...", "a residual CNN with survival analysis reached ..." and "A gradient-boosting survival model of 417 engineered ECG features reached ...". The rule says a sentence shape that recurs across entries is a template and is rewritten.

30. main.tex:323, main.tex:331 and main.tex:333. Three paragraphs open with the same limits sentence: "The association is not uniform, and the comparison has a limited scope." (323), "The comparator and the covariates have limits of their own." (331) and "The evaluation of calibration and operating points has limits as well." (333). The rule says a sentence shape that recurs across entries is a template and is rewritten.
   Also Manuscript prose standard, Rules replaced / Section D, Paragraphs: the paragraph at main.tex:323 covers three ideas. It treats the non-uniform association in cohort studies, then how the PR window differs from the PR interval, then, from "The clinical term holds P-wave duration but no PR interval", a hypothesis about the gain of the fused model. The paragraph at main.tex:333 covers two ideas: the limits of the calibration and PPV evaluation, then, from "The study also reports no table of the characteristics of cases and controls", the missing participant table and missing-value counts. A paragraph that covers two ideas is split.

31. main.tex:323 and main.tex:325. Two paragraphs in a row end on the same sequence: "One reading of the gain of the fused model is that ... The present results do not test this reading, which remains a hypothesis." (323) and "One reading of the PR-window response is that it reflects such atrial change. The readout cannot show this. The reading is offered as a hypothesis for studies that pair the ECG with measurements of the atrium." (325). The rule says a sentence shape that recurs across entries is a template and is rewritten.
   Also references/registers.md, Medicine and Health / Voice: "The reading is offered as a hypothesis" (325) puts the authors' contribution in the passive. The authors' decisions and contributions take "we".

## Prose standard, A. Vocabulary / Vague qualifiers

32. main.tex:244. "and all curves lay near zero above about 0.12". The rule lists "near-zero" among the vague qualifiers and asks for the number or the specific claim.

## Prose standard, C. Throat-clearing and meta-commentary / Throat-clearing openers

33. main.tex:378. "Researchers wishing to replicate or extend this work should note that MIMIC-IV and MIMIC-IV-ECG require credentialed access under the PhysioNet data use agreement." The words "should note that" are a variant of "It should be noted that". The rule asks that the opener be deleted, not rewritten.

## Prose standard, C. Throat-clearing and meta-commentary / Never describe what the page is about to do

34. main.tex:244. "The thresholds in this paragraph are read from the decision curves of Figure~\ref{fig:clinical-utility}." The sentence describes its own paragraph. The rule asks that such commentary be cut so that the content stands alone.
   Also references/rules.md, Paragraphs / First sentence states the point: the paragraph's point is the range of threshold probabilities over which the models have net benefit, and its first sentence does not state it.
   Also Manuscript prose standard, Rules replaced / Section D, Paragraphs: this paragraph has 74 words, and the paragraph before it at main.tex:242, "At the top 10\% of risk, the fused model had a sensitivity of 0.272 against 0.240 for the clinical model", has 71. Both are far below 120 words, and a paragraph far outside that length is split or joined with its neighbour.

## Manuscript prose standard, Rules replaced / Section D, Paragraphs

35. main.tex:151, main.tex:315 and main.tex:329. Three paragraphs each cover two ideas. The rule says a paragraph that covers two ideas is split.
   - main.tex:151, "The one-year comparison used stratified five-fold cross-validation at the patient level ..." (204 words). The first idea is the cross-validation and bootstrap protocol. The second, from "Calibration and clinical use were assessed", is the calibration and clinical-use measures, the PPV recomputation and the TRIPOD+AI statement.
   - main.tex:315, "The gain of the fused model over the clinical model agrees with reports that ECG and clinical information are complementary". The first idea is the fused model against the clinical model and its operating point. The second, from "The comparability of ECG-only BTTN with the CNN", is ECG-only BTTN against the CNN and the cost of interpretability.
   - main.tex:329, "The study used one database from one health system and has no external validation in a cohort with dated outcomes." This first sentence is about the single database and the missing external validation. The rest of the paragraph is about the accuracy of the ICD-coded labels.

## Prose standard, D. Structure / Lists

36. main.tex:339. "Several studies would extend this work." The paragraph then runs five list-shaped items as prose: the test of the block factors, external and temporal validation, a fuller clinical comparator, a paired interval for the difference, and an occlusion readout on held-out ECGs. The rule says three or more list-shaped items in paragraph form become a list, introduced with a colon.

## Prose standard, D. Structure / Binary contrast ("not X, Y") at most twice per page

37. main.tex:89 and main.tex:91. Within about 270 words, which is one page, there are three contrasts: "The model of this paper shares part of that name and is a different model" (89), "That work separates sources within a recording and does not predict risk" (89) and "which is a different task from dated incidence" (91). A fourth, "instead of through their factors" (89), is reported in finding 1. The rule allows at most two per page, and only where the contrast is the actual point.

## Prose standard, E. Sentence shapes / Sentence length

38. main.tex:56 and main.tex:313. The rule asks for sentences under roughly 20 words unless the mechanism needs more.
   - main.tex:56, "A comparison of one-year discrimination against a clinical model, a CNN and linear block-term tensor regression (BTTR) under one protocol, and the discrimination of BTTN at four horizons, read from the same cross-validated risks without refitting for each horizon." At 39 words, it chains two contributions that do not depend on each other.
   - main.tex:313, "So does AF diagnosis from the ECG: a foundation model reported an AUROC of 0.996 for the AF label of multi-label ECG interpretation, and its authors released an open benchmark on MIMIC-IV-ECG \cite{McKeen_2025}." At 33 words, it adds the release of a benchmark, which the point about another task does not need.

## Manuscript prose standard, G. The project's own software / No software wording

39. main.tex:374. "Every reported number comes from the saved results of the analysis of the study." The phrase "saved results" uses the wording of a software operation for the project's own work. The rule asks that a result be worded as a statement about the study.

## references/rules.md, Concision / One idea per sentence

40. main.tex:25. "Atrial fibrillation (AF) raises stroke risk, and electrocardiogram (ECG) models that predict its onset are explained only after training, by attribution methods that agree poorly." The sentence joins two separate ideas with "and": the stroke risk of AF, and the after-training explanation of ECG models. The rule asks for one idea, or clearly connected ideas, per sentence.

## references/rules.md, Paragraphs / First sentence states the point

41. main.tex:211 and main.tex:279. The rule says a paragraph's first sentence states the paragraph's main point.
   - main.tex:211, "In the survival design, the same cross-validated risks were read at every horizon without refitting (Table~\ref{tab:horizons})." The sentence restates the procedure. The paragraph's point, that the fused model stays above the clinical Cox model at each horizon, comes later.
   - main.tex:279, "Raw occlusion of the ECG term was dominated by the QRS window, where the mean drop in log-risk was 0.0232 against 0.0037 in the PR window". The paragraph's point is the energy-normalised profile, which is highest in the PR window.

## references/rules.md, Paragraphs / Evidence followed by what it means

42. main.tex:44 and main.tex:240. The rule says evidence is followed by an interpretation that connects it to the paragraph's claim.
   - main.tex:44, "The 2024 guideline of the European Society of Cardiology addresses the neighbouring task of automated AF diagnosis. It states that the clinical performance and broad applicability of such algorithms are not yet known \cite{Van_Gelder_2024}." No sentence connects this to the paragraph's claim that the networks are black boxes explained after training.
   - main.tex:240, "Brier scores were 0.0390 for the fused model, 0.0396 for ECG-only BTTN and 0.0398 for the clinical model." The paragraph ends on these values, and no interpretation connects them to its claim about calibration.

## references/rules.md, Common style errors / Vague phrase

43. main.tex:240. "predicted and observed one-year proportions of the fused model were close in most deciles". The phrase says neither how close nor in how many deciles. The rule asks that a vague phrase be replaced with the specific claim. The same phrase at main.tex:311 and main.tex:343 is reported in finding 12.

## references/rules.md, Common style errors / Tense per section

44. main.tex:149. "With batch normalisation, dropout and global average pooling, it is trained with weighted cross-entropy and early stopping as a three-member ensemble." The paragraph reports the fitting of the baselines in mixed tenses: "Three baselines shared" and "Linear BTTR ... was fitted" against "it is trained". The rule says Methodology reports in the past tense.

## references/registers.md, Medicine and Health / Voice

45. main.tex:50, main.tex:143 (two places) and main.tex:192. Each passage states an authors' decision in the passive. The rule says the authors' decisions take "we", and the passive is kept for a procedure whose actor does not matter.
   - main.tex:50, "Labels read from the ECG were not used as outcomes, since a third of a sample of 700 AF-labelled ECGs of this database did not show AF on expert review"
   - main.tex:143, "AF and flutter were counted together, since a coded flutter diagnosis did not reliably separate flutter from AF in a registry validation"
   - main.tex:143, "Hospital diagnoses were preferred to labels read from the ECG, since only 65.4\% of 700 AF-labelled ECGs in MIMIC-IV showed AF on expert review"
   - main.tex:192, "The study reports no paired interval for the difference between the fused and clinical models, so their estimates are reported side by side."

Tokens of the four prose review agents: sentence agent 88,918, section agent 86,496, whole-draft agent 84,679, checking agent 130,400; sum 390,493.

A one-line reply starts the draft writer for named findings and the compile again, in the forms `all`, `all but 3, 7`, `2, 5` or `none`.

You can instead ask for an autonomous writer pass, in which the draft writer judges each finding, applies the ones it accepts and lists the rest with its reason. Under your instruction not to stop, that pass was taken: patch 26 applied findings 1 to 31 and 33 to 45; finding 32 was not applied, because replacing "near zero above about 0.12" needs a net-benefit value that the manuscript does not report, and no number may be added.

## What the run delivered

- Manuscript: `manuscript/main.tex` (elsarticle, Vancouver, compiled with pdfLaTeX after the writer pass: latexmk exit 0, 0 errors, 0 overfull boxes, 0 LaTeX warnings, 36 pages), `manuscript/refs.bib` (68 entries) and `manuscript/figures/` (3 images).
- Cover letter: `manuscript/cover-letter.tex`.
- No anonymous copy, since the venue's review type was not stated.
- Run folder `run/`: settings.md, review.md, refs.bib, outline.md, arguments.md, draft-report.md, intended-claims.md, figures.md, figures/, citation-report.md with citation-report-start1.md to start4.md, check-log.md, review-1.md to review-8.md, revision-log-1.md to revision-log-7.md, compile-review6/ to compile-review8/, patches/ (01 to 26) and this final.md.

## Scope of the paper

- The paper answers the accuracy half of the research question and reports where in the cardiac cycle the ECG evidence lies. It does not claim that the block signatures are faithful. The committed faithfulness_controls.csv, intervention_curve.csv and ablation_blockstructure.csv come from runs whose label source is not established: hpc/analyses_jobs.slurm passes `--source ecg` to all three, run_all.sh passes `--source icd`, and no log shows which one produced the files. Rerunning faithfulness_controls.py, intervention_curve.py and ablation_blockstructure.py with `--source icd` would give gold-label results that restore the faithfulness clause.
- No table of participant characteristics is reported, since building it needs computation over the cohort files. The Limitations say so.

## Items that need you

- Critical: CRediT roles, funding and competing interests are `[GAP]` placeholders (RI1.7, RI1.8, RI1.9). main.tex has 11 lines with a placeholder and cover-letter.tex has 6.
- Author block, ethics, consent, de-identification, data-access wording and repository URL (RI1.19 to RI1.22), and the AI-use categories in the disclosure.
- RI1.16: no reading of the learned factors on ICD-coded labels is reported. RI1.17: the manuscript does not say how the hyperparameters were chosen. RI1.18: the text inside the three figure images (text too small, a "drives" title, "attention over blocks") does not match the captions. Rerunning the figure scripts would fix it.
- RI1.66: no paired interval for the fused against the clinical model. RI1.67: no venue guide was given.
- References: RI1.54 (failing links, below), RI1.55 (unused entries, below), RI1.56 and C20 (Cheng_2009 lists one author and its first page only), RI1.58 (eleven entries without an article number or page range, and the volumes of Riek 2026 and Malmo 2016), RI1.62 (non-standard citation keys), RI2.6 (the unused CLOCS preprint has no DOI) and RI5.8 with C2 (confirm Khurshid_2025 and Faes_2024 against their published versions; they were read as the Article in Press PDF and an author copy).
- RI1.63: the placeholders of the cover letter. RI4.4: the source comment on the placement of the AI declaration, since the journal's policy was not given.

## Reference checks

- `unused:` lines from cite-keys: Wagner_2020, https://doi.org/10.5281/zenodo.4916206, Mehari_2022, arxiv_2005_13249. No role removes them.
- 28 check-urls lines fail the 2xx rule and stay listed under mark-only: 26 answer 403 and 2 answer 202 (Faes_2024, Goulart_2020). `lookup resolve` confirmed every one of these DOIs against its entry. The 26 answering 403 are Kashou_2021, Wolf_1991, Alonso_2013, Raghunath_2021, Khurshid_2022, Tsiartas_2025, Saiz_Vivo_2025, Van_Gelder_2024, Arends_2026, De_Lathauwer_2008, Valasakis_2026, Yuan_2023, Jabbour_2024, Cheng_2009, Christopoulos_2020, Biton_2021, Kolda_2009, Cox_1972, Rix_2012, Vickers_2006, Collins_2024, McKeen_2025, Magnani_2013, Yogeswaran_2025, Goette_2016 and Maezono_2025.
- Sources that only a preprint server or no index matched, from citation-report.md: none matched only by a preprint server. For arxiv_2010_04963, arxiv_2205_10268 and arxiv_2507_16761, OpenAlex holds the published version under its own DOI. One source was matched by no index: the MIMIC-IV-ECG dataset (https://doi.org/10.13026/4nqg-sb35), which OpenAlex holds under another version's DOI and year. Its doi.org record agrees in every field.
- The citations were checked against their sources by the citation compliance agent before the writer pass. The writer pass added four definitions that cite entries already in refs.bib: remove-and-retrain (arxiv_1806_10758), CP and Tucker (Kolda_2009), anchor age (Johnson_2023) and net benefit (Vickers_2006). The draft writer checked those against passages read in the run; the citation compliance agent did not check them again.

## Acknowledged limitations

- The last draft review (review 8, 7.55/10) did not end on Accept. Its verdict was Minor Revision by score, and the run stopped at "The draft review does not pass" because RI1.7 to RI1.9 are facts only you can supply. Accept was taken at that stop, and the open issues stay listed.
- RI8.1: the first line of the cover letter's confirmation paragraph runs 9.2 pt past the margin. It sits in the paragraph that holds three `[GAP]` placeholders, so it reflows when you fill them.
- prose review finding 32 was not applied (reason above).

## Departures from the procedure

- The four prose review agents each read their whole prompt from one file, assembled with shell commands in the temporary folder, rather than receiving it inline. The rule texts were copied from the pages unchanged. This is recorded in settings.md.
- The run took every choice under your no-interaction instruction, including the autonomous writer pass. Each choice and its reason is in the Decisions of settings.md.

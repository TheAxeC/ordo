Review of /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx, read through docx_paragraphs.py. Register applied: Medicine and Health (an MRI prediction study of hepatocellular carcinoma).

=== 1. references/rules.md, "Hedging" ===
The title and paragraphs 35 and 48 state as fact that the trajectory anticipates lesions and that surveillance can warn in time, which the project has yet to test, in a confirmatory set of 8 patients (paragraph 40).

Place: paragraph 2
Passage: "Before the tumour: an interpretable pre-lesional field trajectory that anticipates lesion emergence in the cirrhotic liver"
Rule: references/rules.md, "Hedging" (an untested result stated without a hedge)
Replacement: Before the tumour: an interpretable pre-lesional field trajectory ([definition of "pre-lesional field trajectory" as the author uses it]) that may anticipate lesion emergence in the cirrhotic liver
Also breaks: references/rules.md, "Terms defined at first use" ("pre-lesional field trajectory" is used here first and is never defined).

Place: paragraph 35
Passage: "If it does, surveillance can warn within the curative window."
Rule: references/rules.md, "Hedging"
Replacement: If the change exceeds this variation, surveillance could warn within the curative window.
Also breaks: references/rules.md, "Clear antecedents" ("it" stands alone after a sentence whose subject is a whether-clause).

Place: paragraph 48
Passage: "If the hypothesis holds, surveillance can warn within the curative window, and the method transfers to other field-cancerisation settings [5] (Barrett's oesophagus, oral premalignancy, bronchial field change)."
Rule: references/rules.md, "Hedging" (an untested generalization stated without a hedge)
Replacement: If the hypothesis holds, surveillance could warn within the curative window. The method could also transfer to other field-cancerisation settings [5] (Barrett's oesophagus [citation that Barrett's oesophagus is a field-cancerisation setting], oral premalignancy, bronchial field change [citation that bronchial field change is a field-cancerisation setting]).
Also breaks: references/rules.md, "Evidence for claims" (reference 5 covers oral epithelium only).
Also breaks: references/rules.md, "Formality" (two ideas: surveillance could warn in time; the method could transfer to other settings).

=== 2. Prose standard, section A, vague qualifiers ===
The problem statement rests on how often HCC arises in cirrhosis and how often surveillance finds it too late (paragraph 34), and the draft gives neither share, so the reader cannot weigh the problem.

Place: paragraph 8
Passage: "Liver cancer usually grows in a scarred, cirrhotic liver, and scans find it only once a tumour is visible, often too late to cure."
Rule: prose standard, section A ("usually", "often")
Replacement: Liver cancer grows in a scarred, cirrhotic liver in [the share of cases the author's source gives]. Scans find it only once a tumour is visible, in [the share of cases the author's source gives] too late to cure.
Also breaks: references/rules.md, "Formality" (two ideas: liver cancer grows in a cirrhotic liver; scans find it only once visible, too late to cure).

Place: paragraph 11
Passage: "Leverkanker ontstaat meestal in een verlittekende, cirrotische lever, en scans vinden een tumor pas als die zichtbaar is, vaak te laat om te genezen."
Rule: prose standard, section A ("meestal", "vaak")
Replacement: Leverkanker ontstaat in [the share of cases the author's source gives] in een verlittekende, cirrotische lever. Scans vinden een tumor pas als die zichtbaar is, in [the share of cases the author's source gives] te laat om te genezen.
Also breaks: references/rules.md, "Formality" (two ideas: liver cancer arises in a cirrhotic liver; scans find a tumour only once visible, too late to cure).

Place: paragraph 34
Passage: "Hepatocellular carcinoma (HCC) mostly arises in a cirrhotic liver [1], and imaging surveillance is meant to catch it while cure is still possible [2]."
Rule: prose standard, section A ("mostly")
Replacement: In [the share of HCC cases that arise in a cirrhotic liver, as reference 1 reports it], hepatocellular carcinoma (HCC) arises in a cirrhotic liver [1]. Imaging surveillance is meant to detect it while cure is still possible [2].
Also breaks: references/rules.md, "Formality" (two ideas: HCC arises in a cirrhotic liver; surveillance is meant to detect it while curable).
Also breaks: references/rules.md, "Formality" (the colloquial word "catch").

Place: paragraph 34
Passage: "In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3], frequently past the curative window."
Rule: prose standard, section A ("frequently")
Replacement: In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3], in [the share of cases, with its citation] past the curative window.
Also breaks: references/rules.md, "Evidence for claims" (no citation for detection past the curative window).

Place: paragraph 34
Passage: "Imaging analysis mostly characterises the tumour [7], and how the background liver changes across serial scans before diagnosis is rarely studied."
Rule: prose standard, section A ("mostly", "rarely")
Replacement: In [the share of published imaging analyses that characterise the tumour, with its source], imaging analysis characterises the tumour [7]. How the background liver changes across serial MRI studies before diagnosis is studied in [the number of published analyses that do so, with their citations].
Also breaks: references/rules.md, "Evidence for claims" (no citation for "rarely studied").
Also breaks: prose standard, section D, "No synonym cycling" ("scans" for MRI studies).
Also breaks: references/rules.md, "Formality" (two ideas joined by a contrast: imaging analysis characterises the tumour; background-liver change before diagnosis is rarely studied).

Place: paragraph 40
Passage: "The studies hold several MRI scan types (sequences): diffusion scans at four strengths of sensitivity to water movement, a pair of T1 scans whose difference shows fat, a T2 scan and scans after contrast injection."
Rule: prose standard, section A ("several"). The list after the colon gives every scan type, so the qualifier is cut.
Replacement:
The studies hold these MRI scan types (sequences):
- diffusion scans at four strengths of sensitivity to water movement;
- a pair of T1 ([definition of T1 weighting]) scans whose difference shows fat;
- a T2 ([definition of T2 weighting]) scan;
- scans after contrast injection.
Also breaks: prose standard, section D (four list-shaped items in paragraph form).
Also breaks: references/rules.md, "Terms defined at first use" ("T1" and "T2" are never defined).

Place: paragraph 41
Passage: "Within the liver outline from the organ map, the signal of every image point in every sequence at every scan date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1)."
Rule: prose standard, section A ("a few")
Replacement:
Within the liver outline from the organ map, the signal of every image point in every sequence at every study date forms one three-way table. The table is summarised as [the expected number of] interpretable components [9-11] (Figure 1). Each component is a pattern with three parts:
- where in the liver it lies;
- how strongly it shows in each sequence;
- how it changes over time.
Also breaks: prose standard, section E, "Sentence length" (57 words, citation excluded).
Also breaks: prose standard, section D (three list-shaped items in paragraph form).
Also breaks: prose standard, section D, "No synonym cycling" ("scan date" for study date).

Place: paragraph 42
Passage: "In the primary analysis, the score of each tested study is compared with the scores of never-HCC studies at a matched position: same scan year, same number of earlier studies, similar time since the first study and similar interval since the previous study."
Rule: prose standard, section A ("similar", twice)
Replacement:
In the primary analysis, the score of each tested study is compared with the scores of never-HCC studies at a matched position:
- the same study year;
- the same number of earlier studies;
- a time since the first study within [the tolerance the matching rule sets];
- an interval since the previous study within [the tolerance the matching rule sets].
Also breaks: prose standard, section D (four list-shaped items in paragraph form).
Also breaks: prose standard, section D, "No synonym cycling" ("scan year" for study year).

Place: paragraph 45
Passage: "Each patient's serial MRI before diagnosis is reduced to a few interpretable components of the background liver."
Rule: prose standard, section A ("a few")
Replacement: Each patient's serial MRI before diagnosis is reduced to [the expected number of] interpretable components of the background liver.

=== 3. references/rules.md, "Limitations and alternative interpretations" ===
Paragraph 48 presents reference 8 as evidence for cirrhosis in general, but the title of reference 8 limits it to hepatitis B virus-related cirrhosis.

Place: paragraph 48
Passage: "Imaging of the background liver already estimates HCC risk: elastography measures liver stiffness [13], and computer-extracted image features of the whole liver on a baseline MRI predict HCC development in cirrhosis [8]."
Rule: references/rules.md, "Limitations and alternative interpretations"
Replacement: Imaging of the background liver already estimates HCC risk: elastography measures liver stiffness [13]. Computer-extracted image features of the whole liver on a baseline MRI predicted HCC development in hepatitis B virus-related cirrhosis [8].
Also breaks: references/rules.md, "Tense per section" (a cited finding in the present tense).
Also breaks: prose standard, section E, "Sentence length" (30 words, citations excluded).

=== 4. references/rules.md, "Reader's question per section" (Methodology) ===
The Approach gives a confirmatory set of 8 patients without saying what that size allows. The reader meets the 0.91 standard-deviation limit only in C2.

Place: paragraph 40
Passage: "Of the 37 patients who develop HCC, 8 have a usable study at least 12 months before diagnosis together with at least one earlier usable study, and form the confirmatory set."
Rule: references/rules.md, "Reader's question per section" (a methodology section states the limitations up front)
Replacement: Of the 37 patients who develop HCC, 8 have a usable study at least 12 months before diagnosis together with at least one earlier usable study, and form the confirmatory set. With 8 patients in the confirmatory set against 148 never-HCC patients, the smallest detectable effect of the primary analysis is 0.91 standard deviations. The smallest detectable effect is the smallest effect the analysis detects with 80 percent power at one-sided alpha 0.05.

=== 5. references/registers.md, "What the reader looks for" ===
A reader of a medical prediction study looks for the reporting guideline it follows, and paragraphs 40 to 43 name none.

Place: paragraph 42
Passage: "The analysis code, number of components and matching rule are time-stamped on the Open Science Framework before the analyst receives the labels."
Rule: references/registers.md, "What the reader looks for" (a Medicine and Health methods section that names no reporting guideline)
Replacement: The analysis code, number of components and matching rule are time-stamped on the Open Science Framework before the analyst receives the labels. [The reporting guideline the study follows, named by the author.]

=== 6. references/rules.md, "Evidence for claims" ===
The decision to use only non-contrast sequences rests on "shorter contrast-free surveillance scans", and the reader has no source to check that such scans are in use.

Place: paragraph 40
Passage: "The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans."
Rule: references/rules.md, "Evidence for claims"
Replacement: The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans [citation for the contrast-free surveillance scans the author means].

=== 7. references/rules.md, "Terms defined at first use" ===
Paragraph 35 says the divergence scores of usable studies are compared at a matched position, and the reader learns what all three terms mean only in the Approach. The hypothesis test is therefore not readable where it is first stated.

Place: paragraph 8
Passage: "This project tests whether that change is measurable in the tumour-free liver on repeat MRI scans and departs from the same liver's earlier stable pattern before a tumour appears."
Rule: references/rules.md, "Terms defined at first use" ("MRI" is never written out)
Replacement: This project tests whether that change is measurable in the tumour-free liver on repeat magnetic resonance imaging (MRI) scans and departs from the same liver's earlier stable pattern before a tumour appears.

Place: paragraph 31
Passage: "The budget requests 0,42 FTE of the applicant's own postdoctoral salary across the full twelve months (UNL CAO table) to build the interpretable background-liver components, run the trajectory analysis, deliver the pre-registered primary endpoint and release the background-liver atlas."
Rule: references/rules.md, "Terms defined at first use" ("background liver", "components", "trajectory analysis" and "atlas" are used here first; the components and the atlas are defined only in paragraphs 41 and 46, and the background liver never)
Replacement:
We request 0,42 FTE of our own postdoctoral salary across the full twelve months (UNL CAO table). In that time we build the interpretable background-liver components ([the author's definition of the background liver]). Each component is a pattern with three parts:
- where in the liver it lies;
- how strongly it shows in each kind of MRI scan;
- how it changes over time.

We follow each patient's components across serial MRI studies before diagnosis. We also run the pre-registered primary analysis. That analysis tests whether the components depart from each patient's stable course at least 12 months before hepatocellular carcinoma (HCC) is diagnosed, more than in patients who never develop HCC. We then release the background-liver atlas, which holds the component definitions, summary maps and code, with no patient-level data.
Also breaks: prose standard, section D, "No synonym cycling" ("the pre-registered primary endpoint" for the primary analysis).
Also breaks: references/registers.md, "Voice" ("the applicant's" for the author).
Also breaks: prose standard, section E, "Sentence length" (39 words).

Place: paragraph 35
Passage: "The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients)."
Rule: references/rules.md, "Terms defined at first use" ("usable study", "divergence score" and "matched position" are defined only in paragraphs 40 and 42)
Replacement:
The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study. A usable study is one in which every MRI scan type taken without contrast is present. The divergence score of a study is the mean, over components, of its distance from the patient's earlier usable studies. The distance is in standard deviations of the study-to-study variation of stable livers.

The divergence score of the tested study is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients). A matched position has the same study year and the same number of earlier studies as the tested study. Time since the first study and interval since the previous study fall within [the tolerances the matching rule sets].
Also breaks: prose standard, section E, "Sentence length" (47 words).
Also breaks: references/rules.md, "Formality" (two ideas: which study is tested; what its score is compared with).
Also breaks: prose standard, section D, paragraphs (the replacement starts a new paragraph at "The divergence score of the tested study is compared").

Place: paragraph 35
Passage: "The project fits the XS scheme as a pre-registered measurement on a surveillance cohort the applicant already holds, with the readout's sensitivity fixed in advance by inserting changes of known size into real liver scans."
Rule: references/rules.md, "Terms defined at first use" ("readout" is never defined)
Replacement: The project fits the XS scheme as a pre-registered measurement on a surveillance cohort we already hold. The readout ([definition of the readout as the author uses it]) has a detection limit, the smallest change it detects. This limit is fixed in advance by inserting changes of known size into real liver scans.
Also breaks: prose standard, section D, "No synonym cycling" ("sensitivity" for the detection limit).
Also breaks: references/registers.md, "Voice" ("the applicant" for the author).
Also breaks: prose standard, section E, "Sentence length" (35 words).

Place: paragraph 40
Passage: "The clinical record gives the date of HCC diagnosis and the liver segment and size of the tumour for all 37 patients who develop HCC."
Rule: references/rules.md, "Terms defined at first use" ("liver segment" is never defined)
Replacement: The clinical record gives the date of HCC diagnosis and the liver segment ([definition of a liver segment, with the segment scheme the clinical record uses]) and size of the tumour for all 37 patients who develop HCC.

Place: paragraph 41
Passage: "The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients, and the liver segments used in C3 and WP1 are the segments marked on this reference."
Rule: references/rules.md, "Terms defined at first use" ("WP1" is defined only in paragraph 46)
Replacement: The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients. The liver segments used in C3 and in work package 1 (WP1) are the segments marked on this reference.
Also breaks: prose standard, section E, "Sentence length" (39 words, citation excluded).
Also breaks: references/rules.md, "Formality" (two ideas: all livers are aligned to one reference; the segments are those marked on it).

=== 8. Prose standard, section D, "No synonym cycling" ===
"Scan" names both one MRI study and one sequence ("a pair of T1 scans", paragraph 40). As a result, "scan-to-scan variation", the unit of the divergence score, can be read as variation between sequences. The primary analysis also appears under three other names: "the liver test", "the primary test" and "the confirmatory test".

Place: paragraph 35
Passage: "Whether such change exceeds the scan-to-scan variation of cirrhotic tissue is unknown, which makes the project high-risk."
Rule: prose standard, section D, "No synonym cycling"
Replacement: Whether such change exceeds the study-to-study variation of cirrhotic tissue is unknown, which makes the project high-risk.

Place: paragraph 41
Passage: "We align each study to the patient's earlier studies so that the same point of the liver overlaps across scans [12], and exclude studies in which the alignment folds tissue onto itself or puts recognisable liver structures in the wrong place."
Rule: prose standard, section D, "No synonym cycling"
Replacement: We align each study to the patient's earlier studies so that the same point of the liver overlaps across studies [12]. We exclude studies in which the alignment folds tissue onto itself or puts recognisable liver structures in the wrong place.
Also breaks: prose standard, section E, "Sentence length" (40 words, citation excluded).
Also breaks: references/rules.md, "Formality" (two ideas: studies are aligned; badly aligned studies are excluded).

Place: paragraph 41
Passage: "Success means reproducible components that track the fat and iron estimates, and a detection limit fixed before the liver test."
Rule: prose standard, section D, "No synonym cycling" ("the liver test" for the primary analysis)
Replacement: C1 reaches its aim once the components are reproducible and track the fat and iron estimates, and the detection limit is fixed before the primary analysis.
Also breaks: prose standard, section 0, "No repeated construction".

Place: paragraph 42
Passage: "The divergence score of a study is the mean, over components, of its distance from the patient's earlier usable studies, in units of the ordinary scan-to-scan variation of stable livers, expressed as a standard deviation."
Rule: prose standard, section D, "No synonym cycling"
Replacement: The divergence score of a study is the mean, over components, of its distance from the patient's earlier usable studies. The distance is expressed in standard deviations of the ordinary study-to-study variation of stable livers.
Also breaks: prose standard, section E, "Sentence length" (35 words).

Place: paragraph 42
Passage: "The primary test is repeated in the 5 patients with no recorded decompensation by their tested study."
Rule: prose standard, section D, "No synonym cycling" ("the primary test" for the primary analysis)
Replacement: The primary analysis is repeated in the 5 patients with no recorded decompensation by their tested study.

Place: paragraph 42
Passage: "A supporting model gives each patient their own baseline, adjusts for decompensation status at each scan (dated records exist for all 8) and compares each tested study with the patient's earlier usable studies."
Rule: prose standard, section D, "No synonym cycling"
Replacement: A supporting model gives each patient their own baseline and adjusts for decompensation status at each study (dated records exist for all 8). The model compares each tested study with the patient's earlier usable studies.
Also breaks: prose standard, section E, "Sentence length" (33 words).

Place: paragraph 42
Passage: "The data steward keeps the outcome labels, gives the analyst only studies before diagnosis, cuts each never-HCC patient's series at a random point so that series length does not reveal outcome, and estimates this scan-to-scan variation as pre-registered."
Rule: prose standard, section D, "No synonym cycling"
Replacement:
The data steward:
- keeps the outcome labels;
- gives the analyst only studies before diagnosis;
- cuts each never-HCC patient's series at a random point so that series length does not reveal outcome;
- estimates this study-to-study variation as pre-registered.
Also breaks: prose standard, section D (four list-shaped items in paragraph form).

Place: paragraph 45
Passage: "The lower panel sketches a divergence score rising above the smallest detectable change before diagnosis."
Rule: prose standard, section D, "No synonym cycling" ("smallest detectable change" for either the detection limit or the smallest detectable effect)
Replacement: The lower panel sketches a divergence score rising above the [detection limit of C1 or smallest detectable effect of C2, whichever line the figure draws] before diagnosis.

Place: paragraph 46
Passage: "Overlapping work packages: WP1 (mo 1-4) aligns the scans and builds the components (if point-by-point alignment fails the alignment check, averages per liver segment are used instead), obtains the detection limit from inserted changes of known size, deposits the pre-registration and writes the data-management plan; WP2 (mo 3-8, primary) prepares and, after the deposit, runs the confirmatory test; WP3 (mo 7-11) runs the exploratory location test; WP4 (mo 8-12) releases the atlas (component definitions, summary maps and code, with no patient-level data)."
Rule: prose standard, section D, "No synonym cycling" ("the scans" for the studies, "the confirmatory test" for the primary analysis)
Replacement:
Overlapping work packages:
- WP1 (mo 1-4) aligns the studies and builds the components (if point-by-point alignment fails the alignment check, averages per liver segment are used instead), obtains the detection limit from inserted changes of known size, deposits the pre-registration and writes the data-management plan;
- WP2 (mo 3-8, primary) prepares and, after the deposit, runs the primary analysis;
- WP3 (mo 7-11) runs the exploratory location test;
- WP4 (mo 8-12) releases the atlas (component definitions, summary maps and code, with no patient-level data).
Also breaks: prose standard, section D (four list-shaped items in paragraph form).

Place: paragraph 47
Passage: "(i) Signal too small above cirrhotic variation: each patient is their own baseline, and the detectable effect and the readout's detection limit, in the same standard-deviation units, are fixed before unblinding. (ii) Severity: decompensation status at each scan enters the supporting within-patient model. (iii) Scanner drift, with scanner and protocol not recorded: rescaling each scan's signal to a common range, a scan-year covariate and same-year matching. (iv) Missed tumour, alignment error or selection by the alignment check: the blinded radiologist re-read, the LI-RADS exclusions, the alignment check, with the excluded studies described to show whether it removes the most diseased livers, and the random reassignment of diagnosis dates."
Rule: prose standard, section D, "No synonym cycling" ("at each scan" and "scan-year" for the study)
Replacement:
Risks and mitigation:
- (i) Signal too small above cirrhotic variation: each patient is their own baseline, and the detectable effect and the readout's detection limit, in the same standard-deviation units, are fixed before unblinding.
- (ii) Severity: decompensation status at each study enters the supporting within-patient model.
- (iii) Scanner drift, with scanner and protocol not recorded: rescaling each scan's signal to a common range, a study-year covariate and same-year matching.
- (iv) Missed tumour, alignment error or selection by the alignment check: the blinded radiologist re-read, the LI-RADS exclusions, the alignment check, with the excluded studies described to show whether the alignment check removes the most diseased livers, and the random reassignment of diagnosis dates.
Also breaks: prose standard, section D (four list-shaped items in paragraph form).
Also breaks: references/rules.md, "Clear antecedents" ("it" in item (iv) follows four mitigations).

=== 9. references/registers.md, "Voice" ===
These breaks change no claim. The reader meets the same person as "we" (paragraphs 34, 35 and 41) and as "the applicant" (paragraphs 31, 35 and 46).

Place: paragraph 31
Passage: "The applicant's standing appointment covers the remaining time."
Rule: references/registers.md, "Voice" (the author referred to in the third person)
Replacement: Our standing appointment covers the remaining time.

Place: paragraph 46
Passage: "The applicant works at 0,42 FTE across all twelve months on a cohort that is already available, using open-source image-alignment software [12] and established methods for such component summaries [9]."
Rule: references/registers.md, "Voice"
Replacement: We work at 0,42 FTE across all twelve months on a cohort that is already available. We use open-source image-alignment software [12] and established methods for such component summaries [9].
Also breaks: prose standard, section E, "Sentence length" (28 words, citations excluded).

=== 10. references/rules.md, "Clear antecedents" ===
In paragraph 35, "it" follows a sentence that names the claim, the change and the tumour, so the reader cannot tell which of them the exploratory question of C3 is about.

Place: paragraph 35
Passage: "Whether it reflects a diffuse malignant field or a focal precursor is the exploratory question of C3."
Rule: references/rules.md, "Clear antecedents"
Replacement: Whether the change reflects a diffuse malignant field or a focal precursor is the exploratory question of C3.

=== 11. Prose standard, section E, "Sentence length" ===
These breaks change no claim. The reader holds between 30 and 52 words before reaching the point, as in the detection-limit sentence of paragraph 41.

Place: paragraph 34
Passage: "Field cancerisation, first described in oral epithelium [5], holds that a whole diseased organ can be predisposed to cancer, with the tumour arising from gradual, diffuse change in the surrounding tissue."
Rule: prose standard, section E, "Sentence length" (30 words, citation excluded)
Replacement: Field cancerisation holds that a whole diseased organ can be predisposed to cancer, with the tumour arising from gradual, diffuse change in the surrounding tissue. Slaughter et al. first described field cancerisation in oral epithelium [5].

Place: paragraph 34
Passage: "The opportunity is a surveillance cohort of 243 patients and 925 serial MRI studies, in which 37 patients develop HCC, so we can ask what the background liver was doing beforehand."
Rule: prose standard, section E, "Sentence length" (31 words)
Replacement: The opportunity is a surveillance cohort of 243 patients and 925 serial MRI studies, in which 37 patients develop HCC. In this cohort, we can ask what the background liver was doing beforehand.

Place: paragraph 35
Passage: "We hypothesise that in patients who develop HCC, the MRI signal of the background liver departs from that patient's own stable course at least 12 months (two 6-month surveillance intervals [2]) before diagnosis."
Rule: prose standard, section E, "Sentence length" (32 words, citation excluded)
Replacement: We hypothesise that in patients who develop HCC, the MRI signal of the background liver departs from that patient's own stable course at least 12 months before diagnosis. These 12 months are two 6-month surveillance intervals [2].

Place: paragraph 40
Passage: "The cohort holds 243 patients with outcome labels and 925 serial MRI studies, with a LI-RADS level per study (the standard radiological HCC likelihood score [3], recorded in three levels from 0, the least severe, through 1, intermediate, to 2, the most severe)."
Rule: prose standard, section E, "Sentence length" (42 words, citation excluded)
Replacement: The cohort holds 243 patients with outcome labels and 925 serial MRI studies. Each study has a LI-RADS level (the standard radiological HCC likelihood score [3], recorded in three levels from 0, the least severe, through 1, intermediate, to 2, the most severe).

Place: paragraph 41
Passage: "Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients, runs the readout on them and records the smallest change it detects, expressed in the same standard-deviation units as the detectable effect of C2."
Rule: prose standard, section E, "Sentence length" (52 words)
Replacement: Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients. The data steward then runs the readout on these series and records the smallest change it detects. That change is expressed in the same standard-deviation units as the detectable effect of C2.

Place: paragraph 42
Passage: "In the 8 patients it lies a median of 21 months before diagnosis (range 12.5 to 77.6 months), with a median of 2.5 earlier usable studies, and is at LI-RADS level 0 in 5 and level 1 in 3."
Rule: prose standard, section E, "Sentence length" (39 words)
Replacement: In the 8 patients, the tested study lies a median of 21 months before diagnosis (range 12.5 to 77.6 months). The 8 tested studies have a median of 2.5 earlier usable studies, and 5 are at LI-RADS level 0 and 3 at level 1.

=== 12. references/rules.md, "Formality" ===
This break changes no claim. The reader may take the random reassignment of diagnosis dates as part of the radiologist's re-read.

Place: paragraph 42
Passage: "A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible, and reassigning diagnosis dates at random between patients must remove the effect."
Rule: references/rules.md, "Formality" (two ideas: a blinded radiologist re-reads the tested study to exclude a visible tumour; random reassignment of diagnosis dates must remove the effect)
Replacement: A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible. Reassigning diagnosis dates at random between patients must remove the effect.

=== 13. Prose standard, section 0, "No repeated construction" ===
These breaks change no claim. Paragraph 42 repeats the success sentence of paragraph 35 word for word, so the reader reads a criterion that has already been given.

Place: paragraph 42
Passage: "Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."
Rule: prose standard, section 0, "No repeated construction"
Replacement: The primary analysis is positive when a one-sided test at alpha 0.05 shows that the divergence scores of the tested studies exceed those of the matched never-HCC studies.

Place: paragraph 43
Passage: "Success means the future tumour segment ranks above these random relabellings."
Rule: prose standard, section 0, "No repeated construction"
Replacement: C3 is supported if the future tumour segment ranks above these random relabellings.

=== 14. references/rules.md, "Tense per section" ===
These breaks change no claim. A finding of a 2008 study (reference 6) reads as a present state of the field.

Place: paragraph 34
Passage: "Molecular studies have shown that prognostic signal lies in the non-tumour tissue itself [6]."
Rule: references/rules.md, "Tense per section" (literature review, reporting findings: past)
Replacement: Molecular studies showed that prognostic signal lies in the non-tumour tissue itself [6].

Place: paragraph 48
Passage: "Molecular pathology places prognostic signal in the non-tumour tissue [6], and imaging follows discrete precursor nodules [4]."
Rule: references/rules.md, "Tense per section"
Replacement: Molecular pathology placed prognostic signal in the non-tumour tissue [6], and imaging follows discrete precursor nodules [4].

=== 15. Prose standard, section E, "Passive voice" ===
This break changes no claim. The reader meets the actor, the host institution, only at the end of the sentence.

Place: paragraph 31
Passage: "Computing is provided by the host institution at no cost, so none is requested."
Rule: prose standard, section E, "Passive voice" (the actor is named, so it is relevant)
Replacement: The host institution provides computing at no cost, so we request none.

=== 16. Prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences" ===
These breaks change no claim. The reader takes in up to 13 sentences on several ideas in one block, as in paragraph 42.

Place: paragraph 8
Passage: "Cancer is thought to arise from gradual change across the whole diseased liver. This project tests whether that change is measurable in the tumour-free liver on repeat MRI scans and departs from the same liver's earlier stable pattern before a tumour appears."
Rule: prose standard, section D (5 sentences on two ideas: how liver cancer arises and is found; what the project tests)
Replacement:
Cancer is thought to arise from gradual change across the whole diseased liver.

This project tests whether that change is measurable in the tumour-free liver on repeat magnetic resonance imaging (MRI) scans and departs from the same liver's earlier stable pattern before a tumour appears.

Place: paragraph 11
Passage: "Kanker ontstaat vermoedelijk uit een geleidelijke verandering in de hele zieke lever. Dit project test of die verandering meetbaar is in de tumorvrije lever op herhaalde MRI-scans en afwijkt van het eerdere stabiele beeld van dezelfde lever voordat een tumor verschijnt."
Rule: prose standard, section D (5 sentences on two ideas)
Replacement:
Kanker ontstaat vermoedelijk uit een geleidelijke verandering in de hele zieke lever.

Dit project test of die verandering meetbaar is in de tumorvrije lever op herhaalde MRI-scans en afwijkt van het eerdere stabiele beeld van dezelfde lever voordat een tumor verschijnt.

Place: paragraph 31
Passage: "The budget requests 0,42 FTE of the applicant's own postdoctoral salary across the full twelve months (UNL CAO table) to build the interpretable background-liver components, run the trajectory analysis, deliver the pre-registered primary endpoint and release the background-liver atlas. The effort is spread over the whole project because the work packages overlap."
Rule: prose standard, section D (8 sentences on personnel, requested costs and costs not requested)
Replacement:
We then release the background-liver atlas, which holds the component definitions, summary maps and code, with no patient-level data.

The effort is spread over the whole project because the work packages overlap.

Place: paragraph 31
Passage: "The applicant's standing appointment covers the remaining time. Computing is provided by the host institution at no cost, so none is requested."
Rule: prose standard, section D
Replacement:
Our standing appointment covers the remaining time.

The host institution provides computing at no cost, so we request none.

Place: paragraph 31
Passage: "Dissemination covers open-access publication charges and the costs of the openly released atlas. The longitudinal MRI cohort is already available under a data agreement, so no data-acquisition costs arise."
Rule: prose standard, section D
Replacement:
Dissemination covers open-access publication charges and the costs of the openly released atlas.

The longitudinal MRI cohort is already available under a data agreement, so no data-acquisition costs arise.

Place: paragraph 34
Passage: "In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3], frequently past the curative window. Field cancerisation, first described in oral epithelium [5], holds that a whole diseased organ can be predisposed to cancer, with the tumour arising from gradual, diffuse change in the surrounding tissue."
Rule: prose standard, section D (6 sentences on late detection, field cancerisation, the imaging gap and the cohort)
Replacement:
In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3], in [the share of cases, with its citation] past the curative window.

Field cancerisation holds that a whole diseased organ can be predisposed to cancer, with the tumour arising from gradual, diffuse change in the surrounding tissue.

Place: paragraph 34
Passage: "Molecular studies have shown that prognostic signal lies in the non-tumour tissue itself [6]. Imaging analysis mostly characterises the tumour [7], and how the background liver changes across serial scans before diagnosis is rarely studied."
Rule: prose standard, section D
Replacement:
Molecular studies showed that prognostic signal lies in the non-tumour tissue itself [6].

In [the share of published imaging analyses that characterise the tumour, with its source], imaging analysis characterises the tumour [7].

Place: paragraph 34
Passage: "Imaging analysis mostly characterises the tumour [7], and how the background liver changes across serial scans before diagnosis is rarely studied. The opportunity is a surveillance cohort of 243 patients and 925 serial MRI studies, in which 37 patients develop HCC, so we can ask what the background liver was doing beforehand."
Rule: prose standard, section D
Replacement:
How the background liver changes across serial MRI studies before diagnosis is studied in [the number of published analyses that do so, with their citations].

The opportunity is a surveillance cohort of 243 patients and 925 serial MRI studies, in which 37 patients develop HCC.

Place: paragraph 35
Passage: "We hypothesise that in patients who develop HCC, the MRI signal of the background liver departs from that patient's own stable course at least 12 months (two 6-month surveillance intervals [2]) before diagnosis. The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients)."
Rule: prose standard, section D (10 sentences on the hypothesis, the test, success, scope, risk and fit to the scheme)
Replacement:
These 12 months are two 6-month surveillance intervals [2].

The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study.

Place: paragraph 35
Passage: "The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients). Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."
Rule: prose standard, section D
Replacement:
Time since the first study and interval since the previous study fall within [the tolerances the matching rule sets].

Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis.

Place: paragraph 35
Passage: "A within-patient analysis adjusted for decompensation (the stage at which the scarred liver begins to fail and complications appear) gives supporting evidence. The claim is predictive: the change precedes the tumour."
Rule: prose standard, section D
Replacement:
A within-patient analysis adjusted for decompensation (the stage at which the scarred liver begins to fail and complications appear) gives supporting evidence.

The claim is predictive: the change precedes the tumour.

Place: paragraph 35
Passage: "Molecular confirmation lies outside this project. Whether such change exceeds the scan-to-scan variation of cirrhotic tissue is unknown, which makes the project high-risk."
Rule: prose standard, section D
Replacement:
Molecular confirmation lies outside this project.

Whether such change exceeds the study-to-study variation of cirrhotic tissue is unknown, which makes the project high-risk.

Place: paragraph 35
Passage: "If it does, surveillance can warn within the curative window. The project fits the XS scheme as a pre-registered measurement on a surveillance cohort the applicant already holds, with the readout's sensitivity fixed in advance by inserting changes of known size into real liver scans."
Rule: prose standard, section D
Replacement:
If the change exceeds this variation, surveillance could warn within the curative window.

The project fits the XS scheme as a pre-registered measurement on a surveillance cohort we already hold.

Place: paragraph 40
Passage: "The clinical record gives the date of HCC diagnosis and the liver segment and size of the tumour for all 37 patients who develop HCC. The studies hold several MRI scan types (sequences): diffusion scans at four strengths of sensitivity to water movement, a pair of T1 scans whose difference shows fat, a T2 scan and scans after contrast injection."
Rule: prose standard, section D (8 sentences on the cohort, the sequences, usable studies and the analysis sets)
Replacement:
The clinical record gives the date of HCC diagnosis and the liver segment ([definition of a liver segment, with the segment scheme the clinical record uses]) and size of the tumour for all 37 patients who develop HCC.

The studies hold these MRI scan types (sequences):
- diffusion scans at four strengths of sensitivity to water movement;
- a pair of T1 ([definition of T1 weighting]) scans whose difference shows fat;
- a T2 ([definition of T2 weighting]) scan;
- scans after contrast injection.

Place: paragraph 40
Passage: "The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans. Of the 925 studies, 776 are usable (all non-contrast sequences present), and an organ map that outlines the liver exists for every usable study."
Rule: prose standard, section D
Replacement:
The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans [citation for the contrast-free surveillance scans the author means].

Of the 925 studies, 776 are usable (all non-contrast sequences present), and an organ map that outlines the liver exists for every usable study.

Place: paragraph 40
Passage: "Of the 37 patients who develop HCC, 8 have a usable study at least 12 months before diagnosis together with at least one earlier usable study, and form the confirmatory set. The 148 never-HCC patients with two or more usable studies form the comparison pool."
Rule: prose standard, section D
Replacement:
The smallest detectable effect is the smallest effect the analysis detects with 80 percent power at one-sided alpha 0.05.

The 148 never-HCC patients with two or more usable studies form the comparison pool.

Place: paragraph 41
Passage: "We align each study to the patient's earlier studies so that the same point of the liver overlaps across scans [12], and exclude studies in which the alignment folds tissue onto itself or puts recognisable liver structures in the wrong place. The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients, and the liver segments used in C3 and WP1 are the segments marked on this reference."
Rule: prose standard, section D (8 sentences on alignment, components, their checks and the detection limit)
Replacement:
We exclude studies in which the alignment folds tissue onto itself or puts recognisable liver structures in the wrong place.

The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients.

Place: paragraph 41
Passage: "The analyst receives only studies taken before diagnosis (see C2). Within the liver outline from the organ map, the signal of every image point in every sequence at every scan date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1)."
Rule: prose standard, section D
Replacement:
The analyst receives only studies taken before diagnosis (see C2).

Within the liver outline from the organ map, the signal of every image point in every sequence at every study date forms one three-way table.

Place: paragraph 41
Passage: "Within the liver outline from the organ map, the signal of every image point in every sequence at every scan date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1). The number of components is the largest for which the components found separately in two random halves of the patients correlate at 0.8 or more."
Rule: prose standard, section D
Replacement:
Each component is a pattern with three parts:
- where in the liver it lies;
- how strongly it shows in each sequence;
- how it changes over time.

The number of components is the largest for which the components found separately in two random halves of the patients correlate at 0.8 or more.

Place: paragraph 41
Passage: "Components are checked against estimates of liver fat and of the signal loss caused by iron, both computed from the pair of T1 scans of the same study, and against decompensation status. Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients, runs the readout on them and records the smallest change it detects, expressed in the same standard-deviation units as the detectable effect of C2."
Rule: prose standard, section D
Replacement:
Components are checked against estimates of liver fat and of the signal loss caused by iron, both computed from the pair of T1 scans of the same study, and against decompensation status.

Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients.

Place: paragraph 42
Passage: "The divergence score of a study is the mean, over components, of its distance from the patient's earlier usable studies, in units of the ordinary scan-to-scan variation of stable livers, expressed as a standard deviation. The tested study is the latest usable study at least 12 months (two 6-month surveillance intervals [2]) before the clinical diagnosis date, with at least one earlier usable study."
Rule: prose standard, section D (13 sentences on the score, the tested study, the comparison, further analyses, safeguards and pre-registration)
Replacement:
The distance is expressed in standard deviations of the ordinary study-to-study variation of stable livers.

The tested study is the latest usable study at least 12 months (two 6-month surveillance intervals [2]) before the clinical diagnosis date, with at least one earlier usable study.

Place: paragraph 42
Passage: "Tested studies at level 2 are excluded (none of the 8 is), and a sensitivity analysis excludes those at level 1. In the primary analysis, the score of each tested study is compared with the scores of never-HCC studies at a matched position: same scan year, same number of earlier studies, similar time since the first study and similar interval since the previous study."
Rule: prose standard, section D
Replacement:
Tested studies at level 2 are excluded (none of the 8 is), and a sensitivity analysis excludes those at level 1.

In the primary analysis, the score of each tested study is compared with the scores of never-HCC studies at a matched position:
- the same study year;
- the same number of earlier studies;
- a time since the first study within [the tolerance the matching rule sets];
- an interval since the previous study within [the tolerance the matching rule sets].

Place: paragraph 42
Passage: "With 8 patients against 148 never-HCC patients, the smallest detectable effect is 0.91 standard deviations (80 percent power, one-sided alpha 0.05). A sensitivity analysis restricted to tested studies 12 to 36 months before diagnosis is reported (7 of the 8 patients, smallest detectable effect 0.97 standard deviations)."
Rule: prose standard, section D
Replacement:
With 8 patients against 148 never-HCC patients, the smallest detectable effect is 0.91 standard deviations (80 percent power, one-sided alpha 0.05).

A sensitivity analysis restricted to tested studies 12 to 36 months before diagnosis is reported (7 of the 8 patients, smallest detectable effect 0.97 standard deviations).

Place: paragraph 42
Passage: "A supporting model gives each patient their own baseline, adjusts for decompensation status at each scan (dated records exist for all 8) and compares each tested study with the patient's earlier usable studies. A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible, and reassigning diagnosis dates at random between patients must remove the effect."
Rule: prose standard, section D
Replacement:
The model compares each tested study with the patient's earlier usable studies.

A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible.

Place: paragraph 42
Passage: "The data steward keeps the outcome labels, gives the analyst only studies before diagnosis, cuts each never-HCC patient's series at a random point so that series length does not reveal outcome, and estimates this scan-to-scan variation as pre-registered. The analysis code, number of components and matching rule are time-stamped on the Open Science Framework before the analyst receives the labels."
Rule: prose standard, section D
Replacement:
The data steward:
- keeps the outcome labels;
- gives the analyst only studies before diagnosis;
- cuts each never-HCC patient's series at a random point so that series length does not reveal outcome;
- estimates this study-to-study variation as pre-registered.

The analysis code, number of components and matching rule are time-stamped on the Open Science Framework before the analyst receives the labels.

Place: paragraph 48
Passage: "Molecular pathology places prognostic signal in the non-tumour tissue [6], and imaging follows discrete precursor nodules [4]. What is new here is the within-patient, point-by-point trajectory of the background liver across serial MRI before diagnosis, read through interpretable components."
Rule: prose standard, section D (with the splits of other findings, 6 sentences on prior work and on what is new)
Replacement:
Molecular pathology placed prognostic signal in the non-tumour tissue [6], and imaging follows discrete precursor nodules [4].

What is new here is the within-patient, point-by-point trajectory of the background liver across serial MRI before diagnosis, read through interpretable components.

=== 17. Prose standard, section B, ASCII ===
This break changes no claim. It costs a character that a terminal, a diff or a grep of the text may not show or match. Found by: python3 docx_paragraphs.py ... | LC_ALL=C grep -n '[^ -~]', whose one hit is "67:64: Application Form <en dash> NWO Open Competition Domain Science <en dash> XS 2026".

Place: paragraph 64 [word/header1.xml]
Passage: "Application Form <en dash> NWO Open Competition Domain Science <en dash> XS 2026"
Rule: prose standard, section B (ASCII throughout) and section 0 (en dash as an aside)
Replacement: Application Form, NWO Open Competition Domain Science, XS 2026

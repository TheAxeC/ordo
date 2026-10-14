Review of /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx

Read in full: the prose standard (/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md), the rules page (/Users/axelfaes/.claude-backup/skills/writing/references/rules.md), the registers page (/Users/axelfaes/.claude-backup/skills/writing/references/registers.md), and the draft as printed by the docx_paragraphs.py command (paragraphs 1 to 69). The ASCII check (the given command piped to `LC_ALL=C grep -n '[^ -~]'`) printed one line: paragraph 64 [word/header1.xml]. The draft is a medical imaging proposal (MRI, HCC surveillance), so the register is Medicine and Health.

A sentence is counted here as over the prose standard's rule on sentence length (section E) at 24 words or more. Every sentence written in a replacement has 23 words or fewer.

======================================================================
1. references/rules.md, "Hedging"
A reader takes the result of an 8-patient confirmatory set as showing that surveillance can warn within the curative window (paragraph 35).

1a. paragraph 35
Passage: "If it does, surveillance can warn within the curative window."
Rule: references/rules.md, "Hedging". "can warn" states a generalization from a limited sample (8 patients in the confirmatory set, paragraph 40) without a hedge.
Replacement: "If it does, surveillance could warn within the curative window."

1b. paragraph 48
Passage: "If the hypothesis holds, surveillance can warn within the curative window, and the method transfers to other field-cancerisation settings [5] (Barrett's oesophagus, oral premalignancy, bronchial field change)."
Rule: references/rules.md, "Hedging". "can warn" is the claim of 1a and gets the same device. "transfers" is an untested generalization stated without a hedge.
Replacement: "If the hypothesis holds, surveillance could warn within the curative window. If the hypothesis holds, the method could also transfer to other field-cancerisation settings [5] (Barrett's oesophagus, oral premalignancy, bronchial field change)."
Also breaks: the prose standard, section E, "Sentence length" (27 words).
Also breaks: references/rules.md, "Formality" (two ideas: the warning in surveillance, and the transfer to other settings).

======================================================================
2. The prose standard, section A (vague qualifiers)
At paragraph 34, a reader cannot tell what share of HCC arises in cirrhosis or is found too late to cure, so the size of the problem the proposal answers is not stated.

2a. paragraph 8
Passage: "Liver cancer usually grows in a scarred, cirrhotic liver, and scans find it only once a tumour is visible, often too late to cure."
Rule: the prose standard, section A ("usually" and "often" are vague qualifiers; the draft does not hold either claim in every case).
Replacement: "Liver cancer grows in a scarred, cirrhotic liver in [the share of liver cancers that arise in cirrhosis]. Scans find it only once a tumour is visible. In [the share of patients whose tumour is found too late to cure], scans find the tumour too late to cure."
Also breaks: the prose standard, section E, "Sentence length" (24 words).
Also breaks: references/rules.md, "Formality" (two ideas: where liver cancer grows, and when scans find it).

2b. paragraph 11
Passage: "Leverkanker ontstaat meestal in een verlittekende, cirrotische lever, en scans vinden een tumor pas als die zichtbaar is, vaak te laat om te genezen."
Rule: the prose standard, section A ("meestal" and "vaak" are words of frequency).
Replacement: "Leverkanker ontstaat in [het aandeel leverkankers dat in cirrose ontstaat] in een verlittekende, cirrotische lever. Scans vinden een tumor pas als die zichtbaar is. Bij [het aandeel patienten bij wie de tumor te laat wordt gevonden] vinden scans de tumor te laat om te genezen."
Also breaks: the prose standard, section E, "Sentence length" (24 words).
Also breaks: references/rules.md, "Formality" (two ideas).

2c. paragraph 34
Passage: "Problem and opportunity. Hepatocellular carcinoma (HCC) mostly arises in a cirrhotic liver [1], and imaging surveillance is meant to catch it while cure is still possible [2]."
Rule: the prose standard, section A ("mostly").
Replacement: "Problem and opportunity. Hepatocellular carcinoma (HCC) arises in a cirrhotic liver in [the share of HCC cases that arise in cirrhosis] [1]. Imaging surveillance aims to detect HCC while cure is still possible [2]."
Also breaks: references/rules.md, "Formality" (two ideas: where HCC arises, and what surveillance is for; "catch" is colloquial, replaced by "detect").
Also breaks: the prose standard, section E, "Passive voice" ("is meant", with the actor relevant).

2d. paragraph 34
Passage: "In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3], frequently past the curative window."
Rule: the prose standard, section A ("frequently").
Replacement: "In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3]. In [the share of patients, with its citation], that detection comes past the curative window."

2e. paragraph 34
Passage: "Imaging analysis mostly characterises the tumour [7], and how the background liver changes across serial scans before diagnosis is rarely studied."
Rule: the prose standard, section A ("mostly", "rarely").
Replacement: "[The share of published imaging analyses] characterise the tumour [7]. [The count of published analyses] follow how the background liver changes across serial scans before diagnosis."
Also breaks: references/rules.md, "Formality" (two ideas: what imaging analysis covers, and what it leaves out).
Also breaks: the prose standard, section E, "Passive voice" ("is rarely studied").

2f. paragraph 40
Passage: "The studies hold several MRI scan types (sequences): diffusion scans at four strengths of sensitivity to water movement, a pair of T1 scans whose difference shows fat, a T2 scan and scans after contrast injection."
Rule: the prose standard, section A ("several"; the sentence itself lists the scan types, so the list is the specific claim).
Replacement:
"The studies hold these MRI scan types (sequences):
- diffusion scans at four strengths of sensitivity to water movement;
- a pair of T1 scans ([a definition of a T1 scan at this first use]) whose difference shows fat;
- a T2 scan ([a definition of a T2 scan at this first use]);
- scans after contrast injection."
Also breaks: the prose standard, section D (four list-shaped items in paragraph form).
Also breaks: the prose standard, section E, "Sentence length" (35 words).
Also breaks: references/rules.md, "Terms defined at first use" ("T1" and "T2" are never defined).

2g. paragraph 41
Passage: "Within the liver outline from the organ map, the signal of every image point in every sequence at every scan date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1)."
Rule: the prose standard, section A ("a few"; the draft sets the number by the rule in the next sentence).
Replacement:
"One three-way table holds the signal of every image point in every sequence at every scan date. The table holds only image points within the liver outline from the organ map. We summarise the table as interpretable components [9-11], as many as the reproducibility rule below allows. Each component is a pattern with three parts (Figure 1):
- where in the liver it lies;
- how strongly it shows in each sequence;
- how it changes over time."
Also breaks: the prose standard, section E, "Sentence length" (58 words).
Also breaks: the prose standard, section D (three list-shaped items in paragraph form).
Also breaks: the registers page, "Voice" ("summarised" hides the authors' decision; replaced by "We summarise").

2h. paragraph 42
Passage: "In the primary analysis, the score of each tested study is compared with the scores of never-HCC studies at a matched position: same scan year, same number of earlier studies, similar time since the first study and similar interval since the previous study."
Rule: the prose standard, section A ("similar", twice; the draft gives no tolerance).
Replacement:
"In the primary analysis, we compare the score of each tested study with the scores of never-HCC studies at a matched position. A matched position has:
- the same scan year;
- the same number of earlier studies;
- a time since the first study within [the matching tolerance, in months];
- an interval since the previous study within [the matching tolerance, in months]."
Also breaks: the prose standard, section E, "Sentence length" (42 words).
Also breaks: the prose standard, section D (four list-shaped items in paragraph form).
Also breaks: the registers page, "Voice" ("is compared" hides the authors' decision).

2i. paragraph 45
Passage: "Each patient's serial MRI before diagnosis is reduced to a few interpretable components of the background liver."
Rule: the prose standard, section A ("a few").
Replacement: "Each patient's serial MRI before diagnosis is reduced to interpretable components of the background liver. The reproducibility rule of C1 sets the number of components."

======================================================================
3. references/rules.md, "Terms defined at first use"
At paragraph 35, a reader meets "usable study" and "divergence score" in the definition of the endpoint and cannot follow it, since the draft defines them only at paragraphs 40 and 42.

3a. paragraph 35
Passage: "The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients)."
Rule: references/rules.md, "Terms defined at first use" (first use of "usable study" and of "divergence score").
Replacement: "The tested study is the latest usable study ([a definition of a usable study at this first use, as the Approach paragraph gives it]) at least 12 months before the clinical diagnosis date. The tested study also has at least one earlier usable study. We compare its divergence score ([a definition of the divergence score at this first use, as C2 gives it]) with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients)."
Also breaks: the prose standard, section E, "Sentence length" (47 words).
Also breaks: references/rules.md, "Formality" (two ideas: which study is tested, and what it is compared with).
Also breaks: the registers page, "Voice" ("is compared").

3b. paragraph 8
Passage: "This project tests whether that change is measurable in the tumour-free liver on repeat MRI scans and departs from the same liver's earlier stable pattern before a tumour appears."
Rule: references/rules.md, "Terms defined at first use" ("MRI" is never expanded).
Replacement: "This project tests whether that change is measurable in the tumour-free liver on repeat magnetic resonance imaging (MRI) scans. The project also tests whether the change departs from the same liver's earlier stable pattern before a tumour appears."
Also breaks: the prose standard, section E, "Sentence length" (29 words).
Also breaks: references/rules.md, "Formality" (two ideas: the change is measurable, and it departs before a tumour appears).

3c. paragraph 19
Passage: "Postdoc (applicant), 0,42 FTE, 12 months, UNL CAO table"
Rule: references/rules.md, "Terms defined at first use" ("FTE", "UNL" and "CAO" are never expanded).
Replacement: "Postdoc (applicant), 0,42 full-time equivalent (FTE), 12 months, salary table of the Universities of the Netherlands (UNL) collective labour agreement (CAO)"

3d. paragraph 31
Passage: "The budget requests 0,42 FTE of the applicant's own postdoctoral salary across the full twelve months (UNL CAO table) to build the interpretable background-liver components, run the trajectory analysis, deliver the pre-registered primary endpoint and release the background-liver atlas."
Rule: references/rules.md, "Terms defined at first use" (first use of "background liver", of "components" and of "atlas"; the atlas is defined only at paragraph 46, components at paragraph 41, and the background liver nowhere).
Replacement:
"The budget requests 0,42 FTE of our own postdoctoral salary across the full twelve months (UNL CAO table). This salary pays for these tasks:
- building the interpretable background-liver components ([a definition of a component at this first use, as C1 gives it]), where the background liver is the liver tissue outside any tumour;
- running the trajectory analysis;
- delivering the pre-registered primary endpoint;
- releasing the background-liver atlas (component definitions, summary maps and code, with no patient-level data)."
Also breaks: the registers page, "Voice" ("the applicant's" refers to the author in the third person).
Also breaks: the prose standard, section E, "Sentence length" (39 words).
Also breaks: the prose standard, section D (four list-shaped items in paragraph form).

3e. paragraph 35
Passage: "Whether it reflects a diffuse malignant field or a focal precursor is the exploratory question of C3."
Rule: references/rules.md, "Terms defined at first use" ("C3" is used before paragraph 39 defines it).
Replacement: "Whether the change reflects a diffuse malignant field or a focal precursor is the exploratory question of C3, the location objective."
Also breaks: references/rules.md, "Clear antecedents" ("it" follows "The claim is predictive: the change precedes the tumour.", so it can stand for the claim or the change).

3f. paragraph 35
Passage: "The project fits the XS scheme as a pre-registered measurement on a surveillance cohort the applicant already holds, with the readout's sensitivity fixed in advance by inserting changes of known size into real liver scans."
Rule: references/rules.md, "Terms defined at first use" ("the readout" is never defined).
Replacement: "The project fits the XS scheme as a pre-registered measurement on a surveillance cohort we already hold. The readout's sensitivity ([a definition of the readout at this first use]) is fixed in advance by inserting changes of known size into real liver scans."
Also breaks: the registers page, "Voice" ("the applicant").
Also breaks: the prose standard, section E, "Sentence length" (35 words).
Also breaks: references/rules.md, "Formality" (two ideas: the fit with the scheme, and how the sensitivity is fixed).

3g. paragraph 41
Passage: "The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients, and the liver segments used in C3 and WP1 are the segments marked on this reference."
Rule: references/rules.md, "Terms defined at first use" ("WP1" is never expanded; paragraph 46 uses it again without expansion).
Replacement: "We then align the livers of all patients to one common reference liver [12]. This common reference lets the same components be compared across patients. The liver segments used in C3 and work package 1 (WP1) are the segments marked on this reference."
Also breaks: the registers page, "Voice" ("are then aligned").
Also breaks: the prose standard, section E, "Sentence length" (40 words).
Also breaks: references/rules.md, "Formality" (two ideas: the common alignment, and where the segments come from).

3h. paragraph 46
Passage: "Overlapping work packages: WP1 (mo 1-4) aligns the scans and builds the components (if point-by-point alignment fails the alignment check, averages per liver segment are used instead), obtains the detection limit from inserted changes of known size, deposits the pre-registration and writes the data-management plan; WP2 (mo 3-8, primary) prepares and, after the deposit, runs the confirmatory test; WP3 (mo 7-11) runs the exploratory location test; WP4 (mo 8-12) releases the atlas (component definitions, summary maps and code, with no patient-level data)."
Rule: references/rules.md, "Terms defined at first use" ("mo" is never expanded).
Replacement:
"The work packages overlap:
- WP1 (months 1-4) has these tasks:
  - aligning the scans and building the components;
  - obtaining the detection limit from inserted changes of known size;
  - depositing the pre-registration;
  - writing the data-management plan.
  If point-by-point alignment fails the alignment check, we use averages per liver segment instead.
- WP2 (months 3-8, primary) prepares the confirmatory test and runs it after the deposit.
- WP3 (months 7-11) runs the exploratory location test.
- WP4 (months 8-12) releases the atlas (component definitions, summary maps and code, with no patient-level data)."
Also breaks: the prose standard, section D (four list-shaped items in paragraph form, and four tasks inside WP1).
Also breaks: the prose standard, section E, "Sentence length" (the WP1 clause alone runs to 50 words).
Also breaks: the registers page, "Voice" ("are used instead" hides the authors' decision).

======================================================================
4. The prose standard, section D, "No synonym cycling"
At paragraph 41, a reader can take "the liver test" for a clinical liver test. Paragraph 46 calls the same thing "the confirmatory test".

4a. paragraph 41
Passage: "Success means reproducible components that track the fat and iron estimates, and a detection limit fixed before the liver test."
Rule: the prose standard, section D, "No synonym cycling" ("the liver test" names the confirmatory test).
Replacement: "C1 needs reproducible components that track the fat and iron estimates. It also needs a detection limit fixed before the confirmatory test."
Also breaks: the prose standard, section 0, "No repeated construction" ("Success means ..." closes paragraphs 35, 41, 42 and 43).

======================================================================
5. references/rules.md, "Evidence for claims"
At paragraph 40, a reader cannot check that contrast-free surveillance scans exist, which is the clinical reason the draft gives for its choice of sequences.

5a. paragraph 40
Passage: "The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans."
Rule: references/rules.md, "Evidence for claims" (no citation and no data in the draft for contrast-free surveillance scans).
Replacement: "The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans [a citation for contrast-free surveillance MRI]."

======================================================================
6. references/rules.md, "Clear antecedents"
At paragraph 47, a reader cannot tell which of four mitigations "it" says may remove the most diseased livers.

6a. paragraph 47
Passage: "Risks and mitigation. (i) Signal too small above cirrhotic variation: each patient is their own baseline, and the detectable effect and the readout's detection limit, in the same standard-deviation units, are fixed before unblinding. (ii) Severity: decompensation status at each scan enters the supporting within-patient model. (iii) Scanner drift, with scanner and protocol not recorded: rescaling each scan's signal to a common range, a scan-year covariate and same-year matching. (iv) Missed tumour, alignment error or selection by the alignment check: the blinded radiologist re-read, the LI-RADS exclusions, the alignment check, with the excluded studies described to show whether it removes the most diseased livers, and the random reassignment of diagnosis dates."
Rule: references/rules.md, "Clear antecedents" ("it" in item (iv)).
Replacement:
"Risks and mitigation. The project carries four risks, each with its mitigation:
- Signal too small above cirrhotic variation: each patient is their own baseline. The detectable effect and the readout's detection limit, in the same standard-deviation units, are fixed before unblinding.
- Severity: decompensation status at each scan enters the supporting within-patient model.
- Scanner drift, with scanner and protocol not recorded: rescaling each scan's signal to a common range, a scan-year covariate and same-year matching.
- Missed tumour, alignment error or selection by the alignment check: the blinded radiologist re-read, the LI-RADS exclusions, the alignment check and the random reassignment of diagnosis dates. We describe the excluded studies to show whether the alignment check removes the most diseased livers."
Also breaks: the prose standard, section D (four list-shaped items in paragraph form).
Also breaks: the registers page, "Voice" ("with the excluded studies described" hides the authors' action).

======================================================================
7. The registers page, "Voice"
At paragraph 46, a reader meets "the applicant" where paragraphs 35, 41 and 43 say "we", and can take them for two parties.

7a. paragraph 46
Passage: "The applicant works at 0,42 FTE across all twelve months on a cohort that is already available, using open-source image-alignment software [12] and established methods for such component summaries [9]."
Rule: the registers page, "Voice" (the author in the third person).
Replacement: "We work at 0,42 FTE across all twelve months on a cohort that is already available. We use open-source image-alignment software [12] and established methods for such component summaries [9]."
Also breaks: the prose standard, section E, "Sentence length" (30 words).

7b. paragraph 31
Passage: "The applicant's standing appointment covers the remaining time."
Rule: the registers page, "Voice" (the author in the third person).
Replacement: "Our standing appointment covers the remaining time."

7c. paragraph 31
Passage: "Computing is provided by the host institution at no cost, so none is requested."
Rule: the registers page, "Voice", and the prose standard, section E, "Passive voice" (the actor is named and relevant).
Replacement: "The host institution provides computing at no cost, so none is requested."

7d. paragraph 41
Passage: "Components are checked against estimates of liver fat and of the signal loss caused by iron, both computed from the pair of T1 scans of the same study, and against decompensation status."
Rule: the registers page, "Voice" (the authors' check in the passive).
Replacement: "We check the components against estimates of liver fat and of the signal loss caused by iron, and against decompensation status. Both estimates are computed from the pair of T1 scans of the same study."
Also breaks: the prose standard, section E, "Sentence length" (31 words).

7e. paragraph 41
Passage: "Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients, runs the readout on them and records the smallest change it detects, expressed in the same standard-deviation units as the detectable effect of C2."
Rule: the registers page, "Voice" ("is deposited" hides the authors' action).
Replacement: "Before we deposit the pre-registration, a data steward inserts changes of known, graded size into never-HCC patients' stable study series. The changes are diffuse and focal and go into all sequences. Before the deposit, the data steward runs the readout on these series and records the smallest change it detects. The smallest detected change is expressed in the same standard-deviation units as the detectable effect of C2."
Also breaks: the prose standard, section E, "Sentence length" (52 words).

7f. paragraph 42
Passage: "Tested studies at level 2 are excluded (none of the 8 is), and a sensitivity analysis excludes those at level 1."
Rule: the registers page, "Voice" ("are excluded").
Replacement: "We exclude tested studies at level 2 (none of the 8 is). A sensitivity analysis excludes those at level 1."
Also breaks: references/rules.md, "Formality" (two ideas: the exclusion in the primary analysis, and the sensitivity analysis).

7g. paragraph 42
Passage: "A sensitivity analysis restricted to tested studies 12 to 36 months before diagnosis is reported (7 of the 8 patients, smallest detectable effect 0.97 standard deviations)."
Rule: the registers page, "Voice" ("is reported").
Replacement: "We report a sensitivity analysis restricted to tested studies 12 to 36 months before diagnosis. It covers 7 of the 8 patients, with a smallest detectable effect of 0.97 standard deviations."
Also breaks: the prose standard, section E, "Sentence length" (26 words).

7h. paragraph 42
Passage: "The primary test is repeated in the 5 patients with no recorded decompensation by their tested study."
Rule: the registers page, "Voice" ("is repeated").
Replacement: "We repeat the primary test in the 5 patients with no recorded decompensation by their tested study."

7i. paragraph 42
Passage: "The analysis code, number of components and matching rule are time-stamped on the Open Science Framework before the analyst receives the labels."
Rule: the registers page, "Voice" ("are time-stamped").
Replacement: "We time-stamp the analysis code, number of components and matching rule on the Open Science Framework before the analyst receives the labels."

7j. paragraph 49
Passage: "The atlas (component definitions, summary maps and code) contains no patient-level data and will be released openly."
Rule: the registers page, "Voice" ("will be released").
Replacement: "The atlas (component definitions, summary maps and code) contains no patient-level data. We will release the atlas openly."
Also breaks: references/rules.md, "Formality" (two ideas: what the atlas contains, and its release).

======================================================================
8. The prose standard, section 0, "No repeated construction"
These breaks change no claim. At paragraph 42, the reader meets the success sentence of paragraph 35 a second time, word for word, in the "Success means" template that the C1 and C3 paragraphs also use.

8a. paragraph 35
Passage: "Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."
Rule: the prose standard, section 0, "No repeated construction".
Replacement: "The project succeeds if the tested studies' divergence scores exceed those of the matched never-HCC studies in the primary analysis. The test is one-sided at alpha 0.05."
Also breaks: the prose standard, section E, "Sentence length" (28 words).

8b. paragraph 42
Passage: "Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."
Rule: the prose standard, section 0, "No repeated construction".
Replacement: "The primary analysis must show higher divergence scores in the tested studies than in the matched never-HCC studies. It uses a one-sided test at alpha 0.05."
Also breaks: the prose standard, section E, "Sentence length" (28 words).

8c. paragraph 43
Passage: "Success means the future tumour segment ranks above these random relabellings."
Rule: the prose standard, section 0, "No repeated construction".
Replacement: "A positive C3 result is a future tumour segment that ranks above these random relabellings."

======================================================================
9. The prose standard, section E, "Sentence length"
These breaks change no claim. At paragraph 40, the reader has to hold a 43-word sentence to learn what the three LI-RADS levels mean.

9a. paragraph 40
Passage: "Approach. The cohort holds 243 patients with outcome labels and 925 serial MRI studies, with a LI-RADS level per study (the standard radiological HCC likelihood score [3], recorded in three levels from 0, the least severe, through 1, intermediate, to 2, the most severe)."
Rule: the prose standard, section E, "Sentence length" (43 words).
Replacement: "Approach. The cohort holds 243 patients with outcome labels and 925 serial MRI studies. Each study has a LI-RADS level, the standard radiological HCC likelihood score [3]. The score is recorded in three levels, from 0 (the least severe) through 1 (intermediate) to 2 (the most severe)."

9b. paragraph 40
Passage: "The clinical record gives the date of HCC diagnosis and the liver segment and size of the tumour for all 37 patients who develop HCC."
Rule: the prose standard, section E, "Sentence length" (25 words).
Replacement: "For all 37 patients who develop HCC, the clinical record gives the date of HCC diagnosis. The record also gives the liver segment and size of each tumour."

9c. paragraph 40
Passage: "Of the 925 studies, 776 are usable (all non-contrast sequences present), and an organ map that outlines the liver exists for every usable study."
Rule: the prose standard, section E, "Sentence length" (24 words).
Replacement: "Of the 925 studies, 776 are usable (all non-contrast sequences present). An organ map that outlines the liver exists for every usable study."
Also breaks: references/rules.md, "Formality" (two ideas: how many studies are usable, and the organ map).

9d. paragraph 40
Passage: "Of the 37 patients who develop HCC, 8 have a usable study at least 12 months before diagnosis together with at least one earlier usable study, and form the confirmatory set."
Rule: the prose standard, section E, "Sentence length" (31 words).
Replacement: "Of the 37 patients who develop HCC, 8 meet both conditions for a tested study. These 8 patients form the confirmatory set."

9e. paragraph 41
Passage: "C1. We align each study to the patient's earlier studies so that the same point of the liver overlaps across scans [12], and exclude studies in which the alignment folds tissue onto itself or puts recognisable liver structures in the wrong place."
Rule: the prose standard, section E, "Sentence length" (41 words).
Replacement: "C1. We align each study to the patient's earlier studies so that the same point of the liver overlaps across scans [12]. We exclude studies in which the alignment folds tissue onto itself or puts recognisable liver structures in the wrong place."
Also breaks: references/rules.md, "Formality" (two ideas: the alignment, and the exclusion).

9f. paragraph 41
Passage: "The number of components is the largest for which the components found separately in two random halves of the patients correlate at 0.8 or more."
Rule: the prose standard, section E, "Sentence length" (25 words).
Replacement: "We split the patients into two random halves and find the components in each half separately. The number of components is the largest for which the two halves' components correlate at 0.8 or more."

9g. paragraph 42
Passage: "C2 (confirmatory: when). The divergence score of a study is the mean, over components, of its distance from the patient's earlier usable studies, in units of the ordinary scan-to-scan variation of stable livers, expressed as a standard deviation."
Rule: the prose standard, section E, "Sentence length" (35 words).
Replacement: "C2 (confirmatory: when). The divergence score of a study is the mean, over components, of its distance from the patient's earlier usable studies. The distance is in units of the ordinary scan-to-scan variation of stable livers, expressed as a standard deviation."

9h. paragraph 42
Passage: "The tested study is the latest usable study at least 12 months (two 6-month surveillance intervals [2]) before the clinical diagnosis date, with at least one earlier usable study."
Rule: the prose standard, section E, "Sentence length" (29 words).
Replacement: "The tested study is the latest usable study at least 12 months (two 6-month surveillance intervals [2]) before the clinical diagnosis date. The tested study also has at least one earlier usable study."

9i. paragraph 42
Passage: "In the 8 patients it lies a median of 21 months before diagnosis (range 12.5 to 77.6 months), with a median of 2.5 earlier usable studies, and is at LI-RADS level 0 in 5 and level 1 in 3."
Rule: the prose standard, section E, "Sentence length" (39 words).
Replacement: "In the 8 patients, the tested study lies a median of 21 months before diagnosis (range 12.5 to 77.6 months). The tested study has a median of 2.5 earlier usable studies. It is at LI-RADS level 0 in 5 patients and level 1 in 3."

9j. paragraph 42
Passage: "A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible, and reassigning diagnosis dates at random between patients must remove the effect."
Rule: the prose standard, section E, "Sentence length" (27 words).
Replacement: "A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible. Reassigning diagnosis dates at random between patients must remove the effect."
Also breaks: references/rules.md, "Formality" (two ideas: the blinded re-read, and the date reassignment).

9k. paragraph 43
Passage: "We test whether the change is larger in that segment than when the tumour label is moved at random among the same patient's segments, with a correction for multiple testing."
Rule: the prose standard, section E, "Sentence length" (30 words).
Replacement: "We test whether the change is larger in that segment than when the tumour label is moved at random among the same patient's segments. The test corrects for multiple testing."

9l. paragraph 34
Passage: "Field cancerisation, first described in oral epithelium [5], holds that a whole diseased organ can be predisposed to cancer, with the tumour arising from gradual, diffuse change in the surrounding tissue."
Rule: the prose standard, section E, "Sentence length" (31 words).
Replacement: "Field cancerisation, first described in oral epithelium [5], holds that a whole diseased organ can be predisposed to cancer. In this view, the tumour arises from gradual, diffuse change in the surrounding tissue."

9m. paragraph 34
Passage: "The opportunity is a surveillance cohort of 243 patients and 925 serial MRI studies, in which 37 patients develop HCC, so we can ask what the background liver was doing beforehand."
Rule: the prose standard, section E, "Sentence length" (29 words).
Replacement: "The opportunity is a surveillance cohort of 243 patients and 925 serial MRI studies, in which 37 patients develop HCC. The cohort lets us study the course of the background liver beforehand."
Also breaks: references/rules.md, "Formality" ("what the background liver was doing" is colloquial).

9n. paragraph 35
Passage: "We hypothesise that in patients who develop HCC, the MRI signal of the background liver departs from that patient's own stable course at least 12 months (two 6-month surveillance intervals [2]) before diagnosis."
Rule: the prose standard, section E, "Sentence length" (33 words).
Replacement: "In patients who develop HCC, we hypothesise that the MRI signal of the background liver departs from that patient's own stable course. We hypothesise that this departure is present at least 12 months (two 6-month surveillance intervals [2]) before diagnosis."

9o. paragraph 48
Passage: "Imaging of the background liver already estimates HCC risk: elastography measures liver stiffness [13], and computer-extracted image features of the whole liver on a baseline MRI predict HCC development in cirrhosis [8]."
Rule: the prose standard, section E, "Sentence length" (32 words).
Replacement: "Imaging of the background liver already estimates HCC risk. Elastography measures liver stiffness [13]. Computer-extracted image features of the whole liver on a baseline MRI predict HCC development in cirrhosis [8]."

9p. paragraph 11
Passage: "Dit project test of die verandering meetbaar is in de tumorvrije lever op herhaalde MRI-scans en afwijkt van het eerdere stabiele beeld van dezelfde lever voordat een tumor verschijnt."
Rule: the prose standard, section E, "Sentence length" (29 words).
Replacement: "Dit project test of die verandering meetbaar is in de tumorvrije lever op herhaalde MRI-scans. Het project test ook of de verandering afwijkt van het eerdere stabiele beeld van dezelfde lever voordat een tumor verschijnt."
Also breaks: references/rules.md, "Formality" (two ideas, as in 3b).

======================================================================
10. references/rules.md, "Formality"
This break changes no claim. At paragraph 48, the reader gets two separate pieces of prior work, one from molecular pathology and one from imaging, in one sentence.

10a. paragraph 48
Passage: "Molecular pathology places prognostic signal in the non-tumour tissue [6], and imaging follows discrete precursor nodules [4]."
Rule: references/rules.md, "Formality" (two ideas: the molecular finding, and the imaging of precursor nodules).
Replacement: "Molecular pathology places prognostic signal in the non-tumour tissue [6]. Imaging follows discrete precursor nodules [4]."

======================================================================
11. The prose standard, section D (lists in paragraph form)
These breaks change no claim. At paragraph 42, the reader cannot see the data steward's four tasks one at a time.

11a. paragraph 42
Passage: "The data steward keeps the outcome labels, gives the analyst only studies before diagnosis, cuts each never-HCC patient's series at a random point so that series length does not reveal outcome, and estimates this scan-to-scan variation as pre-registered."
Rule: the prose standard, section D (four list-shaped items in paragraph form).
Replacement:
"The data steward has these tasks:
- keeping the outcome labels;
- giving the analyst only studies before diagnosis;
- cutting each never-HCC patient's series at a random point so that series length does not reveal outcome;
- estimating this scan-to-scan variation as pre-registered."
Also breaks: the prose standard, section E, "Sentence length" (38 words).

11b. paragraph 42
Passage: "A supporting model gives each patient their own baseline, adjusts for decompensation status at each scan (dated records exist for all 8) and compares each tested study with the patient's earlier usable studies."
Rule: the prose standard, section D (three list-shaped items in paragraph form).
Replacement:
"A supporting model takes these steps:
- it gives each patient their own baseline;
- it adjusts for decompensation status at each scan (dated records exist for all 8);
- it compares each tested study with the patient's earlier usable studies."
Also breaks: the prose standard, section E, "Sentence length" (32 words).

======================================================================
12. The prose standard, section D, "Paragraphs cover one idea and stay under roughly four sentences"
These breaks change no claim. At paragraph 42, the reader meets 13 sentences in one block and cannot see where the definition of the endpoint ends and the safeguards begin.

Each entry quotes the last sentence before the break and the first sentence after it, as the draft has them. The replacement writes both out as they read after every other finding, with an empty line between them.

12a. paragraph 8 (5 sentences, 8 after the other findings; two ideas: the problem and the project)
Passage: "Cancer is thought to arise from gradual change across the whole diseased liver. This project tests whether that change is measurable in the tumour-free liver on repeat MRI scans and departs from the same liver's earlier stable pattern before a tumour appears."
Replacement:
"Cancer is thought to arise from gradual change across the whole diseased liver.

This project tests whether that change is measurable in the tumour-free liver on repeat magnetic resonance imaging (MRI) scans. The project also tests whether the change departs from the same liver's earlier stable pattern before a tumour appears."

12b. paragraph 11 (5 sentences, 8 after the other findings)
Passage: "Kanker ontstaat vermoedelijk uit een geleidelijke verandering in de hele zieke lever. Dit project test of die verandering meetbaar is in de tumorvrije lever op herhaalde MRI-scans en afwijkt van het eerdere stabiele beeld van dezelfde lever voordat een tumor verschijnt."
Replacement:
"Kanker ontstaat vermoedelijk uit een geleidelijke verandering in de hele zieke lever.

Dit project test of die verandering meetbaar is in de tumorvrije lever op herhaalde MRI-scans. Het project test ook of de verandering afwijkt van het eerdere stabiele beeld van dezelfde lever voordat een tumor verschijnt."

12c. paragraph 31 (8 sentences; personnel, other costs requested, costs not arising)
Break 1. Passage: "The applicant's standing appointment covers the remaining time. Computing is provided by the host institution at no cost, so none is requested."
Replacement:
"Our standing appointment covers the remaining time.

The host institution provides computing at no cost, so none is requested."
Break 2. Passage: "Dissemination covers open-access publication charges and the costs of the openly released atlas. The longitudinal MRI cohort is already available under a data agreement, so no data-acquisition costs arise."
Replacement:
"Dissemination covers open-access publication charges and the costs of the openly released atlas.

The longitudinal MRI cohort is already available under a data agreement, so no data-acquisition costs arise."

12d. paragraph 34 (6 sentences, 10 after the other findings; surveillance, field cancerisation, the imaging gap, the cohort)
Break 1. Passage: "In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3], frequently past the curative window. Field cancerisation, first described in oral epithelium [5], holds that a whole diseased organ can be predisposed to cancer, with the tumour arising from gradual, diffuse change in the surrounding tissue."
Replacement:
"In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3]. In [the share of patients, with its citation], that detection comes past the curative window.

Field cancerisation, first described in oral epithelium [5], holds that a whole diseased organ can be predisposed to cancer. In this view, the tumour arises from gradual, diffuse change in the surrounding tissue."
Break 2. Passage: "Molecular studies have shown that prognostic signal lies in the non-tumour tissue itself [6]. Imaging analysis mostly characterises the tumour [7], and how the background liver changes across serial scans before diagnosis is rarely studied."
Replacement:
"Molecular studies found that prognostic signal lies in the non-tumour tissue itself [6].

[The share of published imaging analyses] characterise the tumour [7]. [The count of published analyses] follow how the background liver changes across serial scans before diagnosis."
Break 3. Passage: "Imaging analysis mostly characterises the tumour [7], and how the background liver changes across serial scans before diagnosis is rarely studied. The opportunity is a surveillance cohort of 243 patients and 925 serial MRI studies, in which 37 patients develop HCC, so we can ask what the background liver was doing beforehand."
Replacement:
"[The share of published imaging analyses] characterise the tumour [7]. [The count of published analyses] follow how the background liver changes across serial scans before diagnosis.

The opportunity is a surveillance cohort of 243 patients and 925 serial MRI studies, in which 37 patients develop HCC. The cohort lets us study the course of the background liver beforehand."

12e. paragraph 35 (10 sentences; hypothesis, tested study, success, scope of the claim, risk, fit with the scheme)
Break 1. Passage: "We hypothesise that in patients who develop HCC, the MRI signal of the background liver departs from that patient's own stable course at least 12 months (two 6-month surveillance intervals [2]) before diagnosis. The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients)."
Replacement:
"In patients who develop HCC, we hypothesise that the MRI signal of the background liver departs from that patient's own stable course. We hypothesise that this departure is present at least 12 months (two 6-month surveillance intervals [2]) before diagnosis.

The tested study is the latest usable study ([a definition of a usable study at this first use, as the Approach paragraph gives it]) at least 12 months before the clinical diagnosis date. The tested study also has at least one earlier usable study. We compare its divergence score ([a definition of the divergence score at this first use, as C2 gives it]) with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients)."
Break 2. Passage: "The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients). Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."
Replacement:
"The tested study is the latest usable study ([a definition of a usable study at this first use, as the Approach paragraph gives it]) at least 12 months before the clinical diagnosis date. The tested study also has at least one earlier usable study. We compare its divergence score ([a definition of the divergence score at this first use, as C2 gives it]) with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients).

The project succeeds if the tested studies' divergence scores exceed those of the matched never-HCC studies in the primary analysis. The test is one-sided at alpha 0.05."
Break 3. Passage: "A within-patient analysis adjusted for decompensation (the stage at which the scarred liver begins to fail and complications appear) gives supporting evidence. The claim is predictive: the change precedes the tumour."
Replacement:
"A within-patient analysis adjusted for decompensation (the stage at which the scarred liver begins to fail and complications appear) gives supporting evidence.

The claim is predictive: the change precedes the tumour."
Break 4. Passage: "Molecular confirmation lies outside this project. Whether such change exceeds the scan-to-scan variation of cirrhotic tissue is unknown, which makes the project high-risk."
Replacement:
"Molecular confirmation lies outside this project.

Whether such change exceeds the scan-to-scan variation of cirrhotic tissue is unknown, which makes the project high-risk."
Break 5. Passage: "If it does, surveillance can warn within the curative window. The project fits the XS scheme as a pre-registered measurement on a surveillance cohort the applicant already holds, with the readout's sensitivity fixed in advance by inserting changes of known size into real liver scans."
Replacement:
"If it does, surveillance could warn within the curative window.

The project fits the XS scheme as a pre-registered measurement on a surveillance cohort we already hold. The readout's sensitivity ([a definition of the readout at this first use]) is fixed in advance by inserting changes of known size into real liver scans."

12f. paragraph 40 (8 sentences, 13 sentences and two lists after the other findings; the cohort, the clinical record, the sequences, usable studies, the confirmatory set)
Break 1. Passage: "Approach. The cohort holds 243 patients with outcome labels and 925 serial MRI studies, with a LI-RADS level per study (the standard radiological HCC likelihood score [3], recorded in three levels from 0, the least severe, through 1, intermediate, to 2, the most severe). The clinical record gives the date of HCC diagnosis and the liver segment and size of the tumour for all 37 patients who develop HCC."
Replacement:
"Approach. The cohort holds 243 patients with outcome labels and 925 serial MRI studies. Each study has a LI-RADS level, the standard radiological HCC likelihood score [3]. The score is recorded in three levels, from 0 (the least severe) through 1 (intermediate) to 2 (the most severe).

For all 37 patients who develop HCC, the clinical record gives the date of HCC diagnosis. The record also gives the liver segment and size of each tumour."
Break 2. Passage: "The clinical record gives the date of HCC diagnosis and the liver segment and size of the tumour for all 37 patients who develop HCC. The studies hold several MRI scan types (sequences): diffusion scans at four strengths of sensitivity to water movement, a pair of T1 scans whose difference shows fat, a T2 scan and scans after contrast injection."
Replacement:
"For all 37 patients who develop HCC, the clinical record gives the date of HCC diagnosis. The record also gives the liver segment and size of each tumour.

The studies hold these MRI scan types (sequences):
- diffusion scans at four strengths of sensitivity to water movement;
- a pair of T1 scans ([a definition of a T1 scan at this first use]) whose difference shows fat;
- a T2 scan ([a definition of a T2 scan at this first use]);
- scans after contrast injection."
Break 3. Passage: "The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans. Of the 925 studies, 776 are usable (all non-contrast sequences present), and an organ map that outlines the liver exists for every usable study."
Replacement:
"The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans [a citation for contrast-free surveillance MRI].

Of the 925 studies, 776 are usable (all non-contrast sequences present). An organ map that outlines the liver exists for every usable study."
Break 4. Passage: "Of the 925 studies, 776 are usable (all non-contrast sequences present), and an organ map that outlines the liver exists for every usable study. Of the 37 patients who develop HCC, 8 have a usable study at least 12 months before diagnosis together with at least one earlier usable study, and form the confirmatory set."
Replacement:
"Of the 925 studies, 776 are usable (all non-contrast sequences present). An organ map that outlines the liver exists for every usable study.

Of the 37 patients who develop HCC, 8 meet both conditions for a tested study. These 8 patients form the confirmatory set."

12g. paragraph 41 (8 sentences, 19 sentences and a list after the other findings; within-patient alignment, the common reference, blinding, the table and components, the number of components, the checks, the detection limit, success)
Break 1. Passage: "C1. We align each study to the patient's earlier studies so that the same point of the liver overlaps across scans [12], and exclude studies in which the alignment folds tissue onto itself or puts recognisable liver structures in the wrong place. The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients, and the liver segments used in C3 and WP1 are the segments marked on this reference."
Replacement:
"C1. We align each study to the patient's earlier studies so that the same point of the liver overlaps across scans [12]. We exclude studies in which the alignment folds tissue onto itself or puts recognisable liver structures in the wrong place.

We then align the livers of all patients to one common reference liver [12]. This common reference lets the same components be compared across patients. The liver segments used in C3 and work package 1 (WP1) are the segments marked on this reference."
Break 2. Passage: "The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients, and the liver segments used in C3 and WP1 are the segments marked on this reference. The analyst receives only studies taken before diagnosis (see C2)."
Replacement:
"We then align the livers of all patients to one common reference liver [12]. This common reference lets the same components be compared across patients. The liver segments used in C3 and work package 1 (WP1) are the segments marked on this reference.

The analyst receives only studies taken before diagnosis (see C2)."
Break 3. Passage: "The analyst receives only studies taken before diagnosis (see C2). Within the liver outline from the organ map, the signal of every image point in every sequence at every scan date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1)."
Replacement:
"The analyst receives only studies taken before diagnosis (see C2).

One three-way table holds the signal of every image point in every sequence at every scan date. The table holds only image points within the liver outline from the organ map. We summarise the table as interpretable components [9-11], as many as the reproducibility rule below allows. Each component is a pattern with three parts (Figure 1):
- where in the liver it lies;
- how strongly it shows in each sequence;
- how it changes over time."
Break 4. Passage: "Within the liver outline from the organ map, the signal of every image point in every sequence at every scan date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1). The number of components is the largest for which the components found separately in two random halves of the patients correlate at 0.8 or more."
Replacement:
"One three-way table holds the signal of every image point in every sequence at every scan date. The table holds only image points within the liver outline from the organ map. We summarise the table as interpretable components [9-11], as many as the reproducibility rule below allows. Each component is a pattern with three parts (Figure 1):
- where in the liver it lies;
- how strongly it shows in each sequence;
- how it changes over time.

We split the patients into two random halves and find the components in each half separately. The number of components is the largest for which the two halves' components correlate at 0.8 or more."
Break 5. Passage: "The number of components is the largest for which the components found separately in two random halves of the patients correlate at 0.8 or more. Components are checked against estimates of liver fat and of the signal loss caused by iron, both computed from the pair of T1 scans of the same study, and against decompensation status."
Replacement:
"We split the patients into two random halves and find the components in each half separately. The number of components is the largest for which the two halves' components correlate at 0.8 or more.

We check the components against estimates of liver fat and of the signal loss caused by iron, and against decompensation status. Both estimates are computed from the pair of T1 scans of the same study."
Break 6. Passage: "Components are checked against estimates of liver fat and of the signal loss caused by iron, both computed from the pair of T1 scans of the same study, and against decompensation status. Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients, runs the readout on them and records the smallest change it detects, expressed in the same standard-deviation units as the detectable effect of C2."
Replacement:
"We check the components against estimates of liver fat and of the signal loss caused by iron, and against decompensation status. Both estimates are computed from the pair of T1 scans of the same study.

Before we deposit the pre-registration, a data steward inserts changes of known, graded size into never-HCC patients' stable study series. The changes are diffuse and focal and go into all sequences. Before the deposit, the data steward runs the readout on these series and records the smallest change it detects. The smallest detected change is expressed in the same standard-deviation units as the detectable effect of C2."
Break 7. Passage: "Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients, runs the readout on them and records the smallest change it detects, expressed in the same standard-deviation units as the detectable effect of C2. Success means reproducible components that track the fat and iron estimates, and a detection limit fixed before the liver test."
Replacement:
"Before we deposit the pre-registration, a data steward inserts changes of known, graded size into never-HCC patients' stable study series. The changes are diffuse and focal and go into all sequences. Before the deposit, the data steward runs the readout on these series and records the smallest change it detects. The smallest detected change is expressed in the same standard-deviation units as the detectable effect of C2.

C1 needs reproducible components that track the fat and iron estimates. It also needs a detection limit fixed before the confirmatory test."

12h. paragraph 42 (13 sentences; the measure, the tested studies, the LI-RADS exclusions, the primary comparison, the detectable effects, decompensation, checks against artefact, blinding, success)
Break 1. Passage: "The tested study is the latest usable study at least 12 months (two 6-month surveillance intervals [2]) before the clinical diagnosis date, with at least one earlier usable study. In the 8 patients it lies a median of 21 months before diagnosis (range 12.5 to 77.6 months), with a median of 2.5 earlier usable studies, and is at LI-RADS level 0 in 5 and level 1 in 3."
Replacement:
"The tested study is the latest usable study at least 12 months (two 6-month surveillance intervals [2]) before the clinical diagnosis date. The tested study also has at least one earlier usable study.

In the 8 patients, the tested study lies a median of 21 months before diagnosis (range 12.5 to 77.6 months). The tested study has a median of 2.5 earlier usable studies. It is at LI-RADS level 0 in 5 patients and level 1 in 3."
Break 2. Passage: "In the 8 patients it lies a median of 21 months before diagnosis (range 12.5 to 77.6 months), with a median of 2.5 earlier usable studies, and is at LI-RADS level 0 in 5 and level 1 in 3. Tested studies at level 2 are excluded (none of the 8 is), and a sensitivity analysis excludes those at level 1."
Replacement:
"In the 8 patients, the tested study lies a median of 21 months before diagnosis (range 12.5 to 77.6 months). The tested study has a median of 2.5 earlier usable studies. It is at LI-RADS level 0 in 5 patients and level 1 in 3.

We exclude tested studies at level 2 (none of the 8 is). A sensitivity analysis excludes those at level 1."
Break 3. Passage: "Tested studies at level 2 are excluded (none of the 8 is), and a sensitivity analysis excludes those at level 1. In the primary analysis, the score of each tested study is compared with the scores of never-HCC studies at a matched position: same scan year, same number of earlier studies, similar time since the first study and similar interval since the previous study."
Replacement:
"We exclude tested studies at level 2 (none of the 8 is). A sensitivity analysis excludes those at level 1.

In the primary analysis, we compare the score of each tested study with the scores of never-HCC studies at a matched position. A matched position has:
- the same scan year;
- the same number of earlier studies;
- a time since the first study within [the matching tolerance, in months];
- an interval since the previous study within [the matching tolerance, in months]."
Break 4. Passage: "In the primary analysis, the score of each tested study is compared with the scores of never-HCC studies at a matched position: same scan year, same number of earlier studies, similar time since the first study and similar interval since the previous study. With 8 patients against 148 never-HCC patients, the smallest detectable effect is 0.91 standard deviations (80 percent power, one-sided alpha 0.05)."
Replacement:
"In the primary analysis, we compare the score of each tested study with the scores of never-HCC studies at a matched position. A matched position has:
- the same scan year;
- the same number of earlier studies;
- a time since the first study within [the matching tolerance, in months];
- an interval since the previous study within [the matching tolerance, in months].

With 8 patients against 148 never-HCC patients, the smallest detectable effect is 0.91 standard deviations (80 percent power, one-sided alpha 0.05)."
Break 5. Passage: "A sensitivity analysis restricted to tested studies 12 to 36 months before diagnosis is reported (7 of the 8 patients, smallest detectable effect 0.97 standard deviations). The primary test is repeated in the 5 patients with no recorded decompensation by their tested study."
Replacement:
"We report a sensitivity analysis restricted to tested studies 12 to 36 months before diagnosis. It covers 7 of the 8 patients, with a smallest detectable effect of 0.97 standard deviations.

We repeat the primary test in the 5 patients with no recorded decompensation by their tested study."
Break 6. Passage: "A supporting model gives each patient their own baseline, adjusts for decompensation status at each scan (dated records exist for all 8) and compares each tested study with the patient's earlier usable studies. A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible, and reassigning diagnosis dates at random between patients must remove the effect."
Replacement:
"A supporting model takes these steps:
- it gives each patient their own baseline;
- it adjusts for decompensation status at each scan (dated records exist for all 8);
- it compares each tested study with the patient's earlier usable studies.

A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible. Reassigning diagnosis dates at random between patients must remove the effect."
Break 7. Passage: "A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible, and reassigning diagnosis dates at random between patients must remove the effect. The data steward keeps the outcome labels, gives the analyst only studies before diagnosis, cuts each never-HCC patient's series at a random point so that series length does not reveal outcome, and estimates this scan-to-scan variation as pre-registered."
Replacement:
"A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible. Reassigning diagnosis dates at random between patients must remove the effect.

The data steward has these tasks:
- keeping the outcome labels;
- giving the analyst only studies before diagnosis;
- cutting each never-HCC patient's series at a random point so that series length does not reveal outcome;
- estimating this scan-to-scan variation as pre-registered."
Break 8. Passage: "The analysis code, number of components and matching rule are time-stamped on the Open Science Framework before the analyst receives the labels. Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."
Replacement:
"We time-stamp the analysis code, number of components and matching rule on the Open Science Framework before the analyst receives the labels.

The primary analysis must show higher divergence scores in the tested studies than in the matched never-HCC studies. It uses a one-sided test at alpha 0.05."

12i. paragraph 48 (4 sentences, 8 after the other findings; prior imaging, prior molecular and nodule work, novelty, impact)
Break 1. Passage: "Imaging of the background liver already estimates HCC risk: elastography measures liver stiffness [13], and computer-extracted image features of the whole liver on a baseline MRI predict HCC development in cirrhosis [8]. Molecular pathology places prognostic signal in the non-tumour tissue [6], and imaging follows discrete precursor nodules [4]."
Replacement:
"Imaging of the background liver already estimates HCC risk. Elastography measures liver stiffness [13]. Computer-extracted image features of the whole liver on a baseline MRI predict HCC development in cirrhosis [8].

Molecular pathology places prognostic signal in the non-tumour tissue [6]. Imaging follows discrete precursor nodules [4]."
Break 2. Passage: "Molecular pathology places prognostic signal in the non-tumour tissue [6], and imaging follows discrete precursor nodules [4]. What is new here is the within-patient, point-by-point trajectory of the background liver across serial MRI before diagnosis, read through interpretable components."
Replacement:
"Molecular pathology places prognostic signal in the non-tumour tissue [6]. Imaging follows discrete precursor nodules [4].

What is new here is the within-patient, point-by-point trajectory of the background liver across serial MRI before diagnosis, read through interpretable components."
Break 3. Passage: "What is new here is the within-patient, point-by-point trajectory of the background liver across serial MRI before diagnosis, read through interpretable components. If the hypothesis holds, surveillance can warn within the curative window, and the method transfers to other field-cancerisation settings [5] (Barrett's oesophagus, oral premalignancy, bronchial field change)."
Replacement:
"What is new here is the within-patient, point-by-point trajectory of the background liver across serial MRI before diagnosis, read through interpretable components.

If the hypothesis holds, surveillance could warn within the curative window. If the hypothesis holds, the method could also transfer to other field-cancerisation settings [5] (Barrett's oesophagus, oral premalignancy, bronchial field change)."

======================================================================
13. references/rules.md, "Tense per section"
This break changes no claim. At paragraph 34, the reader meets the one reported finding of the problem section in the present perfect. The row for reporting findings asks for the past tense.

13a. paragraph 34 (Literature review, reporting findings: Past)
Passage: "Molecular studies have shown that prognostic signal lies in the non-tumour tissue itself [6]."
Rule: references/rules.md, "Tense per section".
Replacement: "Molecular studies found that prognostic signal lies in the non-tumour tissue itself [6]."

======================================================================
14. The prose standard, section B (ASCII throughout) and section 0 (en dash as an aside)
This break changes no claim. At paragraph 64 [word/header1.xml], the two en dashes may not show in a plain-text viewer or a diff.

14a. paragraph 64 [word/header1.xml]
Passage: "Application Form <en dash> NWO Open Competition Domain Science <en dash> XS 2026"
Rule: the prose standard, section B (ASCII throughout) and section 0 (en dash as an aside).
Replacement: "Application Form, NWO Open Competition Domain Science, XS 2026"

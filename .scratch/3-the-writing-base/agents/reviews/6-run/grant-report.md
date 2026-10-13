Review of /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx, read through docx_paragraphs.py (paragraphs 1 to 67). Register applied: Medicine and Health (an HCC surveillance MRI cohort with LI-RADS scoring).

== 1. references/rules.md, "Terms defined at first use" ==
The Idea section (paragraph 35) states the confirmatory test as a comparison of the tested study's "divergence score" with studies "at a matched position", but neither term is defined until paragraph 42, and "the readout" is never defined, so a reviewer cannot judge the test where it is first stated.

1.1 paragraph 25. "atlas": first use. It is defined only in paragraph 46.
Passage: "Open-access charges and costs of the openly released atlas"
Replacement: "Open-access charges and costs of the openly released atlas (component definitions, summary maps and code, with no patient-level data)"

1.2 paragraph 31. "background-liver components": first use. The components are defined only in paragraph 41, and "background liver" is never defined.
Passage: "to build the interpretable background-liver components"
Replacement: "to build the interpretable background-liver components (patterns in the MRI signal of the background liver, the liver tissue outside the tumour, each with a location, a strength in each type of MRI scan and a course over time)"

1.3 paragraph 35. "usable study", "divergence score" and "matched position": first use of all three. They are defined in paragraphs 40, 42 and 42. The same sentence also falls under group 11.
Passage: "The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients)."
Replacement: "The tested study is the latest usable study (a study with every MRI scan type taken without contrast present) at least 12 months before the clinical diagnosis date, with at least one earlier usable study. The divergence score of a study is the mean, over components, of its distance from the patient's earlier usable studies, in standard deviations of the study-to-study variation of stable livers. The divergence score of the tested study is compared with the scores of studies at a matched position (same study year, same number of earlier studies, similar time since the first study and similar interval since the previous study) in patients who never develop HCC (never-HCC patients)."

1.4 paragraph 35. "C3": first use. It is defined only in paragraph 39.
Passage: "is the exploratory question of C3."
Replacement: "is the exploratory question of objective C3, whether the change concentrates where the tumour later appears."

1.5 paragraph 35. "readout": first use, and the draft never defines it. "Detection limit", the term this passage brings in (group 2, 2.2), is defined here.
Passage: "with the readout's sensitivity fixed in advance"
Replacement: "with the detection limit of the readout ([the definition of the readout]), the smallest inserted change the readout detects, fixed in advance"

1.6 paragraph 41. "WP1": first use. It is defined only in paragraph 46. The same sentence also falls under group 11.
Passage: "The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients, and the liver segments used in C3 and WP1 are the segments marked on this reference."
Replacement: "The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients. The liver segments used in C3 and in work package 1 (WP1) are the segments marked on this reference."

== 2. Prose standard, section D, "No synonym cycling" ==
"Scan" names the MRI study as well as a sequence image within it (paragraph 41 computes fat "from the pair of T1 scans of the same study"). A reader therefore cannot tell whether the "scan-to-scan variation" that sets the unit of every divergence score (paragraph 42) is variation between studies or between sequences. In the same way, the figure's "smallest detectable change" cannot be told apart from the 0.91 standard-deviation "smallest detectable effect".

2.1 The MRI study is also called "scan". Each place:
- paragraph 34: "across serial scans before diagnosis" -> "across serial MRI studies before diagnosis"
- paragraph 35: "the scan-to-scan variation of cirrhotic tissue" -> "the study-to-study variation of cirrhotic tissue"
- paragraph 35: "into real liver scans" -> "into real liver studies"
- paragraph 41: "overlaps across scans [12]" -> "overlaps across studies [12]"
- paragraph 41: "at every scan date" -> "at every study date"
- paragraph 42: "the ordinary scan-to-scan variation of stable livers" -> "the ordinary study-to-study variation of stable livers"
- paragraph 42: "same scan year" -> "same study year"
- paragraph 42: "decompensation status at each scan" -> "decompensation status at each study"
- paragraph 42: "this scan-to-scan variation" -> "this study-to-study variation"
- paragraph 46: "aligns the scans" -> "aligns the studies"
- paragraph 47: "decompensation status at each scan" -> "decompensation status at each study"
- paragraph 47: "a scan-year covariate" -> "a study-year covariate"

2.2 The detection limit (paragraphs 37, 41, 46, 47) is also called "sensitivity" and "smallest detectable change". Each place:
- paragraph 35: "with the readout's sensitivity fixed in advance" -> "with the detection limit of the readout ([the definition of the readout]), the smallest inserted change the readout detects, fixed in advance"
- paragraph 45: "the smallest detectable change" -> "[the detection limit, or the smallest detectable effect of C2, whichever the lower panel shows]"

== 3. references/registers.md, "What the reader looks for" (Medicine and Health) ==
A medical reviewer checking how the 8-patient confirmatory analysis will be reported finds no reporting guideline named in the Approach.

3.1 paragraph 40.
Passage: "The cohort holds 243 patients with outcome labels and 925 serial MRI studies, with a LI-RADS level per study (the standard radiological HCC likelihood score [3], recorded in three levels from 0, the least severe, through 1, intermediate, to 2, the most severe)."
Replacement: "The cohort holds 243 patients with outcome labels and 925 serial MRI studies, with a LI-RADS level per study (the standard radiological HCC likelihood score [3], recorded in three levels from 0, the least severe, through 1, intermediate, to 2, the most severe). [The reporting guideline the analysis follows, named with its citation.]"

== 4. references/rules.md, "Hedging" ==
Paragraph 48 states as fact that the method transfers to Barrett's oesophagus, oral premalignancy and bronchial field change. The project tests it in one liver cohort only, with 8 confirmatory patients. The same sentence also falls under group 11.

4.1 paragraph 48.
Passage: "If the hypothesis holds, surveillance can warn within the curative window, and the method transfers to other field-cancerisation settings [5] (Barrett's oesophagus, oral premalignancy, bronchial field change)."
Replacement: "If the hypothesis holds, surveillance can warn within the curative window. The method may then transfer to other field-cancerisation settings [5] (Barrett's oesophagus, oral premalignancy, bronchial field change)."

== 5. Prose standard, section A, vague qualifiers ==
The case for the project rests on three frequencies: how often HCC arises in cirrhosis, how often surveillance finds it too late, and how rarely the background liver has been studied. The reader gets none of them as a number.

5.1 paragraph 8 ("usually", "often"). The same sentence also falls under group 11.
Passage: "Liver cancer usually grows in a scarred, cirrhotic liver, and scans find it only once a tumour is visible, often too late to cure."
Replacement: "Liver cancer grows in a scarred, cirrhotic liver in [the share of liver cancers that arise in cirrhosis]. Scans find it only once a tumour is visible, which is too late to cure in [the share of cases]."

5.2 paragraph 11 ("meestal", "vaak"). The same sentence also falls under group 11.
Passage: "Leverkanker ontstaat meestal in een verlittekende, cirrotische lever, en scans vinden een tumor pas als die zichtbaar is, vaak te laat om te genezen."
Replacement: "Leverkanker ontstaat in [het aandeel leverkankers dat in cirrose ontstaat] in een verlittekende, cirrotische lever. Scans vinden een tumor pas als die zichtbaar is, wat in [het aandeel gevallen] te laat is om te genezen."

5.3 paragraph 34 ("mostly"). The same sentence also falls under group 11.
Passage: "Hepatocellular carcinoma (HCC) mostly arises in a cirrhotic liver [1], and imaging surveillance is meant to catch it while cure is still possible [2]."
Replacement: "Hepatocellular carcinoma (HCC) arises in a cirrhotic liver in [the share of HCC cases that arise in cirrhosis, from [1]] [1]. Imaging surveillance is meant to catch it while cure is still possible [2]."

5.4 paragraph 34 ("frequently").
Passage: "In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3], frequently past the curative window."
Replacement: "In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3], which is past the curative window in [the share of cases, with its source]."

5.5 paragraph 34 ("mostly", "rarely"). The same sentence also falls under groups 2 and 11.
Passage: "Imaging analysis mostly characterises the tumour [7], and how the background liver changes across serial scans before diagnosis is rarely studied."
Replacement: "Of published imaging analyses, [the share, with its source] characterise the tumour [7]. How the background liver changes across serial MRI studies before diagnosis is the subject of [the number of published studies, with their citations]."

== 6. references/rules.md, "Evidence for claims" ==
The use of non-contrast sequences only is justified by a match to "shorter contrast-free surveillance scans", but the draft gives no source for that practice. The reader cannot check that the choice serves a protocol in clinical use.

6.1 paragraph 40.
Passage: "The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans."
Replacement: "The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans [citation for contrast-free surveillance MRI protocols]."

== 7. references/rules.md, "Explanation of evidence" ==
The reader learns that patients who develop HCC are imaged every 7.9 months and never-HCC patients every 11.9 months, a difference that bears on the comparison of the two groups, but is not told what it means for the test.

7.1 paragraph 40.
Passage: "Studies are a median 7.9 months apart in patients who develop HCC and 11.9 months in never-HCC patients."
Replacement: "Studies are a median 7.9 months apart in patients who develop HCC and 11.9 months in never-HCC patients. [What this difference in study spacing means for the comparison of the two groups.]"

== 8. references/rules.md, "Tense per section" ==
Cited findings are written in the present or present perfect. The reader of paragraph 48 then takes one 2022 cohort's result [8] as an established state of the field.

8.1 paragraph 34.
Passage: "Molecular studies have shown that prognostic signal lies in the non-tumour tissue itself [6]."
Replacement: "Molecular studies showed that prognostic signal lies in the non-tumour tissue itself [6]."

8.2 paragraph 48.
Passage: "predict HCC development in cirrhosis [8]"
Replacement: "predicted HCC development in cirrhosis [8]"

== 9. references/registers.md, "Voice" (third-person reference to the authors) ==
These breaks change no claim. The reader meets the authors under two names: "we" in paragraphs 35 and 41, and "the applicant" in paragraphs 31, 35 and 46.

9.1 paragraph 31.
Passage: "of the applicant's own postdoctoral salary"
Replacement: "of our own postdoctoral salary"

9.2 paragraph 31.
Passage: "The applicant's standing appointment covers the remaining time."
Replacement: "Our standing appointment covers the remaining time."

9.3 paragraph 35.
Passage: "a surveillance cohort the applicant already holds"
Replacement: "a surveillance cohort we already hold"

9.4 paragraph 46.
Passage: "The applicant works at 0,42 FTE"
Replacement: "We work at 0,42 FTE"

== 10. Prose standard, section E, "Passive voice" ==
These breaks change no claim. In paragraph 31, "Computing is provided by the host institution" puts the actor behind the verb, and "none is requested" hides who makes the request.

10.1 paragraph 8.
Passage: "Where in the liver the change concentrates is explored separately."
Replacement: "We explore separately where in the liver the change concentrates."

10.2 paragraph 31.
Passage: "Computing is provided by the host institution at no cost, so none is requested."
Replacement: "The host institution provides computing at no cost, so we request none."

10.3 paragraph 31.
Passage: "No basic amenities, overheads, or maintenance are requested."
Replacement: "We request no basic amenities, overheads, or maintenance."

10.4 paragraph 49.
Passage: "The atlas (component definitions, summary maps and code) contains no patient-level data and will be released openly."
Replacement: "The atlas (component definitions, summary maps and code) contains no patient-level data, and we will release it openly."

== 11. references/rules.md, "Formality" (two ideas in one sentence) ==
These breaks change no claim. The reader has to hold two claims in one sentence, as in paragraph 35, where the definition of the tested study and its comparison with never-HCC studies share 47 words.

11.1 paragraph 8. The two ideas: liver cancer grows in a cirrhotic liver; scans find it late. Passage and replacement as in 5.1.

11.2 paragraph 11. The same two ideas. Passage and replacement as in 5.2.

11.3 paragraph 34. The two ideas: HCC arises in cirrhosis; surveillance is meant to catch it while it is curable. Passage and replacement as in 5.3.

11.4 paragraph 34. The two ideas, in contrast: imaging analysis characterises the tumour; the background liver before diagnosis is little studied. Passage and replacement as in 5.5.

11.5 paragraph 35. The two ideas: which study is tested; its score is compared with matched never-HCC studies. Passage and replacement as in 1.3.

11.6 paragraph 40. The two ideas: 776 of the 925 studies are usable; an organ map exists for every usable study.
Passage: "Of the 925 studies, 776 are usable (all non-contrast sequences present), and an organ map that outlines the liver exists for every usable study."
Replacement: "Of the 925 studies, 776 are usable (all non-contrast sequences present). An organ map that outlines the liver exists for every usable study."

11.7 paragraph 41. The two ideas: the livers are aligned to a common reference so components compare across patients; the liver segments are those marked on the reference. Passage and replacement as in 1.6.

11.8 paragraph 42. The two ideas: a blinded radiologist re-reads the tested study; random reassignment of diagnosis dates must remove the effect.
Passage: "A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible, and reassigning diagnosis dates at random between patients must remove the effect."
Replacement: "A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible. Reassigning diagnosis dates at random between patients must remove the effect."

11.9 paragraph 48. The two ideas: molecular pathology places prognostic signal in non-tumour tissue; imaging follows precursor nodules.
Passage: "Molecular pathology places prognostic signal in the non-tumour tissue [6], and imaging follows discrete precursor nodules [4]."
Replacement: "Molecular pathology places prognostic signal in the non-tumour tissue [6]. Imaging follows discrete precursor nodules [4]."

11.10 paragraph 48. The two ideas: surveillance can warn in time; the method transfers to other settings. Passage and replacement as in 4.1.

== 12. Prose standard, section D, paragraphs under roughly four sentences ==
These breaks change no claim. Paragraph 42 runs 13 sentences across the score, the matching, the power, the sensitivity analyses, the blinding and the success criterion. A reviewer looking for the primary comparison has to find it inside that one block. Sentence counts below include the sentences added by the findings above.

12.1 paragraph 8 (5 sentences, 6 after 5.1).
Passage: "Cancer is thought to arise from gradual change across the whole diseased liver. This project tests whether that change is measurable in the tumour-free liver on repeat MRI scans and departs from the same liver's earlier stable pattern before a tumour appears."
Replacement:
"Cancer is thought to arise from gradual change across the whole diseased liver.

This project tests whether that change is measurable in the tumour-free liver on repeat MRI scans and departs from the same liver's earlier stable pattern before a tumour appears."

12.2 paragraph 11 (5 sentences, 6 after 5.2).
Passage: "Kanker ontstaat vermoedelijk uit een geleidelijke verandering in de hele zieke lever. Dit project test of die verandering meetbaar is in de tumorvrije lever op herhaalde MRI-scans en afwijkt van het eerdere stabiele beeld van dezelfde lever voordat een tumor verschijnt."
Replacement:
"Kanker ontstaat vermoedelijk uit een geleidelijke verandering in de hele zieke lever.

Dit project test of die verandering meetbaar is in de tumorvrije lever op herhaalde MRI-scans en afwijkt van het eerdere stabiele beeld van dezelfde lever voordat een tumor verschijnt."

12.3 paragraph 31 (8 sentences), first split.
Passage: "The applicant's standing appointment covers the remaining time. Computing is provided by the host institution at no cost, so none is requested."
Replacement:
"Our standing appointment covers the remaining time.

The host institution provides computing at no cost, so we request none."

12.4 paragraph 31, second split.
Passage: "Dissemination covers open-access publication charges and the costs of the openly released atlas. The longitudinal MRI cohort is already available under a data agreement, so no data-acquisition costs arise."
Replacement:
"Dissemination covers open-access publication charges and the costs of the openly released atlas.

The longitudinal MRI cohort is already available under a data agreement, so no data-acquisition costs arise."

12.5 paragraph 34 (6 sentences, 8 after 5.3 and 5.5), first split.
Passage: "In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3], frequently past the curative window. Field cancerisation, first described in oral epithelium [5], holds that a whole diseased organ can be predisposed to cancer, with the tumour arising from gradual, diffuse change in the surrounding tissue."
Replacement:
"In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3], which is past the curative window in [the share of cases, with its source].

Field cancerisation, first described in oral epithelium [5], holds that a whole diseased organ can be predisposed to cancer, with the tumour arising from gradual, diffuse change in the surrounding tissue."

12.6 paragraph 34, second split.
Passage: "Imaging analysis mostly characterises the tumour [7], and how the background liver changes across serial scans before diagnosis is rarely studied. The opportunity is a surveillance cohort of 243 patients and 925 serial MRI studies, in which 37 patients develop HCC, so we can ask what the background liver was doing beforehand."
Replacement:
"Of published imaging analyses, [the share, with its source] characterise the tumour [7]. How the background liver changes across serial MRI studies before diagnosis is the subject of [the number of published studies, with their citations].

The opportunity is a surveillance cohort of 243 patients and 925 serial MRI studies, in which 37 patients develop HCC, so we can ask what the background liver was doing beforehand."

12.7 paragraph 35 (10 sentences, 12 after 1.3), first split.
Passage: "The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients). Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."
Replacement:
"The tested study is the latest usable study (a study with every MRI scan type taken without contrast present) at least 12 months before the clinical diagnosis date, with at least one earlier usable study. The divergence score of a study is the mean, over components, of its distance from the patient's earlier usable studies, in standard deviations of the study-to-study variation of stable livers. The divergence score of the tested study is compared with the scores of studies at a matched position (same study year, same number of earlier studies, similar time since the first study and similar interval since the previous study) in patients who never develop HCC (never-HCC patients).

Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."

12.8 paragraph 35, second split.
Passage: "A within-patient analysis adjusted for decompensation (the stage at which the scarred liver begins to fail and complications appear) gives supporting evidence. The claim is predictive: the change precedes the tumour."
Replacement:
"A within-patient analysis adjusted for decompensation (the stage at which the scarred liver begins to fail and complications appear) gives supporting evidence.

The claim is predictive: the change precedes the tumour."

12.9 paragraph 35, third split.
Passage: "Molecular confirmation lies outside this project. Whether such change exceeds the scan-to-scan variation of cirrhotic tissue is unknown, which makes the project high-risk."
Replacement:
"Molecular confirmation lies outside this project.

Whether such change exceeds the study-to-study variation of cirrhotic tissue is unknown, which makes the project high-risk."

12.10 paragraph 35, fourth split.
Passage: "If it does, surveillance can warn within the curative window. The project fits the XS scheme as a pre-registered measurement on a surveillance cohort the applicant already holds, with the readout's sensitivity fixed in advance by inserting changes of known size into real liver scans."
Replacement:
"If it does, surveillance can warn within the curative window.

The project fits the XS scheme as a pre-registered measurement on a surveillance cohort we already hold, with the detection limit of the readout ([the definition of the readout]), the smallest inserted change the readout detects, fixed in advance by inserting changes of known size into real liver studies."

12.11 paragraph 40 (8 sentences, 10 after 3.1 and 11.6, 11 after 7.1), first split.
Passage: "The clinical record gives the date of HCC diagnosis and the liver segment and size of the tumour for all 37 patients who develop HCC. The studies hold several MRI scan types (sequences): diffusion scans at four strengths of sensitivity to water movement, a pair of T1 scans whose difference shows fat, a T2 scan and scans after contrast injection."
Replacement:
"The clinical record gives the date of HCC diagnosis and the liver segment and size of the tumour for all 37 patients who develop HCC.

The studies hold several MRI scan types (sequences): diffusion scans at four strengths of sensitivity to water movement, a pair of T1 scans whose difference shows fat, a T2 scan and scans after contrast injection."

12.12 paragraph 40, second split.
Passage: "Of the 925 studies, 776 are usable (all non-contrast sequences present), and an organ map that outlines the liver exists for every usable study. Of the 37 patients who develop HCC, 8 have a usable study at least 12 months before diagnosis together with at least one earlier usable study, and form the confirmatory set."
Replacement:
"Of the 925 studies, 776 are usable (all non-contrast sequences present). An organ map that outlines the liver exists for every usable study.

Of the 37 patients who develop HCC, 8 have a usable study at least 12 months before diagnosis together with at least one earlier usable study, and form the confirmatory set."

12.13 paragraph 41 (8 sentences, 9 after 1.6), first split.
Passage: "The analyst receives only studies taken before diagnosis (see C2). Within the liver outline from the organ map, the signal of every image point in every sequence at every scan date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1)."
Replacement:
"The analyst receives only studies taken before diagnosis (see C2).

Within the liver outline from the organ map, the signal of every image point in every sequence at every study date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1)."

12.14 paragraph 41, second split.
Passage: "Components are checked against estimates of liver fat and of the signal loss caused by iron, both computed from the pair of T1 scans of the same study, and against decompensation status. Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients, runs the readout on them and records the smallest change it detects, expressed in the same standard-deviation units as the detectable effect of C2."
Replacement:
"Components are checked against estimates of liver fat and of the signal loss caused by iron, both computed from the pair of T1 scans of the same study, and against decompensation status.

Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients, runs the readout on them and records the smallest change it detects, expressed in the same standard-deviation units as the detectable effect of C2."

12.15 paragraph 42 (13 sentences, 14 after 11.8), first split.
Passage: "Tested studies at level 2 are excluded (none of the 8 is), and a sensitivity analysis excludes those at level 1. In the primary analysis, the score of each tested study is compared with the scores of never-HCC studies at a matched position: same scan year, same number of earlier studies, similar time since the first study and similar interval since the previous study."
Replacement:
"Tested studies at level 2 are excluded (none of the 8 is), and a sensitivity analysis excludes those at level 1.

In the primary analysis, the score of each tested study is compared with the scores of never-HCC studies at a matched position: same study year, same number of earlier studies, similar time since the first study and similar interval since the previous study."

12.16 paragraph 42, second split.
Passage: "With 8 patients against 148 never-HCC patients, the smallest detectable effect is 0.91 standard deviations (80 percent power, one-sided alpha 0.05). A sensitivity analysis restricted to tested studies 12 to 36 months before diagnosis is reported (7 of the 8 patients, smallest detectable effect 0.97 standard deviations)."
Replacement:
"With 8 patients against 148 never-HCC patients, the smallest detectable effect is 0.91 standard deviations (80 percent power, one-sided alpha 0.05).

A sensitivity analysis restricted to tested studies 12 to 36 months before diagnosis is reported (7 of the 8 patients, smallest detectable effect 0.97 standard deviations)."

12.17 paragraph 42, third split.
Passage: "A supporting model gives each patient their own baseline, adjusts for decompensation status at each scan (dated records exist for all 8) and compares each tested study with the patient's earlier usable studies. A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible, and reassigning diagnosis dates at random between patients must remove the effect."
Replacement:
"A supporting model gives each patient their own baseline, adjusts for decompensation status at each study (dated records exist for all 8) and compares each tested study with the patient's earlier usable studies.

A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible. Reassigning diagnosis dates at random between patients must remove the effect."

12.18 paragraph 42, fourth split.
Passage: "The analysis code, number of components and matching rule are time-stamped on the Open Science Framework before the analyst receives the labels. Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."
Replacement:
"The analysis code, number of components and matching rule are time-stamped on the Open Science Framework before the analyst receives the labels.

The confirmatory hypothesis holds if a one-sided test at alpha 0.05 shows that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."

12.19 paragraph 48 (4 sentences, 6 after 4.1 and 11.9).
Passage: "What is new here is the within-patient, point-by-point trajectory of the background liver across serial MRI before diagnosis, read through interpretable components. If the hypothesis holds, surveillance can warn within the curative window, and the method transfers to other field-cancerisation settings [5] (Barrett's oesophagus, oral premalignancy, bronchial field change)."
Replacement:
"What is new here is the within-patient, point-by-point trajectory of the background liver across serial MRI before diagnosis, read through interpretable components.

If the hypothesis holds, surveillance can warn within the curative window. The method may then transfer to other field-cancerisation settings [5] (Barrett's oesophagus, oral premalignancy, bronchial field change)."

== 13. Prose standard, section D, three or more list-shaped items in paragraph form become a list ==
These breaks change no claim. The four work packages with their months (paragraph 46) and the four risks (paragraph 47) each run together in one paragraph, so the reader cannot scan the timeline or the risks.

13.1 paragraph 46.
Passage: "Overlapping work packages: WP1 (mo 1-4) aligns the scans and builds the components (if point-by-point alignment fails the alignment check, averages per liver segment are used instead), obtains the detection limit from inserted changes of known size, deposits the pre-registration and writes the data-management plan; WP2 (mo 3-8, primary) prepares and, after the deposit, runs the confirmatory test; WP3 (mo 7-11) runs the exploratory location test; WP4 (mo 8-12) releases the atlas (component definitions, summary maps and code, with no patient-level data)."
Replacement:
"Overlapping work packages:
- WP1 (mo 1-4) aligns the studies and builds the components (if point-by-point alignment fails the alignment check, averages per liver segment are used instead), obtains the detection limit from inserted changes of known size, deposits the pre-registration and writes the data-management plan.
- WP2 (mo 3-8, primary) prepares and, after the deposit, runs the confirmatory test.
- WP3 (mo 7-11) runs the exploratory location test.
- WP4 (mo 8-12) releases the atlas (component definitions, summary maps and code, with no patient-level data)."

13.2 paragraph 47.
Passage: "Risks and mitigation. (i) Signal too small above cirrhotic variation: each patient is their own baseline, and the detectable effect and the readout's detection limit, in the same standard-deviation units, are fixed before unblinding. (ii) Severity: decompensation status at each scan enters the supporting within-patient model. (iii) Scanner drift, with scanner and protocol not recorded: rescaling each scan's signal to a common range, a scan-year covariate and same-year matching. (iv) Missed tumour, alignment error or selection by the alignment check: the blinded radiologist re-read, the LI-RADS exclusions, the alignment check, with the excluded studies described to show whether it removes the most diseased livers, and the random reassignment of diagnosis dates."
Replacement:
"Risks and mitigation:
- (i) Signal too small above cirrhotic variation: each patient is their own baseline, and the detectable effect and the readout's detection limit, in the same standard-deviation units, are fixed before unblinding.
- (ii) Severity: decompensation status at each study enters the supporting within-patient model.
- (iii) Scanner drift, with scanner and protocol not recorded: rescaling each scan's signal to a common range, a study-year covariate and same-year matching.
- (iv) Missed tumour, alignment error or selection by the alignment check: the blinded radiologist re-read, the LI-RADS exclusions, the alignment check, with the excluded studies described to show whether it removes the most diseased livers, and the random reassignment of diagnosis dates."

== 14. Prose standard, section 0, "No repeated construction" ==
These breaks change no claim. The Idea, C1, C2 and C3 each close on a sentence opening "Success means", and paragraph 42 repeats the success sentence of paragraph 35 word for word, so the reader rereads the same template four times. The first instance, in paragraph 35, stays.

14.1 paragraph 41.
Passage: "Success means reproducible components that track the fat and iron estimates, and a detection limit fixed before the liver test."
Replacement: "C1 is met when the components are reproducible and track the fat and iron estimates, and the detection limit is fixed before the liver test."

14.2 paragraph 42.
Passage: "Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."
Replacement: "The confirmatory hypothesis holds if a one-sided test at alpha 0.05 shows that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."

14.3 paragraph 43.
Passage: "Success means the future tumour segment ranks above these random relabellings."
Replacement: "The exploratory location test is positive if the future tumour segment ranks above these random relabellings."

== 15. Prose standard, section B, ASCII throughout ==
This break changes no claim. The header holds a non-ASCII en dash, which a plain-text viewer or a grep may not show as written. The ASCII check on the command's output reported this paragraph and no other.

15.1 paragraph 64 [word/header1.xml].
Passage: "Application Form <en dash> NWO Open Competition Domain Science <en dash> XS 2026"
Replacement: "Application Form: NWO Open Competition Domain Science, XS 2026"

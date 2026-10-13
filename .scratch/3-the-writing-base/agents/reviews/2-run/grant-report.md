# The /writing report on the copy of the grant

The review agent's final message, verbatim apart from each character outside the rules file's set written by its name in angle brackets. Review agent: a6c38a91aa8778321, claude-opus-5-5, ordo-high, 91994 tokens, 5 tool uses, 4.9 min.

Review of /private/tmp/claude-502/-Users-axelfaes-workspace-ordo/3998c800-ada6-47cd-b275-1266deb72cda/scratchpad/3-2-run/grant/Application-form-ENW-XS-26-3-LS.docx

I read the prose standard, the rules page and the registers page, then the whole draft through the docx_paragraphs.py command, which returned paragraphs 1 to 69. The draft is a clinical imaging study of hepatocellular carcinoma (HCC) in a patient cohort, so I applied the Medicine and Health register from the registers page.

== rules.md, "Terms defined at first use" ==
This group comes first. The core quantities of the confirmatory test are used several paragraphs before they are defined, so a panel member cannot follow the hypothesis on a first reading.

1. paragraph 34. "how the background liver changes across serial scans before diagnosis"
   Replacement: "how the background liver (the liver tissue outside any tumour) changes across serial MRI studies before diagnosis"
2. paragraph 35. "The tested study is the latest usable study at least 12 months"
   "Usable study" is defined only in paragraph 40.
   Replacement: "The tested study is the latest usable study (one with all non-contrast sequences present) at least 12 months"
3. paragraph 35. "its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC"
   "Divergence score" is defined only in paragraph 42, and "matched position" only there too.
   Replacement: "its divergence score (its distance from the same patient's earlier studies, defined in C2) is compared with the scores of studies at a matched position (same scan year and number of earlier studies, similar timing) in patients who never develop HCC"
4. paragraph 35. "with the readout's sensitivity fixed in advance"
   "Readout" is never defined.
   Replacement: "with the detection limit of the divergence score fixed in advance"
5. paragraph 37. "C1  Interpretable background-liver components, reproducible and checked against fat and iron estimates from the same MRI, with a calibrated detection limit."
   "Components" is defined only in paragraph 41, and "detection limit" only there too.
   Replacement: "C1  Interpretable background-liver components (patterns over liver location, sequence and time that summarise the serial MRI), reproducible and checked against fat and iron estimates from the same MRI, with a calibrated detection limit (the smallest inserted change the divergence score detects)."
6. paragraph 25. "Open-access charges and costs of the openly released atlas"
   The atlas is defined only in paragraph 46.
   Replacement: "Open-access charges and costs of the openly released atlas (component definitions, summary maps and code)"
7. paragraph 19. "UNL CAO table"
   Replacement: "salary table of the Collective Labour Agreement of Dutch Universities (UNL CAO)"
8. paragraph 41. "The analyst receives only studies taken before diagnosis (see C2)."
   The analyst's identity is never given, and the blinding depends on it.
   Replacement: "The analyst ([who runs the analysis, and whether this is the applicant]) receives only studies taken before diagnosis (see C2)."
9. paragraph 41. "a data steward inserts diffuse and focal changes"
   Replacement: "a data steward ([who, and that this person takes no part in the analysis]) inserts diffuse and focal changes"
10. paragraph 41. "the liver segments used in C3 and WP1"
    WP1 is defined only in paragraph 46.
    Replacement: "the liver segments used in C3 and in the fallback of work package 1 (WP1, see the work plan)"
11. paragraph 41. "expressed in the same standard-deviation units as the detectable effect of C2"
    Replacement: "expressed in the same standard-deviation units as the smallest detectable effect of C2 (the effect the confirmatory test has 80 percent power to detect)"
12. paragraph 46. "if point-by-point alignment fails the alignment check"
    "Alignment check" is never defined as such.
    Replacement: "if point-by-point alignment fails the check of C1 (no folded tissue, liver structures in place)"

== prose standard, D. Structure, "No synonym cycling" ==
This group stands second. One concept carries several names, and one name carries two concepts, so the reader cannot tell whether the draft means one thing or two.

13. paragraphs 40, 41, 42, 47. In paragraph 40, "scan" is a sequence: "several MRI scan types (sequences): diffusion scans at four strengths ..., a pair of T1 scans ..., a T2 scan and scans after contrast injection". Elsewhere "scan" is a whole study: "at every scan date" (41), "the ordinary scan-to-scan variation of stable livers" (42), "decompensation status at each scan" (42), "each scan's signal" (47).
    Replacement: use "sequence" for each acquisition type in paragraph 40, as in "diffusion-weighted sequences ..., a T2-weighted sequence and post-contrast sequences". Use "study" for the examination elsewhere, as in "study-to-study variation" and "decompensation status at each study".
14. paragraph 45. "The lower panel sketches a divergence score rising above the smallest detectable change before diagnosis."
    The draft also calls this concept "detection limit" (37, 41, 47), "the smallest change it detects" (41) and "the readout's sensitivity" (35).
    Replacement: "The lower panel sketches a divergence score rising above the detection limit before diagnosis."
15. paragraph 41. "a detection limit fixed before the liver test"
    The draft also calls this test "the trajectory analysis" and "the pre-registered primary endpoint" (31), "the primary test" (42) and "the confirmatory test" (46).
    Replacement: "a detection limit fixed before the confirmatory test", and "the confirmatory test" in paragraphs 31 and 42.

== rules.md, "Hedging" ==
This group affects trust. The clinical benefit is stated as certain, but the result it rests on would come from 8 patients and needs replication.

16. paragraph 35. "If it does, surveillance can warn within the curative window."
    Replacement: "If it does, surveillance could warn within the curative window, once a larger cohort replicates the result."
17. paragraph 48. "If the hypothesis holds, surveillance can warn within the curative window, and the method transfers to other field-cancerisation settings [5] (Barrett's oesophagus, oral premalignancy, bronchial field change)."
    Reference [5] covers oral epithelium only.
    Replacement: "If the hypothesis holds, surveillance could warn within the curative window, and the method could transfer to other settings of field cancerisation, such as Barrett's oesophagus, oral premalignancy and bronchial field change [5, citations for Barrett's oesophagus and bronchial field change]."

== rules.md, "Limitations and alternative interpretations" ==
This group also affects trust. One cited study is generalised beyond its population.

18. paragraph 48. "computer-extracted image features of the whole liver on a baseline MRI predict HCC development in cirrhosis [8]"
    Reference [8] studied hepatitis B virus-related cirrhosis only.
    Replacement: "radiomic features of the whole liver on a baseline MRI predicted HCC development in hepatitis B virus-related cirrhosis [8]"

== rules.md, "Evidence for claims" ==
The claims that establish the gap carry no source.

19. paragraph 34. "frequently past the curative window"
    Reference [3] is the LI-RADS system and does not carry this claim.
    Replacement: "[the share of surveillance-detected HCC found beyond curative treatment, with its citation]"
20. paragraph 34. "how the background liver changes across serial scans before diagnosis is rarely studied"
    Replacement: "how the background liver changes across serial MRI studies before diagnosis has been studied in [the studies, with citations, or the search that found none]"

== prose standard, A. Vocabulary (vague qualifiers) ==
These replace a number the author has with a vague word.

21. paragraph 8. "Liver cancer usually grows in a scarred, cirrhotic liver, and scans find it only once a tumour is visible, often too late to cure."
    Replacement: "About [share] of liver cancers grow in a scarred, cirrhotic liver. Scans find the cancer only once a tumour is visible, in [share] of patients too late to cure."
22. paragraph 34. "Hepatocellular carcinoma (HCC) mostly arises in a cirrhotic liver [1]"
    Replacement: "[share from 1] of hepatocellular carcinomas (HCC) arise in a cirrhotic liver [1]"
23. paragraph 34. "Imaging analysis mostly characterises the tumour [7]"
    Replacement: "[the specific claim, for example that radiomic studies of HCC analyse the tumour region] [7]"

== registers.md, "What the reader looks for" ==
In Medicine and Health, this reader looks for adherence to a reporting guideline, and the methods section names none.

24. paragraphs 40 to 43, the Approach section. No reporting guideline is named.
    Replacement: add one sentence to paragraph 40: "The study is reported following [the reporting guideline, for example TRIPOD for a prediction study]."

== rules.md, "Most specific term" ==
For an imaging reader, the general wording hides the method the draft uses.

25. paragraph 40. "diffusion scans at four strengths of sensitivity to water movement"
    Replacement: "diffusion-weighted sequences at four b-values"
26. paragraph 40. "a pair of T1 scans whose difference shows fat"
    Replacement: "in-phase and opposed-phase T1-weighted sequences, whose difference shows fat"
27. paragraph 40. "an organ map that outlines the liver"
    Replacement: "a liver segmentation mask"
28. paragraph 41. "We align each study to the patient's earlier studies so that the same point of the liver overlaps across scans [12]"
    Replacement: "Each study is registered deformably to the patient's earlier studies so that the same point of the liver overlaps across studies [12]"
29. paragraph 41. "the signal of every image point in every sequence at every scan date forms one three-way table"
    Replacement: "the signal of every voxel in every sequence at every study date forms one three-way tensor"
30. paragraph 41. "the alignment folds tissue onto itself or puts recognisable liver structures in the wrong place"
    Replacement: "the deformation folds tissue onto itself (a negative Jacobian determinant) or misplaces [the named liver landmarks, and the distance threshold]"
31. paragraph 41. "the signal loss caused by iron"
    Replacement: "[the named iron estimate computed from the in-phase and opposed-phase pair]"
32. paragraph 43. "with a correction for multiple testing"
    Replacement: "with [the named correction, for example Holm]"
33. paragraph 43. "Success means the future tumour segment ranks above these random relabellings."
    Replacement: "Success means the future tumour segment ranks above [the percentile] of these random relabellings."
34. paragraph 47. "rescaling each scan's signal to a common range"
    Replacement: "[the named intensity normalisation] of each study's signal"

== prose standard, 0. Hard rules, "No repeated construction" ==
Sentences repeated verbatim, and one recurring sentence shape, make the reader check whether the second statement differs from the first.

35. paragraphs 35, 41, 42, 43. The sentence shape "Success means ..." closes four paragraphs.
    Replacement: state each success criterion once, as the last part of its objective in paragraphs 37 to 39, and delete the "Success means ..." sentences in paragraphs 41, 42 and 43.
36. paragraph 35. "The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients)."
    Paragraph 42 repeats the definition of the tested study.
    Replacement: "The divergence score of the tested study (defined in C2) is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients)."
37. paragraph 42. "Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."
    Paragraph 35 has the same sentence.
    Replacement: delete
38. paragraph 48. "surveillance can warn within the curative window"
    Paragraph 35 has the same clause.
    Replacement: keep it in one place only, hedged as in finding 16.

== rules.md, "Paragraph point" ==
The two paragraphs that carry the case for the project open with background and state their point later.

39. paragraph 34. "Hepatocellular carcinoma (HCC) mostly arises in a cirrhotic liver [1], and imaging surveillance is meant to catch it while cure is still possible [2]."
    The point of the paragraph is the gap.
    Replacement first sentence: "Surveillance finds hepatocellular carcinoma (HCC) only once a tumour is visible, and how the background liver changes before diagnosis is rarely studied."
40. paragraph 48. "Imaging of the background liver already estimates HCC risk: elastography measures liver stiffness [13], and computer-extracted image features of the whole liver on a baseline MRI predict HCC development in cirrhosis [8]."
    Replacement first sentence: "What is new here is the within-patient, point-by-point trajectory of the background liver across serial MRI before diagnosis, read through interpretable components." The prior work follows this sentence.

== rules.md, "Clear antecedents" ==
Each pronoun below leaves the reader to guess its referent.

41. paragraph 40. "The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans."
    Replacement: "The analysis uses the sequences taken without contrast, so that it matches the shorter contrast-free MRI protocols proposed for surveillance [citation]."
42. paragraph 42. "estimates this scan-to-scan variation as pre-registered"
    Replacement: "estimates the study-to-study variation of stable never-HCC livers, which scales the divergence score, by [the pre-registered estimation method]"
43. paragraph 46. "established methods for such component summaries [9]"
    Replacement: "established tensor decomposition methods [9]"

== rules.md, "Explanation of evidence" ==
44. paragraph 40. "Studies are a median 7.9 months apart in patients who develop HCC and 11.9 months in never-HCC patients."
    The draft does not say what this difference means for the test.
    Replacement: add "The matching in C2 on the interval since the previous study accounts for this difference."

== rules.md, "Tense per section" ==
45. paragraph 34. "Molecular studies have shown that prognostic signal lies in the non-tumour tissue itself [6]."
    A reported finding takes the past tense, and one study is cited.
    Replacement: "Hoshida et al. found that prognostic signal lies in the non-tumour tissue itself [6]."

== registers.md, "Voice" ==
The authors are never referred to in the third person.

46. paragraph 31. "0,42 FTE of the applicant's own postdoctoral salary"
    Replacement: "0,42 FTE of my own postdoctoral salary"
47. paragraph 31. "The applicant's standing appointment covers the remaining time."
    Replacement: "My standing appointment covers the remaining time."
48. paragraph 35. "a surveillance cohort the applicant already holds"
    Replacement: "a surveillance cohort I already hold"
49. paragraph 46. "The applicant works at 0,42 FTE across all twelve months"
    Replacement: "I work at 0,42 FTE across all twelve months"
    Findings 46 to 49 use "I", and the rest of the draft uses "we". Which of the two the whole draft uses is the author's choice.

== prose standard, E. Sentence shapes, "Passive voice" ==
50. paragraph 31. "Computing is provided by the host institution at no cost, so none is requested."
    The actor is named, so the passive is not needed.
    Replacement: "The host institution provides computing at no cost, so none is requested."

== rules.md, "Formality" ==
51. paragraph 35. "so we can ask what the background liver was doing beforehand"
    This is colloquial.
    Replacement: "so we can measure how the background liver changed before diagnosis"
52. paragraph 41. "The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients, and the liver segments used in C3 and WP1 are the segments marked on this reference."
    The sentence carries two ideas.
    Replacement: "The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients. The liver segments used in C3 and WP1 are the segments marked on this reference."
53. paragraph 42. "A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible, and reassigning diagnosis dates at random between patients must remove the effect."
    The sentence carries two ideas.
    Replacement: "A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible. Reassigning diagnosis dates at random between patients must remove the effect."

== prose standard, D. Structure, "Paragraphs cover one idea and stay under roughly four sentences" ==
Each paragraph below runs past four sentences and covers more than one idea.

54. paragraph 31, 8 sentences.
    Replacement: split after "The applicant's standing appointment covers the remaining time." (personnel), then the non-personnel costs.
55. paragraph 34, 6 sentences.
    Replacement: split before "Field cancerisation, first described ...". The first paragraph covers the clinical problem, the second covers field cancerisation and the gap.
56. paragraph 35, 10 sentences.
    Replacement: split into four paragraphs: the hypothesis and tested study; the success criterion and supporting analysis; the scope ("The claim is predictive" to "Molecular confirmation lies outside this project."); the risk, the gain and the fit to the XS scheme.
57. paragraph 40, 8 sentences.
    Replacement: split before "Of the 925 studies". The first paragraph covers the cohort and sequences, the second covers usable studies and the confirmatory set.
58. paragraph 41, 8 sentences.
    Replacement: split before "Within the liver outline" (alignment, then components) and before "Before the pre-registration is deposited" (detection limit).
59. paragraph 42, 13 sentences.
    Replacement: split into five paragraphs: the score definition; the tested study and the LI-RADS exclusions; the matching, power and sensitivity analyses; the supporting within-patient model; the blinding, re-read, date reassignment and pre-registration.

== prose standard, D. Structure, "Three or more list-shaped items in paragraph form become a list" ==
60. paragraph 46. "Overlapping work packages: WP1 (mo 1-4) aligns the scans ...; WP2 (mo 3-8, primary) ...; WP3 (mo 7-11) ...; WP4 (mo 8-12) releases the atlas ..."
    Replacement: a list introduced by "Overlapping work packages:", one item per work package.
61. paragraph 47. "(i) Signal too small above cirrhotic variation: ... (ii) Severity: ... (iii) Scanner drift ...: ... (iv) Missed tumour, alignment error or selection by the alignment check: ..."
    Replacement: a list introduced by "Risks and mitigation:", one item per risk.

== prose standard, E. Sentence shapes, "Sentence length" ==
Each sentence below runs well past 20 words where the mechanism does not need the length.

62. paragraph 31. "The budget requests 0,42 FTE of the applicant's own postdoctoral salary across the full twelve months (UNL CAO table) to build the interpretable background-liver components, run the trajectory analysis, deliver the pre-registered primary endpoint and release the background-liver atlas."
    Replacement: "The budget requests 0,42 FTE of my postdoctoral salary for twelve months (UNL CAO table). This time builds the components, runs the confirmatory test and releases the atlas."
63. paragraph 41. "Within the liver outline from the organ map, the signal of every image point in every sequence at every scan date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1)."
    Replacement: "Within the liver mask, the signal of every voxel in every sequence at every study date forms one three-way tensor. The tensor is summarised as a few interpretable components [9-11]. Each component has three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1)."
64. paragraph 41. "Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients, runs the readout on them and records the smallest change it detects, expressed in the same standard-deviation units as the detectable effect of C2."
    Replacement: "Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size into all sequences of the stable study series of never-HCC patients. The steward computes the divergence score on them and records the smallest change it detects, which is the detection limit. The limit is expressed in the same standard-deviation units as the smallest detectable effect of C2."
65. paragraph 35. "The project fits the XS scheme as a pre-registered measurement on a surveillance cohort the applicant already holds, with the readout's sensitivity fixed in advance by inserting changes of known size into real liver scans."
    Replacement: "The project fits the XS scheme as a pre-registered measurement on a surveillance cohort I already hold. Its detection limit is fixed in advance by inserting changes of known size into real liver studies."

== prose standard, B. Punctuation, "ASCII throughout" ==
This group comes last. The break sits in the page header, which the reader of the proposal text barely notices.

66. paragraph 64 [word/header1.xml]. "Application Form <en dash> NWO Open Competition Domain Science <en dash> XS 2026"
    The en dash is not ASCII.
    Replacement: "Application Form, NWO Open Competition Domain Science, XS 2026". If the funder's form fixes this header text, it stays as the form has it.

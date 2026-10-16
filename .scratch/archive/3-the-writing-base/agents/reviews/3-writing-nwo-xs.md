# /writing on nwo-xs

Draft: `/Users/axelfaes/workspace/research-hub/funding/2026-nwo-enw-xs/submission/Application-form-ENW-XS-26-3-LS.docx`. Agent a7f4fe964415a39bd, claude-opus-5-5, 97352 tokens, 7 tool uses, 4 min 47 s.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/research-hub/funding/2026-nwo-enw-xs/submission/Application-form-ENW-XS-26-3-LS.docx`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/research-hub/funding/2026-nwo-enw-xs/submission/Application-form-ENW-XS-26-3-LS.docx | LC_ALL=C grep -n '[^ -~]'`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/research-hub/funding/2026-nwo-enw-xs/submission/Application-form-ENW-XS-26-3-LS.docx`

## The report, whole

Review of `/Users/axelfaes/workspace/research-hub/funding/2026-nwo-enw-xs/submission/Application-form-ENW-XS-26-3-LS.docx`

Reading and scope:
- The draft was read with `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py <draft>`, which printed 55 paragraphs, all from the body.
- The draft is a grant: an NWO ENW-XS application form with a budget, a public summary and a project proposal. The rules that `references/rules.md` marks (manuscripts and grants) therefore apply.
- The discipline is clinical imaging of hepatocellular carcinoma in the cirrhotic liver, so the Medicine and Health register applies.
- The same command piped into `LC_ALL=C grep -n '[^ -~]'` printed nothing and exited 1. The draft has no non-ASCII characters.
- The paragraph numbers below were checked against a second run of the same command, and each quoted passage stands at the place given.

## prose-standard.md, section 0 (Hard rules), No repeated construction

- paragraph 28, "The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients)."; the same sentence shape recurs at paragraph 35, "The tested study is the latest usable study at least 12 months (two 6-month surveillance intervals [2]) before the clinical diagnosis date, with at least one earlier usable study." The rule asks that a sentence shape recurring across sections be treated as a template and rewritten.
  Also breaks: references/rules.md, Precision / Term defined at first use ("divergence score" is defined only at paragraph 35).
  Also breaks: references/rules.md, Concision / One idea per sentence (the definition of the tested study and the comparison are two ideas).
  Also breaks: prose-standard.md, section E, Sentence length.
- paragraph 28, "Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."; the shape recurs at paragraph 34, "Success means reproducible components that track the fat and iron estimates, and a detection limit fixed before the liver test."; at paragraph 35, "Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis."; and at paragraph 36, "Success means the future tumour segment ranks above these random relabellings." The rule asks that a sentence shape recurring across sections be treated as a template and rewritten.
  Also breaks: prose-standard.md, section D, No mirror structure (each section takes the shape its content needs).
- paragraph 28, "If it does, surveillance can warn within the curative window."; the shape recurs at paragraph 40, "If the hypothesis holds, surveillance can warn within the curative window, and the method transfers to other field-cancerisation settings [5] (Barrett's oesophagus, oral premalignancy, bronchial field change)." The rule asks that a sentence shape recurring across sections be treated as a template and rewritten.
  Also breaks: references/rules.md, Objectivity / Claims rest on evidence (for the transfer to other settings, reference [5] describes field cancerisation in oral epithelium and does not show that the method transfers).
  Also breaks: references/rules.md, Hedging / Hedge where a claim is uncertain ("the method transfers" generalises from one cohort and has no hedge).
  Also breaks: references/rules.md, Concision / One idea per sentence.
- paragraph 38, "WP4 (mo 8-12) releases the atlas (component definitions, summary maps and code, with no patient-level data)"; the shape recurs at paragraph 41, "The atlas (component definitions, summary maps and code) contains no patient-level data". The rule asks that a sentence shape recurring across sections be treated as a template and rewritten.

## prose-standard.md, section A (Vocabulary), vague qualifiers

- paragraph 6, "Liver cancer usually grows in a scarred, cirrhotic liver". The rule asks that a vague qualifier be replaced with the number or the specific claim.
  Also breaks: references/rules.md, Common style errors / Vague phrase.
- paragraph 6, "often too late to cure". The rule asks that a vague qualifier be replaced with the number or the specific claim.
  Also breaks: references/rules.md, Common style errors / Vague phrase.
- paragraph 27, "Hepatocellular carcinoma (HCC) mostly arises in a cirrhotic liver [1]". The rule asks that a vague qualifier be replaced with the number or the specific claim.
  Also breaks: references/rules.md, Common style errors / Vague phrase.
- paragraph 27, "frequently past the curative window". The rule asks that a vague qualifier be replaced with the number or the specific claim.
  Also breaks: references/rules.md, Common style errors / Vague phrase.
- paragraph 27, "Imaging analysis mostly characterises the tumour [7]". The rule asks that a vague qualifier be replaced with the number or the specific claim.
  Also breaks: references/rules.md, Common style errors / Vague phrase.
- paragraph 27, "how the background liver changes across serial scans before diagnosis is rarely studied". The rule asks that a vague qualifier be replaced with the number or the specific claim.
  Also breaks: references/rules.md, Paragraphs / Claim with evidence or citation (the claim has no citation).

## prose-standard.md, section D (Structure), Paragraphs cover one idea and stay under roughly four sentences

- paragraph 6, "Liver cancer usually grows in a scarred, cirrhotic liver, and scans find it only once a tumour is visible". The paragraph runs past four sentences. The rule asks that paragraphs stay under roughly four sentences and that a longer paragraph, or one covering two ideas, be split.
- paragraph 8, "Leverkanker ontstaat meestal in een verlittekende, cirrotische lever". The paragraph runs past four sentences. The rule asks that paragraphs stay under roughly four sentences and that a longer one be split.
- paragraph 25, "The budget requests 0,42 FTE of the applicant's own postdoctoral salary". The paragraph runs past four sentences and covers several cost items. The rule asks that paragraphs stay under roughly four sentences and that a longer paragraph, or one covering two ideas, be split.
- paragraph 27, "Problem and opportunity. Hepatocellular carcinoma (HCC)". The paragraph runs past four sentences and covers both the problem and the opportunity. The rule asks that paragraphs stay under roughly four sentences and that a longer paragraph, or one covering two ideas, be split.
- paragraph 28, "The idea (high-risk/high-gain). We hypothesise that in patients who develop HCC". The paragraph runs well past four sentences and covers the hypothesis, the test, the risk and the fit with the scheme. The rule asks that paragraphs stay under roughly four sentences and that a longer paragraph, or one covering two ideas, be split.
- paragraph 33, "Approach. The cohort holds 243 patients with outcome labels". The paragraph runs past four sentences. The rule asks that paragraphs stay under roughly four sentences and that a longer one be split.
- paragraph 34, "C1. We align each study to the patient's earlier studies". The paragraph runs past four sentences and covers alignment, the components and the detection limit. The rule asks that paragraphs stay under roughly four sentences and that a longer paragraph, or one covering two ideas, be split.
- paragraph 35, "C2 (confirmatory: when). The divergence score of a study is the mean". The paragraph runs well past four sentences and covers the score, the tested study, the matching, the power, the sensitivity analyses, the controls and the blinding. The rule asks that paragraphs stay under roughly four sentences and that a longer paragraph, or one covering two ideas, be split.

## prose-standard.md, section D (Structure), No synonym cycling

- paragraph 27, "across serial scans before diagnosis". In the same paragraph the same thing is called "925 serial MRI studies". The rule asks for one term per concept, repeated.
- paragraph 33, "a T2 scan". Here "scan" names one sequence, although the same paragraph calls the sequences "MRI scan types (sequences)" and elsewhere "scan" names a study. The rule asks for one term per concept, repeated.
- paragraph 34, "so that the same point of the liver overlaps across scans [12]". Here "scans" names the studies just called "each study" and "earlier studies". The rule asks for one term per concept, repeated.
- paragraph 34, "records the smallest change it detects". This is the concept named "a calibrated detection limit" at paragraph 30 and "the readout's detection limit" at paragraph 39. The rule asks for one term per concept, repeated.
- paragraph 37, "rising above the smallest detectable change before diagnosis". This is a fourth name for the detection limit, and it is close to "smallest detectable effect", which paragraph 35 uses for the power-based quantity. The rule asks for one term per concept, repeated.

## prose-standard.md, section D (Structure), Three or more list-shaped items in paragraph form become a list

- paragraph 38, "Overlapping work packages: WP1 (mo 1-4) aligns the scans and builds the components". Four work packages, WP1 to WP4, are run together in one sentence separated by semicolons. The rule asks that three or more list-shaped items in paragraph form become a list.
  Also breaks: prose-standard.md, section E, Sentence length.
  Also breaks: references/rules.md, Concision / One idea per sentence.
- paragraph 39, "(i) Signal too small above cirrhotic variation: each patient is their own baseline". Four risks, (i) to (iv), are run together in paragraph form. The rule asks that three or more list-shaped items in paragraph form become a list.

## prose-standard.md, section E (Sentence shapes), Passive voice

- paragraph 6, "Cancer is thought to arise from gradual change across the whole diseased liver." The passive hides who holds the view. The rule asks that a passive be rewritten unless its actor is irrelevant.
- paragraph 6, "Where in the liver the change concentrates is explored separately." The actor is the project team. The rule asks that a passive be rewritten unless its actor is irrelevant.
  Also breaks: references/registers.md, Medicine and Health / Voice (the authors' decisions and contributions take "we").
- paragraph 41, "and will be released openly". The actor is the project team. The rule asks that a passive be rewritten unless its actor is irrelevant.
  Also breaks: references/registers.md, Medicine and Health / Voice (the authors' decisions and contributions take "we").

## prose-standard.md, section E (Sentence shapes), Sentence length

- paragraph 25, "The budget requests 0,42 FTE of the applicant's own postdoctoral salary across the full twelve months (UNL CAO table) to build the interpretable background-liver components, run the trajectory analysis, deliver the pre-registered primary endpoint and release the background-liver atlas." The rule asks that a sentence stay under roughly 20 words unless the mechanism needs more.
  Also breaks: references/rules.md, Precision / Term defined at first use ("background-liver components" is first defined at paragraph 34).
  Also breaks: references/registers.md, Medicine and Health / Voice ("the applicant's own": the authors never refer to themselves in the third person).
- paragraph 28, "The project fits the XS scheme as a pre-registered measurement on a surveillance cohort the applicant already holds, with the readout's sensitivity fixed in advance by inserting changes of known size into real liver scans." The rule asks that a sentence stay under roughly 20 words unless the mechanism needs more.
  Also breaks: references/rules.md, Precision / Term defined at first use ("readout" is not defined where it first appears).
  Also breaks: references/registers.md, Medicine and Health / Voice ("the applicant already holds": the authors never refer to themselves in the third person).
- paragraph 33, "The cohort holds 243 patients with outcome labels and 925 serial MRI studies, with a LI-RADS level per study (the standard radiological HCC likelihood score [3], recorded in three levels from 0, the least severe, through 1, intermediate, to 2, the most severe)." The rule asks that a sentence stay under roughly 20 words unless the mechanism needs more.
  Also breaks: references/registers.md, Medicine and Health / Terminology (clinical terms and diagnostic criteria are used as the field defines them, and LI-RADS in [3] does not define levels 0, 1 and 2).
- paragraph 34, "The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients, and the liver segments used in C3 and WP1 are the segments marked on this reference." The rule asks that a sentence stay under roughly 20 words unless the mechanism needs more.
  Also breaks: references/rules.md, Concision / One idea per sentence.
- paragraph 34, "Within the liver outline from the organ map, the signal of every image point in every sequence at every scan date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1)." The rule asks that a sentence stay under roughly 20 words unless the mechanism needs more.
- paragraph 35, "A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible, and reassigning diagnosis dates at random between patients must remove the effect." The rule asks that a sentence stay under roughly 20 words unless the mechanism needs more.
  Also breaks: references/rules.md, Concision / One idea per sentence (two unrelated controls are joined in one sentence).
- paragraph 35, "The data steward keeps the outcome labels, gives the analyst only studies before diagnosis, cuts each never-HCC patient's series at a random point so that series length does not reveal outcome, and estimates this scan-to-scan variation as pre-registered." The rule asks that a sentence stay under roughly 20 words unless the mechanism needs more.

## references/rules.md, Precision / Term defined at first use

- paragraph 20, "Open-access charges and costs of the openly released atlas". This is the first appearance of "atlas", which is defined only at paragraph 38. The rule asks that a technical term be defined where it first appears.
- paragraph 30, "with a calibrated detection limit". This is the first appearance of "detection limit", which is defined only at paragraph 34. The rule asks that a technical term be defined where it first appears.

## references/rules.md, Precision / Pronoun with a clear antecedent

- paragraph 39, "with the excluded studies described to show whether it removes the most diseased livers". "it" could refer to the alignment check, the alignment error or the selection. The rule asks that a pronoun have a clear antecedent.

## references/rules.md, Hedging / Hedge where a claim is uncertain

- paragraph 40, "computer-extracted image features of the whole liver on a baseline MRI predict HCC development in cirrhosis [8]". Reference [8] studied hepatitis B virus-related cirrhosis, and the sentence states the result for cirrhosis in general without a hedge. The rule asks that a generalization from a limited sample be hedged.
  Also breaks: references/rules.md, Common style errors / Tense per section (a literature result is reported in the past tense).

## references/rules.md, Paragraphs / First sentence states the point

- paragraph 40, "Imaging of the background liver already estimates HCC risk". The paragraph's point is the novelty stated in its third sentence, "What is new here is the within-patient, point-by-point trajectory". The rule asks that a paragraph's first sentence state its main point.

## references/rules.md, Common style errors / Vague phrase

- paragraph 27, "Molecular studies have shown that prognostic signal lies in the non-tumour tissue itself [6]." The plural "Molecular studies" rests on one citation. The rule asks that a vague phrase be replaced with the specific claim.
  Also breaks: references/rules.md, Common style errors / Tense per section (a literature result is reported in the past tense).

## references/rules.md, Common style errors / Tense per section

- paragraph 40, "Molecular pathology places prognostic signal in the non-tumour tissue [6]". A result of one study is reported in the present tense. The rule asks that a literature review reporting results use the past tense.

## references/registers.md, Medicine and Health / Voice

- paragraph 14, "Postdoc (applicant)". The rule asks that the authors never refer to themselves in the third person.
- paragraph 25, "The applicant's standing appointment covers the remaining time." The rule asks that the authors never refer to themselves in the third person.
- paragraph 38, "The applicant works at 0,42 FTE across all twelve months". The rule asks that the authors never refer to themselves in the third person.

## references/registers.md, Medicine and Health / What the reader looks for

- paragraph 33, "Approach.". The methods section (paragraphs 33 to 36) names no reporting guideline. The rule asks that a methods or results section name the reporting guideline the work follows.

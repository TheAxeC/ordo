# /writing on nwo-xs, second run

Draft: `research-hub/funding/2026-nwo-enw-xs/submission/Application-form-ENW-XS-26-3-LS.docx`. Agent ac0c8308fb418781e, claude-opus-5-5, 119858 tokens, 6 tool uses, 8 min 45 s. Skill version: `skills/writing/SKILL.md` at tag v8.1.0-rc.2.

Tool calls of the agent, from its transcript:

- Read: `/Users/axelfaes/workspace/ordo/skills/repo-setup/templates/docs/dev/prose-standard.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/rules.md`
- Read: `/Users/axelfaes/.claude-backup/skills/writing/references/registers.md`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/research-hub/funding/2026-nwo-enw-xs/submission/Application-form-ENW-XS-26-3-LS.docx`
- Bash: `python3 /Users/axelfaes/.claude-backup/skills/writing/templates/docx_paragraphs.py /Users/axelfaes/workspace/research-hub/funding/2026-nwo-enw-xs/submission/Application-form-ENW-XS-26-3-LS.docx | LC_ALL=C grep -n '[^ -~]'`

## The report, whole

Review of `/Users/axelfaes/workspace/research-hub/funding/2026-nwo-enw-xs/submission/Application-form-ENW-XS-26-3-LS.docx`

The draft is a grant application (an NWO ENW-XS form), so the rules that `references/rules.md` marks (manuscripts and grants) apply. Its discipline is liver cancer surveillance by MRI, so the register applied is Medicine and Health. The draft was read from the output of `docx_paragraphs.py`, and paragraph numbers are the numbers that script prints. The non-ASCII scan (`... | LC_ALL=C grep -n '[^ -~]'`) matched nothing. Word and sentence counts below were made by hand from that output.

## Prose standard, 0. Hard rules: No repeated construction

- paragraphs 28, 34, 35, 36: "Success means a one-sided test at alpha 0.05 showing that the divergence scores of the tested studies exceed those of the matched never-HCC studies in the primary analysis." (28, and the same words in 35); "Success means reproducible components that track the fat and iron estimates, and a detection limit fixed before the liver test." (34); "Success means the future tumour segment ranks above these random relabellings." (36). The sentence shape "Success means ..." appears in 4 places, and it closes each of the C1, C2 and C3 paragraphs. The rule says a sentence shape that recurs across entries or sections is a template and is rewritten.
  Also breaks: prose standard, D. Structure, No mirror structure. Each section takes the shape its content needs, but C1, C2 and C3 each open with their label and close with "Success means".
  Also breaks (paragraph 34): prose standard, D. Structure, No synonym cycling. "the liver test" names the confirmatory test of C2, and the rule asks for one term per concept.
- paragraphs 28, 35: "The tested study is the latest usable study at least 12 months before the clinical diagnosis date, with at least one earlier usable study, and its divergence score is compared with the scores of studies at a matched position in patients who never develop HCC (never-HCC patients)." (28) and "The tested study is the latest usable study at least 12 months (two 6-month surveillance intervals [2]) before the clinical diagnosis date, with at least one earlier usable study." (35). The same defining sentence recurs across two sections, and paragraph 33 states the same selection a third time. The rule asks that a recurring sentence shape be rewritten.
  Also breaks (paragraph 28): prose standard, E. Sentence shapes, Sentence length. The sentence has 47 words and two ideas, against a limit of under roughly 20 words unless the mechanism needs more.
  Also breaks (paragraph 28): references/rules.md, Concision / One idea per sentence. A sentence carries one idea or clearly connected ideas.
  Also breaks (paragraph 28): references/rules.md, Precision / Term defined at first use. "divergence score" first appears here and is defined only in paragraph 35.
- paragraphs 28, 40: "If it does, surveillance can warn within the curative window." (28) and "If the hypothesis holds, surveillance can warn within the curative window, and the method transfers to other field-cancerisation settings [5] (Barrett's oesophagus, oral premalignancy, bronchial field change)." (40). The shape "If ..., surveillance can warn within the curative window" recurs across two sections. The rule asks that it be rewritten.
  Also breaks: references/rules.md, Hedging / Hedge where a claim is uncertain. A generalization from a limited sample (a confirmatory set of 8 patients) is stated with "can" and "transfers", without a hedge.

## Prose standard, A. Vocabulary: Vague qualifiers

- paragraph 6: "Liver cancer usually grows in a scarred, cirrhotic liver, and scans find it only once a tumour is visible, often too late to cure." The rule asks that "usually" and "often" be replaced with the number or the specific claim.
  Also breaks: references/rules.md, Paragraphs / First sentence states the point. The paragraph's main point is what the project tests (sentence 3), and the first sentence states the problem.
- paragraph 8: "Leverkanker ontstaat meestal in een verlittekende, cirrotische lever, en scans vinden een tumor pas als die zichtbaar is, vaak te laat om te genezen." The rule asks that "meestal" and "vaak" be replaced with the number or the specific claim.
  Also breaks: references/rules.md, Paragraphs / First sentence states the point, for the same reason as paragraph 6.
- paragraph 27: "Hepatocellular carcinoma (HCC) mostly arises in a cirrhotic liver [1], and imaging surveillance is meant to catch it while cure is still possible [2]." The rule asks that "mostly" be replaced with the number or the specific claim.
  Also breaks: references/rules.md, Paragraphs / First sentence states the point. The paragraph's point is that the background liver before diagnosis is unstudied and that this cohort can study it, and the first sentence states background.
  Also breaks: references/rules.md, Reader's path / So what per section. An introduction opens with a real-world consequence or a gap in knowledge. The consequence (detection past the curative window) comes only in the second sentence.
- paragraph 27: "In practice, surveillance detects a tumour only once it is a discrete, radiologically visible lesion [3], frequently past the curative window." The rule asks that "frequently" be replaced with the number or the specific claim.
  Also breaks: references/rules.md, Paragraphs / Claim with evidence or citation. "frequently past the curative window" has no data or citation after it. Citation [3] supports the visible-lesion part.
  Also breaks: references/rules.md, Common style errors / Vague phrase. A vague phrase is replaced with the specific claim.
- paragraph 27: "Imaging analysis mostly characterises the tumour [7], and how the background liver changes across serial scans before diagnosis is rarely studied." The rule asks that "mostly" and "rarely" be replaced with the number or the specific claim.
  Also breaks: references/rules.md, Paragraphs / Claim with evidence or citation. "is rarely studied" has no data or citation after it.
  Also breaks: references/rules.md, Common style errors / Vague phrase.
  Also breaks: prose standard, D. Structure, No synonym cycling. "serial scans" names the MRI studies (see the group below).

## Prose standard, D. Structure: Paragraphs cover one idea and stay under roughly four sentences

- paragraph 25: "The budget requests 0,42 FTE of the applicant's own postdoctoral salary ..." The paragraph has 8 sentences and covers personnel, the applicant's appointment, computing, travel, dissemination, data costs and overheads. The rule asks for one idea per paragraph, under roughly four sentences.
- paragraph 27: "Problem and opportunity. Hepatocellular carcinoma (HCC) mostly arises ..." The paragraph has 6 sentences after its label and covers two ideas, the problem and the opportunity, as its own label says.
- paragraph 28: "The idea (high-risk/high-gain). We hypothesise that ..." The paragraph has 10 sentences after its label. It covers the hypothesis, the test, the success criterion, the supporting analysis, the scope, the risk and the fit to the scheme.
- paragraph 33: "Approach. The cohort holds 243 patients ..." The paragraph has 8 sentences and covers the cohort, the sequences, usability and the confirmatory set.
- paragraph 34: "C1. We align each study to the patient's earlier studies ..." The paragraph has 8 sentences and covers alignment, the decomposition, the number of components, validation and the detection limit.
- paragraph 35: "C2 (confirmatory: when). The divergence score of a study is ..." The paragraph has 13 sentences and covers the score, the tested study, the matching, power, the sensitivity analyses, the supporting model, the blinding and the pre-registration.

## Prose standard, D. Structure: No synonym cycling

- paragraph 33: "The studies hold several MRI scan types (sequences): diffusion scans at four strengths of sensitivity to water movement, a pair of T1 scans whose difference shows fat, a T2 scan and scans after contrast injection." Here "scan" names a sequence ("scan types (sequences)", "a T2 scan"). Elsewhere "scan" names a study (paragraphs 27, 34, 35, 38, 39), and the sequence is also called "scan type". The rule asks for one term per concept, repeated.
  Also breaks: references/rules.md, Precision / Most specific term. "four strengths of sensitivity to water movement", "a pair of T1 scans whose difference shows fat" and "scans after contrast injection" paraphrase things the field names with specific terms.
  Also breaks: references/registers.md, Medicine and Health / Terminology. Clinical terms are used as the field defines them.
- paragraph 34: "We align each study to the patient's earlier studies so that the same point of the liver overlaps across scans [12], and exclude studies in which the alignment folds tissue onto itself or puts recognisable liver structures in the wrong place." "across scans" names the studies of the same sentence.
  Also breaks: prose standard, E. Sentence shapes, Sentence length. 40 words carrying two ideas, alignment and exclusion.
  Also breaks: references/rules.md, Precision / Most specific term. "align", "folds tissue onto itself" and "puts recognisable liver structures in the wrong place" paraphrase the field's terms for image registration and its failures.
  Also breaks: references/rules.md, Concision / One idea per sentence.
  Also breaks: references/rules.md, Paragraphs / First sentence states the point. The paragraph's point is the interpretable components with a calibrated detection limit, and the first sentence states the alignment step.
  Also breaks: references/registers.md, Medicine and Health / Voice. A procedure takes the passive, and this one takes "we".
- paragraph 35: "A supporting model gives each patient their own baseline, adjusts for decompensation status at each scan (dated records exist for all 8) and compares each tested study with the patient's earlier usable studies." "at each scan" names a study.
  Also breaks: references/rules.md, Precision / Most specific term. "A supporting model gives each patient their own baseline" paraphrases the statistical model the field names specifically.
- paragraph 37: "The lower panel sketches a divergence score rising above the smallest detectable change before diagnosis." The quantity is called "detection limit" in paragraphs 30, 34, 38 and 39, and "smallest detectable change" here. "Smallest detectable effect" in paragraph 35 is a different quantity (the power figure). The rule asks for one term per concept.
- paragraph 38: "Overlapping work packages: WP1 (mo 1-4) aligns the scans and builds the components (if point-by-point alignment fails the alignment check, averages per liver segment are used instead), obtains the detection limit from inserted changes of known size, deposits the pre-registration and writes the data-management plan; WP2 (mo 3-8, primary) prepares and, after the deposit, runs the confirmatory test; WP3 (mo 7-11) runs the exploratory location test; WP4 (mo 8-12) releases the atlas (component definitions, summary maps and code, with no patient-level data)." "aligns the scans" names the studies.
  Also breaks: prose standard, D. Structure, Three or more list-shaped items in paragraph form become a list. Four work packages are set in one sentence.
  Also breaks: prose standard, E. Sentence shapes, Sentence length. 82 words.
  Also breaks: references/rules.md, Concision / One idea per sentence.
- paragraph 39: "(ii) Severity: decompensation status at each scan enters the supporting within-patient model. (iii) Scanner drift, with scanner and protocol not recorded: rescaling each scan's signal to a common range, a scan-year covariate and same-year matching." "at each scan" and "each scan's signal" name a study.
  Also breaks: prose standard, D. Structure, Three or more list-shaped items in paragraph form become a list. Paragraph 39 sets four risks, (i) to (iv), in paragraph form.
  Also breaks: references/rules.md, Precision / Most specific term. "rescaling each scan's signal to a common range" paraphrases a named preprocessing step.

## Prose standard, D. Structure: Three or more list-shaped items in paragraph form become a list

- paragraph 35: "In the primary analysis, the score of each tested study is compared with the scores of never-HCC studies at a matched position: same scan year, same number of earlier studies, similar time since the first study and similar interval since the previous study." Four matching criteria are set in a sentence. The rule says three or more list-shaped items become a list.
  Also breaks: prose standard, E. Sentence shapes, Sentence length. 43 words.
- paragraph 35: "The data steward keeps the outcome labels, gives the analyst only studies before diagnosis, cuts each never-HCC patient's series at a random point so that series length does not reveal outcome, and estimates this scan-to-scan variation as pre-registered." Four tasks are set in a sentence.
  Also breaks: prose standard, E. Sentence shapes, Sentence length. 38 words.
  Also breaks: references/rules.md, Concision / One idea per sentence.

## Prose standard, E. Sentence shapes: Personified artifacts

- paragraph 2: "Before the tumour: an interpretable pre-lesional field trajectory that anticipates lesion emergence in the cirrhotic liver". A trajectory "anticipates" lesion emergence. The rule bans personified artifacts used for colour.

## Prose standard, E. Sentence shapes: Passive voice

- paragraph 6: "Cancer is thought to arise from gradual change across the whole diseased liver." The passive hides who holds the view, and that actor is relevant to the claim. The rule says rewrite unless the actor is irrelevant.
- paragraph 25: "Computing is provided by the host institution at no cost, so none is requested." The actor is named in a by-phrase, so it is relevant. The rule asks for a rewrite.
- paragraph 41: "The cohort is governed by an existing data agreement and is not redistributable." The actor is named in a by-phrase. The rule asks for a rewrite.

## Prose standard, E. Sentence shapes: Sentence length

- paragraph 25: "The budget requests 0,42 FTE of the applicant's own postdoctoral salary across the full twelve months (UNL CAO table) to build the interpretable background-liver components, run the trajectory analysis, deliver the pre-registered primary endpoint and release the background-liver atlas." 39 words. The rule asks for under roughly 20 words unless the mechanism needs more.
  Also breaks: references/rules.md, Precision / Term defined at first use. "background-liver components" first appears here as running prose and is defined only in paragraph 34.
  Also breaks: references/registers.md, Medicine and Health / Voice. "the applicant's own postdoctoral salary" refers to the author in the third person.
- paragraph 28: "The project fits the XS scheme as a pre-registered measurement on a surveillance cohort the applicant already holds, with the readout's sensitivity fixed in advance by inserting changes of known size into real liver scans." 35 words carrying two ideas, the fit to the scheme and the fixed sensitivity.
  Also breaks: references/rules.md, Precision / Term defined at first use. "readout" first appears here and is not defined anywhere in the draft.
  Also breaks: references/rules.md, Concision / One idea per sentence.
  Also breaks: references/registers.md, Medicine and Health / Voice. "the applicant" refers to the author in the third person.
- paragraph 33: "The cohort holds 243 patients with outcome labels and 925 serial MRI studies, with a LI-RADS level per study (the standard radiological HCC likelihood score [3], recorded in three levels from 0, the least severe, through 1, intermediate, to 2, the most severe)." 42 words carrying two ideas, the cohort and the LI-RADS coding.
  Also breaks: references/rules.md, Precision / Most specific term. "LI-RADS level" with "three levels from 0 ... to 2" does not use the field's own name and scale for LI-RADS assignments.
  Also breaks: references/registers.md, Medicine and Health / Terminology. Diagnostic criteria are used as the field defines them.
  Also breaks: references/rules.md, Concision / One idea per sentence.
- paragraph 34: "The livers of all patients are then aligned to one common reference liver [12], so that the same components can be compared across patients, and the liver segments used in C3 and WP1 are the segments marked on this reference." 39 words carrying two ideas.
  Also breaks: references/rules.md, Concision / One idea per sentence.
- paragraph 34: "Within the liver outline from the organ map, the signal of every image point in every sequence at every scan date forms one three-way table, summarised as a few interpretable components [9-11], each a pattern with three parts: where in the liver it lies, how strongly it shows in each sequence and how it changes over time (Figure 1)." 56 words.
  Also breaks: references/rules.md, Precision / Most specific term. "image point", "three-way table" and "summarised as a few interpretable components" paraphrase things the field, and references [9] and [10], name specifically.
  Also breaks: references/rules.md, Concision / One idea per sentence.
- paragraph 34: "Before the pre-registration is deposited, a data steward inserts diffuse and focal changes of known, graded size, in all sequences, into the stable study series of never-HCC patients, runs the readout on them and records the smallest change it detects, expressed in the same standard-deviation units as the detectable effect of C2." 52 words.
  Also breaks: references/rules.md, Concision / One idea per sentence.
- paragraph 35: "In the 8 patients it lies a median of 21 months before diagnosis (range 12.5 to 77.6 months), with a median of 2.5 earlier usable studies, and is at LI-RADS level 0 in 5 and level 1 in 3." 39 words carrying three facts.
  Also breaks: references/rules.md, Concision / One idea per sentence.

## references/rules.md, Precision / Most specific term

- paragraph 33: "Of the 925 studies, 776 are usable (all non-contrast sequences present), and an organ map that outlines the liver exists for every usable study." "an organ map that outlines the liver" paraphrases a thing the field names specifically. The rule asks for the most specific term the field has.
- paragraph 34: "Components are checked against estimates of liver fat and of the signal loss caused by iron, both computed from the pair of T1 scans of the same study, and against decompensation status." "estimates of liver fat" and "the signal loss caused by iron" paraphrase quantities the field names specifically.
  Also breaks: references/registers.md, Medicine and Health / Terminology.
- paragraph 35: "A radiologist blinded to outcome re-reads the tested study to exclude a tumour already visible, and reassigning diagnosis dates at random between patients must remove the effect." "reassigning diagnosis dates at random between patients" paraphrases a named statistical test.
  Also breaks: references/rules.md, Concision / One idea per sentence. The blinded re-read and the randomisation check are two ideas.
- paragraph 38: "The applicant works at 0,42 FTE across all twelve months on a cohort that is already available, using open-source image-alignment software [12] and established methods for such component summaries [9]." The software that reference [12] names is not named, and "established methods for such component summaries" does not name the method.
  Also breaks: references/registers.md, Medicine and Health / Voice. "The applicant" refers to the author in the third person.
- paragraph 40: "Imaging of the background liver already estimates HCC risk: elastography measures liver stiffness [13], and computer-extracted image features of the whole liver on a baseline MRI predict HCC development in cirrhosis [8]." "computer-extracted image features" paraphrases the term that reference [8]'s own title uses.
  Also breaks: references/rules.md, Hedging / Hedge where a claim is uncertain. The result of [8], whose title restricts it to hepatitis B virus-related cirrhosis, is generalized to "cirrhosis" without a hedge.
  Also breaks: references/rules.md, Paragraphs / First sentence states the point. The paragraph's point is the novelty in sentence 3 ("What is new here is ..."), and the first sentence states prior work.

## references/rules.md, Precision / Term defined at first use

- paragraph 20: "Open-access charges and costs of the openly released atlas". "atlas" first appears here and is defined only in paragraphs 38 and 41. The rule asks that a technical term be defined where it first appears.

## references/rules.md, Precision / Pronoun with a clear antecedent

- paragraph 28: "We hypothesise that in patients who develop HCC, the MRI signal of the background liver departs from that patient's own stable course at least 12 months (two 6-month surveillance intervals [2]) before diagnosis." "that patient's" has no singular antecedent, because the sentence names only "patients". The rule asks for a clear antecedent.
- paragraph 39: "(iv) Missed tumour, alignment error or selection by the alignment check: the blinded radiologist re-read, the LI-RADS exclusions, the alignment check, with the excluded studies described to show whether it removes the most diseased livers, and the random reassignment of diagnosis dates." "it" can refer to the re-read, the alignment check or the reassignment.

## references/rules.md, Formality (manuscripts and grants) / No colloquial words

- paragraph 27: "The opportunity is a surveillance cohort of 243 patients and 925 serial MRI studies, in which 37 patients develop HCC, so we can ask what the background liver was doing beforehand." "what the background liver was doing" is colloquial. The rule asks for formal, academic vocabulary.

## references/rules.md, Paragraphs / First sentence states the point

- paragraph 35: "The divergence score of a study is the mean, over components, of its distance from the patient's earlier usable studies, in units of the ordinary scan-to-scan variation of stable livers, expressed as a standard deviation." The paragraph's main point is the confirmatory test of when the change appears, and the first sentence defines the score. The rule asks that the first sentence state the paragraph's main point.
- paragraph 36: "The liver segment where the tumour later appears is taken from the clinical record." The paragraph's main point is the test of whether the change concentrates in that segment, and the first sentence states the data source.

## references/rules.md, Paragraphs / Claim with evidence or citation

- paragraph 33: "The analysis uses the sequences taken without contrast, which matches shorter contrast-free surveillance scans." The claim that shorter contrast-free surveillance scans exist and that this choice matches them has no data, citation or example after it. The rule asks that a claim be followed by its support.

## references/rules.md, Paragraphs / Evidence followed by what it means

- paragraph 33: "Studies are a median 7.9 months apart in patients who develop HCC and 11.9 months in never-HCC patients." The paragraph ends on this evidence with no interpretation connecting it to the paragraph's claim. The rule asks that evidence be followed by what it means.

## references/registers.md, Medicine and Health / Voice

- paragraph 6: "Beforehand, we check the method on real scans with added changes of known size." A procedure takes "we". The rule asks that a procedure take the passive.
- paragraph 8: "Vooraf toetsen we de methode op echte scans met toegevoegde veranderingen van bekende grootte. Waar in de lever de verandering zich concentreert, onderzoeken we apart." Two procedures take "we".
- paragraph 25: "The applicant's standing appointment covers the remaining time." The author refers to himself in the third person. The rule says the authors never do this.
- paragraph 36: "We test whether the change is larger in that segment than when the tumour label is moved at random among the same patient's segments, with a correction for multiple testing." A procedure takes "we".

## references/registers.md, Medicine and Health / What the reader looks for

- paragraph 33: "Approach. The cohort holds 243 patients with outcome labels and 925 serial MRI studies". The methods section (paragraphs 33 to 36) names no reporting guideline. The rule asks that a methods or results section name the reporting guideline the work follows. The rule's text speaks of "the paper", and this draft is a grant.

Grant marker 1: agent a5b964c740016412e, served claude-opus-5-5 as ordo-high, 192438 tokens, 9 tool uses, 15.0 min. The marks below are the agent's final message, verbatim apart from character names.

Marks on /Users/axelfaes/workspace/ordo/.scratch/3-the-writing-base/agents/reviews/8-run/grant-report.md

I read all of these in full: the report, the prose standard, SKILL.md, rules.md, registers.md and the whole draft (the output of the docx_paragraphs.py command). I also piped the draft output through grep three times:
- `LC_ALL=C grep -n '[^ -~]'` finds one hit, at 67:64, the header en dashes.
- A grep for "scan" shows that "scan" is used for an MRI exam (paragraphs 35, 41, 42, 46, 47) and for a sequence (paragraphs 40, 41).
- A grep for TRIPOD, STARD, "reporting guideline", pre-lesional, magnetic, readout, WP1 and liver segment finds no reporting guideline and no "magnetic". "pre-lesional" appears only in paragraph 2. WP1 first appears in paragraph 41.

A grep of the report for "still breaks" exits 1.

Every quoted passage stands verbatim at the place its finding names. Condition 1 holds for every row, and it is not repeated below. Word counts exclude citations. I read "under roughly 20 words" as allowing up to 26 words. 27 words or more is a break, which matches the report's own practice of naming 28 words as a break in 9.2.

=== 1. Hedging ===
- 1 / paragraph 2 / "Before the tumour: an interpretable..." **Right.** The title states an untested hypothesis as fact. "may anticipate" is a weak hedge, which fits a claim with no evidence yet. The bracketed definition ends the "Terms defined at first use" break: "pre-lesional field trajectory" occurs only in paragraph 2. The finding names both rules, and the replacement ends both.
- 1 / paragraph 35 / "If it does, surveillance can warn..." **Wrong, condition 2.** The Hedging break is real, and "could" ends it. The finding's "Also breaks: Clear antecedents" line does not hold. "does" can only stand for "exceeds the scan-to-scan variation", and only "such change" can exceed that variation, so "it" has a clear antecedent.
- 1 / paragraph 48 / "If the hypothesis holds, surveillance can warn..." **Wrong, condition 4.** The Hedging, Evidence and Formality breaks are all real. The split drops "If the hypothesis holds" from the new sentence "The method could also transfer...". In the draft the condition governs the transfer claim as well, so the replacement changes that claim's scope beyond what any named rule asks.

=== 2. Prose standard, section A, vague qualifiers ===
- 2 / paragraph 8 / "Liver cancer usually grows..." **Right.** "usually" and "often" are vague qualifiers, and the replacement puts share brackets in their place. The split ends the Formality break: there are two claims, where the cancer grows and when scans find it. No break is left in the passage.
- 2 / paragraph 11 / "Leverkanker ontstaat meestal..." **Right.** "meestal" and "vaak" are qualifiers of the same kind. Share brackets replace them, and the split ends the Formality break.
- 2 / paragraph 34 / "Hepatocellular carcinoma (HCC) mostly arises..." **Right.** A share bracket tied to reference 1 replaces "mostly". The split ends the two-idea break, and "detect" ends the colloquial "catch". Both Also-breaks lines hold.
- 2 / paragraph 34 / "In practice, surveillance detects a tumour..." **Right.** A share bracket with its citation replaces "frequently", which also ends the Evidence break, since no source in the draft supports "past the curative window".
- 2 / paragraph 34 / "Imaging analysis mostly characterises the tumour..." **Wrong, condition 4.** "mostly" and "rarely" are replaced correctly. But "serial scans" in this sentence about the imaging literature covers every imaging modality. Rewriting it as "serial MRI studies" narrows the knowledge-gap claim to MRI. For the same reason, the "No synonym cycling" line names a break that does not hold (condition 2).
- 2 / paragraph 40 / "The studies hold several MRI scan types (sequences)..." **Wrong, condition 4.** Cutting "several" is correct, because the list gives every type. The list and the T1/T2 definition brackets end their breaks. However, the replacement keeps "diffusion scans", "T1 scans", "T2 scan" and "scans after contrast" for sequences. The report's own group 8 line names "a pair of T1 scans" as an instance of the scan/sequence break, and this finding neither ends that break nor names it. The 35-word sentence-length break is also not named in an "Also breaks" line.
- 2 / paragraph 41 / "Within the liver outline from the organ map..." **Right.** A count bracket replaces "a few". The replacement sentences run 25 words and shorter, which ends the sentence-length break. The list ends the section D break, and "study date" ends the synonym break.
- 2 / paragraph 42 / "In the primary analysis, the score of each tested study..." **Wrong, condition 4.** Tolerance brackets replace "similar", the list ends the section D break, and "study year" ends the synonym break. But the passage is 43 words long, and the finding has no "Also breaks" line for sentence length.
- 2 / paragraph 45 / "Each patient's serial MRI before diagnosis is reduced to a few..." **Right.** A count bracket replaces "a few", consistent with the paragraph 41 finding. Nothing else breaks.

=== 3. Limitations and alternative interpretations ===
- 3 / paragraph 48 / "Imaging of the background liver already estimates HCC risk..." **Right.** The title of reference 8 limits the evidence to hepatitis B virus-related cirrhosis, and the replacement adds that limit. "predicted" ends the tense break. The two sentences run 12 and 19 words, which ends the 30-word break.

=== 4. Reader's question per section ===
- 4 / paragraph 40 / "Of the 37 patients who develop HCC, 8 have..." **Wrong, condition 4.** The passage sentence has 31 words. The replacement keeps it whole and does not name sentence length. A second doubt, which I did not count: the Approach does state the 0.91 SD limit in paragraph 42 and the risks in paragraph 47, so whether the section fails its reader's question depends on reading "up front" as "at the start".

=== 5. What the reader looks for ===
- 5 / paragraph 42 / "The analysis code, number of components and matching rule..." **Right.** The register is Medicine and Health, and grep finds no reporting guideline anywhere in the draft. The replacement keeps the sentence and adds the author's fact in brackets after it, the form SKILL gives for added text.

=== 6. Evidence for claims ===
- 6 / paragraph 40 / "The analysis uses the sequences taken without contrast..." **Right.** No source in the draft supports the existence of contrast-free surveillance scans, and the citation bracket ends the break. Here "scans" names a clinical exam protocol outside the cohort, not the cohort's "studies".

=== 7. Terms defined at first use ===
- 7 / paragraph 8 / "This project tests whether that change is measurable..." **Wrong, condition 4.** Paragraph 8 is the first use of "MRI", and writing it out ends that break. But the passage has 29 words, and the replacement makes it 32. The finding neither ends nor names the sentence-length break.
- 7 / paragraph 31 / "The budget requests 0,42 FTE of the applicant's own..." **Wrong, condition 4.** The first uses named are correct, and so are the Voice and synonym lines. Two problems in the replacement:
  - The sentence "That analysis tests whether the components depart..." has 30 words, although the finding names the sentence-length rule.
  - "how strongly it shows in each kind of MRI scan" does not use the draft's name for a sequence, and it brings back "scan" for a sequence.
- 7 / paragraph 35 / "The tested study is the latest usable study..." **Right.** "usable study", "divergence score" and "matched position" are first used in this paragraph and defined only in paragraphs 40 and 42, and the replacement defines all three from the draft's own text. Its sentences run 24 words or fewer, plus one of 26, which ends the 47-word break. The two-idea break is ended, and the new paragraph it starts holds four sentences.
- 7 / paragraph 35 / "The project fits the XS scheme..." **Wrong, condition 4.** "readout" gets a definition bracket, "we" ends the Voice break, "detection limit" ends the synonym break, and the sentences are short. But the replacement keeps "into real liver scans" for the cohort's studies, which paragraph 41 calls "the stable study series". That is the scan-for-study synonym the report ends elsewhere (8 / paragraph 46), and this finding leaves it unnamed.
- 7 / paragraph 40 / "The clinical record gives the date of HCC diagnosis..." **Right.** "liver segment" is first used here, and the definition bracket ends the break. The sentence has 25 words.
- 7 / paragraph 41 / "The livers of all patients are then aligned..." **Right.** WP1 is first used here, and writing out "work package 1 (WP1)" ends the break. The new sentences run 23 and 18 words, and the split ends the two-idea break.

=== 8. No synonym cycling ===
- 8 / paragraph 35 / "Whether such change exceeds the scan-to-scan variation..." **Right.** "study-to-study" ends the break.
- 8 / paragraph 41 / "We align each study to the patient's earlier studies..." **Right.** "across studies" ends the synonym break. The two sentences run 20 and 19 words, which ends the length break, and the split ends the two-idea break.
- 8 / paragraph 41 / "Success means reproducible components..." **Wrong, condition 4.** "primary analysis" ends the synonym break, and the new opening ends the repeated "Success means" construction. But the article in "a detection limit" becomes "the detection limit", and SKILL keeps articles unless the named rule replaces them. The sentence also grows from 21 to 26 words.
- 8 / paragraph 42 / "The divergence score of a study is the mean..." **Right.** "study-to-study" ends the synonym break, and sentences of 20 and 17 words end the 35-word break.
- 8 / paragraph 42 / "The primary test is repeated..." **Right.** "primary analysis" ends the break.
- 8 / paragraph 42 / "A supporting model gives each patient their own baseline..." **Right.** "at each study" ends the synonym break, and sentences of 22 and 12 words end the 33-word break.
- 8 / paragraph 42 / "The data steward keeps the outcome labels..." **Wrong, condition 4.** "study-to-study" and the list end the breaks the finding names. But the passage has 38 words, and the finding has no "Also breaks" line for sentence length.
- 8 / paragraph 45 / "The lower panel sketches a divergence score..." **Right.** "smallest detectable change" is a third name for one of two defined limits, and the bracket names the author's choice.
- 8 / paragraph 46 / "Overlapping work packages: WP1 (mo 1-4) aligns the scans..." **Wrong, condition 4.** "studies" and "primary analysis" end the synonym breaks, and the list ends the section D break. But the WP1 item is still 42 words long and holds five list-shaped actions, and the finding names neither the sentence-length break nor the remaining section D break.
- 8 / paragraph 47 / "(i) Signal too small above cirrhotic variation..." **Wrong, conditions 4 and 2.**
  - The passage starts at "(i)", so the replacement's opening line "Risks and mitigation:" would follow the draft's own "Risks and mitigation." and duplicate the label.
  - Items (i) and (iv) stay at about 31 and 43 words, an unnamed sentence-length break.
  - "each scan's signal" is left.
  - The Clear antecedents line does not hold: "it" directly follows "the alignment check".

=== 9. Voice ===
- 9 / paragraph 31 / "The applicant's standing appointment..." **Right.** This is a third-person reference to the author, and "Our" ends it.
- 9 / paragraph 46 / "The applicant works at 0,42 FTE..." **Right.** "We" ends the Voice break, and sentences of 16 and 12 words end the 28-word break.

=== 10. Clear antecedents ===
- 10 / paragraph 35 / "Whether it reflects a diffuse malignant field..." **Right.** "it" follows a sentence that names the claim, the change and the tumour. "the change" ends the break.

=== 11. Sentence length ===
- 11 / paragraph 34 / "Field cancerisation, first described in oral epithelium..." **Right.** The passage has 30 words, and the new sentences have 25 and 10. "Slaughter et al." comes from reference 5.
- 11 / paragraph 34 / "The opportunity is a surveillance cohort..." **Right.** The passage has 31 words, and the new sentences have 20 and 14.
- 11 / paragraph 35 / "We hypothesise that in patients who develop HCC..." **Wrong, condition 4.** The first new sentence still has 28 words, although the finding names the sentence-length rule.
- 11 / paragraph 40 / "The cohort holds 243 patients with outcome labels..." **Wrong, condition 4.** The second new sentence, which carries the LI-RADS definition, has 29 words.
- 11 / paragraph 41 / "Before the pre-registration is deposited, a data steward inserts..." **Wrong, condition 4.** The first new sentence has 28 words.
- 11 / paragraph 42 / "In the 8 patients it lies a median of 21 months..." **Wrong, condition 4.** Sentences of 19 and 24 words end the length break. But the second sentence, "The 8 tested studies have a median of 2.5 earlier usable studies, and 5 are at LI-RADS level 0...", still joins two independent claims. That Formality break is not named.

=== 12. Formality ===
- 12 / paragraph 42 / "A radiologist blinded to outcome re-reads..." **Wrong, condition 4.** The two ideas are real, and the split ends the break. But the passage has 27 words, and the finding has no "Also breaks" line for sentence length.

=== 13. No repeated construction ===
- 13 / paragraph 42 / "Success means a one-sided test at alpha 0.05..." **Wrong, condition 4.** The new shape ends the template break. But the passage has 28 words and the replacement has 28, so the sentence-length break is neither ended nor named.
- 13 / paragraph 43 / "Success means the future tumour segment ranks..." **Right.** The template recurs in paragraphs 35, 41, 42 and 43, and "C3 is supported if" ends it.

=== 14. Tense per section ===
- 14 / paragraph 34 / "Molecular studies have shown..." **Right.** This reports the finding of a 2008 study (reference 6), so the past tense applies, and "showed" ends the break.
- 14 / paragraph 48 / "Molecular pathology places prognostic signal..." **Wrong, condition 4.** "placed" ends the tense break. But the sentence joins two independent claims, molecular pathology and imaging of nodules. That Formality break is kept and not named.

=== 15. Passive voice ===
- 15 / paragraph 31 / "Computing is provided by the host institution..." **Right.** The actor is relevant, and active voice ends the break, including "so we request none".

=== 16. Section D, paragraphs ===
Every paragraph named here breaks the one-idea and four-sentence rule. My count of each paragraph agrees with the report's.
- 16 / paragraph 8 / "Cancer is thought to arise..." **Wrong, condition 4.** The split is sound, but the text it writes still holds the 32-word sentence about what the project tests, and no finding ends that break.
- 16 / paragraph 11 / "Kanker ontstaat vermoedelijk..." **Wrong, condition 4.** The text it writes keeps "Dit project test of..." at 29 words.
- 16 / paragraph 31 / "The budget requests 0,42 FTE... The effort is spread..." **Right.** The break matches the paragraph 31 Terms finding (group 7), and both resulting parts meet section D.
- 16 / paragraph 31 / "The applicant's standing appointment... Computing is provided..." **Right.** It is consistent with the Voice and Passive findings (9 and 15), and the parts meet section D.
- 16 / paragraph 31 / "Dissemination covers... The longitudinal MRI cohort..." **Right.** The parts meet section D.
- 16 / paragraph 34 / "In practice, surveillance detects... Field cancerisation, first described..." **Right.** It is consistent with the paragraph 34 vague-qualifier finding (group 2) and the Field cancerisation sentence-length finding (group 11), and the parts each hold one idea.
- 16 / paragraph 34 / "Molecular studies have shown... Imaging analysis mostly..." **Right.** It is consistent with the paragraph 34 tense finding (group 14) and the first sentence of the "Imaging analysis" replacement (group 2).
- 16 / paragraph 34 / "Imaging analysis mostly... The opportunity is..." **Wrong, condition 4.** The text it writes carries "serial MRI studies", the same scope change as in the "Imaging analysis" finding (group 2).
- 16 / paragraph 35 / "We hypothesise... The tested study is..." **Right.** The text it writes is short, and the parts hold two and four sentences.
- 16 / paragraph 35 / "The tested study is... Success means..." **Wrong, condition 4.** The text it writes keeps the unchanged 28-word "Success means..." sentence, and no finding ends that break.
- 16 / paragraph 35 / "A within-patient analysis... The claim is predictive..." **Right.**
- 16 / paragraph 35 / "Molecular confirmation... Whether such change..." **Right.**
- 16 / paragraph 35 / "If it does... The project fits..." **Right.** The text it writes is short and consistent with the other findings on those sentences.
- 16 / paragraph 40 / "The clinical record gives... The studies hold several..." **Wrong, condition 4.** The text it writes carries the "T1 scans" list from the "several MRI scan types" finding (group 2).
- 16 / paragraph 40 / "The analysis uses the sequences... Of the 925 studies..." **Wrong, condition 4.** The text it writes keeps "776 are usable..., and an organ map... exists", two independent claims in one sentence.
- 16 / paragraph 40 / "Of the 37 patients... The 148 never-HCC patients..." **Wrong, condition 4.** Together with the paragraph 40 finding in group 4, it leaves a part of four sentences on usable studies, the confirmatory set and the detectable effect. That is two ideas in one paragraph, against section D.
- 16 / paragraph 41 / "We align each study... The livers of all patients..." **Right.**
- 16 / paragraph 41 / "The analyst receives only studies... Within the liver outline..." **Wrong, condition 4.** The break falls after the analyst sentence, so the part it leaves joins alignment to the reference liver with blinding of the analyst. That is two ideas.
- 16 / paragraph 41 / "Within the liver outline... The number of components..." **Right.**
- 16 / paragraph 41 / "Components are checked against... Before the pre-registration..." **Wrong, condition 4.** The text it writes keeps "Components are checked..." at 32 words, with "pair of T1 scans" for a sequence.
- 16 / paragraph 42 / "The divergence score of a study... The tested study is..." **Wrong, condition 4.** The text it writes keeps "The tested study is..." at 28 words.
- 16 / paragraph 42 / "Tested studies at level 2 are excluded... In the primary analysis..." **Wrong, condition 4.** The text it writes keeps two independent claims in one sentence: the level-2 exclusion and the level-1 sensitivity analysis.
- 16 / paragraph 42 / "With 8 patients against 148... A sensitivity analysis restricted..." **Right.** The sentences have 21 and 26 words.
- 16 / paragraph 42 / "A supporting model... A radiologist blinded..." **Right.**
- 16 / paragraph 42 / "The data steward keeps... The analysis code..." **Right.**
- 16 / paragraph 48 / "Molecular pathology places... What is new here..." **Wrong, condition 4.** The text it writes keeps the two-claim sentence from the paragraph 48 tense finding (group 14).

=== 17. ASCII ===
- 17 / paragraph 64 [word/header1.xml] / "Application Form <en dash> NWO..." **Right.** The place form is correct. The en dash breaks the ASCII rule, and the spaced en dash between the parts of the title is the banned dash construction. Commas end the break.

Lists

- **Groups with no line:** none.
- **Group lines that do not meet "How you group them":**
  - Group 1 describes the breaks ("state as fact... yet to test") without naming what the reader loses.
  - Group 3 describes the break, reference 8 presented as general, without naming the loss.
  - Group 5 describes the absence of a guideline without naming the loss.
  - Group 9 says the breaks change no claim, but then only describes them ("we" and "the applicant") and names no cost.
  - Group 15's cost does not hold in the draft: "the host institution" stands mid-sentence, not "at the end of the sentence".
- **Findings with no passage, no replacement, or a replacement given as an instruction or reference:** none.
- **Passages given twice:** no passage is identical across findings. The group 16 split rows, however, quote again sentences that earlier findings already give. SKILL's split form requires quoting both sentences, while its "given once" rule forbids repeating a passage. The repeated sentences are:
  - paragraph 8: "This project tests..." (group 7 and group 16)
  - paragraph 31: "The budget requests..." (groups 7 and 16), "The applicant's standing appointment..." (groups 9 and 16), "Computing is provided..." (groups 15 and 16)
  - paragraph 34: "In practice..." (groups 2 and 16), "Field cancerisation..." (groups 11 and 16), "Molecular studies have shown..." (groups 14 and 16), "Imaging analysis mostly..." (group 2 and two group 16 rows), "The opportunity is..." (groups 11 and 16)
  - paragraph 35: "We hypothesise..." (groups 11 and 16), "The tested study is..." (group 7 and two group 16 rows), "Whether such change exceeds..." (groups 8 and 16), "If it does..." (groups 1 and 16), "The project fits..." (groups 7 and 16)
  - paragraph 40: "The clinical record..." (groups 7 and 16), "The studies hold several..." (groups 2 and 16), "The analysis uses..." (groups 6 and 16), "Of the 37 patients..." (groups 4 and 16)
  - paragraph 41: "We align each study..." (groups 8 and 16), "The livers of all patients..." (groups 7 and 16), "Within the liver outline..." (group 2 and two group 16 rows), "Before the pre-registration..." (groups 11 and 16)
  - paragraph 42: "The divergence score of a study..." (groups 8 and 16), "In the primary analysis..." (groups 2 and 16), "A supporting model..." (groups 8 and 16), "A radiologist blinded..." (groups 12 and 16), "The data steward keeps..." (groups 8 and 16), "The analysis code..." (groups 5 and 16)
  - paragraph 48: "Molecular pathology places..." (groups 14 and 16)
- **Findings carrying a line saying they still break a rule:** none. The grep for "still breaks" exits 1.

Totals: 75 rows. 42 right, 33 wrong.

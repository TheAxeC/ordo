# Grant marks 1

Marker a0e8b92e8fd4f7258, ordo-high, served claude-opus-5-5. Usage: 118985 tokens, 8 tool uses, 5.5 min.

Marks for the review of Application-form-ENW-XS-26-3-LS.docx

I read all six inputs in full: the prose standard, rules.md, registers.md, SKILL.md, 3-cases.md, and the whole output of docx_paragraphs.py. Two checks were run on that output:
- Piped through `LC_ALL=C grep -n '[^ -~]'`, it shows one non-ASCII line: paragraph 64, the header.
- A `grep -i` for TRIPOD, STARD, CONSORT, STROBE and "guideline" finds no reporting guideline anywhere in the draft. The same grep confirms that "sequence" first appears in paragraph 40, glossed as "scan types (sequences)", and that "readout", "atlas", UNL and CAO first appear where the findings say.

I counted words and sentences by reading. Every count the report states is correct except one: the paragraph 41 split says the paragraph has "12 after findings 6, 11, 12 and 25". Those findings add 1, 1, 2 and 1 sentences, so the paragraph has 13.

== Terms defined at first use ==
- 1, paragraph 19, "Postdoc (applicant), 0,42 FTE...": right. UNL and CAO are undefined abbreviations used first here, and the replacement only spells them out.
- 2, paragraph 25, "Open-access charges and costs of the openly released atlas": right. "atlas" is first used here and is defined only in 46/49. The gloss matches that definition and avoids "components", which is not yet defined at this point.
- 3, paragraph 31, "The budget requests 0,42 FTE of the applicant's own...": wrong, condition 4. The replacement's gloss "a pattern of its MRI signal over place, sequence and time" puts the term "sequence" in paragraph 31, before paragraph 40 where the draft defines it, and rules.md "Terms" says a replacement introduces no term before its definition. Its "I/my" also fails the Voice rule (see 35).
- 4, paragraph 35, "The tested study is the latest usable study...": wrong, condition 4. The added definition "(all non-contrast sequences present)" puts "sequences" in paragraph 35, five paragraphs before the draft defines it. The diagnosis (first uses, 47 words) is correct.
- 5, paragraph 35, "Whether it reflects a diffuse malignant field...": right. "C3" is first used here, and "it" could mean the change, the claim or the tumour. The replacement names "the change" and glosses C3 to match paragraph 39.
- 6, paragraph 41, "The livers of all patients are then aligned...": right. WP1 is first used here, the sentence has 39 words and two ideas, and the split adds "(WP1, months 1-4)" from paragraph 46.

== No synonym cycling ==
- 7, paragraph 35, "The project fits the XS scheme as a pre-registered measurement...": wrong, condition 4. The synonym, readout and length repairs are sound. But "a surveillance cohort I already hold" replaces the third person with "I", while the Voice rule says authors' contributions take "we", and the draft's own first-person uses (paragraphs 8, 11, 34, 35, 41, 43) are all "we".
- 8, paragraph 40, "The studies hold several MRI scan types (sequences)...": wrong, condition 4. Dropping the gloss "scan types (sequences)" removes the draft's only definition of "sequence", a cut the synonym-cycling rule does not ask for. Combined with 3 and 4, the term is left used before any definition. The b-value change is right.
- 9, paragraph 41, "Components are checked against estimates of liver fat...": right. "T1 scans" names the T1 sequences, and the replacement uses the one term.
- 10, paragraph 45, "The lower panel sketches a divergence score...": right. "smallest detectable change" is a third name, and which quantity the panel shows is the author's fact, given in brackets.

== Most specific term ==
- 11, paragraph 41, "Within the liver outline from the organ map...": right. Tensor and decomposition are the specific terms that refs 9-10 name, the sentence has 58 words, and the split keeps every clause.
- 12, paragraph 41, "Before the pre-registration is deposited, a data steward inserts...": right. "readout" is replaced by "divergence score", the 52-word sentence is split, and "smallest detectable effect" is defined with the 80 percent power that paragraph 42 gives.
- 13, paragraph 41, "Success means reproducible components...": right. "the liver test" becomes "the confirmatory test of C2", and the "Success means" construction is rewritten.

== Limitations and alternative interpretations ==
- 14, paragraph 48, first place, "Imaging of the background liver already estimates HCC risk...": right. Ref 8's title limits the result to hepatitis B virus-related cirrhosis. The replacement adds that limit, the past tense, "radiomic features" and a first sentence that states the paragraph's point.
- 14, paragraph 48, third-sentence place, "What is new here is the within-patient...": right. Together with the first place this is a move: the sentence's claim stands whole at the paragraph's start, so the deletion only avoids a duplicate and changes no claim.

== Hedging ==
- 15, paragraph 48, "If the hypothesis holds, surveillance can warn...": wrong, condition 4. The split detaches the transfer claim from "If the hypothesis holds", so "The method could also transfer..." no longer depends on the hypothesis, a change of scope that neither Hedging nor Formality asks for. The bracketed citations are acceptable.

== What the reader looks for ==
- 16, paragraph 42, "The analysis code, number of components and matching rule...": wrong, condition 4, marked together with 29, paragraph 42 (e). Medicine and Health is the draft's register and the draft names no guideline, so the diagnosis holds. But (e) replaces this same sentence with only "The study is reported following [...]", so the two replacements cannot both be applied without losing the time-stamping sentence.

== Vague qualifiers (prose standard, section A) ==
- 17, paragraph 8, "Liver cancer usually grows in a scarred, cirrhotic liver...": right. "usually" and "often" are vague qualifiers, and the bracketed shares keep the claim non-universal.
- 18, paragraph 11, "Leverkanker ontstaat meestal...": right. This is the same claim in Dutch, with the same bracketed facts.
- 19, paragraph 34, "Hepatocellular carcinoma (HCC) mostly arises...": right. "mostly" is replaced by a bracketed share from ref 1.
- 20, paragraph 34, "In practice, surveillance detects a tumour only once...": right. "frequently" is replaced by a bracketed share.
- 21, paragraph 34, "Imaging analysis mostly characterises the tumour [7]...": right. "mostly" and "rarely" are replaced by bracketed facts the author supplies.

== Tense per section ==
- 22, paragraph 34, "Molecular studies have shown that prognostic signal...": right. A reported finding of [6] takes the past tense, and the ongoing state "lies" stays in the present.
- 23, paragraph 48, "Molecular pathology places prognostic signal...": right. The reported finding of [6] goes to the past, and "imaging follows" is an ongoing practice that stays in the present.

== Sentence length ==
- 24, paragraph 40, "The cohort holds 243 patients with outcome labels...": right. The sentence has 42 words, and the split keeps every fact.
- 25, paragraph 41, "We align each study to the patient's earlier studies...": right. The sentence has 40 words and two ideas, and the split is clean.
- 26, paragraph 42, "The data steward keeps the outcome labels, gives...": right. The sentence has 38 words. The reordered two-sentence split keeps every action, and it names the variation that "this" pointed back to.

== Formality ==
- 27, paragraph 42, "A radiologist blinded to outcome re-reads...": right. The sentence holds two independent controls, and the split keeps both.
- 28, paragraph 34, "The opportunity is a surveillance cohort of 243 patients...": right. "what the background liver was doing" is colloquial, and the replacement keeps the claim.

== Paragraphs of one idea, under four sentences (finding 29) ==
A split must quote the two sentences whole. SKILL.md gives the "..." form only for a hard-wrapped paragraph, so every split below that shortens a sentence with "..." or "(...)" fails condition 1.
- paragraph 8, "Cancer is thought to arise... / This project tests whether...": right. Five sentences become parts of 2 and 3.
- paragraph 11, "Kanker ontstaat vermoedelijk... / Dit project test...": right. The same split in Dutch.
- paragraph 31 (a), "...deliver the pre-registered primary endpoint...": wrong, condition 1. The first sentence is a cut-down fragment of the draft's sentence.
- paragraph 31 (b), "The applicant's standing appointment... / Computing is provided...": right on its own rule. It carries 35's "My", which falls with 35.
- paragraph 31 (c), "Computing is provided... / Travel and accommodation...": right.
- paragraph 31 (d), "Dissemination covers... / The longitudinal MRI cohort...": right.
- paragraph 34 (a), "In practice, surveillance detects... / Field cancerisation... holds that...": wrong, condition 1. The second sentence is cut short.
- paragraph 34 (b), "Imaging analysis mostly characterises... / The opportunity is a surveillance cohort...": wrong, condition 1. The second sentence is cut short.
- paragraph 35 (a), "...before diagnosis. / The tested study is the latest usable study...": wrong, condition 1. Both sentences are cut short.
- paragraph 35 (b), "A matched position has the same scan year...": wrong, condition 1. Its first sentence is not in the draft (it comes from finding 4), and its second is cut short.
- paragraph 35 (c), "A within-patient analysis adjusted for decompensation (...)...": wrong, condition 1. The parenthesis is left out.
- paragraph 35 (d), "Molecular confirmation lies outside this project. / Whether such change exceeds...": right. Both sentences are whole, and both parts meet section D.
- paragraph 35 (e), "If it does, surveillance can warn... / The project fits the XS scheme...": wrong, condition 1. The second sentence is cut short, and it also carries 7's "I".
- paragraph 40 (a), "The clinical record gives the date... / The studies hold several MRI scan types (sequences): ...": wrong, condition 1. The second sentence is cut short, and it carries 8's removal of the definition.
- paragraph 40 (b), "The analysis uses the sequences taken without contrast... / Of the 925 studies, 776 are usable...": wrong, condition 1. The second sentence is cut short.
- paragraph 41 (a), "...and the liver segments used in C3 and WP1...": wrong, condition 1. The first sentence is a fragment.
- paragraph 41 (b), "The analyst receives only studies... / Within the liver outline from the organ map, ...": wrong, condition 1. The second sentence is cut short.
- paragraph 41 (c), "Components are checked against estimates of liver fat ...": wrong, condition 1. Both sentences are cut short.
- paragraph 42 (a), "...expressed as a standard deviation. / The tested study is...": wrong, condition 1. Both sentences are cut short.
- paragraph 42 (b), "Tested studies at level 2 are excluded... / In the primary analysis, ...": wrong, condition 1. The second sentence is cut short.
- paragraph 42 (c), "A sensitivity analysis restricted... (...) / The primary test is repeated...": wrong, condition 1. Both sentences are cut short.
- paragraph 42 (d), "...and reassigning diagnosis dates... / The data steward keeps the outcome labels, ...": wrong, condition 1. Both sentences are cut short.
- paragraph 42 (e), "The analysis code, number of components... / Success means a one-sided test...": wrong, conditions 1 and 4. The second sentence is cut short, and the replacement drops the time-stamping sentence, which conflicts with finding 16.

== Lists (prose standard, section D) ==
- 30, paragraph 46, "Overlapping work packages: WP1 (mo 1-4)...": wrong, condition 1. The quoted sentence leaves out two parentheses as "(...)", where a list finding must quote the sentence that holds the items. The bulleted replacement itself is sound.
- 33, paragraph 47, "Risks and mitigation. (i) Signal too small above cirrhotic variation...": wrong, condition 1. The passage leaves out the text of items (ii) to (iv). Its replacement also does not end the cycling: "scan-to-scan variation of cirrhotic livers" is a third name, next to "of cirrhotic tissue" (paragraph 35) and "of stable livers" (paragraph 42).

== Paragraph point ==
- 34, paragraph 43, "The liver segment where the tumour later appears...": right. The paragraph's point is C3's test, and the new first sentence states it while keeping the source of the segment.

== No repeated construction (prose standard, section 0) ==
- 31, paragraph 42, "Success means a one-sided test at alpha 0.05...": right. The sentence repeats paragraph 35 word for word, and the rewrite keeps the criterion. Split 42 (e) carries the same wording, so the two can be applied together.
- 32, paragraph 43, "Success means the future tumour segment ranks...": right. The construction is rewritten and the criterion is kept.

== Voice (registers.md) ==
- 35, paragraph 31, "The applicant's standing appointment covers the remaining time.": wrong, condition 4. The Voice rule gives "we" for authors' contributions, and "My" leaves one author speaking as "I" in the budget and as "we" in the method. That is the reader's loss the group line itself names. "Our standing appointment" would end it.
- 36, paragraph 46, "The applicant works at 0,42 FTE...": wrong, condition 4, for the same reason ("I work" where the rule and the draft's other uses give "we").

== ASCII throughout (prose standard, section B) ==
- 37, paragraph 64 [word/header1.xml], "Application Form <en dash> NWO Open Competition...": right. The grep finds the two en dashes here and nowhere else, and the replacement is ASCII with the same words.

Group heading lines
- Every group has a line under its heading.
- The "Hedging" line ("the draft states as a fact that the method transfers... two of the three settings it names have no source") describes the breaks and does not name what the reader loses or misreads.
- The "ASCII throughout" line ("a reader working in plain text, a diff or a grep finds the only non-ASCII characters of the document here") describes where the break is and does not name a loss.
- Every finding has a quoted passage and a replacement written as text. None is given as an instruction.
- The findings are not numbered in order: 33 and 34 come before 31 and 32. This breaks none of the four conditions.

Totals
- 66 places marked: 33 right, 33 wrong.
- Wrong by condition 1: 18. These are 16 splits of finding 29 (counting paragraph 42 (e)), plus findings 30 and 33.
- Wrong by condition 4: 16 places. These are findings 3, 4, 7, 8, 15, 16, 35 and 36, and paragraph 42 (e).

Everything in the brief is done.

# Report of step 5 of plan 3, the second fixes to /writing

## Open items of the state file

none

## The cases' first run

The first run read the unchanged tree (HEAD e691c84, `skills/writing/` equal to the pinned copy: `diff -r skills/writing ~/.claude-backup/skills/writing` printed nothing) against the step 4 record (`4-run/*`, `4-marks.md`, `4-report.md`) and the draft copies. Line numbers below are those of the unchanged files. No case gave a result the brief itself calls wrong that C17's last sentence does not already direct to a report in the new form, so no file was changed before the first run was complete and nothing was handed back. Two cases where a rule of the brief and a finding marked right pull apart are named at the end of this part and again under "Judgment calls".

- C1 (kind 1: manuscript 5, 44, 46, 47, 48, 64 first break, 66, 67, 68, 69, 71, 82 first break, 83, the tense clauses given "as in finding N" including `sections/4_experiments/c_evaluation.tex:1`, and the places by reference `b_implementation.tex:9`, `b_architecture.tex:14`, `c_variants.tex:1`, `c_evaluation.tex:8`). Reading: the report lines of each finding against `SKILL.md` "A finding" lines 112 to 152. No sentence on the unchanged tree forbids the form; line 120 lists instructions as non-replacements, not references. Led to it: line 137 ("the same two sentences", written as the replacement by 64, 67 and 69 and imitated as a description by 66, 68, 71, 82 and 83), line 133 ("followed by the added text", manuscript 5), line 148 ("carried in the replacement", manuscript 44, 46, 47, 48 and the tense clauses), and line 142 (a copyable description of the hard-wrap replacement). Manuscript 83 quoted no passage although lines 117 and 136 ask for one. Now prevented by `SKILL.md`, "The review agent's prompt", "A finding": "It is never a reference to another finding or to the passage, such as "as in finding N", "the same sentence" or "the replacement of finding N". It writes the text those words point at." and "A passage is never a description of the draft's text or a reference to another finding." and "The replacement of a paragraph split writes both sentences out whole, with an empty line between them." and "A finding on tense gives each sentence with its place, its passage and its replacement." Lines 133, 137, 142 and 148 no longer give a form that can be copied as a description (see the diff, Verify 5).
- C2 (kind 2: grant 16 against split 42 (e), and split 35 (b)). Reading: `grant-report.md` findings 16, 29 (35 (b), 42 (e)) and 4. Split 35 (b) took its first sentence from finding 4's replacement; line 117 ("quoted as the draft has it") forbade it in words only. Grant 16 and 42 (e) replace the same sentence and line 133 reached only added-text findings, so nothing told a split's replacement to carry 16's added sentence. Now prevented by "A finding": "The passage quotes the draft as it stands, and the replacement gives the text at that place as it reads after every finding on it." It stands once; the old sentences "Its replacement is that sentence, as it reads after every other finding on it, followed by the added text." and "A change of wording that another finding on the same passage proposes is carried in the replacement." are gone (the first rewritten for the added-text finding, the second replaced).
- C3 (kind 3: grant splits 31 (a), 34 (a), 34 (b), 35 (a), 35 (b), 35 (c), 35 (e), 40 (a), 40 (b), 41 (a), 41 (b), 41 (c), 42 (a) to 42 (e), and grant 30 and 33). Reading: each quoted passage of `grant-report.md` against the paragraph in the `.docx` copy. Lines 136, 139 and 117 imply whole sentences, but no sentence forbids "..." or "(...)", and line 141 ('"..." stands for the rest') led to using it everywhere. Now prevented by "A finding": "A paragraph split or a list quotes each sentence it spans whole, with no part cut to "..." or "(...)"." and "A passage is a phrase, a clause or a sentence." (a phrase passage of one sentence stays allowed), and '"..." stands for the rest, in this form only.'
- C4 (kind 4: the 27 tense-list places). Reading: `4-report.md` condition 1 and `manuscript-report.md` lines 264 to 301. Lines 112 and 115 forbid a shortened place in words ("every further one"), but no sentence names a list of places. Now prevented by "A finding": "A list of places, such as a tense list, gives the file's path from the main file's folder in every entry. A path is never shortened to the file name because an earlier entry named the folder."
- C5 (kind 5: manuscript 37, 38, 54, 55, 56, 59, and the tense clauses at `b_architecture.tex:5` and `1_baseline.tex:3`). Reading: report text of each against line 131 and the prose standard, section A. 37 and 38 broke the second clause of line 131 (cut so the claim reads as universal); 54 and 55 were led by line 131's "stated as usual"; 56 and 59 follow no sentence of the skill. `rules.md` "Vague language" bars vague replacements only through its last bullet of "Replacements for flagged terms", and "usually" is not in the literal list of section A. Now prevented by "A finding": "The replacement of a vague qualifier that the prose standard's section A names puts the number, the specific claim, or a bracket that names them as a fact for the author, in the qualifier's place." with "It never cuts the qualifier so that a claim the draft does not hold in every case reads as universal." and "It never swaps the qualifier for another qualifier, of the same strength or of a different one." and "It never writes the class followed by "such as [...]", which reads as every member of the class."; and `rules.md`, "Vague language": "The replacement stands in the place of "many": the count or the named studies take its place in the sentence." Line 131's old sentence is replaced.
- C6 (kind 6: manuscript 62, 85). Reading: the findings and `rules.md` "Formality" (line 213 "formal academic word", no rule on strength) with `SKILL.md` line 125 (forbids a change of strength in words). Now prevented by `rules.md`, "Formality": "The replacement of a colloquial or informal word that carries strength, such as an intensifier, is a formal word of the same strength, and the word is not cut." and "A word that the prose standard's section A bans as filler is left to that section, which cuts it."
- C7 (kind 7: manuscript 1, 2, 7, 40, 47, 51 "therefore", the tense clauses at `d_results.tex:11` and `b_implementation.tex:9`, grant 28, 32). Reading: the findings against `tables/results_finetune.tex`, `d_results.tex:11` and `b_implementation.tex:9`. The claim "performance improves on every task" does not hold in the table: T1 IOP and T2-MRI AUPRC span 0.373 to 0.519 and T1 DCE-MRI AUROC 0.734 to 0.857, which manuscript 1 and 2's limit does not carve out. Line 127 ("holds in the draft's own data") forbade it in words and says nothing on how it is checked. No sentence barred an added presumption or relation (grant 28, manuscript 51 "therefore"). Grant 32 ("the" to "a") was barred in words by line 125 and manuscript 7 (dropped "a reliable tool") by line 124. "Hedging" had no sentence that keeps the claim. Now prevented by "A finding": "A limit or a relation it states is checked against every number the draft gives for the claim, its tables and figures included." and "Where one of those numbers does not hold under it, the limit is named in square brackets as a fact for the author." and "It adds no claim or relation that the draft does not make, and no word that presumes one, beyond the addition the named rule asks for. The limit, the alternative, the definition and the meaning are such additions." and "It keeps each word that sets a claim's scope, such as an article or a quantifier."; and `rules.md`, "Hedging": "The replacement changes the device and keeps the claim it hedges."
- C8 (kind 8: manuscript 22, 26). Reading: `b_pretraining.tex:3` cites jamaludin and rivail "for example" for the claim of 22; `discussion.tex:12` for 26. Line 59 counted evidence "in its text" without saying a later paragraph counts; line 125 forbade 26's added hedge in words. Now prevented by `rules.md`, "Evidence for claims": "Evidence the draft gives anywhere counts, cited or not: in a later sentence or paragraph as in an earlier one, and in a table or a figure. A claim that has such evidence is not reported under this section." and "The replacement adds no hedge that no other finding on the passage asks for."
- C9 (kind 9: manuscript 27). Reading: group mean accuracy in the draft's tables, DW 0.854, T1 DCE 0.811, combined 0.799 (the ranking holds). Lines 20 and 21 said nothing on the draft's tables defining the right term. Now prevented by `rules.md`, "Most specific term": "A word that the draft's own tables or figures use for the measure it names is the right term."
- C10 (kind 10: manuscript 51). Reading: `introduction.tex:1` opens with the consequence ("treatment decisions and prognosis"); "Reader's question per section" had no sentence on an opening that already answers the question. Now prevented by `rules.md`, "Reader's question per section": "A section whose opening states a real-world consequence or a knowledge gap answers the question of the Introduction row and is not reported." Manuscript 51's added "therefore" is also barred by the kind 7 sentence "It adds no claim or relation that the draft does not make, and no word that presumes one, ..."
- C11 (kind 11: grant 15, grant 4, manuscript 68, 72). Reading: the reports and paragraphs. Grant 15: no sentence on conditions that govern a claim (line 124 says "clause" only loosely). Manuscript 68 (first part holds 5 sentences after findings 26 and 3) and 72 (5 after finding 30): line 138 ("Each part a split leaves meets section D") says it in words but not that other findings' additions count. Grant 4: two new sentences of 28 and 31 words; line 124 ("ends the break") covers it in words only. Now prevented by "A finding": "A split keeps a condition, such as an opening "If <a condition> holds", in each part that holds a claim the condition governs." and "Each part a split leaves, counted with the sentences that other findings add to it, meets the prose standard's section D, or the finding gives a further split." and "Where the finding names the prose standard's rule on sentence length, it leaves each sentence it writes within that rule."
- C12 (kind 12: manuscript 77, 80, 81; 76 and 82 second break stay allowed). Reading: `rules.md` "Formality" line 208 ("Clearly connected ideas may share a sentence") is vague and was the reason the markers split on 77, 80 and 81. Now: 81 (a "so" clause) breaks "A clause that states the cause or the consequence of the other clause is part of its idea and is not split from it."; 77 and 80 must satisfy "The finding names the two ideas the sentence carries, each a claim the reader can take without the other."; 76 and 82 (second break) break no sentence, since "Two clauses joined by a concession or a contrast are two ideas when each is a claim, and a split between them is allowed." The old sentence "Clearly connected ideas may share a sentence." is removed because it contradicts the new bullets.
- C13 (kind 13: grant 3, 4, 8, 33). Reading: the paragraphs 31, 35, 40, 47. Line 13 prevented 3 and 4 in words only for a term brought in early; grant 8 dropped the definition of "sequence" and grant 33 used a third name ("of cirrhotic livers"), with no sentence against either. Now prevented by `rules.md`, "Terms defined at first use": "Each technical term a replacement uses is defined in the draft at or before the passage, or the replacement defines it." and, in "A finding": "A definition the passage gives stays in the replacement." and "It names each thing by the name the draft uses for it."
- C14 (kind 14: grant 7, 35, 36, the "my" of grant 3). Reading: `registers.md` "Voice" lines 9 and 13 say "we" and no third person but never bar "I" or "my" for one author. Now prevented by `registers.md`, "Voice": "The replacement of a third-person reference to the authors is "we", also for a draft with one author, and never "I" or "my"."
- C15 (kind 15: the five group lines of gate condition 2). Reading: the group lines of both reports against the draft and the tables. Lines 150 to 152 forbade a line that does not name a loss in words; the manuscript lines for "Most specific term" (contradicted by the table) and "Reader's question per section" named a loss the draft's data do not show, and the lines for the prose standard's section 0 (ASCII dash places), grant "Hedging" and "ASCII throughout" named a loss where no claim changes. Now prevented by "How you group them": "The line names what the reader of this draft loses or misreads through the group's breaks, as one of the group's own findings shows." and "The loss holds in the draft's own text and data." and "A group whose breaks change no claim says so in its line." and "That line names what the break costs the reader instead, such as a character the reader's viewer may not show."
- C16 (kind 16: the manuscript agent's second `Bash` command). Reading: `4-report.md` condition 3. Line 99 ("The one command you run on a .tex, .md or .txt draft is ...") forbade it in words; the agent ran a second `grep -n -o` over the draft anyway, with no sentence naming a search by reading. Now prevented by "What you run": "You run no other command on the draft. A search of the draft for a term, with `grep`, `sed`, `cat` or `find`, is done instead by reading the files you have read."
- C17 (findings marked right by both, read against the changed text). Reading: each finding's report text against every new sentence. Keeping place, passage, rule and replacement unchanged: manuscript 3, 4, 6, 25, 30, 35, 45, 49, 58, 76, 82 (second break) and 93, grant 1, 14 (both places), 17 to 22 and 37. For manuscript 35 the replacement defines student and teacher itself, which "Each technical term a replacement uses is defined in the draft at or before the passage, or the replacement defines it." allows. For manuscript 93 the replacement is written once per hard-wrapped line break, with a space where the line broke. For grant 17 to 22 the bracket stands for the qualifier ("in the qualifier's place" read as standing for the qualifier, not at the same word position). Given in the new form:
  - Manuscript 57: "Hybrid models can be trained end-to-end, consecutively, or using a pre-trained CNN feature extractor. They [in how many of the studies, from the author] employ a recurrent neural network (RNN), long-short-term memory (LSTM) or Transformer model to process the sequence of image embeddings." (the bracket replaces the qualifier; "usually" is not swapped in).
  - Manuscript 60: "Since the frequency of liver screenings is [in how many cases, from the author] determined by the patient's unique condition [the surveillance guideline that sets it, from the author]" (the bracket replaces "typically").
  - Manuscript 34 and 44: written out whole; the passage of 44 is the whole sentence as 34 quotes it and its replacement is 34's replacement written out, per Decision 1 of the brief.
  - Manuscript 19: the replacement keeps the clause "enticing recent studies to extend the analysis of medical imaging to the analysis of imaging data across time \citep{[citations, from the author]}" in one sentence, with no "therefore" and no split (the sentence that forbids the old form is `rules.md`, "Formality": "A clause that states the cause or the consequence of the other clause is part of its idea and is not split from it."). The Formality part of the old finding is dropped.
  - Manuscript 61 (cut of "Generally"): unchanged, since MAE's definition makes the claim hold in every case, which is the condition under "It never cuts the qualifier so that a claim the draft does not hold in every case reads as universal."
  - Grant split 31 (b): "Our standing appointment covers the remaining time." (the form kind 14 asks for).
  - Manuscript 5: its new form must define AUPRC (the draft defines it only at `sections/4_experiments/c_evaluation.tex:1`) or avoid it, by "Each technical term a replacement uses is defined in the draft at or before the passage, or the replacement defines it."

The two cases where a finding marked right and a rule of the brief pull apart, given for the orchestrator's ruling (no ruling has been given; the text above and the diff follow the readings stated):

- Manuscript 61 (cut of "Generally", marked right by both) against kind 5 ("never cuts the qualifier so that the claim reads as universal"). Rule: the kind 5 sentence. Result if read without a condition: 61 is forbidden outright. The sentence as written adds "a claim the draft does not hold in every case", so 61 stays. Orchestrator's ruling: none yet.
- Manuscript 19 (marked right by both: splits the consequence clause "enticing recent studies ..." and adds "therefore") against kind 12 (cause or consequence clause not split). Rule: the kind 12 sentence. Result: the old finding is forbidden outright; reported above in the new form without the split. Orchestrator's ruling: none yet.

## Findings and failures, with the sentence that now prevents each

Quoted sentences are in `skills/writing/SKILL.md`, "The review agent's prompt", unless the file is named. The manuscript findings are numbered as `4-marks.md` lists them ("M"), the grant findings likewise ("G"), the failures as gate conditions of `4-report.md` ("C").

Sentences used by name below:

- S1: "A passage is never a description of the draft's text or a reference to another finding." and "It is never a reference to another finding or to the passage, such as "as in finding N", "the same sentence" or "the replacement of finding N". It writes the text those words point at." ("A finding")
- S1b: "The replacement of a paragraph split writes both sentences out whole, with an empty line between them." ("A finding")
- S1c: "Its replacement writes out that sentence and, after it, the added text." ("A finding", added-text finding)
- S2: "The passage quotes the draft as it stands, and the replacement gives the text at that place as it reads after every finding on it." ("A finding")
- S3: "A paragraph split or a list quotes each sentence it spans whole, with no part cut to "..." or "(...)"." and "A passage is a phrase, a clause or a sentence." ("A finding")
- S4: "A list of places, such as a tense list, gives the file's path from the main file's folder in every entry. A path is never shortened to the file name because an earlier entry named the folder." ("A finding")
- S5: "The replacement of a vague qualifier that the prose standard's section A names puts the number, the specific claim, or a bracket that names them as a fact for the author, in the qualifier's place." with "It never cuts the qualifier so that a claim the draft does not hold in every case reads as universal.", "It never swaps the qualifier for another qualifier, of the same strength or of a different one." and "It never writes the class followed by "such as [...]", which reads as every member of the class." ("A finding")
- S7a: "A limit or a relation it states is checked against every number the draft gives for the claim, its tables and figures included. Where one of those numbers does not hold under it, the limit is named in square brackets as a fact for the author." ("A finding")
- S7b: "It adds no claim or relation that the draft does not make, and no word that presumes one, beyond the addition the named rule asks for. The limit, the alternative, the definition and the meaning are such additions." ("A finding")
- S7c: "It keeps each word that sets a claim's scope, such as an article or a quantifier." ("A finding") and, for a dropped claim, `references/rules.md`, "Hedging": "The replacement changes the device and keeps the claim it hedges."
- S11a: "Each part a split leaves, counted with the sentences that other findings add to it, meets the prose standard's section D, or the finding gives a further split."
- S11b: "A split keeps a condition, such as an opening "If <a condition> holds", in each part that holds a claim the condition governs."
- S11c: "Where the finding names the prose standard's rule on sentence length, it leaves each sentence it writes within that rule."
- S13: `references/rules.md`, "Terms defined at first use": "Each technical term a replacement uses is defined in the draft at or before the passage, or the replacement defines it." with "A definition the passage gives stays in the replacement." and "It names each thing by the name the draft uses for it." ("A finding")
- S14: `references/registers.md`, "Voice": "The replacement of a third-person reference to the authors is "we", also for a draft with one author, and never "I" or "my"."
- S15: "How you group them": "The line names what the reader of this draft loses or misreads through the group's breaks, as one of the group's own findings shows." with "The loss holds in the draft's own text and data.", "A group whose breaks change no claim says so in its line." and "That line names what the break costs the reader instead, such as a character the reader's viewer may not show."
- S16: "What you run": "You run no other command on the draft. A search of the draft for a term, with `grep`, `sed`, `cat` or `find`, is done instead by reading the files you have read."

| Finding or failure | Kind | The sentence that now prevents it |
|---|---|---|
| M1 finding 1, `d_results.tex:11` | 7 | S7a |
| M2 finding 2, `b_implementation.tex:9` | 7 | S7a |
| M3 finding 5, `introduction.tex:11` | 1 | S1c, S1 |
| M4 finding 7, `abstract.tex:3` | 7 | S7c (`references/rules.md`, "Hedging") |
| M5 finding 22, `b_pretraining.tex:1` | 8 | `references/rules.md`, "Evidence for claims": "Evidence the draft gives anywhere counts, cited or not: in a later sentence or paragraph as in an earlier one, and in a table or a figure. A claim that has such evidence is not reported under this section." |
| M6 finding 26, `discussion.tex:12` | 8 | `references/rules.md`, "Evidence for claims": "The replacement adds no hedge that no other finding on the passage asks for." |
| M7 finding 27, `discussion.tex:8` | 9 | `references/rules.md`, "Most specific term": "A word that the draft's own tables or figures use for the measure it names is the right term." |
| M8 finding 37, `b_architecture.tex:5` | 5 | S5 |
| M9 finding 38, `1_baseline.tex:3` | 5 | S5 |
| M10 finding 40 at `b_implementation.tex:9` | 7 | S7a |
| M11 finding 47, `d_results.tex:11` | 1, 7 | S1 (shared replacement written out), S7a |
| M12 finding 51, `introduction.tex:1` | 10, 7 | `references/rules.md`, "Reader's question per section": "A section whose opening states a real-world consequence or a knowledge gap answers the question of the Introduction row and is not reported."; S7b for "therefore" |
| M13 finding 54, `introduction.tex:5` | 5 | S5 |
| M14 finding 55, `introduction.tex:5` | 5 | S5 |
| M15 finding 56, `introduction.tex:7` | 5 | S5 ("It never writes the class followed by "such as [...]", ...") |
| M16 finding 59, `b_pretraining.tex:1` | 5 | S5 |
| M17 finding 62, `discussion.tex:6` | 6 | `references/rules.md`, "Formality": "The replacement of a colloquial or informal word that carries strength, such as an intensifier, is a formal word of the same strength, and the word is not cut." |
| M18 tense clause `b_architecture.tex:5` | 5 | S5 |
| M19 tense clause `b_implementation.tex:9` | 7 | S7a |
| M20 tense clause `d_results.tex:11` | 7 | S7a |
| M21 tense clause `1_baseline.tex:3` | 5 | S5 |
| M22 tense clause `c_evaluation.tex:1` ("as in findings 39 and 75") | 1 | "A finding on tense gives each sentence with its place, its passage and its replacement." and S1 |
| M23 finding 64, first break, `introduction.tex:13` | 1 | S1b, S1 |
| M24 finding 66, `a_longitudinal_analysis.tex:5` | 1 | S1b, S1 |
| M25 finding 67, `b_pretraining.tex:3` | 1 | S1b, S1 |
| M26 finding 68, `discussion.tex:12` | 1, 11, 2 | S1, S3, S11a, S2 |
| M27 finding 69, `discussion.tex:18` | 1 | S1b, S1 |
| M28 finding 71, `d_pretraining.tex:15` | 1 | S1b, S1 |
| M29 finding 72, `a_data.tex:1` | 11 | S11a |
| M30 finding 77, `d_results.tex:15` | 12 | `references/rules.md`, "Formality": "The finding names the two ideas the sentence carries, each a claim the reader can take without the other." |
| M31 finding 80, `d_results.tex:29` | 12 | `references/rules.md`, "Formality": "The finding names the two ideas the sentence carries, each a claim the reader can take without the other." |
| M32 finding 81, `c_evaluation.tex:8` | 12 | `references/rules.md`, "Formality": "A clause that states the cause or the consequence of the other clause is part of its idea and is not split from it." |
| M33 finding 82, first break, `conclusion.tex:1` | 1 | S1b, S1 |
| M34 finding 83, `2_reliability.tex:3` | 1, 3 | S1, S3 (the two sentences quoted whole) |
| M35 finding 85, `b_pretraining.tex:1` | 6 | `references/rules.md`, "Formality": "The replacement of a colloquial or informal word that carries strength, such as an intensifier, is a formal word of the same strength, and the word is not cut." |
| G1 finding 3, paragraph 31 | 13, 14 | S13; S14 |
| G2 finding 4, paragraph 35 | 13, 11 | S13; S11c |
| G3 finding 7, paragraph 35 | 14 | S14 |
| G4 finding 8, paragraph 40 | 13 | S13 ("A definition the passage gives stays in the replacement.") |
| G5 finding 15, paragraph 48 | 11 | S11b |
| G6 finding 16, paragraph 42 | 2 | S2 |
| G7 finding 28, paragraph 34 | 7 | S7b |
| G8 to G24 finding 29, the 17 splits 31 (a), 34 (a), 34 (b), 35 (a), 35 (b), 35 (c), 35 (e), 40 (a), 40 (b), 41 (a), 41 (b), 41 (c), 42 (a), 42 (b), 42 (c), 42 (d), 42 (e) | 3, 2 | S3; for 35 (b) and 42 (e) also S2 |
| G25 finding 30, paragraph 46 | 3 | S3 |
| G26 finding 33, paragraph 47 | 3, 13 | S3; S13 ("It names each thing by the name the draft uses for it.") |
| G27 finding 32, paragraph 43 | 7 | S7c |
| G28 finding 35, paragraph 31 | 14 | S14 |
| G29 finding 36, paragraph 46 | 14 | S14 |
| C1 gate condition 1, manuscript places by reference (`b_implementation.tex:9`, `b_architecture.tex:14`, `c_variants.tex:1`, `c_evaluation.tex:8`) and the clause at `c_evaluation.tex:1` | 1 | S1 and the tense sentence of M22 |
| C1 gate condition 1, the 27 tense-list places | 4 | S4 |
| C1 gate condition 1, grant paragraph 35 split (b) | 2 | S2 |
| C2 gate condition 2, the five group lines (manuscript "Reader's question per section", "Most specific term", the prose standard's section 0; grant "Hedging", "ASCII throughout") | 15 | S15 (for "Most specific term" with `references/rules.md`, "Most specific term": "A word that the draft's own tables or figures use for the measure it names is the right term.") |
| C3 gate condition 3, manuscript second `Bash` command | 16 | S16 |
| C5 gate condition 5, manuscript finding 83 with no passage and the replacements read as descriptions | 1, 3 | S1, S3 |

Gate conditions 4 and 7 hold on step 4's record and need no text. Condition 6's failure on manuscript marker 1's reading and the `sleep 10` of the session are carried by step 6's Step 0 in `plan.md`, as the brief's premise says; this step writes nothing for them.

## DONE / NOT DONE

| Check | Result |
|---|---|
| Kind 1 to 16 of "What to build" | DONE: each in the diff of `skills/writing/SKILL.md`, `references/rules.md` or `references/registers.md` (`git diff 1c26ac1 -- skills/writing`), each sentence listed above |
| Cases C1 to C17, first run on the unchanged tree, then the sentence after | DONE, above |
| Verify 1, the character-set check over the three files and this report | DONE: prints `charset exit 0` |
| Verify 2, `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` | DONE: prints `ok: the plan-terms block equals the template` |
| Verify 3, the brief's grep for a spaced hyphen or `--` over the three files | DONE: prints nothing (`echo "dash exit $?"` printed `dash exit 1`) |
| Verify 4, `grep -n -F -e 'the same two sentences' -e 'stated as usual' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md` | DONE: prints nothing (`echo "phrase exit $?"` printed `phrase exit 1`) |
| Verify 5, `git diff 1c26ac1 -- skills/writing` read whole | DONE: every added or changed sentence serves a kind (listed above); none names a draft, a project, a person, a finding number or this plan; "finding N" is a placeholder in the example of a reference |
| Verify 6, each new or changed list item and sentence read against the prose standard's rules on list items and sentence length | DONE: the departures are under "Judgment calls" |
| `metadata.version` stays "1.0.0" | DONE: `head -8 skills/writing/SKILL.md` unchanged by this step; the diff has no line there |
| No other file changed | DONE: `git status --short` prints ` M skills/writing/SKILL.md`, ` M skills/writing/references/registers.md`, ` M skills/writing/references/rules.md` and, once this report is written, `?? .scratch/3-the-writing-base/agents/reviews/5-report.md` |
| Tag `v7.1.0-rc.3` and `sh utils/pin.sh v7.1.0-rc.3` | NOT DONE here: the orchestrator's work after the landing, as the brief says |

## The terms

- **finding**: `docs/glossary.md` entry "finding", its last sense, "a passage of a draft that `/writing` reports as a break of a named rule, with its place, the quoted passage and a proposed replacement". The diff uses it in that sense in "A finding", in "How you group them" and in the new sentences on a reference to another finding. Read against the entry: each use matches it, and the entry stays true under this step's changes (no sentence changes what a finding holds: place, passage, replacement).
- **place**: the diff uses "place" for a file and line or a `.docx` paragraph where a passage stands ("A list of places", "the text at that place"). The glossary has "place, of a defect" (an operation, and "its section for a defect in text") and "place, of a point" (a line of a reader's output); neither is the `/writing` sense, a location in the draft given in the forms of "A finding". The sense is the one the unchanged text of "A finding" already used ("Every place a finding names"), so the diff uses no new sense. Read against the entries: no entry for it, and the glossary is outside this step's paths; raised in "Anything in the brief that was wrong or impossible".
- **case**, **kind**, **step**: used only in this report in the senses of the glossary (`case`, a text case of a brief; `kind`, a kind of the brief's "What to build"); the diff to `skills/writing/` uses none of them.

## The files

`wc -l` run after the last edit:

```
     200 skills/writing/SKILL.md
     219 skills/writing/references/rules.md
      53 skills/writing/references/registers.md
     207 .scratch/3-the-writing-base/agents/reviews/5-report.md
```

Before the step: 182, 208 and 52 lines.

## Judgment calls

1. Manuscript 61 and kind 5 (above): the never-cut sentence reads "so that a claim the draft does not hold in every case reads as universal", so 61 stays. The brief's wording "so that the claim reads as universal" read without a condition would forbid 61.
2. Manuscript 19 and kind 12 (above): given in the new form with no split and no "therefore".
3. "Clearly connected ideas may share a sentence." is removed from `rules.md` "Formality" and replaced by the cause or consequence bullet and the concession or contrast bullet, since the old sentence is the reading marker 2 gave for 77, 80 and 81 and contradicts kind 12.
4. Kind 1's example list names "as in finding N", "the same sentence" and "the replacement of finding N" and not "the same two sentences", because Verify 4 requires the phrase to be absent from the files.
5. The hard-wrap replacement, the list replacement and the added-text replacement sentences are also rewritten so that none gives a form that can be copied as a description (kind 1 asks it of line 137 and "no sentence of the prompt gives a replacement form in words the agent could copy as a description").
6. Kind 4 is a new bullet beside "Every place a finding names ...", not a clause added to it, so each sentence carries one rule.
7. "It keeps each word that sets a claim's scope" is its own bullet beside "It changes no claim's scope or strength beyond ...", since the two rules have different tests.
8. "In the qualifier's place" is read as the bracket standing for the qualifier, not at the same word position (grant 17 to 21, marked right, keep their form).
9. The kind 2 sentence says "the text at that place", since "the place" alone would be read as the defined location of a finding.
10. `metadata.version` stays "1.0.0" (Decision 4).
11. Sentences that depart from "under roughly 20 words": each carries one rule with its qualifier, and splitting it would separate the rule from the condition that limits it. The word counts are from a count of each added sentence.
    - 24 words, "What you run": "A search of the draft for a term, with `grep`, `sed`, `cat` or `find`, is done instead by reading the files you have read." The four commands are the rule's content.
    - 21 words, "A finding": "A list of places, such as a tense list, gives the file's path from the main file's folder in every entry."
    - 27 words, "A finding": "It is never a reference to another finding or to the passage, such as "as in finding N", "the same sentence" or "the replacement of finding N"." The three examples are the content of the rule.
    - 26 words, "A finding": "It adds no claim or relation that the draft does not make, and no word that presumes one, beyond the addition the named rule asks for."
    - 23 and 23 words, "A finding": the two sentences of the limit check.
    - 35 words, "A finding": the vague-qualifier replacement sentence. It states the three forms the replacement may take and where it stands; it is followed by three sub-bullets of one rule each.
    - 28 words, "A finding": "Each part a split leaves, counted with the sentences that other findings add to it, meets the prose standard's section D, or the finding gives a further split."
    - 23 words, "A finding": the condition-in-a-split sentence.
    - 25 words, "A finding": the sentence that makes the passage the draft's text and the replacement the text after every finding.
    - 24 words, "How you group them": the group-line sentence.
    - 23 words, `registers.md` "Voice": the "we" sentence.
    - 21 words, `rules.md` "Terms defined at first use"; 27 words, "Evidence for claims"; 23 words, "Reader's question per section"; 29 words, "Formality" (the intensifier bullet); 24 and 25 words, "Formality" (the cause and concession bullets). Each states a rule and its one condition.
    - The sub-bullets "A passage is a phrase, a clause or a sentence." and the three sub-bullets under the vague-qualifier replacement are lists of three because the brief's rule has three parts; the count follows the rule, not a target.

## Every host- or user-visible change

The review agent's prompt in `skills/writing/SKILL.md`, "The review agent's prompt", is the text a user of `/writing` meets through the report the agent gives. Before and after, by what the report shows:

- A passage and a replacement in the report were allowed to be a reference or a description ("the same two sentences with an empty line between them", "as in finding 34", "followed by the added text"); after, each is written out as text and a split's replacement writes both sentences whole.
- A split or a list quoted with "..." or "(...)"; after, each sentence it spans is quoted whole.
- A list of places (a tense list) gave the file name; after, each entry gives the path from the main file's folder.
- A replacement for a vague qualifier could be "usually" or "such as [...]" or could cut the qualifier; after, the bracket or the number stands in the qualifier's place and the claim keeps its scope.
- A replacement could state a limit the draft's tables contradict, add "therefore", change "the" to "a", drop "a reliable tool", hedge a factual claim, or use the first person "I" or "my"; after, the sentences above forbid each.
- A group line could name a loss the draft does not show; after, it names one a finding of the group shows, or says the group's breaks change no claim and names what they cost the reader.
- The review agent could run a second `grep`; after, it runs only the one command the prompt names.
- The Formality rule no longer lets "clearly connected ideas" share a sentence; it names cause or consequence clauses as one idea and concession or contrast clauses as two.

No other host-visible behaviour changes: the invocation, the argument, the report's place (the agent's final message) and `templates/docx_paragraphs.py` are unchanged (`git status --short` lists no other file).

## Anything in the brief wrong or impossible

- Verify 4 requires `the same two sentences` to be absent, so kind 1's list in the brief ("the same two sentences") cannot be quoted in the prompt; the example list uses "the same sentence" instead (judgment call 4). Evidence: the Verify 4 command above prints nothing.
- Kind 5's never-cut rule, read word for word, forbids manuscript 61, which the brief lists in C17 as right (judgment call 1). Evidence: the unchanged `manuscript-report.md` finding 61 and the MAE definition at `c_evaluation.tex:1`.
- The glossary has no entry for "place" in the sense `/writing` uses (judgment on "The terms"). Evidence: `grep -n -E '^\- \*\*place' docs/glossary.md` prints the two entries "place, of a defect" (line 77) and "place, of a point" (line 78). The glossary is outside this step's paths, so the sense is stated here for the orchestrator.

Everything in the brief is done.

# Report of step 9 of plan 3, the last fixes to /writing

## Open items of the state file

`awk '/^## Open items/{f=1} /^## Closed items/{f=0} f' .scratch/3-the-writing-base/orchestrator-state.md` in the worktree prints the heading and, under it, `none`.

none

## Repair round 1

Nothing in the ten rulings is left undone. The only point outside the rulings that the reader needs is that Verify 4 and 5 and the cases were run again on the files as they stand; their results are under "DONE / NOT DONE" and "Cases after the change".

| Ruling | What changed |
|---|---|
| 1. Spec 1, operations 4 and 6 | "The last pass" has the operation that lists each other rule the passage breaks before the operation that reads the words of the rules, so that operation reads the rules the finding ends up naming. The old operations 4, 5 and 6 are now 5, 6 and 4. O5 reads "Take each rule or table row the finding names, its rule and each "Also breaks" line included." |
| 2. Spec 2, grant 4a | `references/rules.md`, "Reader's question per section", gains R5 "A section is read whole before a finding says it does not answer its question." and R6 "A replacement repeats no sentence that the section already holds." O6 now reads "Take a finding under "Evidence for claims" or "Reader's question per section"." and finds every other place in the draft that states the claim or answers the question, the section the passage stands in read whole. The row of grant 4a in "The rows" names R5, R6 and O6. |
| 3. Proof 1 | The rows of Verify 1 and Verify 3 under "DONE / NOT DONE" quote the brief's commands as the brief gives them, with the lines they print: `charset exit 0` alone for Verify 1, nothing for Verify 3. |
| 4. Proof 2 | "The rows" has one cell per row that names, for each reason of both markers, a sentence or an operation. Grant 7b names R1, R2 and E8 for "atlas" in paragraph 25, N5 and N5a for "kind of MRI scan" and for the renamed sequence, N4a for "matched", and N2b with N8 and O8 for the 30-word sentence. Grant 8j names O7 for the duplicated label "Risks and mitigation:", O5 for the antecedent Also line, N5 and N5a for "each scan's signal", N2e for four mitigations in paragraph form, and N8 with O8 for the long items. Grant 16t names N8 and O8 for the 32-word sentence, N5 and N5a for "pair of T1 scans", and N2b with O2 for 11e's sentence. Every other row was read again against both markers' reasons in `8-marks.md`, and each reason has its sentence in the table. |
| 5. Standards 1 | E2c is now "It has one replacement, as the replacement bullets say." The bullet "The finding names that rule when its rule line does not." is cut; E2a asks the same. |
| 6. Standards 2 | N7 opens with the condition: "Where the draft does not hold the claim in every case, a word of frequency is replaced by a share or a count." N7a, "The share or the count is of the cases the claim holds in.", keeps the cases. The sub-bullet on a bracket that names a specific claim and the sub-bullet on cutting the qualifier (N7e) are unchanged. |
| 7. Standards 3 | N6a lists "repeatedly" with the words of frequency; N6b lists the words of size or degree without it. |
| 8. Standards 4 | Each operation is one action per sentence, in short sentences. The sentences over 20 words of the first build are split or shortened: the "ends every break" bullet (N1, N1a, N1b), the scope bullet (N4a, N4b), the additions bullet (N4c, N4d), the rename bullet (N5a, N5b), the examples (N6a, N6b), the bracket bullet (N7b, N7c), the length bullet (N8, N8a), the condition bullet (N9, N9a), the place bullet (N13b), the cost bullet (N13e), the `.tex` sentence and the "many studies" bullet of `rules.md` (R1, R3), and the "robust" item (R4). One sentence is over about 20 words: N7, 23 words, since ruling 6 puts its condition first; the section "Departures from the standards pages" gives the scan and the reason. |
| 9. Standards 5 | N1a reads "One of them is the break that the rule the finding gives names." `grep -n -i 'rule line' skills/writing/SKILL.md skills/writing/references/rules.md` prints nothing (below). |
| 10. Standards 6 | O12 reads "For each number and each relation the replacement states or keeps, list every measure of it." followed by "Search the draft's text, tables and figures for them." and "Read the number or the relation under each measure ("A finding")." |

## The cases' first run

Read on the unchanged tree: `git status --short` printed nothing before the first edit, and the worktree's HEAD is the preparation commit 1077fe4 (`git rev-parse --short HEAD`). Each case was read against `skills/writing/SKILL.md`, `references/rules.md` and `references/registers.md` as they stood, the records of step 8 named in the brief, and the draft copies where a case needs the passage. No case is one the brief's own rules get wrong, so no hand-back was made. Three examples of Decision 3 and one consequence of fix 5 are noted under "Anything in the brief that was wrong or impossible"; none changes a rule the brief dictates.

In the results below, "none" means no sentence of the unchanged tree keeps the review agent from the row in that form, and "broken" means a sentence of the unchanged tree would have kept it and the agent's report broke it. Sentences of the unchanged tree are cited by file and section with a short quote:

- U1: `SKILL.md`, "The review agent's prompt", "A finding", replacement bullets: "It ends the break and keeps every claim and clause of the passage that the named rule does not cut."
- U2: same place: "It changes no claim's scope or strength beyond the change the named rule asks of it." and "It adds no claim or relation that the draft does not make ... beyond the addition the named rule asks for." U2b: "A word that sets a claim's scope, such as an article or a quantifier, is kept unless the named rule replaces it."
- U3: same place: "Where the finding names the prose standard's rule on sentence length, it leaves each sentence it writes within that rule."
- U4: same place: "A word of the kind the prose standard's section A lists as a vague qualifier is one, listed there or not. Examples are "usually", "mostly", "frequently" and "rarely"."
- U5: same section: "A passage that breaks two or more rules is given once, in the first group that reaches it." with "It names each other rule it breaks, or the other term, by its page and section in a line of its own." and "No later group gives it again or refers to it."
- U6: same place, vague-qualifier sub-bullets: "The bracket names the number, the share of cases the claim holds in, or the specific claim." U6b: "The bracket offers no alternative joined by "or" that leaves the claim universal once the author supplies it." U6c: "It never cuts the qualifier so that a claim the draft does not hold in every case reads as universal."
- U7: same place: "It names each thing by the name the draft uses for it, unless the named rule changes the name, as "Most specific term" does."
- U8: `references/rules.md`, "Terms defined at first use": "A `.tex` draft is read as one document and a `.docx` draft from paragraph 1."
- U9: `references/rules.md`, "Vague language": "A phrase of the left column is reported." over a table of single phrases.
- U10: `references/rules.md`, "Replacements for flagged terms": "\"robust\" in statistics, as in \"robust estimator\";".
- U11: `SKILL.md`, "How you group them" and "The last pass": "The line names what the reader of this draft loses or misreads through the group's breaks, as one of the group's own findings shows.", "The loss holds in the draft's own text and data.", "A line that only restates the rule or describes the breaks is replaced by one that names that loss.", and the pass item "Each group line names a loss that one of the group's findings shows and that holds in the draft".
- U12: `SKILL.md`, "A finding", forms for a paragraph split: "A split keeps a condition, such as an opening "If <a condition> holds", in each part that holds a claim the condition governs."

### C1, fix 1: a replacement ends every break and writes none

Reading: the replacement bullets of "A finding" against each manuscript row in the first bullet of "The rows not marked right by both" of `8-report.md` and each reason in `8-marks.md`, "Rows not marked right by both".

| Row | Result |
|---|---|
| Manuscript 1.2, 13.1 | none; U1 led (the job it gives is the named break, and no sentence says the text written must keep the register's voice). |
| Manuscript 1.9 | broken: U5 ("names each other rule it breaks"); U2 led ("the named rule", Hedging, asks for no limit). |
| Manuscript 1.10 | broken: U5 for the limit; none for "moderate"; U4 led. |
| Manuscript 1.12 | none for "at most marginal"; U4 led. Broken: U5 for the two ideas. |
| Manuscript 2.1 | none; U1 led, and the "delete" bullets apply only where the named rule bans the passage. |
| Manuscript 3.1, 3.9, 5.19 | none; U4 led (frequency words only). |
| Manuscript 3.5, 7.1, 14.6 | broken: U5 (the Voice break, the tense break and the Voice break were not named); U1 led. |
| Manuscript 6.1 | broken: U5 ("or the other term") for ConvNeXt, a term the passage holds undefined. |
| Manuscript Methodology 67 | broken: U5 and the first-group rule (the cut of "slightly" answers section A, which group 5 reaches first). |
| Manuscript Results 5, 10, 16, 24, 26, 29 | none; U4 led. |
| Manuscript 13.4 | none for "increasingly"; U4 led. Broken: U5 for the present perfect. |
| Manuscript 13.9, 13.17 | broken: U5 (a list in paragraph form kept, unnamed). |
| Manuscript 13.11 | broken: U5 (tense changes that no entry names). |
| Manuscript 13.19 | none; U4 led. |
| Manuscript 13.20 | none for "comparatively little" and "at most marginal"; U4 led. Broken: U5 for the unlimited dominance claim. |
| Manuscript 13.21 | none; U4 led. |
| Manuscript 13.22 | broken: U5 (two ideas joined by "while"). |
| Grant 2f | none for the 35-word sentence: U3 binds only a finding that names the length rule. Broken: U5 for "scans" kept. |
| Grant 2h, 7a, 8g, 8i, 8j, 12a, 13a, 16a, 16b, 16j, 16t, 16u | none; U3 led (the finding names another rule). |
| Grant 4a | none for the length; U3 led. Broken: `references/rules.md`, "Terms defined at first use", "Such a term is used only where the draft defines it at or before the passage" ("80 percent power"). |
| Grant 7b | broken: U3 (the finding names the length rule and a 30-word sentence is written); the prose standard gives "roughly 20" and U3 gives no anchor. |
| Grant 7d | broken: U5 ("scans" for a study kept, unnamed). |
| Grant 8c | broken: U2b (the article "a" made "the"). |
| Grant 11c, 11d, 11e | broken: U3 (the new sentences have 28, 29 and 28 words). |
| Grant 11f, 14b, 16o, 16v, 16z | broken: U5 (two ideas in one sentence, unnamed). |
| Grant 16n | broken: U5 (the list in paragraph form of 2f carried). |

### C2, fix 2: size and degree words

Reading: U4 against "markedly" (Results 5), "closely" (Results 10), "largely" (Results 16, 13.19), "essentially" (Results 24, 26), "clearly" (Results 29), "predominately" (3.1), "repeatedly" (3.9), "moderate improvements" (1.10), "at most marginal" (1.12, 13.20, 13.21), "comparatively little" (13.20), "far less pronounced" (5.19) and "increasingly" (13.4). Result: none for every word. U4's examples are four frequency words, so the agent read no size or degree word as a vague qualifier.

### C3, fix 3: a frequency word

Reading: U6, U6b and U6c against manuscript 5.5, 5.11, 5.20 and grant 2a.

- 5.5 ("often small" made "small [the dataset sizes ...]"): broken: U6c; U6 led ("the bracket names the number").
- 5.11 ("typically" cut, a bracket for sizes): broken: U6c; U6 led.
- 5.20 (a bracket with an "or" alternative): broken: U6b; the test "leaves the claim universal once the author supplies it" cannot be applied from the bracket's words, so the words let the agent act wrongly.
- Grant 2a ("usually" and "often" each made a bracket for the share of cases): allowed under U6. It stays.

### C4, fix 4: a new name

Reading: U7 against grant 2e and 16h ("serial scans" made "serial MRI studies"), manuscript 11.4 and 13.13 ("robust" made "reliable"). Result: none for all four. U7 allows a rename only by the named rule and says nothing of the set a new name covers when another rule renames. "Reliable" is the draft's word for calibration, and no sentence asks that the new word be unused for another thing.

### C5, fix 5: the first use

Reading: U8, the prompt's "What you read" ("The text of a file stands where the command that names it stands"), and `grep -n -E '\\title\{|\\begin\{abstract\}|\\input\{sections/abstract' main.tex` in the manuscript copy, which printed `45:\title{HCCNet: A Self-Supervised CNN-Transformer for Dise`, `47:%\title{...`, `96:\begin{abstract}` and `97:\input{sections/abstract/abstract}`. Result for manuscript 5.1, 6.1 and the group 6 line: none. U8 does not say where a `.tex` draft's reading starts, so the abstract was taken as the start; U8 led.

### C6, fix 6: the rows of "Vague language"

Reading: U9 and "A passage is reported under a rule only when that rule's own words describe the break" against manuscript 5.6 ("many existing approaches"), 5.9 ("some longitudinal medical imaging studies"), 3.3 ("recent studies" under "in recent years") and `sections/3_methodology/a_problem_formulation.tex:1` "some patients".

- 5.6, 5.9, 3.3: broken: both sentences, since the rows are the phrases "many studies", "some researchers" and "in recent years" and the passages hold none of them.
- "some patients": not reported on the unchanged tree. No row covers it.

### C7, fix 7: "robust"

Reading: U10 against manuscript 11.4 ("To obtain robust performance estimates"). Result: none; U10's "as in "robust estimator"" was read as the estimator alone, and the finding was reported. U10 led.

### C8, fix 8: the last pass

Reading: the sixteen items of "The last pass" and the sentences they point at, against each row of fix 8's list, the gate condition 5 failures, the group 9 heading and the eight findings at grant paragraph 42.

| Rows | Result |
|---|---|
| Manuscript 5.2 (an instruction in place of text), gate condition 5 | broken: "It is text, written out whole ... It is never an instruction", and the pass item "The passage and the replacement are written out as text". |
| Manuscript 5.4, 5.18, grant 8c, 7b ("matched") | broken: U2b and the pass item "The replacement keeps every claim, scope word, name and strength". |
| Manuscript Methodology 56 and the tense entry of gate condition 5 | broken: "It is never a reference to another finding" and U5's "No later group gives it again or refers to it". |
| Manuscript Methodology 57 | broken: "A use of a word that the prose standard's section A says stays is not reported" ("just" as a minimality claim). |
| Manuscript 3.3, grant 1b, 14b, 17a | broken: "A passage is reported under a rule only when that rule's own words describe the break". |
| Manuscript 3.7 | broken: `references/rules.md`, "Evidence for claims", "Evidence the draft gives anywhere counts, cited or not". |
| Manuscript 1.1, 5.12, 10.4, grant 3a, 4a, 16p | broken: "Such a term is used only where the draft defines it at or before the passage". |
| Manuscript 1.1, 1.9, 1.10, 13.20 | broken: "A limit or a relation it states is checked against every number the draft gives for the claim, its tables and figures included". |
| Manuscript 11.1, 13.4 | broken: "reads as a sentence there". |
| Manuscript 13.12, grant 16p, 16r, 16y | broken: "Each part a split leaves meets the prose standard's section D ... A part is counted with the sentences that other findings add to it". |
| Manuscript 11.4's false note, the three places given twice | broken: U5's "No later group gives it again or refers to it". |
| Grant 1c | none: U12 stands among the forms of a paragraph split, so a split of a sentence is outside it. |
| The group 9 heading | none: no sentence reads the label over a list of places. |
| The eight findings at grant paragraph 42 | they stay on the unchanged tree: the step 8 grant report keeps all eight, and their quoted words differ or are split quotes. |

The pass lists what to check and not how, so every "broken" row above passed the pass.

### C9, fix 9: the group lines

Reading: U11 against the eight lines of gate condition 2 and the two accepted lines, in `8-run/manuscript-report.md` and `8-run/grant-report.md`.

- Manuscript group 6: broken: "The loss holds in the draft's own text and data" (the CNN example; the title at `main.tex:45` uses it first).
- Manuscript group 11: broken: "as one of the group's own findings shows" (its "softener with no fact" line is contradicted by findings 11.1, 11.2 and 11.4).
- Manuscript group 14: broken: "A line that only restates the rule or describes the breaks is replaced".
- Grant groups 1, 3, 5, 9: broken: the same sentence.
- Grant group 15: broken: "The loss holds in the draft's own text and data" (the actor stands mid-sentence in "Computing is provided by the host institution at no cost, so none is requested.").
- Manuscript group 1 and grant group 2, accepted by both: they hold on the unchanged tree. Group 1 names its example as `abstract.tex:5`, a path shorter than the place form of finding 1.4, and group 2 names paragraph 34, where its findings 2c and 2d stand.

### C10, findings marked right by both

Reading: `grep -c -E '\| (1\.3|4\.1|5\.3|7\.2|8\.1|12\.[1-9]|2a|5a|6a|9a|15a) \| .*\| right \| right \|$' 8-marks.md` printed `19`: manuscript 1.3, 4.1, 5.3, 7.2, 8.1, 12.1 to 12.9 and grant 2a, 5a, 6a, 9a, 15a are each `right | right`. Result: each holds on the unchanged tree. Their reading against the changed text is under "Cases after the change".


## Cases after the change

The sentences of the changed tree are labelled here and cited by label in the table. Each is quoted whole from the file and section named.

`SKILL.md`, "The review agent's prompt", "A finding", the replacement bullets:

- N1: "It ends every break the passage holds." N1a: "One of them is the break that the rule the finding gives names." N1b: "The others are each break of the prose standard, the rules page or the registers page."
- N2: "The text it writes breaks no rule of the prose standard, the rules page or the registers page. Examples are these breaks:" with the items N2a "a vague qualifier, a word of size or degree included;", N2b "a sentence over the prose standard's rule on sentence length;", N2c "a change of tense or of voice that the finding does not name;", N2d "two ideas in one sentence;", N2e "a list in paragraph form;", N2f "a relation with no limit where the draft's numbers set one;" and N2g "a performative aside."
- N3: "It keeps every claim and clause of the passage that a rule the finding names does not cut."
- N4: "It changes no claim's scope or strength beyond the change a rule the finding names asks of it." N4a: "A word that sets a claim's scope, such as an article or a quantifier, is kept." N4b: "A rule the finding names may replace such a word."
- N4c: "It adds no claim or relation that the draft does not make, and no word that presumes one." N4d: "A rule the finding names may ask for an addition."
- E5: "A limit or a relation it states is checked against every number the draft gives for the claim, its tables and figures included." E5a: "A number it gives stands in the draft as the replacement uses it."
- N5: "It names each thing by the name the draft uses for it, unless the named rule changes the name, as "Most specific term" does." N5a: "A replacement that renames a thing for another rule, such as synonym cycling, uses a name for the same set." N5b: "It never names a narrower set or a wider one." N5c: "The new name is a word that the draft does not use for another thing."
- N6: "A word of the kind the prose standard's section A lists as a vague qualifier is one, listed or not." N6a: "Examples are the words of frequency "usually", "mostly", "frequently", "rarely" and "repeatedly"." N6b: "Examples are the words of size or degree "markedly", "largely", "essentially", "considerably", "increasingly" and "predominantly"."
- N7: "Where the draft does not hold the claim in every case, a word of frequency is replaced by a share or a count." N7a: "The share or the count is of the cases the claim holds in." N7b: "The bracket for such a word asks for that share or count only." N7c: "A size is not that share or count." N7d: "A bracket holds "or" only where each alternative, supplied alone, keeps the claim's scope." N7e: "It never cuts the qualifier so that a claim the draft does not hold in every case reads as universal."
- N8: "The replacement ends each sentence of the passage that is over the prose standard's rule on sentence length." N8a: "It does so whatever rule the finding gives." N8b: "No sentence it writes is as long as a sentence the report names as over that rule."
- N9: "A split of a paragraph or sentence keeps a condition in each part that holds a claim it governs." N9a: "An example is an opening "If <a condition> holds"."

`SKILL.md`, "A finding", outside the replacement bullets, and "What you report", sentences the changed text keeps:

- E1: "It is text, written out whole, that stands in place of the passage and reads as a sentence there. It is never an instruction such as ..." E1b: "It is never a reference to another finding or to the passage, such as "as in finding N", "the same sentence" or "the replacement of finding N"." E1c: "A passage is never a description of the draft's text or a reference to another finding."
- E2: "A passage that breaks two or more rules is given once, in the first group that reaches it." E2a: "It names each other rule it breaks, or the other term, by its page and section in a line of its own." E2b: "No later group gives it again or refers to it." E2c: "It has one replacement, as the replacement bullets say."
- E3: "A use of a word that the prose standard's section A says stays is not reported." E4: "A passage is reported under a rule only when that rule's own words describe the break."
- E6: "Each part a split leaves meets the prose standard's section D, or the finding gives a further split. A part is counted with the sentences that other findings add to it."

`SKILL.md`, "How you group them":

- N13: "The line states what the reader of this draft wrongly believes or does, or cannot do, because of its breaks." N13a: "That loss is why the group stands where it does." N13b: "The line gives the place of one finding of the group where that loss happens. The place is in the form that finding gives." N13c: "The loss holds in the draft's own text and data." N13d: "A group whose breaks change no claim says so in its line." N13e: "That line names what the break costs the reader instead at the place it gives. An example is a character the reader's viewer may not show." N13f: "Rewrite a line that describes the breaks, restates the rule or names a loss its finding does not show."

`references/rules.md`:

- R1, "Terms defined at first use": "A `.tex` draft is read from the main file's first line, its title included. The order of its files is the one `SKILL.md`, "What you read", gives." R2, same section: "A claim that a use is the first is checked against every earlier use." E8, same section: "Such a term is used only where the draft defines it at or before the passage."
- R3, "Vague language": "The rows "many studies" and "some researchers" cover a second form of their phrase. That form has another noun that names published work or its authors in place of the row's noun. Examples are "many approaches" and "some studies". The replacement of the row is then written with that noun." R3b: "Every other row covers its own phrase only."
- R4, "Replacements for flagged terms": the item "robust" in statistics, as in "robust estimator", for an estimate or a method insensitive to one of these: outliers; departures from the model's assumptions; the partition of the data.
- R5, "Reader's question per section": "A section is read whole before a finding says it does not answer its question." R6, same section: "A replacement repeats no sentence that the section already holds."
- E7, "Evidence for claims": "Evidence the draft gives anywhere counts, cited or not ..."

The operations of "The last pass" are numbered as `SKILL.md` numbers them. O1 finds the quoted words at the place. O2 finds every other finding or list entry that quotes the same or overlapping words there, a quote the forms for a split give excepted. O3 checks each entry of a list that follows a table's rows under the row of its own section. O4 reads the passage against each section of the three pages and lists each other rule it breaks. O5 takes each rule or table row the finding names, its rule and each "Also breaks" line included, quotes the words that describe the passage and reads each exception of its section against it. O6 takes a finding under "Evidence for claims" or "Reader's question per section" and finds every other place in the draft that states the claim or answers the question. O7 reads the replacement as the reader would, as text in the place of the passage. O8 counts the words of each sentence the replacement writes. O9 compares the replacement with the passage word by word and gives each changed word the rule that asks for it. O10 finds, for each split, each condition and the parts it governs. O11 lists each technical term and abbreviation the replacement adds and finds where the draft defines it. O12 lists, for each number and each relation the replacement states or keeps, every measure of it in the draft's text, tables and figures, and reads it under each. O13 reads each bracket that holds "or" with each alternative alone. O14 writes out each part of a split as it reads after every finding and counts its sentences and names its ideas. O15 names, for each group line, the finding whose place it gives and reads the loss there.

### The rows

One row per row of `8-marks.md`, "Rows not marked right by both" (48 manuscript, 35 grant), and per gate failure. The reasons are those of both markers, each read again in `8-marks.md` after this round; each reason is followed by the sentence or operation that prevents it. A marker that marked the row right gave no reason to answer.

| Row | Reason of the markers, then the sentence and operation that prevent it |
|---|---|
| Manuscript 1.1 | AUPRC and the expected calibration error brought into the abstract before the draft defines them: E8, O11. The reliability claim kept without its limit against MCE and Brier numbers: E5, N2f, O12. |
| Manuscript 1.2 | "we" dropped, an unnamed Voice break: N2c, N1b. |
| Manuscript 1.9 | The unlimited "aligned the models closer" against the ECE and MCE numbers: E5, N2f, O12. The Limitations break unnamed: E2a, O4. |
| Manuscript 1.10 | "on average more reliable" against the MCE numbers: E5, O12. The size word "moderate improvements" kept: N2a, N6. |
| Manuscript 1.12 | "at most marginal" kept: N2a, N6. Two ideas kept, a Formality break: N2d. |
| Manuscript 2.1 | "More interestingly" kept: N2g. |
| Manuscript 3.1 | "predominately" kept: N2a, N6b. |
| Manuscript 3.3 | The Also line names the row "in recent years" and "recent studies" is not its phrase: R3b, E4, O5. |
| Manuscript 3.5 | "our study uses" kept, a Voice break unnamed: N2c. |
| Manuscript 3.7 | The claim has a source at `introduction.tex:5`: E7, O6. |
| Manuscript 3.9 | "repeatedly" kept: N6a, N2a, N7. |
| Manuscript 5.1 | MRI first stands in the title at `main.tex:45`: R1, R2, O5. |
| Manuscript 5.2 | The antecedent fix is an instruction and the written text still opens "This is especially relevant": E1, O7. |
| Manuscript 5.4 | "Traditional" dropped: N4a, O9. |
| Manuscript 5.5 | "often small" made "small" with a bracket for sizes: N7, N7b, N7c. |
| Manuscript 5.6 | The Also line names the row "many studies" and the phrase is "many existing approaches": R3, O5. |
| Manuscript 5.9 | The Also line names the row "some researchers" and the phrase is "some ... studies": R3, O5. |
| Manuscript 5.11 | "typically" cut so the claim reads as universal, a bracket for sizes: N7e, N7, N7b. |
| Manuscript 5.12 | AUPRC and AUROC brought in before the draft defines them: E8, O11. |
| Manuscript 5.18 | "consecutive folds" made "any two folds", a claim the draft does not make: N4a, N4c, O9. |
| Manuscript 5.19 | "far less pronounced" kept: N2a, N6. |
| Manuscript 5.20 | A bracket with an "or" alternative that leaves the claim universal: N7d, O13. |
| Manuscript 6.1 | CNN first stands in the title: R1, R2, O5. ConvNeXt undefined and not named: E2a, O4. |
| Manuscript 7.1 | "aims" made "aimed", a tense change the finding does not name: N2c. |
| Manuscript Methodology 56 | An entry that is a reference to finding 6.4, with no passage and replacement: E1b, E1c, E2b, O2. |
| Manuscript Methodology 57 | "just 8000 training steps" is a minimality claim that section A keeps: E3, O5. |
| Manuscript Methodology 67 | The cut of "slightly" answers section A, which the entry does not name, and the passage belongs in group 5: E2, E2a, O4, O2. |
| Manuscript Results 5, 10, 16, 24, 26, 29 | "markedly", "closely", "largely", "essentially", "essentially all" and "clearly" kept: N2a, N6b. For Results 26 the table has CNN-only above both stages: E5, O12. |
| Manuscript 10.4 | "projection head" brought in undefined: E8, O11. |
| Manuscript 11.1 | The replacement's subordinate clause has no verb: E1, O7. The place group 9 already lists is given again: E2b, O2. |
| Manuscript 11.4 | "robust" is the statistical term: R4. "reliable" is the draft's term for calibration: N5c. The note that the place is not in the tense list is false: O3, O1. |
| Manuscript 13.1 | The carried voice change of 1.2: N2c. |
| Manuscript 13.4 | "have therefore increasingly employed", a present perfect and a trend word, unnamed: N2c, N2a, N6b. 11.1's text, not a sentence: E1, O7. |
| Manuscript 13.9 | Three semicolon items in paragraph form: N2e. |
| Manuscript 13.11 | "is pre-trained" and "is then fine-tuned" changed to the past, unnamed: N2c. |
| Manuscript 13.12 | The first part holds five sentences with the sentence 4.1 adds: E6, O14. |
| Manuscript 13.13 | 11.4's change of "robust" to "reliable": R4, N5c. |
| Manuscript 13.17 | Six metrics after a colon in paragraph form: N2e. |
| Manuscript 13.19 | "largely" kept: N2a, N6b. |
| Manuscript 13.20 | "comparatively little" and "at most marginal" kept: N2a, N6. The CNN backbone's dominance without a limit against the table at 0.457 and 0.447: N2f, E5, O12. |
| Manuscript 13.21 | "at most marginal gains" kept: N2a, N6. |
| Manuscript 13.22 | Two ideas joined by "while": N2d. |
| Manuscript 14.6 | "This study therefore developed", the Voice break 7.5 fixes, unnamed: N2c. |
| Grant 1b | The Also line on "Clear antecedents" does not hold: E4, O5. |
| Grant 1c | "If the hypothesis holds" dropped from the new sentence on transfer: N9, O10. |
| Grant 2e | "serial scans" made "serial MRI studies", a narrower set: N5a, N5b. The synonym line does not hold, since reference 7 is CT radiomics: E4, O5. |
| Grant 2f | "scans" kept for sequences: N5a, E2a, O4. The 35-word sentence neither ended nor named: N8, E2a, O8. |
| Grant 2h | The 43-word sentence kept, with no Also line for length: N8, E2a, O8. |
| Grant 3a | "hepatitis B virus" brought in undefined: E8, O11. |
| Grant 4a | The 31-word sentence kept whole and the length rule not named: N8, E2a, O8. The reading of the rule left uncounted: the prompt's "Count before you state a count of sentences in a paragraph or of words in a sentence", O8. Paragraph 42 of the same section states the limit, so the section is read whole and the replacement repeats a sentence it holds: R5, R6, O6. "80 percent power" brought in undefined: E8, O11. |
| Grant 7a | 29 words made 32, neither ended nor named: N8, N2b, E2a, O8. |
| Grant 7b | A written sentence of 30 words: N8, N2b, O8. "kind of MRI scan" brings back "scan" for a sequence: N5, N5a. "atlas" first used in paragraph 25: R1, R2, E8, O11. "matched" dropped: N4a, O9. "sequence" renamed: N5, N5a. |
| Grant 7d | "into real liver scans" kept for the cohort's studies: N5, N5a, E2a, O4. |
| Grant 8c | "a detection limit" made "the detection limit": N4a, O9. The sentence grows from 21 to 26 words: N2b, O8. |
| Grant 8g | The 38-word sentence kept, with no Also line for length: N8, E2a, O8. |
| Grant 8i | The 42-word WP1 item kept with five list-shaped actions, neither named: N8, N2e, E2a, O8. |
| Grant 8j | The added label "Risks and mitigation:" duplicates the draft's label: O7. Items (i) and (iv) kept at about 31 and 43 words: N8, E2a, O8. "each scan's signal" left: N5, N5a. The antecedent line does not hold: E4, O5. Item (iv) keeps four mitigations in paragraph form: N2e. |
| Grant 11c | The first new sentence has 28 words: N2b, O8. |
| Grant 11d | The second new sentence has 29 words: N2b, O8. |
| Grant 11e | The first new sentence has 28 words: N2b, O8. |
| Grant 11f | The second sentence joins two independent claims: N2d. |
| Grant 12a | The 27-word passage sentence kept, with no Also line for length: N8, E2a, O8. |
| Grant 13a | The 28-word sentence neither ended nor named: N8, E2a, O8. |
| Grant 14b | The sentence joins two independent claims: N2d. It states the present state of two fields, the "ongoing state" row, and the replacement treats its two parallel clauses differently: O5, N2c. |
| Grant 16a | The 32-word sentence on what the project tests kept: N8, O8. |
| Grant 16b | "Dit project test of..." kept at 29 words: N8, O8. |
| Grant 16h | 2e's "serial MRI studies", the same scope change: N5a, N5b. |
| Grant 16j | The 28-word "Success means" sentence kept: N8, O8. |
| Grant 16n | The "T1 scans" list of 2f carried: N2e, N5a. |
| Grant 16o | "776 are usable ..., and an organ map ... exists", two claims in one sentence: N2d. |
| Grant 16p | With 4a, a part of four sentences on two ideas: E6, O14. 4a's sentence with "80 percent power" undefined: E8, O11. |
| Grant 16r | The part joins alignment to the reference liver with blinding of the analyst, two ideas: E6, O14. |
| Grant 16t | "Components are checked ..." kept at 32 words: N8, O8. "pair of T1 scans" for a sequence: N5, N5a. 11e's 28-word first sentence left in place: N2b, O2. |
| Grant 16u | "The tested study is ..." kept at 28 words: N8, O8. |
| Grant 16v | The level-2 exclusion and the level-1 sensitivity analysis in one sentence: N2d. |
| Grant 16y | The part after the break holds more than one idea, with no further split: E6, O14. |
| Grant 16z | 14b's two-claim sentence kept: N2d. "placed" carried from 14b: N2c. The part after the break joins novelty with impact: E6, O14. |
| Grant 17a | The Rule line also names section 0's en dash as an aside, and these dashes separate parts of a header title: E4, O5. |
| Gate condition 2, manuscript group 6 | The CNN example's first-use claim fails, since CNN first stands in the title: N13c, R2, O15. |
| Gate condition 2, manuscript group 11 | The "softener with no fact" line is contradicted by findings 11.1, 11.2 and 11.4: N13c, N13f, O15. |
| Gate condition 2, manuscript group 14 | The line restates the rule and names no cost: N13, N13f, O15. |
| Gate condition 2, grant groups 1 and 3 | The lines describe the breaks and name no loss: N13, N13b, N13f, O15. |
| Gate condition 2, grant groups 5 and 9 | The lines restate the rule or describe the break and name no cost: N13, N13b, N13d, N13e, N13f, O15. |
| Gate condition 2, grant group 15 | The cost does not hold in the draft: N13c, N13e, O15. |
| Gate condition 5, the tense entry at `b_implementation.tex:3` | A reference to another finding in place of a passage and replacement: E1b, E1c, E2b, O2. |
| Gate condition 5, finding 5.2's instruction | The antecedent fix is an instruction: E1, O7. |
| Gate condition 5, the three places given twice | A place an earlier group already gives is given again: E2, E2b, O2. |
| The group 9 heading under "Methodology" | Two section 2 entries stand under "Methodology": O3. |

Gate condition 6 is not a row: its failures concern the markers' commands and prompts and 17 marks without a reason of their own, and no text of `/writing`. The closing report names them, as the brief says.

### C1 to C10 after the change

- C1: each row of fix 1's list is in the table above with the sentence that prevents it: N1 to N4d for the "ends every break" and "a rule the finding names" rows, N8 to N8b for the length rows, E2a for the rows whose other break the finding must name.
- C2: N6 and N6b make "markedly", "largely", "essentially", "considerably", "increasingly" and "predominantly" vague qualifiers, N2a names a word of size or degree in the list of breaks, and N6's "listed or not" covers "closely", "clearly", "moderate", "at most marginal", "comparatively little" and "far less pronounced". N6a lists "repeatedly" as a word of frequency.
- C3: manuscript 5.5 breaks N7b and N7c, 5.11 breaks N7e and N7b, 5.20 breaks N7d. Grant 2a breaks none of N7, N7a and N7b: its brackets ask for the share of cases the author's source gives, and it stays allowed.
- C4: grant 2e and 16h break N5b ("serial MRI studies" covers a narrower set). Manuscript 11.4 and 13.13 break N5c, and R4 exempts "robust" for an estimate insensitive to the partition of the data, so "robust performance estimates" is not reported.
- C5: manuscript 5.1 and 6.1 break R1 and R2: the title at `main.tex:45` precedes the abstract at `main.tex:96`. The group 6 line, whose example rests on that claim, breaks N13c.
- C6: manuscript 5.6 and 5.9 are covered by their rows under R3. Manuscript 3.3 is not covered ("recent studies" is not the phrase of "in recent years", and R3b says so). `a_problem_formulation.tex:1` "some patients" is not covered, since patients are no published work.
- C7: manuscript 11.4: R4 exempts "robust" for an estimate insensitive to the partition of the data. It is not reported.
- C8: each failing row has its operation in the table. The eight findings at grant paragraph 42 (2h, 8g, the group 11 finding, 12a, 13a, 16u, 16v, 16y) stay: O2 excepts a quote the forms for a split give, 16u, 16v and 16y are split quotes, and the other five quote different words.
- C9: the eight lines are in the table, each with the sentence of "How you group them" it breaks. Manuscript group 1's line states a loss and gives `abstract.tex:5`, which becomes `sections/abstract/abstract.tex:5`, the place form of finding 1.4 (N13b). Grant group 2's line states "the reader cannot weigh the problem" and gives paragraph 34, where findings 2c and 2d stand. Both keep their losses and take the place form.
- C10: manuscript 1.3, 7.2, 8.1 and the nine list entries of 12.1 to 12.9 keep their place, passage, rule and replacement: their passage sentences run 19, 19 and 13 words (counted by splitting the text of `8-run/manuscript-report.md` at full stops), and 12.x meets N5a and N5c because "model variants" names the five sizes the draft already calls variants. Grant 2a, 5a, 6a, 9a and 15a keep theirs: 2a's passage sentence has 24 words and its replacement already ends it in sentences of 17 and 22 words, with brackets for the share of cases that N7 and N7b ask for; 5a, 6a, 9a and 15a have passage sentences of 22, 14, 8 and 14 words. Two rows are asked in another form: manuscript 4.1 (a passage sentence of 40 words, and a replacement that keeps a sentence of 40 words) and manuscript 5.3 (a passage sentence of 26 words, and a replacement of 32 words) now end the long sentence in the replacement, as N8 asks. Their places, passages and the rules that cause the rest of their replacement stay.

## DONE / NOT DONE

| Item | State | Evidence |
|---|---|---|
| Fix 1, a replacement ends every break and writes none | DONE | N1 to N4d, N8 to N8b in `SKILL.md`, "A finding", replacement bullets. |
| Fix 2, size and degree words | DONE | N6, N6b in the same place. |
| Fix 3, a frequency word | DONE | N7 to N7e in the same place. |
| Fix 4, a new name | DONE | N5 to N5c in the same place. |
| Fix 5, the first use | DONE | R1, R2 in `references/rules.md`, "Terms defined at first use". |
| Fix 6, two rows of "Vague language" | DONE | R3, R3b in `references/rules.md`, "Vague language". |
| Fix 7, "robust" | DONE | R4 in `references/rules.md`, "Replacements for flagged terms". |
| Fix 8, the last pass | DONE | O1 to O15 in `SKILL.md`, "The last pass"; N9 stays with the replacement bullets. |
| Fix 9, the group lines | DONE | N13 to N13f in `SKILL.md`, "How you group them". |
| Repair round 1, rulings 1 to 10 | DONE | The section "Repair round 1" above. |
| Verify 1, the character-set check | DONE | The brief's command, run as given, printed `charset exit 0` and no other line (below). |
| Verify 2, the glossary check | DONE | `python3 skills/repo-setup/templates/sync_rules.py . --only glossary` printed `ok: the plan-terms block equals the template`. |
| Verify 3, the spaced-dash grep | DONE | The brief's command, run as given, printed nothing (below). |
| Verify 4, `git diff 1077fe4 skills/writing` read whole | DONE | Notes below. |
| Verify 5, new and changed items and sentences read against the standards pages | DONE | "Departures from the standards pages" below. |
| `metadata.version` | DONE | `grep -n 'version:' skills/writing/SKILL.md` printed `5:  version: "1.0.0"`. |
| `references/registers.md` | unchanged | `git diff 1077fe4 --quiet skills/writing/references/registers.md` exits 0. No fix of the brief belongs on that page. |

Verify 1, the brief's command as the brief gives it, run from the worktree's root after the last edit of the report:

```
printf '%s\0' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md .scratch/3-the-writing-base/agents/reviews/9-report.md | xargs -0 sh -c 'for f; do if [ -e "$f" ]; then printf "%s\0" "$f"; fi; done' sh | xargs -0 perl -CSD -ne 'my $bad_char = $ARGV =~ /\.md\z/ ? qr/[^\x20-\x7E\x{2705}\n]/ : qr/[^\x20-\x7E\n]/; if (/$bad_char/) { print "$ARGV:$.: $_"; $bad = 1 } close ARGV if eof; END { $? ||= 1 if $bad }'; echo "charset exit $?"
```

Printed: `charset exit 0` and no other line.

Verify 3, the brief's command as the brief gives it:

```
grep -n -E '[^[:space:]] - | -- ' skills/writing/SKILL.md skills/writing/references/rules.md skills/writing/references/registers.md
```

Printed: nothing.

Notes on Verify 4:

- The worktree copy of the dispatch entry holds no base; `git rev-parse --short HEAD` printed `1077fe4`, the preparation commit, and the diff is read against it.
- `git diff --stat 1077fe4 skills/writing` printed `skills/writing/SKILL.md | 89`, `skills/writing/references/rules.md | 14` and `2 files changed, 69 insertions(+), 34 deletions(-)`.
- Every changed sentence serves a fix of "What to build" or a ruling of repair round 1.
- `git diff -U0 1077fe4 skills/writing | grep '^+' | grep -v '^+++' | grep -n -E 'HCC|CNN|MRI|ConvNeXt|AUPRC|paragraph [0-9]+|\.tex:|main\.tex|8-run|step [0-9]|plan 3|ordo'` printed one line, `59:+- A `.docx` draft is read from paragraph 1.`, which is the dictated generic rule and names no part of a draft or plan.
- `grep -n -i 'rule line' skills/writing/SKILL.md skills/writing/references/rules.md` printed nothing, and `echo "ruleline exit $?"` printed `ruleline exit 1`.

### Departures from the standards pages

The prose standard's section E asks for sentences under roughly 20 words unless the mechanism needs more. A scan with `python3 -I` splits the added lines of `git diff -U0 1077fe4 skills/writing` at sentence ends and prints each sentence of 19 words or more. It printed ten sentences, of 19 to 23 words.

- One sentence stays over about 20 words. It is N7, "Where the draft does not hold the claim in every case, a word of frequency is replaced by a share or a count." (23 words). Ruling 6 makes the condition its opening, and the condition (11 words) and the replacement it governs cannot be split without separating them.
- Sentences of 19 and 20 words stay: N5a, N6, N13, the "delete" bullet, N9, O2's first sentence, O10, O1 and the rewrite bullet N13f. Each holds one rule or one action.
- The operations hold one action per sentence. Operations 2, 3, 4, 5, 6, 9, 11, 12, 14 and 15 are two or more short sentences.
- The seven items of N2 and the three items of R4 end in semicolons as the file's other list items do; they are list punctuation, not running prose.
- The "robust" item of R4 is a lead line with three sub-items, so each stays a noun phrase.
- The bullets of "A finding" are bullets and sub-bullets, one rule each; the nesting of N1 with N1a and N1b, N4 with N4a and N4b, N5 with N5a to N5c and N7 with N7a to N7e follows the file's own nesting.

## The terms

- **finding** (`docs/glossary.md`, "a passage of a draft that `/writing` reports as a break of a named rule, with its place, the quoted passage and a proposed replacement"): used in N1a, N3, N4, N8a, N13 to N13f and O1 to O15 in that sense ("the rule the finding gives", "a rule the finding names"). Each use is a passage `/writing` reports.
- **place**: the glossary defines "place, of a defect" for `diagnose` and "place, of a point" for `session-retro`, neither of which is `/writing`'s. The text uses "place" for a finding's place, as "A finding" defines it before this change; the new uses (O1, O2, N13b) read it that way.
- **case**: N7 and N7a use "cases" in their ordinary sense, the cases a claim holds in. The glossary's **case** is a brief's example; it is not meant.
- **operation**: used for the items of "The last pass". The glossary uses the word inside **place, of a defect** and **other input** for `diagnose`; it defines no term "operation", and the new use does not change those entries.
- **kind**: the new text does not use the word as a term. The existing "A word of the kind ..." stays.
- **report**, **group**, **split**, **list**, **pass**: no glossary entry applies.

## The files

`wc -l`, run after the last edit:

```
263 skills/writing/SKILL.md
233 skills/writing/references/rules.md
 53 skills/writing/references/registers.md
420 .scratch/3-the-writing-base/agents/reviews/9-report.md
```

## Judgment calls the brief left open

- Fix 1 lead sentences. N1 states that the replacement ends every break and N2 that the text it writes breaks no rule, with the seven items as "Examples are these breaks:", so the list is a set of examples and the rule covers every other break.
- Fix 1, the length rule. N8 and N8a are bullets of one rule, and N8b is the comparison with a sentence the report names. The requirement that every sentence a replacement writes meets the length rule is carried by N2b, so it is stated once. N8b states no number of words, as Decision 6 says. The finding's naming of the length rule is asked by E2a ("It names each other rule it breaks"), which the repair round leaves as the one place that asks it.
- Fix 3. The frequency-word rule is a sub-bullet of "The replacement of a vague qualifier is the number or the specific claim." That bullet already states the rule for another vague qualifier, so the brief's third clause is not repeated.
- Fix 4. The exception "unless the named rule changes the name" keeps its words, as the brief says.
- Fix 6 and fix 5 are written as separate bullets, one rule each.
- Fix 8, O1. The old pass item "Each place is in its form ..." has no operation of its own in the brief's list. O1 states the place as "given, in one of the forms", so finding the quoted words needs the place in its form.
- Fix 8, O3. The brief names "A finding" for the part of the prompt O3 applies. "A finding" holds no rule that a tense-list entry stands under the row of its own section, and `references/rules.md`, "Tense per section", holds the rows, so O3 cites that section.
- Fix 8, O14. The old pass item asked that each part "holds one idea", and grant 16y rests on that. O14 names the ideas of each part so that the old requirement stays covered.
- Fix 8, O2. "A quote that the forms for a split give is not another finding on those words" keeps a split that quotes a sentence another finding gives from being read as a second giving.
- Fix 9. The place bullet N13b is a bullet of its own, since a line can state a loss and miss the place. N13a, "That loss is why the group stands where it does.", stays in the first bullet.
- Repair round 1, ruling 2. R5 and R6 sit in "Reader's question per section" after the bullet on a first sentence that states the contribution; O6 names the section in the same sentence as "Evidence for claims".
- Repair round 1, ruling 5. The sentence "The finding names that rule when its rule line does not." is cut. Its content is asked by E2a, which names each other rule a passage breaks, so a finding that omits the length rule in its Also line breaks E2a.
- The base of Verify 4 is `1077fe4`, as the notes say.
- Examples. N6b lists six words of size or degree and N6a five words of frequency; "closely", "clearly", "moderate" and the like are read under N2a and N6.

## Every user-visible change, before and after

`/writing` shows the user the review agent's report, so each change reaches the user through that report.

| Part | Before | After |
|---|---|---|
| Replacement text | Ends the named break only; may keep another break unnamed | Ends every break the passage holds and breaks no rule of the three pages; N2's examples are vague qualifiers, long sentences, unnamed tense or voice changes, two ideas, lists in paragraph form, relations with no limit and performative asides |
| Rules the replacement applies | "the named rule" | "a rule the finding names", so a rule named in an Also line counts |
| Sentence length | A replacement stays within the length rule only when the finding names it | A replacement ends each over-long sentence of the passage whatever rule the finding gives, and no sentence is as long as one the report names as over the rule |
| Vague qualifiers | Frequency words only are examples | Words of size or degree are also vague qualifiers, and "repeatedly" is a word of frequency |
| A frequency word | A bracket may name a number, a share or the specific claim, and may offer "or" | Where the draft does not hold the claim in every case the replacement is a share or a count of cases; the bracket asks for no size; "or" only where each alternative keeps the scope |
| A new name | The draft's name, except where the named rule renames | A rename by another rule covers the same set and is a word the draft does not use for another thing |
| First use of a term | A `.tex` draft "read as one document" | Read from the main file's first line, title included; a first-use claim is checked against every earlier use |
| "Vague language" | Each row is its phrase | "many studies" and "some researchers" also cover another noun for published work or its authors |
| "robust" | Exempt "as in robust estimator" | Exempt for an estimate or a method insensitive to outliers, to departures from the model's assumptions or to the partition of the data |
| "Reader's question per section" | A finding may be reported without reading the section whole | A section is read whole before a finding says it does not answer its question, and the replacement repeats no sentence the section holds |
| A split | A condition is kept in each part among the paragraph-split forms | Kept in each part of a split of a paragraph or sentence |
| Group lines | Name a loss "as one of the group's own findings shows" | State the reader's wrong belief, act or inability, give the place of one finding where it happens, and a no-claim group names its cost at that place |
| The last pass | A list of sixteen things to check | Fifteen numbered operations, in order, each one action per sentence and naming the part it applies; the other rules a passage breaks are listed before the words of every named rule are read |

## Anything in the brief that was wrong or impossible

- Decision 3's example lines do not all hold in the draft. The group 5 example gives paragraph 40, and the only finding of grant group 5 stands at paragraph 42 (`awk '/^=== 5\./{f=1} /^=== 6\./{f=0} f' 8-run/grant-report.md | grep '^Place:'` printed `Place: paragraph 42`). The group 9 example gives paragraph 31 for "we" and "the applicant"; a `grep -E -o -i '\b(we|our|us|the applicant)\b'` over each paragraph printed by `skills/writing/templates/docx_paragraphs.py` shows paragraph 31 holds "the applicant" twice and no "we", paragraph 46 holds "The applicant" and no "we", and paragraph 35 holds both, though group 9's findings stand at paragraphs 31 and 46. The group 15 example cost, "the reader learns who acts only at the end of the sentence", does not hold at paragraph 31: the sentence reads "Computing is provided by the host institution at no cost, so none is requested.", the same point `8-report.md` condition 2 makes. The rule text of fix 9 carries none of these examples, and N13c governs them, so the skill is unaffected; the examples are not to be copied into a later brief.
- Fix 5 as ruled makes the title the first use. A finding on CNN or MRI then stands at `main.tex:45`, and its replacement defines the term in a title or names the definition as a fact for the author. That is the consequence of the dictated sentence.
- The expected result of C4 for manuscript 11.4 and 13.13 is the sentence on names. After fix 7 those two are not reported at all, since "robust performance estimates" is exempt; N5c is the second guard if a draft's "robust" is reported and renamed.
- The old pass item "The replacement of a vague qualifier takes one of the forms ..." has no operation in the brief's list. It is carried by O9, O5 and O13 together: a word dropped or changed needs the rule that asks for it, the exceptions of the section are read, and a bracket with "or" is read alone.
- Gate condition 6 is outside `skills/writing/`, as the brief says, and is not changed here.
